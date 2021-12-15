<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Invoice</title>
    <style>
        body {
            font-family: 'bangla', sans-serif;
        }

        .clearfix:after {
        content: "";
        display: table;
        clear: both;
        }

        a {
        color: #0087C3;
        text-decoration: none;
        }

        body {
        position: relative;
        width: 21cm;
        height: 29.7cm;
        margin: 0 auto;
        color: black;
        background: #FFFFFF;
        font-size: 12px;
        }

        header {
        width: 100%;
        margin-bottom: 8px;
        border-bottom: 1px solid #AAAAAA;
        }

        #logo {
        float: left;
        margin-top: 8px;
        }

        #logo img {
        height: 70px;
        }

        #info h2{
            display: table-cell;
            color: black;
            padding-top: 5px;
            font-weight: bold;
        }

        table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        margin-bottom: 20px;
        }

        table th,
        table td {
        padding: 10px;
        background: #EEEEEE;
        text-align: left;
        border-bottom: 1px solid #FFFFFF;
        font-weight: bold;
        }

        table th {
        white-space: nowrap;
        font-weight: normal;
        }

        table td {
        text-align: left;
        }

        table td h3{
        color: #57B223;
        font-size: 1.2em;
        font-weight: normal;
        margin: 0 0 0.2em 0;
        }

        table .no {
        color: #FFFFFF;
        font-size: 1.6em;
        background: #57B223;
        }

        table .desc {
        text-align: left;
        font-weight: normal;
        color: black;
        }

        table .unit {
        background: #DDDDDD;
        font-weight: normal;
        color: black;
        }

        table .qty {
        }

        table .total {
        background: #57B223;
        color: #FFFFFF;
        }

        table td.unit,
        table td.qty,
        table td.total {
        font-size: 1.2em;
        }

        table tbody tr:last-child td {
        border: none;
        }

        table tfoot td {
        padding: 10px 20px;
        background: #FFFFFF;
        border-bottom: none;
        font-size: 1.2em;
        white-space: nowrap;
        border-top: 1px solid #AAAAAA;
        }

        table tfoot tr:first-child td {
        border-top: none;
        }

        table tfoot tr:last-child td {
        color: #57B223;
        font-size: 1.8em;
        border-top: 1px solid #57B223;

        }

        table tfoot tr td:first-child {
        border: none;
        }
        #tour{
            margin-left: 151px;
            font-weight: bold;
        }

        .bg-white{
            background: white;
        }

    </style>
  </head>
  <body>
    <header class="clearfix" style="border-bottom: 1px solid #AAAAAA;">
        <table border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 0px;">
        <thead>
            <tr>
                <th style="background: white;padding: 0px;">
                    <img src="{{ url('assets/common/images/logo2.png') }}" style="width: 100px;" class="main-logo">
                </th>
                <th style="background: white;padding: 0px;text-align: right;">
                    <h2>Invoice: #{{ $order->invoice }}</h2>
                </th>
            </tr>
        </thead>
    </table>
    </header>
    <main>
        <table border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 0px;">
            <thead>
                <tr>
                    <th style="background: white;text-align: left;vertical-align: baseline;">
                        <h2>From</h2>
                        <p>
                            <span>{{ $contact->company_name }}</span> <br>
                            <span>{{ $contact->mobile }}</span> <br>
                            <span>{{ $contact->email ?? '' }}</span> <br>
                            <span>{{ $contact->address ?? '' }}</span>
                        </p>
                    </th>
                    <th style="background: white;text-align: left;vertical-align: baseline;">
                        <h2>To</h2>
                        <p>
                            <span>{{ $order->user->name ?? '' }}</span> <br>
                            <span>{{ $order->mobile ?? '' }}</span> <br>
                            <span>
                                {{ $order->city_town }},
                                {{ $order->district->name }}
                            </span> <br>
                            <span>{{ $order->address ?? '' }}</span> <br>
                        </p>
                    </th>
                    {{-- <th style="background: white;text-align: right;">
                        <img src="{{ asset('assets/common/qr-code/qr.jpg') }}" >
                    </th> --}}
                </tr>
                
            </thead>
        </table>   
        <table border="0" cellspacing="0" cellpadding="0" style="border-bottom: 1px solid #AAAAAA;">
            <thead>
            <tr style="font-weight: bold;">
                <th class="unit" style="font-weight: bold;border-right: 1px solid white;">
                    Sl.no
                </th>
                <th class="unit" style="font-weight: bold;border-right: 1px solid white;">
                    Product
                </th>
                <th class="unit" style="font-weight: bold;border-right: 1px solid white;">
                    Price
                </th>
                <th class="unit" style="font-weight: bold;border-right: 1px solid white;">
                    Quantity
                </th>
                <th class="unit" style="font-weight: bold;border-right: 1px solid white;">
                    Total Price
                </th>
            </tr>
            </thead>
            <tbody>
                @foreach($order->products as $order_product)
                <tr>
                    <td class="desc" style="font-weight: bold;border-right: 1px solid whitesmoke;background: white;white-space: nowrap;">
                        {{ $loop->index + 1 }} 
                    </td>
                    <td class="desc" style="font-weight: bold;border-right: 1px solid whitesmoke;background: white;white-space: nowrap;">
                        {{ $order_product->product->name }} 
                    </td>
                    <td class="desc" style="font-weight: bold;border-right: 1px solid whitesmoke;background: white;white-space: nowrap;">
                        {{ $order_product->order_price }} 
                    </td>
                    <td class="desc" style="font-weight: bold;border-right: 1px solid whitesmoke;background: white;white-space: nowrap;">
                        {{ $order_product->quantity }} 
                    </td>
                    <td class="desc" style="font-weight: bold;border-right: 1px solid whitesmoke;background: white;white-space: nowrap;">
                        {{ $order_product->total_price }} BDT
                    </td>

                </tr>
                @endforeach
                {{-- <tr>
                    <td colspan="3" align="right" width="30%">Sub Total</td>
                    <td align="left" style="background: white;">{{ $order->total_price - 45 }} BDT</td>
                </tr> --}}
            </tbody>
        </table>
        
        <table border="0" cellspacing="0" cellpadding="0" style="border-bottom: 1px solid #AAAAAA;width: 40%;" align="right">
            <tr>
                <th class="unit">Sub Total</th>
                <th class="desc">
                    {{ $order->total_price }} BDT
                </th>
            </tr>
            <tr>
                <th class="unit">Delevery Charge</th>
                <th class="desc">
                    {{ $order->delivery_charge }} BDT
                </th>
            </tr>
            <tr>
                <th class="unit">Total Price</th>
                <th class="desc">
                    {{ $order->order_price }} BDT
                </th>
            </tr>
            <tr>
                <th class="unit">Payment Method</th>
                <th class="desc">
                    @if($order->payment_method == 1)
                        {{ 'Cash On Delivery' }} 
                    @elseif($order->payment_method == 2)    
                        {{ 'Voucher' }}
                    @elseif($order->payment_method == 3)    
                        {{ 'Online Payment' }}
                    @endif    
                </th>
            </tr>
            @if($order->payment_method == 2 || $order->payment_method == 3)
                <tr>
                    <th class="unit">Paid</th>
                    <th class="desc">
                        {{ $order->paid_amount }} BDT
                    </th>
                </tr>
                <tr>
                    <th class="unit">Due</th>
                    <th class="desc">
                        {{ $order->due_amount }} BDT
                    </th>
                </tr>
            @endif
            
        </table>    
        <table>
            <tr>
                <td style="background: white;">Dear Sir / Madam,</td>
            </tr>
            <tr>
                <td style="background: white;text-align: justify;">
                    We would like to thank you for choosing Mobi Xpress as your shopping partner, we are very glad to have you as our
                    customer and very happy to serve you. We always try our best to enhance your online Shopping experience. 
                </td>
            </tr>
            <tr>
                <td style="background: white;text-align: justify;">
                    Hope we satisfied you by our service. It will be much apricate if you share your valuable feedback with us here
                    https://www.facebook.com/groups/217295359843719/
                </td>
            </tr>
            <tr>
                <td style="background: white;text-align: justify;">
                    Hope to see you soon.
                </td>
            </tr>
            <tr>
                <td style="background: white;text-align: justify;">
                    Regards <br>
                    Team Mobi Xpress <br>
                    Mobile: 01601133517 <br>
                    Web: mobixpress.com.bd <br>
                    FB: https://www.facebook.com/mblxpress
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td style="background: white;text-align: justify;">
                    Conditions for Returns
                </td>
            </tr>
            <tr>
                <td style="background: white;text-align: justify;">
                    1. The product must be unused, unworn, unwashed and without any flaws. Fashion products can be tried on to see if they fit and will still be considered unworn
                    <br>
                    <br>
                    
                    2. The product must include the original tags, user manual, warranty cards, freebies and accessories
                    <br>
                    <br>
                    3. The product must be returned in the original and undamaged manufacturer packaging / box. If the product was delivered
                    in a second layer of Mobi Xpress packaging, it must be returned in the same condition with return shipping label attached.
                    Do not put tape or stickers on the manufacturers box.
                </td>
            </tr>
        </table>
    </main>

  </body>
</html>
