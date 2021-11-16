@extends('admin.layouts.app')
@section('title','Coupons')
@push('css')
@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Coupons</div>
                <div class="ibox-title text-right">
                	<a href="{{ route('admin.coupon.create') }}" class="btn btn-primary pointer">
                		<i class="fa fa-plus"></i>
                	</a>
                	
                </div>
            </div>
            <div class="ibox-body">
                <table class="table table-bordered table-striped text-nowrap text-sm text-left table-responsive">
                    <thead >
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Code</th>
                            <th class="text-left">Valid For</th>
                            <th class="text-left">Discount</th>
                            <th class="text-left">Limit</th>
                            <th class="text-left">Min Cost</th>
                            <th class="text-left">Up To</th>
                            <th class="text-left">Date</th>
                            <th class="text-left">Used</th>
                            <th class="text-left">Status</th>
                            <th class="text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($coupons as $coupon)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $coupon->coupon_code }}</td>
                            <td>
                            	@if($coupon->valid_for == 1)
                            		{{ 'All User' }}
                            	@elseif($coupon->valid_for == 2)
                            		{{ 'New User' }}
                            	@elseif($coupon->valid_for == 3)	
                            		{{ $coupon->group->name ?? '' }}
                            	@else
                            		{{ 'Invalid' }}
                            	@endif
                            </td>
                            <td>
                            	{{ $coupon->discount }}
                            	@if($coupon->discount_type == 1)
                            		{{ 'BDT' }}
                            	@elseif($coupon->discount_type == 2)
                            		{{ '%' }}
                            	@else
                            		{{ 'Invalid' }}
                            	@endif
                            </td>
                            <td>{{ $coupon->used_limit }}</td>
                            <td>{{ $coupon->minimum_cost }}</td>
                            <td>{{ $coupon->up_to }}</td>
                            <td>
                            	{{ date('d-m-y', strtotime($coupon->start_date)) }} -
                            	{{ date('d-m-y', strtotime($coupon->end_date)) }}
                            </td>
                            <td>
                                <span class="badge badge-warning">
                                    {{ $coupon->total_used }}
                                </span>
                                <span>
                                    <a class="badge badge-primary" href="{{ route('admin.coupon.show',$coupon->coupon_code) }}">
                                        Users
                                    </a>
                                </span>
                            </td>
                            <td>
                            	{{ $coupon->status == 1 ? 'Active' : 'In Active' }}
                            </td>
                            <td>
								<a href="{{ route('admin.coupon.edit',$coupon->id) }}" class="btn btn-sm btn-info">
									<i class="fa fa-edit"></i>
								</a>                            	
								{{-- Delete Activity --}}
								<button class="btn btn-danger btn-sm pointer" type="button" onclick="deletecoupon({{ $coupon->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-coupon-{{ $coupon->id }}" action="{{ route('admin.coupon.destroy',$coupon->id) }}" method="POST" style="display: none;">
			                        @csrf
			                        @method('DELETE')
			                    </form>
                            </td>
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
<script>

	function deletecoupon(id) {
        Swal({
          title: 'Are you sure?',
          text: "It will be remove from database",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes, delete it!',
          cancelButtonText: 'No, cancel!',
          confirmButtonClass: 'btn btn-success',
          cancelButtonClass: 'btn btn-danger',
          buttonsStyling: false,
          reverseButtons: true
      }).then((result) => {
          if (result.value) {
              event.preventDefault();
              document.getElementById('delete-coupon-'+id).submit();
          } else if (
              // Read more about handling dismissals
          result.dismiss === swal.DismissReason.cancel
          ) {
              Swal(
                  'Cancelled',
                  'Your data is safe :)',
                  'error'
              )
          }
      })
    }


</script>
@endpush
