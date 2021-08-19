<ul role="tablist" class="nav flex-column dashboard-list" >
    <li><a href="{{ route('user.dashboard') }}" class="nav-link {{ Request::is('user/dashboard')? 'active': '' }}">Dashboard</a></li>
    <li> <a href="{{ route('user.order-history') }}" class="nav-link {{ Request::is('user/order-history')? 'active': '' }}">Orders</a></li>
    <li><a href="{{ route('user.profile') }}"  class="nav-link {{ Request::is('user/profile')? 'active': '' }}">Account details</a></li>
    <li><a href="{{ route('user.edit-profile') }}"  class="nav-link {{ Request::is('user/edit-profile')? 'active': '' }}">Edit Profile</a></li>
    <li><a href="{{ route('user.change-password') }}"  class="nav-link {{ Request::is('user/change-password')? 'active': '' }}">Change Password</a></li>
    <li><a href="{{ route('logout') }}" class="nav-link">logout</a></li>
</ul>