<footer class="main-footer">
  @if (!sc_config_global('ADMIN_FOOTER_OFF'))
    <div class="float-right d-none d-sm-inline-block">
      <strong>Env</strong>
      {{ config('app.env') }}
      &nbsp;&nbsp;
      <strong>Version</strong> 
      {{ config('s-cart.sub-version') }}
    </div>
    <strong>Copyright &copy; {{ date('Y') }} <a href="{{ config('s-cart.homepage') }}">S-Cart: {{ config('s-cart.title') }}</a>.</strong> All rights
    reserved.
  @endif
</footer>
