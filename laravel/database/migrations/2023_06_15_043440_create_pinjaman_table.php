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
        Schema::create('pinjaman', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('users_id')->nullable();
            $table->string('nama');
            $table->string('deskripsi');
            $table->string('alamat');
            $table->decimal('plafond', 10, 2)->default(0);
            $table->decimal('terkumpul', 10, 2)->default(0);
            $table->float('bagi_hasil', 10, 2)->default(0);
            $table->integer('tenor')->default(0);
            $table->date('deadline');
            $table->string('status');
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
        Schema::dropIfExists('pinjaman');
    }
};
