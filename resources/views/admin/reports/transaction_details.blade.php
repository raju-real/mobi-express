@extends('admin.layouts.app')
@section('title','Transaction Details - '.$transaction->transaction_id)

@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
	<div class="card card-info">
		<div class="card-header">
			<div class="card-title">
				{{ 'Transaction Details' }}
			</div>
		</div>
		<div class="card-body">
			<div class="col-md-12">
				<table class="table table-bordered table-striped" width="100%">
					<tr>
						<th>Status</th>
						<th><span>{{ $transaction->status }}</span></th>
					</tr>
                    <tr>
						<th>Order Invoice</th>
						<th>
                            <a href="{{ route('admin.order.show',['invoice'=>$transaction->invoice ?? "Not Found"]) }}" target="_blank">{{ $transaction->invoice ?? "None" }}</a>
                        </th>
					</tr>
					<tr>
                        <th>Transaction Id</th>
                        <th>{{ $transaction->transaction_id ?? 'None' }}</th>
					</tr>
					<tr>
                        <th>Transaction Amount</th>
                        <th>{{ $transaction->transaction_amount ?? 'None' }} {{ $transaction->currency ?? "" }}</th>
					</tr>
					<tr>
                        <th>Store Amount</th>
                        <th>{{ $transaction->store_amount ?? 'None' }} {{ $transaction->currency ?? "" }}</th>
					</tr>
					<tr>
                        <th>Bank Transaction Id</th>
                        <th>{{ $transaction->bank_tran_id ?? 'None' }}</th>
					</tr>
					<tr>
                        <th>Card issuer</th>
                        <th>{{ $transaction->card_issuer ?? 'None' }}</th>
					</tr>
					<tr>
                        <th>Card Brand</th>
                        <th>{{ $transaction->card_brand ?? "None" }}</th>
					</tr>
                    <tr>
                        <th>Transaction By</th>
                        <th>
                            {{ $transaction->name ?? 'None' }}
                        </th>
					</tr>
                    <tr>
                        <th>Mobile</th>
                        <th>
                            {{ $transaction->mobile ?? 'None' }}
                        </th>
					</tr>
                    <tr>
                        <th>City/Town</th>
                        <th>
                            {{ $transaction->city_town ?? 'None' }}
                        </th>
					</tr>
                    <tr>
                        <th>Post Code</th>
                        <th>
                            {{ $transaction->post_code ?? 'None' }}
                        </th>
					</tr>
                    <tr>
                        <th>Address</th>
                        <th>
                            {{ $transaction->address ?? 'None' }}
                        </th>
					</tr>
                    <tr>
                        <th>Time</th>
                        <th>
                            {{ $transaction->updated_at ? $transaction->updated_at->format('d-m-y H:i:s') : 'None' }}
                        </th>
					</tr>

			    </table>
			</div>
		</div>
	</div>
</div>
</div>
@endsection

@push('js')

@endpush
