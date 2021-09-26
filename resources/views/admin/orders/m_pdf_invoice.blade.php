<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Page Title</title>

       <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style type="text/css">
            p{
                font-weight: 600;
            }
            h4{
                font-weight: bold;
            }
            .right{
                text-align: right;
            }
        </style>
    </head>
    <body>
       <div class="container-fluid mt-3">
           <div class="row">
               <div class="col-xs-6">
                   <img src="{{ asset('assets/common/images/logo1.png') }}">
               </div>
               <div class="col-xs-6">
                   <h4>Invoice : #{{ $order->invoice }}</h4>
               </div>
           </div>
           <hr>
           <div class="row">
               <div class="col-xs-4">
                   <h4><u>From</u></h4>
                   <p>
                        {{ $contact->company_name }} <br>
                        {{ $contact->mobile }} <br>
                        {{ $contact->email }} <br>
                        {{ $contact->address }}
                    </p>   
               </div>
               <div class="col-xs-4">
                   <h4><u>To</u></h4>
                   <p>
                        {{ $order->name }} <br>
                        {{ $order->mobile }} <br>
                        {{ $order->address }} <br>
                        {{ $order->city_town }},
                        {{ $order->district->name ?? '' }}
                    </p>
               </div>
               <div class="col-xs-4">
                   <img src="{{ asset('assets/common/qr-code/qr.jpg') }}">
               </div>
           </div>
           <hr>
           <div class="row">
               <div class="col-xs-12">
                   <table class="table table-sm table-bordered text-sm" width="100%">
                       <thead>
                           <tr>
                               <th>#</th>
                               <th>Item</th>
                               <th>Quantity</th>
                               <th>Price</th>
                           </tr>
                       </thead>
                       <tbody>
                            @foreach($order->products as $order_product)
                            <tr>
                                <td style="width: 10px;">{{ $loop->index + 1 }}</td>
                                <td style="width: 450px;">{{ $order_product->product->name }}</td>
                                <td style="width: 50px;text-align: center;">{{ $order_product->quantity }}</td>
                                <td style="width: 50px;text-align: center;">{{ $order_product->total_price }}</td>
                            </tr>
                            @endforeach
                       </tbody>
                   </table>
                   
               </div>
           </div>
           <div class="row">
               <div class="col-xs-6">
                    <p>Delivery Date:</p>
                    <p>Confirmation:</p>
               </div>
               <div class="col-xs-6">
                    <table width="100%">
                        <tr>
                            <th>Sub Total</th>
                            <th>:</th>
                            <th align="right">{{ $order->order_price }} BDT</th>
                        </tr>    
                        <tr>
                            <th>Delivery Charge</th>
                            <th>:</th>
                            <th align="right">{{ $order->delivery_charge }} BDT</th>
                        </tr>
                        <tr>
                            <th>Total Price</th>   
                            <th>:</th> 
                            <th align="right">{{ $order->order_price }} BDT</th>
                        </tr>
                        <tr>
                            <th>Paid</th>   
                            <th>:</th> 
                            <th align="right">{{ $order->paid_amount }} BDT</th>
                        </tr>
                        <tr>
                            <th>Due</th>   
                            <th>:</th> 
                            <th align="right">{{ $order->due_amount }} BDT</th>
                        </tr>
                    </table>
               </div>
           </div>
       </div>

       <!-- Latest compiled and minified JavaScript -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZh4w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</html>