<div class="categories_menu_toggle">
    @php
        $categories = App\Model\Category::with('subcategories')->latest()->get();
    @endphp
    <ul>
        @foreach($categories as $category)
        <li class="menu_item_children">
            <a href="{{ route('category-products',$category->slug) }}">
                {{ $category->name }} 
                <i class="fa fa-angle-right"></i>
            </a>
            @if(sizeof($category->subcategories) > 0)
            <ul class="categories_mega_menu">
                    <ul class="categorie_sub_menu">
                        @foreach($category->subcategories as $subcategory)
                        <li>
                            <a href="{{ route('subcategory-products',$subcategory->slug) }}">
                                {{ $subcategory->name }}
                            </a>
                        </li>
                        <hr>
                        @endforeach
                    </ul>
            </ul>
            @endif
        </li>
        @endforeach
    </ul>
</div>