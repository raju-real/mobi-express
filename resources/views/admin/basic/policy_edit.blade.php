@extends('admin.layouts.app')
@section('title','Edit Policy')
@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Policy Edit</div>
            </div>
            <div class="ibox-body">
                <form action="{{ route('admin.policy.update',$policy->id) }}" method="POST">
                	@csrf
                    @method('PUT')
                    
                    @if($policy_type === 'privacy_policy')
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label for="privacy_policy">
                                    Privacy Policy
                                </label>
                                <textarea name="privacy_policy" class="form-control"
                                          id="privacy_policy">{{ $policy->privacy_policy }}</textarea>
                                <script>
                                    CKEDITOR.replace('privacy_policy')
                                </script>
                            </div>
                        </div>
                    @endif

                    @if($policy_type === 'terms_condition')
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label for="terms_condition">
                                    Terms & Condition
                                </label>
                                <textarea name="terms_condition" class="form-control"
                                          id="terms_condition">{{ $policy->terms_condition }}</textarea>
                                <script>
                                    CKEDITOR.replace('terms_condition')
                                </script>
                            </div>
                        </div>
                    @endif

                    @if($policy_type === 'return_policy')
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label for="return_policy">
                                    Return Policy
                                </label>
                                <textarea name="return_policy" class="form-control"
                                          id="return_policy">{{ $policy->return_policy }}</textarea>
                                <script>
                                    CKEDITOR.replace('return_policy')
                                </script>
                            </div>
                        </div>
                    @endif

                    @if($policy_type === 'delivery_information')
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label for="delivery_information">
                                    Delivery Information
                                </label>
                                <textarea name="delivery_information" class="form-control"
                                          id="delivery_information">{{ $policy->delivery_information }}</textarea>
                                <script>
                                    CKEDITOR.replace('delivery_information')
                                </script>
                            </div>
                        </div>
                    @endif

                    <button type="submit" class="btn btn-primary btn-lg pointer">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')

@endpush