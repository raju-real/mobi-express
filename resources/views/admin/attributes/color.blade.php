@extends('admin.layouts.app')
@section('title','Color')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Color</div>
                <div class="ibox-title text-right">
                	<button type="button" class="btn btn-primary pointer" data-toggle="modal" data-target="#add-color">
					  <i class="fa fa-plus"></i>
					</button>

					<!-- Modal -->
					<div class="modal fade" id="add-color" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">
					        	Add Color
					        </h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form action="{{ route('admin.color.store') }}" method="POST" role="form" onsubmit="return validate()">
						      	@csrf
						        <div class="modal-body">
						        	<div class="form-group text-left">
						        		<label for="color">
						        			Color Name
						        		</label>
						        		<input type="text" name="name" class="form-control" id="color" placeholder="Color Name">
						        	</div>
						      	</div>
							    <div class="modal-footer">
							      	<button type="submit" class="btn btn-primary pointer">Add</button>
							        <button type="button" class="btn btn-danger pointer" data-dismiss="modal">Close</button>
							    </div>
					      </form>
					    </div>
					  </div>
					</div>
                </div>
            </div>
            <div class="ibox-body">
                <table class="table table-bordered table-striped text-nowrap text-sm text-left ">
                    <thead >
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Color Name</th>
                            <th class="text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($colors as $color)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $color->name }}</td>
                            <td>
                            	{{-- Delete Activity --}}
                            	<button type="button" class="btn btn-info pointer" data-toggle="modal" data-target="#edit-color{{ $color->id }}">
								  <i class="fa fa-edit"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="edit-color{{ $color->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">
								        	Edit Color
								        </h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								       <form action="{{ route('admin.color.update',$color->id) }}" method="POST" role="form">
									      	@csrf
									      	@method('PUT')
									        <div class="modal-body">
									        	<div class="form-group text-left">
									        		<label for="color">
									        			Color Name
									        		</label>
									        		<input type="text" name="name" class="form-control" value="{{ $color->name }}">
									        	</div>
									      	</div>
										    <div class="modal-footer">
										      	<button type="submit" class="btn btn-primary pointer">Update</button>
										        <button type="button" class="btn btn-danger pointer" data-dismiss="modal">Close</button>
										    </div>
								      </form>
								    </div>
								  </div>
								</div>

								{{-- Delete Activity --}}
								<button class="btn btn-danger pointer" type="button" onclick="deleteItem({{ $color->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-color-{{ $color->id }}" action="{{ route('admin.color.destroy',$color->id) }}" method="POST" style="display: none;">
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
	function validate(){
		let color = $('#color').val();
		if(!color.length){
			$('#color').after('<span class="val-error">Color Name Required</span>');
			return false;
		} else{
			return true;
		}
	}

	function deleteItem(id) {
      swal({
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
              document.getElementById('delete-color-'+id).submit();
          } else if (
              // Read more about handling dismissals
          result.dismiss === swal.DismissReason.cancel
          ) {
              swal(
                  'Cancelled',
                  'Your data is safe :)',
                  'error'
              )
          }
      })
    }

	
</script>
@endpush