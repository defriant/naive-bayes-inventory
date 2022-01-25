<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    use HasFactory;

    protected $table = 'produk';
    protected $fillable = [
        'id',
        'nama'
    ];

    public $incrementing = false;

    public function stok()
    {
        return $this->hasMany(Stok::class, 'id_produk', 'id');
    }
}
