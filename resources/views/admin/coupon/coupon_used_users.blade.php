@extends('admin.layouts.app')
@section('title',$coupon->coupon_code)

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Used User of {{ $coupon->coupon_code }}</div>
                @if(Session::has('message'))
	                <div class="alert alert-danger" role="alert">
	                	<strong>{{ Session::get('message') }}</strong>
	                </div>
                @endif
                
            </div>
            <div class="ibox-body">
                <table class="table table-bordered table-striped text-nowrap text-sm table-sm text-left ">
                    <thead >
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Image</th>
                            <th class="text-left">Name</th>
                            <th class="text-left">Mobile</th>
                            <th class="text-left">Used</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($results as $data)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>
                            	@if($data->user->image != null)
                                <img src="{{ asset($data->user->image) }}" class="img-responsive img-circle" alt="Responsive image" style="height: 50px;width:50px;">
                              @else
                                <img src="{{ asset('assets/common/images/avator.png') }}" class="img-responsive img-circle" alt="Responsive image" style="height: 50px;width:50px;">
                              @endif
                            </td>
                            <td>{{ $data->user->name }}</td>
                            <td>{{ $data->user->mobile ?? '' }}</td>
                            <td>{{ $data->user_used }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')

@endpush