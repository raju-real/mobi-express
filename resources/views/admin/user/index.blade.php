@extends('admin.layouts.app')
@section('title','Users')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-body">
                <form action="{{ route('admin.users.index') }}" method="GET">
                   <div class="row">
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="inputName">Name</label>
                          <input type="text" name="name" class="form-control">
                        </div>
                      </div>
                       <div class="col-md-3">
                        <div class="form-group">
                          <label for="inputName">Mobile</label>
                          <input type="text" name="mobile" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="inputName">Email</label>
                          <input type="text" name="email" class="form-control">
                        </div>
                      </div>
                      
                      <div class="col-md-2">
                        <div class="form-group">
                          <label for="status">Status</label>
                          <select id="status" class="form-control" name="status">
                            <option selected disabled>Select one</option>
                            <option value="1">Active</option>
                            <option value="0">Blocked</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-1">
                        <div class="form-group">
                          <label for="">Search</label>
                          <input type="submit" value="Search" class="form-control pointer" style="background-color: orange">
                        </div>
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
                {{-- <div class="ibox-title text-right">
                	<a href="{{ route('admin.product.create') }}" class="badge badge-primary">
                		<i class="fa fa-plus-circle"></i>
                	Add New
                </a>
                </div> --}}
            </div>
            
            <div class="ibox-body">
                <div class="col-md-12 table-responsive">
                    <table id="user-table" class="table table-bordered table-striped table-md">
                      <thead>
                          <tr>
                            <th>Sl.no</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Join Date</th>
                            <th>Status</th>
                            <th>Action</th>
                          </tr>
                      </thead>
                      <tbody>
                        @foreach($users as $user)
                          <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>
                              @if($user->image != null)
                                <img src="{{ asset($user->image) }}" class="img-responsive img-circle" alt="Responsive image" style="height: 50px;width:50px;">
                              @else
                                <img src="{{ asset('assets/common/images/avator.png') }}" class="img-responsive img-circle" alt="Responsive image" style="height: 50px;width:50px;">
                              @endif    
                            </td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->mobile }}</td>
                            <td>{{ $user->email ?? 'Empty' }}</td>
                            <td>{{ $user->created_at->format('d-m-y') }}</td>
                            <td>
                                @if($user->status == 1)
                                    <span class="badge badge-primary">Active</span>
                                @elseif($user->status == 0)    
                                    <span class="badge badge-danger">Blocked</span>
                                @endif    
                            </td>
                            <td>
                              <a href="{{ route('admin.user.show',['mobile'=>$user->mobile]) }}" class="badge badge-info"><i class="fa fa-eye"></i></a>
                            </td>
                        </tr>
                        @endforeach
                      </tbody>
                      <tfoot>
                      <tr>
                        <th>Sl.no</th>
                          <th>Image</th>
                          <th>Name</th>
                          <th>Mobile</th>
                          <th>Email</th>
                          <th>Join Date</th>
                          <th>Status</th>
                          <th>Action</th>
                      </tr>
                      </tfoot>
                    </table>
                </div>
            </div>
        </div>
	</div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(function() {
        $("#user-table").DataTable({
            "responsive": true, 
            "lengthChange": true, 
            "autoWidth": true,
            "searching":false    
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