@extends('admin.layouts.app')
@section('title','Policy')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-md-6">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Privacy Policy</div>
                <div class="ibox-tools">
                	<a href="{{ route('admin.policy-edit',['policy'=>'privacy_policy']) }}" class="badge badge-default">
                    	<i class="fa fa-edit"></i>
                    </a>
                    <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                    <a class="fullscreen-link"><i class="fa fa-expand"></i></a>
                </div>
            </div>
            <div class="ibox-body">
                <div class="scroller" data-height="200px">
                	{!! $policy->privacy_policy !!}
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Terms & Condition</div>
                <div class="ibox-tools">
                	<a href="{{ route('admin.policy-edit',['policy'=>'terms_condition']) }}" class="badge badge-default">
                    	<i class="fa fa-edit"></i>
                    </a>
                    <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                    <a class="fullscreen-link"><i class="fa fa-expand"></i></a>
                </div>
            </div>
            <div class="ibox-body">
                <div class="scroller" data-height="200px">
                	{!! $policy->terms_condition !!}
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Return Policy</div>
                <div class="ibox-tools">
                	<a href="{{ route('admin.policy-edit',['policy'=>'return_policy']) }}" class="badge badge-default">
                    	<i class="fa fa-edit"></i>
                    </a>
                    <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                    <a class="fullscreen-link"><i class="fa fa-expand"></i></a>
                </div>
            </div>
            <div class="ibox-body">
                <div class="scroller" data-height="200px">
                	{!! $policy->return_policy !!}
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Refund Policy</div>
                <div class="ibox-tools">
                    <a href="{{ route('admin.policy-edit',['policy'=>'refund_policy']) }}" class="badge badge-default">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                    <a class="fullscreen-link"><i class="fa fa-expand"></i></a>
                </div>
            </div>
            <div class="ibox-body">
                <div class="scroller" data-height="200px">
                    {!! $policy->refund_policy !!}
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Delivery Information</div>
                <div class="ibox-tools">
                	<a href="{{ route('admin.policy-edit',['policy'=>'delivery_information']) }}" class="badge badge-default">
                    	<i class="fa fa-edit"></i>
                    </a>
                    <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                    <a class="fullscreen-link"><i class="fa fa-expand"></i></a>
                </div>
            </div>
            <div class="ibox-body">
                <div class="scroller" data-height="200px">
                	{!! $policy->delivery_information !!}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script>
	function validate(){
		let district = $('#district').val();
		if(!district.length){
			$('#district').after('<span class="val-error">district Name Required</span>');
			return false;
		} else{
			return true;
		}
	}

	function deleteItem(event,id){
		Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtondistrict: '#3085d6',
		  cancelButtondistrict: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		  	event.preventDefault();
		  	$('#delete-district-'+id).submit();
		    
		  } else{
		  		Swal.fire(
                  'Cancelled',
                  'Your data is safe :)',
                  'error'
              	)
		  }
		})
	}

	
</script>
@endpush