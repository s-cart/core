/*shop_product*/
INSERT INTO `__SC_DB_PREFIX__shop_product` (`id`, `sku`, `alias`, `image`, `brand_id`, `supplier_id`, `price`, `cost`, `stock`, `status`, `kind`, `tax_id`, `date_available`, `sold`, `minimum`) VALUES 
(1,'NEMCHUA','demo-alias-name-product-1','/data/product/product-1.png','1','1','15000','10000','99','1',0,'auto', null, '1','0'),
(2,'BANHGAI','demo-alias-name-product-2','/data/product/product-2.png','1','1','15000','10000','100','1',0,'auto', null, '0','0'),
(3,'BANHTRANG','demo-alias-name-product-3','/data/product/product-3.png','2','1','15000','10000','100','1',0,'auto', null, '0','0'),
(4,'MITOM','demo-alias-name-product-4','/data/product/product-4.png','3','1','15000','10000','100','1',2,'auto', null, '0','5'),
(5,'MIGOI','demo-alias-name-product-5','/data/product/product-5.png','1','1','15000','10000','100','1',1,'auto', null, '0','0'),
(6,'TMC2208','demo-alias-name-product-6','/data/product/product-6.png','1','1','15000','10000','100','1',0,'auto', null, '0','0'),
(7,'FILAMENT','demo-alias-name-product-7','/data/product/product-7.png','2','1','15000','10000','100','1',0,'auto', null, '0','0'),
(8,'A4988','demo-alias-name-product-8','/data/product/product-8.png','2','1','15000','10000','100','1',0,'auto', null, '0','0'),
(9,'ANYCUBIC-P','demo-alias-name-product-9','/data/product/product-9.png','2','1','15000','10000','100','1',0,'auto', null, '0','0'),
(10,'3DHLFD-P','demo-alias-name-product-10','/data/product/product-10.png','4','1','15000','10000','100','1',1,'auto', null, '0','0'),
(11,'SS495A','demo-alias-name-product-11','/data/product/product-11.png','2','1','15000','10000','100','1',0,'auto', null, '0','0'),
(12,'3D-CARBON175','demo-alias-name-product-12','/data/product/product-12.png','2','1','15000','10000','100','1',0,'auto', null, '0','0'),
(13,'3D-GOLD175','demo-alias-name-product-13','/data/product/product-13.png','3','1','10000','5000','0','1',0,'auto', null, '0','0'),
(14,'LCD12864-3D','demo-alias-name-product-14','/data/product/product-14.png','3','1','15000','10000','100','1',2,'auto', null, '0','0'),
(15,'LCD2004-3D','demo-alias-name-product-15','/data/product/product-15.png','3','1','15000','10000','100','1',1,'auto', null, '0','0'),
(16,'RAMPS15-3D','demo-alias-name-product-16','/data/product/product-16.png','2','1','15000','10000','0','1',0,'auto', null, '0','0'),
(17,'NEMCHUA-AY','demo-alias-name-product-17','/data/product/product-17.png','3','1','15000','10000','100','1',0,'auto', null, '0','0'),
(18,'CARBON175-AY','demo-alias-name-product-18','/data/product/product-18.png','3','1','15000','10000','100','1',0,'auto', null, '0','0'),
(19,'A4988-AY','demo-alias-name-product-19','/data/product/product-19.png','3','1','15000','10000','100','1',2,'auto', null, '0','0'),
(20,'MIGOI-AY','demo-alias-name-product-20','/data/product/product-20.png','3','1','15000','10000','100','1',1,'auto', null, '0','0'),
(21,'ALOKK1-AY','demo-alias-name-product-21','/data/product/product-21.png','3','1','15000','10000','100','1',0,'auto', null, '0','0'),
(22,'MITOM-AY','demo-alias-name-product-22','/data/product/product-22.png','3','1','15000','10000','100','1',0,'auto', null, '0','0'),
(23,'A4988-AY','demo-alias-name-product-23','/data/product/product-23.png','3','1','15000','10000','100','1',2,'auto', null, '0','0'),
(24,'BANHTRANG-12','demo-alias-name-product-24','/data/product/product-24.png','3','1','15000','10000','100','1',0,'auto', null, '0','0');


