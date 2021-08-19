@extends('user.layouts.app')
@section('title','Profile')

@push('css')
<style>
    .left{
        text-align: left;
    }
</style>
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
                        <li>User Profile</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!-- my account start  -->
<div class="account_page_bg">
    <div class="container">
        <section class="main_content_area">
            <div class="account_dashboard">
                <div class="row">
                    <div class="col-sm-12 col-md-3 col-lg-3">
                        <!-- Nav tabs -->
                        <div class="dashboard_tab_button">
                            @include('user.profile.user_menus')
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-9 col-lg-9">
                        <!-- Tab panes -->
                        <h3>Account Details</h3>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="text-align: left;">Image</th>
                                        <th style="text-align: left;">:</th>
                                        <th style="text-align: left;">
                                            <img src="{{ asset($user->image) }}" class="img-responsive" 
                                            style="border-radius: 50px;
                                            height: 100px;
                                            width: 100px;">
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="text-align: left;">Name</th>
                                        <th style="text-align: left;">:</th>
                                        <th style="text-align: left;">
                                            {{ $user->name }}
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="text-align: left;">Mobile</th>
                                        <th style="text-align: left;">:</th>
                                        <th style="text-align: left;">
                                            {{ $user->mobile }} 
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="text-align: left;">Email</th>
                                        <th style="text-align: left;">:</th>
                                        <th style="text-align: left;">
                                            {{ $user->email }}
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- my account end   -->
@endsection

@push('js')

@endpush