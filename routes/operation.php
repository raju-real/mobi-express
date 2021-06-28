<?php 
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

Route::get('add_product',function(){
	//return 'ok';
	// $products = DB::connection('e-grocery')->table('products')
	// ->whereNotNull("image")
	// ->get();
	//return $products;
	$products = DB::table('products')->where('discount_price',null)->update([
		'discount_price'=>0]);
	return 'ok';
	foreach($products as $product){
		$slug = $product->name;
		DB::table('products')->where('id',$product->id)->update([
			'slug'=>strtolower(Str::slug($slug)).'-'.Str::random(40)
		]);
	}
	return 'ok';
	foreach($products as $product){
		$p=DB::table('products')->insertGetId([
			'category_id' => 1,
			'brand_id' => 2,
			'product_code' => $product->product_code,
			'name'=> $product->product_name,
			'slug'=>$product->slug.Str::random(40),
			'product_details'=>$product->product_details,
			'unit_price'=>$product->unit_price,
			'unit_weight'=>$product->unit_weight,
			'discount_price'=>$product->discount_price,
			'percentage'=>$product->percentage,
			'quantity'=>$product->quantity,
		]);

		DB::table('product_images')->insert([
			'product_id'=>$p,
			'image'=>'images/product/'.$product->image
		]);
		DB::table('product_units')->insert([
			'product_id'=>$p,
			'unit_id'=>2
		]);
		DB::table('product_sizes')->insert([
			'product_id'=>$p,
			'size_id'=>2
		]);
		DB::table('product_colors')->insert([
			'product_id'=>$p,
			'color_id'=>2
		]);
	}
	return 'done';
});