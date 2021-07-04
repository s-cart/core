/*admin_menu*/
INSERT INTO `__SC_DB_PREFIX__admin_menu` (`id`, `parent_id`, `sort`, `title`, `icon`, `uri`, `key`, `type`) VALUES 
(1, 6, 1,'admin.menu_titles.order_manager', 'fas fa-cart-arrow-down','','ORDER_MANAGER',0),
(2, 6, 2,'admin.menu_titles.catalog_mamager', 'fas fa-folder-open','','CATALOG_MANAGER',0),
(3, 25, 3,'admin.menu_titles.customer_manager', 'fas fa-users','','CUSTOMER_MANAGER',0),
(4, 8, 201,'admin.menu_titles.template_layout', 'fab fa-windows','','TEMPLATE',0),
(5, 9, 2,'admin.menu_titles.admin_global', 'fab fa-whmcs','','CONFIG_SYSTEM',0),
(6, 0, 10,'admin.menu_titles.ADMIN_SHOP', 'fab fa-shopify','','ADMIN_SHOP',0),
(7, 0, 100,'admin.menu_titles.ADMIN_CONTENT', 'fas fa-file-signature','','ADMIN_CONTENT',0),
(8, 0, 300,'admin.menu_titles.ADMIN_EXTENSION', 'fas fa-th','','ADMIN_EXTENSION',0),
(9, 0, 400,'admin.menu_titles.ADMIN_SYSTEM', 'fas fa-cogs','','ADMIN_SYSTEM',0),
(10, 7, 102,'admin.menu_titles.page_manager', 'fas fa-clone','admin::page',null,0),
(11, 27, 2,'admin.menu_titles.shipping_status', 'fas fa-truck','admin::shipping_status',null,0),
(12, 1, 3,'admin.menu_titles.order', 'fas fa-shopping-cart','admin::order',null,0),
(13, 27, 1,'admin.menu_titles.order_status', 'fas fa-asterisk','admin::order_status',null,0),
(14, 27, 3,'admin.menu_titles.payment_status', 'fas fa-recycle','admin::payment_status',null,0),
(15, 2, 0,'admin.menu_titles.product', 'far fa-file-image','admin::product',null,0),
(16, 2, 0,'admin.menu_titles.category', 'fas fa-folder-open','admin::category',null,0),
(17, 27, 4,'admin.menu_titles.supplier', 'fas fa-user-secret','admin::supplier',null,0),
(18, 27, 5,'admin.menu_titles.brand', 'fas fa-university','admin::brand',null,0),
(19, 27, 8,'admin.menu_titles.attribute_group', 'fas fa-bars','admin::attribute_group',null,0),
(20, 3, 0,'admin.menu_titles.customer', 'fas fa-user','admin::customer',null,0),
(21, 3, 0,'admin.menu_titles.subscribe', 'fas fa-user-circle','admin::subscribe',null,0),
(22, 67, 1,'admin.menu_titles.block_content', 'far fa-newspaper','admin::store_block',null,0),
(23, 67, 2,'admin.menu_titles.block_link', 'fab fa-chrome','admin::store_link',null,0),
(24, 4, 0,'admin.menu_titles.template', 'fas fa-columns','admin::template',null,0),
(25, 0, 200,'admin.menu_titles.ADMIN_MARKETING', 'fas fa-sort-amount-up','','MARKETING',0),
(26, 65, 1,'admin.menu_titles.store_info', 'fas fa-h-square','admin::store_info',null,0),
(27, 9, 3,'admin.menu_titles.setting_system', 'fas fa-tools','','SETTING_SYSTEM',0),
(28, 9, 4,'admin.menu_titles.error_log', 'far fa-clone','','',0),
(29, 25, 0,'admin.menu_titles.email_template', 'fas fa-bars','admin::email_template',null,0),
(30, 9, 5,'admin.menu_titles.localisation', 'fab fa-shirtsinbulk','',null,0),
(31, 30, 1,'admin.menu_titles.language', 'fas fa-language','admin::language',null,0),
(32, 30, 3,'admin.menu_titles.currency', 'far fa-money-bill-alt','admin::currency',null,0),
(33, 7, 101,'admin.menu_titles.banner', 'fas fa-image','admin::banner',null,0),
(34, 5, 5,'admin.menu_titles.backup_restore', 'fas fa-save','admin::backup',null,0),
(35, 8, 202,'admin.menu_titles.plugin', 'fas fa-puzzle-piece','','PLUGIN',0),
(36, 28, 2,'admin.menu_titles.webhook', 'fab fa-diaspora','admin::config/webhook',null,0),
(37, 25, 5,'admin.menu_titles.report_manager', 'fas fa-chart-pie','','REPORT_MANAGER',0),
(38, 9, 1,'admin.menu_titles.user_permission', 'fas fa-users-cog','','ADMIN',0),
(39, 35, 0,'admin.menu_titles.plugin_payment', 'far fa-money-bill-alt','admin::plugin/payment',null,0),
(40, 35, 0,'admin.menu_titles.plugin_shipping', 'fas fa-ambulance','admin::plugin/shipping',null,0),
(41, 35, 0,'admin.menu_titles.plugin_total', 'fas fa-cog','admin::plugin/total',null,0),
(42, 35, 100,'admin.menu_titles.plugin_other', 'far fa-circle','admin::plugin/other',null,0),
(43, 35, 0,'admin.menu_titles.plugin_cms', 'fab fa-modx','admin::plugin/cms',null,0),
(44, 67, 2,'admin.menu_titles.css', 'far fa-file-code','admin::store_css',null,0),
(45, 25, 4,'admin.menu_titles.seo_manager', 'fab fa-battle-net','','SEO_MANAGER',0),
(46, 38, 0,'admin.menu_titles.users', 'fas fa-users','admin::user',null,0),
(47, 38, 0,'admin.menu_titles.roles', 'fas fa-user-tag','admin::role',null,0),
(48, 38, 0,'admin.menu_titles.permission', 'fas fa-ban','admin::permission',null,0),
(49, 5, 0,'admin.menu_titles.menu', 'fas fa-bars','admin::menu',null,0),
(50, 28, 0,'admin.menu_titles.operation_log', 'fas fa-history','admin::log',null,0),
(51, 45, 0,'admin.menu_titles.seo_config', 'fas fa-bars','admin::seo/config',null,0),
(52, 7, 103,'admin.menu_titles.news', 'far fa-file-powerpoint','admin::news',null,0),
(53, 5, 0,'admin.menu_titles.env_config', 'fas fa-tasks','admin::env/config',null,0),
(54, 37, 0,'admin.menu_titles.report_product', 'fas fa-bars','admin::report/product',null,0),
(57, 65, 2,'admin.menu_titles.store_config', 'fas fa-cog','admin::store_config',null,0),
(58, 5, 5,'admin.menu_titles.cache_manager', 'fab fa-tripadvisor','admin::cache_config',null,0),
(59, 9, 7,'admin.menu_titles.api_manager', 'fas fa-plug','','API_MANAGER',0),
(60, 65, 3,'admin.menu_titles.store_maintain', 'fas fa-wrench','admin::store_maintain',null,0),
(61, 27, 9,'admin.menu_titles.tax', 'far fa-calendar-minus','admin::tax',null,0),
(62, 27, 6,'admin.menu_titles.weight', 'fas fa-balance-scale','admin::weight_unit',null,0),
(63, 27, 7,'admin.menu_titles.length', 'fas fa-minus','admin::length_unit',null,0),
(65, 0, 250,'admin.menu_titles.ADMIN_SHOP_SETTING', 'fas fa-store-alt','','ADMIN_SHOP_SETTING',0),
(66, 59, 1,'admin.menu_titles.api_config', 'fas fa fa-cog','admin::api_connection',null,0),
(67, 65, 5,'admin.menu_titles.layout', 'far fa-object-group','',null,0),
(68, 27, 5,'admin.menu_titles.custom_field', 'fa fa-american-sign-language-interpreting','admin::custom_field',null,0),
(69, 30, 2,'admin.menu_titles.language_manager', 'fa fa-universal-access','admin::language_manager',null,0);

