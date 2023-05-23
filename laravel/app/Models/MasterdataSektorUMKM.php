<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterdataSektorUMKM extends Model
{
    use HasFactory;

    public $table = 'masterdata_sektor_umkm';

    protected $guarded = ['id'];

    public function users()
    {
        return $this->hasMany(User::class, 'sektor_umkm_id', 'id');
    }
}
