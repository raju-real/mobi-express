 @if(Auth::user()->is_admin == 2)
    <a href="{{ route('user.dashboard') }}" class="list-group-item list-group-item-action {{ Request::is('user/dashboard') ? 'active' : '' }}">Dashboard</a>
    <a href="{{ route('user.order') }}" class="list-group-item list-group-item-action {{ Request::is('user/order') ? 'active' : '' }}">Order History</a>
@endif
