<footer class="main-footer">
  @if (!sc_config_admin('ADMIN_FOOTER_OFF'))
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 
      {{ config('s-cart.sub-version') }}
    </div>
    <strong>Copyright &copy; {{ date('Y') }} <a href="{{ config('s-cart.homepage') }}">SCart: {{ config('s-cart.title') }}</a>.</strong> All rights
    reserved.
  @endif
</footer>
