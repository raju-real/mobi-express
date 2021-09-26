@extends('user.layouts.app')
@section('title','Login')
@push('css')
    {{-- expr --}}
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
                        <form action="{{ route('register') }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <p>
                                        <label>Name
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="text" name="name" id="reg_name">
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <label>Mobile
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="number" name="mobile" id="reg_mobile">
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>
                                        <label>Password
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="password" name="password" id="reg_password">
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <label>
                                            Confirm Password 
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="password" name="confirm_password" id="reg_confirm_password">
                                    </p>
                                </div>
                            </div>
                            
                            
                            <div class="login_submit">
                                <button type="submit">Register</button>
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
                                <label>Username or email <span style="color: red;">*</span></label>
                                <input type="text" name="mobile" id="log_mobile">
                            </p>
                            <p>
                                <label>Passwords <span style="color: red;">*</span></label>
                                <input type="password" name="password" id="log_password">
                            </p>
                            <div class="login_submit">
                                <a href="#">Lost your password?</a>
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





