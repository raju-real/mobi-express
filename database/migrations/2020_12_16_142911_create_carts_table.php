<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('carts', function (Blueprint $table) {
            $table->id();
            $table->string('session_id');
            $table->integer('user_id')->nullable();
            $table->integer('product_id');
            $table->double('unit_price',8,2);
            $table->double('order_price',8,2);
            $table->integer('quantity');
            $table->double('total_price', 8, 2);
            $table->integer('color_id',10)->nullable();
            $table->integer('size_id',10)->nullable();
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
        Schema::dropIfExists('carts');
    }
}
