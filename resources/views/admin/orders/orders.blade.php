@extends('admin.layouts.app')
@section('title',$title)

@push('css')
<style>
    @media screen and (min-width: 676px) {
        .modal-dialog {
          max-width: fit-content; /* New width for default modal */
        }
    }
    .online{
        border: 1.5px solid green;
        border-radius: 10px;
        padding: 2px 10px;
    }
    .cash{
        border: 1.5px solid blue;
        border-radius: 10px;
        padding: 2px 10px;
    }
    .fail{
        border: 1.5px solid red;
        border-radius: 10px;
        padding: 2px 10px;
    }
</style>
@endpush

@section('content')
<div class="row">
    <div class="col-md-8 offset-md-2 pb-3">
        <form action="{{ route('admin.search-order') }}">
            <div class="input-group">
                <input name="query" type="search" class="form-control form-control-lg" placeholder="Invoice/Mobile">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-lg btn-default">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
	<div class="col-xl-12">
		<div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">
                    {{ $title }}
                </div>
                <div class="ibox-title">
                    {{-- <form class="sort-form" action="#">
                        <div class="selector">
                            <select class="form-control" onchange="top.location.href = this.options[this.selectedIndex].value">
                               @for($i=15;$i <= 100;$i+=10)
                                <option value="{{ route('admin.'.$route, ['limit'=>$i]) }}">
                                    {{ $i }}
                                </option>
                                @endfor
                            </select>
                        </div>
                    </form> --}}
                </div>
            </div>
            
            <div class="ibox-body">
                <table class="table table-responsive text-nowrap table-striped table-bordered table-hover text-left" id="order-table" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Order Date</th>
                            <th class="text-left">Invoice</th>
                            <th class="text-left">Payment</th>
                            <th class="text-left">Mobile</th>
                            <th class="text-left">Products</th>
                            <th class="text-left">Order Price</th>
                            {{-- <th>Order Status</th> --}}
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Order Date</th>
                            <th class="text-left">Invoice</th>
                            <th class="text-left">Payment</th>
                            <th class="text-left">Mobile</th>
                            <th class="text-left">Products</th>
                            <th class="text-left">Order Price</th>
                            {{-- <th>Order Status</th> --}}
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    	@foreach($orders as $order)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $order->updated_at->format('D, M y') }}</td>
                            <td>{{ $order->invoice }}</td>
                            <td>
                                @if($order->payment_method == 1) 
                                    <span class="cash">
                                            {{ 'Cash On Delivery' }}
                                        </span>
                                    @elseif($order->payment_method == 3) 
                                        @if($order->payment_status == 1)
                                        <span class="online">
                                            {{ 'Online Payment' }}
                                        </span>
                                        @elseif($order->payment_status == 2)
                                        <span class="fail">Payment Failed</span>    
                                        <a href="#" style="color: blue;">
                                            Action
                                        </a>
                                        @endif                  
                                @endif
                            </td>
                            <td>{{ $order->mobile }}</td>
                            <td>
                                {{ $order->products->count() }}
                                <!-- Button trigger modal -->
                                <a type="button" class="badge badge-primary" data-toggle="modal" data-target="#products-{{ $order->id }}">
                                  <i class="fa fa-info-circle"></i>
                                </a>

                                <!-- Modal -->
                                <div class="modal fade" id="products-{{ $order->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Products</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <table class="table table-striped table-responsive text-nowrap table-sm">
                                            <thead>
                                                <tr>
                                                    <th>Image</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($order->products as $o_p)
                                                    @if($o_p->product)
                                                        <tr>
                                                            <td>
                                                                <img 
                                                                src="{{ asset($o_p->product->image) }}"
                                                                class="img-responsive"
                                                                style="height: 80px;width: 80px;">
                                                            </td>
                                                            <td>
                                                                {{ $o_p->product->name }}
                                                            </td>
                                                           
                                                            <td>
                                                                {{ $o_p->order_price }}
                                                            </td>
                                                            <td>
                                                                {{ $o_p->quantity }}
                                                            </td>
                                                            <td>
                                                                {{ $o_p->total_price }}
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
                            </td>
                            <td>{{ $order->order_price }}</td>
                            {{-- <td>{{ $order->order_status }}</td> --}}
                            <td>
                            	<a href="{{ route('admin.order.show',['invoice'=>$order->invoice]) }}" class="badge badge-info">
                            		<i class="fa fa-eye"></i>
                            	</a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                {{ $orders->links() }}
            </div>
        </div>
	</div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(function() {
        $('#order-table').DataTable({
            pageLength: 10,
            paging: false,
            searching: false,
            info: false
           
        });
    })
</script>

    
@endpush