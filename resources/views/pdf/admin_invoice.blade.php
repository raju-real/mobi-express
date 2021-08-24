html:<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Invoice- {{ $order->invoice }}</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <style type="text/css">
            body {
                background-color: white;
            }

            .padding {
                padding: 2rem !important
            }

            .card {
                margin-bottom: 30px;
                border: none;
                -webkit-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
                -moz-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
                box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22)
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid #e6e6f2
            }

            h3 {
                font-size: 20px
            }

            h5 {
                font-size: 15px;
                line-height: 26px;
                color: #3d405c;
                margin: 0px 0px 15px 0px;
                font-family: 'Circular Std Medium'
            }

            .text-dark {
                color: #3d405c !important
            }
        </style>
    </head>
    <body>
         <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
     <div class="card">
         <div class="card-header p-4">
             <a class="pt-2 d-inline-block" data-abc="true">
                 <img src="{{ asset('assets/user/img/logo/demo_3.png') }}" height="45px">
             </a>
             <div class="float-right">
                 <h3 class="mb-0">Invoice #{{ $order->invoice }}</h3>
             </div>
         </div>
         @php
            $contact = App\Model\ContactUs::first();
         @endphp
         <div class="card-body">
             <div class="row mb-4">
                 <div class="col-sm-6">
                     <h5 class="mb-3">From:</h5>
                     <h3 class="text-dark mb-1">{{ $contact->company_name }}</h3>
                     <div>{{ $contact->address }}</div>
                     <div>Email: {{ $contact->email }}</div>
                     <div>Phone: {{ $contact->mobile }}</div>
                 </div>
                 <div class="col-sm-6 ">
                     <h5 class="mb-3">To:</h5>
                     <h3 class="text-dark mb-1">
                         {{ $order->user->name }}
                     </h3>
                     <div>{{ $order->address }}</div>
                     <div>
                         City/Town : {{ $order->city_town }},
                            {{ $order->district->name }}
                     </div>
                     <div>Phone: {{ $order->mobile }}</div>
                 </div>
             </div>
             <div class="table-responsive-sm">
                 <table class="table table-striped table-sm">
                     <thead>
                         <tr>
                             <th class="left">#</th>
                             <th class="left">Product</th>
                             <th class="left">Qty</th>
                             <th class="left">Total</th>
                         </tr>
                     </thead>
                     <tbody>
                        @foreach($order->products as $order_product)
                        <tr>
                             <td class="left">{{ $loop->index+1 }}</td>
                             <td class="left">
                                 {{ $order_product->product->name }}
                             </td>
                             <td class="left">
                                 {{ $order_product->quantity }}
                             </td>
                             <td class="left">
                                 {{ $order_product->total_price }}
                             </td>
                         </tr>
                        @endforeach
                     </tbody>
                 </table>
             </div>
             <div class="row">
                 <div class="col-lg-4 col-sm-5">
                 </div>
                 <div class="col-lg-4 col-sm-5 ml-auto">
                     <table class="table table-clear">
                         <tbody>
                             <tr>
                                 <td class="left">
                                     <strong class="text-dark">Total</strong> </td>
                                 <td class="right">
                                     <strong class="text-dark">
                                         {{ $order->order_price }} BDT
                                     </strong>
                                 </td>
                             </tr>
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>
         <div class="card-footer bg-white">
             <p class="mb-0">
                 Mobi Express
             </p>
         </div>
     </div>
 </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script></body>
</html>