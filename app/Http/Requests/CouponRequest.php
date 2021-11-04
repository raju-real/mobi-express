<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CouponRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'coupon_code' => 'required',
            'valid_for' => 'required',
            'user_group' => 'required_if:valid_for,==,3',
            'discount_type' => 'required',
            'minimum_cost' => "required_if:discount_type,==,1",
            'discount' => 'required',
            'start_date' => 'required',
            'end_date' => 'required',
            'status' => 'required'
        ];
    }

    public function messages(){
        return [
            'coupon_code.required' => 'Coupon Code Required',
            'valid_for.required' => 'Valid For Is Required',
            'user_group.required_if' => 'Required If Valid For Group User',
            'minimum_cost.required_if' => 'Required If Discount Type Amount',
        ];
    }
}
