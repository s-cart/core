-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table s-cart.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table s-cart.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table s-cart.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.migrations: ~2 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '00_00_00_step1_create_tables_admin', 1),
	(2, '00_00_00_step2_create_tables_shop', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table s-cart.oauth_access_tokens
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.oauth_access_tokens: ~0 rows (approximately)
DELETE FROM `oauth_access_tokens`;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table s-cart.oauth_auth_codes
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.oauth_auth_codes: ~0 rows (approximately)
DELETE FROM `oauth_auth_codes`;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table s-cart.oauth_clients
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.oauth_clients: ~2 rows (approximately)
DELETE FROM `oauth_clients`;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	('946c7819-9053-483b-98fb-5b26af2d75bc', NULL, 'SCart Personal Access Client', 'YywxJi1F77SWeqm5a6HuDf4a3TvjX3pY3CKO6jim', NULL, 'http://localhost', 1, 0, 0, '2021-09-18 10:32:03', '2021-09-18 10:32:03'),
	('946c7819-93e4-4436-b84e-70c53238df5c', NULL, 'SCart Password Grant Client', 'Xkluu3NKk9KUpHlgarKlUKHmk0FqkLeBQvSoMUeI', 'users', 'http://localhost', 0, 1, 0, '2021-09-18 10:32:03', '2021-09-18 10:32:03');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table s-cart.oauth_personal_access_clients
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.oauth_personal_access_clients: ~1 rows (approximately)
DELETE FROM `oauth_personal_access_clients`;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, '946c7819-9053-483b-98fb-5b26af2d75bc', '2021-09-18 10:32:03', '2021-09-18 10:32:03');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table s-cart.oauth_refresh_tokens
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.oauth_refresh_tokens: ~0 rows (approximately)
DELETE FROM `oauth_refresh_tokens`;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_config
DROP TABLE IF EXISTS `sc_admin_config`;
CREATE TABLE IF NOT EXISTS `sc_admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security` int(11) DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `detail` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_config_key_store_id_unique` (`key`,`store_id`),
  KEY `sc_admin_config_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_config: ~130 rows (approximately)
DELETE FROM `sc_admin_config`;
/*!40000 ALTER TABLE `sc_admin_config` DISABLE KEYS */;
INSERT INTO `sc_admin_config` (`id`, `group`, `code`, `key`, `value`, `security`, `store_id`, `sort`, `detail`) VALUES
	(1, 'Plugins', 'Payment', 'Cash', '1', 0, 0, 0, 'Plugins/Payment/Cash::lang.title'),
	(2, 'Plugins', 'Shipping', 'ShippingStandard', '1', 0, 0, 0, 'Shipping Standard'),
	(3, 'global', 'env_global', 'ADMIN_LOG', 'on', 0, 0, 0, 'admin.env.ADMIN_LOG'),
	(4, 'global', 'seo_config', 'url_seo_lang', '0', 0, 0, 1, 'seo.url_seo_lang'),
	(5, 'global', 'webhook_config', 'LOG_SLACK_WEBHOOK_URL', '', 0, 0, 0, 'admin.config.LOG_SLACK_WEBHOOK_URL'),
	(6, 'global', 'webhook_config', 'GOOGLE_CHAT_WEBHOOK_URL', '', 0, 0, 0, 'admin.config.GOOGLE_CHAT_WEBHOOK_URL'),
	(7, 'global', 'webhook_config', 'CHATWORK_CHAT_WEBHOOK_URL', '', 0, 0, 0, 'admin.config.CHATWORK_CHAT_WEBHOOK_URL'),
	(8, 'global', 'api_config', 'api_connection_required', '1', 0, 0, 1, 'api_connection.api_connection_required'),
	(9, 'global', 'api_config', 'api_mode', '0', 0, 0, 1, 'api_connection.api_mode'),
	(10, 'global', 'cache', 'cache_status', '0', 0, 0, 0, 'admin.cache.cache_status'),
	(11, 'global', 'cache', 'cache_time', '600', 0, 0, 0, 'admin.cache.cache_time'),
	(12, 'global', 'cache', 'cache_category', '0', 0, 0, 3, 'admin.cache.cache_category'),
	(13, 'global', 'cache', 'cache_product', '0', 0, 0, 4, 'admin.cache.cache_product'),
	(14, 'global', 'cache', 'cache_news', '0', 0, 0, 5, 'admin.cache.cache_news'),
	(15, 'global', 'cache', 'cache_category_cms', '0', 0, 0, 6, 'admin.cache.cache_category_cms'),
	(16, 'global', 'cache', 'cache_content_cms', '0', 0, 0, 7, 'admin.cache.cache_content_cms'),
	(17, 'global', 'cache', 'cache_page', '0', 0, 0, 8, 'admin.cache.cache_page'),
	(18, 'global', 'cache', 'cache_country', '0', 0, 0, 10, 'admin.cache.cache_country'),
	(19, 'global', 'env_mail', 'smtp_mode', '', 0, 0, 0, 'email.smtp_mode'),
	(20, '', 'product_config_attribute', 'product_brand', '1', 0, 1, 0, 'product.config_manager.brand'),
	(21, '', 'product_config_attribute_required', 'product_brand_required', '0', 0, 1, 0, ''),
	(22, '', 'product_config_attribute', 'product_supplier', '1', 0, 1, 0, 'product.config_manager.supplier'),
	(23, '', 'product_config_attribute_required', 'product_supplier_required', '0', 0, 1, 0, ''),
	(24, '', 'product_config_attribute', 'product_price', '1', 0, 1, 0, 'product.config_manager.price'),
	(25, '', 'product_config_attribute_required', 'product_price_required', '1', 0, 1, 0, ''),
	(26, '', 'product_config_attribute', 'product_cost', '1', 0, 1, 0, 'product.config_manager.cost'),
	(27, '', 'product_config_attribute_required', 'product_cost_required', '0', 0, 1, 0, ''),
	(28, '', 'product_config_attribute', 'product_promotion', '1', 0, 1, 0, 'product.config_manager.promotion'),
	(29, '', 'product_config_attribute_required', 'product_promotion_required', '0', 0, 1, 0, ''),
	(30, '', 'product_config_attribute', 'product_stock', '1', 0, 1, 0, 'product.config_manager.stock'),
	(31, '', 'product_config_attribute_required', 'product_stock_required', '0', 0, 1, 0, ''),
	(32, '', 'product_config_attribute', 'product_kind', '1', 0, 1, 0, 'product.config_manager.kind'),
	(33, '', 'product_config_attribute', 'product_property', '1', 0, 1, 0, 'product.config_manager.property'),
	(34, '', 'product_config_attribute_required', 'product_property_required', '0', 0, 1, 0, ''),
	(35, '', 'product_config_attribute', 'product_attribute', '1', 0, 1, 0, 'product.config_manager.attribute'),
	(36, '', 'product_config_attribute_required', 'product_attribute_required', '0', 0, 1, 0, ''),
	(37, '', 'product_config_attribute', 'product_available', '1', 0, 1, 0, 'product.config_manager.available'),
	(38, '', 'product_config_attribute_required', 'product_available_required', '0', 0, 1, 0, ''),
	(39, '', 'product_config_attribute', 'product_weight', '1', 0, 1, 0, 'product.config_manager.weight'),
	(40, '', 'product_config_attribute_required', 'product_weight_required', '0', 0, 1, 0, ''),
	(41, '', 'product_config_attribute', 'product_length', '1', 0, 1, 0, 'product.config_manager.length'),
	(42, '', 'product_config_attribute_required', 'product_length_required', '0', 0, 1, 0, ''),
	(43, '', 'product_config', 'product_display_out_of_stock', '1', 0, 1, 19, 'product.config_manager.product_display_out_of_stock'),
	(44, '', 'product_config', 'show_date_available', '1', 0, 1, 21, 'product.config_manager.show_date_available'),
	(45, '', 'product_config', 'product_tax', '1', 0, 1, 0, 'product.config_manager.tax'),
	(46, '', 'customer_config_attribute', 'customer_lastname', '1', 0, 1, 1, 'customer.config_manager.lastname'),
	(47, '', 'customer_config_attribute_required', 'customer_lastname_required', '1', 0, 1, 1, ''),
	(48, '', 'customer_config_attribute', 'customer_address1', '1', 0, 1, 2, 'customer.config_manager.address1'),
	(49, '', 'customer_config_attribute_required', 'customer_address1_required', '1', 0, 1, 2, ''),
	(50, '', 'customer_config_attribute', 'customer_address2', '1', 0, 1, 2, 'customer.config_manager.address2'),
	(51, '', 'customer_config_attribute_required', 'customer_address2_required', '1', 0, 1, 2, ''),
	(52, '', 'customer_config_attribute', 'customer_address3', '0', 0, 1, 2, 'customer.config_manager.address3'),
	(53, '', 'customer_config_attribute_required', 'customer_address3_required', '0', 0, 1, 2, ''),
	(54, '', 'customer_config_attribute', 'customer_company', '0', 0, 1, 0, 'customer.config_manager.company'),
	(55, '', 'customer_config_attribute_required', 'customer_company_required', '0', 0, 1, 0, ''),
	(56, '', 'customer_config_attribute', 'customer_postcode', '0', 0, 1, 0, 'customer.config_manager.postcode'),
	(57, '', 'customer_config_attribute_required', 'customer_postcode_required', '0', 0, 1, 0, ''),
	(58, '', 'customer_config_attribute', 'customer_country', '1', 0, 1, 0, 'customer.config_manager.country'),
	(59, '', 'customer_config_attribute_required', 'customer_country_required', '1', 0, 1, 0, ''),
	(60, '', 'customer_config_attribute', 'customer_group', '0', 0, 1, 0, 'customer.config_manager.group'),
	(61, '', 'customer_config_attribute_required', 'customer_group_required', '0', 0, 1, 0, ''),
	(62, '', 'customer_config_attribute', 'customer_birthday', '0', 0, 1, 0, 'customer.config_manager.birthday'),
	(63, '', 'customer_config_attribute_required', 'customer_birthday_required', '0', 0, 1, 0, ''),
	(64, '', 'customer_config_attribute', 'customer_sex', '0', 0, 1, 0, 'customer.config_manager.sex'),
	(65, '', 'customer_config_attribute_required', 'customer_sex_required', '0', 0, 1, 0, ''),
	(66, '', 'customer_config_attribute', 'customer_phone', '1', 0, 1, 0, 'customer.config_manager.phone'),
	(67, '', 'customer_config_attribute_required', 'customer_phone_required', '1', 0, 1, 1, ''),
	(68, '', 'customer_config_attribute', 'customer_name_kana', '0', 0, 1, 0, 'customer.config_manager.name_kana'),
	(69, '', 'customer_config_attribute_required', 'customer_name_kana_required', '0', 0, 1, 1, ''),
	(70, '', 'admin_config', 'ADMIN_NAME', 'S-Cart System', 0, 1, 0, 'admin.env.ADMIN_NAME'),
	(71, '', 'admin_config', 'ADMIN_TITLE', 'S-Cart Admin', 0, 1, 0, 'admin.env.ADMIN_TITLE'),
	(72, '', 'admin_config', 'ADMIN_LOGO', 'S-Cart <span class="brand-text font-weight-light">Admin</span>', 0, 1, 0, 'admin.env.ADMIN_LOGO'),
	(73, '', 'admin_config', 'hidden_copyright_footer', '0', 0, 1, 0, 'admin.env.hidden_copyright_footer'),
	(74, '', 'admin_config', 'hidden_copyright_footer_admin', '0', 0, 1, 0, 'admin.env.hidden_copyright_footer_admin'),
	(75, '', 'display_config', 'product_top', '8', 0, 1, 0, 'store.display.product_top'),
	(76, '', 'display_config', 'product_list', '12', 0, 1, 0, 'store.display.list_product'),
	(77, '', 'display_config', 'product_relation', '4', 0, 1, 0, 'store.display.relation_product'),
	(78, '', 'display_config', 'product_viewed', '4', 0, 1, 0, 'store.display.viewed_product'),
	(79, '', 'display_config', 'item_list', '12', 0, 1, 0, 'store.display.item_list'),
	(80, '', 'display_config', 'item_top', '8', 0, 1, 0, 'store.display.item_top'),
	(81, '', 'order_config', 'shop_allow_guest', '1', 0, 1, 11, 'order.admin.shop_allow_guest'),
	(82, '', 'order_config', 'product_preorder', '1', 0, 1, 18, 'order.admin.product_preorder'),
	(83, '', 'order_config', 'product_buy_out_of_stock', '1', 0, 1, 20, 'order.admin.product_buy_out_of_stock'),
	(84, '', 'order_config', 'shipping_off', '0', 0, 1, 20, 'order.admin.shipping_off'),
	(85, '', 'order_config', 'payment_off', '0', 0, 1, 20, 'order.admin.payment_off'),
	(86, '', 'email_action', 'email_action_mode', '0', 0, 1, 0, 'email.email_action.email_action_mode'),
	(87, '', 'email_action', 'email_action_queue', '0', 0, 1, 1, 'email.email_action.email_action_queue'),
	(88, '', 'email_action', 'order_success_to_admin', '0', 0, 1, 1, 'email.email_action.order_success_to_admin'),
	(89, '', 'email_action', 'order_success_to_customer', '0', 0, 1, 2, 'email.email_action.order_success_to_cutomer'),
	(90, '', 'email_action', 'order_success_to_customer_pdf', '0', 0, 1, 3, 'email.email_action.order_success_to_cutomer_pdf'),
	(91, '', 'email_action', 'customer_verify', '0', 0, 1, 4, 'email.email_action.customer_verify'),
	(92, '', 'email_action', 'welcome_customer', '0', 0, 1, 4, 'email.email_action.welcome_customer'),
	(93, '', 'email_action', 'contact_to_admin', '1', 0, 1, 6, 'email.email_action.contact_to_admin'),
	(94, '', 'smtp_config', 'smtp_host', '', 0, 1, 1, 'email.config_smtp.smtp_host'),
	(95, '', 'smtp_config', 'smtp_user', '', 0, 1, 2, 'email.config_smtp.smtp_user'),
	(96, '', 'smtp_config', 'smtp_password', '', 0, 1, 3, 'email.config_smtp.smtp_password'),
	(97, '', 'smtp_config', 'smtp_security', '', 0, 1, 4, 'email.config_smtp.smtp_security'),
	(98, '', 'smtp_config', 'smtp_port', '', 0, 1, 5, 'email.config_smtp.smtp_port'),
	(99, '', 'smtp_config', 'smtp_name', '', 0, 1, 6, 'email.config_smtp.smtp_name'),
	(100, '', 'smtp_config', 'smtp_from', '', 0, 1, 7, 'email.config_smtp.smtp_from'),
	(101, '', 'url_config', 'SUFFIX_URL', '.html', 0, 1, 0, 'admin.env.SUFFIX_URL'),
	(102, '', 'url_config', 'PREFIX_SHOP', 'shop', 0, 1, 0, 'admin.env.PREFIX_SHOP'),
	(103, '', 'url_config', 'PREFIX_BRAND', 'brand', 0, 1, 0, 'admin.env.PREFIX_BRAND'),
	(104, '', 'url_config', 'PREFIX_CATEGORY', 'category', 0, 1, 0, 'admin.env.PREFIX_CATEGORY'),
	(105, '', 'url_config', 'PREFIX_CATEGORY_VENDOR', 'category-vendor', 0, 1, 0, 'admin.env.PREFIX_CATEGORY_VENDOR'),
	(106, '', 'url_config', 'PREFIX_SUB_CATEGORY', 'sub-category', 0, 1, 0, 'admin.env.PREFIX_SUB_CATEGORY'),
	(107, '', 'url_config', 'PREFIX_PRODUCT', 'product', 0, 1, 0, 'admin.env.PREFIX_PRODUCT'),
	(108, '', 'url_config', 'PREFIX_SEARCH', 'search', 0, 1, 0, 'admin.env.PREFIX_SEARCH'),
	(109, '', 'url_config', 'PREFIX_CONTACT', 'contact', 0, 1, 0, 'admin.env.PREFIX_CONTACT'),
	(110, '', 'url_config', 'PREFIX_NEWS', 'news', 0, 1, 0, 'admin.env.PREFIX_NEWS'),
	(111, '', 'url_config', 'PREFIX_MEMBER', 'customer', 0, 1, 0, 'admin.env.PREFIX_MEMBER'),
	(112, '', 'url_config', 'PREFIX_MEMBER_ORDER_LIST', 'order-list', 0, 1, 0, 'admin.env.PREFIX_MEMBER_ORDER_LIST'),
	(113, '', 'url_config', 'PREFIX_MEMBER_CHANGE_PWD', 'change-password', 0, 1, 0, 'admin.env.PREFIX_MEMBER_CHANGE_PWD'),
	(114, '', 'url_config', 'PREFIX_MEMBER_CHANGE_INFO', 'change-info', 0, 1, 0, 'admin.env.PREFIX_MEMBER_CHANGE_INFO'),
	(115, '', 'url_config', 'PREFIX_CMS_CATEGORY', 'cms-category', 0, 1, 0, 'admin.env.PREFIX_CMS_CATEGORY'),
	(116, '', 'url_config', 'PREFIX_CMS_ENTRY', 'entry', 0, 1, 0, 'admin.env.PREFIX_CMS_ENTRY'),
	(117, '', 'url_config', 'PREFIX_CART_WISHLIST', 'wishlst', 0, 1, 0, 'admin.env.PREFIX_CART_WISHLIST'),
	(118, '', 'url_config', 'PREFIX_CART_COMPARE', 'compare', 0, 1, 0, 'admin.env.PREFIX_CART_COMPARE'),
	(119, '', 'url_config', 'PREFIX_CART_DEFAULT', 'cart', 0, 1, 0, 'admin.env.PREFIX_CART_DEFAULT'),
	(120, '', 'url_config', 'PREFIX_CART_CHECKOUT', 'checkout', 0, 1, 0, 'admin.env.PREFIX_CART_CHECKOUT'),
	(121, '', 'url_config', 'PREFIX_CART_CHECKOUT_CONFIRM', 'checkout-confirm', 0, 1, 0, 'admin.env.PREFIX_CART_CHECKOUT_CONFIRM'),
	(122, '', 'url_config', 'PREFIX_ORDER_SUCCESS', 'order-success', 0, 1, 0, 'admin.env.PREFIX_ORDER_SUCCESS'),
	(123, '', 'captcha_config', 'captcha_mode', '0', 0, 1, 20, 'admin.captcha.captcha_mode'),
	(124, '', 'captcha_config', 'captcha_page', '[]', 0, 1, 10, 'captcha.captcha_page'),
	(125, '', 'captcha_config', 'captcha_method', '', 0, 1, 0, 'admin.captcha.captcha_method'),
	(126, '', 'admin_custom_config', 'facebook_url', 'https://www.facebook.com/SCart.Ecommerce/', 0, 1, 0, 'admin.admin_custom_config.facebook_url'),
	(127, '', 'admin_custom_config', 'fanpage_url', 'https://www.facebook.com/groups/scart.opensource', 0, 1, 0, 'admin.admin_custom_config.fanpage_url'),
	(128, '', 'admin_custom_config', 'twitter_url', 'https://twitter.com/ecommercescart', 0, 1, 0, 'admin.admin_custom_config.twitter_url'),
	(129, '', 'admin_custom_config', 'instagram_url', '#', 0, 1, 0, 'admin.admin_custom_config.instagram_url'),
	(130, '', 'admin_custom_config', 'youtube_url', 'https://www.youtube.com/channel/UCR8kitefby3N6KvvawQVqdg/videos', 0, 1, 0, 'admin.admin_custom_config.youtube_url');
/*!40000 ALTER TABLE `sc_admin_config` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_log
DROP TABLE IF EXISTS `sc_admin_log`;
CREATE TABLE IF NOT EXISTS `sc_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_admin_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_log: ~11 rows (approximately)
DELETE FROM `sc_admin_log`;
/*!40000 ALTER TABLE `sc_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_admin_log` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_menu
DROP TABLE IF EXISTS `sc_admin_menu`;
CREATE TABLE IF NOT EXISTS `sc_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `hidden` int(11) NOT NULL DEFAULT 0,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_menu_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_menu: ~66 rows (approximately)
DELETE FROM `sc_admin_menu`;
/*!40000 ALTER TABLE `sc_admin_menu` DISABLE KEYS */;
INSERT INTO `sc_admin_menu` (`id`, `parent_id`, `sort`, `title`, `icon`, `uri`, `type`, `hidden`, `key`, `created_at`, `updated_at`) VALUES
	(1, 6, 1, 'admin.menu_titles.order_manager', 'fas fa-cart-arrow-down', '', 0, 0, 'ORDER_MANAGER', NULL, NULL),
	(2, 6, 2, 'admin.menu_titles.catalog_mamager', 'fas fa-folder-open', '', 0, 0, 'CATALOG_MANAGER', NULL, NULL),
	(3, 25, 3, 'admin.menu_titles.customer_manager', 'fas fa-users', '', 0, 0, 'CUSTOMER_MANAGER', NULL, NULL),
	(4, 8, 201, 'admin.menu_titles.template_layout', 'fab fa-windows', '', 0, 0, 'TEMPLATE', NULL, NULL),
	(5, 9, 2, 'admin.menu_titles.admin_global', 'fab fa-whmcs', '', 0, 0, 'CONFIG_SYSTEM', NULL, NULL),
	(6, 0, 10, 'admin.menu_titles.ADMIN_SHOP', 'fab fa-shopify', '', 0, 0, 'ADMIN_SHOP', NULL, NULL),
	(7, 0, 100, 'admin.menu_titles.ADMIN_CONTENT', 'fas fa-file-signature', '', 0, 0, 'ADMIN_CONTENT', NULL, NULL),
	(8, 0, 300, 'admin.menu_titles.ADMIN_EXTENSION', 'fas fa-th', '', 0, 0, 'ADMIN_EXTENSION', NULL, NULL),
	(9, 0, 400, 'admin.menu_titles.ADMIN_SYSTEM', 'fas fa-cogs', '', 0, 0, 'ADMIN_SYSTEM', NULL, NULL),
	(10, 7, 102, 'admin.menu_titles.page_manager', 'fas fa-clone', 'admin::page', 0, 0, NULL, NULL, NULL),
	(11, 27, 2, 'admin.menu_titles.shipping_status', 'fas fa-truck', 'admin::shipping_status', 0, 0, NULL, NULL, NULL),
	(12, 1, 3, 'admin.menu_titles.order', 'fas fa-shopping-cart', 'admin::order', 0, 0, NULL, NULL, NULL),
	(13, 27, 1, 'admin.menu_titles.order_status', 'fas fa-asterisk', 'admin::order_status', 0, 0, NULL, NULL, NULL),
	(14, 27, 3, 'admin.menu_titles.payment_status', 'fas fa-recycle', 'admin::payment_status', 0, 0, NULL, NULL, NULL),
	(15, 2, 0, 'admin.menu_titles.product', 'far fa-file-image', 'admin::product', 0, 0, NULL, NULL, NULL),
	(16, 2, 0, 'admin.menu_titles.category', 'fas fa-folder-open', 'admin::category', 0, 0, NULL, NULL, NULL),
	(17, 27, 4, 'admin.menu_titles.supplier', 'fas fa-user-secret', 'admin::supplier', 0, 0, NULL, NULL, NULL),
	(18, 27, 5, 'admin.menu_titles.brand', 'fas fa-university', 'admin::brand', 0, 0, NULL, NULL, NULL),
	(19, 27, 8, 'admin.menu_titles.attribute_group', 'fas fa-bars', 'admin::attribute_group', 0, 0, NULL, NULL, NULL),
	(20, 3, 0, 'admin.menu_titles.customer', 'fas fa-user', 'admin::customer', 0, 0, NULL, NULL, NULL),
	(21, 3, 0, 'admin.menu_titles.subscribe', 'fas fa-user-circle', 'admin::subscribe', 0, 0, NULL, NULL, NULL),
	(22, 67, 1, 'admin.menu_titles.block_content', 'far fa-newspaper', 'admin::store_block', 0, 0, NULL, NULL, NULL),
	(23, 67, 2, 'admin.menu_titles.block_link', 'fab fa-chrome', 'admin::store_link', 0, 0, NULL, NULL, NULL),
	(24, 4, 0, 'admin.menu_titles.template', 'fas fa-columns', 'admin::template', 0, 0, NULL, NULL, NULL),
	(25, 0, 200, 'admin.menu_titles.ADMIN_MARKETING', 'fas fa-sort-amount-up', '', 0, 0, 'MARKETING', NULL, NULL),
	(26, 65, 1, 'admin.menu_titles.store_info', 'fas fa-h-square', 'admin::store_info', 0, 0, NULL, NULL, NULL),
	(27, 9, 3, 'admin.menu_titles.setting_system', 'fas fa-tools', '', 0, 0, 'SETTING_SYSTEM', NULL, NULL),
	(28, 9, 4, 'admin.menu_titles.error_log', 'far fa-clone', '', 0, 0, '', NULL, NULL),
	(29, 25, 0, 'admin.menu_titles.email_template', 'fas fa-bars', 'admin::email_template', 0, 0, NULL, NULL, NULL),
	(30, 9, 5, 'admin.menu_titles.localisation', 'fab fa-shirtsinbulk', '', 0, 0, NULL, NULL, NULL),
	(31, 30, 1, 'admin.menu_titles.language', 'fas fa-language', 'admin::language', 0, 0, NULL, NULL, NULL),
	(32, 30, 3, 'admin.menu_titles.currency', 'far fa-money-bill-alt', 'admin::currency', 0, 0, NULL, NULL, NULL),
	(33, 7, 101, 'admin.menu_titles.banner', 'fas fa-image', 'admin::banner', 0, 0, NULL, NULL, NULL),
	(34, 5, 5, 'admin.menu_titles.backup_restore', 'fas fa-save', 'admin::backup', 0, 0, NULL, NULL, NULL),
	(35, 8, 202, 'admin.menu_titles.plugin', 'fas fa-puzzle-piece', '', 0, 0, 'PLUGIN', NULL, NULL),
	(36, 28, 2, 'admin.menu_titles.webhook', 'fab fa-diaspora', 'admin::config/webhook', 0, 0, NULL, NULL, NULL),
	(37, 25, 5, 'admin.menu_titles.report_manager', 'fas fa-chart-pie', '', 0, 0, 'REPORT_MANAGER', NULL, NULL),
	(38, 9, 1, 'admin.menu_titles.user_permission', 'fas fa-users-cog', '', 0, 0, 'ADMIN', NULL, NULL),
	(39, 35, 0, 'admin.menu_titles.plugin_payment', 'far fa-money-bill-alt', 'admin::plugin/payment', 0, 0, NULL, NULL, NULL),
	(40, 35, 0, 'admin.menu_titles.plugin_shipping', 'fas fa-ambulance', 'admin::plugin/shipping', 0, 0, NULL, NULL, NULL),
	(41, 35, 0, 'admin.menu_titles.plugin_total', 'fas fa-cog', 'admin::plugin/total', 0, 0, NULL, NULL, NULL),
	(42, 35, 100, 'admin.menu_titles.plugin_other', 'far fa-circle', 'admin::plugin/other', 0, 0, NULL, NULL, NULL),
	(43, 35, 0, 'admin.menu_titles.plugin_cms', 'fab fa-modx', 'admin::plugin/cms', 0, 0, NULL, NULL, NULL),
	(44, 67, 2, 'admin.menu_titles.css', 'far fa-file-code', 'admin::store_css', 0, 0, NULL, NULL, NULL),
	(45, 25, 4, 'admin.menu_titles.seo_manager', 'fab fa-battle-net', '', 0, 0, 'SEO_MANAGER', NULL, NULL),
	(46, 38, 0, 'admin.menu_titles.users', 'fas fa-users', 'admin::user', 0, 0, NULL, NULL, NULL),
	(47, 38, 0, 'admin.menu_titles.roles', 'fas fa-user-tag', 'admin::role', 0, 0, NULL, NULL, NULL),
	(48, 38, 0, 'admin.menu_titles.permission', 'fas fa-ban', 'admin::permission', 0, 0, NULL, NULL, NULL),
	(49, 5, 0, 'admin.menu_titles.menu', 'fas fa-bars', 'admin::menu', 0, 0, NULL, NULL, NULL),
	(50, 28, 0, 'admin.menu_titles.operation_log', 'fas fa-history', 'admin::log', 0, 0, NULL, NULL, NULL),
	(51, 45, 0, 'admin.menu_titles.seo_config', 'fas fa-bars', 'admin::seo/config', 0, 0, NULL, NULL, NULL),
	(52, 7, 103, 'admin.menu_titles.news', 'far fa-file-powerpoint', 'admin::news', 0, 0, NULL, NULL, NULL),
	(53, 5, 0, 'admin.menu_titles.env_config', 'fas fa-tasks', 'admin::env/config', 0, 0, NULL, NULL, NULL),
	(54, 37, 0, 'admin.menu_titles.report_product', 'fas fa-bars', 'admin::report/product', 0, 0, NULL, NULL, NULL),
	(57, 65, 2, 'admin.menu_titles.store_config', 'fas fa-cog', 'admin::store_config', 0, 0, NULL, NULL, NULL),
	(58, 5, 5, 'admin.menu_titles.cache_manager', 'fab fa-tripadvisor', 'admin::cache_config', 0, 0, NULL, NULL, NULL),
	(59, 9, 7, 'admin.menu_titles.api_manager', 'fas fa-plug', '', 0, 0, 'API_MANAGER', NULL, NULL),
	(60, 65, 3, 'admin.menu_titles.store_maintain', 'fas fa-wrench', 'admin::store_maintain', 0, 0, NULL, NULL, NULL),
	(61, 27, 9, 'admin.menu_titles.tax', 'far fa-calendar-minus', 'admin::tax', 0, 0, NULL, NULL, NULL),
	(62, 27, 6, 'admin.menu_titles.weight', 'fas fa-balance-scale', 'admin::weight_unit', 0, 0, NULL, NULL, NULL),
	(63, 27, 7, 'admin.menu_titles.length', 'fas fa-minus', 'admin::length_unit', 0, 0, NULL, NULL, NULL),
	(65, 0, 250, 'admin.menu_titles.ADMIN_SHOP_SETTING', 'fas fa-store-alt', '', 0, 0, 'ADMIN_SHOP_SETTING', NULL, NULL),
	(66, 59, 1, 'admin.menu_titles.api_config', 'fas fa fa-cog', 'admin::api_connection', 0, 0, NULL, NULL, NULL),
	(67, 65, 5, 'admin.menu_titles.layout', 'far fa-object-group', '', 0, 0, NULL, NULL, NULL),
	(68, 27, 5, 'admin.menu_titles.custom_field', 'fa fa-american-sign-language-interpreting', 'admin::custom_field', 0, 0, NULL, NULL, NULL),
	(69, 30, 2, 'admin.menu_titles.language_manager', 'fa fa-universal-access', 'admin::language_manager', 0, 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `sc_admin_menu` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_permission
DROP TABLE IF EXISTS `sc_admin_permission`;
CREATE TABLE IF NOT EXISTS `sc_admin_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_uri` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_permission_name_unique` (`name`),
  UNIQUE KEY `sc_admin_permission_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_permission: ~13 rows (approximately)
DELETE FROM `sc_admin_permission`;
/*!40000 ALTER TABLE `sc_admin_permission` DISABLE KEYS */;
INSERT INTO `sc_admin_permission` (`id`, `name`, `slug`, `http_uri`, `created_at`, `updated_at`) VALUES
	(1, 'Auth manager', 'auth.full', 'ANY::sc_admin/auth/*', '2021-09-18 10:32:02', NULL),
	(2, 'Dashboard', 'dashboard', 'GET::sc_admin', '2021-09-18 10:32:02', NULL),
	(3, 'Base setting', 'base.setting', 'ANY::sc_admin/order_status/*,ANY::sc_admin/shipping_status/*,ANY::sc_admin/payment_status/*,ANY::sc_admin/supplier/*,ANY::sc_admin/brand/*,ANY::sc_admin/custom_field/*,ANY::sc_admin/weight_unit/*,ANY::sc_admin/length_unit/*,ANY::sc_admin/attribute_group/*,ANY::sc_admin/tax/*', '2021-09-18 10:32:02', NULL),
	(4, 'Store manager', 'store.full', 'ANY::sc_admin/store_info/*,ANY::sc_admin/store_maintain/*,ANY::sc_admin/store_config/*,ANY::sc_admin/store_css/*,ANY::sc_admin/store_block/*,ANY::sc_admin/store_link/*', '2021-09-18 10:32:02', NULL),
	(5, 'Product manager', 'product.full', 'ANY::sc_admin/product/*,ANY::sc_admin/product_property/*,ANY::sc_admin/product_tag/*', '2021-09-18 10:32:02', NULL),
	(6, 'Category manager', 'category.full', 'ANY::sc_admin/category/*', '2021-09-18 10:32:02', NULL),
	(7, 'Order manager', 'order.full', 'ANY::sc_admin/order/*', '2021-09-18 10:32:02', NULL),
	(8, 'Upload management', 'upload.full', 'ANY::sc_admin/uploads/*', '2021-09-18 10:32:02', NULL),
	(9, 'Extension manager', 'extension.full', 'ANY::sc_admin/template/*,ANY::sc_admin/plugin/*', '2021-09-18 10:32:02', NULL),
	(10, 'Marketing manager', 'marketing.full', 'ANY::sc_admin/shop_discount/*,ANY::sc_admin/email_template/*,ANY::sc_admin/customer/*,ANY::sc_admin/subscribe/*,ANY::sc_admin/seo/*', '2021-09-18 10:32:02', NULL),
	(11, 'Report manager', 'report.full', 'ANY::sc_admin/report/*', '2021-09-18 10:32:02', NULL),
	(12, 'CMS manager', 'cms.full', 'ANY::sc_admin/page/*,ANY::sc_admin/banner/*,ANY::sc_admin/banner_type/*, ANY::sc_admin/cms_category/*,ANY::sc_admin/cms_content/*,ANY::sc_admin/news/*', '2021-09-18 10:32:02', NULL),
	(13, 'Update config', 'change.config', 'POST::sc_admin/store_config/update', '2021-09-18 10:32:02', NULL);
/*!40000 ALTER TABLE `sc_admin_permission` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_role
DROP TABLE IF EXISTS `sc_admin_role`;
CREATE TABLE IF NOT EXISTS `sc_admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_role_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_role: ~6 rows (approximately)
DELETE FROM `sc_admin_role`;
/*!40000 ALTER TABLE `sc_admin_role` DISABLE KEYS */;
INSERT INTO `sc_admin_role` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'administrator', '2021-09-18 10:32:02', NULL),
	(2, 'Group only View', 'view.all', '2021-09-18 10:32:02', NULL),
	(3, 'Manager', 'manager', '2021-09-18 10:32:02', NULL),
	(4, 'CMS', 'cms', '2021-09-18 10:32:02', NULL),
	(5, 'Accountant', 'accountant', '2021-09-18 10:32:02', NULL),
	(6, 'Marketing', 'maketing', '2021-09-18 10:32:02', NULL);
/*!40000 ALTER TABLE `sc_admin_role` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_role_permission
DROP TABLE IF EXISTS `sc_admin_role_permission`;
CREATE TABLE IF NOT EXISTS `sc_admin_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `sc_admin_role_permission_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_role_permission: ~25 rows (approximately)
DELETE FROM `sc_admin_role_permission`;
/*!40000 ALTER TABLE `sc_admin_role_permission` DISABLE KEYS */;
INSERT INTO `sc_admin_role_permission` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(3, 1, '2021-09-18 10:32:02', NULL),
	(3, 2, '2021-09-18 10:32:02', NULL),
	(3, 3, '2021-09-18 10:32:02', NULL),
	(3, 4, '2021-09-18 10:32:02', NULL),
	(3, 5, '2021-09-18 10:32:02', NULL),
	(3, 6, '2021-09-18 10:32:02', NULL),
	(3, 7, '2021-09-18 10:32:02', NULL),
	(3, 8, '2021-09-18 10:32:02', NULL),
	(3, 9, '2021-09-18 10:32:02', NULL),
	(3, 10, '2021-09-18 10:32:02', NULL),
	(3, 11, '2021-09-18 10:32:02', NULL),
	(3, 12, '2021-09-18 10:32:02', NULL),
	(3, 13, '2021-09-18 10:32:02', NULL),
	(4, 1, '2021-09-18 10:32:02', NULL),
	(4, 12, '2021-09-18 10:32:02', NULL),
	(5, 1, '2021-09-18 10:32:02', NULL),
	(5, 2, '2021-09-18 10:32:02', NULL),
	(5, 7, '2021-09-18 10:32:02', NULL),
	(5, 11, '2021-09-18 10:32:02', NULL),
	(6, 1, '2021-09-18 10:32:02', NULL),
	(6, 2, '2021-09-18 10:32:02', NULL),
	(6, 8, '2021-09-18 10:32:02', NULL),
	(6, 10, '2021-09-18 10:32:02', NULL),
	(6, 11, '2021-09-18 10:32:02', NULL),
	(6, 12, '2021-09-18 10:32:02', NULL);
/*!40000 ALTER TABLE `sc_admin_role_permission` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_role_user
DROP TABLE IF EXISTS `sc_admin_role_user`;
CREATE TABLE IF NOT EXISTS `sc_admin_role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `sc_admin_role_user_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_role_user: ~1 rows (approximately)
DELETE FROM `sc_admin_role_user`;
/*!40000 ALTER TABLE `sc_admin_role_user` DISABLE KEYS */;
INSERT INTO `sc_admin_role_user` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL);
/*!40000 ALTER TABLE `sc_admin_role_user` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_store
DROP TABLE IF EXISTS `sc_admin_store`;
CREATE TABLE IF NOT EXISTS `sc_admin_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_active` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Use for multi-store, multi-vendor',
  `partner` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Use for multi-vendor',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Use for multi-store, multi-vendor',
  `active` int(11) NOT NULL DEFAULT 1 COMMENT '0:Maintain, 1: Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_store_code_unique` (`code`),
  KEY `sc_admin_store_domain_index` (`domain`),
  KEY `sc_admin_store_partner_index` (`partner`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_store: ~1 rows (approximately)
DELETE FROM `sc_admin_store`;
/*!40000 ALTER TABLE `sc_admin_store` DISABLE KEYS */;
INSERT INTO `sc_admin_store` (`id`, `logo`, `icon`, `phone`, `long_phone`, `email`, `time_active`, `address`, `office`, `warehouse`, `template`, `domain`, `partner`, `code`, `language`, `timezone`, `currency`, `status`, `active`) VALUES
	(1, 'data/logo/scart-mid.png', NULL, '0123456789', 'Support: 0987654321', 'demo@s-cart.org', '', '123st - abc - xyz', NULL, NULL, 's-cart-light', 'scart.local', '0', 's-cart', 'en', 'Asia/Ho_Chi_Minh', 'USD', 1, 1);
/*!40000 ALTER TABLE `sc_admin_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_store_description
DROP TABLE IF EXISTS `sc_admin_store_description`;
CREATE TABLE IF NOT EXISTS `sc_admin_store_description` (
  `store_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintain_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintain_note` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`store_id`,`lang`),
  KEY `sc_admin_store_description_lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_store_description: ~2 rows (approximately)
DELETE FROM `sc_admin_store_description`;
/*!40000 ALTER TABLE `sc_admin_store_description` DISABLE KEYS */;
INSERT INTO `sc_admin_store_description` (`store_id`, `lang`, `title`, `description`, `keyword`, `maintain_content`, `maintain_note`) VALUES
	(1, 'en', 'Demo S-Cart : Free Laravel eCommerce', 'Free website shopping cart for business', '', '<center><img src="/images/maintenance.png" />\r\n<h3><span style="color:#e74c3c;"><strong>Sorry! We are currently doing site maintenance!</strong></span></h3>\r\n</center>', 'Website is in maintenance mode!'),
	(1, 'vi', 'Demo S-Cart: Mã nguồn website thương mại điện tử miễn phí', 'Laravel shopping cart for business', '', '<center><img src="/images/maintenance.png" />\r\n<h3><span style="color:#e74c3c;"><strong>Xin lỗi! Hiện tại website đang bảo trì!</strong></span></h3>\r\n</center>', 'Website đang trong chế độ bảo trì!');
/*!40000 ALTER TABLE `sc_admin_store_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_user
DROP TABLE IF EXISTS `sc_admin_user`;
CREATE TABLE IF NOT EXISTS `sc_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_user_username_unique` (`username`),
  UNIQUE KEY `sc_admin_user_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_user: ~1 rows (approximately)
DELETE FROM `sc_admin_user`;
/*!40000 ALTER TABLE `sc_admin_user` DISABLE KEYS */;
INSERT INTO `sc_admin_user` (`id`, `username`, `password`, `name`, `email`, `avatar`, `remember_token`, `theme`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '$2y$10$DOJYEeQwtbotrc4KNz0FR.s3/CqaKquBn0mHcDZaBADdbrUG1yMwu', 'Administrator', 'demo@s-cart.org', '/admin/avatar/user.jpg', NULL, NULL, '2021-09-18 10:32:02', NULL);
/*!40000 ALTER TABLE `sc_admin_user` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_user_permission
DROP TABLE IF EXISTS `sc_admin_user_permission`;
CREATE TABLE IF NOT EXISTS `sc_admin_user_permission` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sc_admin_user_permission_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_user_permission: ~0 rows (approximately)
DELETE FROM `sc_admin_user_permission`;
/*!40000 ALTER TABLE `sc_admin_user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_admin_user_permission` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_api_connection
DROP TABLE IF EXISTS `sc_api_connection`;
CREATE TABLE IF NOT EXISTS `sc_api_connection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiconnection` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apikey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` date DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_api_connection_apiconnection_unique` (`apiconnection`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_api_connection: ~1 rows (approximately)
DELETE FROM `sc_api_connection`;
/*!40000 ALTER TABLE `sc_api_connection` DISABLE KEYS */;
INSERT INTO `sc_api_connection` (`id`, `description`, `apiconnection`, `apikey`, `expire`, `last_active`, `status`) VALUES
	(1, 'Demo api connection', 'appmobile', 'fd3b0c8e-1830-11ec-b5d5-04d9f5d0007b', NULL, NULL, 0);
/*!40000 ALTER TABLE `sc_api_connection` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_languages
DROP TABLE IF EXISTS `sc_languages`;
CREATE TABLE IF NOT EXISTS `sc_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_languages_code_location_unique` (`code`,`location`),
  KEY `sc_languages_code_index` (`code`),
  KEY `sc_languages_position_index` (`position`),
  KEY `sc_languages_location_index` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=2487 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_languages: ~2,486 rows (approximately)
DELETE FROM `sc_languages`;
/*!40000 ALTER TABLE `sc_languages` DISABLE KEYS */;
INSERT INTO `sc_languages` (`id`, `code`, `text`, `position`, `location`) VALUES
	(1, 'action.edit', 'Edit', 'action', 'en'),
	(2, 'action.edit', 'Chỉnh sửa', 'action', 'vi'),
	(3, 'action.update', 'Update', 'action', 'en'),
	(4, 'action.update', 'Cập nhật', 'action', 'vi'),
	(5, 'action.add', 'Thêm mới', 'action', 'vi'),
	(6, 'action.add', 'Add new', 'action', 'en'),
	(7, 'action.create', 'Create new', 'action', 'en'),
	(8, 'action.create', 'Tạo mới', 'action', 'vi'),
	(9, 'action.create_success', 'Tạo mới thành công', 'action', 'vi'),
	(10, 'action.create_success', 'Create success', 'action', 'en'),
	(11, 'action.edit_success', 'Edit success', 'action', 'en'),
	(12, 'action.edit_success', 'Tạo mới thành công', 'action', 'vi'),
	(13, 'action.update_success', 'Update success', 'action', 'en'),
	(14, 'action.update_success', 'Cập nhật thành công', 'action', 'vi'),
	(15, 'action.add_success', 'Add new success', 'action', 'en'),
	(16, 'action.add_success', 'Thêm mới thành công', 'action', 'vi'),
	(17, 'action.remote_success', 'Remove success', 'action', 'en'),
	(18, 'action.remote_success', 'Gỡ bỏ thành công', 'action', 'vi'),
	(19, 'action.delete_success', 'Delete success', 'action', 'en'),
	(20, 'action.delete_success', 'Xóa thành công', 'action', 'vi'),
	(21, 'action.remote', 'Gỡ bỏ', 'action', 'vi'),
	(22, 'action.remote', 'Remove', 'action', 'en'),
	(23, 'action.delete', 'Xóa', 'action', 'vi'),
	(24, 'action.delete', 'Delete', 'action', 'en'),
	(25, 'action.uninstall', 'Delete', 'action', 'en'),
	(26, 'action.uninstall', 'Gỡ cài đặt', 'action', 'vi'),
	(27, 'action.install', 'Cài đặt', 'action', 'vi'),
	(28, 'action.install', 'Install', 'action', 'en'),
	(29, 'action.click', 'Click', 'action', 'en'),
	(30, 'action.click', 'Bấm', 'action', 'vi'),
	(31, 'action.click_here', 'Click here', 'action', 'en'),
	(32, 'action.click_here', 'Bấm vào đây', 'action', 'vi'),
	(33, 'action.view', 'Xem', 'action', 'vi'),
	(34, 'action.view', 'View', 'action', 'en'),
	(35, 'action.view_more', 'View more', 'action', 'en'),
	(36, 'action.view_more', 'Xem thêm', 'action', 'vi'),
	(37, 'action.detail', 'Chi tiết', 'action', 'vi'),
	(38, 'action.detail', 'Detail', 'action', 'en'),
	(39, 'action.hidden', 'Hidden', 'action', 'en'),
	(40, 'action.hidden', 'Ẩn', 'action', 'vi'),
	(41, 'action.show', 'Hiển thị', 'action', 'vi'),
	(42, 'action.show', 'Show', 'action', 'en'),
	(43, 'action.submit', 'Submit', 'action', 'en'),
	(44, 'action.submit', 'Gửi', 'action', 'vi'),
	(45, 'action.save', 'Save', 'action', 'en'),
	(46, 'action.save', 'Lưu lại', 'action', 'vi'),
	(47, 'action.reset', 'Làm lại', 'action', 'vi'),
	(48, 'action.reset', 'Reset', 'action', 'en'),
	(49, 'action.logout', 'Đăng xuất', 'action', 'vi'),
	(50, 'action.logout', 'Logout', 'action', 'en'),
	(51, 'action.login', 'Đăng nhập', 'action', 'vi'),
	(52, 'action.login', 'Login', 'action', 'en'),
	(53, 'action.refresh', 'Làm mới', 'action', 'vi'),
	(54, 'action.refresh', 'Refresh', 'action', 'en'),
	(55, 'action.confirm', 'Xác nhận', 'action', 'vi'),
	(56, 'action.confirm', 'Confirmation', 'action', 'en'),
	(57, 'action.add_to_cart', 'Add to cart', 'action', 'en'),
	(58, 'action.add_to_cart', 'Thêm vào giỏ hàng', 'action', 'vi'),
	(59, 'action.add_to_wishlist', 'Thêm yêu thích', 'action', 'vi'),
	(60, 'action.add_to_wishlist', 'Add to wishlist', 'action', 'en'),
	(61, 'action.add_to_compare', 'Add to compare', 'action', 'en'),
	(62, 'action.add_to_compare', 'Thêm so sánh', 'action', 'vi'),
	(63, 'action.buy_now', 'Mua ngay', 'action', 'vi'),
	(64, 'action.buy_now', 'Buy now', 'action', 'en'),
	(65, 'action.re_order', 'Re-order', 'action', 'en'),
	(66, 'action.re_order', 'Mua lại', 'action', 'vi'),
	(67, 'action.order', 'Đặt hàng', 'action', 'vi'),
	(68, 'action.order', 'Order', 'action', 'en'),
	(69, 'action.title', 'Action', 'action', 'en'),
	(70, 'action.title', 'Thao tác', 'action', 'vi'),
	(71, 'action.confirm_agree', 'Agree', 'action', 'en'),
	(72, 'action.confirm_agree', 'Đồng ý', 'action', 'vi'),
	(73, 'action.confirm_cancel', 'Hủy bỏ', 'action', 'vi'),
	(74, 'action.confirm_cancel', 'Cancel', 'action', 'en'),
	(75, 'action.confirm_yes', 'Yes', 'action', 'en'),
	(76, 'action.confirm_yes', 'Có', 'action', 'vi'),
	(77, 'action.confirm_no', 'Không', 'action', 'vi'),
	(78, 'action.confirm_no', 'No', 'action', 'en'),
	(79, 'action.delete_confirm', 'Are you sure to delete it?', 'action', 'en'),
	(80, 'action.delete_confirm', 'Bạn có chắc chắn sẽ xóa nó?', 'action', 'vi'),
	(81, 'action.delete_confirm_deleted', 'Deleted', 'action', 'en'),
	(82, 'action.delete_confirm_deleted', 'Đã xóa', 'action', 'vi'),
	(83, 'action.delete_confirm_deleted_msg', 'Item has deleted', 'action', 'en'),
	(84, 'action.delete_confirm_deleted_msg', 'Item này đã được xóa.', 'action', 'vi'),
	(85, 'action.remove_confirm', 'Are you sure to remove it?', 'action', 'en'),
	(86, 'action.remove_confirm', 'Bạn có chắc chắn gỡ nó?', 'action', 'vi'),
	(87, 'action.action_confirm', 'Bạn có chắc chắn thao tác này?', 'action', 'vi'),
	(88, 'action.action_confirm', 'Are you sure you do this?', 'action', 'en'),
	(89, 'action.action_confirm_warning', 'Hành động này sẽ không thể phục hồi', 'action', 'vi'),
	(90, 'action.action_confirm_warning', 'This action will not be restore', 'action', 'en'),
	(91, 'action.warning', 'Warning', 'action', 'en'),
	(92, 'action.warning', 'Cảnh báo', 'action', 'vi'),
	(93, 'action.notify', 'Thông báo', 'action', 'vi'),
	(94, 'action.notify', 'Notify', 'action', 'en'),
	(95, 'action.sort', 'Sort items', 'action', 'en'),
	(96, 'action.sort', 'Sắp xếp', 'action', 'vi'),
	(97, 'action.search', 'Tìm kiếm', 'action', 'vi'),
	(98, 'action.search', 'Search', 'action', 'en'),
	(99, 'action.copy', 'Sao chép', 'action', 'vi'),
	(100, 'action.copy', 'Copy', 'action', 'en'),
	(101, 'action.duplicate', 'Duplicate', 'action', 'en'),
	(102, 'action.duplicate', 'Nhân bản', 'action', 'vi'),
	(103, 'front.home', 'Trang chủ', 'front', 'vi'),
	(104, 'front.home', 'Home', 'front', 'en'),
	(105, 'front.shop', 'Cửa hàng', 'front', 'vi'),
	(106, 'front.shop', 'Shop', 'front', 'en'),
	(107, 'front.store', 'Cửa hàng', 'front', 'vi'),
	(108, 'front.store', 'Store', 'front', 'en'),
	(109, 'front.store_list', 'Danh sách cửa hàng', 'front', 'vi'),
	(110, 'front.store_list', 'Store list', 'front', 'en'),
	(111, 'front.link_useful', 'Liên kết hữu ích', 'front', 'vi'),
	(112, 'front.link_useful', 'Link useful', 'front', 'en'),
	(113, 'front.brands', 'Nhãn hàng', 'front', 'vi'),
	(114, 'front.brands', 'Brands', 'front', 'en'),
	(115, 'front.categories', 'Danh mục', 'front', 'vi'),
	(116, 'front.categories', 'Categries', 'front', 'en'),
	(117, 'front.sub_categories', 'Danh mục nhỏ', 'front', 'vi'),
	(118, 'front.sub_categories', 'Subcategory', 'front', 'en'),
	(119, 'front.blog', 'Blog', 'front', 'vi'),
	(120, 'front.blog', 'Blogs', 'front', 'en'),
	(121, 'front.news', 'Tin tức', 'front', 'vi'),
	(122, 'front.news', 'News', 'front', 'en'),
	(123, 'front.about', 'About us', 'front', 'en'),
	(124, 'front.about', 'Giới thiệu', 'front', 'vi'),
	(125, 'front.contact', 'Contact us', 'front', 'en'),
	(126, 'front.contact', 'Liên hệ', 'front', 'vi'),
	(127, 'front.cms_category', 'Danh mục CMS', 'front', 'vi'),
	(128, 'front.cms_category', 'CMS category', 'front', 'en'),
	(129, 'front.my_profile', 'Tài khoản', 'front', 'vi'),
	(130, 'front.my_profile', 'My profile', 'front', 'en'),
	(131, 'front.my_account', 'Tài khoản', 'front', 'vi'),
	(132, 'front.my_account', 'My account', 'front', 'en'),
	(133, 'front.account', 'Tài khoản', 'front', 'vi'),
	(134, 'front.account', 'customer', 'front', 'en'),
	(135, 'front.currency', 'Tiền tệ', 'front', 'vi'),
	(136, 'front.currency', 'Currency', 'front', 'en'),
	(137, 'front.language', 'Ngôn ngữ', 'front', 'vi'),
	(138, 'front.language', 'Language', 'front', 'en'),
	(139, 'front.cart', 'Giỏ hàng', 'front', 'vi'),
	(140, 'front.cart', 'Cart', 'front', 'en'),
	(141, 'front.compare', 'So sánh', 'front', 'vi'),
	(142, 'front.compare', 'Compare', 'front', 'en'),
	(143, 'front.compare_page', 'Sản phẩm so sánh', 'front', 'vi'),
	(144, 'front.compare_page', 'Product compare', 'front', 'en'),
	(145, 'front.wishlist', 'Yêu thích', 'front', 'vi'),
	(146, 'front.wishlist', 'Wishlist', 'front', 'en'),
	(147, 'front.wishlist_page', 'Sản phẩm yêu thich', 'front', 'vi'),
	(148, 'front.wishlist_page', 'Product Wishlist', 'front', 'en'),
	(149, 'front.login', 'Đăng nhập', 'front', 'vi'),
	(150, 'front.login', 'Login', 'front', 'en'),
	(151, 'front.logout', 'Đăng xuất', 'front', 'vi'),
	(152, 'front.logout', 'Logout', 'front', 'en'),
	(153, 'front.maintenace', 'Bảo trì', 'front', 'vi'),
	(154, 'front.maintenace', 'Maintenace', 'front', 'en'),
	(155, 'front.products_hot', 'Hot Products', 'front', 'en'),
	(156, 'front.products_hot', 'Sản phẩm nổi bật', 'front', 'vi'),
	(157, 'front.products_promotion', 'Promotion Products', 'front', 'en'),
	(158, 'front.products_promotion', 'Sản phẩm khuyến mãi', 'front', 'vi'),
	(159, 'front.products_special', 'Special products', 'front', 'en'),
	(160, 'front.products_special', 'Sản phẩm đặc biệt', 'front', 'vi'),
	(161, 'front.products_last_view', 'Last view products', 'front', 'en'),
	(162, 'front.products_last_view', 'Sản phẩm mới xem', 'front', 'vi'),
	(163, 'front.products_build', 'Product bundle', 'front', 'en'),
	(164, 'front.products_build', 'Sản phẩm bộ', 'front', 'vi'),
	(165, 'front.products_bundle', 'Product bundle', 'front', 'en'),
	(166, 'front.products_bundle', 'Sản phẩm bộ', 'front', 'vi'),
	(167, 'front.products_single', 'Product single', 'front', 'en'),
	(168, 'front.products_single', 'Sản phẩm đơn', 'front', 'vi'),
	(169, 'front.products_group', 'Product group', 'front', 'en'),
	(170, 'front.products_group', 'Sản phẩm nhóm', 'front', 'vi'),
	(171, 'front.products_new', 'New products', 'front', 'en'),
	(172, 'front.products_new', 'Sản phẩm mới', 'front', 'vi'),
	(173, 'front.products_recommend', 'Recommend products', 'front', 'en'),
	(174, 'front.products_recommend', 'Sản phẩm đề xuất', 'front', 'vi'),
	(175, 'front.product_detail', 'Product detail', 'front', 'en'),
	(176, 'front.product_detail', 'Chi tiết sản phẩm', 'front', 'vi'),
	(177, 'front.categories_store', 'Categories', 'front', 'en'),
	(178, 'front.categories_store', 'Danh mục', 'front', 'vi'),
	(179, 'front.result_item', 'Showing <b>:item_from</b>-<b>:item_to</b> of <b>:total</b> results</b>', 'front', 'en'),
	(180, 'front.result_item', 'Hiển thị <b>:item_from</b>-<b>:item_to</b> của <b>:total</b> kết quả</b>', 'front', 'vi'),
	(181, 'front.all_product', 'Tất cả sản phẩm', 'front', 'vi'),
	(182, 'front.all_product', 'All products', 'front', 'en'),
	(183, 'front.data_notfound', 'Không tìm thấy dữ liệu!', 'front', 'vi'),
	(184, 'front.data_notfound', 'Data not found!', 'front', 'en'),
	(185, 'front.data_not_found', 'Không tìm thấy dữ liệu!', 'front', 'vi'),
	(186, 'front.data_not_found', 'Data not found!', 'front', 'en'),
	(187, 'front.data_not_found_title', 'Không tìm thấy dữ liệu!', 'front', 'vi'),
	(188, 'front.data_not_found_title', 'Data not found!', 'front', 'en'),
	(189, 'front.page_notfound', 'Không tìm thấy trang!', 'front', 'vi'),
	(190, 'front.page_notfound', 'Page not found!', 'front', 'en'),
	(191, 'front.page_not_found', 'Không tìm thấy trang!', 'front', 'vi'),
	(192, 'front.page_not_found', 'Page not found!', 'front', 'en'),
	(193, 'front.flash_stock', 'Available', 'front', 'en'),
	(194, 'front.flash_sold', 'Already Sold', 'front', 'en'),
	(195, 'front.flash_title', 'Flash sale', 'front', 'en'),
	(196, 'front.flash_stock', 'Còn lại', 'front', 'vi'),
	(197, 'front.flash_sold', 'Đã bán', 'front', 'vi'),
	(198, 'front.flash_title', 'Flash sale', 'front', 'vi'),
	(199, 'front.products_best_seller', 'Sản phẩm thịnh hành', 'front', 'vi'),
	(200, 'front.products_best_seller', 'Trending products', 'front', 'en'),
	(201, 'front.products_trending', 'Sản phẩm bán chạy nhất', 'front', 'vi'),
	(202, 'front.products_trending', 'Product best seller', 'front', 'en'),
	(203, 'front.search_result', 'Kết quả tìm kiếm', 'front', 'vi'),
	(204, 'front.search_result', 'Search result', 'front', 'en'),
	(205, 'front.view_not_exist', 'Không có view :view', 'front', 'vi'),
	(206, 'front.view_not_exist', 'View not found :view', 'front', 'en'),
	(207, 'search.placeholder', 'Nhập từ khóa', 'search', 'vi'),
	(208, 'search.placeholder', 'Input keyword', 'search', 'en'),
	(209, 'store.deny_help_1', 'Sorry, this domain does not exist on the system!', 'store', 'en'),
	(210, 'store.deny_help_1', 'Xin lỗi, tên miền này không có trên hệ thống!', 'store', 'vi'),
	(211, 'store.deny_help_2', 'Return to home page', 'store', 'en'),
	(212, 'store.deny_help_2', 'Trở về trang chủ', 'store', 'vi'),
	(213, 'store.address', 'Address', 'store', 'en'),
	(214, 'store.address', 'Địa chỉ', 'store', 'vi'),
	(215, 'store.phone', 'Phone', 'store', 'en'),
	(216, 'store.phone', 'Số điện thoại', 'store', 'vi'),
	(217, 'store.hotline', 'Hotline', 'store', 'en'),
	(218, 'store.hotline', 'Số điện thoại', 'store', 'vi'),
	(219, 'store.email', 'Email', 'store', 'vi'),
	(220, 'store.email', 'Email', 'store', 'en'),
	(221, 'store.title', 'Tên cửa hàng', 'store', 'vi'),
	(222, 'store.title', 'Store title', 'store', 'en'),
	(223, 'store.keyword', 'Từ khóa', 'store', 'vi'),
	(224, 'store.keyword', 'Keyword', 'store', 'en'),
	(225, 'store.description', 'Mô tả', 'store', 'vi'),
	(226, 'store.description', 'Description', 'store', 'en'),
	(227, 'store.language', 'Ngôn ngữ', 'store', 'vi'),
	(228, 'store.language', 'Language', 'store', 'en'),
	(229, 'store.currency', 'Tiền tệ', 'store', 'vi'),
	(230, 'store.currency', 'Currency', 'store', 'en'),
	(231, 'store.timezone', 'Múi giờ', 'store', 'vi'),
	(232, 'store.timezone', 'Timezone', 'store', 'en'),
	(233, 'store.admin.template', 'Giao diện', 'store.admin', 'vi'),
	(234, 'store.admin.template', 'Template', 'store.admin', 'en'),
	(235, 'store.admin.domain', 'Tên miền', 'store.admin', 'vi'),
	(236, 'store.admin.domain', 'Domain', 'store.admin', 'en'),
	(237, 'store.admin.domain_help', 'Ví dụ: https://abc.com', 'store.admin', 'vi'),
	(238, 'store.admin.domain_help', 'For example: https://abc.com', 'store.admin', 'en'),
	(239, 'store.admin.domain_invalid', 'Tên miền không hợp lệ', 'store.admin', 'vi'),
	(240, 'store.admin.domain_invalid', 'Domain invalid', 'store.admin', 'en'),
	(241, 'store.warehouse', 'Nhà kho', 'store', 'vi'),
	(242, 'store.warehouse', 'Warehouse', 'store', 'en'),
	(243, 'store.office', 'Văn phòng', 'store', 'vi'),
	(244, 'store.office', 'Office', 'store', 'en'),
	(245, 'store.time_active', 'Thời gian làm việc', 'store', 'vi'),
	(246, 'store.time_active', 'Time active', 'store', 'en'),
	(247, 'store.long_phone', 'Số điện thoại', 'store', 'vi'),
	(248, 'store.long_phone', 'Full phone', 'store', 'en'),
	(249, 'store.logo', 'Logo', 'store', 'vi'),
	(250, 'store.logo', 'Logo', 'store', 'en'),
	(251, 'store.icon', 'Icon', 'store', 'vi'),
	(252, 'store.icon', 'Icon', 'store', 'en'),
	(253, 'store.maintenance', 'Bảo trì', 'store', 'vi'),
	(254, 'store.maintenance', 'Maintenance', 'store', 'en'),
	(255, 'store.admin.code', 'Store code', 'store.admin', 'en'),
	(256, 'store.admin.code', 'Mã cửa hàng', 'store.admin', 'vi'),
	(257, 'store.admin.css', 'Edit CSS', 'store.admin', 'en'),
	(258, 'store.admin.css', 'Chỉnh sửa CSS', 'store.admin', 'vi'),
	(259, 'store.admin.title', 'Thông tin cửa hàng', 'store.admin', 'vi'),
	(260, 'store.admin.config_store', 'Cấu hình cửa hàng #:id', 'store.admin', 'vi'),
	(261, 'store.admin.config_store_detail', 'Cấu hình cửa hàng', 'store.admin', 'vi'),
	(262, 'store.admin.list', 'Danh sách cửa hàng', 'store.admin', 'vi'),
	(263, 'store.admin.field', 'Các trường', 'store.admin', 'vi'),
	(264, 'store.admin.value', 'Giá trị', 'store.admin', 'vi'),
	(265, 'store.admin.config_mode', 'Cấu hình mode', 'store.admin', 'vi'),
	(266, 'store.admin.config_display', 'Cấu hình hiển thị', 'store.admin', 'vi'),
	(267, 'store.admin.config_customize', 'Cấu hình tùy chỉnh', 'store.admin', 'vi'),
	(268, 'store.admin.status', 'Status', 'store.admin', 'vi'),
	(269, 'store.admin.action', 'Hành động', 'store.admin', 'vi'),
	(270, 'store.admin.add_new', 'Thêm mới', 'store.admin', 'vi'),
	(271, 'store.admin.sort', 'Sắp xếp', 'store.admin', 'vi'),
	(272, 'store.admin.search', 'Tìm kiếm', 'store.admin', 'vi'),
	(273, 'store.admin.add_new_title', 'Tạo cửa hàng', 'store.admin', 'vi'),
	(274, 'store.admin.add_new_des', 'Tạo mới một cửa hàng', 'store.admin', 'vi'),
	(275, 'store.admin.config_info', 'Thông tin', 'store.admin', 'vi'),
	(276, 'store.admin.config_product', 'Sản phẩm', 'store.admin', 'vi'),
	(277, 'store.admin.config_customer', 'Khách hàng', 'store.admin', 'vi'),
	(278, 'store.admin.config_email', 'Email', 'store.admin', 'vi'),
	(279, 'store.admin.config_url', 'URL', 'store.admin', 'vi'),
	(280, 'store.admin.config_api', 'API', 'store.admin', 'vi'),
	(281, 'store.admin.config_order', 'Đơn hàng', 'store.admin', 'vi'),
	(282, 'store.admin.config_other', 'Khác', 'store.admin', 'vi'),
	(283, 'store.admin.switch_store', 'Chuyển đổi cửa hàng', 'store.admin', 'vi'),
	(284, 'store.admin.config_admin_other', 'Cấu hình admin', 'store.admin', 'vi'),
	(285, 'store.admin.active_strict', 'Kích hoạt chế độ kiểm tra tên miền', 'store.admin', 'vi'),
	(286, 'store.admin.active_domain', 'Kích hoạt tên miền', 'store.admin', 'vi'),
	(287, 'store.admin.active_maintain', 'Kích hoạt chế độ bảo trì', 'store.admin', 'vi'),
	(288, 'store.admin.domain_exist', 'Tên miền đã có rồi', 'store.admin', 'vi'),
	(289, 'store.admin.code_exist', 'Mã code đã có rồi', 'store.admin', 'vi'),
	(290, 'store.admin.value_cannot_change', 'Giá trị này không thể thay đổi', 'store.admin', 'vi'),
	(291, 'store.admin.title', 'Store infomation', 'store.admin', 'en'),
	(292, 'store.admin.config_store', 'Config store #:id', 'store.admin', 'en'),
	(293, 'store.admin.config_store_detail', 'Config store', 'store.admin', 'en'),
	(294, 'store.admin.list', 'Store list', 'store.admin', 'en'),
	(295, 'store.admin.field', 'Field', 'store.admin', 'en'),
	(296, 'store.admin.value', 'Value', 'store.admin', 'en'),
	(297, 'store.admin.config_mode', 'Store mode', 'store.admin', 'en'),
	(298, 'store.admin.config_display', 'Store display', 'store.admin', 'en'),
	(299, 'store.admin.config_customize', 'Config customize', 'store.admin', 'en'),
	(300, 'store.admin.status', 'Status', 'store.admin', 'en'),
	(301, 'store.admin.action', 'Action', 'store.admin', 'en'),
	(302, 'store.admin.sort', 'Sort', 'store.admin', 'en'),
	(303, 'store.admin.search', 'Search', 'store.admin', 'en'),
	(304, 'store.admin.add_new', 'Add new', 'store.admin', 'en'),
	(305, 'store.admin.add_new_title', 'Add new store', 'store.admin', 'en'),
	(306, 'store.admin.add_new_des', 'Create a new store', 'store.admin', 'en'),
	(307, 'store.admin.config_info', 'Infomation', 'store.admin', 'en'),
	(308, 'store.admin.config_order', 'Order', 'store.admin', 'en'),
	(309, 'store.admin.config_product', 'Product', 'store.admin', 'en'),
	(310, 'store.admin.config_customer', 'Customer', 'store.admin', 'en'),
	(311, 'store.admin.config_email', 'Email', 'store.admin', 'en'),
	(312, 'store.admin.config_url', 'URL', 'store.admin', 'en'),
	(313, 'store.admin.config_api', 'API', 'store.admin', 'en'),
	(314, 'store.admin.config_other', 'Other', 'store.admin', 'en'),
	(315, 'store.admin.switch_store', 'Switch store', 'store.admin', 'en'),
	(316, 'store.admin.config_admin_other', 'Config admin', 'store.admin', 'en'),
	(317, 'store.admin.active_strict', 'Activate domain check mode', 'store.admin', 'en'),
	(318, 'store.admin.active_domain', 'Activate the domain name', 'store.admin', 'en'),
	(319, 'store.admin.active_maintain', 'Activate maintenance mode', 'store.admin', 'en'),
	(320, 'store.admin.domain_exist', 'Domain exist already', 'store.admin', 'en'),
	(321, 'store.admin.code_exist', 'Code exist already', 'store.admin', 'en'),
	(322, 'store.admin.value_cannot_change', 'This value cannot be changed', 'store.admin', 'en'),
	(323, 'store.display.product_top', 'Top product', 'store.admin', 'en'),
	(324, 'store.display.product_top', 'Top sản phẩm', 'store.admin', 'vi'),
	(325, 'store.display.list_product', 'List product', 'store.admin', 'en'),
	(326, 'store.display.list_product', 'Danh sách sản phẩm', 'store.admin', 'vi'),
	(327, 'store.display.relation_product', 'Relation product', 'store.admin', 'en'),
	(328, 'store.display.relation_product', 'Sản phẩm liên quan', 'store.admin', 'vi'),
	(329, 'store.display.viewed_product', 'Product viewed', 'store.admin', 'en'),
	(330, 'store.display.viewed_product', 'Sản phẩm đã xem', 'store.admin', 'vi'),
	(331, 'store.display.item_list', 'List item', 'store.admin', 'en'),
	(332, 'store.display.item_list', 'Danh sách item', 'store.admin', 'vi'),
	(333, 'store.display.item_top', 'Top item', 'store.admin', 'en'),
	(334, 'store.display.item_top', 'Top item', 'store.admin', 'vi'),
	(335, 'cart.checkout', 'Checkout', 'cart', 'en'),
	(336, 'cart.checkout', 'Thanh toán', 'cart', 'vi'),
	(337, 'cart.back_to_cart', 'Back to cart', 'cart', 'en'),
	(338, 'cart.back_to_cart', 'Trở lại giỏ hàng', 'cart', 'vi'),
	(339, 'cart.confirm', 'Confirm', 'cart', 'en'),
	(340, 'cart.confirm', 'Xác nhận', 'cart', 'vi'),
	(341, 'cart.cart_title', 'Shopping cart', 'cart', 'en'),
	(342, 'cart.cart_title', 'Trang giỏ hàng', 'cart', 'vi'),
	(343, 'cart.page_title', 'Shopping cart', 'cart', 'en'),
	(344, 'cart.page_title', 'Trang giỏ hàng', 'cart', 'vi'),
	(345, 'cart.back_to_shop', 'Back to shop', 'cart', 'en'),
	(346, 'cart.back_to_shop', 'Trở về của hàng', 'cart', 'vi'),
	(347, 'cart.remove_all', 'Remove cart', 'cart', 'en'),
	(348, 'cart.remove_all', 'Xóa giỏ hàng', 'cart', 'vi'),
	(349, 'cart.minimum_value', 'Minimum :value items', 'cart', 'en'),
	(350, 'cart.minimum_value', 'Tối thiểu :value item', 'cart', 'vi'),
	(351, 'cart.note', 'Note', 'cart', 'en'),
	(352, 'cart.note', 'Ghi chú', 'cart', 'vi'),
	(353, 'cart.coupon', 'Coupon', 'cart', 'en'),
	(354, 'cart.coupon', 'Mã giảm giá', 'cart', 'vi'),
	(355, 'cart.remove_coupon', 'Remove coupon', 'cart', 'en'),
	(356, 'cart.remove_coupon', 'Xóa mã giảm giá', 'cart', 'vi'),
	(357, 'cart.coupon_empty', 'Coupon empty', 'cart', 'en'),
	(358, 'cart.coupon_empty', 'Không có mã giảm giá', 'cart', 'vi'),
	(359, 'cart.apply', 'Apply', 'cart', 'en'),
	(360, 'cart.apply', 'Áp dụng', 'cart', 'vi'),
	(361, 'cart.change_address', 'Change address', 'cart', 'en'),
	(362, 'cart.change_address', 'Thay đổi địa chỉ', 'cart', 'vi'),
	(363, 'cart.add_new_address', 'Add new address', 'cart', 'en'),
	(364, 'cart.add_new_address', 'Thêm địa chỉ mới', 'cart', 'vi'),
	(365, 'cart.page_wishlist_title', 'Page wishlist', 'cart', 'en'),
	(366, 'cart.page_wishlist_title', 'Trang sản phẩm yêu thich', 'cart', 'vi'),
	(367, 'cart.page_compare_title', 'Page compare', 'cart', 'en'),
	(368, 'cart.page_compare_title', 'Trang so sánh sản phẩm', 'cart', 'vi'),
	(369, 'cart.shipping_address', 'Shipping address', 'cart', 'en'),
	(370, 'cart.shipping_address', 'Địa chỉ giao hàng', 'cart', 'vi'),
	(371, 'cart.payment_address', 'Payment address', 'cart', 'en'),
	(372, 'cart.payment_address', 'Địa chỉ thanh toán', 'cart', 'vi'),
	(373, 'cart.payment_method', 'Phương thức thanh toán', 'cart', 'vi'),
	(374, 'cart.payment_method', 'Payment method', 'cart', 'en'),
	(375, 'cart.shipping_method', 'Phương thức vận chuyển', 'cart', 'vi'),
	(376, 'cart.shipping_method', 'Shipping method', 'cart', 'en'),
	(377, 'cart.country', 'Country', 'cart', 'en'),
	(378, 'cart.country', 'Quốc gia', 'cart', 'vi'),
	(379, 'cart.company', 'Công ty', 'cart', 'vi'),
	(380, 'cart.company', 'Company', 'cart', 'en'),
	(381, 'cart.address3', 'Địa chỉ nhà', 'cart', 'vi'),
	(382, 'cart.address3', 'Address 3', 'cart', 'en'),
	(383, 'cart.address2', 'Quận/Huyện', 'cart', 'vi'),
	(384, 'cart.address2', 'Address 2', 'cart', 'en'),
	(385, 'cart.address1', 'Tỉnh/Thành', 'cart', 'vi'),
	(386, 'cart.address1', 'Address 1', 'cart', 'en'),
	(387, 'cart.postcode', 'Mã bưu điện', 'cart', 'vi'),
	(388, 'cart.postcode', 'Post code', 'cart', 'en'),
	(389, 'cart.phone', 'Phone', 'cart', 'en'),
	(390, 'cart.phone', 'Điện thoại', 'cart', 'vi'),
	(391, 'cart.last_name_kana', 'Họ kana', 'cart', 'vi'),
	(392, 'cart.last_name_kana', 'Last name kana', 'cart', 'en'),
	(393, 'cart.first_name_kana', 'First name kana', 'cart', 'en'),
	(394, 'cart.first_name_kana', 'Tên Kana', 'cart', 'vi'),
	(395, 'cart.full_name', 'Full name', 'cart', 'en'),
	(396, 'cart.full_name', 'Tên đầy đủ', 'cart', 'vi'),
	(397, 'cart.name', 'Name', 'cart', 'en'),
	(398, 'cart.name', 'Tên', 'cart', 'vi'),
	(399, 'cart.midle_name', 'Tên đệm', 'cart', 'vi'),
	(400, 'cart.midle_name', 'Midle name', 'cart', 'en'),
	(401, 'cart.last_name', 'Họ', 'cart', 'vi'),
	(402, 'cart.last_name', 'Last name', 'cart', 'en'),
	(403, 'cart.first_name', 'Tên', 'cart', 'vi'),
	(404, 'cart.first_name', 'First name', 'cart', 'en'),
	(405, 'cart.email', 'Email', 'cart', 'vi'),
	(406, 'cart.email', 'Email', 'cart', 'en'),
	(407, 'cart.sex', 'Giới tính', 'cart', 'vi'),
	(408, 'cart.sex', 'Sex', 'cart', 'en'),
	(409, 'cart.birthday', 'Ngày sinh', 'cart', 'vi'),
	(410, 'cart.birthday', 'Birthday', 'cart', 'en'),
	(411, 'cart.validation.shippingMethod_required', 'Shipping method required', 'cart', 'en'),
	(412, 'cart.validation.shippingMethod_required', 'Giao thức giao hàng là bắt buộc', 'cart', 'vi'),
	(413, 'cart.validation.paymentMethod_required', 'Payment method required', 'cart', 'en'),
	(414, 'cart.validation.paymentMethod_required', 'Phương thức thanh toán là bắt buộc', 'cart', 'vi'),
	(415, 'cart.add_to_cart_success', 'Thêm vào :instance thành công', 'cart', 'vi'),
	(416, 'cart.add_to_cart_success', 'Add to :instance success', 'cart', 'en'),
	(417, 'cart.item_exist_in_cart', 'This item is already in stock in the :instance', 'cart', 'en'),
	(418, 'cart.item_exist_in_cart', 'Item này đã có trong :instance rồi', 'cart', 'vi'),
	(419, 'cart.item_over_qty', 'The number of :sku must not exceed :qty', 'cart', 'en'),
	(420, 'cart.item_over_qty', 'Số lượng của :sku không được vượt quá :qty', 'cart', 'vi'),
	(421, 'cart.have_error', 'Có lỗi xảy ra. Vui lòng kiểm tra lại.', 'cart', 'vi'),
	(422, 'cart.have_error', 'Have an error. Please check again.', 'cart', 'en'),
	(423, 'cart.cart_store_id_notfound', 'Không tìm thấy ID cửa hàng.', 'cart', 'vi'),
	(424, 'cart.cart_store_id_notfound', 'Store ID not found', 'cart', 'en'),
	(425, 'cart.cart_empty', 'Giỏ hàng rỗng.', 'cart', 'vi'),
	(426, 'cart.cart_empty', 'The shopping cart is empty', 'cart', 'en'),
	(427, 'cart.cart_store_empty', 'Giỏ hàng trong shop rỗng.', 'cart', 'vi'),
	(428, 'cart.cart_store_empty', 'The shopping cart in the shop is empty', 'cart', 'en'),
	(429, 'checkout.title', 'Checkout', 'checkout', 'en'),
	(430, 'checkout.title', 'Xác nhận thanh toán', 'checkout', 'vi'),
	(431, 'checkout.order_success_msg', 'Thank you for your purchase!', 'checkout', 'en'),
	(432, 'checkout.order_success_msg', 'Cảm ơn vì đơn hàng của bạn!', 'checkout', 'vi'),
	(433, 'checkout.order_success_order_info', 'Your order #:order_id', 'checkout', 'en'),
	(434, 'checkout.order_success_order_info', 'Đơn hàng của bạn là #:order_id', 'checkout', 'vi'),
	(435, 'checkout.page_title', 'Checkout page', 'checkout', 'en'),
	(436, 'checkout.page_title', 'Xác nhận thanh toán', 'checkout', 'vi'),
	(437, 'checkout.success_title', 'Order success', 'checkout', 'en'),
	(438, 'checkout.success_title', 'Đặt hàng thành công', 'checkout', 'vi'),
	(439, 'product.name', 'Name', 'product', 'en'),
	(440, 'product.name', 'Tên', 'product', 'vi'),
	(441, 'product.keyword', 'Keyword ', 'product', 'en'),
	(442, 'product.keyword', 'Từ khóa', 'product', 'vi'),
	(443, 'product.content', 'Main content', 'product', 'en'),
	(444, 'product.content', 'Nội dung chính', 'product', 'vi'),
	(445, 'product.sku', 'SKU code', 'product', 'en'),
	(446, 'product.sku', 'Mã SKU', 'product', 'vi'),
	(447, 'product.stock', 'Stock', 'product', 'en'),
	(448, 'product.stock', 'Số lượng trong kho', 'product', 'vi'),
	(449, 'product.cost', 'Price cost', 'product', 'en'),
	(450, 'product.cost', 'Giá cost', 'product', 'vi'),
	(451, 'product.price', 'Price', 'product', 'en'),
	(452, 'product.price', 'Giá', 'product', 'vi'),
	(453, 'product.image', 'Image', 'product', 'en'),
	(454, 'product.image', 'Hình ảnh', 'product', 'vi'),
	(455, 'product.view', 'Viewed', 'product', 'en'),
	(456, 'product.view', 'Lượt xem', 'product', 'vi'),
	(457, 'product.kind', 'Kind', 'product', 'en'),
	(458, 'product.kind', 'Kiểu', 'product', 'vi'),
	(459, 'product.sold', 'Sold', 'product', 'en'),
	(460, 'product.sold', 'Đã bán', 'product', 'vi'),
	(461, 'product.minimum', 'Minimum', 'product', 'en'),
	(462, 'product.minimum', 'Tối thiểu', 'product', 'vi'),
	(463, 'product.minimum_help', 'Minimum quantity to order', 'product', 'en'),
	(464, 'product.minimum_help', 'Số lượng tối thiểu đề đặt hàng', 'product', 'vi'),
	(465, 'product.width', 'Width', 'product', 'en'),
	(466, 'product.width', 'Chiều rộng', 'product', 'vi'),
	(467, 'product.status', 'Status', 'product', 'en'),
	(468, 'product.status', 'Trạng thái', 'product', 'vi'),
	(469, 'product.quantity', 'Quantity', 'product', 'en'),
	(470, 'product.quantity', 'Số lượng', 'product', 'vi'),
	(471, 'product.weight', 'Weight', 'product', 'en'),
	(472, 'product.weight', 'Khối lượng', 'product', 'vi'),
	(473, 'product.length', 'Length', 'product', 'en'),
	(474, 'product.length', 'Kích thước', 'product', 'vi'),
	(475, 'product.height', 'Height', 'product', 'en'),
	(476, 'product.height', 'Chiều cao', 'product', 'vi'),
	(477, 'product.property', 'Property', 'product', 'en'),
	(478, 'product.property', 'Đặc tính', 'product', 'vi'),
	(479, 'product.download_path', 'Url or path to file', 'product', 'en'),
	(480, 'product.download_path', 'Liên kết hoặc đường dẫn tới tập tin', 'product', 'vi'),
	(481, 'product.attribute', 'Attribute', 'product', 'en'),
	(482, 'product.attribute', 'Thuộc tính', 'product', 'vi'),
	(483, 'product.tax', 'Tax', 'product', 'en'),
	(484, 'product.tax', 'Thuế', 'product', 'vi'),
	(485, 'product.price_group', 'Click view price', 'product', 'en'),
	(486, 'product.price_group', 'Bấm xem giá', 'product', 'vi'),
	(487, 'product.price_group_chose', 'Click choose product', 'product', 'en'),
	(488, 'product.price_group_chose', 'Bấm chọn sản phẩm', 'product', 'vi'),
	(489, 'product.subtotal', 'Subtotal', 'product', 'en'),
	(490, 'product.subtotal', 'Giá sản phẩm', 'product', 'vi'),
	(491, 'product.sub_total', 'Subtotal', 'product', 'en'),
	(492, 'product.sub_total', 'Giá sản phẩm', 'product', 'vi'),
	(493, 'product.total_price', 'Total price', 'product', 'en'),
	(494, 'product.total_price', 'Tổng tiền', 'product', 'vi'),
	(495, 'product.stock_status', 'Stock status', 'product', 'en'),
	(496, 'product.stock_status', 'Trạng thái tồn', 'product', 'vi'),
	(497, 'product.out_stock', 'Out of stock', 'product', 'en'),
	(498, 'product.out_stock', 'Hết hàng', 'product', 'vi'),
	(499, 'product.in_stock', 'In stock', 'product', 'en'),
	(500, 'product.in_stock', 'Còn hàng', 'product', 'vi'),
	(501, 'product.date_available', 'Date available', 'product', 'en'),
	(502, 'product.date_available', 'Ngày bán', 'product', 'vi'),
	(503, 'product.category', 'Category', 'product', 'en'),
	(504, 'product.category', 'Danh mục', 'product', 'vi'),
	(505, 'product.category_store', 'Category store', 'product', 'en'),
	(506, 'product.category_store', 'Danh mục riêng', 'product', 'vi'),
	(507, 'product.brand', 'Brand', 'product', 'en'),
	(508, 'product.brand', 'Nhãn hàng', 'product', 'vi'),
	(509, 'product.supplier', 'Supplier', 'product', 'en'),
	(510, 'product.supplier', 'Nhà cung cấp', 'product', 'vi'),
	(511, 'product.kind_group', 'Group', 'product', 'en'),
	(512, 'product.kind_group', 'Sản phẩm nhóm', 'product', 'vi'),
	(513, 'product.kind_bundle', 'Bundle', 'product', 'en'),
	(514, 'product.kind_bundle', 'Sản phẩm bộ', 'product', 'vi'),
	(515, 'product.kind_single', 'Single', 'product', 'en'),
	(516, 'product.kind_single', 'Sản phẩm đơn', 'product', 'vi'),
	(517, 'product.description', 'Description', 'product', 'en'),
	(518, 'product.description', 'Mô tả', 'product', 'vi'),
	(519, 'product.product_detail', 'Product detail', 'product', 'en'),
	(520, 'product.product_detail', 'Chi tiết sản phẩm', 'product', 'vi'),
	(521, 'product.dont_allow_sale', 'Product :sku dont allow for sale', 'product', 'en'),
	(522, 'product.dont_allow_sale', 'Sản phẩm :sku không bán', 'product', 'vi'),
	(523, 'product.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_"', 'product', 'en'),
	(524, 'product.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_"', 'product', 'vi'),
	(525, 'product.sku_unique', 'SKU already exists', 'product', 'en'),
	(526, 'product.sku_unique', 'SKU đã có rồi', 'product', 'vi'),
	(527, 'product.product_specifications', 'Additional infomation', 'product', 'en'),
	(528, 'product.product_specifications', 'Thông tin bổ sung', 'product', 'vi'),
	(529, 'product.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'product', 'en'),
	(530, 'product.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'product', 'vi'),
	(531, 'product.sku_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and "-_"', 'product', 'en'),
	(532, 'product.sku_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_"', 'product', 'vi'),
	(533, 'product.price_promotion', 'Price promotion', 'product', 'en'),
	(534, 'product.price_promotion', 'Giá khuyến mãi', 'product', 'vi'),
	(535, 'product.price_promotion_start', 'Start date', 'product', 'en'),
	(536, 'product.price_promotion_start', 'Ngày bắt đầu', 'product', 'vi'),
	(537, 'product.price_promotion_end', 'End date', 'product', 'en'),
	(538, 'product.price_promotion_end', 'Ngày kết thúc', 'product', 'vi'),
	(539, 'product.edit_product', 'Edit product', 'product', 'en'),
	(540, 'product.edit_product', 'Chỉnh sửa sản phẩm', 'product', 'vi'),
	(541, 'product.admin.title', 'Quản lý sản phẩm', 'product.admin', 'vi'),
	(542, 'product.admin.create_success', 'Tạo item thành công!', 'product.admin', 'vi'),
	(543, 'product.admin.edit_success', 'chỉnh sửa item thành công!', 'product.admin', 'vi'),
	(544, 'product.admin.list', 'Danh sách sản phẩm', 'product.admin', 'vi'),
	(545, 'product.admin.action', 'Hành động', 'product.admin', 'vi'),
	(546, 'product.admin.delete', 'Xóa', 'product.admin', 'vi'),
	(547, 'product.admin.edit', 'Sửa', 'product.admin', 'vi'),
	(548, 'product.admin.add_new', 'Thêm mới', 'product.admin', 'vi'),
	(549, 'product.admin.add_new_title', 'Tạo sản phẩm', 'product.admin', 'vi'),
	(550, 'product.admin.add_new_title_build', 'Tạo sản phẩm bộ', 'product.admin', 'vi'),
	(551, 'product.admin.add_new_title_group', 'Tạo sản phẩm nhóm', 'product.admin', 'vi'),
	(552, 'product.admin.add_new_des', 'Tạo mới một sản phẩm', 'product.admin', 'vi'),
	(553, 'product.admin.export', 'Xuất', 'product.admin', 'vi'),
	(554, 'product.admin.refresh', 'Làm mới', 'product.admin', 'vi'),
	(555, 'product.admin.select_kind', 'Chọn loại sản phẩm', 'product.admin', 'vi'),
	(556, 'product.admin.select_supplier', 'Chọn nhà cung cấp', 'product.admin', 'vi'),
	(557, 'product.admin.sort', 'Thứ tự', 'product.admin', 'vi'),
	(558, 'product.admin.select_category', 'Chọn danh mục', 'product.admin', 'vi'),
	(559, 'product.admin.select_store', 'Chọn cửa hàng', 'product.admin', 'vi'),
	(560, 'product.admin.select_product_in_group', 'Chọn sản phẩm trong nhóm', 'product.admin', 'vi'),
	(561, 'product.admin.select_product_in_build', 'Chọn sản phẩm trong bộ', 'product.admin', 'vi'),
	(562, 'product.admin.add_product', 'Thêm sản phẩm', 'product.admin', 'vi'),
	(563, 'product.admin.add_attribute', 'Thêm thuộc tính', 'product.admin', 'vi'),
	(564, 'product.admin.add_attribute_place', 'Nhập một thuộc tính', 'product.admin', 'vi'),
	(565, 'product.admin.add_sub_image', 'Thêm ảnh', 'product.admin', 'vi'),
	(566, 'product.admin.add_product_promotion', 'Thêm giá khuyến mãi', 'product.admin', 'vi'),
	(567, 'product.admin.choose_image', 'Chọn hình', 'product.admin', 'vi'),
	(568, 'product.admin.add_price_place', 'Thêm tiền', 'product.admin', 'vi'),
	(569, 'product.admin.setting_info', 'Thiết lập sản phẩm', 'product.admin', 'vi'),
	(570, 'product.admin.config_info', 'Cấu hình thông tin', 'product.admin', 'vi'),
	(571, 'product.admin.title', 'Product manager', 'product.admin', 'en'),
	(572, 'product.admin.create_success', 'Create new item success!', 'product.admin', 'en'),
	(573, 'product.admin.edit_success', 'Edit item success!', 'product.admin', 'en'),
	(574, 'product.admin.list', 'Product list', 'product.admin', 'en'),
	(575, 'product.admin.action', 'Action', 'product.admin', 'en'),
	(576, 'product.admin.delete', 'Delete', 'product.admin', 'en'),
	(577, 'product.admin.edit', 'Edit', 'product.admin', 'en'),
	(578, 'product.admin.add_new', 'Add new', 'product.admin', 'en'),
	(579, 'product.admin.add_new_title', 'Add new product', 'product.admin', 'en'),
	(580, 'product.admin.add_new_title_build', 'Add new product build', 'product.admin', 'en'),
	(581, 'product.admin.add_new_title_group', 'Add new product group', 'product.admin', 'en'),
	(582, 'product.admin.add_new_des', 'Create a new product', 'product.admin', 'en'),
	(583, 'product.admin.export', 'Export', 'product.admin', 'en'),
	(584, 'product.admin.refresh', 'Refresh', 'product.admin', 'en'),
	(585, 'product.admin.select_kind', 'Select product kind', 'product.admin', 'en'),
	(586, 'product.admin.select_supplier', 'Select supplier', 'product.admin', 'en'),
	(587, 'product.admin.result_item', 'Showing <b>:item_from</b> to <b>:item_to</b> of <b>:total</b> items</b>', 'product.admin', 'en'),
	(588, 'product.admin.sort', 'Sort', 'product.admin', 'en'),
	(589, 'product.admin.select_category', 'Select category', 'product.admin', 'en'),
	(590, 'product.admin.select_store', 'Select store', 'product.admin', 'en'),
	(591, 'product.admin.select_product_in_group', 'Select products in group', 'product.admin', 'en'),
	(592, 'product.admin.select_product_in_build', 'Select products build', 'product.admin', 'en'),
	(593, 'product.admin.select_weight', 'Select weight class', 'product.admin', 'en'),
	(594, 'product.admin.select_weight', 'Chọn đơn vị khối lượng', 'product.admin', 'vi'),
	(595, 'product.admin.select_length', 'Select length class', 'product.admin', 'en'),
	(596, 'product.admin.select_length', 'Chọn đơn vị kích thước', 'product.admin', 'vi'),
	(597, 'product.admin.add_product', 'Add product', 'product.admin', 'en'),
	(598, 'product.admin.add_attribute', 'Add attribute', 'product.admin', 'en'),
	(599, 'product.admin.add_attribute_place', 'Add an attribute value', 'product.admin', 'en'),
	(600, 'product.admin.add_sub_image', 'Add more images', 'product.admin', 'en'),
	(601, 'product.admin.add_product_promotion', 'Add promotion price', 'product.admin', 'en'),
	(602, 'product.admin.choose_image', 'Choose', 'product.admin', 'en'),
	(603, 'product.admin.add_price_place', 'Add price', 'product.admin', 'en'),
	(604, 'product.admin.setting_info', 'Setting product', 'product.admin', 'en'),
	(605, 'product.admin.config_info', 'Config info product', 'product.admin', 'en'),
	(606, 'product.admin.search_place', 'Search Name, SKU', 'product.admin', 'en'),
	(607, 'product.admin.search_place', 'Tìm tên và SKU', 'product.admin', 'vi'),
	(608, 'product.admin.length_class', 'Length class', 'product.admin', 'en'),
	(609, 'product.admin.length_class', 'Đơn vị kích thước', 'product.admin', 'vi'),
	(610, 'product.admin.weight_class', 'Weight class', 'product.admin', 'en'),
	(611, 'product.admin.weight_class', 'Đơn vị khối lượng', 'product.admin', 'vi'),
	(612, 'product.admin.cant_remove_child', 'Please delete product parent before remove this product', 'product.admin', 'en'),
	(613, 'product.admin.cant_remove_child', 'Xóa các sản phẩm cha trước khi xóa sản phẩm này', 'product.admin', 'vi'),
	(614, 'product.config_manager.title', 'Config product', 'product.admin', 'en'),
	(615, 'product.config_manager.field', 'Field config', 'product.admin', 'en'),
	(616, 'product.config_manager.value', 'Value', 'product.admin', 'en'),
	(617, 'product.config_manager.brand', 'Use BRAND', 'product.admin', 'en'),
	(618, 'product.config_manager.supplier', 'Use SUPPLIER', 'product.admin', 'en'),
	(619, 'product.config_manager.price', 'Use PRICE', 'product.admin', 'en'),
	(620, 'product.config_manager.stock', 'Use STOCK', 'product.admin', 'en'),
	(621, 'product.config_manager.cost', 'Use COST PRICE', 'product.admin', 'en'),
	(622, 'product.config_manager.type', 'Use TYPE (new, hot,...)', 'product.admin', 'en'),
	(623, 'product.config_manager.kind', 'Use STRUCTURE TYPE (single, group, bundle)', 'product.admin', 'en'),
	(624, 'product.config_manager.property', 'Use Product Property: download, property, physical', 'product.admin', 'en'),
	(625, 'product.config_manager.attribute', 'Use ATTRIBUTE (color, size,...)', 'product.admin', 'en'),
	(626, 'product.config_manager.promotion', 'Use PROMOTION PRICE', 'product.admin', 'en'),
	(627, 'product.config_manager.available', 'Use Time to start selling', 'product.admin', 'en'),
	(628, 'product.config_manager.tax', 'Tax configuration', 'product.admin', 'en'),
	(629, 'product.config_manager.product_display_price_include_tax', 'Display price include tax', 'product.admin', 'en'),
	(630, 'product.config_manager.weight', 'Use Weight', 'product.admin', 'en'),
	(631, 'product.config_manager.length', 'Use Length', 'product.admin', 'en'),
	(632, 'product.config_manager.required', 'Required', 'product.admin', 'en'),
	(633, 'product.config_manager.title', ' Cấu hình sản phẩm', 'product.admin', 'vi'),
	(634, 'product.config_manager.field', 'Trường cấu hình', 'product.admin', 'vi'),
	(635, 'product.config_manager.value', 'Giá trị', 'product.admin', 'vi'),
	(636, 'product.config_manager.brand', 'Sử dụng NHÃN HIỆU', 'product.admin', 'vi'),
	(637, 'product.config_manager.supplier', 'Sử dụng NHÀ CUNG CẤP', 'product.admin', 'vi'),
	(638, 'product.config_manager.price', 'Sử dụng GIÁ', 'product.admin', 'vi'),
	(639, 'product.config_manager.cost', 'Sử dụng GIÁ GỐC', 'product.admin', 'vi'),
	(640, 'product.config_manager.stock', 'Sử dụng SỐ LƯỢNG', 'product.admin', 'vi'),
	(641, 'product.config_manager.type', 'Sử dụng PHÂN LOẠI TÌNH TRẠNG(mới, hot,...)', 'product.admin', 'vi'),
	(642, 'product.config_manager.kind', 'Sử dụng PHÂN LOẠI THEO CẤU TRÚC (sản phẩm đơn, nhóm, bộ)', 'product.admin', 'vi'),
	(643, 'product.config_manager.property', 'Sử dụng PHÂN LOẠI ĐẶC TÍNH: download, vật lý, dịch vụ,..', 'product.admin', 'vi'),
	(644, 'product.config_manager.attribute', 'Sử dụng THUỘC TÍNH (màu sắc, kích thước,...)', 'product.admin', 'vi'),
	(645, 'product.config_manager.promotion', 'Sử dụng GIÁ KHUYẾN MÃI', 'product.admin', 'vi'),
	(646, 'product.config_manager.available', 'Sử dụng THỜI GIAN MỞ BÁN', 'product.admin', 'vi'),
	(647, 'product.config_manager.tax', 'Cấu hình thuế', 'product.admin', 'vi'),
	(648, 'product.config_manager.product_display_price_include_tax', 'Hiển thị giá bao gồm thuế', 'product.admin', 'vi'),
	(649, 'product.config_manager.weight', 'Sử dụng Khối lượng', 'product.admin', 'vi'),
	(650, 'product.config_manager.length', 'Sử dụng Kích thước', 'product.admin', 'vi'),
	(651, 'product.config_manager.required', 'Bắt buộc', 'product.admin', 'vi'),
	(652, 'product.config_manager.show_date_available', 'Hiện thời gian bán hàng', 'product.admin', 'vi'),
	(653, 'product.config_manager.show_date_available', 'Display date available', 'product.admin', 'en'),
	(654, 'product.config_manager.product_display_out_of_stock', 'Hiện sản phẩm hết hàng', 'product.admin', 'vi'),
	(655, 'product.config_manager.product_display_out_of_stock', 'Display product out of stock', 'product.admin', 'en'),
	(656, 'customer.my_account', 'My page', 'customer', 'en'),
	(657, 'customer.my_account', 'Trang cá nhân', 'customer', 'vi'),
	(658, 'customer.password', 'Password', 'customer', 'en'),
	(659, 'customer.password', 'Mật khẩu', 'customer', 'vi'),
	(660, 'customer.password_new', 'New password', 'customer', 'en'),
	(661, 'customer.password_new', 'Mật khẩu mới', 'customer', 'vi'),
	(662, 'customer.password_old', 'Old password', 'customer', 'en'),
	(663, 'customer.password_old', 'Mật khẩu cũ', 'customer', 'vi'),
	(664, 'customer.password_old_required', 'Old password required', 'customer', 'en'),
	(665, 'customer.password_old_required', 'Mật khẩu cũ là bắt buộc', 'customer', 'vi'),
	(666, 'customer.password_old_notcorrect', 'Old password incorrect', 'customer', 'en'),
	(667, 'customer.password_old_notcorrect', 'Mật khẩu cũ chưa đúng', 'customer', 'vi'),
	(668, 'customer.remember_me', 'Remember', 'customer', 'en'),
	(669, 'customer.remember_me', 'Ghi nhớ', 'customer', 'vi'),
	(670, 'customer.change_password', 'Change password', 'customer', 'en'),
	(671, 'customer.change_password', 'Đổi mật khẩu', 'customer', 'vi'),
	(672, 'customer.update_success', 'Update success', 'customer', 'en'),
	(673, 'customer.update_success', 'Cập nhật thành công', 'customer', 'vi'),
	(674, 'customer.update_infomation', 'Update infomation', 'customer', 'en'),
	(675, 'customer.update_infomation', 'Cập nhật thông tin', 'customer', 'vi'),
	(676, 'customer.change_infomation', 'Change infomation', 'customer', 'en'),
	(677, 'customer.change_infomation', 'Thay đổi thông tin', 'customer', 'vi'),
	(678, 'customer.order_history', 'Order history', 'customer', 'en'),
	(679, 'customer.order_history', 'Lịch sử mua hàng', 'customer', 'vi'),
	(680, 'customer.order_detail', 'Order detail', 'customer', 'en'),
	(681, 'customer.order_detail', 'Chi tiết đơn hàng', 'customer', 'vi'),
	(682, 'customer.address_list', 'Address list', 'customer', 'en'),
	(683, 'customer.address_list', 'Danh sách địa chỉ', 'customer', 'vi'),
	(684, 'customer.address_detail', 'Address detail', 'customer', 'en'),
	(685, 'customer.address_detail', 'Danh sách địa chỉ', 'customer', 'vi'),
	(686, 'customer.address_default', 'Address default', 'customer', 'en'),
	(687, 'customer.address_default', 'Địa chỉ mặc định', 'customer', 'vi'),
	(688, 'customer.address_set_default', 'Set address default', 'customer', 'en'),
	(689, 'customer.address_set_default', 'Đặt địa chỉ mặc định', 'customer', 'vi'),
	(690, 'customer.delete_address_success', 'Delete address success', 'customer', 'en'),
	(691, 'customer.delete_address_success', 'Xóa địa chỉ thành công', 'customer', 'vi'),
	(692, 'customer.verify_email.button_verify', 'Email verification', 'customer', 'en'),
	(693, 'customer.verify_email.button_verify', 'Xác thực email', 'customer', 'vi'),
	(694, 'customer.verify_email.title_page', 'Email verification', 'customer', 'en'),
	(695, 'customer.verify_email.title_page', 'Xác thực email', 'customer', 'vi'),
	(696, 'customer.verify_email.link_invalid', 'Link invalid', 'customer', 'en'),
	(697, 'customer.verify_email.link_invalid', 'Link không hợp lệ', 'customer', 'vi'),
	(698, 'customer.verify_email.verify_success', 'Successful verification', 'customer', 'en'),
	(699, 'customer.verify_email.verify_success', 'Xác thực thành công', 'customer', 'vi'),
	(700, 'customer.verify_email.msg_sent', 'Verification link sent.', 'customer', 'en'),
	(701, 'customer.verify_email.msg_sent', 'Đã gửi liên kết xác minh!', 'customer', 'vi'),
	(702, 'customer.verify_email.msg_page_2', 'click here to request another.', 'customer', 'en'),
	(703, 'customer.verify_email.msg_page_2', 'hãy nhấp vào đây để yêu cầu.', 'customer', 'vi'),
	(704, 'customer.verify_email.msg_page_1', 'Before proceeding, please check your email for a verification link. If you did not receive the email,', 'customer', 'en'),
	(705, 'customer.verify_email.msg_page_1', 'Trước khi tiếp tục, vui lòng kiểm tra email của bạn để biết liên kết xác minh. Nếu bạn không nhận được email,', 'customer', 'vi'),
	(706, 'customer.verify_email.title_header', 'Verify Your Email Address', 'customer', 'en'),
	(707, 'customer.verify_email.title_header', 'Xác minh địa chỉ email của bạn', 'customer', 'vi'),
	(708, 'customer.password_forgot', 'Forgot password', 'customer', 'en'),
	(709, 'customer.password_forgot', 'Quên mật khẩu', 'customer', 'vi'),
	(710, 'customer.login_title', 'Login page', 'customer', 'en'),
	(711, 'customer.login_title', 'Trang đăng nhập', 'customer', 'vi'),
	(712, 'customer.register_success', 'Successful register', 'customer', 'en'),
	(713, 'customer.register_success', 'Đăng ký thành công', 'customer', 'vi'),
	(714, 'customer.signup', 'Signup', 'customer', 'en'),
	(715, 'customer.signup', 'Đăng ký', 'customer', 'vi'),
	(716, 'customer.title_register', 'Account register', 'customer', 'en'),
	(717, 'customer.title_register', 'Đăng ký tài khoản', 'customer', 'vi'),
	(718, 'customer.password_reset', 'Password reset', 'customer', 'en'),
	(719, 'customer.password_reset', 'Reset mật khẩu', 'customer', 'vi'),
	(720, 'customer.password_confirm', 'Password confirm', 'customer', 'en'),
	(721, 'customer.password_confirm', 'Xác nhận mật khẩu', 'customer', 'vi'),
	(722, 'customer.phone_regex', 'The phone format is not correct. Length 8-14, use only 0-9 and the "-" SIGN.', 'customer', 'en'),
	(723, 'customer.phone_regex', 'Số điện thoại định dạng không đúng. Chiều dài 8-14, chỉ sử dụng số 0-9 và "-"', 'customer', 'vi'),
	(724, 'customer.country', 'Country', 'customer', 'en'),
	(725, 'customer.country', 'Quốc gia', 'customer', 'vi'),
	(726, 'customer.company', 'Công ty', 'customer', 'vi'),
	(727, 'customer.company', 'Company', 'customer', 'en'),
	(728, 'customer.address3', 'Địa chỉ nhà', 'customer', 'vi'),
	(729, 'customer.address3', 'Address 3', 'customer', 'en'),
	(730, 'customer.address2', 'Quận/Huyện', 'customer', 'vi'),
	(731, 'customer.address2', 'Address 2', 'customer', 'en'),
	(732, 'customer.address1', 'Tỉnh/Thành', 'customer', 'vi'),
	(733, 'customer.address1', 'Address 1', 'customer', 'en'),
	(734, 'customer.postcode', 'Mã bưu điện', 'customer', 'vi'),
	(735, 'customer.postcode', 'Post code', 'customer', 'en'),
	(736, 'customer.phone', 'Phone', 'customer', 'en'),
	(737, 'customer.phone', 'Điện thoại', 'customer', 'vi'),
	(738, 'customer.last_name_kana', 'Họ kana', 'customer', 'vi'),
	(739, 'customer.last_name_kana', 'Last name kana', 'customer', 'en'),
	(740, 'customer.first_name_kana', 'First name kana', 'customer', 'en'),
	(741, 'customer.first_name_kana', 'Tên Kana', 'customer', 'vi'),
	(742, 'customer.full_name', 'Full name', 'customer', 'en'),
	(743, 'customer.full_name', 'Tên đầy đủ', 'customer', 'vi'),
	(744, 'customer.name', 'Name', 'customer', 'en'),
	(745, 'customer.name', 'Tên', 'customer', 'vi'),
	(746, 'customer.midle_name', 'Tên đệm', 'customer', 'vi'),
	(747, 'customer.midle_name', 'Midle name', 'customer', 'en'),
	(748, 'customer.last_name', 'Họ', 'customer', 'vi'),
	(749, 'customer.last_name', 'Last name', 'customer', 'en'),
	(750, 'customer.first_name', 'Tên', 'customer', 'vi'),
	(751, 'customer.first_name', 'First name', 'customer', 'en'),
	(752, 'customer.email', 'Email', 'customer', 'vi'),
	(753, 'customer.email', 'Email', 'customer', 'en'),
	(754, 'customer.sex', 'Giới tính', 'customer', 'vi'),
	(755, 'customer.sex', 'Sex', 'customer', 'en'),
	(756, 'customer.sex_women', 'Women', 'customer', 'en'),
	(757, 'customer.sex_women', 'Nữ', 'customer', 'vi'),
	(758, 'customer.sex_other', 'Other', 'customer', 'en'),
	(759, 'customer.sex_other', 'Khác', 'customer', 'vi'),
	(760, 'customer.sex_men', 'Men', 'customer', 'en'),
	(761, 'customer.sex_men', 'Nam', 'customer', 'vi'),
	(762, 'customer.birthday', 'Ngày sinh', 'customer', 'vi'),
	(763, 'customer.birthday', 'Birthday', 'customer', 'en'),
	(764, 'customer.title_login', 'Login account', 'customer', 'en'),
	(765, 'customer.title_login', 'Đăng nhập', 'customer', 'vi'),
	(766, 'customer.my_profile', 'Tài khoản', 'customer', 'vi'),
	(767, 'customer.my_profile', 'My profile', 'customer', 'en'),
	(768, 'customer.status', 'Trạng thái', 'customer', 'vi'),
	(769, 'customer.status', 'Status', 'customer', 'en'),
	(770, 'customer.group', 'Nhóm', 'customer', 'en'),
	(771, 'customer.group', 'Group', 'customer', 'vi'),
	(772, 'customer.admin.add_new_title', 'Thêm mới khách hàng', 'customer.admin', 'vi'),
	(773, 'customer.admin.add_new_title', 'Add new customer', 'customer.admin', 'en'),
	(774, 'customer.admin.add_new_des', 'Thêm mới', 'customer.admin', 'vi'),
	(775, 'customer.admin.add_new_des', 'Add new', 'customer.admin', 'en'),
	(776, 'customer.admin.provider', 'Provider', 'customer.admin', 'vi'),
	(777, 'customer.admin.provider', 'Provider', 'customer.admin', 'en'),
	(778, 'customer.admin.field', 'Trường dữ liệu', 'customer.admin', 'vi'),
	(779, 'customer.admin.field', 'Field data', 'customer.admin', 'en'),
	(780, 'customer.admin.value', 'Giá trị', 'customer.admin', 'vi'),
	(781, 'customer.admin.value', 'Value', 'customer.admin', 'en'),
	(782, 'customer.admin.required', 'Bắt buộc', 'customer.admin', 'vi'),
	(783, 'customer.admin.required', 'Required', 'customer.admin', 'en'),
	(784, 'customer.admin.keep_password', 'Giữ mật khẩu', 'customer.admin', 'vi'),
	(785, 'customer.admin.keep_password', 'Keep password', 'customer.admin', 'en'),
	(786, 'customer.admin.list', 'Danh sách khách hàng', 'customer.admin', 'vi'),
	(787, 'customer.admin.list', 'Customer list', 'customer.admin', 'en'),
	(788, 'customer.config_manager.title', ' Config customer', 'customer.admin', 'en'),
	(789, 'customer.config_manager.field', 'Field config', 'customer.admin', 'en'),
	(790, 'customer.config_manager.value', 'Value', 'customer.admin', 'en'),
	(791, 'customer.config_manager.lastname', 'Use last name', 'customer.admin', 'en'),
	(792, 'customer.config_manager.name_kana', 'Use name KANA', 'customer.admin', 'en'),
	(793, 'customer.config_manager.firstname_kana', 'Use first name KANA', 'customer.admin', 'en'),
	(794, 'customer.config_manager.lastname_kana', 'Use last name KANA', 'customer.admin', 'en'),
	(795, 'customer.config_manager.address1', 'Use ADDRESS 1', 'customer.admin', 'en'),
	(796, 'customer.config_manager.address2', 'Use ADDRESS 2', 'customer.admin', 'en'),
	(797, 'customer.config_manager.address3', 'Use ADDRESS 3', 'customer.admin', 'en'),
	(798, 'customer.config_manager.company', 'Use COMPANY', 'customer.admin', 'en'),
	(799, 'customer.config_manager.postcode', 'Use POSTCODE', 'customer.admin', 'en'),
	(800, 'customer.config_manager.country', 'Use COUNTRY', 'customer.admin', 'en'),
	(801, 'customer.config_manager.group', 'Use GROUP', 'customer.admin', 'en'),
	(802, 'customer.config_manager.birthday', 'Use BIRTHDAY', 'customer.admin', 'en'),
	(803, 'customer.config_manager.sex', 'Use SEX', 'customer.admin', 'en'),
	(804, 'customer.config_manager.phone', 'Use PHONE', 'customer.admin', 'en'),
	(805, 'customer.config_manager.reqired', 'Required', 'customer.admin', 'en'),
	(806, 'customer.config_manager.title', ' Cấu hình khách hàng', 'customer.admin', 'vi'),
	(807, 'customer.config_manager.lastname', 'Sử dụng HỌ', 'customer.admin', 'vi'),
	(808, 'customer.config_manager.name_kana', 'Sử dụng tên KANA', 'customer.admin', 'vi'),
	(809, 'customer.config_manager.firstname_kana', 'Sử dụng tên KANA', 'customer.admin', 'vi'),
	(810, 'customer.config_manager.lasttname_kana', 'Sử dụng họ KANA', 'customer.admin', 'vi'),
	(811, 'customer.config_manager.address1', 'Sử dụng Tỉnh/Thành', 'customer.admin', 'vi'),
	(812, 'customer.config_manager.address2', 'Sử dụng Quận/Huyện', 'customer.admin', 'vi'),
	(813, 'customer.config_manager.address3', 'Địa chỉ nhà', 'customer.admin', 'vi'),
	(814, 'customer.config_manager.company', 'Sử dụng Công Ty', 'customer.admin', 'vi'),
	(815, 'customer.config_manager.postcode', 'Sử dụng Mã bưu chính', 'customer.admin', 'vi'),
	(816, 'customer.config_manager.country', 'Sử dụng Quốc Gia', 'customer.admin', 'vi'),
	(817, 'customer.config_manager.group', 'Sử dụng Nhóm', 'customer.admin', 'vi'),
	(818, 'customer.config_manager.birthday', 'Sử dụng NGÀY SINH', 'customer.admin', 'vi'),
	(819, 'customer.config_manager.sex', 'Sử dụng GIỚI TÍNH', 'customer.admin', 'vi'),
	(820, 'customer.config_manager.phone', 'Sử dụng SỐ ĐIỆN THOẠI', 'customer.admin', 'vi'),
	(821, 'customer.config_manager.required', 'Bắt buộc', 'customer.admin', 'vi'),
	(822, 'order.order_status', 'Trạng thái đơn hàng', 'order', 'vi'),
	(823, 'order.order_status', 'Order status', 'order', 'en'),
	(824, 'order.shipping_status', 'Trạng thái vận chuyển', 'order', 'vi'),
	(825, 'order.shipping_status', 'Shipping status', 'order', 'en'),
	(826, 'order.payment_status', 'Trạng thái thanh toán', 'order', 'vi'),
	(827, 'order.payment_status', 'Payment status', 'order', 'en'),
	(828, 'order.payment_method', 'Phương thức thanh toán', 'order', 'vi'),
	(829, 'order.payment_method', 'Payment method', 'order', 'en'),
	(830, 'order.shipping_method', 'Phương thức vận chuyển', 'order', 'vi'),
	(831, 'order.shipping_method', 'Shipping method', 'order', 'en'),
	(832, 'order.currency', 'Tiền tệ', 'order', 'vi'),
	(833, 'order.currency', 'Currency', 'order', 'en'),
	(834, 'order.exchange_rate', 'Tỉ giá', 'order', 'vi'),
	(835, 'order.exchange_rate', 'Exchange rate', 'order', 'en'),
	(836, 'order.balance', 'Còn lại', 'order', 'vi'),
	(837, 'order.balance', 'Balance', 'order', 'en'),
	(838, 'order.total', 'Tổng tiền', 'order', 'vi'),
	(839, 'order.total', 'Total', 'order', 'en'),
	(840, 'order.sub_total', 'Tiền hàng', 'order', 'vi'),
	(841, 'order.sub_total', 'SubTotal', 'order', 'en'),
	(842, 'order.subtotal', 'Tiền hàng', 'order', 'vi'),
	(843, 'order.subtotal', 'SubTotal', 'order', 'en'),
	(844, 'order.tax', 'Thuế', 'order', 'vi'),
	(845, 'order.tax', 'Tax', 'order', 'en'),
	(846, 'order.shipping', 'Vận chuyển', 'order', 'vi'),
	(847, 'order.shipping', 'Shipping', 'order', 'en'),
	(848, 'order.received', 'Đã nhận', 'order', 'vi'),
	(849, 'order.received', 'Received', 'order', 'en'),
	(850, 'order.discount', 'Giảm giá', 'order', 'vi'),
	(851, 'order.discount', 'Discount', 'order', 'en'),
	(852, 'order.totals.total', 'Tổng tiền', 'order', 'vi'),
	(853, 'order.totals.total', 'Total', 'order', 'en'),
	(854, 'order.totals.sub_total', 'Tiền hàng', 'order', 'vi'),
	(855, 'order.totals.sub_total', 'SubTotal', 'order', 'en'),
	(856, 'order.totals.tax', 'Thuế', 'order', 'vi'),
	(857, 'order.totals.tax', 'Tax', 'order', 'en'),
	(858, 'order.totals.discount', 'Giảm giá', 'order', 'vi'),
	(859, 'order.totals.discount', 'Discount', 'order', 'en'),
	(860, 'order.totals.shipping', 'Vận chuyển', 'order', 'vi'),
	(861, 'order.totals.shipping', 'Shipping', 'order', 'en'),
	(862, 'order.totals.received', 'Đã nhận', 'order', 'vi'),
	(863, 'order.totals.received', 'Received', 'order', 'en'),
	(864, 'order.detail', 'Chi tiết', 'order', 'vi'),
	(865, 'order.detail', 'Order detail', 'order', 'en'),
	(866, 'order.phone_regex', 'The phone format is not correct. Length 8-14, use only 0-9 and the "-" SIGN.', 'order', 'en'),
	(867, 'order.phone_regex', 'Số điện thoại định dạng không đúng. Chiều dài 8-14, chỉ sử dụng số 0-9 và "-"', 'order', 'vi'),
	(868, 'order.country', 'Country', 'order', 'en'),
	(869, 'order.country', 'Quốc gia', 'order', 'vi'),
	(870, 'order.company', 'Công ty', 'order', 'vi'),
	(871, 'order.company', 'Company', 'order', 'en'),
	(872, 'order.address3', 'Địa chỉ nhà', 'order', 'vi'),
	(873, 'order.address3', 'Address 3', 'order', 'en'),
	(874, 'order.address2', 'Quận/Huyện', 'order', 'vi'),
	(875, 'order.address2', 'Address 2', 'order', 'en'),
	(876, 'order.address1', 'Tỉnh/Thành', 'order', 'vi'),
	(877, 'order.address1', 'Address 1', 'order', 'en'),
	(878, 'order.address', 'Địa chỉ', 'order', 'vi'),
	(879, 'order.address', 'Address', 'order', 'en'),
	(880, 'order.postcode', 'Mã bưu điện', 'order', 'vi'),
	(881, 'order.postcode', 'Post code', 'order', 'en'),
	(882, 'order.phone', 'Phone', 'order', 'en'),
	(883, 'order.phone', 'Điện thoại', 'order', 'vi'),
	(884, 'order.last_name_kana', 'Họ kana', 'order', 'vi'),
	(885, 'order.last_name_kana', 'Last name kana', 'order', 'en'),
	(886, 'order.first_name_kana', 'First name kana', 'order', 'en'),
	(887, 'order.first_name_kana', 'Tên Kana', 'order', 'vi'),
	(888, 'order.full_name', 'Full name', 'order', 'en'),
	(889, 'order.full_name', 'Tên đầy đủ', 'order', 'vi'),
	(890, 'order.name', 'Name', 'order', 'en'),
	(891, 'order.name', 'Tên', 'order', 'vi'),
	(892, 'order.midle_name', 'Tên đệm', 'order', 'vi'),
	(893, 'order.midle_name', 'Midle name', 'order', 'en'),
	(894, 'order.last_name', 'Họ', 'order', 'vi'),
	(895, 'order.last_name', 'Last name', 'order', 'en'),
	(896, 'order.first_name', 'Tên', 'order', 'vi'),
	(897, 'order.first_name', 'First name', 'order', 'en'),
	(898, 'order.email', 'Email', 'order', 'vi'),
	(899, 'order.email', 'Email', 'order', 'en'),
	(900, 'order.sex', 'Giới tính', 'order', 'vi'),
	(901, 'order.sex', 'Sex', 'order', 'en'),
	(902, 'order.sex_women', 'Women', 'order', 'en'),
	(903, 'order.sex_women', 'Nữ', 'order', 'vi'),
	(904, 'order.sex_other', 'Other', 'order', 'en'),
	(905, 'order.sex_other', 'Khác', 'order', 'vi'),
	(906, 'order.sex_men', 'Men', 'order', 'en'),
	(907, 'order.sex_men', 'Nam', 'order', 'vi'),
	(908, 'order.birthday', 'Ngày sinh', 'order', 'vi'),
	(909, 'order.birthday', 'Birthday', 'order', 'en'),
	(910, 'order.status', 'Trạng thái đơn hàng', 'order', 'vi'),
	(911, 'order.status', 'Order status', 'order', 'en'),
	(912, 'order.order_detail', 'Chi tiết đơn hàng', 'order', 'vi'),
	(913, 'order.order_detail', 'Order detail', 'order', 'en'),
	(914, 'order.note', 'Note', 'order', 'en'),
	(915, 'order.note', 'Ghi chú', 'order', 'vi'),
	(916, 'order.order_note', 'Note', 'order', 'en'),
	(917, 'order.order_note', 'Ghi chú', 'order', 'vi'),
	(918, 'order.domain', 'Domain', 'order', 'en'),
	(919, 'order.domain', 'Tên miền', 'order', 'vi'),
	(920, 'order.admin.order_history', 'Order history', 'order.admin', 'en'),
	(921, 'order.admin.history_staff', 'Staff', 'order.admin', 'en'),
	(922, 'order.admin.history_content', 'Content', 'order.admin', 'en'),
	(923, 'order.admin.history_time', 'Time', 'order.admin', 'en'),
	(924, 'order.admin.order_history', 'Lịch sử đơn hàng', 'order.admin', 'vi'),
	(925, 'order.admin.history_staff', 'Nhân viên', 'order.admin', 'vi'),
	(926, 'order.admin.history_content', 'Nội dung', 'order.admin', 'vi'),
	(927, 'order.admin.history_time', 'Thời gian', 'order.admin', 'vi'),
	(928, 'order.admin.title', 'Quản lý đơn hàng', 'order.admin', 'vi'),
	(929, 'order.admin.config_title', 'Cấu hình đơn hàng', 'order.admin', 'vi'),
	(930, 'order.admin.list', 'Danh sách đơn hàng', 'order.admin', 'vi'),
	(931, 'order.admin.payment_method', 'Phương thức thanh toán', 'order.admin', 'vi'),
	(932, 'order.admin.payment_method_short', 'Payment method', 'order.admin', 'vi'),
	(933, 'order.admin.currency', 'Tiền tệ', 'order.admin', 'vi'),
	(934, 'order.admin.exchange_rate', 'Tỉ giá', 'order.admin', 'vi'),
	(935, 'order.admin.order_new', 'Thêm mới', 'order.admin', 'vi'),
	(936, 'order.admin.add_new', 'Thêm mới', 'order.admin', 'vi'),
	(937, 'order.admin.add_new_title', 'Tạo đơn hàng', 'order.admin', 'vi'),
	(938, 'order.admin.add_new_des', 'Tạo mới một đơn hàng', 'order.admin', 'vi'),
	(939, 'order.admin.export_batch', 'Xuất', 'order.admin', 'vi'),
	(940, 'order.admin.config_info', 'Cấu hình đơn hàng', 'order.admin', 'vi'),
	(941, 'order.admin.store', 'Cửa hàng', 'order.admin', 'vi'),
	(942, 'order.admin.title', 'Order manager', 'order.admin', 'en'),
	(943, 'order.admin.config_title', 'Config info order', 'order.admin', 'en'),
	(944, 'order.admin.list', 'Order list', 'order.admin', 'en'),
	(945, 'order.admin.payment_method', 'Payment method', 'order.admin', 'en'),
	(946, 'order.admin.payment_method_short', 'Payment method', 'order.admin', 'en'),
	(947, 'order.admin.currency', 'Currency', 'order.admin', 'en'),
	(948, 'order.admin.exchange_rate', 'Exchange rate', 'order.admin', 'en'),
	(949, 'order.admin.status', 'Status', 'order.admin', 'en'),
	(950, 'order.admin.status', 'Trạng thái', 'order.admin', 'vi'),
	(951, 'order.admin.created_at', 'Created at', 'order.admin', 'en'),
	(952, 'order.admin.created_at', 'Tạo lúc', 'order.admin', 'vi'),
	(953, 'order.admin.order_new', 'Add new', 'order.admin', 'en'),
	(954, 'order.admin.add_new', 'Add new', 'order.admin', 'en'),
	(955, 'order.admin.add_new_title', 'Add new order', 'order.admin', 'en'),
	(956, 'order.admin.add_new_des', 'Create a new order', 'order.admin', 'en'),
	(957, 'order.admin.export_batch', 'Export', 'order.admin', 'en'),
	(958, 'order.admin.config_info', 'Config order', 'order.admin', 'en'),
	(959, 'order.admin.store', 'Store', 'order.admin', 'en'),
	(960, 'order.admin.search_order_status', 'Search order status', 'order.admin', 'en'),
	(961, 'order.admin.search_order_status', 'Tìm trạng thái đơn hàng', 'order.admin', 'vi'),
	(962, 'order.admin.search_email', 'Search email', 'order.admin', 'en'),
	(963, 'order.admin.search_email', 'Tìm email', 'order.admin', 'vi'),
	(964, 'order.admin.search_id', 'Search id', 'order.admin', 'en'),
	(965, 'order.admin.search_id', 'Tìm ID', 'order.admin', 'vi'),
	(966, 'order.admin.select_product', 'Select product', 'order.admin', 'en'),
	(967, 'order.admin.select_product', 'Chọn sản phẩm', 'order.admin', 'vi'),
	(968, 'order.admin.product_buy_out_of_stock', 'Allow buy out of stock', 'order.admin', 'en'),
	(969, 'order.admin.product_buy_out_of_stock', 'Cho phép mua hàng đã hết', 'order.admin', 'vi'),
	(970, 'order.admin.shipping_off', 'Dont use shipping method', 'order.admin', 'en'),
	(971, 'order.admin.shipping_off', 'Không sử dụng phương thức vận chuyển', 'order.admin', 'vi'),
	(972, 'order.admin.payment_off', 'Dont use payment method', 'order.admin', 'en'),
	(973, 'order.admin.payment_off', 'Không sử dụng phương thức thanh toán', 'order.admin', 'vi'),
	(974, 'order.admin.product_preorder', 'Allow pre-order', 'order.admin', 'en'),
	(975, 'order.admin.product_preorder', 'Cho phép đặt hàng trước', 'order.admin', 'vi'),
	(976, 'order.admin.shop_allow_guest', 'Allow buy no need login', 'order.admin', 'en'),
	(977, 'order.admin.shop_allow_guest', 'Cho phép mua không cần đăng nhập', 'order.admin', 'vi'),
	(978, 'order.admin.select_customer', 'Select customer', 'order.admin', 'en'),
	(979, 'order.admin.select_customer', 'Chọn khách hàng', 'order.admin', 'vi'),
	(980, 'contact.name', 'Tên', 'contact', 'vi'),
	(981, 'contact.name', 'Name', 'contact', 'en'),
	(982, 'contact.email', 'Email', 'contact', 'vi'),
	(983, 'contact.email', 'Email', 'contact', 'en'),
	(984, 'contact.phone', 'Điện thoại', 'contact', 'vi'),
	(985, 'contact.phone', 'Phone', 'contact', 'en'),
	(986, 'contact.subject', 'Tiêu đề', 'contact', 'vi'),
	(987, 'contact.subject', 'Subject', 'contact', 'en'),
	(988, 'contact.content', 'Nội dung', 'contact', 'vi'),
	(989, 'contact.content', 'content', 'contact', 'en'),
	(990, 'contact.page_title', 'Liên hệ', 'contact', 'vi'),
	(991, 'contact.page_title', 'Contact page', 'contact', 'en'),
	(992, 'contact.thank_contact', 'Cảm ơn vì bạn đã liên hệ', 'contact', 'vi'),
	(993, 'contact.thank_contact', 'Thank you for your contact', 'contact', 'en'),
	(994, 'filter_sort.sort', 'Thứ tự', 'filter_sort', 'vi'),
	(995, 'filter_sort.sort', 'Sort', 'filter_sort', 'en'),
	(996, 'filter_sort.price_asc', 'Giá tăng dần', 'filter_sort', 'vi'),
	(997, 'filter_sort.price_asc', 'Price ascending', 'filter_sort', 'en'),
	(998, 'filter_sort.price_desc', 'Giá giảm dần', 'filter_sort', 'vi'),
	(999, 'filter_sort.price_desc', 'Price descending', 'filter_sort', 'en'),
	(1000, 'filter_sort.sort_asc', 'Sort tăng dần', 'filter_sort', 'vi'),
	(1001, 'filter_sort.sort_asc', 'Sort ascending', 'filter_sort', 'en'),
	(1002, 'filter_sort.sort_desc', 'Sort giảm dần', 'filter_sort', 'vi'),
	(1003, 'filter_sort.sort_desc', 'Sort descending', 'filter_sort', 'en'),
	(1004, 'filter_sort.id_asc', 'ID tăng dần', 'filter_sort', 'vi'),
	(1005, 'filter_sort.id_asc', 'ID ascending', 'filter_sort', 'en'),
	(1006, 'filter_sort.id_desc', 'ID giảm dần', 'filter_sort', 'vi'),
	(1007, 'filter_sort.id_desc', 'ID descending', 'filter_sort', 'en'),
	(1008, 'filter_sort.name_desc', 'Tên theo thứ tự z-a', 'filter_sort', 'vi'),
	(1009, 'filter_sort.name_desc', 'Name in z-a order', 'filter_sort', 'en'),
	(1010, 'filter_sort.name_asc', 'Tên theo thứ tự a-z', 'filter_sort', 'vi'),
	(1011, 'filter_sort.name_asc', 'Name in a-z order', 'filter_sort', 'en'),
	(1012, 'filter_sort.first_name_desc', 'Tên theo thứ tự z-a', 'filter_sort', 'vi'),
	(1013, 'filter_sort.first_name_desc', 'First name in z-a order', 'filter_sort', 'en'),
	(1014, 'filter_sort.first_name_asc', 'Tên theo thứ tự a-z', 'filter_sort', 'vi'),
	(1015, 'filter_sort.first_name_asc', 'First name in a-z order', 'filter_sort', 'en'),
	(1016, 'filter_sort.last_name_desc', 'Họ theo thứ tự z-a', 'filter_sort', 'vi'),
	(1017, 'filter_sort.last_name_desc', 'Last name in z-a order', 'filter_sort', 'en'),
	(1018, 'filter_sort.last_name_asc', 'Họ theo thứ tự a-z', 'filter_sort', 'vi'),
	(1019, 'filter_sort.last_name_asc', 'Last name in a-z order', 'filter_sort', 'en'),
	(1020, 'filter_sort.title_desc', 'Tiêu đề theo thứ tự z-a', 'filter_sort', 'vi'),
	(1021, 'filter_sort.title_desc', 'Title in z-a order', 'filter_sort', 'en'),
	(1022, 'filter_sort.title_asc', 'Tiêu đề theo thứ tự a-z', 'filter_sort', 'vi'),
	(1023, 'filter_sort.title_asc', 'Title in a-z order', 'filter_sort', 'en'),
	(1024, 'filter_sort.sold_asc', 'Bán ra tăng dần', 'filter_sort', 'vi'),
	(1025, 'filter_sort.sold_asc', 'Sold ascending', 'filter_sort', 'en'),
	(1026, 'filter_sort.sold_desc', 'Bán ra giảm dần', 'filter_sort', 'vi'),
	(1027, 'filter_sort.sold_desc', 'Sold descending', 'filter_sort', 'en'),
	(1028, 'filter_sort.view_desc', 'Lượt xem giảm dần', 'filter_sort', 'vi'),
	(1029, 'filter_sort.view_desc', 'View descending', 'filter_sort', 'en'),
	(1030, 'filter_sort.view_asc', 'Lượt xem tăng dần', 'filter_sort', 'vi'),
	(1031, 'filter_sort.view_asc', 'View ascending', 'filter_sort', 'en'),
	(1032, 'filter_sort.alpha_desc', ':alpha theo thứ tự z-a', 'filter_sort', 'vi'),
	(1033, 'filter_sort.alpha_desc', ':alpha in z-a order', 'filter_sort', 'en'),
	(1034, 'filter_sort.alpha_asc', ':alpha theo thứ tự a-z', 'filter_sort', 'vi'),
	(1035, 'filter_sort.alpha_asc', ':alpha in a-z order', 'filter_sort', 'en'),
	(1036, 'filter_sort.value_asc', ':value tăng dần', 'filter_sort', 'vi'),
	(1037, 'filter_sort.value_asc', ':value ascending', 'filter_sort', 'en'),
	(1038, 'filter_sort.value_desc', ':value giảm dần', 'filter_sort', 'vi'),
	(1039, 'filter_sort.value_desc', ':value descending', 'filter_sort', 'en'),
	(1040, 'subscribe.email', 'Email', 'subscribe', 'en'),
	(1041, 'subscribe.action', 'Subscribe', 'subscribe', 'en'),
	(1042, 'subscribe.title', 'Subscribe email', 'subscribe', 'en'),
	(1043, 'subscribe.subscribe_des', 'Get the most recent updates from us', 'subscribe', 'en'),
	(1044, 'subscribe.subscribe_email', 'Your email', 'subscribe', 'en'),
	(1045, 'subscribe.subscribe_success', 'Subscribe email successful!', 'subscribe', 'en'),
	(1046, 'subscribe.email', 'Email', 'subscribe', 'vi'),
	(1047, 'subscribe.action', 'Đăng ký', 'subscribe', 'vi'),
	(1048, 'subscribe.title', 'Đăng ký email', 'subscribe', 'vi'),
	(1049, 'subscribe.subscribe_des', 'Nhận cập nhật mới nhất', 'subscribe', 'vi'),
	(1050, 'subscribe.subscribe_email', 'Email của bạn', 'subscribe', 'vi'),
	(1051, 'subscribe.subscribe_success', 'Đăng ký email thành công!', 'subscribe', 'vi'),
	(1052, 'subscribe.admin.email', 'Email', 'subscribe.admin', 'vi'),
	(1053, 'subscribe.admin.email', 'Email', 'subscribe.admin', 'en'),
	(1054, 'subscribe.admin.list', 'Danh sách đang ký', 'subscribe.admin', 'vi'),
	(1055, 'subscribe.admin.list', 'Subscribe list', 'subscribe.admin', 'en'),
	(1056, 'subscribe.admin.status', 'Trạng thái', 'subscribe.admin', 'vi'),
	(1057, 'subscribe.admin.status', 'Status', 'subscribe.admin', 'en'),
	(1058, 'subscribe.admin.add_new_title', 'Thêm đăng ký', 'subscribe.admin', 'vi'),
	(1059, 'subscribe.admin.add_new_title', 'Add subscribe', 'subscribe.admin', 'en'),
	(1060, 'subscribe.admin.add_new_des', 'Thêm tài khoản đăng ký', 'subscribe.admin', 'vi'),
	(1061, 'subscribe.admin.add_new_des', 'Add a new subscribe', 'subscribe.admin', 'en'),
	(1062, 'subscribe.admin.search_place', 'Search ID or email', 'subscribe.admin', 'en'),
	(1063, 'subscribe.admin.search_place', 'Tìm ID hoặc email', 'admin.subscribe', 'vi'),
	(1064, 'about.page_title', 'About us', 'about', 'en'),
	(1065, 'about.page_title', 'Giới thiệu', 'about', 'vi'),
	(1066, 'admin.user.setting', 'Setting', 'admin.user', 'en'),
	(1067, 'admin.user.setting', 'Cài đặt', 'admin.user', 'vi'),
	(1068, 'admin.user.logout', 'Logout', 'admin.user', 'en'),
	(1069, 'admin.user.logout', 'Đăng xuất', 'admin.user', 'vi'),
	(1070, 'admin.user.username', 'User name', 'admin.user', 'en'),
	(1071, 'admin.user.username', 'Tên đăng nhập', 'admin.user', 'vi'),
	(1072, 'admin.user.password', 'Password', 'admin.user', 'en'),
	(1073, 'admin.user.password', 'Mật khẩu', 'admin.user', 'vi'),
	(1074, 'admin.user.remember_me', 'Remember', 'admin.user', 'en'),
	(1075, 'admin.user.remember_me', 'Ghi nhớ', 'admin.user', 'vi'),
	(1076, 'admin.user.login', 'Login', 'admin.user', 'en'),
	(1077, 'admin.user.login', 'Đăng nhập', 'admin.user', 'vi'),
	(1078, 'admin.user.keep_password', 'Để trống nếu không muốn thay đổi mật khẩu', 'admin.user', 'vi'),
	(1079, 'admin.user.select_roles', 'Chọn vai trò', 'admin.user', 'vi'),
	(1080, 'admin.user.select_permission', 'Chọn quyền hạn', 'admin.user', 'vi'),
	(1081, 'admin.user.add_permission', 'Thêm quyền hạn', 'admin.user', 'vi'),
	(1082, 'admin.user.select_store', 'Chọn cửa hàng', 'admin.user', 'vi'),
	(1083, 'admin.user.name', 'Tên đầy đủ', 'admin.user', 'vi'),
	(1084, 'admin.user.user_name', 'Tên đăng nhập', 'admin.user', 'vi'),
	(1085, 'admin.user.email', 'Email', 'admin.user', 'vi'),
	(1086, 'admin.user.avatar', 'Hình đại diện', 'admin.user', 'vi'),
	(1087, 'admin.user.roles', 'vai trò', 'admin.user', 'vi'),
	(1088, 'admin.user.permission', 'Quyền hạn', 'admin.user', 'vi'),
	(1089, 'admin.user.created_at', 'Tạo lúc', 'admin.user', 'vi'),
	(1090, 'admin.user.updated_at', 'Cập nhật', 'admin.user', 'vi'),
	(1091, 'admin.user.member_since', 'Tham gia từ', 'admin.user', 'vi'),
	(1092, 'admin.user.password_confirmation', 'Xác nhận mật khẩu', 'admin.user', 'vi'),
	(1093, 'admin.user.username_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and ".@_" ', 'admin.user', 'vi'),
	(1094, 'admin.user.title', 'Quản lý người dùng', 'admin.user', 'vi'),
	(1095, 'admin.user.list', 'Danh sách người dùng', 'admin.user', 'vi'),
	(1096, 'admin.user.add_new', 'Thêm mới', 'admin.user', 'vi'),
	(1097, 'admin.user.add_new_title', 'Tạo người dùng', 'admin.user', 'vi'),
	(1098, 'admin.user.add_new_des', 'Tạo mới người dùng', 'admin.user', 'vi'),
	(1099, 'admin.user.name', 'Full name', 'admin.user', 'en'),
	(1100, 'admin.user.user_name', 'User name', 'admin.user', 'en'),
	(1101, 'admin.user.email', 'Email', 'admin.user', 'en'),
	(1102, 'admin.user.avatar', 'Avatar', 'admin.user', 'en'),
	(1103, 'admin.user.roles', 'Roles', 'admin.user', 'en'),
	(1104, 'admin.user.permission', 'Permission', 'admin.user', 'en'),
	(1105, 'admin.user.created_at', 'Created at', 'admin.user', 'en'),
	(1106, 'admin.user.updated_at', 'Updated at', 'admin.user', 'en'),
	(1107, 'admin.user.member_since', 'Member since', 'admin.user', 'en'),
	(1108, 'admin.user.password_confirmation', 'Confirmation', 'admin.user', 'en'),
	(1109, 'admin.user.username_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and ".@_" ', 'admin.user', 'en'),
	(1110, 'admin.user.keep_password', 'Leave blank if you dont want to change the password', 'admin.user', 'en'),
	(1111, 'admin.user.select_roles', 'Select roles', 'admin.user', 'en'),
	(1112, 'admin.user.select_permission', 'Select permission', 'admin.user', 'en'),
	(1113, 'admin.user.add_permission', 'Add permission', 'admin.user', 'en'),
	(1114, 'admin.user.select_store', 'Select store', 'admin.user', 'en'),
	(1115, 'admin.user.add_new', 'Add new', 'admin.user', 'en'),
	(1116, 'admin.user.add_new_title', 'Add new user', 'admin.user', 'en'),
	(1117, 'admin.user.add_new_des', 'Create a new user', 'admin.user', 'en'),
	(1118, 'admin.user.list', 'User list', 'admin.user', 'en'),
	(1119, 'admin.user.title', 'User manager', 'admin.user', 'en'),
	(1120, 'admin.user.search_place', 'Search name', 'admin.user', 'en'),
	(1121, 'admin.user.search_place', 'Tìm tên', 'admin.user', 'vi'),
	(1122, 'admin.menu_titles.order_manager', 'Quản lý đơn hàng', 'admin.menu_titles', 'vi'),
	(1123, 'admin.menu_titles.order_manager', 'Order manager', 'admin.menu_titles', 'en'),
	(1124, 'admin.menu_titles.catalog_mamager', 'Sản phẩm & danh mục', 'admin.menu_titles', 'vi'),
	(1125, 'admin.menu_titles.catalog_mamager', 'Product & category', 'admin.menu_titles', 'en'),
	(1126, 'admin.menu_titles.customer_manager', 'Quản lý khách hàng', 'admin.menu_titles', 'vi'),
	(1127, 'admin.menu_titles.customer_manager', 'Customer manager', 'admin.menu_titles', 'en'),
	(1128, 'admin.menu_titles.admin_global', 'Quản lý chung', 'admin.menu_titles', 'vi'),
	(1129, 'admin.menu_titles.admin_global', 'Admin global', 'admin.menu_titles', 'en'),
	(1130, 'admin.menu_titles.ADMIN_SHOP', 'Cửa hàng', 'admin.menu_titles', 'vi'),
	(1131, 'admin.menu_titles.ADMIN_SHOP', 'Admin shop', 'admin.menu_titles', 'en'),
	(1132, 'admin.menu_titles.ADMIN_CONTENT', 'Nội dung', 'admin.menu_titles', 'vi'),
	(1133, 'admin.menu_titles.ADMIN_CONTENT', 'Content', 'admin.menu_titles', 'en'),
	(1134, 'admin.menu_titles.ADMIN_EXTENSION', 'Phần mở rộng', 'admin.menu_titles', 'vi'),
	(1135, 'admin.menu_titles.ADMIN_EXTENSION', 'Extension', 'admin.menu_titles', 'en'),
	(1136, 'admin.menu_titles.ADMIN_SYSTEM', 'Cấu hình hệ thống', 'admin.menu_titles', 'vi'),
	(1137, 'admin.menu_titles.ADMIN_SYSTEM', 'System config', 'admin.menu_titles', 'en'),
	(1138, 'admin.menu_titles.page_manager', 'Quản lý trang', 'admin.menu_titles', 'vi'),
	(1139, 'admin.menu_titles.page_manager', 'Page manager', 'admin.menu_titles', 'en'),
	(1140, 'admin.menu_titles.order', 'Đơn hàng', 'admin.menu_titles', 'vi'),
	(1141, 'admin.menu_titles.order', 'Order', 'admin.menu_titles', 'en'),
	(1142, 'admin.menu_titles.order_status', 'Trạng thái đơn hàng', 'admin.menu_titles', 'vi'),
	(1143, 'admin.menu_titles.order_status', 'Order status', 'admin.menu_titles', 'en'),
	(1144, 'admin.menu_titles.payment_status', 'Trạng thái thanh toán', 'admin.menu_titles', 'vi'),
	(1145, 'admin.menu_titles.payment_status', 'Payment status', 'admin.menu_titles', 'en'),
	(1146, 'admin.menu_titles.shipping_status', 'Trạng thái vận chuyển', 'admin.menu_titles', 'vi'),
	(1147, 'admin.menu_titles.shipping_status', 'Shipping status', 'admin.menu_titles', 'en'),
	(1148, 'admin.menu_titles.product', 'Sản phẩm', 'admin.menu_titles', 'vi'),
	(1149, 'admin.menu_titles.product', 'Products', 'admin.menu_titles', 'en'),
	(1150, 'admin.menu_titles.category', 'Danh mục', 'admin.menu_titles', 'vi'),
	(1151, 'admin.menu_titles.category', 'Categories', 'admin.menu_titles', 'en'),
	(1152, 'admin.menu_titles.supplier', 'Nhà cung cấp', 'admin.menu_titles', 'vi'),
	(1153, 'admin.menu_titles.supplier', 'Suppliers', 'admin.menu_titles', 'en'),
	(1154, 'admin.menu_titles.brand', 'Nhãn hiệu', 'admin.menu_titles', 'vi'),
	(1155, 'admin.menu_titles.brand', 'Brands', 'admin.menu_titles', 'en'),
	(1156, 'admin.menu_titles.attribute_group', 'Nhóm thuộc tính', 'admin.menu_titles', 'vi'),
	(1157, 'admin.menu_titles.attribute_group', 'Attribute group', 'admin.menu_titles', 'en'),
	(1158, 'admin.menu_titles.customer', 'Khách hàng', 'admin.menu_titles', 'vi'),
	(1159, 'admin.menu_titles.customer', 'Customers', 'admin.menu_titles', 'en'),
	(1160, 'admin.menu_titles.subscribe', 'Đăng ký', 'admin.menu_titles', 'vi'),
	(1161, 'admin.menu_titles.subscribe', 'Subscribe', 'admin.menu_titles', 'en'),
	(1162, 'admin.menu_titles.block_content', 'Khối nội dung', 'admin.menu_titles', 'vi'),
	(1163, 'admin.menu_titles.block_content', 'Block content', 'admin.menu_titles', 'en'),
	(1164, 'admin.menu_titles.block_link', 'Quản lý liên kết', 'admin.menu_titles', 'vi'),
	(1165, 'admin.menu_titles.block_link', 'Link manager', 'admin.menu_titles', 'en'),
	(1166, 'admin.menu_titles.template_layout', 'Quản lý giao diện', 'admin.menu_titles', 'vi'),
	(1167, 'admin.menu_titles.template_layout', 'Template manager', 'admin.menu_titles', 'en'),
	(1168, 'admin.menu_titles.template', 'Giao diện', 'admin.menu_titles', 'vi'),
	(1169, 'admin.menu_titles.template', 'Template', 'admin.menu_titles', 'en'),
	(1170, 'admin.menu_titles.ADMIN_MARKETING', 'Marketing', 'admin.menu_titles', 'vi'),
	(1171, 'admin.menu_titles.ADMIN_MARKETING', 'Marketing', 'admin.menu_titles', 'en'),
	(1172, 'admin.menu_titles.store_info', 'Thông tin cửa hàng', 'admin.menu_titles', 'vi'),
	(1173, 'admin.menu_titles.store_info', 'Store infomation', 'admin.menu_titles', 'en'),
	(1174, 'admin.menu_titles.setting_system', 'Thiết lập hệ thống', 'admin.menu_titles', 'vi'),
	(1175, 'admin.menu_titles.setting_system', 'Setting system', 'admin.menu_titles', 'en'),
	(1176, 'admin.menu_titles.error_log', 'Lỗi & Nhật ký', 'admin.menu_titles', 'vi'),
	(1177, 'admin.menu_titles.error_log', 'Error & Logs', 'admin.menu_titles', 'en'),
	(1178, 'admin.menu_titles.email_template', 'Mẫu email', 'admin.menu_titles', 'vi'),
	(1179, 'admin.menu_titles.email_template', 'Email template', 'admin.menu_titles', 'en'),
	(1180, 'admin.menu_titles.language', 'Ngôn ngữ', 'admin.menu_titles', 'vi'),
	(1181, 'admin.menu_titles.language', 'Languages', 'admin.menu_titles', 'en'),
	(1182, 'admin.menu_titles.language_manager', 'Quản lý ngôn ngữ', 'admin.menu_titles', 'vi'),
	(1183, 'admin.menu_titles.language_manager', 'Language manager', 'admin.menu_titles', 'en'),
	(1184, 'admin.menu_titles.currency', 'Tiền tệ', 'admin.menu_titles', 'vi'),
	(1185, 'admin.menu_titles.currency', 'Currencies', 'admin.menu_titles', 'en'),
	(1186, 'admin.menu_titles.banner', 'Banner', 'admin.menu_titles', 'vi'),
	(1187, 'admin.menu_titles.banner', 'Banners', 'admin.menu_titles', 'en'),
	(1188, 'admin.menu_titles.backup_restore', 'Sao lưu & Phục hồi', 'admin.menu_titles', 'vi'),
	(1189, 'admin.menu_titles.backup_restore', 'Backup & Restore', 'admin.menu_titles', 'en'),
	(1190, 'admin.menu_titles.plugin', 'Tiện ích', 'admin.menu_titles', 'vi'),
	(1191, 'admin.menu_titles.plugin', 'Plugins', 'admin.menu_titles', 'en'),
	(1192, 'admin.menu_titles.webhook', 'Webhook', 'admin.menu_titles', 'vi'),
	(1193, 'admin.menu_titles.webhook', 'Webhook', 'admin.menu_titles', 'en'),
	(1194, 'admin.menu_titles.report_manager', 'Quản lý báo cáo', 'admin.menu_titles', 'vi'),
	(1195, 'admin.menu_titles.report_manager', 'Report manager', 'admin.menu_titles', 'en'),
	(1196, 'admin.menu_titles.user_permission', 'Quyền hạn người dùng', 'admin.menu_titles', 'vi'),
	(1197, 'admin.menu_titles.user_permission', 'User permission', 'admin.menu_titles', 'en'),
	(1198, 'admin.menu_titles.css', 'Chỉnh sửa CSS', 'admin.menu_titles', 'vi'),
	(1199, 'admin.menu_titles.css', 'CSS style', 'admin.menu_titles', 'en'),
	(1200, 'admin.menu_titles.seo_manager', 'Quản lý SEO', 'admin.menu_titles', 'vi'),
	(1201, 'admin.menu_titles.seo_manager', 'SEO manager', 'admin.menu_titles', 'en'),
	(1202, 'admin.menu_titles.users', 'Người dùng', 'admin.menu_titles', 'vi'),
	(1203, 'admin.menu_titles.users', 'Users', 'admin.menu_titles', 'en'),
	(1204, 'admin.menu_titles.roles', 'Nhóm quyền', 'admin.menu_titles', 'vi'),
	(1205, 'admin.menu_titles.roles', 'Roles', 'admin.menu_titles', 'en'),
	(1206, 'admin.menu_titles.permission', 'Quyền hạn', 'admin.menu_titles', 'vi'),
	(1207, 'admin.menu_titles.permission', 'Permission', 'admin.menu_titles', 'en'),
	(1208, 'admin.menu_titles.operation_log', 'Nhật ký truy cập', 'admin.menu_titles', 'vi'),
	(1209, 'admin.menu_titles.operation_log', 'Log access', 'admin.menu_titles', 'en'),
	(1210, 'admin.menu_titles.seo_config', 'Cấu hình SEO', 'admin.menu_titles', 'vi'),
	(1211, 'admin.menu_titles.seo_config', 'SEO config', 'admin.menu_titles', 'en'),
	(1212, 'admin.menu_titles.news', 'Tin tức', 'admin.menu_titles', 'vi'),
	(1213, 'admin.menu_titles.news', 'News', 'admin.menu_titles', 'en'),
	(1214, 'admin.menu_titles.env_config', 'Cấu hình môi trường', 'admin.menu_titles', 'vi'),
	(1215, 'admin.menu_titles.env_config', 'Environment Config', 'admin.menu_titles', 'en'),
	(1216, 'admin.menu_titles.report_product', 'Báo cáo sản phẩm', 'admin.menu_titles', 'vi'),
	(1217, 'admin.menu_titles.report_product', 'Report product', 'admin.menu_titles', 'en'),
	(1218, 'admin.menu_titles.store_config', 'Cấu hình cửa hàng', 'admin.menu_titles', 'vi'),
	(1219, 'admin.menu_titles.store_config', 'Store config', 'admin.menu_titles', 'en'),
	(1220, 'admin.menu_titles.cache_manager', 'Bộ nhớ đệm', 'admin.menu_titles', 'vi'),
	(1221, 'admin.menu_titles.cache_manager', 'Cache', 'admin.menu_titles', 'en'),
	(1222, 'admin.menu_titles.api_manager', 'Quản lý API', 'admin.menu_titles', 'vi'),
	(1223, 'admin.menu_titles.api_manager', 'API manager', 'admin.menu_titles', 'en'),
	(1224, 'admin.menu_titles.store_maintain', 'Bảo trì website', 'admin.menu_titles', 'vi'),
	(1225, 'admin.menu_titles.store_maintain', 'Website maintain', 'admin.menu_titles', 'en'),
	(1226, 'admin.menu_titles.tax', 'Thuế', 'admin.menu_titles', 'vi'),
	(1227, 'admin.menu_titles.tax', 'Tax', 'admin.menu_titles', 'en'),
	(1228, 'admin.menu_titles.weight', 'Khối lượng', 'admin.menu_titles', 'vi'),
	(1229, 'admin.menu_titles.weight', 'Weight', 'admin.menu_titles', 'en'),
	(1230, 'admin.menu_titles.length', 'Kích thước', 'admin.menu_titles', 'vi'),
	(1231, 'admin.menu_titles.length', 'Length', 'admin.menu_titles', 'en'),
	(1232, 'admin.menu_titles.ADMIN_SHOP_SETTING', 'Thiết lập cửa hàng', 'admin.menu_titles', 'vi'),
	(1233, 'admin.menu_titles.ADMIN_SHOP_SETTING', 'Shop setting', 'admin.menu_titles', 'en'),
	(1234, 'admin.menu_titles.api_config', 'Cấu hình API', 'admin.menu_titles', 'vi'),
	(1235, 'admin.menu_titles.api_config', 'API config', 'admin.menu_titles', 'en'),
	(1236, 'admin.menu_titles.layout', 'Bố cục', 'admin.menu_titles', 'vi'),
	(1237, 'admin.menu_titles.layout', 'Layout', 'admin.menu_titles', 'en'),
	(1238, 'admin.menu_titles.custom_field', 'Tùy chỉnh dữ liệu', 'admin.menu_titles', 'vi'),
	(1239, 'admin.menu_titles.custom_field', 'Custom field data', 'admin.menu_titles', 'en'),
	(1240, 'admin.menu_titles.localization', 'Địa phương hóa', 'admin.menu_titles', 'vi'),
	(1241, 'admin.menu_titles.localization', 'Localization', 'admin.menu_titles', 'en'),
	(1242, 'admin.menu_titles.localisation', 'Địa phương hóa', 'admin.menu_titles', 'vi'),
	(1243, 'admin.menu_titles.localisation', 'Localisation', 'admin.menu_titles', 'en'),
	(1244, 'admin.menu_titles.menu', 'Menu', 'admin.menu_titles', 'vi'),
	(1245, 'admin.menu_titles.menu', 'Menu', 'admin.menu_titles', 'en'),
	(1246, 'admin.menu_titles.config_store_default', 'Cấu hình mặc định', 'admin.menu_titles', 'vi'),
	(1247, 'admin.menu_titles.config_store_default', 'Config default', 'admin.menu_titles', 'en'),
	(1248, 'admin.login_success', 'Login success!', 'admin', 'en'),
	(1249, 'admin.login_success', 'Đăng nhập thành công', 'admin', 'vi'),
	(1250, 'admin.access_denied', 'Access denied!', 'admin', 'en'),
	(1251, 'admin.access_denied', 'Truy cập bị từ chối', 'admin', 'vi'),
	(1252, 'admin.max_c', 'Maximum :max characters', 'admin', 'en'),
	(1253, 'admin.min_c', 'Minimum :min characters', 'admin', 'en'),
	(1254, 'admin.min_v', 'Greater than :value', 'admin', 'en'),
	(1255, 'admin.max_v', 'Less than :value', 'admin', 'en'),
	(1256, 'admin.max_c', 'Tối đa :max kí tự', 'admin', 'vi'),
	(1257, 'admin.min_c', 'Tối thiểu :min kí tự', 'admin', 'vi'),
	(1258, 'admin.min_v', 'Lớn hơn :value', 'admin', 'vi'),
	(1259, 'admin.max_v', 'Nhỏ hơn :value', 'admin', 'vi'),
	(1260, 'admin.data_not_found_detail', 'Dữ liệu không tồn tại :msg', 'admin', 'vi'),
	(1261, 'admin.data_not_found_detail', 'Data not found :msg', 'admin', 'en'),
	(1262, 'admin.login_successful', 'Đăng nhập thành công', 'admin', 'vi'),
	(1263, 'admin.login_successful', 'Login success', 'admin', 'en'),
	(1264, 'admin.add_new', 'Add new', 'admin', 'en'),
	(1265, 'admin.add_new', 'Thêm mới', 'admin', 'vi'),
	(1266, 'admin.not_empty', 'Not empty', 'admin', 'en'),
	(1267, 'admin.not_empty', 'Không được rỗng', 'admin', 'vi'),
	(1268, 'admin.only_numeric', 'Enly numeric', 'admin', 'en'),
	(1269, 'admin.only_numeric', 'Chỉ dùng số', 'admin', 'vi'),
	(1270, 'admin.store_swicth_success', 'Switch store success!', 'admin', 'en'),
	(1271, 'admin.store_swicth_success', 'Chuyển cửa hàng thành công!', 'admin', 'vi'),
	(1272, 'admin.dashboard', 'Dashboard', 'admin', 'en'),
	(1273, 'admin.dashboard', 'Tổng hợp', 'admin', 'vi'),
	(1274, 'admin.data_not_found', 'Data not found!', 'admin', 'en'),
	(1275, 'admin.data_not_found', 'Không có dữ liệu!', 'admin', 'vi'),
	(1276, 'admin.data_not_found_msg', 'The data you are accessing does not exist.', 'admin', 'en'),
	(1277, 'admin.data_not_found_msg', 'Dữ liệu bạn đang truy cập không tồn tại.', 'admin', 'vi'),
	(1278, 'admin.deny', 'Access denied!', 'admin', 'en'),
	(1279, 'admin.deny', 'Truy cập từ chối!', 'admin', 'vi'),
	(1280, 'admin.setting_account', 'Setting account', 'admin', 'en'),
	(1281, 'admin.setting_account', 'Thiết lập tài khoản', 'admin', 'vi'),
	(1282, 'admin.failed', 'Auth failed', 'admin', 'en'),
	(1283, 'admin.failed', 'Chứng thực thất bại', 'admin', 'vi'),
	(1284, 'admin.maintain_enable', 'Active ', 'admin', 'en'),
	(1285, 'admin.maintain_enable', 'Hoạt động', 'admin', 'vi'),
	(1286, 'admin.maintain_disable', 'Maintenance ', 'admin', 'en'),
	(1287, 'admin.maintain_disable', 'Bảo trì', 'admin', 'vi'),
	(1288, 'admin.position_all', 'All pages', 'admin', 'en'),
	(1289, 'admin.position_all', 'Tất cả các trang', 'admin', 'vi'),
	(1290, 'admin.theme', 'Theme', 'admin', 'en'),
	(1291, 'admin.theme', 'Mẫu', 'admin', 'vi'),
	(1292, 'admin.select_store', 'Select store', 'admin', 'en'),
	(1293, 'admin.select_store', 'Chọn cửa hàng', 'admin', 'vi'),
	(1294, 'admin.welcome_dasdboard', 'Welcome to admin system!', 'admin', 'en'),
	(1295, 'admin.welcome_dasdboard', 'Chào mừng đến với hệ thống!', 'admin', 'vi'),
	(1296, 'admin.deny_msg', 'You need permission to access the system!', 'admin', 'en'),
	(1297, 'admin.deny_content', 'Permission denied!', 'admin', 'en'),
	(1298, 'admin.deny_msg', 'Bạn cần thêm quyền hạn để truy cập hệ thống!', 'admin', 'vi'),
	(1299, 'admin.deny_content', 'Bạn không có đủ quyền hạn!', 'admin', 'vi'),
	(1300, 'admin.home', 'Trang chủ', 'admin', 'vi'),
	(1301, 'admin.home', 'Home', 'admin', 'en'),
	(1302, 'admin.choose_icon', 'Chọn icon', 'admin', 'vi'),
	(1303, 'admin.choose_icon', 'Chose icon', 'admin', 'en'),
	(1304, 'admin.file_manager', 'Quản lý file', 'admin', 'vi'),
	(1305, 'admin.file_manager', 'File manager', 'admin', 'en'),
	(1306, 'admin.notice_new_order', 'Bạn có :total đơn hàng mới', 'admin', 'vi'),
	(1307, 'admin.notice_new_order', 'You have :total new orders', 'admin', 'en'),
	(1308, 'admin.gt_numeric_0', 'Giá trị  phải lớn hơn 0!', 'admin', 'vi'),
	(1309, 'admin.gt_numeric_0', 'Value must greater zero!', 'admin', 'en'),
	(1310, 'admin.api_connection.api_mode_help', 'ON/OFF API', 'admin.api_connection', 'en'),
	(1311, 'admin.api_connection.api_mode_help', 'TẮT/MỞ API', 'admin.api_connection', 'vi'),
	(1312, 'admin.api_connection.api_mode', 'ON/OFF API', 'admin.api_connection', 'en'),
	(1313, 'admin.api_connection.api_mode', 'TẮT/MỞ API', 'admin.api_connection', 'vi'),
	(1314, 'admin.api_connection.list', 'API connection list', 'admin.api_connection', 'en'),
	(1315, 'admin.api_connection.list', 'Danh sách API connection', 'admin.api_connection', 'vi'),
	(1316, 'admin.api_connection.description', 'Mô tả', 'admin.api_connection', 'vi'),
	(1317, 'admin.api_connection.description', 'Description', 'admin.api_connection', 'en'),
	(1318, 'admin.api_connection.apikey', 'Api key', 'admin.api_connection', 'vi'),
	(1319, 'admin.api_connection.apikey', 'Api key', 'admin.api_connection', 'en'),
	(1320, 'admin.api_connection.connection', 'Api connection', 'admin.api_connection', 'vi'),
	(1321, 'admin.api_connection.connection', 'Api connection', 'admin.api_connection', 'en'),
	(1322, 'admin.api_connection.expire', 'Hết hạn', 'admin.api_connection', 'vi'),
	(1323, 'admin.api_connection.expire', 'Expire', 'admin.api_connection', 'en'),
	(1324, 'admin.api_connection.last_active', 'Lần cuối truy cập', 'admin.api_connection', 'vi'),
	(1325, 'admin.api_connection.last_active', 'Last active', 'admin.api_connection', 'en'),
	(1326, 'admin.api_connection.status', 'Trạng thái', 'admin.api_connection', 'vi'),
	(1327, 'admin.api_connection.status', 'Status', 'admin.api_connection', 'en'),
	(1328, 'admin.api_connection.validate_regex', 'Chỉ sử dụng các kí tự : a-z0-9', 'admin.api_connection', 'vi'),
	(1329, 'admin.api_connection.validate_regex', 'Only use characters : a-z0-9', 'admin.api_connection', 'en'),
	(1330, 'admin.api_connection.create', 'Tạo mới connection', 'admin.api_connection', 'vi'),
	(1331, 'admin.api_connection.create', 'Creat new connection', 'admin.api_connection', 'en'),
	(1332, 'admin.api_connection.edit', 'Chỉnh sửa connection', 'admin.api_connection', 'vi'),
	(1333, 'admin.api_connection.edit', 'Edit connection', 'admin.api_connection', 'en'),
	(1334, 'admin.api_connection.api_connection_required_help', '<ul><li>Nếu không sử dụng API, hãy hãy chuyển sang trạng thái "OFF API"</li><li>Nếu không sử dụng apikey và apiconnection, hãy chuyển sang trạng thái "OFF CONNECTION"</li></ul>\r\n    <a href="https://s-cart.org/vi/docs/developer/about-api-scart.html" target="_new"><i class="fa fa-info-circle" aria-hidden="true">Xem chi tiết ở đây</i></a>\r\n    ', 'admin.api_connection', 'vi'),
	(1335, 'admin.api_connection.api_connection_required_help', '<ul><li>If not using API, please switch to "OFF API" state</li><li>If apikey and apiconnection are not used, switch to "OFF CONNECTION" state</li></ul>\r\n    <a href="https://s-cart.org/docs/developer/about-api-scart.html" target="_new"><i class="fa fa-info-circle" aria-hidden="true"></i>See full infomation</a>\r\n    ', 'admin.api_connection', 'en'),
	(1336, 'admin.result_item', 'Showing <b>:item_from</b>-<b>:item_to</b> of <b>:total</b> results</b>', 'admin', 'en'),
	(1337, 'admin.result_item', 'Hiển thị <b>:item_from</b>-<b>:item_to</b> của <b>:total</b> kết quả</b>', 'admin', 'vi'),
	(1338, 'admin.method_not_allow', 'Method not allow', 'admin', 'en'),
	(1339, 'admin.method_not_allow', 'Phương thức không được phép', 'admin', 'vi'),
	(1340, 'admin.back_list', 'Back list', 'admin', 'en'),
	(1341, 'admin.back_list', 'Trở lại danh sách', 'admin', 'vi'),
	(1342, 'admin.msg_change_success', 'All changes have been updated', 'admin', 'en'),
	(1343, 'admin.msg_change_success', 'Thay đổi đã được cập nhật', 'admin', 'vi'),
	(1344, 'admin.updated_at', 'Updated at', 'admin', 'en'),
	(1345, 'admin.updated_at', 'Cập nhật lúc', 'admin', 'vi'),
	(1346, 'admin.created_at', 'Created at', 'admin', 'en'),
	(1347, 'admin.created_at', 'Tạo lúc', 'admin', 'vi'),
	(1348, 'admin.remove_dont_permisison', 'Dont permission remove ', 'admin', 'en'),
	(1349, 'admin.remove_dont_permisison', 'Không có quyền gỡ bỏ', 'admin', 'vi'),
	(1350, 'admin.delete_dont_permisison', 'Dont permission delete ', 'admin', 'en'),
	(1351, 'admin.delete_dont_permisison', 'Không có quyền xóa', 'admin', 'vi'),
	(1352, 'admin.attribute_group.list', 'Danh sách nhóm thuộc tính', 'admin.attribute_group', 'vi'),
	(1353, 'admin.attribute_group.list', 'Attribute group list', 'admin.attribute_group', 'en'),
	(1354, 'admin.attribute_group.name', 'Tên', 'admin.attribute_group', 'vi'),
	(1355, 'admin.attribute_group.name', 'Name', 'admin.attribute_group', 'en'),
	(1356, 'admin.attribute_group.type', 'Loại', 'admin.attribute_group', 'vi'),
	(1357, 'admin.attribute_group.type', 'Type', 'admin.attribute_group', 'en'),
	(1358, 'admin.order.search', 'Tìm đơn hàng', 'admin.order', 'vi'),
	(1359, 'admin.order.search', 'Search order', 'admin.order', 'en'),
	(1360, 'admin.permission.name', 'Tên', 'admin.permission', 'vi'),
	(1361, 'admin.permission.name', 'Name', 'admin.permission', 'en'),
	(1362, 'admin.permission.list', 'Dánh sách quyền', 'admin.permission', 'vi'),
	(1363, 'admin.permission.list', 'Permission list', 'admin.permission', 'en'),
	(1364, 'admin.permission.slug', 'Slug', 'admin.permission', 'vi'),
	(1365, 'admin.permission.slug', 'Slug', 'admin.permission', 'en'),
	(1366, 'admin.permission.select_http_uri', 'Chọn http uri', 'admin.permission', 'vi'),
	(1367, 'admin.permission.select_http_uri', 'Select http uri', 'admin.permission', 'en'),
	(1368, 'admin.permission.method_placeholder', 'Các quyền', 'admin.permission', 'vi'),
	(1369, 'admin.permission.method_placeholder', 'Permission detail', 'admin.permission', 'en'),
	(1370, 'admin.permission.http_path', 'Http path', 'admin.permission', 'vi'),
	(1371, 'admin.permission.http_path', 'Http path', 'admin.permission', 'en'),
	(1372, 'admin.permission.slug_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and "._-"', 'admin.permission', 'vi'),
	(1373, 'admin.permission.slug_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and "._-"', 'admin.permission', 'en'),
	(1374, 'admin.permission.add_new_des', 'Tạo mới một quyền', 'admin.permission', 'vi'),
	(1375, 'admin.permission.add_new_des', 'Create new permission', 'admin.permission', 'en'),
	(1376, 'admin.permission.add_new_title', 'Tạo quyền', 'admin.permission', 'vi'),
	(1377, 'admin.permission.add_new_title', 'Create permission', 'admin.permission', 'en'),
	(1378, 'admin.backup.title', 'Danh sách sao lưu', 'admin.backup', 'vi'),
	(1379, 'admin.backup.title', 'Backup list', 'admin.backup', 'en'),
	(1380, 'admin.backup.processing', 'Đang xử lý...', 'admin.backup', 'vi'),
	(1381, 'admin.backup.processing', 'Processing...', 'admin.backup', 'en'),
	(1382, 'admin.backup.guide', '<span class="text-danger">Chú ý: Bạn cần phải cài đặt đường dẫn hệ thống chính xác. Xem hướng dẫn <a target=_new href="https://s-cart.org/guide/backup.html?lang=vi">TẠI ĐÂY</a></span>', 'admin.backup', 'vi'),
	(1383, 'admin.backup.generate_now', 'Tạo một backup ngay', 'admin.backup', 'vi'),
	(1384, 'admin.backup.manager', 'Quản lý sao lưu', 'admin.backup', 'vi'),
	(1385, 'admin.backup.name', 'Tên file', 'admin.backup', 'vi'),
	(1386, 'admin.backup.sort', 'Thứ tự', 'admin.backup', 'vi'),
	(1387, 'admin.backup.date', 'Thời gian', 'admin.backup', 'vi'),
	(1388, 'admin.backup.size', 'Kích thước', 'admin.backup', 'vi'),
	(1389, 'admin.backup.download', 'Tải về', 'admin.backup', 'vi'),
	(1390, 'admin.backup.remove', 'Gỡ bỏ', 'admin.backup', 'vi'),
	(1391, 'admin.backup.restore', 'Phục hồi', 'admin.backup', 'vi'),
	(1392, 'admin.backup.remove_success', 'Xóa file thành công!', 'admin.backup', 'vi'),
	(1393, 'admin.backup.restore_success', 'Phục hồi dữ liệu thành công!', 'admin.backup', 'vi'),
	(1394, 'admin.backup.generate_success', 'Tạo file backup thành công!', 'admin.backup', 'vi'),
	(1395, 'admin.backup.limit_backup', 'Bạn chỉ được tạo tối đa 10 bản sao lưu!', 'admin.backup', 'vi'),
	(1396, 'admin.backup.guide', '<span class="text-danger">NOTE: To use MySQL server on the command line, you must have the correct system path. This is usually done automatically. Read document in <a target=_new href="https://s-cart.org/guide/backup.html">HERE</a></span>', 'admin.backup', 'en'),
	(1397, 'admin.backup.generate_now', 'Gererate a backup now', 'admin.backup', 'en'),
	(1398, 'admin.backup.manager', 'Backup management', 'admin.backup', 'en'),
	(1399, 'admin.backup.name', 'File name', 'admin.backup', 'en'),
	(1400, 'admin.backup.sort', 'Sort', 'admin.backup', 'en'),
	(1401, 'admin.backup.date', 'Date', 'admin.backup', 'en'),
	(1402, 'admin.backup.size', 'Size', 'admin.backup', 'en'),
	(1403, 'admin.backup.download', 'Download', 'admin.backup', 'en'),
	(1404, 'admin.backup.remove', 'Remove', 'admin.backup', 'en'),
	(1405, 'admin.backup.restore', 'Restore', 'admin.backup', 'en'),
	(1406, 'admin.backup.remove_success', 'Remove successful!', 'admin.backup', 'en'),
	(1407, 'admin.backup.restore_success', 'Restore successful!', 'admin.backup', 'en'),
	(1408, 'admin.backup.generate_success', 'Create successful backup file!', 'admin.backup', 'en'),
	(1409, 'admin.backup.limit_backup', 'You cannot create more than 10 copies', 'admin.backup', 'en'),
	(1410, 'admin.banner.type', 'Loại', 'admin.banner', 'vi'),
	(1411, 'admin.banner.type', 'Type', 'admin.banner', 'en'),
	(1412, 'admin.banner.add_new', 'Thêm mới banner', 'admin.banner', 'vi'),
	(1413, 'admin.banner.add_new', 'Add new banner', 'admin.banner', 'en'),
	(1414, 'admin.banner.image', 'Hình ảnh', 'admin.banner', 'vi'),
	(1415, 'admin.banner.image', 'Image', 'admin.banner', 'en'),
	(1416, 'admin.banner.title', 'Tiêu đề', 'admin.banner', 'vi'),
	(1417, 'admin.banner.title', 'Title', 'admin.banner', 'en'),
	(1418, 'admin.banner.url', 'URL', 'admin.banner', 'vi'),
	(1419, 'admin.banner.url', 'URL', 'admin.banner', 'en'),
	(1420, 'admin.banner.sort', 'Thứ tự', 'admin.banner', 'vi'),
	(1421, 'admin.banner.sort', 'Sort', 'admin.banner', 'en'),
	(1422, 'admin.banner.status', 'Trạng thái', 'admin.banner', 'vi'),
	(1423, 'admin.banner.status', 'Status', 'admin.banner', 'en'),
	(1424, 'admin.banner.click', 'Bấm chuột', 'admin.banner', 'vi'),
	(1425, 'admin.banner.click', 'Click', 'admin.banner', 'en'),
	(1426, 'admin.banner.target', 'Target', 'admin.banner', 'vi'),
	(1427, 'admin.banner.target', 'Target', 'admin.banner', 'en'),
	(1428, 'admin.banner.select_target', 'Chọn target', 'admin.banner', 'vi'),
	(1429, 'admin.banner.select_target', 'Select target', 'admin.banner', 'en'),
	(1430, 'admin.banner.list', 'Danh sách banner', 'admin.banner', 'vi'),
	(1431, 'admin.banner.list', 'Banner list', 'admin.banner', 'en'),
	(1432, 'admin.banner_type.list', 'Loại banner', 'admin.banner', 'vi'),
	(1433, 'admin.banner_type.list', 'Banner type list', 'admin.banner', 'en'),
	(1434, 'admin.banner_type.add_new_title', 'Thêm loại mới', 'admin.banner', 'vi'),
	(1435, 'admin.banner_type.add_new_title', 'Add new type', 'admin.banner', 'en'),
	(1436, 'admin.banner_type.code', 'Mã', 'admin.banner', 'vi'),
	(1437, 'admin.banner_type.code', 'Code', 'admin.banner', 'en'),
	(1438, 'admin.banner_type.name', 'Tên', 'admin.banner', 'vi'),
	(1439, 'admin.banner_type.name', 'Name', 'admin.banner', 'en'),
	(1440, 'admin.brand.list', 'Danh sách nhãn hiệu', 'admin.brand', 'vi'),
	(1441, 'admin.brand.list', 'Brand list', 'admin.brand', 'en'),
	(1442, 'admin.brand.add_new_title', 'Thêm mới nhãn hiệu', 'admin.brand', 'vi'),
	(1443, 'admin.brand.add_new_title', 'Add new brand', 'admin.brand', 'en'),
	(1444, 'admin.brand.image', 'Hình ảnh', 'admin.brand', 'vi'),
	(1445, 'admin.brand.image', 'Image', 'admin.brand', 'en'),
	(1446, 'admin.brand.name', 'Tên', 'admin.brand', 'vi'),
	(1447, 'admin.brand.name', 'Name', 'admin.brand', 'en'),
	(1448, 'admin.brand.sort', 'Thứ tự', 'admin.brand', 'vi'),
	(1449, 'admin.brand.sort', 'Sort', 'admin.brand', 'en'),
	(1450, 'admin.brand.status', 'Trạng thái', 'admin.brand', 'vi'),
	(1451, 'admin.brand.status', 'Status', 'admin.brand', 'en'),
	(1452, 'admin.brand.alias', 'Alias', 'admin.brand', 'vi'),
	(1453, 'admin.brand.alias', 'Alias', 'admin.brand', 'en'),
	(1454, 'admin.brand.url', 'Url', 'admin.brand', 'vi'),
	(1455, 'admin.brand.url', 'Url', 'admin.brand', 'en'),
	(1456, 'admin.brand.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_"', 'admin.brand', 'vi'),
	(1457, 'admin.brand.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_"', 'admin.brand', 'en'),
	(1458, 'admin.cache.title', 'Cấu hình bộ nhớ Cache', 'admin.cache', 'vi'),
	(1459, 'admin.cache.title', 'config cache manager', 'admin.cache', 'en'),
	(1460, 'admin.cache.cache_clear_processing', 'Đang xóa Cache', 'admin.cache', 'vi'),
	(1461, 'admin.cache.cache_clear_processing', 'Cache clearing', 'admin.cache', 'en'),
	(1462, 'admin.cache.cache_status', 'Trạng thái', 'admin.cache', 'vi'),
	(1463, 'admin.cache.cache_status', 'Status', 'admin.cache', 'en'),
	(1464, 'admin.cache.cache_clear_all', 'Xóa tất cả Cache', 'admin.cache', 'vi'),
	(1465, 'admin.cache.cache_clear_all', 'Clear all cache', 'admin.cache', 'en'),
	(1466, 'admin.cache.cache_clear_success', 'Đã xóa cache xong', 'admin.cache', 'vi'),
	(1467, 'admin.cache.cache_clear_success', 'Clear cache success', 'admin.cache', 'en'),
	(1468, 'admin.cache.cache_refresh', 'Làm mới cache', 'admin.cache', 'vi'),
	(1469, 'admin.cache.cache_refresh', 'Cache refresh', 'admin.cache', 'en'),
	(1470, 'admin.cache.cache_clear', 'Xóa cache', 'admin.cache', 'vi'),
	(1471, 'admin.cache.cache_clear', 'Clear cache', 'admin.cache', 'en'),
	(1472, 'admin.cache.cache_all', 'Cache tất cả', 'admin.cache', 'vi'),
	(1473, 'admin.cache.cache_all', 'Cache all', 'admin.cache', 'en'),
	(1474, 'admin.cache.cache_time', 'Thời gian cache (giây)', 'admin.cache', 'vi'),
	(1475, 'admin.cache.cache_time', 'Cache time (s)', 'admin.cache', 'en'),
	(1476, 'admin.cache.value', 'Giá trị', 'admin.cache', 'vi'),
	(1477, 'admin.cache.value', 'Value', 'admin.cache', 'en'),
	(1478, 'admin.cache.field', 'Trường', 'admin.cache', 'vi'),
	(1479, 'admin.cache.field', 'Field', 'admin.cache', 'en'),
	(1480, 'admin.cache.cache_category', 'Cache Danh mục sản phẩm', 'admin.cache', 'vi'),
	(1481, 'admin.cache.cache_product', 'Cache Sản phẩm', 'admin.cache', 'vi'),
	(1482, 'admin.cache.cache_news', 'Cache Tin tức/Blog', 'admin.cache', 'vi'),
	(1483, 'admin.cache.cache_category_cms', 'Cache Danh mục CMS', 'admin.cache', 'vi'),
	(1484, 'admin.cache.cache_content_cms', 'Cache Nội dung CMS', 'admin.cache', 'vi'),
	(1485, 'admin.cache.cache_page', 'Cache Trang viết', 'admin.cache', 'vi'),
	(1486, 'admin.cache.cache_store', 'Cache Cửa hàng', 'admin.cache', 'vi'),
	(1487, 'admin.cache.cache_country', 'Cache Quốc gia', 'admin.cache', 'vi'),
	(1488, 'admin.cache.cache_category', 'Cache categoty', 'admin.cache', 'en'),
	(1489, 'admin.cache.cache_product', 'Cache product', 'admin.cache', 'en'),
	(1490, 'admin.cache.cache_news', 'Cache News/Blog', 'admin.cache', 'en'),
	(1491, 'admin.cache.cache_category_cms', 'Cache Category CMS', 'admin.cache', 'en'),
	(1492, 'admin.cache.cache_content_cms', 'Cache CMS content', 'admin.cache', 'en'),
	(1493, 'admin.cache.cache_page', 'Cache page', 'admin.cache', 'en'),
	(1494, 'admin.cache.cache_store', 'Cache Store', 'admin.cache', 'en'),
	(1495, 'admin.cache.cache_country', 'Cache country', 'admin.cache', 'en'),
	(1496, 'admin.category.list', 'Danh sách danh mục', 'admin.category', 'vi'),
	(1497, 'admin.category.list', 'Category list', 'admin.category', 'en'),
	(1498, 'admin.category.add_new_title', 'Thêm mới danh mục', 'admin.category', 'vi'),
	(1499, 'admin.category.add_new_title', 'Add new category', 'admin.category', 'en'),
	(1500, 'admin.category.add_new_des', 'Thêm mới', 'admin.category', 'vi'),
	(1501, 'admin.category.add_new_des', 'Add new', 'admin.category', 'en'),
	(1502, 'admin.category.image', 'Hình ảnh', 'admin.category', 'vi'),
	(1503, 'admin.category.image', 'Image', 'admin.category', 'en'),
	(1504, 'admin.category.title', 'Tên', 'admin.category', 'vi'),
	(1505, 'admin.category.title', 'Name', 'admin.category', 'en'),
	(1506, 'admin.category.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.category', 'vi'),
	(1507, 'admin.category.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_" ', 'admin.category', 'vi'),
	(1508, 'admin.category.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.category', 'en'),
	(1509, 'admin.category.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_" ', 'admin.category', 'en'),
	(1510, 'admin.category.keyword', 'Từ khóa', 'admin.category', 'vi'),
	(1511, 'admin.category.keyword', 'Keyword', 'admin.category', 'en'),
	(1512, 'admin.category.description', 'Mô tả', 'admin.category', 'vi'),
	(1513, 'admin.category.description', 'Description', 'admin.category', 'en'),
	(1514, 'admin.category.top', 'Công cộng', 'admin.category', 'vi'),
	(1515, 'admin.category.top', 'Public', 'admin.category', 'en'),
	(1516, 'admin.category.parent', 'Cấp cha', 'admin.category', 'vi'),
	(1517, 'admin.category.parent', 'Parent', 'admin.category', 'en'),
	(1518, 'admin.category.sort', 'Thứ tự', 'admin.category', 'vi'),
	(1519, 'admin.category.sort', 'Sort', 'admin.category', 'en'),
	(1520, 'admin.category.status', 'Trạng thái', 'admin.category', 'vi'),
	(1521, 'admin.category.status', 'Status', 'admin.category', 'en'),
	(1522, 'admin.category.select_category', 'Chọn danh mục', 'admin.category', 'vi'),
	(1523, 'admin.category.select_category', 'Select category', 'admin.category', 'en'),
	(1524, 'admin.category.top_help', 'Danh mục này sẽ hiển thị ra ngoài trang chủ. Mặc định chỉ dành cho những danh mục Root.', 'admin.category', 'vi'),
	(1525, 'admin.category.top_help', 'This category will display outside the homepage. The default is for Root items only.', 'admin.category', 'en'),
	(1526, 'admin.config.webhook', 'Webhook', 'admin.config', 'vi'),
	(1527, 'admin.config.webhook', 'Webhook', 'admin.config', 'en'),
	(1528, 'admin.config.setting_website', 'Cài đặt website', 'admin.config', 'vi'),
	(1529, 'admin.config.setting_website', 'Setting website', 'admin.config', 'en'),
	(1530, 'admin.config.LOG_SLACK_WEBHOOK_URL', 'Gửi tới Slack webhook', 'admin.config', 'vi'),
	(1531, 'admin.config.LOG_SLACK_WEBHOOK_URL', 'Report error to Slack webhook', 'admin.config', 'en'),
	(1532, 'admin.config.GOOGLE_CHAT_WEBHOOK_URL', 'Gửi tới Google webhook', 'admin.config', 'vi'),
	(1533, 'admin.config.GOOGLE_CHAT_WEBHOOK_URL', 'Report error to Google webhook', 'admin.config', 'en'),
	(1534, 'admin.config.CHATWORK_CHAT_WEBHOOK_URL', 'Gửi tới Chatword webhook', 'admin.config', 'vi'),
	(1535, 'admin.config.CHATWORK_CHAT_WEBHOOK_URL', 'Report error to Chatword webhook', 'admin.config', 'en'),
	(1536, 'admin.config.LOG_SLACK_WEBHOOK_URL_help', 'Link https: //hooks.slack.com/services/...', 'admin.config', 'vi'),
	(1537, 'admin.config.LOG_SLACK_WEBHOOK_URL_help', 'Link https: //hooks.slack.com/services/...', 'admin.config', 'en'),
	(1538, 'admin.currency.list', 'Danh sách tiền tệ', 'admin.currency', 'vi'),
	(1539, 'admin.currency.list', 'Currencies list', 'admin.currency', 'en'),
	(1540, 'admin.currency.name', 'Tên', 'admin.currency', 'vi'),
	(1541, 'admin.currency.name', 'Name', 'admin.currency', 'en'),
	(1542, 'admin.currency.code', 'Mã', 'admin.currency', 'vi'),
	(1543, 'admin.currency.code', 'Code', 'admin.currency', 'en'),
	(1544, 'admin.currency.symbol', 'Ký hiệu', 'admin.currency', 'vi'),
	(1545, 'admin.currency.symbol', 'Symbol', 'admin.currency', 'en'),
	(1546, 'admin.currency.exchange_rate', 'Tỉ giá', 'admin.currency', 'vi'),
	(1547, 'admin.currency.exchange_rate', 'Exchange rate', 'admin.currency', 'en'),
	(1548, 'admin.currency.precision', 'Số chữ số thập phân', 'admin.currency', 'vi'),
	(1549, 'admin.currency.precision', 'Precision', 'admin.currency', 'en'),
	(1550, 'admin.currency.symbol_first', 'Hiện kí hiệu đầu tiên', 'admin.currency', 'vi'),
	(1551, 'admin.currency.symbol_first', 'Symbol first', 'admin.currency', 'en'),
	(1552, 'admin.currency.thousands', 'Ngăn cách phần nghìn', 'admin.currency', 'vi'),
	(1553, 'admin.currency.thousands', 'Thousands separator', 'admin.currency', 'en'),
	(1554, 'admin.currency.status', 'Trạng thái', 'admin.currency', 'vi'),
	(1555, 'admin.currency.status', 'Status', 'admin.currency', 'en'),
	(1556, 'admin.currency.sort', 'Thứ tự', 'admin.currency', 'vi'),
	(1557, 'admin.currency.sort', 'Sort', 'admin.currency', 'en'),
	(1558, 'admin.currency.add_new_title', 'Thêm mới tiền tệ', 'admin.currency', 'vi'),
	(1559, 'admin.currency.add_new_title', 'Add new currency', 'admin.currency', 'en'),
	(1560, 'admin.currency.add_new_des', 'Thêm mới', 'admin.currency', 'vi'),
	(1561, 'admin.currency.add_new_des', 'Add new', 'admin.currency', 'en'),
	(1562, 'admin.custom_field.title', 'Field dữ liệu tùy chỉnh', 'admin.custom_field', 'vi'),
	(1563, 'admin.custom_field.title', 'Custom field', 'admin.custom_field', 'en'),
	(1564, 'admin.custom_field.list', 'Danh sách field tùy chỉnh', 'admin.custom_field', 'vi'),
	(1565, 'admin.custom_field.list', 'Custom field list', 'admin.custom_field', 'en'),
	(1566, 'admin.custom_field.status', 'Trạng thái', 'admin.custom_field', 'vi'),
	(1567, 'admin.custom_field.status', 'Status', 'admin.custom_field', 'en'),
	(1568, 'admin.custom_field.sort', 'Thứ tự', 'admin.custom_field', 'vi'),
	(1569, 'admin.custom_field.sort', 'Sort', 'admin.custom_field', 'en'),
	(1570, 'admin.custom_field.add_new_title', 'Thêm mới field', 'admin.custom_field', 'vi'),
	(1571, 'admin.custom_field.add_new_title', 'Add new field', 'admin.custom_field', 'en'),
	(1572, 'admin.custom_field.add_new_des', 'Thêm mới', 'admin.custom_field', 'vi'),
	(1573, 'admin.custom_field.add_new_des', 'Add new', 'admin.custom_field', 'en'),
	(1574, 'admin.custom_field.name', 'Tên', 'admin.custom_field', 'vi'),
	(1575, 'admin.custom_field.name', 'Name', 'admin.custom_field', 'en'),
	(1576, 'admin.custom_field.code', 'Mã', 'admin.custom_field', 'vi'),
	(1577, 'admin.custom_field.code', 'Code', 'admin.custom_field', 'en'),
	(1578, 'admin.custom_field.type', 'Loại', 'admin.custom_field', 'vi'),
	(1579, 'admin.custom_field.type', 'Type', 'admin.custom_field', 'en'),
	(1580, 'admin.custom_field.required', 'Bắt buộc', 'admin.custom_field', 'vi'),
	(1581, 'admin.custom_field.required', 'Required', 'admin.custom_field', 'en'),
	(1582, 'admin.custom_field.option', 'Tùy chọn', 'admin.custom_field', 'vi'),
	(1583, 'admin.custom_field.option', 'Option', 'admin.custom_field', 'en'),
	(1584, 'admin.custom_field.default', 'Mặc định', 'admin.custom_field', 'vi'),
	(1585, 'admin.custom_field.default', 'Default', 'admin.custom_field', 'en'),
	(1586, 'admin.custom_field.default_help', 'Định dạng cho "Tùy chọn" là Radio hoặc Select:<br>{"value1": "Name 1", "value2":"Name 2"}', 'admin.custom_field', 'vi'),
	(1587, 'admin.custom_field.default_help', 'Format for "Option" is Radio or Select:<br>{"value1": "Name 1", "value2":"Name 2"}', 'admin.custom_field', 'en'),
	(1588, 'admin.env.APP_DEBUG', 'DEBUG mode', 'admin.env', 'en'),
	(1589, 'admin.env.APP_URL', 'URL app', 'admin.env', 'en'),
	(1590, 'admin.env.APP_ENV', 'Environment mode', 'admin.env', 'en'),
	(1591, 'admin.env.ADMIN_PREFIX', 'Admin prefix', 'admin.env', 'en'),
	(1592, 'admin.env.ADMIN_NAME', 'Admin name', 'admin.env', 'en'),
	(1593, 'admin.env.ADMIN_LOGO', 'Admin logo', 'admin.env', 'en'),
	(1594, 'admin.env.ADMIN_LOGO_MINI', 'Admin logo mini', 'admin.env', 'en'),
	(1595, 'admin.env.ADMIN_TITLE', 'Admin title', 'admin.env', 'en'),
	(1596, 'admin.env.ADMIN_LOG', 'Admin log', 'admin.env', 'en'),
	(1597, 'admin.env.field', 'Field', 'admin.env', 'en'),
	(1598, 'admin.env.value', 'Value', 'admin.env', 'en'),
	(1599, 'admin.env.title', 'Config environment', 'admin.env', 'en'),
	(1600, 'admin.env.SUFFIX_URL', 'Suffix URL', 'admin.env', 'en'),
	(1601, 'admin.env.PREFIX_BRAND', 'Prefix url BRAND', 'admin.env', 'en'),
	(1602, 'admin.env.PREFIX_SUPPLIER', 'Prefix url SUPPLIER', 'admin.env', 'en'),
	(1603, 'admin.env.PREFIX_CATEGORY', 'Prefix url CATEGORY ', 'admin.env', 'en'),
	(1604, 'admin.env.PREFIX_SUB_CATEGORY', 'Prefix url sub CATEGORY', 'admin.env', 'en'),
	(1605, 'admin.env.PREFIX_PRODUCT', 'Prefix url PRODUCT', 'admin.env', 'en'),
	(1606, 'admin.env.PREFIX_SEARCH', 'Prefix url SEARCH', 'admin.env', 'en'),
	(1607, 'admin.env.PREFIX_CONTACT', 'Prefix url CONTACT', 'admin.env', 'en'),
	(1608, 'admin.env.PREFIX_NEWS', 'Prefix url NEWS', 'admin.env', 'en'),
	(1609, 'admin.env.PREFIX_MEMBER', 'Prefix url CUSTOMER', 'admin.env', 'en'),
	(1610, 'admin.env.PREFIX_MEMBER_ORDER_LIST', 'Prefix url CUSTOMER ORDER', 'admin.env', 'en'),
	(1611, 'admin.env.PREFIX_MEMBER_CHANGE_PWD', 'Prefix url CHANGE PASSWOD', 'admin.env', 'en'),
	(1612, 'admin.env.PREFIX_MEMBER_CHANGE_INFO', 'Prefix url CHANGE INFO', 'admin.env', 'en'),
	(1613, 'admin.env.PREFIX_CMS_CATEGORY', 'Prefix url CMS CATEGORY', 'admin.env', 'en'),
	(1614, 'admin.env.PREFIX_CMS_ENTRY', 'Prefix url CMS ENTRY', 'admin.env', 'en'),
	(1615, 'admin.env.PREFIX_CART_WISHLIST', 'Prefix url WISHLIST', 'admin.env', 'en'),
	(1616, 'admin.env.PREFIX_CART_COMPARE', 'Prefix url COMPARE', 'admin.env', 'en'),
	(1617, 'admin.env.PREFIX_CART_DEFAULT', 'Prefix url CART', 'admin.env', 'en'),
	(1618, 'admin.env.PREFIX_CART_CHECKOUT', 'Prefix url CHECKOUT', 'admin.env', 'en'),
	(1619, 'admin.env.PREFIX_CART_CHECKOUT_CONFIRM', 'Prefix url CHECKOUT CONFIRM', 'admin.env', 'en'),
	(1620, 'admin.env.PREFIX_ORDER_SUCCESS', 'Prefix url ORDER SUCCESS', 'admin.env', 'en'),
	(1621, 'admin.env.PREFIX_SHOP', 'Link shop', 'admin.env', 'en'),
	(1622, 'admin.env.ADMIN_CUSTOMIZE_TEMPLATE', 'Customize template admin', 'admin.env', 'en'),
	(1623, 'admin.env.APP_DEBUG', 'Chế độ sửa lỗi', 'admin.env', 'vi'),
	(1624, 'admin.env.APP_URL', 'URL website', 'admin.env', 'vi'),
	(1625, 'admin.env.APP_ENV', 'Môi trường', 'admin.env', 'vi'),
	(1626, 'admin.env.ADMIN_PREFIX', 'Tiền tố admin', 'admin.env', 'vi'),
	(1627, 'admin.env.ADMIN_NAME', 'Tên trang admin', 'admin.env', 'vi'),
	(1628, 'admin.env.ADMIN_LOGO', 'Logo admin', 'admin.env', 'vi'),
	(1629, 'admin.env.ADMIN_LOGO_MINI', 'Logo nhỏ', 'admin.env', 'vi'),
	(1630, 'admin.env.ADMIN_TITLE', 'Tiêu đề admin', 'admin.env', 'vi'),
	(1631, 'admin.env.ADMIN_LOG', 'Lịch sử truy cập admin', 'admin.env', 'vi'),
	(1632, 'admin.env.field', 'Trường dữ liệu', 'admin.env', 'vi'),
	(1633, 'admin.env.value', 'Giá trị', 'admin.env', 'vi'),
	(1634, 'admin.env.title', 'Cấu hình môi trường', 'admin.env', 'vi'),
	(1635, 'admin.env.SUFFIX_URL', 'Hậu tố URL', 'admin.env', 'vi'),
	(1636, 'admin.env.PREFIX_BRAND', 'Tiền tố trang BRAND', 'admin.env', 'vi'),
	(1637, 'admin.env.PREFIX_SUPPLIER', 'Tiền tố trang SUPPLIER', 'admin.env', 'vi'),
	(1638, 'admin.env.PREFIX_CATEGORY', 'Tiền tố trang CATEGORY ', 'admin.env', 'vi'),
	(1639, 'admin.env.PREFIX_SUB_CATEGORY', 'Tiền tố trang CATEGORY nhỏ', 'admin.env', 'vi'),
	(1640, 'admin.env.PREFIX_PRODUCT', 'Tiền tố trang PRODUCT', 'admin.env', 'vi'),
	(1641, 'admin.env.PREFIX_SEARCH', 'Tiền tố trang SEARCH', 'admin.env', 'vi'),
	(1642, 'admin.env.PREFIX_CONTACT', 'Tiền tố trang CONTACT', 'admin.env', 'vi'),
	(1643, 'admin.env.PREFIX_NEWS', 'Tiền tố trang NEWS', 'admin.env', 'vi'),
	(1644, 'admin.env.PREFIX_MEMBER', 'Tiền tố trang CUSTOMER', 'admin.env', 'vi'),
	(1645, 'admin.env.PREFIX_MEMBER_ORDER_LIST', 'Tiền tố trang CUSTOMER ORDER', 'admin.env', 'vi'),
	(1646, 'admin.env.PREFIX_MEMBER_CHANGE_PWD', 'Tiền tố trang CHANGE PASSWOD', 'admin.env', 'vi'),
	(1647, 'admin.env.PREFIX_MEMBER_CHANGE_INFO', 'Tiền tố trang CHANGE INFO', 'admin.env', 'vi'),
	(1648, 'admin.env.PREFIX_CMS_CATEGORY', 'Tiền tố trang CMS CATEGORY', 'admin.env', 'vi'),
	(1649, 'admin.env.PREFIX_CMS_ENTRY', 'Tiền tố trang CMS ENTRY', 'admin.env', 'vi'),
	(1650, 'admin.env.PREFIX_CART_WISHLIST', 'Tiền tố trang WISHLIST', 'admin.env', 'vi'),
	(1651, 'admin.env.PREFIX_CART_COMPARE', 'Tiền tố trang COMPARE', 'admin.env', 'vi'),
	(1652, 'admin.env.PREFIX_CART_DEFAULT', 'Tiền tố trang CART', 'admin.env', 'vi'),
	(1653, 'admin.env.PREFIX_CART_CHECKOUT', 'Tiền tố trang CHECKOUT', 'admin.env', 'vi'),
	(1654, 'admin.env.PREFIX_CART_CHECKOUT_CONFIRM', 'Tiền tố trang CHECKOUT CONFIRM', 'admin.env', 'vi'),
	(1655, 'admin.env.PREFIX_ORDER_SUCCESS', 'Tiền tố trang ORDER SUCCESS', 'admin.env', 'vi'),
	(1656, 'admin.env.PREFIX_SHOP', 'Link Cửa hàng', 'admin.env', 'vi'),
	(1657, 'admin.env.ADMIN_CUSTOMIZE_TEMPLATE', 'Tùy chỉnh giao diện Admin', 'admin.env', 'vi'),
	(1658, 'admin.env.hidden_copyright_footer_admin', 'Ẩn thông tin bản quyền footer admin', 'admin.env', 'vi'),
	(1659, 'admin.env.hidden_copyright_footer', 'Ẩn thông tin bản quyền footer website', 'admin.env', 'vi'),
	(1660, 'admin.env.hidden_copyright_footer_admin', 'Hide admin footer copyright information', 'admin.env', 'en'),
	(1661, 'admin.env.hidden_copyright_footer', 'Hide website footer copyright information', 'admin.env', 'en'),
	(1662, 'admin.email_template.name', 'Tên', 'admin.email_template', 'vi'),
	(1663, 'admin.email_template.list', 'Danh sách mẫu email', 'admin.email_template', 'vi'),
	(1664, 'admin.email_template.list', 'Email template list', 'admin.email_template', 'en'),
	(1665, 'admin.email_template.status', 'Trạng thái', 'admin.email_template', 'vi'),
	(1666, 'admin.email_template.group', 'Nhóm', 'admin.email_template', 'vi'),
	(1667, 'admin.email_template.html', 'HTML', 'admin.email_template', 'vi'),
	(1668, 'admin.email_template.text', 'Nội dung', 'admin.email_template', 'vi'),
	(1669, 'admin.email_template.name', 'Name', 'admin.email_template', 'en'),
	(1670, 'admin.email_template.lits', 'Email template list', 'admin.email_template', 'en'),
	(1671, 'admin.email_template.group', 'Group', 'admin.email_template', 'en'),
	(1672, 'admin.email_template.text', 'Content', 'admin.email_template', 'en'),
	(1673, 'admin.email_template.html', 'HTML', 'admin.email_template', 'en'),
	(1674, 'admin.email_template.status', 'Status', 'admin.email_template', 'en'),
	(1675, 'admin.email_template.add_new_title', 'Add template', 'admin.email_template', 'en'),
	(1676, 'admin.email_template.add_new_des', 'Create a new template', 'admin.email_template', 'en'),
	(1677, 'admin.email_template.variable_support', 'Variables support:', 'admin.email_template', 'en'),
	(1678, 'admin.email_template.add_new_title', 'Tạo template', 'admin.email_template', 'vi'),
	(1679, 'admin.email_template.add_new_des', 'Tạo mới template', 'admin.email_template', 'vi'),
	(1680, 'admin.email_template.variable_support', 'Các biến hỗ trợ', 'admin.email_template', 'vi'),
	(1681, 'admin.language.list', 'Language list', 'admin.language', 'en'),
	(1682, 'admin.language.list', 'Danh sách ngôn ngữ', 'admin.language', 'vi'),
	(1683, 'admin.language.select_lang', 'Select language', 'admin.language', 'en'),
	(1684, 'admin.language.select_lang', 'Chọn ngôn ngữ', 'admin.language', 'vi'),
	(1685, 'admin.language.select_position', 'Select position', 'admin.language', 'en'),
	(1686, 'admin.language.select_position', 'Chọn vị trí ngôn ngữ', 'admin.language', 'vi'),
	(1687, 'admin.language.name', 'Name', 'admin.language', 'en'),
	(1688, 'admin.language.icon', 'Icon', 'admin.language', 'en'),
	(1689, 'admin.language.code', 'Code', 'admin.language', 'en'),
	(1690, 'admin.language.sort', 'Sort', 'admin.language', 'en'),
	(1691, 'admin.language.status', 'Status', 'admin.language', 'en'),
	(1692, 'admin.language.layout_rtl', 'Layout RTL', 'admin.language', 'en'),
	(1693, 'admin.language.add_new_title', 'Add language', 'admin.language', 'en'),
	(1694, 'admin.language.add_new_des', 'Create a new language', 'admin.language', 'en'),
	(1695, 'admin.language.name', 'Tên ngôn ngữ', 'admin.language', 'vi'),
	(1696, 'admin.language.icon', 'Icon', 'admin.language', 'vi'),
	(1697, 'admin.language.code', 'Code', 'admin.language', 'vi'),
	(1698, 'admin.language.sort', 'Thứ tự', 'admin.language', 'vi'),
	(1699, 'admin.language.status', 'Status', 'admin.language', 'vi'),
	(1700, 'admin.language.layout_rtl', 'Giao diện RTL', 'admin.language', 'vi'),
	(1701, 'admin.language.add_new_title', 'Tạo ngôn ngữ', 'admin.language', 'vi'),
	(1702, 'admin.language.add_new_des', 'Tạo mới ngôn ngữ', 'admin.language', 'vi'),
	(1703, 'admin.language_manager.title', 'Quản lý ngôn ngữ', 'admin.language', 'vi'),
	(1704, 'admin.language_manager.title', 'Language manager', 'admin.language', 'en'),
	(1705, 'admin.language_manager.add', 'Thêm giá trị mới', 'admin.language', 'vi'),
	(1706, 'admin.language_manager.add', 'Add new record language', 'admin.language', 'en'),
	(1707, 'admin.language_manager.position', 'Vị trí mới ngôn ngữ', 'admin.language', 'vi'),
	(1708, 'admin.language_manager.position', 'Position language', 'admin.language', 'en'),
	(1709, 'admin.language_manager.new_position', 'Hoặc thêm vị trí mới', 'admin.language', 'vi'),
	(1710, 'admin.language_manager.new_position', 'Or add new position', 'admin.language', 'en'),
	(1711, 'admin.language_manager.code', 'Mã code', 'admin.language', 'vi'),
	(1712, 'admin.language_manager.code', 'Code', 'admin.language', 'en'),
	(1713, 'admin.language_manager.text', 'Nội dung ngôn ngữ', 'admin.language', 'vi'),
	(1714, 'admin.language_manager.text', 'Language content', 'admin.language', 'en'),
	(1715, 'admin.language_manager.text_help', 'Mặc định, giá trị mới chỉ được thêm cho tiếng Anh. <br>Để cập nhật cho ngôn ngữ khác, tìm giá trị mới thêm và chỉnh sửa <a href=":link">Ở ĐÂY</a>', 'admin.language', 'vi'),
	(1716, 'admin.language_manager.text_help', 'By default, the new value is only added for English. <br>To update for other languages, find the newly added value and edit <a href=":link">HERE</a>', 'admin.language', 'en'),
	(1717, 'admin.language_manager.select_position', 'Chọn vị trí ngôn ngữ', 'admin.language', 'vi'),
	(1718, 'admin.language_manager.select_position', 'Select position of language', 'admin.language', 'en'),
	(1719, 'admin.menu.list', 'Quản lý menu', 'admin.emnu', 'vi'),
	(1720, 'admin.menu.create', 'Tạo mới menu', 'admin.emnu', 'vi'),
	(1721, 'admin.menu.edit', 'Chỉnh sửa menu', 'admin.emnu', 'vi'),
	(1722, 'admin.menu.error_have_child', 'Cần xóa các menu bên trong trước khi làm điều này!', 'admin.emnu', 'vi'),
	(1723, 'admin.menu.parent', 'Cha', 'admin.emnu', 'vi'),
	(1724, 'admin.menu.title', 'Tiêu đề', 'admin.emnu', 'vi'),
	(1725, 'admin.menu.icon', 'Icon', 'admin.emnu', 'vi'),
	(1726, 'admin.menu.uri', 'URI', 'admin.emnu', 'vi'),
	(1727, 'admin.menu.roles', 'Vai trò', 'admin.emnu', 'vi'),
	(1728, 'admin.menu.permissions', 'Quyền', 'admin.emnu', 'vi'),
	(1729, 'admin.menu.create_success', 'Tạo mới thành công!', 'admin.emnu', 'vi'),
	(1730, 'admin.menu.edit_success', 'Cập nhật thành công!', 'admin.emnu', 'vi'),
	(1731, 'admin.menu.sort', 'Thứ tự', 'admin.emnu', 'vi'),
	(1732, 'admin.menu.list', 'Menu manager', 'admin.emnu', 'en'),
	(1733, 'admin.menu.create', 'Create new menu', 'admin.emnu', 'en'),
	(1734, 'admin.menu.edit', 'Edit menu', 'admin.emnu', 'en'),
	(1735, 'admin.menu.error_have_child', 'Need to delete the internal menus before doing this!', 'admin.emnu', 'en'),
	(1736, 'admin.menu.parent', 'Parent', 'admin.emnu', 'en'),
	(1737, 'admin.menu.title', 'Title', 'admin.emnu', 'en'),
	(1738, 'admin.menu.icon', 'Icon', 'admin.emnu', 'en'),
	(1739, 'admin.menu.uri', 'URI', 'admin.emnu', 'en'),
	(1740, 'admin.menu.roles', 'Roles', 'admin.emnu', 'en'),
	(1741, 'admin.menu.permissions', 'Permissions', 'admin.emnu', 'en'),
	(1742, 'admin.menu.create_success', 'Create new item success!', 'admin.emnu', 'en'),
	(1743, 'admin.menu.edit_success', 'Edit item success!', 'admin.emnu', 'en'),
	(1744, 'admin.menu.sort', 'Sort', 'admin.emnu', 'en'),
	(1745, 'email.admin.order_success_to_admin', 'Send order success to admin', 'email.admin', 'en'),
	(1746, 'email.admin.order_success_to_cutomer', 'Send order success to customer', 'email.admin', 'en'),
	(1747, 'email.admin.order_success_to_cutomer_pdf', 'Send order success to customer with pdf invoice', 'email.admin', 'en'),
	(1748, 'email.admin.forgot_password', 'Send email forgot', 'email.admin', 'en'),
	(1749, 'email.admin.welcome_customer', 'Send email welcome', 'email.admin', 'en'),
	(1750, 'email.admin.contact_to_customer', 'Send email contact to customer', 'email.admin', 'en'),
	(1751, 'email.admin.contact_to_admin', 'Send email contact to admin', 'email.admin', 'en'),
	(1752, 'email.email_action_queue', 'Use send mail queue <span class="text-red">(*)</span>', 'email.admin', 'en'),
	(1753, 'email.admin.other', 'Other', 'email.admin', 'en'),
	(1754, 'email.admin.customer_verify', 'Send account verification email', 'email.admin', 'en'),
	(1755, 'email.admin.order_success_to_admin', 'Gửi đơn hàng thành công cho admin', 'email.admin', 'vi'),
	(1756, 'email.admin.order_success_to_cutomer_pdf', 'Gửi đơn hàng thành công cho khách kèm PDF', 'email.admin', 'vi'),
	(1757, 'email.admin.order_success_to_cutomer', 'Gửi đơn hàng thành công cho khách', 'email.admin', 'vi'),
	(1758, 'email.admin.forgot_password', 'Gửi mail quên mật khẩu', 'email.admin', 'vi'),
	(1759, 'email.admin.welcome_customer', 'Gửi mail chào mừng', 'email.admin', 'vi'),
	(1760, 'email.admin.contact_to_customer', 'Gửi mail form liên hệ cho khách', 'email.admin', 'vi'),
	(1761, 'email.admin.contact_to_admin', 'Gửi mail form liên hệ cho admin', 'email.admin', 'vi'),
	(1762, 'email.email_action_queue', 'Gửi mail qua hàng đợi <span class="text-red">(*)</span>', 'email.admin', 'vi'),
	(1763, 'email.admin.config_smtp', 'Cấu hình SMTP', 'email.admin', 'vi'),
	(1764, 'email.admin.other', 'Loại khác', 'email.admin', 'vi'),
	(1765, 'email.admin.customer_verify', 'Gửi email xác thực tài khoản', 'email.admin', 'vi'),
	(1766, 'email.admin.config_mode', 'Config mode', 'email.admin', 'en'),
	(1767, 'email.admin.config_smtp', 'Config SMTP', 'email.admin', 'en'),
	(1768, 'email.admin.config_mode', 'Cấu hình mode', 'email.admin', 'vi'),
	(1769, 'email.email_action.type', 'Action type', 'email.admin', 'en'),
	(1770, 'email.email_action.mode', 'Action mode', 'email.admin', 'en'),
	(1771, 'email.email_action.sort', 'Action sort', 'email.admin', 'en'),
	(1772, 'email.email_action.order_success_to_admin', 'Send order success to admin', 'email.admin', 'en'),
	(1773, 'email.email_action.order_success_to_cutomer', 'Send order success to customer', 'email.admin', 'en'),
	(1774, 'email.email_action.order_success_to_cutomer_pdf', 'Send order success to customer with pdf invoice', 'email.admin', 'en'),
	(1775, 'email.email_action.forgot_password', 'Send email forgot', 'email.admin', 'en'),
	(1776, 'email.email_action.customer_verify', 'Customer verification', 'email.admin', 'en'),
	(1777, 'email.email_action.welcome_customer', 'Send email welcome', 'email.admin', 'en'),
	(1778, 'email.email_action.contact_to_customer', 'Send email contact to customer', 'email.admin', 'en'),
	(1779, 'email.email_action.contact_to_admin', 'Send email contact to admin', 'email.admin', 'en'),
	(1780, 'email.email_action.email_action_mode', 'ON/OFF send mail', 'email.admin', 'en'),
	(1781, 'email.email_action.email_action_queue', 'Use send mail queue <span class="text-red">(*)</span>', 'email.admin', 'en'),
	(1782, 'email.email_action.email_action_smtp_mode', 'SMTP mode', 'email.admin', 'en'),
	(1783, 'email.email_action.config_smtp', 'Config SMTP', 'email.admin', 'en'),
	(1784, 'email.email_action.type', 'Loại gửi mail', 'email.admin', 'vi'),
	(1785, 'email.email_action.mode', 'Chế độ', 'email.admin', 'vi'),
	(1786, 'email.email_action.sort', 'Sắp xếp', 'email.admin', 'vi'),
	(1787, 'email.email_action.order_success_to_admin', 'Gửi đơn hàng thành công cho admin', 'email.admin', 'vi'),
	(1788, 'email.email_action.order_success_to_cutomer_pdf', 'Gửi đơn hàng thành công cho khách kèm PDF', 'email.admin', 'vi'),
	(1789, 'email.email_action.order_success_to_cutomer', 'Gửi đơn hàng thành công cho khách', 'email.admin', 'vi'),
	(1790, 'email.email_action.forgot_password', 'Gửi mail quên mật khẩu', 'email.admin', 'vi'),
	(1791, 'email.email_action.welcome_customer', 'Gửi mail chào mừng', 'email.admin', 'vi'),
	(1792, 'email.email_action.contact_to_customer', 'Gửi mail form liên hệ cho khách', 'email.admin', 'vi'),
	(1793, 'email.email_action.contact_to_admin', 'Gửi mail form liên hệ cho admin', 'email.admin', 'vi'),
	(1794, 'email.email_action.email_action_mode', 'Tắt/Mở chức năng gửi mail', 'email.admin', 'vi'),
	(1795, 'email.email_action.email_action_queue', 'Gửi mail qua hàng đợi <span class="text-red">(*)</span>', 'email.admin', 'vi'),
	(1796, 'email.email_action.email_action_smtp_mode', 'Sử dụng SMTP', 'email.admin', 'vi'),
	(1797, 'email.email_action.config_smtp', 'Cấu hình SMTP', 'email.admin', 'vi'),
	(1798, 'email.email_action.customer_verify', 'Gửi email xác thực tài khoản', 'email.admin', 'vi'),
	(1799, 'email.email_action.smtp_mode', 'Sử dụng cấu hình SMTP', 'email.admin', 'vi'),
	(1800, 'email.email_action.smtp_mode', 'Use SMTP config', 'email.admin', 'en'),
	(1801, 'email.email_action.help_note', '<span class="text-red">(*)</span>: Email sẽ không được gửi trực tiếp, mà thông qua hàng đợi. Bạn cần phải cài đặt "artisan schedule:run" trước,  chi tiết <a href="https://s-cart.org/docs/master/email.html">TẠI ĐÂY</a>', 'email.admin', 'vi'),
	(1802, 'email.email_action.help_note', '<span class="text-red">(*)</span>: Emails will not be sent directly, but through a queue. You need to set up "artisan schedule: run" first, details <a href="https://s-cart.org/docs/master/email.html">HERE</a>', 'email.admin', 'en'),
	(1803, 'email.config_smtp.smtp_host', 'SMTP host', 'email.admin', 'en'),
	(1804, 'email.config_smtp.smtp_user', 'SMTP user', 'email.admin', 'en'),
	(1805, 'email.config_smtp.smtp_password', 'SMTP password', 'email.admin', 'en'),
	(1806, 'email.config_smtp.smtp_security', 'SMTP security', 'email.admin', 'en'),
	(1807, 'email.config_smtp.smtp_port', 'SMTP port', 'email.admin', 'en'),
	(1808, 'email.config_smtp.smtp_name', 'Email name', 'email.admin', 'en'),
	(1809, 'email.config_smtp.smtp_from', 'Send mail from', 'email.admin', 'en'),
	(1810, 'email.config_smtp.smtp_host', 'Server SMTP', 'email.admin', 'vi'),
	(1811, 'email.config_smtp.smtp_user', 'Tài khoản SMTP', 'email.admin', 'vi'),
	(1812, 'email.config_smtp.smtp_password', 'Mật khẩu SMTP', 'email.admin', 'vi'),
	(1813, 'email.config_smtp.smtp_security', 'Bảo mật SMTP', 'email.admin', 'vi'),
	(1814, 'email.config_smtp.smtp_port', 'Cổng kết nối SMTP', 'email.admin', 'vi'),
	(1815, 'email.config_smtp.smtp_name', 'Tên gửi mail', 'email.admin', 'vi'),
	(1816, 'email.config_smtp.smtp_from', 'Địa chỉ email gửi', 'email.admin', 'vi'),
	(1817, 'email.welcome', 'Chào mừng!', 'email', 'vi'),
	(1818, 'email.welcome', 'Welcome!', 'email', 'en'),
	(1819, 'email.msg_goodbye', 'Trân trọng!', 'email', 'vi'),
	(1820, 'email.msg_goodbye', 'Best regards!', 'email', 'en'),
	(1821, 'email.forgot_password.title', 'Hello!', 'email.forgot_password', 'en'),
	(1822, 'email.forgot_password.reset_button', 'Reset password', 'email.forgot_password', 'en'),
	(1823, 'email.forgot_password.reason_sendmail', 'You are receiving this email because we received a password reset request for your account.', 'email.forgot_password', 'en'),
	(1824, 'email.forgot_password.note_sendmail', 'This password reset link will expire in :count minutes.<br><br>If you did not request a password reset, no further action is required.', 'email.forgot_password', 'en'),
	(1825, 'email.forgot_password.note_access_link', 'If you’re having trouble clicking the ":reset_button" button, copy and paste the URL below into your web browser :url', 'email.forgot_password', 'en'),
	(1826, 'email.forgot_password.title', 'Xin chào!', 'email.forgot_password', 'vi'),
	(1827, 'email.forgot_password.reset_button', 'Tạo lại mật khẩu', 'email.forgot_password', 'vi'),
	(1828, 'email.forgot_password.reason_sendmail', 'Bạn đang nhận email này vì chúng tôi nhận được yêu cầu thiết lập lại mật khẩu cho tài khoản của bạn.', 'email.forgot_password', 'vi'),
	(1829, 'email.forgot_password.note_sendmail', 'Liên kết mật khẩu này sẽ hết hạn trong vòng :count phút.<br><br>Nếu bạn không yêu cầu một thiết lập lại mật khẩu, bạn không cần làm gì cả.<br>', 'email.forgot_password', 'vi'),
	(1830, 'email.forgot_password.note_access_link', 'Nếu bạn gặp sự cố cách nhấn vào nút ":reset_button", sao chép và dán URL dưới đây vào trình duyệt web của bạn :url', 'email.forgot_password', 'vi'),
	(1831, 'email.verification_content.title', 'Hello!', 'email.verification_content', 'en'),
	(1832, 'email.verification_content.button', 'Verify Email Address', 'email.verification_content', 'en'),
	(1833, 'email.verification_content.reason_sendmail', 'Please click the button below to verify your email address.', 'email.verification_content', 'en'),
	(1834, 'email.verification_content.note_sendmail', 'This password reset link will expire in :count minutes.<br><br>If you did not create an account, no further action is required.', 'email.verification_content', 'en'),
	(1835, 'email.verification_content.note_access_link', 'If you’re having trouble clicking the ":button" button, copy and paste the URL below into your web browser :url', 'email.verification_content', 'en'),
	(1836, 'email.verification_content.title', 'Xin chào!', 'email.verification_content', 'vi'),
	(1837, 'email.verification_content.button', 'Xác nhận địa chỉ email', 'email.verification_content', 'vi'),
	(1838, 'email.verification_content.reason_sendmail', 'Vui lòng nhấp vào nút bên dưới để xác minh địa chỉ email của bạn.', 'email.verification_content', 'vi'),
	(1839, 'email.verification_content.note_sendmail', 'Liên kết mật khẩu này sẽ hết hạn trong vòng :count phút.<br><br>Nếu bạn chưa tạo tài khoản, bạn không cần thực hiện thêm hành động nào.', 'email.verification_content', 'vi'),
	(1840, 'email.verification_content.note_access_link', 'Nếu bạn gặp sự cố khi nhấp vào button ":button", sao chép và dán URL bên dưới vào trình duyệt web của bạn :url', 'email.verification_content', 'vi'),
	(1841, 'email.order.title_1', 'Hi! Website :website has new order!', 'email.order', 'en'),
	(1842, 'email.order.order_id', 'Order ID', 'email.order', 'en'),
	(1843, 'email.order.toname', 'Customer name', 'email.order', 'en'),
	(1844, 'email.order.address', 'Address', 'email.order', 'en'),
	(1845, 'email.order.phone', 'Phone', 'email.order', 'en'),
	(1846, 'email.order.note', 'Note', 'email.order', 'en'),
	(1847, 'email.order.order_detail', 'Order detail', 'email.order', 'en'),
	(1848, 'email.order.sort', 'No.', 'email.order', 'en'),
	(1849, 'email.order.sku', 'SKU', 'email.order', 'en'),
	(1850, 'email.order.price', 'Price', 'email.order', 'en'),
	(1851, 'email.order.name', 'Name', 'email.order', 'en'),
	(1852, 'email.order.qty', 'Qty', 'email.order', 'en'),
	(1853, 'email.order.total', 'Total', 'email.order', 'en'),
	(1854, 'email.order.sub_total', 'Sub total', 'email.order', 'en'),
	(1855, 'email.order.shipping_fee', 'Shipping fee', 'email.order', 'en'),
	(1856, 'email.order.discount', 'Discount', 'email.order', 'en'),
	(1857, 'email.order.order_total', 'Order total', 'email.order', 'en'),
	(1858, 'email.order.title_1', 'Xin chào! :website trang web có đơn hàng mới!', 'email.order', 'vi'),
	(1859, 'email.order.order_id', 'Mã đơn hàng', 'email.order', 'vi'),
	(1860, 'email.order.toname', 'Tên khách hàng', 'email.order', 'vi'),
	(1861, 'email.order.address', 'Địa chỉ', 'email.order', 'vi'),
	(1862, 'email.order.phone', 'Điện thoại', 'email.order', 'vi'),
	(1863, 'email.order.note', 'Ghi chú', 'email.order', 'vi'),
	(1864, 'email.order.order_detail', 'Chi tiết đặt hàng', 'email.order', 'vi'),
	(1865, 'email.order.sort', 'Thứ tự', 'email.order', 'vi'),
	(1866, 'email.order.sku', 'SKU', 'email.order', 'vi'),
	(1867, 'email.order.price', 'Giá', 'email.order', 'vi'),
	(1868, 'email.order.name', 'Tên', 'email.order', 'vi'),
	(1869, 'email.order.qty', 'Số lượng', 'email.order', 'vi'),
	(1870, 'email.order.total', 'Tổng', 'email.order', 'vi'),
	(1871, 'email.order.sub_total', 'Tiền hàng', 'email.order', 'vi'),
	(1872, 'email.order.shipping_fee', 'Phí vận chuyển', 'email.order', 'vi'),
	(1873, 'email.order.discount', 'Giảm giá', 'email.order', 'vi'),
	(1874, 'email.order.order_total', 'Tổng số đơn hàng', 'email.order', 'vi'),
	(1875, 'email.order.email_subject_customer', 'Có đơn hàng mới', 'email.order', 'vi'),
	(1876, 'email.order.email_subject_customer', 'Have a new order', 'email.order', 'en'),
	(1877, 'admin.store_block.list', 'Danh sách block', 'admin.store_block', 'vi'),
	(1878, 'admin.store_block.list', 'Block list', 'admin.store_block', 'en'),
	(1879, 'admin.store_block.name', 'Tên', 'admin.store_block', 'vi'),
	(1880, 'admin.store_block.position', 'Vị trí', 'admin.store_block', 'vi'),
	(1881, 'admin.store_block.page', 'Trang', 'admin.store_block', 'vi'),
	(1882, 'admin.store_block.type', 'Loại', 'admin.store_block', 'vi'),
	(1883, 'admin.store_block.text', 'Nội dung', 'admin.store_block', 'vi'),
	(1884, 'admin.store_block.status', 'Trạng thái', 'admin.store_block', 'vi'),
	(1885, 'admin.store_block.name', 'Name', 'admin.store_block', 'en'),
	(1886, 'admin.store_block.position', 'Position', 'admin.store_block', 'en'),
	(1887, 'admin.store_block.page', 'Page', 'admin.store_block', 'en'),
	(1888, 'admin.store_block.type', 'Type', 'admin.store_block', 'en'),
	(1889, 'admin.store_block.text', 'Text', 'admin.store_block', 'en'),
	(1890, 'admin.store_block.status', 'Status', 'admin.store_block', 'en'),
	(1891, 'admin.store_block.sort', 'Sort', 'admin.store_block', 'en'),
	(1892, 'admin.store_block.sort', 'Sắp xếp', 'admin.store_block', 'vi'),
	(1893, 'admin.store_block.add_new_title', 'Add layout', 'admin.store_block', 'en'),
	(1894, 'admin.store_block.add_new_des', 'Create a new layout', 'admin.store_block', 'en'),
	(1895, 'admin.store_block.select_position', 'Select position', 'admin.store_block', 'en'),
	(1896, 'admin.store_block.select_page', 'Select page', 'admin.store_block', 'en'),
	(1897, 'admin.store_block.helper_html', 'Basic HTML content.', 'admin.store_block', 'en'),
	(1898, 'admin.store_block.helper_view', 'View files are in "resources/views/templates/:template/block" directory.', 'admin.store_block', 'en'),
	(1899, 'admin.store_block.helper_module', 'File in "app/Plugins/Block". Module must have render() method available to display content.', 'admin.store_block', 'en'),
	(1900, 'admin.store_block.add_new_title', 'Tạo bố cục', 'admin.store_block', 'vi'),
	(1901, 'admin.store_block.add_new_des', 'Tạo mới bố cục', 'admin.store_block', 'vi'),
	(1902, 'admin.store_block.select_position', 'Chọn vị trí', 'admin.store_block', 'vi'),
	(1903, 'admin.store_block.select_page', 'Chọn trang', 'admin.store_block', 'vi'),
	(1904, 'admin.store_block.helper_html', 'Basic HTML content.', 'admin.store_block', 'vi'),
	(1905, 'admin.store_block.helper_view', 'File trong thư mục "resources/views/templates/:template/block".', 'admin.store_block', 'vi'),
	(1906, 'admin.store_block.helper_module', 'File trong "app/Plugins/Block". Module phải có hàm render().', 'admin.store_block', 'vi'),
	(1907, 'admin.log.list', 'Danh sách nhật ký', 'admin.log', 'vi'),
	(1908, 'admin.log.list', 'Logs list', 'admin.log', 'en'),
	(1909, 'admin.log.user', 'Người dùng', 'admin.log', 'vi'),
	(1910, 'admin.log.user', 'User', 'admin.log', 'en'),
	(1911, 'admin.log.method', 'Phương thức', 'admin.log', 'vi'),
	(1912, 'admin.log.path', 'Path', 'admin.log', 'vi'),
	(1913, 'admin.log.ip', 'IP', 'admin.log', 'vi'),
	(1914, 'admin.log.user_agent', 'User agent', 'admin.log', 'vi'),
	(1915, 'admin.log.input', 'Input', 'admin.log', 'vi'),
	(1916, 'admin.log.created_at', 'Thời gian', 'admin.log', 'vi'),
	(1917, 'admin.log.method', 'Method', 'admin.log', 'en'),
	(1918, 'admin.log.path', 'Path', 'admin.log', 'en'),
	(1919, 'admin.log.ip', 'IP', 'admin.log', 'en'),
	(1920, 'admin.log.user_agent', 'User agent', 'admin.log', 'en'),
	(1921, 'admin.log.input', 'Input', 'admin.log', 'en'),
	(1922, 'admin.log.created_at', 'Time', 'admin.log', 'en'),
	(1923, 'admin.page.title', 'Tiêu đề', 'admin.page', 'vi'),
	(1924, 'admin.page.image', 'Hình ảnh', 'admin.page', 'vi'),
	(1925, 'admin.page.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.page', 'vi'),
	(1926, 'admin.page.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_" ', 'admin.page', 'vi'),
	(1927, 'admin.page.key_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and ".-_" ', 'admin.page', 'vi'),
	(1928, 'admin.page.status', 'Trạng thái', 'admin.page', 'vi'),
	(1929, 'admin.page.keyword', 'Từ khóa', 'admin.page', 'vi'),
	(1930, 'admin.page.description', 'Mô tả', 'admin.page', 'vi'),
	(1931, 'admin.page.content', 'Nội dung', 'admin.page', 'vi'),
	(1932, 'admin.page.title', 'Title', 'admin.page', 'en'),
	(1933, 'admin.page.image', 'Image', 'admin.page', 'en'),
	(1934, 'admin.page.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.page', 'en'),
	(1935, 'admin.page.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_" ', 'admin.page', 'en'),
	(1936, 'admin.page.status', 'Status', 'admin.page', 'en'),
	(1937, 'admin.page.keyword', 'Keyword', 'admin.page', 'en'),
	(1938, 'admin.page.description', 'Description', 'admin.page', 'en'),
	(1939, 'admin.page.content', 'Content', 'admin.page', 'en'),
	(1940, 'admin.page.key_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and ".-_" ', 'admin.page', 'en'),
	(1941, 'admin.page.add_new', 'Add new', 'admin.page', 'en'),
	(1942, 'admin.page.add_new_title', 'Add page', 'admin.page', 'en'),
	(1943, 'admin.page.add_new_des', 'Create a new page', 'admin.page', 'en'),
	(1944, 'admin.page.add_new_title', 'Tạo trang', 'admin.page', 'vi'),
	(1945, 'admin.page.add_new_des', 'Tạo mới trang', 'admin.page', 'vi'),
	(1946, 'admin.page.choose_image', 'Chọn ảnh', 'admin.page', 'vi'),
	(1947, 'admin.page.choose_image', 'Chose image', 'admin.page', 'en'),
	(1948, 'admin.page.list', 'Danh sách trang', 'admin.page', 'vi'),
	(1949, 'admin.page.list', 'Page list', 'admin.page', 'en'),
	(1950, 'admin.page.search_place', 'Tìm tên', 'admin.page', 'vi'),
	(1951, 'admin.page.search_place', 'Search name', 'admin.page', 'en'),
	(1952, 'admin.news.add_new_title', 'Add new blog', 'admin.news', 'en'),
	(1953, 'admin.news.add_new_des', 'Create a new blog', 'admin.news', 'en'),
	(1954, 'admin.news.title', 'Title', 'admin.news', 'en'),
	(1955, 'admin.news.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.news', 'en'),
	(1956, 'admin.news.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_" ', 'admin.news', 'en'),
	(1957, 'admin.news.keyword', 'Keyword', 'admin.news', 'en'),
	(1958, 'admin.news.description', 'Description', 'admin.news', 'en'),
	(1959, 'admin.news.content', 'Content', 'admin.news', 'en'),
	(1960, 'admin.news.image', 'Image', 'admin.news', 'en'),
	(1961, 'admin.news.status', 'Status', 'admin.news', 'en'),
	(1962, 'admin.news.sort', 'Sort', 'admin.news', 'en'),
	(1963, 'admin.news.list', 'Blog/News manager', 'admin.news', 'en'),
	(1964, 'admin.news.edit', 'Edit', 'admin.news', 'en'),
	(1965, 'admin.news.search_place', 'Search title', 'admin.news', 'en'),
	(1966, 'admin.news.title', 'Tiêu đề', 'admin.news', 'vi'),
	(1967, 'admin.news.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.news', 'vi'),
	(1968, 'admin.news.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_" ', 'admin.news', 'vi'),
	(1969, 'admin.news.keyword', 'Từ khóa', 'admin.news', 'vi'),
	(1970, 'admin.news.description', 'Mô tả', 'admin.news', 'vi'),
	(1971, 'admin.news.content', 'Nội dung', 'admin.news', 'vi'),
	(1972, 'admin.news.image', 'Hình ảnh', 'admin.news', 'vi'),
	(1973, 'admin.news.parent', 'Danh mục cha', 'admin.news', 'vi'),
	(1974, 'admin.news.top', 'Hiển thị ưu tiên', 'admin.news', 'vi'),
	(1975, 'admin.news.status', 'Trạng thái', 'admin.news', 'vi'),
	(1976, 'admin.news.sort', 'Sắp xếp', 'admin.news', 'vi'),
	(1977, 'admin.news.list', 'Danh sách', 'admin.news', 'vi'),
	(1978, 'admin.news.add_new_title', 'Tạo Blog/News', 'admin.news', 'vi'),
	(1979, 'admin.news.add_new_des', 'Tạo mới một Blog/News', 'admin.news', 'vi'),
	(1980, 'admin.news.search_place', 'Tìm tiêu đề', 'admin.news', 'vi'),
	(1981, 'admin.length.name', 'Tên', 'admin.length', 'vi'),
	(1982, 'admin.length.name', 'Name', 'admin.length', 'en'),
	(1983, 'admin.length.description', 'Mô tả', 'admin.length', 'vi'),
	(1984, 'admin.length.description', 'Description', 'admin.length', 'en'),
	(1985, 'admin.length.list', 'Danh sách kích thước', 'admin.length', 'vi'),
	(1986, 'admin.length.list', 'Length list', 'admin.length', 'en'),
	(1987, 'admin.length.add_new_title', 'Thêm kích thước', 'admin.length', 'vi'),
	(1988, 'admin.length.add_new_title', 'Add Length', 'admin.length', 'en'),
	(1989, 'admin.weight.name', 'Tên', 'admin.weight', 'vi'),
	(1990, 'admin.weight.name', 'Name', 'admin.weight', 'en'),
	(1991, 'admin.weight.description', 'Mô tả', 'admin.weight', 'vi'),
	(1992, 'admin.weight.description', 'Description', 'admin.weight', 'en'),
	(1993, 'admin.weight.list', 'Danh sách khối lượng', 'admin.weight', 'vi'),
	(1994, 'admin.weight.list', 'Weight list', 'admin.weight', 'en'),
	(1995, 'admin.weight.add_new_title', 'Thêm khối lượng', 'admin.weight', 'vi'),
	(1996, 'admin.weight.add_new_title', 'Add weight', 'admin.weight', 'en'),
	(1997, 'admin.product_property.name', 'Tên', 'admin.product_property', 'vi'),
	(1998, 'admin.product_property.name', 'Name', 'admin.product_property', 'en'),
	(1999, 'admin.product_property.list', 'Danh sách thuộc tính', 'admin.product_property', 'vi'),
	(2000, 'admin.product_property.list', 'Product property list', 'admin.product_property', 'en'),
	(2001, 'admin.product_property.status', 'Trạng thái', 'admin.product_property', 'vi'),
	(2002, 'admin.product_property.status', 'Status', 'admin.product_property', 'en'),
	(2003, 'admin.product_property.add_new_title', 'Thêm thuộc tính', 'admin.product_property', 'vi'),
	(2004, 'admin.product_property.add_new_title', 'Add product property', 'admin.product_property', 'en'),
	(2005, 'admin.order_status.name', 'Tên', 'admin.order_status', 'vi'),
	(2006, 'admin.order_status.name', 'Name', 'admin.order_status', 'en'),
	(2007, 'admin.order_status.list', 'Danh sách trạng thái', 'admin.order_status', 'vi'),
	(2008, 'admin.order_status.list', 'Order status list', 'admin.order_status', 'en'),
	(2009, 'admin.order_status.status', 'Trạng thái', 'admin.order_status', 'vi'),
	(2010, 'admin.order_status.status', 'Status', 'admin.order_status', 'en'),
	(2011, 'admin.order_status.add_new_title', 'Thêm trạng thái', 'admin.order_status', 'vi'),
	(2012, 'admin.order_status.add_new_title', 'Add status', 'admin.order_status', 'en'),
	(2013, 'admin.payment_status.name', 'Tên', 'admin.payment_status', 'vi'),
	(2014, 'admin.payment_status.name', 'Name', 'admin.payment_status', 'en'),
	(2015, 'admin.payment_status.list', 'Danh sách trạng thái', 'admin.payment_status', 'vi'),
	(2016, 'admin.payment_status.list', 'Payment status list', 'admin.payment_status', 'en'),
	(2017, 'admin.payment_status.status', 'Trạng thái', 'admin.payment_status', 'vi'),
	(2018, 'admin.payment_status.status', 'Status', 'admin.payment_status', 'en'),
	(2019, 'admin.payment_status.add_new_title', 'Thêm trạng thái', 'admin.payment_status', 'vi'),
	(2020, 'admin.payment_status.add_new_title', 'Add status', 'admin.payment_status', 'en'),
	(2021, 'admin.shipping_status.name', 'Tên', 'admin.shipping_status', 'vi'),
	(2022, 'admin.shipping_status.name', 'Name', 'admin.shipping_status', 'en'),
	(2023, 'admin.shipping_status.list', 'Danh sách trạng thái', 'admin.shipping_status', 'vi'),
	(2024, 'admin.shipping_status.list', 'Shipping status list', 'admin.shipping_status', 'en'),
	(2025, 'admin.shipping_status.status', 'Trạng thái', 'admin.shipping_status', 'vi'),
	(2026, 'admin.shipping_status.status', 'Status', 'admin.shipping_status', 'en'),
	(2027, 'admin.shipping_status.add_new_title', 'Thêm trạng thái', 'admin.shipping_status', 'vi'),
	(2028, 'admin.shipping_status.add_new_title', 'Add status', 'admin.shipping_status', 'en'),
	(2029, 'admin.tax.name', 'Tên', 'admin.tax', 'vi'),
	(2030, 'admin.tax.name', 'Name', 'admin.tax', 'en'),
	(2031, 'admin.tax.value', 'Giá trị', 'admin.tax', 'vi'),
	(2032, 'admin.tax.value', 'Value', 'admin.tax', 'en'),
	(2033, 'admin.tax.non_tax', 'Không thuế', 'admin.tax', 'vi'),
	(2034, 'admin.tax.non_tax', 'None tax', 'admin.tax', 'en'),
	(2035, 'admin.tax.auto', 'Tự động', 'admin.tax', 'vi'),
	(2036, 'admin.tax.auto', 'Auto', 'admin.tax', 'en'),
	(2037, 'admin.tax.list', 'Danh sách thuế', 'admin.tax', 'vi'),
	(2038, 'admin.tax.list', 'Tax list', 'admin.tax', 'en'),
	(2039, 'admin.tax.status', 'Trạng thái', 'admin.tax', 'vi'),
	(2040, 'admin.tax.status', 'Status', 'admin.tax', 'en'),
	(2041, 'admin.tax.add_new_title', 'Thêm thuế', 'admin.tax', 'vi'),
	(2042, 'admin.tax.add_new_title', 'Add tax', 'admin.tax', 'en'),
	(2043, 'admin.captcha.captcha_title', 'Captcha', 'admin.captcha', 'en'),
	(2044, 'admin.captcha.captcha_mode', 'Use Captcha', 'admin.captcha', 'en'),
	(2045, 'admin.captcha.captcha_method', 'Captcha method', 'admin.captcha', 'en'),
	(2046, 'admin.captcha.captcha_method_help', 'Select method Captcha', 'admin.captcha', 'en'),
	(2047, 'admin.captcha.captcha_page', 'Captcha', 'admin.captcha', 'en'),
	(2048, 'admin.captcha.captcha_page_help', 'Select page use Captcha', 'admin.captcha', 'en'),
	(2049, 'admin.captcha.captcha_page_contact', 'Contact', 'admin.captcha', 'en'),
	(2050, 'admin.captcha.captcha_page_register', 'Register', 'admin.captcha', 'en'),
	(2051, 'admin.captcha.captcha_page_forgot_password', 'Forgot pasword', 'admin.captcha', 'en'),
	(2052, 'admin.captcha.captcha_page_checkout', 'Checkout', 'admin.captcha', 'en'),
	(2053, 'admin.captcha.captcha_page_review', 'Review product', 'admin.captcha', 'en'),
	(2054, 'admin.captcha.captcha_title', 'Captcha', 'admin.captcha', 'vi'),
	(2055, 'admin.captcha.captcha_mode', 'Sử dụng Captcha', 'admin.captcha', 'vi'),
	(2056, 'admin.captcha.captcha_method', 'Loại Captcha', 'admin.captcha', 'vi'),
	(2057, 'admin.captcha.captcha_method_help', 'Chọn loại Captcha', 'admin.captcha', 'vi'),
	(2058, 'admin.captcha.captcha_page', 'Trang sử dụng captcha', 'admin.captcha', 'vi'),
	(2059, 'admin.captcha.captcha_page_help', 'Chọn trang sử dụng Captcha', 'admin.captcha', 'vi'),
	(2060, 'admin.captcha.captcha_page_contact', 'Liên hệ', 'admin.captcha', 'vi'),
	(2061, 'admin.captcha.captcha_page_register', 'Đăng ký', 'admin.captcha', 'vi'),
	(2062, 'admin.captcha.captcha_page_forgot_password', 'Quên mật khẩu', 'admin.captcha', 'vi'),
	(2063, 'admin.captcha.captcha_page_checkout', 'Đặt hàng', 'admin.captcha', 'vi'),
	(2064, 'admin.captcha.captcha_page_review', 'Đánh giá sản phẩm', 'admin.captcha', 'vi'),
	(2065, 'admin.link.list', 'Danh sách liên kết', 'admin.link', 'vi'),
	(2066, 'admin.link.list', 'Link list', 'admin.link', 'en'),
	(2067, 'admin.link.name', 'Tên', 'admin.link', 'vi'),
	(2068, 'admin.link.url', 'Đường dẫn', 'admin.link', 'vi'),
	(2069, 'admin.link.target', 'Target', 'admin.link', 'vi'),
	(2070, 'admin.link.group', 'Nhóm', 'admin.link', 'vi'),
	(2071, 'admin.link.sort', 'Thứ tự', 'admin.link', 'vi'),
	(2072, 'admin.link.status', 'Trạng thái', 'admin.link', 'vi'),
	(2073, 'admin.link.add_new', 'Thêm mới', 'admin.link', 'vi'),
	(2074, 'admin.link.add_new_title', 'Tạo url', 'admin.link', 'vi'),
	(2075, 'admin.link.add_new_des', 'Tạo mới url', 'admin.link', 'vi'),
	(2076, 'admin.link.select_group', 'Chọn nhóm', 'admin.link', 'vi'),
	(2077, 'admin.link.select_target', 'Chọn target', 'admin.link', 'vi'),
	(2078, 'admin.link.helper_url', 'Ví dụ: url, path, hoặc route::name', 'admin.link', 'vi'),
	(2079, 'admin.link.name', 'Name', 'admin.link', 'en'),
	(2080, 'admin.link.url', 'Url', 'admin.link', 'en'),
	(2081, 'admin.link.target', 'Target', 'admin.link', 'en'),
	(2082, 'admin.link.group', 'Group', 'admin.link', 'en'),
	(2083, 'admin.link.status', 'Status', 'admin.link', 'en'),
	(2084, 'admin.link.sort', 'Sort', 'admin.link', 'en'),
	(2085, 'admin.link.add_new', 'Add new', 'admin.link', 'en'),
	(2086, 'admin.link.add_new_title', 'Add layout url', 'admin.link', 'en'),
	(2087, 'admin.link.add_new_des', 'Create a new layout url', 'admin.link', 'en'),
	(2088, 'admin.link.select_group', 'Select group', 'admin.link', 'en'),
	(2089, 'admin.link.select_target', 'Select target', 'admin.link', 'en'),
	(2090, 'admin.link.helper_url', 'Ex: url, path, or route::name', 'admin.link', 'en'),
	(2091, 'admin.link_position.menu', 'Menu', 'admin.link', 'vi'),
	(2092, 'admin.link_position.menu_left', 'Menu trái', 'admin.link', 'vi'),
	(2093, 'admin.link_position.menu_right', 'Menu phải', 'admin.link', 'vi'),
	(2094, 'admin.link_position.footer', 'Footer', 'admin.link', 'vi'),
	(2095, 'admin.link_position.footer_left', 'Footer trái', 'admin.link', 'vi'),
	(2096, 'admin.link_position.footer_right', 'Footer phải', 'admin.link', 'vi'),
	(2097, 'admin.link_position.sidebar', 'Thanh bên', 'admin.link', 'vi'),
	(2098, 'admin.link_position.menu', 'Menu', 'admin.link', 'en'),
	(2099, 'admin.link_position.menu_left', 'Menu left', 'admin.link', 'en'),
	(2100, 'admin.link_position.menu_right', 'Menu right', 'admin.link', 'en'),
	(2101, 'admin.link_position.footer', 'Footer', 'admin.link', 'en'),
	(2102, 'admin.link_position.footer_left', 'Footer left', 'admin.link', 'en'),
	(2103, 'admin.link_position.footer_right', 'Footer right', 'admin.link', 'en'),
	(2104, 'admin.link_position.sidebar', 'Sidebar', 'admin.link', 'en'),
	(2105, 'admin.supplier.name', 'Name', 'admin.supplier', 'en'),
	(2106, 'admin.supplier.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.supplier', 'en'),
	(2107, 'admin.supplier.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_" ', 'admin.supplier', 'en'),
	(2108, 'admin.supplier.email', 'Email', 'admin.supplier', 'en'),
	(2109, 'admin.supplier.phone', 'Phone', 'admin.supplier', 'en'),
	(2110, 'admin.supplier.address', 'Address', 'admin.supplier', 'en'),
	(2111, 'admin.supplier.image', 'Image', 'admin.supplier', 'en'),
	(2112, 'admin.supplier.url', 'Website', 'admin.supplier', 'en'),
	(2113, 'admin.supplier.sort', 'Sort', 'admin.supplier', 'en'),
	(2114, 'admin.supplier.status', 'Status', 'admin.supplier', 'en'),
	(2115, 'admin.supplier.add_new', 'Add new', 'admin.supplier', 'en'),
	(2116, 'admin.supplier.add_new_title', 'Add supplier', 'admin.supplier', 'en'),
	(2117, 'admin.supplier.add_new_des', 'Create a new supplier', 'admin.supplier', 'en'),
	(2118, 'admin.supplier.list', 'Suppliers list', 'admin.supplier', 'en'),
	(2119, 'admin.supplier.name', 'Tên nhà cung cấp', 'admin.supplier', 'vi'),
	(2120, 'admin.supplier.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.supplier', 'vi'),
	(2121, 'admin.supplier.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_" ', 'admin.supplier', 'vi'),
	(2122, 'admin.supplier.email', 'Email', 'admin.supplier', 'vi'),
	(2123, 'admin.supplier.phone', 'Số điện thoại', 'admin.supplier', 'vi'),
	(2124, 'admin.supplier.address', 'Địa chỉ', 'admin.supplier', 'vi'),
	(2125, 'admin.supplier.image', 'Hình ảnh', 'admin.supplier', 'vi'),
	(2126, 'admin.supplier.url', 'Website', 'admin.supplier', 'vi'),
	(2127, 'admin.supplier.sort', 'Sắp xếp', 'admin.supplier', 'vi'),
	(2128, 'admin.supplier.status', 'Status', 'admin.supplier', 'vi'),
	(2129, 'admin.supplier.add_new_title', 'Tạo nhà cung cấp', 'admin.supplier', 'vi'),
	(2130, 'admin.supplier.add_new_des', 'Tạo mới nhà cung cấp', 'admin.supplier', 'vi'),
	(2131, 'admin.supplier.list', 'Danh sách nhà cung cấp', 'admin.supplier', 'vi'),
	(2132, 'admin.supplier.search_place', 'Tìm tên hoặc email', 'admin.supplier', 'vi'),
	(2133, 'admin.supplier.search_place', 'Search name or email', 'admin.supplier', 'en'),
	(2134, 'admin.role.name', 'Name', 'admin.role', 'en'),
	(2135, 'admin.role.slug', 'Slug', 'admin.role', 'en'),
	(2136, 'admin.role.permission', 'Permission', 'admin.role', 'en'),
	(2137, 'admin.role.http_path', 'HTTP path', 'admin.role', 'en'),
	(2138, 'admin.role.http_method', 'HTTP method', 'admin.role', 'en'),
	(2139, 'admin.role.created_at', 'Created at', 'admin.role', 'en'),
	(2140, 'admin.role.updated_at', 'Updated at', 'admin.role', 'en'),
	(2141, 'admin.role.password_confirmation', 'Confirmation', 'admin.role', 'en'),
	(2142, 'admin.role.slug_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and "._-" ', 'admin.role', 'en'),
	(2143, 'admin.role.list', 'Role manager', 'admin.role', 'en'),
	(2144, 'admin.role.edit', 'Edit', 'admin.role', 'en'),
	(2145, 'admin.role.add_new', 'Add new', 'admin.role', 'en'),
	(2146, 'admin.role.add_new_title', 'Add new role', 'admin.role', 'en'),
	(2147, 'admin.role.add_new_des', 'Create a new role', 'admin.role', 'en'),
	(2148, 'admin.role.select_http_method', 'Select method', 'admin.role', 'en'),
	(2149, 'admin.role.select_permission', 'Select permission', 'admin.role', 'en'),
	(2150, 'admin.role.select_user', 'Select user', 'admin.role', 'en'),
	(2151, 'admin.role.slug', 'Slug', 'admin.role', 'vi'),
	(2152, 'admin.role.name', 'Tên', 'admin.role', 'vi'),
	(2153, 'admin.role.roles', 'vai trò', 'admin.role', 'vi'),
	(2154, 'admin.role.permission', 'Quyền hạn', 'admin.role', 'vi'),
	(2155, 'admin.role.http_path', 'HTTP path', 'admin.role', 'vi'),
	(2156, 'admin.role.http_method', 'HTTP method', 'admin.role', 'vi'),
	(2157, 'admin.role.created_at', 'Tạo lúc', 'admin.role', 'vi'),
	(2158, 'admin.role.updated_at', 'Cập nhật', 'admin.role', 'vi'),
	(2159, 'admin.role.slug_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and "._-" ', 'admin.role', 'vi'),
	(2160, 'admin.role.add_new', 'Thêm mới', 'admin.role', 'vi'),
	(2161, 'admin.role.add_new_title', 'Tạo quyền', 'admin.role', 'vi'),
	(2162, 'admin.role.add_new_des', 'Tạo mới một quyền', 'admin.role', 'vi'),
	(2163, 'admin.role.select_permission', 'Chọn quyền hạn', 'admin.role', 'vi'),
	(2164, 'admin.role.select_user', 'Chọn người dùng', 'admin.role', 'vi'),
	(2165, 'admin.template.import', 'Import Template', 'admin.template', 'en'),
	(2166, 'admin.template.file_format', 'File format', 'admin.template', 'en'),
	(2167, 'admin.template.choose_file', 'Choose File', 'admin.template', 'en'),
	(2168, 'admin.template.import_submit', 'Import', 'admin.template', 'en'),
	(2169, 'admin.template.import_note', 'File <span style="color:red">.zip</span>, max size is <span style="color:red">50MB</span>', 'admin.template', 'en'),
	(2170, 'admin.template.error_unzip', 'Error while unzip', 'admin.template', 'en'),
	(2171, 'admin.template.error_upload', 'Error while uploading file', 'admin.template', 'en'),
	(2172, 'admin.template.error_check_config', 'Cannot find config file', 'admin.template', 'en'),
	(2173, 'admin.template.error_config_format', 'The config file is not in the right format', 'admin.template', 'en'),
	(2174, 'admin.template.import_success', 'Import success!', 'admin.template', 'en'),
	(2175, 'admin.template.error_exist', 'Template exist!', 'admin.template', 'en'),
	(2176, 'admin.template.template_import', '<a href="import" target=_new><span class="btn btn-success btn-flat"><i class="fa fa-floppy-o" aria-hidden="true"></i> Import Template</span></a>', 'admin.template', 'en'),
	(2177, 'admin.template.template_more', '<a href="https://s-cart.org/en/template.html" target=_new><i class="fa fa-download" aria-hidden="true"></i> Download more HERE</a>', 'admin.template', 'en'),
	(2178, 'admin.template.manager', 'Template management', 'admin.template', 'en'),
	(2179, 'admin.template.title', 'Template list', 'admin.template', 'en'),
	(2180, 'admin.template.name', 'Template name', 'admin.template', 'en'),
	(2181, 'admin.template.auth', 'Author', 'admin.template', 'en'),
	(2182, 'admin.template.email', 'Email', 'admin.template', 'en'),
	(2183, 'admin.template.website', 'Website', 'admin.template', 'en'),
	(2184, 'admin.template.activated', 'Activated', 'admin.template', 'en'),
	(2185, 'admin.template.inactive', 'Inactive', 'admin.template', 'en'),
	(2186, 'admin.template.download', 'Download', 'admin.template', 'en'),
	(2187, 'admin.template.remove', 'Remove', 'admin.template', 'en'),
	(2188, 'admin.template.status', 'Status', 'admin.template', 'en'),
	(2189, 'admin.template.action', 'Action', 'admin.template', 'en'),
	(2190, 'admin.template.installing', 'Installing', 'admin.template', 'en'),
	(2191, 'admin.template.local', 'Save local', 'admin.template', 'en'),
	(2192, 'admin.template.online', 'From library', 'admin.template', 'en'),
	(2193, 'admin.template.version', 'Version', 'admin.template', 'en'),
	(2194, 'admin.template.link', 'Link', 'admin.template', 'en'),
	(2195, 'admin.template.image', 'Image', 'admin.template', 'en'),
	(2196, 'admin.template.empty', 'Empty template!', 'admin.template', 'en'),
	(2197, 'admin.template.downloaded', 'Downloaded', 'admin.template', 'en'),
	(2198, 'admin.template.rated', 'Rated', 'admin.template', 'en'),
	(2199, 'admin.template.price', 'Price', 'admin.template', 'en'),
	(2200, 'admin.template.free', 'Free', 'admin.template', 'en'),
	(2201, 'admin.template.date', 'Date', 'admin.template', 'en'),
	(2202, 'admin.template.click_here', 'Click here', 'admin.template', 'en'),
	(2203, 'admin.template.located', 'Located', 'admin.template', 'en'),
	(2204, 'admin.template.code', 'Code', 'admin.template', 'en'),
	(2205, 'admin.template.image_demo', 'Image demo', 'admin.template', 'en'),
	(2206, 'admin.template.only_version_current', 'Only this version', 'admin.template', 'en'),
	(2207, 'admin.template.compatible', 'Compatible', 'admin.template', 'en'),
	(2208, 'admin.template.used', 'Template used', 'admin.template', 'en'),
	(2209, 'admin.template.list', 'Template list', 'admin.template', 'en'),
	(2210, 'admin.template.import', 'Import Giao diện', 'admin.template', 'vi'),
	(2211, 'admin.template.file_format', 'File mẫu', 'admin.template', 'vi'),
	(2212, 'admin.template.choose_file', 'Chọn file', 'admin.template', 'vi'),
	(2213, 'admin.template.import_submit', 'Import', 'admin.template', 'vi'),
	(2214, 'admin.template.import_note', 'Là file <span style="color:red">.zip</span>, dung lượng tối đa <span style="color:red">50MB</span>', 'admin.template', 'vi'),
	(2215, 'admin.template.error_unzip', 'Lỗi trong khi unzip', 'admin.template', 'vi'),
	(2216, 'admin.template.error_upload', 'Lỗi trong khi upload file', 'admin.template', 'vi'),
	(2217, 'admin.template.error_check_config', 'Không tìm thấy hoặc không thể đọc file config', 'admin.template', 'vi'),
	(2218, 'admin.template.error_config_format', 'File config không đúng định dạng', 'admin.template', 'vi'),
	(2219, 'admin.template.import_success', 'Import thành công!', 'admin.template', 'vi'),
	(2220, 'admin.template.error_exist', 'Giao diện đã tồn tại!', 'admin.template', 'vi'),
	(2221, 'admin.template.template_import', '<a href="import" target=_new><span class="btn btn-success btn-flat"><i class="fa fa-floppy-o" aria-hidden="true"></i> Import Plugin</span></a>', 'admin.template', 'vi'),
	(2222, 'admin.template.template_more', '<a href="https://s-cart.org/vi/template.html" target=_new><i class="fa fa-download" aria-hidden="true"></i> Download đầy đủ Ở ĐÂY</a>', 'admin.template', 'vi'),
	(2223, 'admin.template.manager', 'Quản lý giao diện', 'admin.template', 'vi'),
	(2224, 'admin.template.title', 'Danh sách giao diện', 'admin.template', 'vi'),
	(2225, 'admin.template.name', 'Tên giao diện', 'admin.template', 'vi'),
	(2226, 'admin.template.email', 'Email', 'admin.template', 'vi'),
	(2227, 'admin.template.website', 'Website', 'admin.template', 'vi'),
	(2228, 'admin.template.activated', 'Đang hoạt động', 'admin.template', 'vi'),
	(2229, 'admin.template.inactive', 'Đang ẩn', 'admin.template', 'vi'),
	(2230, 'admin.template.download', 'Tải về', 'admin.template', 'vi'),
	(2231, 'admin.template.remove', 'Gỡ bỏ', 'admin.template', 'vi'),
	(2232, 'admin.template.status', 'Trạng thái', 'admin.template', 'vi'),
	(2233, 'admin.template.action', 'Hành động', 'admin.template', 'vi'),
	(2234, 'admin.template.installing', 'Đang cài đặt', 'admin.template', 'vi'),
	(2235, 'admin.template.local', 'Đã lưu trên máy', 'admin.template', 'vi'),
	(2236, 'admin.template.online', 'Tải từ thư viện', 'admin.template', 'vi'),
	(2237, 'admin.template.auth', 'Tác giả', 'admin.template', 'vi'),
	(2238, 'admin.template.version', 'Phiên bản', 'admin.template', 'vi'),
	(2239, 'admin.template.link', 'Liên kết', 'admin.template', 'vi'),
	(2240, 'admin.template.image', 'Hình ảnh', 'admin.template', 'vi'),
	(2241, 'admin.template.empty', 'Chưa có template nào!', 'admin.template', 'vi'),
	(2242, 'admin.template.downloaded', 'Số lần tải', 'admin.template', 'vi'),
	(2243, 'admin.template.rated', 'Đánh giá', 'admin.template', 'vi'),
	(2244, 'admin.template.price', 'Giá', 'admin.template', 'vi'),
	(2245, 'admin.template.free', 'Miễn phí', 'admin.template', 'vi'),
	(2246, 'admin.template.date', 'Ngày tạo', 'admin.template', 'vi'),
	(2247, 'admin.template.located', 'Đã tải về', 'admin.template', 'vi'),
	(2248, 'admin.template.code', 'Mã code', 'admin.template', 'vi'),
	(2249, 'admin.template.click_here', 'Bấm vào đây', 'admin.template', 'vi'),
	(2250, 'admin.template.image_demo', 'Hình mẫu', 'admin.template', 'vi'),
	(2251, 'admin.template.only_version_current', 'Chỉ phiên bản này', 'admin.template', 'vi'),
	(2252, 'admin.template.compatible', 'Tương thích', 'admin.template', 'vi'),
	(2253, 'admin.template.used', 'Đang sử dụng', 'admin.template', 'vi'),
	(2254, 'admin.template.list', 'Danh sách giao diện', 'admin.template', 'vi'),
	(2255, 'admin.plugin.compatible', 'Tương thích', 'admin.plugin', 'vi'),
	(2256, 'admin.plugin.code', 'Mã code', 'admin.plugin', 'vi'),
	(2257, 'admin.plugin.name', 'Tên chức năng', 'admin.plugin', 'vi'),
	(2258, 'admin.plugin.sort', 'Thứ tự', 'admin.plugin', 'vi'),
	(2259, 'admin.plugin.action', 'Hành động', 'admin.plugin', 'vi'),
	(2260, 'admin.plugin.status', 'Trạng thái', 'admin.plugin', 'vi'),
	(2261, 'admin.plugin.enable', 'Kích hoạt', 'admin.plugin', 'vi'),
	(2262, 'admin.plugin.disable', 'Tắt', 'admin.plugin', 'vi'),
	(2263, 'admin.plugin.remove', 'Gỡ bỏ', 'admin.plugin', 'vi'),
	(2264, 'admin.plugin.only_delete_data', 'Chỉ xóa dữ liệu', 'admin.plugin', 'vi'),
	(2265, 'admin.plugin.install', 'Cài đặt', 'admin.plugin', 'vi'),
	(2266, 'admin.plugin.config', 'Cấu hình', 'admin.plugin', 'vi'),
	(2267, 'admin.plugin.actived', 'Hoạt động', 'admin.plugin', 'vi'),
	(2268, 'admin.plugin.disabled', 'Bị tắt', 'admin.plugin', 'vi'),
	(2269, 'admin.plugin.not_install', 'Chưa cài đặt', 'admin.plugin', 'vi'),
	(2270, 'admin.plugin.auth', 'Tác giả', 'admin.plugin', 'vi'),
	(2271, 'admin.plugin.version', 'Phiên bản', 'admin.plugin', 'vi'),
	(2272, 'admin.plugin.link', 'Liên kết', 'admin.plugin', 'vi'),
	(2273, 'admin.plugin.image', 'Hình ảnh', 'admin.plugin', 'vi'),
	(2274, 'admin.plugin.empty', 'Chưa có extension nào!', 'admin.plugin', 'vi'),
	(2275, 'admin.plugin.local', 'Đã lưu trên máy', 'admin.plugin', 'vi'),
	(2276, 'admin.plugin.online', 'Tải từ thư viện', 'admin.plugin', 'vi'),
	(2277, 'admin.plugin.downloaded', 'Số lần tải', 'admin.plugin', 'vi'),
	(2278, 'admin.plugin.rated', 'Đánh giá', 'admin.plugin', 'vi'),
	(2279, 'admin.plugin.price', 'Giá', 'admin.plugin', 'vi'),
	(2280, 'admin.plugin.free', 'Miễn phí', 'admin.plugin', 'vi'),
	(2281, 'admin.plugin.date', 'Ngày tạo', 'admin.plugin', 'vi'),
	(2282, 'admin.plugin.located', 'Đã tải về', 'admin.plugin', 'vi'),
	(2283, 'admin.plugin.only_free', 'Là miễn phí', 'admin.plugin', 'vi'),
	(2284, 'admin.plugin.only_version', 'Cùng phiên bản', 'admin.plugin', 'vi'),
	(2285, 'admin.plugin.all_version', 'Tất cả phiên bản', 'admin.plugin', 'vi'),
	(2286, 'admin.plugin.sort_price_asc', 'Giá tăng', 'admin.plugin', 'vi'),
	(2287, 'admin.plugin.sort_price_desc', 'Giá giảm', 'admin.plugin', 'vi'),
	(2288, 'admin.plugin.sort_rating', 'Bình chọn', 'admin.plugin', 'vi'),
	(2289, 'admin.plugin.sort_download', 'Lượt tải', 'admin.plugin', 'vi'),
	(2290, 'admin.plugin.search_keyword', 'Từ khóa', 'admin.plugin', 'vi'),
	(2291, 'admin.plugin.enter_search_keyword', 'Nhập từ khóa', 'admin.plugin', 'vi'),
	(2292, 'admin.plugin.search_submit', 'Lọc kết quả', 'admin.plugin', 'vi'),
	(2293, 'admin.plugin.import', 'Import Plugin', 'admin.plugin', 'vi'),
	(2294, 'admin.plugin.file_format', 'File mẫu', 'admin.plugin', 'vi'),
	(2295, 'admin.plugin.choose_file', 'Chọn file', 'admin.plugin', 'vi'),
	(2296, 'admin.plugin.import_submit', 'Import', 'admin.plugin', 'vi'),
	(2297, 'admin.plugin.import_data', 'Import :data', 'admin.plugin', 'vi'),
	(2298, 'admin.plugin.import_note', 'Là file <span style="color:red">.zip</span>, dung lượng tối đa <span style="color:red">50MB</span>', 'admin.plugin', 'vi'),
	(2299, 'admin.plugin.error_unzip', 'Lỗi trong khi unzip', 'admin.plugin', 'vi'),
	(2300, 'admin.plugin.error_upload', 'Lỗi trong khi upload file', 'admin.plugin', 'vi'),
	(2301, 'admin.plugin.error_check_config', 'Không tìm thấy hoặc không thể đọc file config', 'admin.plugin', 'vi'),
	(2302, 'admin.plugin.error_config_format', 'File config không đúng định dạng', 'admin.plugin', 'vi'),
	(2303, 'admin.plugin.import_success', 'Import thành công!', 'admin.plugin', 'vi'),
	(2304, 'admin.plugin.error_exist', 'Plugin đã tồn tại!', 'admin.plugin', 'vi'),
	(2305, 'admin.plugin.plugin_import', '<a href="import" target=_new><span class="btn btn-success btn-flat"><i class="fa fa-floppy-o" aria-hidden="true"></i> Import Plugin</span></a>', 'admin.plugin', 'vi'),
	(2306, 'admin.plugin.plugin_more', '<a href="https://s-cart.org/vi/plugin.html" target=_new><i class="fa fa-download" aria-hidden="true"></i> Download đầy đủ Ở ĐÂY</a>', 'admin.plugin', 'vi'),
	(2307, 'admin.plugin.Shipping_plugin', 'Shipping extension', 'admin.plugin', 'en'),
	(2308, 'admin.plugin.Payment_plugin', 'Payment extension', 'admin.plugin', 'en'),
	(2309, 'admin.plugin.Total_plugin', 'Total extension', 'admin.plugin', 'en'),
	(2310, 'admin.plugin.Other_plugin', 'Other plugin', 'admin.plugin', 'en'),
	(2311, 'admin.plugin.Api_plugin', 'Module Api', 'admin.plugin', 'en'),
	(2312, 'admin.plugin.Cms_plugin', 'Cms plugins', 'admin.plugin', 'en'),
	(2313, 'admin.plugin.Block_plugin', 'Block plugins', 'admin.plugin', 'en'),
	(2314, 'admin.plugin.Shipping_plugin', 'Chức năng vận chuyển', 'admin.plugin', 'vi'),
	(2315, 'admin.plugin.Payment_plugin', 'Chức năng thanh toán', 'admin.plugin', 'vi'),
	(2316, 'admin.plugin.Total_plugin', 'Chức năng giá trị đơn hàng', 'admin.plugin', 'vi'),
	(2317, 'admin.plugin.Other_plugin', 'Chức năng khác', 'admin.plugin', 'vi'),
	(2318, 'admin.plugin.Cms_plugin', 'Module CMS', 'admin.plugin', 'vi'),
	(2319, 'admin.plugin.Api_plugin', 'Module Api', 'admin.plugin', 'vi'),
	(2320, 'admin.plugin.Block_plugin', 'Module Block', 'admin.plugin', 'vi'),
	(2321, 'admin.plugin.compatible', 'Compatible', 'admin.plugin', 'en'),
	(2322, 'admin.plugin.code', 'Code', 'admin.plugin', 'en'),
	(2323, 'admin.plugin.name', 'Name', 'admin.plugin', 'en'),
	(2324, 'admin.plugin.sort', 'Sort', 'admin.plugin', 'en'),
	(2325, 'admin.plugin.action', 'Action', 'admin.plugin', 'en'),
	(2326, 'admin.plugin.status', 'Status', 'admin.plugin', 'en'),
	(2327, 'admin.plugin.enable', 'Enable', 'admin.plugin', 'en'),
	(2328, 'admin.plugin.disable', 'Disable', 'admin.plugin', 'en'),
	(2329, 'admin.plugin.remove', 'Remove', 'admin.plugin', 'en'),
	(2330, 'admin.plugin.only_delete_data', 'Only remove data', 'admin.plugin', 'en'),
	(2331, 'admin.plugin.install', 'Install', 'admin.plugin', 'en'),
	(2332, 'admin.plugin.config', 'Config', 'admin.plugin', 'en'),
	(2333, 'admin.plugin.actived', 'Actived', 'admin.plugin', 'en'),
	(2334, 'admin.plugin.disabled', 'Disabled', 'admin.plugin', 'en'),
	(2335, 'admin.plugin.not_install', 'Not install', 'admin.plugin', 'en'),
	(2336, 'admin.plugin.auth', 'Auth', 'admin.plugin', 'en'),
	(2337, 'admin.plugin.version', 'Version', 'admin.plugin', 'en'),
	(2338, 'admin.plugin.link', 'Link', 'admin.plugin', 'en'),
	(2339, 'admin.plugin.image', 'Image', 'admin.plugin', 'en'),
	(2340, 'admin.plugin.empty', 'Empty extension!', 'admin.plugin', 'en'),
	(2341, 'admin.plugin.local', 'Save local', 'admin.plugin', 'en'),
	(2342, 'admin.plugin.online', 'From library', 'admin.plugin', 'en'),
	(2343, 'admin.plugin.downloaded', 'Downloaded', 'admin.plugin', 'en'),
	(2344, 'admin.plugin.rated', 'Rated', 'admin.plugin', 'en'),
	(2345, 'admin.plugin.price', 'Price', 'admin.plugin', 'en'),
	(2346, 'admin.plugin.free', 'Free', 'admin.plugin', 'en'),
	(2347, 'admin.plugin.date', 'Date', 'admin.plugin', 'en'),
	(2348, 'admin.plugin.located', 'Located', 'admin.plugin', 'en'),
	(2349, 'admin.plugin.only_free', 'Is free', 'admin.plugin', 'en'),
	(2350, 'admin.plugin.only_version', 'Only version', 'admin.plugin', 'en'),
	(2351, 'admin.plugin.all_version', 'All version', 'admin.plugin', 'en'),
	(2352, 'admin.plugin.sort_price_asc', 'Price asc', 'admin.plugin', 'en'),
	(2353, 'admin.plugin.sort_price_desc', 'Price desc', 'admin.plugin', 'en'),
	(2354, 'admin.plugin.sort_rating', 'Rating', 'admin.plugin', 'en'),
	(2355, 'admin.plugin.sort_download', 'Download', 'admin.plugin', 'en'),
	(2356, 'admin.plugin.search_keyword', 'Keyword', 'admin.plugin', 'en'),
	(2357, 'admin.plugin.enter_search_keyword', 'Enter keyword', 'admin.plugin', 'en'),
	(2358, 'admin.plugin.search_submit', 'Filter result', 'admin.plugin', 'en'),
	(2359, 'admin.plugin.import', 'Import Plugin', 'admin.plugin', 'en'),
	(2360, 'admin.plugin.file_format', 'File format', 'admin.plugin', 'en'),
	(2361, 'admin.plugin.choose_file', 'Choose File', 'admin.plugin', 'en'),
	(2362, 'admin.plugin.import_submit', 'Import', 'admin.plugin', 'en'),
	(2363, 'admin.plugin.import_data', 'Import :data', 'admin.plugin', 'en'),
	(2364, 'admin.plugin.import_note', 'File <span style="color:red">.zip</span>, max size is <span style="color:red">50MB</span>', 'admin.plugin', 'en'),
	(2365, 'admin.plugin.error_unzip', 'Error while unzip', 'admin.plugin', 'en'),
	(2366, 'admin.plugin.error_upload', 'Error while uploading file', 'admin.plugin', 'en'),
	(2367, 'admin.plugin.error_check_config', 'Cannot find config file', 'admin.plugin', 'en'),
	(2368, 'admin.plugin.error_config_format', 'The config file is not in the right format', 'admin.plugin', 'en'),
	(2369, 'admin.plugin.import_success', 'Import success!', 'admin.plugin', 'en'),
	(2370, 'admin.plugin.error_exist', 'Plugin exist!', 'admin.plugin', 'en'),
	(2371, 'admin.plugin.plugin_import', '<a href="import" target=_new><span class="btn btn-success btn-flat"><i class="fa fa-floppy-o" aria-hidden="true"></i> Import Plugin</span></a>', 'admin.plugin', 'en'),
	(2372, 'admin.plugin.plugin_more', '<a href="https://s-cart.org/en/plugin.html" target=_new><i class="fa fa-download" aria-hidden="true"></i> Download more HERE</a>', 'admin.plugin', 'en'),
	(2373, 'admin.plugin.install_success', 'Installed successfully', 'admin.plugin', 'en'),
	(2374, 'admin.plugin.install_faild', 'Installation failed', 'admin.plugin', 'en'),
	(2375, 'admin.plugin.table_exist', 'Table :table already exists', 'admin.plugin', 'en'),
	(2376, 'admin.plugin.plugin_exist', 'This plugin already exists', 'admin.plugin', 'en'),
	(2377, 'admin.plugin.action_error', 'There was an error while :action', 'admin.plugin', 'en'),
	(2378, 'admin.plugin.install_success', 'Cài đặt thành công', 'admin.plugin', 'vi'),
	(2379, 'admin.plugin.install_faild', 'Cài đặt thất bại', 'admin.plugin', 'vi'),
	(2380, 'admin.plugin.table_exist', 'Bảng :table đã tồn tại rồi', 'admin.plugin', 'vi'),
	(2381, 'admin.plugin.plugin_exist', 'Plugin này đã tồn tại rồi', 'admin.plugin', 'vi'),
	(2382, 'admin.plugin.action_error', 'Có lỗi trong khi :action', 'admin.plugin', 'vi'),
	(2383, 'admin.chart.static_month', 'Thống kê trong 12 tháng', 'admin.chart', 'vi'),
	(2384, 'admin.chart.static_30_day', 'Thống kê trong 1 tháng', 'admin.chart', 'vi'),
	(2385, 'admin.chart.static_month_help', 'Dữ liệu so sánh bằng tổng số tiền của đơn hàng, đơn vị Bit', 'admin.chart', 'vi'),
	(2386, 'admin.chart.amount', 'Tổng số tiền (Bit)', 'admin.chart', 'vi'),
	(2387, 'admin.chart.order', 'Tổng đơn hàng', 'admin.chart', 'vi'),
	(2388, 'admin.chart.static_country', 'Đơn hàng theo quốc gia', 'admin.chart', 'vi'),
	(2389, 'admin.chart.country', 'Quốc gia', 'admin.chart', 'vi'),
	(2390, 'admin.chart.static_month', 'Statistics for 12 months', 'admin.chart', 'en'),
	(2391, 'admin.chart.static_30_day', 'Statistics for 30 days', 'admin.chart', 'en'),
	(2392, 'admin.chart.static_month_help', 'The comparison data is equal to the total amount of the order and the Bit units', 'admin.chart', 'en'),
	(2393, 'admin.chart.amount', 'Total amount (Bit)', 'admin.chart', 'en'),
	(2394, 'admin.chart.order', 'Total order', 'admin.chart', 'en'),
	(2395, 'admin.chart.static_country', 'Statistics of orders by country', 'admin.chart', 'en'),
	(2396, 'admin.chart.country', 'Country', 'admin.chart', 'en'),
	(2397, 'admin.chart.static_device', 'Statistics of orders by device', 'admin.chart', 'en'),
	(2398, 'admin.chart.static_device', 'Thống kê đơn hàng theo thiết bị', 'admin.chart', 'vi'),
	(2399, 'admin.chart.device', 'Device type', 'admin.chart', 'en'),
	(2400, 'admin.chart.device', 'Loại thiết bị', 'admin.chart', 'vi'),
	(2401, 'admin.maintain.title', 'Maintenance page', 'admin.maintain', 'en'),
	(2402, 'admin.maintain.content', 'Maintenance content of the store', 'admin.maintain', 'en'),
	(2403, 'admin.maintain.description', 'Description', 'admin.maintain', 'en'),
	(2404, 'admin.maintain.description_note', 'Maintenance note', 'admin.maintain', 'en'),
	(2405, 'admin.maintain.title', 'Trang bảo trì', 'admin.maintain', 'vi'),
	(2406, 'admin.maintain.content', 'Nội dung bảo trì của cửa hàng', 'admin.maintain', 'vi'),
	(2407, 'admin.maintain.description', 'Nội dung', 'admin.maintain', 'vi'),
	(2408, 'admin.maintain.description_note', 'Ghi chú bảo trì', 'admin.maintain', 'vi'),
	(2409, 'admin.seo.config', 'Cấu hình SEO', 'admin.seo', 'vi'),
	(2410, 'admin.seo.config', 'SEO config', 'admin.seo', 'en'),
	(2411, 'admin.seo.url_seo_lang', 'Thêm ngôn ngữ trên URL', 'admin.seo', 'vi'),
	(2412, 'admin.seo.url_seo_lang', 'Add language on URL', 'admin.seo', 'en'),
	(2413, 'admin.dashboard.total_order', 'Tổng đơn hàng', 'admin.dashboard', 'vi'),
	(2414, 'admin.dashboard.total_order', 'Order total', 'admin.dashboard', 'en'),
	(2415, 'admin.dashboard.total_product', 'Tổng sản phẩm', 'admin.dashboard', 'vi'),
	(2416, 'admin.dashboard.total_product', 'Product total', 'admin.dashboard', 'en'),
	(2417, 'admin.dashboard.total_customer', 'Tổng khách hàng', 'admin.dashboard', 'vi'),
	(2418, 'admin.dashboard.total_customer', 'Customer total', 'admin.dashboard', 'en'),
	(2419, 'admin.dashboard.total_blog', 'Tổng blog', 'admin.dashboard', 'vi'),
	(2420, 'admin.dashboard.total_blog', 'Blog total', 'admin.dashboard', 'en'),
	(2421, 'admin.dashboard.order_month', 'Đơn hàng trong tháng', 'admin.dashboard', 'vi'),
	(2422, 'admin.dashboard.order_month', 'Order in month', 'admin.dashboard', 'en'),
	(2423, 'admin.dashboard.order_year', 'Đơn hàng trong năm', 'admin.dashboard', 'vi'),
	(2424, 'admin.dashboard.order_year', 'Order in year', 'admin.dashboard', 'en'),
	(2425, 'admin.dashboard.top_order_new', 'Đơn hàng mới', 'admin.dashboard', 'vi'),
	(2426, 'admin.dashboard.top_order_new', 'New orders', 'admin.dashboard', 'en'),
	(2427, 'admin.dashboard.top_customer_new', 'Khách hàng mới mới', 'admin.dashboard', 'vi'),
	(2428, 'admin.dashboard.top_customer_new', 'New customers', 'admin.dashboard', 'en'),
	(2429, 'admin.layout_page_position.all', 'All Page', 'admin.layout_page_position', 'en'),
	(2430, 'admin.layout_page_position.home', 'Home page', 'admin.layout_page_position', 'en'),
	(2431, 'admin.layout_page_position.shop_home', 'Home shop', 'admin.layout_page_position', 'en'),
	(2432, 'admin.layout_page_position.store_home', 'Store: home', 'admin.layout_page_position', 'en'),
	(2433, 'admin.layout_page_position.store_product_list', 'Store: product list', 'admin.layout_page_position', 'en'),
	(2434, 'admin.layout_page_position.product_list', 'List: product', 'admin.layout_page_position', 'en'),
	(2435, 'admin.layout_page_position.product_detail', 'Detail: product', 'admin.layout_page_position', 'en'),
	(2436, 'admin.layout_page_position.shop_cart', 'Cart: cart, wishlist, compare, checkout', 'admin.layout_page_position', 'en'),
	(2437, 'admin.layout_page_position.shop_auth', 'Auth: login, forgot, register', 'admin.layout_page_position', 'en'),
	(2438, 'admin.layout_page_position.shop_profile', 'Customer profile', 'admin.layout_page_position', 'en'),
	(2439, 'admin.layout_page_position.item_list', 'List: category, brand, supplier', 'admin.layout_page_position', 'en'),
	(2440, 'admin.layout_page_position.item_detail', 'Detail: item', 'admin.layout_page_position', 'en'),
	(2441, 'admin.layout_page_position.news_list', 'List:  Blog/news', 'admin.layout_page_position', 'en'),
	(2442, 'admin.layout_page_position.news_detail', 'Detail: entry Blog', 'admin.layout_page_position', 'en'),
	(2443, 'admin.layout_page_position.content_list', 'List: content CMS', 'admin.layout_page_position', 'en'),
	(2444, 'admin.layout_page_position.content_detail', 'Detail: entry CMS', 'admin.layout_page_position', 'en'),
	(2445, 'admin.layout_page_position.shop_contact', 'Page contact', 'admin.layout_page_position', 'en'),
	(2446, 'admin.layout_page_position.shop_page', 'Other page: about...', 'admin.layout_page_position', 'en'),
	(2447, 'admin.layout_page_position.all', 'Tất cả trang', 'admin.layout_page_position', 'vi'),
	(2448, 'admin.layout_page_position.home', 'Trang chủ', 'admin.layout_page_position', 'vi'),
	(2449, 'admin.layout_page_position.shop_home', 'Trang chủ Shop', 'admin.layout_page_position', 'vi'),
	(2450, 'admin.layout_page_position.store_home', 'Cửa hàng: trang chủ', 'admin.layout_page_position', 'vi'),
	(2451, 'admin.layout_page_position.store_product_list', 'Cửa hàng: danh sách sản phẩm', 'admin.layout_page_position', 'vi'),
	(2452, 'admin.layout_page_position.product_list', 'Danh sách: sản phẩm', 'admin.layout_page_position', 'vi'),
	(2453, 'admin.layout_page_position.product_detail', 'Chi tiết: sản phẩm', 'admin.layout_page_position', 'vi'),
	(2454, 'admin.layout_page_position.shop_cart', 'Giỏ hàng: giỏ hàng, wishlist, compare, checkout', 'admin.layout_page_position', 'vi'),
	(2455, 'admin.layout_page_position.shop_auth', 'Chứng thực: đăng nhập, đăng ký, quên mật khẩu', 'admin.layout_page_position', 'vi'),
	(2456, 'admin.layout_page_position.shop_profile', 'Tài khoản khách hàng', 'admin.layout_page_position', 'vi'),
	(2457, 'admin.layout_page_position.item_list', 'Danh sách item: danh mục, nhãn hiệu, nhà cung cấp', 'admin.layout_page_position', 'vi'),
	(2458, 'admin.layout_page_position.item_detail', 'Chi tiết: item', 'admin.layout_page_position', 'vi'),
	(2459, 'admin.layout_page_position.news_list', 'Danh sách: bài viết Blog', 'admin.layout_page_position', 'vi'),
	(2460, 'admin.layout_page_position.news_detail', 'Chi tiết: bài viết Blog', 'admin.layout_page_position', 'vi'),
	(2461, 'admin.layout_page_position.content_list', 'Danh sách: bài viết CMS', 'admin.layout_page_position', 'vi'),
	(2462, 'admin.layout_page_position.content_detail', 'Chi tiết: bài viết CMS', 'admin.layout_page_position', 'vi'),
	(2463, 'admin.layout_page_position.shop_contact', 'Trang liên hệ', 'admin.layout_page_position', 'vi'),
	(2464, 'admin.layout_page_position.shop_page', 'Các trang viết: giới thiệu...', 'admin.layout_page_position', 'vi'),
	(2465, 'admin.layout_page_block.header', 'Head code :meta, css, javascript,...', 'admin.layout_page_block', 'vi'),
	(2466, 'admin.layout_page_block.top', 'Block Top', 'admin.layout_page_block', 'vi'),
	(2467, 'admin.layout_page_block.bottom', 'Block Bottom', 'admin.layout_page_block', 'vi'),
	(2468, 'admin.layout_page_block.left', 'BlockLeft - Cột trái', 'admin.layout_page_block', 'vi'),
	(2469, 'admin.layout_page_block.right', 'Block Right - Cột phải', 'admin.layout_page_block', 'vi'),
	(2470, 'admin.layout_page_block.banner_top', 'Block banner top', 'admin.layout_page_block', 'vi'),
	(2471, 'admin.layout_page_block.header', 'Head code: meta, css, javascript, ...', 'admin.layout_page_block', 'en'),
	(2472, 'admin.layout_page_block.top', 'Block Top', 'admin.layout_page_block', 'en'),
	(2473, 'admin.layout_page_block.bottom', 'Block Bottom', 'admin.layout_page_block', 'en'),
	(2474, 'admin.layout_page_block.left', 'Block Left', 'admin.layout_page_block', 'en'),
	(2475, 'admin.layout_page_block.right', 'Block Right', 'admin.layout_page_block', 'en'),
	(2476, 'admin.layout_page_block.banner_top', 'Block banner top', 'admin.layout_page_block', 'en'),
	(2477, 'admin.admin_custom_config.facebook_url', 'Facebook Url', 'admin.admin_custom_config', 'en'),
	(2478, 'admin.admin_custom_config.fanpage_url', 'Fanpage Url', 'admin.admin_custom_config', 'en'),
	(2479, 'admin.admin_custom_config.twitter_url', 'Twitter Url', 'admin.admin_custom_config', 'en'),
	(2480, 'admin.admin_custom_config.instagram_url', 'Instagram Url', 'admin.admin_custom_config', 'en'),
	(2481, 'admin.admin_custom_config.youtube_url', 'Youtube Url', 'admin.admin_custom_config', 'en'),
	(2482, 'admin.admin_custom_config.facebook_url', 'Facebook Url', 'admin.admin_custom_config', 'vi'),
	(2483, 'admin.admin_custom_config.fanpage_url', 'Fanpage Url', 'admin.admin_custom_config', 'vi'),
	(2484, 'admin.admin_custom_config.twitter_url', 'Twitter Url', 'admin.admin_custom_config', 'vi'),
	(2485, 'admin.admin_custom_config.instagram_url', 'Instagram Url', 'admin.admin_custom_config', 'vi'),
	(2486, 'admin.admin_custom_config.youtube_url', 'Youtube Url', 'admin.admin_custom_config', 'vi');
/*!40000 ALTER TABLE `sc_languages` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_attribute_group
DROP TABLE IF EXISTS `sc_shop_attribute_group`;
CREATE TABLE IF NOT EXISTS `sc_shop_attribute_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'radio,select,checkbox',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_attribute_group: ~2 rows (approximately)
DELETE FROM `sc_shop_attribute_group`;
/*!40000 ALTER TABLE `sc_shop_attribute_group` DISABLE KEYS */;
INSERT INTO `sc_shop_attribute_group` (`id`, `name`, `status`, `sort`, `type`) VALUES
	(1, 'Color', 1, 1, 'radio'),
	(2, 'Size', 1, 2, 'select');
/*!40000 ALTER TABLE `sc_shop_attribute_group` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_banner
DROP TABLE IF EXISTS `sc_shop_banner`;
CREATE TABLE IF NOT EXISTS `sc_shop_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `click` int(11) NOT NULL DEFAULT 0,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_shop_banner_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_banner: ~4 rows (approximately)
DELETE FROM `sc_shop_banner`;
/*!40000 ALTER TABLE `sc_shop_banner` DISABLE KEYS */;
INSERT INTO `sc_shop_banner` (`id`, `title`, `image`, `url`, `target`, `html`, `status`, `sort`, `click`, `type`, `created_at`, `updated_at`) VALUES
	(1, 'Banner 1', '/data/banner/Main-banner-1-1903x600.jpg', NULL, '_self', '<h1 class="swiper-title-1" data-caption-animate="fadeScale" data-caption-delay="100">Top-notch Furniture</h1><p class="biggest text-white-70" data-caption-animate="fadeScale" data-caption-delay="200">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class="button-wrap" data-caption-animate="fadeInUp" data-caption-delay="300"> <span class="button button-zachem-tak-delat button-white button-zakaria"> Shop now</span> </div>', 1, 0, 0, 'banner', NULL, NULL),
	(2, 'Banner 2', '/data/banner/Main-banner-3-1903x600.jpg', NULL, '_self', '<h1 class="swiper-title-1" data-caption-animate="fadeScale" data-caption-delay="100">Top-notch Furniture</h1><p class="biggest text-white-70" data-caption-animate="fadeScale" data-caption-delay="200">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class="button-wrap" data-caption-animate="fadeInUp" data-caption-delay="300"> <span class="button button-zachem-tak-delat button-white button-zakaria"> Shop now</span> </div>', 1, 0, 0, 'banner', NULL, NULL),
	(3, 'Banner 3', '/data/banner/bgbr.jpg', NULL, '_self', '', 1, 0, 0, 'breadcrumb', NULL, NULL),
	(4, 'Banner 4', '/data/banner/store-1.jpg', NULL, '_self', '', 1, 0, 0, 'banner-store', NULL, NULL);
/*!40000 ALTER TABLE `sc_shop_banner` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_banner_store
DROP TABLE IF EXISTS `sc_shop_banner_store`;
CREATE TABLE IF NOT EXISTS `sc_shop_banner_store` (
  `banner_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`banner_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_banner_store: ~4 rows (approximately)
DELETE FROM `sc_shop_banner_store`;
/*!40000 ALTER TABLE `sc_shop_banner_store` DISABLE KEYS */;
INSERT INTO `sc_shop_banner_store` (`banner_id`, `store_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1);
/*!40000 ALTER TABLE `sc_shop_banner_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_banner_type
DROP TABLE IF EXISTS `sc_shop_banner_type`;
CREATE TABLE IF NOT EXISTS `sc_shop_banner_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_banner_type_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_banner_type: ~5 rows (approximately)
DELETE FROM `sc_shop_banner_type`;
/*!40000 ALTER TABLE `sc_shop_banner_type` DISABLE KEYS */;
INSERT INTO `sc_shop_banner_type` (`id`, `code`, `name`) VALUES
	(1, 'banner', 'Banner website'),
	(2, 'background', 'Background website'),
	(3, 'breadcrumb', 'Breadcrumb website'),
	(4, 'banner-store', 'Banner store'),
	(5, 'other', 'Other');
/*!40000 ALTER TABLE `sc_shop_banner_type` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_brand
DROP TABLE IF EXISTS `sc_shop_brand`;
CREATE TABLE IF NOT EXISTS `sc_shop_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sc_shop_brand_alias_index` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_brand: ~8 rows (approximately)
DELETE FROM `sc_shop_brand`;
/*!40000 ALTER TABLE `sc_shop_brand` DISABLE KEYS */;
INSERT INTO `sc_shop_brand` (`id`, `name`, `alias`, `image`, `url`, `status`, `sort`) VALUES
	(1, 'Husq', 'husq', '/data/brand/01-181x52.png', '', 1, 0),
	(2, 'Ideal', 'ideal', '/data/brand/02-181x52.png', '', 1, 0),
	(3, 'Apex', 'apex', '/data/brand/03-181x52.png', '', 1, 0),
	(4, 'CST', 'cst', '/data/brand/04-181x52.png', '', 1, 0),
	(5, 'Klein', 'klein', '/data/brand/05-181x52.png', '', 1, 0),
	(6, 'Metabo', 'metabo', '/data/brand/06-181x52.png', '', 1, 0),
	(7, 'Avatar', 'avatar', '/data/brand/07-181x52.png', '', 1, 0),
	(8, 'Brand KA', 'brand-ka', '/data/brand/08-181x52.png', '', 1, 0);
/*!40000 ALTER TABLE `sc_shop_brand` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_brand_store
DROP TABLE IF EXISTS `sc_shop_brand_store`;
CREATE TABLE IF NOT EXISTS `sc_shop_brand_store` (
  `brand_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_brand_store: ~8 rows (approximately)
DELETE FROM `sc_shop_brand_store`;
/*!40000 ALTER TABLE `sc_shop_brand_store` DISABLE KEYS */;
INSERT INTO `sc_shop_brand_store` (`brand_id`, `store_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1);
/*!40000 ALTER TABLE `sc_shop_brand_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_category
DROP TABLE IF EXISTS `sc_shop_category`;
CREATE TABLE IF NOT EXISTS `sc_shop_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `top` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sc_shop_category_alias_index` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_category: ~13 rows (approximately)
DELETE FROM `sc_shop_category`;
/*!40000 ALTER TABLE `sc_shop_category` DISABLE KEYS */;
INSERT INTO `sc_shop_category` (`id`, `image`, `alias`, `parent`, `top`, `status`, `sort`) VALUES
	(1, '/data/category/img-40.jpg', 'electronics', 0, 1, 1, 0),
	(2, '/data/category/img-44.jpg', 'clothing-wears', 0, 1, 1, 0),
	(3, '/data/category/img-42.jpg', 'mobile', 1, 1, 1, 0),
	(4, '/data/category/img-18.jpg', 'accessaries-extras', 0, 1, 1, 0),
	(5, '/data/category/img-14.jpg', 'computers', 1, 1, 1, 0),
	(6, '/data/category/img-14.jpg', 'tablets', 1, 0, 1, 0),
	(7, '/data/category/img-40.jpg', 'appliances', 1, 0, 1, 0),
	(8, '/data/category/img-14.jpg', 'men-clothing', 2, 0, 1, 0),
	(9, '/data/category/img-18.jpg', 'women-clothing', 2, 1, 1, 0),
	(10, '/data/category/img-14.jpg', 'kid-wear', 2, 0, 1, 0),
	(11, '/data/category/img-40.jpg', 'mobile-accessaries', 4, 0, 1, 0),
	(12, '/data/category/img-42.jpg', 'women-accessaries', 4, 0, 1, 3),
	(13, '/data/category/img-40.jpg', 'men-accessaries', 4, 0, 1, 3);
/*!40000 ALTER TABLE `sc_shop_category` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_category_description
DROP TABLE IF EXISTS `sc_shop_category_description`;
CREATE TABLE IF NOT EXISTS `sc_shop_category_description` (
  `category_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `sc_shop_category_description_category_id_lang_unique` (`category_id`,`lang`),
  KEY `sc_shop_category_description_lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_category_description: ~26 rows (approximately)
DELETE FROM `sc_shop_category_description`;
/*!40000 ALTER TABLE `sc_shop_category_description` DISABLE KEYS */;
INSERT INTO `sc_shop_category_description` (`category_id`, `lang`, `title`, `keyword`, `description`) VALUES
	(1, 'en', 'Electronics', '', ''),
	(1, 'vi', 'Thiết bị điện tử', '', ''),
	(2, 'en', 'Clothing & Wears', '', ''),
	(2, 'vi', 'Quần áo', '', ''),
	(3, 'en', 'Mobile', '', ''),
	(3, 'vi', 'Điện thoại', '', ''),
	(4, 'en', 'Accessaries & Extras', '', ''),
	(4, 'vi', 'Phụ kiện ', '', ''),
	(5, 'en', 'Computers', '', ''),
	(5, 'vi', 'Máy tính', '', ''),
	(6, 'en', 'Tablets', '', ''),
	(6, 'vi', 'Máy tính bảng', '', ''),
	(7, 'en', 'Appliances', '', ''),
	(7, 'vi', 'Thiết bị', '', ''),
	(8, 'en', 'Men Clothing', '', ''),
	(8, 'vi', 'Quần áo nam', '', ''),
	(9, 'en', 'Women Clothing', '', ''),
	(9, 'vi', 'Quần áo nữ', '', ''),
	(10, 'en', 'Kid Wear', '', ''),
	(10, 'vi', 'Đồ trẻ em', '', ''),
	(11, 'en', 'Mobile Accessaries', '', ''),
	(11, 'vi', 'Phụ kiện điện thoại', '', ''),
	(12, 'en', 'Women Accessaries', '', ''),
	(12, 'vi', 'Phụ kiện nữ', '', ''),
	(13, 'en', 'Men Accessaries', '', ''),
	(13, 'vi', 'Phụ kiện nam', '', '');
/*!40000 ALTER TABLE `sc_shop_category_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_category_store
DROP TABLE IF EXISTS `sc_shop_category_store`;
CREATE TABLE IF NOT EXISTS `sc_shop_category_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_category_store: ~13 rows (approximately)
DELETE FROM `sc_shop_category_store`;
/*!40000 ALTER TABLE `sc_shop_category_store` DISABLE KEYS */;
INSERT INTO `sc_shop_category_store` (`category_id`, `store_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1);
/*!40000 ALTER TABLE `sc_shop_category_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_country
DROP TABLE IF EXISTS `sc_shop_country`;
CREATE TABLE IF NOT EXISTS `sc_shop_country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_country_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_country: ~245 rows (approximately)
DELETE FROM `sc_shop_country`;
/*!40000 ALTER TABLE `sc_shop_country` DISABLE KEYS */;
INSERT INTO `sc_shop_country` (`id`, `code`, `name`) VALUES
	(1, 'AL', 'Albania'),
	(2, 'DZ', 'Algeria'),
	(3, 'DS', 'American Samoa'),
	(4, 'AD', 'Andorra'),
	(5, 'AO', 'Angola'),
	(6, 'AI', 'Anguilla'),
	(7, 'AQ', 'Antarctica'),
	(8, 'AG', 'Antigua and Barbuda'),
	(9, 'AR', 'Argentina'),
	(10, 'AM', 'Armenia'),
	(11, 'AW', 'Aruba'),
	(12, 'AU', 'Australia'),
	(13, 'AT', 'Austria'),
	(14, 'AZ', 'Azerbaijan'),
	(15, 'BS', 'Bahamas'),
	(16, 'BH', 'Bahrain'),
	(17, 'BD', 'Bangladesh'),
	(18, 'BB', 'Barbados'),
	(19, 'BY', 'Belarus'),
	(20, 'BE', 'Belgium'),
	(21, 'BZ', 'Belize'),
	(22, 'BJ', 'Benin'),
	(23, 'BM', 'Bermuda'),
	(24, 'BT', 'Bhutan'),
	(25, 'BO', 'Bolivia'),
	(26, 'BA', 'Bosnia and Herzegovina'),
	(27, 'BW', 'Botswana'),
	(28, 'BV', 'Bouvet Island'),
	(29, 'BR', 'Brazil'),
	(30, 'IO', 'British Indian Ocean Territory'),
	(31, 'BN', 'Brunei Darussalam'),
	(32, 'BG', 'Bulgaria'),
	(33, 'BF', 'Burkina Faso'),
	(34, 'BI', 'Burundi'),
	(35, 'KH', 'Cambodia'),
	(36, 'CM', 'Cameroon'),
	(37, 'CA', 'Canada'),
	(38, 'CV', 'Cape Verde'),
	(39, 'KY', 'Cayman Islands'),
	(40, 'CF', 'Central African Republic'),
	(41, 'TD', 'Chad'),
	(42, 'CL', 'Chile'),
	(43, 'CN', 'China'),
	(44, 'CX', 'Christmas Island'),
	(45, 'CC', 'Cocos (Keeling) Islands'),
	(46, 'CO', 'Colombia'),
	(47, 'KM', 'Comoros'),
	(48, 'CG', 'Congo'),
	(49, 'CK', 'Cook Islands'),
	(50, 'CR', 'Costa Rica'),
	(51, 'HR', 'Croatia (Hrvatska)'),
	(52, 'CU', 'Cuba'),
	(53, 'CY', 'Cyprus'),
	(54, 'CZ', 'Czech Republic'),
	(55, 'DK', 'Denmark'),
	(56, 'DJ', 'Djibouti'),
	(57, 'DM', 'Dominica'),
	(58, 'DO', 'Dominican Republic'),
	(59, 'TP', 'East Timor'),
	(60, 'EC', 'Ecuador'),
	(61, 'EG', 'Egypt'),
	(62, 'SV', 'El Salvador'),
	(63, 'GQ', 'Equatorial Guinea'),
	(64, 'ER', 'Eritrea'),
	(65, 'EE', 'Estonia'),
	(66, 'ET', 'Ethiopia'),
	(67, 'FK', 'Falkland Islands (Malvinas)'),
	(68, 'FO', 'Faroe Islands'),
	(69, 'FJ', 'Fiji'),
	(70, 'FI', 'Finland'),
	(71, 'FR', 'France'),
	(72, 'FX', 'France, Metropolitan'),
	(73, 'GF', 'French Guiana'),
	(74, 'PF', 'French Polynesia'),
	(75, 'TF', 'French Southern Territories'),
	(76, 'GA', 'Gabon'),
	(77, 'GM', 'Gambia'),
	(78, 'GE', 'Georgia'),
	(79, 'DE', 'Germany'),
	(80, 'GH', 'Ghana'),
	(81, 'GI', 'Gibraltar'),
	(82, 'GK', 'Guernsey'),
	(83, 'GR', 'Greece'),
	(84, 'GL', 'Greenland'),
	(85, 'GD', 'Grenada'),
	(86, 'GP', 'Guadeloupe'),
	(87, 'GU', 'Guam'),
	(88, 'GT', 'Guatemala'),
	(89, 'GN', 'Guinea'),
	(90, 'GW', 'Guinea-Bissau'),
	(91, 'GY', 'Guyana'),
	(92, 'HT', 'Haiti'),
	(93, 'HM', 'Heard and Mc Donald Islands'),
	(94, 'HN', 'Honduras'),
	(95, 'HK', 'Hong Kong'),
	(96, 'HU', 'Hungary'),
	(97, 'IS', 'Iceland'),
	(98, 'IN', 'India'),
	(99, 'IM', 'Isle of Man'),
	(100, 'ID', 'Indonesia'),
	(101, 'IR', 'Iran (Islamic Republic of)'),
	(102, 'IQ', 'Iraq'),
	(103, 'IE', 'Ireland'),
	(104, 'IL', 'Israel'),
	(105, 'IT', 'Italy'),
	(106, 'CI', 'Ivory Coast'),
	(107, 'JE', 'Jersey'),
	(108, 'JM', 'Jamaica'),
	(109, 'JP', 'Japan'),
	(110, 'JO', 'Jordan'),
	(111, 'KZ', 'Kazakhstan'),
	(112, 'KE', 'Kenya'),
	(113, 'KI', 'Kiribati'),
	(114, 'KP', 'Korea,Democratic Peoples Republic of'),
	(115, 'KR', 'Korea, Republic of'),
	(116, 'XK', 'Kosovo'),
	(117, 'KW', 'Kuwait'),
	(118, 'KG', 'Kyrgyzstan'),
	(119, 'LA', 'Lao Peoples Democratic Republic'),
	(120, 'LV', 'Latvia'),
	(121, 'LB', 'Lebanon'),
	(122, 'LS', 'Lesotho'),
	(123, 'LR', 'Liberia'),
	(124, 'LY', 'Libyan Arab Jamahiriya'),
	(125, 'LI', 'Liechtenstein'),
	(126, 'LT', 'Lithuania'),
	(127, 'LU', 'Luxembourg'),
	(128, 'MO', 'Macau'),
	(129, 'MK', 'Macedonia'),
	(130, 'MG', 'Madagascar'),
	(131, 'MW', 'Malawi'),
	(132, 'MY', 'Malaysia'),
	(133, 'MV', 'Maldives'),
	(134, 'ML', 'Mali'),
	(135, 'MT', 'Malta'),
	(136, 'MH', 'Marshall Islands'),
	(137, 'MQ', 'Martinique'),
	(138, 'MR', 'Mauritania'),
	(139, 'MU', 'Mauritius'),
	(140, 'TY', 'Mayotte'),
	(141, 'MX', 'Mexico'),
	(142, 'FM', 'Micronesia, Federated States of'),
	(143, 'MD', 'Moldova, Republic of'),
	(144, 'MC', 'Monaco'),
	(145, 'MN', 'Mongolia'),
	(146, 'ME', 'Montenegro'),
	(147, 'MS', 'Montserrat'),
	(148, 'MA', 'Morocco'),
	(149, 'MZ', 'Mozambique'),
	(150, 'MM', 'Myanmar'),
	(151, 'NA', 'Namibia'),
	(152, 'NR', 'Nauru'),
	(153, 'NP', 'Nepal'),
	(154, 'NL', 'Netherlands'),
	(155, 'AN', 'Netherlands Antilles'),
	(156, 'NC', 'New Caledonia'),
	(157, 'NZ', 'New Zealand'),
	(158, 'NI', 'Nicaragua'),
	(159, 'NE', 'Niger'),
	(160, 'NG', 'Nigeria'),
	(161, 'NU', 'Niue'),
	(162, 'NF', 'Norfolk Island'),
	(163, 'MP', 'Northern Mariana Islands'),
	(164, 'NO', 'Norway'),
	(165, 'OM', 'Oman'),
	(166, 'PK', 'Pakistan'),
	(167, 'PW', 'Palau'),
	(168, 'PS', 'Palestine'),
	(169, 'PA', 'Panama'),
	(170, 'PG', 'Papua New Guinea'),
	(171, 'PY', 'Paraguay'),
	(172, 'PE', 'Peru'),
	(173, 'PH', 'Philippines'),
	(174, 'PN', 'Pitcairn'),
	(175, 'PL', 'Poland'),
	(176, 'PT', 'Portugal'),
	(177, 'PR', 'Puerto Rico'),
	(178, 'QA', 'Qatar'),
	(179, 'RE', 'Reunion'),
	(180, 'RO', 'Romania'),
	(181, 'RU', 'Russian Federation'),
	(182, 'RW', 'Rwanda'),
	(183, 'KN', 'Saint Kitts and Nevis'),
	(184, 'LC', 'Saint Lucia'),
	(185, 'VC', 'Saint Vincent and the Grenadines'),
	(186, 'WS', 'Samoa'),
	(187, 'SM', 'San Marino'),
	(188, 'ST', 'Sao Tome and Principe'),
	(189, 'SA', 'Saudi Arabia'),
	(190, 'SN', 'Senegal'),
	(191, 'RS', 'Serbia'),
	(192, 'SC', 'Seychelles'),
	(193, 'SL', 'Sierra Leone'),
	(194, 'SG', 'Singapore'),
	(195, 'SK', 'Slovakia'),
	(196, 'SI', 'Slovenia'),
	(197, 'SB', 'Solomon Islands'),
	(198, 'SO', 'Somalia'),
	(199, 'ZA', 'South Africa'),
	(200, 'GS', 'South Georgia South Sandwich Islands'),
	(201, 'SS', 'South Sudan'),
	(202, 'ES', 'Spain'),
	(203, 'LK', 'Sri Lanka'),
	(204, 'SH', 'St. Helena'),
	(205, 'PM', 'St. Pierre and Miquelon'),
	(206, 'SD', 'Sudan'),
	(207, 'SR', 'Suriname'),
	(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
	(209, 'SZ', 'Swaziland'),
	(210, 'SE', 'Sweden'),
	(211, 'CH', 'Switzerland'),
	(212, 'SY', 'Syrian Arab Republic'),
	(213, 'TW', 'Taiwan'),
	(214, 'TJ', 'Tajikistan'),
	(215, 'TZ', 'Tanzania, United Republic of'),
	(216, 'TH', 'Thailand'),
	(217, 'TG', 'Togo'),
	(218, 'TK', 'Tokelau'),
	(219, 'TO', 'Tonga'),
	(220, 'TT', 'Trinidad and Tobago'),
	(221, 'TN', 'Tunisia'),
	(222, 'TR', 'Turkey'),
	(223, 'TM', 'Turkmenistan'),
	(224, 'TC', 'Turks and Caicos Islands'),
	(225, 'TV', 'Tuvalu'),
	(226, 'UG', 'Uganda'),
	(227, 'UA', 'Ukraine'),
	(228, 'AE', 'United Arab Emirates'),
	(229, 'GB', 'United Kingdom'),
	(230, 'US', 'United States'),
	(231, 'UM', 'United States minor outlying islands'),
	(232, 'UY', 'Uruguay'),
	(233, 'UZ', 'Uzbekistan'),
	(234, 'VU', 'Vanuatu'),
	(235, 'VA', 'Vatican City State'),
	(236, 'VE', 'Venezuela'),
	(237, 'VN', 'Vietnam'),
	(238, 'VG', 'Virgin Islands (British)'),
	(239, 'VI', 'Virgin Islands (U.S.)'),
	(240, 'WF', 'Wallis and Futuna Islands'),
	(241, 'EH', 'Western Sahara'),
	(242, 'YE', 'Yemen'),
	(243, 'ZR', 'Zaire'),
	(244, 'ZM', 'Zambia'),
	(245, 'ZW', 'Zimbabwe');
/*!40000 ALTER TABLE `sc_shop_country` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_currency
DROP TABLE IF EXISTS `sc_shop_currency`;
CREATE TABLE IF NOT EXISTS `sc_shop_currency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) NOT NULL,
  `precision` tinyint(4) NOT NULL DEFAULT 2,
  `symbol_first` tinyint(4) NOT NULL DEFAULT 0,
  `thousands` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_currency_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_currency: ~2 rows (approximately)
DELETE FROM `sc_shop_currency`;
/*!40000 ALTER TABLE `sc_shop_currency` DISABLE KEYS */;
INSERT INTO `sc_shop_currency` (`id`, `name`, `code`, `symbol`, `exchange_rate`, `precision`, `symbol_first`, `thousands`, `status`, `sort`) VALUES
	(1, 'USD Dola', 'USD', '$', 1.00, 0, 1, ',', 1, 0),
	(2, 'VietNam Dong', 'VND', '₫', 20.00, 0, 0, ',', 1, 1);
/*!40000 ALTER TABLE `sc_shop_currency` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_customer
DROP TABLE IF EXISTS `sc_shop_customer`;
CREATE TABLE IF NOT EXISTS `sc_shop_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_kana` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_kana` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL COMMENT '0:women, 1:men',
  `birthday` date DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'VN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `group` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_customer_email_provider_provider_id_unique` (`email`,`provider`,`provider_id`),
  KEY `sc_shop_customer_address_id_index` (`address_id`),
  KEY `sc_shop_customer_store_id_index` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_customer: ~0 rows (approximately)
DELETE FROM `sc_shop_customer`;
/*!40000 ALTER TABLE `sc_shop_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_customer` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_customer_address
DROP TABLE IF EXISTS `sc_shop_customer_address`;
CREATE TABLE IF NOT EXISTS `sc_shop_customer_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_kana` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_kana` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'VN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_shop_customer_address_customer_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_customer_address: ~0 rows (approximately)
DELETE FROM `sc_shop_customer_address`;
/*!40000 ALTER TABLE `sc_shop_customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_customer_address` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_custom_field
DROP TABLE IF EXISTS `sc_shop_custom_field`;
CREATE TABLE IF NOT EXISTS `sc_shop_custom_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'product, customer',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `option` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'radio, select, input',
  `default` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '{"value1":"name1", "value2":"name2"}',
  PRIMARY KEY (`id`),
  KEY `sc_shop_custom_field_type_index` (`type`),
  KEY `sc_shop_custom_field_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_custom_field: ~0 rows (approximately)
DELETE FROM `sc_shop_custom_field`;
/*!40000 ALTER TABLE `sc_shop_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_custom_field` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_custom_field_detail
DROP TABLE IF EXISTS `sc_shop_custom_field_detail`;
CREATE TABLE IF NOT EXISTS `sc_shop_custom_field_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_shop_custom_field_detail_custom_field_id_index` (`custom_field_id`),
  KEY `sc_shop_custom_field_detail_rel_id_index` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_custom_field_detail: ~0 rows (approximately)
DELETE FROM `sc_shop_custom_field_detail`;
/*!40000 ALTER TABLE `sc_shop_custom_field_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_custom_field_detail` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_email_template
DROP TABLE IF EXISTS `sc_shop_email_template`;
CREATE TABLE IF NOT EXISTS `sc_shop_email_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sc_shop_email_template_store_id_index` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_email_template: ~6 rows (approximately)
DELETE FROM `sc_shop_email_template`;
/*!40000 ALTER TABLE `sc_shop_email_template` DISABLE KEYS */;
INSERT INTO `sc_shop_email_template` (`id`, `name`, `group`, `text`, `store_id`, `status`) VALUES
	(1, 'Reset password', 'forgot_password', '<h1 style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:left">{{$title}}</h1>\r\n<p style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left">{{$reason_sendmail}}</p>\r\n<table class="action" align="center" width="100%" cellpadding="0" cellspacing="0" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;margin:30px auto;padding:0;text-align:center;width:100%">\r\n<tbody><tr>\r\n  <td align="center" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n  <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n      <tbody><tr>\r\n      <td align="center" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n          <table border="0" cellpadding="0" cellspacing="0" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n          <tbody><tr>\r\n              <td style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n              <a href="{{$reset_link}}" class="button button-primary" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-radius:3px;color:#fff;display:inline-block;text-decoration:none;background-color:#3097d1;border-top:10px solid #3097d1;border-right:18px solid #3097d1;border-bottom:10px solid #3097d1;border-left:18px solid #3097d1" target="_blank">{{$reset_button}}</a>\r\n              </td>\r\n          </tr>\r\n          </tbody>\r\n      </table>\r\n      </td>\r\n      </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left">\r\n{{$note_sendmail}}\r\n</p>\r\n<table class="subcopy" width="100%" cellpadding="0" cellspacing="0" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-top:1px solid #edeff2;margin-top:25px;padding-top:25px">\r\n<tbody><tr>\r\n<td style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n  <p style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;line-height:1.5em;margin-top:0;text-align:left;font-size:12px">{{$note_access_link}}</p>\r\n  </td>\r\n  </tr>\r\n</tbody>\r\n</table>', 1, 1),
	(2, 'Customer verification', 'customer_verify', '<h1 style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:left">{{$title}}</h1>\r\n<p style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left">{{$reason_sendmail}}</p>\r\n<table class="action" align="center" width="100%" cellpadding="0" cellspacing="0" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;margin:30px auto;padding:0;text-align:center;width:100%">\r\n<tbody><tr>\r\n  <td align="center" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n  <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n      <tbody><tr>\r\n      <td align="center" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n          <table border="0" cellpadding="0" cellspacing="0" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n          <tbody><tr>\r\n              <td style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n              <a href="{{$url_verify}}" class="button button-primary" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-radius:3px;color:#fff;display:inline-block;text-decoration:none;background-color:#3097d1;border-top:10px solid #3097d1;border-right:18px solid #3097d1;border-bottom:10px solid #3097d1;border-left:18px solid #3097d1" target="_blank">{{$button}}</a>\r\n              </td>\r\n          </tr>\r\n          </tbody>\r\n      </table>\r\n      </td>\r\n      </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left">\r\n{{$note_sendmail}}\r\n</p>\r\n<table class="subcopy" width="100%" cellpadding="0" cellspacing="0" style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-top:1px solid #edeff2;margin-top:25px;padding-top:25px">\r\n<tbody><tr>\r\n<td style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box">\r\n  <p style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;line-height:1.5em;margin-top:0;text-align:left;font-size:12px">{{$note_access_link}}</p>\r\n  </td>\r\n  </tr>\r\n</tbody>\r\n</table>', 1, 1),
	(3, 'Welcome new customer', 'welcome_customer', '<h1 style="font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:center">{{$title}}</h1>\r\n<p style="text-align:center;">Welcome to my site!</p>', 1, 1),
	(4, 'Send form contact to admin', 'contact_to_admin', '<table class="inner-body" align="center" cellpadding="0" cellspacing="0">\r\n<tr>\r\n<td>\r\n<b>Name</b>: {{$name}}<br>\r\n<b>Email</b>: {{$email}}<br>\r\n<b>Phone</b>: {{$phone}}<br>\r\n</td>\r\n</tr>\r\n</table>\r\n<hr>\r\n<p style="text-align: center;">Content:<br>\r\n<table class="inner-body" align="center" cellpadding="0" cellspacing="0" border="0">\r\n<tr>\r\n<td>{{$content}}</td>\r\n</tr>\r\n</table>', 1, 1),
	(5, 'New order to admin', 'order_success_to_admin', '<table class="inner-body" align="center" cellpadding="0" cellspacing="0">\r\n  <tr>\r\n      <td>\r\n          <b>Order ID</b>: {{$orderID}}<br>\r\n          <b>Customer name</b>: {{$toname}}<br>\r\n          <b>Email</b>: {{$email}}<br>\r\n          <b>Address</b>: {{$address}}<br>\r\n          <b>Phone</b>: {{$phone}}<br>\r\n          <b>Order note</b>: {{$comment}}\r\n      </td>\r\n  </tr>\r\n</table>\r\n<hr>\r\n<p style="text-align: center;">Order detail:<br>\r\n===================================<br></p>\r\n<table class="inner-body" align="center" cellpadding="0" cellspacing="0" border="1">\r\n  {{$orderDetail}}\r\n  <tr>\r\n      <td colspan="2"></td>\r\n      <td colspan="2" style="font-weight: bold;">Sub total</td>\r\n      <td colspan="2" align="right">{{$subtotal}}</td>\r\n  </tr>\r\n  <tr>\r\n      <td colspan="2"></td>\r\n      <td colspan="2" style="font-weight: bold;">Shipping fee</td>\r\n      <td colspan="2" align="right">{{$shipping}}</td>\r\n  </tr>\r\n  <tr>\r\n      <td colspan="2"></td>\r\n      <td colspan="2" style="font-weight: bold;">Discount</td>\r\n      <td colspan="2" align="right">{{$discount}}</td>\r\n  </tr>\r\n  <tr>\r\n      <td colspan="2"></td>\r\n      <td colspan="2" style="font-weight: bold;">Total</td>\r\n      <td colspan="2" align="right">{{$total}}</td>\r\n  </tr>\r\n</table>', 1, 1),
	(6, 'New order to customr', 'order_success_to_customer', '<table class="inner-body" align="center" cellpadding="0" cellspacing="0">\r\n<tr>\r\n  <td>\r\n      <b>Order ID</b>: {{$orderID}}<br>\r\n      <b>Customer name</b>: {{$toname}}<br>\r\n      <b>Address</b>: {{$address}}<br>\r\n      <b>Phone</b>: {{$phone}}<br>\r\n      <b>Order note</b>: {{$comment}}\r\n  </td>\r\n</tr>\r\n</table>\r\n<hr>\r\n<p style="text-align: center;">Order detail:<br>\r\n===================================<br></p>\r\n<table class="inner-body" align="center" cellpadding="0" cellspacing="0" border="1">\r\n{{$orderDetail}}\r\n<tr>\r\n  <td colspan="2"></td>\r\n  <td colspan="2" style="font-weight: bold;">Sub total</td>\r\n  <td colspan="2" align="right">{{$subtotal}}</td>\r\n</tr>\r\n<tr>\r\n  <td colspan="2"></td>\r\n  <td colspan="2" style="font-weight: bold;">Shipping fee</td>\r\n  <td colspan="2" align="right">{{$shipping}}</td>\r\n</tr>\r\n<tr>\r\n  <td colspan="2"></td>\r\n  <td colspan="2" style="font-weight: bold;">Discount</td>\r\n  <td colspan="2" align="right">{{$discount}}</td>\r\n</tr>\r\n<tr>\r\n  <td colspan="2"></td>\r\n  <td colspan="2" style="font-weight: bold;">Total</td>\r\n  <td colspan="2" align="right">{{$total}}</td>\r\n</tr>\r\n</table>', 1, 1);
/*!40000 ALTER TABLE `sc_shop_email_template` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_language
DROP TABLE IF EXISTS `sc_shop_language`;
CREATE TABLE IF NOT EXISTS `sc_shop_language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `rtl` tinyint(4) DEFAULT 0 COMMENT 'Layout RTL',
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_language_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_language: ~2 rows (approximately)
DELETE FROM `sc_shop_language`;
/*!40000 ALTER TABLE `sc_shop_language` DISABLE KEYS */;
INSERT INTO `sc_shop_language` (`id`, `name`, `code`, `icon`, `status`, `rtl`, `sort`) VALUES
	(1, 'English', 'en', '/data/language/flag_uk.png', 1, 0, 1),
	(2, 'Tiếng Việt', 'vi', '/data/language/flag_vn.png', 1, 0, 1);
/*!40000 ALTER TABLE `sc_shop_language` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_layout_page
DROP TABLE IF EXISTS `sc_shop_layout_page`;
CREATE TABLE IF NOT EXISTS `sc_shop_layout_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_layout_page_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_layout_page: ~17 rows (approximately)
DELETE FROM `sc_shop_layout_page`;
/*!40000 ALTER TABLE `sc_shop_layout_page` DISABLE KEYS */;
INSERT INTO `sc_shop_layout_page` (`id`, `key`, `name`) VALUES
	(1, 'home', 'admin.layout_page_position.home'),
	(2, 'shop_home', 'admin.layout_page_position.shop_home'),
	(3, 'shop_product_list', 'admin.layout_page_position.product_list'),
	(4, 'product_detail', 'admin.layout_page_position.product_detail'),
	(5, 'shop_cart', 'admin.layout_page_position.shop_cart'),
	(6, 'shop_item_list', 'admin.layout_page_position.item_list'),
	(7, 'shop_item_detail', 'admin.layout_page_position.item_detail'),
	(8, 'shop_news', 'admin.layout_page_position.news_list'),
	(9, 'shop_news_detail', 'admin.layout_page_position.news_detail'),
	(10, 'shop_auth', 'admin.layout_page_position.shop_auth'),
	(11, 'shop_profile', 'admin.layout_page_position.shop_profile'),
	(12, 'shop_page', 'admin.layout_page_position.shop_page'),
	(13, 'shop_contact', 'admin.layout_page_position.shop_contact'),
	(14, 'content_list', 'admin.layout_page_position.content_list'),
	(15, 'content_detail', 'admin.layout_page_position.content_detail'),
	(16, 'store_home', 'admin.layout_page_position.store_home'),
	(17, 'store_product_list', 'admin.layout_page_position.store_product_list');
/*!40000 ALTER TABLE `sc_shop_layout_page` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_layout_position
DROP TABLE IF EXISTS `sc_shop_layout_position`;
CREATE TABLE IF NOT EXISTS `sc_shop_layout_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_layout_position_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_layout_position: ~6 rows (approximately)
DELETE FROM `sc_shop_layout_position`;
/*!40000 ALTER TABLE `sc_shop_layout_position` DISABLE KEYS */;
INSERT INTO `sc_shop_layout_position` (`id`, `key`, `name`) VALUES
	(1, 'header', 'admin.layout_page_block.header'),
	(2, 'banner_top', 'admin.layout_page_block.banner_top'),
	(3, 'top', 'admin.layout_page_block.top'),
	(4, 'left', 'admin.layout_page_block.left'),
	(5, 'right', 'admin.layout_page_block.right'),
	(6, 'bottom', 'admin.layout_page_block.bottom');
/*!40000 ALTER TABLE `sc_shop_layout_position` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_length
DROP TABLE IF EXISTS `sc_shop_length`;
CREATE TABLE IF NOT EXISTS `sc_shop_length` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_length_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_length: ~4 rows (approximately)
DELETE FROM `sc_shop_length`;
/*!40000 ALTER TABLE `sc_shop_length` DISABLE KEYS */;
INSERT INTO `sc_shop_length` (`id`, `name`, `description`) VALUES
	(1, 'mm', 'Millimeter'),
	(2, 'cm', 'Centimeter'),
	(3, 'm', 'Meter'),
	(4, 'in', 'Inch');
/*!40000 ALTER TABLE `sc_shop_length` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_link
DROP TABLE IF EXISTS `sc_shop_link`;
CREATE TABLE IF NOT EXISTS `sc_shop_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_link: ~6 rows (approximately)
DELETE FROM `sc_shop_link`;
/*!40000 ALTER TABLE `sc_shop_link` DISABLE KEYS */;
INSERT INTO `sc_shop_link` (`id`, `name`, `url`, `target`, `group`, `module`, `status`, `sort`) VALUES
	(1, 'front.blog', 'route::news', '_self', 'menu', '', 1, 30),
	(2, 'front.contact', 'route::contact', '_self', 'menu', '', 1, 40),
	(3, 'front.about', 'route::page.detail::about', '_self', 'menu', '', 1, 50),
	(4, 'front.my_profile', 'route::login', '_self', 'footer', '', 1, 60),
	(5, 'front.compare_page', 'route::compare', '_self', 'footer', '', 1, 70),
	(6, 'front.wishlist_page', 'route::wishlist', '_self', 'footer', '', 1, 80);
/*!40000 ALTER TABLE `sc_shop_link` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_link_store
DROP TABLE IF EXISTS `sc_shop_link_store`;
CREATE TABLE IF NOT EXISTS `sc_shop_link_store` (
  `link_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`link_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_link_store: ~6 rows (approximately)
DELETE FROM `sc_shop_link_store`;
/*!40000 ALTER TABLE `sc_shop_link_store` DISABLE KEYS */;
INSERT INTO `sc_shop_link_store` (`link_id`, `store_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1);
/*!40000 ALTER TABLE `sc_shop_link_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_news
DROP TABLE IF EXISTS `sc_shop_news`;
CREATE TABLE IF NOT EXISTS `sc_shop_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_shop_news_alias_index` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_news: ~6 rows (approximately)
DELETE FROM `sc_shop_news`;
/*!40000 ALTER TABLE `sc_shop_news` DISABLE KEYS */;
INSERT INTO `sc_shop_news` (`id`, `image`, `alias`, `sort`, `status`, `created_at`, `updated_at`) VALUES
	(1, '/data/content/blog-1.jpg', 'demo-alias-blog-1', 0, 1, '2021-09-18 10:32:03', NULL),
	(2, '/data/content/blog-2.jpg', 'demo-alias-blog-2', 0, 1, '2021-09-18 10:32:03', NULL),
	(3, '/data/content/blog-3.jpg', 'demo-alias-blog-3', 0, 1, '2021-09-18 10:32:03', NULL),
	(4, '/data/content/blog-4.jpg', 'demo-alias-blog-4', 0, 1, '2021-09-18 10:32:03', NULL),
	(5, '/data/content/blog-5.jpg', 'demo-alias-blog-5', 0, 1, '2021-09-18 10:32:03', NULL),
	(6, '/data/content/blog-6.jpg', 'demo-alias-blog-6', 0, 1, '2021-09-18 10:32:03', NULL);
/*!40000 ALTER TABLE `sc_shop_news` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_news_description
DROP TABLE IF EXISTS `sc_shop_news_description`;
CREATE TABLE IF NOT EXISTS `sc_shop_news_description` (
  `news_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `sc_shop_news_description_news_id_lang_unique` (`news_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_news_description: ~12 rows (approximately)
DELETE FROM `sc_shop_news_description`;
/*!40000 ALTER TABLE `sc_shop_news_description` DISABLE KEYS */;
INSERT INTO `sc_shop_news_description` (`news_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
	(1, 'en', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(1, 'vi', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'en', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'vi', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(3, 'en', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(3, 'vi', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(4, 'en', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(4, 'vi', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(5, 'en', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(5, 'vi', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(6, 'en', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(6, 'vi', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');
/*!40000 ALTER TABLE `sc_shop_news_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_news_store
DROP TABLE IF EXISTS `sc_shop_news_store`;
CREATE TABLE IF NOT EXISTS `sc_shop_news_store` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_news_store: ~6 rows (approximately)
DELETE FROM `sc_shop_news_store`;
/*!40000 ALTER TABLE `sc_shop_news_store` DISABLE KEYS */;
INSERT INTO `sc_shop_news_store` (`news_id`, `store_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1);
/*!40000 ALTER TABLE `sc_shop_news_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_order
DROP TABLE IF EXISTS `sc_shop_order`;
CREATE TABLE IF NOT EXISTS `sc_shop_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` int(11) DEFAULT 0,
  `shipping` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `payment_status` int(11) NOT NULL DEFAULT 1,
  `shipping_status` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0,
  `tax` int(11) DEFAULT 0,
  `total` int(11) DEFAULT 0,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) DEFAULT NULL,
  `received` int(11) DEFAULT 0,
  `balance` int(11) DEFAULT 0,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_kana` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_kana` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'VN',
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'other',
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_shop_order_customer_id_index` (`customer_id`),
  KEY `sc_shop_order_device_type_index` (`device_type`),
  KEY `sc_shop_order_store_id_index` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_order: ~0 rows (approximately)
DELETE FROM `sc_shop_order`;
/*!40000 ALTER TABLE `sc_shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_order` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_order_detail
DROP TABLE IF EXISTS `sc_shop_order_detail`;
CREATE TABLE IF NOT EXISTS `sc_shop_order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `total_price` int(11) NOT NULL DEFAULT 0,
  `tax` int(11) NOT NULL DEFAULT 0,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) DEFAULT NULL,
  `attribute` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_order_detail: ~0 rows (approximately)
DELETE FROM `sc_shop_order_detail`;
/*!40000 ALTER TABLE `sc_shop_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_order_detail` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_order_history
DROP TABLE IF EXISTS `sc_shop_order_history`;
CREATE TABLE IF NOT EXISTS `sc_shop_order_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `content` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_order_history: ~0 rows (approximately)
DELETE FROM `sc_shop_order_history`;
/*!40000 ALTER TABLE `sc_shop_order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_order_history` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_order_status
DROP TABLE IF EXISTS `sc_shop_order_status`;
CREATE TABLE IF NOT EXISTS `sc_shop_order_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_order_status: ~6 rows (approximately)
DELETE FROM `sc_shop_order_status`;
/*!40000 ALTER TABLE `sc_shop_order_status` DISABLE KEYS */;
INSERT INTO `sc_shop_order_status` (`id`, `name`) VALUES
	(1, 'New'),
	(2, 'Processing'),
	(3, 'Hold'),
	(4, 'Canceled'),
	(5, 'Done'),
	(6, 'Failed');
/*!40000 ALTER TABLE `sc_shop_order_status` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_order_total
DROP TABLE IF EXISTS `sc_shop_order_total`;
CREATE TABLE IF NOT EXISTS `sc_shop_order_total` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT 0,
  `text` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_order_total: ~0 rows (approximately)
DELETE FROM `sc_shop_order_total`;
/*!40000 ALTER TABLE `sc_shop_order_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_order_total` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_page
DROP TABLE IF EXISTS `sc_shop_page`;
CREATE TABLE IF NOT EXISTS `sc_shop_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sc_shop_page_alias_index` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_page: ~1 rows (approximately)
DELETE FROM `sc_shop_page`;
/*!40000 ALTER TABLE `sc_shop_page` DISABLE KEYS */;
INSERT INTO `sc_shop_page` (`id`, `image`, `alias`, `status`) VALUES
	(1, '', 'about', 1);
/*!40000 ALTER TABLE `sc_shop_page` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_page_description
DROP TABLE IF EXISTS `sc_shop_page_description`;
CREATE TABLE IF NOT EXISTS `sc_shop_page_description` (
  `page_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `sc_shop_page_description_page_id_lang_unique` (`page_id`,`lang`),
  KEY `sc_shop_page_description_lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_page_description: ~2 rows (approximately)
DELETE FROM `sc_shop_page_description`;
/*!40000 ALTER TABLE `sc_shop_page_description` DISABLE KEYS */;
INSERT INTO `sc_shop_page_description` (`page_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
	(1, 'en', 'About', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-2.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(1, 'vi', 'Giới thiệu', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-2.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');
/*!40000 ALTER TABLE `sc_shop_page_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_page_store
DROP TABLE IF EXISTS `sc_shop_page_store`;
CREATE TABLE IF NOT EXISTS `sc_shop_page_store` (
  `page_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`page_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_page_store: ~1 rows (approximately)
DELETE FROM `sc_shop_page_store`;
/*!40000 ALTER TABLE `sc_shop_page_store` DISABLE KEYS */;
INSERT INTO `sc_shop_page_store` (`page_id`, `store_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `sc_shop_page_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_password_resets
DROP TABLE IF EXISTS `sc_shop_password_resets`;
CREATE TABLE IF NOT EXISTS `sc_shop_password_resets` (
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  KEY `sc_shop_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_password_resets: ~0 rows (approximately)
DELETE FROM `sc_shop_password_resets`;
/*!40000 ALTER TABLE `sc_shop_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_password_resets` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_payment_status
DROP TABLE IF EXISTS `sc_shop_payment_status`;
CREATE TABLE IF NOT EXISTS `sc_shop_payment_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_payment_status: ~4 rows (approximately)
DELETE FROM `sc_shop_payment_status`;
/*!40000 ALTER TABLE `sc_shop_payment_status` DISABLE KEYS */;
INSERT INTO `sc_shop_payment_status` (`id`, `name`) VALUES
	(1, 'Unpaid'),
	(2, 'Partial payment'),
	(3, 'Paid'),
	(4, 'Refurn');
/*!40000 ALTER TABLE `sc_shop_payment_status` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product
DROP TABLE IF EXISTS `sc_shop_product`;
CREATE TABLE IF NOT EXISTS `sc_shop_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'upc code',
  `ean` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ean code',
  `jan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jan code',
  `isbn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'isbn code',
  `mpn` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mpn code',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT 0,
  `supplier_id` int(11) DEFAULT 0,
  `price` int(11) DEFAULT 0,
  `cost` int(11) DEFAULT 0,
  `stock` int(11) DEFAULT 0,
  `sold` int(11) DEFAULT 0,
  `minimum` int(11) DEFAULT 0,
  `weight_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT 0,
  `length_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` int(11) DEFAULT 0,
  `width` int(11) DEFAULT 0,
  `height` int(11) DEFAULT 0,
  `kind` tinyint(4) DEFAULT 0 COMMENT '0:single, 1:bundle, 2:group',
  `property` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  `tax_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '0:No-tax, auto: Use tax default',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_lastview` datetime DEFAULT NULL,
  `date_available` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_shop_product_sku_index` (`sku`),
  KEY `sc_shop_product_brand_id_index` (`brand_id`),
  KEY `sc_shop_product_supplier_id_index` (`supplier_id`),
  KEY `sc_shop_product_kind_index` (`kind`),
  KEY `sc_shop_product_property_index` (`property`),
  KEY `sc_shop_product_tax_id_index` (`tax_id`),
  KEY `sc_shop_product_status_index` (`status`),
  KEY `sc_shop_product_alias_index` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product: ~17 rows (approximately)
DELETE FROM `sc_shop_product`;
/*!40000 ALTER TABLE `sc_shop_product` DISABLE KEYS */;
INSERT INTO `sc_shop_product` (`id`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `image`, `brand_id`, `supplier_id`, `price`, `cost`, `stock`, `sold`, `minimum`, `weight_class`, `weight`, `length_class`, `length`, `width`, `height`, `kind`, `property`, `tax_id`, `status`, `sort`, `view`, `alias`, `date_lastview`, `date_available`, `created_at`, `updated_at`) VALUES
	(1, 'ABCZZ', NULL, NULL, NULL, NULL, NULL, '/data/product/product-1.png', 1, 1, 15000, 10000, 99, 1, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-1', NULL, NULL, NULL, NULL),
	(2, 'LEDFAN1', NULL, NULL, NULL, NULL, NULL, '/data/product/product-2.png', 1, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-2', NULL, NULL, NULL, NULL),
	(3, 'CLOCKFAN1', NULL, NULL, NULL, NULL, NULL, '/data/product/product-3.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-3', NULL, NULL, NULL, NULL),
	(4, 'CLOCKFAN2', NULL, NULL, NULL, NULL, NULL, '/data/product/product-4.png', 3, 1, 15000, 10000, 100, 0, 5, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-4', NULL, NULL, NULL, NULL),
	(5, 'CLOCKFAN3', NULL, NULL, NULL, NULL, NULL, '/data/product/product-5.png', 1, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-5', NULL, NULL, NULL, NULL),
	(6, 'TMC2208', NULL, NULL, NULL, NULL, NULL, '/data/product/product-6.png', 1, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-6', NULL, NULL, NULL, NULL),
	(7, 'FILAMENT', NULL, NULL, NULL, NULL, NULL, '/data/product/product-7.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-7', NULL, NULL, NULL, NULL),
	(8, 'A4988', NULL, NULL, NULL, NULL, NULL, '/data/product/product-8.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-8', NULL, NULL, NULL, NULL),
	(9, 'ANYCUBIC-P', NULL, NULL, NULL, NULL, NULL, '/data/product/product-9.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-9', NULL, NULL, NULL, NULL),
	(10, '3DHLFD-P', NULL, NULL, NULL, NULL, NULL, '/data/product/product-10.png', 4, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-10', NULL, NULL, NULL, NULL),
	(11, 'SS495A', NULL, NULL, NULL, NULL, NULL, '/data/product/product-11.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-11', NULL, NULL, NULL, NULL),
	(12, '3D-CARBON175', NULL, NULL, NULL, NULL, NULL, '/data/product/product-12.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-12', NULL, NULL, NULL, NULL),
	(13, '3D-GOLD175', NULL, NULL, NULL, NULL, NULL, '/data/product/product-13.png', 3, 1, 10000, 5000, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-13', NULL, NULL, NULL, NULL),
	(14, 'LCD12864-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/product-14.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-14', NULL, NULL, NULL, NULL),
	(15, 'LCD2004-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/product-15.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 1, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-15', NULL, NULL, NULL, NULL),
	(16, 'RAMPS15-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/product-16.png', 2, 1, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 2, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-16', NULL, NULL, NULL, NULL),
	(17, 'ALOKK1-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/product-10.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-17', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `sc_shop_product` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_attribute
DROP TABLE IF EXISTS `sc_shop_product_attribute`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `add_price` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `sc_shop_product_attribute_product_id_attribute_group_id_index` (`product_id`,`attribute_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_attribute: ~8 rows (approximately)
DELETE FROM `sc_shop_product_attribute`;
/*!40000 ALTER TABLE `sc_shop_product_attribute` DISABLE KEYS */;
INSERT INTO `sc_shop_product_attribute` (`id`, `name`, `attribute_group_id`, `product_id`, `add_price`, `sort`, `status`) VALUES
	(1, 'Blue', 1, 17, 50, 0, 1),
	(2, 'White', 1, 17, 0, 0, 1),
	(3, 'S', 2, 17, 20, 0, 1),
	(4, 'XL', 2, 17, 30, 0, 1),
	(5, 'Blue', 1, 10, 150, 0, 1),
	(6, 'Red', 1, 10, 0, 0, 1),
	(7, 'S', 2, 10, 0, 0, 1),
	(8, 'M', 2, 10, 0, 0, 1);
/*!40000 ALTER TABLE `sc_shop_product_attribute` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_build
DROP TABLE IF EXISTS `sc_shop_product_build`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_build` (
  `build_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`build_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_build: ~2 rows (approximately)
DELETE FROM `sc_shop_product_build`;
/*!40000 ALTER TABLE `sc_shop_product_build` DISABLE KEYS */;
INSERT INTO `sc_shop_product_build` (`build_id`, `product_id`, `quantity`) VALUES
	(15, 6, 1),
	(15, 7, 2);
/*!40000 ALTER TABLE `sc_shop_product_build` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_category
DROP TABLE IF EXISTS `sc_shop_product_category`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_category: ~19 rows (approximately)
DELETE FROM `sc_shop_product_category`;
/*!40000 ALTER TABLE `sc_shop_product_category` DISABLE KEYS */;
INSERT INTO `sc_shop_product_category` (`product_id`, `category_id`) VALUES
	(1, 6),
	(1, 10),
	(1, 13),
	(2, 13),
	(3, 11),
	(4, 11),
	(5, 11),
	(6, 11),
	(7, 12),
	(8, 10),
	(9, 6),
	(10, 11),
	(11, 10),
	(12, 9),
	(13, 5),
	(14, 11),
	(15, 6),
	(16, 9),
	(17, 9);
/*!40000 ALTER TABLE `sc_shop_product_category` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_description
DROP TABLE IF EXISTS `sc_shop_product_description`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_description` (
  `product_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `sc_shop_product_description_product_id_lang_unique` (`product_id`,`lang`),
  KEY `sc_shop_product_description_lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_description: ~34 rows (approximately)
DELETE FROM `sc_shop_product_description`;
/*!40000 ALTER TABLE `sc_shop_product_description` DISABLE KEYS */;
INSERT INTO `sc_shop_product_description` (`product_id`, `lang`, `name`, `keyword`, `description`, `content`) VALUES
	(1, 'en', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(1, 'vi', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'en', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'vi', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(3, 'en', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(3, 'vi', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(4, 'en', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(4, 'vi', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(5, 'en', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(5, 'vi', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(6, 'en', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(6, 'vi', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(7, 'en', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(7, 'vi', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(8, 'en', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(8, 'vi', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(9, 'en', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(9, 'vi', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(10, 'en', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(10, 'vi', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(11, 'en', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(11, 'vi', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(12, 'en', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(12, 'vi', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(13, 'en', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(13, 'vi', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(14, 'en', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(14, 'vi', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(15, 'en', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(15, 'vi', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(16, 'en', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(16, 'vi', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(17, 'en', 'Easy Polo Black Edition 17', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(17, 'vi', 'Easy Polo Black Edition 17', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');
/*!40000 ALTER TABLE `sc_shop_product_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_download
DROP TABLE IF EXISTS `sc_shop_product_download`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_download: ~0 rows (approximately)
DELETE FROM `sc_shop_product_download`;
/*!40000 ALTER TABLE `sc_shop_product_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_product_download` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_group
DROP TABLE IF EXISTS `sc_shop_product_group`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_group` (
  `group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_group: ~2 rows (approximately)
DELETE FROM `sc_shop_product_group`;
/*!40000 ALTER TABLE `sc_shop_product_group` DISABLE KEYS */;
INSERT INTO `sc_shop_product_group` (`group_id`, `product_id`) VALUES
	(16, 1),
	(16, 2);
/*!40000 ALTER TABLE `sc_shop_product_group` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_image
DROP TABLE IF EXISTS `sc_shop_product_image`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sc_shop_product_image_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_image: ~20 rows (approximately)
DELETE FROM `sc_shop_product_image`;
/*!40000 ALTER TABLE `sc_shop_product_image` DISABLE KEYS */;
INSERT INTO `sc_shop_product_image` (`id`, `image`, `product_id`) VALUES
	(1, '/data/product/product-2.png', 1),
	(2, '/data/product/product-11.png', 1),
	(3, '/data/product/product-8.png', 11),
	(4, '/data/product/product-6.png', 2),
	(5, '/data/product/product-13.png', 11),
	(6, '/data/product/product-12.png', 5),
	(7, '/data/product/product-6.png', 5),
	(8, '/data/product/product-1.png', 2),
	(9, '/data/product/product-15.png', 2),
	(10, '/data/product/product-5.png', 9),
	(11, '/data/product/product-8.png', 8),
	(12, '/data/product/product-2.png', 7),
	(13, '/data/product/product-6.png', 7),
	(14, '/data/product/product-11.png', 5),
	(15, '/data/product/product-13.png', 4),
	(16, '/data/product/product-13.png', 15),
	(17, '/data/product/product-6.png', 15),
	(18, '/data/product/product-12.png', 17),
	(19, '/data/product/product-6.png', 17),
	(20, '/data/product/product-2.png', 17);
/*!40000 ALTER TABLE `sc_shop_product_image` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_promotion
DROP TABLE IF EXISTS `sc_shop_product_promotion`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_promotion` (
  `product_id` int(11) NOT NULL,
  `price_promotion` int(11) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status_promotion` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_promotion: ~4 rows (approximately)
DELETE FROM `sc_shop_product_promotion`;
/*!40000 ALTER TABLE `sc_shop_product_promotion` DISABLE KEYS */;
INSERT INTO `sc_shop_product_promotion` (`product_id`, `price_promotion`, `date_start`, `date_end`, `status_promotion`, `created_at`, `updated_at`) VALUES
	(1, 5000, NULL, NULL, 1, NULL, NULL),
	(2, 3000, NULL, NULL, 1, NULL, NULL),
	(11, 600, NULL, NULL, 1, NULL, NULL),
	(13, 4000, NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `sc_shop_product_promotion` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_property
DROP TABLE IF EXISTS `sc_shop_product_property`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_product_property_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_property: ~2 rows (approximately)
DELETE FROM `sc_shop_product_property`;
/*!40000 ALTER TABLE `sc_shop_product_property` DISABLE KEYS */;
INSERT INTO `sc_shop_product_property` (`id`, `code`, `name`) VALUES
	(1, 'physical', 'Product physical'),
	(2, 'download', 'Product download');
/*!40000 ALTER TABLE `sc_shop_product_property` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_store
DROP TABLE IF EXISTS `sc_shop_product_store`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_store: ~17 rows (approximately)
DELETE FROM `sc_shop_product_store`;
/*!40000 ALTER TABLE `sc_shop_product_store` DISABLE KEYS */;
INSERT INTO `sc_shop_product_store` (`product_id`, `store_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1);
/*!40000 ALTER TABLE `sc_shop_product_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_sessions
DROP TABLE IF EXISTS `sc_shop_sessions`;
CREATE TABLE IF NOT EXISTS `sc_shop_sessions` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sc_shop_sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_sessions: ~0 rows (approximately)
DELETE FROM `sc_shop_sessions`;
/*!40000 ALTER TABLE `sc_shop_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_sessions` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_shipping_standard
DROP TABLE IF EXISTS `sc_shop_shipping_standard`;
CREATE TABLE IF NOT EXISTS `sc_shop_shipping_standard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fee` int(11) NOT NULL,
  `shipping_free` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_shipping_standard: ~1 rows (approximately)
DELETE FROM `sc_shop_shipping_standard`;
/*!40000 ALTER TABLE `sc_shop_shipping_standard` DISABLE KEYS */;
INSERT INTO `sc_shop_shipping_standard` (`id`, `fee`, `shipping_free`) VALUES
	(1, 20, 10000);
/*!40000 ALTER TABLE `sc_shop_shipping_standard` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_shipping_status
DROP TABLE IF EXISTS `sc_shop_shipping_status`;
CREATE TABLE IF NOT EXISTS `sc_shop_shipping_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_shipping_status: ~3 rows (approximately)
DELETE FROM `sc_shop_shipping_status`;
/*!40000 ALTER TABLE `sc_shop_shipping_status` DISABLE KEYS */;
INSERT INTO `sc_shop_shipping_status` (`id`, `name`) VALUES
	(1, 'Not sent'),
	(2, 'Sending'),
	(3, 'Shipping done');
/*!40000 ALTER TABLE `sc_shop_shipping_status` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_shoppingcart
DROP TABLE IF EXISTS `sc_shop_shoppingcart`;
CREATE TABLE IF NOT EXISTS `sc_shop_shoppingcart` (
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  KEY `sc_shop_shoppingcart_identifier_instance_index` (`identifier`,`instance`),
  KEY `sc_shop_shoppingcart_store_id_index` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_shoppingcart: ~0 rows (approximately)
DELETE FROM `sc_shop_shoppingcart`;
/*!40000 ALTER TABLE `sc_shop_shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_shoppingcart` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_store_block
DROP TABLE IF EXISTS `sc_shop_store_block`;
CREATE TABLE IF NOT EXISTS `sc_shop_store_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `sc_shop_store_block_store_id_index` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_store_block: ~10 rows (approximately)
DELETE FROM `sc_shop_store_block`;
/*!40000 ALTER TABLE `sc_shop_store_block` DISABLE KEYS */;
INSERT INTO `sc_shop_store_block` (`id`, `name`, `position`, `page`, `type`, `text`, `status`, `sort`, `store_id`) VALUES
	(1, 'Facebook code', 'top', '*', 'html', '\r\n<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\nvar js, fjs = d.getElementsByTagName(s)[0];\r\nif (d.getElementById(id)) return;\r\njs = d.createElement(s); js.id = id;\r\njs.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=934208239994473";\r\nfjs.parentNode.insertBefore(js, fjs);\r\n}(document, "script", "facebook-jssdk"));\r\n</script>', 1, 0, 1),
	(2, 'Google Analytics', 'header', '*', 'html', '\r\n<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src="https://www.googletagmanager.com/gtag/js?id=UA-128658138-1"></script>\r\n<script>\r\nwindow.dataLayer = window.dataLayer || [];\r\nfunction gtag(){dataLayer.push(arguments);}\r\ngtag("js", new Date());\r\ngtag("config", "UA-128658138-1");\r\n</script>', 1, 0, 1),
	(3, 'Product special', 'left', '*', 'view', 'product_special', 1, 1, 1),
	(4, 'Brands', 'left', '*', 'view', 'brands_left', 1, 3, 1),
	(5, 'Banner home', 'banner_top', 'home', 'view', 'banner_image', 1, 0, 1),
	(6, 'Categories', 'left', 'home,shop_home', 'view', 'categories', 1, 0, 1),
	(7, 'Product last view', 'left', '*', 'view', 'product_lastview', 1, 0, 1),
	(8, 'Products new', 'bottom', 'home', 'view', 'product_new', 1, 9, 1),
	(9, 'Top news', 'bottom', 'home', 'view', 'top_news', 1, 999, 1);
/*!40000 ALTER TABLE `sc_shop_store_block` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_store_css
DROP TABLE IF EXISTS `sc_shop_store_css`;
CREATE TABLE IF NOT EXISTS `sc_shop_store_css` (
  `css` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int(11) NOT NULL,
  UNIQUE KEY `sc_shop_store_css_store_id_unique` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_store_css: ~1 rows (approximately)
DELETE FROM `sc_shop_store_css`;
/*!40000 ALTER TABLE `sc_shop_store_css` DISABLE KEYS */;
INSERT INTO `sc_shop_store_css` (`css`, `store_id`) VALUES
	('\r\n.sc-overlay {\r\n  position: fixed;\r\n  top: 50%;\r\n  left: 50%;\r\n  transform: translate(-50%, -50%);\r\n  transform: -webkit-translate(-50%, -50%);\r\n  transform: -moz-translate(-50%, -50%);\r\n  transform: -ms-translate(-50%, -50%);\r\n  color:#1f222b;\r\n  z-index: 9999;\r\n  background: rgba(255,255,255,0.7);\r\n}\r\n  \r\n#sc-loading{\r\n  display: none;\r\n  position: absolute;\r\n  top: 0;\r\n  left: 0;\r\n  width: 100%;\r\n  height: 100%;\r\n  z-index: 50;\r\n  background: rgba(255,255,255,0.7);\r\n}\r\n/*end loading */\r\n  \r\n/*price*/\r\n.sc-new-price{\r\n  color:#FE980F;\r\n  font-size: 14px;\r\n  padding: 10px 5px;\r\n  font-weight:bold;\r\n  }\r\n  .sc-old-price {\r\n  text-decoration: line-through;\r\n  color: #a95d5d;\r\n  font-size: 13px;\r\n  padding: 10px;\r\n  }\r\n  /*end price*/\r\n.sc-product-build{\r\n  font-size: 20px;\r\n  font-weight: bold;\r\n}\r\n.sc-product-build img{\r\n  width: 50px;\r\n}\r\n.sc-product-group  img{\r\n  width: 100px;\r\n  cursor: pointer;\r\n  }\r\n.sc-product-group:hover{\r\n  box-shadow: 0px 0px 2px #999;\r\n}\r\n.sc-product-group:active{\r\n  box-shadow: 0px 0px 2px #ff00ff;\r\n}\r\n.sc-product-group.active{\r\n  box-shadow: 0px 0px 2px #ff00ff;\r\n}\r\n\r\n.sc-shipping-address td{\r\n  padding: 3px !important;\r\n}\r\n.sc-shipping-address textarea,\r\n.sc-shipping-address input[type="text"],\r\n.sc-shipping-address option{\r\n  width: 100%;\r\n  padding: 7px !important;\r\n}\r\n.row_cart>td{\r\n  vertical-align: middle !important;\r\n}\r\ninput[type="number"]{\r\n  text-align: center;\r\n  padding:2px;\r\n}\r\n.sc-notice{\r\n  clear: both;\r\n  clear: both;\r\n  font-size: 20px;\r\n  background: #f3f3f3;\r\n  width: 100%;\r\n}\r\nimg.new {\r\n  position: absolute;\r\n  right: 0px;\r\n  top: 0px;\r\n  padding: 0px !important;\r\n}\r\n.pointer {\r\n  cursor: pointer;\r\n}\r\n.add-to-cart-list {\r\n  padding: 5px 10px !important;\r\n  margin: 2px !important;\r\n  letter-spacing: 0px !important;\r\n  font-size: 12px !important;\r\n  border-radius: 5px;\r\n}\r\n.help-block {\r\n  font-size: 12px;\r\n  color: red;\r\n  font-style: italic;\r\n}', 1);
/*!40000 ALTER TABLE `sc_shop_store_css` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_subscribe
DROP TABLE IF EXISTS `sc_shop_subscribe`;
CREATE TABLE IF NOT EXISTS `sc_shop_subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_shop_subscribe_email_index` (`email`),
  KEY `sc_shop_subscribe_store_id_index` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_subscribe: ~0 rows (approximately)
DELETE FROM `sc_shop_subscribe`;
/*!40000 ALTER TABLE `sc_shop_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_subscribe` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_supplier
DROP TABLE IF EXISTS `sc_shop_supplier`;
CREATE TABLE IF NOT EXISTS `sc_shop_supplier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sc_shop_supplier_alias_index` (`alias`),
  KEY `sc_shop_supplier_store_id_index` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_supplier: ~2 rows (approximately)
DELETE FROM `sc_shop_supplier`;
/*!40000 ALTER TABLE `sc_shop_supplier` DISABLE KEYS */;
INSERT INTO `sc_shop_supplier` (`id`, `name`, `alias`, `email`, `phone`, `image`, `address`, `url`, `status`, `store_id`, `sort`) VALUES
	(1, 'ABC distributor', 'abc-distributor', 'abc@abc.com', '012496657567', '/data/supplier/supplier.png', '', '', 1, 1, 0),
	(2, 'XYZ distributor', 'xyz-distributor', 'xyz@xyz.com', '012496657567', '/data/supplier/supplier.png', '', '', 1, 1, 0);
/*!40000 ALTER TABLE `sc_shop_supplier` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_tax
DROP TABLE IF EXISTS `sc_shop_tax`;
CREATE TABLE IF NOT EXISTS `sc_shop_tax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_tax: ~1 rows (approximately)
DELETE FROM `sc_shop_tax`;
/*!40000 ALTER TABLE `sc_shop_tax` DISABLE KEYS */;
INSERT INTO `sc_shop_tax` (`id`, `name`, `value`) VALUES
	(1, 'Tax default (10%)', 10);
/*!40000 ALTER TABLE `sc_shop_tax` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_weight
DROP TABLE IF EXISTS `sc_shop_weight`;
CREATE TABLE IF NOT EXISTS `sc_shop_weight` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_weight_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_weight: ~4 rows (approximately)
DELETE FROM `sc_shop_weight`;
/*!40000 ALTER TABLE `sc_shop_weight` DISABLE KEYS */;
INSERT INTO `sc_shop_weight` (`id`, `name`, `description`) VALUES
	(1, 'g', 'Gram'),
	(2, 'kg', 'Kilogram'),
	(3, 'lb', 'Pound '),
	(4, 'oz', 'Ounce ');
/*!40000 ALTER TABLE `sc_shop_weight` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
