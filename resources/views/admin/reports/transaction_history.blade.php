@extends('admin.layouts.app')
@section('title','Transaction History')

@push('css')
@endpush

@section('content')
<div class="row">
    <div class="col-md-12 pb-3">
        <div class="ibox">
            <div class="ibox-body">
                <form action="{{ route('admin.transaction-history') }}">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Invoice</label>
                                <input type="text" name="invoice" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Transaciton Id</label>
                                <input type="text" name="transaction_id" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="date_1">
                                <label class="font-normal">From Date</label>
                                <div class="input-group date">
                                    <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
                                    <input name="from_date" class="form-control" type="text" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="date_1">
                                <label class="font-normal">To Date</label>
                                <div class="input-group date">
                                    <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
                                    <input name="to_date" class="form-control" type="text" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label>Status</label>
                            <select name="status" class="form-control">
                                <option value="">Select</option>
                                <option value="PENDING">PENDING</option>
                                <option value="SUCCESS">SUCCESS</option>
                                <option value="FAILED">FAILED</option>
                                <option value="CANCELLED">CANCELLED</option>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <div class="form-group mt-2">
                                <label></label>
                                <button type="submit" class="pointer btn btn-md btn-info btn-block ">Search</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<div class="col-xl-12">
		<div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">
                    {{ 'Transaction History' }}
                </div>
                <div class="ibox-title">
                    <a href="{{ route('admin.transaction-history') }}" class="badge badge-danger pull-right">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>

            <div class="ibox-body">
                <table class="table table-bordered" width="30%">
                    <thead>
                        <tr>
                            <th>Total Transaction</th>
                            <th>Store Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{ $transactions->where('status','===','SUCCESS')->sum('transaction_amount') }} BDT</td>
                            <td>{{ $transactions->where('status','===','SUCCESS')->sum('store_amount') }} BDT</td>
                        </tr>
                    </tbody>
                </table>
                <hr>
                <div class="table-responsive">
                <table class="table text-nowrap table-striped table-bordered table-hover text-left" id="transaction-table" width="100%">
                    <thead>
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Invoice</th>
                            <th class="text-left">Transaction Id</th>
                            <th class="text-left">Amount</th>
                            <th class="text-left">Store Amount</th>
                            <th class="text-left">Tran Date</th>
                            <th class="text-left">Tran Type</th>
                            <th class="text-left">Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Invoice</th>
                            <th class="text-left">Transaction Id</th>
                            <th class="text-left">Amount</th>
                            <th class="text-left">Store Amount</th>
                            <th class="text-left">Tran Date</th>
                            <th class="text-left">Tran Type</th>
                            <th class="text-left">Status</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    	@foreach($transactions as $transaction)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $transaction->invoice }}</td>
                            <td>{{ $transaction->transaction_id }}</td>
                            <td>{{ $transaction->transaction_amount }}</td>
                            <td>{{ $transaction->store_amount ?? 0 }}</td>
                            <td>{{ \Carbon\Carbon::createFromTimeStamp(strtotime($transaction->transaction_time))->format('d-m-y h:m') }}</td>
                            <td>
                                {{-- {{ $transaction->card_brand }} -  --}}
                                {{ $transaction->card_issuer }}
                            </td>
                            <td>{{ $transaction->status }}</td>
                            <td>
                            	<a href="{{ route('admin.transaction-details',['transaction_id'=>$transaction->transaction_id]) }}" class="badge badge-info">
                            		<i class="fa fa-eye"></i>
                            	</a>
                                {{-- <a href="" class="badge badge-info">
                                    Refund
                                </a> --}}
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                </div>
                {{ $transactions->links() }}
            </div>
        </div>
	</div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(function() {
        $('#transaction-table').DataTable({
            pageLength: 10,
            paging: false,
            searching: false,
            info: false

        });
    })
</script>


@endpush
