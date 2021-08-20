@extends('user.layouts.app')
@section('title','About Us')
@push('css')

@endpush

@section('content')
<!--about bg area start-->
<div class="about_bg_area">
    <div class="container">
        <!--about section area -->
        <section class="about_section mb-60">
            <div class="row align-items-center">
                <div class="col-12">
                    @php
                        $about = App\Model\AboutUs::first();
                    @endphp
                    <figure>
                        <div class="about_thumb">
                            @if($about->image == null)
                            <img src="{{ asset('assets/user/img/about/about1.jpg') }}" alt="">
                            @else
                                <img src="{{ asset($about->image) }}">
                            @endif
                        </div>
                        <figcaption class="about_content">
                            {!! $about->about_us !!}
                        </figcaption>
                    </figure>
                </div>
            </div>
        </section>
        <!--about section end-->

    </div>
</div>
<!--about bg area end-->
@endsection

@push('js')

@endpush