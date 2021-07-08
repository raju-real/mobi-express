<?php

namespace App\Model;

use App\Model\ProductImage;
use App\Model\Promotion;
use App\Model\PromotionProduct;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $guarded = [];

    // Append Extra Filed To Return
    protected $appends = array('image');

    public function getImageAttribute()
    {
        $image = ProductImage::where('product_id',$this->id)
        ->whereNotNull('image')->first()->image;
        return $image;
        //return $this->SetAttributes['image'] == $image;
    }

    public static function getProducts(){
        $promotion = Promotion::where('status',1)->get();
        $data = Product::query();
        $promotion_products = PromotionProduct::whereIn('promotion_id',$promotion->pluck('id'));
        $data->whereNotIn('id',$promotion_products->pluck('product_id'))->get();
        $products = $data->get();
        return $products;

    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function subcategory()
    {
        return $this->belongsTo(SubCategory::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function images(){
        return $this->hasMany(ProductImage::class);
    }

    public function sizes(){
        return $this->belongsToMany(Size::class,'product_sizes')->withTimestamps();
    }

    public function units(){
        return $this->belongsToMany(Unit::class,'product_units')->withTimestamps();
    }

    public function colors(){
        return $this->belongsToMany(Color::class,'product_colors')->withTimestamps();
    }

    public static function getProductCode(){
        $latestCode = Product::latest('id')->whereNotNull('product_code')->first();
        $productCode = str_pad(1, 4, "0", STR_PAD_LEFT);
        if ($latestCode) {
            $lastCode = $latestCode->product_code;
            if ($lastCode != null) {
                $newCode = $lastCode + 1;
                $productCode = str_pad($newCode, 4, "0", STR_PAD_LEFT);;
            } else {
                $productCode = str_pad(1, 4, "0", STR_PAD_LEFT);
            }
        }
        if (Product::where('product_code', $productCode)->exists()) {
            Product::getProductCode();
        }
        return $productCode;
    }


}
