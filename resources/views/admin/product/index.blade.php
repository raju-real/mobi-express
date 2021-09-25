@extends('admin.layouts.app')
@section('title','Product')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-body">
                <form action="{{ route('admin.product.index') }}">
                    <div class="row">
                        <div class="col-md-2 form-group">
                            <label>Category</label>
                            <select name="category_id" id="category_id" class="form-control" onchange="getSubcategory()">
                                <option value="">Select Category</option>
                                @foreach($categories as $category)
                                   <option value="{{ $category->id }}"> {{ $category->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-2 form-group">
                            <label for="subcategory_id">Sub Category</label>
                            <select name="subcategory_id" id="subcategory_id" class="form-control">
                                <option value="">Select Category</option>
                            </select>
                        </div>
                        <div class="col-md-4 form-group">
                            <label>Product Name</label>
                            <input type="text" name="name" class="form-control">
                        </div>
                        <div class="col-md-2">
                            <label>By Most View</label><br>
                            <input type="checkbox" name="most_view">Most View
                        </div>
                        <div class="col-md-2">
                            <label>Action</label>
                            <button type="submit" class="btn btn-info pointer">Search Product</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<div class="col-md-12">
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
                <div class="col-md-12 table-responsive">
                    <table class="table text-nowrap table-striped table-bordered table-hover table-responsive"  width="100%">
                    <thead>
                        <tr>
                            <th>Sl.no</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Unit Price</th>
                            <th>Discount Price</th>
                            <th>Stock</th>
                            <th>Quantity</th>
                            <th>View</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Sl.no</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Unit Price</th>
                            <th>Discount Price</th>
                            <th>Stock</th>
                            <th>Quantity</th>
                            <th>View</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        @foreach($products as $product)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>
                                <img src="{{ asset($product->image) }}" class="img-responsive" style="height: 50px;width:50px;">
                            </td>
                            <td>{{ $product->name }}</td>
                            <td>{{ $product->category->name }}</td>
                            <td>{{ $product->unit_price }}</td>
                            <td>
                                {{ $product->discount_price }}
                                <span class="badge badge-success">{{ $product->percentage }} Off</span>
                            </td>
                            <td>{{ $product->stock_status }}</td>
                            <td>{{ $product->quantity }}</td>
                            <td>{{ $product->view_count }}</td>
                            <td>
                                <a href="{{ route('admin.product.show',$product->slug) }}" class="badge badge-info">
                                    <i class="fa fa-eye"></i>
                                </a>
                                <a href="{{ route('admin.product.edit',$product->slug) }}" class="badge badge-primary">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <button class="badge badge-danger">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                </div>
                
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

    function getSubcategory(){
        $('#subcategory_id') .find('option') .remove() .end() .append('<option value="">Select Sub Category</option>');
        var id = document.getElementById('category_id').value;

         axios.get(`/api/get_subcategory/${id}`)
        .then(function (response) {
            var list = response.data;
            var select = document.getElementById("subcategory_id");
            for(i = 0; i < list.length ;i ++){
                var el = document.createElement("option");
                var subcategorys = list[i];
                var subcategoryName = subcategorys.name;
                var subcategoryId = subcategorys.id;
                el.textContent = subcategoryName;
                el.value = subcategoryId;
                select.appendChild(el);
            }
        });
    }
</script>

    
@endpush