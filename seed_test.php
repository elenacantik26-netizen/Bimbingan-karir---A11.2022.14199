<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(\Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

// Test simple
echo "Starting seed test...\n";

$seeder = new \Database\Seeders\DatabaseSeeder();
try {
    $seeder->run();
    echo "\n✅ Seeding completed successfully!\n";
} catch (\Exception $e) {
    echo "\n❌ Error: " . $e->getMessage() . "\n";
    echo "Stack: " . $e->getTraceAsString() . "\n";
}
