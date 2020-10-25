@if ($listStoreId = \Admin::user()->listStoreId())
@if ((in_array(0, $listStoreId) && count($listStoreId) > 2) || (!in_array(0, $listStoreId) && count($listStoreId) > 1))
<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
        <i class="fas fa-random"></i> {{ trans('admin.store_title', ['id' => session('adminStoreId')]) }}
    </a>
    <div class="dropdown-menu dropdown-menu-left p-0">
    @foreach ($listStoreId as  $stID)
    @if ($stID != 0 && session('adminStoreId') != $stID)
    <a href="{{ sc_route('admin_store.switch', ['storeId' => $stID]) }}" class="dropdown-item ">
        <div class="hover">
            <i class="fab fa-shopify"></i> {{ trans('admin.store_title', ['id' => $stID]) }}
        </div>
    </a>
    @endif
    @endforeach
    </div>
</li> 
@endif
@endif
