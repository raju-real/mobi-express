@extends('admin.layouts.app')
@section('title',$title)
@push('css')

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
                    @if(isset($coupon))
                        @method('PUT')
                    @endif
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="coupon_code">
                                    Coupon Code
                                </label>
                                <input type="text" name="coupon_code" class="form-control" id="coupon_code" placeholder="Coupon Code" value="{{ isset($coupon) ? $coupon->coupon_code : old('coupon_code') }}">
                                @error('coupon_code')
                                <span class="error">{{ $message }}</span>
                                @enderror
                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="valid_for">
                                    Valid For
                                </label>
                                <select name="valid_for" id="valid_for" class="form-control">
                                    @if(isset($coupon))
                                        <option value="{{ $coupon->valid_for }}" selected>
                                            @if($coupon->valid_for == 1)
                                                {{ 'All User' }}
                                            @elseif($coupon->valid_for == 2)
                                                {{ 'New User' }}
                                            @elseif($coupon->valid_for ==3)
                                                {{ 'Group User' }}
                                            @else
                                                {{ 'Valid For' }}
                                            @endif
                                    </option>
                                    <option value="1">All User</option>
                                    <option value="2">New User</option>
                                    <option value="3">Group User</option>
                                    @else
                                    <option value="{{ old('valid_for') ?? '' }}" selected>
                                        @if(old('valid_for') == 1)
                                            {{ 'All User' }}
                                        @elseif(old('valid_for') == 2)
                                            {{ 'New User' }}
                                        @elseif(old('valid_for') ==3)
                                            {{ 'Group User' }}
                                        @else
                                            {{ 'Valid For' }}
                                        @endif
                                    </option>
                                    <option value="1">All User</option>
                                    <option value="2">New User</option>
                                    <option value="3">Group User</option>
                                    @endif
                                </select>
                                @error('valid_for')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4 displayNone" id="user_group_form">
                            <div class="form-group">
                                <label>User Group</label>
                                <select name="user_group" class="form-control" id="user_group">
                                    @if(isset($coupon) && $coupon->valid_for == 3)
                                        <option value="{{ $coupon->user_group }}" selected>
                                            {{ $coupon->group->name }}
                                        </option>
                                    @else
                                        <option value="">Select Group</option>
                                    @endif
                                    @foreach($groups as $group)
                                        @if (old('user_group') == $group->id)
                                            <option value="{{ $group->id }}" selected>{{ $group->name }}</option>
                                        @else
                                            <option value="{{ $group->id }}">
                                            {{ $group->name }}
                                        </option>
                                        @endif
                                    @endforeach
                                </select>
                                @error('user_group')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="discount_type">
                                    Discount Type
                                </label>
                                <select name="discount_type" id="discount_type" class="form-control">
                                    @if(isset($coupon))
                                        <option value="{{ $coupon->discount_type }}">
                                            @if($coupon->discount_type == 1)
                                                {{ 'Amount' }}
                                            @elseif($coupon->discount_type == 2)
                                                {{ 'Percentage' }}
                                            @else
                                                {{ 'Discount Type' }}
                                            @endif
                                        </option>
                                        @if($coupon->discount_type == 2)
                                            <option value="1">Amount</option>
                                        @elseif($coupon->discount_type == 1)
                                            <option value="2">Percentage</option>
                                        @endif
                                    @else
                                        <option value="{{ old('discount_type') ?? '' }}" selected>
                                            @if(old('discount_type') == 1)
                                                {{ 'Amount' }}
                                            @elseif(old('discount_type') == 2)
                                                {{ 'Percentage' }}
                                            @else
                                                {{ 'Discount Type' }}
                                            @endif
                                        </option>
                                        <option value="1">Amount</option>
                                        <option value="2">Percentage</option>
                                    @endif
                                </select>
                                @error('discount_type')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="discount">
                                    Discount
                                </label>
                                <input type="number" name="discount" class="form-control" id="discount" placeholder="Discount" value="{{ isset($coupon) ? $coupon->discount : old('discount') }}">
                                @error('discount')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="used_limit">
                                    Used Limit
                                </label>
                                <input type="number" name="used_limit" class="form-control" id="used_limit" value="{{ isset($coupon) ? $coupon->used_limit  : old('used_limit') }}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="minimum_cost">
                                    Minimum Cost
                                </label>
                                <input type="number" name="minimum_cost" class="form-control" id="minimum_cost" value="{{ isset($coupon) ? $coupon->minimum_cost : old('minimum_cost')  }}">
                                @error('minimum_cost')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="up_to">
                                    Up To
                                </label>
                                <input type="number" name="up_to" class="form-control" id="up_to" value="{{ isset($coupon) ? $coupon->up_to : old('up_to')  }}">

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group" id="date_1">
                                <label class="font-normal">
                                    Start Date
                                </label>
                                <div class="input-group date">
                                    <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
                                    <input name="start_date" class="form-control" type="text" autocomplete="off" value="{{ isset($coupon) ? $coupon->start_date : old('start_date') }}">
                                </div>
                                @error('start_date')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group" id="date_1">
                                <label class="font-normal">End Date</label>
                                <div class="input-group date">
                                    <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
                                    <input name="end_date" class="form-control" type="text" autocomplete="off" value="{{ isset($coupon) ? $coupon->end_date : old('end_date') }}">
                                </div>
                                @error('end_date')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="coupon">
                                    Status
                                </label>
                                <select name="status" class="form-control">
                                    @if(isset($coupon))
                                        <option value="{{ $coupon->status }}" selected>{{ $coupon->status == 1 ? 'Active' : 'In Active' }}</option>
                                        @if($coupon->status == 0)
                                            <option value="1">Active</option>
                                        @elseif($coupon->status == 1)
                                            <option value="0">In Active</option>
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
                                    <option value="0">In Active</option>
                                    @endif
                                </select>
                                @error('status')
                                    <span class="error">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary pointer">
                        {{ isset($coupon) ? 'Update' : 'Add' }}
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script type="text/javascript">
      $( document ).ready(function() {
        let valid_for = $('#valid_for').val();
        if(valid_for == 3){
            $('#user_group_form').removeClass("displayNone");
        } else{
            $('#user_group_form').addClass("displayNone");
        }
    });
    $('#valid_for').change(function(){
        if(this.value == 3){
            $('#user_group_form').removeClass("displayNone");
        } else{
            $('#user_group_form').addClass("displayNone");
            $('#user_group').val("");
        }
    });
</script>

@endpush
