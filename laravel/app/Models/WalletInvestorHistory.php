<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WalletInvestorHistory extends Model
{
    use HasFactory;

    public $table = 'wallet_investor_history';

    protected $guarded = ['id'];

    public function walletInvestor()
    {
        return $this->belongsTo(WalletInvestor::class, 'wallet_investor_id', 'id');
    }
}
