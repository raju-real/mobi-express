@extends('admin.layouts.app')
@section('title',$title)
@push('css')
<style>
  .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 10rem; }
  .toggle.ios .toggle-handle { border-radius: 10rem; }
  .align-right{
    float: right !important;
}
</style>
@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">{{ $title }}</div>
            </div>
            <div class="ibox-body">
                <form action="{{ $route }}" method="POST" role="form">
                    @csrf
                    @if(isset($admin))
                        @method('PUT')
                    @endif
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="name">
                                    Name
                                </label>
                                <input type="text" name="name" class="form-control" id="name" placeholder="Name" value="{{ isset($admin) ? $admin->name : old('name') }}">
                                @error('name')
                                <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="email">
                                    Email
                                </label>
                                <input type="text" name="email" class="form-control" id="email" placeholder="Email" value="{{ isset($admin) ? $admin->email : old('email') }}">
                                @error('email')
                                <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="mobile">
                                    Mobile
                                </label>
                                <input type="text" name="mobile" class="form-control" id="mobile" placeholder="Mobile" value="{{ isset($admin) ? $admin->mobile : old('mobile') }}">
                                @error('mobile')
                                <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="image">
                                    Image
                                </label>
                                <input type="file" name="image" class="form-control" id="image" placeholder="Image" >
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="password">
                                    Password
                                </label>
                                <input type="password" name="password" class="form-control" id="password" placeholder="Password" value="">
                                @error('mobile')
                                <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="status">
                                    Status
                                </label>
                                <select name="status" class="form-control">
                                    @if(isset($admin))
                                        <option value="{{ $admin->status }}" selected>{{ $admin->status == 1 ? 'Active' : 'In Active' }}</option>
                                        @if($admin->status == 0)
                                            <option value="1">Active</option>
                                        @elseif($admin->status == 1)
                                            <option value="0">Block</option>
                                        @endif
                                    @else
                                    <option value="{{ old('status') ?? '' }}" selected>
                                        @if(old('status') == 1)
                                            {{ 'Active' }}
                                        @elseif(old('status') == 2)    
                                            {{ 'In Active' }}
                                        @else
                                            {{ 'Select Status' }}    
                                        @endif    
                                    </option>
                                    <option value="1">Active</option>
                                    <option value="0">Block</option>
                                    @endif
                                </select>
                                @error('status')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Order Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('order_management') == 1 ? 'checked' : isset($admin) && $admin->order_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="order_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Report Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('report_management') == 1 ? 'checked' : isset($admin) && $admin->report_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="report_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Product Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('product_management') == 1 ? 'checked' : isset($admin) && $admin->product_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="product_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Product Attribute Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('product_attribute_management') == 1 ? 'checked' : isset($admin) && $admin->product_attribute_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="product_attribute_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Product Binding Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('product_binding_management') == 1 ? 'checked' : isset($admin) && $admin->product_binding_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="product_binding_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Promotion Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('promotion_management') == 1 ? 'checked' : isset($admin) && $admin->promotion_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="promotion_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Offer Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('offer_management') == 1 ? 'checked' : isset($admin) && $admin->offer_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="offer_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Voucher Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('voucher_management') == 1 ? 'checked' : isset($admin) && $admin->voucher_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="voucher_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>Coupon Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('coupon_management') == 1 ? 'checked' : isset($admin) && $admin->coupon_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="coupon_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>WebBasic Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('web_basic_management') == 1 ? 'checked' : isset($admin) && $admin->web_basic_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="web_basic_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>District Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('district_management') == 1 ? 'checked' : isset($admin) && $admin->district_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="district_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label>User Management</label>
                                <span class="align-right">
                                    <input 
                                    {{ old('user_management') == 1 ? 'checked' : isset($admin) && $admin->user_management == "1" ? 'checked' : '' }}
                                    class="switch-input" 
                                    name="user_management" type="checkbox"  data-toggle="toggle"data-onstyle="success" data-offstyle="danger" 
                                    data-on="Yes" data-off="No" data-size="mini" data-style="ios" data-width="60">
                                </span>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary pointer">
                        {{ isset($admin) ? 'Update' : 'Add' }}
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(document).ready(function() {
      $('.switch-input').on('change', function() {
        var isChecked = $(this).is(':checked');
        var selectedData;
        var $switchLabel = $('.switch-label');
        
        if(isChecked) {
          selectedData = $switchLabel.attr('data-on');
          $(this).val("1");
        } else {
          selectedData = $switchLabel.attr('data-off');
        }
            
      });
    });
</script>
@endpush