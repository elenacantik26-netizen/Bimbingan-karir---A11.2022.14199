<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PaymentType;
use Illuminate\Http\Request;

class PaymentTypeController extends Controller
{
    public function index()
    {
        $paymentTypes = PaymentType::latest()->get();
        return view('admin.payment_types.index', compact('paymentTypes'));
    }

    public function create()
    {
        return view('admin.payment_types.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        PaymentType::create($request->all());

        // PERBAIKAN DI SINI: route pakai 'admin.'
        return redirect()->route('admin.payment-types.index')->with('success', 'Tipe pembayaran berhasil ditambahkan');
    }

    public function edit(PaymentType $paymentType)
    {
        return view('admin.payment_types.edit', compact('paymentType'));
    }

    public function update(Request $request, PaymentType $paymentType)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $paymentType->update($request->all());

        // PERBAIKAN DI SINI: route pakai 'admin.'
        return redirect()->route('admin.payment-types.index')->with('success', 'Tipe pembayaran berhasil diperbarui');
    }

    public function destroy(PaymentType $paymentType)
    {
        $paymentType->delete();

        // PERBAIKAN DI SINI: route pakai 'admin.'
        return redirect()->route('admin.payment-types.index')->with('success', 'Tipe pembayaran berhasil dihapus');
    }
}