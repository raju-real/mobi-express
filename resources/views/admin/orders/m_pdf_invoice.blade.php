<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Page Title</title>

       <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
       <div class="container-fluid mt-3">
           <div class="row">
               <div class="col-xs-6">
                   <img src="{{ asset('assets/common/images/logo1.png') }}">
               </div>
               <div class="col-xs-6">
                   <h4>Invoice : #MX254875</h4>
               </div>
           </div>
           <hr>
           <div class="row">
               <div class="col-xs-4">
                   <h2>From</h2>
                   <p>Mobi Xpress</p>
                   <p>12514651561</p>
                   <p>mobi@mail.com</p>
                   <p>Mohammadpur,Shomoly,Basabo-1203, Dhaka</p>
               </div>
               <div class="col-xs-4">
                   <h2>To</h2>
                   <p>Mobi Xpress</p>
                   <p>12514651561</p>
                   <p>mobi@mail.com</p>
                   <p>Mohammadpur,Shomoly,Basabo-1203, Dhaka</p>
               </div>
               <div class="col-xs-4">
                   <img src="{{ asset('assets/common/qr-code/qr.jpg') }}">
               </div>
           </div>
           <hr>
           <div class="row">
               <div class="col-xs-12">
                   <table class="table table-sm table-bordered" width="100%">
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
           <hr>
           <div class="row">
               <div class="col-xs-6">
                    <table class="table table-bordered" width="100%">
                            <tr>
                                <td>Delivery Date:</td>
                                <td>{{ $order->order_price }} BDT</td>
                            </tr>
                            <tr>
                                <td>User Co:</td>
                                <td>{{ $order->order_price }} BDT</td>
                            </tr>
                    </table>
               </div>
               <div class="col-xs-6">
                   <table class="table table-bordered">
                            <tr>
                                <td>Sub Total:</td>
                                <td>{{ $order->order_price }} BDT</td>
                            </tr>
                            <tr>
                                <td>Delivery Charge:</td>
                                <td>{{ $order->delivery_charge }} BDT</td>
                            </tr>
                            <tr>
                                <td>Total Price:</td>
                                <td>{{ $order->order_price }} BDT</td>
                            </tr>
                    </table>
               </div>
           </div>
       </div>

       <!-- Latest compiled and minified JavaScript -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</html>