<?php

use App\Models\Event;

require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

// Get event 4
$event = Event::findOrFail(4);
$categories = \App\Models\Kategori::all();
$tickets = $event->tikets;

// Check routes
echo "Event: " . $event->judul . "\n\n";
echo "Tickets:\n";
foreach ($tickets as $ticket) {
    $updateRoute = route('admin.tickets.update', $ticket->id);
    echo "ID: {$ticket->id}, Tipe: {$ticket->tipe}, Stok: {$ticket->stok}\n";
    echo "  Update Route: $updateRoute\n";
}

echo "\n\nRendering route in Blade template context:\n";
echo "route('admin.tickets.update', '__ID__').replace('__ID__', 5):\n";
$baseRoute = route('admin.tickets.update', '__ID__');
echo "  $baseRoute\n";
$result = str_replace('__ID__', '5', $baseRoute);
echo "  After replace: $result\n";
