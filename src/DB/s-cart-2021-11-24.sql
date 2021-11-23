-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table s-cart.check_ip_access
DROP TABLE IF EXISTS `check_ip_access`;
CREATE TABLE IF NOT EXISTS `check_ip_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `check_ip_access_ip_index` (`ip`),
  KEY `check_ip_access_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.check_ip_access: ~0 rows (approximately)
DELETE FROM `check_ip_access`;
/*!40000 ALTER TABLE `check_ip_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_ip_access` ENABLE KEYS */;

-- Dumping structure for table s-cart.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

-- Dumping structure for table s-cart.failed_jobs1
DROP TABLE IF EXISTS `failed_jobs1`;
CREATE TABLE IF NOT EXISTS `failed_jobs1` (
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

-- Dumping data for table s-cart.failed_jobs1: ~0 rows (approximately)
DELETE FROM `failed_jobs1`;
/*!40000 ALTER TABLE `failed_jobs1` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs1` ENABLE KEYS */;

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

-- Dumping structure for table s-cart.jobs1
DROP TABLE IF EXISTS `jobs1`;
CREATE TABLE IF NOT EXISTS `jobs1` (
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

-- Dumping data for table s-cart.jobs1: ~0 rows (approximately)
DELETE FROM `jobs1`;
/*!40000 ALTER TABLE `jobs1` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs1` ENABLE KEYS */;

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
	('94f2e385-2236-46c9-97ac-2d0d7eda8a86', NULL, 'SCart Personal Access Client', 'McbaBzBsuqJaxDmwCTdNhwDpPfhhjJjzJn3ZRg7V', NULL, 'http://localhost', 1, 0, 0, '2021-11-24 06:13:21', '2021-11-24 06:13:21'),
	('94f2e385-2656-4ce1-bca3-39055a792cd4', NULL, 'SCart Password Grant Client', 'rbUAheTzlsFW7dqWc9tqid9KGBleKztM55sQTLbh', 'users', 'http://localhost', 0, 1, 0, '2021-11-24 06:13:21', '2021-11-24 06:13:21');
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
	(1, '94f2e385-2236-46c9-97ac-2d0d7eda8a86', '2021-11-24 06:13:21', '2021-11-24 06:13:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_config: ~145 rows (approximately)
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
	(20, 'global', 'admin_dashboard', 'admin_dashboard_total_order', '1', 0, 0, 0, 'admin.dashboard.total_order'),
	(21, 'global', 'admin_dashboard', 'admin_dashboard_total_customer', '1', 0, 0, 0, 'admin.dashboard.total_customer'),
	(22, 'global', 'admin_dashboard', 'admin_dashboard_total_blog', '1', 0, 0, 0, 'admin.dashboard.total_blog'),
	(23, 'global', 'admin_dashboard', 'admin_dashboard_total_product', '1', 0, 0, 0, 'admin.dashboard.total_product'),
	(24, 'global', 'admin_dashboard', 'admin_dashboard_order_month', '1', 0, 0, 0, 'admin.dashboard.order_month'),
	(25, 'global', 'admin_dashboard', 'admin_dashboard_order_year', '1', 0, 0, 0, 'admin.dashboard.order_year'),
	(26, 'global', 'admin_dashboard', 'admin_dashboard_pie_chart', '1', 0, 0, 0, 'admin.dashboard.pie_chart'),
	(27, 'global', 'admin_dashboard', 'admin_dashboard_top_order_new', '1', 0, 0, 0, 'admin.dashboard.top_order_new'),
	(28, 'global', 'admin_dashboard', 'admin_dashboard_top_customer_new', '1', 0, 0, 0, 'admin.dashboard.top_customer_new'),
	(29, '', 'product_config_attribute', 'product_brand', '1', 0, 1, 0, 'product.config_manager.brand'),
	(30, '', 'product_config_attribute_required', 'product_brand_required', '0', 0, 1, 0, ''),
	(31, '', 'product_config_attribute', 'product_supplier', '1', 0, 1, 0, 'product.config_manager.supplier'),
	(32, '', 'product_config_attribute_required', 'product_supplier_required', '0', 0, 1, 0, ''),
	(33, '', 'product_config_attribute', 'product_price', '1', 0, 1, 0, 'product.config_manager.price'),
	(34, '', 'product_config_attribute_required', 'product_price_required', '1', 0, 1, 0, ''),
	(35, '', 'product_config_attribute', 'product_cost', '1', 0, 1, 0, 'product.config_manager.cost'),
	(36, '', 'product_config_attribute_required', 'product_cost_required', '0', 0, 1, 0, ''),
	(37, '', 'product_config_attribute', 'product_promotion', '1', 0, 1, 0, 'product.config_manager.promotion'),
	(38, '', 'product_config_attribute_required', 'product_promotion_required', '0', 0, 1, 0, ''),
	(39, '', 'product_config_attribute', 'product_stock', '1', 0, 1, 0, 'product.config_manager.stock'),
	(40, '', 'product_config_attribute_required', 'product_stock_required', '0', 0, 1, 0, ''),
	(41, '', 'product_config_attribute', 'product_kind', '1', 0, 1, 0, 'product.config_manager.kind'),
	(42, '', 'product_config_attribute', 'product_property', '1', 0, 1, 0, 'product.config_manager.property'),
	(43, '', 'product_config_attribute_required', 'product_property_required', '0', 0, 1, 0, ''),
	(44, '', 'product_config_attribute', 'product_attribute', '1', 0, 1, 0, 'product.config_manager.attribute'),
	(45, '', 'product_config_attribute_required', 'product_attribute_required', '0', 0, 1, 0, ''),
	(46, '', 'product_config_attribute', 'product_available', '1', 0, 1, 0, 'product.config_manager.available'),
	(47, '', 'product_config_attribute_required', 'product_available_required', '0', 0, 1, 0, ''),
	(48, '', 'product_config_attribute', 'product_weight', '1', 0, 1, 0, 'product.config_manager.weight'),
	(49, '', 'product_config_attribute_required', 'product_weight_required', '0', 0, 1, 0, ''),
	(50, '', 'product_config_attribute', 'product_length', '1', 0, 1, 0, 'product.config_manager.length'),
	(51, '', 'product_config_attribute_required', 'product_length_required', '0', 0, 1, 0, ''),
	(52, '', 'product_config', 'product_display_out_of_stock', '1', 0, 1, 19, 'product.config_manager.product_display_out_of_stock'),
	(53, '', 'product_config', 'show_date_available', '1', 0, 1, 21, 'product.config_manager.show_date_available'),
	(54, '', 'product_config', 'product_tax', '1', 0, 1, 0, 'product.config_manager.tax'),
	(55, '', 'customer_config_attribute', 'customer_lastname', '1', 0, 1, 1, 'customer.config_manager.lastname'),
	(56, '', 'customer_config_attribute_required', 'customer_lastname_required', '1', 0, 1, 1, ''),
	(57, '', 'customer_config_attribute', 'customer_address1', '1', 0, 1, 2, 'customer.config_manager.address1'),
	(58, '', 'customer_config_attribute_required', 'customer_address1_required', '1', 0, 1, 2, ''),
	(59, '', 'customer_config_attribute', 'customer_address2', '1', 0, 1, 2, 'customer.config_manager.address2'),
	(60, '', 'customer_config_attribute_required', 'customer_address2_required', '1', 0, 1, 2, ''),
	(61, '', 'customer_config_attribute', 'customer_address3', '0', 0, 1, 2, 'customer.config_manager.address3'),
	(62, '', 'customer_config_attribute_required', 'customer_address3_required', '0', 0, 1, 2, ''),
	(63, '', 'customer_config_attribute', 'customer_company', '0', 0, 1, 0, 'customer.config_manager.company'),
	(64, '', 'customer_config_attribute_required', 'customer_company_required', '0', 0, 1, 0, ''),
	(65, '', 'customer_config_attribute', 'customer_postcode', '0', 0, 1, 0, 'customer.config_manager.postcode'),
	(66, '', 'customer_config_attribute_required', 'customer_postcode_required', '0', 0, 1, 0, ''),
	(67, '', 'customer_config_attribute', 'customer_country', '1', 0, 1, 0, 'customer.config_manager.country'),
	(68, '', 'customer_config_attribute_required', 'customer_country_required', '1', 0, 1, 0, ''),
	(69, '', 'customer_config_attribute', 'customer_group', '0', 0, 1, 0, 'customer.config_manager.group'),
	(70, '', 'customer_config_attribute_required', 'customer_group_required', '0', 0, 1, 0, ''),
	(71, '', 'customer_config_attribute', 'customer_birthday', '0', 0, 1, 0, 'customer.config_manager.birthday'),
	(72, '', 'customer_config_attribute_required', 'customer_birthday_required', '0', 0, 1, 0, ''),
	(73, '', 'customer_config_attribute', 'customer_sex', '0', 0, 1, 0, 'customer.config_manager.sex'),
	(74, '', 'customer_config_attribute_required', 'customer_sex_required', '0', 0, 1, 0, ''),
	(75, '', 'customer_config_attribute', 'customer_phone', '1', 0, 1, 0, 'customer.config_manager.phone'),
	(76, '', 'customer_config_attribute_required', 'customer_phone_required', '1', 0, 1, 1, ''),
	(77, '', 'customer_config_attribute', 'customer_name_kana', '0', 0, 1, 0, 'customer.config_manager.name_kana'),
	(78, '', 'customer_config_attribute_required', 'customer_name_kana_required', '0', 0, 1, 1, ''),
	(79, '', 'admin_config', 'ADMIN_NAME', 'S-Cart System', 0, 1, 0, 'admin.env.ADMIN_NAME'),
	(80, '', 'admin_config', 'ADMIN_TITLE', 'S-Cart Admin', 0, 1, 0, 'admin.env.ADMIN_TITLE'),
	(81, '', 'admin_config', 'ADMIN_LOGO', 'S-Cart <span class="brand-text font-weight-light">Admin</span>', 0, 1, 0, 'admin.env.ADMIN_LOGO'),
	(82, '', 'admin_config', 'hidden_copyright_footer', '0', 0, 1, 0, 'admin.env.hidden_copyright_footer'),
	(83, '', 'admin_config', 'hidden_copyright_footer_admin', '0', 0, 1, 0, 'admin.env.hidden_copyright_footer_admin'),
	(84, '', 'display_config', 'product_top', '12', 0, 1, 0, 'store.display.product_top'),
	(85, '', 'display_config', 'product_list', '12', 0, 1, 0, 'store.display.list_product'),
	(86, '', 'display_config', 'product_relation', '4', 0, 1, 0, 'store.display.relation_product'),
	(87, '', 'display_config', 'product_viewed', '4', 0, 1, 0, 'store.display.viewed_product'),
	(88, '', 'display_config', 'item_list', '12', 0, 1, 0, 'store.display.item_list'),
	(89, '', 'display_config', 'item_top', '12', 0, 1, 0, 'store.display.item_top'),
	(90, '', 'order_config', 'shop_allow_guest', '1', 0, 1, 11, 'order.admin.shop_allow_guest'),
	(91, '', 'order_config', 'product_preorder', '1', 0, 1, 18, 'order.admin.product_preorder'),
	(92, '', 'order_config', 'product_buy_out_of_stock', '1', 0, 1, 20, 'order.admin.product_buy_out_of_stock'),
	(93, '', 'order_config', 'shipping_off', '0', 0, 1, 20, 'order.admin.shipping_off'),
	(94, '', 'order_config', 'payment_off', '0', 0, 1, 20, 'order.admin.payment_off'),
	(95, '', 'email_action', 'email_action_mode', '0', 0, 1, 0, 'email.email_action.email_action_mode'),
	(96, '', 'email_action', 'email_action_queue', '0', 0, 1, 1, 'email.email_action.email_action_queue'),
	(97, '', 'email_action', 'order_success_to_admin', '0', 0, 1, 1, 'email.email_action.order_success_to_admin'),
	(98, '', 'email_action', 'order_success_to_customer', '0', 0, 1, 2, 'email.email_action.order_success_to_cutomer'),
	(99, '', 'email_action', 'order_success_to_customer_pdf', '0', 0, 1, 3, 'email.email_action.order_success_to_cutomer_pdf'),
	(100, '', 'email_action', 'customer_verify', '0', 0, 1, 4, 'email.email_action.customer_verify'),
	(101, '', 'email_action', 'welcome_customer', '0', 0, 1, 4, 'email.email_action.welcome_customer'),
	(102, '', 'email_action', 'contact_to_admin', '1', 0, 1, 6, 'email.email_action.contact_to_admin'),
	(103, '', 'smtp_config', 'smtp_host', '', 0, 1, 1, 'email.config_smtp.smtp_host'),
	(104, '', 'smtp_config', 'smtp_user', '', 0, 1, 2, 'email.config_smtp.smtp_user'),
	(105, '', 'smtp_config', 'smtp_password', '', 0, 1, 3, 'email.config_smtp.smtp_password'),
	(106, '', 'smtp_config', 'smtp_security', '', 0, 1, 4, 'email.config_smtp.smtp_security'),
	(107, '', 'smtp_config', 'smtp_port', '', 0, 1, 5, 'email.config_smtp.smtp_port'),
	(108, '', 'smtp_config', 'smtp_name', '', 0, 1, 6, 'email.config_smtp.smtp_name'),
	(109, '', 'smtp_config', 'smtp_from', '', 0, 1, 7, 'email.config_smtp.smtp_from'),
	(110, '', 'url_config', 'SUFFIX_URL', '.html', 0, 1, 0, 'admin.env.SUFFIX_URL'),
	(111, '', 'url_config', 'PREFIX_SHOP', 'shop', 0, 1, 0, 'admin.env.PREFIX_SHOP'),
	(112, '', 'url_config', 'PREFIX_BRAND', 'brand', 0, 1, 0, 'admin.env.PREFIX_BRAND'),
	(113, '', 'url_config', 'PREFIX_CATEGORY', 'category', 0, 1, 0, 'admin.env.PREFIX_CATEGORY'),
	(114, '', 'url_config', 'PREFIX_CATEGORY_VENDOR', 'category-vendor', 0, 1, 0, 'admin.env.PREFIX_CATEGORY_VENDOR'),
	(115, '', 'url_config', 'PREFIX_SUB_CATEGORY', 'sub-category', 0, 1, 0, 'admin.env.PREFIX_SUB_CATEGORY'),
	(116, '', 'url_config', 'PREFIX_PRODUCT', 'product', 0, 1, 0, 'admin.env.PREFIX_PRODUCT'),
	(117, '', 'url_config', 'PREFIX_SEARCH', 'search', 0, 1, 0, 'admin.env.PREFIX_SEARCH'),
	(118, '', 'url_config', 'PREFIX_CONTACT', 'contact', 0, 1, 0, 'admin.env.PREFIX_CONTACT'),
	(119, '', 'url_config', 'PREFIX_NEWS', 'news', 0, 1, 0, 'admin.env.PREFIX_NEWS'),
	(120, '', 'url_config', 'PREFIX_MEMBER', 'customer', 0, 1, 0, 'admin.env.PREFIX_MEMBER'),
	(121, '', 'url_config', 'PREFIX_MEMBER_ORDER_LIST', 'order-list', 0, 1, 0, 'admin.env.PREFIX_MEMBER_ORDER_LIST'),
	(122, '', 'url_config', 'PREFIX_MEMBER_CHANGE_PWD', 'change-password', 0, 1, 0, 'admin.env.PREFIX_MEMBER_CHANGE_PWD'),
	(123, '', 'url_config', 'PREFIX_MEMBER_CHANGE_INFO', 'change-info', 0, 1, 0, 'admin.env.PREFIX_MEMBER_CHANGE_INFO'),
	(124, '', 'url_config', 'PREFIX_CMS_CATEGORY', 'cms-category', 0, 1, 0, 'admin.env.PREFIX_CMS_CATEGORY'),
	(125, '', 'url_config', 'PREFIX_CMS_ENTRY', 'entry', 0, 1, 0, 'admin.env.PREFIX_CMS_ENTRY'),
	(126, '', 'url_config', 'PREFIX_CART_WISHLIST', 'wishlst', 0, 1, 0, 'admin.env.PREFIX_CART_WISHLIST'),
	(127, '', 'url_config', 'PREFIX_CART_COMPARE', 'compare', 0, 1, 0, 'admin.env.PREFIX_CART_COMPARE'),
	(128, '', 'url_config', 'PREFIX_CART_DEFAULT', 'cart', 0, 1, 0, 'admin.env.PREFIX_CART_DEFAULT'),
	(129, '', 'url_config', 'PREFIX_CART_CHECKOUT', 'checkout', 0, 1, 0, 'admin.env.PREFIX_CART_CHECKOUT'),
	(130, '', 'url_config', 'PREFIX_CART_CHECKOUT_CONFIRM', 'checkout-confirm', 0, 1, 0, 'admin.env.PREFIX_CART_CHECKOUT_CONFIRM'),
	(131, '', 'url_config', 'PREFIX_ORDER_SUCCESS', 'order-success', 0, 1, 0, 'admin.env.PREFIX_ORDER_SUCCESS'),
	(132, '', 'captcha_config', 'captcha_mode', '0', 0, 1, 20, 'admin.captcha.captcha_mode'),
	(133, '', 'captcha_config', 'captcha_page', '[]', 0, 1, 10, 'captcha.captcha_page'),
	(134, '', 'captcha_config', 'captcha_method', '', 0, 1, 0, 'admin.captcha.captcha_method'),
	(135, '', 'admin_custom_config', 'facebook_url', 'https://www.facebook.com/SCart.Ecommerce/', 0, 1, 0, 'admin.admin_custom_config.facebook_url'),
	(136, '', 'admin_custom_config', 'fanpage_url', 'https://www.facebook.com/groups/scart.opensource', 0, 1, 0, 'admin.admin_custom_config.fanpage_url'),
	(137, '', 'admin_custom_config', 'twitter_url', 'https://twitter.com/ecommercescart', 0, 1, 0, 'admin.admin_custom_config.twitter_url'),
	(138, '', 'admin_custom_config', 'instagram_url', '#', 0, 1, 0, 'admin.admin_custom_config.instagram_url'),
	(139, '', 'admin_custom_config', 'youtube_url', 'https://www.youtube.com/channel/UCR8kitefby3N6KvvawQVqdg/videos', 0, 1, 0, 'admin.admin_custom_config.youtube_url'),
	(140, '', 'config_layout', 'link_home_page', '1', 0, 1, 0, 'admin.config_layout.link_home_page'),
	(141, '', 'config_layout', 'link_shop_page', '1', 0, 1, 0, 'admin.config_layout.link_shop_page'),
	(142, '', 'config_layout', 'link_account', '1', 0, 1, 0, 'admin.config_layout.link_account'),
	(143, '', 'config_layout', 'link_language', '1', 0, 1, 0, 'admin.config_layout.link_language'),
	(144, '', 'config_layout', 'link_currency', '1', 0, 1, 0, 'admin.config_layout.link_currency'),
	(145, '', 'config_layout', 'link_cart', '1', 0, 1, 0, 'admin.config_layout.link_cart');
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

-- Dumping data for table s-cart.sc_admin_log: ~0 rows (approximately)
DELETE FROM `sc_admin_log`;
/*!40000 ALTER TABLE `sc_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_admin_log` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_menu
DROP TABLE IF EXISTS `sc_admin_menu`;
CREATE TABLE IF NOT EXISTS `sc_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `hidden` int(11) NOT NULL DEFAULT 0,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_menu_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_menu: ~67 rows (approximately)
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
	(30, 9, 5, 'admin.menu_titles.localisation', 'fa fa-map-signs', '', 0, 0, NULL, NULL, NULL),
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
	(69, 30, 2, 'admin.menu_titles.language_manager', 'fa fa-universal-access', 'admin::language_manager', 0, 0, NULL, NULL, NULL),
	(70, 9, 6, 'admin.menu_titles.security', 'fab fa-shirtsinbulk', '', 0, 0, 'ADMIN_SECURITY', NULL, NULL);
/*!40000 ALTER TABLE `sc_admin_menu` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_permission
DROP TABLE IF EXISTS `sc_admin_permission`;
CREATE TABLE IF NOT EXISTS `sc_admin_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
	(1, 'Auth manager', 'auth.full', 'ANY::sc_admin/auth/*', '2021-11-24 06:13:20', NULL),
	(2, 'Dashboard', 'dashboard', 'GET::sc_admin', '2021-11-24 06:13:20', NULL),
	(3, 'Base setting', 'base.setting', 'ANY::sc_admin/order_status/*,ANY::sc_admin/shipping_status/*,ANY::sc_admin/payment_status/*,ANY::sc_admin/supplier/*,ANY::sc_admin/brand/*,ANY::sc_admin/custom_field/*,ANY::sc_admin/weight_unit/*,ANY::sc_admin/length_unit/*,ANY::sc_admin/attribute_group/*,ANY::sc_admin/tax/*', '2021-11-24 06:13:20', NULL),
	(4, 'Store manager', 'store.full', 'ANY::sc_admin/store_info/*,ANY::sc_admin/store_maintain/*,ANY::sc_admin/store_config/*,ANY::sc_admin/store_css/*,ANY::sc_admin/store_block/*,ANY::sc_admin/store_link/*', '2021-11-24 06:13:20', NULL),
	(5, 'Product manager', 'product.full', 'ANY::sc_admin/product/*,ANY::sc_admin/product_property/*,ANY::sc_admin/product_tag/*', '2021-11-24 06:13:20', NULL),
	(6, 'Category manager', 'category.full', 'ANY::sc_admin/category/*', '2021-11-24 06:13:20', NULL),
	(7, 'Order manager', 'order.full', 'ANY::sc_admin/order/*', '2021-11-24 06:13:20', NULL),
	(8, 'Upload management', 'upload.full', 'ANY::sc_admin/uploads/*', '2021-11-24 06:13:20', NULL),
	(9, 'Extension manager', 'extension.full', 'ANY::sc_admin/template/*,ANY::sc_admin/plugin/*', '2021-11-24 06:13:20', NULL),
	(10, 'Marketing manager', 'marketing.full', 'ANY::sc_admin/shop_discount/*,ANY::sc_admin/email_template/*,ANY::sc_admin/customer/*,ANY::sc_admin/subscribe/*,ANY::sc_admin/seo/*', '2021-11-24 06:13:20', NULL),
	(11, 'Report manager', 'report.full', 'ANY::sc_admin/report/*', '2021-11-24 06:13:20', NULL),
	(12, 'CMS full', 'cms.full', 'ANY::sc_admin/page/*,ANY::sc_admin/banner/*,ANY::sc_admin/banner_type/*, ANY::sc_admin/cms_category/*,ANY::sc_admin/cms_content/*,ANY::sc_admin/news/*', '2021-11-24 06:13:20', NULL),
	(13, 'Update config', 'change.config', 'POST::sc_admin/store_config/update', '2021-11-24 06:13:20', NULL);
/*!40000 ALTER TABLE `sc_admin_permission` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_admin_role
DROP TABLE IF EXISTS `sc_admin_role`;
CREATE TABLE IF NOT EXISTS `sc_admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_role_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_role: ~7 rows (approximately)
DELETE FROM `sc_admin_role`;
/*!40000 ALTER TABLE `sc_admin_role` DISABLE KEYS */;
INSERT INTO `sc_admin_role` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'administrator', '2021-11-24 06:13:20', NULL),
	(2, 'Group only View', 'view.all', '2021-11-24 06:13:20', NULL),
	(3, 'Manager', 'manager', '2021-11-24 06:13:20', NULL),
	(4, 'CMS', 'cms', '2021-11-24 06:13:20', NULL),
	(5, 'Accountant', 'accountant', '2021-11-24 06:13:20', NULL),
	(6, 'Marketing', 'maketing', '2021-11-24 06:13:20', NULL),
	(7, 'Admin CMS', 'admin_cms', '2021-11-24 06:13:20', NULL);
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

-- Dumping data for table s-cart.sc_admin_role_permission: ~30 rows (approximately)
DELETE FROM `sc_admin_role_permission`;
/*!40000 ALTER TABLE `sc_admin_role_permission` DISABLE KEYS */;
INSERT INTO `sc_admin_role_permission` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(3, 1, '2021-11-24 06:13:20', NULL),
	(3, 2, '2021-11-24 06:13:20', NULL),
	(3, 3, '2021-11-24 06:13:20', NULL),
	(3, 4, '2021-11-24 06:13:20', NULL),
	(3, 5, '2021-11-24 06:13:20', NULL),
	(3, 6, '2021-11-24 06:13:20', NULL),
	(3, 7, '2021-11-24 06:13:20', NULL),
	(3, 8, '2021-11-24 06:13:20', NULL),
	(3, 9, '2021-11-24 06:13:20', NULL),
	(3, 10, '2021-11-24 06:13:20', NULL),
	(3, 11, '2021-11-24 06:13:20', NULL),
	(3, 12, '2021-11-24 06:13:20', NULL),
	(3, 13, '2021-11-24 06:13:20', NULL),
	(4, 1, '2021-11-24 06:13:20', NULL),
	(4, 12, '2021-11-24 06:13:20', NULL),
	(5, 1, '2021-11-24 06:13:20', NULL),
	(5, 2, '2021-11-24 06:13:20', NULL),
	(5, 7, '2021-11-24 06:13:20', NULL),
	(5, 11, '2021-11-24 06:13:20', NULL),
	(6, 1, '2021-11-24 06:13:20', NULL),
	(6, 2, '2021-11-24 06:13:20', NULL),
	(6, 8, '2021-11-24 06:13:20', NULL),
	(6, 10, '2021-11-24 06:13:20', NULL),
	(6, 11, '2021-11-24 06:13:20', NULL),
	(6, 12, '2021-11-24 06:13:20', NULL),
	(7, 1, '2021-11-24 06:13:20', NULL),
	(7, 4, '2021-11-24 06:13:20', NULL),
	(7, 8, '2021-11-24 06:13:20', NULL),
	(7, 12, '2021-11-24 06:13:20', NULL),
	(7, 13, '2021-11-24 06:13:20', NULL);
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintain_content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

-- Dumping structure for table s-cart.sc_admin_template
DROP TABLE IF EXISTS `sc_admin_template`;
CREATE TABLE IF NOT EXISTS `sc_admin_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_admin_template_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_admin_template: ~1 rows (approximately)
DELETE FROM `sc_admin_template`;
/*!40000 ALTER TABLE `sc_admin_template` DISABLE KEYS */;
INSERT INTO `sc_admin_template` (`id`, `key`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 's-cart-light', 'S-Cart Light', 1, '2021-11-24 06:13:20', NULL);
/*!40000 ALTER TABLE `sc_admin_template` ENABLE KEYS */;

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
	(1, 'admin', '$2y$10$rdbpR9w4CMuVIiVwNCObZuummUuBx0xUmtd7ZGIGjk8D0cvpiL.Ui', 'Administrator', 'demo@s-cart.org', '/admin/avatar/user.jpg', NULL, NULL, '2021-11-24 06:13:20', NULL);
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
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
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
	(1, 'Demo api connection', 'appmobile', 'f5e310ef-4cb2-11ec-b80d-04d9f5d0007b', NULL, NULL, 0);
/*!40000 ALTER TABLE `sc_api_connection` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_cms_category
DROP TABLE IF EXISTS `sc_cms_category`;
CREATE TABLE IF NOT EXISTS `sc_cms_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sc_cms_category_alias_index` (`alias`),
  KEY `sc_cms_category_store_id_index` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_cms_category: ~2 rows (approximately)
DELETE FROM `sc_cms_category`;
/*!40000 ALTER TABLE `sc_cms_category` DISABLE KEYS */;
INSERT INTO `sc_cms_category` (`id`, `image`, `parent`, `alias`, `store_id`, `sort`, `status`) VALUES
	(1, '/data/cms-image/cms.jpg', 0, 'demo-category-1', 1, 0, 1),
	(2, '/data/cms-image/cms.jpg', 0, 'demo-category-2', 1, 0, 1);
/*!40000 ALTER TABLE `sc_cms_category` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_cms_category_description
DROP TABLE IF EXISTS `sc_cms_category_description`;
CREATE TABLE IF NOT EXISTS `sc_cms_category_description` (
  `category_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_cms_category_description: ~4 rows (approximately)
DELETE FROM `sc_cms_category_description`;
/*!40000 ALTER TABLE `sc_cms_category_description` DISABLE KEYS */;
INSERT INTO `sc_cms_category_description` (`category_id`, `lang`, `title`, `keyword`, `description`) VALUES
	(1, 'en', 'Category CMS 1', '', ''),
	(1, 'vi', 'Danh mục CMS 1', '', ''),
	(2, 'en', 'Category CMS 2', '', ''),
	(2, 'vi', 'Danh mục CMS 2', '', '');
/*!40000 ALTER TABLE `sc_cms_category_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_cms_content
DROP TABLE IF EXISTS `sc_cms_content`;
CREATE TABLE IF NOT EXISTS `sc_cms_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_cms_content_alias_index` (`alias`),
  KEY `sc_cms_content_store_id_index` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_cms_content: ~2 rows (approximately)
DELETE FROM `sc_cms_content`;
/*!40000 ALTER TABLE `sc_cms_content` DISABLE KEYS */;
INSERT INTO `sc_cms_content` (`id`, `category_id`, `image`, `alias`, `sort`, `status`, `store_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '/data/cms-image/cms_content_1.jpg', 'demo-alias-content-1', 0, 1, 1, '2021-09-28 00:00:00', NULL),
	(2, 1, '/data/cms-image/cms_content_2.jpg', 'demo-alias-content-2', 0, 1, 1, '2021-09-28 00:00:00', NULL);
/*!40000 ALTER TABLE `sc_cms_content` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_cms_content_description
DROP TABLE IF EXISTS `sc_cms_content_description`;
CREATE TABLE IF NOT EXISTS `sc_cms_content_description` (
  `content_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`content_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_cms_content_description: ~4 rows (approximately)
DELETE FROM `sc_cms_content_description`;
/*!40000 ALTER TABLE `sc_cms_content_description` DISABLE KEYS */;
INSERT INTO `sc_cms_content_description` (`content_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
	(1, 'en', 'Demo cms content 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/cms-image/cms.jpg" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(1, 'vi', 'Demo cms content 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/cms-image/cms.jpg" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'en', 'Demo cms content 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/cms-image/cms.jpg" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'vi', 'Demo cms content 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/cms-image/cms.jpg" style="width: 262px; height: 262px; float: right; margin: 10px;" /></p>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');
/*!40000 ALTER TABLE `sc_cms_content_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_cms_image
DROP TABLE IF EXISTS `sc_cms_image`;
CREATE TABLE IF NOT EXISTS `sc_cms_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_cms_image: ~0 rows (approximately)
DELETE FROM `sc_cms_image`;
/*!40000 ALTER TABLE `sc_cms_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_cms_image` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2539 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_languages: ~2,538 rows (approximately)
DELETE FROM `sc_languages`;
/*!40000 ALTER TABLE `sc_languages` DISABLE KEYS */;
INSERT INTO `sc_languages` (`id`, `code`, `text`, `position`, `location`) VALUES
	(1, 'action.disable', 'Disable', 'action', 'en'),
	(2, 'action.disable', 'Vô hiệu hóa', 'action', 'vi'),
	(3, 'action.disable_success', 'Disabled success', 'action', 'en'),
	(4, 'action.disable_success', 'Vô hiệu hóa thành công', 'action', 'vi'),
	(5, 'action.enable', 'Enable', 'action', 'en'),
	(6, 'action.enable', 'Kích hoạt', 'action', 'vi'),
	(7, 'action.enable_success', 'Enabled success', 'action', 'en'),
	(8, 'action.enable_success', 'Kích hoạt thành công', 'action', 'vi'),
	(9, 'action.remove', 'Removed', 'action', 'en'),
	(10, 'action.remove', 'Gỡ bỏ', 'action', 'vi'),
	(11, 'action.remove_success', 'Removedd success', 'action', 'en'),
	(12, 'action.remove_success', 'Gỡ bỏ thành công', 'action', 'vi'),
	(13, 'action.edit', 'Edit', 'action', 'en'),
	(14, 'action.edit', 'Chỉnh sửa', 'action', 'vi'),
	(15, 'action.update', 'Update', 'action', 'en'),
	(16, 'action.update', 'Cập nhật', 'action', 'vi'),
	(17, 'action.add', 'Thêm mới', 'action', 'vi'),
	(18, 'action.add', 'Add new', 'action', 'en'),
	(19, 'action.create', 'Create new', 'action', 'en'),
	(20, 'action.create', 'Tạo mới', 'action', 'vi'),
	(21, 'action.create_success', 'Tạo mới thành công', 'action', 'vi'),
	(22, 'action.create_success', 'Create success', 'action', 'en'),
	(23, 'action.edit_success', 'Edit success', 'action', 'en'),
	(24, 'action.edit_success', 'Tạo mới thành công', 'action', 'vi'),
	(25, 'action.update_success', 'Update success', 'action', 'en'),
	(26, 'action.update_success', 'Cập nhật thành công', 'action', 'vi'),
	(27, 'action.add_success', 'Add new success', 'action', 'en'),
	(28, 'action.add_success', 'Thêm mới thành công', 'action', 'vi'),
	(29, 'action.remote_success', 'Remove success', 'action', 'en'),
	(30, 'action.remote_success', 'Gỡ bỏ thành công', 'action', 'vi'),
	(31, 'action.delete_success', 'Delete success', 'action', 'en'),
	(32, 'action.delete_success', 'Xóa thành công', 'action', 'vi'),
	(33, 'action.remote', 'Gỡ bỏ', 'action', 'vi'),
	(34, 'action.remote', 'Remove', 'action', 'en'),
	(35, 'action.delete', 'Xóa', 'action', 'vi'),
	(36, 'action.delete', 'Delete', 'action', 'en'),
	(37, 'action.uninstall', 'Delete', 'action', 'en'),
	(38, 'action.uninstall', 'Gỡ cài đặt', 'action', 'vi'),
	(39, 'action.install', 'Cài đặt', 'action', 'vi'),
	(40, 'action.install', 'Install', 'action', 'en'),
	(41, 'action.click', 'Click', 'action', 'en'),
	(42, 'action.click', 'Bấm', 'action', 'vi'),
	(43, 'action.click_here', 'Click here', 'action', 'en'),
	(44, 'action.click_here', 'Bấm vào đây', 'action', 'vi'),
	(45, 'action.view', 'Xem', 'action', 'vi'),
	(46, 'action.view', 'View', 'action', 'en'),
	(47, 'action.view_more', 'View more', 'action', 'en'),
	(48, 'action.view_more', 'Xem thêm', 'action', 'vi'),
	(49, 'action.detail', 'Chi tiết', 'action', 'vi'),
	(50, 'action.detail', 'Detail', 'action', 'en'),
	(51, 'action.hidden', 'Hidden', 'action', 'en'),
	(52, 'action.hidden', 'Ẩn', 'action', 'vi'),
	(53, 'action.show', 'Hiển thị', 'action', 'vi'),
	(54, 'action.show', 'Show', 'action', 'en'),
	(55, 'action.submit', 'Submit', 'action', 'en'),
	(56, 'action.submit', 'Gửi', 'action', 'vi'),
	(57, 'action.save', 'Save', 'action', 'en'),
	(58, 'action.save', 'Lưu lại', 'action', 'vi'),
	(59, 'action.reset', 'Làm lại', 'action', 'vi'),
	(60, 'action.reset', 'Reset', 'action', 'en'),
	(61, 'action.logout', 'Đăng xuất', 'action', 'vi'),
	(62, 'action.logout', 'Logout', 'action', 'en'),
	(63, 'action.login', 'Đăng nhập', 'action', 'vi'),
	(64, 'action.login', 'Login', 'action', 'en'),
	(65, 'action.refresh', 'Làm mới', 'action', 'vi'),
	(66, 'action.refresh', 'Refresh', 'action', 'en'),
	(67, 'action.confirm', 'Xác nhận', 'action', 'vi'),
	(68, 'action.confirm', 'Confirmation', 'action', 'en'),
	(69, 'action.add_to_cart', 'Add to cart', 'action', 'en'),
	(70, 'action.add_to_cart', 'Thêm vào giỏ hàng', 'action', 'vi'),
	(71, 'action.add_to_wishlist', 'Thêm yêu thích', 'action', 'vi'),
	(72, 'action.add_to_wishlist', 'Add to wishlist', 'action', 'en'),
	(73, 'action.add_to_compare', 'Add to compare', 'action', 'en'),
	(74, 'action.add_to_compare', 'Thêm so sánh', 'action', 'vi'),
	(75, 'action.buy_now', 'Mua ngay', 'action', 'vi'),
	(76, 'action.buy_now', 'Buy now', 'action', 'en'),
	(77, 'action.re_order', 'Re-order', 'action', 'en'),
	(78, 'action.re_order', 'Mua lại', 'action', 'vi'),
	(79, 'action.order', 'Đặt hàng', 'action', 'vi'),
	(80, 'action.order', 'Order', 'action', 'en'),
	(81, 'action.title', 'Action', 'action', 'en'),
	(82, 'action.title', 'Thao tác', 'action', 'vi'),
	(83, 'action.confirm_agree', 'Agree', 'action', 'en'),
	(84, 'action.confirm_agree', 'Đồng ý', 'action', 'vi'),
	(85, 'action.confirm_cancel', 'Hủy bỏ', 'action', 'vi'),
	(86, 'action.confirm_cancel', 'Cancel', 'action', 'en'),
	(87, 'action.confirm_yes', 'Yes', 'action', 'en'),
	(88, 'action.confirm_yes', 'Có', 'action', 'vi'),
	(89, 'action.confirm_no', 'Không', 'action', 'vi'),
	(90, 'action.confirm_no', 'No', 'action', 'en'),
	(91, 'action.delete_confirm', 'Are you sure to delete it?', 'action', 'en'),
	(92, 'action.delete_confirm', 'Bạn có chắc chắn sẽ xóa nó?', 'action', 'vi'),
	(93, 'action.delete_confirm_deleted', 'Deleted', 'action', 'en'),
	(94, 'action.delete_confirm_deleted', 'Đã xóa', 'action', 'vi'),
	(95, 'action.delete_confirm_deleted_msg', 'Item has deleted', 'action', 'en'),
	(96, 'action.delete_confirm_deleted_msg', 'Item này đã được xóa.', 'action', 'vi'),
	(97, 'action.remove_confirm', 'Are you sure to remove it?', 'action', 'en'),
	(98, 'action.remove_confirm', 'Bạn có chắc chắn gỡ nó?', 'action', 'vi'),
	(99, 'action.action_confirm', 'Bạn có chắc chắn thao tác này?', 'action', 'vi'),
	(100, 'action.action_confirm', 'Are you sure you do this?', 'action', 'en'),
	(101, 'action.action_confirm_warning', 'Hành động này sẽ không thể phục hồi', 'action', 'vi'),
	(102, 'action.action_confirm_warning', 'This action will not be restore', 'action', 'en'),
	(103, 'action.warning', 'Warning', 'action', 'en'),
	(104, 'action.warning', 'Cảnh báo', 'action', 'vi'),
	(105, 'action.notify', 'Thông báo', 'action', 'vi'),
	(106, 'action.notify', 'Notify', 'action', 'en'),
	(107, 'action.sort', 'Sort items', 'action', 'en'),
	(108, 'action.sort', 'Sắp xếp', 'action', 'vi'),
	(109, 'action.search', 'Tìm kiếm', 'action', 'vi'),
	(110, 'action.search', 'Search', 'action', 'en'),
	(111, 'action.copy', 'Sao chép', 'action', 'vi'),
	(112, 'action.copy', 'Copy', 'action', 'en'),
	(113, 'action.duplicate', 'Duplicate', 'action', 'en'),
	(114, 'action.duplicate', 'Nhân bản', 'action', 'vi'),
	(115, 'action.allow', 'Allow', 'action', 'en'),
	(116, 'action.allow', 'Cho phép', 'action', 'vi'),
	(117, 'action.deny', 'Deny', 'action', 'en'),
	(118, 'action.deny', 'Ngăn chặn', 'action', 'vi'),
	(119, 'front.home', 'Trang chủ', 'front', 'vi'),
	(120, 'front.home', 'Home', 'front', 'en'),
	(121, 'front.shop', 'Cửa hàng', 'front', 'vi'),
	(122, 'front.shop', 'Shop', 'front', 'en'),
	(123, 'front.store', 'Cửa hàng', 'front', 'vi'),
	(124, 'front.store', 'Store', 'front', 'en'),
	(125, 'front.store_list', 'Danh sách cửa hàng', 'front', 'vi'),
	(126, 'front.store_list', 'Store list', 'front', 'en'),
	(127, 'front.link_useful', 'Liên kết hữu ích', 'front', 'vi'),
	(128, 'front.link_useful', 'Link useful', 'front', 'en'),
	(129, 'front.brands', 'Nhãn hàng', 'front', 'vi'),
	(130, 'front.brands', 'Brands', 'front', 'en'),
	(131, 'front.categories', 'Danh mục', 'front', 'vi'),
	(132, 'front.categories', 'Categries', 'front', 'en'),
	(133, 'front.sub_categories', 'Danh mục nhỏ', 'front', 'vi'),
	(134, 'front.sub_categories', 'Subcategory', 'front', 'en'),
	(135, 'front.blog', 'Blog', 'front', 'vi'),
	(136, 'front.blog', 'Blogs', 'front', 'en'),
	(137, 'front.news', 'Tin tức', 'front', 'vi'),
	(138, 'front.news', 'News', 'front', 'en'),
	(139, 'front.about', 'About us', 'front', 'en'),
	(140, 'front.about', 'Giới thiệu', 'front', 'vi'),
	(141, 'front.contact', 'Contact us', 'front', 'en'),
	(142, 'front.contact', 'Liên hệ', 'front', 'vi'),
	(143, 'front.cms_category', 'Danh mục CMS', 'front', 'vi'),
	(144, 'front.cms_category', 'CMS category', 'front', 'en'),
	(145, 'front.my_profile', 'Tài khoản', 'front', 'vi'),
	(146, 'front.my_profile', 'My profile', 'front', 'en'),
	(147, 'front.my_account', 'Tài khoản', 'front', 'vi'),
	(148, 'front.my_account', 'My account', 'front', 'en'),
	(149, 'front.account', 'Tài khoản', 'front', 'vi'),
	(150, 'front.account', 'customer', 'front', 'en'),
	(151, 'front.currency', 'Tiền tệ', 'front', 'vi'),
	(152, 'front.currency', 'Currency', 'front', 'en'),
	(153, 'front.language', 'Ngôn ngữ', 'front', 'vi'),
	(154, 'front.language', 'Language', 'front', 'en'),
	(155, 'front.cart', 'Giỏ hàng', 'front', 'vi'),
	(156, 'front.cart', 'Cart', 'front', 'en'),
	(157, 'front.compare', 'So sánh', 'front', 'vi'),
	(158, 'front.compare', 'Compare', 'front', 'en'),
	(159, 'front.compare_page', 'Sản phẩm so sánh', 'front', 'vi'),
	(160, 'front.compare_page', 'Product compare', 'front', 'en'),
	(161, 'front.wishlist', 'Yêu thích', 'front', 'vi'),
	(162, 'front.wishlist', 'Wishlist', 'front', 'en'),
	(163, 'front.wishlist_page', 'Sản phẩm yêu thich', 'front', 'vi'),
	(164, 'front.wishlist_page', 'Product Wishlist', 'front', 'en'),
	(165, 'front.login', 'Đăng nhập', 'front', 'vi'),
	(166, 'front.login', 'Login', 'front', 'en'),
	(167, 'front.logout', 'Đăng xuất', 'front', 'vi'),
	(168, 'front.logout', 'Logout', 'front', 'en'),
	(169, 'front.maintenace', 'Bảo trì', 'front', 'vi'),
	(170, 'front.maintenace', 'Maintenace', 'front', 'en'),
	(171, 'front.products_hot', 'Hot Products', 'front', 'en'),
	(172, 'front.products_hot', 'Sản phẩm nổi bật', 'front', 'vi'),
	(173, 'front.products_promotion', 'Promotion Products', 'front', 'en'),
	(174, 'front.products_promotion', 'Sản phẩm khuyến mãi', 'front', 'vi'),
	(175, 'front.products_special', 'Special products', 'front', 'en'),
	(176, 'front.products_special', 'Sản phẩm đặc biệt', 'front', 'vi'),
	(177, 'front.products_last_view', 'Last view products', 'front', 'en'),
	(178, 'front.products_last_view', 'Sản phẩm mới xem', 'front', 'vi'),
	(179, 'front.products_build', 'Product bundle', 'front', 'en'),
	(180, 'front.products_build', 'Sản phẩm bộ', 'front', 'vi'),
	(181, 'front.products_bundle', 'Product bundle', 'front', 'en'),
	(182, 'front.products_bundle', 'Sản phẩm bộ', 'front', 'vi'),
	(183, 'front.products_single', 'Product single', 'front', 'en'),
	(184, 'front.products_single', 'Sản phẩm đơn', 'front', 'vi'),
	(185, 'front.products_group', 'Product group', 'front', 'en'),
	(186, 'front.products_group', 'Sản phẩm nhóm', 'front', 'vi'),
	(187, 'front.products_new', 'New products', 'front', 'en'),
	(188, 'front.products_new', 'Sản phẩm mới', 'front', 'vi'),
	(189, 'front.products_recommend', 'Recommend products', 'front', 'en'),
	(190, 'front.products_recommend', 'Sản phẩm đề xuất', 'front', 'vi'),
	(191, 'front.product_detail', 'Product detail', 'front', 'en'),
	(192, 'front.product_detail', 'Chi tiết sản phẩm', 'front', 'vi'),
	(193, 'front.categories_store', 'Categories', 'front', 'en'),
	(194, 'front.categories_store', 'Danh mục', 'front', 'vi'),
	(195, 'front.result_item', 'Showing <b>:item_from</b>-<b>:item_to</b> of <b>:total</b> results</b>', 'front', 'en'),
	(196, 'front.result_item', 'Hiển thị <b>:item_from</b>-<b>:item_to</b> của <b>:total</b> kết quả</b>', 'front', 'vi'),
	(197, 'front.all_product', 'Tất cả sản phẩm', 'front', 'vi'),
	(198, 'front.all_product', 'All products', 'front', 'en'),
	(199, 'front.data_notfound', 'Không tìm thấy dữ liệu!', 'front', 'vi'),
	(200, 'front.data_notfound', 'Data not found!', 'front', 'en'),
	(201, 'front.data_not_found', 'Không tìm thấy dữ liệu!', 'front', 'vi'),
	(202, 'front.data_not_found', 'Data not found!', 'front', 'en'),
	(203, 'front.data_not_found_title', 'Không tìm thấy dữ liệu!', 'front', 'vi'),
	(204, 'front.data_not_found_title', 'Data not found!', 'front', 'en'),
	(205, 'front.page_notfound', 'Không tìm thấy trang!', 'front', 'vi'),
	(206, 'front.page_notfound', 'Page not found!', 'front', 'en'),
	(207, 'front.page_not_found', 'Không tìm thấy trang!', 'front', 'vi'),
	(208, 'front.page_not_found', 'Page not found!', 'front', 'en'),
	(209, 'front.page_not_found_title', 'Không tìm thấy trang!', 'front', 'vi'),
	(210, 'front.page_not_found_title', 'Page not found!', 'front', 'en'),
	(211, 'front.flash_stock', 'Available', 'front', 'en'),
	(212, 'front.flash_sold', 'Already Sold', 'front', 'en'),
	(213, 'front.flash_title', 'Flash sale', 'front', 'en'),
	(214, 'front.flash_stock', 'Còn lại', 'front', 'vi'),
	(215, 'front.flash_sold', 'Đã bán', 'front', 'vi'),
	(216, 'front.flash_title', 'Flash sale', 'front', 'vi'),
	(217, 'front.products_best_seller', 'Sản phẩm thịnh hành', 'front', 'vi'),
	(218, 'front.products_best_seller', 'Trending products', 'front', 'en'),
	(219, 'front.products_trending', 'Sản phẩm bán chạy nhất', 'front', 'vi'),
	(220, 'front.products_trending', 'Product best seller', 'front', 'en'),
	(221, 'front.search_result', 'Kết quả tìm kiếm', 'front', 'vi'),
	(222, 'front.search_result', 'Search result', 'front', 'en'),
	(223, 'front.view_not_exist', 'Không có view :view', 'front', 'vi'),
	(224, 'front.view_not_exist', 'View not found :view', 'front', 'en'),
	(225, 'front.no_item', 'Không tìm thấy item nào', 'front', 'vi'),
	(226, 'front.no_item', 'No items found', 'front', 'en'),
	(227, 'search.placeholder', 'Nhập từ khóa', 'search', 'vi'),
	(228, 'search.placeholder', 'Input keyword', 'search', 'en'),
	(229, 'store.deny_help_1', 'Sorry, this domain does not exist on the system!', 'store', 'en'),
	(230, 'store.deny_help_1', 'Xin lỗi, tên miền này không có trên hệ thống!', 'store', 'vi'),
	(231, 'store.deny_help_2', 'Return to home page', 'store', 'en'),
	(232, 'store.deny_help_2', 'Trở về trang chủ', 'store', 'vi'),
	(233, 'store.address', 'Address', 'store', 'en'),
	(234, 'store.address', 'Địa chỉ', 'store', 'vi'),
	(235, 'store.phone', 'Phone', 'store', 'en'),
	(236, 'store.phone', 'Số điện thoại', 'store', 'vi'),
	(237, 'store.hotline', 'Hotline', 'store', 'en'),
	(238, 'store.hotline', 'Số điện thoại', 'store', 'vi'),
	(239, 'store.email', 'Email', 'store', 'vi'),
	(240, 'store.email', 'Email', 'store', 'en'),
	(241, 'store.title', 'Tên cửa hàng', 'store', 'vi'),
	(242, 'store.title', 'Store title', 'store', 'en'),
	(243, 'store.keyword', 'Từ khóa', 'store', 'vi'),
	(244, 'store.keyword', 'Keyword', 'store', 'en'),
	(245, 'store.description', 'Mô tả', 'store', 'vi'),
	(246, 'store.description', 'Description', 'store', 'en'),
	(247, 'store.language', 'Ngôn ngữ', 'store', 'vi'),
	(248, 'store.language', 'Language', 'store', 'en'),
	(249, 'store.currency', 'Tiền tệ', 'store', 'vi'),
	(250, 'store.currency', 'Currency', 'store', 'en'),
	(251, 'store.timezone', 'Múi giờ', 'store', 'vi'),
	(252, 'store.timezone', 'Timezone', 'store', 'en'),
	(253, 'store.admin.template', 'Giao diện', 'store.admin', 'vi'),
	(254, 'store.admin.template', 'Template', 'store.admin', 'en'),
	(255, 'store.admin.domain', 'Tên miền', 'store.admin', 'vi'),
	(256, 'store.admin.domain', 'Domain', 'store.admin', 'en'),
	(257, 'store.admin.domain_help', 'Ví dụ: https://abc.com', 'store.admin', 'vi'),
	(258, 'store.admin.domain_help', 'For example: https://abc.com', 'store.admin', 'en'),
	(259, 'store.admin.domain_invalid', 'Tên miền không hợp lệ', 'store.admin', 'vi'),
	(260, 'store.admin.domain_invalid', 'Domain invalid', 'store.admin', 'en'),
	(261, 'store.warehouse', 'Nhà kho', 'store', 'vi'),
	(262, 'store.warehouse', 'Warehouse', 'store', 'en'),
	(263, 'store.office', 'Văn phòng', 'store', 'vi'),
	(264, 'store.office', 'Office', 'store', 'en'),
	(265, 'store.time_active', 'Thời gian làm việc', 'store', 'vi'),
	(266, 'store.time_active', 'Time active', 'store', 'en'),
	(267, 'store.long_phone', 'Số điện thoại', 'store', 'vi'),
	(268, 'store.long_phone', 'Full phone', 'store', 'en'),
	(269, 'store.logo', 'Logo', 'store', 'vi'),
	(270, 'store.logo', 'Logo', 'store', 'en'),
	(271, 'store.icon', 'Icon', 'store', 'vi'),
	(272, 'store.icon', 'Icon', 'store', 'en'),
	(273, 'store.maintenance', 'Bảo trì', 'store', 'vi'),
	(274, 'store.maintenance', 'Maintenance', 'store', 'en'),
	(275, 'store.admin.code', 'Store code', 'store.admin', 'en'),
	(276, 'store.admin.code', 'Mã cửa hàng', 'store.admin', 'vi'),
	(277, 'store.admin.css', 'Edit CSS', 'store.admin', 'en'),
	(278, 'store.admin.css', 'Chỉnh sửa CSS', 'store.admin', 'vi'),
	(279, 'store.admin.title', 'Thông tin cửa hàng', 'store.admin', 'vi'),
	(280, 'store.admin.config_store', 'Cấu hình cửa hàng #:id', 'store.admin', 'vi'),
	(281, 'store.admin.config_store_detail', 'Cấu hình cửa hàng', 'store.admin', 'vi'),
	(282, 'store.admin.list', 'Danh sách cửa hàng', 'store.admin', 'vi'),
	(283, 'store.admin.field', 'Các trường', 'store.admin', 'vi'),
	(284, 'store.admin.value', 'Giá trị', 'store.admin', 'vi'),
	(285, 'store.admin.config_mode', 'Cấu hình mode', 'store.admin', 'vi'),
	(286, 'store.admin.config_display', 'Cấu hình hiển thị', 'store.admin', 'vi'),
	(287, 'store.admin.config_customize', 'Cấu hình tùy chỉnh', 'store.admin', 'vi'),
	(288, 'store.admin.status', 'Status', 'store.admin', 'vi'),
	(289, 'store.admin.action', 'Hành động', 'store.admin', 'vi'),
	(290, 'store.admin.add_new', 'Thêm mới', 'store.admin', 'vi'),
	(291, 'store.admin.sort', 'Sắp xếp', 'store.admin', 'vi'),
	(292, 'store.admin.search', 'Tìm kiếm', 'store.admin', 'vi'),
	(293, 'store.admin.add_new_title', 'Tạo cửa hàng', 'store.admin', 'vi'),
	(294, 'store.admin.add_new_des', 'Tạo mới một cửa hàng', 'store.admin', 'vi'),
	(295, 'store.admin.config_info', 'Thông tin', 'store.admin', 'vi'),
	(296, 'store.admin.config_product', 'Sản phẩm', 'store.admin', 'vi'),
	(297, 'store.admin.config_customer', 'Khách hàng', 'store.admin', 'vi'),
	(298, 'store.admin.config_email', 'Email', 'store.admin', 'vi'),
	(299, 'store.admin.config_url', 'URL', 'store.admin', 'vi'),
	(300, 'store.admin.config_api', 'API', 'store.admin', 'vi'),
	(301, 'store.admin.config_order', 'Đơn hàng', 'store.admin', 'vi'),
	(302, 'store.admin.config_other', 'Khác', 'store.admin', 'vi'),
	(303, 'store.admin.switch_store', 'Chuyển đổi cửa hàng', 'store.admin', 'vi'),
	(304, 'store.admin.config_admin_other', 'Cấu hình admin', 'store.admin', 'vi'),
	(305, 'store.admin.active_strict', 'Kích hoạt chế độ kiểm tra tên miền', 'store.admin', 'vi'),
	(306, 'store.admin.active_domain', 'Kích hoạt tên miền', 'store.admin', 'vi'),
	(307, 'store.admin.active_maintain', 'Kích hoạt chế độ bảo trì', 'store.admin', 'vi'),
	(308, 'store.admin.domain_exist', 'Tên miền đã có rồi', 'store.admin', 'vi'),
	(309, 'store.admin.code_exist', 'Mã code đã có rồi', 'store.admin', 'vi'),
	(310, 'store.admin.value_cannot_change', 'Giá trị này không thể thay đổi', 'store.admin', 'vi'),
	(311, 'store.admin.title', 'Store infomation', 'store.admin', 'en'),
	(312, 'store.admin.config_store', 'Config store #:id', 'store.admin', 'en'),
	(313, 'store.admin.config_store_detail', 'Config store', 'store.admin', 'en'),
	(314, 'store.admin.list', 'Store list', 'store.admin', 'en'),
	(315, 'store.admin.field', 'Field', 'store.admin', 'en'),
	(316, 'store.admin.value', 'Value', 'store.admin', 'en'),
	(317, 'store.admin.config_mode', 'Store mode', 'store.admin', 'en'),
	(318, 'store.admin.config_display', 'Store display', 'store.admin', 'en'),
	(319, 'store.admin.config_customize', 'Config customize', 'store.admin', 'en'),
	(320, 'store.admin.status', 'Status', 'store.admin', 'en'),
	(321, 'store.admin.action', 'Action', 'store.admin', 'en'),
	(322, 'store.admin.sort', 'Sort', 'store.admin', 'en'),
	(323, 'store.admin.search', 'Search', 'store.admin', 'en'),
	(324, 'store.admin.add_new', 'Add new', 'store.admin', 'en'),
	(325, 'store.admin.add_new_title', 'Add new store', 'store.admin', 'en'),
	(326, 'store.admin.add_new_des', 'Create a new store', 'store.admin', 'en'),
	(327, 'store.admin.config_info', 'Infomation', 'store.admin', 'en'),
	(328, 'store.admin.config_order', 'Order', 'store.admin', 'en'),
	(329, 'store.admin.config_product', 'Product', 'store.admin', 'en'),
	(330, 'store.admin.config_customer', 'Customer', 'store.admin', 'en'),
	(331, 'store.admin.config_email', 'Email', 'store.admin', 'en'),
	(332, 'store.admin.config_url', 'URL', 'store.admin', 'en'),
	(333, 'store.admin.config_api', 'API', 'store.admin', 'en'),
	(334, 'store.admin.config_other', 'Other', 'store.admin', 'en'),
	(335, 'store.admin.switch_store', 'Switch store', 'store.admin', 'en'),
	(336, 'store.admin.config_admin_other', 'Config admin', 'store.admin', 'en'),
	(337, 'store.admin.active_strict', 'Activate domain check mode', 'store.admin', 'en'),
	(338, 'store.admin.active_domain', 'Activate the domain name', 'store.admin', 'en'),
	(339, 'store.admin.active_maintain', 'Activate maintenance mode', 'store.admin', 'en'),
	(340, 'store.admin.domain_exist', 'Domain exist already', 'store.admin', 'en'),
	(341, 'store.admin.code_exist', 'Code exist already', 'store.admin', 'en'),
	(342, 'store.admin.value_cannot_change', 'This value cannot be changed', 'store.admin', 'en'),
	(343, 'store.display.product_top', 'Top product', 'store.admin', 'en'),
	(344, 'store.display.product_top', 'Top sản phẩm', 'store.admin', 'vi'),
	(345, 'store.display.list_product', 'List product', 'store.admin', 'en'),
	(346, 'store.display.list_product', 'Danh sách sản phẩm', 'store.admin', 'vi'),
	(347, 'store.display.relation_product', 'Relation product', 'store.admin', 'en'),
	(348, 'store.display.relation_product', 'Sản phẩm liên quan', 'store.admin', 'vi'),
	(349, 'store.display.viewed_product', 'Product viewed', 'store.admin', 'en'),
	(350, 'store.display.viewed_product', 'Sản phẩm đã xem', 'store.admin', 'vi'),
	(351, 'store.display.item_list', 'List item', 'store.admin', 'en'),
	(352, 'store.display.item_list', 'Danh sách item', 'store.admin', 'vi'),
	(353, 'store.display.item_top', 'Top item', 'store.admin', 'en'),
	(354, 'store.display.item_top', 'Top item', 'store.admin', 'vi'),
	(355, 'cart.checkout', 'Checkout', 'cart', 'en'),
	(356, 'cart.checkout', 'Thanh toán', 'cart', 'vi'),
	(357, 'cart.back_to_cart', 'Back to cart', 'cart', 'en'),
	(358, 'cart.back_to_cart', 'Trở lại giỏ hàng', 'cart', 'vi'),
	(359, 'cart.confirm', 'Confirm', 'cart', 'en'),
	(360, 'cart.confirm', 'Xác nhận', 'cart', 'vi'),
	(361, 'cart.cart_title', 'Shopping cart', 'cart', 'en'),
	(362, 'cart.cart_title', 'Trang giỏ hàng', 'cart', 'vi'),
	(363, 'cart.page_title', 'Shopping cart', 'cart', 'en'),
	(364, 'cart.page_title', 'Trang giỏ hàng', 'cart', 'vi'),
	(365, 'cart.back_to_shop', 'Back to shop', 'cart', 'en'),
	(366, 'cart.back_to_shop', 'Trở về của hàng', 'cart', 'vi'),
	(367, 'cart.remove_all', 'Remove cart', 'cart', 'en'),
	(368, 'cart.remove_all', 'Xóa giỏ hàng', 'cart', 'vi'),
	(369, 'cart.minimum_value', 'Minimum :value items', 'cart', 'en'),
	(370, 'cart.minimum_value', 'Tối thiểu :value item', 'cart', 'vi'),
	(371, 'cart.note', 'Note', 'cart', 'en'),
	(372, 'cart.note', 'Ghi chú', 'cart', 'vi'),
	(373, 'cart.coupon', 'Coupon', 'cart', 'en'),
	(374, 'cart.coupon', 'Mã giảm giá', 'cart', 'vi'),
	(375, 'cart.remove_coupon', 'Remove coupon', 'cart', 'en'),
	(376, 'cart.remove_coupon', 'Xóa mã giảm giá', 'cart', 'vi'),
	(377, 'cart.coupon_empty', 'Coupon empty', 'cart', 'en'),
	(378, 'cart.coupon_empty', 'Không có mã giảm giá', 'cart', 'vi'),
	(379, 'cart.apply', 'Apply', 'cart', 'en'),
	(380, 'cart.apply', 'Áp dụng', 'cart', 'vi'),
	(381, 'cart.change_address', 'Change address', 'cart', 'en'),
	(382, 'cart.change_address', 'Thay đổi địa chỉ', 'cart', 'vi'),
	(383, 'cart.add_new_address', 'Add new address', 'cart', 'en'),
	(384, 'cart.add_new_address', 'Thêm địa chỉ mới', 'cart', 'vi'),
	(385, 'cart.page_wishlist_title', 'Page wishlist', 'cart', 'en'),
	(386, 'cart.page_wishlist_title', 'Trang sản phẩm yêu thich', 'cart', 'vi'),
	(387, 'cart.page_compare_title', 'Page compare', 'cart', 'en'),
	(388, 'cart.page_compare_title', 'Trang so sánh sản phẩm', 'cart', 'vi'),
	(389, 'cart.shipping_address', 'Shipping address', 'cart', 'en'),
	(390, 'cart.shipping_address', 'Địa chỉ giao hàng', 'cart', 'vi'),
	(391, 'cart.payment_address', 'Payment address', 'cart', 'en'),
	(392, 'cart.payment_address', 'Địa chỉ thanh toán', 'cart', 'vi'),
	(393, 'cart.payment_method', 'Phương thức thanh toán', 'cart', 'vi'),
	(394, 'cart.payment_method', 'Payment method', 'cart', 'en'),
	(395, 'cart.shipping_method', 'Phương thức vận chuyển', 'cart', 'vi'),
	(396, 'cart.shipping_method', 'Shipping method', 'cart', 'en'),
	(397, 'cart.country', 'Country', 'cart', 'en'),
	(398, 'cart.country', 'Quốc gia', 'cart', 'vi'),
	(399, 'cart.company', 'Công ty', 'cart', 'vi'),
	(400, 'cart.company', 'Company', 'cart', 'en'),
	(401, 'cart.address3', 'Địa chỉ nhà', 'cart', 'vi'),
	(402, 'cart.address3', 'Address 3', 'cart', 'en'),
	(403, 'cart.address2', 'Quận/Huyện', 'cart', 'vi'),
	(404, 'cart.address2', 'Address 2', 'cart', 'en'),
	(405, 'cart.address1', 'Tỉnh/Thành', 'cart', 'vi'),
	(406, 'cart.address1', 'Address 1', 'cart', 'en'),
	(407, 'cart.postcode', 'Mã bưu điện', 'cart', 'vi'),
	(408, 'cart.postcode', 'Post code', 'cart', 'en'),
	(409, 'cart.phone', 'Phone', 'cart', 'en'),
	(410, 'cart.phone', 'Điện thoại', 'cart', 'vi'),
	(411, 'cart.last_name_kana', 'Họ kana', 'cart', 'vi'),
	(412, 'cart.last_name_kana', 'Last name kana', 'cart', 'en'),
	(413, 'cart.first_name_kana', 'First name kana', 'cart', 'en'),
	(414, 'cart.first_name_kana', 'Tên Kana', 'cart', 'vi'),
	(415, 'cart.full_name', 'Full name', 'cart', 'en'),
	(416, 'cart.full_name', 'Tên đầy đủ', 'cart', 'vi'),
	(417, 'cart.name', 'Name', 'cart', 'en'),
	(418, 'cart.name', 'Tên', 'cart', 'vi'),
	(419, 'cart.midle_name', 'Tên đệm', 'cart', 'vi'),
	(420, 'cart.midle_name', 'Midle name', 'cart', 'en'),
	(421, 'cart.last_name', 'Họ', 'cart', 'vi'),
	(422, 'cart.last_name', 'Last name', 'cart', 'en'),
	(423, 'cart.first_name', 'Tên', 'cart', 'vi'),
	(424, 'cart.first_name', 'First name', 'cart', 'en'),
	(425, 'cart.email', 'Email', 'cart', 'vi'),
	(426, 'cart.email', 'Email', 'cart', 'en'),
	(427, 'cart.sex', 'Giới tính', 'cart', 'vi'),
	(428, 'cart.sex', 'Sex', 'cart', 'en'),
	(429, 'cart.birthday', 'Ngày sinh', 'cart', 'vi'),
	(430, 'cart.birthday', 'Birthday', 'cart', 'en'),
	(431, 'cart.validation.shippingMethod_required', 'Shipping method required', 'cart', 'en'),
	(432, 'cart.validation.shippingMethod_required', 'Giao thức giao hàng là bắt buộc', 'cart', 'vi'),
	(433, 'cart.validation.paymentMethod_required', 'Payment method required', 'cart', 'en'),
	(434, 'cart.validation.paymentMethod_required', 'Phương thức thanh toán là bắt buộc', 'cart', 'vi'),
	(435, 'cart.add_to_cart_success', 'Thêm vào :instance thành công', 'cart', 'vi'),
	(436, 'cart.add_to_cart_success', 'Add to :instance success', 'cart', 'en'),
	(437, 'cart.item_exist_in_cart', 'This item is already in stock in the :instance', 'cart', 'en'),
	(438, 'cart.item_exist_in_cart', 'Item này đã có trong :instance rồi', 'cart', 'vi'),
	(439, 'cart.item_over_qty', 'The number of :sku must not exceed :qty', 'cart', 'en'),
	(440, 'cart.item_over_qty', 'Số lượng của :sku không được vượt quá :qty', 'cart', 'vi'),
	(441, 'cart.have_error', 'Có lỗi xảy ra. Vui lòng kiểm tra lại.', 'cart', 'vi'),
	(442, 'cart.have_error', 'Have an error. Please check again.', 'cart', 'en'),
	(443, 'cart.cart_store_id_notfound', 'Không tìm thấy ID cửa hàng.', 'cart', 'vi'),
	(444, 'cart.cart_store_id_notfound', 'Store ID not found', 'cart', 'en'),
	(445, 'cart.cart_empty', 'Giỏ hàng rỗng.', 'cart', 'vi'),
	(446, 'cart.cart_empty', 'The shopping cart is empty', 'cart', 'en'),
	(447, 'cart.cart_store_empty', 'Giỏ hàng trong shop rỗng.', 'cart', 'vi'),
	(448, 'cart.cart_store_empty', 'The shopping cart in the shop is empty', 'cart', 'en'),
	(449, 'checkout.title', 'Checkout', 'checkout', 'en'),
	(450, 'checkout.title', 'Xác nhận thanh toán', 'checkout', 'vi'),
	(451, 'checkout.order_success_msg', 'Thank you for your purchase!', 'checkout', 'en'),
	(452, 'checkout.order_success_msg', 'Cảm ơn vì đơn hàng của bạn!', 'checkout', 'vi'),
	(453, 'checkout.order_success_order_info', 'Your order #:order_id', 'checkout', 'en'),
	(454, 'checkout.order_success_order_info', 'Đơn hàng của bạn là #:order_id', 'checkout', 'vi'),
	(455, 'checkout.page_title', 'Checkout page', 'checkout', 'en'),
	(456, 'checkout.page_title', 'Xác nhận thanh toán', 'checkout', 'vi'),
	(457, 'checkout.success_title', 'Order success', 'checkout', 'en'),
	(458, 'checkout.success_title', 'Đặt hàng thành công', 'checkout', 'vi'),
	(459, 'product.name', 'Name', 'product', 'en'),
	(460, 'product.name', 'Tên', 'product', 'vi'),
	(461, 'product.keyword', 'Keyword ', 'product', 'en'),
	(462, 'product.keyword', 'Từ khóa', 'product', 'vi'),
	(463, 'product.content', 'Main content', 'product', 'en'),
	(464, 'product.content', 'Nội dung chính', 'product', 'vi'),
	(465, 'product.sku', 'SKU code', 'product', 'en'),
	(466, 'product.sku', 'Mã SKU', 'product', 'vi'),
	(467, 'product.stock', 'Stock', 'product', 'en'),
	(468, 'product.stock', 'Số lượng trong kho', 'product', 'vi'),
	(469, 'product.cost', 'Price cost', 'product', 'en'),
	(470, 'product.cost', 'Giá cost', 'product', 'vi'),
	(471, 'product.price', 'Price', 'product', 'en'),
	(472, 'product.price', 'Giá', 'product', 'vi'),
	(473, 'product.image', 'Image', 'product', 'en'),
	(474, 'product.image', 'Hình ảnh', 'product', 'vi'),
	(475, 'product.view', 'Viewed', 'product', 'en'),
	(476, 'product.view', 'Lượt xem', 'product', 'vi'),
	(477, 'product.kind', 'Kind', 'product', 'en'),
	(478, 'product.kind', 'Kiểu', 'product', 'vi'),
	(479, 'product.sold', 'Sold', 'product', 'en'),
	(480, 'product.sold', 'Đã bán', 'product', 'vi'),
	(481, 'product.minimum', 'Minimum', 'product', 'en'),
	(482, 'product.minimum', 'Tối thiểu', 'product', 'vi'),
	(483, 'product.minimum_help', 'Minimum quantity to order', 'product', 'en'),
	(484, 'product.minimum_help', 'Số lượng tối thiểu đề đặt hàng', 'product', 'vi'),
	(485, 'product.width', 'Width', 'product', 'en'),
	(486, 'product.width', 'Chiều rộng', 'product', 'vi'),
	(487, 'product.status', 'Status', 'product', 'en'),
	(488, 'product.status', 'Trạng thái', 'product', 'vi'),
	(489, 'product.quantity', 'Quantity', 'product', 'en'),
	(490, 'product.quantity', 'Số lượng', 'product', 'vi'),
	(491, 'product.weight', 'Weight', 'product', 'en'),
	(492, 'product.weight', 'Khối lượng', 'product', 'vi'),
	(493, 'product.length', 'Length', 'product', 'en'),
	(494, 'product.length', 'Kích thước', 'product', 'vi'),
	(495, 'product.height', 'Height', 'product', 'en'),
	(496, 'product.height', 'Chiều cao', 'product', 'vi'),
	(497, 'product.property', 'Property', 'product', 'en'),
	(498, 'product.property', 'Đặc tính', 'product', 'vi'),
	(499, 'product.download_path', 'Url or path to file', 'product', 'en'),
	(500, 'product.download_path', 'Liên kết hoặc đường dẫn tới tập tin', 'product', 'vi'),
	(501, 'product.attribute', 'Attribute', 'product', 'en'),
	(502, 'product.attribute', 'Thuộc tính', 'product', 'vi'),
	(503, 'product.tax', 'Tax', 'product', 'en'),
	(504, 'product.tax', 'Thuế', 'product', 'vi'),
	(505, 'product.price_group', 'Click view price', 'product', 'en'),
	(506, 'product.price_group', 'Bấm xem giá', 'product', 'vi'),
	(507, 'product.price_group_chose', 'Click choose product', 'product', 'en'),
	(508, 'product.price_group_chose', 'Bấm chọn sản phẩm', 'product', 'vi'),
	(509, 'product.subtotal', 'Subtotal', 'product', 'en'),
	(510, 'product.subtotal', 'Giá sản phẩm', 'product', 'vi'),
	(511, 'product.sub_total', 'Subtotal', 'product', 'en'),
	(512, 'product.sub_total', 'Giá sản phẩm', 'product', 'vi'),
	(513, 'product.total_price', 'Total price', 'product', 'en'),
	(514, 'product.total_price', 'Tổng tiền', 'product', 'vi'),
	(515, 'product.stock_status', 'Stock status', 'product', 'en'),
	(516, 'product.stock_status', 'Trạng thái tồn', 'product', 'vi'),
	(517, 'product.out_stock', 'Out of stock', 'product', 'en'),
	(518, 'product.out_stock', 'Hết hàng', 'product', 'vi'),
	(519, 'product.in_stock', 'In stock', 'product', 'en'),
	(520, 'product.in_stock', 'Còn hàng', 'product', 'vi'),
	(521, 'product.date_available', 'Date available', 'product', 'en'),
	(522, 'product.date_available', 'Ngày bán', 'product', 'vi'),
	(523, 'product.category', 'Category', 'product', 'en'),
	(524, 'product.category', 'Danh mục', 'product', 'vi'),
	(525, 'product.category_store', 'Category store', 'product', 'en'),
	(526, 'product.category_store', 'Danh mục riêng', 'product', 'vi'),
	(527, 'product.brand', 'Brand', 'product', 'en'),
	(528, 'product.brand', 'Nhãn hàng', 'product', 'vi'),
	(529, 'product.supplier', 'Supplier', 'product', 'en'),
	(530, 'product.supplier', 'Nhà cung cấp', 'product', 'vi'),
	(531, 'product.kind_group', 'Group', 'product', 'en'),
	(532, 'product.kind_group', 'Sản phẩm nhóm', 'product', 'vi'),
	(533, 'product.kind_bundle', 'Bundle', 'product', 'en'),
	(534, 'product.kind_bundle', 'Sản phẩm bộ', 'product', 'vi'),
	(535, 'product.kind_single', 'Single', 'product', 'en'),
	(536, 'product.kind_single', 'Sản phẩm đơn', 'product', 'vi'),
	(537, 'product.description', 'Description', 'product', 'en'),
	(538, 'product.description', 'Mô tả', 'product', 'vi'),
	(539, 'product.product_detail', 'Product detail', 'product', 'en'),
	(540, 'product.product_detail', 'Chi tiết sản phẩm', 'product', 'vi'),
	(541, 'product.dont_allow_sale', 'Product :sku dont allow for sale', 'product', 'en'),
	(542, 'product.dont_allow_sale', 'Sản phẩm :sku không bán', 'product', 'vi'),
	(543, 'product.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_"', 'product', 'en'),
	(544, 'product.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_"', 'product', 'vi'),
	(545, 'product.sku_unique', 'SKU already exists', 'product', 'en'),
	(546, 'product.sku_unique', 'SKU đã có rồi', 'product', 'vi'),
	(547, 'product.product_specifications', 'Additional infomation', 'product', 'en'),
	(548, 'product.product_specifications', 'Thông tin bổ sung', 'product', 'vi'),
	(549, 'product.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'product', 'en'),
	(550, 'product.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'product', 'vi'),
	(551, 'product.sku_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and "-_"', 'product', 'en'),
	(552, 'product.sku_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_"', 'product', 'vi'),
	(553, 'product.price_promotion', 'Price promotion', 'product', 'en'),
	(554, 'product.price_promotion', 'Giá khuyến mãi', 'product', 'vi'),
	(555, 'product.price_promotion_start', 'Start date', 'product', 'en'),
	(556, 'product.price_promotion_start', 'Ngày bắt đầu', 'product', 'vi'),
	(557, 'product.price_promotion_end', 'End date', 'product', 'en'),
	(558, 'product.price_promotion_end', 'Ngày kết thúc', 'product', 'vi'),
	(559, 'product.edit_product', 'Edit product', 'product', 'en'),
	(560, 'product.edit_product', 'Chỉnh sửa sản phẩm', 'product', 'vi'),
	(561, 'product.admin.title', 'Quản lý sản phẩm', 'product.admin', 'vi'),
	(562, 'product.admin.create_success', 'Tạo item thành công!', 'product.admin', 'vi'),
	(563, 'product.admin.edit_success', 'chỉnh sửa item thành công!', 'product.admin', 'vi'),
	(564, 'product.admin.list', 'Danh sách sản phẩm', 'product.admin', 'vi'),
	(565, 'product.admin.action', 'Hành động', 'product.admin', 'vi'),
	(566, 'product.admin.delete', 'Xóa', 'product.admin', 'vi'),
	(567, 'product.admin.edit', 'Sửa', 'product.admin', 'vi'),
	(568, 'product.admin.add_new', 'Thêm mới', 'product.admin', 'vi'),
	(569, 'product.admin.add_new_title', 'Tạo sản phẩm', 'product.admin', 'vi'),
	(570, 'product.admin.add_new_title_build', 'Tạo sản phẩm bộ', 'product.admin', 'vi'),
	(571, 'product.admin.add_new_title_group', 'Tạo sản phẩm nhóm', 'product.admin', 'vi'),
	(572, 'product.admin.add_new_des', 'Tạo mới một sản phẩm', 'product.admin', 'vi'),
	(573, 'product.admin.export', 'Xuất', 'product.admin', 'vi'),
	(574, 'product.admin.refresh', 'Làm mới', 'product.admin', 'vi'),
	(575, 'product.admin.select_kind', 'Chọn loại sản phẩm', 'product.admin', 'vi'),
	(576, 'product.admin.select_supplier', 'Chọn nhà cung cấp', 'product.admin', 'vi'),
	(577, 'product.admin.sort', 'Thứ tự', 'product.admin', 'vi'),
	(578, 'product.admin.select_category', 'Chọn danh mục', 'product.admin', 'vi'),
	(579, 'product.admin.select_store', 'Chọn cửa hàng', 'product.admin', 'vi'),
	(580, 'product.admin.select_product_in_group', 'Chọn sản phẩm trong nhóm', 'product.admin', 'vi'),
	(581, 'product.admin.select_product_in_build', 'Chọn sản phẩm trong bộ', 'product.admin', 'vi'),
	(582, 'product.admin.add_product', 'Thêm sản phẩm', 'product.admin', 'vi'),
	(583, 'product.admin.add_attribute', 'Thêm thuộc tính', 'product.admin', 'vi'),
	(584, 'product.admin.add_attribute_place', 'Nhập một thuộc tính', 'product.admin', 'vi'),
	(585, 'product.admin.add_sub_image', 'Thêm ảnh', 'product.admin', 'vi'),
	(586, 'product.admin.add_product_promotion', 'Thêm giá khuyến mãi', 'product.admin', 'vi'),
	(587, 'product.admin.choose_image', 'Chọn hình', 'product.admin', 'vi'),
	(588, 'product.admin.add_price_place', 'Thêm tiền', 'product.admin', 'vi'),
	(589, 'product.admin.setting_info', 'Thiết lập sản phẩm', 'product.admin', 'vi'),
	(590, 'product.admin.config_info', 'Cấu hình thông tin', 'product.admin', 'vi'),
	(591, 'product.admin.title', 'Product manager', 'product.admin', 'en'),
	(592, 'product.admin.create_success', 'Create new item success!', 'product.admin', 'en'),
	(593, 'product.admin.edit_success', 'Edit item success!', 'product.admin', 'en'),
	(594, 'product.admin.list', 'Product list', 'product.admin', 'en'),
	(595, 'product.admin.action', 'Action', 'product.admin', 'en'),
	(596, 'product.admin.delete', 'Delete', 'product.admin', 'en'),
	(597, 'product.admin.edit', 'Edit', 'product.admin', 'en'),
	(598, 'product.admin.add_new', 'Add new', 'product.admin', 'en'),
	(599, 'product.admin.add_new_title', 'Add new product', 'product.admin', 'en'),
	(600, 'product.admin.add_new_title_build', 'Add new product build', 'product.admin', 'en'),
	(601, 'product.admin.add_new_title_group', 'Add new product group', 'product.admin', 'en'),
	(602, 'product.admin.add_new_des', 'Create a new product', 'product.admin', 'en'),
	(603, 'product.admin.export', 'Export', 'product.admin', 'en'),
	(604, 'product.admin.refresh', 'Refresh', 'product.admin', 'en'),
	(605, 'product.admin.select_kind', 'Select product kind', 'product.admin', 'en'),
	(606, 'product.admin.select_supplier', 'Select supplier', 'product.admin', 'en'),
	(607, 'product.admin.result_item', 'Showing <b>:item_from</b> to <b>:item_to</b> of <b>:total</b> items</b>', 'product.admin', 'en'),
	(608, 'product.admin.sort', 'Sort', 'product.admin', 'en'),
	(609, 'product.admin.select_category', 'Select category', 'product.admin', 'en'),
	(610, 'product.admin.select_store', 'Select store', 'product.admin', 'en'),
	(611, 'product.admin.select_product_in_group', 'Select products in group', 'product.admin', 'en'),
	(612, 'product.admin.select_product_in_build', 'Select products build', 'product.admin', 'en'),
	(613, 'product.admin.select_weight', 'Select weight class', 'product.admin', 'en'),
	(614, 'product.admin.select_weight', 'Chọn đơn vị khối lượng', 'product.admin', 'vi'),
	(615, 'product.admin.select_length', 'Select length class', 'product.admin', 'en'),
	(616, 'product.admin.select_length', 'Chọn đơn vị kích thước', 'product.admin', 'vi'),
	(617, 'product.admin.add_product', 'Add product', 'product.admin', 'en'),
	(618, 'product.admin.add_attribute', 'Add attribute', 'product.admin', 'en'),
	(619, 'product.admin.add_attribute_place', 'Add an attribute value', 'product.admin', 'en'),
	(620, 'product.admin.add_sub_image', 'Add more images', 'product.admin', 'en'),
	(621, 'product.admin.add_product_promotion', 'Add promotion price', 'product.admin', 'en'),
	(622, 'product.admin.choose_image', 'Choose', 'product.admin', 'en'),
	(623, 'product.admin.add_price_place', 'Add price', 'product.admin', 'en'),
	(624, 'product.admin.setting_info', 'Setting product', 'product.admin', 'en'),
	(625, 'product.admin.config_info', 'Config info product', 'product.admin', 'en'),
	(626, 'product.admin.search_place', 'Search Name, SKU', 'product.admin', 'en'),
	(627, 'product.admin.search_place', 'Tìm tên và SKU', 'product.admin', 'vi'),
	(628, 'product.admin.length_class', 'Length class', 'product.admin', 'en'),
	(629, 'product.admin.length_class', 'Đơn vị kích thước', 'product.admin', 'vi'),
	(630, 'product.admin.weight_class', 'Weight class', 'product.admin', 'en'),
	(631, 'product.admin.weight_class', 'Đơn vị khối lượng', 'product.admin', 'vi'),
	(632, 'product.admin.cant_remove_child', 'Please delete product parent before remove this product', 'product.admin', 'en'),
	(633, 'product.admin.cant_remove_child', 'Xóa các sản phẩm cha trước khi xóa sản phẩm này', 'product.admin', 'vi'),
	(634, 'product.admin.clone', 'Clone product', 'product.admin', 'en'),
	(635, 'product.admin.clone', 'Nhân bản sản phẩm', 'product.admin', 'vi'),
	(636, 'product.admin.clone_confirm', 'Do you want to clone this product?', 'product.admin', 'en'),
	(637, 'product.admin.clone_confirm', 'Bạn có muốn nhân bản sản phẩm này?', 'product.admin', 'vi'),
	(638, 'product.admin.clone_success', 'Clone product success', 'product.admin', 'en'),
	(639, 'product.admin.clone_success', 'Nhân bản sản phẩm thành công', 'product.admin', 'vi'),
	(640, 'product.config_manager.title', 'Config product', 'product.admin', 'en'),
	(641, 'product.config_manager.field', 'Field config', 'product.admin', 'en'),
	(642, 'product.config_manager.value', 'Value', 'product.admin', 'en'),
	(643, 'product.config_manager.brand', 'Use BRAND', 'product.admin', 'en'),
	(644, 'product.config_manager.supplier', 'Use SUPPLIER', 'product.admin', 'en'),
	(645, 'product.config_manager.price', 'Use PRICE', 'product.admin', 'en'),
	(646, 'product.config_manager.stock', 'Use STOCK', 'product.admin', 'en'),
	(647, 'product.config_manager.cost', 'Use COST PRICE', 'product.admin', 'en'),
	(648, 'product.config_manager.type', 'Use TYPE (new, hot,...)', 'product.admin', 'en'),
	(649, 'product.config_manager.kind', 'Use STRUCTURE TYPE (single, group, bundle)', 'product.admin', 'en'),
	(650, 'product.config_manager.property', 'Use Product Property: download, property, physical', 'product.admin', 'en'),
	(651, 'product.config_manager.attribute', 'Use ATTRIBUTE (color, size,...)', 'product.admin', 'en'),
	(652, 'product.config_manager.promotion', 'Use PROMOTION PRICE', 'product.admin', 'en'),
	(653, 'product.config_manager.available', 'Use Time to start selling', 'product.admin', 'en'),
	(654, 'product.config_manager.tax', 'Tax configuration', 'product.admin', 'en'),
	(655, 'product.config_manager.product_display_price_include_tax', 'Display price include tax', 'product.admin', 'en'),
	(656, 'product.config_manager.weight', 'Use Weight', 'product.admin', 'en'),
	(657, 'product.config_manager.length', 'Use Length', 'product.admin', 'en'),
	(658, 'product.config_manager.required', 'Required', 'product.admin', 'en'),
	(659, 'product.config_manager.title', ' Cấu hình sản phẩm', 'product.admin', 'vi'),
	(660, 'product.config_manager.field', 'Trường cấu hình', 'product.admin', 'vi'),
	(661, 'product.config_manager.value', 'Giá trị', 'product.admin', 'vi'),
	(662, 'product.config_manager.brand', 'Sử dụng NHÃN HIỆU', 'product.admin', 'vi'),
	(663, 'product.config_manager.supplier', 'Sử dụng NHÀ CUNG CẤP', 'product.admin', 'vi'),
	(664, 'product.config_manager.price', 'Sử dụng GIÁ', 'product.admin', 'vi'),
	(665, 'product.config_manager.cost', 'Sử dụng GIÁ GỐC', 'product.admin', 'vi'),
	(666, 'product.config_manager.stock', 'Sử dụng SỐ LƯỢNG', 'product.admin', 'vi'),
	(667, 'product.config_manager.type', 'Sử dụng PHÂN LOẠI TÌNH TRẠNG(mới, hot,...)', 'product.admin', 'vi'),
	(668, 'product.config_manager.kind', 'Sử dụng PHÂN LOẠI THEO CẤU TRÚC (sản phẩm đơn, nhóm, bộ)', 'product.admin', 'vi'),
	(669, 'product.config_manager.property', 'Sử dụng PHÂN LOẠI ĐẶC TÍNH: download, vật lý, dịch vụ,..', 'product.admin', 'vi'),
	(670, 'product.config_manager.attribute', 'Sử dụng THUỘC TÍNH (màu sắc, kích thước,...)', 'product.admin', 'vi'),
	(671, 'product.config_manager.promotion', 'Sử dụng GIÁ KHUYẾN MÃI', 'product.admin', 'vi'),
	(672, 'product.config_manager.available', 'Sử dụng THỜI GIAN MỞ BÁN', 'product.admin', 'vi'),
	(673, 'product.config_manager.tax', 'Cấu hình thuế', 'product.admin', 'vi'),
	(674, 'product.config_manager.product_display_price_include_tax', 'Hiển thị giá bao gồm thuế', 'product.admin', 'vi'),
	(675, 'product.config_manager.weight', 'Sử dụng Khối lượng', 'product.admin', 'vi'),
	(676, 'product.config_manager.length', 'Sử dụng Kích thước', 'product.admin', 'vi'),
	(677, 'product.config_manager.required', 'Bắt buộc', 'product.admin', 'vi'),
	(678, 'product.config_manager.show_date_available', 'Hiện thời gian bán hàng', 'product.admin', 'vi'),
	(679, 'product.config_manager.show_date_available', 'Display date available', 'product.admin', 'en'),
	(680, 'product.config_manager.product_display_out_of_stock', 'Hiện sản phẩm hết hàng', 'product.admin', 'vi'),
	(681, 'product.config_manager.product_display_out_of_stock', 'Display product out of stock', 'product.admin', 'en'),
	(682, 'customer.my_account', 'My page', 'customer', 'en'),
	(683, 'customer.my_account', 'Trang cá nhân', 'customer', 'vi'),
	(684, 'customer.password', 'Password', 'customer', 'en'),
	(685, 'customer.password', 'Mật khẩu', 'customer', 'vi'),
	(686, 'customer.password_new', 'New password', 'customer', 'en'),
	(687, 'customer.password_new', 'Mật khẩu mới', 'customer', 'vi'),
	(688, 'customer.password_old', 'Old password', 'customer', 'en'),
	(689, 'customer.password_old', 'Mật khẩu cũ', 'customer', 'vi'),
	(690, 'customer.password_old_required', 'Old password required', 'customer', 'en'),
	(691, 'customer.password_old_required', 'Mật khẩu cũ là bắt buộc', 'customer', 'vi'),
	(692, 'customer.password_old_notcorrect', 'Old password incorrect', 'customer', 'en'),
	(693, 'customer.password_old_notcorrect', 'Mật khẩu cũ chưa đúng', 'customer', 'vi'),
	(694, 'customer.remember_me', 'Remember', 'customer', 'en'),
	(695, 'customer.remember_me', 'Ghi nhớ', 'customer', 'vi'),
	(696, 'customer.change_password', 'Change password', 'customer', 'en'),
	(697, 'customer.change_password', 'Đổi mật khẩu', 'customer', 'vi'),
	(698, 'customer.update_success', 'Update success', 'customer', 'en'),
	(699, 'customer.update_success', 'Cập nhật thành công', 'customer', 'vi'),
	(700, 'customer.update_infomation', 'Update infomation', 'customer', 'en'),
	(701, 'customer.update_infomation', 'Cập nhật thông tin', 'customer', 'vi'),
	(702, 'customer.change_infomation', 'Change infomation', 'customer', 'en'),
	(703, 'customer.change_infomation', 'Thay đổi thông tin', 'customer', 'vi'),
	(704, 'customer.order_history', 'Order history', 'customer', 'en'),
	(705, 'customer.order_history', 'Lịch sử mua hàng', 'customer', 'vi'),
	(706, 'customer.order_detail', 'Order detail', 'customer', 'en'),
	(707, 'customer.order_detail', 'Chi tiết đơn hàng', 'customer', 'vi'),
	(708, 'customer.address_list', 'Address list', 'customer', 'en'),
	(709, 'customer.address_list', 'Danh sách địa chỉ', 'customer', 'vi'),
	(710, 'customer.address_detail', 'Address detail', 'customer', 'en'),
	(711, 'customer.address_detail', 'Danh sách địa chỉ', 'customer', 'vi'),
	(712, 'customer.address_default', 'Address default', 'customer', 'en'),
	(713, 'customer.address_default', 'Địa chỉ mặc định', 'customer', 'vi'),
	(714, 'customer.address_set_default', 'Set address default', 'customer', 'en'),
	(715, 'customer.address_set_default', 'Đặt địa chỉ mặc định', 'customer', 'vi'),
	(716, 'customer.delete_address_success', 'Delete address success', 'customer', 'en'),
	(717, 'customer.delete_address_success', 'Xóa địa chỉ thành công', 'customer', 'vi'),
	(718, 'customer.verify_email.button_verify', 'Email verification', 'customer', 'en'),
	(719, 'customer.verify_email.button_verify', 'Xác thực email', 'customer', 'vi'),
	(720, 'customer.verify_email.title_page', 'Email verification', 'customer', 'en'),
	(721, 'customer.verify_email.title_page', 'Xác thực email', 'customer', 'vi'),
	(722, 'customer.verify_email.link_invalid', 'Link invalid', 'customer', 'en'),
	(723, 'customer.verify_email.link_invalid', 'Link không hợp lệ', 'customer', 'vi'),
	(724, 'customer.verify_email.verify_success', 'Successful verification', 'customer', 'en'),
	(725, 'customer.verify_email.verify_success', 'Xác thực thành công', 'customer', 'vi'),
	(726, 'customer.verify_email.msg_sent', 'Verification link sent.', 'customer', 'en'),
	(727, 'customer.verify_email.msg_sent', 'Đã gửi liên kết xác minh!', 'customer', 'vi'),
	(728, 'customer.verify_email.msg_page_2', 'click here to request another.', 'customer', 'en'),
	(729, 'customer.verify_email.msg_page_2', 'hãy nhấp vào đây để yêu cầu.', 'customer', 'vi'),
	(730, 'customer.verify_email.msg_page_1', 'Before proceeding, please check your email for a verification link. If you did not receive the email,', 'customer', 'en'),
	(731, 'customer.verify_email.msg_page_1', 'Trước khi tiếp tục, vui lòng kiểm tra email của bạn để biết liên kết xác minh. Nếu bạn không nhận được email,', 'customer', 'vi'),
	(732, 'customer.verify_email.title_header', 'Verify Your Email Address', 'customer', 'en'),
	(733, 'customer.verify_email.title_header', 'Xác minh địa chỉ email của bạn', 'customer', 'vi'),
	(734, 'customer.password_forgot', 'Forgot password', 'customer', 'en'),
	(735, 'customer.password_forgot', 'Quên mật khẩu', 'customer', 'vi'),
	(736, 'customer.login_title', 'Login page', 'customer', 'en'),
	(737, 'customer.login_title', 'Trang đăng nhập', 'customer', 'vi'),
	(738, 'customer.register_success', 'Successful register', 'customer', 'en'),
	(739, 'customer.register_success', 'Đăng ký thành công', 'customer', 'vi'),
	(740, 'customer.signup', 'Signup', 'customer', 'en'),
	(741, 'customer.signup', 'Đăng ký', 'customer', 'vi'),
	(742, 'customer.title_register', 'Account register', 'customer', 'en'),
	(743, 'customer.title_register', 'Đăng ký tài khoản', 'customer', 'vi'),
	(744, 'customer.password_reset', 'Password reset', 'customer', 'en'),
	(745, 'customer.password_reset', 'Reset mật khẩu', 'customer', 'vi'),
	(746, 'customer.password_confirm', 'Password confirm', 'customer', 'en'),
	(747, 'customer.password_confirm', 'Xác nhận mật khẩu', 'customer', 'vi'),
	(748, 'customer.phone_regex', 'The phone format is not correct. Length 8-14, use only 0-9 and the "-" SIGN.', 'customer', 'en'),
	(749, 'customer.phone_regex', 'Số điện thoại định dạng không đúng. Chiều dài 8-14, chỉ sử dụng số 0-9 và "-"', 'customer', 'vi'),
	(750, 'customer.country', 'Country', 'customer', 'en'),
	(751, 'customer.country', 'Quốc gia', 'customer', 'vi'),
	(752, 'customer.company', 'Công ty', 'customer', 'vi'),
	(753, 'customer.company', 'Company', 'customer', 'en'),
	(754, 'customer.address3', 'Địa chỉ nhà', 'customer', 'vi'),
	(755, 'customer.address3', 'Address 3', 'customer', 'en'),
	(756, 'customer.address2', 'Quận/Huyện', 'customer', 'vi'),
	(757, 'customer.address2', 'Address 2', 'customer', 'en'),
	(758, 'customer.address1', 'Tỉnh/Thành', 'customer', 'vi'),
	(759, 'customer.address1', 'Address 1', 'customer', 'en'),
	(760, 'customer.postcode', 'Mã bưu điện', 'customer', 'vi'),
	(761, 'customer.postcode', 'Post code', 'customer', 'en'),
	(762, 'customer.phone', 'Phone', 'customer', 'en'),
	(763, 'customer.phone', 'Điện thoại', 'customer', 'vi'),
	(764, 'customer.last_name_kana', 'Họ kana', 'customer', 'vi'),
	(765, 'customer.last_name_kana', 'Last name kana', 'customer', 'en'),
	(766, 'customer.first_name_kana', 'First name kana', 'customer', 'en'),
	(767, 'customer.first_name_kana', 'Tên Kana', 'customer', 'vi'),
	(768, 'customer.full_name', 'Full name', 'customer', 'en'),
	(769, 'customer.full_name', 'Tên đầy đủ', 'customer', 'vi'),
	(770, 'customer.name', 'Name', 'customer', 'en'),
	(771, 'customer.name', 'Tên', 'customer', 'vi'),
	(772, 'customer.midle_name', 'Tên đệm', 'customer', 'vi'),
	(773, 'customer.midle_name', 'Midle name', 'customer', 'en'),
	(774, 'customer.last_name', 'Họ', 'customer', 'vi'),
	(775, 'customer.last_name', 'Last name', 'customer', 'en'),
	(776, 'customer.first_name', 'Tên', 'customer', 'vi'),
	(777, 'customer.first_name', 'First name', 'customer', 'en'),
	(778, 'customer.email', 'Email', 'customer', 'vi'),
	(779, 'customer.email', 'Email', 'customer', 'en'),
	(780, 'customer.sex', 'Giới tính', 'customer', 'vi'),
	(781, 'customer.sex', 'Sex', 'customer', 'en'),
	(782, 'customer.sex_women', 'Women', 'customer', 'en'),
	(783, 'customer.sex_women', 'Nữ', 'customer', 'vi'),
	(784, 'customer.sex_other', 'Other', 'customer', 'en'),
	(785, 'customer.sex_other', 'Khác', 'customer', 'vi'),
	(786, 'customer.sex_men', 'Men', 'customer', 'en'),
	(787, 'customer.sex_men', 'Nam', 'customer', 'vi'),
	(788, 'customer.birthday', 'Ngày sinh', 'customer', 'vi'),
	(789, 'customer.birthday', 'Birthday', 'customer', 'en'),
	(790, 'customer.title_login', 'Login account', 'customer', 'en'),
	(791, 'customer.title_login', 'Đăng nhập', 'customer', 'vi'),
	(792, 'customer.my_profile', 'Tài khoản', 'customer', 'vi'),
	(793, 'customer.my_profile', 'My profile', 'customer', 'en'),
	(794, 'customer.status', 'Trạng thái', 'customer', 'vi'),
	(795, 'customer.status', 'Status', 'customer', 'en'),
	(796, 'customer.group', 'Nhóm', 'customer', 'en'),
	(797, 'customer.group', 'Group', 'customer', 'vi'),
	(798, 'customer.admin.add_new_title', 'Thêm mới khách hàng', 'customer.admin', 'vi'),
	(799, 'customer.admin.add_new_title', 'Add new customer', 'customer.admin', 'en'),
	(800, 'customer.admin.add_new_des', 'Thêm mới', 'customer.admin', 'vi'),
	(801, 'customer.admin.add_new_des', 'Add new', 'customer.admin', 'en'),
	(802, 'customer.admin.provider', 'Provider', 'customer.admin', 'vi'),
	(803, 'customer.admin.provider', 'Provider', 'customer.admin', 'en'),
	(804, 'customer.admin.field', 'Trường dữ liệu', 'customer.admin', 'vi'),
	(805, 'customer.admin.field', 'Field data', 'customer.admin', 'en'),
	(806, 'customer.admin.value', 'Giá trị', 'customer.admin', 'vi'),
	(807, 'customer.admin.value', 'Value', 'customer.admin', 'en'),
	(808, 'customer.admin.required', 'Bắt buộc', 'customer.admin', 'vi'),
	(809, 'customer.admin.required', 'Required', 'customer.admin', 'en'),
	(810, 'customer.admin.keep_password', 'Giữ mật khẩu', 'customer.admin', 'vi'),
	(811, 'customer.admin.keep_password', 'Keep password', 'customer.admin', 'en'),
	(812, 'customer.admin.list', 'Danh sách khách hàng', 'customer.admin', 'vi'),
	(813, 'customer.admin.list', 'Customer list', 'customer.admin', 'en'),
	(814, 'customer.config_manager.title', ' Config customer', 'customer.admin', 'en'),
	(815, 'customer.config_manager.field', 'Field config', 'customer.admin', 'en'),
	(816, 'customer.config_manager.value', 'Value', 'customer.admin', 'en'),
	(817, 'customer.config_manager.lastname', 'Use last name', 'customer.admin', 'en'),
	(818, 'customer.config_manager.name_kana', 'Use name KANA', 'customer.admin', 'en'),
	(819, 'customer.config_manager.firstname_kana', 'Use first name KANA', 'customer.admin', 'en'),
	(820, 'customer.config_manager.lastname_kana', 'Use last name KANA', 'customer.admin', 'en'),
	(821, 'customer.config_manager.address1', 'Use ADDRESS 1', 'customer.admin', 'en'),
	(822, 'customer.config_manager.address2', 'Use ADDRESS 2', 'customer.admin', 'en'),
	(823, 'customer.config_manager.address3', 'Use ADDRESS 3', 'customer.admin', 'en'),
	(824, 'customer.config_manager.company', 'Use COMPANY', 'customer.admin', 'en'),
	(825, 'customer.config_manager.postcode', 'Use POSTCODE', 'customer.admin', 'en'),
	(826, 'customer.config_manager.country', 'Use COUNTRY', 'customer.admin', 'en'),
	(827, 'customer.config_manager.group', 'Use GROUP', 'customer.admin', 'en'),
	(828, 'customer.config_manager.birthday', 'Use BIRTHDAY', 'customer.admin', 'en'),
	(829, 'customer.config_manager.sex', 'Use SEX', 'customer.admin', 'en'),
	(830, 'customer.config_manager.phone', 'Use PHONE', 'customer.admin', 'en'),
	(831, 'customer.config_manager.reqired', 'Required', 'customer.admin', 'en'),
	(832, 'customer.config_manager.title', ' Cấu hình khách hàng', 'customer.admin', 'vi'),
	(833, 'customer.config_manager.lastname', 'Sử dụng HỌ', 'customer.admin', 'vi'),
	(834, 'customer.config_manager.name_kana', 'Sử dụng tên KANA', 'customer.admin', 'vi'),
	(835, 'customer.config_manager.firstname_kana', 'Sử dụng tên KANA', 'customer.admin', 'vi'),
	(836, 'customer.config_manager.lasttname_kana', 'Sử dụng họ KANA', 'customer.admin', 'vi'),
	(837, 'customer.config_manager.address1', 'Sử dụng Tỉnh/Thành', 'customer.admin', 'vi'),
	(838, 'customer.config_manager.address2', 'Sử dụng Quận/Huyện', 'customer.admin', 'vi'),
	(839, 'customer.config_manager.address3', 'Địa chỉ nhà', 'customer.admin', 'vi'),
	(840, 'customer.config_manager.company', 'Sử dụng Công Ty', 'customer.admin', 'vi'),
	(841, 'customer.config_manager.postcode', 'Sử dụng Mã bưu chính', 'customer.admin', 'vi'),
	(842, 'customer.config_manager.country', 'Sử dụng Quốc Gia', 'customer.admin', 'vi'),
	(843, 'customer.config_manager.group', 'Sử dụng Nhóm', 'customer.admin', 'vi'),
	(844, 'customer.config_manager.birthday', 'Sử dụng NGÀY SINH', 'customer.admin', 'vi'),
	(845, 'customer.config_manager.sex', 'Sử dụng GIỚI TÍNH', 'customer.admin', 'vi'),
	(846, 'customer.config_manager.phone', 'Sử dụng SỐ ĐIỆN THOẠI', 'customer.admin', 'vi'),
	(847, 'customer.config_manager.required', 'Bắt buộc', 'customer.admin', 'vi'),
	(848, 'order.order_status', 'Trạng thái đơn hàng', 'order', 'vi'),
	(849, 'order.order_status', 'Order status', 'order', 'en'),
	(850, 'order.shipping_status', 'Trạng thái vận chuyển', 'order', 'vi'),
	(851, 'order.shipping_status', 'Shipping status', 'order', 'en'),
	(852, 'order.payment_status', 'Trạng thái thanh toán', 'order', 'vi'),
	(853, 'order.payment_status', 'Payment status', 'order', 'en'),
	(854, 'order.payment_method', 'Phương thức thanh toán', 'order', 'vi'),
	(855, 'order.payment_method', 'Payment method', 'order', 'en'),
	(856, 'order.shipping_method', 'Phương thức vận chuyển', 'order', 'vi'),
	(857, 'order.shipping_method', 'Shipping method', 'order', 'en'),
	(858, 'order.currency', 'Tiền tệ', 'order', 'vi'),
	(859, 'order.currency', 'Currency', 'order', 'en'),
	(860, 'order.exchange_rate', 'Tỉ giá', 'order', 'vi'),
	(861, 'order.exchange_rate', 'Exchange rate', 'order', 'en'),
	(862, 'order.balance', 'Còn lại', 'order', 'vi'),
	(863, 'order.balance', 'Balance', 'order', 'en'),
	(864, 'order.total', 'Tổng tiền', 'order', 'vi'),
	(865, 'order.total', 'Total', 'order', 'en'),
	(866, 'order.sub_total', 'Tiền hàng', 'order', 'vi'),
	(867, 'order.sub_total', 'SubTotal', 'order', 'en'),
	(868, 'order.subtotal', 'Tiền hàng', 'order', 'vi'),
	(869, 'order.subtotal', 'SubTotal', 'order', 'en'),
	(870, 'order.tax', 'Thuế', 'order', 'vi'),
	(871, 'order.tax', 'Tax', 'order', 'en'),
	(872, 'order.shipping', 'Vận chuyển', 'order', 'vi'),
	(873, 'order.shipping', 'Shipping', 'order', 'en'),
	(874, 'order.received', 'Đã nhận', 'order', 'vi'),
	(875, 'order.received', 'Received', 'order', 'en'),
	(876, 'order.discount', 'Giảm giá', 'order', 'vi'),
	(877, 'order.discount', 'Discount', 'order', 'en'),
	(878, 'order.totals.total', 'Tổng tiền', 'order', 'vi'),
	(879, 'order.totals.total', 'Total', 'order', 'en'),
	(880, 'order.totals.sub_total', 'Tiền hàng', 'order', 'vi'),
	(881, 'order.totals.sub_total', 'SubTotal', 'order', 'en'),
	(882, 'order.totals.tax', 'Thuế', 'order', 'vi'),
	(883, 'order.totals.tax', 'Tax', 'order', 'en'),
	(884, 'order.totals.discount', 'Giảm giá', 'order', 'vi'),
	(885, 'order.totals.discount', 'Discount', 'order', 'en'),
	(886, 'order.totals.shipping', 'Vận chuyển', 'order', 'vi'),
	(887, 'order.totals.shipping', 'Shipping', 'order', 'en'),
	(888, 'order.totals.received', 'Đã nhận', 'order', 'vi'),
	(889, 'order.totals.received', 'Received', 'order', 'en'),
	(890, 'order.detail', 'Chi tiết', 'order', 'vi'),
	(891, 'order.detail', 'Order detail', 'order', 'en'),
	(892, 'order.phone_regex', 'The phone format is not correct. Length 8-14, use only 0-9 and the "-" SIGN.', 'order', 'en'),
	(893, 'order.phone_regex', 'Số điện thoại định dạng không đúng. Chiều dài 8-14, chỉ sử dụng số 0-9 và "-"', 'order', 'vi'),
	(894, 'order.country', 'Country', 'order', 'en'),
	(895, 'order.country', 'Quốc gia', 'order', 'vi'),
	(896, 'order.company', 'Công ty', 'order', 'vi'),
	(897, 'order.company', 'Company', 'order', 'en'),
	(898, 'order.address3', 'Địa chỉ nhà', 'order', 'vi'),
	(899, 'order.address3', 'Address 3', 'order', 'en'),
	(900, 'order.address2', 'Quận/Huyện', 'order', 'vi'),
	(901, 'order.address2', 'Address 2', 'order', 'en'),
	(902, 'order.address1', 'Tỉnh/Thành', 'order', 'vi'),
	(903, 'order.address1', 'Address 1', 'order', 'en'),
	(904, 'order.address', 'Địa chỉ', 'order', 'vi'),
	(905, 'order.address', 'Address', 'order', 'en'),
	(906, 'order.postcode', 'Mã bưu điện', 'order', 'vi'),
	(907, 'order.postcode', 'Post code', 'order', 'en'),
	(908, 'order.phone', 'Phone', 'order', 'en'),
	(909, 'order.phone', 'Điện thoại', 'order', 'vi'),
	(910, 'order.last_name_kana', 'Họ kana', 'order', 'vi'),
	(911, 'order.last_name_kana', 'Last name kana', 'order', 'en'),
	(912, 'order.first_name_kana', 'First name kana', 'order', 'en'),
	(913, 'order.first_name_kana', 'Tên Kana', 'order', 'vi'),
	(914, 'order.full_name', 'Full name', 'order', 'en'),
	(915, 'order.full_name', 'Tên đầy đủ', 'order', 'vi'),
	(916, 'order.name', 'Name', 'order', 'en'),
	(917, 'order.name', 'Tên', 'order', 'vi'),
	(918, 'order.midle_name', 'Tên đệm', 'order', 'vi'),
	(919, 'order.midle_name', 'Midle name', 'order', 'en'),
	(920, 'order.last_name', 'Họ', 'order', 'vi'),
	(921, 'order.last_name', 'Last name', 'order', 'en'),
	(922, 'order.first_name', 'Tên', 'order', 'vi'),
	(923, 'order.first_name', 'First name', 'order', 'en'),
	(924, 'order.email', 'Email', 'order', 'vi'),
	(925, 'order.email', 'Email', 'order', 'en'),
	(926, 'order.sex', 'Giới tính', 'order', 'vi'),
	(927, 'order.sex', 'Sex', 'order', 'en'),
	(928, 'order.sex_women', 'Women', 'order', 'en'),
	(929, 'order.sex_women', 'Nữ', 'order', 'vi'),
	(930, 'order.sex_other', 'Other', 'order', 'en'),
	(931, 'order.sex_other', 'Khác', 'order', 'vi'),
	(932, 'order.sex_men', 'Men', 'order', 'en'),
	(933, 'order.sex_men', 'Nam', 'order', 'vi'),
	(934, 'order.birthday', 'Ngày sinh', 'order', 'vi'),
	(935, 'order.birthday', 'Birthday', 'order', 'en'),
	(936, 'order.status', 'Trạng thái đơn hàng', 'order', 'vi'),
	(937, 'order.status', 'Order status', 'order', 'en'),
	(938, 'order.order_detail', 'Chi tiết đơn hàng', 'order', 'vi'),
	(939, 'order.order_detail', 'Order detail', 'order', 'en'),
	(940, 'order.note', 'Note', 'order', 'en'),
	(941, 'order.note', 'Ghi chú', 'order', 'vi'),
	(942, 'order.order_note', 'Note', 'order', 'en'),
	(943, 'order.order_note', 'Ghi chú', 'order', 'vi'),
	(944, 'order.domain', 'Domain', 'order', 'en'),
	(945, 'order.domain', 'Tên miền', 'order', 'vi'),
	(946, 'order.admin.order_history', 'Order history', 'order.admin', 'en'),
	(947, 'order.admin.history_staff', 'Staff', 'order.admin', 'en'),
	(948, 'order.admin.history_content', 'Content', 'order.admin', 'en'),
	(949, 'order.admin.history_time', 'Time', 'order.admin', 'en'),
	(950, 'order.admin.order_history', 'Lịch sử đơn hàng', 'order.admin', 'vi'),
	(951, 'order.admin.history_staff', 'Nhân viên', 'order.admin', 'vi'),
	(952, 'order.admin.history_content', 'Nội dung', 'order.admin', 'vi'),
	(953, 'order.admin.history_time', 'Thời gian', 'order.admin', 'vi'),
	(954, 'order.admin.title', 'Quản lý đơn hàng', 'order.admin', 'vi'),
	(955, 'order.admin.config_title', 'Cấu hình đơn hàng', 'order.admin', 'vi'),
	(956, 'order.admin.list', 'Danh sách đơn hàng', 'order.admin', 'vi'),
	(957, 'order.admin.payment_method', 'Phương thức thanh toán', 'order.admin', 'vi'),
	(958, 'order.admin.payment_method_short', 'Payment method', 'order.admin', 'vi'),
	(959, 'order.admin.currency', 'Tiền tệ', 'order.admin', 'vi'),
	(960, 'order.admin.exchange_rate', 'Tỉ giá', 'order.admin', 'vi'),
	(961, 'order.admin.order_new', 'Thêm mới', 'order.admin', 'vi'),
	(962, 'order.admin.add_new', 'Thêm mới', 'order.admin', 'vi'),
	(963, 'order.admin.add_new_title', 'Tạo đơn hàng', 'order.admin', 'vi'),
	(964, 'order.admin.add_new_des', 'Tạo mới một đơn hàng', 'order.admin', 'vi'),
	(965, 'order.admin.export_batch', 'Xuất', 'order.admin', 'vi'),
	(966, 'order.admin.config_info', 'Cấu hình đơn hàng', 'order.admin', 'vi'),
	(967, 'order.admin.store', 'Cửa hàng', 'order.admin', 'vi'),
	(968, 'order.admin.title', 'Order manager', 'order.admin', 'en'),
	(969, 'order.admin.config_title', 'Config info order', 'order.admin', 'en'),
	(970, 'order.admin.list', 'Order list', 'order.admin', 'en'),
	(971, 'order.admin.payment_method', 'Payment method', 'order.admin', 'en'),
	(972, 'order.admin.payment_method_short', 'Payment method', 'order.admin', 'en'),
	(973, 'order.admin.currency', 'Currency', 'order.admin', 'en'),
	(974, 'order.admin.exchange_rate', 'Exchange rate', 'order.admin', 'en'),
	(975, 'order.admin.status', 'Status', 'order.admin', 'en'),
	(976, 'order.admin.status', 'Trạng thái', 'order.admin', 'vi'),
	(977, 'order.admin.created_at', 'Created at', 'order.admin', 'en'),
	(978, 'order.admin.created_at', 'Tạo lúc', 'order.admin', 'vi'),
	(979, 'order.admin.order_new', 'Add new', 'order.admin', 'en'),
	(980, 'order.admin.add_new', 'Add new', 'order.admin', 'en'),
	(981, 'order.admin.add_new_title', 'Add new order', 'order.admin', 'en'),
	(982, 'order.admin.add_new_des', 'Create a new order', 'order.admin', 'en'),
	(983, 'order.admin.export_batch', 'Export', 'order.admin', 'en'),
	(984, 'order.admin.config_info', 'Config order', 'order.admin', 'en'),
	(985, 'order.admin.store', 'Store', 'order.admin', 'en'),
	(986, 'order.admin.search_order_status', 'Search order status', 'order.admin', 'en'),
	(987, 'order.admin.search_order_status', 'Tìm trạng thái đơn hàng', 'order.admin', 'vi'),
	(988, 'order.admin.search_email', 'Search email', 'order.admin', 'en'),
	(989, 'order.admin.search_email', 'Tìm email', 'order.admin', 'vi'),
	(990, 'order.admin.search_id', 'Search id', 'order.admin', 'en'),
	(991, 'order.admin.search_id', 'Tìm ID', 'order.admin', 'vi'),
	(992, 'order.admin.select_product', 'Select product', 'order.admin', 'en'),
	(993, 'order.admin.select_product', 'Chọn sản phẩm', 'order.admin', 'vi'),
	(994, 'order.admin.product_buy_out_of_stock', 'Allow buy out of stock', 'order.admin', 'en'),
	(995, 'order.admin.product_buy_out_of_stock', 'Cho phép mua hàng đã hết', 'order.admin', 'vi'),
	(996, 'order.admin.shipping_off', 'Dont use shipping method', 'order.admin', 'en'),
	(997, 'order.admin.shipping_off', 'Không sử dụng phương thức vận chuyển', 'order.admin', 'vi'),
	(998, 'order.admin.payment_off', 'Dont use payment method', 'order.admin', 'en'),
	(999, 'order.admin.payment_off', 'Không sử dụng phương thức thanh toán', 'order.admin', 'vi'),
	(1000, 'order.admin.product_preorder', 'Allow pre-order', 'order.admin', 'en'),
	(1001, 'order.admin.product_preorder', 'Cho phép đặt hàng trước', 'order.admin', 'vi'),
	(1002, 'order.admin.shop_allow_guest', 'Allow buy no need login', 'order.admin', 'en'),
	(1003, 'order.admin.shop_allow_guest', 'Cho phép mua không cần đăng nhập', 'order.admin', 'vi'),
	(1004, 'order.admin.select_customer', 'Select customer', 'order.admin', 'en'),
	(1005, 'order.admin.select_customer', 'Chọn khách hàng', 'order.admin', 'vi'),
	(1006, 'contact.name', 'Tên', 'contact', 'vi'),
	(1007, 'contact.name', 'Name', 'contact', 'en'),
	(1008, 'contact.email', 'Email', 'contact', 'vi'),
	(1009, 'contact.email', 'Email', 'contact', 'en'),
	(1010, 'contact.phone', 'Điện thoại', 'contact', 'vi'),
	(1011, 'contact.phone', 'Phone', 'contact', 'en'),
	(1012, 'contact.subject', 'Tiêu đề', 'contact', 'vi'),
	(1013, 'contact.subject', 'Subject', 'contact', 'en'),
	(1014, 'contact.content', 'Nội dung', 'contact', 'vi'),
	(1015, 'contact.content', 'content', 'contact', 'en'),
	(1016, 'contact.page_title', 'Liên hệ', 'contact', 'vi'),
	(1017, 'contact.page_title', 'Contact page', 'contact', 'en'),
	(1018, 'contact.thank_contact', 'Cảm ơn vì bạn đã liên hệ', 'contact', 'vi'),
	(1019, 'contact.thank_contact', 'Thank you for your contact', 'contact', 'en'),
	(1020, 'filter_sort.sort', 'Thứ tự', 'filter_sort', 'vi'),
	(1021, 'filter_sort.sort', 'Sort', 'filter_sort', 'en'),
	(1022, 'filter_sort.price_asc', 'Giá tăng dần', 'filter_sort', 'vi'),
	(1023, 'filter_sort.price_asc', 'Price ascending', 'filter_sort', 'en'),
	(1024, 'filter_sort.price_desc', 'Giá giảm dần', 'filter_sort', 'vi'),
	(1025, 'filter_sort.price_desc', 'Price descending', 'filter_sort', 'en'),
	(1026, 'filter_sort.sort_asc', 'Sort tăng dần', 'filter_sort', 'vi'),
	(1027, 'filter_sort.sort_asc', 'Sort ascending', 'filter_sort', 'en'),
	(1028, 'filter_sort.sort_desc', 'Sort giảm dần', 'filter_sort', 'vi'),
	(1029, 'filter_sort.sort_desc', 'Sort descending', 'filter_sort', 'en'),
	(1030, 'filter_sort.id_asc', 'ID tăng dần', 'filter_sort', 'vi'),
	(1031, 'filter_sort.id_asc', 'ID ascending', 'filter_sort', 'en'),
	(1032, 'filter_sort.id_desc', 'ID giảm dần', 'filter_sort', 'vi'),
	(1033, 'filter_sort.id_desc', 'ID descending', 'filter_sort', 'en'),
	(1034, 'filter_sort.name_desc', 'Tên theo thứ tự z-a', 'filter_sort', 'vi'),
	(1035, 'filter_sort.name_desc', 'Name in z-a order', 'filter_sort', 'en'),
	(1036, 'filter_sort.name_asc', 'Tên theo thứ tự a-z', 'filter_sort', 'vi'),
	(1037, 'filter_sort.name_asc', 'Name in a-z order', 'filter_sort', 'en'),
	(1038, 'filter_sort.first_name_desc', 'Tên theo thứ tự z-a', 'filter_sort', 'vi'),
	(1039, 'filter_sort.first_name_desc', 'First name in z-a order', 'filter_sort', 'en'),
	(1040, 'filter_sort.first_name_asc', 'Tên theo thứ tự a-z', 'filter_sort', 'vi'),
	(1041, 'filter_sort.first_name_asc', 'First name in a-z order', 'filter_sort', 'en'),
	(1042, 'filter_sort.last_name_desc', 'Họ theo thứ tự z-a', 'filter_sort', 'vi'),
	(1043, 'filter_sort.last_name_desc', 'Last name in z-a order', 'filter_sort', 'en'),
	(1044, 'filter_sort.last_name_asc', 'Họ theo thứ tự a-z', 'filter_sort', 'vi'),
	(1045, 'filter_sort.last_name_asc', 'Last name in a-z order', 'filter_sort', 'en'),
	(1046, 'filter_sort.title_desc', 'Tiêu đề theo thứ tự z-a', 'filter_sort', 'vi'),
	(1047, 'filter_sort.title_desc', 'Title in z-a order', 'filter_sort', 'en'),
	(1048, 'filter_sort.title_asc', 'Tiêu đề theo thứ tự a-z', 'filter_sort', 'vi'),
	(1049, 'filter_sort.title_asc', 'Title in a-z order', 'filter_sort', 'en'),
	(1050, 'filter_sort.sold_asc', 'Bán ra tăng dần', 'filter_sort', 'vi'),
	(1051, 'filter_sort.sold_asc', 'Sold ascending', 'filter_sort', 'en'),
	(1052, 'filter_sort.sold_desc', 'Bán ra giảm dần', 'filter_sort', 'vi'),
	(1053, 'filter_sort.sold_desc', 'Sold descending', 'filter_sort', 'en'),
	(1054, 'filter_sort.view_desc', 'Lượt xem giảm dần', 'filter_sort', 'vi'),
	(1055, 'filter_sort.view_desc', 'View descending', 'filter_sort', 'en'),
	(1056, 'filter_sort.view_asc', 'Lượt xem tăng dần', 'filter_sort', 'vi'),
	(1057, 'filter_sort.view_asc', 'View ascending', 'filter_sort', 'en'),
	(1058, 'filter_sort.alpha_desc', ':alpha theo thứ tự z-a', 'filter_sort', 'vi'),
	(1059, 'filter_sort.alpha_desc', ':alpha in z-a order', 'filter_sort', 'en'),
	(1060, 'filter_sort.alpha_asc', ':alpha theo thứ tự a-z', 'filter_sort', 'vi'),
	(1061, 'filter_sort.alpha_asc', ':alpha in a-z order', 'filter_sort', 'en'),
	(1062, 'filter_sort.value_asc', ':value tăng dần', 'filter_sort', 'vi'),
	(1063, 'filter_sort.value_asc', ':value ascending', 'filter_sort', 'en'),
	(1064, 'filter_sort.value_desc', ':value giảm dần', 'filter_sort', 'vi'),
	(1065, 'filter_sort.value_desc', ':value descending', 'filter_sort', 'en'),
	(1066, 'subscribe.email', 'Email', 'subscribe', 'en'),
	(1067, 'subscribe.action', 'Subscribe', 'subscribe', 'en'),
	(1068, 'subscribe.title', 'Subscribe email', 'subscribe', 'en'),
	(1069, 'subscribe.subscribe_des', 'Get the most recent updates from us', 'subscribe', 'en'),
	(1070, 'subscribe.subscribe_email', 'Your email', 'subscribe', 'en'),
	(1071, 'subscribe.subscribe_success', 'Subscribe email successful!', 'subscribe', 'en'),
	(1072, 'subscribe.email', 'Email', 'subscribe', 'vi'),
	(1073, 'subscribe.action', 'Đăng ký', 'subscribe', 'vi'),
	(1074, 'subscribe.title', 'Đăng ký email', 'subscribe', 'vi'),
	(1075, 'subscribe.subscribe_des', 'Nhận cập nhật mới nhất', 'subscribe', 'vi'),
	(1076, 'subscribe.subscribe_email', 'Email của bạn', 'subscribe', 'vi'),
	(1077, 'subscribe.subscribe_success', 'Đăng ký email thành công!', 'subscribe', 'vi'),
	(1078, 'subscribe.admin.email', 'Email', 'subscribe.admin', 'vi'),
	(1079, 'subscribe.admin.email', 'Email', 'subscribe.admin', 'en'),
	(1080, 'subscribe.admin.list', 'Danh sách đang ký', 'subscribe.admin', 'vi'),
	(1081, 'subscribe.admin.list', 'Subscribe list', 'subscribe.admin', 'en'),
	(1082, 'subscribe.admin.status', 'Trạng thái', 'subscribe.admin', 'vi'),
	(1083, 'subscribe.admin.status', 'Status', 'subscribe.admin', 'en'),
	(1084, 'subscribe.admin.add_new_title', 'Thêm đăng ký', 'subscribe.admin', 'vi'),
	(1085, 'subscribe.admin.add_new_title', 'Add subscribe', 'subscribe.admin', 'en'),
	(1086, 'subscribe.admin.add_new_des', 'Thêm tài khoản đăng ký', 'subscribe.admin', 'vi'),
	(1087, 'subscribe.admin.add_new_des', 'Add a new subscribe', 'subscribe.admin', 'en'),
	(1088, 'subscribe.admin.search_place', 'Search ID or email', 'subscribe.admin', 'en'),
	(1089, 'subscribe.admin.search_place', 'Tìm ID hoặc email', 'admin.subscribe', 'vi'),
	(1090, 'about.page_title', 'About us', 'about', 'en'),
	(1091, 'about.page_title', 'Giới thiệu', 'about', 'vi'),
	(1092, 'admin.user.setting', 'Setting', 'admin.user', 'en'),
	(1093, 'admin.user.setting', 'Cài đặt', 'admin.user', 'vi'),
	(1094, 'admin.user.logout', 'Logout', 'admin.user', 'en'),
	(1095, 'admin.user.logout', 'Đăng xuất', 'admin.user', 'vi'),
	(1096, 'admin.user.username', 'User name', 'admin.user', 'en'),
	(1097, 'admin.user.username', 'Tên đăng nhập', 'admin.user', 'vi'),
	(1098, 'admin.user.password', 'Password', 'admin.user', 'en'),
	(1099, 'admin.user.password', 'Mật khẩu', 'admin.user', 'vi'),
	(1100, 'admin.user.remember_me', 'Remember', 'admin.user', 'en'),
	(1101, 'admin.user.remember_me', 'Ghi nhớ', 'admin.user', 'vi'),
	(1102, 'admin.user.login', 'Login', 'admin.user', 'en'),
	(1103, 'admin.user.login', 'Đăng nhập', 'admin.user', 'vi'),
	(1104, 'admin.user.keep_password', 'Để trống nếu không muốn thay đổi mật khẩu', 'admin.user', 'vi'),
	(1105, 'admin.user.select_roles', 'Chọn vai trò', 'admin.user', 'vi'),
	(1106, 'admin.user.select_permission', 'Chọn quyền hạn', 'admin.user', 'vi'),
	(1107, 'admin.user.add_permission', 'Thêm quyền hạn', 'admin.user', 'vi'),
	(1108, 'admin.user.select_store', 'Chọn cửa hàng', 'admin.user', 'vi'),
	(1109, 'admin.user.name', 'Tên đầy đủ', 'admin.user', 'vi'),
	(1110, 'admin.user.user_name', 'Tên đăng nhập', 'admin.user', 'vi'),
	(1111, 'admin.user.email', 'Email', 'admin.user', 'vi'),
	(1112, 'admin.user.avatar', 'Hình đại diện', 'admin.user', 'vi'),
	(1113, 'admin.user.roles', 'vai trò', 'admin.user', 'vi'),
	(1114, 'admin.user.permission', 'Quyền hạn', 'admin.user', 'vi'),
	(1115, 'admin.user.created_at', 'Tạo lúc', 'admin.user', 'vi'),
	(1116, 'admin.user.updated_at', 'Cập nhật', 'admin.user', 'vi'),
	(1117, 'admin.user.member_since', 'Tham gia từ', 'admin.user', 'vi'),
	(1118, 'admin.user.password_confirmation', 'Xác nhận mật khẩu', 'admin.user', 'vi'),
	(1119, 'admin.user.username_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and ".@_" ', 'admin.user', 'vi'),
	(1120, 'admin.user.title', 'Quản lý người dùng', 'admin.user', 'vi'),
	(1121, 'admin.user.list', 'Danh sách người dùng', 'admin.user', 'vi'),
	(1122, 'admin.user.add_new', 'Thêm mới', 'admin.user', 'vi'),
	(1123, 'admin.user.add_new_title', 'Tạo người dùng', 'admin.user', 'vi'),
	(1124, 'admin.user.add_new_des', 'Tạo mới người dùng', 'admin.user', 'vi'),
	(1125, 'admin.user.name', 'Full name', 'admin.user', 'en'),
	(1126, 'admin.user.user_name', 'User name', 'admin.user', 'en'),
	(1127, 'admin.user.email', 'Email', 'admin.user', 'en'),
	(1128, 'admin.user.avatar', 'Avatar', 'admin.user', 'en'),
	(1129, 'admin.user.roles', 'Roles', 'admin.user', 'en'),
	(1130, 'admin.user.permission', 'Permission', 'admin.user', 'en'),
	(1131, 'admin.user.created_at', 'Created at', 'admin.user', 'en'),
	(1132, 'admin.user.updated_at', 'Updated at', 'admin.user', 'en'),
	(1133, 'admin.user.member_since', 'Member since', 'admin.user', 'en'),
	(1134, 'admin.user.password_confirmation', 'Confirmation', 'admin.user', 'en'),
	(1135, 'admin.user.username_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and ".@_" ', 'admin.user', 'en'),
	(1136, 'admin.user.keep_password', 'Leave blank if you dont want to change the password', 'admin.user', 'en'),
	(1137, 'admin.user.select_roles', 'Select roles', 'admin.user', 'en'),
	(1138, 'admin.user.select_permission', 'Select permission', 'admin.user', 'en'),
	(1139, 'admin.user.add_permission', 'Add permission', 'admin.user', 'en'),
	(1140, 'admin.user.select_store', 'Select store', 'admin.user', 'en'),
	(1141, 'admin.user.add_new', 'Add new', 'admin.user', 'en'),
	(1142, 'admin.user.add_new_title', 'Add new user', 'admin.user', 'en'),
	(1143, 'admin.user.add_new_des', 'Create a new user', 'admin.user', 'en'),
	(1144, 'admin.user.list', 'User list', 'admin.user', 'en'),
	(1145, 'admin.user.title', 'User manager', 'admin.user', 'en'),
	(1146, 'admin.user.search_place', 'Search name', 'admin.user', 'en'),
	(1147, 'admin.user.search_place', 'Tìm tên', 'admin.user', 'vi'),
	(1148, 'admin.menu_titles.order_manager', 'Quản lý đơn hàng', 'admin.menu_titles', 'vi'),
	(1149, 'admin.menu_titles.order_manager', 'Order manager', 'admin.menu_titles', 'en'),
	(1150, 'admin.menu_titles.catalog_mamager', 'Sản phẩm & danh mục', 'admin.menu_titles', 'vi'),
	(1151, 'admin.menu_titles.catalog_mamager', 'Product & category', 'admin.menu_titles', 'en'),
	(1152, 'admin.menu_titles.customer_manager', 'Quản lý khách hàng', 'admin.menu_titles', 'vi'),
	(1153, 'admin.menu_titles.customer_manager', 'Customer manager', 'admin.menu_titles', 'en'),
	(1154, 'admin.menu_titles.admin_global', 'Quản lý chung', 'admin.menu_titles', 'vi'),
	(1155, 'admin.menu_titles.admin_global', 'Admin global', 'admin.menu_titles', 'en'),
	(1156, 'admin.menu_titles.ADMIN_SHOP', 'Cửa hàng', 'admin.menu_titles', 'vi'),
	(1157, 'admin.menu_titles.ADMIN_SHOP', 'Admin shop', 'admin.menu_titles', 'en'),
	(1158, 'admin.menu_titles.ADMIN_CONTENT', 'Nội dung', 'admin.menu_titles', 'vi'),
	(1159, 'admin.menu_titles.ADMIN_CONTENT', 'Content', 'admin.menu_titles', 'en'),
	(1160, 'admin.menu_titles.ADMIN_EXTENSION', 'Phần mở rộng', 'admin.menu_titles', 'vi'),
	(1161, 'admin.menu_titles.ADMIN_EXTENSION', 'Extension', 'admin.menu_titles', 'en'),
	(1162, 'admin.menu_titles.ADMIN_SYSTEM', 'Cấu hình hệ thống', 'admin.menu_titles', 'vi'),
	(1163, 'admin.menu_titles.ADMIN_SYSTEM', 'System config', 'admin.menu_titles', 'en'),
	(1164, 'admin.menu_titles.page_manager', 'Quản lý trang', 'admin.menu_titles', 'vi'),
	(1165, 'admin.menu_titles.page_manager', 'Page manager', 'admin.menu_titles', 'en'),
	(1166, 'admin.menu_titles.order', 'Đơn hàng', 'admin.menu_titles', 'vi'),
	(1167, 'admin.menu_titles.order', 'Order', 'admin.menu_titles', 'en'),
	(1168, 'admin.menu_titles.order_status', 'Trạng thái đơn hàng', 'admin.menu_titles', 'vi'),
	(1169, 'admin.menu_titles.order_status', 'Order status', 'admin.menu_titles', 'en'),
	(1170, 'admin.menu_titles.payment_status', 'Trạng thái thanh toán', 'admin.menu_titles', 'vi'),
	(1171, 'admin.menu_titles.payment_status', 'Payment status', 'admin.menu_titles', 'en'),
	(1172, 'admin.menu_titles.shipping_status', 'Trạng thái vận chuyển', 'admin.menu_titles', 'vi'),
	(1173, 'admin.menu_titles.shipping_status', 'Shipping status', 'admin.menu_titles', 'en'),
	(1174, 'admin.menu_titles.product', 'Sản phẩm', 'admin.menu_titles', 'vi'),
	(1175, 'admin.menu_titles.product', 'Products', 'admin.menu_titles', 'en'),
	(1176, 'admin.menu_titles.category', 'Danh mục', 'admin.menu_titles', 'vi'),
	(1177, 'admin.menu_titles.category', 'Categories', 'admin.menu_titles', 'en'),
	(1178, 'admin.menu_titles.supplier', 'Nhà cung cấp', 'admin.menu_titles', 'vi'),
	(1179, 'admin.menu_titles.supplier', 'Suppliers', 'admin.menu_titles', 'en'),
	(1180, 'admin.menu_titles.brand', 'Nhãn hiệu', 'admin.menu_titles', 'vi'),
	(1181, 'admin.menu_titles.brand', 'Brands', 'admin.menu_titles', 'en'),
	(1182, 'admin.menu_titles.attribute_group', 'Nhóm thuộc tính', 'admin.menu_titles', 'vi'),
	(1183, 'admin.menu_titles.attribute_group', 'Attribute group', 'admin.menu_titles', 'en'),
	(1184, 'admin.menu_titles.customer', 'Khách hàng', 'admin.menu_titles', 'vi'),
	(1185, 'admin.menu_titles.customer', 'Customers', 'admin.menu_titles', 'en'),
	(1186, 'admin.menu_titles.subscribe', 'Đăng ký', 'admin.menu_titles', 'vi'),
	(1187, 'admin.menu_titles.subscribe', 'Subscribe', 'admin.menu_titles', 'en'),
	(1188, 'admin.menu_titles.block_content', 'Khối nội dung', 'admin.menu_titles', 'vi'),
	(1189, 'admin.menu_titles.block_content', 'Block content', 'admin.menu_titles', 'en'),
	(1190, 'admin.menu_titles.block_link', 'Quản lý liên kết', 'admin.menu_titles', 'vi'),
	(1191, 'admin.menu_titles.block_link', 'Link manager', 'admin.menu_titles', 'en'),
	(1192, 'admin.menu_titles.template_layout', 'Quản lý giao diện', 'admin.menu_titles', 'vi'),
	(1193, 'admin.menu_titles.template_layout', 'Template manager', 'admin.menu_titles', 'en'),
	(1194, 'admin.menu_titles.template', 'Giao diện', 'admin.menu_titles', 'vi'),
	(1195, 'admin.menu_titles.template', 'Template', 'admin.menu_titles', 'en'),
	(1196, 'admin.menu_titles.ADMIN_MARKETING', 'Marketing', 'admin.menu_titles', 'vi'),
	(1197, 'admin.menu_titles.ADMIN_MARKETING', 'Marketing', 'admin.menu_titles', 'en'),
	(1198, 'admin.menu_titles.store_info', 'Thông tin cửa hàng', 'admin.menu_titles', 'vi'),
	(1199, 'admin.menu_titles.store_info', 'Store infomation', 'admin.menu_titles', 'en'),
	(1200, 'admin.menu_titles.setting_system', 'Thiết lập hệ thống', 'admin.menu_titles', 'vi'),
	(1201, 'admin.menu_titles.setting_system', 'Setting system', 'admin.menu_titles', 'en'),
	(1202, 'admin.menu_titles.error_log', 'Lỗi & Nhật ký', 'admin.menu_titles', 'vi'),
	(1203, 'admin.menu_titles.error_log', 'Error & Logs', 'admin.menu_titles', 'en'),
	(1204, 'admin.menu_titles.email_template', 'Mẫu email', 'admin.menu_titles', 'vi'),
	(1205, 'admin.menu_titles.email_template', 'Email template', 'admin.menu_titles', 'en'),
	(1206, 'admin.menu_titles.language', 'Ngôn ngữ', 'admin.menu_titles', 'vi'),
	(1207, 'admin.menu_titles.language', 'Languages', 'admin.menu_titles', 'en'),
	(1208, 'admin.menu_titles.language_manager', 'Quản lý ngôn ngữ', 'admin.menu_titles', 'vi'),
	(1209, 'admin.menu_titles.language_manager', 'Language manager', 'admin.menu_titles', 'en'),
	(1210, 'admin.menu_titles.currency', 'Tiền tệ', 'admin.menu_titles', 'vi'),
	(1211, 'admin.menu_titles.currency', 'Currencies', 'admin.menu_titles', 'en'),
	(1212, 'admin.menu_titles.banner', 'Banner', 'admin.menu_titles', 'vi'),
	(1213, 'admin.menu_titles.banner', 'Banners', 'admin.menu_titles', 'en'),
	(1214, 'admin.menu_titles.backup_restore', 'Sao lưu & Phục hồi', 'admin.menu_titles', 'vi'),
	(1215, 'admin.menu_titles.backup_restore', 'Backup & Restore', 'admin.menu_titles', 'en'),
	(1216, 'admin.menu_titles.plugin', 'Tiện ích', 'admin.menu_titles', 'vi'),
	(1217, 'admin.menu_titles.plugin', 'Plugins', 'admin.menu_titles', 'en'),
	(1218, 'admin.menu_titles.webhook', 'Webhook', 'admin.menu_titles', 'vi'),
	(1219, 'admin.menu_titles.webhook', 'Webhook', 'admin.menu_titles', 'en'),
	(1220, 'admin.menu_titles.report_manager', 'Quản lý báo cáo', 'admin.menu_titles', 'vi'),
	(1221, 'admin.menu_titles.report_manager', 'Report manager', 'admin.menu_titles', 'en'),
	(1222, 'admin.menu_titles.user_permission', 'Quyền hạn người dùng', 'admin.menu_titles', 'vi'),
	(1223, 'admin.menu_titles.user_permission', 'User permission', 'admin.menu_titles', 'en'),
	(1224, 'admin.menu_titles.css', 'Chỉnh sửa CSS', 'admin.menu_titles', 'vi'),
	(1225, 'admin.menu_titles.css', 'CSS style', 'admin.menu_titles', 'en'),
	(1226, 'admin.menu_titles.seo_manager', 'Quản lý SEO', 'admin.menu_titles', 'vi'),
	(1227, 'admin.menu_titles.seo_manager', 'SEO manager', 'admin.menu_titles', 'en'),
	(1228, 'admin.menu_titles.users', 'Người dùng', 'admin.menu_titles', 'vi'),
	(1229, 'admin.menu_titles.users', 'Users', 'admin.menu_titles', 'en'),
	(1230, 'admin.menu_titles.roles', 'Nhóm quyền', 'admin.menu_titles', 'vi'),
	(1231, 'admin.menu_titles.roles', 'Roles', 'admin.menu_titles', 'en'),
	(1232, 'admin.menu_titles.permission', 'Quyền hạn', 'admin.menu_titles', 'vi'),
	(1233, 'admin.menu_titles.permission', 'Permission', 'admin.menu_titles', 'en'),
	(1234, 'admin.menu_titles.operation_log', 'Nhật ký truy cập', 'admin.menu_titles', 'vi'),
	(1235, 'admin.menu_titles.operation_log', 'Log access', 'admin.menu_titles', 'en'),
	(1236, 'admin.menu_titles.seo_config', 'Cấu hình SEO', 'admin.menu_titles', 'vi'),
	(1237, 'admin.menu_titles.seo_config', 'SEO config', 'admin.menu_titles', 'en'),
	(1238, 'admin.menu_titles.news', 'Tin tức', 'admin.menu_titles', 'vi'),
	(1239, 'admin.menu_titles.news', 'News', 'admin.menu_titles', 'en'),
	(1240, 'admin.menu_titles.env_config', 'Cấu hình môi trường', 'admin.menu_titles', 'vi'),
	(1241, 'admin.menu_titles.env_config', 'Environment Config', 'admin.menu_titles', 'en'),
	(1242, 'admin.menu_titles.report_product', 'Báo cáo sản phẩm', 'admin.menu_titles', 'vi'),
	(1243, 'admin.menu_titles.report_product', 'Report product', 'admin.menu_titles', 'en'),
	(1244, 'admin.menu_titles.store_config', 'Cấu hình cửa hàng', 'admin.menu_titles', 'vi'),
	(1245, 'admin.menu_titles.store_config', 'Store config', 'admin.menu_titles', 'en'),
	(1246, 'admin.menu_titles.cache_manager', 'Bộ nhớ đệm', 'admin.menu_titles', 'vi'),
	(1247, 'admin.menu_titles.cache_manager', 'Cache', 'admin.menu_titles', 'en'),
	(1248, 'admin.menu_titles.api_manager', 'Quản lý API', 'admin.menu_titles', 'vi'),
	(1249, 'admin.menu_titles.api_manager', 'API manager', 'admin.menu_titles', 'en'),
	(1250, 'admin.menu_titles.store_maintain', 'Bảo trì website', 'admin.menu_titles', 'vi'),
	(1251, 'admin.menu_titles.store_maintain', 'Website maintain', 'admin.menu_titles', 'en'),
	(1252, 'admin.menu_titles.tax', 'Thuế', 'admin.menu_titles', 'vi'),
	(1253, 'admin.menu_titles.tax', 'Tax', 'admin.menu_titles', 'en'),
	(1254, 'admin.menu_titles.weight', 'Khối lượng', 'admin.menu_titles', 'vi'),
	(1255, 'admin.menu_titles.weight', 'Weight', 'admin.menu_titles', 'en'),
	(1256, 'admin.menu_titles.length', 'Kích thước', 'admin.menu_titles', 'vi'),
	(1257, 'admin.menu_titles.length', 'Length', 'admin.menu_titles', 'en'),
	(1258, 'admin.menu_titles.ADMIN_SHOP_SETTING', 'Thiết lập cửa hàng', 'admin.menu_titles', 'vi'),
	(1259, 'admin.menu_titles.ADMIN_SHOP_SETTING', 'Shop setting', 'admin.menu_titles', 'en'),
	(1260, 'admin.menu_titles.api_config', 'Cấu hình API', 'admin.menu_titles', 'vi'),
	(1261, 'admin.menu_titles.api_config', 'API config', 'admin.menu_titles', 'en'),
	(1262, 'admin.menu_titles.layout', 'Bố cục', 'admin.menu_titles', 'vi'),
	(1263, 'admin.menu_titles.layout', 'Layout', 'admin.menu_titles', 'en'),
	(1264, 'admin.menu_titles.custom_field', 'Tùy chỉnh dữ liệu', 'admin.menu_titles', 'vi'),
	(1265, 'admin.menu_titles.custom_field', 'Custom field data', 'admin.menu_titles', 'en'),
	(1266, 'admin.menu_titles.security', 'Bảo mật', 'admin.menu_titles', 'vi'),
	(1267, 'admin.menu_titles.security', 'Security', 'admin.menu_titles', 'en'),
	(1268, 'admin.menu_titles.localization', 'Địa phương hóa', 'admin.menu_titles', 'vi'),
	(1269, 'admin.menu_titles.localization', 'Localization', 'admin.menu_titles', 'en'),
	(1270, 'admin.menu_titles.localisation', 'Địa phương hóa', 'admin.menu_titles', 'vi'),
	(1271, 'admin.menu_titles.localisation', 'Localisation', 'admin.menu_titles', 'en'),
	(1272, 'admin.menu_titles.menu', 'Menu', 'admin.menu_titles', 'vi'),
	(1273, 'admin.menu_titles.menu', 'Menu', 'admin.menu_titles', 'en'),
	(1274, 'admin.menu_titles.config_store_default', 'Cấu hình mặc định', 'admin.menu_titles', 'vi'),
	(1275, 'admin.menu_titles.config_store_default', 'Config default', 'admin.menu_titles', 'en'),
	(1276, 'admin.login_success', 'Login success!', 'admin', 'en'),
	(1277, 'admin.login_success', 'Đăng nhập thành công', 'admin', 'vi'),
	(1278, 'admin.access_denied', 'Access denied!', 'admin', 'en'),
	(1279, 'admin.access_denied', 'Truy cập bị từ chối', 'admin', 'vi'),
	(1280, 'admin.max_c', 'Maximum :max characters', 'admin', 'en'),
	(1281, 'admin.min_c', 'Minimum :min characters', 'admin', 'en'),
	(1282, 'admin.min_v', 'Greater than :value', 'admin', 'en'),
	(1283, 'admin.max_v', 'Less than :value', 'admin', 'en'),
	(1284, 'admin.max_c', 'Tối đa :max kí tự', 'admin', 'vi'),
	(1285, 'admin.min_c', 'Tối thiểu :min kí tự', 'admin', 'vi'),
	(1286, 'admin.min_v', 'Lớn hơn :value', 'admin', 'vi'),
	(1287, 'admin.max_v', 'Nhỏ hơn :value', 'admin', 'vi'),
	(1288, 'admin.data_not_found_detail', 'Dữ liệu không tồn tại :msg', 'admin', 'vi'),
	(1289, 'admin.data_not_found_detail', 'Data not found :msg', 'admin', 'en'),
	(1290, 'admin.login_successful', 'Đăng nhập thành công', 'admin', 'vi'),
	(1291, 'admin.login_successful', 'Login success', 'admin', 'en'),
	(1292, 'admin.add_new', 'Add new', 'admin', 'en'),
	(1293, 'admin.add_new', 'Thêm mới', 'admin', 'vi'),
	(1294, 'admin.not_empty', 'Not empty', 'admin', 'en'),
	(1295, 'admin.not_empty', 'Không được rỗng', 'admin', 'vi'),
	(1296, 'admin.only_numeric', 'Enly numeric', 'admin', 'en'),
	(1297, 'admin.only_numeric', 'Chỉ dùng số', 'admin', 'vi'),
	(1298, 'admin.store_swicth_success', 'Switch store success!', 'admin', 'en'),
	(1299, 'admin.store_swicth_success', 'Chuyển cửa hàng thành công!', 'admin', 'vi'),
	(1300, 'admin.dashboard', 'Dashboard', 'admin', 'en'),
	(1301, 'admin.dashboard', 'Tổng hợp', 'admin', 'vi'),
	(1302, 'admin.data_not_found', 'Data not found!', 'admin', 'en'),
	(1303, 'admin.data_not_found', 'Không có dữ liệu!', 'admin', 'vi'),
	(1304, 'admin.data_not_found_msg', 'The data you are accessing does not exist.', 'admin', 'en'),
	(1305, 'admin.data_not_found_msg', 'Dữ liệu bạn đang truy cập không tồn tại.', 'admin', 'vi'),
	(1306, 'admin.deny', 'Access denied!', 'admin', 'en'),
	(1307, 'admin.deny', 'Truy cập từ chối!', 'admin', 'vi'),
	(1308, 'admin.setting_account', 'Setting account', 'admin', 'en'),
	(1309, 'admin.setting_account', 'Thiết lập tài khoản', 'admin', 'vi'),
	(1310, 'admin.failed', 'Auth failed', 'admin', 'en'),
	(1311, 'admin.failed', 'Chứng thực thất bại', 'admin', 'vi'),
	(1312, 'admin.maintain_enable', 'Active ', 'admin', 'en'),
	(1313, 'admin.maintain_enable', 'Hoạt động', 'admin', 'vi'),
	(1314, 'admin.maintain_disable', 'Maintenance ', 'admin', 'en'),
	(1315, 'admin.maintain_disable', 'Bảo trì', 'admin', 'vi'),
	(1316, 'admin.position_all', 'All pages', 'admin', 'en'),
	(1317, 'admin.position_all', 'Tất cả các trang', 'admin', 'vi'),
	(1318, 'admin.theme', 'Theme', 'admin', 'en'),
	(1319, 'admin.theme', 'Mẫu', 'admin', 'vi'),
	(1320, 'admin.select_store', 'Select store', 'admin', 'en'),
	(1321, 'admin.select_store', 'Chọn cửa hàng', 'admin', 'vi'),
	(1322, 'admin.welcome_dasdboard', 'Welcome to admin system!', 'admin', 'en'),
	(1323, 'admin.welcome_dasdboard', 'Chào mừng đến với hệ thống!', 'admin', 'vi'),
	(1324, 'admin.deny_msg', 'You need permission to access the system!', 'admin', 'en'),
	(1325, 'admin.deny_content', 'Permission denied!', 'admin', 'en'),
	(1326, 'admin.deny_msg', 'Bạn cần thêm quyền hạn để truy cập hệ thống!', 'admin', 'vi'),
	(1327, 'admin.deny_content', 'Bạn không có đủ quyền hạn!', 'admin', 'vi'),
	(1328, 'admin.home', 'Trang chủ', 'admin', 'vi'),
	(1329, 'admin.home', 'Home', 'admin', 'en'),
	(1330, 'admin.choose_icon', 'Chọn icon', 'admin', 'vi'),
	(1331, 'admin.choose_icon', 'Chose icon', 'admin', 'en'),
	(1332, 'admin.file_manager', 'Quản lý file', 'admin', 'vi'),
	(1333, 'admin.file_manager', 'File manager', 'admin', 'en'),
	(1334, 'admin.notice_new_order', 'Bạn có :total đơn hàng mới', 'admin', 'vi'),
	(1335, 'admin.notice_new_order', 'You have :total new orders', 'admin', 'en'),
	(1336, 'admin.gt_numeric_0', 'Giá trị  phải lớn hơn 0!', 'admin', 'vi'),
	(1337, 'admin.gt_numeric_0', 'Value must greater zero!', 'admin', 'en'),
	(1338, 'admin.api_connection.api_mode_help', 'ON/OFF API', 'admin.api_connection', 'en'),
	(1339, 'admin.api_connection.api_mode_help', 'TẮT/MỞ API', 'admin.api_connection', 'vi'),
	(1340, 'admin.api_connection.api_mode', 'ON/OFF API', 'admin.api_connection', 'en'),
	(1341, 'admin.api_connection.api_mode', 'TẮT/MỞ API', 'admin.api_connection', 'vi'),
	(1342, 'admin.api_connection.list', 'API connection list', 'admin.api_connection', 'en'),
	(1343, 'admin.api_connection.list', 'Danh sách API connection', 'admin.api_connection', 'vi'),
	(1344, 'admin.api_connection.description', 'Mô tả', 'admin.api_connection', 'vi'),
	(1345, 'admin.api_connection.description', 'Description', 'admin.api_connection', 'en'),
	(1346, 'admin.api_connection.apikey', 'Api key', 'admin.api_connection', 'vi'),
	(1347, 'admin.api_connection.apikey', 'Api key', 'admin.api_connection', 'en'),
	(1348, 'admin.api_connection.connection', 'Api connection', 'admin.api_connection', 'vi'),
	(1349, 'admin.api_connection.connection', 'Api connection', 'admin.api_connection', 'en'),
	(1350, 'admin.api_connection.expire', 'Hết hạn', 'admin.api_connection', 'vi'),
	(1351, 'admin.api_connection.expire', 'Expire', 'admin.api_connection', 'en'),
	(1352, 'admin.api_connection.last_active', 'Lần cuối truy cập', 'admin.api_connection', 'vi'),
	(1353, 'admin.api_connection.last_active', 'Last active', 'admin.api_connection', 'en'),
	(1354, 'admin.api_connection.status', 'Trạng thái', 'admin.api_connection', 'vi'),
	(1355, 'admin.api_connection.status', 'Status', 'admin.api_connection', 'en'),
	(1356, 'admin.api_connection.validate_regex', 'Chỉ sử dụng các kí tự : a-z0-9', 'admin.api_connection', 'vi'),
	(1357, 'admin.api_connection.validate_regex', 'Only use characters : a-z0-9', 'admin.api_connection', 'en'),
	(1358, 'admin.api_connection.create', 'Tạo mới connection', 'admin.api_connection', 'vi'),
	(1359, 'admin.api_connection.create', 'Creat new connection', 'admin.api_connection', 'en'),
	(1360, 'admin.api_connection.edit', 'Chỉnh sửa connection', 'admin.api_connection', 'vi'),
	(1361, 'admin.api_connection.edit', 'Edit connection', 'admin.api_connection', 'en'),
	(1362, 'admin.api_connection.api_connection_required_help', '<ul><li>Nếu không sử dụng API, hãy hãy chuyển sang trạng thái "OFF API"</li><li>Nếu không sử dụng apikey và apiconnection, hãy chuyển sang trạng thái "OFF CONNECTION"</li></ul>\r\n    <a href="https://s-cart.org/vi/docs/developer/about-api-scart.html" target="_new"><i class="fa fa-info-circle" aria-hidden="true">Xem chi tiết ở đây</i></a>\r\n    ', 'admin.api_connection', 'vi'),
	(1363, 'admin.api_connection.api_connection_required_help', '<ul><li>If not using API, please switch to "OFF API" state</li><li>If apikey and apiconnection are not used, switch to "OFF CONNECTION" state</li></ul>\r\n    <a href="https://s-cart.org/docs/developer/about-api-scart.html" target="_new"><i class="fa fa-info-circle" aria-hidden="true"></i>See full infomation</a>\r\n    ', 'admin.api_connection', 'en'),
	(1364, 'admin.result_item', 'Showing <b>:item_from</b>-<b>:item_to</b> of <b>:total</b> results</b>', 'admin', 'en'),
	(1365, 'admin.result_item', 'Hiển thị <b>:item_from</b>-<b>:item_to</b> của <b>:total</b> kết quả</b>', 'admin', 'vi'),
	(1366, 'admin.method_not_allow', 'Method not allow', 'admin', 'en'),
	(1367, 'admin.method_not_allow', 'Phương thức không được phép', 'admin', 'vi'),
	(1368, 'admin.back_list', 'Back list', 'admin', 'en'),
	(1369, 'admin.back_list', 'Trở lại danh sách', 'admin', 'vi'),
	(1370, 'admin.msg_change_success', 'All changes have been updated', 'admin', 'en'),
	(1371, 'admin.msg_change_success', 'Thay đổi đã được cập nhật', 'admin', 'vi'),
	(1372, 'admin.updated_at', 'Updated at', 'admin', 'en'),
	(1373, 'admin.updated_at', 'Cập nhật lúc', 'admin', 'vi'),
	(1374, 'admin.created_at', 'Created at', 'admin', 'en'),
	(1375, 'admin.created_at', 'Tạo lúc', 'admin', 'vi'),
	(1376, 'admin.remove_dont_permisison', 'Dont permission remove ', 'admin', 'en'),
	(1377, 'admin.remove_dont_permisison', 'Không có quyền gỡ bỏ', 'admin', 'vi'),
	(1378, 'admin.delete_dont_permisison', 'Dont permission delete ', 'admin', 'en'),
	(1379, 'admin.delete_dont_permisison', 'Không có quyền xóa', 'admin', 'vi'),
	(1380, 'admin.attribute_group.list', 'Danh sách nhóm thuộc tính', 'admin.attribute_group', 'vi'),
	(1381, 'admin.attribute_group.list', 'Attribute group list', 'admin.attribute_group', 'en'),
	(1382, 'admin.attribute_group.name', 'Tên', 'admin.attribute_group', 'vi'),
	(1383, 'admin.attribute_group.name', 'Name', 'admin.attribute_group', 'en'),
	(1384, 'admin.attribute_group.type', 'Loại', 'admin.attribute_group', 'vi'),
	(1385, 'admin.attribute_group.type', 'Type', 'admin.attribute_group', 'en'),
	(1386, 'admin.order.search', 'Tìm đơn hàng', 'admin.order', 'vi'),
	(1387, 'admin.order.search', 'Search order', 'admin.order', 'en'),
	(1388, 'admin.permission.name', 'Tên', 'admin.permission', 'vi'),
	(1389, 'admin.permission.name', 'Name', 'admin.permission', 'en'),
	(1390, 'admin.permission.list', 'Dánh sách quyền', 'admin.permission', 'vi'),
	(1391, 'admin.permission.list', 'Permission list', 'admin.permission', 'en'),
	(1392, 'admin.permission.slug', 'Slug', 'admin.permission', 'vi'),
	(1393, 'admin.permission.slug', 'Slug', 'admin.permission', 'en'),
	(1394, 'admin.permission.select_http_uri', 'Chọn http uri', 'admin.permission', 'vi'),
	(1395, 'admin.permission.select_http_uri', 'Select http uri', 'admin.permission', 'en'),
	(1396, 'admin.permission.method_placeholder', 'Các quyền', 'admin.permission', 'vi'),
	(1397, 'admin.permission.method_placeholder', 'Permission detail', 'admin.permission', 'en'),
	(1398, 'admin.permission.http_path', 'Http path', 'admin.permission', 'vi'),
	(1399, 'admin.permission.http_path', 'Http path', 'admin.permission', 'en'),
	(1400, 'admin.permission.slug_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and "._-"', 'admin.permission', 'vi'),
	(1401, 'admin.permission.slug_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and "._-"', 'admin.permission', 'en'),
	(1402, 'admin.permission.add_new_des', 'Tạo mới một quyền', 'admin.permission', 'vi'),
	(1403, 'admin.permission.add_new_des', 'Create new permission', 'admin.permission', 'en'),
	(1404, 'admin.permission.add_new_title', 'Tạo quyền', 'admin.permission', 'vi'),
	(1405, 'admin.permission.add_new_title', 'Create permission', 'admin.permission', 'en'),
	(1406, 'admin.backup.title', 'Danh sách sao lưu', 'admin.backup', 'vi'),
	(1407, 'admin.backup.title', 'Backup list', 'admin.backup', 'en'),
	(1408, 'admin.backup.processing', 'Đang xử lý...', 'admin.backup', 'vi'),
	(1409, 'admin.backup.processing', 'Processing...', 'admin.backup', 'en'),
	(1410, 'admin.backup.guide', '<span class="text-danger">Chú ý: Bạn cần phải cài đặt đường dẫn hệ thống chính xác. Xem hướng dẫn <a target=_new href="https://s-cart.org/guide/backup.html?lang=vi">TẠI ĐÂY</a></span>', 'admin.backup', 'vi'),
	(1411, 'admin.backup.generate_now', 'Tạo một backup ngay', 'admin.backup', 'vi'),
	(1412, 'admin.backup.manager', 'Quản lý sao lưu', 'admin.backup', 'vi'),
	(1413, 'admin.backup.name', 'Tên file', 'admin.backup', 'vi'),
	(1414, 'admin.backup.sort', 'Thứ tự', 'admin.backup', 'vi'),
	(1415, 'admin.backup.date', 'Thời gian', 'admin.backup', 'vi'),
	(1416, 'admin.backup.size', 'Kích thước', 'admin.backup', 'vi'),
	(1417, 'admin.backup.download', 'Tải về', 'admin.backup', 'vi'),
	(1418, 'admin.backup.remove', 'Gỡ bỏ', 'admin.backup', 'vi'),
	(1419, 'admin.backup.restore', 'Phục hồi', 'admin.backup', 'vi'),
	(1420, 'admin.backup.remove_success', 'Xóa file thành công!', 'admin.backup', 'vi'),
	(1421, 'admin.backup.restore_success', 'Phục hồi dữ liệu thành công!', 'admin.backup', 'vi'),
	(1422, 'admin.backup.generate_success', 'Tạo file backup thành công!', 'admin.backup', 'vi'),
	(1423, 'admin.backup.limit_backup', 'Bạn chỉ được tạo tối đa 10 bản sao lưu!', 'admin.backup', 'vi'),
	(1424, 'admin.backup.guide', '<span class="text-danger">NOTE: To use MySQL server on the command line, you must have the correct system path. This is usually done automatically. Read document in <a target=_new href="https://s-cart.org/guide/backup.html">HERE</a></span>', 'admin.backup', 'en'),
	(1425, 'admin.backup.generate_now', 'Gererate a backup now', 'admin.backup', 'en'),
	(1426, 'admin.backup.manager', 'Backup management', 'admin.backup', 'en'),
	(1427, 'admin.backup.name', 'File name', 'admin.backup', 'en'),
	(1428, 'admin.backup.sort', 'Sort', 'admin.backup', 'en'),
	(1429, 'admin.backup.date', 'Date', 'admin.backup', 'en'),
	(1430, 'admin.backup.size', 'Size', 'admin.backup', 'en'),
	(1431, 'admin.backup.download', 'Download', 'admin.backup', 'en'),
	(1432, 'admin.backup.remove', 'Remove', 'admin.backup', 'en'),
	(1433, 'admin.backup.restore', 'Restore', 'admin.backup', 'en'),
	(1434, 'admin.backup.remove_success', 'Remove successful!', 'admin.backup', 'en'),
	(1435, 'admin.backup.restore_success', 'Restore successful!', 'admin.backup', 'en'),
	(1436, 'admin.backup.generate_success', 'Create successful backup file!', 'admin.backup', 'en'),
	(1437, 'admin.backup.limit_backup', 'You cannot create more than 10 copies', 'admin.backup', 'en'),
	(1438, 'admin.banner.type', 'Loại', 'admin.banner', 'vi'),
	(1439, 'admin.banner.type', 'Type', 'admin.banner', 'en'),
	(1440, 'admin.banner.add_new', 'Thêm mới banner', 'admin.banner', 'vi'),
	(1441, 'admin.banner.add_new', 'Add new banner', 'admin.banner', 'en'),
	(1442, 'admin.banner.image', 'Hình ảnh', 'admin.banner', 'vi'),
	(1443, 'admin.banner.image', 'Image', 'admin.banner', 'en'),
	(1444, 'admin.banner.title', 'Tiêu đề', 'admin.banner', 'vi'),
	(1445, 'admin.banner.title', 'Title', 'admin.banner', 'en'),
	(1446, 'admin.banner.url', 'URL', 'admin.banner', 'vi'),
	(1447, 'admin.banner.url', 'URL', 'admin.banner', 'en'),
	(1448, 'admin.banner.sort', 'Thứ tự', 'admin.banner', 'vi'),
	(1449, 'admin.banner.sort', 'Sort', 'admin.banner', 'en'),
	(1450, 'admin.banner.status', 'Trạng thái', 'admin.banner', 'vi'),
	(1451, 'admin.banner.status', 'Status', 'admin.banner', 'en'),
	(1452, 'admin.banner.click', 'Bấm chuột', 'admin.banner', 'vi'),
	(1453, 'admin.banner.click', 'Click', 'admin.banner', 'en'),
	(1454, 'admin.banner.target', 'Target', 'admin.banner', 'vi'),
	(1455, 'admin.banner.target', 'Target', 'admin.banner', 'en'),
	(1456, 'admin.banner.select_target', 'Chọn target', 'admin.banner', 'vi'),
	(1457, 'admin.banner.select_target', 'Select target', 'admin.banner', 'en'),
	(1458, 'admin.banner.list', 'Danh sách banner', 'admin.banner', 'vi'),
	(1459, 'admin.banner.list', 'Banner list', 'admin.banner', 'en'),
	(1460, 'admin.banner_type.list', 'Loại banner', 'admin.banner', 'vi'),
	(1461, 'admin.banner_type.list', 'Banner type list', 'admin.banner', 'en'),
	(1462, 'admin.banner_type.add_new_title', 'Thêm loại mới', 'admin.banner', 'vi'),
	(1463, 'admin.banner_type.add_new_title', 'Add new type', 'admin.banner', 'en'),
	(1464, 'admin.banner_type.code', 'Mã', 'admin.banner', 'vi'),
	(1465, 'admin.banner_type.code', 'Code', 'admin.banner', 'en'),
	(1466, 'admin.banner_type.name', 'Tên', 'admin.banner', 'vi'),
	(1467, 'admin.banner_type.name', 'Name', 'admin.banner', 'en'),
	(1468, 'admin.brand.list', 'Danh sách nhãn hiệu', 'admin.brand', 'vi'),
	(1469, 'admin.brand.list', 'Brand list', 'admin.brand', 'en'),
	(1470, 'admin.brand.add_new_title', 'Thêm mới nhãn hiệu', 'admin.brand', 'vi'),
	(1471, 'admin.brand.add_new_title', 'Add new brand', 'admin.brand', 'en'),
	(1472, 'admin.brand.image', 'Hình ảnh', 'admin.brand', 'vi'),
	(1473, 'admin.brand.image', 'Image', 'admin.brand', 'en'),
	(1474, 'admin.brand.name', 'Tên', 'admin.brand', 'vi'),
	(1475, 'admin.brand.name', 'Name', 'admin.brand', 'en'),
	(1476, 'admin.brand.sort', 'Thứ tự', 'admin.brand', 'vi'),
	(1477, 'admin.brand.sort', 'Sort', 'admin.brand', 'en'),
	(1478, 'admin.brand.status', 'Trạng thái', 'admin.brand', 'vi'),
	(1479, 'admin.brand.status', 'Status', 'admin.brand', 'en'),
	(1480, 'admin.brand.alias', 'Alias', 'admin.brand', 'vi'),
	(1481, 'admin.brand.alias', 'Alias', 'admin.brand', 'en'),
	(1482, 'admin.brand.url', 'Url', 'admin.brand', 'vi'),
	(1483, 'admin.brand.url', 'Url', 'admin.brand', 'en'),
	(1484, 'admin.brand.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_"', 'admin.brand', 'vi'),
	(1485, 'admin.brand.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_"', 'admin.brand', 'en'),
	(1486, 'admin.cache.title', 'Cấu hình bộ nhớ Cache', 'admin.cache', 'vi'),
	(1487, 'admin.cache.title', 'config cache manager', 'admin.cache', 'en'),
	(1488, 'admin.cache.cache_clear_processing', 'Đang xóa Cache', 'admin.cache', 'vi'),
	(1489, 'admin.cache.cache_clear_processing', 'Cache clearing', 'admin.cache', 'en'),
	(1490, 'admin.cache.cache_status', 'Trạng thái', 'admin.cache', 'vi'),
	(1491, 'admin.cache.cache_status', 'Status', 'admin.cache', 'en'),
	(1492, 'admin.cache.cache_clear_all', 'Xóa tất cả Cache', 'admin.cache', 'vi'),
	(1493, 'admin.cache.cache_clear_all', 'Clear all cache', 'admin.cache', 'en'),
	(1494, 'admin.cache.cache_clear_success', 'Đã xóa cache xong', 'admin.cache', 'vi'),
	(1495, 'admin.cache.cache_clear_success', 'Clear cache success', 'admin.cache', 'en'),
	(1496, 'admin.cache.cache_refresh', 'Làm mới cache', 'admin.cache', 'vi'),
	(1497, 'admin.cache.cache_refresh', 'Cache refresh', 'admin.cache', 'en'),
	(1498, 'admin.cache.cache_clear', 'Xóa cache', 'admin.cache', 'vi'),
	(1499, 'admin.cache.cache_clear', 'Clear cache', 'admin.cache', 'en'),
	(1500, 'admin.cache.cache_all', 'Cache tất cả', 'admin.cache', 'vi'),
	(1501, 'admin.cache.cache_all', 'Cache all', 'admin.cache', 'en'),
	(1502, 'admin.cache.cache_time', 'Thời gian cache (giây)', 'admin.cache', 'vi'),
	(1503, 'admin.cache.cache_time', 'Cache time (s)', 'admin.cache', 'en'),
	(1504, 'admin.cache.value', 'Giá trị', 'admin.cache', 'vi'),
	(1505, 'admin.cache.value', 'Value', 'admin.cache', 'en'),
	(1506, 'admin.cache.field', 'Trường', 'admin.cache', 'vi'),
	(1507, 'admin.cache.field', 'Field', 'admin.cache', 'en'),
	(1508, 'admin.cache.cache_category', 'Cache Danh mục sản phẩm', 'admin.cache', 'vi'),
	(1509, 'admin.cache.cache_product', 'Cache Sản phẩm', 'admin.cache', 'vi'),
	(1510, 'admin.cache.cache_news', 'Cache Tin tức/Blog', 'admin.cache', 'vi'),
	(1511, 'admin.cache.cache_category_cms', 'Cache Danh mục CMS', 'admin.cache', 'vi'),
	(1512, 'admin.cache.cache_content_cms', 'Cache Nội dung CMS', 'admin.cache', 'vi'),
	(1513, 'admin.cache.cache_page', 'Cache Trang viết', 'admin.cache', 'vi'),
	(1514, 'admin.cache.cache_store', 'Cache Cửa hàng', 'admin.cache', 'vi'),
	(1515, 'admin.cache.cache_country', 'Cache Quốc gia', 'admin.cache', 'vi'),
	(1516, 'admin.cache.cache_category', 'Cache categoty', 'admin.cache', 'en'),
	(1517, 'admin.cache.cache_product', 'Cache product', 'admin.cache', 'en'),
	(1518, 'admin.cache.cache_news', 'Cache News/Blog', 'admin.cache', 'en'),
	(1519, 'admin.cache.cache_category_cms', 'Cache Category CMS', 'admin.cache', 'en'),
	(1520, 'admin.cache.cache_content_cms', 'Cache CMS content', 'admin.cache', 'en'),
	(1521, 'admin.cache.cache_page', 'Cache page', 'admin.cache', 'en'),
	(1522, 'admin.cache.cache_store', 'Cache Store', 'admin.cache', 'en'),
	(1523, 'admin.cache.cache_country', 'Cache country', 'admin.cache', 'en'),
	(1524, 'admin.category.list', 'Danh sách danh mục', 'admin.category', 'vi'),
	(1525, 'admin.category.list', 'Category list', 'admin.category', 'en'),
	(1526, 'admin.category.add_new_title', 'Thêm mới danh mục', 'admin.category', 'vi'),
	(1527, 'admin.category.add_new_title', 'Add new category', 'admin.category', 'en'),
	(1528, 'admin.category.add_new_des', 'Thêm mới', 'admin.category', 'vi'),
	(1529, 'admin.category.add_new_des', 'Add new', 'admin.category', 'en'),
	(1530, 'admin.category.image', 'Hình ảnh', 'admin.category', 'vi'),
	(1531, 'admin.category.image', 'Image', 'admin.category', 'en'),
	(1532, 'admin.category.title', 'Tên', 'admin.category', 'vi'),
	(1533, 'admin.category.title', 'Name', 'admin.category', 'en'),
	(1534, 'admin.category.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.category', 'vi'),
	(1535, 'admin.category.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_" ', 'admin.category', 'vi'),
	(1536, 'admin.category.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.category', 'en'),
	(1537, 'admin.category.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_" ', 'admin.category', 'en'),
	(1538, 'admin.category.keyword', 'Từ khóa', 'admin.category', 'vi'),
	(1539, 'admin.category.keyword', 'Keyword', 'admin.category', 'en'),
	(1540, 'admin.category.description', 'Mô tả', 'admin.category', 'vi'),
	(1541, 'admin.category.description', 'Description', 'admin.category', 'en'),
	(1542, 'admin.category.top', 'Công cộng', 'admin.category', 'vi'),
	(1543, 'admin.category.top', 'Public', 'admin.category', 'en'),
	(1544, 'admin.category.parent', 'Cấp cha', 'admin.category', 'vi'),
	(1545, 'admin.category.parent', 'Parent', 'admin.category', 'en'),
	(1546, 'admin.category.sort', 'Thứ tự', 'admin.category', 'vi'),
	(1547, 'admin.category.sort', 'Sort', 'admin.category', 'en'),
	(1548, 'admin.category.status', 'Trạng thái', 'admin.category', 'vi'),
	(1549, 'admin.category.status', 'Status', 'admin.category', 'en'),
	(1550, 'admin.category.select_category', 'Chọn danh mục', 'admin.category', 'vi'),
	(1551, 'admin.category.select_category', 'Select category', 'admin.category', 'en'),
	(1552, 'admin.category.top_help', 'Danh mục này sẽ hiển thị ra ngoài trang chủ. Mặc định chỉ dành cho những danh mục Root.', 'admin.category', 'vi'),
	(1553, 'admin.category.top_help', 'This category will display outside the homepage. The default is for Root items only.', 'admin.category', 'en'),
	(1554, 'admin.config.webhook', 'Webhook', 'admin.config', 'vi'),
	(1555, 'admin.config.webhook', 'Webhook', 'admin.config', 'en'),
	(1556, 'admin.config.setting_website', 'Cài đặt website', 'admin.config', 'vi'),
	(1557, 'admin.config.setting_website', 'Setting website', 'admin.config', 'en'),
	(1558, 'admin.config.LOG_SLACK_WEBHOOK_URL', 'Gửi tới Slack webhook', 'admin.config', 'vi'),
	(1559, 'admin.config.LOG_SLACK_WEBHOOK_URL', 'Report error to Slack webhook', 'admin.config', 'en'),
	(1560, 'admin.config.GOOGLE_CHAT_WEBHOOK_URL', 'Gửi tới Google webhook', 'admin.config', 'vi'),
	(1561, 'admin.config.GOOGLE_CHAT_WEBHOOK_URL', 'Report error to Google webhook', 'admin.config', 'en'),
	(1562, 'admin.config.CHATWORK_CHAT_WEBHOOK_URL', 'Gửi tới Chatword webhook', 'admin.config', 'vi'),
	(1563, 'admin.config.CHATWORK_CHAT_WEBHOOK_URL', 'Report error to Chatword webhook', 'admin.config', 'en'),
	(1564, 'admin.config.LOG_SLACK_WEBHOOK_URL_help', 'Link https: //hooks.slack.com/services/...', 'admin.config', 'vi'),
	(1565, 'admin.config.LOG_SLACK_WEBHOOK_URL_help', 'Link https: //hooks.slack.com/services/...', 'admin.config', 'en'),
	(1566, 'admin.currency.list', 'Danh sách tiền tệ', 'admin.currency', 'vi'),
	(1567, 'admin.currency.list', 'Currencies list', 'admin.currency', 'en'),
	(1568, 'admin.currency.name', 'Tên', 'admin.currency', 'vi'),
	(1569, 'admin.currency.name', 'Name', 'admin.currency', 'en'),
	(1570, 'admin.currency.code', 'Mã', 'admin.currency', 'vi'),
	(1571, 'admin.currency.code', 'Code', 'admin.currency', 'en'),
	(1572, 'admin.currency.symbol', 'Ký hiệu', 'admin.currency', 'vi'),
	(1573, 'admin.currency.symbol', 'Symbol', 'admin.currency', 'en'),
	(1574, 'admin.currency.exchange_rate', 'Tỉ giá', 'admin.currency', 'vi'),
	(1575, 'admin.currency.exchange_rate', 'Exchange rate', 'admin.currency', 'en'),
	(1576, 'admin.currency.precision', 'Số chữ số thập phân', 'admin.currency', 'vi'),
	(1577, 'admin.currency.precision', 'Precision', 'admin.currency', 'en'),
	(1578, 'admin.currency.symbol_first', 'Hiện kí hiệu đầu tiên', 'admin.currency', 'vi'),
	(1579, 'admin.currency.symbol_first', 'Symbol first', 'admin.currency', 'en'),
	(1580, 'admin.currency.thousands', 'Ngăn cách phần nghìn', 'admin.currency', 'vi'),
	(1581, 'admin.currency.thousands', 'Thousands separator', 'admin.currency', 'en'),
	(1582, 'admin.currency.status', 'Trạng thái', 'admin.currency', 'vi'),
	(1583, 'admin.currency.status', 'Status', 'admin.currency', 'en'),
	(1584, 'admin.currency.sort', 'Thứ tự', 'admin.currency', 'vi'),
	(1585, 'admin.currency.sort', 'Sort', 'admin.currency', 'en'),
	(1586, 'admin.currency.add_new_title', 'Thêm mới tiền tệ', 'admin.currency', 'vi'),
	(1587, 'admin.currency.add_new_title', 'Add new currency', 'admin.currency', 'en'),
	(1588, 'admin.currency.add_new_des', 'Thêm mới', 'admin.currency', 'vi'),
	(1589, 'admin.currency.add_new_des', 'Add new', 'admin.currency', 'en'),
	(1590, 'admin.custom_field.title', 'Field dữ liệu tùy chỉnh', 'admin.custom_field', 'vi'),
	(1591, 'admin.custom_field.title', 'Custom field', 'admin.custom_field', 'en'),
	(1592, 'admin.custom_field.list', 'Danh sách field tùy chỉnh', 'admin.custom_field', 'vi'),
	(1593, 'admin.custom_field.list', 'Custom field list', 'admin.custom_field', 'en'),
	(1594, 'admin.custom_field.status', 'Trạng thái', 'admin.custom_field', 'vi'),
	(1595, 'admin.custom_field.status', 'Status', 'admin.custom_field', 'en'),
	(1596, 'admin.custom_field.sort', 'Thứ tự', 'admin.custom_field', 'vi'),
	(1597, 'admin.custom_field.sort', 'Sort', 'admin.custom_field', 'en'),
	(1598, 'admin.custom_field.add_new_title', 'Thêm mới field', 'admin.custom_field', 'vi'),
	(1599, 'admin.custom_field.add_new_title', 'Add new field', 'admin.custom_field', 'en'),
	(1600, 'admin.custom_field.add_new_des', 'Thêm mới', 'admin.custom_field', 'vi'),
	(1601, 'admin.custom_field.add_new_des', 'Add new', 'admin.custom_field', 'en'),
	(1602, 'admin.custom_field.name', 'Tên', 'admin.custom_field', 'vi'),
	(1603, 'admin.custom_field.name', 'Name', 'admin.custom_field', 'en'),
	(1604, 'admin.custom_field.code', 'Mã', 'admin.custom_field', 'vi'),
	(1605, 'admin.custom_field.code', 'Code', 'admin.custom_field', 'en'),
	(1606, 'admin.custom_field.type', 'Loại', 'admin.custom_field', 'vi'),
	(1607, 'admin.custom_field.type', 'Type', 'admin.custom_field', 'en'),
	(1608, 'admin.custom_field.required', 'Bắt buộc', 'admin.custom_field', 'vi'),
	(1609, 'admin.custom_field.required', 'Required', 'admin.custom_field', 'en'),
	(1610, 'admin.custom_field.option', 'Tùy chọn', 'admin.custom_field', 'vi'),
	(1611, 'admin.custom_field.option', 'Option', 'admin.custom_field', 'en'),
	(1612, 'admin.custom_field.default', 'Mặc định', 'admin.custom_field', 'vi'),
	(1613, 'admin.custom_field.default', 'Default', 'admin.custom_field', 'en'),
	(1614, 'admin.custom_field.default_help', 'Định dạng cho "Tùy chọn" là Radio hoặc Select:<br>{"value1": "Name 1", "value2":"Name 2"}', 'admin.custom_field', 'vi'),
	(1615, 'admin.custom_field.default_help', 'Format for "Option" is Radio or Select:<br>{"value1": "Name 1", "value2":"Name 2"}', 'admin.custom_field', 'en'),
	(1616, 'admin.env.APP_DEBUG', 'DEBUG mode', 'admin.env', 'en'),
	(1617, 'admin.env.APP_URL', 'URL app', 'admin.env', 'en'),
	(1618, 'admin.env.APP_ENV', 'Environment mode', 'admin.env', 'en'),
	(1619, 'admin.env.ADMIN_PREFIX', 'Admin prefix', 'admin.env', 'en'),
	(1620, 'admin.env.ADMIN_NAME', 'Admin name', 'admin.env', 'en'),
	(1621, 'admin.env.ADMIN_LOGO', 'Admin logo', 'admin.env', 'en'),
	(1622, 'admin.env.ADMIN_LOGO_MINI', 'Admin logo mini', 'admin.env', 'en'),
	(1623, 'admin.env.ADMIN_TITLE', 'Admin title', 'admin.env', 'en'),
	(1624, 'admin.env.ADMIN_LOG', 'Admin log', 'admin.env', 'en'),
	(1625, 'admin.env.field', 'Field', 'admin.env', 'en'),
	(1626, 'admin.env.value', 'Value', 'admin.env', 'en'),
	(1627, 'admin.env.title', 'Config environment', 'admin.env', 'en'),
	(1628, 'admin.env.SUFFIX_URL', 'Suffix URL', 'admin.env', 'en'),
	(1629, 'admin.env.PREFIX_BRAND', 'Prefix url BRAND', 'admin.env', 'en'),
	(1630, 'admin.env.PREFIX_SUPPLIER', 'Prefix url SUPPLIER', 'admin.env', 'en'),
	(1631, 'admin.env.PREFIX_CATEGORY', 'Prefix url CATEGORY ', 'admin.env', 'en'),
	(1632, 'admin.env.PREFIX_SUB_CATEGORY', 'Prefix url sub CATEGORY', 'admin.env', 'en'),
	(1633, 'admin.env.PREFIX_PRODUCT', 'Prefix url PRODUCT', 'admin.env', 'en'),
	(1634, 'admin.env.PREFIX_SEARCH', 'Prefix url SEARCH', 'admin.env', 'en'),
	(1635, 'admin.env.PREFIX_CONTACT', 'Prefix url CONTACT', 'admin.env', 'en'),
	(1636, 'admin.env.PREFIX_NEWS', 'Prefix url NEWS', 'admin.env', 'en'),
	(1637, 'admin.env.PREFIX_MEMBER', 'Prefix url CUSTOMER', 'admin.env', 'en'),
	(1638, 'admin.env.PREFIX_MEMBER_ORDER_LIST', 'Prefix url CUSTOMER ORDER', 'admin.env', 'en'),
	(1639, 'admin.env.PREFIX_MEMBER_CHANGE_PWD', 'Prefix url CHANGE PASSWOD', 'admin.env', 'en'),
	(1640, 'admin.env.PREFIX_MEMBER_CHANGE_INFO', 'Prefix url CHANGE INFO', 'admin.env', 'en'),
	(1641, 'admin.env.PREFIX_CMS_CATEGORY', 'Prefix url CMS CATEGORY', 'admin.env', 'en'),
	(1642, 'admin.env.PREFIX_CMS_ENTRY', 'Prefix url CMS ENTRY', 'admin.env', 'en'),
	(1643, 'admin.env.PREFIX_CART_WISHLIST', 'Prefix url WISHLIST', 'admin.env', 'en'),
	(1644, 'admin.env.PREFIX_CART_COMPARE', 'Prefix url COMPARE', 'admin.env', 'en'),
	(1645, 'admin.env.PREFIX_CART_DEFAULT', 'Prefix url CART', 'admin.env', 'en'),
	(1646, 'admin.env.PREFIX_CART_CHECKOUT', 'Prefix url CHECKOUT', 'admin.env', 'en'),
	(1647, 'admin.env.PREFIX_CART_CHECKOUT_CONFIRM', 'Prefix url CHECKOUT CONFIRM', 'admin.env', 'en'),
	(1648, 'admin.env.PREFIX_ORDER_SUCCESS', 'Prefix url ORDER SUCCESS', 'admin.env', 'en'),
	(1649, 'admin.env.PREFIX_SHOP', 'Link shop', 'admin.env', 'en'),
	(1650, 'admin.env.ADMIN_CUSTOMIZE_TEMPLATE', 'Customize template admin', 'admin.env', 'en'),
	(1651, 'admin.env.APP_DEBUG', 'Chế độ sửa lỗi', 'admin.env', 'vi'),
	(1652, 'admin.env.APP_URL', 'URL website', 'admin.env', 'vi'),
	(1653, 'admin.env.APP_ENV', 'Môi trường', 'admin.env', 'vi'),
	(1654, 'admin.env.ADMIN_PREFIX', 'Tiền tố admin', 'admin.env', 'vi'),
	(1655, 'admin.env.ADMIN_NAME', 'Tên trang admin', 'admin.env', 'vi'),
	(1656, 'admin.env.ADMIN_LOGO', 'Logo admin', 'admin.env', 'vi'),
	(1657, 'admin.env.ADMIN_LOGO_MINI', 'Logo nhỏ', 'admin.env', 'vi'),
	(1658, 'admin.env.ADMIN_TITLE', 'Tiêu đề admin', 'admin.env', 'vi'),
	(1659, 'admin.env.ADMIN_LOG', 'Lịch sử truy cập admin', 'admin.env', 'vi'),
	(1660, 'admin.env.field', 'Trường dữ liệu', 'admin.env', 'vi'),
	(1661, 'admin.env.value', 'Giá trị', 'admin.env', 'vi'),
	(1662, 'admin.env.title', 'Cấu hình môi trường', 'admin.env', 'vi'),
	(1663, 'admin.env.SUFFIX_URL', 'Hậu tố URL', 'admin.env', 'vi'),
	(1664, 'admin.env.PREFIX_BRAND', 'Tiền tố trang BRAND', 'admin.env', 'vi'),
	(1665, 'admin.env.PREFIX_SUPPLIER', 'Tiền tố trang SUPPLIER', 'admin.env', 'vi'),
	(1666, 'admin.env.PREFIX_CATEGORY', 'Tiền tố trang CATEGORY ', 'admin.env', 'vi'),
	(1667, 'admin.env.PREFIX_SUB_CATEGORY', 'Tiền tố trang CATEGORY nhỏ', 'admin.env', 'vi'),
	(1668, 'admin.env.PREFIX_PRODUCT', 'Tiền tố trang PRODUCT', 'admin.env', 'vi'),
	(1669, 'admin.env.PREFIX_SEARCH', 'Tiền tố trang SEARCH', 'admin.env', 'vi'),
	(1670, 'admin.env.PREFIX_CONTACT', 'Tiền tố trang CONTACT', 'admin.env', 'vi'),
	(1671, 'admin.env.PREFIX_NEWS', 'Tiền tố trang NEWS', 'admin.env', 'vi'),
	(1672, 'admin.env.PREFIX_MEMBER', 'Tiền tố trang CUSTOMER', 'admin.env', 'vi'),
	(1673, 'admin.env.PREFIX_MEMBER_ORDER_LIST', 'Tiền tố trang CUSTOMER ORDER', 'admin.env', 'vi'),
	(1674, 'admin.env.PREFIX_MEMBER_CHANGE_PWD', 'Tiền tố trang CHANGE PASSWOD', 'admin.env', 'vi'),
	(1675, 'admin.env.PREFIX_MEMBER_CHANGE_INFO', 'Tiền tố trang CHANGE INFO', 'admin.env', 'vi'),
	(1676, 'admin.env.PREFIX_CMS_CATEGORY', 'Tiền tố trang CMS CATEGORY', 'admin.env', 'vi'),
	(1677, 'admin.env.PREFIX_CMS_ENTRY', 'Tiền tố trang CMS ENTRY', 'admin.env', 'vi'),
	(1678, 'admin.env.PREFIX_CART_WISHLIST', 'Tiền tố trang WISHLIST', 'admin.env', 'vi'),
	(1679, 'admin.env.PREFIX_CART_COMPARE', 'Tiền tố trang COMPARE', 'admin.env', 'vi'),
	(1680, 'admin.env.PREFIX_CART_DEFAULT', 'Tiền tố trang CART', 'admin.env', 'vi'),
	(1681, 'admin.env.PREFIX_CART_CHECKOUT', 'Tiền tố trang CHECKOUT', 'admin.env', 'vi'),
	(1682, 'admin.env.PREFIX_CART_CHECKOUT_CONFIRM', 'Tiền tố trang CHECKOUT CONFIRM', 'admin.env', 'vi'),
	(1683, 'admin.env.PREFIX_ORDER_SUCCESS', 'Tiền tố trang ORDER SUCCESS', 'admin.env', 'vi'),
	(1684, 'admin.env.PREFIX_SHOP', 'Link Cửa hàng', 'admin.env', 'vi'),
	(1685, 'admin.env.ADMIN_CUSTOMIZE_TEMPLATE', 'Tùy chỉnh giao diện Admin', 'admin.env', 'vi'),
	(1686, 'admin.env.hidden_copyright_footer_admin', 'Ẩn thông tin bản quyền footer admin', 'admin.env', 'vi'),
	(1687, 'admin.env.hidden_copyright_footer', 'Ẩn thông tin bản quyền footer website', 'admin.env', 'vi'),
	(1688, 'admin.env.hidden_copyright_footer_admin', 'Hide admin footer copyright information', 'admin.env', 'en'),
	(1689, 'admin.env.hidden_copyright_footer', 'Hide website footer copyright information', 'admin.env', 'en'),
	(1690, 'admin.email_template.name', 'Tên', 'admin.email_template', 'vi'),
	(1691, 'admin.email_template.list', 'Danh sách mẫu email', 'admin.email_template', 'vi'),
	(1692, 'admin.email_template.list', 'Email template list', 'admin.email_template', 'en'),
	(1693, 'admin.email_template.status', 'Trạng thái', 'admin.email_template', 'vi'),
	(1694, 'admin.email_template.group', 'Nhóm', 'admin.email_template', 'vi'),
	(1695, 'admin.email_template.html', 'HTML', 'admin.email_template', 'vi'),
	(1696, 'admin.email_template.text', 'Nội dung', 'admin.email_template', 'vi'),
	(1697, 'admin.email_template.name', 'Name', 'admin.email_template', 'en'),
	(1698, 'admin.email_template.lits', 'Email template list', 'admin.email_template', 'en'),
	(1699, 'admin.email_template.group', 'Group', 'admin.email_template', 'en'),
	(1700, 'admin.email_template.text', 'Content', 'admin.email_template', 'en'),
	(1701, 'admin.email_template.html', 'HTML', 'admin.email_template', 'en'),
	(1702, 'admin.email_template.status', 'Status', 'admin.email_template', 'en'),
	(1703, 'admin.email_template.add_new_title', 'Add template', 'admin.email_template', 'en'),
	(1704, 'admin.email_template.add_new_des', 'Create a new template', 'admin.email_template', 'en'),
	(1705, 'admin.email_template.variable_support', 'Variables support:', 'admin.email_template', 'en'),
	(1706, 'admin.email_template.add_new_title', 'Tạo template', 'admin.email_template', 'vi'),
	(1707, 'admin.email_template.add_new_des', 'Tạo mới template', 'admin.email_template', 'vi'),
	(1708, 'admin.email_template.variable_support', 'Các biến hỗ trợ', 'admin.email_template', 'vi'),
	(1709, 'admin.language.list', 'Language list', 'admin.language', 'en'),
	(1710, 'admin.language.list', 'Danh sách ngôn ngữ', 'admin.language', 'vi'),
	(1711, 'admin.language.select_lang', 'Select language', 'admin.language', 'en'),
	(1712, 'admin.language.select_lang', 'Chọn ngôn ngữ', 'admin.language', 'vi'),
	(1713, 'admin.language.select_position', 'Select position', 'admin.language', 'en'),
	(1714, 'admin.language.select_position', 'Chọn vị trí ngôn ngữ', 'admin.language', 'vi'),
	(1715, 'admin.language.name', 'Name', 'admin.language', 'en'),
	(1716, 'admin.language.icon', 'Icon', 'admin.language', 'en'),
	(1717, 'admin.language.code', 'Code', 'admin.language', 'en'),
	(1718, 'admin.language.sort', 'Sort', 'admin.language', 'en'),
	(1719, 'admin.language.status', 'Status', 'admin.language', 'en'),
	(1720, 'admin.language.layout_rtl', 'Layout RTL', 'admin.language', 'en'),
	(1721, 'admin.language.add_new_title', 'Add language', 'admin.language', 'en'),
	(1722, 'admin.language.add_new_des', 'Create a new language', 'admin.language', 'en'),
	(1723, 'admin.language.name', 'Tên ngôn ngữ', 'admin.language', 'vi'),
	(1724, 'admin.language.icon', 'Icon', 'admin.language', 'vi'),
	(1725, 'admin.language.code', 'Code', 'admin.language', 'vi'),
	(1726, 'admin.language.sort', 'Thứ tự', 'admin.language', 'vi'),
	(1727, 'admin.language.status', 'Status', 'admin.language', 'vi'),
	(1728, 'admin.language.layout_rtl', 'Giao diện RTL', 'admin.language', 'vi'),
	(1729, 'admin.language.add_new_title', 'Tạo ngôn ngữ', 'admin.language', 'vi'),
	(1730, 'admin.language.add_new_des', 'Tạo mới ngôn ngữ', 'admin.language', 'vi'),
	(1731, 'admin.language_manager.title', 'Quản lý ngôn ngữ', 'admin.language', 'vi'),
	(1732, 'admin.language_manager.title', 'Language manager', 'admin.language', 'en'),
	(1733, 'admin.language_manager.add', 'Thêm giá trị mới', 'admin.language', 'vi'),
	(1734, 'admin.language_manager.add', 'Add new record language', 'admin.language', 'en'),
	(1735, 'admin.language_manager.position', 'Vị trí mới ngôn ngữ', 'admin.language', 'vi'),
	(1736, 'admin.language_manager.position', 'Position language', 'admin.language', 'en'),
	(1737, 'admin.language_manager.new_position', 'Hoặc thêm vị trí mới', 'admin.language', 'vi'),
	(1738, 'admin.language_manager.new_position', 'Or add new position', 'admin.language', 'en'),
	(1739, 'admin.language_manager.code', 'Mã code', 'admin.language', 'vi'),
	(1740, 'admin.language_manager.code', 'Code', 'admin.language', 'en'),
	(1741, 'admin.language_manager.text', 'Nội dung ngôn ngữ', 'admin.language', 'vi'),
	(1742, 'admin.language_manager.text', 'Language content', 'admin.language', 'en'),
	(1743, 'admin.language_manager.text_help', 'Mặc định, giá trị mới chỉ được thêm cho tiếng Anh. <br>Để cập nhật cho ngôn ngữ khác, tìm giá trị mới thêm và chỉnh sửa <a href=":link">Ở ĐÂY</a>', 'admin.language', 'vi'),
	(1744, 'admin.language_manager.text_help', 'By default, the new value is only added for English. <br>To update for other languages, find the newly added value and edit <a href=":link">HERE</a>', 'admin.language', 'en'),
	(1745, 'admin.language_manager.select_position', 'Chọn vị trí ngôn ngữ', 'admin.language', 'vi'),
	(1746, 'admin.language_manager.select_position', 'Select position of language', 'admin.language', 'en'),
	(1747, 'admin.menu.list', 'Quản lý menu', 'admin.emnu', 'vi'),
	(1748, 'admin.menu.create', 'Tạo mới menu', 'admin.emnu', 'vi'),
	(1749, 'admin.menu.edit', 'Chỉnh sửa menu', 'admin.emnu', 'vi'),
	(1750, 'admin.menu.error_have_child', 'Cần xóa các menu bên trong trước khi làm điều này!', 'admin.emnu', 'vi'),
	(1751, 'admin.menu.parent', 'Cha', 'admin.emnu', 'vi'),
	(1752, 'admin.menu.title', 'Tiêu đề', 'admin.emnu', 'vi'),
	(1753, 'admin.menu.icon', 'Icon', 'admin.emnu', 'vi'),
	(1754, 'admin.menu.uri', 'URI', 'admin.emnu', 'vi'),
	(1755, 'admin.menu.roles', 'Vai trò', 'admin.emnu', 'vi'),
	(1756, 'admin.menu.permissions', 'Quyền', 'admin.emnu', 'vi'),
	(1757, 'admin.menu.create_success', 'Tạo mới thành công!', 'admin.emnu', 'vi'),
	(1758, 'admin.menu.edit_success', 'Cập nhật thành công!', 'admin.emnu', 'vi'),
	(1759, 'admin.menu.sort', 'Thứ tự', 'admin.emnu', 'vi'),
	(1760, 'admin.menu.list', 'Menu manager', 'admin.emnu', 'en'),
	(1761, 'admin.menu.create', 'Create new menu', 'admin.emnu', 'en'),
	(1762, 'admin.menu.edit', 'Edit menu', 'admin.emnu', 'en'),
	(1763, 'admin.menu.error_have_child', 'Need to delete the internal menus before doing this!', 'admin.emnu', 'en'),
	(1764, 'admin.menu.parent', 'Parent', 'admin.emnu', 'en'),
	(1765, 'admin.menu.title', 'Title', 'admin.emnu', 'en'),
	(1766, 'admin.menu.icon', 'Icon', 'admin.emnu', 'en'),
	(1767, 'admin.menu.uri', 'URI', 'admin.emnu', 'en'),
	(1768, 'admin.menu.roles', 'Roles', 'admin.emnu', 'en'),
	(1769, 'admin.menu.permissions', 'Permissions', 'admin.emnu', 'en'),
	(1770, 'admin.menu.create_success', 'Create new item success!', 'admin.emnu', 'en'),
	(1771, 'admin.menu.edit_success', 'Edit item success!', 'admin.emnu', 'en'),
	(1772, 'admin.menu.sort', 'Sort', 'admin.emnu', 'en'),
	(1773, 'email.admin.order_success_to_admin', 'Send order success to admin', 'email.admin', 'en'),
	(1774, 'email.admin.order_success_to_cutomer', 'Send order success to customer', 'email.admin', 'en'),
	(1775, 'email.admin.order_success_to_cutomer_pdf', 'Send order success to customer with pdf invoice', 'email.admin', 'en'),
	(1776, 'email.admin.forgot_password', 'Send email forgot', 'email.admin', 'en'),
	(1777, 'email.admin.welcome_customer', 'Send email welcome', 'email.admin', 'en'),
	(1778, 'email.admin.contact_to_customer', 'Send email contact to customer', 'email.admin', 'en'),
	(1779, 'email.admin.contact_to_admin', 'Send email contact to admin', 'email.admin', 'en'),
	(1780, 'email.email_action_queue', 'Use send mail queue <span class="text-red">(*)</span>', 'email.admin', 'en'),
	(1781, 'email.admin.other', 'Other', 'email.admin', 'en'),
	(1782, 'email.admin.customer_verify', 'Send account verification email', 'email.admin', 'en'),
	(1783, 'email.admin.order_success_to_admin', 'Gửi đơn hàng thành công cho admin', 'email.admin', 'vi'),
	(1784, 'email.admin.order_success_to_cutomer_pdf', 'Gửi đơn hàng thành công cho khách kèm PDF', 'email.admin', 'vi'),
	(1785, 'email.admin.order_success_to_cutomer', 'Gửi đơn hàng thành công cho khách', 'email.admin', 'vi'),
	(1786, 'email.admin.forgot_password', 'Gửi mail quên mật khẩu', 'email.admin', 'vi'),
	(1787, 'email.admin.welcome_customer', 'Gửi mail chào mừng', 'email.admin', 'vi'),
	(1788, 'email.admin.contact_to_customer', 'Gửi mail form liên hệ cho khách', 'email.admin', 'vi'),
	(1789, 'email.admin.contact_to_admin', 'Gửi mail form liên hệ cho admin', 'email.admin', 'vi'),
	(1790, 'email.email_action_queue', 'Gửi mail qua hàng đợi <span class="text-red">(*)</span>', 'email.admin', 'vi'),
	(1791, 'email.admin.config_smtp', 'Cấu hình SMTP', 'email.admin', 'vi'),
	(1792, 'email.admin.other', 'Loại khác', 'email.admin', 'vi'),
	(1793, 'email.admin.customer_verify', 'Gửi email xác thực tài khoản', 'email.admin', 'vi'),
	(1794, 'email.admin.config_mode', 'Config mode', 'email.admin', 'en'),
	(1795, 'email.admin.config_smtp', 'Config SMTP', 'email.admin', 'en'),
	(1796, 'email.admin.config_mode', 'Cấu hình mode', 'email.admin', 'vi'),
	(1797, 'email.email_action.type', 'Action type', 'email.admin', 'en'),
	(1798, 'email.email_action.mode', 'Action mode', 'email.admin', 'en'),
	(1799, 'email.email_action.sort', 'Action sort', 'email.admin', 'en'),
	(1800, 'email.email_action.order_success_to_admin', 'Send order success to admin', 'email.admin', 'en'),
	(1801, 'email.email_action.order_success_to_cutomer', 'Send order success to customer', 'email.admin', 'en'),
	(1802, 'email.email_action.order_success_to_cutomer_pdf', 'Send order success to customer with pdf invoice', 'email.admin', 'en'),
	(1803, 'email.email_action.forgot_password', 'Send email forgot', 'email.admin', 'en'),
	(1804, 'email.email_action.customer_verify', 'Customer verification', 'email.admin', 'en'),
	(1805, 'email.email_action.welcome_customer', 'Send email welcome', 'email.admin', 'en'),
	(1806, 'email.email_action.contact_to_customer', 'Send email contact to customer', 'email.admin', 'en'),
	(1807, 'email.email_action.contact_to_admin', 'Send email contact to admin', 'email.admin', 'en'),
	(1808, 'email.email_action.email_action_mode', 'ON/OFF send mail', 'email.admin', 'en'),
	(1809, 'email.email_action.email_action_queue', 'Use send mail queue <span class="text-red">(*)</span>', 'email.admin', 'en'),
	(1810, 'email.email_action.email_action_smtp_mode', 'SMTP mode', 'email.admin', 'en'),
	(1811, 'email.email_action.config_smtp', 'Config SMTP', 'email.admin', 'en'),
	(1812, 'email.email_action.type', 'Loại gửi mail', 'email.admin', 'vi'),
	(1813, 'email.email_action.mode', 'Chế độ', 'email.admin', 'vi'),
	(1814, 'email.email_action.sort', 'Sắp xếp', 'email.admin', 'vi'),
	(1815, 'email.email_action.order_success_to_admin', 'Gửi đơn hàng thành công cho admin', 'email.admin', 'vi'),
	(1816, 'email.email_action.order_success_to_cutomer_pdf', 'Gửi đơn hàng thành công cho khách kèm PDF', 'email.admin', 'vi'),
	(1817, 'email.email_action.order_success_to_cutomer', 'Gửi đơn hàng thành công cho khách', 'email.admin', 'vi'),
	(1818, 'email.email_action.forgot_password', 'Gửi mail quên mật khẩu', 'email.admin', 'vi'),
	(1819, 'email.email_action.welcome_customer', 'Gửi mail chào mừng', 'email.admin', 'vi'),
	(1820, 'email.email_action.contact_to_customer', 'Gửi mail form liên hệ cho khách', 'email.admin', 'vi'),
	(1821, 'email.email_action.contact_to_admin', 'Gửi mail form liên hệ cho admin', 'email.admin', 'vi'),
	(1822, 'email.email_action.email_action_mode', 'Tắt/Mở chức năng gửi mail', 'email.admin', 'vi'),
	(1823, 'email.email_action.email_action_queue', 'Gửi mail qua hàng đợi <span class="text-red">(*)</span>', 'email.admin', 'vi'),
	(1824, 'email.email_action.email_action_smtp_mode', 'Sử dụng SMTP', 'email.admin', 'vi'),
	(1825, 'email.email_action.config_smtp', 'Cấu hình SMTP', 'email.admin', 'vi'),
	(1826, 'email.email_action.customer_verify', 'Gửi email xác thực tài khoản', 'email.admin', 'vi'),
	(1827, 'email.email_action.smtp_mode', 'Sử dụng cấu hình SMTP', 'email.admin', 'vi'),
	(1828, 'email.email_action.smtp_mode', 'Use SMTP config', 'email.admin', 'en'),
	(1829, 'email.email_action.help_note', '<span class="text-red">(*)</span>: Email sẽ không được gửi trực tiếp, mà thông qua hàng đợi. Bạn cần phải cài đặt "artisan schedule:run" trước,  chi tiết <a href="https://s-cart.org/docs/master/email.html">TẠI ĐÂY</a>', 'email.admin', 'vi'),
	(1830, 'email.email_action.help_note', '<span class="text-red">(*)</span>: Emails will not be sent directly, but through a queue. You need to set up "artisan schedule: run" first, details <a href="https://s-cart.org/docs/master/email.html">HERE</a>', 'email.admin', 'en'),
	(1831, 'email.config_smtp.smtp_host', 'SMTP host', 'email.admin', 'en'),
	(1832, 'email.config_smtp.smtp_user', 'SMTP user', 'email.admin', 'en'),
	(1833, 'email.config_smtp.smtp_password', 'SMTP password', 'email.admin', 'en'),
	(1834, 'email.config_smtp.smtp_security', 'SMTP security', 'email.admin', 'en'),
	(1835, 'email.config_smtp.smtp_port', 'SMTP port', 'email.admin', 'en'),
	(1836, 'email.config_smtp.smtp_name', 'Email name', 'email.admin', 'en'),
	(1837, 'email.config_smtp.smtp_from', 'Send mail from', 'email.admin', 'en'),
	(1838, 'email.config_smtp.smtp_host', 'Server SMTP', 'email.admin', 'vi'),
	(1839, 'email.config_smtp.smtp_user', 'Tài khoản SMTP', 'email.admin', 'vi'),
	(1840, 'email.config_smtp.smtp_password', 'Mật khẩu SMTP', 'email.admin', 'vi'),
	(1841, 'email.config_smtp.smtp_security', 'Bảo mật SMTP', 'email.admin', 'vi'),
	(1842, 'email.config_smtp.smtp_port', 'Cổng kết nối SMTP', 'email.admin', 'vi'),
	(1843, 'email.config_smtp.smtp_name', 'Tên gửi mail', 'email.admin', 'vi'),
	(1844, 'email.config_smtp.smtp_from', 'Địa chỉ email gửi', 'email.admin', 'vi'),
	(1845, 'email.welcome', 'Chào mừng!', 'email', 'vi'),
	(1846, 'email.welcome', 'Welcome!', 'email', 'en'),
	(1847, 'email.msg_goodbye', 'Trân trọng!', 'email', 'vi'),
	(1848, 'email.msg_goodbye', 'Best regards!', 'email', 'en'),
	(1849, 'email.forgot_password.title', 'Hello!', 'email.forgot_password', 'en'),
	(1850, 'email.forgot_password.reset_button', 'Reset password', 'email.forgot_password', 'en'),
	(1851, 'email.forgot_password.reason_sendmail', 'You are receiving this email because we received a password reset request for your account.', 'email.forgot_password', 'en'),
	(1852, 'email.forgot_password.note_sendmail', 'This password reset link will expire in :count minutes.<br><br>If you did not request a password reset, no further action is required.', 'email.forgot_password', 'en'),
	(1853, 'email.forgot_password.note_access_link', 'If you’re having trouble clicking the ":reset_button" button, copy and paste the URL below into your web browser :url', 'email.forgot_password', 'en'),
	(1854, 'email.forgot_password.title', 'Xin chào!', 'email.forgot_password', 'vi'),
	(1855, 'email.forgot_password.reset_button', 'Tạo lại mật khẩu', 'email.forgot_password', 'vi'),
	(1856, 'email.forgot_password.reason_sendmail', 'Bạn đang nhận email này vì chúng tôi nhận được yêu cầu thiết lập lại mật khẩu cho tài khoản của bạn.', 'email.forgot_password', 'vi'),
	(1857, 'email.forgot_password.note_sendmail', 'Liên kết mật khẩu này sẽ hết hạn trong vòng :count phút.<br><br>Nếu bạn không yêu cầu một thiết lập lại mật khẩu, bạn không cần làm gì cả.<br>', 'email.forgot_password', 'vi'),
	(1858, 'email.forgot_password.note_access_link', 'Nếu bạn gặp sự cố cách nhấn vào nút ":reset_button", sao chép và dán URL dưới đây vào trình duyệt web của bạn :url', 'email.forgot_password', 'vi'),
	(1859, 'email.verification_content.title', 'Hello!', 'email.verification_content', 'en'),
	(1860, 'email.verification_content.button', 'Verify Email Address', 'email.verification_content', 'en'),
	(1861, 'email.verification_content.reason_sendmail', 'Please click the button below to verify your email address.', 'email.verification_content', 'en'),
	(1862, 'email.verification_content.note_sendmail', 'This password reset link will expire in :count minutes.<br><br>If you did not create an account, no further action is required.', 'email.verification_content', 'en'),
	(1863, 'email.verification_content.note_access_link', 'If you’re having trouble clicking the ":button" button, copy and paste the URL below into your web browser :url', 'email.verification_content', 'en'),
	(1864, 'email.verification_content.title', 'Xin chào!', 'email.verification_content', 'vi'),
	(1865, 'email.verification_content.button', 'Xác nhận địa chỉ email', 'email.verification_content', 'vi'),
	(1866, 'email.verification_content.reason_sendmail', 'Vui lòng nhấp vào nút bên dưới để xác minh địa chỉ email của bạn.', 'email.verification_content', 'vi'),
	(1867, 'email.verification_content.note_sendmail', 'Liên kết mật khẩu này sẽ hết hạn trong vòng :count phút.<br><br>Nếu bạn chưa tạo tài khoản, bạn không cần thực hiện thêm hành động nào.', 'email.verification_content', 'vi'),
	(1868, 'email.verification_content.note_access_link', 'Nếu bạn gặp sự cố khi nhấp vào button ":button", sao chép và dán URL bên dưới vào trình duyệt web của bạn :url', 'email.verification_content', 'vi'),
	(1869, 'email.order.title_1', 'Hi! Website :website has new order!', 'email.order', 'en'),
	(1870, 'email.order.order_id', 'Order ID', 'email.order', 'en'),
	(1871, 'email.order.toname', 'Customer name', 'email.order', 'en'),
	(1872, 'email.order.address', 'Address', 'email.order', 'en'),
	(1873, 'email.order.phone', 'Phone', 'email.order', 'en'),
	(1874, 'email.order.note', 'Note', 'email.order', 'en'),
	(1875, 'email.order.order_detail', 'Order detail', 'email.order', 'en'),
	(1876, 'email.order.sort', 'No.', 'email.order', 'en'),
	(1877, 'email.order.sku', 'SKU', 'email.order', 'en'),
	(1878, 'email.order.price', 'Price', 'email.order', 'en'),
	(1879, 'email.order.name', 'Name', 'email.order', 'en'),
	(1880, 'email.order.qty', 'Qty', 'email.order', 'en'),
	(1881, 'email.order.total', 'Total', 'email.order', 'en'),
	(1882, 'email.order.sub_total', 'Sub total', 'email.order', 'en'),
	(1883, 'email.order.shipping_fee', 'Shipping fee', 'email.order', 'en'),
	(1884, 'email.order.discount', 'Discount', 'email.order', 'en'),
	(1885, 'email.order.order_total', 'Order total', 'email.order', 'en'),
	(1886, 'email.order.title_1', 'Xin chào! :website trang web có đơn hàng mới!', 'email.order', 'vi'),
	(1887, 'email.order.order_id', 'Mã đơn hàng', 'email.order', 'vi'),
	(1888, 'email.order.toname', 'Tên khách hàng', 'email.order', 'vi'),
	(1889, 'email.order.address', 'Địa chỉ', 'email.order', 'vi'),
	(1890, 'email.order.phone', 'Điện thoại', 'email.order', 'vi'),
	(1891, 'email.order.note', 'Ghi chú', 'email.order', 'vi'),
	(1892, 'email.order.order_detail', 'Chi tiết đặt hàng', 'email.order', 'vi'),
	(1893, 'email.order.sort', 'Thứ tự', 'email.order', 'vi'),
	(1894, 'email.order.sku', 'SKU', 'email.order', 'vi'),
	(1895, 'email.order.price', 'Giá', 'email.order', 'vi'),
	(1896, 'email.order.name', 'Tên', 'email.order', 'vi'),
	(1897, 'email.order.qty', 'Số lượng', 'email.order', 'vi'),
	(1898, 'email.order.total', 'Tổng', 'email.order', 'vi'),
	(1899, 'email.order.sub_total', 'Tiền hàng', 'email.order', 'vi'),
	(1900, 'email.order.shipping_fee', 'Phí vận chuyển', 'email.order', 'vi'),
	(1901, 'email.order.discount', 'Giảm giá', 'email.order', 'vi'),
	(1902, 'email.order.order_total', 'Tổng số đơn hàng', 'email.order', 'vi'),
	(1903, 'email.order.email_subject_customer', 'Có đơn hàng mới', 'email.order', 'vi'),
	(1904, 'email.order.email_subject_customer', 'Have a new order', 'email.order', 'en'),
	(1905, 'admin.store_block.list', 'Danh sách block', 'admin.store_block', 'vi'),
	(1906, 'admin.store_block.list', 'Block list', 'admin.store_block', 'en'),
	(1907, 'admin.store_block.name', 'Tên', 'admin.store_block', 'vi'),
	(1908, 'admin.store_block.position', 'Vị trí', 'admin.store_block', 'vi'),
	(1909, 'admin.store_block.page', 'Trang', 'admin.store_block', 'vi'),
	(1910, 'admin.store_block.type', 'Loại', 'admin.store_block', 'vi'),
	(1911, 'admin.store_block.text', 'Nội dung', 'admin.store_block', 'vi'),
	(1912, 'admin.store_block.status', 'Trạng thái', 'admin.store_block', 'vi'),
	(1913, 'admin.store_block.name', 'Name', 'admin.store_block', 'en'),
	(1914, 'admin.store_block.position', 'Position', 'admin.store_block', 'en'),
	(1915, 'admin.store_block.page', 'Page', 'admin.store_block', 'en'),
	(1916, 'admin.store_block.type', 'Type', 'admin.store_block', 'en'),
	(1917, 'admin.store_block.text', 'Text', 'admin.store_block', 'en'),
	(1918, 'admin.store_block.status', 'Status', 'admin.store_block', 'en'),
	(1919, 'admin.store_block.sort', 'Sort', 'admin.store_block', 'en'),
	(1920, 'admin.store_block.sort', 'Sắp xếp', 'admin.store_block', 'vi'),
	(1921, 'admin.store_block.add_new_title', 'Add layout', 'admin.store_block', 'en'),
	(1922, 'admin.store_block.add_new_des', 'Create a new layout', 'admin.store_block', 'en'),
	(1923, 'admin.store_block.select_position', 'Select position', 'admin.store_block', 'en'),
	(1924, 'admin.store_block.select_page', 'Select page', 'admin.store_block', 'en'),
	(1925, 'admin.store_block.helper_html', 'Basic HTML content.', 'admin.store_block', 'en'),
	(1926, 'admin.store_block.helper_view', 'View files are in "resources/views/templates/:template/block" directory.', 'admin.store_block', 'en'),
	(1927, 'admin.store_block.helper_module', 'File in "app/Plugins/Block". Module must have render() method available to display content.', 'admin.store_block', 'en'),
	(1928, 'admin.store_block.add_new_title', 'Tạo bố cục', 'admin.store_block', 'vi'),
	(1929, 'admin.store_block.add_new_des', 'Tạo mới bố cục', 'admin.store_block', 'vi'),
	(1930, 'admin.store_block.select_position', 'Chọn vị trí', 'admin.store_block', 'vi'),
	(1931, 'admin.store_block.select_page', 'Chọn trang', 'admin.store_block', 'vi'),
	(1932, 'admin.store_block.helper_html', 'Basic HTML content.', 'admin.store_block', 'vi'),
	(1933, 'admin.store_block.helper_view', 'File trong thư mục "resources/views/templates/:template/block".', 'admin.store_block', 'vi'),
	(1934, 'admin.store_block.helper_module', 'File trong "app/Plugins/Block". Module phải có hàm render().', 'admin.store_block', 'vi'),
	(1935, 'admin.log.list', 'Danh sách nhật ký', 'admin.log', 'vi'),
	(1936, 'admin.log.list', 'Logs list', 'admin.log', 'en'),
	(1937, 'admin.log.user', 'Người dùng', 'admin.log', 'vi'),
	(1938, 'admin.log.user', 'User', 'admin.log', 'en'),
	(1939, 'admin.log.method', 'Phương thức', 'admin.log', 'vi'),
	(1940, 'admin.log.path', 'Path', 'admin.log', 'vi'),
	(1941, 'admin.log.ip', 'IP', 'admin.log', 'vi'),
	(1942, 'admin.log.user_agent', 'User agent', 'admin.log', 'vi'),
	(1943, 'admin.log.input', 'Input', 'admin.log', 'vi'),
	(1944, 'admin.log.created_at', 'Thời gian', 'admin.log', 'vi'),
	(1945, 'admin.log.method', 'Method', 'admin.log', 'en'),
	(1946, 'admin.log.path', 'Path', 'admin.log', 'en'),
	(1947, 'admin.log.ip', 'IP', 'admin.log', 'en'),
	(1948, 'admin.log.user_agent', 'User agent', 'admin.log', 'en'),
	(1949, 'admin.log.input', 'Input', 'admin.log', 'en'),
	(1950, 'admin.log.created_at', 'Time', 'admin.log', 'en'),
	(1951, 'admin.page.title', 'Tiêu đề', 'admin.page', 'vi'),
	(1952, 'admin.page.image', 'Hình ảnh', 'admin.page', 'vi'),
	(1953, 'admin.page.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.page', 'vi'),
	(1954, 'admin.page.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_" ', 'admin.page', 'vi'),
	(1955, 'admin.page.key_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and ".-_" ', 'admin.page', 'vi'),
	(1956, 'admin.page.status', 'Trạng thái', 'admin.page', 'vi'),
	(1957, 'admin.page.keyword', 'Từ khóa', 'admin.page', 'vi'),
	(1958, 'admin.page.description', 'Mô tả', 'admin.page', 'vi'),
	(1959, 'admin.page.content', 'Nội dung', 'admin.page', 'vi'),
	(1960, 'admin.page.title', 'Title', 'admin.page', 'en'),
	(1961, 'admin.page.image', 'Image', 'admin.page', 'en'),
	(1962, 'admin.page.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.page', 'en'),
	(1963, 'admin.page.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_" ', 'admin.page', 'en'),
	(1964, 'admin.page.status', 'Status', 'admin.page', 'en'),
	(1965, 'admin.page.keyword', 'Keyword', 'admin.page', 'en'),
	(1966, 'admin.page.description', 'Description', 'admin.page', 'en'),
	(1967, 'admin.page.content', 'Content', 'admin.page', 'en'),
	(1968, 'admin.page.key_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and ".-_" ', 'admin.page', 'en'),
	(1969, 'admin.page.add_new', 'Add new', 'admin.page', 'en'),
	(1970, 'admin.page.add_new_title', 'Add page', 'admin.page', 'en'),
	(1971, 'admin.page.add_new_des', 'Create a new page', 'admin.page', 'en'),
	(1972, 'admin.page.add_new_title', 'Tạo trang', 'admin.page', 'vi'),
	(1973, 'admin.page.add_new_des', 'Tạo mới trang', 'admin.page', 'vi'),
	(1974, 'admin.page.choose_image', 'Chọn ảnh', 'admin.page', 'vi'),
	(1975, 'admin.page.choose_image', 'Chose image', 'admin.page', 'en'),
	(1976, 'admin.page.list', 'Danh sách trang', 'admin.page', 'vi'),
	(1977, 'admin.page.list', 'Page list', 'admin.page', 'en'),
	(1978, 'admin.page.search_place', 'Tìm tên', 'admin.page', 'vi'),
	(1979, 'admin.page.search_place', 'Search name', 'admin.page', 'en'),
	(1980, 'admin.news.add_new_title', 'Add new blog', 'admin.news', 'en'),
	(1981, 'admin.news.add_new_des', 'Create a new blog', 'admin.news', 'en'),
	(1982, 'admin.news.title', 'Title', 'admin.news', 'en'),
	(1983, 'admin.news.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.news', 'en'),
	(1984, 'admin.news.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_" ', 'admin.news', 'en'),
	(1985, 'admin.news.keyword', 'Keyword', 'admin.news', 'en'),
	(1986, 'admin.news.description', 'Description', 'admin.news', 'en'),
	(1987, 'admin.news.content', 'Content', 'admin.news', 'en'),
	(1988, 'admin.news.image', 'Image', 'admin.news', 'en'),
	(1989, 'admin.news.status', 'Status', 'admin.news', 'en'),
	(1990, 'admin.news.sort', 'Sort', 'admin.news', 'en'),
	(1991, 'admin.news.list', 'Blog/News manager', 'admin.news', 'en'),
	(1992, 'admin.news.edit', 'Edit', 'admin.news', 'en'),
	(1993, 'admin.news.search_place', 'Search title', 'admin.news', 'en'),
	(1994, 'admin.news.title', 'Tiêu đề', 'admin.news', 'vi'),
	(1995, 'admin.news.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.news', 'vi'),
	(1996, 'admin.news.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_" ', 'admin.news', 'vi'),
	(1997, 'admin.news.keyword', 'Từ khóa', 'admin.news', 'vi'),
	(1998, 'admin.news.description', 'Mô tả', 'admin.news', 'vi'),
	(1999, 'admin.news.content', 'Nội dung', 'admin.news', 'vi'),
	(2000, 'admin.news.image', 'Hình ảnh', 'admin.news', 'vi'),
	(2001, 'admin.news.parent', 'Danh mục cha', 'admin.news', 'vi'),
	(2002, 'admin.news.top', 'Hiển thị ưu tiên', 'admin.news', 'vi'),
	(2003, 'admin.news.status', 'Trạng thái', 'admin.news', 'vi'),
	(2004, 'admin.news.sort', 'Sắp xếp', 'admin.news', 'vi'),
	(2005, 'admin.news.list', 'Danh sách', 'admin.news', 'vi'),
	(2006, 'admin.news.add_new_title', 'Tạo Blog/News', 'admin.news', 'vi'),
	(2007, 'admin.news.add_new_des', 'Tạo mới một Blog/News', 'admin.news', 'vi'),
	(2008, 'admin.news.search_place', 'Tìm tiêu đề', 'admin.news', 'vi'),
	(2009, 'admin.length.name', 'Tên', 'admin.length', 'vi'),
	(2010, 'admin.length.name', 'Name', 'admin.length', 'en'),
	(2011, 'admin.length.description', 'Mô tả', 'admin.length', 'vi'),
	(2012, 'admin.length.description', 'Description', 'admin.length', 'en'),
	(2013, 'admin.length.list', 'Danh sách kích thước', 'admin.length', 'vi'),
	(2014, 'admin.length.list', 'Length list', 'admin.length', 'en'),
	(2015, 'admin.length.add_new_title', 'Thêm kích thước', 'admin.length', 'vi'),
	(2016, 'admin.length.add_new_title', 'Add Length', 'admin.length', 'en'),
	(2017, 'admin.weight.name', 'Tên', 'admin.weight', 'vi'),
	(2018, 'admin.weight.name', 'Name', 'admin.weight', 'en'),
	(2019, 'admin.weight.description', 'Mô tả', 'admin.weight', 'vi'),
	(2020, 'admin.weight.description', 'Description', 'admin.weight', 'en'),
	(2021, 'admin.weight.list', 'Danh sách khối lượng', 'admin.weight', 'vi'),
	(2022, 'admin.weight.list', 'Weight list', 'admin.weight', 'en'),
	(2023, 'admin.weight.add_new_title', 'Thêm khối lượng', 'admin.weight', 'vi'),
	(2024, 'admin.weight.add_new_title', 'Add weight', 'admin.weight', 'en'),
	(2025, 'admin.product_property.name', 'Tên', 'admin.product_property', 'vi'),
	(2026, 'admin.product_property.name', 'Name', 'admin.product_property', 'en'),
	(2027, 'admin.product_property.code', 'Mã', 'admin.product_property', 'vi'),
	(2028, 'admin.product_property.code', 'Code', 'admin.product_property', 'en'),
	(2029, 'admin.product_property.list', 'Danh sách thuộc tính', 'admin.product_property', 'vi'),
	(2030, 'admin.product_property.list', 'Product property list', 'admin.product_property', 'en'),
	(2031, 'admin.product_property.status', 'Trạng thái', 'admin.product_property', 'vi'),
	(2032, 'admin.product_property.status', 'Status', 'admin.product_property', 'en'),
	(2033, 'admin.product_property.add_new_title', 'Thêm thuộc tính', 'admin.product_property', 'vi'),
	(2034, 'admin.product_property.add_new_title', 'Add product property', 'admin.product_property', 'en'),
	(2035, 'admin.order_status.name', 'Tên', 'admin.order_status', 'vi'),
	(2036, 'admin.order_status.name', 'Name', 'admin.order_status', 'en'),
	(2037, 'admin.order_status.list', 'Danh sách trạng thái', 'admin.order_status', 'vi'),
	(2038, 'admin.order_status.list', 'Order status list', 'admin.order_status', 'en'),
	(2039, 'admin.order_status.status', 'Trạng thái', 'admin.order_status', 'vi'),
	(2040, 'admin.order_status.status', 'Status', 'admin.order_status', 'en'),
	(2041, 'admin.order_status.add_new_title', 'Thêm trạng thái', 'admin.order_status', 'vi'),
	(2042, 'admin.order_status.add_new_title', 'Add status', 'admin.order_status', 'en'),
	(2043, 'admin.payment_status.name', 'Tên', 'admin.payment_status', 'vi'),
	(2044, 'admin.payment_status.name', 'Name', 'admin.payment_status', 'en'),
	(2045, 'admin.payment_status.list', 'Danh sách trạng thái', 'admin.payment_status', 'vi'),
	(2046, 'admin.payment_status.list', 'Payment status list', 'admin.payment_status', 'en'),
	(2047, 'admin.payment_status.status', 'Trạng thái', 'admin.payment_status', 'vi'),
	(2048, 'admin.payment_status.status', 'Status', 'admin.payment_status', 'en'),
	(2049, 'admin.payment_status.add_new_title', 'Thêm trạng thái', 'admin.payment_status', 'vi'),
	(2050, 'admin.payment_status.add_new_title', 'Add status', 'admin.payment_status', 'en'),
	(2051, 'admin.shipping_status.name', 'Tên', 'admin.shipping_status', 'vi'),
	(2052, 'admin.shipping_status.name', 'Name', 'admin.shipping_status', 'en'),
	(2053, 'admin.shipping_status.list', 'Danh sách trạng thái', 'admin.shipping_status', 'vi'),
	(2054, 'admin.shipping_status.list', 'Shipping status list', 'admin.shipping_status', 'en'),
	(2055, 'admin.shipping_status.status', 'Trạng thái', 'admin.shipping_status', 'vi'),
	(2056, 'admin.shipping_status.status', 'Status', 'admin.shipping_status', 'en'),
	(2057, 'admin.shipping_status.add_new_title', 'Thêm trạng thái', 'admin.shipping_status', 'vi'),
	(2058, 'admin.shipping_status.add_new_title', 'Add status', 'admin.shipping_status', 'en'),
	(2059, 'admin.tax.name', 'Tên', 'admin.tax', 'vi'),
	(2060, 'admin.tax.name', 'Name', 'admin.tax', 'en'),
	(2061, 'admin.tax.value', 'Giá trị', 'admin.tax', 'vi'),
	(2062, 'admin.tax.value', 'Value', 'admin.tax', 'en'),
	(2063, 'admin.tax.non_tax', 'Không thuế', 'admin.tax', 'vi'),
	(2064, 'admin.tax.non_tax', 'None tax', 'admin.tax', 'en'),
	(2065, 'admin.tax.auto', 'Tự động', 'admin.tax', 'vi'),
	(2066, 'admin.tax.auto', 'Auto', 'admin.tax', 'en'),
	(2067, 'admin.tax.list', 'Danh sách thuế', 'admin.tax', 'vi'),
	(2068, 'admin.tax.list', 'Tax list', 'admin.tax', 'en'),
	(2069, 'admin.tax.status', 'Trạng thái', 'admin.tax', 'vi'),
	(2070, 'admin.tax.status', 'Status', 'admin.tax', 'en'),
	(2071, 'admin.tax.add_new_title', 'Thêm thuế', 'admin.tax', 'vi'),
	(2072, 'admin.tax.add_new_title', 'Add tax', 'admin.tax', 'en'),
	(2073, 'admin.captcha.captcha_title', 'Captcha', 'admin.captcha', 'en'),
	(2074, 'admin.captcha.captcha_mode', 'Use Captcha', 'admin.captcha', 'en'),
	(2075, 'admin.captcha.captcha_method', 'Captcha method', 'admin.captcha', 'en'),
	(2076, 'admin.captcha.captcha_method_help', 'Select method Captcha', 'admin.captcha', 'en'),
	(2077, 'admin.captcha.captcha_page', 'Captcha', 'admin.captcha', 'en'),
	(2078, 'admin.captcha.captcha_page_help', 'Select page use Captcha', 'admin.captcha', 'en'),
	(2079, 'admin.captcha.captcha_page_contact', 'Contact', 'admin.captcha', 'en'),
	(2080, 'admin.captcha.captcha_page_register', 'Register', 'admin.captcha', 'en'),
	(2081, 'admin.captcha.captcha_page_forgot_password', 'Forgot pasword', 'admin.captcha', 'en'),
	(2082, 'admin.captcha.captcha_page_checkout', 'Checkout', 'admin.captcha', 'en'),
	(2083, 'admin.captcha.captcha_page_review', 'Review product', 'admin.captcha', 'en'),
	(2084, 'admin.captcha.captcha_title', 'Captcha', 'admin.captcha', 'vi'),
	(2085, 'admin.captcha.captcha_mode', 'Sử dụng Captcha', 'admin.captcha', 'vi'),
	(2086, 'admin.captcha.captcha_method', 'Loại Captcha', 'admin.captcha', 'vi'),
	(2087, 'admin.captcha.captcha_method_help', 'Chọn loại Captcha', 'admin.captcha', 'vi'),
	(2088, 'admin.captcha.captcha_page', 'Trang sử dụng captcha', 'admin.captcha', 'vi'),
	(2089, 'admin.captcha.captcha_page_help', 'Chọn trang sử dụng Captcha', 'admin.captcha', 'vi'),
	(2090, 'admin.captcha.captcha_page_contact', 'Liên hệ', 'admin.captcha', 'vi'),
	(2091, 'admin.captcha.captcha_page_register', 'Đăng ký', 'admin.captcha', 'vi'),
	(2092, 'admin.captcha.captcha_page_forgot_password', 'Quên mật khẩu', 'admin.captcha', 'vi'),
	(2093, 'admin.captcha.captcha_page_checkout', 'Đặt hàng', 'admin.captcha', 'vi'),
	(2094, 'admin.captcha.captcha_page_review', 'Đánh giá sản phẩm', 'admin.captcha', 'vi'),
	(2095, 'admin.link.list', 'Danh sách liên kết', 'admin.link', 'vi'),
	(2096, 'admin.link.list', 'Link list', 'admin.link', 'en'),
	(2097, 'admin.link.name', 'Tên', 'admin.link', 'vi'),
	(2098, 'admin.link.url', 'Đường dẫn', 'admin.link', 'vi'),
	(2099, 'admin.link.target', 'Target', 'admin.link', 'vi'),
	(2100, 'admin.link.group', 'Nhóm', 'admin.link', 'vi'),
	(2101, 'admin.link.sort', 'Thứ tự', 'admin.link', 'vi'),
	(2102, 'admin.link.status', 'Trạng thái', 'admin.link', 'vi'),
	(2103, 'admin.link.add_new', 'Thêm mới', 'admin.link', 'vi'),
	(2104, 'admin.link.add_new_title', 'Tạo url', 'admin.link', 'vi'),
	(2105, 'admin.link.add_new_des', 'Tạo mới url', 'admin.link', 'vi'),
	(2106, 'admin.link.select_group', 'Chọn nhóm', 'admin.link', 'vi'),
	(2107, 'admin.link.select_target', 'Chọn target', 'admin.link', 'vi'),
	(2108, 'admin.link.helper_url', 'Ví dụ: url, path, hoặc route::name', 'admin.link', 'vi'),
	(2109, 'admin.link.name', 'Name', 'admin.link', 'en'),
	(2110, 'admin.link.url', 'Url', 'admin.link', 'en'),
	(2111, 'admin.link.target', 'Target', 'admin.link', 'en'),
	(2112, 'admin.link.group', 'Group', 'admin.link', 'en'),
	(2113, 'admin.link.status', 'Status', 'admin.link', 'en'),
	(2114, 'admin.link.sort', 'Sort', 'admin.link', 'en'),
	(2115, 'admin.link.add_new', 'Add new', 'admin.link', 'en'),
	(2116, 'admin.link.add_new_title', 'Add layout url', 'admin.link', 'en'),
	(2117, 'admin.link.add_new_des', 'Create a new layout url', 'admin.link', 'en'),
	(2118, 'admin.link.select_group', 'Select group', 'admin.link', 'en'),
	(2119, 'admin.link.select_target', 'Select target', 'admin.link', 'en'),
	(2120, 'admin.link.helper_url', 'Ex: url, path, or route::name', 'admin.link', 'en'),
	(2121, 'admin.link_position.menu', 'Menu', 'admin.link', 'vi'),
	(2122, 'admin.link_position.menu_left', 'Menu trái', 'admin.link', 'vi'),
	(2123, 'admin.link_position.menu_right', 'Menu phải', 'admin.link', 'vi'),
	(2124, 'admin.link_position.footer', 'Footer', 'admin.link', 'vi'),
	(2125, 'admin.link_position.footer_left', 'Footer trái', 'admin.link', 'vi'),
	(2126, 'admin.link_position.footer_right', 'Footer phải', 'admin.link', 'vi'),
	(2127, 'admin.link_position.sidebar', 'Thanh bên', 'admin.link', 'vi'),
	(2128, 'admin.link_position.menu', 'Menu', 'admin.link', 'en'),
	(2129, 'admin.link_position.menu_left', 'Menu left', 'admin.link', 'en'),
	(2130, 'admin.link_position.menu_right', 'Menu right', 'admin.link', 'en'),
	(2131, 'admin.link_position.footer', 'Footer', 'admin.link', 'en'),
	(2132, 'admin.link_position.footer_left', 'Footer left', 'admin.link', 'en'),
	(2133, 'admin.link_position.footer_right', 'Footer right', 'admin.link', 'en'),
	(2134, 'admin.link_position.sidebar', 'Sidebar', 'admin.link', 'en'),
	(2135, 'admin.supplier.name', 'Name', 'admin.supplier', 'en'),
	(2136, 'admin.supplier.alias', 'Url customize <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.supplier', 'en'),
	(2137, 'admin.supplier.alias_validate', 'Maximum 100 characters in the group: "A-Z", "a-z", "0-9" and "-_" ', 'admin.supplier', 'en'),
	(2138, 'admin.supplier.email', 'Email', 'admin.supplier', 'en'),
	(2139, 'admin.supplier.phone', 'Phone', 'admin.supplier', 'en'),
	(2140, 'admin.supplier.address', 'Address', 'admin.supplier', 'en'),
	(2141, 'admin.supplier.image', 'Image', 'admin.supplier', 'en'),
	(2142, 'admin.supplier.url', 'Website', 'admin.supplier', 'en'),
	(2143, 'admin.supplier.sort', 'Sort', 'admin.supplier', 'en'),
	(2144, 'admin.supplier.status', 'Status', 'admin.supplier', 'en'),
	(2145, 'admin.supplier.add_new', 'Add new', 'admin.supplier', 'en'),
	(2146, 'admin.supplier.add_new_title', 'Add supplier', 'admin.supplier', 'en'),
	(2147, 'admin.supplier.add_new_des', 'Create a new supplier', 'admin.supplier', 'en'),
	(2148, 'admin.supplier.list', 'Suppliers list', 'admin.supplier', 'en'),
	(2149, 'admin.supplier.name', 'Tên nhà cung cấp', 'admin.supplier', 'vi'),
	(2150, 'admin.supplier.alias', 'URL tùy chỉnh <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span>', 'admin.supplier', 'vi'),
	(2151, 'admin.supplier.alias_validate', 'Tối đa 100 kí tự trong nhóm: "A-Z", "a-z", "0-9" and "-_" ', 'admin.supplier', 'vi'),
	(2152, 'admin.supplier.email', 'Email', 'admin.supplier', 'vi'),
	(2153, 'admin.supplier.phone', 'Số điện thoại', 'admin.supplier', 'vi'),
	(2154, 'admin.supplier.address', 'Địa chỉ', 'admin.supplier', 'vi'),
	(2155, 'admin.supplier.image', 'Hình ảnh', 'admin.supplier', 'vi'),
	(2156, 'admin.supplier.url', 'Website', 'admin.supplier', 'vi'),
	(2157, 'admin.supplier.sort', 'Sắp xếp', 'admin.supplier', 'vi'),
	(2158, 'admin.supplier.status', 'Status', 'admin.supplier', 'vi'),
	(2159, 'admin.supplier.add_new_title', 'Tạo nhà cung cấp', 'admin.supplier', 'vi'),
	(2160, 'admin.supplier.add_new_des', 'Tạo mới nhà cung cấp', 'admin.supplier', 'vi'),
	(2161, 'admin.supplier.list', 'Danh sách nhà cung cấp', 'admin.supplier', 'vi'),
	(2162, 'admin.supplier.search_place', 'Tìm tên hoặc email', 'admin.supplier', 'vi'),
	(2163, 'admin.supplier.search_place', 'Search name or email', 'admin.supplier', 'en'),
	(2164, 'admin.role.name', 'Name', 'admin.role', 'en'),
	(2165, 'admin.role.slug', 'Slug', 'admin.role', 'en'),
	(2166, 'admin.role.permission', 'Permission', 'admin.role', 'en'),
	(2167, 'admin.role.http_path', 'HTTP path', 'admin.role', 'en'),
	(2168, 'admin.role.http_method', 'HTTP method', 'admin.role', 'en'),
	(2169, 'admin.role.created_at', 'Created at', 'admin.role', 'en'),
	(2170, 'admin.role.updated_at', 'Updated at', 'admin.role', 'en'),
	(2171, 'admin.role.password_confirmation', 'Confirmation', 'admin.role', 'en'),
	(2172, 'admin.role.slug_validate', 'Only characters in the group: "A-Z", "a-z", "0-9" and "._-" ', 'admin.role', 'en'),
	(2173, 'admin.role.list', 'Role manager', 'admin.role', 'en'),
	(2174, 'admin.role.edit', 'Edit', 'admin.role', 'en'),
	(2175, 'admin.role.add_new', 'Add new', 'admin.role', 'en'),
	(2176, 'admin.role.add_new_title', 'Add new role', 'admin.role', 'en'),
	(2177, 'admin.role.add_new_des', 'Create a new role', 'admin.role', 'en'),
	(2178, 'admin.role.select_http_method', 'Select method', 'admin.role', 'en'),
	(2179, 'admin.role.select_permission', 'Select permission', 'admin.role', 'en'),
	(2180, 'admin.role.select_user', 'Select user', 'admin.role', 'en'),
	(2181, 'admin.role.slug', 'Slug', 'admin.role', 'vi'),
	(2182, 'admin.role.name', 'Tên', 'admin.role', 'vi'),
	(2183, 'admin.role.roles', 'vai trò', 'admin.role', 'vi'),
	(2184, 'admin.role.permission', 'Quyền hạn', 'admin.role', 'vi'),
	(2185, 'admin.role.http_path', 'HTTP path', 'admin.role', 'vi'),
	(2186, 'admin.role.http_method', 'HTTP method', 'admin.role', 'vi'),
	(2187, 'admin.role.created_at', 'Tạo lúc', 'admin.role', 'vi'),
	(2188, 'admin.role.updated_at', 'Cập nhật', 'admin.role', 'vi'),
	(2189, 'admin.role.slug_validate', 'Chỉ sử dụng kí tự trong nhóm: "A-Z", "a-z", "0-9" and "._-" ', 'admin.role', 'vi'),
	(2190, 'admin.role.add_new', 'Thêm mới', 'admin.role', 'vi'),
	(2191, 'admin.role.add_new_title', 'Tạo quyền', 'admin.role', 'vi'),
	(2192, 'admin.role.add_new_des', 'Tạo mới một quyền', 'admin.role', 'vi'),
	(2193, 'admin.role.select_permission', 'Chọn quyền hạn', 'admin.role', 'vi'),
	(2194, 'admin.role.select_user', 'Chọn người dùng', 'admin.role', 'vi'),
	(2195, 'admin.template.import', 'Import Template', 'admin.template', 'en'),
	(2196, 'admin.template.file_format', 'File format', 'admin.template', 'en'),
	(2197, 'admin.template.choose_file', 'Choose File', 'admin.template', 'en'),
	(2198, 'admin.template.import_submit', 'Import', 'admin.template', 'en'),
	(2199, 'admin.template.import_note', 'File <span style="color:red">.zip</span>, max size is <span style="color:red">50MB</span>', 'admin.template', 'en'),
	(2200, 'admin.template.error_unzip', 'Error while unzip', 'admin.template', 'en'),
	(2201, 'admin.template.error_upload', 'Error while uploading file', 'admin.template', 'en'),
	(2202, 'admin.template.error_check_config', 'Cannot find config file', 'admin.template', 'en'),
	(2203, 'admin.template.error_config_format', 'The config file is not in the right format', 'admin.template', 'en'),
	(2204, 'admin.template.import_success', 'Import success!', 'admin.template', 'en'),
	(2205, 'admin.template.error_exist', 'Template exist!', 'admin.template', 'en'),
	(2206, 'admin.template.template_import', '<a href="import" target=_new><span class="btn btn-success btn-flat"><i class="fa fa-floppy-o" aria-hidden="true"></i> Import Template</span></a>', 'admin.template', 'en'),
	(2207, 'admin.template.template_more', '<a href="https://s-cart.org/en/template.html" target=_new><i class="fa fa-download" aria-hidden="true"></i> Download more HERE</a>', 'admin.template', 'en'),
	(2208, 'admin.template.manager', 'Template management', 'admin.template', 'en'),
	(2209, 'admin.template.title', 'Template list', 'admin.template', 'en'),
	(2210, 'admin.template.name', 'Template name', 'admin.template', 'en'),
	(2211, 'admin.template.auth', 'Author', 'admin.template', 'en'),
	(2212, 'admin.template.email', 'Email', 'admin.template', 'en'),
	(2213, 'admin.template.website', 'Website', 'admin.template', 'en'),
	(2214, 'admin.template.activated', 'Activated', 'admin.template', 'en'),
	(2215, 'admin.template.inactive', 'Inactive', 'admin.template', 'en'),
	(2216, 'admin.template.download', 'Download', 'admin.template', 'en'),
	(2217, 'admin.template.remove', 'Remove', 'admin.template', 'en'),
	(2218, 'admin.template.status', 'Status', 'admin.template', 'en'),
	(2219, 'admin.template.action', 'Action', 'admin.template', 'en'),
	(2220, 'admin.template.installing', 'Installing', 'admin.template', 'en'),
	(2221, 'admin.template.local', 'Save local', 'admin.template', 'en'),
	(2222, 'admin.template.online', 'From library', 'admin.template', 'en'),
	(2223, 'admin.template.version', 'Version', 'admin.template', 'en'),
	(2224, 'admin.template.link', 'Link', 'admin.template', 'en'),
	(2225, 'admin.template.image', 'Image', 'admin.template', 'en'),
	(2226, 'admin.template.empty', 'Empty template!', 'admin.template', 'en'),
	(2227, 'admin.template.downloaded', 'Downloaded', 'admin.template', 'en'),
	(2228, 'admin.template.rated', 'Rated', 'admin.template', 'en'),
	(2229, 'admin.template.price', 'Price', 'admin.template', 'en'),
	(2230, 'admin.template.free', 'Free', 'admin.template', 'en'),
	(2231, 'admin.template.date', 'Date', 'admin.template', 'en'),
	(2232, 'admin.template.click_here', 'Click here', 'admin.template', 'en'),
	(2233, 'admin.template.located', 'Located', 'admin.template', 'en'),
	(2234, 'admin.template.code', 'Code', 'admin.template', 'en'),
	(2235, 'admin.template.image_demo', 'Image demo', 'admin.template', 'en'),
	(2236, 'admin.template.only_version_current', 'Only this version', 'admin.template', 'en'),
	(2237, 'admin.template.compatible', 'Compatible', 'admin.template', 'en'),
	(2238, 'admin.template.used', 'Template used', 'admin.template', 'en'),
	(2239, 'admin.template.list', 'Template list', 'admin.template', 'en'),
	(2240, 'admin.template.import', 'Import Giao diện', 'admin.template', 'vi'),
	(2241, 'admin.template.file_format', 'File mẫu', 'admin.template', 'vi'),
	(2242, 'admin.template.choose_file', 'Chọn file', 'admin.template', 'vi'),
	(2243, 'admin.template.import_submit', 'Import', 'admin.template', 'vi'),
	(2244, 'admin.template.import_note', 'Là file <span style="color:red">.zip</span>, dung lượng tối đa <span style="color:red">50MB</span>', 'admin.template', 'vi'),
	(2245, 'admin.template.error_unzip', 'Lỗi trong khi unzip', 'admin.template', 'vi'),
	(2246, 'admin.template.error_upload', 'Lỗi trong khi upload file', 'admin.template', 'vi'),
	(2247, 'admin.template.error_check_config', 'Không tìm thấy hoặc không thể đọc file config', 'admin.template', 'vi'),
	(2248, 'admin.template.error_config_format', 'File config không đúng định dạng', 'admin.template', 'vi'),
	(2249, 'admin.template.import_success', 'Import thành công!', 'admin.template', 'vi'),
	(2250, 'admin.template.error_exist', 'Giao diện đã tồn tại!', 'admin.template', 'vi'),
	(2251, 'admin.template.template_import', '<a href="import" target=_new><span class="btn btn-success btn-flat"><i class="fa fa-floppy-o" aria-hidden="true"></i> Import Plugin</span></a>', 'admin.template', 'vi'),
	(2252, 'admin.template.template_more', '<a href="https://s-cart.org/vi/template.html" target=_new><i class="fa fa-download" aria-hidden="true"></i> Download đầy đủ Ở ĐÂY</a>', 'admin.template', 'vi'),
	(2253, 'admin.template.manager', 'Quản lý giao diện', 'admin.template', 'vi'),
	(2254, 'admin.template.title', 'Danh sách giao diện', 'admin.template', 'vi'),
	(2255, 'admin.template.name', 'Tên giao diện', 'admin.template', 'vi'),
	(2256, 'admin.template.email', 'Email', 'admin.template', 'vi'),
	(2257, 'admin.template.website', 'Website', 'admin.template', 'vi'),
	(2258, 'admin.template.activated', 'Đang hoạt động', 'admin.template', 'vi'),
	(2259, 'admin.template.inactive', 'Đang ẩn', 'admin.template', 'vi'),
	(2260, 'admin.template.download', 'Tải về', 'admin.template', 'vi'),
	(2261, 'admin.template.remove', 'Gỡ bỏ', 'admin.template', 'vi'),
	(2262, 'admin.template.status', 'Trạng thái', 'admin.template', 'vi'),
	(2263, 'admin.template.action', 'Hành động', 'admin.template', 'vi'),
	(2264, 'admin.template.installing', 'Đang cài đặt', 'admin.template', 'vi'),
	(2265, 'admin.template.local', 'Đã lưu trên máy', 'admin.template', 'vi'),
	(2266, 'admin.template.online', 'Tải từ thư viện', 'admin.template', 'vi'),
	(2267, 'admin.template.auth', 'Tác giả', 'admin.template', 'vi'),
	(2268, 'admin.template.version', 'Phiên bản', 'admin.template', 'vi'),
	(2269, 'admin.template.link', 'Liên kết', 'admin.template', 'vi'),
	(2270, 'admin.template.image', 'Hình ảnh', 'admin.template', 'vi'),
	(2271, 'admin.template.empty', 'Chưa có template nào!', 'admin.template', 'vi'),
	(2272, 'admin.template.downloaded', 'Số lần tải', 'admin.template', 'vi'),
	(2273, 'admin.template.rated', 'Đánh giá', 'admin.template', 'vi'),
	(2274, 'admin.template.price', 'Giá', 'admin.template', 'vi'),
	(2275, 'admin.template.free', 'Miễn phí', 'admin.template', 'vi'),
	(2276, 'admin.template.date', 'Ngày tạo', 'admin.template', 'vi'),
	(2277, 'admin.template.located', 'Đã tải về', 'admin.template', 'vi'),
	(2278, 'admin.template.code', 'Mã code', 'admin.template', 'vi'),
	(2279, 'admin.template.click_here', 'Bấm vào đây', 'admin.template', 'vi'),
	(2280, 'admin.template.image_demo', 'Hình mẫu', 'admin.template', 'vi'),
	(2281, 'admin.template.only_version_current', 'Chỉ phiên bản này', 'admin.template', 'vi'),
	(2282, 'admin.template.compatible', 'Tương thích', 'admin.template', 'vi'),
	(2283, 'admin.template.used', 'Đang sử dụng', 'admin.template', 'vi'),
	(2284, 'admin.template.list', 'Danh sách giao diện', 'admin.template', 'vi'),
	(2285, 'admin.plugin.compatible', 'Tương thích', 'admin.plugin', 'vi'),
	(2286, 'admin.plugin.code', 'Mã code', 'admin.plugin', 'vi'),
	(2287, 'admin.plugin.name', 'Tên chức năng', 'admin.plugin', 'vi'),
	(2288, 'admin.plugin.sort', 'Thứ tự', 'admin.plugin', 'vi'),
	(2289, 'admin.plugin.action', 'Hành động', 'admin.plugin', 'vi'),
	(2290, 'admin.plugin.status', 'Trạng thái', 'admin.plugin', 'vi'),
	(2291, 'admin.plugin.enable', 'Kích hoạt', 'admin.plugin', 'vi'),
	(2292, 'admin.plugin.disable', 'Tắt', 'admin.plugin', 'vi'),
	(2293, 'admin.plugin.remove', 'Gỡ bỏ', 'admin.plugin', 'vi'),
	(2294, 'admin.plugin.only_delete_data', 'Chỉ xóa dữ liệu', 'admin.plugin', 'vi'),
	(2295, 'admin.plugin.install', 'Cài đặt', 'admin.plugin', 'vi'),
	(2296, 'admin.plugin.config', 'Cấu hình', 'admin.plugin', 'vi'),
	(2297, 'admin.plugin.actived', 'Hoạt động', 'admin.plugin', 'vi'),
	(2298, 'admin.plugin.disabled', 'Bị tắt', 'admin.plugin', 'vi'),
	(2299, 'admin.plugin.not_install', 'Chưa cài đặt', 'admin.plugin', 'vi'),
	(2300, 'admin.plugin.auth', 'Tác giả', 'admin.plugin', 'vi'),
	(2301, 'admin.plugin.version', 'Phiên bản', 'admin.plugin', 'vi'),
	(2302, 'admin.plugin.link', 'Liên kết', 'admin.plugin', 'vi'),
	(2303, 'admin.plugin.image', 'Hình ảnh', 'admin.plugin', 'vi'),
	(2304, 'admin.plugin.empty', 'Chưa có extension nào!', 'admin.plugin', 'vi'),
	(2305, 'admin.plugin.local', 'Đã lưu trên máy', 'admin.plugin', 'vi'),
	(2306, 'admin.plugin.online', 'Tải từ thư viện', 'admin.plugin', 'vi'),
	(2307, 'admin.plugin.downloaded', 'Số lần tải', 'admin.plugin', 'vi'),
	(2308, 'admin.plugin.rated', 'Đánh giá', 'admin.plugin', 'vi'),
	(2309, 'admin.plugin.price', 'Giá', 'admin.plugin', 'vi'),
	(2310, 'admin.plugin.free', 'Miễn phí', 'admin.plugin', 'vi'),
	(2311, 'admin.plugin.date', 'Ngày tạo', 'admin.plugin', 'vi'),
	(2312, 'admin.plugin.located', 'Đã tải về', 'admin.plugin', 'vi'),
	(2313, 'admin.plugin.only_free', 'Là miễn phí', 'admin.plugin', 'vi'),
	(2314, 'admin.plugin.only_version', 'Cùng phiên bản', 'admin.plugin', 'vi'),
	(2315, 'admin.plugin.all_version', 'Tất cả phiên bản', 'admin.plugin', 'vi'),
	(2316, 'admin.plugin.sort_price_asc', 'Giá tăng', 'admin.plugin', 'vi'),
	(2317, 'admin.plugin.sort_price_desc', 'Giá giảm', 'admin.plugin', 'vi'),
	(2318, 'admin.plugin.sort_rating', 'Bình chọn', 'admin.plugin', 'vi'),
	(2319, 'admin.plugin.sort_download', 'Lượt tải', 'admin.plugin', 'vi'),
	(2320, 'admin.plugin.search_keyword', 'Từ khóa', 'admin.plugin', 'vi'),
	(2321, 'admin.plugin.enter_search_keyword', 'Nhập từ khóa', 'admin.plugin', 'vi'),
	(2322, 'admin.plugin.search_submit', 'Lọc kết quả', 'admin.plugin', 'vi'),
	(2323, 'admin.plugin.import', 'Import Plugin', 'admin.plugin', 'vi'),
	(2324, 'admin.plugin.file_format', 'File mẫu', 'admin.plugin', 'vi'),
	(2325, 'admin.plugin.choose_file', 'Chọn file', 'admin.plugin', 'vi'),
	(2326, 'admin.plugin.import_submit', 'Import', 'admin.plugin', 'vi'),
	(2327, 'admin.plugin.import_data', 'Import :data', 'admin.plugin', 'vi'),
	(2328, 'admin.plugin.import_note', 'Là file <span style="color:red">.zip</span>, dung lượng tối đa <span style="color:red">50MB</span>', 'admin.plugin', 'vi'),
	(2329, 'admin.plugin.error_unzip', 'Lỗi trong khi unzip', 'admin.plugin', 'vi'),
	(2330, 'admin.plugin.error_upload', 'Lỗi trong khi upload file', 'admin.plugin', 'vi'),
	(2331, 'admin.plugin.error_check_config', 'Không tìm thấy hoặc không thể đọc file config', 'admin.plugin', 'vi'),
	(2332, 'admin.plugin.error_config_format', 'File config không đúng định dạng', 'admin.plugin', 'vi'),
	(2333, 'admin.plugin.import_success', 'Import thành công!', 'admin.plugin', 'vi'),
	(2334, 'admin.plugin.error_exist', 'Plugin đã tồn tại!', 'admin.plugin', 'vi'),
	(2335, 'admin.plugin.plugin_import', '<a href="import" target=_new><span class="btn btn-success btn-flat"><i class="fa fa-floppy-o" aria-hidden="true"></i> Import Plugin</span></a>', 'admin.plugin', 'vi'),
	(2336, 'admin.plugin.plugin_more', '<a href="https://s-cart.org/vi/plugin.html" target=_new><i class="fa fa-download" aria-hidden="true"></i> Download đầy đủ Ở ĐÂY</a>', 'admin.plugin', 'vi'),
	(2337, 'admin.plugin.Shipping_plugin', 'Shipping extension', 'admin.plugin', 'en'),
	(2338, 'admin.plugin.Payment_plugin', 'Payment extension', 'admin.plugin', 'en'),
	(2339, 'admin.plugin.Total_plugin', 'Total extension', 'admin.plugin', 'en'),
	(2340, 'admin.plugin.Other_plugin', 'Other plugin', 'admin.plugin', 'en'),
	(2341, 'admin.plugin.Api_plugin', 'Module Api', 'admin.plugin', 'en'),
	(2342, 'admin.plugin.Cms_plugin', 'Cms plugins', 'admin.plugin', 'en'),
	(2343, 'admin.plugin.Block_plugin', 'Block plugins', 'admin.plugin', 'en'),
	(2344, 'admin.plugin.Shipping_plugin', 'Chức năng vận chuyển', 'admin.plugin', 'vi'),
	(2345, 'admin.plugin.Payment_plugin', 'Chức năng thanh toán', 'admin.plugin', 'vi'),
	(2346, 'admin.plugin.Total_plugin', 'Chức năng giá trị đơn hàng', 'admin.plugin', 'vi'),
	(2347, 'admin.plugin.Other_plugin', 'Chức năng khác', 'admin.plugin', 'vi'),
	(2348, 'admin.plugin.Cms_plugin', 'Module CMS', 'admin.plugin', 'vi'),
	(2349, 'admin.plugin.Api_plugin', 'Module Api', 'admin.plugin', 'vi'),
	(2350, 'admin.plugin.Block_plugin', 'Module Block', 'admin.plugin', 'vi'),
	(2351, 'admin.plugin.compatible', 'Compatible', 'admin.plugin', 'en'),
	(2352, 'admin.plugin.code', 'Code', 'admin.plugin', 'en'),
	(2353, 'admin.plugin.name', 'Name', 'admin.plugin', 'en'),
	(2354, 'admin.plugin.sort', 'Sort', 'admin.plugin', 'en'),
	(2355, 'admin.plugin.action', 'Action', 'admin.plugin', 'en'),
	(2356, 'admin.plugin.status', 'Status', 'admin.plugin', 'en'),
	(2357, 'admin.plugin.enable', 'Enable', 'admin.plugin', 'en'),
	(2358, 'admin.plugin.disable', 'Disable', 'admin.plugin', 'en'),
	(2359, 'admin.plugin.remove', 'Remove', 'admin.plugin', 'en'),
	(2360, 'admin.plugin.only_delete_data', 'Only remove data', 'admin.plugin', 'en'),
	(2361, 'admin.plugin.install', 'Install', 'admin.plugin', 'en'),
	(2362, 'admin.plugin.config', 'Config', 'admin.plugin', 'en'),
	(2363, 'admin.plugin.actived', 'Actived', 'admin.plugin', 'en'),
	(2364, 'admin.plugin.disabled', 'Disabled', 'admin.plugin', 'en'),
	(2365, 'admin.plugin.not_install', 'Not install', 'admin.plugin', 'en'),
	(2366, 'admin.plugin.auth', 'Auth', 'admin.plugin', 'en'),
	(2367, 'admin.plugin.version', 'Version', 'admin.plugin', 'en'),
	(2368, 'admin.plugin.link', 'Link', 'admin.plugin', 'en'),
	(2369, 'admin.plugin.image', 'Image', 'admin.plugin', 'en'),
	(2370, 'admin.plugin.empty', 'Empty extension!', 'admin.plugin', 'en'),
	(2371, 'admin.plugin.local', 'Save local', 'admin.plugin', 'en'),
	(2372, 'admin.plugin.online', 'From library', 'admin.plugin', 'en'),
	(2373, 'admin.plugin.downloaded', 'Downloaded', 'admin.plugin', 'en'),
	(2374, 'admin.plugin.rated', 'Rated', 'admin.plugin', 'en'),
	(2375, 'admin.plugin.price', 'Price', 'admin.plugin', 'en'),
	(2376, 'admin.plugin.free', 'Free', 'admin.plugin', 'en'),
	(2377, 'admin.plugin.date', 'Date', 'admin.plugin', 'en'),
	(2378, 'admin.plugin.located', 'Located', 'admin.plugin', 'en'),
	(2379, 'admin.plugin.only_free', 'Is free', 'admin.plugin', 'en'),
	(2380, 'admin.plugin.only_version', 'Only version', 'admin.plugin', 'en'),
	(2381, 'admin.plugin.all_version', 'All version', 'admin.plugin', 'en'),
	(2382, 'admin.plugin.sort_price_asc', 'Price asc', 'admin.plugin', 'en'),
	(2383, 'admin.plugin.sort_price_desc', 'Price desc', 'admin.plugin', 'en'),
	(2384, 'admin.plugin.sort_rating', 'Rating', 'admin.plugin', 'en'),
	(2385, 'admin.plugin.sort_download', 'Download', 'admin.plugin', 'en'),
	(2386, 'admin.plugin.search_keyword', 'Keyword', 'admin.plugin', 'en'),
	(2387, 'admin.plugin.enter_search_keyword', 'Enter keyword', 'admin.plugin', 'en'),
	(2388, 'admin.plugin.search_submit', 'Filter result', 'admin.plugin', 'en'),
	(2389, 'admin.plugin.import', 'Import Plugin', 'admin.plugin', 'en'),
	(2390, 'admin.plugin.file_format', 'File format', 'admin.plugin', 'en'),
	(2391, 'admin.plugin.choose_file', 'Choose File', 'admin.plugin', 'en'),
	(2392, 'admin.plugin.import_submit', 'Import', 'admin.plugin', 'en'),
	(2393, 'admin.plugin.import_data', 'Import :data', 'admin.plugin', 'en'),
	(2394, 'admin.plugin.import_note', 'File <span style="color:red">.zip</span>, max size is <span style="color:red">50MB</span>', 'admin.plugin', 'en'),
	(2395, 'admin.plugin.error_unzip', 'Error while unzip', 'admin.plugin', 'en'),
	(2396, 'admin.plugin.error_upload', 'Error while uploading file', 'admin.plugin', 'en'),
	(2397, 'admin.plugin.error_check_config', 'Cannot find config file', 'admin.plugin', 'en'),
	(2398, 'admin.plugin.error_config_format', 'The config file is not in the right format', 'admin.plugin', 'en'),
	(2399, 'admin.plugin.import_success', 'Import success!', 'admin.plugin', 'en'),
	(2400, 'admin.plugin.error_exist', 'Plugin exist!', 'admin.plugin', 'en'),
	(2401, 'admin.plugin.plugin_import', '<a href="import" target=_new><span class="btn btn-success btn-flat"><i class="fa fa-floppy-o" aria-hidden="true"></i> Import Plugin</span></a>', 'admin.plugin', 'en'),
	(2402, 'admin.plugin.plugin_more', '<a href="https://s-cart.org/en/plugin.html" target=_new><i class="fa fa-download" aria-hidden="true"></i> Download more HERE</a>', 'admin.plugin', 'en'),
	(2403, 'admin.plugin.install_success', 'Installed successfully', 'admin.plugin', 'en'),
	(2404, 'admin.plugin.install_faild', 'Installation failed', 'admin.plugin', 'en'),
	(2405, 'admin.plugin.table_exist', 'Table :table already exists', 'admin.plugin', 'en'),
	(2406, 'admin.plugin.plugin_exist', 'This plugin already exists', 'admin.plugin', 'en'),
	(2407, 'admin.plugin.action_error', 'There was an error while :action', 'admin.plugin', 'en'),
	(2408, 'admin.plugin.install_success', 'Cài đặt thành công', 'admin.plugin', 'vi'),
	(2409, 'admin.plugin.install_faild', 'Cài đặt thất bại', 'admin.plugin', 'vi'),
	(2410, 'admin.plugin.table_exist', 'Bảng :table đã tồn tại rồi', 'admin.plugin', 'vi'),
	(2411, 'admin.plugin.plugin_exist', 'Plugin này đã tồn tại rồi', 'admin.plugin', 'vi'),
	(2412, 'admin.plugin.action_error', 'Có lỗi trong khi :action', 'admin.plugin', 'vi'),
	(2413, 'admin.chart.static_month', 'Thống kê trong 12 tháng', 'admin.chart', 'vi'),
	(2414, 'admin.chart.static_30_day', 'Thống kê trong 1 tháng', 'admin.chart', 'vi'),
	(2415, 'admin.chart.static_month_help', 'Dữ liệu so sánh bằng tổng số tiền của đơn hàng, đơn vị Bit', 'admin.chart', 'vi'),
	(2416, 'admin.chart.amount', 'Tổng số tiền (Bit)', 'admin.chart', 'vi'),
	(2417, 'admin.chart.order', 'Tổng đơn hàng', 'admin.chart', 'vi'),
	(2418, 'admin.chart.static_country', 'Đơn hàng theo quốc gia', 'admin.chart', 'vi'),
	(2419, 'admin.chart.country', 'Quốc gia', 'admin.chart', 'vi'),
	(2420, 'admin.chart.static_month', 'Statistics for 12 months', 'admin.chart', 'en'),
	(2421, 'admin.chart.static_30_day', 'Statistics for 30 days', 'admin.chart', 'en'),
	(2422, 'admin.chart.static_month_help', 'The comparison data is equal to the total amount of the order and the Bit units', 'admin.chart', 'en'),
	(2423, 'admin.chart.amount', 'Total amount (Bit)', 'admin.chart', 'en'),
	(2424, 'admin.chart.order', 'Total order', 'admin.chart', 'en'),
	(2425, 'admin.chart.static_country', 'Statistics of orders by country', 'admin.chart', 'en'),
	(2426, 'admin.chart.country', 'Country', 'admin.chart', 'en'),
	(2427, 'admin.chart.static_device', 'Statistics of orders by device', 'admin.chart', 'en'),
	(2428, 'admin.chart.static_device', 'Thống kê đơn hàng theo thiết bị', 'admin.chart', 'vi'),
	(2429, 'admin.chart.device', 'Device type', 'admin.chart', 'en'),
	(2430, 'admin.chart.device', 'Loại thiết bị', 'admin.chart', 'vi'),
	(2431, 'admin.maintain.title', 'Maintenance page', 'admin.maintain', 'en'),
	(2432, 'admin.maintain.content', 'Maintenance content of the store', 'admin.maintain', 'en'),
	(2433, 'admin.maintain.description', 'Description', 'admin.maintain', 'en'),
	(2434, 'admin.maintain.description_note', 'Maintenance note', 'admin.maintain', 'en'),
	(2435, 'admin.maintain.title', 'Trang bảo trì', 'admin.maintain', 'vi'),
	(2436, 'admin.maintain.content', 'Nội dung bảo trì của cửa hàng', 'admin.maintain', 'vi'),
	(2437, 'admin.maintain.description', 'Nội dung', 'admin.maintain', 'vi'),
	(2438, 'admin.maintain.description_note', 'Ghi chú bảo trì', 'admin.maintain', 'vi'),
	(2439, 'admin.seo.config', 'Cấu hình SEO', 'admin.seo', 'vi'),
	(2440, 'admin.seo.config', 'SEO config', 'admin.seo', 'en'),
	(2441, 'admin.seo.url_seo_lang', 'Thêm ngôn ngữ trên URL', 'admin.seo', 'vi'),
	(2442, 'admin.seo.url_seo_lang', 'Add language on URL', 'admin.seo', 'en'),
	(2443, 'admin.dashboard.total_order', 'Tổng đơn hàng', 'admin.dashboard', 'vi'),
	(2444, 'admin.dashboard.total_order', 'Order total', 'admin.dashboard', 'en'),
	(2445, 'admin.dashboard.total_product', 'Tổng sản phẩm', 'admin.dashboard', 'vi'),
	(2446, 'admin.dashboard.total_product', 'Product total', 'admin.dashboard', 'en'),
	(2447, 'admin.dashboard.total_customer', 'Tổng khách hàng', 'admin.dashboard', 'vi'),
	(2448, 'admin.dashboard.total_customer', 'Customer total', 'admin.dashboard', 'en'),
	(2449, 'admin.dashboard.total_blog', 'Tổng blog', 'admin.dashboard', 'vi'),
	(2450, 'admin.dashboard.total_blog', 'Blog total', 'admin.dashboard', 'en'),
	(2451, 'admin.dashboard.order_month', 'Đơn hàng trong tháng', 'admin.dashboard', 'vi'),
	(2452, 'admin.dashboard.order_month', 'Order in month', 'admin.dashboard', 'en'),
	(2453, 'admin.dashboard.order_year', 'Đơn hàng trong năm', 'admin.dashboard', 'vi'),
	(2454, 'admin.dashboard.order_year', 'Order in year', 'admin.dashboard', 'en'),
	(2455, 'admin.dashboard.top_order_new', 'Đơn hàng mới', 'admin.dashboard', 'vi'),
	(2456, 'admin.dashboard.top_order_new', 'New orders', 'admin.dashboard', 'en'),
	(2457, 'admin.dashboard.top_customer_new', 'Khách hàng mới mới', 'admin.dashboard', 'vi'),
	(2458, 'admin.dashboard.top_customer_new', 'New customers', 'admin.dashboard', 'en'),
	(2459, 'admin.dashboard.pie_chart', 'Hiển thị biểu đồ pie', 'admin.dashboard', 'vi'),
	(2460, 'admin.dashboard.pie_chart', 'Display pie chart total', 'admin.dashboard', 'en'),
	(2461, 'admin.dashboard.title', 'Trang tổng quan', 'admin.dashboard', 'vi'),
	(2462, 'admin.dashboard.title', 'Dashboard page', 'admin.dashboard', 'en'),
	(2463, 'admin.dashboard.config_display', 'Cấu hình trang tổng quan admin', 'admin.dashboard', 'vi'),
	(2464, 'admin.dashboard.config_display', 'Config dashboard adminpage', 'admin.dashboard', 'en'),
	(2465, 'admin.layout_page_position.all', 'All Page', 'admin.layout_page_position', 'en'),
	(2466, 'admin.layout_page_position.home', 'Home page', 'admin.layout_page_position', 'en'),
	(2467, 'admin.layout_page_position.shop_home', 'Home shop', 'admin.layout_page_position', 'en'),
	(2468, 'admin.layout_page_position.shop_search', 'Search page', 'admin.layout_page_position', 'en'),
	(2469, 'admin.layout_page_position.vendor_home', 'Store: home', 'admin.layout_page_position', 'en'),
	(2470, 'admin.layout_page_position.store_product_list', 'Store: product list', 'admin.layout_page_position', 'en'),
	(2471, 'admin.layout_page_position.product_list', 'List: product', 'admin.layout_page_position', 'en'),
	(2472, 'admin.layout_page_position.product_detail', 'Detail: product', 'admin.layout_page_position', 'en'),
	(2473, 'admin.layout_page_position.shop_cart', 'Cart: cart, wishlist, compare, checkout', 'admin.layout_page_position', 'en'),
	(2474, 'admin.layout_page_position.shop_auth', 'Auth: login, forgot, register', 'admin.layout_page_position', 'en'),
	(2475, 'admin.layout_page_position.shop_profile', 'Customer profile', 'admin.layout_page_position', 'en'),
	(2476, 'admin.layout_page_position.item_list', 'List: category, brand, supplier', 'admin.layout_page_position', 'en'),
	(2477, 'admin.layout_page_position.item_detail', 'Detail: item', 'admin.layout_page_position', 'en'),
	(2478, 'admin.layout_page_position.news_list', 'List:  Blog/news', 'admin.layout_page_position', 'en'),
	(2479, 'admin.layout_page_position.news_detail', 'Detail: entry Blog', 'admin.layout_page_position', 'en'),
	(2480, 'admin.layout_page_position.content_list', 'List: content CMS', 'admin.layout_page_position', 'en'),
	(2481, 'admin.layout_page_position.content_detail', 'Detail: entry CMS', 'admin.layout_page_position', 'en'),
	(2482, 'admin.layout_page_position.shop_contact', 'Page contact', 'admin.layout_page_position', 'en'),
	(2483, 'admin.layout_page_position.shop_page', 'Other page: about...', 'admin.layout_page_position', 'en'),
	(2484, 'admin.layout_page_position.all', 'Tất cả trang', 'admin.layout_page_position', 'vi'),
	(2485, 'admin.layout_page_position.home', 'Trang chủ', 'admin.layout_page_position', 'vi'),
	(2486, 'admin.layout_page_position.shop_home', 'Trang chủ Shop', 'admin.layout_page_position', 'vi'),
	(2487, 'admin.layout_page_position.shop_search', 'Trang tìm kiếm', 'admin.layout_page_position', 'vi'),
	(2488, 'admin.layout_page_position.vendor_home', 'Cửa hàng: trang chủ', 'admin.layout_page_position', 'vi'),
	(2489, 'admin.layout_page_position.store_product_list', 'Cửa hàng: danh sách sản phẩm', 'admin.layout_page_position', 'vi'),
	(2490, 'admin.layout_page_position.product_list', 'Danh sách: sản phẩm', 'admin.layout_page_position', 'vi'),
	(2491, 'admin.layout_page_position.product_detail', 'Chi tiết: sản phẩm', 'admin.layout_page_position', 'vi'),
	(2492, 'admin.layout_page_position.shop_cart', 'Giỏ hàng: giỏ hàng, wishlist, compare, checkout', 'admin.layout_page_position', 'vi'),
	(2493, 'admin.layout_page_position.shop_auth', 'Chứng thực: đăng nhập, đăng ký, quên mật khẩu', 'admin.layout_page_position', 'vi'),
	(2494, 'admin.layout_page_position.shop_profile', 'Tài khoản khách hàng', 'admin.layout_page_position', 'vi'),
	(2495, 'admin.layout_page_position.item_list', 'Danh sách item: danh mục, nhãn hiệu, nhà cung cấp', 'admin.layout_page_position', 'vi'),
	(2496, 'admin.layout_page_position.item_detail', 'Chi tiết: item', 'admin.layout_page_position', 'vi'),
	(2497, 'admin.layout_page_position.news_list', 'Danh sách: bài viết Blog', 'admin.layout_page_position', 'vi'),
	(2498, 'admin.layout_page_position.news_detail', 'Chi tiết: bài viết Blog', 'admin.layout_page_position', 'vi'),
	(2499, 'admin.layout_page_position.content_list', 'Danh sách: bài viết CMS', 'admin.layout_page_position', 'vi'),
	(2500, 'admin.layout_page_position.content_detail', 'Chi tiết: bài viết CMS', 'admin.layout_page_position', 'vi'),
	(2501, 'admin.layout_page_position.shop_contact', 'Trang liên hệ', 'admin.layout_page_position', 'vi'),
	(2502, 'admin.layout_page_position.shop_page', 'Các trang viết: giới thiệu...', 'admin.layout_page_position', 'vi'),
	(2503, 'admin.layout_page_block.header', 'Head code :meta, css, javascript,...', 'admin.layout_page_block', 'vi'),
	(2504, 'admin.layout_page_block.top', 'Block Top', 'admin.layout_page_block', 'vi'),
	(2505, 'admin.layout_page_block.bottom', 'Block Bottom', 'admin.layout_page_block', 'vi'),
	(2506, 'admin.layout_page_block.left', 'BlockLeft - Cột trái', 'admin.layout_page_block', 'vi'),
	(2507, 'admin.layout_page_block.right', 'Block Right - Cột phải', 'admin.layout_page_block', 'vi'),
	(2508, 'admin.layout_page_block.banner_top', 'Block banner top', 'admin.layout_page_block', 'vi'),
	(2509, 'admin.layout_page_block.header', 'Head code: meta, css, javascript, ...', 'admin.layout_page_block', 'en'),
	(2510, 'admin.layout_page_block.top', 'Block Top', 'admin.layout_page_block', 'en'),
	(2511, 'admin.layout_page_block.bottom', 'Block Bottom', 'admin.layout_page_block', 'en'),
	(2512, 'admin.layout_page_block.left', 'Block Left', 'admin.layout_page_block', 'en'),
	(2513, 'admin.layout_page_block.right', 'Block Right', 'admin.layout_page_block', 'en'),
	(2514, 'admin.layout_page_block.banner_top', 'Block banner top', 'admin.layout_page_block', 'en'),
	(2515, 'admin.admin_custom_config.facebook_url', 'Facebook Url', 'admin.admin_custom_config', 'en'),
	(2516, 'admin.admin_custom_config.fanpage_url', 'Fanpage Url', 'admin.admin_custom_config', 'en'),
	(2517, 'admin.admin_custom_config.twitter_url', 'Twitter Url', 'admin.admin_custom_config', 'en'),
	(2518, 'admin.admin_custom_config.instagram_url', 'Instagram Url', 'admin.admin_custom_config', 'en'),
	(2519, 'admin.admin_custom_config.youtube_url', 'Youtube Url', 'admin.admin_custom_config', 'en'),
	(2520, 'admin.admin_custom_config.facebook_url', 'Facebook Url', 'admin.admin_custom_config', 'vi'),
	(2521, 'admin.admin_custom_config.fanpage_url', 'Fanpage Url', 'admin.admin_custom_config', 'vi'),
	(2522, 'admin.admin_custom_config.twitter_url', 'Twitter Url', 'admin.admin_custom_config', 'vi'),
	(2523, 'admin.admin_custom_config.instagram_url', 'Instagram Url', 'admin.admin_custom_config', 'vi'),
	(2524, 'admin.admin_custom_config.youtube_url', 'Youtube Url', 'admin.admin_custom_config', 'vi'),
	(2525, 'admin.config_layout.link_home_page', 'Hiển thị link trang chủ', 'admin.config_layout', 'vi'),
	(2526, 'admin.config_layout.link_home_page', 'Display link homepage', 'admin.config_layout', 'en'),
	(2527, 'admin.config_layout.link_shop_page', 'Hiển thị link cửa hàng', 'admin.config_layout', 'vi'),
	(2528, 'admin.config_layout.link_shop_page', 'Display link shop', 'admin.config_layout', 'en'),
	(2529, 'admin.config_layout.link_account', 'Hiển thị link tài khoản', 'admin.config_layout', 'vi'),
	(2530, 'admin.config_layout.link_account', 'Display link account', 'admin.config_layout', 'en'),
	(2531, 'admin.config_layout.link_cart', 'Hiển thị giỏ hàng', 'admin.config_layout', 'vi'),
	(2532, 'admin.config_layout.link_cart', 'Display link cart', 'admin.config_layout', 'en'),
	(2533, 'admin.config_layout.link_language', 'Hiển thị ngôn ngữ', 'admin.config_layout', 'vi'),
	(2534, 'admin.config_layout.link_language', 'Display link language', 'admin.config_layout', 'en'),
	(2535, 'admin.config_layout.link_currency', 'Hiển thị tiền tệ', 'admin.config_layout', 'vi'),
	(2536, 'admin.config_layout.link_currency', 'Display link currency', 'admin.config_layout', 'en'),
	(2537, 'store.admin.config_layout', 'Cấu hình bố cục cửa hàng', 'admin.config_layout', 'vi'),
	(2538, 'store.admin.config_layout', 'Config layout shop', 'admin.config_layout', 'en');
/*!40000 ALTER TABLE `sc_languages` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_product_review
DROP TABLE IF EXISTS `sc_product_review`;
CREATE TABLE IF NOT EXISTS `sc_product_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `comment` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_product_review: ~2 rows (approximately)
DELETE FROM `sc_product_review`;
/*!40000 ALTER TABLE `sc_product_review` DISABLE KEYS */;
INSERT INTO `sc_product_review` (`id`, `product_id`, `customer_id`, `name`, `point`, `comment`, `status`, `created_at`, `updated_at`) VALUES
	(1, 125, 33, 'Test Name', 4, 'Test comment, good product', 1, '2021-09-29 14:01:58', '2021-09-29 14:01:58'),
	(2, 20, 39, 'Shimaa Khaled ', 5, 'very good ......', 1, '2021-10-09 17:27:43', '2021-10-09 17:27:43');
/*!40000 ALTER TABLE `sc_product_review` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_attribute_group
DROP TABLE IF EXISTS `sc_shop_attribute_group`;
CREATE TABLE IF NOT EXISTS `sc_shop_attribute_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
	(1, 'Banner home 1', '/data/banner/banner-home-1.jpg', NULL, '_self', '<h1 class="swiper-title-1" data-caption-animate="fadeScale" data-caption-delay="100">Top-notch Furniture</h1><p class="biggest text-white-70" data-caption-animate="fadeScale" data-caption-delay="200">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class="button-wrap" data-caption-animate="fadeInUp" data-caption-delay="300"> <span class="button button-zachem-tak-delat button-white button-zakaria"> Shop now</span> </div>', 1, 0, 0, 'banner', NULL, NULL),
	(2, 'Banner home 2', '/data/banner/banner-home-2.jpg', NULL, '_self', '<h1 class="swiper-title-1" data-caption-animate="fadeScale" data-caption-delay="100">Top-notch Furniture</h1><p class="biggest text-white-70" data-caption-animate="fadeScale" data-caption-delay="200">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class="button-wrap" data-caption-animate="fadeInUp" data-caption-delay="300"> <span class="button button-zachem-tak-delat button-white button-zakaria"> Shop now</span> </div>', 1, 0, 0, 'banner', NULL, NULL),
	(3, 'Banner breadcrumb 3', '/data/banner/breadcrumb.jpg', NULL, '_self', '', 1, 0, 0, 'breadcrumb', NULL, NULL),
	(4, 'Banner store', '/data/banner/banner-store.jpg', NULL, '_self', '', 1, 0, 0, 'banner-store', NULL, NULL);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
	(1, 'ThanhHoa', 'thanhhoa', '/data/brand/01-181x52.png', '', 1, 0),
	(2, 'SaiGon', 'saigon', '/data/brand/02-181x52.png', '', 1, 0),
	(3, 'HaNoi', 'hanoi', '/data/brand/03-181x52.png', '', 1, 0),
	(4, 'BenTre', 'bentre', '/data/brand/04-181x52.png', '', 1, 0),
	(5, 'NgheAn', 'nghean', '/data/brand/05-181x52.png', '', 1, 0),
	(6, 'DaNang', 'danang', '/data/brand/06-181x52.png', '', 1, 0),
	(7, 'LongAn', 'longan', '/data/brand/07-181x52.png', '', 1, 0),
	(8, 'BinhDinh', 'binhdinh', '/data/brand/08-181x52.png', '', 1, 0);
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_kana` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_kana` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL COMMENT '0:women, 1:men',
  `birthday` date DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` bigint(20) NOT NULL DEFAULT 0,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

-- Dumping structure for table s-cart.sc_shop_discount
DROP TABLE IF EXISTS `sc_shop_discount`;
CREATE TABLE IF NOT EXISTS `sc_shop_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward` int(11) NOT NULL DEFAULT 2,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'point' COMMENT 'point - Point; percent - %',
  `data` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` int(11) NOT NULL DEFAULT 1,
  `used` int(11) NOT NULL DEFAULT 0,
  `login` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_discount_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_discount: ~0 rows (approximately)
DELETE FROM `sc_shop_discount`;
/*!40000 ALTER TABLE `sc_shop_discount` DISABLE KEYS */;
INSERT INTO `sc_shop_discount` (`id`, `code`, `reward`, `type`, `data`, `limit`, `used`, `login`, `status`, `expires_at`) VALUES
	(1, 'ABC123', 10, 'percent', 'Demo coupon', 100000, 0, 0, 1, NULL);
/*!40000 ALTER TABLE `sc_shop_discount` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_discount_customer
DROP TABLE IF EXISTS `sc_shop_discount_customer`;
CREATE TABLE IF NOT EXISTS `sc_shop_discount_customer` (
  `customer_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  KEY `sc_shop_discount_customer_customer_id_index` (`customer_id`),
  KEY `sc_shop_discount_customer_discount_id_index` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_discount_customer: ~0 rows (approximately)
DELETE FROM `sc_shop_discount_customer`;
/*!40000 ALTER TABLE `sc_shop_discount_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_discount_customer` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_discount_store
DROP TABLE IF EXISTS `sc_shop_discount_store`;
CREATE TABLE IF NOT EXISTS `sc_shop_discount_store` (
  `discount_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`discount_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_discount_store: ~2 rows (approximately)
DELETE FROM `sc_shop_discount_store`;
/*!40000 ALTER TABLE `sc_shop_discount_store` DISABLE KEYS */;
INSERT INTO `sc_shop_discount_store` (`discount_id`, `store_id`) VALUES
	(1, 1),
	(1, 2);
/*!40000 ALTER TABLE `sc_shop_discount_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_email_template
DROP TABLE IF EXISTS `sc_shop_email_template`;
CREATE TABLE IF NOT EXISTS `sc_shop_email_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_layout_page_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_layout_page: ~18 rows (approximately)
DELETE FROM `sc_shop_layout_page`;
/*!40000 ALTER TABLE `sc_shop_layout_page` DISABLE KEYS */;
INSERT INTO `sc_shop_layout_page` (`id`, `key`, `name`) VALUES
	(1, 'home', 'admin.layout_page_position.home'),
	(2, 'shop_home', 'admin.layout_page_position.shop_home'),
	(3, 'shop_search', 'admin.layout_page_position.shop_search'),
	(4, 'shop_product_list', 'admin.layout_page_position.product_list'),
	(5, 'product_detail', 'admin.layout_page_position.product_detail'),
	(6, 'shop_cart', 'admin.layout_page_position.shop_cart'),
	(7, 'shop_item_list', 'admin.layout_page_position.item_list'),
	(8, 'shop_item_detail', 'admin.layout_page_position.item_detail'),
	(9, 'shop_news', 'admin.layout_page_position.news_list'),
	(10, 'shop_news_detail', 'admin.layout_page_position.news_detail'),
	(11, 'shop_auth', 'admin.layout_page_position.shop_auth'),
	(12, 'shop_profile', 'admin.layout_page_position.shop_profile'),
	(13, 'shop_page', 'admin.layout_page_position.shop_page'),
	(14, 'shop_contact', 'admin.layout_page_position.shop_contact'),
	(15, 'content_list', 'admin.layout_page_position.content_list'),
	(16, 'content_detail', 'admin.layout_page_position.content_detail'),
	(17, 'vendor_home', 'admin.layout_page_position.vendor_home'),
	(18, 'store_product_list', 'admin.layout_page_position.store_product_list');
/*!40000 ALTER TABLE `sc_shop_layout_page` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_layout_position
DROP TABLE IF EXISTS `sc_shop_layout_position`;
CREATE TABLE IF NOT EXISTS `sc_shop_layout_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
	(1, '/data/content/blog-1.jpg', 'demo-alias-blog-1', 0, 1, '2021-11-24 06:13:21', NULL),
	(2, '/data/content/blog-2.jpg', 'demo-alias-blog-2', 0, 1, '2021-11-24 06:13:21', NULL),
	(3, '/data/content/blog-3.jpg', 'demo-alias-blog-3', 0, 1, '2021-11-24 06:13:21', NULL),
	(4, '/data/content/blog-4.jpg', 'demo-alias-blog-4', 0, 1, '2021-11-24 06:13:21', NULL),
	(5, '/data/content/blog-5.jpg', 'demo-alias-blog-5', 0, 1, '2021-11-24 06:13:21', NULL),
	(6, '/data/content/blog-6.jpg', 'demo-alias-blog-6', 0, 1, '2021-11-24 06:13:21', NULL);
/*!40000 ALTER TABLE `sc_shop_news` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_news_description
DROP TABLE IF EXISTS `sc_shop_news_description`;
CREATE TABLE IF NOT EXISTS `sc_shop_news_description` (
  `news_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `sc_shop_news_description_news_id_lang_unique` (`news_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_news_description: ~12 rows (approximately)
DELETE FROM `sc_shop_news_description`;
/*!40000 ALTER TABLE `sc_shop_news_description` DISABLE KEYS */;
INSERT INTO `sc_shop_news_description` (`news_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
	(1, 'en', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(1, 'vi', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'en', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'vi', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(3, 'en', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(3, 'vi', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(4, 'en', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(4, 'vi', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(5, 'en', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(5, 'vi', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(6, 'en', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(6, 'vi', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `content` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `customer_id` bigint(20) NOT NULL DEFAULT 0,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `sc_shop_page_description_page_id_lang_unique` (`page_id`,`lang`),
  KEY `sc_shop_page_description_lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_page_description: ~2 rows (approximately)
DELETE FROM `sc_shop_page_description`;
/*!40000 ALTER TABLE `sc_shop_page_description` DISABLE KEYS */;
INSERT INTO `sc_shop_page_description` (`page_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
	(1, 'en', 'About', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-2.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(1, 'vi', 'Giới thiệu', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-2.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product: ~24 rows (approximately)
DELETE FROM `sc_shop_product`;
/*!40000 ALTER TABLE `sc_shop_product` DISABLE KEYS */;
INSERT INTO `sc_shop_product` (`id`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `image`, `brand_id`, `supplier_id`, `price`, `cost`, `stock`, `sold`, `minimum`, `weight_class`, `weight`, `length_class`, `length`, `width`, `height`, `kind`, `property`, `tax_id`, `status`, `sort`, `view`, `alias`, `date_lastview`, `date_available`, `created_at`, `updated_at`) VALUES
	(1, 'NEMCHUA', NULL, NULL, NULL, NULL, NULL, '/data/product/product-1.png', 1, 1, 15000, 10000, 99, 1, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-1', NULL, NULL, NULL, NULL),
	(2, 'BANHGAI', NULL, NULL, NULL, NULL, NULL, '/data/product/product-2.png', 1, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-2', NULL, NULL, NULL, NULL),
	(3, 'BANHTRANG', NULL, NULL, NULL, NULL, NULL, '/data/product/product-3.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-3', NULL, NULL, NULL, NULL),
	(4, 'MITOM', NULL, NULL, NULL, NULL, NULL, '/data/product/product-4.png', 3, 1, 15000, 10000, 100, 0, 5, NULL, 0, NULL, 0, 0, 0, 2, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-4', NULL, NULL, NULL, NULL),
	(5, 'MIGOI', NULL, NULL, NULL, NULL, NULL, '/data/product/product-5.png', 1, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 1, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-5', NULL, NULL, NULL, NULL),
	(6, 'TMC2208', NULL, NULL, NULL, NULL, NULL, '/data/product/product-6.png', 1, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-6', NULL, NULL, NULL, NULL),
	(7, 'FILAMENT', NULL, NULL, NULL, NULL, NULL, '/data/product/product-7.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-7', NULL, NULL, NULL, NULL),
	(8, 'A4988', NULL, NULL, NULL, NULL, NULL, '/data/product/product-8.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-8', NULL, NULL, NULL, NULL),
	(9, 'ANYCUBIC-P', NULL, NULL, NULL, NULL, NULL, '/data/product/product-9.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-9', NULL, NULL, NULL, NULL),
	(10, '3DHLFD-P', NULL, NULL, NULL, NULL, NULL, '/data/product/product-10.png', 4, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 1, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-10', NULL, NULL, NULL, NULL),
	(11, 'SS495A', NULL, NULL, NULL, NULL, NULL, '/data/product/product-11.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-11', NULL, NULL, NULL, NULL),
	(12, '3D-CARBON175', NULL, NULL, NULL, NULL, NULL, '/data/product/product-12.png', 2, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-12', NULL, NULL, NULL, NULL),
	(13, '3D-GOLD175', NULL, NULL, NULL, NULL, NULL, '/data/product/product-13.png', 3, 1, 10000, 5000, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-13', NULL, NULL, NULL, NULL),
	(14, 'LCD12864-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/product-14.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 2, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-14', NULL, NULL, NULL, NULL),
	(15, 'LCD2004-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/product-15.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 1, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-15', NULL, NULL, NULL, NULL),
	(16, 'RAMPS15-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/product-16.png', 2, 1, 15000, 10000, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-16', NULL, NULL, NULL, NULL),
	(17, 'NEMCHUA-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/product-17.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-17', NULL, NULL, NULL, NULL),
	(18, 'CARBON175-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/product-18.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-18', NULL, NULL, NULL, NULL),
	(19, 'A4988-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/product-19.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 2, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-19', NULL, NULL, NULL, NULL),
	(20, 'MIGOI-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/product-20.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 1, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-20', NULL, NULL, NULL, NULL),
	(21, 'ALOKK1-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/product-21.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-21', NULL, NULL, NULL, NULL),
	(22, 'MITOM-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/product-22.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-22', NULL, NULL, NULL, NULL),
	(23, 'A4988-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/product-23.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 2, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-23', NULL, NULL, NULL, NULL),
	(24, 'BANHTRANG-12', NULL, NULL, NULL, NULL, NULL, '/data/product/product-24.png', 3, 1, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 'physical', 'auto', 1, 0, 0, 'demo-alias-name-product-24', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `sc_shop_product` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_attribute
DROP TABLE IF EXISTS `sc_shop_product_attribute`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_attribute` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
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
	(1, 'Blue', 1, 24, 50, 0, 1),
	(2, 'White', 1, 24, 0, 0, 1),
	(3, 'S', 2, 24, 20, 0, 1),
	(4, 'XL', 2, 24, 30, 0, 1),
	(5, 'Blue', 1, 12, 150, 0, 1),
	(6, 'Red', 1, 12, 0, 0, 1),
	(7, 'S', 2, 12, 0, 0, 1),
	(8, 'M', 2, 12, 0, 0, 1);
/*!40000 ALTER TABLE `sc_shop_product_attribute` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_build
DROP TABLE IF EXISTS `sc_shop_product_build`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_build` (
  `build_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`build_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_build: ~8 rows (approximately)
DELETE FROM `sc_shop_product_build`;
/*!40000 ALTER TABLE `sc_shop_product_build` DISABLE KEYS */;
INSERT INTO `sc_shop_product_build` (`build_id`, `product_id`, `quantity`) VALUES
	(5, 3, 1),
	(5, 7, 2),
	(10, 13, 1),
	(10, 17, 2),
	(15, 14, 2),
	(15, 16, 1),
	(20, 3, 2),
	(20, 13, 2);
/*!40000 ALTER TABLE `sc_shop_product_build` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_category
DROP TABLE IF EXISTS `sc_shop_product_category`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_category` (
  `product_id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_category: ~26 rows (approximately)
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
	(17, 9),
	(18, 9),
	(19, 6),
	(20, 11),
	(21, 10),
	(22, 10),
	(23, 12),
	(24, 9);
/*!40000 ALTER TABLE `sc_shop_product_category` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_description
DROP TABLE IF EXISTS `sc_shop_product_description`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_description` (
  `product_id` bigint(20) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `sc_shop_product_description_product_id_lang_unique` (`product_id`,`lang`),
  KEY `sc_shop_product_description_lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_description: ~48 rows (approximately)
DELETE FROM `sc_shop_product_description`;
/*!40000 ALTER TABLE `sc_shop_product_description` DISABLE KEYS */;
INSERT INTO `sc_shop_product_description` (`product_id`, `lang`, `name`, `keyword`, `description`, `content`) VALUES
	(1, 'en', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(1, 'vi', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'en', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(2, 'vi', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(3, 'en', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(3, 'vi', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(4, 'en', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(4, 'vi', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(5, 'en', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(5, 'vi', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(6, 'en', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(6, 'vi', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(7, 'en', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(7, 'vi', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(8, 'en', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(8, 'vi', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(9, 'en', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(9, 'vi', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(10, 'en', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(10, 'vi', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(11, 'en', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(11, 'vi', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(12, 'en', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(12, 'vi', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(13, 'en', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(13, 'vi', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(14, 'en', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(14, 'vi', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(15, 'en', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(15, 'vi', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(16, 'en', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(16, 'vi', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(17, 'en', 'Easy Polo Black Edition 17', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(17, 'vi', 'Easy Polo Black Edition 17', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(18, 'en', 'Easy Polo Black Edition 18', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(18, 'vi', 'Easy Polo Black Edition 18', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(19, 'en', 'Easy Polo Black Edition 19', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(19, 'vi', 'Easy Polo Black Edition 19', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(20, 'en', 'Easy Polo Black Edition 20', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(20, 'vi', 'Easy Polo Black Edition 20', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(21, 'en', 'Easy Polo Black Edition 21', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(21, 'vi', 'Easy Polo Black Edition 21', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(22, 'en', 'Easy Polo Black Edition 22', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(22, 'vi', 'Easy Polo Black Edition 22', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(23, 'en', 'Easy Polo Black Edition 23', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(23, 'vi', 'Easy Polo Black Edition 23', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(24, 'en', 'Easy Polo Black Edition 24', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
	(24, 'vi', 'Easy Polo Black Edition 24', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');
/*!40000 ALTER TABLE `sc_shop_product_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_download
DROP TABLE IF EXISTS `sc_shop_product_download`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_download` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_download: ~0 rows (approximately)
DELETE FROM `sc_shop_product_download`;
/*!40000 ALTER TABLE `sc_shop_product_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_shop_product_download` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_flash
DROP TABLE IF EXISTS `sc_shop_product_flash`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_flash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_shop_product_flash_product_id_unique` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_flash: ~6 rows (approximately)
DELETE FROM `sc_shop_product_flash`;
/*!40000 ALTER TABLE `sc_shop_product_flash` DISABLE KEYS */;
INSERT INTO `sc_shop_product_flash` (`id`, `product_id`, `stock`, `sold`, `sort`) VALUES
	(1, 1, 100, 2, 0),
	(2, 2, 120, 0, 0),
	(3, 118, 100, 0, 0),
	(4, 123, 120, 0, 0),
	(5, 124, 300, 0, 0),
	(6, 125, 200, 22, 0);
/*!40000 ALTER TABLE `sc_shop_product_flash` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_group
DROP TABLE IF EXISTS `sc_shop_product_group`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_group` (
  `group_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_group: ~8 rows (approximately)
DELETE FROM `sc_shop_product_group`;
/*!40000 ALTER TABLE `sc_shop_product_group` DISABLE KEYS */;
INSERT INTO `sc_shop_product_group` (`group_id`, `product_id`) VALUES
	(4, 2),
	(4, 6),
	(14, 2),
	(14, 12),
	(19, 11),
	(19, 21),
	(23, 3),
	(23, 7);
/*!40000 ALTER TABLE `sc_shop_product_group` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_image
DROP TABLE IF EXISTS `sc_shop_product_image`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sc_shop_product_image_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_image: ~24 rows (approximately)
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
	(20, '/data/product/product-2.png', 17),
	(21, '/data/product/product-18.png', 22),
	(22, '/data/product/product-19.png', 22),
	(23, '/data/product/product-24.png', 24),
	(24, '/data/product/product-22.png', 24);
/*!40000 ALTER TABLE `sc_shop_product_image` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_promotion
DROP TABLE IF EXISTS `sc_shop_product_promotion`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_promotion` (
  `product_id` bigint(20) NOT NULL,
  `price_promotion` int(11) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status_promotion` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_promotion: ~8 rows (approximately)
DELETE FROM `sc_shop_product_promotion`;
/*!40000 ALTER TABLE `sc_shop_product_promotion` DISABLE KEYS */;
INSERT INTO `sc_shop_product_promotion` (`product_id`, `price_promotion`, `date_start`, `date_end`, `status_promotion`, `created_at`, `updated_at`) VALUES
	(1, 5000, NULL, NULL, 1, NULL, NULL),
	(2, 3000, NULL, NULL, 1, NULL, NULL),
	(6, 4000, NULL, NULL, 1, NULL, NULL),
	(8, 5000, NULL, NULL, 1, NULL, NULL),
	(12, 3000, NULL, NULL, 1, NULL, NULL),
	(16, 4000, NULL, NULL, 1, NULL, NULL),
	(18, 4000, NULL, NULL, 1, NULL, NULL),
	(22, 600, NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `sc_shop_product_promotion` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_product_property
DROP TABLE IF EXISTS `sc_shop_product_property`;
CREATE TABLE IF NOT EXISTS `sc_shop_product_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `product_id` bigint(20) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_product_store: ~24 rows (approximately)
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
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1);
/*!40000 ALTER TABLE `sc_shop_product_store` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_sessions
DROP TABLE IF EXISTS `sc_shop_sessions`;
CREATE TABLE IF NOT EXISTS `sc_shop_sessions` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_shop_store_block_store_id_index` (`store_id`),
  KEY `sc_shop_store_block_template_index` (`template`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_store_block: ~8 rows (approximately)
DELETE FROM `sc_shop_store_block`;
/*!40000 ALTER TABLE `sc_shop_store_block` DISABLE KEYS */;
INSERT INTO `sc_shop_store_block` (`id`, `name`, `position`, `page`, `type`, `text`, `status`, `sort`, `store_id`, `template`) VALUES
	(1, 'Product special', 'left', '*', 'view', 'product_special_left', 1, 20, 1, 's-cart-light'),
	(2, 'Brands', 'left', '*', 'view', 'brand_left', 1, 30, 1, 's-cart-light'),
	(3, 'Banner home', 'banner_top', 'home', 'view', 'banner_image', 1, 10, 1, 's-cart-light'),
	(4, 'Category', 'left', 'home,shop_home', 'view', 'category_left', 1, 20, 1, 's-cart-light'),
	(5, 'Product last view', 'left', '*', 'view', 'product_lastview_left', 1, 30, 1, 's-cart-light'),
	(6, 'Products new', 'top', 'home', 'view', 'product_new', 1, 10, 1, 's-cart-light'),
	(7, 'Category store', 'left', 'shop_home,vendor_home,vendor_product_list', 'view', 'category_store_left', 1, 10, 1, 's-cart-light'),
	(8, 'Top news', 'top', 'home', 'view', 'top_news', 1, 10, 1, 's-cart-light');
/*!40000 ALTER TABLE `sc_shop_store_block` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_store_css
DROP TABLE IF EXISTS `sc_shop_store_css`;
CREATE TABLE IF NOT EXISTS `sc_shop_store_css` (
  `css` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int(11) NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `sc_shop_store_css_store_id_template_unique` (`store_id`,`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.sc_shop_store_css: ~1 rows (approximately)
DELETE FROM `sc_shop_store_css`;
/*!40000 ALTER TABLE `sc_shop_store_css` DISABLE KEYS */;
INSERT INTO `sc_shop_store_css` (`css`, `store_id`, `template`) VALUES
	('', 1, 's-cart-light');
/*!40000 ALTER TABLE `sc_shop_store_css` ENABLE KEYS */;

-- Dumping structure for table s-cart.sc_shop_subscribe
DROP TABLE IF EXISTS `sc_shop_subscribe`;
CREATE TABLE IF NOT EXISTS `sc_shop_subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
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

-- Dumping structure for table s-cart.vendor_category
DROP TABLE IF EXISTS `vendor_category`;
CREATE TABLE IF NOT EXISTS `vendor_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_category_alias_index` (`alias`),
  KEY `vendor_category_store_id_index` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.vendor_category: ~0 rows (approximately)
DELETE FROM `vendor_category`;
/*!40000 ALTER TABLE `vendor_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_category` ENABLE KEYS */;

-- Dumping structure for table s-cart.vendor_category_description
DROP TABLE IF EXISTS `vendor_category_description`;
CREATE TABLE IF NOT EXISTS `vendor_category_description` (
  `vendor_category_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `vendor_category_description_vendor_category_id_lang_unique` (`vendor_category_id`,`lang`),
  KEY `vendor_category_description_lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.vendor_category_description: ~0 rows (approximately)
DELETE FROM `vendor_category_description`;
/*!40000 ALTER TABLE `vendor_category_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_category_description` ENABLE KEYS */;

-- Dumping structure for table s-cart.vendor_password_resets
DROP TABLE IF EXISTS `vendor_password_resets`;
CREATE TABLE IF NOT EXISTS `vendor_password_resets` (
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  KEY `vendor_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.vendor_password_resets: ~0 rows (approximately)
DELETE FROM `vendor_password_resets`;
/*!40000 ALTER TABLE `vendor_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_password_resets` ENABLE KEYS */;

-- Dumping structure for table s-cart.vendor_product_category
DROP TABLE IF EXISTS `vendor_product_category`;
CREATE TABLE IF NOT EXISTS `vendor_product_category` (
  `vendor_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  UNIQUE KEY `vendor_product_category_vendor_category_id_product_id_unique` (`vendor_category_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.vendor_product_category: ~0 rows (approximately)
DELETE FROM `vendor_product_category`;
/*!40000 ALTER TABLE `vendor_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_product_category` ENABLE KEYS */;

-- Dumping structure for table s-cart.vendor_user
DROP TABLE IF EXISTS `vendor_user`;
CREATE TABLE IF NOT EXISTS `vendor_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'VN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_user_store_id_index` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s-cart.vendor_user: ~0 rows (approximately)
DELETE FROM `vendor_user`;
/*!40000 ALTER TABLE `vendor_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
