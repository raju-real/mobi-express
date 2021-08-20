@extends('admin.layouts.app')
@section('title','About Us')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">About Us</div>
            </div>
            <div class="ibox-body">
                <form action="{{ route('admin.update-about') }}" method="POST" enctype="multipart/form-data">
                	@csrf
                	@method('PUT')
                	<div class="row">
                		<div class="col-md-6">
                			<div class="form-group">
                				<label>Change Image</label>
                				<input type="file" name="image" class="form-control">
                			</div>
                		</div>

                		<div class="col-md-6">
                			<p>Current Image</p>
                			<img src="{{ asset($about->image) }}" class="img-responsive" style="height: 300px;width: 400px;">
                		</div>
                	</div>
                	<br>
                	<div class="row">
                        <div class="col-sm-12 form-group">
                            <label for="specification_label">
                                About Us
                            </label>
                            <textarea name="about_us" class="form-control"
                                      id="about_us">{{ $about->about_us }}</textarea>
                            <script>
                                CKEDITOR.replace('about_us')
                            </script>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg pointer">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
