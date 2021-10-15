<ul role="tablist" class="nav flex-column dashboard-list" >
    <li><a href="{{ route('user.dashboard') }}" class="nav-link {{ Request::is('user/dashboard')? 'active': '' }}">Dashboard</a></li>
    <li> <a href="{{ route('user.order-history') }}" class="nav-link {{ Request::is('user/order-history')? 'active': '' }}">Orders</a></li>
    <li><a href="{{ route('user.profile') }}"  class="nav-link {{ Request::is('user/profile')? 'active': '' }}">Account details</a></li>
    <li><a href="{{ route('user.edit-profile') }}"  class="nav-link {{ Request::is('user/edit-profile')? 'active': '' }}">Edit Profile</a></li>
    <li><a href="{{ route('user.address-book') }}"  class="nav-link {{ Request::is('user/address-book')? 'active': '' }}">Address Book</a></li>
    <li><a href="{{ route('user.account-setting') }}"  class="nav-link {{ Request::is('user/account-setting')? 'active': '' }}">Account Setting</a></li>
    <li><a href="{{ route('logout') }}" class="nav-link">logout</a></li>
</ul>