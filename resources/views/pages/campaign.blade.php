@extends('user.layouts.app')
@section('title','Campaign')
@push('css')
@endpush

@section('content')
<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="{{ route('home') }}">home</a></li>
                        <li>campaign</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--Privacy Policy area start-->
    <div class="privacy_policy_bg">
        <div class="container">
            <div class="privacy_policy_main_area">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!--banner area start-->
							        <div class="container">
							            <div class="row">
							                @foreach($campaigns as $campaign)
							                <div class="col-lg-6 col-md-6 pb-10">
                                                <h4>
                                                    {{ $campaign->name }}
                                                    <span class="pull-right" style="color: #C40316;">
                                                        {{ $campaign->products->count() }} Products
                                                    </span>
                                                </h4>
							                    <a href="{{ route('campaign-products',$campaign->slug) }}"><img src="{{ $campaign->image }}" alt="" style="height: 300px;border-radius: 5px;padding-bottom: 40px;"></a>
							                </div>
							                @endforeach
							            </div>
							        </div>
							    <!--banner area end-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Privacy Policy area end-->
@endsection

@push('js')

@endpush