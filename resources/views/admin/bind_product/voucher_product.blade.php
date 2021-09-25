@extends('admin.layouts.app')
@section('title','Voucher Products')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Voucher Products</div>
                <div class="ibox-title text-right">
                	<a href="{{ route('admin.voucher-product.create') }}" class="badge badge-info">
					  <i class="fa fa-plus-circle"></i>Add New
					</a>
                </div>
            </div>
            <div class="ibox-body">
                <table class="table table-bordered table-striped text-nowrap text-sm text-center" id="voucher-product-table">
                    <thead >
                        <tr>
                            <th class="text-center">Sl.no</th>
                            <th class="text-center">Image</th>
                            <th class="text-center">Product</th>
                            <th class="text-center">Serial</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($v_products as $v_p)
                            @if($v_p->product)
                                <tr>
                                    <td>{{ $loop->index + 1 }}</td>
                                    <td>
                                        <img src="{{ asset($v_p->product->image) }}" class="img-responsive" style="height: 50px;width:50px;">
                                    </td>
                                    <td class="text-left">{{ $v_p->product->name }}</td>
                                    <td>{{ $v_p->serial }}</td>
                                    <td>
                                        {{ $v_p->status == 1 ? 'Active' : 'In Active' }}
                                    </td>
                                    <td>
                                        <a href="{{ route('admin.voucher-product.edit',$v_p->id) }}" 
                                            class="btn btn-primary">
                                          <i class="fa fa-edit"></i>
                                        </a>
                                        {{-- Delete Activity --}}
                                        <button class="btn btn-danger pointer" type="button" onclick="deleteproduct({{ $v_p->id }})">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                        <form id="delete-v_p-{{ $v_p->id }}" action="{{ route('admin.voucher-product.destroy',$v_p->id) }}" method="POST" style="display: none;">
                                            @csrf
                                            @method('DELETE')
                                        </form>
                                    </td>
                                </tr>
                            @endif
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
        $('#voucher-product-table').DataTable({
            pageLength: 10,
            paging: true,
            searching: false,
            info: true
           
        });
    })
</script>
<script>
	
	function deleteproduct(id) {
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
              document.getElementById('delete-v_p-'+id).submit();
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