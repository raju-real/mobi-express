@extends('user.layouts.app')
@section('title','Edit Review')

@push('css')
<style>
    .left{
        text-align: left;
    }
    .rating {
        display: flex;
        flex-direction: row-reverse;
        justify-content: left
    }

    .rating>input {
        display: none
    }

    .rating>label {
        position: relative;
        width: 1em;
        font-size: 35px;
        color: #FFD600;
        cursor: pointer
    }

    .rating>label::before {
        content: "\2605";
        position: absolute;
        opacity: 0
    }

    .rating>label:hover:before,
    .rating>label:hover~label:before {
        opacity: 1 !important
    }

    .rating>input:checked~label:before {
        opacity: 1
    }

    .rating:hover>input:checked~label:before {
        opacity: 0.4
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
                        <li>Edit Review</li>
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
                        <p>Edit Review</p>
                        <hr>
                        <form action="{{ route('user.update-review',$review->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="form-group row">
                                <div class="rating">
                                    <input type="radio" name="rating" value="5" id="5" {{ $review->rating == 5 ? 'checked' : '' }}>
                                        <label for="5">☆</label>
                                    <input type="radio" name="rating" value="4" id="4" {{ $review->rating == 4 ? 'checked' : '' }}>
                                        <label for="4">☆</label>
                                    <input type="radio" name="rating" value="3" id="3" {{ $review->rating == 3 ? 'checked' : '' }}>
                                        <label for="3">☆</label>
                                    <input type="radio" name="rating" value="2" id="2" {{ $review->rating == 2 ? 'checked' : '' }}>
                                        <label for="2">☆</label>
                                    <input type="radio" name="rating" value="1" id="1" {{ $review->rating == 1 ? 'checked' : '' }}>
                                        <label for="1">☆</label>
                                </div>
                            </div>
                            <br>
                          <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Review</label>
                            <div class="col-sm-10">
                              <textarea name="review" class="form-control">{{ $review->review }}</textarea>
                            </div>
                          </div>
                          <br>
                          <div class="row" id="h_i">
                                {{-- @php
                                    $images = App\Model\ReviewImage::where('review_id',$review->id)->get();
                                @endphp --}}
                                @if(sizeof($review->images) > 0)
                                    @foreach($review->images as $image)
                                        <div class="col-md-3">
                                            <span style="vertical-align: top;">
                                                <button type="button" class="badge badge-danger text-right" onclick="beSure({{ $image->id }})" style="float: right;background: red;">
                                                <i class="fa fa-times-circle"></i>
                                                </button>
                                            </span>
                                            <span style="vertical-align: bottom;">
                                                <img src="{{ asset($image->image) }}" class="img-responsive p-0" alt="Image" style="height: 150px;width: 90%;">
                                            </span>
                                            
                                        </div>
                                    @endforeach
                                @endif
                          </div>
                          <br>
                          <div class="form-group row">
                            <label for="images" class="col-sm-2 col-form-label">Files</label>
                            <div class="col-sm-10">
                              <input name="images[]" type="file" class="form-control" id="images" multiple="">
                            </div>
                          </div>
                          <br>
                          
                          <br>
                          <button type="submit" class="btn btn-info" style="background: #C40316;color: white;">Update Review</button>
                        </form>
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
    function beSure(id){
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
            axios.delete('/user/remove-review-image/'+id).then((response)=>{
                if(response.data.status == "success"){
                  $("#h_i").load(location.href + " #h_i");  
                }
            });
        }
        });

    }
    
</script>
@endpush