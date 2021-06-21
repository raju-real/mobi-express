@extends('layouts.app')
@section('title', 'User Dashboard')
@push('css')

@endpush

@section('content')
    <section id="about" class="about">
      <div class="container">

        <div class="row">
            <div class="col-md-3">
                <div class="list-group">
                    @include('user.menus')
                </div>
            </div>
            <div class="col-md-9">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>{{ $user->name }}</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
      </div>
    </section><!-- End About Us Section -->

@endsection

@push('js')
<script>
    function takePermission(){
        confirm('Are you suer');
        document.getElementById('category-delete').submit();
    }
</script>
@endpush

