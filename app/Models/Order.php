<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $casts = [
        'total_harga' => 'decimal:2',
        'order_date' => 'datetime',
    ];

    protected $fillable = [
        'user_id',
        'event_id',
        'payment_type_id', // <--- WAJIB ADA (Agar pilihan user tersimpan)
        'order_date',
        'total_harga',
        'status',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function event()
    {
        return $this->belongsTo(Event::class, 'event_id');
    }

    // Relasi ke Payment Type
    public function paymentType()
    {
        return $this->belongsTo(PaymentType::class);
    }

    public function detailOrders()
    {
        return $this->hasMany(DetailOrder::class);
    }
}