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
            </div>
            
            <div class="ibox-body">
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
                        <table class="table table-striped table-inverse table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4">
                        <h6>To</h6>
                        <table class="table table-striped table-inverse table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4">
                        Qr Code
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')

@endpush