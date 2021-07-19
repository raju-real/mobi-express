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
                            <th>Name</th>
                            <th>Category</th>
                            <th>Unit Price</th>
                            <th>Discount Price</th>
                            <th>Stock</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Sl.no</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Unit Price</th>
                            <th>Discount Price</th>
                            <th>Stock</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    	@foreach($products as $product)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $product->name }}</td>
                            <td>{{ $product->category->name }}</td>
                            <td>{{ $product->unit_price }}</td>
                            <td>
                                {{ $product->discount_price }}
                                <span class="badge badge-success">{{ $product->percentage }} Off</span>
                            </td>
                            <td>{{ $product->stock_status }}</td>
                            <td>{{ $product->quantity }}</td>
                            <td>
                            	<a href="{{ route('admin.product.show',$product->slug) }}" class="badge badge-info">
                            		<i class="fa fa-eye"></i>
                            	</a>
                                <a href="{{ route('admin.product.edit',$product->slug) }}" class="badge badge-primary">
                                    <i class="fa fa-edit"></i>
                                </a>
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
</script>

    
@endpush