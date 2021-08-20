@php
    $brands = DB::table('brands')->get();
@endphp
<ul>
    <li><a href="{{ route('home') }}">Home</a></li>
    <li>
        <a href="#">Shop By Brand<i class="fa fa-angle-down"></i></a>
        <ul class="sub_menu pages">
            @foreach($brands as $brand)
                <li>
                    <a href="{{ route('brand-products',$brand->slug) }}">
                        {{ $brand->name }}
                    </a>
                </li>
            @endforeach
        </ul>
    </li>
    {{-- <li><a href="{{ route('about-us') }}">About Us</a></li>
    <li><a href="{{ route('contact-us') }}"> Contact Us</a></li> --}}
    <li><a href="{{ route('terms-condition') }}">Terms & Condition</a></li>
    <li><a href="{{ route('voucher-products') }}">Voucher Products</a></li>
</ul>
