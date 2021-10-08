<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->integer('category_id');
            $table->integer('brand_id')->nullable();
            $table->integer('subcategory_id')->nullable();
            $table->string('product_code')->unique()->nullable();
            $table->string('name');
            $table->string('slug')->unique();
            $table->text('product_details');
            $table->text('short_description')->nullable();
            $table->text('specification')->nullable();
            $table->double('unit_price', 8, 2);
            $table->double('discount_price', 8, 2)->default(0);
            $table->integer('stock_status')->default(1);
            $table->integer('quantity')->nullable()->default('0');
            $table->string('special_note')->nullable();
            $table->string('video_link')->nullable();
            $table->integer('view_count')->default(0);
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
        Schema::dropIfExists('products');
    }
}
