@extends('layouts.app')
@section('title','Shopping Cart')
@push('css')

@endpush

@section('content')
 <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row">
        <div class="col-12">
             @if(Session::has('message'))
                <p class="alert alert-{{ Session::get('type') }}">{{ Session::get('message') }}</p>
            @endif 
            <p id="alert"></p>
            <div class="table-responsive" id="carts">
                @php
                    $carts = App\Model\Cart::with('product')->where('session_id',session()->get('session_id'))->get();
                @endphp
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col">Unit Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($carts as $cart)
                        <tr>
                            <td><img src="{{ asset('images/product/'.$cart->product->image) }}" style="height: 50px;widht: 50px;" /> </td>
                            <td>{{ $cart->product->product_name }}</td>
                            <td>{{ $cart->unit_price }}</td>
                            <td>
                                {{--  <a href="{{ route('decrement_cart_product',$cart->id) }}" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></a>  --}}
                                <button onclick="decrement({{ $cart->id }})" type="button" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></button>
                                <button class="btn btn-info btn-sm">{{ $cart->quantity }}</button>
                                <button onclick="increment({{ $cart->id }})" type="button" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></button>
                                {{--  <a href="{{ route('increment_cart_product',$cart->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>  --}}
                            </td>
                            <td>{{ $cart->total_price }}</td>
                            <td><button onclick="remove({{ $cart->id }})" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
                        </tr>
                        @endforeach
                        @php
                            $subTotal = 0;
                            foreach($carts as $cart){
                                $subTotal += $cart->total_price;
                            }
                            $totalPrice = $subTotal + 100;
                        @endphp
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Sub-Total</td>
                            <td class="text-right">{{ $subTotal }}</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Shipping</td>
                            <td class="text-right">100</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>Total</strong></td>
                            <td class="text-right"><strong>{{ $totalPrice }}</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <a href="{{ route('home') }}" class="btn btn-block btn-warning">Continue Shopping</a>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <a href="{{ route('checkout') }}" class="btn btn-lg btn-block btn-success text-uppercase">Checkout</a>
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

function getId(){
      var cart_id = $('#cart_id').val();
      return { cart_id : cart_id }
  }

  function increment(id){
    $.ajax({
    method : 'GET',
    url : "{{ url('increment_cart_product') }}"+'/'+ id,
    success : function(response){
        if(response.type == 'success'){
            $("#nav").load(location.href + " #nav");
            $("#carts").load(location.href + " #carts");
            //$('#alert').addClass('alert alert-success').text(response.message);
        } else if(response.type == 'danger') {
            $("#nav").load(location.href + " #nav");
            $("#carts").load(location.href + " #carts");
            //$('#alert').addClass('alert alert-danger').text(response.message);
        }
    }
    });
  }

  function decrement(id){
    $.ajax({
    method : 'GET',
    url : "{{ url('decrement_cart_product') }}"+'/'+ id,
    success : function(response){
        if(response.type == 'warning'){
            $("#nav").load(location.href + " #nav");
            $("#carts").load(location.href + " #carts");
            //$('#alert').addClass('alert alert-success').text(response.message);
        } else if(response.type == 'danger') {
            $("#nav").load(location.href + " #nav");
            $("#carts").load(location.href + " #carts");
            //$('#alert').addClass('alert alert-danger').text(response.message);
        }
    }
    });
  }

  function remove(id){
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
            $.ajax({
            method : 'GET',
            url : "{{ url('remove_cart_product') }}"+'/'+ id,
            success : function(response){
                if(response.type == 'danger') {
                    $("#nav").load(location.href + " #nav");
                    $("#carts").load(location.href + " #carts");
                    //$('#alert').addClass('alert alert-danger').text(response.message);
                }
            }
            });
        }
        })

  }
</script>
@endpush
