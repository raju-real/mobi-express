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
    <div class="col-md-12 pb-3">
        <div class="ibox">
            <div class="ibox-body">
                <form action="{{ route('admin.orders') }}">
                    <input type="hidden" name="search" value="yes">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Invoice</label>
                                <input type="text" name="invoice" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="date_1">
                                <label class="font-normal">From Date</label>
                                <div class="input-group date">
                                    <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
                                    <input name="from_date" class="form-control" type="text" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="date_1">
                                <label class="font-normal">To Date</label>
                                <div class="input-group date">
                                    <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
                                    <input name="to_date" class="form-control" type="text" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label>Payment Method</label>
                            <select name="payment_method" class="form-control">
                                <option value="">Select</option>
                                <option value="1">Cash On Delivery</option>
                                <option value="3">Online Payment</option>
                                <option value="2">Voucher</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label>Payment Status</label>
                            <select name="payment_status" class="form-control">
                                <option value="">Select</option>
                                <option value="1">Payment Complete</option>
                                <option value="2">Payment Failed</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label>Order Status</label>
                            <select name="order_status" class="form-control">
                                <option value="">Select</option>
                                <option value="0">Pending</option>
                                <option value="1">Processing</option>
                                <option value="2">Picked</option>
                                <option value="3">Shipped</option>
                                <option value="4">Delivered</option>
                                <option value="5">Cancled</option>
                                <option value="6">Returned</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Mobile</label>
                                <input type="text" name="mobile" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>District</label>
                                <select name="district" class="form-control">
                                    <option value="{{ $shipping->district ?? '' }}">{{ $shipping->district_name->name ?? '' }}</option>
                                    @foreach($districts as $district)
                                        <option value="{{ $district->id }}">
                                            {{ $district->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>City/Town</label>
                                <input type="text" name="city_town" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group mt-2">
                                <label></label>
                                <button type="submit" class="pointer btn btn-md btn-info btn-block ">Search</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<div class="col-xl-12">
		<div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">
                    {{ $title }}
                </div>
                <div class="ibox-title">
                    <a href="{{ route('admin.orders') }}" class="badge badge-danger pull-right">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
                {{-- <div class="ibox-title">
                    <form class="sort-form" action="#">
                        <div class="selector">
                            <select class="form-control" onchange="top.location.href = this.options[this.selectedIndex].value">
                               @for($i=15;$i <= 100;$i+=10)
                                <option value="{{ route('admin.'.$route, ['limit'=>$i]) }}">
                                    {{ $i }}
                                </option>
                                @endfor
                            </select>
                        </div>
                    </form>
                </div> --}}
            </div>
            
            <div class="ibox-body">
                <table class="table table-responsive text-nowrap table-striped table-bordered table-hover text-left" id="order-table" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Order Date</th>
                            <th class="text-left">Invoice</th>
                            <th class="text-left">Order Status</th>
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
                            <th class="text-left">Order Status</th>
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
                            <td>{{ $order->created_at->format('d-m-y') }}</td>
                            <td>{{ $order->invoice }}</td>
                            <td>
                                @if($order->order_status == 0)
                                    <span class="badge badge-warning">Pending</span>
                                @elseif($order->order_status == 1)
                                    <span class="badge badge-primary">Processing</span>
                                @elseif($order->order_status == 2)
                                    <span class="badge badge-info">Picked</span>
                                @elseif($order->order_status == 3)
                                    <span class="badge badge-success">Shipped</span>
                                @elseif($order->order_status == 4)
                                    <span class="badge badge-success">Delivered</span>

                                @elseif($order->order_status == 5)
                                    <span class="badge badge-danger">Cancled</span> 
                                @elseif($order->order_status == 6)
                                    <span class="badge badge-warning">Returned</span>   
                                @else 
                                    <span class="badge badge-secendary">Un known</span>
                                @endif
                            </td>
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
                {{-- {{ $orders->links() }} --}}
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