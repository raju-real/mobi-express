@extends('admin.layouts.app')
@section('title','Admins')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-body">
                <form action="{{ route('admin.admins.index') }}" method="GET">
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
                            <option value="0">In Active</option>
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
                    Admin List
                </div>
                <div class="ibox-title text-right">
                	<a href="{{ route('admin.admins.create') }}" class="badge badge-primary">
                		<i class="fa fa-plus-circle"></i>
                	Add New
                </a>
                </div>
            </div>
            
            <div class="ibox-body">
                <div class="col-md-12 table-responsive">
                    <table id="admin-table" class="table table-bordered table-striped table-md">
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
                        @foreach($admins as $admin)
                          <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>
                              @if($admin->image != null)
                                <img src="{{ asset($admin->image) }}" class="img-responsive img-circle" alt="Responsive image" style="height: 50px;width:50px;">
                              @else
                                <img src="{{ asset('assets/common/images/avator.png') }}" class="img-responsive img-circle" alt="Responsive image" style="height: 50px;width:50px;">
                              @endif    
                            </td>
                            <td>{{ $admin->name }}</td>
                            <td>{{ $admin->mobile }}</td>
                            <td>{{ $admin->email ?? 'Empty' }}</td>
                            <td>{{ $admin->created_at->format('d-m-y') }}</td>
                            <td>
                                @if($admin->status == 1)
                                    <span class="badge badge-primary">Active</span>
                                @elseif($admin->status == 0)    
                                    <span class="badge badge-danger">Blocked</span>
                                @endif    
                            </td>
                            <td>
                              <a href="{{ route('admin.admin.show',['mobile'=>$admin->mobile]) }}" class="badge badge-info"><i class="fa fa-eye"></i></a>
                              <a href="{{ route('admin.admin.edit',['mobile'=>$admin->mobile]) }}" class="badge badge-primary"><i class="fa fa-edit"></i></a>
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
        $("#admin-table").DataTable({
            "responsive": true, 
            "lengthChange": true, 
            "autoWidth": true,
            "searching":false    
        });
    });

</script>

    
@endpush