@extends('user.layouts.app')
@section('title','Account Setting')

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
                                <p>Change Password</p>
                                <hr>
                                <form action="{{ route('user.change-password') }}" method="POST" onsubmit="return validate()">
                                @csrf
                                    <div class="form-group">
                                        <label>Old Password</label>
                                        <input type="password" name="old_password" class="form-control" id="old_password">
                                    </div>
                                    <div class="form-group mt-3">
                                        <label>New Password</label>
                                        <input type="password" name="new_password" class="form-control" id="new_password">
                                    </div>
                                    <div class="form-group mt-3">
                                        <label>Confirm Password</label>
                                        <input type="password" name="confirm_password" class="form-control" id="confirm_password">
                                        <span id="pass-error" style="display: none;color: red;">Password Not Matched</span>
                                    </div>

                                <div class="form-group mt-3">
                                    <button type="submit" class="btn btn-danger pull-right">
                                        Change Password
                                    </button>
                                </div>
                            </form>
                            </div>
                            <div class="col-md-6">
                                <p>Change Mobile Number</p>
                                <hr>
                                <div role="alert" id="alert" style="display: none;">
                                    <strong id="alert-message"></strong> 
                                </div>
                                <div id="mobile-div">
                                    <p>
                                        <label>New Mobile
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="number" name="mobile" id="mobile" class="form-control">
                                    </p>
                                    <button onclick="sendOtp()" type="button" class="btn btn-danger">Send Otp</button>
                                </div>
                                <div id="otp-div" style="display:none;">
                                    <p>
                                        <label>Type Otp
                                            <span style="color: red;">*</span>
                                        </label>
                                        <input type="number" name="otp_code" id="otp_code" class="form-control">
                                    </p>
                                    <button onclick="checkOtp()" type="button" class="btn btn-info">Submit Otp</button>
                                </div>
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
<script type="text/javascript">
    function validate(){
        let old_password = $('#old_password').val();
        let new_password = $('#new_password').val();
        let confirm_password = $('#confirm_password').val();
        if(!old_password.length > 0 && old_password.trim() == ""){
            $('#old_password').css("border","1px solid red");
            return false;
        } else if(!new_password.length > 0 && new_password.trim() == ""){
            $('#new_password').css("border","1px solid red");
            return false;
        } else if(!confirm_password.length > 0 && confirm_password.trim() == ""){
            $('#confirm_password').css("border","1px solid red");
            return false;
        } else if(confirm_password != new_password){
            $('#confirm_password').css("border","1px solid red");
            $('#pass-error').show();
            return false;
        } else{
            return true;
        }
    }

    function hideError(attribute){
        let value = $('#'+attribute).val();
        if(value.length > 0 && value.trim() != ""){
            $('#'+attribute).removeClass("error");
        }
    }

    function sendOtp(){
        var mobile = $('#mobile').val();
        if(!mobile.length > 0 || mobile.trim() == ""){
            $('#alert').show().removeClass().addClass("alert alert-danger");
            $('#alert-message').text('Invalid Mobile Number');
        } else {
            $.ajax({
                method : 'GET',
                url : "{{ route('user.send-otp') }}",
                data : {mobile: mobile},
               // dataType : 'JSON',
                success : function(response){
                    if(response.status === "success"){
                        $('#mobile-div').hide();
                        $('#otp_code').val("");
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
        url : "{{ route('user.check-otp') }}",
        data : {mobile: mobile,otp_code: otp_code},
        success : function(response){
            if(response.status === "success"){
                $('#mobile').val("");
                $('#mobile-div').show();
                $('#otp-div').hide();
                $('#alert').show().removeClass().addClass("alert alert-success");
                $('#alert-message').text(response.message);
            } else if(response.status === "failed"){
                $('#otp_code').val("");
                $('#alert').show().removeClass().addClass("alert alert-danger");
                $('#alert-message').text(response.message);
            }
        }
        });
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

</script>
@endpush