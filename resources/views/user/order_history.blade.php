@extends('layouts.app')
@section('title', 'Order History')
@push('css')

@endpush

@section('content')
    <section id="about" class="about">
      <div class="container">

        <div class="row">
            <div class="col-md-3">
                <div class="list-group">
                    @include('user.menus')
                </div>
            </div>
            <div class="col-md-9">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Sl.No</th>
                            <th>Invoice</th>
                            <th>Price</th>
                            <th>Products</th>
                            <th>Payment</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($orders as $order)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $order->invoice }}</td>
                            <td>{{ $order->total_price }}</td>
                            <td>{{ $order->products->count() }}</td>
                            <td>
                                {{ $order->payment_status }}
                                <form action="{{ route('user.pay') }}" method="POST" role="form">
                                    @csrf
                                    <input type="hidden" name="order_id" value="{{ $order->id }}">
                                    <button type="submit" class="btn btn-primary">Pay</button>
                                </form>
                            </td>
                            <td>{{ $order->order_status }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
      </div>
    </section><!-- End About Us Section -->

@endsection

@push('js')
<script>
    function takePermission(){
        confirm('Are you suer');
        document.getElementById('category-delete').submit();
    }
</script>
@endpush

