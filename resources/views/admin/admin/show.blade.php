@extends('admin.layouts.app')
@section('title',$title)

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-md-12">
    <div class="card card-info">
        <div class="card-header">
            <div class="card-title">
                {{ $title }}
                <a href="{{ route('admin.admin.edit',['mobile'=>$admin->mobile]) }}" class="badge badge-primary"><i class="fa fa-edit"></i></a>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                <table class="table table-bordered table-striped" width="100%">
                    <tr>
                        <th>Action</th>
                        <th>
                            @if($admin->status == 1)
                                <a href="{{ route('admin.change-admin-status',['id'=>$admin->id,'status'=>0]) }}" class="badge badge-danger">
                                    <i class="fa fa-ban" aria-hidden="true"></i>
                                    Block
                                </a>
                            @elseif($admin->status == 0)
                                <a href="{{ route('admin.change-admin-status',['id'=>$admin->id,'status'=>1]) }}" class="badge badge-success">
                                    <i class="fa fa-check-circle" aria-hidden="true"></i>
                                    Un Block
                                </a>
                            @endif      
                        </th>
                    </tr>
                    <tr>
                        <th>Status</th>
                        <th>{{ $admin->status == 1 ? 'Active' : 'Blocked' }}</th>
                    </tr>
                    <tr>
                        <th>Profile</th>
                        <th>
                            @if($admin->image != null)
                                <img src="{{ asset($admin->image) }}" class="img-responsive" alt="Responsive image" style="height: 100px;width:100px;border-radius: 10px;">
                              @else
                                <img src="{{ asset('assets/common/images/avator.png') }}" class="img-responsive" alt="Responsive image" style="height: 100px;width:100px;">
                              @endif  
                        </th>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <th>{{ $admin->name ?? 'None' }}</th>
                    </tr>
                    <tr>
                        <th>Mobile</th>
                        <th>{{ $admin->mobile ?? 'None' }}</th>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <th>{{ $admin->email ?? 'None' }}</th>
                    </tr>
                    
                </table>
            </div>
            <div class="col-md-6">
                <p>Permissions</p>
                <table class="table table-bordered table-striped" width="100%">
                    <tr>
                        <th>Order Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->order_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->order_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>Report Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->report_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->report_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>Product Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->product_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->product_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>ProductAttribute Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->product_attribute_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->product_attribute_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>ProductBinding Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->product_binding_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->product_binding_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>Promotion Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->promotion_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->promotion_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>Offer Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->offer_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->offer_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>Voucher Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->voucher_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->voucher_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>Coupon Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->coupon_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->coupon_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>WebBasic Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->web_basic_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->web_basic_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>District Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->district_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->district_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    <tr>
                        <th>User Management</th>
                        <th>
                            <span class="badge badge-{{ $admin->user_management == 1 ? 'success' : 'danger' }}">
                                {{ $admin->user_management == 1 ? 'Yes' : 'No' }}
                            </span>
                        </th>
                    </tr>
                    
                    
                </table>
            </div>
            </div>
            
        </div>
    </div>
</div>
</div>
@endsection

@push('js')

@endpush