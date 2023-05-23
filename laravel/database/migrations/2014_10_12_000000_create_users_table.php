<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('email')->unique();
            $table->string('password');
            $table->string('salt_pw');
            $table->string('pin')->nullable();
            $table->string('salt_pin')->nullable();
            $table->string('roles');
            $table->boolean('is_active')->default(1);
            $table->string('nik', 16)->nullable();
            $table->string('nama');
            $table->string('no_handphone')->nullable();
            $table->string('foto')->nullable();
            $table->bigInteger('bank_id')->nullable();
            $table->string('no_rekening')->nullable();
            $table->bigInteger('kategori_umkm_id')->nullable();
            $table->bigInteger('sektor_umkm_id')->nullable();
            $table->string('company_name')->nullable();
            $table->string('company_email')->nullable();
            $table->text('company_address')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
