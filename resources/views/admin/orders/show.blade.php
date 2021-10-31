@extends('admin.layouts.app')
@section('title',$order->invoice)
@push('css')
<style>
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
	<div class="col-xl-12">
		<div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">
                    {{ 'Order Details' }}
                </div>
            </div>
            
            <div class="ibox-body">
            	<div class="col-md-12 table-responsive">
            		<table class="table table-bordered table-striped" width="100%">
					<thead>
						<tr>
							<th>Payment</th>
							<th>
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
							</th>
						</tr>
						<tr>
							<th>Invoice</th>
							<th>
								<a href="{{ route('admin.invoice',['invoice'=>$order->invoice]) }}">
									{{ $order->invoice }}
								</a>
							</th>
						</tr>
						<tr>
							<th>Action</th>
							<th>
								<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>1]) }}" 
								class="badge badge-primary {{ ($order->order_status == 1 || $order->order_status == 2 || $order->order_status == 3 || $order->order_status == 4 || $order->order_status == 5 || $order->order_status == 6 ) ? 'btn disabled' : '' }}">
									Process
								</a>
								<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>2]) }}" 
									class="badge badge-info {{ ($order->order_status == 0 || $order->order_status == 2 || $order->order_status == 3 || $order->order_status == 4) ? 'btn disabled' : '' }}">
									Picked
								</a>
								<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>3]) }}" 
									class="badge badge-info {{ ($order->order_status == 0  || $order->order_status == 3 || $order->order_status == 4) ? 'btn disabled' : '' }}">
									Shipped
								</a>
								<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>4]) }}" 
									class="badge badge-success {{ ($order->order_status == 0 || $order->order_status == 1  || $order->order_status == 4) ? 'btn disabled' : '' }}">
									Deliver
								</a>
								<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>5]) }}" class="badge badge-danger {{ $order->order_status == 4 ? 'btn disabled' : '' }}">
									Cancle
								</a>
								<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>6]) }}" class="badge badge-warning {{ $order->order_status == 3 ? 'btn disabled' : '' }}">
									Return
								</a>
							</th>
						</tr>
						<tr>
							<th>Status</th>
							<th>
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
							</th>
						</tr>
						<tr>
							<th>User</th>
							<th>modal view</th>
						</tr>
						<tr>
							<th>Price</th>
							<th>
								<div class="col-md-12 table-responsive">
									<table class="table table-sm table-bordered table-striped" width="100%">
										<tr class="table-primary">
											<th class="text-nowrap">
												Total Price
											</th>
											<th class="text-nowrap">
												Product Discount
											</th>
											<th class="text-nowrap">
												Coupon Discount
											</th>
											<th class="text-nowrap">
												Total Discount
											</th>
											<th class="text-nowrap">
												Delivery Charge
											</th>
											<th class="text-nowrap">
												Order Price
											</th>
											<th>
												Paid
											</th>
											<th>
												Due
											</th>
										</tr>
										<tr>
											<td>{{ $order->total_price }}</td>
											<td>
												{{ $order->product_discount_price }}
											</td>
											<td>
												{{ $order->coupon_discount_amount }}
											</td>
											<td>
												{{ $order->total_discount_amount }}
											</td>
											<td>{{ $order->delivery_charge }}</td>
											<td>{{ $order->order_price }}</td>
											<td>{{ $order->paid_amount }}</td>
											<td>{{ $order->due_amount }}</td>
										</tr>
								</table>
								</div>
							</th>
						</tr>
						<tr>
							<th class="text-nowrap">Customer Info</th>
							<th>
								<div class="col-md-12 table-responsive">
									<table class="table table-sm table-bordered table-striped" width="100%">
									<tr class="table-success">
										<th class="text-left">Name</th>
										<th class="text-left">Mobile</th>
										<th class="text-left">District</th>
										<th class="text-left text-nowrap">City/Town</th>
										<th class="text-left">Adress</th>
									</tr>
									<tr>
										<td>{{ $order->name }}</td>
										<td>{{ $order->mobile }}</td>
										<td>{{ $order->district->name ?? '' }}</td>
										<td>{{ $order->city_town }}</td>
										<td>{{ $order->address }}</td>
									</tr>
								</table>
								</div>
							</th>
						</tr>
						<tr>
							<th>Products</th>
							<th>
								<div class="col-md-12 table-responsive">
									<table class="table table-sm table-bordered table-striped" width="100%">
									<tr class="table-warning">
										<th class="text-left">Image</th>
										<th class="text-left">Name</th>
										<th class="text-left">Size</th>
										<th class="text-left">Color</th>
										<th class="text-left text-nowrap">Order Price</th>
										<th class="text-left">Quantity</th>
										<th class="text-left text-nowrap">Total Price</th>
									</tr>
									@foreach($order->products as $o_p)
                                        @if($o_p->product)
                                        	<tr>
	                                            <td>
	                                                <img 
	                                                src="{{ asset($o_p->product->image) }}"
	                                                class="img-responsive"
	                                                style="height: 50px;width: 50px;">
	                                            </td>
	                                            <td>
	                                                {{ $o_p->product->name }}
	                                            </td>
	                                            <td>
	                                            	{{ $o_p->size_id != null ? $o_p->size->name : 'None' }}
	                                            </td>
	                                            <td>
	                                            	{{ $o_p->color_id != null ? $o_p->color->name : 'None' }}
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
								</table>
								</div>
							</th>
						</tr>
						
					</thead>
				</table>
            	</div>
               	
            </div>
        </div>
	</div>
</div>
@endsection
