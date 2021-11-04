@extends('user.layouts.app')
@section('title','Login')
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
                        <li>Login/Register</li>
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
                <!--register area start-->
                <div class="col-lg-7 col-md-7">
                    <div class="account_form register">
                        <h2>Register</h2>
                        <div role="alert" id="alert" style="display: none;">
                            <strong id="alert-message"></strong> 
                        </div>
                        <form action="{{ route('register') }}" method="POST" id="registraion-form" onsubmit="return registrationValidate()" style="display: none;">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <p>
                                        <label>Name
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="text" name="name" id="reg_name" onkeyup="hideNameError()">
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p style="display: none;">
                                        <label>Mobile
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="hidden" name="reg_mobile" id="reg_mobile">
                                    </p>
                                    <p>
                                        <label>Email(Optional)</label>
                                        <input type="text" name="reg_email" id="reg_email">
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>
                                        <label id="password_label">Password
                                            <span style="color: red;">*</span>
                                        </label>

                                        <input type="password" name="password" id="reg_password" onkeyup="checkPassword()">
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <label id="cp_label">
                                            Confirm Password 
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="password" name="confirm_password" id="reg_confirm_password" onkeyup="checkConfirmPassword()">
                                    </p>
                                </div>
                            </div>
                            
                            
                            <div class="login_submit">
                                <button type="submit">Register</button>
                            </div>
                        </form>
                        <div class="row">
                            <form>
                            <div class="col-md-6">
                                <div id="mobile-div">
                                    <p>
                                        <label>Mobile
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="number" name="mobile" id="mobile">
                                    </p>
                                    <button onclick="sendOtp()" type="button" class="btn btn-primary">Send Otp</button>
                                </div>
                                <div id="otp-div" style="display:none;">
                                    <p>
                                        <label>Type Otp
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="number" name="otp_code" id="otp_code">
                                    </p>
                                    <button onclick="checkOtp()" type="button" class="btn btn-primary">Submit Otp</button>
                                </div>
                            </div>
                        </div>
                        </form>
                        
                    </div>
                </div>
                <!--register area end-->
                <!--login area start-->
                <div class="col-lg-5 col-md-5">
                    <div class="account_form login">
                        <h2>login</h2>
                        <form action="{{ route('login') }}" method="POST" onsubmit="return loginValidate()">
                            @csrf
                            <p>
                                <label>Mobile <span style="color: red;">*</span></label>
                                <input type="text" name="mobile" id="log_mobile">
                            </p>
                            <p>
                                <label>Passwords <span style="color: red;">*</span></label>
                                <input type="password" name="password" id="log_password">
                            </p>
                            <div class="login_submit">
                                <a href="{{ route('reset-password') }}">Lost your password?</a>
                                <label for="remember">
                                    <input id="remember" type="checkbox">
                                    Remember me
                                </label>
                                <button type="submit">login</button>

                            </div>

                        </form>
                    </div>
                </div>
                <!--login area start-->
            </div>
        </div>
    </div>
</div>

<!-- customer login end -->    
@endsection

@push('js')
	<script>
        function sendOtp(){
            var mobile = $('#mobile').val();
            if(!mobile.length > 0 || mobile.trim() == ""){
                $('#alert').show().removeClass().addClass("alert alert-danger");
                $('#alert-message').text('Invalid Mobile Number');
            } else{
                $.ajax({
                    method : 'GET',
                    url : "{{ route('send-otp') }}",
                    data : {mobile: mobile},
                   // dataType : 'JSON',
                    success : function(response){
                        if(response.status === "success"){
                            $('#mobile-div').hide();
                            $('#otp-div').show();
                            $('#alert').show().removeClass().addClass("alert alert-info");
                            // $('#alert-message').text(response.message + '-' + response.otp_code);
                            $('#alert-message').text(response.message);
                        } else if(response.status === "exists"){
                            $('input[name=mobile').val('');
                            $('#alert').show().removeClass().addClass("alert alert-danger");
                            $('#alert-message').text(response.message);
                        }
                    }
                });
            }
            
        }

        function checkOtp(){
            var mobile = $('#mobile').val();
            var otp_code = $('#otp_code').val();
            $.ajax({
            method : 'GET',
            url : "{{ route('check-otp') }}",
            data : {mobile: mobile,otp_code: otp_code},
            success : function(response){
                if(response.status === "success"){
                    $('#reg_mobile').val(response.mobile);
                    $('#otp-div').hide();
                    $('#registraion-form').show();
                    $('#alert').show().removeClass().addClass("alert alert-success");
                    $('#alert-message').text(response.message);
                } else if(response.status === "failed"){
                    $('#reg_mobile').val(response.mobile);
                    $('#alert').show().removeClass().addClass("alert alert-danger");
                    $('#alert-message').text(response.message);
                }
            }
            });
        }

        function registrationValidate(){
            var name = $('#reg_name').val();
            var mobile = $('#reg_mobile').val();
            var password = $('#reg_password').val();
            var confirm_password = $('#reg_confirm_password').val();
            if(!name.length){
                $('#reg_name').addClass("error");
                return false;
            } else if(!mobile.length){
                $('#alert').show().removeClass().addClass("alert alert-danger");
                $('#alert-message').text('Mobile Missmatched');
                return false;
            } else if(!password.length){
                $('#reg_password').addClass("error");
                return false;
            } else if(!confirm_password.length){
                $('#reg_confirm_password').addClass("error");
                return false;
            } else if(confirm_password != password){
                $('#alert').show().removeClass().addClass("alert alert-danger");
                $('#alert-message').text('Password Not Matched');
                return false;
            } else{
                return true;
            }
        }

        function checkPassword(){
            var password = $('#reg_password').val();
            if(password.length && password.trim() != ""){
                $('#reg_password').removeClass('error');
            }
            if(password.length < 6){
                $('#password_label').append('<span id="pass_message" style="color:red"></span>');
                $('#pass_message').text('Minimum 6 character');
            } else{
                $('#pass_message').hide();
            }
        }

        function hideNameError(){
            var name = $('#reg_name').val();
            if(name.length && name.trim() != ""){
                $('#reg_name').removeClass('error');
            }
        }

        function checkConfirmPassword(){
            var password = $('#reg_password').val();
            var confirm_password = $('#reg_confirm_password').val();
            if(confirm_password.length && confirm_password.trim() != ""){
                $('#confirm_password').removeClass('error');
            }
            $('#cp_label').append('<span id="cpass_message"></span>');
            if(confirm_password != password){
                $('#cpass_message').text('Password Not Matched').css("color","red");
            } else if(confirm_password == password){
                $('#cpass_message').text('Password Matched').css("color","green");
            }
        }

        function loginValidate(){
            var mobile = document.getElementById('log_mobile');
            var password = document.getElementById('log_password');
            if(mobile.value.trim() == ""){
                mobile.style.border = '1px solid red';
                return false;
            }else if(password.value.trim() == ""){
                password.style.border = '1px solid red';
                return false;
            } else {
                return true;
            }
        }
    </script>
@endpush





