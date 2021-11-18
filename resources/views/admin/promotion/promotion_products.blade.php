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
                    Product List
                </div>
                
                <div class="ibox-title text-right">
                	<a href="{{ route('admin.promotion-product.create',$promotion->slug) }}" class="badge badge-primary">
                		<i class="fa fa-plus-circle"></i>
                	   Add New
                    </a>
                </div>
            </div>
            <div class="ibox-head">
                <div class="ibox-title">
                    Short Action
                </div>
                
                <div class="ibox-title text-right">
                    <a href="{{ route('admin.promotion-product.update-status',['promotion_id'=>$promotion->id,'action'=>'active-all']) }}" class="badge badge-primary">
                       Active All
                    </a>
                    <a href="{{ route('admin.promotion-product.update-status',['promotion_id'=>$promotion->id,'action'=>'in-active-all']) }}" class="badge badge-danger">
                       In Active All
                    </a>
                    {{-- <a href="{{ route('admin.promotion-product.update-status',['promotion_id'=>$promotion->id,'action'=>'in-active-all']) }}" class="badge badge-info">
                       Active All In Active Product
                    </a> --}}
                </div>
            </div>
            
            <div class="ibox-body">
                <table class="table table-responsive table-striped table-bordered table-hover" id="promotion-product-table" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Sl.no</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Current Price</th>
                            <th class="text-nowrap">Offer Price</th>
                            <th>Discount</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Sl.no</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Current Price</th>
                            <th>Offer Price</th>
                            <th>Discount</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody id="load">
                    	@foreach($promotionProducts as $p_p)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>
                                @if($p_p->product->image != null AND file_exists($p_p->product->image))
                                    <img src="{{ asset($p_p->product->image) }}" class="img-fluid img-thumbnail" alt="Image" style="height: 50px;width: 50px;">
                                @else
                                    <img src="{{ asset('assets/common/images/product.png') }}" class="img-fluid img-thumbnail" alt="Image" style="height: 50px;width: 50px;">
                                @endif
                            </td>
                            <td>{{ $p_p->product->name }}</td>
                            <td class="text-nowrap">
                                <span style="border-bottom: 1px solid black">
                                    Unit Price - {{ $p_p->product->unit_price }}
                                </span>
                                <br>
                                Discount Price - {{ $p_p->product->discount_price }}
                            </td>
                            <td class="text-nowrap">{{ $p_p->discount_price }}</td>
                            <td>
                                <span class="badge badge-success">{{ $p_p->product->percentage }} % Off</span>
                            </td>
                            
                            <td>
                                @if($p_p->status == 1)
                                <span class="badge badge-info">Active</span>
                                <a class="badge badge-danger" href="{{ route('admin.promotion-product.change-status',['status'=>0,'id'=>$p_p->id,'slug'=>$promotion->slug]) }}">
                                    <i class="fa fa-times"></i>
                                </a>
                                {{-- <button type="button" class="badge badge-danger" onclick="changeStatus({{ $p_p->id }},0)">
                                    <i class="fa fa-times"></i>
                                </button> --}}
                                @elseif($p_p->status == 0)
                                <span class="badge badge-danger">In Active</span>
                                <a class="badge badge-primary" href="{{ route('admin.promotion-product.change-status',['status'=>1,'id'=>$p_p->id,'slug'=>$promotion->slug]) }}">
                                    <i class="fa fa-check"></i>
                                </a>
                                {{-- <button type="button" class="badge badge-primary" onclick="changeStatus({{ $p_p->id }},1)">
                                    <i class="fa fa-check"></i>
                                </button> --}}
                                @endif
                            </td>
                            <td>
                                <a href="{{ route('admin.promotion-product.edit',$p_p->id) }}" class="badge badge-primary">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <button class="badge badge-danger pointer" type="button" onclick="deleteProduct({{ $p_p->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-promotion-product-{{ $p_p->id }}" action="{{ route('admin.promotion-product.delete',$p_p->id) }}" method="POST" style="display: none;">
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
        $('#promotion-product-table').DataTable({
            pageLength: 100,
            paging: true,
            searching: true,
            info: false
           
        });
    })

    function changeStatus(id,status){
        $.ajax({
            method: 'GET',
            url: "{{ route('admin.promotion-product.change-status') }}",
            data: {id:id,status:status},
            success: function(response){
                $("#promotion-product-table").load(location.href + " #promotion-product-table");
                var table=('#promotion-product-table').Datatable();
                table.draw();

            }
        });
    }

    function deleteProduct(id) {
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
                document.getElementById('delete-promotion-product-'+id).submit();
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