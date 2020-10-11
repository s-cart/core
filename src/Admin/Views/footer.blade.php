<footer class="main-footer">
  <div class="float-right d-none d-sm-inline-block">
    <b>Version</b> 
    @if (env('SC_VERSION'))
    {{ env('SC_VERSION') }}
    @else
    {{ config('s-cart.sub_version') }}
    @endif
  </div>
  <strong>Copyright &copy; {{ date('Y') }} <a href="{{ config('s-cart.homepage') }}">SCart: {{ config('s-cart.title') }}</a>.</strong> All rights
  reserved.
</footer>
