@extends('admin.layouts.app')
@section('title','Invoice'.'-'.$order->invoice)

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">
                    {{ $order->invoice }}
                </div>
                <div class="ibox-title">
                    <button type="button" class="btn btn-info btn-sm pull-right" onclick="printDiv('invoice')">
                        Download
                    </button>
                </div>
            </div>
            
            <div class="ibox-body" id="invoice">
                <div class="row">
                    <div class="col-md-6">
                        <img src="{{ asset('assets/user/img/logo/demo_2.png') }}" class="img-fluid img-thumbnail" alt="Responsive image" style="height: 45px;">
                    </div>
                    <div class="col-md-6 text-right">
                        <h4>Invoice: #{{ $order->invoice }}</h4>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-4">
                        <h6>From</h6>
                        <table class="table table-bordered table-sm">
                            @php
                                $contact = App\Model\ContactUs::first();
                            @endphp
                            <tr>
                                <th>{{ $contact->company_name }}</th>
                            </tr>
                            <tr>
                                <th>{{ $contact->mobile }}</th>
                            </tr>
                            @if($contact->email != null)
                            <tr>
                                <th>{{ $contact->email }}</th>
                            </tr>
                            @endif
                            <tr>
                                <th>{{ $contact->address }}</th>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-4">
                        <h6>To</h6>
                        <table class="table table-bordered table-sm">
                            <tr>
                                <th>{{ $order->user->name }}</th>
                            </tr>
                            <tr>
                                <th>{{ $order->mobile }}</th>
                            </tr>
                            <tr>
                                <th>{{ $order->address }}</th>
                            </tr>
                            <tr>
                                <th>
                                    {{ $order->city_town }},
                                    {{ $order->district->name }}
                                </th>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-4">
                        <img src="{{ asset('assets/common/qr-code/qr.jpg') }}" style="float: right;">
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <h5>Products</h5>
                        <table class="table table-bordered table-sm">
                            <thead>
                                <tr>
                                    <th class="text-center">Sl.no</th>
                                    <th class="text-left">Product</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-center">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($order->products as $order_product)
                                <tr>
                                    <td class="text-center">
                                        {{ $loop->index + 1 }}
                                    </td>
                                    <td>
                                        {{ $order_product->product->name }}
                                    </td>
                                    <td class="text-center">
                                        {{ $order_product->quantity }}
                                    </td>
                                    <td class="text-center">
                                        {{ $order_product->total_price }} BDT
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-4">
                        <h5>User Confirmation</h5><hr>
                    </div>
                    <div class="col-md-4">
                        <h5>Approved By</h5><hr>
                    </div>
                    <div class="col-md-4">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td>Sub Total</td>
                                    <td>{{ $order->total_price }} BDT</td>
                                </tr>
                                <tr>
                                    <td>Delivery Charge</td>
                                    <td>{{ $order->delivery_charge }} BDT</td>
                                </tr>
                                <tr>
                                    <td>Total</td>
                                    <td>{{ $order->total_price }} BDT</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script type="text/javascript">
        if(document.location.hostname == 'pratikborsadiya.in') {
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
            ga('create', 'UA-72504830-1', 'auto');
            ga('send', 'pageview');
        }
    </script>

    <script>
        function printDiv(printme){
            var printContents = document.getElementById(printme).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
@endpush