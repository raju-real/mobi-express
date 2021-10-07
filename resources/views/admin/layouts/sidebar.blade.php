<nav class="page-sidebar" id="sidebar" style="position: fixed;">
    <div id="sidebar-collapse">
        <div class="admin-block d-flex">
            
            <div class="admin-info">
                <div class="font-strong">
                </div><small>
                    {{-- {{ Auth::user()->name }} --}}
                    {{-- <li class="heading" style="list-style: none;">Featured Menu</li> --}}
                </small></div>
            </div>
        @if(Request::is('admin*'))
        <ul class="side-menu metismenu">
            <li>
                <a class="active" href="{{ route('admin.dashboard') }}"><i class="sidebar-item-icon fa fa-th-large"></i>
                    <span class="nav-label">Dashboard</span>
                </a>
            </li>
            
            <li>
                <a href="javascript:;"><i class="sidebar-item-icon fa fa-first-order"></i>
                    <span class="nav-label">Order List</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li>
                        <a href="{{ route('admin.pending-orders') }}">
                            <i class="fa fa-circle-o"></i>
                            Pending Order
                            <span class="badge badge-warning" style="float: right;">
                                {{ 
                                App\Model\Order::where('order_status',0)->count() 
                                }}
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.processing-orders') }}">
                            <i class="fa fa-circle-o"></i>
                            Processing Order
                            <span class="badge badge-info" style="float: right;">
                                {{ 
                                App\Model\Order::where('order_status',1)->count() 
                                }}
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.picked-orders') }}">
                            <i class="fa fa-circle-o"></i>
                            Picked Order
                            <span class="badge badge-primary" style="float: right;">
                                {{ 
                                App\Model\Order::where('order_status',2)->count() 
                                }}
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.shipped-orders') }}">
                            <i class="fa fa-circle-o"></i>
                            Shipped Order
                            <span class="badge badge-primary" style="float: right;">
                                {{ 
                                App\Model\Order::where('order_status',3)->count() 
                                }}
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.delivered-orders') }}">
                            <i class="fa fa-circle-o"></i>
                            Delivered Order
                            <span class="badge badge-success" style="float: right;">
                            {{ 
                                App\Model\Order::where('order_status',4)->count() 
                            }}
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.cancled-orders') }}">
                            <i class="fa fa-circle-o"></i>
                            Cancled Order
                            <span class="badge badge-danger" style="float: right;">
                            {{ 
                                App\Model\Order::where('order_status',5)->count() 
                            }}
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.returned-orders') }}">
                            <i class="fa fa-circle-o"></i>
                            Returned Order
                            <span class="badge badge-warning" style="float: right;">
                            {{ 
                                App\Model\Order::where('order_status',6)->count() 
                            }}
                            </span>
                        </a>
                    </li>
                    
                </ul>
            </li>
            <li>
                <a href="javascript:;"><i class="sidebar-item-icon fa fa-bar-chart"></i>
                    <span class="nav-label">Reports</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li>
                        <a href="{{ route('admin.pending-orders') }}">
                            <i class="fa fa-circle-o"></i>
                            Sales Report
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.transaction-history') }}">
                            <i class="fa fa-circle-o"></i>
                            Transaction Report
                        </a>
                    </li>
                    
                </ul>
            </li>
            <li>
                <a href="{{ route('admin.product.index') }}"><i class="sidebar-item-icon fa fa-product-hunt"></i>
                    <span class="nav-label">Products</span>
                </a>
            </li>
            <li>
                <a href="javascript:;"><i class="sidebar-item-icon fa fa-list-ul"></i>
                    <span class="nav-label">Product Attributes</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li>

                        <a href="{{ route('admin.category.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Category
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.subcategory.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Sub Category
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.brand.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Brand
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.color.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Color
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.size.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Size
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.unit.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Unit
                        </a>
                    </li>
                </ul>
            </li>

            {{-- <li>
                <a href="{{ route('admin.slider.index') }}"><i class="sidebar-item-icon fa fa-sliders"></i>
                    <span class="nav-label">Slider Image</span>
                </a>
            </li> --}}

            <li>
                <a href="javascript:;"><i class="sidebar-item-icon fa fa-plus-circle"></i>
                    <span class="nav-label">Product Binding</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li>

                        <a href="{{ route('admin.featured-products.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Featured Products
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.new-arrivals.index') }}">
                            <i class="fa fa-circle-o"></i>
                            New Arrivals
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.front-category.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Category & Product
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="{{ route('admin.promotion.index') }}"><i class="sidebar-item-icon fa fa-bullhorn"></i>
                    <span class="nav-label">Promotion</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.offer.index') }}"><i class="sidebar-item-icon fa fa-percent"></i>
                    <span class="nav-label">Offer Product</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.voucher-product.index') }}"><i class="sidebar-item-icon fa fa-money"></i>
                    <span class="nav-label">Voucher Product</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.coupon.index') }}"><i class="sidebar-item-icon fa fa-gift"></i>
                    <span class="nav-label">Coupon</span>
                </a>
            </li>
            <li>
                <a href="{{ route('admin.users.index') }}"><i class="sidebar-item-icon fa fa-users"></i>
                    <span class="nav-label">
                        Our Users
                        <span class="badge badge-success" style="float: right;">
                            {{ App\Model\User::count()}}
                        </span>
                    </span>
                </a>
            </li>
            
            <li>
                <a href="javascript:;"><i class="sidebar-item-icon fa fa-globe"></i>
                    <span class="nav-label">Website Basic</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li>

                        <a href="{{ route('admin.policy.index') }}">
                            <i class="fa fa-circle-o"></i>
                            Policy
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.contact-us') }}">
                            <i class="fa fa-circle-o"></i>
                            Contact Us
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.about-us') }}">
                            <i class="fa fa-circle-o"></i>
                            About Us
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="{{ route('admin.district.index') }}"><i class="sidebar-item-icon fa fa-area-chart"></i>
                    <span class="nav-label">Districts</span>
                </a>
            </li>
            
            
        </ul>
        @endif
    </div>
</nav>