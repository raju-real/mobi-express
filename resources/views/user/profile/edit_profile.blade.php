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
                        <p>Set Your Personal Details</p>
                        <hr>
                        <form action="{{ route('user.update-profile') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                          <div class="form-group row">
                            <label for="image" class="col-sm-2 col-form-label">Profile Picture</label>
                            <div class="col-sm-10">
                              <input name="image" type="file" class="form-control" id="image">
                            </div>
                          </div>
                          <br>
                          <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                              <input name="name" type="text" class="form-control" id="name" value="{{ $user->name }}">
                            </div>
                          </div>
                          <br>
                          <div class="form-group row">
                            <label for="email" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                              <input name="email" type="email" class="form-control" id="email" value="{{ $user->email }}">
                            </div>
                          </div>
                          <br>
                          <button type="submit" class="btn btn-info">Update Profile</button>
                        </form>
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