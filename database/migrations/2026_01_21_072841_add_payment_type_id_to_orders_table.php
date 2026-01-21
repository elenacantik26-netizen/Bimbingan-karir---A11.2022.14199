<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
            public function up(): void
        {
            Schema::table('orders', function (Blueprint $table) {
                // Menambahkan kolom foreign key (nullable dulu biar aman untuk data lama)
                $table->foreignId('payment_type_id')->nullable()->after('user_id')->constrained('payment_types')->nullOnDelete();
            });
        }

        public function down(): void
        {
            Schema::table('orders', function (Blueprint $table) {
                $table->dropForeign(['payment_type_id']);
                $table->dropColumn('payment_type_id');
            });
        }
};
