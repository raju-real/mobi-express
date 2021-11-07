@extends('user.layouts.app')
@section('title','My Reviews')

@push('css')
<style type="text/css">
    .left-text{
        text-align: left;
    }
</style>
@endpush

@section('content')
<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="{{ route('home') }}">home</a></li>
                        <li>My Reviews</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!-- my account start  -->
<div class="account_page_bg">
    <div class="container">
        <section class="main_content_area">
            <div class="account_dashboard">
                <div class="row">
                    <div class="col-sm-12 col-md-3 col-lg-3">
                        <!-- Nav tabs -->
                        <div class="dashboard_tab_button">
                            @include('user.profile.user_menus')
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-9 col-lg-9">
                        <!-- Tab panes -->
                        <h3>My Reviews</h3>
                        @if(Session::has('message'))
                        <div class="alert alert-warning" role="alert">
                            <strong>{{ Session::get('message') }}</strong>
                        </div>
                        @endif
                        <div class="table-responsive" >
                            <table class="table text-nowrap">
                                <thead>
                                    <tr>
                                        <th style="text-align: left;font-weight: normal;">Sl.no</th>
                                        <th style="text-align: left;font-weight: normal;">Image</th>
                                        <th style="text-align: left;font-weight: normal;">Product</th>
                                        <th style="text-align: left;font-weight: normal;">Rating</th>
                                        <th style="text-align: left;font-weight: normal;">Review</th>
                                        <th style="text-align: left;font-weight: normal;">
                                            Action
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($reviews as $review)
                                    <tr>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            {{ $loop->index + 1 }}
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            <img src="{{ asset($review->product->image) }}" style="height: 80px;width: 80px;">
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            {{ $review->product->name }}
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            @for($i=1;$i<=$review->rating;$i++)
                                            <i class="ion-android-star" style="font-size: 20px;color: orange;"></i>
                                            @endfor
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            {{ $review->review }}
                                        </td>
                                       
                                        <td style="text-align: left;font-weight: normal;">
                                            <a href="{{ route('product-details',['slug'=>$review->product->slug]) }}" class="btn btn-info btn-sm">
                                                <i class="fa fa-eye" style="color: white;"></i>
                                            </a>
                                            <a href="{{ route("user.edit-review",$review->id) }}" class="btn btn-primary btn-sm">
                                                <i class="fa fa-edit" style="color: white;"></i>
                                            </a>
                                            <button class="btn btn-danger btn-sm pointer" type="button" onclick="deleteItem({{ $review->id }})">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                            <form id="delete-review-{{ $review->id }}" action="{{ route('user.review.destroy',$review->id) }}" method="POST" style="display: none;">
                                                @csrf
                                                @method('DELETE')
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $reviews->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- my account end   -->
@endsection

@push('js')
<script>
    function deleteItem(id){
        Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                event.preventDefault();
                document.getElementById('delete-review-'+id).submit();
            } 
        })

    }
    
</script>
@endpush