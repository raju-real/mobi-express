@extends('admin.layouts.app')
@section('title','Product')

@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-xl-12">
		<div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">
                    Offer Product List
                </div>
                
                <div class="ibox-title text-right">
                	<a href="{{ route('admin.offer.create') }}" class="badge badge-primary">
                		<i class="fa fa-plus-circle"></i>
                	Add New
                </a>
                </div>
            </div>
            
            <div class="ibox-body">
                <table class="table table-responsive text-nowrap table-striped table-bordered table-hover" id="offer-table" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Sl.no</th>
                            <th>Image</th>
                            <th>Product</th>
                            <th>Unit Price</th>
                            <th>Discount Price</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Sl.no</th>
                            <th>Image</th>
                            <th>Product</th>
                            <th>Unit Price</th>
                            <th>Discount Price</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    	@foreach($offers as $offer)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>
                                @if($offer->product->image != null)
                                    <img src="{{ asset($offer->product->image) }}" class="img-fluid img-thumbnail" alt="Category image" style="height: 50px;width: 50px;">
                                @else
                                    {{ 'None' }}
                                @endif
                            </td>
                            <td>{{ $offer->product->name }}</td>
                            <td>{{ $offer->product->unit_price }}</td>
                            <td>
                                {{ $offer->product->discount_price }}
                                <span class="badge badge-success">{{ $offer->product->percentage }} Off</span>
                            </td>
                            <td>{{ date('d-m-y', strtotime($offer->start_date)) }}</td>
                            <td>{{ date('d-m-y', strtotime($offer->end_date)) }}</td>
                            <td>
                                @if($offer->status == 1)
                                <span class="badge badge-info">Active</span>
                                @else
                                <span class="badge badge-danger">In Active</span>
                                @endif
                            </td>
                            <td>
                                <a href="{{ route('admin.offer.edit',$offer->id) }}" class="badge badge-primary">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <button class="badge badge-danger pointer" type="button" onclick="deleteOffer({{ $offer->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-offer-{{ $offer->id }}" action="{{ route('admin.offer.destroy',$offer->id) }}" method="POST" style="display: none;">
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
<script type="text/javascript">
    $(function() {
        $('#offer-table').DataTable({
            pageLength: 10,
            paging: true,
            searching: false,
            info: true
           
        });
    })

    function deleteOffer(id) {
        Swal({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
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
                document.getElementById('delete-offer-'+id).submit();
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