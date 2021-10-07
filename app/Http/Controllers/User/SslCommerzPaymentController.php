<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Library\SslCommerz\SslCommerzNotification;
use App\Model\BillingAddress;
use App\Model\ContactUs;
use App\Model\Order;
use App\Model\SslCommerzTransaction as Transaction;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;

class SslCommerzPaymentController extends Controller
{

    public function exampleEasyCheckout()
    {
        return view('exampleEasycheckout');
    }

    public function exampleHostedCheckout()
    {
        return view('exampleHosted');
    }

    public function payHere(){
        try {
            if(Auth::check()){
                $invoice = request()->get('invoice');
                $order = Order::where('invoice',$invoice)->first();
                $billing = BillingAddress::with('district_name')->where('user_id',Auth::id())->first();
                if (isset($order)) {
                    return view('user.profile.select_payment',compact('order','billing'));
                } else{
                    Alert::error('Invalid Invoice');
                    return redirect()->route('user.order-history');
                }
            } else{
                return redirect()->route('login');
            }
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function index(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'mobile' => 'required|min:11',
            'city_town' => 'required',
            'payment_type' => 'required'
        ]);
        try{
            $invoice = request()->get('invoice');
            $order = Order::where('invoice',$invoice)->first();
            if(Order::where('invoice',$invoice)->exists()){
                $contact = ContactUs::first();
                $post_data = array();
                $payment_type = $request->payment_type;
                $post_data['total_amount'] = Order::getPaymentAmount($invoice,$payment_type);
                $post_data['currency'] = "BDT";
                $post_data['tran_id'] = uniqid(); // tran_id must be unique

                # CUSTOMER INFORMATION
                $post_data['cus_name'] = $request->name ?? 'Customer Name';
                $post_data['cus_email'] = $request->email ??'customer@mail.com';
                $post_data['cus_add1'] = $request->address ?? $contact->address;
                $post_data['cus_add2'] = $request->address ?? $contact->address;;
                $post_data['cus_city'] = $request->city_town ?? 'Dhaka';
                $post_data['cus_state'] = $request->city_town ?? 'Dhaka';
                $post_data['cus_postcode'] = "";
                $post_data['cus_country'] = "Bangladesh";
                $post_data['cus_phone'] = $request->mobile ?? $contact->mobile;
                $post_data['cus_fax'] = "";

                # SHIPMENT INFORMATION
                $post_data['ship_name'] = "Store Test";
                $post_data['ship_add1'] = "Dhaka";
                $post_data['ship_add2'] = "Dhaka";
                $post_data['ship_city'] = "Dhaka";
                $post_data['ship_state'] = "Dhaka";
                $post_data['ship_postcode'] = "1000";
                $post_data['ship_phone'] = "";
                $post_data['ship_country'] = "Bangladesh";

                $post_data['shipping_method'] = "NO";
                $post_data['product_name'] = "Computer";
                $post_data['product_category'] = "Goods";
                $post_data['product_profile'] = "physical-goods";

                # OPTIONAL PARAMETERS
                $post_data['value_a'] = "ref001";
                $post_data['value_b'] = "ref002";
                $post_data['value_c'] = "ref003";
                $post_data['value_d'] = "ref004";

                #Before  going to initiate the payment order status need to insert or update as Pending.
                // if(Transaction::where('invoice',$order->invoice)->where('status','!=','Pending')->exists()){
                //     return redirect()->route('pay-here',['invoice'=>$order->invoice])
                //     ->with('message','One order support one transaction');
                // } else {
                //     $identify = [
                //         'invoice' => $order->invoice,
                //         'transaction_id' => $post_data['tran_id'],
                //         'user_id' => Auth::id()
                //     ];
                //     $data = [
                //         'user_id' => Auth::id(),
                //         'order_id' => $order->id,
                //         'order_number' => $order->order_number,
                //         'invoice' => $order->invoice,
                //         'transaction_id' => $post_data['tran_id'],
                //         'transaction_time' => Carbon::now(),
                //         'transaction_ip' => '125896',
                //         'transaction_amount' => $post_data['total_amount'],
                //         'status' => 'Pending',
                //         'address' => $request->address,
                //         'currency' => $post_data['currency']
                //     ];
                //     Transaction::updateOrInsert($identify,$data);
                // }

                $identify = [
                        'invoice' => $order->invoice,
                        'user_id' => Auth::id()
                    ];
                    $data = [
                        'user_id' => Auth::id(),
                        'order_id' => $order->id,
                        'order_number' => $order->order_number,
                        'invoice' => $order->invoice,
                        'transaction_id' => $post_data['tran_id'],
                        'transaction_time' => Carbon::now(),
                        'transaction_ip' => '125896',
                        'transaction_amount' => $post_data['total_amount'],
                        'status' => 'Pending',
                        'address' => $request->address,
                        'currency' => $post_data['currency']
                    ];
                    Transaction::updateOrInsert($identify,$data);

                $sslc = new SslCommerzNotification();
                # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
                $payment_options = $sslc->makePayment($post_data, 'hosted');

                if (!is_array($payment_options)) {
                    print_r($payment_options);
                    $payment_options = array();
                }
            }else{
                Alert::error('Invalid Invoice Number');
                return redirect()->back();
            }

        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function success(Request $request)
    {
        //dd($request->all());
        $message = "";
        $message = "";

        $tran_id = $request->input('tran_id');
        $amount = $request->input('amount');
        $currency = $request->input('currency');

        $sslc = new SslCommerzNotification();

        #Check order status in order tabel against the transaction id or order id.
        $transaction = Transaction::where('transaction_id', $tran_id)
            ->select('transaction_id', 'status', 'currency', 'transaction_amount')->first();

        if ($transaction->status == 'Pending') {
            $validation = $sslc->orderValidate($request->all(), $tran_id, $amount, $currency);

            if ($validation == TRUE) {
                /*
                That means IPN did not work or IPN URL was not set in your merchant panel. Here you need to update order status
                in order table as Processing or Complete.
                Here you can also sent sms or email for successfull transaction to customer
                */
                Transaction::where('transaction_id', $tran_id)
                    ->update([
                        'status' => 'Complete',
                        'val_id' => $request->input('val_id'),
                        'card_type' => $request->input('card_type'),
                        'store_amount' => $request->input('store_amount'),
                        'card_no' => $request->input('card_no'),
                        'bank_tran_id' => $request->input('bank_tran_id'),
                        'transaction_time' => $request->input('tran_date'),
                        'error' => $request->input('error'),
                        'currency' => $request->input('currency'),
                        'card_issuer' => $request->input('card_issuer'),
                        'card_brand' => $request->input('card_brand'),
                        'card_sub_brand' => $request->input('card_sub_brand'),
                        'card_issuer_country' => $request->input('card_issuer_country'),
                        'card_issuer_country_code' => $request->input('card_issuer_country_code'),
                        'store_id' => $request->input('store_id'),
                        'verify_sign' => $request->input('verify_sign'),
                        'verify_key' => $request->input('verify_key'),
                        'verify_sign_sha2' => $request->input('verify_sign_sha2'),
                        'currency_type' => $request->input('currency_type'),
                        'currency_amount' => $request->input('currency_amount'),
                        'currency_rate' => $request->input('currency_rate'),
                        'base_fair' => $request->input('base_fair'),
                        'risk_level' => $request->input('risk_level'),
                        'risk_title' => $request->input('risk_title'),

                ]);
                    // Update Order Status On Order Table
                     $find = Transaction::where('transaction_id', $tran_id)
                        ->select('invoice')->first();
                    $order = Order::where('invoice', $find->invoice)->first();
                    $order->payment_status = 1;
                    $order->payment_method = 2;
                    $order->payment_time   = $request->input('tran_date');
                    $order->paid_amount    = $amount;
                    $order->due_amount    =  $order->order_price - $amount;
                    $order->save();
                $message = "Transaction Successfully Completed";
                $type = "danger";
                Alert::success('Transaction Successfully Completed');
                return redirect()->route('user.order-history')
                    ->with('message',$message);    
            } else {
                /*
                That means IPN did not work or IPN URL was not set in your merchant panel and Transation validation failed.
                Here you need to update order status as Failed in order table.
                */
                Transaction::where('transaction_id', $tran_id)
                    ->update(['status' => 'Failed']);
                $message = "Transaction Failed";
                $type = "danger";
                return redirect()->route('user.order-history')
                    ->with('message',$message);
            }
        } else if ($transaction->status == 'Processing' || $transaction->status == 'Complete') {
            $message = "Transaction is successfully Completed";
            return redirect()->route('user.order-history')
                    ->with('message',$message);
        } else {
            #That means something wrong happened. You can redirect customer to your product page.
            $message = "Invalid Transaction";
            return redirect()->route('user.order-history')
                    ->with('message',$message);
        }


    }

    public function fail(Request $request)
    {
        $tran_id = $request->input('tran_id');
        $message = "Invalid Transaction";
        $transaction = Transaction::where('transaction_id', $tran_id)
            ->select('transaction_id', 'status', 'currency', 'transaction_amount')->first();

        if ($transaction->status == 'Pending') {
            Transaction::where('transaction_id', $tran_id)
                ->update(['status' => 'Failed']);
            $message = "Transaction Failed";
            Alert::error('Transaction Failed');
            return redirect()->route('user.order-history')
                    ->with('message',$message);
        } else if ($transaction->status == 'Processing' || $transaction->status == 'Complete') {
            Alert::info('Transaction is already Successful');
            return redirect()->route('user.order-history')
                    ->with('message',$message);
        } else {
            $message = "Transaction Invalid";
            return redirect()->route('user.order-history')
                    ->with('message',$message);
        }

    }

    public function cancel(Request $request)
    {
        $tran_id = $request->input('tran_id');
        $message = "Invalid Transaction";
        $order_detials = DB::table('orders')
            ->where('transaction_id', $tran_id)
            ->select('transaction_id', 'status', 'currency', 'transaction_amount')->first();

        if ($order_detials->status == 'Pending') {
            Transaction::where('transaction_id', $tran_id)
                ->update(['status' => 'Canceled']);
            $message = "Transaction is Cancel";
            return redirect()->route('user.order-history')
                    ->with('message',$message);
        } else if ($order_detials->status == 'Processing' || $order_detials->status == 'Complete') {
            $message = "Transaction is already Successful";
            return redirect()->route('user.order-history')
                    ->with('message',$message);
        } else {
            $message = "Transaction is Invalid";
            return redirect()->route('user.order-history')
                    ->with('message',$message);
        }


    }

    public function ipn(Request $request)
    {
        #Received all the payement information from the gateway
        $message = "Unknown";
        if ($request->input('tran_id')) #Check transation id is posted or not.
        {

            $tran_id = $request->input('tran_id');

            #Check order status in order tabel against the transaction id or order id.
            $transaction = Transaction::where('transaction_id', $tran_id)
                ->select('transaction_id', 'status', 'currency', 'transaction_amount')->first();

            if ($transaction->status == 'Pending') {
                $sslc = new SslCommerzNotification();
                $validation = $sslc->orderValidate($request->all(), $tran_id, $transaction->transaction_amount, $transaction->currency);
                if ($validation == TRUE) {
                    /*
                    That means IPN worked. Here you need to update order status
                    in order table as Processing or Complete.
                    Here you can also sent sms or email for successful transaction to customer
                    */
                    Transaction::where('transaction_id', $tran_id)
                        ->update(['status' => 'Processing']);

                    $message =  "Transaction is successfully Completed";
                    return redirect()->route('user.order-history')
                        ->with('message',$message);
                } else {
                    /*
                    That means IPN worked, but Transation validation failed.
                    Here you need to update order status as Failed in order table.
                    */
                    Transaction::where('transaction_id', $tran_id)
                        ->update(['status' => 'Failed']);

                    $message =  "Transaction Fail";
                    return redirect()->route('user.order-history')
                        ->with('message',$message);
                }

            } else if ($transaction->status == 'Processing' || $transaction->status == 'Complete') {

                #That means Order status already updated. No need to udate database.

                $message =  "Transaction is already successfully Completed";
                return redirect()->route('user.order-history')
                        ->with('message',$message);
            } else {
                #That means something wrong happened. You can redirect customer to your product page.
                $message =  "Invalid Transaction";
                return redirect()->route('user.order-history')
                        ->with('message',$message);
            }
        } else {
            $message =  "Invalid Data";
            return redirect()->route('user.order-history')
                        ->with('message',$message);
        }
    }

    public function payViaAjax(Request $request)
    {

        # Here you have to receive all the order data to initate the payment.
        # Lets your oder trnsaction informations are saving in a table called "orders"
        # In orders table order uniq identity is "transaction_id","status" field contain status of the transaction, "amount" is the order amount to be paid and "currency" is for storing Site Currency which will be checked with paid currency.

        $post_data = array();
        $post_data['total_amount'] = '10'; # You cant not pay less than 10
        $post_data['currency'] = "BDT";
        $post_data['tran_id'] = uniqid(); // tran_id must be unique

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = 'Customer Name';
        $post_data['cus_email'] = 'customer@mail.com';
        $post_data['cus_add1'] = 'Customer Address';
        $post_data['cus_add2'] = "";
        $post_data['cus_city'] = "";
        $post_data['cus_state'] = "";
        $post_data['cus_postcode'] = "";
        $post_data['cus_country'] = "Bangladesh";
        $post_data['cus_phone'] = '8801XXXXXXXXX';
        $post_data['cus_fax'] = "";

        # SHIPMENT INFORMATION
        $post_data['ship_name'] = "Store Test";
        $post_data['ship_add1'] = "Dhaka";
        $post_data['ship_add2'] = "Dhaka";
        $post_data['ship_city'] = "Dhaka";
        $post_data['ship_state'] = "Dhaka";
        $post_data['ship_postcode'] = "1000";
        $post_data['ship_phone'] = "";
        $post_data['ship_country'] = "Bangladesh";

        $post_data['shipping_method'] = "NO";
        $post_data['product_name'] = "Computer";
        $post_data['product_category'] = "Goods";
        $post_data['product_profile'] = "physical-goods";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = "ref001";
        $post_data['value_b'] = "ref002";
        $post_data['value_c'] = "ref003";
        $post_data['value_d'] = "ref004";


        #Before  going to initiate the payment order status need to update as Pending.
        $update_product = DB::table('orders')
            ->where('transaction_id', $post_data['tran_id'])
            ->updateOrInsert([
                'name' => $post_data['cus_name'],
                'email' => $post_data['cus_email'],
                'phone' => $post_data['cus_phone'],
                'amount' => $post_data['total_amount'],
                'status' => 'Pending',
                'address' => $post_data['cus_add1'],
                'transaction_id' => $post_data['tran_id'],
                'currency' => $post_data['currency']
            ]);

        $sslc = new SslCommerzNotification();
        # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
        $payment_options = $sslc->makePayment($post_data, 'checkout', 'json');

        if (!is_array($payment_options)) {
            print_r($payment_options);
            $payment_options = array();
        }

    }

}