/*admin_permission*/
INSERT INTO `__SC_DB_PREFIX__admin_permission` (`id`, `name`, `slug`, `http_uri`, `created_at`) VALUES 
('1','Auth manager','auth.full', 'ANY::__SC_ADMIN_PREFIX__/auth/*', now()),
('2','Dashboard','dashboard', 'GET::__SC_ADMIN_PREFIX__', now()),
('3','Base setting','base.setting', 'ANY::__SC_ADMIN_PREFIX__/order_status/*,ANY::__SC_ADMIN_PREFIX__/shipping_status/*,ANY::__SC_ADMIN_PREFIX__/payment_status/*,ANY::__SC_ADMIN_PREFIX__/supplier/*,ANY::__SC_ADMIN_PREFIX__/brand/*,ANY::__SC_ADMIN_PREFIX__/custom_field/*,ANY::__SC_ADMIN_PREFIX__/weight_unit/*,ANY::__SC_ADMIN_PREFIX__/length_unit/*,ANY::__SC_ADMIN_PREFIX__/attribute_group/*,ANY::__SC_ADMIN_PREFIX__/tax/*', now()),
('4','Store manager','store.full','ANY::__SC_ADMIN_PREFIX__/store_info/*,ANY::__SC_ADMIN_PREFIX__/store_maintain/*,ANY::__SC_ADMIN_PREFIX__/store_config/*,ANY::__SC_ADMIN_PREFIX__/store_css/*,ANY::__SC_ADMIN_PREFIX__/store_block/*,ANY::__SC_ADMIN_PREFIX__/store_link/*',now()),
('5','Product manager','product.full','ANY::__SC_ADMIN_PREFIX__/product/*,ANY::__SC_ADMIN_PREFIX__/product_property/*,ANY::__SC_ADMIN_PREFIX__/product_tag/*',now()),
('6','Category manager','category.full','ANY::__SC_ADMIN_PREFIX__/category/*',now()),
('7','Order manager','order.full', 'ANY::__SC_ADMIN_PREFIX__/order/*', now()),
('8','Upload management','upload.full', 'ANY::__SC_ADMIN_PREFIX__/uploads/*', now()),
('9','Extension manager','extension.full', 'ANY::__SC_ADMIN_PREFIX__/template/*,ANY::__SC_ADMIN_PREFIX__/plugin/*', now()),
('10','Marketing manager','marketing.full', 'ANY::__SC_ADMIN_PREFIX__/shop_discount/*,ANY::__SC_ADMIN_PREFIX__/email_template/*,ANY::__SC_ADMIN_PREFIX__/customer/*,ANY::__SC_ADMIN_PREFIX__/subscribe/*,ANY::__SC_ADMIN_PREFIX__/seo/*', now()),
('11','Report manager','report.full', 'ANY::__SC_ADMIN_PREFIX__/report/*', now()),
('12','CMS manager','cms.full', 'ANY::__SC_ADMIN_PREFIX__/page/*,ANY::__SC_ADMIN_PREFIX__/banner/*,ANY::__SC_ADMIN_PREFIX__/banner_type/*, ANY::__SC_ADMIN_PREFIX__/cms_category/*,ANY::__SC_ADMIN_PREFIX__/cms_content/*,ANY::__SC_ADMIN_PREFIX__/news/*', now()),
('13','Update config','change.config', 'POST::__SC_ADMIN_PREFIX__/store_config/update', now());

