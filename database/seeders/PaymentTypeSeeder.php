<?php

namespace Database\Seeders;

use App\Models\PaymentType;
use Illuminate\Database\Seeder;

class PaymentTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        PaymentType::create(['name' => 'Kartu Kredit']);
        PaymentType::create(['name' => 'Transfer Bank']);
        PaymentType::create(['name' => 'E-Wallet']);
        PaymentType::create(['name' => 'Cicilan']);
    }
}
