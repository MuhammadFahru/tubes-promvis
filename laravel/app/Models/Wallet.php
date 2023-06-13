<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wallet extends Model
{
    use HasFactory;

    public $table = 'wallet';

    protected $guarded = ['id'];

    public function users()
    {
        return $this->belongsTo(User::class, 'users_id', 'id');
    }

    public function walletHistory()
    {
        return $this->hasMany(WalletHistory::class, 'wallet_id', 'id');
    }
}
