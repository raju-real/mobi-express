@extends('user.layouts.app')
@section('title','Address Book')

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
                        <li>Address Book</li>
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
                        <div class="row">
                            <div class="col-md-6" style="border-right: 1px solid black;">
                                <p>Set Your Shipping Address</p>
                                <hr>
                                <form action="{{ route('user.update-address',['type'=>'shipping']) }}" method="POST">
                                    @csrf
                                    @method('PUT')
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" name="full_name" class="form-control" value="{{ $shipping->full_name ?? Auth::user()->name }}">
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Mobile</label>
                                        <input type="text" name="mobile" class="form-control" value="{{ $shipping->mobile ?? Auth::user()->mobile }}">
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Email(Optional)</label>
                                        <input type="text" name="email" class="form-control" id="s_email" value="{{ $shipping->email ?? Auth::user()->email }}">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mt-2">
                                                <label>District</label>
                                                {{-- <select name="district" class="form-control mt-2">
                                                    <option value="">District</option>
                                                    @foreach($districts as $district)
                                                        <option value="{{ $district->id }}">
                                                            {{ $district->name }}
                                                        </option>
                                                    @endforeach
                                                </select> --}}
                                                <input type="text" name="district" class="form-control" id="s_district" value="{{ $shipping->district ?? '' }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mt-2">
                                                <label>City/Town</label>
                                                <input type="text" name="city_town" class="form-control"
                                                value="{{ $shipping->city_town ?? '' }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mt-2">
                                                <label>Post Code</label>
                                                <input type="text" name="post_code" class="form-control"
                                                value="{{ $shipping->post_code ?? '' }}">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group mt-2">
                                                <label>Address</label>
                                                <textarea name="address" class="form-control">{{ $shipping->address ?? '' }}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3">
                                            <button type="submit" class="btn btn-success pull-right">
                                                Update
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6" style="border-right: 1px solid black;">
                                <p>Set Your Billing Address</p>
                                <hr>
                                <form action="{{ route('user.update-address',['type'=>'billing']) }}" method="POST">
                                    @csrf
                                    @method('PUT')
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" name="full_name" class="form-control" value="{{ $blling->full_name ?? Auth::user()->name }}">
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Mobile</label>
                                        <input type="text" name="mobile" class="form-control" value="{{ $blling->mobile ?? Auth::user()->mobile }}">
                                    </div>
                                    <div class="form-group mt-2">
                                        <label>Email(Optional)</label>
                                        <input type="text" name="email" class="form-control" id="s_email" value="{{ $blling->email ?? Auth::user()->email }}">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mt-2">
                                                <label>District</label>
                                                {{-- <select name="district" class="form-control mt-2">
                                                    <option value="">District</option>
                                                    @foreach($districts as $district)
                                                        <option value="{{ $district->id }}">
                                                            {{ $district->name }}
                                                        </option>
                                                    @endforeach
                                                </select> --}}
                                                <input type="text" name="district" class="form-control" id="s_district" value="{{ $blling->district ?? '' }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mt-2">
                                                <label>City/Town</label>
                                                <input type="text" name="city_town" class="form-control"
                                                value="{{ $blling->city_town ?? '' }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mt-2">
                                                <label>Post Code</label>
                                                <input type="text" name="post_code" class="form-control"
                                                value="{{ $blling->post_code ?? '' }}">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group mt-2">
                                                <label>Address</label>
                                                <textarea name="address" class="form-control">{{ $blling->address ?? '' }}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3">
                                            <button type="submit" class="btn btn-success pull-right">
                                                Update
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
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