/*admin_role*/
INSERT INTO `__SC_DB_PREFIX__admin_role` (`id`, `name`, `slug`, `created_at`) VALUES 
('1', 'Administrator', 'administrator', now()),
('2', 'Group only View', 'view.all', now()),
('3', 'Manager', 'manager', now()),
('4', 'CMS', 'cms', now()),
('5', 'Accountant', 'accountant', now()),
('6', 'Marketing', 'maketing', now());

/*admin_role_permission*/
INSERT INTO `__SC_DB_PREFIX__admin_role_permission` (`role_id`, `permission_id`, `created_at`) VALUES 
(3, 1, now()),
(3, 2, now()),
(3, 3, now()),
(3, 4, now()),
(3, 5, now()),
(3, 6, now()),
(3, 13, now()),
(3, 7, now()),
(3, 8, now()),
(3, 9, now()),
(3, 10, now()),
(3, 11, now()),
(3, 12, now()),
(4, 1, now()),
(4, 12, now()),
(5, 1, now()),
(5, 2, now()),
(5, 7, now()),
(5, 11, now()),
(6, 1, now()),
(6, 2, now()),
(6, 8, now()),
(6, 10, now()),
(6, 11, now()),
(6, 12, now());

/*admin_role_user*/
INSERT INTO `__SC_DB_PREFIX__admin_role_user` (`role_id`, `user_id`) VALUES  ('1', '1');

