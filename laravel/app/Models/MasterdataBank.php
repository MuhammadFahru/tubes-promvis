<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterdataBank extends Model
{
    use HasFactory;

    public $table = 'masterdata_bank';

    protected $guarded = ['id'];

    public function users()
    {
        return $this->hasMany(User::class, 'bank_id', 'id');
    }
}
