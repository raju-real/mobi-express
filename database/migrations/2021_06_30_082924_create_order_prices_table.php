<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderPricesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_prices', function (Blueprint $table) {
            $table->id();
            $table->string('session_id');
            $table->integer('user_id');
            $table->double('total_price',8,2);
            $table->double('discount_price',8,2)->default(0);
            $table->double('delivery_charge',8,2)->default(0);
            $table->double('order_price',8,2)->default(0);
            $table->string('coupon_code')->nullable();
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
        Schema::dropIfExists('order_prices');
    }
}
