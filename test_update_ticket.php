<?php

use Illuminate\Http\Request;
use App\Models\Tiket;

require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

// Simulate updating ticket 6 stok to 9999
$ticket = Tiket::findOrFail(6);

$data = [
    'tipe' => 'reguler',
    'harga' => 500000,
    'stok' => 9999,
];

try {
    $ticket->update($data);
    echo "✓ Update success! Stok now: " . $ticket->stok . "\n";
} catch (\Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "\n";
}
