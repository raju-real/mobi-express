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
                <div class="ibox-title">
                    <form class="sort-form" action="#">
                        <div class="selector">
                            <select class="form-control" onchange="top.location.href = this.options[this.selectedIndex].value">
                               @for($i=10;$i <= 100;$i+=10)
                                <option value="{{ route("admin.product.index", ['limit'=>$i]) }}">
                                    {{ $i }}
                                </option>
                                @endfor
                            </select>
                        </div>
                    </form>
                </div>
                <div class="ibox-title text-right">
                	<a href="{{ route('admin.product.create') }}" class="badge badge-primary">
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
                {{ $products->links() }}
            </div>
        </div>
	</div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(function() {
        $('#product-table').DataTable({
            pageLength: 10,
            paging: false,
            searching: false,
            info: false
           
        });
    })
</script>

    
@endpush