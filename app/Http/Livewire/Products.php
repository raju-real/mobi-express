<?php

namespace App\Http\Livewire;

use App\Model\Product;
use Livewire\Component;

class Products extends Component
{
    public $categoryId=2;

    protected $listeners = [
        'findProducts'
    ];

    public function findProducts($categoryId)
    {
        $this->category_id = $categoryId;
    }
   
    public function render()
    {
        $products =Product::where('category_id',$this->categoryId)->take(2)->get();
        return view('livewire.products',['products'=>$products]);
    }
}
