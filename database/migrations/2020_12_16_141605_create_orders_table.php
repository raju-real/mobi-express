<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->string('order_number')->unique();
            $table->string('invoice')->unique();
            $table->double('delivery_charge', 8, 2);
            $table->double('vat', 8, 2)->default(0);
            $table->double('total_price', 8, 2);
            $table->double('product_discount_price', 8, 2)->default(0);
            $table->string('order_status')->default('0');
            $table->integer('payment_method')->default(1);
            $table->string('voucher_code')->nullable();
            $table->string('voucher_mobile')->nullable();
            $table->double('voucher_amount', 8, 2)->default(0);
            $table->string('has_coupon')->default('no');
            $table->string('coupon_code')->nullable();
            $table->double('coupon_discount_amount', 8, 2)->nullable();
            $table->double('total_discount_amount',8,2)->default(0);
            $table->double('order_price',8,2);
            $table->double('paid_amount', 8, 2)->default(0);
            $table->double('due_amount', 8, 2)->default(0);
            $table->integer('division')->nullable();
            $table->integer('district')->nullable();
            $table->integer('upazila')->nullable();
            $table->string('postal_code');
            $table->text('address');
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
        Schema::dropIfExists('orders');
    }
}
