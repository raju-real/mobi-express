<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>@yield('title')</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="{{ asset('assets/admin/vendors/bootstrap/dist/css/bootstrap.min.css')}}" rel="stylesheet" />
    <link href="{{ asset('assets/admin/vendors/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet" />
    <link href="{{ asset('assets/admin/vendors/themify-icons/css/themify-icons.css')}}" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <link href="{{ asset('assets/admin/vendors/jvectormap/jquery-jvectormap-2.0.3.css')}}" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="{{ asset('assets/admin/css/main.min.css')}}" rel="stylesheet" />
    <!-- Data table -->
    <link href="{{ asset('assets/admin/vendors/DataTables/datatables.min.css') }}" rel="stylesheet" />

    <link href="{{ asset('assets/admin/vendors/select2/dist/css/select2.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/admin/vendors/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/admin/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css') }}" rel="stylesheet" />

    {{-- Custom Css --}}
    <link href="{{ asset('assets/common/css/custom.css')}}" rel="stylesheet" />
        <!-- toastr -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.0/axios.min.js"></script>
  <!-- Sweetalert cdn -->
 <script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>

    <script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>

<style type="text/css">
    .displayNone{
        display: none;
    }
    .error{
        color: white;
        background: red;
        padding: -3px;
        border-radius: 2px;
    }
</style>
    @stack('css')
    <!-- PAGE LEVEL STYLES-->
</head>

<body class="fixed-navbar">

    @include('sweetalert::alert')

    {{-- Facebook Plugin --}}
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v12.0&appId=385864235969257&autoLogAppEvents=1" nonce="9S8JOkxD"></script>

    <div class="page-wrapper">
        <!-- START HEADER-->
        <header class="header">
            <div class="page-brand">
                <a class="link" href="{{ route('home') }}" target="_blank">
                    <span class="brand">
                        Mobi Express
                    </span>
                </a>
            </div>
            <div class="flexbox flex-1">
                <!-- START TOP-LEFT TOOLBAR-->
                <ul class="nav navbar-toolbar">
                    <li>
                        <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
                    </li>
                    
                </ul>
                <!-- END TOP-LEFT TOOLBAR-->
                <!-- START TOP-RIGHT TOOLBAR-->
                <ul class="nav navbar-toolbar">
                    
                    <li class="dropdown dropdown-user">
                        <a class="nav-link dropdown-toggle link" data-toggle="dropdown">
                            <img src="{{ asset('assets/admin/img/admin-avatar.png') }}" />
                            <span></span>
                            {{ Auth::check() ? Auth::user()->name : 'Person' }}
                            <i class="fa fa-angle-down m-l-5"></i></a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="profile.html"><i class="fa fa-user"></i>Profile</a>
                            <a class="dropdown-item" href="profile.html"><i class="fa fa-cog"></i>Settings</a>
                            <a class="dropdown-item" href="javascript:;"><i class="fa fa-support"></i>Support</a>
                            <li class="dropdown-divider"></li>
                            <a class="dropdown-item" href="{{ route('admin-logout') }}"><i class="fa fa-power-off"></i>Logout</a>
                        </ul>
                    </li>
                </ul>
                <!-- END TOP-RIGHT TOOLBAR-->
            </div>
        </header>
        <!-- END HEADER-->
        <!-- START SIDEBAR-->

        @include('admin.layouts.sidebar')
        
        <!-- END SIDEBAR-->
        <div class="content-wrapper">
            <div class="page-heading">
                <h3 class="page-title">@yield('page-title','')</h3>
                {{-- <hr> --}}
            </div>
            <!-- START PAGE CONTENT-->
            <div class="page-content fade-in-up" style="padding-top: 0px;">
                
                @yield('content')

            </div>
            <!-- END PAGE CONTENT-->
            <footer class="page-footer">
                <div class="font-13">2021 © <b>Mobi Xpress</b> - All rights reserved.</div>
                </div>
            </footer>
        </div>
    </div>
    
    <!-- BEGIN PAGA BACKDROPS-->
    <div class="sidenav-backdrop backdrop"></div>
    <div class="preloader-backdrop">
        <div class="page-preloader">Loading</div>
    </div>
    <!-- END PAGA BACKDROPS-->
    <!-- CORE PLUGINS-->
    <script src="{{ asset('assets/admin/vendors/jquery/dist/jquery.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/vendors/popper.js/dist/umd/popper.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/vendors/bootstrap/dist/js/bootstrap.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/vendors/metisMenu/dist/metisMenu.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/vendors/jquery-slimscroll/jquery.slimscroll.min.js') }}" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="{{ asset('assets/admin/vendors/chart.js/dist/Chart.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/vendors/jvectormap/jquery-jvectormap-2.0.3.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/vendors/jvectormap/jquery-jvectormap-world-mill-en.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/vendors/jvectormap/jquery-jvectormap-us-aea-en.js') }}" type="text/javascript"></script>
    <!-- CORE SCRIPTS-->
    <script src="{{ asset('assets/admin/js/app.min.js') }}" type="text/javascript"></script>

    <script src="{{ asset('assets/admin/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/admin/js/scripts/form-plugins.js') }}" type="text/javascript"></script>

    <!-- Data Table -->
    <script src="{{ asset('assets/admin/vendors/DataTables/datatables.min.js') }}" type="text/javascript"></script>
    <!-- Select 2 -->
    <script src="{{ asset('assets/admin/vendors/select2/dist/js/select2.full.min.js') }}" type="text/javascript"></script>
    
    {{-- <script src="{{ asset('assets/admin/js/scripts/dashboard_1_demo.js') }}" type="text/javascript"></script> --}}

    {{--  Toaster  --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    {!! Toastr::message() !!}
    <script>
        @if($errors->any())
        @foreach($errors->all() as $error)
              toastr.error('{{ $error }}','Error',{
                  closeButton:true,
                  progressBar:true,
               });
        @endforeach
    @endif
    </script>

    @stack('js')
</body>

</html>