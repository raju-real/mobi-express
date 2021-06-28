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
                	<a href="{{ route('admin.promotion-product.create',$promotion_id) }}" class="badge badge-primary">
                		<i class="fa fa-plus-circle"></i>
                	Add New
                </a>
                </div>
            </div>
            
            <div class="ibox-body">
                <table class="table table-responsive text-nowrap table-striped table-bordered table-hover" id="product-table" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Sl.no</th>
                            <th>Name</th>
                            <th>Unit Price</th>
                            <th>Discount</th>
                            <th>Discount Price</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Sl.no</th>
                            <th>Name</th>
                            <th>Unit Price</th>
                            <th>Discount</th>
                            <th>Discount Price</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    	@foreach($products as $product)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $product->name }}</td>
                            <td>{{ $product->unit_price }}</td>
                            <td>
                                <span class="badge badge-success">{{ $product->percentage }} % Off</span>
                            </td>
                            <td>{{ $product->discount_price }}</td>
                            <td>
                                {{ $product->status == 1 ? 'Active' : 'In Active' }}
                            </td>
                            <td>
                            	<a href="" class="badge badge-info">
                            		<i class="fa fa-eye"></i>
                            	</a>
                                <a href="" class="badge badge-primary">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                {{ $products->links() }}
            </div>
        </div>
	</div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(function() {
        $('#promotion-product-table').DataTable({
            pageLength: 10,
            paging: false,
            searching: false,
            info: false
           
        });
    })
</script>

    
@endpush