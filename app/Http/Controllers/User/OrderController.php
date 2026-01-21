<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreOrderRequest;
use App\Models\DetailOrder;
use App\Models\Order;
use App\Models\Tiket;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        // Load paymentType agar namanya muncul di list order
        $orders = Order::where('user_id', $user->id)
                       ->with(['event', 'paymentType']) 
                       ->orderBy('created_at', 'desc')
                       ->get();
        
        return view('user.orders.index', compact('orders'));
    }

    public function show(Order $order)
    {
        if ($order->user_id !== Auth::id()) {
            abort(403, 'Unauthorized action.');
        }

        $order->load(['detailOrders.tiket', 'event', 'paymentType']);
        
        return view('user.orders.show', compact('order'));
    }

    public function store(StoreOrderRequest $request)
    {
        $validated = $request->validated();
        $user = Auth::user();

        try {
            DB::beginTransaction();

            $totalHarga = 0;
            $orderItems = [];
            $stokErrors = [];

            // 2. Cek Stok & Hitung Total
            foreach ($request->tickets as $ticketData) {
                $tiket = Tiket::lockForUpdate()->findOrFail($ticketData['id']);

                if ($tiket->stok < $ticketData['quantity']) {
                    $stokErrors[] = "Tiket '{$tiket->tipe}' stok tidak cukup. Tersedia: {$tiket->stok}, Diminta: {$ticketData['quantity']}";
                    continue;
                }

                $subtotal = $tiket->harga * $ticketData['quantity'];
                $totalHarga += $subtotal;

                $orderItems[] = [
                    'tiket' => $tiket,
                    'quantity' => $ticketData['quantity'],
                    'subtotal' => $subtotal
                ];
            }

            // Jika ada error stok, throw exception dengan daftar lengkap
            if (!empty($stokErrors)) {
                throw new \Exception("Stok tiket tidak cukup:\n" . implode("\n", $stokErrors));
            }

            // Validasi ada item yang bisa di-order
            if (empty($orderItems)) {
                throw new \Exception("Tidak ada tiket yang dapat dipesan");
            }

            // 3. Simpan Order
            $order = Order::create([
                'user_id' => $user->id,
                'event_id' => $request->event_id,
                'payment_type_id' => $request->payment_type_id,
                'order_date' => Carbon::now(),
                'total_harga' => $totalHarga,
            ]);

            // 4. Simpan Detail & Kurangi Stok
            foreach ($orderItems as $item) {
                DetailOrder::create([
                    'order_id' => $order->id,
                    'tiket_id' => $item['tiket']->id,
                    'jumlah' => $item['quantity'],
                    'subtotal_harga' => $item['subtotal'],
                ]);

                $item['tiket']->decrement('stok', $item['quantity']);
            }

            DB::commit();

            // Jika request AJAX, return JSON
            if ($request->expectsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Pesanan berhasil dibuat!',
                    'redirect' => route('orders.show', $order->id)
                ]);
            }

            return redirect()->route('orders.show', $order->id)->with('success', 'Pesanan berhasil dibuat!');

        } catch (\Exception $e) {
            DB::rollBack();
            
            if ($request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => $e->getMessage()
                ], 422);
            }
            
            return redirect()->back()->with('error', 'Transaksi Gagal: ' . $e->getMessage());
        }
    }
}