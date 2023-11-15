
@php
    $countNotice = \SCart\Core\Admin\Models\AdminNotice::getCountNoticeNew();
    $topNotice = \SCart\Core\Admin\Models\AdminNotice::getTopNotice();
@endphp
<li class="nav-item dropdown">
    <a class="nav-link" data-toggle="dropdown" href="#">
      <i class="far fa-bell"></i>
      <span class="badge badge-warning navbar-badge">{{ $countNotice }}</span>
    </a>
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right notice">
  @if ($topNotice->count())
  <span class="dropdown-item dropdown-header text-right"><a href="{{ sc_route_admin('admin_notice.mark_read') }}">{{ sc_language_render('admin_notice.mark_read') }}</a></span>
    @foreach ($topNotice as $notice)
      <div class="dropdown-divider"></div>
      <a href="{{ sc_route_admin('admin_notice.url',['type' => $notice->type,'typeId' => $notice->type_id]) }}" class="dropdown-item notice-{{ $notice->status ? 'read':'unread' }}">
        @if (in_array($notice->type, ['sc_order_created', 'sc_order_success', 'sc_order_update_status']))
        <i class="fas fa-cart-plus"></i>
        @elseif(in_array($notice->type, ['sc_customer_created']))
        <i class="fas fa-users"></i>
        @else
        <i class="far fa-bell"></i>
        @endif
        {{ sc_language_render($notice->content) }}
      <span class="text-muted notice-time">{{ sc_datetime_to_date($notice->created_at, 'Y-m-d H:i:s') }}</span>
      </a>
    @endforeach
    <div class="dropdown-divider"></div>
      <a href="{{ sc_route_admin('admin_notice.index') }}" class="dropdown-item text-center">{{ sc_language_render('action.view_more') }}</a>
    </div>
  @else
    <div class="dropdown-divider"></div>
    <span class="dropdown-item dropdown-header">{{ sc_language_render('admin_notice.empty') }}</span>
  @endif
  </li>