/*shop_product_store*/
INSERT INTO `__SC_DB_PREFIX__shop_product_store` (`product_id`, `store_id`) VALUES 
(1,'1'),
(2,'1'),
(3,'1'),
(4,'1'),
(5,'1'),
(6,'1'),
(7,'1'),
(8,'1'),
(9,'1'),
(10,'1'),
(11,'1'),
(12,'1'),
(13,'1'),
(14,'1'),
(15,'1'),
(16,'1'),
(17,'1'),
(18,'1'),
(19,'1'),
(20,'1'),
(21,'1'),
(22,'1'),
(23,'1'),
(24,'1');

/*shop_product_description*/
INSERT INTO `__SC_DB_PREFIX__shop_product_description` (`product_id`, `lang`, `name`, `keyword`, `description`, `content`) VALUES 
('1','en','Easy Polo Black Edition 1', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('2','en','Easy Polo Black Edition 2', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('3','en','Easy Polo Black Edition 3', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('4','en','Easy Polo Black Edition 4', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('5','en','Easy Polo Black Edition 5', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('6','en','Easy Polo Black Edition 6', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('7','en','Easy Polo Black Edition 7', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('8','en','Easy Polo Black Edition 8', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('9','en','Easy Polo Black Edition 9', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('10','en','Easy Polo Black Edition 10', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('11','en','Easy Polo Black Edition 11', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('12','en','Easy Polo Black Edition 12', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('13','en','Easy Polo Black Edition 13', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('14','en','Easy Polo Black Edition 14', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('15','en','Easy Polo Black Edition 15', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('16','en','Easy Polo Black Edition 16', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('17','en','Easy Polo Black Edition 17', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('18','en','Easy Polo Black Edition 18', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('19','en','Easy Polo Black Edition 19', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('20','en','Easy Polo Black Edition 20', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('21','en','Easy Polo Black Edition 21', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('22','en','Easy Polo Black Edition 22', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('23','en','Easy Polo Black Edition 23', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('24','en','Easy Polo Black Edition 24', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('1','vi','Easy Polo Black Edition 1', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('2','vi','Easy Polo Black Edition 2', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('3','vi','Easy Polo Black Edition 3', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('4','vi','Easy Polo Black Edition 4', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('5','vi','Easy Polo Black Edition 5', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('6','vi','Easy Polo Black Edition 6', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('7','vi','Easy Polo Black Edition 7', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('8','vi','Easy Polo Black Edition 8', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('9','vi','Easy Polo Black Edition 9', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('10','vi','Easy Polo Black Edition 10', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('11','vi','Easy Polo Black Edition 11', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('12','vi','Easy Polo Black Edition 12', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('13','vi','Easy Polo Black Edition 13', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('14','vi','Easy Polo Black Edition 14', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('15','vi','Easy Polo Black Edition 15', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('16','vi','Easy Polo Black Edition 16', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('17','vi','Easy Polo Black Edition 17', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('18','vi','Easy Polo Black Edition 18', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('19','vi','Easy Polo Black Edition 19', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('20','vi','Easy Polo Black Edition 20', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('21','vi','Easy Polo Black Edition 21', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('22','vi','Easy Polo Black Edition 22', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('23','vi','Easy Polo Black Edition 23', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('24','vi','Easy Polo Black Edition 24', '','', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');

/*shop_product_category*/
INSERT INTO `__SC_DB_PREFIX__shop_product_category` (`product_id`, `category_id`) VALUES 
('1', '13'),
('2', '13'),
('1', '10'),
('1', '6'),
('3', '11'),
('4', '11'),
('5', '11'),
('6', '11'),
('7', '12'),
('8', '10'),
('9', '6'),
('10', '11'),
('11', '10'),
('12', '9'),
('13', '5'),
('14', '11'),
('15', '6'),
('16', '9'),
('17', '9'),
('18', '9'),
('19', '6'),
('20', '11'),
('21', '10'),
('22', '10'),
('23', '12'),
('24', '9');

/*shop_product_image*/
INSERT INTO `__SC_DB_PREFIX__shop_product_image` (`image`, `product_id`) VALUES 
('/data/product/product-2.png', '1'),
('/data/product/product-11.png', '1'),
('/data/product/product-8.png', '11'),
('/data/product/product-6.png', '2'),
('/data/product/product-13.png', '11'),
('/data/product/product-12.png', '5'),
('/data/product/product-6.png', '5'),
('/data/product/product-1.png', '2'),
('/data/product/product-15.png', '2'),
('/data/product/product-5.png', '9'),
('/data/product/product-8.png', '8'),
('/data/product/product-2.png', '7'),
('/data/product/product-6.png', '7'),
('/data/product/product-11.png', '5'),
('/data/product/product-13.png', '4'),
('/data/product/product-13.png', '15'),
('/data/product/product-6.png', '15'),
('/data/product/product-12.png', '17'),
('/data/product/product-6.png', '17'),
('/data/product/product-2.png', '17'),
('/data/product/product-18.png', '22'),
('/data/product/product-19.png', '22'),
('/data/product/product-24.png', '24'),
('/data/product/product-22.png', '24');


/*shop_product_attribute*/
INSERT INTO `__SC_DB_PREFIX__shop_product_attribute` (`name`, `attribute_group_id`, `product_id`, `sort`, `add_price`) VALUES  
('Blue','1','24','0', '50'),
('White','1','24','0', '0'),
('S','2','24','0', '20'),
('XL','2','24','0', '30'),
('Blue','1','12','0', '150'),
('Red','1','12','0', '0'),
('S','2','12','0', '0'),
('M','2','12','0', '0');

/*shop_product_property*/
INSERT INTO `__SC_DB_PREFIX__shop_product_property` (`id`, `code`, `name`) VALUES 
('1','physical','Product physical'),
('2','download','Product download');

/*shop_product_build*/
INSERT INTO `__SC_DB_PREFIX__shop_product_build` (`build_id`, `product_id`, `quantity`) VALUES 
('5','3','1'),
('5','7','2'),
('10','13','1'),
('10','17','2'),
('15','16','1'),
('15','14','2'),
('20','13','2'),
('20','3','2');

/*shop_product_group*/
INSERT INTO `__SC_DB_PREFIX__shop_product_group` (`group_id`, `product_id`) VALUES 
('4', '2'),
('4', '6'),
('14', '2'),
('14', '12'),
('19', '11'),
('19', '21'),
('23', '3'),
('23', '7');

/*shop_product_promotion*/
INSERT INTO `__SC_DB_PREFIX__shop_product_promotion` (`product_id`, `price_promotion`) VALUES 
('1', '5000'),
('2', '3000'),
('6', '4000'),
('8', '5000'),
('12', '3000'),
('16', '4000'),
('18', '4000'),
('22', '600');

/*shop_banner*/
INSERT INTO `__SC_DB_PREFIX__shop_banner` (`title`, `image`, `html`, `target`, `status`, `type`) VALUES 
('Banner home 1', '/data/banner/banner-home-1.jpg', '<h1 class=\"swiper-title-1\" data-caption-animate=\"fadeScale\" data-caption-delay=\"100\">Top-notch Furniture</h1><p class=\"biggest text-white-70\" data-caption-animate=\"fadeScale\" data-caption-delay=\"200\">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class=\"button-wrap\" data-caption-animate=\"fadeInUp\" data-caption-delay=\"300\"> <span class=\"button button-zachem-tak-delat button-white button-zakaria\"> Shop now</span> </div>',  '_self',  1,  'banner'),
('Banner home 2','/data/banner/banner-home-2.jpg', '<h1 class=\"swiper-title-1\" data-caption-animate=\"fadeScale\" data-caption-delay=\"100\">Top-notch Furniture</h1><p class=\"biggest text-white-70\" data-caption-animate=\"fadeScale\" data-caption-delay=\"200\">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class=\"button-wrap\" data-caption-animate=\"fadeInUp\" data-caption-delay=\"300\"> <span class=\"button button-zachem-tak-delat button-white button-zakaria\"> Shop now</span> </div>',  '_self',  1,  'banner'),
('Banner breadcrumb 3','/data/banner/breadcrumb.jpg', '',  '_self',  1,  'breadcrumb'),
('Banner store','/data/banner/banner-store.jpg', '',  '_self',  1,  'banner-store');


/*shop_banner_store*/
INSERT INTO `__SC_DB_PREFIX__shop_banner_store` (`banner_id`, `store_id`) VALUES 
(1,'1'),
(2,'1'),
(3,'1'),
(4,'1');


/*shop_brand*/
INSERT INTO `__SC_DB_PREFIX__shop_brand` (`name`, `alias`, `image`, `url`, `status`, `sort`) VALUES 
('ThanhHoa', 'thanhhoa', '/data/brand/01-181x52.png',  '', '1', '0'),
('SaiGon', 'saigon', '/data/brand/02-181x52.png',  '', '1', '0'),
('HaNoi', 'hanoi', '/data/brand/03-181x52.png',  '', '1', '0'),
('BenTre', 'bentre', '/data/brand/04-181x52.png',  '', '1', '0'),
('NgheAn', 'nghean', '/data/brand/05-181x52.png',  '', '1', '0'),
('DaNang', 'danang', '/data/brand/06-181x52.png',  '', '1', '0'),
('LongAn', 'longan', '/data/brand/07-181x52.png',  '', '1', '0'),
('BinhDinh', 'binhdinh', '/data/brand/08-181x52.png',  '', '1', '0');

/*shop_brand_store*/
INSERT INTO `__SC_DB_PREFIX__shop_brand_store` (`brand_id`, `store_id`) VALUES 
(1,'1'),
(2,'1'),
(3,'1'),
(4,'1'),
(5,'1'),
(6,'1'),
(7,'1'),
(8,'1');


/*shop_supplier*/
INSERT INTO `__SC_DB_PREFIX__shop_supplier` (`id`, `alias`, `name`, `email`, `phone`, `image`, `address`, `url`, `sort`, `store_id`) VALUES 
('1','abc-distributor','ABC distributor','abc@abc.com', '012496657567', '/data/supplier/supplier.png','', '', '0', 1),
('2','xyz-distributor','XYZ distributor','xyz@xyz.com', '012496657567', '/data/supplier/supplier.png','', '', '0', 1);


/*shop_category*/
INSERT INTO `__SC_DB_PREFIX__shop_category` (`id`, `alias`, `image`, `parent`, `top`, `sort`, `status`) VALUES 
('1', 'electronics', '/data/category/img-40.jpg', '0',  '1', '0','1'),
('2', 'clothing-wears', '/data/category/img-44.jpg', '0',  '1', '0','1'),
('3', 'mobile', '/data/category/img-42.jpg', '1',  '1', '0','1'),
('4', 'accessaries-extras', '/data/category/img-18.jpg', '0',  '1', '0','1'),
('5', 'computers', '/data/category/img-14.jpg', '1',  '1', '0','1'),
('6', 'tablets', '/data/category/img-14.jpg', '1',  '0', '0','1'),
('7', 'appliances', '/data/category/img-40.jpg', '1',  '0', '0','1'),
('8', 'men-clothing', '/data/category/img-14.jpg', '2',  '0', '0','1'),
('9', 'women-clothing', '/data/category/img-18.jpg', '2',  '1', '0','1'),
('10', 'kid-wear', '/data/category/img-14.jpg', '2',  '0', '0','1'),
('11', 'mobile-accessaries', '/data/category/img-40.jpg', '4',  '0', '0','1'),
('12', 'women-accessaries', '/data/category/img-42.jpg', '4',  '0', '3','1'),
('13', 'men-accessaries', '/data/category/img-40.jpg', '4',  '0', '3','1');

/*shop_category_store*/
INSERT INTO `__SC_DB_PREFIX__shop_category_store` (`category_id`, `store_id`) VALUES 
(1,'1'),
(2,'1'),
(3,'1'),
(4,'1'),
(5,'1'),
(6,'1'),
(7,'1'),
(8,'1'),
(9,'1'),
(10,'1'),
(11,'1'),
(12,'1'),
(13,'1');

/*shop_category_description*/
INSERT INTO `__SC_DB_PREFIX__shop_category_description` (`category_id`, `lang`, `title`, `keyword`, `description`) VALUES 
('1', 'en', 'Electronics', '', ''),
('2', 'en', 'Clothing & Wears', '', ''),
('3', 'en', 'Mobile', '', ''),
('4', 'en', 'Accessaries & Extras', '', ''),
('5', 'en', 'Computers', '', ''),
('6', 'en', 'Tablets', '', ''),
('7', 'en', 'Appliances', '', ''),
('8', 'en', 'Men Clothing', '', ''),
('9', 'en', 'Women Clothing', '', ''),
('10', 'en', 'Kid Wear', '', ''),
('11', 'en', 'Mobile Accessaries', '', ''),
('12', 'en', 'Women Accessaries', '', ''),
('13', 'en', 'Men Accessaries', '', ''),
('1', 'vi', 'Thiết bị điện tử', '', ''),
('2', 'vi', 'Quần áo', '', ''),
('3', 'vi', 'Điện thoại', '', ''),
('4', 'vi', 'Phụ kiện ', '', ''),
('5', 'vi', 'Máy tính', '', ''),
('6', 'vi', 'Máy tính bảng', '', ''),
('7', 'vi', 'Thiết bị', '', ''),
('8', 'vi', 'Quần áo nam', '', ''),
('9', 'vi', 'Quần áo nữ', '', ''),
('10', 'vi', 'Đồ trẻ em', '', ''),
('11', 'vi', 'Phụ kiện điện thoại', '', ''),
('12', 'vi', 'Phụ kiện nữ', '', ''),
('13', 'vi', 'Phụ kiện nam', '', '');

/*shop_news*/
INSERT INTO `__SC_DB_PREFIX__shop_news` (`id`, `alias`, `image`, `sort`, `status`, `created_at`) VALUES 
(1, 'demo-alias-blog-1', '/data/content/blog-1.jpg',  0, '1', now()),
(2, 'demo-alias-blog-2', '/data/content/blog-2.jpg',  0, '1', now()),
(3, 'demo-alias-blog-3', '/data/content/blog-3.jpg',  0, '1', now()),
(4, 'demo-alias-blog-4', '/data/content/blog-4.jpg',  0, '1', now()),
(5, 'demo-alias-blog-5', '/data/content/blog-5.jpg',  0, '1', now()),
(6, 'demo-alias-blog-6', '/data/content/blog-6.jpg',  0, '1', now());

/*shop_news_store*/
INSERT INTO `__SC_DB_PREFIX__shop_news_store` (`news_id`, `store_id`) VALUES 
(1,'1'),
(2,'1'),
(3,'1'),
(4,'1'),
(5,'1'),
(6,'1');

/*shop_news_description*/
INSERT INTO `__SC_DB_PREFIX__shop_news_description` (`news_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES 
('1', 'en', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('2', 'en', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('3', 'en', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('4', 'en', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('5', 'en', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('6', 'en', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('1', 'vi', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('2', 'vi', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('3', 'vi', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('4', 'vi', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('5', 'vi', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
('6', 'vi', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/product-10.png\" style=\"width: 150px; float: right; margin: 10px;\" /></p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');

/*shop_banner_type*/
INSERT INTO `__SC_DB_PREFIX__shop_banner_type` (`id`, `code`, `name`) VALUES 
('1','banner','Banner website'),
('2','background','Background website'),
('3','breadcrumb','Breadcrumb website'),
('4','banner-store','Banner store'),
('5','other','Other');

/*shop_store_block*/
INSERT INTO `__SC_DB_PREFIX__shop_store_block` (`name`, `position`, `page`, `type`, `text`, `status`, `sort`, `store_id`, `template`) VALUES 
('Product special', 'left', '*','view','product_special_left', '1', '20', '1', 's-cart-light'),
('Brands', 'left', '*','view','brand_left', '1', '30', '1', 's-cart-light'),
('Banner home', 'banner_top', 'home','view','banner_image', '1', '10', '1', 's-cart-light'),
('Category', 'left', 'home,shop_home','view','category_left', '1', '20', '1', 's-cart-light'),
('Product last view', 'left', '*','view','product_lastview_left', '1', '30', '1', 's-cart-light'),
('Products new', 'top', 'home','view','product_new', '1', '10', '1', 's-cart-light'),
('Category store', 'left', 'shop_home,vendor_home,vendor_product_list','view','category_store_left', '1', '10', '1', 's-cart-light'),
('Top news', 'top', 'home','view','top_news', '1', '10', '1', 's-cart-light');