/*admin_user*/
INSERT INTO `__SC_DB_PREFIX__admin_user` (`id`, `username`, `password`, `email`, `name`, `avatar`, `created_at`) VALUES  
('1', '__adminUser__', '__adminPassword__', '__adminEmail__', 'Administrator', '/admin/avatar/user.jpg', now());

/*admin_config*/
INSERT INTO `__SC_DB_PREFIX__admin_config` (`group`, `code`, `key`, `value`, `sort`, `detail`, `store_id`) VALUES 
('Plugins', 'Payment', 'Cash', '1', '0', 'Plugins/Payment/Cash::lang.title', 0),
('Plugins', 'Shipping', 'ShippingStandard', '1', '0', 'Shipping Standard', 0),
('global', 'env_global', 'ADMIN_LOG', 'on', '0', 'admin.env.ADMIN_LOG', 0),
('global', 'env_global', 'ADMIN_FOOTER_OFF', '0', '0', 'admin.env.ADMIN_FOOTER_OFF', 0),
('global', 'seo_config', 'url_seo_lang', '0', '1', 'seo.url_seo_lang', 0),
('global', 'webhook_config', 'LOG_SLACK_WEBHOOK_URL', '', '0', 'admin.config.LOG_SLACK_WEBHOOK_URL', 0),
('global', 'webhook_config', 'GOOGLE_CHAT_WEBHOOK_URL', '', '0', 'admin.config.GOOGLE_CHAT_WEBHOOK_URL', 0),
('global', 'webhook_config', 'CHATWORK_CHAT_WEBHOOK_URL', '', '0', 'admin.config.CHATWORK_CHAT_WEBHOOK_URL', 0),
('global', 'api_config', 'api_connection_required', '1', '1', 'api_connection.api_connection_required', 0),
('global', 'cache', 'cache_status', '0', '0', 'admin.cache.cache_status', 0),
('global', 'cache', 'cache_time', '600', '0', 'admin.cache.cache_time', 0),
('global', 'cache', 'cache_category', '0', '3', 'admin.cache.cache_category', 0),
('global', 'cache', 'cache_product', '0', '4', 'admin.cache.cache_product', 0),
('global', 'cache', 'cache_news', '0', '5', 'admin.cache.cache_news', 0),
('global', 'cache', 'cache_category_cms', '0', '6', 'admin.cache.cache_category_cms', 0),
('global', 'cache', 'cache_content_cms', '0', '7', 'admin.cache.cache_content_cms', 0),
('global', 'cache', 'cache_page', '0', '8', 'admin.cache.cache_page', 0),
('global', 'cache', 'cache_country', '0', '10', 'admin.cache.cache_country', 0),
('global', 'env_mail', 'smtp_mode', '', '0', 'email.smtp_mode', 0);

