<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterdataKategoriUMKM extends Model
{
    use HasFactory;

    public $table = 'masterdata_kategori_umkm';

    protected $guarded = ['id'];

    public function users()
    {
        return $this->hasMany(User::class, 'kategori_umkm_id', 'id');
    }
}
