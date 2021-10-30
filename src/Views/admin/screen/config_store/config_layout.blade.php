{{-- Use sc_config with storeId, dont use sc_config_admin because will switch the store to the specified store Id
--}}

<div class="row">
  <div class="col-md-12">
    <div class="card">
      <div class="card-body table-responsivep-0">
       <table class="table table-hover box-body text-wrap table-bordered">
         <tbody>
          <tr>
            <td>{{ sc_language_render('admin.config_layout.home_page_default') }}</td>
            <td align="left"><a href="#" class="editable editable-click" data-name="home_page_default" data-type="select" data-pk="home_page_default" data-source="{{ json_encode($pageList) }}" data-url="{{ $urlUpdateConfig }}" data-title="{{ sc_language_render('admin.config_layout.home_page_default') }}" data-value="{{ sc_config('home_page_default', $storeId) }}" data-original-title="" title=""></a></td>
          </tr>
           @foreach ($configLayout as $config)
           @if ($config->key != 'home_page_default')
           <tr>
            <td>{{ sc_language_render($config->detail) }}</td>
            <td><input class="check-data-config" data-store="{{ $storeId }}" type="checkbox" name="{{ $config->key }}"  {{ $config->value ? "checked":"" }}></td>
          </tr>
           @endif

           @endforeach
         </tbody>
       </table>
      </div>
    </div>
  </div>
</div>