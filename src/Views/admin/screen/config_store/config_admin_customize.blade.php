{{-- Use sc_config with storeId, dont use sc_config_admin because will switch the store to the specified store Id
--}}
<div class="card">
  <div class="card-body table-responsive">
   <table class="table table-hover box-body text-wrap table-bordered">
     <tbody>
      @foreach ($configCustomize as $config)
      <tr>
        <td>{{ sc_language_render($config->detail) }}</td>
        <td><a href="#" class="editable editable-click" data-name="{{ $config->key }}" data-type="text" data-pk="{{ $config->key }}" data-source="" data-url="{{ $urlUpdateConfig }}" data-title="{{ sc_language_render($config->detail) }}" data-value="{{ sc_config($config->key, $storeId) }}" data-original-title="" title=""></a></td>
      </tr>
    @endforeach

     </tbody>
   </table>
  </div>
</div>