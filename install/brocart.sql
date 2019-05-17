-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 11, 2019 at 12:25 PM
-- Server version: 5.5.53
-- PHP Version: 5.5.38

SET SQL_MODE = "";

--
-- Database: `brocart`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_advertise_google_target`
--

DROP TABLE IF EXISTS `oc_advertise_google_target`;
CREATE TABLE `oc_advertise_google_target` (
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `campaign_name` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `budget` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `feeds` text NOT NULL,
  `status` enum('paused','active') NOT NULL DEFAULT 'paused'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(1, 4, 'Description'),
(2, 4, 'No. of Cores'),
(4, 4, 'test 1'),
(5, 4, 'test 2'),
(6, 4, 'test 3'),
(7, 4, 'test 4'),
(8, 4, 'test 5'),
(9, 4, 'test 6'),
(10, 4, 'test 7'),
(11, 4, 'test 8'),
(3, 4, 'Clockspeed'),
(1, 5, 'Description'),
(2, 5, 'No. of Cores'),
(4, 5, 'test 1'),
(5, 5, 'test 2'),
(6, 5, 'test 3'),
(7, 5, 'test 4'),
(8, 5, 'test 5'),
(9, 5, 'test 6'),
(10, 5, 'test 7'),
(11, 5, 'test 8'),
(3, 5, 'Clockspeed'),
(1, 6, 'Description'),
(2, 6, 'No. of Cores'),
(4, 6, 'test 1'),
(5, 6, 'test 2'),
(6, 6, 'test 3'),
(7, 6, 'test 4'),
(8, 6, 'test 5'),
(9, 6, 'test 6'),
(10, 6, 'test 7'),
(11, 6, 'test 8'),
(3, 6, 'Clockspeed'),
(1, 7, 'Description'),
(2, 7, 'No. of Cores'),
(4, 7, 'test 1'),
(5, 7, 'test 2'),
(6, 7, 'test 3'),
(7, 7, 'test 4'),
(8, 7, 'test 5'),
(9, 7, 'test 6'),
(10, 7, 'test 7'),
(11, 7, 'test 8'),
(3, 7, 'Clockspeed'),
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed'),
(1, 3, 'Description'),
(2, 3, 'No. of Cores'),
(4, 3, 'test 1'),
(5, 3, 'test 2'),
(6, 3, 'test 3'),
(7, 3, 'test 4'),
(8, 3, 'test 5'),
(9, 3, 'test 6'),
(10, 3, 'test 7'),
(11, 3, 'test 8'),
(3, 3, 'Clockspeed');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 4, 'Memory'),
(4, 4, 'Technical'),
(5, 4, 'Motherboard'),
(6, 4, 'Processor'),
(3, 5, 'Memory'),
(4, 5, 'Technical'),
(5, 5, 'Motherboard'),
(6, 5, 'Processor'),
(3, 6, 'Memory'),
(4, 6, 'Technical'),
(5, 6, 'Motherboard'),
(6, 6, 'Processor'),
(3, 7, 'Memory'),
(4, 7, 'Technical'),
(5, 7, 'Motherboard'),
(6, 7, 'Processor'),
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor'),
(3, 3, 'Memory'),
(4, 3, 'Technical'),
(5, 3, 'Motherboard'),
(6, 3, 'Processor');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(79, 7, 1, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(80, 7, 1, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(97, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(99, 7, 4, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(100, 6, 4, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(101, 8, 4, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(102, 8, 4, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(103, 8, 4, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(104, 8, 4, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(105, 8, 4, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(106, 8, 4, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(107, 8, 4, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(108, 8, 4, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(109, 8, 4, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(110, 7, 4, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(111, 8, 4, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(112, 8, 4, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(113, 7, 5, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(114, 6, 5, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(115, 8, 5, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(116, 8, 5, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(117, 8, 5, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(118, 8, 5, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(119, 8, 5, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(120, 8, 5, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(121, 8, 5, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(122, 8, 5, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(123, 8, 5, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(124, 7, 5, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(125, 8, 5, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(126, 8, 5, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(127, 7, 6, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(128, 6, 6, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(129, 8, 6, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(130, 8, 6, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(131, 8, 6, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(132, 8, 6, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(133, 8, 6, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(134, 8, 6, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(135, 8, 6, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(136, 8, 6, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(137, 8, 6, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(138, 7, 6, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(139, 8, 6, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(140, 8, 6, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(141, 7, 7, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(142, 6, 7, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(143, 8, 7, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(144, 8, 7, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(145, 8, 7, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(146, 8, 7, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(147, 8, 7, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(148, 8, 7, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(149, 8, 7, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(150, 8, 7, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(151, 8, 7, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(152, 7, 7, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(153, 8, 7, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(154, 8, 7, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(155, 7, 2, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(156, 6, 2, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(157, 8, 2, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(158, 8, 2, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(159, 8, 2, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(160, 8, 2, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(161, 8, 2, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(162, 8, 2, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(163, 8, 2, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(164, 8, 2, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(165, 8, 2, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(166, 7, 2, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(167, 8, 2, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(168, 8, 2, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(169, 7, 3, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(170, 6, 3, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(171, 8, 3, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(172, 8, 3, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(173, 8, 3, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(174, 8, 3, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(175, 8, 3, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(176, 8, 3, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(177, 8, 3, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(178, 8, 3, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(179, 8, 3, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(180, 7, 3, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(181, 8, 3, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(182, 8, 3, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_cart`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2019-03-26 15:10:13'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2019-01-11 14:44:41'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2019-03-25 20:29:37'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'Monitors', '', 'Monitors', '', '', ''),
(33, 1, 'Cameras', '', 'Cameras', '', '', ''),
(32, 1, 'Web Cameras', '', 'Web Cameras', '', '', ''),
(31, 1, 'Scanners', '', 'Scanners', '', '', ''),
(30, 1, 'Printers', '', 'Printers', '', '', ''),
(29, 1, 'Mice and Trackballs', '', 'Mice and Trackballs', '', '', ''),
(27, 1, 'Mac', '', 'Mac', '', '', ''),
(26, 1, 'PC', '', 'PC', '', '', ''),
(17, 1, 'Software', '', 'Software', '', '', ''),
(25, 1, 'Components', '', 'Components', '', '', ''),
(24, 1, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', '', ''),
(35, 1, 'test 1', '', 'test 1', '', '', ''),
(37, 1, 'test 5', '', 'test 5', '', '', ''),
(38, 1, 'test 4', '', 'test 4', '', '', ''),
(39, 1, 'test 6', '', 'test 6', '', '', ''),
(40, 1, 'test 7', '', 'test 7', '', '', ''),
(41, 1, 'test 8', '', 'test 8', '', '', ''),
(42, 1, 'test 9', '', 'test 9', '', '', ''),
(43, 1, 'test 11', '', 'test 11', '', '', ''),
(34, 1, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', '', ''),
(18, 1, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(44, 1, 'test 12', '', 'test 12', '', '', ''),
(45, 1, 'Windows', '', 'Windows', '', '', ''),
(46, 1, 'Macs', '', 'Macs', '', '', ''),
(47, 1, 'test 15', '', 'test 15', '', '', ''),
(48, 1, 'test 16', '', 'test 16', '', '', ''),
(49, 1, 'test 17', '', 'test 17', '', '', ''),
(50, 1, 'test 18', '', 'test 18', '', '', ''),
(51, 1, 'test 19', '', 'test 19', '', '', ''),
(52, 1, 'test 20', '', 'test 20', '', '', ''),
(53, 1, 'test 21', '', 'test 21', '', '', ''),
(54, 1, 'test 22', '', 'test 22', '', '', ''),
(55, 1, 'test 23', '', 'test 23', '', '', ''),
(56, 1, 'test 24', '', 'test 24', '', '', ''),
(57, 1, 'Tablets', '', 'Tablets', '', '', ''),
(58, 1, 'test 25', '', 'test 25', '', '', ''),
(28, 4, 'Monitors', '', 'Monitors', '', '', ''),
(33, 4, 'Cameras', '', 'Cameras', '', '', ''),
(32, 4, 'Web Cameras', '', 'Web Cameras', '', '', ''),
(31, 4, 'Scanners', '', 'Scanners', '', '', ''),
(30, 4, 'Printers', '', 'Printers', '', '', ''),
(29, 4, 'Mice and Trackballs', '', 'Mice and Trackballs', '', '', ''),
(27, 4, 'Mac', '', 'Mac', '', '', ''),
(26, 4, 'PC', '', 'PC', '', '', ''),
(17, 4, 'Software', '', 'Software', '', '', ''),
(25, 4, 'Components', '', 'Components', '', '', ''),
(24, 4, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', '', ''),
(35, 4, 'test 1', '', 'test 1', '', '', ''),
(37, 4, 'test 5', '', 'test 5', '', '', ''),
(38, 4, 'test 4', '', 'test 4', '', '', ''),
(39, 4, 'test 6', '', 'test 6', '', '', ''),
(40, 4, 'test 7', '', 'test 7', '', '', ''),
(41, 4, 'test 8', '', 'test 8', '', '', ''),
(42, 4, 'test 9', '', 'test 9', '', '', ''),
(43, 4, 'test 11', '', 'test 11', '', '', ''),
(34, 4, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', '', ''),
(18, 4, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(44, 4, 'test 12', '', 'test 12', '', '', ''),
(45, 4, 'Windows', '', 'Windows', '', '', ''),
(46, 4, 'Macs', '', 'Macs', '', '', ''),
(47, 4, 'test 15', '', 'test 15', '', '', ''),
(48, 4, 'test 16', '', 'test 16', '', '', ''),
(49, 4, 'test 17', '', 'test 17', '', '', ''),
(50, 4, 'test 18', '', 'test 18', '', '', ''),
(51, 4, 'test 19', '', 'test 19', '', '', ''),
(52, 4, 'test 20', '', 'test 20', '', '', ''),
(53, 4, 'test 21', '', 'test 21', '', '', ''),
(54, 4, 'test 22', '', 'test 22', '', '', ''),
(55, 4, 'test 23', '', 'test 23', '', '', ''),
(56, 4, 'test 24', '', 'test 24', '', '', ''),
(57, 4, 'Tablets', '', 'Tablets', '', '', ''),
(58, 4, 'test 25', '', 'test 25', '', '', ''),
(28, 5, 'Monitors', '', 'Monitors', '', '', ''),
(33, 5, 'Cameras', '', 'Cameras', '', '', ''),
(32, 5, 'Web Cameras', '', 'Web Cameras', '', '', ''),
(31, 5, 'Scanners', '', 'Scanners', '', '', ''),
(30, 5, 'Printers', '', 'Printers', '', '', ''),
(29, 5, 'Mice and Trackballs', '', 'Mice and Trackballs', '', '', ''),
(27, 5, 'Mac', '', 'Mac', '', '', ''),
(26, 5, 'PC', '', 'PC', '', '', ''),
(17, 5, 'Software', '', 'Software', '', '', ''),
(25, 5, 'Components', '', 'Components', '', '', ''),
(24, 5, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', '', ''),
(20, 3, 'Desktops-RU', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Desktops-RU', '', 'Example of category description', ''),
(35, 5, 'test 1', '', 'test 1', '', '', ''),
(36, 3, 'test 2', '', 'test 2', '', '', ''),
(37, 5, 'test 5', '', 'test 5', '', '', ''),
(38, 5, 'test 4', '', 'test 4', '', '', ''),
(39, 5, 'test 6', '', 'test 6', '', '', ''),
(40, 5, 'test 7', '', 'test 7', '', '', ''),
(41, 5, 'test 8', '', 'test 8', '', '', ''),
(42, 5, 'test 9', '', 'test 9', '', '', ''),
(43, 5, 'test 11', '', 'test 11', '', '', ''),
(34, 5, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', '', ''),
(18, 5, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(44, 5, 'test 12', '', 'test 12', '', '', ''),
(45, 5, 'Windows', '', 'Windows', '', '', ''),
(46, 5, 'Macs', '', 'Macs', '', '', ''),
(47, 5, 'test 15', '', 'test 15', '', '', ''),
(48, 5, 'test 16', '', 'test 16', '', '', ''),
(49, 5, 'test 17', '', 'test 17', '', '', ''),
(50, 5, 'test 18', '', 'test 18', '', '', ''),
(51, 5, 'test 19', '', 'test 19', '', '', ''),
(52, 5, 'test 20', '', 'test 20', '', '', ''),
(53, 5, 'test 21', '', 'test 21', '', '', ''),
(54, 5, 'test 22', '', 'test 22', '', '', ''),
(55, 5, 'test 23', '', 'test 23', '', '', ''),
(56, 5, 'test 24', '', 'test 24', '', '', ''),
(57, 5, 'Tablets', '', 'Tablets', '', '', ''),
(58, 5, 'test 25', '', 'test 25', '', '', ''),
(28, 6, 'Monitors', '', 'Monitors', '', '', ''),
(33, 6, 'Cameras', '', 'Cameras', '', '', ''),
(32, 6, 'Web Cameras', '', 'Web Cameras', '', '', ''),
(31, 6, 'Scanners', '', 'Scanners', '', '', ''),
(30, 6, 'Printers', '', 'Printers', '', '', ''),
(29, 6, 'Mice and Trackballs', '', 'Mice and Trackballs', '', '', ''),
(27, 6, 'Mac', '', 'Mac', '', '', ''),
(26, 6, 'PC', '', 'PC', '', '', ''),
(17, 6, 'Software', '', 'Software', '', '', ''),
(25, 6, 'Components', '', 'Components', '', '', ''),
(24, 6, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', '', ''),
(20, 2, 'Desktops-UA', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Desktops-UA', '', 'Example of category description', ''),
(35, 6, 'test 1', '', 'test 1', '', '', ''),
(36, 2, 'test 2', '', 'test 2', '', '', ''),
(37, 6, 'test 5', '', 'test 5', '', '', ''),
(38, 6, 'test 4', '', 'test 4', '', '', ''),
(39, 6, 'test 6', '', 'test 6', '', '', ''),
(40, 6, 'test 7', '', 'test 7', '', '', ''),
(41, 6, 'test 8', '', 'test 8', '', '', ''),
(42, 6, 'test 9', '', 'test 9', '', '', ''),
(43, 6, 'test 11', '', 'test 11', '', '', ''),
(34, 6, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', '', ''),
(18, 6, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(44, 6, 'test 12', '', 'test 12', '', '', ''),
(45, 6, 'Windows', '', 'Windows', '', '', ''),
(46, 6, 'Macs', '', 'Macs', '', '', ''),
(47, 6, 'test 15', '', 'test 15', '', '', ''),
(48, 6, 'test 16', '', 'test 16', '', '', ''),
(49, 6, 'test 17', '', 'test 17', '', '', ''),
(50, 6, 'test 18', '', 'test 18', '', '', ''),
(51, 6, 'test 19', '', 'test 19', '', '', ''),
(52, 6, 'test 20', '', 'test 20', '', '', ''),
(53, 6, 'test 21', '', 'test 21', '', '', ''),
(54, 6, 'test 22', '', 'test 22', '', '', ''),
(55, 6, 'test 23', '', 'test 23', '', '', ''),
(56, 6, 'test 24', '', 'test 24', '', '', ''),
(57, 6, 'Tablets', '', 'Tablets', '', '', ''),
(58, 6, 'test 25', '', 'test 25', '', '', ''),
(28, 7, 'Monitors', '', 'Monitors', '', '', ''),
(33, 7, 'Cameras', '', 'Cameras', '', '', ''),
(32, 7, 'Web Cameras', '', 'Web Cameras', '', '', ''),
(31, 7, 'Scanners', '', 'Scanners', '', '', ''),
(30, 7, 'Printers', '', 'Printers', '', '', ''),
(29, 7, 'Mice and Trackballs', '', 'Mice and Trackballs', '', '', ''),
(27, 7, 'Mac', '', 'Mac', '', '', ''),
(26, 7, 'PC', '', 'PC', '', '', ''),
(17, 7, 'Software', '', 'Software', '', '', ''),
(25, 7, 'Components', '', 'Components', '', '', ''),
(24, 7, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', '', ''),
(20, 1, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Desktops', '', 'Example of category description', ''),
(35, 7, 'test 1', '', 'test 1', '', '', ''),
(36, 1, 'test 2', '', 'test 2', '', '', ''),
(37, 7, 'test 5', '', 'test 5', '', '', ''),
(38, 7, 'test 4', '', 'test 4', '', '', ''),
(39, 7, 'test 6', '', 'test 6', '', '', ''),
(40, 7, 'test 7', '', 'test 7', '', '', ''),
(41, 7, 'test 8', '', 'test 8', '', '', ''),
(42, 7, 'test 9', '', 'test 9', '', '', ''),
(43, 7, 'test 11', '', 'test 11', '', '', ''),
(34, 7, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', '', ''),
(18, 7, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(44, 7, 'test 12', '', 'test 12', '', '', ''),
(45, 7, 'Windows', '', 'Windows', '', '', ''),
(46, 7, 'Macs', '', 'Macs', '', '', ''),
(47, 7, 'test 15', '', 'test 15', '', '', ''),
(48, 7, 'test 16', '', 'test 16', '', '', ''),
(49, 7, 'test 17', '', 'test 17', '', '', ''),
(50, 7, 'test 18', '', 'test 18', '', '', ''),
(51, 7, 'test 19', '', 'test 19', '', '', ''),
(52, 7, 'test 20', '', 'test 20', '', '', ''),
(53, 7, 'test 21', '', 'test 21', '', '', ''),
(54, 7, 'test 22', '', 'test 22', '', '', ''),
(55, 7, 'test 23', '', 'test 23', '', '', ''),
(56, 7, 'test 24', '', 'test 24', '', '', ''),
(57, 7, 'Tablets', '', 'Tablets', '', '', ''),
(58, 7, 'test 25', '', 'test 25', '', '', ''),
(28, 2, 'Monitors', '', 'Monitors', '', '', ''),
(33, 2, 'Cameras', '', 'Cameras', '', '', ''),
(32, 2, 'Web Cameras', '', 'Web Cameras', '', '', ''),
(31, 2, 'Scanners', '', 'Scanners', '', '', ''),
(30, 2, 'Printers', '', 'Printers', '', '', ''),
(29, 2, 'Mice and Trackballs', '', 'Mice and Trackballs', '', '', ''),
(27, 2, 'Mac', '', 'Mac', '', '', ''),
(26, 2, 'PC', '', 'PC', '', '', ''),
(17, 2, 'Software', '', 'Software', '', '', ''),
(25, 2, 'Components', '', 'Components', '', '', ''),
(24, 2, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', '', ''),
(35, 2, 'test 1', '', 'test 1', '', '', ''),
(37, 2, 'test 5', '', 'test 5', '', '', ''),
(38, 2, 'test 4', '', 'test 4', '', '', ''),
(39, 2, 'test 6', '', 'test 6', '', '', ''),
(40, 2, 'test 7', '', 'test 7', '', '', ''),
(41, 2, 'test 8', '', 'test 8', '', '', ''),
(42, 2, 'test 9', '', 'test 9', '', '', ''),
(43, 2, 'test 11', '', 'test 11', '', '', ''),
(34, 2, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', '', ''),
(18, 2, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(44, 2, 'test 12', '', 'test 12', '', '', ''),
(45, 2, 'Windows', '', 'Windows', '', '', ''),
(46, 2, 'Macs', '', 'Macs', '', '', ''),
(47, 2, 'test 15', '', 'test 15', '', '', ''),
(48, 2, 'test 16', '', 'test 16', '', '', ''),
(49, 2, 'test 17', '', 'test 17', '', '', ''),
(50, 2, 'test 18', '', 'test 18', '', '', ''),
(51, 2, 'test 19', '', 'test 19', '', '', ''),
(52, 2, 'test 20', '', 'test 20', '', '', ''),
(53, 2, 'test 21', '', 'test 21', '', '', ''),
(54, 2, 'test 22', '', 'test 22', '', '', ''),
(55, 2, 'test 23', '', 'test 23', '', '', ''),
(56, 2, 'test 24', '', 'test 24', '', '', ''),
(57, 2, 'Tablets', '', 'Tablets', '', '', ''),
(58, 2, 'test 25', '', 'test 25', '', '', ''),
(28, 3, 'Monitors', '', 'Monitors', '', '', ''),
(33, 3, 'Cameras', '', 'Cameras', '', '', ''),
(32, 3, 'Web Cameras', '', 'Web Cameras', '', '', ''),
(31, 3, 'Scanners', '', 'Scanners', '', '', ''),
(30, 3, 'Printers', '', 'Printers', '', '', ''),
(29, 3, 'Mice and Trackballs', '', 'Mice and Trackballs', '', '', ''),
(27, 3, 'Mac', '', 'Mac', '', '', ''),
(26, 3, 'PC', '', 'PC', '', '', ''),
(17, 3, 'Software', '', 'Software', '', '', ''),
(25, 3, 'Components', '', 'Components', '', '', ''),
(24, 3, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', '', ''),
(35, 3, 'test 1', '', 'test 1', '', '', ''),
(37, 3, 'test 5', '', 'test 5', '', '', ''),
(38, 3, 'test 4', '', 'test 4', '', '', ''),
(39, 3, 'test 6', '', 'test 6', '', '', ''),
(40, 3, 'test 7', '', 'test 7', '', '', ''),
(41, 3, 'test 8', '', 'test 8', '', '', ''),
(42, 3, 'test 9', '', 'test 9', '', '', ''),
(43, 3, 'test 11', '', 'test 11', '', '', ''),
(34, 3, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', '', ''),
(18, 3, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(44, 3, 'test 12', '', 'test 12', '', '', ''),
(45, 3, 'Windows', '', 'Windows', '', '', ''),
(46, 3, 'Macs', '', 'Macs', '', '', ''),
(47, 3, 'test 15', '', 'test 15', '', '', ''),
(48, 3, 'test 16', '', 'test 16', '', '', ''),
(49, 3, 'test 17', '', 'test 17', '', '', ''),
(50, 3, 'test 18', '', 'test 18', '', '', ''),
(51, 3, 'test 19', '', 'test 19', '', '', ''),
(52, 3, 'test 20', '', 'test 20', '', '', ''),
(53, 3, 'test 21', '', 'test 21', '', '', ''),
(54, 3, 'test 22', '', 'test 22', '', '', ''),
(55, 3, 'test 23', '', 'test 23', '', '', ''),
(56, 3, 'test 24', '', 'test 24', '', '', ''),
(57, 3, 'Tablets', '', 'Tablets', '', '', ''),
(58, 3, 'test 25', '', 'test 25', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 28, 1),
(28, 25, 0),
(35, 35, 2),
(35, 28, 1),
(35, 25, 0),
(36, 36, 2),
(36, 25, 0),
(36, 28, 1),
(29, 29, 1),
(29, 25, 0),
(30, 30, 1),
(30, 25, 0),
(31, 31, 1),
(31, 25, 0),
(32, 32, 1),
(32, 25, 0),
(20, 20, 0),
(27, 27, 1),
(27, 20, 0),
(26, 26, 1),
(26, 20, 0),
(24, 24, 0),
(18, 18, 0),
(45, 45, 1),
(45, 18, 0),
(46, 46, 1),
(46, 18, 0),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 37, 1),
(37, 34, 0),
(38, 38, 1),
(38, 34, 0),
(39, 39, 1),
(39, 34, 0),
(40, 40, 1),
(40, 34, 0),
(41, 41, 1),
(41, 34, 0),
(42, 42, 1),
(42, 34, 0),
(43, 43, 1),
(43, 34, 0),
(44, 44, 1),
(44, 34, 0),
(47, 47, 1),
(47, 34, 0),
(48, 48, 1),
(48, 34, 0),
(49, 49, 1),
(49, 34, 0),
(50, 50, 1),
(50, 34, 0),
(51, 51, 1),
(51, 34, 0),
(52, 52, 1),
(52, 34, 0),
(58, 58, 2),
(58, 52, 1),
(58, 34, 0),
(53, 53, 1),
(53, 34, 0),
(54, 54, 1),
(54, 34, 0),
(55, 55, 1),
(55, 34, 0),
(56, 56, 1),
(56, 34, 0),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_google_product_category`
--

DROP TABLE IF EXISTS `oc_category_to_google_product_category`;
CREATE TABLE `oc_category_to_google_product_category` (
  `google_product_category` varchar(10) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(33, 0, 0),
(36, 0, 0),
(20, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Афганистан', 'AF', 'AFG', '', 0, 0),
(2, 'Албания', 'AL', 'ALB', '', 0, 0),
(3, 'Алжир', 'DZ', 'DZA', '', 0, 0),
(4, 'Американское Самоа', 'AS', 'ASM', '', 0, 0),
(5, 'Андорра', 'AD', 'AND', '', 0, 0),
(6, 'Ангола', 'AO', 'AGO', '', 0, 0),
(7, 'Ангилья', 'AI', 'AIA', '', 0, 0),
(8, 'Антарктида', 'AQ', 'ATA', '', 0, 0),
(9, 'Антигуа и Барбуда', 'AG', 'ATG', '', 0, 0),
(10, 'Аргентина', 'AR', 'ARG', '', 0, 0),
(11, 'Армения', 'AM', 'ARM', '', 0, 1),
(12, 'Аруба', 'AW', 'ABW', '', 0, 0),
(13, 'Австралия', 'AU', 'AUS', '', 0, 0),
(14, 'Австрия', 'AT', 'AUT', '', 0, 0),
(15, 'Азербайджан', 'AZ', 'AZE', '', 0, 0),
(16, 'Багамские о-ва', 'BS', 'BHS', '', 0, 0),
(17, 'Бахрейн', 'BH', 'BHR', '', 0, 0),
(18, 'Бангладеш', 'BD', 'BGD', '', 0, 0),
(19, 'Барбадос', 'BB', 'BRB', '', 0, 0),
(20, 'Беларусь', 'BY', 'BLR', '', 0, 1),
(21, 'Бельгия', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 0),
(22, 'Белиз', 'BZ', 'BLZ', '', 0, 0),
(23, 'Бенин', 'BJ', 'BEN', '', 0, 0),
(24, 'Бермудские острова', 'BM', 'BMU', '', 0, 0),
(25, 'Бутан', 'BT', 'BTN', '', 0, 0),
(26, 'Боливия', 'BO', 'BOL', '', 0, 0),
(27, 'Босния и Герцеговина', 'BA', 'BIH', '', 0, 0),
(28, 'Ботсвана', 'BW', 'BWA', '', 0, 0),
(29, 'Остров Буве', 'BV', 'BVT', '', 0, 0),
(30, 'Бразилия', 'BR', 'BRA', '', 0, 0),
(31, 'Британская территория Индийского океана', 'IO', 'IOT', '', 0, 0),
(32, 'Бруней-Даруссалам', 'BN', 'BRN', '', 0, 0),
(33, 'Болгария', 'BG', 'BGR', '', 0, 0),
(34, 'Буркина-Фасо', 'BF', 'BFA', '', 0, 0),
(35, 'Бурунди', 'BI', 'BDI', '', 0, 0),
(36, 'Камбоджа', 'KH', 'KHM', '', 0, 0),
(37, 'Камерун', 'CM', 'CMR', '', 0, 0),
(38, 'Канада', 'CA', 'CAN', '', 0, 0),
(39, 'Кабо-Верде', 'CV', 'CPV', '', 0, 0),
(40, 'Каймановы острова', 'KY', 'CYM', '', 0, 0),
(41, 'Центрально-Африканская Республика', 'CF', 'CAF', '', 0, 0),
(42, 'Чад', 'TD', 'TCD', '', 0, 0),
(43, 'Чили', 'CL', 'CHL', '', 0, 0),
(44, 'Китай', 'CN', 'CHN', '', 0, 0),
(45, 'Остров Рождества', 'CX', 'CXR', '', 0, 0),
(46, 'Кокосовые (Килинг) острова', 'CC', 'CCK', '', 0, 0),
(47, 'Колумбия', 'CO', 'COL', '', 0, 0),
(48, 'Коморские острова', 'KM', 'COM', '', 0, 0),
(49, 'Конго', 'CG', 'COG', '', 0, 0),
(50, 'Острова Кука', 'CK', 'COK', '', 0, 0),
(51, 'Коста Рика', 'CR', 'CRI', '', 0, 0),
(52, 'Берег Слоновой Кости', 'CI', 'CIV', '', 0, 0),
(53, 'Хорватия', 'HR', 'HRV', '', 0, 0),
(54, 'Куба', 'CU', 'CUB', '', 0, 0),
(55, 'Кипр', 'CY', 'CYP', '', 0, 0),
(56, 'Чехия', 'CZ', 'CZE', '', 0, 0),
(57, 'Дания', 'DK', 'DNK', '', 0, 0),
(58, 'Джибути', 'DJ', 'DJI', '', 0, 0),
(59, 'Доминика', 'DM', 'DMA', '', 0, 0),
(60, 'Доминиканская Респблика', 'DO', 'DOM', '', 0, 0),
(61, 'Восточный Тимор', 'TL', 'TLS', '', 0, 0),
(62, 'Эквадор', 'EC', 'ECU', '', 0, 0),
(63, 'Египет', 'EG', 'EGY', '', 0, 0),
(64, 'Эль Сальвадор', 'SV', 'SLV', '', 0, 0),
(65, 'Экваториальная Гвинея', 'GQ', 'GNQ', '', 0, 0),
(66, 'Эритрея', 'ER', 'ERI', '', 0, 0),
(67, 'Эстония', 'EE', 'EST', '', 0, 0),
(68, 'Эфиопия', 'ET', 'ETH', '', 0, 0),
(69, 'Фолклендские (Мальвинские) острова', 'FK', 'FLK', '', 0, 0),
(70, 'Фарерские острова', 'FO', 'FRO', '', 0, 0),
(71, 'Фиджи', 'FJ', 'FJI', '', 0, 0),
(72, 'Финляндия', 'FI', 'FIN', '', 0, 0),
(74, 'Франция, митрополит', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 0),
(75, 'Французская Гвиана', 'GF', 'GUF', '', 0, 0),
(76, 'Французская Полинезия', 'PF', 'PYF', '', 0, 0),
(77, 'Южные Французские Территории', 'TF', 'ATF', '', 0, 0),
(78, 'Габон', 'GA', 'GAB', '', 0, 0),
(79, 'Гамбия', 'GM', 'GMB', '', 0, 0),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(81, 'Германия', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 0),
(82, 'Гана', 'GH', 'GHA', '', 0, 0),
(83, 'Гибралтар', 'GI', 'GIB', '', 0, 0),
(84, 'Греция', 'GR', 'GRC', '', 0, 0),
(85, 'Гренландия', 'GL', 'GRL', '', 0, 0),
(86, 'Гренада', 'GD', 'GRD', '', 0, 0),
(87, 'Гваделупа', 'GP', 'GLP', '', 0, 0),
(88, 'Гуам', 'GU', 'GUM', '', 0, 0),
(89, 'Гватемала', 'GT', 'GTM', '', 0, 0),
(90, 'Гвинея', 'GN', 'GIN', '', 0, 0),
(91, 'Гвинея-Бисау', 'GW', 'GNB', '', 0, 0),
(92, 'Гайана', 'GY', 'GUY', '', 0, 0),
(93, 'Гаити', 'HT', 'HTI', '', 0, 0),
(94, 'Острова Херд и Макдональд', 'HM', 'HMD', '', 0, 0),
(95, 'Гондурас', 'HN', 'HND', '', 0, 0),
(96, 'Гонконг', 'HK', 'HKG', '', 0, 0),
(97, 'Венгрия', 'HU', 'HUN', '', 0, 0),
(98, 'Исландия', 'IS', 'ISL', '', 0, 0),
(99, 'Индия', 'IN', 'IND', '', 0, 0),
(100, 'Индонезия', 'ID', 'IDN', '', 0, 0),
(101, 'Иран (Исламская Республика)', 'IR', 'IRN', '', 0, 0),
(102, 'Ирак', 'IQ', 'IRQ', '', 0, 0),
(103, 'Ирландия', 'IE', 'IRL', '', 0, 0),
(104, 'Израиль', 'IL', 'ISR', '', 0, 0),
(105, 'Италия', 'IT', 'ITA', '', 0, 0),
(106, 'Ямайка', 'JM', 'JAM', '', 0, 0),
(107, 'Япония', 'JP', 'JPN', '', 0, 0),
(108, 'Иордания', 'JO', 'JOR', '', 0, 0),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(110, 'Кения', 'KE', 'KEN', '', 0, 0),
(111, 'Кирибати', 'KI', 'KIR', '', 0, 0),
(112, 'Северная Корея', 'KP', 'PRK', '', 0, 0),
(113, 'Южная Корея', 'KR', 'KOR', '', 0, 0),
(114, 'Кувейт', 'KW', 'KWT', '', 0, 0),
(115, 'Киргизия', 'KG', 'KGZ', '', 0, 0),
(116, 'Лаосская Народно-Демократическая Республика', 'LA', 'LAO', '', 0, 0),
(117, 'Латвия', 'LV', 'LVA', '', 0, 0),
(118, 'Ливан', 'LB', 'LBN', '', 0, 0),
(119, 'Лесото', 'LS', 'LSO', '', 0, 0),
(120, 'Либерия', 'LR', 'LBR', '', 0, 0),
(121, 'Ливийская арабская джамахирия', 'LY', 'LBY', '', 0, 0),
(122, 'Лихтенштейн', 'LI', 'LIE', '', 0, 0),
(123, 'Литва', 'LT', 'LTU', '', 0, 1),
(124, 'Люксембург', 'LU', 'LUX', '', 0, 0),
(125, 'Макао', 'MO', 'MAC', '', 0, 0),
(126, 'БЮРМ', 'MK', 'MKD', '', 0, 0),
(127, 'Мадагаскар', 'MG', 'MDG', '', 0, 0),
(128, 'Малави', 'MW', 'MWI', '', 0, 0),
(129, 'Малайзия', 'MY', 'MYS', '', 0, 0),
(130, 'Мальдивы', 'MV', 'MDV', '', 0, 0),
(131, 'Мали', 'ML', 'MLI', '', 0, 0),
(132, 'Мальта', 'MT', 'MLT', '', 0, 0),
(133, 'Маршалловы острова', 'MH', 'MHL', '', 0, 0),
(134, 'Мартиника', 'MQ', 'MTQ', '', 0, 0),
(135, 'Мавритания', 'MR', 'MRT', '', 0, 0),
(136, 'Маврикий', 'MU', 'MUS', '', 0, 0),
(137, 'Майотта', 'YT', 'MYT', '', 0, 0),
(138, 'Мексика', 'MX', 'MEX', '', 0, 0),
(139, 'Микронезия, Федеративные Штаты', 'FM', 'FSM', '', 0, 0),
(140, 'Республика Молдова', 'MD', 'MDA', '', 0, 0),
(141, 'Монако', 'MC', 'MCO', '', 0, 0),
(142, 'Монголия', 'MN', 'MNG', '', 0, 0),
(143, 'Монсеррат', 'MS', 'MSR', '', 0, 0),
(144, 'Марокко', 'MA', 'MAR', '', 0, 0),
(145, 'Мозамбик', 'MZ', 'MOZ', '', 0, 0),
(146, 'Мьянма', 'MM', 'MMR', '', 0, 0),
(147, 'Намибия', 'NA', 'NAM', '', 0, 0),
(148, 'Науру', 'NR', 'NRU', '', 0, 0),
(149, 'Непал', 'NP', 'NPL', '', 0, 0),
(150, 'Нидерланды', 'NL', 'NLD', '', 0, 0),
(151, 'Нидерландские Антильские острова', 'AN', 'ANT', '', 0, 0),
(152, 'Новая Каледония', 'NC', 'NCL', '', 0, 0),
(153, 'Новая Зеландия', 'NZ', 'NZL', '', 0, 0),
(154, 'Никарагуа', 'NI', 'NIC', '', 0, 0),
(155, 'Нигер', 'NE', 'NER', '', 0, 0),
(156, 'Нигерия', 'NG', 'NGA', '', 0, 0),
(157, 'Ниуе', 'NU', 'NIU', '', 0, 0),
(158, 'Остров Норфолк', 'NF', 'NFK', '', 0, 0),
(159, 'Северные Марианские острова', 'MP', 'MNP', '', 0, 0),
(160, 'Норвегия', 'NO', 'NOR', '', 0, 0),
(161, 'Оман', 'OM', 'OMN', '', 0, 0),
(162, 'Пакистан', 'PK', 'PAK', '', 0, 0),
(163, 'Палау', 'PW', 'PLW', '', 0, 0),
(164, 'Панама', 'PA', 'PAN', '', 0, 0),
(165, 'Папуа - Новая Гвинея', 'PG', 'PNG', '', 0, 0),
(166, 'Парагвай', 'PY', 'PRY', '', 0, 0),
(167, 'Перу', 'PE', 'PER', '', 0, 0),
(168, 'Филиппины', 'PH', 'PHL', '', 0, 0),
(169, 'Питкэрн', 'PN', 'PCN', '', 0, 0),
(170, 'Польша', 'PL', 'POL', '', 0, 0),
(171, 'Португалия', 'PT', 'PRT', '', 0, 0),
(172, 'Пуэрто-Рико', 'PR', 'PRI', '', 0, 0),
(173, 'Катар', 'QA', 'QAT', '', 0, 0),
(174, 'воссоединение', 'RE', 'REU', '', 0, 0),
(175, 'Румыния', 'RO', 'ROM', '', 0, 0),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(177, 'Руанда', 'RW', 'RWA', '', 0, 0),
(178, 'Сент-Китс и Невис', 'KN', 'KNA', '', 0, 0),
(179, 'Санкт-Люсия', 'LC', 'LCA', '', 0, 0),
(180, 'Святой Винсент и Гренадины', 'VC', 'VCT', '', 0, 0),
(181, 'Самоа', 'WS', 'WSM', '', 0, 0),
(182, 'Сан-Марино', 'SM', 'SMR', '', 0, 0),
(183, 'Сан-Томе и Принсипи', 'ST', 'STP', '', 0, 0),
(184, 'Саудовская Аравия', 'SA', 'SAU', '', 0, 0),
(185, 'Сенегал', 'SN', 'SEN', '', 0, 0),
(186, 'Сейшельские острова', 'SC', 'SYC', '', 0, 0),
(187, 'Сьерра-Леоне', 'SL', 'SLE', '', 0, 0),
(188, 'Сингапур', 'SG', 'SGP', '', 0, 0),
(189, 'Словацкая Республика', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 0),
(190, 'Словения', 'SI', 'SVN', '', 0, 0),
(191, 'Соломоновы острова', 'SB', 'SLB', '', 0, 0),
(192, 'Сомали', 'SO', 'SOM', '', 0, 0),
(193, 'Южная Африка', 'ZA', 'ZAF', '', 0, 0),
(194, 'Южная Георгия и Южные Сандвичевы острова', 'GS', 'SGS', '', 0, 0),
(195, 'Испания', 'ES', 'ESP', '', 0, 0),
(196, 'Шри-Ланка', 'LK', 'LKA', '', 0, 0),
(197, 'Остров Святой Елены', 'SH', 'SHN', '', 0, 0),
(198, 'Сен-Пьер и Микелон', 'PM', 'SPM', '', 0, 0),
(199, 'Судан', 'SD', 'SDN', '', 0, 0),
(200, 'Суринам', 'SR', 'SUR', '', 0, 0),
(201, 'Острова Шпицберген и Ян-Майен', 'SJ', 'SJM', '', 0, 0),
(202, 'Свазиленд', 'SZ', 'SWZ', '', 0, 0),
(203, 'Швеция', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 0),
(204, 'Швейцария', 'CH', 'CHE', '', 0, 0),
(205, 'Сирийская Арабская Республика', 'SY', 'SYR', '', 0, 0),
(206, 'Тайвань', 'TW', 'TWN', '', 0, 0),
(207, 'Таджикистан', 'TJ', 'TJK', '', 0, 0),
(208, 'Танзания, Объединенная Республика', 'TZ', 'TZA', '', 0, 0),
(209, 'Таиланд', 'TH', 'THA', '', 0, 0),
(210, 'Идти', 'TG', 'TGO', '', 0, 0),
(211, 'Токелау', 'TK', 'TKL', '', 0, 0),
(212, 'Тонга', 'TO', 'TON', '', 0, 0),
(213, 'Тринидад и Тобаго', 'TT', 'TTO', '', 0, 0),
(214, 'Тунис', 'TN', 'TUN', '', 0, 0),
(215, 'Турция', 'TR', 'TUR', '', 0, 0),
(216, 'Туркменистан', 'TM', 'TKM', '', 0, 0),
(217, 'Острова Теркс и Кайкос', 'TC', 'TCA', '', 0, 0),
(218, 'Тувалу', 'TV', 'TUV', '', 0, 0),
(219, 'Уганда', 'UG', 'UGA', '', 0, 0),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(221, 'Объединенные Арабские Эмираты', 'AE', 'ARE', '', 0, 0),
(222, 'Объединенное Королевство', 'GB', 'GBR', '', 1, 0),
(223, 'Соединенные Штаты', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'Малые отдаленные острова США', 'UM', 'UMI', '', 0, 0),
(225, 'Уругвай', 'UY', 'URY', '', 0, 0),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 0),
(227, 'Вануату', 'VU', 'VUT', '', 0, 0),
(228, 'Город-государство Ватикан (Святой Престол)', 'VA', 'VAT', '', 0, 0),
(229, 'Венесуэла', 'VE', 'VEN', '', 0, 0),
(230, 'Вьетнам', 'VN', 'VNM', '', 0, 0),
(231, 'Виргинские острова (Британские)', 'VG', 'VGB', '', 0, 0),
(232, 'Виргинские острова (США)', 'VI', 'VIR', '', 0, 0),
(233, 'Острова Уоллис и Футуна', 'WF', 'WLF', '', 0, 0),
(234, 'Западная Сахара', 'EH', 'ESH', '', 0, 0),
(235, 'Йемен', 'YE', 'YEM', '', 0, 0),
(237, 'Демократическая Республика Конго', 'CD', 'COD', '', 0, 0),
(238, 'Замбия', 'ZM', 'ZMB', '', 0, 0),
(239, 'Зимбабве', 'ZW', 'ZWE', '', 0, 0),
(242, 'Черногория', 'ME', 'MNE', '', 0, 0),
(243, 'Сербия', 'RS', 'SRB', '', 0, 0),
(244, 'Аландские острова', 'AX', 'ALA', '', 0, 0),
(245, 'Бонэйр, Синт-Эстатиус и Саба', 'BQ', 'BES', '', 0, 0),
(246, 'ликер кюрасо', 'CW', 'CUW', '', 0, 0),
(247, 'Палестинская территория, оккупированная', 'PS', 'PSE', '', 0, 0),
(248, 'южный Судан', 'SS', 'SSD', '', 0, 0),
(249, 'Святой Бартельми', 'BL', 'BLM', '', 0, 0),
(250, 'Святого Мартина (французская часть)', 'MF', 'MAF', '', 0, 0),
(251, 'Канарские острова', 'IC', 'ICA', '', 0, 0),
(252, 'Остров Вознесения (Британский)', 'AC', 'ASC', '', 0, 0),
(253, 'Косово, Республика', 'XK', 'UNK', '', 0, 0),
(254, 'Остров Мэн', 'IM', 'IMN', '', 0, 0),
(255, 'Тристан-да-Кунья', 'TA', 'SHN', '', 0, 0),
(256, 'шерстяная фуфайка', 'GG', 'GGY', '', 0, 0),
(257, 'Джерси', 'JE', 'JEY', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Гривна', 'UAH', '', ' ₴', '2', 1.00000000, 1, '2019-03-25 17:34:29'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2019-03-25 17:23:54'),
(3, 'Рубль', 'RUR', '', ' ₽', '2', 0.01500000, 1, '2019-01-11 13:08:43');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_affiliate`
--

DROP TABLE IF EXISTS `oc_customer_affiliate`;
CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_approval`
--

DROP TABLE IF EXISTS `oc_customer_approval`;
CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 4, 'Default', 'test'),
(1, 5, 'Default', 'test'),
(1, 6, 'Default', 'test'),
(1, 7, 'Default', 'test'),
(1, 2, 'Default', 'test'),
(1, 3, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_search`
--

DROP TABLE IF EXISTS `oc_customer_search`;
CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0),
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0),
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0),
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0),
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0),
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0),
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0),
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0),
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0),
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0),
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0),
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0),
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'advertise', 'google'),
(43, 'module', 'storage_cleaner'),
(44, 'shipping', 'free'),
(45, 'shipping', 'pickup'),
(46, 'payment', 'cheque'),
(47, 'feed', 'furious_sitemap');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension_install`
--

DROP TABLE IF EXISTS `oc_extension_install`;
CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension_path`
--

DROP TABLE IF EXISTS `oc_extension_path`;
CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'Доставка по Украине', 'Доставка по Украине в регионы', '2009-01-06 23:26:25', '2019-01-11 13:33:47'),
(4, 'Доставка по России', 'Доставка по России', '2009-06-23 01:14:53', '2019-01-11 13:31:12');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `meta_h1`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(5, 1, 'Terms &amp; Conditions En', '', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions En', 'Description Terms &amp; Conditions En', 'Keywords Terms &amp; Conditions En'),
(3, 1, 'Privacy Policy En', '', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy En', 'Description Privacy Policy En', 'Keywords Privacy Policy En'),
(4, 2, 'About Us Ua', '', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us Ua', 'Description About Us Ua', 'Keywords About Us Ua'),
(6, 2, 'Delivery Information Ua', '', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information Ua', 'Description Delivery Information Ua', 'Keywords Delivery Information Ua'),
(5, 2, 'Terms &amp; Conditions Ua', '', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions Ua', 'Description Terms &amp; Conditions  Ua', 'Keywords Terms &amp; Conditions  Ua'),
(3, 2, 'Privacy Policy Ua', '', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy Ua', 'Description Privacy Policy Ua', 'Keywords Privacy Policy Ua'),
(4, 1, 'About Us En', '', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us En', 'Description About Us En', 'Keywords About Us En'),
(6, 1, 'Delivery Information En', '', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information En', 'Description Delivery Information En', 'Keywords Description Delivery Information En'),
(5, 3, 'Terms &amp; Conditions Ru', '', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions Ru', 'Description Terms &amp; Conditions Ru', 'Keywords Terms &amp; Conditions Ru'),
(3, 3, 'Privacy Policy Ru', '', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy Ru', 'Description Privacy Policy Ru', 'Keywords Privacy Policy Ru'),
(4, 3, 'About Us Ru', '', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us Ru', 'Description About Us Ru', 'Keywords About Us Ru'),
(6, 3, 'Delivery Information Ru', '', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information Ru', 'Description Delivery Information Ru', 'Keywords Delivery Information Ru');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(6, 0, 0),
(3, 0, 0),
(5, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `prefix` varchar(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `prefix`, `sort_order`, `status`) VALUES
(1, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 'en', 1, 1),
(2, 'Українська', 'uk-ua', 'uk_UA.UTF-8,uk_ua,ukrainian', '', '', 'ua', 2, 1),
(3, 'Русский', 'ru-ru', 'ru_RU.UTF-8,ru_RU,russian', '', '', 'ru', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'account', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(67, 1, 'carousel.29', 'content_top', 3),
(66, 1, 'slideshow.27', 'content_top', 1),
(65, 1, 'featured.28', 'content_top', 2),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(42, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '0.10000000'),
(3, '10.00000000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 3, 'Сантиметр', 'см'),
(2, 3, 'Миллиметр', 'мм'),
(3, 2, 'Метр', 'м'),
(1, 2, 'Сантиметр', 'см'),
(1, 1, 'Centimeter', 'cm'),
(2, 2, 'Міліметр', 'мм'),
(3, 3, 'Метр', 'м'),
(3, 1, 'Meter', 'м'),
(2, 1, 'Millimeter', 'mm');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_description`
--

DROP TABLE IF EXISTS `oc_manufacturer_description`;
CREATE TABLE `oc_manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_description`
--

INSERT INTO `oc_manufacturer_description` (`manufacturer_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(7, 2, 'Hewlett packard UA', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купити Hewlett packard UA', 'Hewlett packard UA H1', '', ''),
(7, 3, 'Hewlett packard RU', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купить Hewlett packard RU', 'Hewlett packard RU H1', '', ''),
(7, 1, 'Hewlett packard', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Buy Hewlett packard RU', 'Hewlett packard H1', '', ''),
(5, 1, 'HTC', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Buy HTC RU', 'HTC H1', '', ''),
(5, 3, 'HTC RU', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купить HTC RU', 'HTC RU H1', '', ''),
(5, 2, 'HTC UA', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купити HTC UA', 'HTC UA H1', '', ''),
(6, 1, 'Palm', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Buy Palm', 'Palm H1', '', ''),
(6, 3, 'Palm RU', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купить Palm RU', 'Palm RU H1', '', ''),
(6, 2, 'Palm UA', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купити Palm UA', 'Palm UA H1', '', ''),
(8, 1, 'Apple', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Buy Apple', 'Apple H1', '', ''),
(8, 3, 'Apple RU', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купить Apple RU', 'Apple RU H1', '', ''),
(8, 2, 'Apple UA', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купити Apple UA', 'Apple UA H1', '', ''),
(9, 1, 'Canon', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Buy Canon', 'Canon H1', '', ''),
(9, 3, 'Canon RU', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купить Canon RU', 'Canon RU H1', '', ''),
(9, 2, 'Canon UA', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купити Canon UA', 'Canon UA H1', '', ''),
(10, 1, 'Sony', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Buy Sony', 'Sony H1', '', ''),
(10, 3, 'Sony RU', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купить Sony RU', 'Sony RU H1', '', ''),
(10, 2, 'Sony UA', '&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-weight: 700; text-align: right;&quot;&gt;Описание&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Купити Sony UA', 'Sony UA H1', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 4, 'Radio'),
(2, 4, 'Checkbox'),
(4, 4, 'Text'),
(6, 4, 'Textarea'),
(8, 4, 'Date'),
(7, 4, 'File'),
(5, 4, 'Select'),
(9, 4, 'Time'),
(10, 4, 'Date &amp; Time'),
(12, 4, 'Delivery Date'),
(11, 4, 'Size'),
(1, 5, 'Radio'),
(2, 5, 'Checkbox'),
(4, 5, 'Text'),
(6, 5, 'Textarea'),
(8, 5, 'Date'),
(7, 5, 'File'),
(5, 5, 'Select'),
(9, 5, 'Time'),
(10, 5, 'Date &amp; Time'),
(12, 5, 'Delivery Date'),
(11, 5, 'Size'),
(1, 6, 'Radio'),
(2, 6, 'Checkbox'),
(4, 6, 'Text'),
(6, 6, 'Textarea'),
(8, 6, 'Date'),
(7, 6, 'File'),
(5, 6, 'Select'),
(9, 6, 'Time'),
(10, 6, 'Date &amp; Time'),
(12, 6, 'Delivery Date'),
(11, 6, 'Size'),
(1, 7, 'Radio'),
(2, 7, 'Checkbox'),
(4, 7, 'Text'),
(6, 7, 'Textarea'),
(8, 7, 'Date'),
(7, 7, 'File'),
(5, 7, 'Select'),
(9, 7, 'Time'),
(10, 7, 'Date &amp; Time'),
(12, 7, 'Delivery Date'),
(11, 7, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size'),
(1, 3, 'Radio'),
(2, 3, 'Checkbox'),
(4, 3, 'Text'),
(6, 3, 'Textarea'),
(8, 3, 'Date'),
(7, 3, 'File'),
(5, 3, 'Select'),
(9, 3, 'Time'),
(10, 3, 'Date &amp; Time'),
(12, 3, 'Delivery Date'),
(11, 3, 'Size');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(24, 2, '', 2),
(23, 2, '', 1),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 5, 2, 'Checkbox 4'),
(45, 4, 2, 'Checkbox 4'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(45, 1, 2, 'Checkbox 4'),
(44, 5, 2, 'Checkbox 3'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 4, 1, 'Large'),
(32, 4, 1, 'Small'),
(44, 4, 2, 'Checkbox 3'),
(44, 1, 2, 'Checkbox 3'),
(31, 4, 1, 'Medium'),
(42, 4, 5, 'Yellow'),
(41, 4, 5, 'Green'),
(39, 4, 5, 'Red'),
(40, 4, 5, 'Blue'),
(24, 5, 2, 'Checkbox 2'),
(24, 4, 2, 'Checkbox 2'),
(48, 4, 11, 'Large'),
(47, 4, 11, 'Medium'),
(46, 4, 11, 'Small'),
(43, 5, 1, 'Large'),
(32, 5, 1, 'Small'),
(24, 1, 2, 'Checkbox 2'),
(23, 5, 2, 'Checkbox 1'),
(31, 5, 1, 'Medium'),
(42, 5, 5, 'Yellow'),
(41, 5, 5, 'Green'),
(39, 5, 5, 'Red'),
(40, 5, 5, 'Blue'),
(23, 4, 2, 'Checkbox 1'),
(23, 1, 2, 'Checkbox 1'),
(48, 5, 11, 'Large'),
(47, 5, 11, 'Medium'),
(46, 5, 11, 'Small'),
(43, 6, 1, 'Large'),
(32, 6, 1, 'Small'),
(31, 6, 1, 'Medium'),
(42, 6, 5, 'Yellow'),
(41, 6, 5, 'Green'),
(39, 6, 5, 'Red'),
(40, 6, 5, 'Blue'),
(45, 6, 2, 'Checkbox 4'),
(48, 6, 11, 'Large'),
(47, 6, 11, 'Medium'),
(46, 6, 11, 'Small'),
(44, 6, 2, 'Checkbox 3'),
(24, 6, 2, 'Checkbox 2'),
(23, 6, 2, 'Checkbox 1'),
(43, 7, 1, 'Large'),
(32, 7, 1, 'Small'),
(31, 7, 1, 'Medium'),
(42, 7, 5, 'Yellow'),
(41, 7, 5, 'Green'),
(39, 7, 5, 'Red'),
(40, 7, 5, 'Blue'),
(45, 7, 2, 'Checkbox 4'),
(48, 7, 11, 'Large'),
(47, 7, 11, 'Medium'),
(46, 7, 11, 'Small'),
(44, 7, 2, 'Checkbox 3'),
(24, 7, 2, 'Checkbox 2'),
(23, 7, 2, 'Checkbox 1'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(45, 2, 2, 'Checkbox 4'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small'),
(44, 2, 2, 'Checkbox 3'),
(24, 2, 2, 'Checkbox 2'),
(23, 2, 2, 'Checkbox 1'),
(43, 3, 1, 'Large'),
(32, 3, 1, 'Small'),
(31, 3, 1, 'Medium'),
(42, 3, 5, 'Yellow'),
(41, 3, 5, 'Green'),
(39, 3, 5, 'Red'),
(40, 3, 5, 'Blue'),
(45, 3, 2, 'Checkbox 4'),
(48, 3, 11, 'Large'),
(47, 3, 11, 'Medium'),
(46, 3, 11, 'Small'),
(44, 3, 2, 'Checkbox 3'),
(24, 3, 2, 'Checkbox 2'),
(23, 3, 2, 'Checkbox 1');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring`
--

DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring_transaction`
--

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_shipment`
--

DROP TABLE IF EXISTS `oc_order_shipment`;
CREATE TABLE `oc_order_shipment` (
  `order_shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `color` varchar(7) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`, `color`) VALUES
(2, 3, 'Принято', '#1bff16'),
(3, 3, 'Доставлено', '#26b869'),
(7, 3, 'Отменен', '#f50eec'),
(5, 3, 'Укомплектован', '#7198fc'),
(8, 3, 'Отказ', '#cc4920'),
(9, 3, 'Отмена возврата', ''),
(10, 3, 'Ошибочный', '#ff0000'),
(11, 3, 'Возвращено', ''),
(12, 3, 'Возвращенный', ''),
(13, 3, 'Повторно', ''),
(16, 3, 'Аннулирован', '#000000'),
(15, 3, 'В процессе', '#0b13e3'),
(14, 3, 'Прострочен', ''),
(2, 1, 'Processing', '#1bff16'),
(9, 1, 'Canceled Reversal', ''),
(11, 1, 'Refunded', ''),
(12, 1, 'Reversed', ''),
(13, 1, 'Chargeback', ''),
(1, 1, 'Pending', '#fff502'),
(14, 1, 'Expired', ''),
(7, 1, 'Canceled', '#f50eec'),
(9, 2, 'Відмова повернення', ''),
(13, 2, 'Повторно', ''),
(5, 1, 'Complete', '#7198fc'),
(8, 1, 'Denied', '#cc4920'),
(14, 2, 'Протерміновано', ''),
(10, 1, 'Failed', '#ff0000'),
(1, 3, 'В ожидании', '#fff502'),
(15, 1, 'Processed', '#0b13e3'),
(11, 2, 'Повернуто', ''),
(12, 2, 'Повернутий', ''),
(3, 1, 'Shipped', '#26b869'),
(16, 1, 'Voided', '#000000'),
(3, 2, 'Доставлено', '#26b869'),
(8, 2, 'Відмова', '#cc4920'),
(15, 2, 'В процессі', '#0b13e3'),
(1, 2, 'В очікуванні', '#fff502'),
(16, 2, 'Анульований', '#000000'),
(7, 2, 'Відмінено', '#f50eec'),
(5, 2, 'Укомплектовано', '#7198fc'),
(10, 2, 'Помилковий', '#ff0000'),
(2, 2, 'Прийнято', '#1bff16');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_voucher`
--

DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2009-02-03 16:06:50', '2019-03-25 20:26:57'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:59:00', '2019-03-25 20:26:46'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2019-03-25 20:28:10'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2019-03-25 20:27:39'),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2019-03-25 20:27:29'),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 4, '2009-02-03 21:07:12', '2019-03-25 20:21:16'),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2009-02-03 21:07:26', '2019-03-25 20:27:06'),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 4, '2009-02-03 21:07:37', '2019-03-25 20:31:32'),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2019-03-25 20:27:50'),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2019-03-25 20:27:59'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 0, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2019-03-25 20:27:19'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2011-04-26 08:57:34', '2011-09-30 01:06:23');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_advertise_google`
--

DROP TABLE IF EXISTS `oc_product_advertise_google`;
CREATE TABLE `oc_product_advertise_google` (
  `product_advertise_google_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `has_issues` tinyint(1) DEFAULT NULL,
  `destination_status` enum('pending','approved','disapproved') NOT NULL DEFAULT 'pending',
  `impressions` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `conversions` int(11) NOT NULL DEFAULT '0',
  `cost` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `conversion_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `google_product_category` varchar(10) DEFAULT NULL,
  `condition` enum('new','refurbished','used') DEFAULT NULL,
  `adult` tinyint(1) DEFAULT NULL,
  `multipack` int(11) DEFAULT NULL,
  `is_bundle` tinyint(1) DEFAULT NULL,
  `age_group` enum('newborn','infant','toddler','kids','adult') DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `gender` enum('male','female','unisex') DEFAULT NULL,
  `size_type` enum('regular','petite','plus','big and tall','maternity') DEFAULT NULL,
  `size_system` enum('AU','BR','CN','DE','EU','FR','IT','JP','MEX','UK','US') DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_advertise_google_status`
--

DROP TABLE IF EXISTS `oc_product_advertise_google_status`;
CREATE TABLE `oc_product_advertise_google_status` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `product_variation_id` varchar(64) NOT NULL DEFAULT '',
  `destination_statuses` text NOT NULL,
  `data_quality_issues` text NOT NULL,
  `item_level_issues` text NOT NULL,
  `google_expiration_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_advertise_google_target`
--

DROP TABLE IF EXISTS `oc_product_advertise_google_target`;
CREATE TABLE `oc_product_advertise_google_target` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 4, 1, '16GB'),
(43, 4, 1, '8gb'),
(47, 2, 1, '4'),
(43, 2, 4, '1'),
(47, 4, 4, '16GB'),
(43, 4, 4, '8gb'),
(47, 2, 4, '4'),
(43, 2, 5, '1'),
(47, 4, 5, '16GB'),
(43, 4, 5, '8gb'),
(42, 3, 3, '100mhz'),
(47, 2, 5, '4'),
(43, 2, 6, '1'),
(47, 4, 6, '16GB'),
(43, 4, 6, '8gb'),
(42, 3, 2, '100mhz'),
(47, 2, 6, '4'),
(43, 2, 7, '1'),
(47, 4, 7, '16GB'),
(43, 4, 7, '8gb'),
(42, 3, 1, '100mhz'),
(47, 2, 7, '4'),
(43, 2, 2, '1'),
(47, 4, 2, '16GB'),
(43, 4, 2, '8gb'),
(47, 2, 2, '4'),
(43, 2, 3, '1'),
(47, 4, 3, '16GB'),
(43, 4, 3, '8gb'),
(47, 2, 3, '4');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', ''),
(35, 4, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(29, 4, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(46, 4, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 4, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(33, 4, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 4, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 4, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(49, 4, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', ''),
(35, 5, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(48, 3, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', '', ''),
(40, 3, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', '', ''),
(28, 3, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '	 HTC Touch HD', '', '', ''),
(44, 3, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', '', ''),
(45, 3, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', '', ''),
(29, 5, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(36, 3, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', '', ''),
(46, 5, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 5, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(32, 3, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '	 iPod Touch', '', '', ''),
(41, 3, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', '', ''),
(33, 5, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 5, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 5, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(31, 3, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', '', ''),
(49, 5, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', ''),
(42, 3, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30', '', '', ''),
(30, 3, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'sdf', '', '', ''),
(35, 6, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(48, 2, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', '', ''),
(40, 2, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', '', ''),
(28, 2, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '	 HTC Touch HD', '', '', ''),
(44, 2, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(45, 2, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', '', ''),
(29, 6, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(36, 2, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', '', ''),
(46, 6, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 6, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(32, 2, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '	 iPod Touch', '', '', ''),
(41, 2, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', '', ''),
(33, 6, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 6, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 6, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(31, 2, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', '', ''),
(49, 6, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', ''),
(42, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30', '', '', ''),
(30, 2, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'sdf', '', '', ''),
(35, 7, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '	 HTC Touch HD', '', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', '', ''),
(29, 7, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', '', ''),
(46, 7, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 7, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '	 iPod Touch', '', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', '', ''),
(33, 7, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 7, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 7, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', '', ''),
(49, 7, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30', '', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'sdf', '', '', ''),
(35, 2, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(29, 2, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(46, 2, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 2, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 2, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 2, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', ''),
(35, 3, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(29, 3, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(46, 3, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 3, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(33, 3, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 3, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 3, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(49, 3, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(449, 42, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(448, 42, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(447, 42, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2371, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2373, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2375, 41, 'catalog/demo/imac_2.jpg', 0),
(2364, 40, 'catalog/demo/iphone_4.jpg', 0),
(2382, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2381, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2388, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(2387, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2386, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(2391, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(2390, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(2394, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(2393, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(2398, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(2397, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(2378, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(2377, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(2363, 40, 'catalog/demo/iphone_3.jpg', 0),
(2362, 40, 'catalog/demo/iphone_5.jpg', 0),
(2370, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2372, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2374, 41, 'catalog/demo/imac_3.jpg', 0),
(2361, 40, 'catalog/demo/iphone_2.jpg', 0),
(2360, 40, 'catalog/demo/iphone_6.jpg', 0),
(2376, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(2380, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2379, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2385, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(2384, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2383, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(2389, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(2392, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(2396, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(2395, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2408, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2407, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2406, 42, 'catalog/demo/hp_1.jpg', 0),
(2405, 42, 'catalog/demo/canon_logo.jpg', 0),
(2404, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(222, 42, 7, '', 1),
(219, 42, 8, '2011-02-20', 1),
(208, 42, 4, 'test', 1),
(218, 42, 1, '', 1),
(217, 42, 5, '', 1),
(226, 30, 5, '', 1),
(209, 42, 6, '', 1),
(223, 42, 2, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(16, 226, 30, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(15, 226, 30, 5, 39, 2, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_recurring`
--

DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(556, 42, 1, 100),
(519, 47, 1, 300),
(552, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(551, 30, 1, 200),
(553, 44, 1, 700),
(554, 45, 1, 800),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(353, 34, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(452, 42, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(450, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(449, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(28, 24, 1),
(28, 20, 0),
(29, 20, 0),
(29, 24, 0),
(30, 33, 0),
(30, 20, 1),
(31, 33, 1),
(32, 34, 1),
(33, 20, 0),
(33, 28, 0),
(34, 34, 0),
(35, 20, 0),
(36, 34, 1),
(40, 24, 0),
(40, 20, 1),
(41, 27, 1),
(42, 28, 0),
(42, 20, 1),
(43, 18, 0),
(43, 20, 0),
(44, 20, 0),
(44, 18, 1),
(45, 18, 1),
(46, 18, 0),
(46, 20, 0),
(47, 18, 0),
(47, 20, 0),
(48, 34, 0),
(48, 20, 1),
(49, 57, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(30, 0, 0),
(40, 0, 0),
(42, 0, 0),
(28, 0, 0),
(41, 0, 0),
(48, 0, 0),
(36, 0, 0),
(32, 0, 0),
(44, 0, 0),
(45, 0, 0),
(31, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring`
--

DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring_description`
--

DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 4, 'Возвращено'),
(2, 4, 'Кредит выдан'),
(3, 4, 'Замена отправлена'),
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(2, 5, 'Кредит видано'),
(1, 5, 'Повернуто'),
(3, 5, 'Заміна відправлена'),
(1, 6, 'Refunded'),
(2, 6, 'Credit Issued'),
(3, 6, 'Replacement Sent'),
(1, 7, 'Refunded'),
(2, 7, 'Credit Issued'),
(3, 7, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent'),
(1, 3, 'Refunded'),
(2, 3, 'Credit Issued'),
(3, 3, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 4, 'Брак при приемке'),
(2, 4, 'Получен другой товар'),
(3, 4, 'Ошибка заказа'),
(4, 4, 'Неисправность, предоставить информацию'),
(5, 4, 'Другое, укажите детали'),
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 5, 'Брак при прийомці'),
(4, 5, 'Недолік, надати інформацію'),
(3, 5, 'Помилка замовлення'),
(5, 5, 'Інше, вкажіть деталі'),
(2, 5, 'Отримано інший товар'),
(1, 6, 'Dead On Arrival'),
(2, 6, 'Received Wrong Item'),
(3, 6, 'Order Error'),
(4, 6, 'Faulty, please supply details'),
(5, 6, 'Other, please supply details'),
(1, 7, 'Dead On Arrival'),
(2, 7, 'Received Wrong Item'),
(3, 7, 'Order Error'),
(4, 7, 'Faulty, please supply details'),
(5, 7, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details'),
(1, 3, 'Dead On Arrival'),
(2, 3, 'Received Wrong Item'),
(3, 3, 'Order Error'),
(4, 3, 'Faulty, please supply details'),
(5, 3, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 4, 'Обработка'),
(3, 4, 'Укомплектовано'),
(2, 4, 'Ожидание товара'),
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(2, 5, 'Очікування товару'),
(1, 5, 'Обробка'),
(3, 5, 'Укомплектовано'),
(1, 6, 'Pending'),
(3, 6, 'Complete'),
(2, 6, 'Awaiting Products'),
(1, 7, 'Pending'),
(3, 7, 'Complete'),
(2, 7, 'Awaiting Products'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products'),
(1, 3, 'Pending'),
(3, 3, 'Complete'),
(2, 3, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_seo_url`
--

DROP TABLE IF EXISTS `oc_seo_url`;
CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_seo_url`
--

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(1091, 0, 3, 'product_id=48', 'ipod-classic-ru'),
(1045, 0, 3, 'category_id=27', 'mac-ru'),
(1044, 0, 1, 'category_id=27', 'mac'),
(975, 0, 1, 'manufacturer_id=8', 'apple'),
(1151, 0, 3, 'information_id=4', 'about-us-ru'),
(1031, 0, 2, 'category_id=25', 'component-ua'),
(1034, 0, 2, 'category_id=28', 'monitor-ua'),
(1037, 0, 2, 'category_id=35', 'test1-ua'),
(1038, 0, 1, 'category_id=32', 'web-camera'),
(1049, 0, 2, 'category_id=17', 'software-ua'),
(1048, 0, 3, 'category_id=17', 'software-ru'),
(1046, 0, 2, 'category_id=27', 'mac-ua'),
(1028, 0, 2, 'category_id=33', 'cameras-ua'),
(1081, 0, 1, 'checkout/onepagecheckout', 'onepagecheckout'),
(1097, 0, 3, 'product_id=32', 'ipod-touch-ru'),
(972, 0, 1, 'manufacturer_id=9', 'canon'),
(978, 0, 1, 'manufacturer_id=5', 'htc'),
(971, 0, 2, 'manufacturer_id=7', 'hewlett-packard-ua'),
(981, 0, 1, 'manufacturer_id=6', 'palm'),
(984, 0, 1, 'manufacturer_id=10', 'sony'),
(1152, 0, 1, 'information_id=6', 'delivery-en'),
(1157, 0, 1, 'information_id=3', 'privacy-en'),
(1160, 0, 1, 'information_id=5', 'terms-en'),
(1080, 0, 3, 'checkout/onepagecheckout', 'onepagecheckout'),
(1088, 0, 3, 'product_id=40', 'iphone-ru'),
(1087, 0, 2, 'product_id=40', 'iphone-ua'),
(1086, 0, 1, 'product_id=40', 'iphone'),
(1077, 0, 1, 'information/sitemap', 'sitemap'),
(1078, 0, 3, 'information/sitemap', 'sitemap'),
(1079, 0, 2, 'information/sitemap', 'sitemap'),
(1090, 0, 2, 'product_id=48', 'ipod-classic-ua'),
(1089, 0, 1, 'product_id=48', 'ipod-classic'),
(1094, 0, 3, 'product_id=36', 'ipod-nano-ru'),
(1093, 0, 2, 'product_id=36', 'ipod-nano-ua'),
(1092, 0, 1, 'product_id=36', 'ipod-nano-en'),
(1096, 0, 2, 'product_id=32', 'ipod-touch-ua'),
(1095, 0, 1, 'product_id=32', 'ipod-touch-en'),
(1070, 0, 2, 'product_id=43', 'macbook-ua'),
(1068, 0, 1, 'product_id=43', 'macbook-en'),
(1069, 0, 3, 'product_id=43', 'macbook-ru'),
(1082, 0, 2, 'checkout/onepagecheckout', 'onepagecheckout'),
(1071, 0, 1, 'product_id=49', 'samsung-galaxy-tab-10-1-en'),
(1072, 0, 3, 'product_id=49', 'samsung-galaxy-tab-10-1-ru'),
(1073, 0, 2, 'product_id=49', 'samsung-galaxy-tab-10-1-ua'),
(1027, 0, 3, 'category_id=33', 'cameras-ru'),
(1026, 0, 1, 'category_id=33', 'cameras'),
(1030, 0, 3, 'category_id=25', 'component-ru'),
(1029, 0, 1, 'category_id=25', 'component'),
(1105, 0, 2, 'category_id=20', 'desktops-ua'),
(1104, 0, 1, 'category_id=20', 'desktops'),
(1040, 0, 2, 'category_id=32', 'web-camera-ua'),
(1039, 0, 3, 'category_id=32', 'web-camera-ru'),
(1047, 0, 1, 'category_id=17', 'software'),
(1033, 0, 3, 'category_id=28', 'monitor-ru'),
(1032, 0, 1, 'category_id=28', 'monitor'),
(1036, 0, 3, 'category_id=35', 'test1-ru'),
(1035, 0, 1, 'category_id=35', 'test1'),
(956, 0, 1, 'common/home', ''),
(957, 0, 3, 'common/home', ''),
(958, 0, 2, 'common/home', ''),
(970, 0, 3, 'manufacturer_id=7', 'hewlett-packard-ru'),
(969, 0, 1, 'manufacturer_id=7', 'hewlett-packard'),
(973, 0, 3, 'manufacturer_id=9', 'canon-ru'),
(974, 0, 2, 'manufacturer_id=9', 'canon-ua'),
(976, 0, 3, 'manufacturer_id=8', 'apple-ru'),
(977, 0, 2, 'manufacturer_id=8', 'apple-ua'),
(979, 0, 3, 'manufacturer_id=5', 'htc-ru'),
(980, 0, 2, 'manufacturer_id=5', 'htc-ua'),
(982, 0, 3, 'manufacturer_id=6', 'palm-ru'),
(983, 0, 2, 'manufacturer_id=6', 'palm-ua'),
(985, 0, 3, 'manufacturer_id=10', 'sony-ru'),
(986, 0, 2, 'manufacturer_id=10', 'sony-ua'),
(987, 0, 1, 'product/manufacturer', 'brands-en'),
(988, 0, 3, 'product/manufacturer', 'brands'),
(989, 0, 2, 'product/manufacturer', 'brands-ua'),
(1150, 0, 2, 'information_id=4', 'about-us-ua'),
(1149, 0, 1, 'information_id=4', 'about-us'),
(1002, 0, 1, 'product/special', 'special'),
(1003, 0, 3, 'product/special', 'special'),
(1004, 0, 2, 'product/special', 'special'),
(1005, 0, 1, 'account/login', 'login'),
(1006, 0, 3, 'account/login', 'login'),
(1007, 0, 2, 'account/login', 'login'),
(1008, 0, 1, 'information/contact', 'contact'),
(1009, 0, 3, 'information/contact', 'contact-ru'),
(1010, 0, 2, 'information/contact', 'contact-ua'),
(1011, 0, 1, 'product/search', 'search'),
(1012, 0, 3, 'product/search', 'poisk'),
(1013, 0, 2, 'product/search', 'poshyk'),
(1014, 0, 1, 'checkout/cart', 'cart'),
(1015, 0, 3, 'checkout/cart', 'korzina'),
(1016, 0, 2, 'checkout/cart', 'koshuk'),
(1083, 0, 1, 'checkout/zakaz', 'order'),
(1084, 0, 2, 'checkout/zakaz', 'zamovlenna'),
(1085, 0, 3, 'checkout/zakaz', 'zakaz'),
(1098, 0, 1, 'category_id=36', 'test-2'),
(1099, 0, 2, 'category_id=36', 'test-2-ua'),
(1100, 0, 3, 'category_id=36', 'test-2-ru'),
(1101, 0, 1, 'product_id=42', 'apple-cinema'),
(1102, 0, 2, 'product_id=42', 'apple-cinema-ua'),
(1103, 0, 3, 'product_id=42', 'apple-cinema-ru'),
(1106, 0, 3, 'category_id=20', 'desktops-ru'),
(1107, 0, 1, 'account/return/add', 'return'),
(1108, 0, 3, 'account/return/add', 'vozvrat'),
(1109, 0, 2, 'account/return/add', 'povernennya'),
(1110, 0, 1, 'account/voucher', 'voucher'),
(1111, 0, 3, 'account/voucher', 'vaycheru'),
(1112, 0, 2, 'account/voucher', 'vaycher'),
(1113, 0, 1, 'affiliate/login', 'affiliate'),
(1114, 0, 3, 'affiliate/login', 'partnerka'),
(1115, 0, 2, 'affiliate/login', 'partnerstvo'),
(1116, 0, 1, 'account/wishlist', 'wishlist'),
(1117, 0, 3, 'account/wishlist', 'zakladki'),
(1118, 0, 2, 'account/wishlist', 'ylybleni'),
(1119, 0, 1, 'account/account', 'account'),
(1120, 0, 2, 'account/account', 'cabinet'),
(1121, 0, 3, 'account/account', 'kabinet'),
(1122, 0, 1, 'account/register', 'registration'),
(1123, 0, 3, 'account/register', 'registraciya'),
(1124, 0, 2, 'account/register', 'reestraciya'),
(1125, 0, 1, 'product/compare', 'comparision'),
(1126, 0, 3, 'product/compare', 'sravnenie'),
(1127, 0, 2, 'product/compare', 'porivnannya'),
(1128, 0, 1, 'account/newsletter', 'newsletter'),
(1129, 0, 3, 'account/newsletter', 'podpiska'),
(1130, 0, 2, 'account/newsletter', 'pidpuska'),
(1131, 0, 1, 'account/order', 'my-orders'),
(1132, 0, 3, 'account/order', 'moi-zakazu'),
(1133, 0, 2, 'account/order', 'moi-zamovlennya'),
(1134, 0, 1, 'account/forgotten', 'forgotten'),
(1135, 0, 3, 'account/forgotten', 'sbros'),
(1136, 0, 2, 'account/forgotten', 'reset'),
(1137, 0, 1, 'account/address', 'address'),
(1138, 0, 3, 'account/address', 'addres'),
(1139, 0, 2, 'account/address', 'addresa'),
(1140, 0, 1, 'account/download', 'downloads'),
(1141, 0, 3, 'account/download', 'skachat'),
(1142, 0, 2, 'account/download', 'zavantazhutu'),
(1143, 0, 1, 'account/transaction', 'transactions'),
(1144, 0, 2, 'account/transaction', 'platezhi'),
(1145, 0, 3, 'account/transaction', 'scheta'),
(1146, 0, 1, 'account/reward', 'rewards'),
(1147, 0, 3, 'account/reward', 'bunysa'),
(1148, 0, 2, 'account/reward', 'bonysu'),
(1153, 0, 2, 'information_id=6', 'delivery-ua'),
(1154, 0, 3, 'information_id=6', 'delivery-ru'),
(1158, 0, 2, 'information_id=3', 'privacy-ua'),
(1159, 0, 3, 'information_id=3', 'privacy-ru'),
(1161, 0, 2, 'information_id=5', 'terms-ua'),
(1162, 0, 3, 'information_id=5', 'terms-ru');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_session`
--

DROP TABLE IF EXISTS `oc_session`;
CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_session`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(797, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(1786, 0, 'developer', 'developer_sass', '0', 0),
(2303, 0, 'shipping_pickup', 'shipping_pickup_geo_zone_id', '0', 0),
(2302, 0, 'shipping_free', 'shipping_free_sort_order', '2', 0),
(2301, 0, 'shipping_free', 'shipping_free_status', '1', 0),
(2300, 0, 'shipping_free', 'shipping_free_geo_zone_id', '0', 0),
(2299, 0, 'shipping_free', 'shipping_free_total', '15', 0),
(2924, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_home_status', '1', 0),
(3346, 0, 'config', 'config_secure', '0', 0),
(3347, 0, 'config', 'config_password', '1', 0),
(3348, 0, 'config', 'config_shared', '0', 0),
(3349, 0, 'config', 'config_encryption', 'W2kY44qm6Ml4pVB8kZqxq8iC6H9bV2rnOmUNNE85lIpIEpaueBB0gEbZMNI892EZlt9XGuGMjRziBKG5IbTQQeF3GNlKUw9E4t7GZeUPxeNvyqTJZpWmOVMH1nPKKmq4OuRGOVDLKXriGKfY0CKtkxCax8RKEyVVAPYjYAqeeoTqYnOmGCinELBjRsi3i4BeDggKhqVN7UvGFRwcSmkVMKVfOtQOyCHMm5HSEuzHceN302aFiOuCmDovDYSsc54izdIJf1qd3cyzTJA8w0XEDnzggEZ2cW69C6VJDFZR93fYSOJvxd8aKcLtcLPC3529nd4WnVGTBpIOqscSOXBMpCOFq8mdQxJnF1OQKOWqR6QTGIpDrnKOcQyWVktbo9ouhM1LJr7W1SIo54w7j4MWAYCk0JErjKHwpQI0b1XvfGtYMiSev5bM2ykierYTOlNhMrMY17EhDIjGHuSEa2YrFzAeSGcfbCBLCt8vhoYTa9u1oLmGnAYMVgBS5YF7FOJUknM9l0YeeBxAo58ab2ABuxBGqfC4mqjzN696LfHzw0H21VQqx1oy2IQdeM1sYmiLVojJXK7dvRLo4rEYsRb5RdVQHgihMuspwQEvIAMvc78z9P2gHNrwHwFkuHqmKFAtrXBPn9JeYkztFg6QK6aGexSunSkYbePRut5vObWZYR62CaXcLSHTbwp1M0ColRDU7qQqF9xwgDVAcFriTQtbTpcBzA7OvIf4aORB1wYLOPCR64djx2o3agapV2USuoBWQsLsZROw16SkEfg8DbXrgVdHKYEnALatLvKs0zWklbAmoo6RHCYJEHTR1JPFI0PPgX3PW5CvUnewvIDEr0qnLDKwip8apYoHCuI3iWL6JhwEDj4XQg6pcOIxEHkUPVoguHati8xrU8ok2w2v6JwuoontsOjyZ9FHp6ebXiSh26zGy3gwjCBJvtEe2Lem3qG5fFYaDPrajFDdIPyxCDwutOenfN35WgzDshLOUGRvN3uKQ1XJE3LbkiL31PNCWw0I', 0),
(4, 0, 'voucher', 'total_voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'total_voucher_status', '1', 0),
(3342, 0, 'config', 'config_seo_url_prefix', '1', 0),
(3343, 0, 'config', 'config_seo_url_syfix', '/', 0),
(3344, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(3353, 0, 'config', 'config_error_display', '1', 0),
(3350, 0, 'config', 'config_file_max_size', '300000', 0),
(3351, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(3352, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(3345, 0, 'config', 'config_compression', '0', 0),
(3340, 0, 'config', 'config_seo_url_postfix', '.html', 0),
(3341, 0, 'config', 'config_seo_url_prefix_def', '0', 0),
(3339, 0, 'config', 'config_seo_url_one', '0', 0),
(95, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(96, 0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(98, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(99, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(100, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(101, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(102, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(103, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(104, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(105, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(106, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '9', 0),
(107, 0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(108, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(109, 0, 'total_sub_total', 'sub_total_sort_order', '1', 0),
(110, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(111, 0, 'total_tax', 'total_tax_status', '1', 0),
(112, 0, 'total_total', 'total_total_sort_order', '9', 0),
(113, 0, 'total_total', 'total_total_status', '1', 0),
(114, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(115, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(116, 0, 'total_credit', 'total_credit_status', '1', 0),
(117, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(118, 0, 'total_reward', 'total_reward_status', '1', 0),
(119, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(120, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(121, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(122, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(123, 0, 'module_category', 'module_category_status', '1', 0),
(124, 0, 'module_account', 'module_account_status', '1', 0),
(1267, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(1266, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(1265, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(1264, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(1263, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(1262, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(1261, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(1260, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(1259, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(1258, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(1257, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(1256, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(1255, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(1254, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(1253, 0, 'theme_default', 'theme_default_product_limit', '5', 0),
(1252, 0, 'theme_default', 'theme_default_version', '3.0.3.1', 0),
(1251, 0, 'theme_default', 'theme_default_ext', 'twig', 0),
(1250, 0, 'theme_default', 'theme_default_status', '1', 0),
(1249, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(149, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(151, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(153, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(155, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(796, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(795, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(159, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(160, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(161, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(162, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(164, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(165, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(166, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(794, 0, 'dashboard_map', 'dashboard_map_regions', '1', 0),
(168, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(169, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(171, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(172, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(173, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(174, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(175, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(176, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(177, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(178, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(179, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(180, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(181, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(182, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(183, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(184, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(185, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(186, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(187, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(188, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(189, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(190, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(191, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(192, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(193, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(194, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(195, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(196, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(197, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(198, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(1785, 0, 'developer', 'developer_theme', '0', 0),
(3338, 0, 'config', 'config_seo_url_include_path', 'last', 0),
(3337, 0, 'config', 'config_seo_url_type', 'seo_bro', 0),
(3336, 0, 'config', 'config_seo_url', '0', 0),
(3335, 0, 'config', 'config_simple_order', '1', 0),
(3334, 0, 'config', 'config_marketplace', '0', 0),
(3333, 0, 'config', 'config_maintenance', '0', 0),
(3332, 0, 'config', 'config_mail_alert_email', '', 0),
(3331, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(3330, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(3329, 0, 'config', 'config_mail_smtp_port', '25', 0),
(3328, 0, 'config', 'config_mail_smtp_password', '', 0),
(3327, 0, 'config', 'config_mail_smtp_username', '', 0),
(3325, 0, 'config', 'config_mail_parameter', '', 0),
(3326, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(3324, 0, 'config', 'config_mail_engine', 'mail', 0),
(3323, 0, 'config', 'config_watermark', 'catalog/shop-maker-22.png', 0),
(3321, 0, 'config', 'config_icon', 'catalog/shop-maker-22.png', 0),
(793, 0, 'dashboard_map', 'dashboard_map_js', 'jquery.vmap.russia', 0),
(3322, 0, 'config', 'config_watermark_global', '0', 0),
(3318, 0, 'config', 'config_captcha', '', 0),
(3319, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(3320, 0, 'config', 'config_logo', '{\"1\":\"catalog\\/opencart-logo.png\",\"2\":\"catalog\\/brocart-logo.png\",\"3\":\"catalog\\/ocstore-logo.png\"}', 1),
(3316, 0, 'config', 'config_return_id', '0', 0),
(3317, 0, 'config', 'config_return_status_id', '2', 0),
(1268, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(1269, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(1270, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(1271, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(1272, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(1273, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(1274, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(3315, 0, 'config', 'config_affiliate_id', '0', 0),
(3314, 0, 'config', 'config_affiliate_commission', '5', 0),
(3313, 0, 'config', 'config_affiliate_auto', '0', 0),
(3311, 0, 'config', 'config_affiliate_group_id', '1', 0),
(3312, 0, 'config', 'config_affiliate_approval', '0', 0),
(3309, 0, 'config', 'config_stock_warning', '0', 0),
(3310, 0, 'config', 'config_stock_checkout', '0', 0),
(3308, 0, 'config', 'config_stock_display', '0', 0),
(3307, 0, 'config', 'config_api_id', '3', 0),
(3306, 0, 'config', 'config_fraud_status_id', '7', 0),
(3305, 0, 'config', 'config_complete_status', '[\"3\",\"5\"]', 1),
(3304, 0, 'config', 'config_processing_status', '[\"1\",\"12\",\"3\",\"2\",\"5\"]', 1),
(3301, 0, 'config', 'config_checkout_guest', '1', 0),
(3302, 0, 'config', 'config_checkout_id', '0', 0),
(3303, 0, 'config', 'config_order_status_id', '1', 0),
(3300, 0, 'config', 'config_cart_weight', '0', 0),
(3299, 0, 'config', 'config_invoice_prefix', 'INV-2019-00', 0),
(3298, 0, 'config', 'config_account_id', '3', 0),
(3296, 0, 'config', 'config_customer_price', '0', 0),
(3297, 0, 'config', 'config_login_attempts', '5', 0),
(3295, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(3294, 0, 'config', 'config_customer_group_id', '1', 0),
(3293, 0, 'config', 'config_customer_search', '1', 0),
(3292, 0, 'config', 'config_customer_activity', '0', 0),
(3291, 0, 'config', 'config_customer_online', '0', 0),
(3290, 0, 'config', 'config_tax_customer', 'shipping', 0),
(3289, 0, 'config', 'config_tax_default', 'shipping', 0),
(3288, 0, 'config', 'config_tax', '1', 0),
(3287, 0, 'config', 'config_voucher_max', '1000', 0),
(3286, 0, 'config', 'config_voucher_min', '1', 0),
(1788, 0, 'storage_cleaner', 'storage_cleaner_status', '1', 0),
(2304, 0, 'shipping_pickup', 'shipping_pickup_status', '1', 0),
(2305, 0, 'shipping_pickup', 'shipping_pickup_sort_order', '0', 0),
(2306, 0, 'payment_cheque', 'payment_cheque_payable', 'Получатель', 0),
(2307, 0, 'payment_cheque', 'payment_cheque_total', '15', 0),
(2308, 0, 'payment_cheque', 'payment_cheque_order_status_id', '2', 0),
(2309, 0, 'payment_cheque', 'payment_cheque_geo_zone_id', '0', 0),
(2310, 0, 'payment_cheque', 'payment_cheque_status', '1', 0),
(2311, 0, 'payment_cheque', 'payment_cheque_sort_order', '2', 0),
(3285, 0, 'config', 'config_review_guest', '1', 0),
(2925, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_home_priority', '1', 0),
(2926, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_home_frequency', 'Always', 0),
(2927, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_category_status', '1', 0),
(2928, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_category_priority', 'Always', 0),
(2929, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_category_frequency', '0.7', 0),
(2930, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_manufacturer_status', '1', 0),
(2931, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_manufacturer_priority', 'Daily', 0),
(2932, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_manufacturer_frequency', '0.7', 0),
(2933, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_product_status', '1', 0),
(2934, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_product_priority', '1', 0),
(2935, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_product_frequency', 'Daily', 0),
(2936, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_information_status', '1', 0),
(2937, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_information_priority', '0.5', 0),
(2938, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_information_frequency', 'Weekly', 0),
(2939, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_status', '1', 0),
(2940, 0, 'feed_furious_sitemap', 'feed_furious_sitemap_sitemap_url', 'sitemap.xml', 0),
(3284, 0, 'config', 'config_review_status', '1', 0),
(3283, 0, 'config', 'config_limit_admin', '20', 0),
(3282, 0, 'config', 'config_product_count', '0', 0),
(3281, 0, 'config', 'config_weight_class_id', '1', 0),
(3280, 0, 'config', 'config_length_class_id', '1', 0),
(3279, 0, 'config', 'config_currency_auto', '0', 0),
(3278, 0, 'config', 'config_currency', 'UAH', 0),
(3277, 0, 'config', 'config_admin_language', 'ru-ru', 0),
(3276, 0, 'config', 'config_language', 'ru-ru', 0),
(3275, 0, 'config', 'config_zone_id', '4501', 0),
(3274, 0, 'config', 'config_country_id', '220', 0),
(3273, 0, 'config', 'config_comment', '', 0),
(3272, 0, 'config', 'config_open', '', 0),
(3271, 0, 'config', 'config_image', '', 0),
(3270, 0, 'config', 'config_fax', '', 0),
(3269, 0, 'config', 'config_telephone', '123456789', 0),
(3267, 0, 'config', 'config_geocode', '', 0),
(3268, 0, 'config', 'config_email', 'artour.larin@gmail.com', 0),
(3266, 0, 'config', 'config_address', 'Address 1', 0),
(3265, 0, 'config', 'config_owner', 'Your Name', 0),
(3264, 0, 'config', 'config_name', 'Your Store', 0),
(3263, 0, 'config', 'config_layout_id', '4', 0),
(3262, 0, 'config', 'config_theme', 'default', 0),
(3261, 0, 'config', 'config_meta_keyword_3', 'Мета-тег Keywords Рус', 0),
(3260, 0, 'config', 'config_meta_description_3', 'Мета-тег Description Рус', 0),
(3254, 0, 'config', 'config_meta_description_1', 'Мета-тег Description En', 0),
(3255, 0, 'config', 'config_meta_keyword_1', 'Мета-тег Keywords En', 0),
(3256, 0, 'config', 'config_meta_title_2', 'Мета-тег Title Укр', 0),
(3257, 0, 'config', 'config_meta_description_2', 'Мета-тег Description Укр', 0),
(3258, 0, 'config', 'config_meta_keyword_2', 'Мета-тег Keywords Укр', 0),
(3259, 0, 'config', 'config_meta_title_3', 'Мета-тег Title Рус', 0),
(3253, 0, 'config', 'config_meta_title_1', 'Мета-тег Title En', 0),
(3354, 0, 'config', 'config_error_log', '1', 0),
(3355, 0, 'config', 'config_error_filename', 'error.log', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_shipping_courier`
--

DROP TABLE IF EXISTS `oc_shipping_courier`;
CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_shipping_courier`
--

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_statistics`
--

DROP TABLE IF EXISTS `oc_statistics`;
CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '0.0000'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '0.0000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(6, 3, '2-3 Дня'),
(7, 3, 'В наличии'),
(8, 3, 'Предзаказ'),
(7, 2, 'В наявності'),
(6, 2, '2-3 Дні'),
(7, 1, 'In Stock'),
(5, 3, 'Нет в наличии'),
(6, 1, '2-3 Days'),
(8, 2, 'На замовлення'),
(5, 2, 'Нема в наявності'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Физические товары', 'Облагаемые налогом товары и услуги', '2009-01-06 23:21:53', '2019-01-11 13:35:29'),
(10, 'Цифровые товары', 'Скачиваемые товары', '2011-09-21 22:19:39', '2019-01-11 13:34:50');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'НДС (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2019-01-11 13:36:27'),
(87, 3, 'Eco НАЛОГ (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2019-01-11 13:36:14');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(129, 10, 86, 'payment', 1),
(132, 9, 87, 'shipping', 2),
(131, 9, 86, 'shipping', 1),
(130, 10, 87, 'store', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_theme`
--

DROP TABLE IF EXISTS `oc_theme`;
CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_translation`
--

DROP TABLE IF EXISTS `oc_translation`;
CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/furious_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/storage_cleaner\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/autolux\",\"extension\\/shipping\\/deliveri\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/gunsel\",\"extension\\/shipping\\/intime\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/meest\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/ukrpost\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/seo\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/furious_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/storage_cleaner\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/autolux\",\"extension\\/shipping\\/deliveri\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/gunsel\",\"extension\\/shipping\\/intime\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/meest\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/ukrpost\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/seo\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 4, 'Christmas'),
(7, 4, 'Birthday'),
(8, 4, 'General'),
(6, 5, 'Christmas'),
(7, 5, 'Birthday'),
(8, 5, 'General'),
(6, 6, 'Christmas'),
(7, 6, 'Birthday'),
(8, 6, 'General'),
(6, 7, 'Christmas'),
(7, 7, 'Birthday'),
(8, 7, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General'),
(6, 3, 'Christmas'),
(7, 3, 'Birthday'),
(8, 3, 'General');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(5, 2, 'Фунт', 'lb'),
(1, 3, 'Килограмм', 'кг'),
(2, 3, 'Грамм', 'г'),
(5, 3, 'Фунт', 'lb'),
(6, 3, 'Унция', 'oz'),
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(2, 2, 'Грам', 'г'),
(6, 2, 'Унція', 'oz'),
(1, 2, 'Кілограм', 'кг');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Бадахшан', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Баглан', 'BGL', 1),
(4, 1, 'Балх', 'BAL', 1),
(5, 1, 'Бамиан', 'BAM', 1),
(6, 1, 'Фара', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Газни', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Гильменд', 'HEL', 1),
(11, 1, 'Герат', 'HER', 1),
(12, 1, 'Джаузджан', 'JOW', 1),
(13, 1, 'Кабул', 'KAB', 1),
(14, 1, 'Кандагар', 'KAN', 1),
(15, 1, 'Каписа', 'KAP', 1),
(16, 1, 'Хоста', 'KHO', 1),
(17, 1, 'Конар', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Лагман', 'LAG', 1),
(20, 1, 'Логар', 'LOW', 1),
(21, 1, 'Нангархар', 'NAN', 1),
(22, 1, 'Нимруз', 'NIM', 1),
(23, 1, 'Нуристан', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Пактия', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Сар-э Пол', 'SAR', 1),
(30, 1, 'Тахар', 'TAK', 1),
(31, 1, 'Вардак', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Берат', 'BR', 0),
(34, 2, 'Булькиза', 'BU', 0),
(35, 2, 'Дельвина', 'DL', 0),
(36, 2, 'Девол', 'DV', 0),
(37, 2, 'Дибер', 'DI', 0),
(38, 2, 'Дуррес', 'DR', 0),
(39, 2, 'Эльбасана', 'EL', 0),
(40, 2, 'Колонье', 'ER', 0),
(41, 2, 'Фиер', 'FR', 0),
(42, 2, 'Gjirokaster', 'GJ', 0),
(43, 2, 'Gramsh', 'GR', 0),
(44, 2, 'имеет', 'HA', 0),
(45, 2, 'Кавая', 'KA', 0),
(46, 2, 'Курбин', 'KB', 0),
(47, 2, 'Кучова', 'KC', 0),
(48, 2, 'Корче', 'KO', 0),
(49, 2, 'Крудже', 'KR', 0),
(50, 2, 'Кукес', 'KU', 0),
(51, 2, 'Либражди', 'LB', 0),
(52, 2, 'Лежа', 'LE', 0),
(53, 2, 'Люшня', 'LU', 0),
(54, 2, 'Малези и Мадхе', 'MM', 0),
(55, 2, 'Малакастра', 'MK', 0),
(56, 2, 'Мат', 'MT', 0),
(57, 2, 'Мирдита', 'MR', 0),
(58, 2, 'Печине', 'PQ', 0),
(59, 2, 'Пермет', 'PR', 0),
(60, 2, 'Поградец', 'PG', 0),
(61, 2, 'тошнить', 'PU', 0),
(62, 2, 'Шкодер', 'SH', 0),
(63, 2, 'Скрапари', 'SK', 0),
(64, 2, 'Sarande', 'SR', 0),
(65, 2, 'Тепелена', 'TE', 0),
(66, 2, 'Тропоя', 'TP', 0),
(67, 2, 'Tirane', 'TR', 0),
(68, 2, 'Влоре', 'VL', 0),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Айн Дефла', 'ADE', 1),
(71, 3, 'Айн Темучент', 'ATE', 1),
(72, 3, 'Алджер', 'ALG', 1),
(73, 3, 'Анаба', 'ANN', 1),
(74, 3, 'Батна', 'BAT', 1),
(75, 3, 'Бешар', 'BEC', 1),
(76, 3, 'Беджаия', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Бордж Боу Арреридж', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Бумердес', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Константин', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'Эль Баяд', 'EBA', 1),
(86, 3, 'Эль-Уэд', 'EOU', 1),
(87, 3, 'Эль Тарф', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Гельма', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Медея', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'Мсила', 'MSI', 1),
(99, 3, 'Наама', 'NAA', 1),
(100, 3, 'Оран', 'ORA', 1),
(101, 3, 'Уаргла', 'OUA', 1),
(102, 3, 'Ум эль-Буаги', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Саида', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Сиди Бель Аббес', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Сук Ахрас', 'SAH', 1),
(109, 3, 'Таманрассетт', 'TAM', 1),
(110, 3, 'Тебесса', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Тиссемсилт', 'TIS', 1),
(115, 3, 'Тизи Узу', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'восточный', 'E', 1),
(118, 4, 'Мануа', 'M', 1),
(119, 4, 'Остров роз', 'R', 1),
(120, 4, 'Остров Суэйнс', 'S', 1),
(121, 4, 'вестерн', 'W', 1),
(122, 5, 'Андорра ла Велла', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'располагаться', 'ENC', 1),
(125, 5, 'Эскальдес-Энгордань', 'ESE', 1),
(126, 5, 'Ла Массана', 'LMA', 1),
(127, 5, 'Ордино', 'ORD', 1),
(128, 5, 'Сант Джулия де Лория', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Бенгелы', 'BGU', 1),
(131, 6, 'Бие', 'BIE', 1),
(132, 6, 'Кабинду', 'CAB', 1),
(133, 6, 'Cuando-Кубанго', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Куанза Сул', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Уила', 'HUI', 1),
(139, 6, 'Луанда', 'LUA', 1),
(140, 6, 'Лунда Норте', 'LNO', 1),
(141, 6, 'Лунда Сул', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Намиб', 'NAM', 1),
(145, 6, 'Уиге', 'UIG', 1),
(146, 6, 'Заир', 'ZAI', 1),
(147, 9, 'Святой Георгий', 'ASG', 1),
(148, 9, 'Святой Иоанн', 'ASJ', 1),
(149, 9, 'Святая мария', 'ASM', 1),
(150, 9, 'Святой Павел', 'ASL', 1),
(151, 9, 'Святой петр', 'ASR', 1),
(152, 9, 'Святой Филипп', 'ASH', 1),
(153, 9, 'Барбуды', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Антартида и Ислас дель Атлантико', 'AN', 1),
(156, 10, 'Буэнос айрес', 'BA', 1),
(157, 10, 'Кэйтамарка', 'CA', 1),
(158, 10, 'Чако', 'CH', 1),
(159, 10, 'Чубут', 'CU', 1),
(160, 10, 'Кордова', 'CO', 1),
(161, 10, 'Корриентес', 'CR', 1),
(162, 10, 'Федеральный округ', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Тайвань', 'FO', 1),
(165, 10, 'Жужуй', 'JU', 1),
(166, 10, 'Ла Пампа', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Мендоса', 'ME', 1),
(169, 10, 'Мисионес', 'MI', 1),
(170, 10, 'Ноикен', 'NE', 1),
(171, 10, 'Рио Негро', 'RN', 1),
(172, 10, 'Сальта', 'SA', 1),
(173, 10, 'Сан Хуан', 'SJ', 1),
(174, 10, 'Сан Луис', 'SL', 1),
(175, 10, 'Санта Круз', 'SC', 1),
(176, 10, 'Санта-Фе', 'SF', 1),
(177, 10, 'Сантьяго дель Эстеро', 'SD', 1),
(178, 10, 'Огненная Земля', 'TF', 1),
(179, 10, 'Такаман', 'TU', 1),
(180, 11, 'Арагацотнская область', 'AGT', 1),
(181, 11, 'Арарат', 'ARR', 1),
(182, 11, 'Армавир', 'ARM', 1),
(183, 11, 'Гехаркуникская область', 'GEG', 1),
(184, 11, 'Котайкская область', 'KOT', 1),
(185, 11, 'Лорри', 'LOR', 1),
(186, 11, 'Ширакский', 'SHI', 1),
(187, 11, 'Сюникская область', 'SYU', 1),
(188, 11, 'Тавушская область', 'TAV', 1),
(189, 11, 'Вайоц Дзор', 'VAY', 1),
(190, 11, 'Ереван', 'YER', 1),
(191, 13, 'Территория столицы Австралии', 'ACT', 0),
(192, 13, 'Новый Южный Уэльс', 'NSW', 0),
(193, 13, 'Северная территория', 'NT', 0),
(194, 13, 'Квинсленд', 'QLD', 0),
(195, 13, 'Южная Австралия', 'SA', 0),
(196, 13, 'Тасмания', 'TAS', 0),
(197, 13, 'Виктория', 'VIC', 0),
(198, 13, 'Западная Австралия', 'WA', 0),
(199, 14, 'Бургенланд', 'BUR', 0),
(200, 14, 'Каринтия', 'KAR', 0),
(201, 14, 'Нижняя Австрия', 'NOS', 0),
(202, 14, 'Верхняя Австрия', 'OOS', 0),
(203, 14, 'Зальцбург', 'SAL', 0),
(204, 14, 'Штирия', 'STE', 0),
(205, 14, 'Тироль', 'TIR', 0),
(206, 14, 'Форарльберг', 'VOR', 0),
(207, 14, 'Вена', 'WIE', 0),
(208, 15, 'Али Байрамли', 'AB', 0),
(209, 15, 'Абшерон', 'ABS', 0),
(210, 15, 'Агджабеди', 'AGC', 0),
(211, 15, 'Агдам', 'AGM', 0),
(212, 15, 'Агдаш', 'AGS', 0),
(213, 15, 'Акстафинский', 'AGA', 0),
(214, 15, 'Агсу', 'AGU', 0),
(215, 15, 'Астара', 'AST', 0),
(216, 15, 'Баки', 'BA', 0),
(217, 15, 'Бабак', 'BAB', 0),
(218, 15, 'Белоканских', 'BAL', 0),
(219, 15, 'Барда', 'BAR', 0),
(220, 15, 'Бейлакан', 'BEY', 0),
(221, 15, 'Биласувар', 'BIL', 0),
(222, 15, 'Джабраил', 'CAB', 0),
(223, 15, 'Калилабаб', 'CAL', 0),
(224, 15, 'Джульфа', 'CUL', 0),
(225, 15, 'Дашкесан', 'DAS', 0),
(226, 15, 'Давачи', 'DAV', 0),
(227, 15, 'Физули', 'FUZ', 0),
(228, 15, 'Гянджа', 'GA', 0),
(229, 15, 'Гедебей', 'GAD', 0),
(230, 15, 'Геранбой', 'GOR', 0),
(231, 15, 'Goycay', 'GOY', 0),
(232, 15, 'Хасикабул-', 'HAC', 0),
(233, 15, 'Imisli', 'IMI', 0),
(234, 15, 'Исмаиллы', 'ISM', 0),
(235, 15, 'Кельбаджар', 'KAL', 0),
(236, 15, 'Кюрдамир', 'KUR', 0),
(237, 15, 'Ленкорань', 'LA', 0),
(238, 15, 'Лачин', 'LAC', 0),
(239, 15, 'Ленкорань', 'LAN', 0),
(240, 15, 'Лерик', 'LER', 0),
(241, 15, 'Масаллы', 'MAS', 0),
(242, 15, 'Мингечевир', 'MI', 0),
(243, 15, 'Нафталан', 'NA', 0),
(244, 15, 'Нефткала', 'NEF', 0),
(245, 15, 'Огуз', 'OGU', 0),
(246, 15, 'Ordubad', 'ORD', 0),
(247, 15, 'Габала', 'QAB', 0),
(248, 15, 'Qax', 'QAX', 0),
(249, 15, 'Газы', 'QAZ', 0),
(250, 15, 'Гобустан', 'QOB', 0),
(251, 15, 'Губа', 'QBA', 0),
(252, 15, 'Губадлинского', 'QBI', 0),
(253, 15, 'Qusar', 'QUS', 0),
(254, 15, 'Саки', 'SA', 0),
(255, 15, 'Саатлинский', 'SAT', 0),
(256, 15, 'Сабирабаде', 'SAB', 0),
(257, 15, 'Седерек', 'SAD', 0),
(258, 15, 'Шахбуз', 'SAH', 0),
(259, 15, 'Саки', 'SAK', 0),
(260, 15, 'Сальянское', 'SAL', 0),
(261, 15, 'Сумгаит', 'SM', 0),
(262, 15, 'Samaxi', 'SMI', 0),
(263, 15, 'Шемкир', 'SKR', 0),
(264, 15, 'Samux', 'SMX', 0),
(265, 15, 'Сарур', 'SAR', 0),
(266, 15, 'Сиазань', 'SIY', 0),
(267, 15, 'Суза', 'SS', 0),
(268, 15, 'Суза', 'SUS', 0),
(269, 15, 'татарский', 'TAR', 0),
(270, 15, 'Товуз', 'TOV', 0),
(271, 15, 'Ucar', 'UCA', 0),
(272, 15, 'Ханкенди', 'XA', 0),
(273, 15, 'Хачмаз', 'XAC', 0),
(274, 15, 'Xanlar', 'XAN', 0),
(275, 15, 'Xizi', 'XIZ', 0),
(276, 15, 'ходжалинская', 'XCI', 0),
(277, 15, 'Ходжавендский р-н', 'XVD', 0),
(278, 15, 'Ярдымлинский', 'YAR', 0),
(279, 15, 'Евлах', 'YEV', 0),
(280, 15, 'Зангиланский', 'ZAN', 0),
(281, 15, 'Zaqatala', 'ZAQ', 0),
(282, 15, 'Зардабе', 'ZAR', 0),
(283, 15, 'Naxçıvan', 'NX', 0),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Ягодные острова', 'BER', 1),
(286, 16, 'Бимини', 'BIM', 1),
(287, 16, 'Черная точка', 'BLK', 1),
(288, 16, 'Остров кошек', 'CAT', 1),
(289, 16, 'Центральная Абако', 'CAB', 1),
(290, 16, 'Центральный Андрос', 'CAN', 1),
(291, 16, 'Центральная Эльютера', 'CEL', 1),
(292, 16, 'Город Фрипорт', 'FRE', 1),
(293, 16, 'Кривой Остров', 'CRO', 1),
(294, 16, 'Восток Гранд Багама', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Большой Кей', 'GRD', 1),
(297, 16, 'Остров Харбор', 'HAR', 1),
(298, 16, 'Город надежды', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Длинный остров', 'LNG', 1),
(301, 16, 'Мангровый Кей', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Остров Мура', 'MOO', 1),
(304, 16, 'Север Абако', 'NAB', 1),
(305, 16, 'Северный Андрос', 'NAN', 1),
(306, 16, 'Северная Эльютера', 'NEL', 1),
(307, 16, 'Рваный остров', 'RAG', 1),
(308, 16, 'Ром Кей', 'RUM', 1),
(309, 16, 'Сан-Сальвадор', 'SAL', 1),
(310, 16, 'Южная Абако', 'SAB', 1),
(311, 16, 'Южный Андрос', 'SAN', 1),
(312, 16, 'Южная элеутера', 'SEL', 1),
(313, 16, 'Испанский Уэллс', 'SWE', 1),
(314, 16, 'Запад Гранд Багама', 'WGB', 1),
(315, 17, 'Капитал', 'CAP', 1),
(316, 17, 'центральный', 'CEN', 1),
(317, 17, 'Мухаррак', 'MUH', 1),
(318, 17, 'северный', 'NOR', 1),
(319, 17, 'южный', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Читтагонг', 'CHI', 1),
(322, 18, 'Дакка', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Церковь Христа', 'CC', 1),
(327, 19, 'Святой Андрей', 'AND', 1),
(328, 19, 'Святой Георгий', 'GEO', 1),
(329, 19, 'Святой Джеймс', 'JAM', 1),
(330, 19, 'Святой Иоанн', 'JOH', 1),
(331, 19, 'Святой Иосиф', 'JOS', 1),
(332, 19, 'Святая люси', 'LUC', 1),
(333, 19, 'Святой Михаил', 'MIC', 1),
(334, 19, 'Святой петр', 'PET', 1),
(335, 19, 'Святой Филипп', 'PHI', 1),
(336, 19, 'Святой томас', 'THO', 1),
(337, 20, 'Брестская (Брест)', 'BR', 1),
(338, 20, 'Гомельская (Гомель)', 'HO', 1),
(339, 20, 'Минск', 'HM', 1),
(340, 20, 'Гродзенская (Гродно)', 'HR', 1),
(341, 20, 'Могилёвская (Могилёв)', 'MA', 1),
(342, 20, 'Минская область', 'MI', 1),
(343, 20, 'Витебская (Витебск)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Брабант Валлон', 'WBR', 1),
(346, 21, 'Эно', 'WHT', 1),
(347, 21, 'Вассал', 'WLG', 1),
(348, 21, 'Лимбург', 'VLI', 1),
(349, 21, 'Люксембург', 'WLX', 1),
(350, 21, 'Намюр', 'WNA', 1),
(351, 21, 'Уст-Vlaanderen', 'VOV', 1),
(352, 21, 'Фламандский Брабант', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Белиз', 'BZ', 1),
(355, 22, 'Кайо', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Оранжевая Прогулка', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Толедо', 'TO', 1),
(360, 23, 'Алибори', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Атлантическая', 'AQ', 1),
(363, 23, 'Боргу', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'ущелье', 'DO', 1),
(366, 23, 'Куффо', 'KO', 1),
(367, 23, 'литораль', 'LI', 1),
(368, 23, 'Моно', 'MO', 1),
(369, 23, 'Уэме', 'OU', 1),
(370, 23, 'Плато', 'PL', 1),
(371, 23, 'Цзоу', 'ZO', 1),
(372, 24, 'Девоншир', 'DS', 1),
(373, 24, 'Гамильтон Сити', 'HC', 1),
(374, 24, 'Гамильтон', 'HA', 1),
(375, 24, 'Педжет', 'PG', 1),
(376, 24, 'Пембрук', 'PB', 1),
(377, 24, 'Город Святого Георгия', 'GC', 1),
(378, 24, 'Святой Георгий', 'SG', 1),
(379, 24, 'Сэндис', 'SA', 1),
(380, 24, 'Смит', 'SM', 1),
(381, 24, 'Саутгемптон', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Бумтанг', 'BUM', 1),
(384, 25, 'Чуха', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Хаа', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Паро', 'PAR', 1),
(391, 25, 'Пемагатшел', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Самдруп Джонгхар', 'SJO', 1),
(394, 25, 'Самтсе', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Тхимпху', 'THI', 1),
(397, 25, 'Трашиганг', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Тронгса', 'TRO', 1),
(400, 25, 'Циранг', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Жемганг', 'ZHE', 1),
(403, 26, 'Бени', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Кочабамба', 'COC', 1),
(406, 26, 'Ла Пас', 'LPZ', 1),
(407, 26, 'Оруро', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Потоси', 'POT', 1),
(410, 26, 'Санта Круз', 'SCZ', 1),
(411, 26, 'Тариха', 'TAR', 1),
(412, 27, 'Район Брчко', 'BRO', 1),
(413, 27, 'Унско-Сански Кантон', 'FUS', 1),
(414, 27, 'Посавский Кантон', 'FPO', 1),
(415, 27, 'Тузланский кантон', 'FTU', 1),
(416, 27, 'Зеницко-Добойский Кантон', 'FZE', 1),
(417, 27, 'Босанскоподринский кантон', 'FBP', 1),
(418, 27, 'Среднебосанский Кантон', 'FSB', 1),
(419, 27, 'Герцегово-Неретванский Кантон', 'FHN', 1),
(420, 27, 'Западнохерцеговацкая Зупания', 'FZH', 1),
(421, 27, 'Кантон Сараево', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Баня Лука', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Биелину', 'SBI', 1),
(426, 27, 'Власеница', 'SVL', 1),
(427, 27, 'Сараево-Романия или Соколац', 'SSR', 1),
(428, 27, 'Фока', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'центральный', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'к северо-востоку', 'NE', 1),
(437, 28, 'северо-Запад', 'NW', 1),
(438, 28, 'Юго Восток', 'SE', 1),
(439, 28, 'южный', 'SO', 1),
(440, 30, 'акр', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Сеара', 'CE', 1),
(446, 30, 'Федеральный округ', 'DF', 1),
(447, 30, 'Эспириту-Санту', 'ES', 1),
(448, 30, 'Гояс', 'GO', 1),
(449, 30, 'Мараньяу', 'MA', 1),
(450, 30, 'Мату Гросу', 'MT', 1),
(451, 30, 'Мату-Гросу-ду-Сул', 'MS', 1),
(452, 30, 'Минас-Жерайс', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Парайба', 'PB', 1),
(455, 30, 'Парана', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Рио де Жанейро', 'RJ', 1),
(459, 30, 'Риу-Гранди-ду-Норти', 'RN', 1),
(460, 30, 'Риу-Гранди-ду-Сул', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Рорайма', 'RR', 1),
(463, 30, 'Санта-Катарина', 'SC', 1),
(464, 30, 'Сан-Паулу', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Перос Банос', 'PB', 1),
(468, 31, 'Соломоновы Острова', 'SI', 1),
(469, 31, 'Остров Нельсонов', 'NI', 1),
(470, 31, 'Три брата', 'TB', 1),
(471, 31, 'Орлиные острова', 'EA', 1),
(472, 31, 'Остров Опасности', 'DI', 1),
(473, 31, 'Эгмонт острова', 'EG', 1),
(474, 31, 'Диего Гарсия', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Бруней и Муара', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Тутонг', 'TUT', 1),
(479, 33, 'Благоевград', '', 1),
(480, 33, 'Бургас', '', 1),
(481, 33, 'Добрич', '', 1),
(482, 33, 'Габрово', '', 1),
(483, 33, 'Хасково', '', 1),
(484, 33, 'Кырджали', '', 1),
(485, 33, 'Кюстендил', '', 1),
(486, 33, 'Ловеч', '', 1),
(487, 33, 'Монтана', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Перник', '', 1),
(490, 33, 'Плевна', '', 1),
(491, 33, 'Пловдив', '', 1),
(492, 33, 'Разград', '', 1),
(493, 33, 'Шумен', '', 1),
(494, 33, 'Силистра', '', 1),
(495, 33, 'Сливен', '', 1),
(496, 33, 'Смолян', '', 1),
(497, 33, 'София', '', 1),
(498, 33, 'София - город', '', 1),
(499, 33, 'Стара Загора', '', 1),
(500, 33, 'Тырговиште', '', 1),
(501, 33, 'Варна', '', 1),
(502, 33, 'Велико Тырново', '', 1),
(503, 33, 'Видин', '', 1),
(504, 33, 'врачанский', '', 1),
(505, 33, 'Ямбол', '', 1),
(506, 34, 'тюк', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Банва', 'BAN', 1),
(509, 34, 'Базега', 'BAZ', 1),
(510, 34, 'Бугуриба', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Булкиемде', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ганзургу', 'GAN', 1),
(515, 34, 'Гнагна', 'GNA', 1),
(516, 34, 'Гурма', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Йоба', 'IOA', 1),
(519, 34, 'Кадиого', 'KAD', 1),
(520, 34, 'Кенедугу', 'KEN', 1),
(521, 34, 'Комонджари', 'KOD', 1),
(522, 34, 'Компиенга', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Кулпелого', 'KOL', 1),
(525, 34, 'Куритенга', 'KOT', 1),
(526, 34, 'Курвеого', 'KOW', 1),
(527, 34, 'Лераба', 'LER', 1),
(528, 34, 'Лорум', 'LOR', 1),
(529, 34, 'Мухун', 'MOU', 1),
(530, 34, 'Нахури', 'NAH', 1),
(531, 34, 'Наментенга', 'NAM', 1),
(532, 34, 'Наяла', 'NAY', 1),
(533, 34, 'Наумбиел', 'NOU', 1),
(534, 34, 'Убритенга', 'OUB', 1),
(535, 34, 'Удалан', 'OUD', 1),
(536, 34, 'Пассор', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Сангуие', 'SAG', 1),
(539, 34, 'Санматенга', 'SAM', 1),
(540, 34, 'Сено', 'SEN', 1),
(541, 34, 'Сиссили', 'SIS', 1),
(542, 34, 'Сумы', 'SOM', 1),
(543, 34, 'Сура', 'SOR', 1),
(544, 34, 'Тапоа', 'TAP', 1),
(545, 34, 'Туи', 'TUY', 1),
(546, 34, 'Ягха', 'YAG', 1),
(547, 34, 'Ятенга', 'YAT', 1),
(548, 34, 'Зиро', 'ZIR', 1),
(549, 34, 'Зондомо', 'ZOD', 1),
(550, 34, 'Зундвеого', 'ZOW', 1),
(551, 35, 'Бубанза', 'BB', 1),
(552, 35, 'Буджумбура', 'BJ', 1),
(553, 35, 'Бурури', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Каянза', 'KY', 1),
(559, 35, 'Кирундо', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Мурамвья', 'MU', 1),
(562, 35, 'Муйинга', 'MY', 1),
(563, 35, 'Мваро', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Руйиги', 'RY', 1),
(567, 36, 'Пномпень', 'PP', 1),
(568, 36, 'Преах Сейхану (Компонг Сом или Сиануквиль)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Бантей Минчи', 'BM', 1),
(572, 36, 'Баттамбанга', 'BA', 1),
(573, 36, 'Кампонг Чам', 'KM', 1),
(574, 36, 'Кампонг Чнанг', 'KN', 1),
(575, 36, 'Кампонг Спеу', 'KU', 1),
(576, 36, 'Кампонг Сом', 'KO', 1),
(577, 36, 'Кампонг Том', 'KT', 1),
(578, 36, 'Кампот', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Каох Конг', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Мондул Кири', 'MK', 1),
(583, 36, 'Оддар Мичей', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Прей Венг', 'PG', 1),
(587, 36, 'Ратанак Кири', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Стунг Тренг', 'ST', 1),
(590, 36, 'Свай Риенг', 'SR', 1),
(591, 36, 'Такео', 'TK', 1),
(592, 37, 'Адамава (Adamaoua)', 'ADA', 1),
(593, 37, 'Центр', 'CEN', 1),
(594, 37, 'Восток', 'EST', 1),
(595, 37, 'Крайний Север (Extreme-Nord)', 'EXN', 1),
(596, 37, 'литораль', 'LIT', 1),
(597, 37, 'Север (Норд)', 'NOR', 1),
(598, 37, 'Северо-Запад (Норд-Уэст)', 'NOT', 1),
(599, 37, 'Запад (Уэст)', 'OUE', 1),
(600, 37, 'Юг (юг)', 'SUD', 1),
(601, 37, 'Юго-запад (юг-юг).', 'SOU', 1),
(602, 38, 'альберта', 'AB', 1),
(603, 38, 'британская Колумбия', 'BC', 1),
(604, 38, 'Манитоба', 'MB', 1),
(605, 38, 'Нью-Брансуик', 'NB', 1),
(606, 38, 'Ньюфаундленд и Лабрадор', 'NL', 1),
(607, 38, 'Северо-западные территории', 'NT', 1),
(608, 38, 'Новая Шотландия', 'NS', 1),
(609, 38, 'Нунавутский', 'NU', 1),
(610, 38, 'Онтарио', 'ON', 1),
(611, 38, 'Остров Принца Эдуарда', 'PE', 1),
(612, 38, 'Québec', 'QC', 1),
(613, 38, 'Саскачеван', 'SK', 1),
(614, 38, 'Юкон Территория', 'YT', 1),
(615, 39, 'Боа Виста', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Кальета де Сан-Мигель', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Павел', 'PA', 1),
(621, 39, 'Порто Ново', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Рибейра Гранде', 'RG', 1),
(624, 39, 'Сэл', 'SL', 1),
(625, 39, 'Санта-Катарина', 'CA', 1),
(626, 39, 'Санта Круз', 'CR', 1),
(627, 39, 'Сан Домингос', 'SD', 1),
(628, 39, 'Сан Филипе', 'SF', 1),
(629, 39, 'Сан Николау', 'SN', 1),
(630, 39, 'Сан-Висенте', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'ручей', 'CR', 1),
(633, 40, 'восточный', 'EA', 1),
(634, 40, 'внутренняя часть страны', 'ML', 1),
(635, 40, 'Южный Город', 'ST', 1),
(636, 40, 'Спот Бэй', 'SP', 1),
(637, 40, 'Стейк Бэй', 'SK', 1),
(638, 40, 'Уэст-Энд', 'WD', 1),
(639, 40, 'вестерн', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Басс-Kotto', 'BKO', 1),
(642, 41, 'Верхняя Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Нана-Мамбер', 'NMM', 1),
(649, 41, 'Ombella-Мпоко', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Вакага', 'VAK', 1),
(654, 41, 'Nana-Грибици', 'NGR', 1),
(655, 41, 'Сангха-Мбаере', 'SMB', 1),
(656, 41, 'Банги', 'BAN', 1),
(657, 42, 'Бата', 'BA', 1),
(658, 42, 'Бильтине', 'BI', 1),
(659, 42, 'Борка-Ennedi-Тибести', 'BE', 1),
(660, 42, 'Шари-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'лак', 'LA', 1),
(664, 42, 'Вход западный', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Шари', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Саламат', 'SA', 1),
(670, 42, 'Танджиле', 'TA', 1),
(671, 43, 'Айсен дель Генерал Карлос Ибаньес', 'AI', 1),
(672, 43, 'Антофагаста', 'AN', 1),
(673, 43, 'Араукания', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Кокимбо', 'CO', 1),
(677, 43, 'Генерал Либертадор Бернардо О\'Хиггинс', 'LI', 1),
(678, 43, 'Лос Лагос', 'LL', 1),
(679, 43, 'Магалланес-де-ла-Антарктида Чилина', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Регион Метрополитана', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Вальпараисо', 'VS', 1),
(684, 44, 'Аньхой', 'AN', 1),
(685, 44, 'Пекин', 'BE', 1),
(686, 44, 'Чунцин', 'CH', 1),
(687, 44, 'Фуцзянь', 'FU', 1),
(688, 44, 'Ганьсу', 'GA', 1),
(689, 44, 'Гуандун', 'GU', 1),
(690, 44, 'Гуанси', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Хайнань', 'HA', 1),
(693, 44, 'хэбэй', 'HB', 1),
(694, 44, 'Хэйлунцзян', 'HL', 1),
(695, 44, 'Хэнань', 'HE', 1),
(696, 44, 'Гонконг', 'HK', 1),
(697, 44, 'Хубэй', 'HU', 1),
(698, 44, 'Хунань', 'HN', 1),
(699, 44, 'Внутренняя Монголия', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Цзянси', 'JX', 1),
(702, 44, 'Цзилинь', 'JL', 1),
(703, 44, 'Ляонин', 'LI', 1),
(704, 44, 'Макао', 'MA', 1),
(705, 44, 'Нинся', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Шаньдун', 'SA', 1),
(708, 44, 'Шанхай', 'SG', 1),
(709, 44, 'Шаньси', 'SX', 1),
(710, 44, 'Сычуань', 'SI', 1),
(711, 44, 'Тяньцзинь', 'TI', 1),
(712, 44, 'Синьцзян', 'XI', 1),
(713, 44, 'Юньнань', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Направление Остров', 'D', 1),
(716, 46, 'Родной остров', 'H', 1),
(717, 46, 'Остров Хорсбург', 'O', 1),
(718, 46, 'Южный остров', 'S', 1),
(719, 46, 'Западный остров', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Богота Д.С.', 'BDC', 1),
(725, 47, 'боливар', 'BOL', 1),
(726, 47, 'Бойяка', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Каука', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Кордова', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Гуахира', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Уила', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Мета', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'Сан-Андрес-и-Провиденсия', 'SAP', 1),
(747, 47, 'Сантандер', 'SAN', 1),
(748, 47, 'Сукре', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Ваупес', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Гранд Комор', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Мохели', 'M', 1),
(756, 49, 'Буэнза', 'BO', 1),
(757, 49, 'Браззавиль', 'BR', 1),
(758, 49, 'кювета', 'CU', 1),
(759, 49, 'Кювета-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Лекуму', 'LE', 1),
(762, 49, 'Ликуала', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Бассейн', 'PO', 1),
(766, 49, 'Сангха', 'SA', 1),
(767, 50, 'Пукапука', 'PU', 1),
(768, 50, 'Ракаханга', 'RK', 1),
(769, 50, 'Манихики', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Остров Нассау', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Пальмерстон', 'PA', 1),
(774, 50, 'Айтутаки', 'AI', 1),
(775, 50, 'Мануаэ', 'MA', 1),
(776, 50, 'Такутеа', 'TA', 1),
(777, 50, 'Митиаро', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Мауке', 'MU', 1),
(780, 50, 'Раротонга', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Алаюель', 'AL', 1),
(783, 51, 'Картаго', 'CA', 1),
(784, 51, 'Гуанакастэ', 'GU', 1),
(785, 51, 'Эредиа', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'Сан - Хосе', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Абиджан', 'ABI', 1),
(791, 52, 'Абоисо', 'ABO', 1),
(792, 52, 'Адиаке', 'ADI', 1),
(793, 52, 'Адзопе', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Аньибилекру', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Банголо', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Бондуку', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Буафле', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Буна', 'BNA', 1),
(806, 52, 'Бундиали', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Даба', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Данане', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Дюэкуэ', 'DUE', 1),
(815, 52, 'Феркеседугу', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Гранд-Бассам', 'GBA', 1),
(818, 52, 'Гранд-Lahou', 'GLA', 1),
(819, 52, 'Гиг', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Катиола', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Лакота', 'LAK', 1),
(825, 52, 'мужчина', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'Сан - Педро-', 'SPE', 1),
(832, 52, 'Сассандра', 'SAS', 1),
(833, 52, 'Сегелу', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Субра', 'SOU', 1),
(836, 52, 'Табу', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Тулепле', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Вавуа', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Беловарско-Билогора', 'BB', 1),
(848, 53, 'Град Загреб', 'GZ', 1),
(849, 53, 'Dubrovacko-Neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Карловацкая', 'KA', 1),
(852, 53, 'Копривничко-Крижевачка', 'KK', 1),
(853, 53, 'Крапинско-Zagorska', 'KZ', 1),
(854, 53, 'Личко-Сеньск', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Осиек-Баранья', 'OB', 1),
(857, 53, 'Пожешко-Славонская', 'PS', 1),
(858, 53, 'Приморско-Goranska', 'PG', 1),
(859, 53, 'Шибенско-Книнская', 'SK', 1),
(860, 53, 'Сисацко-Мославина', 'SM', 1),
(861, 53, 'Бродско-Посавская', 'BP', 1),
(862, 53, 'Splitsko-далматинская', 'SD', 1),
(863, 53, 'Вараждинская', 'VA', 1),
(864, 53, 'Вировитица-Подравина', 'VP', 1),
(865, 53, 'Вуковарско-Сирмия', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Камагуэй', 'CA', 1),
(869, 54, 'Сьего де Авила', 'CD', 1),
(870, 54, 'Сьенфуэгос', 'CI', 1),
(871, 54, 'Сьюдад-де-ла-Гавана', 'CH', 1),
(872, 54, 'Гранма', 'GR', 1),
(873, 54, 'Гуантанамо', 'GU', 1),
(874, 54, 'Ольгин', 'HO', 1),
(875, 54, 'Исла де ла Ювентуд', 'IJ', 1),
(876, 54, 'Гавана', 'LH', 1),
(877, 54, 'Лас Тунас', 'LT', 1),
(878, 54, 'Матансас', 'MA', 1),
(879, 54, 'Пинар-дель-Рио', 'PR', 1),
(880, 54, 'Санкти Спиритус', 'SS', 1),
(881, 54, 'Сантьяго де Куба', 'SC', 1),
(882, 54, 'Вилла Клара', 'VC', 1),
(883, 55, 'Фамагуста', 'F', 1),
(884, 55, 'Кирения', 'K', 1),
(885, 55, 'Ларнака', 'A', 1),
(886, 55, 'Лимассол', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Пафос', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královéhradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Пльзеньского', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Высочина', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Орхусская', 'AR', 1),
(904, 57, 'борнхольмский', 'BH', 1),
(905, 57, 'Копенгаген', 'CO', 1),
(906, 57, 'Фарерские острова', 'FO', 1),
(907, 57, 'Фредериксборг', 'FR', 1),
(908, 57, 'Фюн', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Риба', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Роскилле', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Вайле', 'VK', 1),
(917, 57, 'Vestjælland', 'VJ', 1),
(918, 57, 'Выборгский', 'VB', 1),
(919, 58, 'Али Сабих', 'S', 1),
(920, 58, 'Диккиль', 'K', 1),
(921, 58, 'Джибути', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Таджура', 'T', 1),
(924, 59, 'Приход Святого Андрея', 'AND', 1),
(925, 59, 'Приход Святого Давида', 'DAV', 1),
(926, 59, 'Приход Святого Георгия', 'GEO', 1),
(927, 59, 'Приход Святого Иоанна', 'JOH', 1),
(928, 59, 'Приход Святого Иосифа', 'JOS', 1),
(929, 59, 'Приход Святого Луки', 'LUK', 1),
(930, 59, 'Приход Святого Марка', 'MAR', 1),
(931, 59, 'Приход Святого Патрика', 'PAT', 1),
(932, 59, 'Приход Святого Павла', 'PAU', 1),
(933, 59, 'Приход Святого Петра', 'PET', 1),
(934, 60, 'Национальный округ', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Барахона', 'BH', 1),
(938, 60, 'Даджабон', 'DJ', 1),
(939, 60, 'Дуарте', 'DU', 1),
(940, 60, 'Элиас Пина', 'EL', 1),
(941, 60, 'Эль Сейбо', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Хато мэр', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'Ла Вега', 'VE', 1),
(948, 60, 'Мария Тринидад Санчес', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Монте Кристи', 'MC', 1),
(951, 60, 'Монте Плата', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Перавия (Бани)', 'PR', 1),
(954, 60, 'Пуэрто-Плата', 'PP', 1),
(955, 60, 'Сальседо', 'SL', 1),
(956, 60, 'Самана', 'SM', 1),
(957, 60, 'Санчес Рамирес', 'SH', 1),
(958, 60, 'Сан-Кристобаль', 'SC', 1),
(959, 60, 'Сан-Хосе де Окоа', 'JO', 1),
(960, 60, 'Сан Хуан', 'SJ', 1),
(961, 60, 'Сан Педро де Макорис', 'PM', 1),
(962, 60, 'Сантьяго', 'SA', 1),
(963, 60, 'Сантьяго Родригес', 'ST', 1),
(964, 60, 'Санто-Доминго', 'SD', 1),
(965, 60, 'Вальверде', 'VA', 1),
(966, 61, 'Аилеу', 'AL', 1),
(967, 61, 'Айнаро', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Бобонаро', 'BO', 1),
(970, 61, 'Кова Лима', 'CO', 1),
(971, 61, 'Дили', 'DI', 1),
(972, 61, 'Эрмера', 'ER', 1),
(973, 61, 'Лаутем', 'LA', 1),
(974, 61, 'Ликика', 'LI', 1),
(975, 61, 'Манатуто', 'MT', 1),
(976, 61, 'Мануфахи', 'MF', 1),
(977, 61, 'Оекуси', 'OE', 1),
(978, 61, 'Викеке', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'боливар', 'BOL', 1),
(981, 62, 'Cañar', 'CAN', 1),
(982, 62, 'Карчи', 'CAR', 1),
(983, 62, 'Чимборасо', 'CHI', 1),
(984, 62, 'Котопакси', 'COT', 1),
(985, 62, 'Эль Оро', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Галапагосы', 'GPS', 1),
(988, 62, 'Гуайас', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Лоха', 'LOJ', 1),
(991, 62, 'Лос Риос', 'LRO', 1),
(992, 62, 'Манаби', 'MAN', 1),
(993, 62, 'Морона Сантьяго', 'MSA', 1),
(994, 62, 'Напо', 'NAP', 1),
(995, 62, 'Орельяна', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Сукумбиос', 'SUC', 1),
(999, 62, 'Тунгурауа', 'TUN', 1),
(1000, 62, 'Самора Чинчипе', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Аль Бахр Аль Ахмар', 'BAM', 1),
(1003, 63, 'Аль Бухайра', 'BHY', 1),
(1004, 63, 'Аль Файюм', 'FYM', 1),
(1005, 63, 'Аль Гарбия', 'GBY', 1),
(1006, 63, 'Аль Искандария', 'IDR', 1),
(1007, 63, 'Аль Исмаилия', 'IML', 1),
(1008, 63, 'Аль Джиза', 'JZH', 1),
(1009, 63, 'Аль Минуфия', 'MFY', 1),
(1010, 63, 'Аль Минья', 'MNY', 1),
(1011, 63, 'Аль-Кахира', 'QHR', 1),
(1012, 63, 'Аль-Калюбия', 'QLY', 1),
(1013, 63, 'Аль Вади аль Джадид', 'WJD', 1),
(1014, 63, 'Аш Шаркия', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Асуан', 'ASW', 1),
(1017, 63, 'Асьют', 'ASY', 1),
(1018, 63, 'Бани Сувайф', 'BSW', 1),
(1019, 63, 'Бур Саид', 'BSD', 1),
(1020, 63, 'Думьят', 'DMY', 1),
(1021, 63, 'Януб Сина', 'JNS', 1),
(1022, 63, 'Кафр аш Шейх', 'KSH', 1),
(1023, 63, 'Матрух', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina \'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Кабанас', 'CA', 1),
(1029, 64, 'Чалатенанго', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'Ла Пас', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'Сан Мигель', 'SM', 1),
(1036, 64, 'Сан-Сальвадор', 'SS', 1),
(1037, 64, 'Сан-Висенте', 'SV', 1),
(1038, 64, 'Санта Ана', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Усулутан', 'US', 1),
(1041, 65, 'Провинция Аннобон', 'AN', 1),
(1042, 65, 'Провинция Биоко Норте', 'BN', 1),
(1043, 65, 'Провинция Биоко Сур', 'BS', 1),
(1044, 65, 'Провинция Центр Сур', 'CS', 1),
(1045, 65, 'Провинция Кие-Нтем', 'KN', 1),
(1046, 65, 'Провинция Литораль', 'LI', 1),
(1047, 65, 'Провинция Веле-Нзас', 'WN', 1),
(1048, 66, 'Центральный (Макел)', 'MA', 1),
(1049, 66, 'Ансеба (Керен)', 'KE', 1),
(1050, 66, 'Южное Красное море (Дебуб-Кейх-Бахри)', 'DK', 1),
(1051, 66, 'Северное Красное море (Семиен-Кейх-Бахри)', 'SK', 1),
(1052, 66, 'Южный (Дебуб)', 'DE', 1),
(1053, 66, 'Гаш-Барка (Баренту)', 'BR', 1),
(1054, 67, 'Харьюмаа (Таллинн)', 'HA', 1),
(1055, 67, 'Хийумаа (Кардла)', 'HI', 1),
(1056, 67, 'Ида-Вирумаа (Йохви)', 'IV', 1),
(1057, 67, 'Ярвамаа (Пайде)', 'JA', 1),
(1058, 67, 'Йогевамаа (Jogeva)', 'JO', 1),
(1059, 67, 'Лаане-Вирумаа (Раквере)', 'LV', 1),
(1060, 67, 'Лаанемаа (Хаапсалу)', 'LA', 1),
(1061, 67, 'Пярнумаа (Пярну)', 'PA', 1),
(1062, 67, 'Полвамаа (Polva)', 'PO', 1),
(1063, 67, 'Рапламаа (Рапла)', 'RA', 1),
(1064, 67, 'Сааремаа (Куессааре)', 'SA', 1),
(1065, 67, 'Тартумаа (Тарту)', 'TA', 1),
(1066, 67, 'Валгамаа (Валга)', 'VA', 1),
(1067, 67, 'Вильяндимаа (Вильянди)', 'VI', 1),
(1068, 67, 'Ворумаа (Voru)', 'VO', 1),
(1069, 68, 'издалека', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Бенишангул-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Оромии', 'OR', 1),
(1075, 68, 'сомалийский', 'SM', 1),
(1076, 68, 'Южные народы - регион национальностей и народов', 'SN', 1),
(1077, 68, 'Тигре', 'TG', 1),
(1078, 68, 'Аддис-Абеба', 'AA', 1),
(1079, 68, 'Дикий Дава', 'DD', 1),
(1080, 71, 'Центральный отдел', 'C', 1),
(1081, 71, 'Северная дивизия', 'N', 1),
(1082, 71, 'Восточный дивизион', 'E', 1),
(1083, 71, 'Западный дивизион', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Ит-Суомен Ляани', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Оулун Ляэни', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Эна', '02', 1),
(1116, 74, 'Алье', '03', 1),
(1117, 74, 'Альпы Верхнего Прованса', '04', 1),
(1118, 74, 'Верхние Альпы', '05', 1),
(1119, 74, 'Приморские Альпы', '06', 1),
(1120, 74, 'Ardèche', '07', 1),
(1121, 74, 'Арденны', '08', 1),
(1122, 74, 'Арьеж', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Од', '11', 1),
(1125, 74, 'Аверон', '12', 1),
(1126, 74, 'Буш дю Рон', '13', 1),
(1127, 74, 'кальвадос', '14', 1),
(1128, 74, 'Кантал', '15', 1),
(1129, 74, 'шарента', '16', 1),
(1130, 74, 'Шаранта Приморская', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corrèze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Верхний Корс', '2B', 1),
(1135, 74, 'Кот д\'Ор', '21', 1),
(1136, 74, 'Кот д\'Армор', '22', 1),
(1137, 74, 'Крез', '23', 1),
(1138, 74, 'Дордонь', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Дром', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Эр и Луар', '28', 1),
(1143, 74, 'Финистер', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Верхняя Гаронна', '31', 1),
(1146, 74, 'Жер', '32', 1),
(1147, 74, 'Жиронда', '33', 1),
(1148, 74, 'Эро', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Индре', '36', 1),
(1151, 74, 'Эндр и Луара', '37', 1),
(1152, 74, 'Изер', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Ланды', '40', 1),
(1155, 74, 'Луар и Шер', '41', 1),
(1156, 74, 'Луара', '42', 1),
(1157, 74, 'Верхняя Луара', '43', 1),
(1158, 74, 'Луара Атлантик', '44', 1),
(1159, 74, 'Луара', '45', 1),
(1160, 74, 'Много', '46', 1),
(1161, 74, 'Лот и Гаронна', '47', 1),
(1162, 74, 'Lozère', '48', 1),
(1163, 74, 'Мэн и Луара', '49', 1),
(1164, 74, 'Манш', '50', 1),
(1165, 74, 'Марн', '51', 1),
(1166, 74, 'Верхняя Марна', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Мёрт и Мозель', '54', 1),
(1169, 74, 'Маас', '55', 1),
(1170, 74, 'Морбиан', '56', 1),
(1171, 74, 'мозельвейн', '57', 1),
(1172, 74, 'Nièvre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Уаз', '60', 1),
(1175, 74, 'Орн', '61', 1),
(1176, 74, 'Пас де Кале', '62', 1),
(1177, 74, 'Пью де Дом', '63', 1),
(1178, 74, 'Пиренеи Атлантические', '64', 1),
(1179, 74, 'Верхние Пиренеи', '65', 1),
(1180, 74, 'Пиренеи Восточные', '66', 1),
(1181, 74, 'Бас Рин', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Рона', '69', 1),
(1184, 74, 'Верхняя Сона', '70', 1),
(1185, 74, 'Сона и Луара', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Савойя', '73', 1),
(1188, 74, 'Верхняя Савойя', '74', 1),
(1189, 74, 'Париж', '75', 1),
(1190, 74, 'Сена Приморская', '76', 1),
(1191, 74, 'Сена и Марна', '77', 1),
(1192, 74, 'Ивелин', '78', 1),
(1193, 74, 'Deux Sèvres', '79', 1),
(1194, 74, 'Сомма', '80', 1),
(1195, 74, 'каровое озеро', '81', 1),
(1196, 74, 'Тарн и Гаронна', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Воклюз', '84', 1),
(1199, 74, 'Вандея', '85', 1),
(1200, 74, 'Вьен', '86', 1),
(1201, 74, 'Верхняя Вена', '87', 1),
(1202, 74, 'Вогезы', '88', 1),
(1203, 74, 'Йон', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Эссонна', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Сен-Дени', '93', 1),
(1208, 74, 'Валь де Марн', '94', 1),
(1209, 74, 'Валь д\'Уаз', '95', 1),
(1210, 76, 'Архипелаг де Маркиз', 'M', 1),
(1211, 76, 'Архипелаг Туамоту', 'T', 1),
(1212, 76, 'Архипелаг Тубуай', 'I', 1),
(1213, 76, 'Иль дю Вент', 'V', 1),
(1214, 76, 'Иль Су-ле-Вент', 'S', 1),
(1215, 77, 'Иль Крозе', 'C', 1),
(1216, 77, 'Ильес Кергелен', 'K', 1),
(1217, 77, 'Иль Амстердам', 'A', 1),
(1218, 77, 'Иль Сен-Поль', 'P', 1),
(1219, 77, 'Адели Лэнд', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Нгунье', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue Ивиндо', 'OI', 1),
(1226, 78, 'Ogooue-Лоло', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Волью-Ntem', 'WN', 1),
(1229, 79, 'Банджульского', 'BJ', 1),
(1230, 79, 'Басс', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Нижняя река', 'LR', 1),
(1238, 79, 'Центральная река', 'CR', 1),
(1239, 79, 'Северный берег', 'NB', 1),
(1240, 79, 'Верхняя Река', 'UR', 1),
(1241, 79, 'вестерн', 'WE', 1),
(1242, 80, 'Абхазия', 'AB', 1),
(1243, 80, 'Аджария', 'AJ', 1),
(1244, 80, 'Тбилиси', 'TB', 1),
(1245, 80, 'Гурия', 'GU', 1),
(1246, 80, 'Имеретия', 'IM', 1),
(1247, 80, 'Кахетия', 'KA', 1),
(1248, 80, 'Квемо Картли', 'KK', 1),
(1249, 80, 'Мцхета-Мтианети', 'MM', 1),
(1250, 80, 'Рача Лечхуми и Квемо Сванет', 'RL', 1),
(1251, 80, 'Самегрело-Земо Сванети', 'SZ', 1),
(1252, 80, 'Самцхе-Джавахети', 'SJ', 1),
(1253, 80, 'Шида Картли', 'SK', 1),
(1254, 81, 'Баден-Вюртемберг', 'BAW', 1),
(1255, 81, 'Бавария', 'BAY', 1),
(1256, 81, 'Берлин', 'BER', 1),
(1257, 81, 'Бранденбург', 'BRG', 1),
(1258, 81, 'бремен', 'BRE', 1),
(1259, 81, 'Гамбург', 'HAM', 1),
(1260, 81, 'Гессен', 'HES', 1),
(1261, 81, 'Мекленбург-Передняя Померания', 'MEC', 1),
(1262, 81, 'Нидерсахсен', 'NDS', 1),
(1263, 81, 'Северный Рейн-Вестфалия', 'NRW', 1),
(1264, 81, 'Рейнланд-Пфальц', 'RHE', 1),
(1265, 81, 'Саар', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Ангальт', 'SAC', 1),
(1268, 81, 'Шлезвиг-Гольштейн', 'SCN', 1),
(1269, 81, 'Тюрингия', 'THE', 1),
(1270, 82, 'Регион Ашанти', 'AS', 1),
(1271, 82, 'Регион Бронг-Ахафо', 'BA', 1),
(1272, 82, 'Центральный регион', 'CE', 1),
(1273, 82, 'восточный регион', 'EA', 1),
(1274, 82, 'Большой Аккра', 'GA', 1),
(1275, 82, 'Северный регион', 'NO', 1),
(1276, 82, 'Верхний Восток', 'UE', 1),
(1277, 82, 'Верхний Запад Регион', 'UW', 1),
(1278, 82, 'Вольта', 'VO', 1),
(1279, 82, 'Западный регион', 'WE', 1),
(1280, 84, 'Аттика', 'AT', 1),
(1281, 84, 'Центральная Греция', 'CN', 1),
(1282, 84, 'Центральная Македония', 'CM', 1),
(1283, 84, 'Крит', 'CR', 1),
(1284, 84, 'Восточная Македония и Фракия', 'EM', 1),
(1285, 84, 'Эпир', 'EP', 1),
(1286, 84, 'Ионические острова', 'II', 1),
(1287, 84, 'Северное Эгейское море', 'NA', 1),
(1288, 84, 'Пелопоннес', 'PP', 1),
(1289, 84, 'Южные Эгейские острова', 'SA', 1),
(1290, 84, 'Фессалия', 'TH', 1),
(1291, 84, 'Западная Греция', 'WG', 1),
(1292, 84, 'Западная Македония', 'WM', 1),
(1293, 85, 'Аваннаа', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Китаа', 'K', 1),
(1296, 86, 'Святой Андрей', 'A', 1),
(1297, 86, 'Святой Давид', 'D', 1),
(1298, 86, 'Святой Георгий', 'G', 1),
(1299, 86, 'Святой Иоанн', 'J', 1),
(1300, 86, 'Святой Марк', 'M', 1),
(1301, 86, 'Святой Патрик', 'P', 1),
(1302, 86, 'Карриаку', 'C', 1),
(1303, 86, 'Пети Мартиника', 'Q', 1),
(1304, 89, 'Альта Верапаз', 'AV', 1),
(1305, 89, 'Баха Верапаз', 'BV', 1),
(1306, 89, 'Чимальтенанго', 'CM', 1),
(1307, 89, 'Чикумула', 'CQ', 1),
(1308, 89, 'Эль Петен', 'PE', 1),
(1309, 89, 'Эль Прогресо', 'PR', 1),
(1310, 89, 'Эль Киче', 'QC', 1),
(1311, 89, 'Эскуинтла', 'ES', 1),
(1312, 89, 'Гватемала', 'GU', 1),
(1313, 89, 'Уэуэтенанго', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Халапа', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Реталулеу', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'Сан Маркос', 'SM', 1),
(1321, 89, 'Санта Роза', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Тотоникапан', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Конакри', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Боффа', 'BFA', 1),
(1329, 90, 'Боке', 'BOK', 1),
(1330, 90, 'Коя', 'COY', 1),
(1331, 90, 'Дабола', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Дубрека', 'DBR', 1),
(1335, 90, 'Фарана', 'FRN', 1),
(1336, 90, 'Форекарья', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Канкан', 'KNK', 1),
(1341, 90, 'Керуане', 'KRN', 1),
(1342, 90, 'Киндиа', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Кубиа', 'KBA', 1),
(1345, 90, 'Кундара', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Лабе', 'LAB', 1),
(1348, 90, 'Лелума', 'LLM', 1),
(1349, 90, 'Лола', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Мали', 'MAL', 1),
(1352, 90, 'Маму', 'MAM', 1),
(1353, 90, 'Мандиана', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'пита', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Телимеле', 'TLM', 1),
(1358, 90, 'Туге', 'TOG', 1),
(1359, 90, 'Йому', 'YOM', 1),
(1360, 91, 'Бафата Регион', 'BF', 1),
(1361, 91, 'Биомбо Регион', 'BB', 1),
(1362, 91, 'Бисау Регион', 'BS', 1),
(1363, 91, 'Боламский край', 'BL', 1),
(1364, 91, 'Регион Кашеу', 'CA', 1),
(1365, 91, 'Габу Регион', 'GA', 1),
(1366, 91, 'Регион Ойо', 'OI', 1),
(1367, 91, 'Кинара Регион', 'QU', 1),
(1368, 91, 'Томбали Регион', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Кайуни-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'Восточный Бербис-Корентайн', 'EC', 1),
(1373, 92, 'Острова Эссекибо-Западная Демерара', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Померун-Супенаам', 'PM', 1),
(1376, 92, 'Potaro-Сипаруни', 'PI', 1),
(1377, 92, 'Верхняя Демерара-Бербис', 'UD', 1),
(1378, 92, 'Верхний Такуту-Верхний Эссекибо', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Центр', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Плоский остров', 'F', 1),
(1389, 94, 'Остров Макдональд', 'M', 1),
(1390, 94, 'Остров Шаг', 'S', 1),
(1391, 94, 'Остров Херд', 'H', 1),
(1392, 95, 'Атлантида', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Двоеточие', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Копан', 'CP', 1),
(1397, 95, 'кортесы', 'CR', 1),
(1398, 95, 'Эль Параисо', 'PA', 1),
(1399, 95, 'Франциско Морасан', 'FM', 1),
(1400, 95, 'Грасиас а Диос', 'GD', 1),
(1401, 95, 'Интибука', 'IN', 1),
(1402, 95, 'Ислас де ла Баия (Бэй Острова)', 'IB', 1),
(1403, 95, 'Ла Пас', 'PZ', 1),
(1404, 95, 'Лемпира', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Оланхо', 'OL', 1),
(1407, 95, 'Санта Барбара', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Центральный и Западный остров Гонконг', 'HCW', 1),
(1411, 96, 'Восточный остров Гонконг', 'HEA', 1),
(1412, 96, 'Южный остров Гонконг', 'HSO', 1),
(1413, 96, 'Ван Чай Остров Гонг Конг', 'HWC', 1),
(1414, 96, 'Коулун Город Коулун', 'KKC', 1),
(1415, 96, 'Квун Тонг Коулун', 'KKT', 1),
(1416, 96, 'Шам Шуй По Коулун', 'KSS', 1),
(1417, 96, 'Вонг Тай Син Коулун', 'KWT', 1),
(1418, 96, 'Яу Цим Монг Коулун', 'KYT', 1),
(1419, 96, 'Острова Новые Территории', 'NIS', 1),
(1420, 96, 'Квай Цин Новые Территории', 'NKT', 1),
(1421, 96, 'Северные новые территории', 'NNO', 1),
(1422, 96, 'Сай Кунг Новые Территории', 'NSK', 1),
(1423, 96, 'Ша Тин Новые Территории', 'NST', 1),
(1424, 96, 'Тай По Новые Территории', 'NTP', 1),
(1425, 96, 'Цуань Ван Новые Территории', 'NTW', 1),
(1426, 96, 'Туен Мун Новые Территории', 'NTM', 1),
(1427, 96, 'Юэн Лонг Новые Территории', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Норурленд Эйстра', 'NE', 1),
(1470, 98, 'Norourland Vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Андаманские и Никобарские острова', 'AN', 1),
(1476, 99, 'Андхра-Прадеш', 'AP', 1),
(1477, 99, 'Аруначал-Прадеш', 'AR', 1),
(1478, 99, 'Ассам', 'AS', 1),
(1479, 99, 'Бихар', 'BI', 1),
(1480, 99, 'Чандигарх', 'CH', 1),
(1481, 99, 'Дадра и Нагар Хавели', 'DA', 1),
(1482, 99, 'Даман и Диу', 'DM', 1),
(1483, 99, 'Дели', 'DE', 1),
(1484, 99, 'Гоа', 'GO', 1),
(1485, 99, 'Гуджарат', 'GU', 1),
(1486, 99, 'Харьяны', 'HA', 1),
(1487, 99, 'Химачал-Прадеш', 'HP', 1),
(1488, 99, 'Джамму и Кашмир', 'JA', 1),
(1489, 99, 'Карнатака', 'KA', 1),
(1490, 99, 'Керала', 'KE', 1),
(1491, 99, 'Лакшадвипские острова', 'LI', 1),
(1492, 99, 'Мадхья Прадеш', 'MP', 1),
(1493, 99, 'Махараштра', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Нагаланд', 'NA', 1),
(1498, 99, 'Орисса', 'OR', 1),
(1499, 99, 'Пондишери', 'PO', 1),
(1500, 99, 'Пенджаб', 'PU', 1),
(1501, 99, 'Раджастхан', 'RA', 1),
(1502, 99, 'Сикким', 'SI', 1),
(1503, 99, 'Тамил Наду', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Уттар Прадеш', 'UP', 1),
(1506, 99, 'Западная Бенгалия', 'WB', 1),
(1507, 100, 'Ачех', 'AC', 1),
(1508, 100, 'Бали', 'BA', 1),
(1509, 100, 'Бантен', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'Калимантан Утара', 'BD', 1),
(1512, 100, 'Горонтало', 'GO', 1),
(1513, 100, 'Джакарта', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Джава Барат', 'JB', 1),
(1516, 100, 'Джава Тенга', 'JT', 1),
(1517, 100, 'Джава Тимур', 'JI', 1),
(1518, 100, 'Калимантан Барат', 'KB', 1),
(1519, 100, 'Калимантан Селатан', 'KS', 1),
(1520, 100, 'Калимантан Тенга', 'KT', 1),
(1521, 100, 'Калимантан Тимур', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Лампунг', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Малуку Утара', 'MU', 1),
(1526, 100, 'Нуса Тенгара Барат', 'NB', 1),
(1527, 100, 'Нуса Тенгара Тимур', 'NT', 1),
(1528, 100, 'Папуа', 'PA', 1),
(1529, 100, 'Риау', 'RI', 1),
(1530, 100, 'Сулавеси Селатан', 'SN', 1),
(1531, 100, 'Сулавеси Тенга', 'ST', 1),
(1532, 100, 'Сулавеси Тенгара', 'SG', 1),
(1533, 100, 'Сулавеси Утара', 'SA', 1),
(1534, 100, 'Суматра Барат', 'SB', 1),
(1535, 100, 'Суматра Селатан', 'SS', 1),
(1536, 100, 'Суматра Утара', 'SU', 1),
(1537, 100, 'Джокьякарта', 'YO', 1),
(1538, 101, 'Тегеран', 'TEH', 1),
(1539, 101, 'Кома', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Казвин', 'QAZ', 1),
(1542, 101, 'Гилян', 'GIL', 1),
(1543, 101, 'Ардебиль', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'Восточный Азарбаджан', 'EAZ', 1),
(1546, 101, 'Западный Азербаджан', 'WEZ', 1),
(1547, 101, 'Курдистан', 'KRD', 1),
(1548, 101, 'Хамадан', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Илама', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Чахар Махал и Бахтиари', 'CMB', 1),
(1554, 101, 'Кохкилуех и покупатель Ахмад', 'KBA', 1),
(1555, 101, 'Бушер', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Систан и Белуджистан', 'SBL', 1),
(1559, 101, 'Керман', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Исфахан', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Мазендерана', 'MZD', 1),
(1564, 101, 'Гулистан', 'GLS', 1),
(1565, 101, 'Северный Хорасан', 'NKH', 1),
(1566, 101, 'Разави Хорасан', 'RKH', 1),
(1567, 101, 'Южный Хорасан', 'SKH', 1),
(1568, 102, 'Багдад', 'BD', 1),
(1569, 102, 'Салах ад Дин', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Аль Басра', 'BA', 1),
(1574, 102, 'Ди Кар', 'DQ', 1),
(1575, 102, 'Аль Мутанна', 'MU', 1),
(1576, 102, 'Аль Кадисья', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Аль Кербела', 'KB', 1),
(1579, 102, 'Наджаф', 'NJ', 1),
(1580, 102, 'Аль Анбар', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Дахук', 'DH', 1),
(1583, 102, 'Эрбиль', 'AL', 1),
(1584, 102, 'В Таим', 'TM', 1),
(1585, 102, 'В Сулеймании', 'SL', 1),
(1586, 103, 'Карлов', 'CA', 1),
(1587, 103, 'Каван', 'CV', 1),
(1588, 103, 'Клэр', 'CL', 1),
(1589, 103, 'пробковый', 'CO', 1),
(1590, 103, 'ДОНЕГОЛ', 'DO', 1),
(1591, 103, 'Дублин', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Керри', 'KE', 1),
(1594, 103, 'Килдар', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Лимерик', 'LI', 1),
(1599, 103, 'Лонгфорд', 'LO', 1),
(1600, 103, 'Лаут', 'LU', 1),
(1601, 103, 'майонез', 'MA', 1),
(1602, 103, 'Мит', 'ME', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1603, 103, 'Монаган', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Роскоммон', 'RO', 1),
(1606, 103, 'Слайго', 'SL', 1),
(1607, 103, 'Типперери', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Вексфорд', 'WX', 1),
(1611, 103, 'Уиклоу', 'WI', 1),
(1612, 104, 'Беэр Шева', 'BS', 1),
(1613, 104, 'Бикаат Хаярден', 'BH', 1),
(1614, 104, 'Эйлат и Арава', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Хайфа', 'HA', 1),
(1617, 104, 'Горы Иегуда', 'JM', 1),
(1618, 104, 'Иерусалим', 'JE', 1),
(1619, 104, 'Негев', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Тель-Авив (Гош Дан)', 'TA', 1),
(3860, 105, 'Кальтаниссетта', 'CL', 1),
(3842, 105, 'Агридженто', 'AG', 1),
(3843, 105, 'Алессандрия', 'AL', 1),
(3844, 105, 'Анкона', 'AN', 1),
(3845, 105, 'Аоста', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Асколи Пичено', 'AP', 1),
(3848, 105, 'Асти', 'AT', 1),
(3849, 105, 'Авеллино', 'AV', 1),
(3850, 105, 'Бари', 'BA', 1),
(3851, 105, 'Беллуно', 'BL', 1),
(3852, 105, 'Беневенто', 'BN', 1),
(3853, 105, 'Бергамо', 'BG', 1),
(3854, 105, 'Биэлла', 'BI', 1),
(3855, 105, 'Болонья', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Бриндиси', 'BR', 1),
(3859, 105, 'Кальяри', 'CA', 1),
(1643, 106, 'Кларендон Приход', 'CLA', 1),
(1644, 106, 'Ганноверская волость', 'HAN', 1),
(1645, 106, 'Кингстон Приход', 'KIN', 1),
(1646, 106, 'Манчестерский Приход', 'MAN', 1),
(1647, 106, 'Портленд Приход', 'POR', 1),
(1648, 106, 'Приход Святого Андрея', 'AND', 1),
(1649, 106, 'Приход Святой Анны', 'ANN', 1),
(1650, 106, 'Приход Святой Екатерины', 'CAT', 1),
(1651, 106, 'Приход Святой Елизаветы', 'ELI', 1),
(1652, 106, 'Приход Святого Джеймса', 'JAM', 1),
(1653, 106, 'Приход Святой Марии', 'MAR', 1),
(1654, 106, 'Приход Святого Томаса', 'THO', 1),
(1655, 106, 'Трелевская волость', 'TRL', 1),
(1656, 106, 'Вестморленд Пэриш', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Акита', 'AK', 1),
(1659, 107, 'Аомори', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Эхимэ', 'EH', 1),
(1662, 107, 'Фукуи', 'FK', 1),
(1663, 107, 'Фукуока', 'FU', 1),
(1664, 107, 'Фукусима', 'FS', 1),
(1665, 107, 'Гифу', 'GI', 1),
(1666, 107, 'гумма', 'GU', 1),
(1667, 107, 'Хиросима', 'HI', 1),
(1668, 107, 'Хоккайдо', 'HO', 1),
(1669, 107, 'Хего', 'HY', 1),
(1670, 107, 'Ибараки', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Ивате', 'IW', 1),
(1673, 107, 'Кагава', 'KA', 1),
(1674, 107, 'Кагосима', 'KG', 1),
(1675, 107, 'Канагава', 'KN', 1),
(1676, 107, 'Коти', 'KO', 1),
(1677, 107, 'Кумамото', 'KU', 1),
(1678, 107, 'Киото', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Мияги', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Нагано', 'NA', 1),
(1683, 107, 'Нагасаки', 'NG', 1),
(1684, 107, 'Нара', 'NR', 1),
(1685, 107, 'Ниигата', 'NI', 1),
(1686, 107, 'Оита', 'OI', 1),
(1687, 107, 'Окаяма', 'OK', 1),
(1688, 107, 'Окинава', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'сага', 'SA', 1),
(1691, 107, 'Сайтама', 'SI', 1),
(1692, 107, 'Сига', 'SH', 1),
(1693, 107, 'Шимане', 'SM', 1),
(1694, 107, 'Сидзуока', 'SZ', 1),
(1695, 107, 'Точиги', 'TO', 1),
(1696, 107, 'Токусима', 'TS', 1),
(1697, 107, 'Токио', 'TK', 1),
(1698, 107, 'Тоттори', 'TT', 1),
(1699, 107, 'Тояма', 'TY', 1),
(1700, 107, 'Вакаяма', 'WA', 1),
(1701, 107, 'Ямагата', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Яманаси', 'YN', 1),
(1704, 108, 'Амман', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Аль-Акаба', 'AA', 1),
(1707, 108, 'Аль Балка', 'AB', 1),
(1708, 108, 'Аль Карак', 'AK', 1),
(1709, 108, 'Аль Мафрак', 'AL', 1),
(1710, 108, 'В тафилах', 'AT', 1),
(1711, 108, 'Аз Зарка', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Маан', 'MA', 1),
(1715, 108, 'Мадаба', 'MD', 1),
(1716, 109, 'Алматы (город)', 'AL', 1),
(1717, 109, 'Алматы', 'AC', 1),
(1718, 109, 'Акмолинская', 'AM', 1),
(1719, 109, 'Актюбинск', 'AQ', 1),
(1720, 109, 'Астана', 'AS', 1),
(1721, 109, 'Атырау', 'AT', 1),
(1722, 109, 'Батыс', 'BA', 1),
(1723, 109, 'Город Байконгир', 'BY', 1),
(1724, 109, 'Мангыстау', 'MA', 1),
(1725, 109, 'Туркестанская область', 'ON', 1),
(1726, 109, 'Павлодар', 'PA', 1),
(1727, 109, 'Карагандинская', 'QA', 1),
(1728, 109, 'Костанайская', 'QO', 1),
(1729, 109, 'Кызылординская', 'QY', 1),
(1730, 109, 'Шыгыс', 'SH', 1),
(1731, 109, 'Солтустик', 'SO', 1),
(1732, 109, 'Жамбылская', 'ZH', 1),
(1733, 110, 'центральный', 'CE', 1),
(1734, 110, 'берег', 'CO', 1),
(1735, 110, 'восточный', 'EA', 1),
(1736, 110, 'Район Найроби', 'NA', 1),
(1737, 110, 'Северо-восточный', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Рифтовая долина', 'RV', 1),
(1740, 110, 'вестерн', 'WE', 1),
(1741, 111, 'Абаианг', 'AG', 1),
(1742, 111, 'Абемама', 'AM', 1),
(1743, 111, 'Аранука', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Беру', 'BE', 1),
(1747, 111, 'Бутаритари', 'bT', 1),
(1748, 111, 'Кантон', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Курия', 'KU', 1),
(1751, 111, 'Маиана', 'MI', 1),
(1752, 111, 'Макин', 'MN', 1),
(1753, 111, 'Маракеи', 'ME', 1),
(1754, 111, 'Никунау', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Онотоа', 'ON', 1),
(1757, 111, 'Табитеуэа', 'TT', 1),
(1758, 111, 'Табуаэран', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Тарава', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Чагандо', 'CHA', 1),
(1763, 112, 'Хамгён-bukto', 'HAB', 1),
(1764, 112, 'Хамгён-Намдо', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-Намдо', 'HWN', 1),
(1767, 112, 'Кангвон', 'KAN', 1),
(1768, 112, 'Пхеньян bukto', 'PYB', 1),
(1769, 112, 'Пхеньян-Намдо', 'PYN', 1),
(1770, 112, 'Рянганг-до (Yanggang-до)', 'YAN', 1),
(1771, 112, 'Расон напрямую управляемый город', 'NAJ', 1),
(1772, 112, 'Особый Город Пхеньян', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-Намдо', 'CH', 1),
(1775, 113, 'Чеджу-до', 'CD', 1),
(1776, 113, 'Чолла-bukto', 'CB', 1),
(1777, 113, 'Чолла-Намдо', 'CN', 1),
(1778, 113, 'Чемульпо-gwangyoksi', 'IG', 1),
(1779, 113, 'Кангвон', 'KA', 1),
(1780, 113, 'Кванджу-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-делать', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-Намдо', 'KN', 1),
(1784, 113, 'Пусан-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Тэгу-gwangyoksi', 'TA', 1),
(1787, 113, 'Тэджон-gwangyoksi', 'TG', 1),
(1788, 114, 'Аль Асима', 'AL', 1),
(1789, 114, 'Аль Ахмади', 'AA', 1),
(1790, 114, 'Аль Фарвания', 'AF', 1),
(1791, 114, 'Аль Джахра', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Бишкек', 'GB', 1),
(1794, 115, 'Баткенская', 'B', 1),
(1795, 115, 'Чу', 'C', 1),
(1796, 115, 'Жалал-Абад', 'J', 1),
(1797, 115, 'Нарын', 'N', 1),
(1798, 115, 'Ош', 'O', 1),
(1799, 115, 'Талас', 'T', 1),
(1800, 115, 'Ысык-Кол', 'Y', 1),
(1801, 116, 'Вьентьян', 'VT', 1),
(1802, 116, 'Аттапу', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Боликхамсай', 'BL', 1),
(1805, 116, 'Чампасак', 'CH', 1),
(1806, 116, 'Хуапхан', 'HO', 1),
(1807, 116, 'Кхаммуан', 'KH', 1),
(1808, 116, 'Луанг Намта', 'LM', 1),
(1809, 116, 'Луангпхабанг', 'LP', 1),
(1810, 116, 'Удомсай', 'OU', 1),
(1811, 116, 'Пхонгсали', 'PH', 1),
(1812, 116, 'Салаван', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Вьентьян', 'VI', 1),
(1815, 116, 'Сайнябули', 'XA', 1),
(1816, 116, 'Секонг', 'XE', 1),
(1817, 116, 'Сиангкхуанг', 'XI', 1),
(1818, 116, 'Сайсомбун', 'XN', 1),
(1852, 119, 'Верия', 'BE', 1),
(1853, 119, 'Butha-Буте', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Масеру', 'MS', 1),
(1857, 119, 'Мохале Хук', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Таб-Цек', 'TT', 1),
(1862, 120, 'Боми', 'BI', 1),
(1863, 120, 'Бонг', 'BG', 1),
(1864, 120, 'Гранд Басса', 'GB', 1),
(1865, 120, 'Гранд Кейп Маунт', 'CM', 1),
(1866, 120, 'Гранд Геде', 'GG', 1),
(1867, 120, 'Гранд Кру', 'GK', 1),
(1868, 120, 'Лоффа', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Мэриленд', 'ML', 1),
(1871, 120, 'Монтсеррадо', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'Река Сесс', 'RC', 1),
(1874, 120, 'Сино', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Аль Азизия', 'AZ', 1),
(1877, 121, 'Аль Фатих', 'FA', 1),
(1878, 121, 'Аль Джабал Аль Ахдар', 'JA', 1),
(1879, 121, 'Аль Джуфра', 'JU', 1),
(1880, 121, 'Аль Хумс', 'KH', 1),
(1881, 121, 'Аль Куфра', 'KU', 1),
(1882, 121, 'Нукат аль Хамс', 'NK', 1),
(1883, 121, 'Аш Шати', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Аз Завия', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Мурзук', 'MZ', 1),
(1892, 121, 'Сабха', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Тарабулус (Триполи)', 'TL', 1),
(1896, 121, 'Тархун-в', 'TH', 1),
(1897, 121, 'Тобрук', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Злитан', 'ZL', 1),
(1900, 122, 'Вадуц', 'V', 1),
(1901, 122, 'Шаан', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Тризен', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Шелленберг', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Алитус', 'AL', 1),
(1912, 123, 'Каунас', 'KA', 1),
(1913, 123, 'Клайпеда', 'KL', 1),
(1914, 123, 'Мариямполе', 'MA', 1),
(1915, 123, 'Паневежис', 'PA', 1),
(1916, 123, 'Шяуляй', 'SI', 1),
(1917, 123, 'Таураге', 'TA', 1),
(1918, 123, 'Тельшяй', 'TE', 1),
(1919, 123, 'Утена', 'UT', 1),
(1920, 123, 'Вильнюс', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Эхтернаха', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Люксембург', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Эш-сюр-Alzette', 'LE', 1),
(1932, 124, 'Мерш', 'LM', 1),
(1933, 125, 'Приход Богоматери Фатимы', 'OLF', 1),
(1934, 125, 'Приход Святого Антония', 'ANT', 1),
(1935, 125, 'Приход Святого Лазаря', 'LAZ', 1),
(1936, 125, 'Кафедральный приход', 'CAT', 1),
(1937, 125, 'Приход Святого Лаврентия', 'LAW', 1),
(1938, 127, 'Антананариву', 'AN', 1),
(1939, 127, 'Анциранана', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Чикуава', 'CKW', 1),
(1947, 128, 'Чирадзулу', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Дедза', 'DDZ', 1),
(1950, 128, 'дова', 'DWA', 1),
(1951, 128, 'Каронга', 'KRG', 1),
(1952, 128, 'Касунгу', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Лилонгве', 'LLG', 1),
(1955, 128, 'Мачинга', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Мчинджи', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Мванзы', 'MWZ', 1),
(1960, 128, 'Мзимба', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Залив Нхата', 'NKB', 1),
(1963, 128, 'Нкотакота', 'NKH', 1),
(1964, 128, 'Нсанье', 'NSJ', 1),
(1965, 128, 'Нтчиси', 'NTI', 1),
(1966, 128, 'Фаломбе', 'PHL', 1),
(1967, 128, 'Румпхи', 'RMP', 1),
(1968, 128, 'Салима', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Джохор', 'MY-01', 1),
(1972, 129, 'Кеды', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Лабуан', 'MY-15', 1),
(1975, 129, 'Малакка', 'MY-04', 1),
(1976, 129, 'Негери Сембилан', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Перак', 'MY-08', 1),
(1979, 129, 'Перлис', 'MY-09', 1),
(1980, 129, 'Пулау Пинанг', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Саравак', 'MY-13', 1),
(1983, 129, 'Селангор', 'MY-10', 1),
(1984, 129, 'Теренгану', 'MY-11', 1),
(1985, 129, 'Куала Лумпур', 'MY-14', 1),
(4035, 129, 'Путраджайская', 'MY-16', 1),
(1986, 130, 'Тиладхунмати Утуру', 'THU', 1),
(1987, 130, 'Тиладхунмати Декуну', 'THD', 1),
(1988, 130, 'Миладхунмадулу Утуру', 'MLU', 1),
(1989, 130, 'Миладхунмадулу Декуну', 'MLD', 1),
(1990, 130, 'Маалхосмадулу Утуру', 'MAU', 1),
(1991, 130, 'Маалхосмадулу Декуну', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Мужской Атолл', 'MAA', 1),
(1994, 130, 'Ари Атолл Утуру', 'AAU', 1),
(1995, 130, 'Ари Атолл Декну', 'AAD', 1),
(1996, 130, 'Атолл Фелидхе', 'FEA', 1),
(1997, 130, 'Атолл Мулаку', 'MUA', 1),
(1998, 130, 'Атолл Ниландх Утуру', 'NAU', 1),
(1999, 130, 'Атолл Ниландхе Декуну', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Атолл Хувадху Утхуру', 'HAU', 1),
(2003, 130, 'Атолл Хувадху Декуну', 'HAD', 1),
(2004, 130, 'Фуа Мулаку', 'FMU', 1),
(2005, 130, 'Адду', 'ADD', 1),
(2006, 131, 'Гао', 'GA', 1),
(2007, 131, 'Кайс', 'KY', 1),
(2008, 131, 'Кидал', 'KD', 1),
(2009, 131, 'Куликоро', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Сегу', 'SG', 1),
(2012, 131, 'Сикасо', 'SK', 1),
(2013, 131, 'Томбукту', 'TB', 1),
(2014, 131, 'Бамако Столичный Район', 'CD', 1),
(2015, 132, 'Аттард', 'ATT', 1),
(2016, 132, 'Бальзан', 'BAL', 1),
(2017, 132, 'Биргу', 'BGU', 1),
(2018, 132, 'Биркиркара', 'BKK', 1),
(2019, 132, 'Бирзеббуджа', 'BRZ', 1),
(2020, 132, 'Бормла', 'BOR', 1),
(2021, 132, 'Динли', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Флориана', 'FLO', 1),
(2024, 132, 'Гудья', 'GDJ', 1),
(2025, 132, 'Гзира', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Иклин', 'IKL', 1),
(2030, 132, 'Исла', 'ISL', 1),
(2031, 132, 'Калкара', 'KLK', 1),
(2032, 132, 'Киркоп', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Марсашлок', 'MXL', 1),
(2038, 132, 'Мдина', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Моста', 'MST', 1),
(2042, 132, 'М\'абба', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Мтарфа', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Пембрук', 'PEM', 1),
(2048, 132, 'пиета', 'PIE', 1),
(2049, 132, 'Корми', 'QOR', 1),
(2050, 132, 'Ренди', 'QRE', 1),
(2051, 132, 'Рабат', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'Сан Гильян', 'SGI', 1),
(2054, 132, 'Санта Люсия', 'SLU', 1),
(2055, 132, 'Сан-Павл-иль-Бахар', 'SPB', 1),
(2056, 132, 'Сан Гванн', 'SGW', 1),
(2057, 132, 'Санта венера', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Слима', 'SLM', 1),
(2060, 132, 'Свийи', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Валлетта', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Заббар', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Зейтун', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Керч', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Калы', 'QAL', 1),
(2077, 132, 'Виктория', 'VIC', 1),
(2078, 132, 'Сан Лоуренц', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Аилук', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Бикар', 'BKR', 1),
(2089, 133, 'Бикини', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'эбеновый', 'EBN', 1),
(2092, 133, 'Эниветок', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Джалуит', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Кили', 'KIL', 1),
(2098, 133, 'Кваджалейн', 'KWJ', 1),
(2099, 133, 'Лаэ', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Ликиеп', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Малоэлап', 'MLP', 1),
(2104, 133, 'Меджит', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Наморик', 'NMK', 1),
(2107, 133, 'Нам', 'NAM', 1),
(2108, 133, 'Ронгелап', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'затяжка', 'TOK', 1),
(2111, 133, 'Уджаэ', 'UJA', 1),
(2112, 133, 'Уджеланг', 'UJL', 1),
(2113, 133, 'Утирик', 'UTK', 1),
(2114, 133, 'Вото', 'WTH', 1),
(2115, 133, 'Вотье', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Ассаба', 'AS', 1),
(2118, 135, 'Бракна', 'BR', 1),
(2119, 135, 'Дахлет Нуадибу', 'DN', 1),
(2120, 135, 'Горголь', 'GO', 1),
(2121, 135, 'Гуидимака', 'GM', 1),
(2122, 135, 'Ход Эч Чарги', 'HC', 1),
(2123, 135, 'Ход эль Гарби', 'HG', 1),
(2124, 135, 'Иншири', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Тирис Земмур', 'TZ', 1),
(2127, 135, 'Трарза', 'TR', 1),
(2128, 135, 'Нуакшот', 'NO', 1),
(2129, 136, 'Бо Бассен-Роуз Хилл', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Порт луи', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Агалега острова', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (острова Сент-Брэндон)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Черная река', 'BL', 1),
(2138, 136, 'Флак', 'FL', 1),
(2139, 136, 'Гранд Порт', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Плейнс Вильхемс', 'PW', 1),
(2143, 136, 'Порт луи', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Нижняя Калифорния Норте', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Кампече', 'CA', 1),
(2149, 138, 'Чьяпас', 'CI', 1),
(2150, 138, 'Чихуахуа', 'CH', 1),
(2151, 138, 'Коауила де Сарагоса', 'CZ', 1),
(2152, 138, 'Колыма', 'CL', 1),
(2153, 138, 'Федеральный округ', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Гуанахуато', 'GA', 1),
(2156, 138, 'Герреро', 'GE', 1),
(2157, 138, 'Идальго', 'HI', 1),
(2158, 138, 'Халиско', 'JA', 1),
(2159, 138, 'Мексика', 'ME', 1),
(2160, 138, 'Мичоакан де Окампо', 'MI', 1),
(2161, 138, 'Морелос', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Нуэво Леон', 'NL', 1),
(2164, 138, 'Оахака', 'OA', 1),
(2165, 138, 'Пуэбла', 'PU', 1),
(2166, 138, 'Керетаро де Артеага', 'QA', 1),
(2167, 138, 'Кинтана Роо', 'QR', 1),
(2168, 138, 'Сан Луис Потоси', 'SA', 1),
(2169, 138, 'Синалоа', 'SI', 1),
(2170, 138, 'Сонора', 'SO', 1),
(2171, 138, 'табаско', 'TB', 1),
(2172, 138, 'Тамаулипас', 'TM', 1),
(2173, 138, 'Тлашкала', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Юкатан', 'YU', 1),
(2176, 138, 'Сакатекас', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'тявкать', 'Y', 1),
(2181, 140, 'гагаузия', 'GA', 1),
(2182, 140, 'Кишинев', 'CU', 1),
(2183, 140, 'Бельцы', 'BA', 1),
(2184, 140, 'Кагул', 'CA', 1),
(2185, 140, 'Единец', 'ED', 1),
(2186, 140, 'Лапушна', 'LA', 1),
(2187, 140, 'Оргеев', 'OR', 1),
(2188, 140, 'Сорока', 'SO', 1),
(2189, 140, 'Бендеры', 'TI', 1),
(2190, 140, 'Унгень', 'UN', 1),
(2191, 140, 'Stnga Nistrului', 'SN', 1),
(2192, 141, 'Фонтвьей', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Монако-Виль', 'MV', 1),
(2195, 141, 'Монте-Карло', 'MC', 1),
(2196, 142, 'Улан-Баторе', '1', 1),
(2197, 142, 'Орхон', '035', 1),
(2198, 142, 'Дархан уул', '037', 1),
(2199, 142, 'Хэнтий', '039', 1),
(2200, 142, 'Хубсугул', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Тов', '047', 1),
(2204, 142, 'Селенга', '049', 1),
(2205, 142, 'Сухбатар', '051', 1),
(2206, 142, 'Умнеговь', '053', 1),
(2207, 142, 'Ара-Хангайский аймак', '055', 1),
(2208, 142, 'Дзабханская', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Гоби-Sumber', '064', 1),
(2213, 142, 'Гоби-Алтай', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Баянхонгор', '069', 1),
(2216, 142, 'Баян-Улэгэйский аймак', '071', 1),
(2217, 142, 'Архангай', '073', 1),
(2218, 143, 'Святой Антоний', 'A', 1),
(2219, 143, 'Святой Жорж', 'G', 1),
(2220, 143, 'Святой петр', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Эль-Хосейма', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Бени Меллал', 'BME', 1),
(2225, 144, 'Бен Слиман', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Касабланка', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'Эль Джадида', 'EJA', 1),
(2230, 144, 'Эль Келаа де Срагна', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Эс-Сувейра', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Кенитра', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Кенитра', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Марракеш', 'MRK', 1),
(2244, 144, 'Мекнес', 'MKN', 1),
(2245, 144, 'Надор', 'NAD', 1),
(2246, 144, 'Варзазат', 'ORZ', 1),
(2247, 144, 'Ужда', 'OUJ', 1),
(2248, 144, 'Рабат-Сале', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Сиди Касем', 'SKA', 1),
(2252, 144, 'Танжер', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Таза', 'TAZ', 1),
(2258, 144, 'Тетуан', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Буждур', 'BJD', 1),
(2262, 144, 'Эс Смара', 'ESM', 1),
(2263, 145, 'Кабо Дельгадо', 'CD', 1),
(2264, 145, 'сектор Газа', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Мапуту (город)', 'MC', 1),
(2268, 145, 'Мапуту', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Тете', 'TE', 1),
(2273, 145, 'Замбезия', 'ZA', 1),
(2274, 146, 'Иравади', 'AY', 1),
(2275, 146, 'Пегу', 'BG', 1),
(2276, 146, 'Магуэй', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Янгон', 'YG', 1),
(2281, 146, 'Штат Чин', 'CH', 1),
(2282, 146, 'Государство Качин', 'KC', 1),
(2283, 146, 'Штат Кайя', 'KH', 1),
(2284, 146, 'Штат Кайин', 'KN', 1),
(2285, 146, 'Пн Государственный', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Государство Шан', 'SH', 1),
(2288, 147, 'Каприви', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Карась', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Омахеке', 'OK', 1),
(2297, 147, 'Омусати', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Ошикото', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Анабаро', 'AA', 1),
(2303, 148, 'Анетан', 'AT', 1),
(2304, 148, 'Анибаре', 'AI', 1),
(2305, 148, 'Баити', 'BA', 1),
(2306, 148, 'Бё', 'BO', 1),
(2307, 148, 'Буада', 'BU', 1),
(2308, 148, 'Денигомоду', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Июв', 'IJ', 1),
(2311, 148, 'Мененг', 'ME', 1),
(2312, 148, 'Нибок', 'NI', 1),
(2313, 148, 'Уабо', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Бхери', 'BH', 1),
(2317, 149, 'Давалагири', 'DH', 1),
(2318, 149, 'Гандаки', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Карнали', 'KA', 1),
(2321, 149, 'Коси', 'KO', 1),
(2322, 149, 'Лумбини', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Мечи', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Сагарматха', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Дренте', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Фрисландия', 'FR', 1),
(2332, 150, 'Гельдерланд', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Лимбург', 'LI', 1),
(2335, 150, 'Северный Брабант', 'NB', 1),
(2336, 150, 'Северная Голландия', 'NH', 1),
(2337, 150, 'Овэрейссел', 'OV', 1),
(2338, 150, 'Утрехт', 'UT', 1),
(2339, 150, 'Зееланд', 'ZE', 1),
(2340, 150, 'Южная Голландия', 'ZH', 1),
(2341, 152, 'Иль Лойот', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Окленд', 'AUK', 1),
(2345, 153, 'Залив изобилия', 'BOP', 1),
(2346, 153, 'Кентербери', 'CAN', 1),
(2347, 153, 'Коромандельский', 'COR', 1),
(2348, 153, 'Гисборн', 'GIS', 1),
(2349, 153, 'Фьордленд', 'FIO', 1),
(2350, 153, 'Хокс Бэй', 'HKB', 1),
(2351, 153, 'Марлборо', 'MBH', 1),
(2352, 153, 'Манавату Вангануй', 'MWT', 1),
(2353, 153, 'Гора Кук-Макензи', 'MCM', 1),
(2354, 153, 'нельсон', 'NSN', 1),
(2355, 153, 'Скандинавский полуостров', 'NTL', 1),
(2356, 153, 'Отаго', 'OTA', 1),
(2357, 153, 'область на юге', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Веллингтон', 'WGN', 1),
(2360, 153, 'Вайкато', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'западное побережье', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Боако', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Чинандеге', 'CI', 1),
(2368, 154, 'Чонталес', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Гранада', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Леон', 'LE', 1),
(2373, 154, 'Мадрис', 'MD', 1),
(2374, 154, 'Манагуа', 'MN', 1),
(2375, 154, 'Масая', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Нуэво Сеговия', 'NS', 1),
(2378, 154, 'Рио Сан Хуан', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Ниамей', 'NM', 1),
(2385, 155, 'Тахва', 'TH', 1),
(2386, 155, 'Тиллабери', 'TL', 1),
(2387, 155, 'Зиндер', 'ZD', 1),
(2388, 156, 'Авия', 'AB', 1),
(2389, 156, 'Абуджа Федеральная столичная территория', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Аква Ибом', 'AK', 1),
(2392, 156, 'Анамбре', 'AN', 1),
(2393, 156, 'Баучи', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'бенуэ', 'BN', 1),
(2396, 156, 'Борно', 'BO', 1),
(2397, 156, 'Кросс Ривер', 'CR', 1),
(2398, 156, 'дельта', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Энугу', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Имо', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Кадуны', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Катсина', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Коджи', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Лагос', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Нигер', 'NI', 1),
(2415, 156, 'Огун', 'OG', 1),
(2416, 156, 'Ондо', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Плато', 'PL', 1),
(2420, 156, 'Реки', 'RI', 1),
(2421, 156, 'Сокото', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Йобе', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Северные острова', 'N', 1),
(2426, 159, 'расписание дежурств', 'R', 1),
(2427, 159, 'Сайпан', 'S', 1),
(2428, 159, 'Тиниан', 'T', 1),
(2429, 160, 'Акерсхус', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Финнмарк', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'Больше ОГ Ромдал', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Оппланд', 'OP', 1),
(2440, 160, 'Осло', 'OL', 1),
(2441, 160, 'Рогаланда', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Согн-ог-Фьордане', 'SJ', 1),
(2444, 160, 'Шпицберген', 'SV', 1),
(2445, 160, 'Телемарк', 'TM', 1),
(2446, 160, 'Тромсе', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Вестфолд', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Аль Батина', 'BA', 1),
(2451, 161, 'Аль Вуста', 'WU', 1),
(2452, 161, 'Аш Шаркия', 'SH', 1),
(2453, 161, 'Аз Захира', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Зуфар', 'ZU', 1),
(2457, 162, 'Белуджистан', 'B', 1),
(2458, 162, 'Федерально управляемые племенные зоны', 'T', 1),
(2459, 162, 'Исламабад столичная территория', 'I', 1),
(2460, 162, 'Северо-Западная граница', 'N', 1),
(2461, 162, 'Пенджаб', 'P', 1),
(2462, 162, 'Синд', 'S', 1),
(2463, 163, 'Аимелиик', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Хатохобеи', 'HA', 1),
(2467, 163, 'Кайангел', 'KA', 1),
(2468, 163, 'Корор', 'KO', 1),
(2469, 163, 'Мелекеок', 'ME', 1),
(2470, 163, 'Нгараард', 'NA', 1),
(2471, 163, 'Нгархелонг', 'NG', 1),
(2472, 163, 'Нгардмау', 'ND', 1),
(2473, 163, 'Нгатпанг', 'NT', 1),
(2474, 163, 'Нгечесар', 'NC', 1),
(2475, 163, 'Нгеремленгуи', 'NR', 1),
(2476, 163, 'Нгивал', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Сонсорол', 'SO', 1),
(2479, 164, 'Бокас дель Торо', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Двоеточие', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Лос-Сантос', 'LS', 1),
(2486, 164, 'Панама', 'PA', 1),
(2487, 164, 'Сан Блас', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Бугенвиль', 'BV', 1),
(2490, 165, 'центральный', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Восточное нагорье', 'EH', 1),
(2493, 165, 'Восточная Новая Британия', 'EB', 1),
(2494, 165, 'Восточный Сепик', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'залив', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Манус', 'MN', 1),
(2499, 165, 'Милн Бэй', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'Национальная столица', 'NC', 1),
(2502, 165, 'Новая Ирландия', 'NI', 1),
(2503, 165, 'северный', 'NO', 1),
(2504, 165, 'Сандаун', 'SA', 1),
(2505, 165, 'Южное нагорье', 'SH', 1),
(2506, 165, 'вестерн', 'WE', 1),
(2507, 165, 'Западное нагорье', 'WH', 1),
(2508, 165, 'Западная Новая Британия', 'WB', 1),
(2509, 166, 'Альто Парагвай', 'AG', 1),
(2510, 166, 'Альто Парана', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Асунсьон', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Каасапа', 'CZ', 1),
(2516, 166, 'Каниндь', 'CN', 1),
(2517, 166, 'центральный', 'CE', 1),
(2518, 166, 'Консепсьон', 'CC', 1),
(2519, 166, 'подводная горная система', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Мисионес', 'MI', 1),
(2523, 166, 'Неембуку', 'NE', 1),
(2524, 166, 'Парагуари', 'PA', 1),
(2525, 166, 'Президенти Хейс', 'PH', 1),
(2526, 166, 'Сан Педро', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Арекипа', 'AR', 1),
(2531, 167, 'Аякучо', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Кальяо', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'управление по делам международного сотрудничества', 'IC', 1),
(2538, 167, 'Хунин', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Лима', 'LI', 1),
(2542, 167, 'Лорето', 'LO', 1),
(2543, 167, 'Мадре де Диос', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Паско', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Пуно', 'PU', 1),
(2548, 167, 'Сан Мартин', 'SM', 1),
(2549, 167, 'Такна', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Агусан дель Норте', 'ANO', 1),
(2554, 168, 'Агусан дель Сур', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Античный', 'ANT', 1),
(2558, 168, 'Апаяо', 'APY', 1),
(2559, 168, 'Аврора', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Батанес', 'BTE', 1),
(2563, 168, 'Батангаса', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Бохол', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Кагаян', 'CAG', 1),
(2570, 168, 'Камаринс Норте', 'CNO', 1),
(2571, 168, 'Камарин Сур', 'CSU', 1),
(2572, 168, 'Камигин', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Себу', 'CEB', 1),
(2577, 168, 'Компостела', 'CMP', 1),
(2578, 168, 'Давао дель Норте', 'DNO', 1),
(2579, 168, 'Давао дель Сур', 'DSU', 1),
(2580, 168, 'Давао Ориенталь', 'DOR', 1),
(2581, 168, 'Восточный Самар', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Йоило', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'пруд', 'LAG', 1),
(2590, 168, 'Ланао дель Норте', 'LNO', 1),
(2591, 168, 'Ланао дель Сур', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Лейте', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Миндоро Ориенталь', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Мисамис Ориенталь', 'MOR', 1),
(2601, 168, 'гора', 'MOP', 1),
(2602, 168, 'Негрос Западный', 'NOC', 1),
(2603, 168, 'Негры восточные', 'NOR', 1),
(2604, 168, 'Северный Котабато', 'NCT', 1),
(2605, 168, 'Северный Самар', 'NSM', 1),
(2606, 168, 'Нуэва Эсиха', 'NEC', 1),
(2607, 168, 'Нуэва Биская', 'NVZ', 1),
(2608, 168, 'Палаван', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'пангасинан', 'PNG', 1),
(2611, 168, 'Кесон', 'QZN', 1),
(2612, 168, 'Кирино', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Сорсогона', 'SRS', 1),
(2619, 168, 'Южный Котабато', 'SCO', 1),
(2620, 168, 'Южный Лейте', 'SLE', 1),
(2621, 168, 'Султан Кударат', 'SKU', 1),
(2622, 168, 'Сулу', 'SLU', 1),
(2623, 168, 'Суригао дель Норте', 'SNO', 1),
(2624, 168, 'Суригао дель Сур', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Тави-Тави', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Замбоанга дель Норте', 'ZNO', 1),
(2629, 168, 'Замбоанга дель Сур', 'ZSU', 1),
(2630, 168, 'Замбоанга Сибугай', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Люблинское', 'LL', 1),
(2635, 170, 'Любусское', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Опольское', 'OP', 1),
(2639, 170, 'Подкарпацкие', 'PP', 1),
(2640, 170, 'Подляское', 'PL', 1),
(2641, 170, 'Поморские', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Варминско-Мазурского', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Западнопоморском', 'ZA', 1),
(2647, 198, 'Сен-Пьер', 'P', 1),
(2648, 198, 'Микелон', 'M', 1),
(2649, 171, 'Açores', 'AC', 1),
(2650, 171, 'Авейру', 'AV', 1),
(2651, 171, 'Бея', 'BE', 1),
(2652, 171, 'Брага', 'BR', 1),
(2653, 171, 'Bragança', 'BA', 1),
(2654, 171, 'Каштелу-Бранку', 'CB', 1),
(2655, 171, 'Коимбра', 'CO', 1),
(2656, 171, 'Эвора', 'EV', 1),
(2657, 171, 'фараон', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Лейрия', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'мадера', 'ME', 1),
(2662, 171, 'Порталегра', 'PO', 1),
(2663, 171, 'Порту', 'PR', 1),
(2664, 171, 'Santarém', 'SA', 1),
(2665, 171, 'Сетубал', 'SE', 1),
(2666, 171, 'Виана-ду-Каштелу', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Висеу', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Аль Гуаверия', 'GW', 1),
(2671, 173, 'Аль Джумайлия', 'JM', 1),
(2672, 173, 'Аль Хавр', 'KR', 1),
(2673, 173, 'Аль Вакра', 'WK', 1),
(2674, 173, 'Ар Райян', 'RN', 1),
(2675, 173, 'Джараян аль Батина', 'JB', 1),
(2676, 173, 'Мадинат аш Шамаль', 'MS', 1),
(2677, 173, 'Умм Саид', 'UD', 1),
(2678, 173, 'Умм Салал', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Арджеш', 'AG', 1),
(2682, 175, 'Бакэу', 'BC', 1),
(2683, 175, 'Бихор', 'BH', 1),
(2684, 175, 'Бистрица-Нэсэуд', 'BN', 1),
(2685, 175, 'Ботошань', 'BT', 1),
(2686, 175, 'Брашов', 'BV', 1),
(2687, 175, 'Брэила', 'BR', 1),
(2688, 175, 'Бухарест', 'B', 1),
(2689, 175, 'Бузэу', 'BZ', 1),
(2690, 175, 'Караш-Северин', 'CS', 1),
(2691, 175, 'Кэлэрашь', 'CL', 1),
(2692, 175, 'Клуж', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Ковасна', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Долж', 'DJ', 1),
(2697, 175, 'Галац', 'GL', 1),
(2698, 175, 'Джурджу', 'GR', 1),
(2699, 175, 'Горж', 'GJ', 1),
(2700, 175, 'Харгита', 'HR', 1),
(2701, 175, 'Хунедоара', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Яссы', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Марамуреш', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Муреш', 'MS', 1),
(2708, 175, 'Нямц', 'NT', 1),
(2709, 175, 'Олт', 'OT', 1),
(2710, 175, 'Прахова', 'PH', 1),
(2711, 175, 'Сату-Маре', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Сибиу', 'SB', 1),
(2714, 175, 'Сучава', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Тулча', 'TL', 1),
(2718, 175, 'Васлуй', 'VS', 1),
(2719, 175, 'Вылча', 'VL', 1),
(2720, 175, 'Вранча', 'VN', 1),
(4484, 176, 'Москва', 'MOW', 1),
(4485, 176, 'Санкт-Петербург', 'SPB', 1),
(4486, 176, 'Еврейская автономная область', 'YEV', 1),
(4482, 176, 'Челябинская область', 'CHE', 1),
(4483, 176, 'Ярославская область', 'YAR', 1),
(4473, 176, 'Сахалинская область', 'SAK', 1),
(4474, 176, 'Свердловская область', 'SVE', 1),
(4475, 176, 'Смоленская область', 'SMO', 1),
(4476, 176, 'Тамбовская область', 'TAM', 1),
(4477, 176, 'Тверская область', 'TVE', 1),
(4478, 176, 'Томская область', 'TOM', 1),
(4468, 176, 'Псковская область', 'PSK', 1),
(4469, 176, 'Ростовская область', 'ROS', 1),
(4464, 176, 'Омская область', 'OMS', 1),
(4465, 176, 'Оренбургская область', 'ORE', 1),
(4466, 176, 'Орловская область', 'ORL', 1),
(4460, 176, 'Мурманская область', 'MUR', 1),
(4461, 176, 'Нижегородская область', 'NIZ', 1),
(4457, 176, 'Липецкая область', 'LIP', 1),
(4458, 176, 'Магаданская область', 'MAG', 1),
(4454, 176, 'Курганская область', 'KGN', 1),
(4455, 176, 'Курская область', 'KRS', 1),
(4447, 176, 'Ивановская область', 'IVA', 1),
(4448, 176, 'Иркутская область', 'IRK', 1),
(4449, 176, 'Калининградская область', 'KGD', 1),
(4443, 176, 'Владимирская область', 'VLA', 1),
(4444, 176, 'Волгоградская область', 'VGG', 1),
(4446, 176, 'Воронежская область', 'VOR', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Бьюмба', 'BY', 1),
(2811, 177, 'Сьянгугу', 'CY', 1),
(2812, 177, 'Гиконгоро', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Кибунго', 'KG', 1),
(2816, 177, 'Кибуе', 'KY', 1),
(2817, 177, 'Кигали Рурале', 'KR', 1),
(2818, 177, 'Кигали-Виль', 'KV', 1),
(2819, 177, 'Рухенгери', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Церковь Христа, г. Николаев', 'CCN', 1),
(2822, 178, 'Сент-Энн Сэнди Пойнт', 'SAS', 1),
(2823, 178, 'Святой Георгий Бастер', 'SGB', 1),
(2824, 178, 'Святой Георгий Джинджерланд', 'SGG', 1),
(2825, 178, 'Сент-Джеймс Виндворд', 'SJW', 1),
(2826, 178, 'Святой Джон Капестерре', 'SJC', 1),
(2827, 178, 'Святой Джон Фигтри', 'SJF', 1),
(2828, 178, 'Святой Марии Кайон', 'SMC', 1),
(2829, 178, 'Святой Павел Капестер', 'CAP', 1),
(2830, 178, 'Сент-Пол Чарльзтаун', 'CHA', 1),
(2831, 178, 'Святой Петр Бастер', 'SPB', 1),
(2832, 178, 'Сент-Томасская низменность', 'STL', 1),
(2833, 178, 'Сент-Томас Средний остров', 'STM', 1),
(2834, 178, 'Тринити Пальметто Пойнт', 'TPP', 1),
(2835, 179, 'Анс-ла-Райя', 'AR', 1),
(2836, 179, 'Кастри', 'CA', 1),
(2837, 179, 'Шуазель', 'CH', 1),
(2838, 179, 'дофин', 'DA', 1),
(2839, 179, 'Деннери', 'DE', 1),
(2840, 179, 'Gros-Островок', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Мик', 'MI', 1),
(2843, 179, 'Праслин', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'шарлотка', 'C', 1),
(2847, 180, 'гренадины', 'R', 1),
(2848, 180, 'Святой Андрей', 'A', 1),
(2849, 180, 'Святой Давид', 'D', 1),
(2850, 180, 'Святой Георгий', 'G', 1),
(2851, 180, 'Святой Патрик', 'P', 1),
(2852, 181, 'Аана', 'AN', 1),
(2853, 181, 'Аига-ле-Тай', 'AI', 1),
(2854, 181, 'Атуа', 'AT', 1),
(2855, 181, 'Фаасалелеага', 'FA', 1),
(2856, 181, 'Гагаемауга', 'GE', 1),
(2857, 181, 'Гагаифомауга', 'GF', 1),
(2858, 181, 'Палаули', 'PA', 1),
(2859, 181, 'Сатупаитеа', 'SA', 1),
(2860, 181, 'Туамасага', 'TU', 1),
(2861, 181, 'Ваа-о-Фоноти', 'VF', 1),
(2862, 181, 'Ваисигано', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Борго Маджоре', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Доманьяно', 'DO', 1),
(2867, 182, 'Фаетано', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Читта ди Сан-Марино', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Сан-Томе', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Аль Бахах', 'BH', 1),
(2875, 184, 'Аль Худуд аш Шамалия', 'HS', 1),
(2876, 184, 'Аль Джавф', 'JF', 1),
(2877, 184, 'Аль Мадина', 'MD', 1),
(2878, 184, 'Аль Касим', 'QS', 1),
(2879, 184, 'Ар Рияд', 'RD', 1),
(2880, 184, 'Аш Шаркия (восточная часть)', 'AQ', 1),
(2881, 184, '«Асир', 'AS', 1),
(2882, 184, 'Град', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Мекка', 'ML', 1),
(2885, 184, 'Найран', 'NR', 1),
(2886, 184, 'Табук', 'TB', 1),
(2887, 185, 'Дакар', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Фатик', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Колда', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Сент-Луис', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Тис', 'TH', 1),
(2897, 185, 'Зигиншор', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Анс Буало', 'AB', 1),
(2900, 186, 'Анс Этуаль', 'AE', 1),
(2901, 186, 'Анс Луи', 'AL', 1),
(2902, 186, 'Анс Рояль', 'AR', 1),
(2903, 186, 'Бэй Лазар', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Бо Валлон', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Бель Омбре', 'BO', 1),
(2908, 186, 'каскадный', 'CA', 1),
(2909, 186, 'гласис', 'GL', 1),
(2910, 186, 'Гранд Анс (на Маэ)', 'GM', 1),
(2911, 186, 'Гранд Анс (на Праслин)', 'GP', 1),
(2912, 186, 'Ла Диг', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Пьяченца', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Порт Глод', 'PG', 1),
(2919, 186, 'Сент-Луис', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'восточный', 'E', 1),
(2922, 187, 'северный', 'N', 1),
(2923, 187, 'южный', 'S', 1),
(2924, 187, 'вестерн', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'центральный', 'CE', 1),
(2934, 191, 'Шуазель', 'CH', 1),
(2935, 191, 'Гуадалканал', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Изабел', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Малаитские', 'ML', 1),
(2940, 191, 'Реннелл и Беллона', 'RB', 1),
(2941, 191, 'Темоту', 'TM', 1),
(2942, 191, 'вестерн', 'WE', 1),
(2943, 192, 'Авдал', 'AW', 1),
(2944, 192, 'Бакол', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Бари', 'BR', 1),
(2947, 192, 'залив', 'BY', 1),
(2948, 192, 'Галгудуд', 'GA', 1),
(2949, 192, 'Гедо', 'GE', 1),
(2950, 192, 'Хирано', 'HI', 1),
(2951, 192, 'Джуббада Декс', 'JD', 1),
(2952, 192, 'Джуббада Хус', 'JH', 1),
(2953, 192, 'Мудуг', 'MU', 1),
(2954, 192, 'Нугал', 'NU', 1),
(2955, 192, 'Санаг', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Тогдер', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Восточная Капская провинция', 'EC', 1),
(2962, 193, 'Свободный штат', 'FS', 1),
(2963, 193, 'Гаутенг', 'GT', 1),
(2964, 193, 'Квазулу-Натал', 'KN', 1),
(2965, 193, 'Лимпопо', 'LP', 1),
(2966, 193, 'Мпумаланга', 'MP', 1),
(2967, 193, 'северо-Запад', 'NW', 1),
(2968, 193, 'Северный мыс', 'NC', 1),
(2969, 193, 'Западный Кейп', 'WC', 1),
(2970, 195, 'Ла-Корунья', 'CA', 1),
(2971, 195, 'Álava', 'AL', 1),
(2972, 195, 'Альбасете', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Альмерия', 'AM', 1),
(2975, 195, 'Астурия', 'AS', 1),
(2976, 195, 'Авила', 'AV', 1),
(2977, 195, 'Бадахос', 'BJ', 1),
(2978, 195, 'Балеарские острова', 'IB', 1),
(2979, 195, 'Барселона', 'BA', 1),
(2980, 195, 'Бургос', 'BU', 1),
(2981, 195, 'Касерес', 'CC', 1),
(2982, 195, 'Кадис', 'CZ', 1),
(2983, 195, 'Кантабрия', 'CT', 1),
(2984, 195, 'Кастельон', 'CL', 1),
(2985, 195, 'Сеута', 'CE', 1),
(2986, 195, 'Сьюдад-Реаль', 'CR', 1),
(2987, 195, 'Кордова', 'CD', 1),
(2988, 195, 'Куэнка', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Гранада', 'GD', 1),
(2991, 195, 'Гвадалахара', 'GJ', 1),
(2992, 195, 'Guipúzcoa', 'GP', 1),
(2993, 195, 'Уэльва', 'HL', 1),
(2994, 195, 'Уэска', 'HS', 1),
(2995, 195, 'Хаэн', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Лас-Пальмас', 'PM', 1),
(2998, 195, 'Леон', 'LE', 1),
(2999, 195, 'Лерида', 'LL', 1),
(3000, 195, 'Луго', 'LG', 1),
(3001, 195, 'Мадрид', 'MD', 1),
(3002, 195, 'Малага', 'MA', 1),
(3003, 195, 'Мелилья', 'ML', 1),
(3004, 195, 'Мурсия', 'MU', 1),
(3005, 195, 'Наварра', 'NV', 1),
(3006, 195, 'Оуренсе', 'OU', 1),
(3007, 195, 'Паленсия', 'PL', 1),
(3008, 195, 'Понтеведра', 'PO', 1),
(3009, 195, 'Саламанка', 'SL', 1),
(3010, 195, 'Санта-Крус-де-Тенерифе', 'SC', 1),
(3011, 195, 'Сеговия', 'SG', 1),
(3012, 195, 'Севилья', 'SV', 1),
(3013, 195, 'Сория', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Теруэль', 'TE', 1),
(3016, 195, 'Толедо', 'TO', 1),
(3017, 195, 'Валенсия', 'VC', 1),
(3018, 195, 'Вальядолид', 'VD', 1),
(3019, 195, 'Бискайский', 'VZ', 1),
(3020, 195, 'Замора', 'ZM', 1),
(3021, 195, 'Сарагоса', 'ZR', 1),
(3022, 196, 'центральный', 'CE', 1),
(3023, 196, 'восточный', 'EA', 1),
(3024, 196, 'Северная Центральная', 'NC', 1),
(3025, 196, 'северный', 'NO', 1),
(3026, 196, 'Северо-Западный', 'NW', 1),
(3027, 196, 'Сабарагамува', 'SA', 1),
(3028, 196, 'южный', 'SO', 1),
(3029, 196, 'Ува', 'UV', 1),
(3030, 196, 'вестерн', 'WE', 1),
(3032, 197, 'Остров Святой Елены', 'S', 1),
(3034, 199, 'А\'али ан Нил', 'ANL', 1),
(3035, 199, 'Аль Бахр Аль Ахмар', 'BAM', 1),
(3036, 199, 'Аль Бухайрат', 'BRT', 1),
(3037, 199, 'Аль Джазира', 'JZR', 1),
(3038, 199, 'Аль Хартум', 'KRT', 1),
(3039, 199, 'Аль-Кадариф', 'QDR', 1),
(3040, 199, 'Аль Вахда', 'WDH', 1),
(3041, 199, 'Нил Аль Абьяд', 'ANB', 1),
(3042, 199, 'Нил аль Азрак', 'ANZ', 1),
(3043, 199, 'Эш Шамалия', 'ASH', 1),
(3044, 199, 'Бахр аль-Джабаль', 'BJA', 1),
(3045, 199, 'Гарб Аль Истивия', 'GIS', 1),
(3046, 199, 'Гарб Бахр Газаль', 'GBG', 1),
(3047, 199, 'Гарб Дарфур', 'GDA', 1),
(3048, 199, 'Гарб Курдуфан', 'GKU', 1),
(3049, 199, 'Джануб Дарфур', 'JDA', 1),
(3050, 199, 'Джануб Курдуфан', 'JKU', 1),
(3051, 199, 'Джонглий', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Нахр Нил', 'NNL', 1),
(3054, 199, 'Шамал Бахр аль Газаль', 'SBG', 1),
(3055, 199, 'Шамаль Дарфур', 'SDA', 1),
(3056, 199, 'Шамал Курдуфан', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Вараб', 'WRB', 1),
(3060, 200, 'Брокопондо', 'BR', 1),
(3061, 200, 'Коммевейни', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Маровейне', 'MA', 1),
(3064, 200, 'Никери', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Парамарибо', 'PM', 1),
(3067, 200, 'Сарамакка', 'SA', 1),
(3068, 200, 'Сипаливини', 'SI', 1),
(3069, 200, 'Ваника', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Лубомбо', 'L', 1),
(3072, 202, 'Манзини', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Даларны', 'W', 1),
(3076, 203, 'Gävleborg', 'X', 1),
(3077, 203, 'Готланд', 'I', 1),
(3078, 203, 'Холланд', 'N', 1),
(3079, 203, 'Jämtland', 'Z', 1),
(3080, 203, 'Йончёпинг', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, 'Эребру', 'T', 1),
(3085, 203, 'Östergötland', 'E', 1),
(3086, 203, 'Сконе', 'M', 1),
(3087, 203, 'Södermanland', 'D', 1),
(3088, 203, 'Стокгольм', 'AB', 1),
(3089, 203, 'Упсала', 'C', 1),
(3090, 203, 'Värmland', 'S', 1),
(3091, 203, 'Västerbotten', 'AC', 1),
(3092, 203, 'Västernorrland', 'Y', 1),
(3093, 203, 'Västmanland', 'U', 1),
(3094, 203, 'Вестра Гёталанд', 'O', 1),
(3095, 204, 'Ааргау', 'AG', 1),
(3096, 204, 'Аппенцелль Ауссерроден', 'AR', 1),
(3097, 204, 'Аппенцелль-Иннерроден', 'AI', 1),
(3098, 204, 'Базель-Штадт', 'BS', 1),
(3099, 204, 'Базель-Ланд', 'BL', 1),
(3100, 204, 'Берн', 'BE', 1),
(3101, 204, 'Фрибург', 'FR', 1),
(3102, 204, 'Genève', 'GE', 1),
(3103, 204, 'Гларус', 'GL', 1),
(3104, 204, 'Граубюнден', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Люцерна', 'LU', 1),
(3107, 204, 'Невшатель', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Обвальден', 'OW', 1),
(3110, 204, 'Санкт-Галлен', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Швиц', 'SZ', 1),
(3113, 204, 'Солотурн', 'SO', 1),
(3114, 204, 'Тургау', 'TG', 1),
(3115, 204, 'Тичино', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Вале', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Цюрих', 'ZH', 1),
(3121, 205, 'Аль Хасака', 'HA', 1),
(3122, 205, 'Аль Ладхикия', 'LA', 1),
(3123, 205, 'Аль Кунайтира', 'QU', 1),
(3124, 205, 'Ар Ракка', 'RQ', 1),
(3125, 205, 'Как Сувейда', 'SU', 1),
(3126, 205, 'Дара', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Хама', 'HM', 1),
(3131, 205, 'Хомс', 'HI', 1),
(3132, 205, 'Идлиб', 'ID', 1),
(3133, 205, 'Риф Димашк', 'RD', 1),
(3134, 205, 'Тартус', 'TA', 1),
(3135, 206, 'Chang-хуа', 'CH', 1),
(3136, 206, 'Chia-я', 'CI', 1),
(3137, 206, 'Синь-чу', 'HS', 1),
(3138, 206, 'Хуа-селезенка', 'HL', 1),
(3139, 206, 'Я-лань', 'IL', 1),
(3140, 206, 'Као-сюн округ', 'KH', 1),
(3141, 206, 'Kin-мужчины', 'KM', 1),
(3142, 206, 'Лянь-цзян', 'LC', 1),
(3143, 206, 'Мяо-ли', 'ML', 1),
(3144, 206, 'Нан-тоу', 'NT', 1),
(3145, 206, 'Пын-х', 'PH', 1),
(3146, 206, 'Пин-дун', 'PT', 1),
(3147, 206, 'T\'ai-чжун', 'TG', 1),
(3148, 206, 'T\'ai-нан', 'TA', 1),
(3149, 206, 'Округ Тай-пей', 'TP', 1),
(3150, 206, 'T\'ai-дун', 'TT', 1),
(3151, 206, 'T\'ao-юань', 'TY', 1),
(3152, 206, 'Юн-лин', 'YL', 1),
(3153, 206, 'Город Чиа-и', 'CC', 1),
(3154, 206, 'Чи-легкие', 'CL', 1),
(3155, 206, 'Синь-чу', 'HC', 1),
(3156, 206, 'T\'ai-чжун', 'TH', 1),
(3157, 206, 'T\'ai-нан', 'TN', 1),
(3158, 206, 'Город Гаосюн', 'KC', 1),
(3159, 206, 'Город Тайпей', 'TC', 1),
(3160, 207, 'Горно-Badakhstan', 'GB', 1),
(3161, 207, 'Хатлонской', 'KT', 1),
(3162, 207, 'Согдийская', 'SU', 1),
(3163, 208, 'Аруша', 'AR', 1),
(3164, 208, 'Дар-эс-Салам', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Кагера', 'KA', 1),
(3168, 208, 'Кигомы', 'KI', 1),
(3169, 208, 'Килиманджаро', 'KJ', 1),
(3170, 208, 'Линди', 'LN', 1),
(3171, 208, 'Маньяра', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Мванзы', 'MW', 1),
(3177, 208, 'Пемба Север', 'PN', 1),
(3178, 208, 'Южная пемба', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Руква', 'RK', 1),
(3181, 208, 'Рувума', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Сингида', 'SI', 1),
(3184, 208, 'Табора', 'TB', 1),
(3185, 208, 'Танга', 'TN', 1),
(3186, 208, 'Занзибар Центральный/Юг', 'ZC', 1),
(3187, 208, 'Занзибар Север', 'ZN', 1),
(3188, 208, 'Занзибар Город/Запад', 'ZU', 1),
(3189, 209, 'Амнат Чароен', 'Amnat Charoen', 1),
(3190, 209, 'Анг Тонг', 'Ang Thong', 1),
(3191, 209, 'Аюттхая', 'Ayutthaya', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3192, 209, 'Бангкок', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Чай Нат', 'Chai Nat', 1),
(3196, 209, 'Чайяпхум', 'Chaiyaphum', 1),
(3197, 209, 'Чантабури', 'Chanthaburi', 1),
(3198, 209, 'Чиангмай', 'Chiang Mai', 1),
(3199, 209, 'Чианг Рай', 'Chiang Rai', 1),
(3200, 209, 'Чон Бури', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Канчанабури', 'Kanchanaburi', 1),
(3205, 209, 'Хон Каен', 'Khon Kaen', 1),
(3206, 209, 'Краби', 'Krabi', 1),
(3207, 209, 'Лампанг', 'Lampang', 1),
(3208, 209, 'Лампхун', 'Lamphun', 1),
(3209, 209, 'Лоэй', 'Loei', 1),
(3210, 209, 'Лоп Бури', 'Lop Buri', 1),
(3211, 209, 'Мэй Хонг Сон', 'Mae Hong Son', 1),
(3212, 209, 'Маха Саракхам', 'Maha Sarakham', 1),
(3213, 209, 'Мукдахан', 'Mukdahan', 1),
(3214, 209, 'Накхон Найок', 'Nakhon Nayok', 1),
(3215, 209, 'Накхон Патом', 'Nakhon Pathom', 1),
(3216, 209, 'Накхон Фаном', 'Nakhon Phanom', 1),
(3217, 209, 'Накхонратчасима', 'Nakhon Ratchasima', 1),
(3218, 209, 'Накхон Саван', 'Nakhon Sawan', 1),
(3219, 209, 'Накхонситхаммарат', 'Nakhon Si Thammarat', 1),
(3220, 209, 'бабушка', 'Nan', 1),
(3221, 209, 'Наратхиват', 'Narathiwat', 1),
(3222, 209, 'Нонг Буа Лампху', 'Nong Bua Lamphu', 1),
(3223, 209, 'Нонг Кхай', 'Nong Khai', 1),
(3224, 209, 'Нонтабури', 'Nonthaburi', 1),
(3225, 209, 'Патхум Тани', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Пхетчабури', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Питсанулок', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Пхукет', 'Phuket', 1),
(3236, 209, 'Прачин Бури', 'Prachin Buri', 1),
(3237, 209, 'Прачуап Кхири Хан', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ранонг', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Районг', 'Rayong', 1),
(3241, 209, 'Рой Эт', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Сакон Накхон', 'Sakon Nakhon', 1),
(3244, 209, 'Самут Пракан', 'Samut Prakan', 1),
(3245, 209, 'Самут Сакхон', 'Samut Sakhon', 1),
(3246, 209, 'Самут Сонгхрам', 'Samut Songkhram', 1),
(3247, 209, 'Сара Бури', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Синг Бури', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Сонгкхла', 'Songkhla', 1),
(3252, 209, 'Сукхотаи', 'Sukhothai', 1),
(3253, 209, 'Суфан Бури', 'Suphan Buri', 1),
(3254, 209, 'Сурат Тани', 'Surat Thani', 1),
(3255, 209, 'Сурин', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Транг', 'Trang', 1),
(3258, 209, 'Трат', 'Trat', 1),
(3259, 209, 'Убон Ратчатхани', 'Ubon Ratchathani', 1),
(3260, 209, 'Удонтхани', 'Udon Thani', 1),
(3261, 209, 'Утхай Тани', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Яла', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Кара', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Саванес', 'S', 1),
(3268, 210, 'Центральный', 'C', 1),
(3269, 210, 'морской', 'M', 1),
(3270, 211, 'Атаф', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Нукуноно', 'N', 1),
(3273, 212, 'Хаапай', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Табакит/Тальпаро', 'CT', 1),
(3277, 213, 'Диего Мартин', 'DM', 1),
(3278, 213, 'Майаро/Рио Кларо', 'MR', 1),
(3279, 213, 'Штрафной/Деб', 'PD', 1),
(3280, 213, 'Город Принцев', 'PT', 1),
(3281, 213, 'Сангре Гранде', 'SG', 1),
(3282, 213, 'Сан-Хуан/Лавентиль', 'SL', 1),
(3283, 213, 'Сипария', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Порт испании', 'PS', 1),
(3286, 213, 'Сан Фернандо', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Пойнт Фортин', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Тобаго', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Бея', 'BJ', 1),
(3293, 214, 'Бен Арус', 'BA', 1),
(3294, 214, 'Бизерта', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Джендуба', 'JE', 1),
(3298, 214, 'Кайруан', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Кэбилл', 'KB', 1),
(3301, 214, 'безделье', 'KF', 1),
(3302, 214, 'Махдия', 'MH', 1),
(3303, 214, 'Мануба', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Монастир', 'MO', 1),
(3306, 214, 'Набель', 'NA', 1),
(3307, 214, 'Сфакс', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Силиана', 'SL', 1),
(3310, 214, 'Сус', 'SO', 1),
(3311, 214, 'Татуин', 'TA', 1),
(3312, 214, 'Таузар', 'TO', 1),
(3313, 214, 'Тунис', 'TU', 1),
(3314, 214, 'Загван', 'ZA', 1),
(3315, 215, 'Адана', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Агры', 'AGR', 1),
(3319, 215, 'Аксарай', 'AKS', 1),
(3320, 215, 'Амасья', 'AMA', 1),
(3321, 215, 'Анкара', 'ANK', 1),
(3322, 215, 'Анталия', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Артвин', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Бэтмен', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Болу', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'сумка', 'BRS', 1),
(3336, 215, 'Чанаккале', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Денизли', 'DEN', 1),
(3340, 215, 'Диярбакыр', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Эдирне', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Эрзурум', 'EZR', 1),
(3346, 215, 'Эскишехир', 'ESK', 1),
(3347, 215, 'Газиантеп', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Хатай', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Испарта', 'ISP', 1),
(3354, 215, 'Стамбул', 'IST', 1),
(3355, 215, 'Измир', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Караман', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Кастамону', 'KAS', 1),
(3361, 215, 'Кайсери', 'KAY', 1),
(3362, 215, 'Килис', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Кыркларэли', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Коджаэли', 'KOC', 1),
(3367, 215, 'Конья', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Малатья', 'MAL', 1),
(3370, 215, 'Маниса', 'MAN', 1),
(3371, 215, 'Мардин', 'MAR', 1),
(3372, 215, 'Мерсин', 'MER', 1),
(3373, 215, 'Мугла', 'MUG', 1),
(3374, 215, 'Муш', 'MUS', 1),
(3375, 215, 'Невшехир', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Орда', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Риза', 'RIZ', 1),
(3380, 215, 'Сакарья', 'SAK', 1),
(3381, 215, 'Самсун', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Синоп', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Сивас', 'SIV', 1),
(3387, 215, 'Текирдаг', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Трабзон', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'фургон', 'VAN', 1),
(3393, 215, 'Ялова', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Зонгулдак', 'ZON', 1),
(3396, 216, 'Ахал Велаяты', 'A', 1),
(3397, 216, 'Балканские велаяты', 'B', 1),
(3398, 216, 'Дашховуз Велаяты', 'D', 1),
(3399, 216, 'Лебап Велаяты', 'L', 1),
(3400, 216, 'Мария Велаяты', 'M', 1),
(3401, 217, 'Амбергрис Кейс', 'AC', 1),
(3402, 217, 'Деллис Кей', 'DC', 1),
(3403, 217, 'Французский Кей', 'FC', 1),
(3404, 217, 'Маленькая вода Кей', 'LW', 1),
(3405, 217, 'Попугай Кей', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Солт-Кей', 'SL', 1),
(3408, 217, 'Гранд Тюрк', 'GT', 1),
(3409, 217, 'Южный Кайкос', 'SC', 1),
(3410, 217, 'Восточный Кайкос', 'EC', 1),
(3411, 217, 'Средний Кайкос', 'MC', 1),
(3412, 217, 'Северный Кайкос', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'Вест Кайкос', 'WC', 1),
(3415, 218, 'Нануманга', 'NMG', 1),
(3416, 218, 'Ниулакита', 'NLK', 1),
(3417, 218, 'Ниутао', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Нанумеа', 'NME', 1),
(3420, 218, 'Нуи', 'NUI', 1),
(3421, 218, 'Нукуфетау', 'NFT', 1),
(3422, 218, 'Нукулаэлаэ', 'NLL', 1),
(3423, 218, 'Ваитупу', 'VAI', 1),
(3424, 219, 'Калангала', 'KAL', 1),
(3425, 219, 'Кампала', 'KMP', 1),
(3426, 219, 'Каюнга', 'KAY', 1),
(3427, 219, 'Кибога', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Мпиги', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Накасонгола', 'NKS', 1),
(3434, 219, 'Ракаи', 'RAK', 1),
(3435, 219, 'Сембабула', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Бугири', 'BUG', 1),
(3438, 219, 'Буся', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'дзиндзя', 'JIN', 1),
(3441, 219, 'Каберамаидо', 'KAB', 1),
(3442, 219, 'Камули', 'KML', 1),
(3443, 219, 'Капчорва', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Куми', 'KUM', 1),
(3446, 219, 'Маюге', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Сиронко', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Аджумани', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Гулу', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Котидо', 'KOT', 1),
(3458, 219, 'лира', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Накапирипирит', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Падер', 'PAD', 1),
(3464, 219, 'Йюмбе', 'YUM', 1),
(3465, 219, 'Бундибугио', 'BUN', 1),
(3466, 219, 'Бушеньи', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Коварство', 'KBL', 1),
(3469, 219, 'Кабароле', 'KAR', 1),
(3470, 219, 'Камвенге', 'KAM', 1),
(3471, 219, 'Канунгу', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Кисоро', 'KIS', 1),
(3475, 219, 'Кьенджоджо', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Нтунгамо', 'NTU', 1),
(3479, 219, 'Рукунгири', 'RUK', 1),
(4511, 220, 'Тернопольская область', 'UA-61', 1),
(4509, 220, 'Полтавская область', 'UA-53', 1),
(4508, 220, 'Одесская область', 'UA-51', 1),
(4507, 220, 'Николаевская область', 'UA-48', 1),
(4506, 220, 'Львовская область', 'UA-46', 1),
(4502, 220, 'Киевская область', 'UA-32', 1),
(4501, 220, 'Киев', 'UA-30', 1),
(4500, 220, 'Ивано-Франковская область', 'UA-26', 1),
(4499, 220, 'Запорожская область', 'UA-23', 1),
(4498, 220, 'Закарпатская область', 'UA-21', 1),
(4496, 220, 'Житомирская область', 'UA-18', 1),
(4495, 220, 'Донецкая область', 'UA-14', 1),
(3506, 221, 'Абу Даби', 'ADH', 1),
(3507, 221, '«Аджман', 'AJ', 1),
(3508, 221, 'Аль Фуджейра', 'FU', 1),
(3509, 221, 'Аш Шарика', 'SH', 1),
(3510, 221, 'Дубай', 'DU', 1),
(3511, 221, 'Ras al Khaymah', 'RK', 1),
(3512, 221, 'Умм Аль Кейвайн', 'UQ', 1),
(3513, 222, 'Абердин', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Англси', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Аргайл и Бьют', 'ARY', 1),
(3518, 222, 'бедфордшир', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Блаенау Гвент', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Бристоль', 'BSTL', 1),
(3523, 222, 'Бакингэмшир', 'BUCKS', 1),
(3524, 222, 'Кайрфилли', 'CAE', 1),
(3525, 222, 'Кембриджшир', 'CAMBS', 1),
(3526, 222, 'Кардифф', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Чешир', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Конви', 'CON', 1),
(3532, 222, 'Корнуолл', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'дербишир', 'DERBY', 1),
(3535, 222, 'Девон', 'DVN', 1),
(3536, 222, 'Дорсет', 'DOR', 1),
(3537, 222, 'Дамфрис и Галлоуэй', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Дарема', 'DHM', 1),
(3540, 222, 'Восточный Эйршир', 'ARYE', 1),
(3541, 222, 'Восточный Данбартоншир', 'DUNBE', 1),
(3542, 222, 'Восточный Лотиан', 'LOTE', 1),
(3543, 222, 'Восточный Ренфрушир', 'RENE', 1),
(3544, 222, 'Восточный райдинг Йоркшира', 'ERYS', 1),
(3545, 222, 'Восточный Суссекс', 'SXE', 1),
(3546, 222, 'Эдинбург', 'EDIN', 1),
(3547, 222, 'эссекс', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'дудка', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Глазго', 'GLAS', 1),
(3552, 222, 'Глостершир', 'GLOS', 1),
(3553, 222, 'Большой Лондон', 'LDN', 1),
(3554, 222, 'Большой Манчестер', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Хэмпшир', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Хартфордшир', 'HERTS', 1),
(3559, 222, 'горная местность', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Остров уайт', 'IOW', 1),
(3562, 222, 'Кент', 'KNT', 1),
(3563, 222, 'Ланкашир', 'LANCS', 1),
(3564, 222, 'Лестершир', 'LEICS', 1),
(3565, 222, 'Линкольншир', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Мертир Тидфил', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Мурена', 'MORAY', 1),
(3571, 222, 'Нит Порт Тэлбот', 'NPRTAL', 1),
(3572, 222, 'Ньюпорт', 'NEWPT', 1),
(3573, 222, 'Норфолк', 'NOR', 1),
(3574, 222, 'Северный Эйршир', 'ARYN', 1),
(3575, 222, 'Северный Ланаркшир', 'LANN', 1),
(3576, 222, 'Северный йоркшир', 'YSN', 1),
(3577, 222, 'Нортгемптоншир', 'NHM', 1),
(3578, 222, 'Нортумберленд', 'NLD', 1),
(3579, 222, 'Ноттингемшир', 'NOT', 1),
(3580, 222, 'Оркнейские острова', 'ORK', 1),
(3581, 222, 'Оксфордшир', 'OFE', 1),
(3582, 222, 'Пемброкшир', 'PEM', 1),
(3583, 222, 'Перт и Кинросс', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Рондда Кинон Тафф', 'RHON', 1),
(3587, 222, 'Ратленд', 'RUT', 1),
(3588, 222, 'Шотландские границы', 'BOR', 1),
(3589, 222, 'Шетландские острова', 'SHET', 1),
(3590, 222, 'Шропшир', 'SPE', 1),
(3591, 222, 'прыжок кувырком', 'SOM', 1),
(3592, 222, 'Южный Эйршир', 'ARYS', 1),
(3593, 222, 'Южный Ланаркшир', 'LANS', 1),
(3594, 222, 'Южный йоркшир', 'YSS', 1),
(3595, 222, 'Стаффордшир', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Суффолк', 'SFK', 1),
(3598, 222, 'легкий двухместный экипаж', 'SRY', 1),
(3599, 222, 'Суонси', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Тайн и Уир', 'TWR', 1),
(3602, 222, 'Долина Гламоргана', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'Западный Данбартоншир', 'WDUN', 1),
(3605, 222, 'Западный Лотиан', 'WLOT', 1),
(3606, 222, 'западное Средиземье', 'WMD', 1),
(3607, 222, 'Западный Суссекс', 'SXW', 1),
(3608, 222, 'Западный Йоркшир', 'YSW', 1),
(3609, 222, 'Западные острова', 'WIL', 1),
(3610, 222, 'Уилтшир', 'WLT', 1),
(3611, 222, 'Вустершира', 'WORCS', 1),
(3612, 222, 'Рексэм', 'WRX', 1),
(3613, 223, 'Алабама', 'AL', 1),
(3614, 223, 'Аляска', 'AK', 1),
(3615, 223, 'Самоа (США)', 'AS', 1),
(3616, 223, 'Аризона', 'AZ', 1),
(3617, 223, 'Арканзас', 'AR', 1),
(3618, 223, 'Вооруженные силы Африки', 'AF', 1),
(3619, 223, 'Вооруженные силы Америки', 'AA', 1),
(3620, 223, 'Вооруженные силы Канады', 'AC', 1),
(3621, 223, 'Вооруженные силы Европы', 'AE', 1),
(3622, 223, 'Вооруженные силы Ближнего Востока', 'AM', 1),
(3623, 223, 'Вооруженные силы Тихого океана', 'AP', 1),
(3624, 223, 'Калифорния', 'CA', 1),
(3625, 223, 'Колорадо', 'CO', 1),
(3626, 223, 'Коннектикут', 'CT', 1),
(3627, 223, 'Делавэр', 'DE', 1),
(3628, 223, 'Колумбия (округ)', 'DC', 1),
(3629, 223, 'Федеративные Штаты Микронезии', 'FM', 1),
(3630, 223, 'Флорида', 'FL', 1),
(3631, 223, 'Грузия', 'GA', 1),
(3632, 223, 'Гуам', 'GU', 1),
(3633, 223, 'Гавайи', 'HI', 1),
(3634, 223, 'Айдахо', 'ID', 1),
(3635, 223, 'Иллинойс', 'IL', 1),
(3636, 223, 'Индиана', 'IN', 1),
(3637, 223, 'Айова', 'IA', 1),
(3638, 223, 'Канзас', 'KS', 1),
(3639, 223, 'Кентукки', 'KY', 1),
(3640, 223, 'Луизиана', 'LA', 1),
(3641, 223, 'Мэн', 'ME', 1),
(3642, 223, 'Маршалловы острова', 'MH', 1),
(3643, 223, 'Мэриленд', 'MD', 1),
(3644, 223, 'Массачусетс', 'MA', 1),
(3645, 223, 'Мичиган', 'MI', 1),
(3646, 223, 'Миннесота', 'MN', 1),
(3647, 223, 'Миссисипи', 'MS', 1),
(3648, 223, 'Миссури', 'MO', 1),
(3649, 223, 'Монтана', 'MT', 1),
(3650, 223, 'Небраска', 'NE', 1),
(3651, 223, 'Невада', 'NV', 1),
(3652, 223, 'Нью-Гемпшир', 'NH', 1),
(3653, 223, 'Нью-Джерси', 'NJ', 1),
(3654, 223, 'Нью-Мексико', 'NM', 1),
(3655, 223, 'Нью-Йорк', 'NY', 1),
(3656, 223, 'Северная Каролина', 'NC', 1),
(3657, 223, 'Северная Дакота', 'ND', 1),
(3658, 223, 'Северные Марианские острова', 'MP', 1),
(3659, 223, 'Огайо', 'OH', 1),
(3660, 223, 'Оклахома', 'OK', 1),
(3661, 223, 'Орегон', 'OR', 1),
(3662, 223, 'Палау', 'PW', 1),
(3663, 223, 'Пенсильвания', 'PA', 1),
(3664, 223, 'Пуэрто-Рико', 'PR', 1),
(3665, 223, 'Род-Айленд', 'RI', 1),
(3666, 223, 'Южная Каролина', 'SC', 1),
(3667, 223, 'южная Дакота', 'SD', 1),
(3668, 223, 'Теннесси', 'TN', 1),
(3669, 223, 'Техас', 'TX', 1),
(3670, 223, 'Юта', 'UT', 1),
(3671, 223, 'Вермонт', 'VT', 1),
(3672, 223, 'Виргинские острова', 'VI', 1),
(3673, 223, 'Виргиния', 'VA', 1),
(3674, 223, 'Вашингтон', 'WA', 1),
(3675, 223, 'западная Вирджиния', 'WV', 1),
(3676, 223, 'Висконсин', 'WI', 1),
(3677, 223, 'Вайоминг', 'WY', 1),
(3678, 224, 'Бейкер Айленд', 'BI', 1),
(3679, 224, 'Остров Хоулэнд', 'HI', 1),
(3680, 224, 'Остров Джарвис', 'JI', 1),
(3681, 224, 'Джонстон Атолл', 'JA', 1),
(3682, 224, 'Кингман Риф', 'KR', 1),
(3683, 224, 'Мидуэй Атолл', 'MA', 1),
(3684, 224, 'Остров Навасса', 'NI', 1),
(3685, 224, 'Атолл Пальмира', 'PA', 1),
(3686, 224, 'Остров вейк', 'WI', 1),
(3687, 225, 'Артигаса', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Серро Ларго', 'CL', 1),
(3690, 225, 'Колония', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Флорида', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Мальдонадо', 'MA', 1),
(3696, 225, 'Монтевидео', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Рио Негро', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Сальто', 'SL', 1),
(3702, 225, 'Сан - Хосе', 'SJ', 1),
(3703, 225, 'Сориано', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Андижанская', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Джизак', 'JI', 1),
(3710, 226, 'Наманган', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Кашкадарьинской', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Самаркандская', 'SA', 1),
(3715, 226, 'Сирдаре', 'SI', 1),
(3716, 226, 'Сурхандарьинская', 'SU', 1),
(3717, 226, 'Город Тошкент', 'TK', 1),
(3718, 226, 'Ташкентская область', 'TO', 1),
(3719, 226, 'Хорезмская', 'XO', 1),
(3720, 227, 'Малампа', 'MA', 1),
(3721, 227, 'Пенама', 'PE', 1),
(3722, 227, 'Санма', 'SA', 1),
(3723, 227, 'Шефа', 'SH', 1),
(3724, 227, 'Тафеа', 'TA', 1),
(3725, 227, 'Торба', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Арагуа', 'AR', 1),
(3730, 229, 'Баринаса', 'BA', 1),
(3731, 229, 'боливар', 'BO', 1),
(3732, 229, 'Карабобо', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Дельта Амакуро', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Федеральный округ', 'DI', 1),
(3737, 229, 'сокол', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Миранда', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Нуэва Эспарта', 'NE', 1),
(3744, 229, 'Португальская', 'PO', 1),
(3745, 229, 'Сукре', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Трухильо', 'TR', 1),
(3748, 229, 'Варгас', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Зулия', 'ZU', 1),
(3751, 230, 'Ан Гианг', 'AG', 1),
(3752, 230, 'Бак Гианг', 'BG', 1),
(3753, 230, 'Бак Кан', 'BK', 1),
(3754, 230, 'Бак Лиу', 'BL', 1),
(3755, 230, 'Бак Нинь', 'BC', 1),
(3756, 230, 'Ба Риа Вунг Тау', 'BR', 1),
(3757, 230, 'Бен Тре', 'BN', 1),
(3758, 230, 'Бин Динь', 'BH', 1),
(3759, 230, 'Бин Дуонг', 'BU', 1),
(3760, 230, 'Бин Пхуок', 'BP', 1),
(3761, 230, 'Бинь Туан', 'BT', 1),
(3762, 230, 'Ка Мау', 'CM', 1),
(3763, 230, 'Кантхо', 'CT', 1),
(3764, 230, 'Цао Банг', 'CB', 1),
(3765, 230, 'Дак лак', 'DL', 1),
(3766, 230, 'Дак Нонг', 'DG', 1),
(3767, 230, 'Дананг', 'DN', 1),
(3768, 230, 'Дьен Бьен', 'DB', 1),
(3769, 230, 'Донг Най', 'DI', 1),
(3770, 230, 'Донг Тап', 'DT', 1),
(3771, 230, 'Гия Лай', 'GL', 1),
(3772, 230, 'Ха Гианг', 'HG', 1),
(3773, 230, 'Хай дуонг', 'HD', 1),
(3774, 230, 'Хай фонг', 'HP', 1),
(3775, 230, 'Ха нам', 'HM', 1),
(3776, 230, 'Ханой', 'HI', 1),
(3777, 230, 'Ха Тай', 'HT', 1),
(3778, 230, 'Ха Тинь', 'HH', 1),
(3779, 230, 'Хоа Бинь', 'HB', 1),
(3780, 230, 'Хошимин', 'HC', 1),
(3781, 230, 'Хау Гианг', 'HU', 1),
(3782, 230, 'Хунг Йен', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Святой Иоанн', 'J', 1),
(3785, 232, 'Святой томас', 'T', 1),
(3786, 233, 'Ало', 'A', 1),
(3787, 233, 'Сигав', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Адан', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Аль Байда', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Дамар', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Хаджа', 'HJ', 1),
(3797, 235, 'Аль Худайда', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Аль Джавф', 'JA', 1),
(3800, 235, 'Лахидж', 'LA', 1),
(3801, 235, 'Мариб', 'MA', 1),
(3802, 235, 'Аль Махра', 'MR', 1),
(3803, 235, 'Аль Махвит', 'MW', 1),
(3804, 235, 'Саада', 'SD', 1),
(3805, 235, 'Сане', 'SN', 1),
(3806, 235, 'Шабва', 'SH', 1),
(3807, 235, 'Таиз', 'TA', 1),
(3812, 237, 'Bas-Конго', 'BC', 1),
(3813, 237, 'Бандунду', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Катанга', 'KA', 1),
(3816, 237, 'Восточная Касаи', 'KE', 1),
(3817, 237, 'Киншаса', 'KN', 1),
(3818, 237, 'Западная Касаи', 'KW', 1),
(3819, 237, 'Маниема', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Ориенталь', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'центральный', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'восточный', 'EA', 1),
(3826, 238, 'Луапула', 'LP', 1),
(3827, 238, 'Лусака', 'LK', 1),
(3828, 238, 'северный', 'NO', 1),
(3829, 238, 'Северо-Западный', 'NW', 1),
(3830, 238, 'южный', 'SO', 1),
(3831, 238, 'вестерн', 'WE', 1),
(3832, 239, 'Булавайо', 'BU', 1),
(3833, 239, 'Хараре', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Машоналенд Централ', 'MC', 1),
(3836, 239, 'Машоналенд Восток', 'ME', 1),
(3837, 239, 'Машоналенд Вест', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Матабелеланд Север', 'MN', 1),
(3840, 239, 'Матабелеланд Юг', 'MS', 1),
(3841, 239, 'центральные графства', 'MD', 1),
(3861, 105, 'Кампобассо', 'CB', 1),
(3863, 105, 'Казерта', 'CE', 1),
(3864, 105, 'Катания', 'CT', 1),
(3865, 105, 'Катандзаро', 'CZ', 1),
(3866, 105, 'Кьети', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Козенца', 'CS', 1),
(3869, 105, 'Кремона', 'CR', 1),
(3870, 105, 'Кротоне', 'KR', 1),
(3871, 105, 'Кунео', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Фоггиа', 'FG', 1),
(3876, 105, 'Форли-Чезена', 'FC', 1),
(3877, 105, 'Фрозиноне', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Горициа', 'GO', 1),
(3880, 105, 'Гроссето', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L\'Aquila', 'AQ', 1),
(3884, 105, 'Специя', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Лекко', 'LC', 1),
(3888, 105, 'Ливорно', 'LI', 1),
(3889, 105, 'Лоди', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Масерата', 'MC', 1),
(3892, 105, 'Мантуя', 'MN', 1),
(3893, 105, 'Масса-Каррара', 'MS', 1),
(3894, 105, 'Матера', 'MT', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'модена', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Новара', 'NO', 1),
(3901, 105, 'Нуоро', 'NU', 1),
(3904, 105, 'Ористано', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Палермо', 'PA', 1),
(3907, 105, 'Парма', 'PR', 1),
(3908, 105, 'Павия', 'PV', 1),
(3909, 105, 'Перуджа', 'PG', 1),
(3910, 105, 'Пезаро и Урбино', 'PU', 1),
(3911, 105, 'Пескара', 'PE', 1),
(3912, 105, 'Пьяченца', 'PC', 1),
(3913, 105, 'Пиза', 'PI', 1),
(3914, 105, 'Пистойя', 'PT', 1),
(3915, 105, 'Порденоне', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Прато', 'PO', 1),
(3918, 105, 'Рагуза', 'RG', 1),
(3919, 105, 'равенна', 'RA', 1),
(3920, 105, 'Реджио Калабрия', 'RC', 1),
(3921, 105, 'Реджио Эмилия', 'RE', 1),
(3922, 105, 'Риети', 'RI', 1),
(3923, 105, 'Римини', 'RN', 1),
(3924, 105, 'Рома', 'RM', 1),
(3925, 105, 'Ровиго', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Сассари', 'SS', 1),
(3928, 105, 'Савона', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Сиракуза', 'SR', 1),
(3931, 105, 'Сондрио', 'SO', 1),
(3932, 105, 'Таранто', 'TA', 1),
(3933, 105, 'Терамо', 'TE', 1),
(3934, 105, 'Терни', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Триест', 'TS', 1),
(3940, 105, 'Удине', 'UD', 1),
(3941, 105, 'Варезе', 'VA', 1),
(3942, 105, 'Венеция', 'VE', 1),
(3943, 105, 'Вербано-Кузьо-Оссола', 'VB', 1),
(3944, 105, 'Верчелли', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Вибо Валентия', 'VV', 1),
(3947, 105, 'Виченца', 'VI', 1),
(3948, 105, 'Витербо', 'VT', 1),
(3949, 222, 'Графство Антрим', 'ANT', 1),
(3950, 222, 'Графство Арма', 'ARM', 1),
(3951, 222, 'Округ Даун', 'DOW', 1),
(3952, 222, 'Графство Фермана', 'FER', 1),
(3953, 222, 'Округ Лондондерри', 'LDY', 1),
(3954, 222, 'Графство Тайрон', 'TYR', 1),
(3955, 222, 'камбрия', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Корошка', '3', 1),
(3959, 190, 'Савинский', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Нижняя Посавска', '6', 1),
(3962, 190, 'Юговходна Словения', '7', 1),
(3963, 190, 'Среднесловенская', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Нотраньск-kraška', '10', 1),
(3966, 190, 'Горишский', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'обман', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Брюссель-столичный регион', 'BRU', 1),
(3971, 138, 'Агуаскальентес', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Бар', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Биело Поле', '04', 1),
(3977, 242, 'Будва', '05', 1),
(3978, 242, 'Цетине', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Герцег-Нови', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Котор', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Плав', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Плужина', '15', 1),
(3988, 242, 'Подгорица', '16', 1),
(3989, 242, 'Розае', '17', 1),
(3990, 242, 'Шавник', '18', 1),
(3991, 242, 'Тиват', '19', 1),
(3992, 242, 'Улцинь', '20', 1),
(3993, 242, 'Жабляк', '21', 1),
(3994, 243, 'Белград', '00', 1),
(3995, 243, 'Северная Бачка', '01', 1),
(3996, 243, 'Центральный Банат', '02', 1),
(3997, 243, 'Северный Банат', '03', 1),
(3998, 243, 'Южный Банат', '04', 1),
(3999, 243, 'Западная Бачка', '05', 1),
(4000, 243, 'Южная Бачка', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Мачва', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Подунавлье', '10', 1),
(4005, 243, 'Браничево', '11', 1),
(4006, 243, 'Sumadija', '12', 1),
(4007, 243, 'Поморавлье', '13', 1),
(4008, 243, 'Бор', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Златибор', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Рашка', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Нишава', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Пирот', '22', 1),
(4017, 243, 'Ябланица', '23', 1),
(4018, 243, 'Пчинья', '24', 1),
(4020, 245, 'Бонайре', 'BO', 1),
(4021, 245, 'Саба', 'SA', 1),
(4022, 245, 'Синт-Эстатиус', 'SE', 1),
(4023, 248, 'Центральная Экватория', 'EC', 1),
(4024, 248, 'Восточная Экватория', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Озера', 'LK', 1),
(4027, 248, 'Северный Бахр-эль-Газаль', 'BN', 1),
(4028, 248, 'Единство', 'UY', 1),
(4029, 248, 'Верхний Нил', 'NU', 1),
(4030, 248, 'Вараб', 'WR', 1),
(4031, 248, 'Западный Бахр-эль-Газаль', 'BW', 1),
(4032, 248, 'Западная Экватория', 'EW', 1),
(4036, 117, 'Айнажи, Салацгривские новады', '0661405', 0),
(4037, 117, 'Айзкраукле, Айзкраукле новады', '0320201', 0),
(4038, 117, 'Айзкраукле новады', '0320200', 0),
(4039, 117, 'Айзпуте, Айзпутес новадс', '0640605', 0),
(4040, 117, 'Айзпутес новадс', '0640600', 0),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 0),
(4042, 117, 'Aknīstes novads', '0560800', 0),
(4043, 117, 'Aloja, Alojas novads', '0661007', 0),
(4044, 117, 'Alojas novads', '0661000', 0),
(4045, 117, 'Alsungas novads', '0624200', 0),
(4046, 117, 'Алуксне, Алукснес новадс', '0360201', 0),
(4047, 117, 'Алукснес новадс', '0360200', 0),
(4048, 117, 'Аматас новадс', '0424701', 0),
(4049, 117, 'Обезьяны, обезьяны новады', '0360805', 0),
(4050, 117, 'Обезьяны новады', '0360800', 0),
(4051, 117, 'Auce, Auces novads', '0460805', 0),
(4052, 117, 'Auces novads', '0460800', 0),
(4053, 117, 'Адажские новады', '0804400', 0),
(4054, 117, 'Бабитские новады', '0804900', 0),
(4055, 117, 'Baldone, Baldones novads', '0800605', 0),
(4056, 117, 'Baldones novads', '0800600', 0),
(4057, 117, 'Баложи, Кекавас новадс', '0800807', 0),
(4058, 117, 'Baltinavas novads', '0384400', 0),
(4059, 117, 'Балви, Балву новадс', '0380201', 0),
(4060, 117, 'Балву новадс', '0380200', 0),
(4061, 117, 'Бауска, Баускас новадс', '0400201', 0),
(4062, 117, 'Баускас новадс', '0400200', 0),
(4063, 117, 'Beverīnas novads', '0964700', 0),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 0),
(4065, 117, 'Brocēnu novads', '0840601', 0),
(4066, 117, 'Буртниеку новадс', '0967101', 0),
(4067, 117, 'Царникавас новадс', '0805200', 0),
(4068, 117, 'Цесвайне, Цесвайны новады', '0700807', 0),
(4069, 117, 'Cesvaines novads', '0700800', 0),
(4070, 117, 'Цесис, Cēsu novads', '0420201', 0),
(4071, 117, 'Cēsu novads', '0420200', 0),
(4072, 117, 'Ciblas NOVAD', '0684901', 0),
(4073, 117, 'Дагда, Дагдас Новадс', '0601009', 0),
(4074, 117, 'Дагдас новадс', '0601000', 0),
(4075, 117, 'Даугавпилс', '0050000', 0),
(4076, 117, 'Даугавпилсские новады', '0440200', 0),
(4077, 117, 'Добеле, Добелес Новадс', '0460201', 0),
(4078, 117, 'Добельские новады', '0460200', 0),
(4079, 117, 'Dundagas novads', '0885100', 0),
(4080, 117, 'Дурб, Дурбес Новадс', '0640807', 0),
(4081, 117, 'Дурбес новад', '0640801', 0),
(4082, 117, 'Engures novads', '0905100', 0),
(4083, 117, 'Ļrgļu novads', '0705500', 0),
(4084, 117, 'Гаркалнес новадс', '0806000', 0),
(4085, 117, 'Гробиня, Гробиняс новадс', '0641009', 0),
(4086, 117, 'Grobiņas novads', '0641000', 0),
(4087, 117, 'Гулбене, Гулбенес Новадс', '0500201', 0),
(4088, 117, 'Гулбенес новадс', '0500200', 0),
(4089, 117, 'Iecavas novads', '0406400', 0),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 0),
(4091, 117, 'Ikšķiles novads', '0740600', 0),
(4092, 117, 'Илуксте, Илукстес новадс', '0440807', 0),
(4093, 117, 'Илукстес новадс', '0440801', 0),
(4094, 117, 'Инчукалнские новады', '0801800', 0),
(4095, 117, 'Яунелгава, Jaunjelgavas novads', '0321007', 0),
(4096, 117, 'Jaunjelgavas novads', '0321000', 0),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 0),
(4098, 117, 'Яунпилсские новады', '0905700', 0),
(4099, 117, 'Елгава', '0090000', 0),
(4100, 117, 'Елгавские новады', '0540200', 0),
(4101, 117, 'Екабпилс', '0110000', 0),
(4102, 117, 'Екабпилс новадс', '0560200', 0),
(4103, 117, 'Jūrmala', '0130000', 0),
(4104, 117, 'Калнциемс, Елгавас Новадс', '0540211', 0),
(4105, 117, 'Кандава, Кандавас Новадс', '0901211', 0),
(4106, 117, 'Кандавас Новадс', '0901201', 0),
(4107, 117, 'Карсава, Карсавас новадс', '0681009', 0),
(4108, 117, 'Карсавские новады', '0681000', 0),
(4109, 117, 'Kocēnu novads, bij.  Valmieras)', '0960200', 0),
(4110, 117, 'Кокнесесские новады', '0326100', 0),
(4111, 117, 'Краслава, Краславские новады', '0600201', 0),
(4112, 117, 'Краславские новады', '0600202', 0),
(4113, 117, 'Кримулдас Новадс', '0806900', 0),
(4114, 117, 'Крустпилс новадс', '0566900', 0),
(4115, 117, 'Кулдига, Kuldīgas novads', '0620201', 0),
(4116, 117, 'Kuldīgas novads', '0620200', 0),
(4117, 117, 'Кегумские новады', '0741001', 0),
(4118, 117, 'Кегумс, Кегума новадс', '0741009', 0),
(4119, 117, 'Кекавас новадс', '0800800', 0),
(4120, 117, 'Лиелварде, Лиелварде новадс', '0741413', 0),
(4121, 117, 'Лиелвардские новады', '0741401', 0),
(4122, 117, 'Лиепайский', '0170000', 0),
(4123, 117, 'Лимбажи, Лимбажу новадс', '0660201', 0),
(4124, 117, 'Лимбажу новадс', '0660200', 0),
(4125, 117, 'Лигатне, Лигатнес Новадс', '0421211', 0),
(4126, 117, 'Лигатнес Новадс', '0421200', 0),
(4127, 117, 'Ливаны, Ливанские новады', '0761211', 0),
(4128, 117, 'Ливанские новады', '0761201', 0),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 0),
(4130, 117, 'Lubānas novads', '0701400', 0),
(4131, 117, 'Лудза, Лудзас новадс', '0680201', 0),
(4132, 117, 'Лудзас новадс', '0680200', 0),
(4133, 117, 'Мадона, Мадонас новадс', '0700201', 0),
(4134, 117, 'Мадонас новадс', '0700200', 0),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 0),
(4136, 117, 'Mazsalacas novads', '0961000', 0),
(4137, 117, 'Малпилс новадс', '0807400', 0),
(4138, 117, 'Марупские новады', '0807600', 0),
(4139, 117, 'Мерсрага новадс', '0887600', 0),
(4140, 117, 'Naukšēnu novads', '0967300', 0),
(4141, 117, 'Неретас новадс', '0327100', 0),
(4142, 117, 'Nīcas novads', '0647900', 0),
(4143, 117, 'Огр, Огрские новады', '0740201', 0),
(4144, 117, 'Огрские новады', '0740202', 0),
(4145, 117, 'Олэйн, олэйнс новадс', '0801009', 0),
(4146, 117, 'Олэйны новадс', '0801000', 0),
(4147, 117, 'Озольниеку новады', '0546701', 0),
(4148, 117, 'Паргауйские новады', '0427500', 0),
(4149, 117, 'Павилоста, Павилостас новадс', '0641413', 0),
(4150, 117, 'Pavilostas novads', '0641401', 0),
(4151, 117, 'Пилтене, Вентспилсский новад', '0980213', 0),
(4152, 117, 'Pļavi ,as, Pņaviņu novads', '0321413', 0),
(4153, 117, 'Плявинские новады', '0321400', 0),
(4154, 117, 'Preiļi, Prei nou novads', '0760201', 0),
(4155, 117, 'Прейльские новады', '0760202', 0),
(4156, 117, 'Приекуле, Приекулес новадс', '0641615', 0),
(4157, 117, 'Приекулес Новадс', '0641600', 0),
(4158, 117, 'Prieku nou novads', '0427300', 0),
(4159, 117, 'Раунас новадс', '0427700', 0),
(4160, 117, 'Резекненский', '0210000', 0),
(4161, 117, 'Резекнес новады', '0780200', 0),
(4162, 117, 'Рибиньу новадс', '0766300', 0),
(4163, 117, 'Рига', '0010000', 0),
(4164, 117, 'Рохас новадс', '0888300', 0),
(4165, 117, 'Ropažu novads', '0808400', 0),
(4166, 117, 'Рукавас новадс', '0648500', 0),
(4167, 117, 'Rugāju novads', '0387500', 0),
(4168, 117, 'Rundāles novads', '0407700', 0),
(4169, 117, 'Руджиена, Ружиен новадс', '0961615', 0),
(4170, 117, 'Руженас Новадс', '0961600', 0),
(4171, 117, 'Сабиле, Талсу новадс', '0880213', 0),
(4172, 117, 'Салацгрива, Салацгривские новады', '0661415', 0),
(4173, 117, 'Салацгривские новады', '0661400', 0),
(4174, 117, 'Салас Новадс', '0568700', 0),
(4175, 117, 'Саласпилсские новады', '0801200', 0),
(4176, 117, 'Саласпилс, Salaspils novads', '0801211', 0),
(4177, 117, 'Салдус Новадс', '0840200', 0),
(4178, 117, 'Салдус, Салдус Новадс', '0840201', 0),
(4179, 117, 'Саулкрасты, Саулкрасту Новадс', '0801413', 0),
(4180, 117, 'Саулкрасту новадс', '0801400', 0),
(4181, 117, 'Седа, Стренчу новадс', '0941813', 0),
(4182, 117, 'Сеяс новадс', '0809200', 0),
(4183, 117, 'Сигулда, Сигулдас новадс', '0801615', 0),
(4184, 117, 'Сигулдас Новадс', '0801601', 0),
(4185, 117, 'Скриверу новадс', '0328200', 0),
(4186, 117, 'Скрунда, Скрундас новадс', '0621209', 0),
(4187, 117, 'Скрундас новадс', '0621200', 0),
(4188, 117, 'Смилтене, Смилтенес Новадс', '0941615', 0),
(4189, 117, 'Смилтенские новады', '0941600', 0),
(4190, 117, 'Staicele, Alojas novads', '0661017', 0),
(4191, 117, 'Стенде, Талсу новадс', '0880215', 0),
(4192, 117, 'Stopiņu novads', '0809600', 0),
(4193, 117, 'Стренчи, Стренчу новад', '0941817', 0),
(4194, 117, 'Strenču novads', '0941800', 0),
(4195, 117, 'Субате, Илукстес новадс', '0440815', 0),
(4196, 117, 'Талси, Талсу новадс', '0880201', 0),
(4197, 117, 'Талсу новады', '0880200', 0),
(4198, 117, 'Терветские новады', '0468900', 0),
(4199, 117, 'Тукума новадс', '0900200', 0),
(4200, 117, 'Тукумс, Тукума Новадс', '0900201', 0),
(4201, 117, 'Vaiņodes novads', '0649300', 0),
(4202, 117, 'Валдемарпилс, Талсу новад', '0880217', 0),
(4203, 117, 'Валка, Валькас новадс', '0940201', 0),
(4204, 117, 'Валькас новад', '0940200', 0),
(4205, 117, 'Валмиера', '0250000', 0),
(4206, 117, 'Вангажи, Инчукалнские новады', '0801817', 0),
(4207, 117, 'Варакшаны, Варакшану новад', '0701817', 0),
(4208, 117, 'Варакшану новадс', '0701800', 0),
(4209, 117, 'Варкавские новады', '0769101', 0),
(4210, 117, 'Vecpiebalgas novads', '0429300', 0),
(4211, 117, 'Вецумниеку новады', '0409500', 0),
(4212, 117, 'Вентспилс', '0270000', 0),
(4213, 117, 'Вентспилсские новады', '0980200', 0),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 0),
(4215, 117, 'Viesītes novads', '0561800', 0),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 0),
(4217, 117, 'Viļakas novads', '0381600', 0),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 0),
(4219, 117, 'Viļānu novads', '0781800', 0),
(4220, 117, 'Зилупе, Зилупес новадс', '0681817', 0),
(4221, 117, 'Зилупес новад', '0681801', 0),
(4222, 43, 'Арика и Паринакота', 'AP', 1),
(4223, 43, 'Лос Риос', 'LR', 1),
(4225, 118, 'Бейрут', 'LB-BR', 1),
(4226, 118, 'Бекаа', 'LB-BE', 1),
(4227, 118, 'Гора Ливан', 'LB-ML', 1),
(4228, 118, 'Набатии', 'LB-NB', 1),
(4229, 118, 'к северу', 'LB-NR', 1),
(4230, 118, 'юг', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1),
(4232, 44, 'Цинхай', 'QH', 1),
(4233, 100, 'Папуа Барат', 'PB', 1),
(4234, 100, 'Сулавеси Барат', 'SR', 1),
(4235, 100, 'Кепулауан Риау', 'KR', 1),
(4236, 105, 'Барлетта-Андрия-Трани', 'BT', 1),
(4237, 105, 'Фермо', 'FM', 1),
(4238, 105, 'Монца Брианца', 'MB', 1),
(4488, 176, 'Ханты-Мансийский автономный округ - Югра', 'KHM', 1),
(4487, 176, 'Ненецкий автономный округ', 'NEN', 1),
(4510, 220, 'Сумская область', 'UA-59', 1),
(4479, 176, 'Тульская область', 'TUL', 1),
(4481, 176, 'Ульяновская область', 'ULY', 1),
(4480, 176, 'Тюменская область', 'TYU', 1),
(4491, 220, 'Винницкая область', 'UA-05', 1),
(4505, 220, 'Автономная Республика Крым', 'UA-43', 1),
(4504, 220, 'Севастополь', 'UA-40', 1),
(4503, 220, 'Кировоградская область', 'UA-35', 1),
(4472, 176, 'Саратовская область', 'SAR', 1),
(4471, 176, 'Самарская область', 'SAM', 1),
(4470, 176, 'Рязанская область', 'RYA', 1),
(4467, 176, 'Пензенская область', 'PNZ', 1),
(4459, 176, 'Московская область', 'MOS', 1),
(4463, 176, 'Новосибирская область', 'NVS', 1),
(4462, 176, 'Новгородская область', 'NGR', 1),
(4456, 176, 'Ленинградская область', 'LEN', 1),
(4489, 176, 'Чукотский автономный округ', 'CHU', 1),
(4451, 176, 'Кемеровская область', 'KEM', 1),
(4497, 220, 'Ровненская область', 'UA-56', 1),
(4452, 176, 'Кировская область', 'KIR', 1),
(4453, 176, 'Костромская область', 'KOS', 1),
(4450, 176, 'Калужская область', 'KAL', 1),
(4445, 176, 'Вологодская область', 'VLG', 1),
(4442, 176, 'Брянская область', 'BRY', 1),
(4494, 220, 'Днепропетровская область', 'UA-12', 1),
(4493, 220, 'Луганская область', 'UA-09', 1),
(4492, 220, 'Волынская область', 'UA-07', 1),
(4441, 176, 'Белгородская область', 'BEL', 1),
(4440, 176, 'Астраханская область', 'AST', 1),
(4438, 176, 'Амурская область', 'AMU', 1),
(4439, 176, 'Архангельская область', 'ARK', 1),
(4437, 176, 'Хабаровский край', 'KHA', 1),
(4436, 176, 'Ставропольский край', 'STA', 1),
(4435, 176, 'Приморский край', 'PRI', 1),
(4433, 176, 'Красноярский край', 'KYA', 1),
(4434, 176, 'Пермский край', 'PER', 1),
(4431, 176, 'Камчатский край', 'KAM', 1),
(4432, 176, 'Краснодарский край', 'KDA', 1),
(4430, 176, 'Забайкальский край', 'ZAB', 1),
(4429, 176, 'Алтайский край', 'ALT', 1),
(4427, 176, 'Чеченская республика', 'CE', 1),
(4428, 176, 'Чувашская республика', 'CU', 1),
(4426, 176, 'Республика Хакасия', 'KK', 1),
(4424, 176, 'Республика Тыва', 'TY', 1),
(4425, 176, 'Удмуртская республика', 'UD', 1),
(4423, 176, 'Республика Татарстан', 'TA', 1),
(4422, 176, 'Республика Северная Осетия — Алания', 'SE', 1),
(4421, 176, 'Республика Саха (Якутия)', 'SA', 1),
(4420, 176, 'Республика Мордовия', 'MO', 1),
(4419, 176, 'Республика Марий Эл', 'ME', 1),
(4417, 176, 'Республика Коми', 'KO', 1),
(4418, 176, 'Республика Крым', 'CR', 1),
(4416, 176, 'Республика Карелия', 'KR', 1),
(4415, 176, 'Карачаево-Черкесская республика', 'KC', 1),
(4414, 176, 'Республика Калмыкия', 'KL', 1),
(4413, 176, 'Кабардино-Балкарская республика', 'KB', 1),
(4412, 176, 'Республика Ингушетия', 'IN', 1),
(4411, 176, 'Республика Дагестан', 'DA', 1),
(4410, 176, 'Республика Бурятия', 'BU', 1),
(4409, 176, 'Республика Башкортостан', 'BA', 1),
(4408, 176, 'Республика Алтай', 'AL', 1),
(4407, 176, 'Республика Адыгея', 'AD', 1),
(4490, 176, 'Ямало-Ненецкий автономный округ', 'YAN', 1),
(4512, 220, 'Харьковская область', 'UA-63', 1),
(4513, 220, 'Херсонская область', 'UA-65', 1),
(4514, 220, 'Хмельницкая область', 'UA-68', 1),
(4515, 220, 'Черкасская область', 'UA-71', 1),
(4516, 220, 'Черниговская область', 'UA-74', 1),
(4517, 220, 'Черновицкая область', 'UA-77', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(111, 176, 2761, 4, '2019-01-11 13:31:12', '0000-00-00 00:00:00'),
(119, 220, 3490, 3, '2019-01-11 13:33:47', '0000-00-00 00:00:00'),
(118, 220, 3493, 3, '2019-01-11 13:33:47', '0000-00-00 00:00:00'),
(117, 220, 3485, 3, '2019-01-11 13:33:47', '0000-00-00 00:00:00'),
(116, 220, 3484, 3, '2019-01-11 13:33:47', '0000-00-00 00:00:00'),
(115, 220, 3483, 3, '2019-01-11 13:33:47', '0000-00-00 00:00:00'),
(114, 220, 3482, 3, '2019-01-11 13:33:47', '0000-00-00 00:00:00'),
(113, 220, 3481, 3, '2019-01-11 13:33:47', '0000-00-00 00:00:00'),
(112, 220, 3480, 3, '2019-01-11 13:33:47', '0000-00-00 00:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `oc_advertise_google_target`
--
ALTER TABLE `oc_advertise_google_target`
  ADD PRIMARY KEY (`advertise_google_target_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Индексы таблицы `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Индексы таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Индексы таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Индексы таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Индексы таблицы `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Индексы таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Индексы таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Индексы таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Индексы таблицы `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Индексы таблицы `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Индексы таблицы `oc_category_to_google_product_category`
--
ALTER TABLE `oc_category_to_google_product_category`
  ADD PRIMARY KEY (`google_product_category`,`store_id`),
  ADD KEY `category_id_store_id` (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Индексы таблицы `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Индексы таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Индексы таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Индексы таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Индексы таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Индексы таблицы `oc_customer_affiliate`
--
ALTER TABLE `oc_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Индексы таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Индексы таблицы `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Индексы таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Индексы таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Индексы таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Индексы таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Индексы таблицы `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Индексы таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Индексы таблицы `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Индексы таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Индексы таблицы `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Индексы таблицы `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Индексы таблицы `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Индексы таблицы `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Индексы таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Индексы таблицы `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Индексы таблицы `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`);

--
-- Индексы таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Индексы таблицы `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Индексы таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Индексы таблицы `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Индексы таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Индексы таблицы `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Индексы таблицы `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Индексы таблицы `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Индексы таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Индексы таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Индексы таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Индексы таблицы `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Индексы таблицы `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Индексы таблицы `oc_manufacturer_description`
--
ALTER TABLE `oc_manufacturer_description`
  ADD PRIMARY KEY (`manufacturer_id`,`language_id`);

--
-- Индексы таблицы `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Индексы таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Индексы таблицы `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Индексы таблицы `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Индексы таблицы `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Индексы таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Индексы таблицы `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Индексы таблицы `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Индексы таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Индексы таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Индексы таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Индексы таблицы `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  ADD PRIMARY KEY (`order_shipment_id`);

--
-- Индексы таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Индексы таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Индексы таблицы `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `oc_product_advertise_google`
--
ALTER TABLE `oc_product_advertise_google`
  ADD PRIMARY KEY (`product_advertise_google_id`),
  ADD UNIQUE KEY `product_id_store_id` (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_advertise_google_status`
--
ALTER TABLE `oc_product_advertise_google_status`
  ADD PRIMARY KEY (`product_id`,`store_id`,`product_variation_id`);

--
-- Индексы таблицы `oc_product_advertise_google_target`
--
ALTER TABLE `oc_product_advertise_google_target`
  ADD PRIMARY KEY (`product_id`,`advertise_google_target_id`);

--
-- Индексы таблицы `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Индексы таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Индексы таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Индексы таблицы `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Индексы таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Индексы таблицы `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Индексы таблицы `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Индексы таблицы `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Индексы таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Индексы таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Индексы таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Индексы таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Индексы таблицы `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Индексы таблицы `oc_session`
--
ALTER TABLE `oc_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Индексы таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `oc_shipping_courier`
--
ALTER TABLE `oc_shipping_courier`
  ADD PRIMARY KEY (`shipping_courier_id`);

--
-- Индексы таблицы `oc_statistics`
--
ALTER TABLE `oc_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Индексы таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Индексы таблицы `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Индексы таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Индексы таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Индексы таблицы `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Индексы таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Индексы таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Индексы таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Индексы таблицы `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Индексы таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Индексы таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Индексы таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Индексы таблицы `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Индексы таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Индексы таблицы `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Индексы таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Индексы таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT для таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT для таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  MODIFY `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  MODIFY `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT для таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2409;

--
-- AUTO_INCREMENT для таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT для таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT для таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT для таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  MODIFY `seo_url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1163;

--
-- AUTO_INCREMENT для таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3356;

--
-- AUTO_INCREMENT для таблицы `oc_statistics`
--
ALTER TABLE `oc_statistics`
  MODIFY `statistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT для таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4518;

--
-- AUTO_INCREMENT для таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
COMMIT;