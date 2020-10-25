    <!-- Notifications: style can be found in dropdown.less -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-bell"></i>
        <span class="badge badge-warning navbar-badge">{{ sc_count_order_new_store(session('adminStoreId')) }}</span>
      </a>
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <span class="dropdown-item dropdown-header">{{ trans('admin.menu_notice.new_order',['total'=> sc_count_order_new_store(session('adminStoreId'))]) }}</span>
        <div class="dropdown-divider"></div>
        @if (sc_config_admin('MultiStorePro'))
         <a href="{{ sc_route('admin_order_store.index') }}?order_status=1" class="dropdown-item dropdown-footer">{{ trans('admin.menu_notice.view_all') }}</a>
        @else
         <a href="{{ sc_route('admin_order.index') }}?order_status=1" class="dropdown-item dropdown-footer">{{ trans('admin.menu_notice.view_all') }}</a>
        @endif
      </div>
    </li>
