<li class="nav-item dropdown">
    @if (sc_store('domain', session('adminStoreId')))
    <a class="nav-link" href="//{{ sc_store('domain', session('adminStoreId')) }}" target=_new>
        <i class="fas fa-home"></i>
    </a>
    @endif

</li>