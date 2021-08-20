@extends('user.layouts.app')
@section('title','Contact Us')
@push('css')
@endpush

@section('content')
<div class="contact_page_bg">
    <div class="container">
        <!--contact area start-->
        <div class="contact_area">
            <div class="row">
                @php
                    $contact = App\Model\ContactUs::first();
                @endphp
                <div class="col-lg-6 col-md-6">
                	<iframe src="{{ $contact->map_link }}" width="610" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                	<hr>
                    <div class="contact_message content">
                        <h3>contact us</h3>
                        <p>{{ $contact->office_info }}</p>
                        <ul>
                            <li><i class="fa fa-fax"></i> Address : {{ $contact->address }}</li>
                            <li><i class="fa fa-mobile"></i> <a href="#">
                                {{ $contact->mobile }}
                            </a></li>
                            <li><i class="fa fa-envelope-o"></i> {{ $contact->email }}</li>
                            <li><i class="fa fa-phone"></i> {{ $contact->phone }}</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact_message form">
                        <h3>Send Your Message</h3>
                        <hr>
                        @if(Session::has('message'))
                        <div class="alert alert-success" role="alert">
                        	<strong>{{ Session::get('message') }}</strong>
                        </div>
                        @endif
                        <form action="{{ route('send-message') }}" method="POST" onsubmit="return validate()">
                        	@csrf
                            <p>
                                <label> Your Name (<i class="fa fa-star" style="color: red;"></i>)</label>
                                <input name="name" placeholder="Full Name" type="text" id="name">
                            </p>
                            <p>
                                <label> Your Mobile (<i class="fa fa-star" style="color: red;"></i>)</label>
                                <input name="mobile" placeholder="Mobile" type="text" id="mobile">
                            </p>
                            <p>
                                <label> Your Email(Optional)</label>
                                <input name="email" placeholder="Email" type="email" id="email">
                            </p>
                            <p>
                                <label> Subject (<i class="fa fa-star" style="color: red;"></i>)</label>
                                <input name="subject" placeholder="Subject" type="text" id="subject">
                            </p>
                            <div class="contact_textarea">
                                <label> Your Message (<i class="fa fa-star" style="color: red;"></i>)</label>
                                <textarea placeholder="Message *" name="message" class="form-control2" id="message"></textarea>
                            </div>
                            <button type="submit"> Send</button>
                            {{-- <p class="form-messege"></p> --}}
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!--contact area end-->
    </div>
</div>
@endsection

@push('js')    
{{-- <script src="https://maps.google.com/maps/api/js?sensor=false&amp;libraries=geometry&amp;v=3.22&amp;key=AIzaSyChs2QWiAhnzz0a4OEhzqCXwx_qA9ST_lE"></script>
    <script src="https://www.google.com/jsapi"></script>
    <script src="{{ asset('assets/user/js/map.js') }}"></script> --}}
<script type="text/javascript">
	function validate(){
		var name = $('#name').val();
		var mobile = $('#mobile').val();
		var subject = $('#subject').val();
		var message = $('#message').val();
		if(!name.length){
			$('#name').css({'border':'1px solid red'});
			return false;
		} else if(!mobile.length){
			$('#mobile').css({'border':'1px solid red'});
			return false;
		} else if(!subject.length){
			$('#subject').css({'border':'1px solid red'});
			return false;
		} else if(!message.length){
			$('#message').css({'border':'1px solid red'});
			return false;
		} else{
			return true;
		}
	}
</script>
@endpush
