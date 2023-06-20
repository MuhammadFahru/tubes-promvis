<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pinjaman extends Model
{
    use HasFactory;

    public $table = 'pinjaman';

    protected $guarded = ['id'];

    public function users()
    {
        return $this->belongsTo(User::class, 'users_id', 'id');
    }

    public function investasi()
    {
        return $this->hasMany(Investasi::class, 'pinjaman_id', 'id');
    }

    public function angsuran()
    {
        return $this->hasMany(Angsuran::class, 'pinjaman_id', 'id');
    }
}
