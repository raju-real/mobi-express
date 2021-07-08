@extends('admin.layouts.app')
@section('title',$title)

@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-xl-12">
		<div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">
                    {{ $title }}
                </div>
                <div class="ibox-title">
                    <form class="sort-form" action="#">
                        <div class="selector">
                            <select class="form-control" onchange="top.location.href = this.options[this.selectedIndex].value">
                               @for($i=15;$i <= 100;$i+=10)
                                <option value="{{ route('admin.'.$route, ['limit'=>$i]) }}">
                                    {{ $i }}
                                </option>
                                @endfor
                            </select>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="ibox-body">
                <table class="table table-responsive text-nowrap table-striped table-bordered table-hover text-center" id="product-table" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="text-center">Sl.no</th>
                            <th class="text-center">Order Date</th>
                            <th class="text-center">Invoice</th>
                            <th class="text-center">Mobile</th>
                            <th class="text-center">Products</th>
                            <th class="text-center">Order Price</th>
                            {{-- <th>Order Status</th> --}}
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Sl.no</th>
                            <th>Order Date</th>
                            <th>Invoice</th>
                            <th>Mobile</th>
                            <th>Products</th>
                            <th>Order Price</th>
                            {{-- <th>Order Status</th> --}}
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    	@foreach($orders as $order)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $order->updated_at->format('D, M y') }}</td>
                            <td>{{ $order->invoice }}</td>
                            <td>{{ $order->mobile }}</td>
                            <td>{{ $order->products->count() }}</td>
                            <td>{{ $order->order_price }}</td>
                            {{-- <td>{{ $order->order_status }}</td> --}}
                            <td>
                            	<a href="{{ route('admin.order.show',['invoice'=>$order->invoice]) }}" class="badge badge-info">
                            		<i class="fa fa-eye"></i>
                            	</a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                {{ $orders->links() }}
            </div>
        </div>
	</div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(function() {
        $('#order-table').DataTable({
            pageLength: 10,
            paging: false,
            searching: false,
            info: false
           
        });
    })
</script>

    
@endpush