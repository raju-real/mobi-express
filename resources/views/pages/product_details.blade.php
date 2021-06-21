@extends('layouts.app')
@section('title', $product->product_name)
@push('css')
<style>
    .zoom {
  transition: transform .1s;
  margin: 0 auto;
}

.zoom:hover {
  -ms-transform: scale(1.5); /* IE 9 */
  -webkit-transform: scale(1.5); /* Safari 3-8 */
  transform: scale(1.5);
}
</style>
@endpush

@section('content')

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row">
            <div class="col-md-4">
                <img class="img-responsive zoom" src="{{ asset('images/product/'.$product->image) }}" alt="" style="width: 100%;height: 400px;">
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-7">
                {{--  @if(Session::has('message'))
                    <p class="alert alert-{{ Session::get('type') }}">{{ Session::get('message') }}</p>
                @endif  --}}
                <p id="alert"></p>
                <h2><u>{{ $product->product_name }}</u></h2>
                <p>
                    <span style="float: left;">From: {{ 'Demo Store' }}</span>
                    <span style="float: right;">{{ DB::table('orderproducts')->where('product_id',$product->id)->count() }} orders </span>
                </p>
                <br>
                <p>{!! $product->product_details !!}</p>
                <div class="row">
                    <div class="col-md-8">
                        <input type="hidden" id="product_id" name="product_id" value="{{ $product->id }}">
                        <input type="number" value="1" id="quantity" name="quantity" min="1" max="10" class="form-control">
                        <br>
                        <button type="button" class="btn btn-success" id="add_to_cart" onclick="addToCart()">Add To Cart</button>
                        <button type="button" onclick="addToFavorite()" class="btn btn-info">Add To Favorite</button>
                    </div>
                    <div class="col-md-4">

                    </div>
                </div>
            </div>
        </div>
      </div>
    </section><!-- End About Us Section -->

@endsection

@push('js')
<script type="text/javascript">
  $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

  function getInputs(){
      var product_id = $('#product_id').val();
      var quantity = $('#quantity').val();
      return { product_id : product_id,quantity : quantity }
  }

  function addToCart(){
    $.ajax({
    method : 'POST',
    url : "{{ route('add_to_cart') }}",
    data : getInputs(),
    dataType : 'JSON',
    success : function(response){
        if(response.type == 'success'){
            Swal.fire({
                text: response.message,
                icon: "success",
                button: "Ok",
            });
            $("#nav").load(location.href + " #nav");
            //$('#alert').addClass('alert alert-success').text(response.message);
        } else if(response.type == 'danger') {
            Swal.fire({
                text: response.message,
                icon: "error",
                button: "Ok",
            })
           // $('#alert').addClass('alert alert-danger').text(response.message);
        }

    }
    });
  }

  function addToFavorite(){
      $.ajax({
        method : 'POST',
        url : "{{ route('add_to_favorite') }}",
        data : {'product_id':$('#product_id').val()},
        dataType : 'JSON',
        success : function(response){
            if(response.type == 'success'){
            Swal.fire({
                text: response.message,
                icon: "success",
                button: "Ok",
            });
        } else if(response.type == 'error') {
            Swal.fire({
                text: response.message,
                icon: "error",
                button: "Ok",
            })
            //window.location.href = response.redirect;
           // $('#alert').addClass('alert alert-danger').text(response.message);
        }
        }
      });
  }
</script>
@endpush

