<?php

require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

$event = \App\Models\Event::find(4);
$paymentTypes = \App\Models\PaymentType::all();

// Try to render the view
try {
    $html = view('events.show', compact('event', 'paymentTypes'))->render();
    echo "✓ View renders successfully\n";
    echo "Output length: " . strlen($html) . " characters\n";
    
    // Check for common errors in HTML
    if (strpos($html, 'ERROR') !== false) {
        echo "✗ Found ERROR in output\n";
    }
    
    if (strpos($html, 'Habis') !== false) {
        echo "✓ Found 'Habis' text in output\n";
    } else {
        echo "✗ 'Habis' text not found in output\n";
    }
    
    if (strpos($html, 'premium') !== false) {
        echo "✓ Found 'premium' ticket type\n";
    }
    
    if (strpos($html, 'reguler') !== false) {
        echo "✓ Found 'reguler' ticket type\n";
    }
    
} catch (\Exception $e) {
    echo "✗ View render failed: " . $e->getMessage() . "\n";
    echo "Trace:\n";
    echo $e->getTraceAsString() . "\n";
}
