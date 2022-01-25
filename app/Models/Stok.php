<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stok extends Model
{
    use HasFactory;

    protected $table = 'stok';
    protected $fillable = [
        'periode',
        'id_produk',
        'nama',
        'stok',
        'terjual',
        'restock'
    ];
}
