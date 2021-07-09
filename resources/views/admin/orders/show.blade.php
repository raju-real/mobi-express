@extends('admin.layouts.app')
@section('title',$order->invoice)

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
               <table class="table table-responsive table-bordered table-hover text-nowrap" style="width: 100%;">
						<thead>
							<tr>
								<th>Action</th>
								<th>
									<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>1]) }}" 
									class="badge badge-primary {{ ($order->order_status == 1 || $order->order_status == 2 || $order->order_status == 3 ) ? 'btn disabled' : '' }}">
										Receive
									</a>
									<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>2]) }}" 
										class="badge badge-info {{ ($order->order_status == 0 || $order->order_status == 2 || $order->order_status == 3 || $order->order_status == 4) ? 'btn disabled' : '' }}">
										Process
									</a>
									<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>3]) }}" 
										class="badge badge-success {{ ($order->order_status == 0 || $order->order_status == 1 || $order->order_status == 3 || $order->order_status == 4) ? 'btn disabled' : '' }}">
										Deliver
									</a>
									<a href="{{ route('admin.change-status',['invoice'=>$order->invoice,'order_status'=>4]) }}" class="badge badge-danger {{ $order->order_status == 3 ? 'btn disabled' : '' }}">
										Cancle
									</a>
								</th>
							</tr>
							<tr>
								<th>Status</th>
								<th>
									@if($order->order_status == 0)
										<span class="badge badge-warning">Pending</span>
									@elseif($order->order_status == 1)
										<span class="badge badge-primary">Received</span>
									@elseif($order->order_status == 2)
										<span class="badge badge-info">Processing</span>
									@elseif($order->order_status == 3)
										<span class="badge badge-success">Delivered</span>
									@elseif($order->order_status == 4)
										<span class="badge badge-danger">Cancled</span>	
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
								<th>Invoice</th>
								<th>{{ $order->invoice }}</th>
							</tr>
							<tr>
								<th>Price</th>
								<th>
									<table class="table table-info table-bordered table-sm table-responsive text-nowrap text-center">
										<tr class="table-primary">
											<th class="text-center">
												Total Price
											</th>
											<th class="text-center">
												Product Discount
											</th>
											<th class="text-center">
												Coupon Discount
											</th>
											<th class="text-center">
												Total Discount
											</th>
											<th class="text-center">
												Delivery Charge
											</th>
											<th class="text-center">
												Order Price
											</th>
											<th class="text-center">
												Paid
											</th>
											<th class="text-center">
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
								</th>
							</tr>
							<tr>
								<th>Customer Info</th>
								<th>
									<table class="table table-striped table-bordered table-sm table-responsive text-nowrap text-center">
										<tr class="table-success">
											<th class="text-center">Name</th>
											<th class="text-center">Mobile</th>
											<th class="text-center">District</th>
											<th class="text-center">City/Town</th>
											<th class="text-center">Adress</th>
										</tr>
										<tr>
											<td>{{ $order->name }}</td>
											<td>{{ $order->mobile }}</td>
											<td>{{ $order->district }}</td>
											<td>{{ $order->city_town }}</td>
											<td>{{ $order->address }}</td>
										</tr>
									</table>
								</th>
							</tr>
							<tr>
								<th>Products</th>
								<th>
									<table class="table table-striped table-bordered table-sm table-responsive text-nowrap text-center">
										<tr class="table-warning">
											<th class="text-center">Image</th>
											<th class="text-center">Name</th>
											<th class="text-center">Order Price</th>
											<th class="text-center">Quantity</th>
											<th class="text-center">Total Price</th>
										</tr>
										@foreach($order->products as $o_p)
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
	                                                {{ $o_p->order_price }}
	                                            </td>
	                                            <td>
	                                                {{ $o_p->quantity }}
	                                            </td>
	                                            <td>
	                                                {{ $o_p->total_price }}
	                                            </td>
	                                        </tr>
                                        @endforeach
									</table>
								</th>
							</tr>
							<tr>
								<th>Payment</th>
								<th>
									@if($order->payment_method === 1)
										{{ 'Cash On Delivery' }}
									@else
									<table class="table table-striped table-bordered table-sm table-responsive text-nowrap text-center">
										<tr class="table-warning">
											<th class="text-center">
												Payment Method
											</th>
											<th class="text-center">
												Transaction Id
											</th>
											<th class="text-center">
												Paid Amount
											</th>
											<th class="text-center">Due Amount</th>
										</tr>
										<tr>
											
										</tr>
									</table>
									@endif
								</th>
							</tr>
						</thead>
					</table>
            </div>
        </div>
	</div>
</div>
@endsection
