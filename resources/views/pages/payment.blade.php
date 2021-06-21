@extends('layouts.app')
@section('title','Shopping Cart')
@push('css')

@endpush

@section('content')
 <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
        <div class="container">
        <div class="row">
            <div class="col-6">
                 @if(Session::has('message'))
                    <p class="alert alert-{{ Session::get('type') }}">
                        {{ Session::get('message') }}
                    </p>
                @endif 
                <p id="alert"></p>
                <div class="table-responsive" id="carts">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">Product</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <div class="col-md-6">
                <form action="" method="POST" role="form">
                    <legend>Form title</legend>
                
                    <div class="form-group">
                        <label for="">label</label>
                        <input type="text" class="form-control" id="" placeholder="Input field">
                    </div>
                
                    
                
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
      </div>
    </section><!-- End About Us Section -->
@endsection

@push('js')
<script type="text/javascript">
  $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

</script>
@endpush
