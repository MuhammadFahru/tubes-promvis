<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WalletInvestor extends Model
{
    use HasFactory;

    public $table = 'wallet_investor';

    protected $guarded = ['id'];

    public function users()
    {
        return $this->belongsTo(User::class, 'users_id', 'id');
    }

    public function walletInvestorHistory()
    {
        return $this->hasMany(WalletInvestorHistory::class, 'wallet_investor_id', 'id');
    }
}
