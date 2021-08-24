@extends('admin.layouts.app')
@section('title','Invoice', $order->invoice)

@section('content')
@php
	$contact = App\Model\ContactUs::first();
@endphp
<div class="page-heading">
    <h1 class="page-title">Invoice</h1>
</div>
<div class="page-content fade-in-up">
    <div class="ibox invoice">
        <div class="invoice-header">
            <div class="row">
                <div class="col-6">
                    <div class="invoice-logo">
                        <img src="{{ asset('assets/user/img/logo/demo_3.png') }}" height="65px" />
                    </div>
                    <div>
                        <table style="float: left;">
                     		<tr>
                     			<th>From</th>
                     		</tr>
                     		<tr>
                     			<th>Name</th>
                     			<th> : {{ $contact->company_name }}</th>
                     		</tr>
                     		<tr>
                     			<th>Mobile</th>
                     			<th> : {{ $contact->mobile }}</th>
                     		</tr>
                     		<tr>
                     			<th>Address</th>
                     			<th> : {{ $contact->address }}</th>
                     		</tr>
                     		<tr>
                     			<th>Address</th>
                     			<th> : {{ $contact->address }}</th>
                     		</tr>
                        </table>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <div class="clf" style="margin-bottom:30px;">
                        <dl class="row pull-right" style="width:250px;">
                        	<dt class="col-sm-12">
                        		Invoice : {{ $order->invoice }}
                        	</dt>
                        </dl>
                    </div>
                    <div>
                        <ul class="list-unstyled m-t-10">
                            <table style="float: right;">
                         		<tr>
                         			<th>To</th>
                         		</tr>
                         		<tr>
                         			<th>Name</th>
                         			<th> : {{ $order->user->name }}</th>
                         		</tr>
                         		<tr>
                         			<th>Mobile</th>
                         			<th> : {{ $order->user->mobile }}</th>
                         		</tr>
                         		<tr>
                         			<th>Address</th>
                         			<th> : {{ $order->address }}</th>
                         		</tr>
                         		<tr>
                         			<th>City/Town</th>
                         			<th> : 
                         				{{ $order->city_town }},
                         				{{ $order->district->name }}
                         			</th>
                         		</tr>
                            </table>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <table class="table no-margin table-invoice">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
            	@foreach($order->products as $order_product)
                <tr>
                    <td>{{ $order_product->product->name }}</td>
                    <td>{{ $order_product->quantity }}</td>
                    <td>{{ $order_product->total_price }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
        <table class="table no-border">
            <thead>
                <tr>
                    <th></th>
                    <th width="15%"></th>
                </tr>
            </thead>
            <tbody>
                <tr class="text-right">
                    <td>Total Price:</td>
                    <td>{{ $order->order_price }} BDT</td>
                </tr>
            </tbody>
        </table>
    </div>
    <style>
        .invoice {
            padding: 20px
        }

        .invoice-header {
            margin-bottom: 50px
        }

        .invoice-logo {
            margin-bottom: 50px;
        }

        .table-invoice tr td:last-child {
            text-align: right;
        }
    </style>
   
</div>
@endsection

@push('js')
@endpush