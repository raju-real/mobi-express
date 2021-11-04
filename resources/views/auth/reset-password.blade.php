@extends('user.layouts.app')
@section('title','Reset Password')
@push('css')
	<style>
        .error{
            border: 1px solid red !important;
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
                        <li>Reset Password</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!-- customer login start -->
<div class="login_page_bg">
    <div class="container">
        <div class="customer_login">
            <div class="row">
                <!--form area start-->
                <div class="col-lg-6 col-md-6 offset-md-3 offset-lg-3">
                    <div class="account_form register">
                        <h2>Reset Password</h2>
                        <div role="alert" id="alert" style="display: none;">
                            <strong id="alert-message"></strong> 
                        </div>
                        <div class="row">
                            <form action="{{ route('reset-password') }}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-md-9">
                                        <div id="mobile-div">
                                            <p>
                                                <label>Mobile
                                                    <span style="color: red;">*</span>
                                                </label>
                                                <input type="number" name="mobile" id="mobile">
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <button onclick="sendOtp()" type="button" class="btn btn-primary btn-block" style="margin-top: 30px;">Send Otp</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div id="otp-div">
                                            <p>
                                                <label>Type Otp
                                                    <span style="color: red;">*</span>
                                                </label>
                                                <input type="number" name="otp_code" id="otp_code">
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div id="otp-div">
                                            <p>
                                                <label>New Password
                                                    <span style="color: red;">*</span>
                                                </label>
                                                <input type="password" name="password" id="password">
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <button onclick="changePassword()" type="button" class="btn btn-primary" id="change-password" style="display: none;">Change Password</button>
                                        
                                    </div>
                                </div>
                            
                        </div>
                        </form>
                        
                    </div>
                </div>
                <!--form area end-->
            </div>
        </div>
    </div>
</div>

<!-- customer login end -->    
@endsection

@push('js')
	<script>
        function sendOtp(){
            let mobile = $('#mobile').val();
            if(!mobile.length > 0 || mobile.trim() == ""){
                $('#alert').show().removeClass().addClass("alert alert-danger");
                $('#alert-message').text('Invalid Mobile Number');
            } else{
                $.ajax({
                    method : 'GET',
                    url : "{{ route('reset-password-otp') }}",
                    data : {mobile: mobile},
                   // dataType : 'JSON',
                    success : function(response){
                        if(response.status === "success"){
                            $('#alert').show().removeClass().addClass("alert alert-info");
                            $('#alert-message').text(response.message);
                            $('#change-password').show();
                        } else if(response.status === "exists"){
                            //$('input[name=mobile').val('');
                            $('#alert').show().removeClass().addClass("alert alert-danger");
                            $('#alert-message').text(response.message);
                        }
                    }
                });
            }
            
        }

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function changePassword() {
            let mobile = $('#mobile').val();
            let otp_code = $('#otp_code').val();
            let password = $('#password').val();
            if(!mobile.length > 0 || mobile.trim() == ""){
                $('#alert').show().removeClass().addClass("alert alert-danger");
                $('#alert-message').text('Invalid Mobile Number');
            } else if(!otp_code.length || otp_code.trim() == ""){
                $('#alert').show().removeClass().addClass("alert alert-danger");
                $('#alert-message').text('Otp Code Required');
            } else if(!password.length || password.trim() == "" || password.length < 6){
                $('#alert').show().removeClass().addClass("alert alert-danger");
                $('#alert-message').text('Password Required & Minimum 6 Character');
            } else {
                $.ajax({
                    method: 'POST',
                    url:  "{{ route('reset-password') }}",
                    data: {mobile: mobile,otp_code: otp_code,password: password},
                    success: function(response){
                        if(response.status === "success"){
                            $('#alert').show().removeClass().addClass("alert alert-info");
                            $('#alert-message').html(response.message);
                            $('#mobile').val("");
                            $('#otp_code').val("");
                            $('#password').val("");
                            $('#change-password').hide();
                        } else if(response.status === "failed"){
                            $('#alert').show().removeClass().addClass("alert alert-danger");
                            $('#alert-message').text(response.message);
                        }
                    }
                });
            }
        }

        function checkOtp(mobile,otp_code){
            $.ajax({
            method : 'GET',
            url : "{{ route('check-otp') }}",
            data : {mobile: mobile,otp_code: otp_code},
            success : function(response){
                if(response.status === "success"){
                    return true;
                } else if(response.status === "failed"){
                    return false;
                }
            }
            });
        }

    </script>
@endpush