/*admin_store*/
INSERT INTO `__SC_DB_PREFIX__admin_store` (`logo`, `template`, `phone`, `long_phone`, `email`, `time_active`, `address`, `timezone`, `language`, `currency`, `code`, `domain`) VALUES  
('data/logo/scart-mid.png', 's-cart-light', '0123456789', 'Support: 0987654321', '__adminEmail__', '', '123st - abc - xyz', '__timezone_default__', '__language_default__', 'USD', 's-cart', '__domain__');

/*admin_store_description*/
INSERT INTO `__SC_DB_PREFIX__admin_store_description` (`store_id`, `lang`, `title`, `description`, `keyword`, `maintain_content`, `maintain_note`) VALUES  
('1', 'en', 'Demo S-Cart : Free Laravel eCommerce', 'Free website shopping cart for business', '', '<center><img src="/images/maintenance.png" />
<h3><span style="color:#e74c3c;"><strong>Sorry! We are currently doing site maintenance!</strong></span></h3>
</center>', 'Website is in maintenance mode!'),
('1', 'vi', 'Demo S-Cart: Mã nguồn website thương mại điện tử miễn phí', 'Laravel shopping cart for business', '', '<center><img src="/images/maintenance.png" />
<h3><span style="color:#e74c3c;"><strong>Xin lỗi! Hiện tại website đang bảo trì!</strong></span></h3>
</center>', 'Website đang trong chế độ bảo trì!');

/*shop_language*/
INSERT INTO `__SC_DB_PREFIX__shop_language` (`id`, `name`, `code`, `icon`, `status`, `rtl`, `sort`) VALUES 
('1','English','en', '/data/language/flag_uk.png','1','0','1'),
('2','Tiếng Việt','vi', '/data/language/flag_vn.png','1','0','1');

/*shop_payment_status*/
INSERT INTO `__SC_DB_PREFIX__shop_payment_status` (`id`, `name`) VALUES 
('1','Unpaid'),
('2','Partial payment'),
('3','Paid'),
('4','Refurn');

/*shop_shipping_status*/
INSERT INTO `__SC_DB_PREFIX__shop_shipping_status` (`id`, `name`) VALUES 
('1','Not sent'),
('2','Sending'),
('3','Shipping done');

/*shop_layout_page*/
INSERT INTO `__SC_DB_PREFIX__shop_layout_page` (`key`, `name`) VALUES 
('home', 'admin.layout_page_position.home'),
('shop_home', 'admin.layout_page_position.shop_home'),
('shop_product_list', 'admin.layout_page_position.product_list'),
('product_detail', 'admin.layout_page_position.product_detail'),
('shop_cart', 'admin.layout_page_position.shop_cart'),
('shop_item_list', 'admin.layout_page_position.item_list'),
('shop_item_detail', 'admin.layout_page_position.item_detail'),
('shop_news', 'admin.layout_page_position.news_list'),
('shop_news_detail', 'admin.layout_page_position.news_detail'),
('shop_auth', 'admin.layout_page_position.shop_auth'),
('shop_profile', 'admin.layout_page_position.shop_profile'),
('shop_page', 'admin.layout_page_position.shop_page'),
('shop_contact', 'admin.layout_page_position.shop_contact'),
('content_list', 'admin.layout_page_position.content_list'),
('content_detail', 'admin.layout_page_position.content_detail'),
('store_home', 'admin.layout_page_position.store_home'),
('store_product_list', 'admin.layout_page_position.store_product_list');

/*shop_layout_position*/
INSERT INTO `__SC_DB_PREFIX__shop_layout_position` (`key`, `name`) VALUES 
('header', 'admin.layout_page_block.header'),
('top', 'admin.layout_page_block.top'),
('bottom', 'admin.layout_page_block.bottom'),
('left', 'admin.layout_page_block.left'),
('right', 'admin.layout_page_block.right'),
('banner_top', 'admin.layout_page_block.banner_top');

/*shop_link*/
INSERT INTO `__SC_DB_PREFIX__shop_link` (`name`, `url`, `target`, `module`, `group`, `status`, `sort`) VALUES 
('front.blog', 'route::news', '_self', '',  'menu', '1', '30'),
('front.contact', 'route::contact', '_self', '',  'menu', '1', '40'),
('front.about', 'route::page.detail::about', '_self', '',  'menu', '1', '50'),
('front.my_profile', 'route::login', '_self', '',  'footer', '1', '60'),
('front.compare_page', 'route::compare', '_self', '',  'footer', '1', '70'),
('front.wishlist_page', 'route::wishlist', '_self', '',  'footer', '1', '80');

/*shop_link_store*/
INSERT INTO `__SC_DB_PREFIX__shop_link_store` (`link_id`, `store_id`) VALUES 
(1,'1'),
(2,'1'),
(3,'1'),
(4,'1'),
(5,'1'),
(6,'1');

/*shop_shipping_standard*/
INSERT INTO `__SC_DB_PREFIX__shop_shipping_standard` (`fee`, `shipping_free`) VALUES (20, 10000);


/*shop_attribute_group*/
INSERT INTO `__SC_DB_PREFIX__shop_attribute_group` (`name`, `status`, `sort`, `type`) VALUES 
('Color', '1', '1', 'radio'),
('Size', '1', '2', 'select');

/*shop_currency*/
INSERT INTO `__SC_DB_PREFIX__shop_currency` (`id`, `name`, `code`, `symbol`, `exchange_rate`, `precision`, `symbol_first`, `thousands`, `status`, `sort`) VALUES 
('1', 'USD Dola','USD','$','1', '0', '1', ',', '1', '0'),
('2', 'VietNam Dong','VND','₫','20', '0', '0', ',', '1', '1');

/*shop_order_status*/
INSERT INTO `__SC_DB_PREFIX__shop_order_status` (`id`, `name`) VALUES 
('1','New'),
('2','Processing'),
('3','Hold'),
('4','Canceled'),
('5','Done'),
('6','Failed');

/*shop_page*/
INSERT INTO `__SC_DB_PREFIX__shop_page` (`id`, `image`,  `alias`, `status`) VALUES 
('1', '', 'about', '1');

/*shop_page_store*/
INSERT INTO `__SC_DB_PREFIX__shop_page_store` (`page_id`, `store_id`) VALUES 
(1,'1');

/*shop_page_description*/
INSERT INTO `__SC_DB_PREFIX__shop_page_description` (`page_id`, `lang`,  `title`, `keyword`, `description`, `content`) VALUES 
('1', 'en', 'About', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-2.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('1', 'vi', 'Giới thiệu', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-2.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');

/*api_connection*/
INSERT INTO `__SC_DB_PREFIX__api_connection` (`description`, `apiconnection`, `apikey`, `status`) VALUES 
('Demo api connection', 'appmobile',  UUID(), 0);

/*shop_tax*/
INSERT INTO `__SC_DB_PREFIX__shop_tax` (`id`, `name`, `value`) VALUES 
('1', 'Tax default (10%)', 10);

/*shop_weight*/
INSERT INTO `__SC_DB_PREFIX__shop_weight` (`id`, `name`, `description`) VALUES 
('1', 'g', 'Gram'),
('2', 'kg', 'Kilogram'),
('3', 'lb', 'Pound '),
('4', 'oz', 'Ounce ');

/*shop_length*/
INSERT INTO `__SC_DB_PREFIX__shop_length` (`id`, `name`, `description`) VALUES 
('1','mm','Millimeter'),
('2','cm','Centimeter'),
('3','m','Meter'),
('4','in','Inch');


