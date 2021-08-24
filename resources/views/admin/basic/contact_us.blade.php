@extends('admin.layouts.app')
@section('title','contact Us')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Contact Us</div>
            </div>
            <div class="ibox-body">
                <form action="{{ route('admin.update-contact') }}" method="POST" enctype="multipart/form-data">
                	@csrf
                	@method('PUT')
                	<div class="row">
                         <div class="col-md-3">
                             <div class="form-group">
                                <label>Company Name</label>   
                                <input type="text" name="company_name" class="form-control" value="{{ $contact->company_name }}">
                            </div>
                        </div>
                        <div class="col-md-3">
                             <div class="form-group">
                                <label>Mobile</label>   
                                <input type="text" name="mobile" class="form-control" value="{{ $contact->mobile }}">
                            </div>
                        </div>   

                         <div class="col-md-3">
                             <div class="form-group">
                                <label>Email</label>   
                                <input type="text" name="email" class="form-control"
                                value="{{ $contact->email }}">
                            </div>
                         </div>   
                         <div class="col-md-3">
                             <div class="form-group">
                                <label>Phone</label>   
                                <input type="text" name="phone" class="form-control" value="{{ $contact->phone }}">
                            </div>
                         </div>   
                    </div>
                    <div class="form-group">
                        <label for="map_link">
                            Map Link
                        </label>
                        <textarea name="map_link" class="form-control"
                        id="map_link">{{ $contact->map_link }}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="office_info">
                            Office Info
                        </label>
                        <textarea name="office_info" class="form-control"
                        id="office_info">{{ $contact->office_info }}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="address">
                            Address
                        </label>
                        <textarea name="address" class="form-control"
                        id="address">{{ $contact->address }}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg pointer">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
