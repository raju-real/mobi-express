<ul role="tablist" class="nav flex-column dashboard-list" >
    <li><a href="{{ route('user.dashboard') }}" class="nav-link active">Dashboard</a></li>
    <li> <a href="{{ route('user.order_history') }}" class="nav-link">Orders</a></li>
    <li><a href="{{ route('user.profile') }}"  class="nav-link">Account details</a></li>
    <li><a href="{{ route('logout') }}" class="nav-link">logout</a></li>
</ul>