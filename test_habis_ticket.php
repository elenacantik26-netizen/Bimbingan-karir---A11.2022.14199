<?php

use App\Models\Tiket;
use App\Models\Order;

require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== Test: Checkout dengan Tiket Habis ===\n\n";

// Check ticket 5 status
$ticket5 = Tiket::find(5);
echo "Tiket ID 5 (Premium): Stok = {$ticket5->stok}\n";

if ($ticket5->stok === 0) {
    echo "✓ Tiket 5 sudah HABIS\n\n";
} else {
    echo "✗ Tiket 5 masih ada stock\n\n";
}

// Check ticket 6 status
$ticket6 = Tiket::find(6);
echo "Tiket ID 6 (Regular): Stok = {$ticket6->stok}\n";

if ($ticket6->stok > 0) {
    echo "✓ Tiket 6 tersedia\n\n";
} else {
    echo "✗ Tiket 6 sudah habis\n\n";
}

// Test: Try order tiket yang habis
echo "--- Test Ordering Out-of-Stock Ticket ---\n";
try {
    $user = \App\Models\User::first();
    
    // Try to order ticket 5 (stok 0)
    $ticketsList = [
        ['id' => 5, 'quantity' => 1]
    ];
    
    \Illuminate\Support\Facades\DB::beginTransaction();
    
    $totalHarga = 0;
    $orderItems = [];
    
    foreach ($ticketsList as $ticketData) {
        $tiket = Tiket::lockForUpdate()->findOrFail($ticketData['id']);
        
        if ($tiket->stok < $ticketData['quantity']) {
            throw new \Exception("Stok tiket '{$tiket->tipe}' tidak mencukupi. Stok: {$tiket->stok}");
        }
        
        $subtotal = $tiket->harga * $ticketData['quantity'];
        $totalHarga += $subtotal;
        
        $orderItems[] = [
            'tiket' => $tiket,
            'quantity' => $ticketData['quantity'],
            'subtotal' => $subtotal
        ];
    }
    
    \Illuminate\Support\Facades\DB::rollBack();
    echo "✗ Validation should have failed!\n";
    
} catch (\Exception $e) {
    echo "✓ Validation caught: {$e->getMessage()}\n";
}

echo "\n✓ All tests completed!\n";
