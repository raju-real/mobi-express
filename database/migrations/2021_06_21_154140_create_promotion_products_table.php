<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePromotionProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('promotion_products', function (Blueprint $table) {
            $table->id();
            $table->integer('promotion_id');
            $table->integer('product_id');
            $table->string('discount_type');
            $table->string('percentage');
            $table->double('unit_price',8,2);
            $table->double('discount_price',8,2);
            $table->integer('status')->default(1);
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
        Schema::dropIfExists('promotion_products');
    }
}
