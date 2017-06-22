# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: rm-wz9g37e75ha54f140o.mysql.rds.aliyuncs.com (MySQL 5.6.34)
# Database: forexroo
# Generation Time: 2017-06-22 07:39:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table agent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent`;

CREATE TABLE `agent` (
  `name` varchar(255) DEFAULT NULL COMMENT '代理商名称',
  `account` varchar(255) DEFAULT NULL COMMENT '代理商帐号',
  `balance` varchar(255) DEFAULT NULL COMMENT '余额',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `region` varchar(255) DEFAULT NULL COMMENT '地区',
  `is_disable` int(11) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_closing` int(11) NOT NULL DEFAULT '0' COMMENT '是否销户',
  `register_time` bigint(20) DEFAULT NULL COMMENT '注册时间戳',
  `bank_detail_account_name` varchar(255) DEFAULT NULL COMMENT '银行资料-开户名称',
  `bank_detail_account_number` varchar(255) DEFAULT NULL COMMENT '银行资料-银行账号',
  `bank_detail_opening_bank` varchar(255) DEFAULT NULL COMMENT '银行资料-开户银行',
  `bank_detail_opening_bank_address` varchar(255) DEFAULT NULL COMMENT '银行资料-开户地',
  `creator_user_id` bigint(20) DEFAULT NULL COMMENT '创建人-ID',
  `creator_user_name` varchar(255) DEFAULT NULL COMMENT '创建人-姓名',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;

INSERT INTO `agent` (`name`, `account`, `balance`, `password`, `region`, `is_disable`, `is_closing`, `register_time`, `bank_detail_account_name`, `bank_detail_account_number`, `bank_detail_opening_bank`, `bank_detail_opening_bank_address`, `creator_user_id`, `creator_user_name`, `id`)
VALUES
	('北京测试公司','312312312',NULL,'123123123123',NULL,0,0,1498013046714,NULL,'12312312312312','北京','北京',1,'admui',51500),
	('北京测试公司2','123',NULL,'123',NULL,0,0,1498013060203,NULL,'123','1231','1231',1,'admui',51501),
	('123123','1231231231',NULL,'123123123',NULL,0,0,1498013076768,NULL,'123123','123123','123123',1,'admui',51503);

/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table agent_deposit_and_withdraw
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_deposit_and_withdraw`;

CREATE TABLE `agent_deposit_and_withdraw` (
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `amount` varchar(255) DEFAULT NULL COMMENT '金额',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `agent_id` bigint(20) DEFAULT NULL COMMENT '代理商ID',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `time` bigint(20) DEFAULT NULL COMMENT '申请时间戳',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT '审核人-ID',
  `audit_user_name` varchar(255) DEFAULT NULL COMMENT '审核人-姓名',
  `audit_timestamp` bigint(20) DEFAULT NULL COMMENT '审核时间戳',
  `audit_fail_reason` int(11) NOT NULL DEFAULT '0' COMMENT '审核失败-原因',
  `audit_success_time` bigint(20) DEFAULT NULL COMMENT '审核通过时间戳',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table deposit_and_withdraw
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deposit_and_withdraw`;

CREATE TABLE `deposit_and_withdraw` (
  `raw_request` text COMMENT '原始请求',
  `mt4_raw_request` text COMMENT 'MT4-原始请求',
  `mt4_raw_response` text COMMENT 'MT4-原始响应',
  `mt4_request_time` bigint(20) DEFAULT NULL COMMENT 'MT4-发送请求时间戳',
  `mt4_response_time` bigint(20) DEFAULT NULL COMMENT 'MT4-收到响应时间戳',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单ID',
  `amount` varchar(255) DEFAULT NULL COMMENT '金额',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `mt4_real_account` varchar(255) DEFAULT NULL COMMENT 'MT4-真实账号',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `time` bigint(20) DEFAULT NULL COMMENT '申请时间戳',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT '审核人-ID',
  `audit_user_name` varchar(255) DEFAULT NULL COMMENT '审核人-姓名',
  `audit_timestamp` bigint(20) DEFAULT NULL COMMENT '审核时间戳',
  `audit_fail_reason` int(11) NOT NULL DEFAULT '0' COMMENT '审核失败-原因',
  `audit_success_time` bigint(20) DEFAULT NULL COMMENT '审核通过时间戳',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `deposit_and_withdraw` WRITE;
/*!40000 ALTER TABLE `deposit_and_withdraw` DISABLE KEYS */;

INSERT INTO `deposit_and_withdraw` (`raw_request`, `mt4_raw_request`, `mt4_raw_response`, `mt4_request_time`, `mt4_response_time`, `type`, `order_id`, `amount`, `comment`, `user_id`, `mt4_real_account`, `status`, `time`, `audit_user_id`, `audit_user_name`, `audit_timestamp`, `audit_fail_reason`, `audit_success_time`, `id`)
VALUES
	('{\"amount\":\"1000.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498017123829,\"sendToEngineTimestamp\":0,\"token\":\"3cec772e-681e-447e-91e8-b65168e76a02\",\"uuid\":\"96254488-d448-43ac-8904-41d1c0f7aeff\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000522}','{\"orderid\":47014277,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000522,\"reqid\":\"9e162619-d61f-4ca3-b99c-ae0f1d7812d0\"}',1498017123843,1498017123931,1,'47014277','1000.0',NULL,18000100,NULL,0,1498017123931,NULL,NULL,NULL,0,NULL,1),
	('{\"amount\":\"20000.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498017138076,\"sendToEngineTimestamp\":0,\"token\":\"3cec772e-681e-447e-91e8-b65168e76a02\",\"uuid\":\"a66a34b7-3da1-488e-9777-5e99774e8d6f\"}','{\"amount\":20000.0,\"operationtype\":1,\"login\":996000522}','{\"orderid\":47014278,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000522,\"reqid\":\"06cc89ee-bdb3-4eff-8ad9-fa71f07bd974\"}',1498017138083,1498017138164,1,'47014278','20000.0',NULL,18000100,NULL,0,1498017138164,NULL,NULL,NULL,0,NULL,2),
	('{\"amount\":\"5000.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114524350,\"sendToEngineTimestamp\":0,\"token\":\"3a0d9702-82c4-4f86-8f42-884f26f64e3f\",\"uuid\":\"daafef3e-a395-44ef-bde0-b69e2ba41df7\"}','{\"amount\":5000.0,\"operationtype\":1,\"login\":996000522}','{\"orderid\":47071681,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000522,\"reqid\":\"ea3b2331-8847-46da-a4e5-029cad2c194a\"}',1498114524366,1498114524469,1,'47071681','5000.0',NULL,18000100,NULL,0,1498114524470,NULL,NULL,NULL,0,NULL,3),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114836244,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"4bc620df-b116-4a98-a78e-ed9f344dfa55\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071682,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"34ca8e03-36c6-42e3-a16b-273512a038d5\"}',1498114836253,1498114836346,1,'47071682','1000.0',NULL,18000102,NULL,0,1498114836346,NULL,NULL,NULL,0,NULL,4),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114890373,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"33598783-e25f-4710-a48c-ed9a36fa627a\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071683,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"1b0882e3-bc8b-4018-a360-000ca7085658\"}',1498114890385,1498114890469,1,'47071683','1000.0',NULL,18000102,NULL,0,1498114890469,NULL,NULL,NULL,0,NULL,5),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114893354,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"e5baf87a-45c0-4dbc-9e23-d298ce384f50\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071684,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"703fb70a-e9a8-4ac2-a3e2-659370ba0d96\"}',1498114893365,1498114893547,1,'47071684','1000.0',NULL,18000102,NULL,0,1498114893547,NULL,NULL,NULL,0,NULL,6),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114896423,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"7ed1b235-6cc9-4d09-b95f-27ecae9892d0\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071685,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"08d3dd9b-b83e-4f3c-a0e6-e82e90abfb92\"}',1498114896434,1498114896785,1,'47071685','1000.0',NULL,18000102,NULL,0,1498114896785,NULL,NULL,NULL,0,NULL,7),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114901264,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"4ca4f3ec-4c6c-47de-b027-b89fe374c3a5\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071686,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"1d9ad2d8-d431-4118-8dda-ca4fd5527433\"}',1498114901274,1498114901391,1,'47071686','1000.0',NULL,18000102,NULL,0,1498114901391,NULL,NULL,NULL,0,NULL,8),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114906514,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"2d4ab4e8-70d4-4f9a-b839-6b02b1c6b6a8\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071687,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"b9196612-69ed-4b36-9315-599185f3ed30\"}',1498114906524,1498114906604,1,'47071687','1000.0',NULL,18000102,NULL,0,1498114906604,NULL,NULL,NULL,0,NULL,9),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114908353,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"f9f0e623-53f5-4f64-bb2c-25a9cb101f26\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071688,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"d9995b73-b826-48a7-b2ea-980d71878678\"}',1498114908364,1498114908457,1,'47071688','1000.0',NULL,18000102,NULL,0,1498114908457,NULL,NULL,NULL,0,NULL,10),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114909524,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"f3f1b428-80f1-4ecc-8f95-fe01cb9fa40b\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071689,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"62302d36-f11a-46e9-a294-8383d16445b4\"}',1498114909534,1498114910020,1,'47071689','1000.0',NULL,18000102,NULL,0,1498114910020,NULL,NULL,NULL,0,NULL,11),
	('{\"amount\":\"1000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498114910875,\"sendToEngineTimestamp\":0,\"token\":\"c1579c7c-2def-4646-9acf-72305c45d2bc\",\"uuid\":\"7f1f63f8-2527-46d6-9659-ebdbe2a991ff\"}','{\"amount\":1000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071690,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"5dae84c9-6ecf-4f49-97bc-28973aa60ab3\"}',1498114910885,1498114910976,1,'47071690','1000.0',NULL,18000102,NULL,0,1498114910976,NULL,NULL,NULL,0,NULL,12),
	('{\"amount\":\"10000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1498115068675,\"sendToEngineTimestamp\":0,\"token\":\"78ee35e7-92d0-4898-82ed-7b75fb6e217f\",\"uuid\":\"64991e09-8857-43ec-ab25-c4b0b7002758\"}','{\"amount\":10000.0,\"operationtype\":1,\"login\":996000524}','{\"orderid\":47071691,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000524,\"reqid\":\"f6a4b934-8a50-4301-b885-38aad62aafc4\"}',1498115068685,1498115068802,1,'47071691','10000.0',NULL,18000102,NULL,0,1498115068802,NULL,NULL,NULL,0,NULL,13);

/*!40000 ALTER TABLE `deposit_and_withdraw` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `content` text COMMENT '意见反馈详细描述',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `time` bigint(20) DEFAULT NULL COMMENT '时间',
  `picture_urls` varchar(255) DEFAULT NULL COMMENT '截图照片URL',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table master_trader_rankings_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `master_trader_rankings_history`;

CREATE TABLE `master_trader_rankings_history` (
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `total_profit` varchar(255) DEFAULT NULL COMMENT '总盈利',
  `single_profit` varchar(255) DEFAULT NULL COMMENT '均单盈利',
  `success_rate` varchar(255) DEFAULT NULL COMMENT '成功率',
  `time` varchar(255) DEFAULT NULL COMMENT '时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table mt4_history_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mt4_history_order`;

CREATE TABLE `mt4_history_order` (
  `activation` varchar(255) DEFAULT NULL,
  `close_price` varchar(255) DEFAULT NULL,
  `close_time` bigint(20) DEFAULT NULL,
  `cmd` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `commission` varchar(255) DEFAULT NULL,
  `commission_agent` varchar(255) DEFAULT NULL,
  `conv_rates1` varchar(255) DEFAULT NULL,
  `conv_rates2` varchar(255) DEFAULT NULL,
  `conv_reserv` varchar(255) DEFAULT NULL,
  `digits` varchar(255) DEFAULT NULL,
  `expiration` varchar(255) DEFAULT NULL,
  `gw_close_price` varchar(255) DEFAULT NULL,
  `gw_open_price` varchar(255) DEFAULT NULL,
  `gw_order` varchar(255) DEFAULT NULL,
  `gw_volume` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `magic` varchar(255) DEFAULT NULL,
  `margin_rate` varchar(255) DEFAULT NULL,
  `open_price` varchar(255) DEFAULT NULL,
  `open_time` bigint(20) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `profit` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `sl` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `storage` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `taxes` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `tp` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mt4_history_order` WRITE;
/*!40000 ALTER TABLE `mt4_history_order` DISABLE KEYS */;

INSERT INTO `mt4_history_order` (`activation`, `close_price`, `close_time`, `cmd`, `comment`, `commission`, `commission_agent`, `conv_rates1`, `conv_rates2`, `conv_reserv`, `digits`, `expiration`, `gw_close_price`, `gw_open_price`, `gw_order`, `gw_volume`, `login`, `magic`, `margin_rate`, `open_price`, `open_time`, `order_id`, `profit`, `reason`, `sl`, `state`, `storage`, `symbol`, `taxes`, `timestamp`, `tp`, `volume`, `id`)
VALUES
	('0','0',1498115625,6,'2017-06-22 03:11:37 入金:100000','0','0',NULL,NULL,'','0','0','0','0','0','0','996000493','0','0','0',1498115625,47071693,'100000','0','0','0','0','','0',1498115625,'0','1',1),
	('0','1.1162700000000001',0,1,'20170429test','0','0',NULL,NULL,'a','5','0','0','0','0','0','996000493','0','1.1162700000000001','1.1162700000000001',1498116084,47071698,'0','2','0','0','0','EURUSD','0',1498116084,'0','100',2),
	('0','1.11626',0,0,'20170429test','0','0',NULL,NULL,'','5','0','0','0','0','0','996000522','0','1.11626','1.11626',1498117037,47071700,'0','2','0','0','0','EURUSD','0',1498117037,'0','10',3);

/*!40000 ALTER TABLE `mt4_history_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mt4_history_order_sync_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mt4_history_order_sync_log`;

CREATE TABLE `mt4_history_order_sync_log` (
  `request_arg_login` varchar(255) DEFAULT NULL COMMENT '请求参数-MT4帐号',
  `request_arg_symbol` varchar(255) DEFAULT NULL COMMENT '请求参数-品种',
  `request_arg_trade_type` int(11) DEFAULT NULL COMMENT '请求参数-类型',
  `request_arg_from_time` bigint(20) DEFAULT NULL COMMENT '请求参数-开始时间戳',
  `request_arg_end_time` bigint(20) DEFAULT NULL COMMENT '请求参数-结束时间戳',
  `request_time` bigint(20) DEFAULT NULL COMMENT '请求时间戳',
  `response_time` bigint(20) DEFAULT NULL COMMENT '响应时间戳',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table my_bank_card
# ------------------------------------------------------------

DROP TABLE IF EXISTS `my_bank_card`;

CREATE TABLE `my_bank_card` (
  `bank_card_number` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `reserved_phone` varchar(255) DEFAULT NULL COMMENT '预留手机号',
  `bank_image` varchar(255) DEFAULT NULL COMMENT '银行LOGO',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `card_name` varchar(255) DEFAULT NULL COMMENT '卡名称',
  `card_type` varchar(255) DEFAULT NULL COMMENT '卡类型',
  `service_phone` varchar(255) DEFAULT NULL COMMENT '服务热线',
  `apistore_raw_response` text COMMENT '寻程-银行卡四要素认证v3-原始响应',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `time` bigint(20) DEFAULT NULL COMMENT '时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table my_master_trader
# ------------------------------------------------------------

DROP TABLE IF EXISTS `my_master_trader`;

CREATE TABLE `my_master_trader` (
  `master_trader_user_id` bigint(20) DEFAULT NULL COMMENT '大师ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `time` bigint(20) DEFAULT NULL COMMENT '时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table my_symbol
# ------------------------------------------------------------

DROP TABLE IF EXISTS `my_symbol`;

CREATE TABLE `my_symbol` (
  `symbol` varchar(255) DEFAULT NULL COMMENT '品种',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `time` bigint(20) DEFAULT NULL COMMENT '时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `my_symbol` WRITE;
/*!40000 ALTER TABLE `my_symbol` DISABLE KEYS */;

INSERT INTO `my_symbol` (`symbol`, `user_id`, `time`, `id`)
VALUES
	('EURUSD',18000100,1497602693377,1),
	('USDJPY',18000100,1497602693377,2),
	('AUDUSD',18000100,1497602693377,3),
	('XAUUSD',18000100,1497602693377,4),
	('UKOUSD',18000100,1497602693377,5),
	('EURUSD',18000101,1497608297958,6),
	('USDJPY',18000101,1497608297958,7),
	('AUDUSD',18000101,1497608297958,8),
	('XAUUSD',18000101,1497608297958,9),
	('UKOUSD',18000101,1497608297958,10),
	('EURUSD',18000102,1497840614689,11),
	('USDJPY',18000102,1497840614689,12),
	('AUDUSD',18000102,1497840614689,13),
	('XAUUSD',18000102,1497840614689,14),
	('UKOUSD',18000102,1497840614689,15),
	('EURUSD',18000103,1498012695365,16),
	('USDJPY',18000103,1498012695365,17),
	('AUDUSD',18000103,1498012695365,18),
	('XAUUSD',18000103,1498012695365,19),
	('UKOUSD',18000103,1498012695365,20);

/*!40000 ALTER TABLE `my_symbol` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_version
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_version`;

CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;

INSERT INTO `schema_version` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`)
VALUES
	(1,'1','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'forexroo','2017-06-16 16:39:13',0,1),
	(2,'1.1','CreateTable User','JDBC','com.github.xuzw.forexroo.database.migration.V1_1__CreateTable_User',NULL,'forexroo','2017-06-16 16:39:14',118,1),
	(3,'1.2','CreateTable Feedback','JDBC','com.github.xuzw.forexroo.database.migration.V1_2__CreateTable_Feedback',NULL,'forexroo','2017-06-16 16:39:15',93,1),
	(4,'1.3','CreateTable MasterTraderRankingsHistory','JDBC','com.github.xuzw.forexroo.database.migration.V1_3__CreateTable_MasterTraderRankingsHistory',NULL,'forexroo','2017-06-16 16:39:15',99,1),
	(5,'1.4','CreateTable MySymbol','JDBC','com.github.xuzw.forexroo.database.migration.V1_4__CreateTable_MySymbol',NULL,'forexroo','2017-06-16 16:39:16',100,1),
	(6,'1.5','CreateTable MyMasterTrader','JDBC','com.github.xuzw.forexroo.database.migration.V1_5__CreateTable_MyMasterTrader',NULL,'forexroo','2017-06-16 16:39:17',94,1),
	(7,'1.6','CreateTable MyBankCard','JDBC','com.github.xuzw.forexroo.database.migration.V1_6__CreateTable_MyBankCard',NULL,'forexroo','2017-06-16 16:39:18',93,1),
	(8,'1.7','CreateTable DepositAndWithdraw','JDBC','com.github.xuzw.forexroo.database.migration.V1_7__CreateTable_DepositAndWithdraw',NULL,'forexroo','2017-06-19 14:55:55',110,1),
	(9,'1.8','CreateTable Agent','JDBC','com.github.xuzw.forexroo.database.migration.V1_8__CreateTable_Agent',NULL,'forexroo','2017-06-20 11:07:49',117,1),
	(10,'1.9','CreateTable Mt4HistoryOrder','JDBC','com.github.xuzw.forexroo.database.migration.V1_9__CreateTable_Mt4HistoryOrder',NULL,'forexroo','2017-06-20 11:07:50',98,1),
	(11,'1.10','CreateTable Mt4HistoryOrderSyncLog','JDBC','com.github.xuzw.forexroo.database.migration.V1_10__CreateTable_Mt4HistoryOrderSyncLog',NULL,'forexroo','2017-06-20 11:07:50',93,1),
	(12,'1.11','CreateTable AgentDepositAndWithdraw','JDBC','com.github.xuzw.forexroo.database.migration.V1_11__CreateTable_AgentDepositAndWithdraw',NULL,'forexroo','2017-06-20 11:07:51',96,1);

/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_blacklist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_blacklist`;

CREATE TABLE `sys_blacklist` (
  `bl_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '黑名单id',
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(20) DEFAULT NULL COMMENT '用户人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`bl_id`),
  UNIQUE KEY `unq_ip` (`ip`),
  KEY `FK_Reference_13` (`create_user`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`create_user`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='黑名单表';



# Dump of table sys_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `url` varchar(100) NOT NULL COMMENT '日志路径',
  `type` varchar(100) NOT NULL COMMENT '日志类型',
  `params` varchar(1000) DEFAULT NULL COMMENT '参数',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `log_time` datetime NOT NULL COMMENT '操作时间',
  `user_ip` varchar(50) DEFAULT NULL COMMENT '操作人ip',
  PRIMARY KEY (`log_id`),
  KEY `FK_Reference_7` (`user_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;

INSERT INTO `sys_log` (`log_id`, `url`, `type`, `params`, `user_id`, `log_time`, `user_ip`)
VALUES
	(220,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=tduk ]',1,'2017-04-08 11:19:05','127.0.0.1'),
	(221,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=qx9q remember=on ]',1,'2017-04-08 11:39:32','127.0.0.1'),
	(222,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=rtwa remember=on ]',1,'2017-04-08 11:40:38','127.0.0.1'),
	(223,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',NULL,'2017-04-08 12:12:48',NULL),
	(224,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 12:12:48','127.0.0.1'),
	(225,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 12:23:52','127.0.0.1'),
	(226,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 13:18:09','127.0.0.1'),
	(227,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 13:23:16','127.0.0.1'),
	(228,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 14:19:13','127.0.0.1'),
	(229,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 14:32:33','127.0.0.1'),
	(230,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 14:34:01','127.0.0.1'),
	(231,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',NULL,'2017-04-08 14:34:02',NULL),
	(232,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',NULL,'2017-04-08 14:34:02',NULL),
	(233,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 14:34:02','127.0.0.1'),
	(234,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',NULL,'2017-04-08 20:11:45',NULL),
	(235,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 20:11:45','127.0.0.1'),
	(236,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 20:57:22','127.0.0.1'),
	(237,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 20:59:11','127.0.0.1'),
	(238,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 21:04:58','127.0.0.1'),
	(239,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 21:13:12','127.0.0.1'),
	(240,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-08 21:51:08','127.0.0.1'),
	(241,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-09 12:26:28','127.0.0.1'),
	(242,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=vh2z ]',1,'2017-04-09 12:34:02','192.168.1.102'),
	(243,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=fwkb ]',1,'2017-04-09 12:34:38','192.168.1.101'),
	(244,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=enwb ]',1,'2017-04-09 12:38:04','192.168.1.101'),
	(245,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-11 10:54:45','127.0.0.1'),
	(246,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-11 11:17:22','127.0.0.1'),
	(247,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=2ymx remember=on ]',1,'2017-04-11 11:38:14','127.0.0.1'),
	(248,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-11 11:38:32','127.0.0.1'),
	(249,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=wz6k ]',NULL,'2017-04-11 11:53:00',NULL),
	(250,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ybbp ]',1,'2017-04-11 11:53:10','127.0.0.1'),
	(251,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=4uhi remember=on ]',1,'2017-04-11 12:04:00','127.0.0.1'),
	(252,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-11 12:06:00','127.0.0.1'),
	(253,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-11 12:28:18','127.0.0.1'),
	(254,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-11 16:09:30','127.0.0.1'),
	(255,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-11 16:33:38','127.0.0.1'),
	(256,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=shqf remember=on ]',1,'2017-04-11 16:34:31','127.0.0.1'),
	(257,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=nwvd remember=on ]',1,'2017-04-11 16:36:59','127.0.0.1'),
	(258,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-12 10:06:08','127.0.0.1'),
	(259,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',NULL,'2017-04-12 11:29:28',NULL),
	(260,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-12 11:29:28','127.0.0.1'),
	(261,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-12 11:38:03','127.0.0.1'),
	(262,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=yqft ]',1,'2017-04-14 16:52:28','127.0.0.1'),
	(263,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=fuai ]',1,'2017-04-14 16:59:16','127.0.0.1'),
	(264,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=233z remember=on ]',1,'2017-04-14 16:59:27','127.0.0.1'),
	(265,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-14 17:00:03','127.0.0.1'),
	(266,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-15 15:48:39','127.0.0.1'),
	(267,'/system/login','登录','[loginName=admui_demo password=e10adc3949ba59abbe56e057f20f883e validCode=dkpf remember=on ]',NULL,'2017-04-15 16:20:35',NULL),
	(268,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=iczu ]',1,'2017-04-15 16:21:47','127.0.0.1'),
	(269,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=mde3 ]',1,'2017-04-15 16:25:11','127.0.0.1'),
	(270,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=vrnt ]',1,'2017-04-15 16:28:06','127.0.0.1'),
	(271,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=gn76 remember=on ]',1,'2017-04-15 17:05:23','127.0.0.1'),
	(272,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ybk5 remember=on ]',1,'2017-04-15 17:08:21','127.0.0.1'),
	(273,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=pfzm remember=on ]',1,'2017-04-15 17:11:39','127.0.0.1'),
	(274,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-15 17:56:32','127.0.0.1'),
	(275,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-15 18:02:15','127.0.0.1'),
	(276,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ypgi remember=on ]',1,'2017-04-15 18:06:17','127.0.0.1'),
	(277,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ekdb ]',1,'2017-04-15 18:23:37','127.0.0.1'),
	(278,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-15 18:33:26','127.0.0.1'),
	(279,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-15 18:40:42','127.0.0.1'),
	(280,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=h4hg ]',1,'2017-04-16 00:19:35','127.0.0.1'),
	(281,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=q7ef ]',1,'2017-04-16 00:41:55','127.0.0.1'),
	(282,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=gdyt ]',1,'2017-04-16 13:54:12','127.0.0.1'),
	(283,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ag2m remember=on ]',1,'2017-04-16 14:38:10','127.0.0.1'),
	(284,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-16 15:12:19','127.0.0.1'),
	(285,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-16 15:13:37','127.0.0.1'),
	(286,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-16 15:16:52','127.0.0.1'),
	(287,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-16 15:22:47','127.0.0.1'),
	(288,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-04-16 15:34:14','127.0.0.1'),
	(289,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=aspu ]',NULL,'2017-04-16 15:37:59',NULL),
	(290,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=shvu ]',1,'2017-04-16 15:38:07','127.0.0.1'),
	(291,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=b9cs ]',1,'2017-04-16 15:39:52','127.0.0.1'),
	(292,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=cywa ]',1,'2017-04-16 15:52:40','127.0.0.1'),
	(293,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ggyt ]',1,'2017-04-16 20:28:23','127.0.0.1'),
	(294,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ed5c ]',1,'2017-04-16 20:30:00','127.0.0.1'),
	(295,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=8tk8 ]',1,'2017-04-16 20:31:13','127.0.0.1'),
	(296,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=tudu remember=on ]',1,'2017-04-16 20:32:39','127.0.0.1'),
	(297,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=vb6w ]',1,'2017-04-18 22:55:15','127.0.0.1'),
	(298,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=7ptp ]',1,'2017-04-18 23:22:10','127.0.0.1'),
	(299,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=gkgn ]',1,'2017-04-25 00:48:46','127.0.0.1'),
	(300,'/system/login','登录','[password=d41d8cd98f00b204e9800998ecf8427e ]',1,'2017-04-25 01:02:10','127.0.0.1'),
	(301,'/system/login','登录','[password=d41d8cd98f00b204e9800998ecf8427e ]',1,'2017-04-25 01:03:02','127.0.0.1'),
	(302,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=mqbv remember=on ]',1,'2017-04-25 01:16:13','127.0.0.1'),
	(303,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=vcyr ]',1,'2017-06-13 13:53:00','0:0:0:0:0:0:0:1'),
	(304,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=7cdg ]',1,'2017-06-13 13:57:10','0:0:0:0:0:0:0:1'),
	(305,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=7xbw ]',1,'2017-06-13 13:59:09','0:0:0:0:0:0:0:1'),
	(306,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ag6w ]',1,'2017-06-13 14:59:03','0:0:0:0:0:0:0:1'),
	(307,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=zkck ]',1,'2017-06-13 15:58:12','0:0:0:0:0:0:0:1'),
	(308,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ttke ]',1,'2017-06-13 16:06:20','0:0:0:0:0:0:0:1'),
	(309,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ghkb ]',1,'2017-06-13 17:17:54','0:0:0:0:0:0:0:1'),
	(310,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=umvq ]',1,'2017-06-14 12:14:31','0:0:0:0:0:0:0:1'),
	(311,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=u2ah ]',1,'2017-06-14 13:05:37','0:0:0:0:0:0:0:1'),
	(312,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ncqx ]',1,'2017-06-14 14:35:11','0:0:0:0:0:0:0:1'),
	(313,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=5xgb ]',1,'2017-06-14 15:25:43','0:0:0:0:0:0:0:1'),
	(314,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=5q3h ]',1,'2017-06-14 15:51:44','0:0:0:0:0:0:0:1'),
	(315,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ad3z ]',1,'2017-06-14 16:48:03','0:0:0:0:0:0:0:1'),
	(316,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=9ghc ]',1,'2017-06-14 18:39:07','0:0:0:0:0:0:0:1'),
	(317,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=qfzf ]',1,'2017-06-14 18:41:37','0:0:0:0:0:0:0:1'),
	(318,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=vfgd ]',1,'2017-06-14 19:00:29','0:0:0:0:0:0:0:1'),
	(319,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=kkaf ]',1,'2017-06-14 19:16:41','0:0:0:0:0:0:0:1'),
	(320,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=s3gn ]',1,'2017-06-14 19:21:17','0:0:0:0:0:0:0:1'),
	(321,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=nmwv ]',1,'2017-06-15 09:28:55','0:0:0:0:0:0:0:1'),
	(322,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ussh ]',1,'2017-06-15 10:02:22','0:0:0:0:0:0:0:1'),
	(323,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=xrz7 ]',1,'2017-06-15 10:34:02','0:0:0:0:0:0:0:1'),
	(324,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=zrdw ]',1,'2017-06-15 10:44:15','0:0:0:0:0:0:0:1'),
	(325,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=3mgv ]',1,'2017-06-15 10:52:49','0:0:0:0:0:0:0:1'),
	(326,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 12:13:13','221.218.171.107'),
	(327,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=jymv ]',1,'2017-06-15 12:14:24','221.218.171.107'),
	(328,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=inz8 remember=on ]',1,'2017-06-15 12:15:05','221.218.171.107'),
	(329,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=U55F remember=on ]',1,'2017-06-15 12:15:15','117.114.192.50'),
	(330,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=6mah ]',1,'2017-06-15 12:17:27','221.218.171.107'),
	(331,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=jctv ]',1,'2017-06-15 12:23:07','0:0:0:0:0:0:0:1'),
	(332,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=EVDE ]',1,'2017-06-15 12:25:29','117.114.192.50'),
	(333,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=2W54 ]',1,'2017-06-15 12:25:53','117.114.192.50'),
	(334,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=6upr ]',1,'2017-06-15 12:27:12','0:0:0:0:0:0:0:1'),
	(335,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=e229 ]',1,'2017-06-15 12:28:45','0:0:0:0:0:0:0:1'),
	(336,'/system/login','登录','[loginName=admui password=072507e3fbb422ce93a1318a49206797 validCode=tt6m ]',NULL,'2017-06-15 12:29:22',NULL),
	(337,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=g6fz ]',1,'2017-06-15 12:29:42','117.114.192.50'),
	(338,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=kcde ]',1,'2017-06-15 12:39:41','0:0:0:0:0:0:0:1'),
	(339,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=dqcm ]',1,'2017-06-15 12:41:03','117.114.192.50'),
	(340,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=3RGv ]',1,'2017-06-15 12:41:29','117.114.192.50'),
	(341,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=2aa5 ]',1,'2017-06-15 13:31:54','0:0:0:0:0:0:0:1'),
	(342,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=shc9 ]',NULL,'2017-06-15 13:33:33',NULL),
	(343,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=dugr ]',1,'2017-06-15 13:33:57','0:0:0:0:0:0:0:1'),
	(344,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=C3XZ remember=on ]',1,'2017-06-15 13:41:03','117.114.192.50'),
	(345,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=rxd2 ]',1,'2017-06-15 14:07:26','0:0:0:0:0:0:0:1'),
	(346,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=t8x9 ]',1,'2017-06-15 14:27:18','0:0:0:0:0:0:0:1'),
	(347,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=er6q ]',1,'2017-06-15 14:40:44','221.218.171.107'),
	(348,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 14:42:07','117.114.192.50'),
	(349,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 15:43:43','221.218.171.107'),
	(350,'/system/login','登录','[]',NULL,'2017-06-15 15:58:51',NULL),
	(351,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=migr ]',NULL,'2017-06-15 15:59:10',NULL),
	(352,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ivcu ]',1,'2017-06-15 15:59:29','0:0:0:0:0:0:0:1'),
	(353,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 16:00:21','117.114.192.50'),
	(354,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=6mhc ]',1,'2017-06-15 16:17:41','0:0:0:0:0:0:0:1'),
	(355,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 16:39:36','117.114.192.50'),
	(356,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 17:00:25','221.218.171.107'),
	(357,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=qz48 ]',1,'2017-06-15 17:20:35','0:0:0:0:0:0:0:1'),
	(358,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 17:36:29','117.114.192.50'),
	(359,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=A3Y5 ]',1,'2017-06-15 18:05:11','117.114.192.50'),
	(360,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 18:27:54','221.218.171.107'),
	(361,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-15 19:28:14','117.114.192.50'),
	(362,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 11:00:42','117.114.192.50'),
	(363,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=Zr2g remember=on ]',1,'2017-06-16 11:28:00','117.114.192.50'),
	(364,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 12:18:00','117.114.192.50'),
	(365,'/system/login','登录','[]',NULL,'2017-06-16 13:01:48',NULL),
	(366,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=zhvh ]',1,'2017-06-16 13:02:02','0:0:0:0:0:0:0:1'),
	(367,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=z2xu ]',1,'2017-06-16 13:06:07','0:0:0:0:0:0:0:1'),
	(368,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=uynn ]',1,'2017-06-16 13:08:22','0:0:0:0:0:0:0:1'),
	(369,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=p3pi ]',1,'2017-06-16 13:10:38','0:0:0:0:0:0:0:1'),
	(370,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=rfny ]',1,'2017-06-16 13:13:18','0:0:0:0:0:0:0:1'),
	(371,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=f4rk ]',1,'2017-06-16 13:22:41','0:0:0:0:0:0:0:1'),
	(372,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=7fmw ]',1,'2017-06-16 13:34:06','0:0:0:0:0:0:0:1'),
	(373,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 13:37:03','117.114.192.50'),
	(374,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 14:19:55','117.114.192.50'),
	(375,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=dbab ]',1,'2017-06-16 14:24:27','0:0:0:0:0:0:0:1'),
	(376,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 15:10:50','117.114.192.50'),
	(377,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 15:24:45','117.114.192.50'),
	(378,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 16:11:37','117.114.192.50'),
	(379,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=zn8r ]',1,'2017-06-16 16:55:24','0:0:0:0:0:0:0:1'),
	(380,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=aaw5 ]',1,'2017-06-16 16:56:29','0:0:0:0:0:0:0:1'),
	(381,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 17:10:59','117.114.192.50'),
	(382,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=rcex ]',1,'2017-06-16 17:17:51','0:0:0:0:0:0:0:1'),
	(383,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=umem ]',1,'2017-06-16 17:46:05','0:0:0:0:0:0:0:1'),
	(384,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 18:12:02','117.114.192.50'),
	(385,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=pukb ]',NULL,'2017-06-16 19:46:47',NULL),
	(386,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=4tgd ]',1,'2017-06-16 19:47:00','0:0:0:0:0:0:0:1'),
	(387,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=m3t5 ]',1,'2017-06-16 19:50:21','0:0:0:0:0:0:0:1'),
	(388,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 20:08:53','117.114.192.50'),
	(389,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ztez ]',1,'2017-06-16 20:17:36','117.114.192.50'),
	(390,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=XT6W ]',1,'2017-06-16 20:33:31','117.114.192.50'),
	(391,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 20:42:17','117.114.192.50'),
	(392,'/system/login','登录','[loginName=admui password=994b3a9ba46b3caae2e1522d96bc41c2 loginType=cookie ]',1,'2017-06-16 20:56:52','221.218.171.107'),
	(393,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=CRB9 ]',1,'2017-06-16 21:19:52','117.114.192.50'),
	(394,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=CRB9 ]',1,'2017-06-16 21:21:03','117.114.192.50'),
	(395,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=AWNC ]',NULL,'2017-06-16 22:30:25',NULL),
	(396,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=wG2W ]',1,'2017-06-19 10:32:40','117.114.192.50'),
	(397,'/system/login','登录','[]',NULL,'2017-06-19 11:24:23',NULL),
	(398,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=twpz ]',1,'2017-06-19 11:24:41','0:0:0:0:0:0:0:1'),
	(399,'/system/login','登录','[]',NULL,'2017-06-19 15:34:31',NULL),
	(400,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=hght ]',1,'2017-06-19 15:34:43','0:0:0:0:0:0:0:1'),
	(401,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=duzh ]',1,'2017-06-19 15:36:03','0:0:0:0:0:0:0:1'),
	(402,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=U849 ]',1,'2017-06-19 17:14:30','222.35.203.233'),
	(403,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=S2HP ]',1,'2017-06-19 17:59:13','222.35.203.233'),
	(404,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=fhga ]',1,'2017-06-19 21:05:22','222.35.203.233'),
	(405,'/system/login','登录','[]',NULL,'2017-06-20 10:37:50',NULL),
	(406,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=pc2g ]',1,'2017-06-20 10:38:04','0:0:0:0:0:0:0:1'),
	(407,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=7d9x ]',1,'2017-06-20 10:39:26','0:0:0:0:0:0:0:1'),
	(408,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ijws ]',NULL,'2017-06-20 11:24:15',NULL),
	(409,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=azhg ]',1,'2017-06-20 11:24:29','0:0:0:0:0:0:0:1'),
	(410,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=pgsq ]',1,'2017-06-20 11:26:18','0:0:0:0:0:0:0:1'),
	(411,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=rzwt ]',1,'2017-06-20 11:35:17','0:0:0:0:0:0:0:1'),
	(412,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=e8cf ]',1,'2017-06-20 14:39:24','0:0:0:0:0:0:0:1'),
	(413,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=nrix ]',1,'2017-06-20 14:43:26','0:0:0:0:0:0:0:1'),
	(414,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=smxk ]',1,'2017-06-20 14:50:52','0:0:0:0:0:0:0:1'),
	(415,'/system/login','登录','[loginName=test password=cc03e747a6afbbcbf8be7668acfebee5 validCode=hxsy ]',2,'2017-06-20 14:51:28','0:0:0:0:0:0:0:1'),
	(416,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ufdw ]',1,'2017-06-20 14:57:46','0:0:0:0:0:0:0:1'),
	(417,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=MKPR ]',1,'2017-06-20 17:46:58','222.35.203.233'),
	(418,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=FCDS ]',1,'2017-06-20 18:19:20','222.35.203.233'),
	(419,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=MTT7 ]',1,'2017-06-21 10:40:21','117.114.192.50'),
	(420,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=W6Zn ]',1,'2017-06-21 11:04:32','117.114.192.50'),
	(421,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ppws ]',1,'2017-06-21 14:12:58','117.114.192.50'),
	(422,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=A3S ]',NULL,'2017-06-21 14:39:06',NULL),
	(423,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=bry3 ]',1,'2017-06-21 14:39:13','117.114.192.50'),
	(424,'/system/login','登录','[loginName=admui password=1b3dd282982b7fc88f03ff4f9f886a76 validCode=u9fu ]',NULL,'2017-06-22 10:57:50',NULL),
	(425,'/system/login','登录','[loginName=admui password=e10adc3949ba59abbe56e057f20f883e validCode=bfgh ]',NULL,'2017-06-22 10:58:21',NULL),
	(426,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=uxcw ]',1,'2017-06-22 11:15:46','0:0:0:0:0:0:0:1'),
	(427,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ysGW ]',1,'2017-06-22 15:00:05','117.114.192.50');

/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_log_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_log_config`;

CREATE TABLE `sys_log_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `url` varchar(100) NOT NULL COMMENT '日志路径',
  `type` varchar(100) NOT NULL COMMENT '日志类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`config_id`),
  KEY `FK_Reference_9` (`create_user`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`create_user`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志配置表';

LOCK TABLES `sys_log_config` WRITE;
/*!40000 ALTER TABLE `sys_log_config` DISABLE KEYS */;

INSERT INTO `sys_log_config` (`config_id`, `url`, `type`, `create_time`, `create_user`)
VALUES
	(1,'/system/login','登录','2016-12-03 15:29:50',1),
	(2,'/log/saveConfig','保存日志配置','2016-12-26 18:13:07',1);

/*!40000 ALTER TABLE `sys_log_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(20) NOT NULL COMMENT '菜单名',
  `parent_id` bigint(20) NOT NULL COMMENT '父菜单id',
  `layer` varchar(20) NOT NULL COMMENT '菜单层级，例如：0101010101',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(100) DEFAULT NULL COMMENT '菜单链接',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`),
  KEY `FK_Reference_1` (`create_user`),
  KEY `FK_Reference_2` (`update_user`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`create_user`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`update_user`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单表，parent_id标识父子关系，一级菜单parent_id为0，最多支持5级菜单';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`menu_id`, `name`, `parent_id`, `layer`, `icon`, `url`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'系统管理',0,'07','wb-settings','#',NULL,NULL,1,'2017-01-08 15:59:18'),
	(2,'系统信息',1,'0701','','',NULL,NULL,1,'2016-12-18 14:46:18'),
	(3,'我的账户',1,'0702','','',NULL,NULL,1,'2017-06-15 15:02:27'),
	(4,'菜单管理',2,'070101','fa-bars','/system/menu',NULL,NULL,1,'2016-12-18 14:46:18'),
	(5,'用户管理',2,'070102','fa-street-view','/system/user',NULL,NULL,1,'2017-06-20 14:43:10'),
	(6,'日志信息',2,'070103','fa-file-text-o','/system/log',NULL,NULL,1,'2017-06-20 14:43:10'),
	(7,'黑名单',2,'070104','fa-shield','/system/blacklist',NULL,NULL,1,'2017-06-20 14:43:10'),
	(8,'系统设置',2,'070105','fa-gear','',NULL,NULL,1,'2017-06-20 14:43:10'),
	(10,'显示设置',8,'07010501','','/system/settings/display',NULL,NULL,1,'2017-06-20 14:43:10'),
	(11,'日志设置',8,'07010502','','/system/settings/log',NULL,NULL,1,'2017-06-20 14:43:10'),
	(12,'账户信息',3,'070201','fa-key','/system/account',NULL,NULL,1,'2017-06-15 15:03:21'),
	(11309,'审核管理',0,'08','fa-bars',NULL,1,'2017-06-13 13:57:39',NULL,NULL),
	(11310,'审核管理',11309,'0801','','',1,'2017-06-13 13:58:46',NULL,NULL),
	(11311,'交易商开户申请审核',11310,'080101','fa-bars','/pages/audit/open-account',1,'2017-06-13 13:58:47',NULL,NULL),
	(11312,'用户管理',0,'09','fa-bars',NULL,1,'2017-06-15 16:00:06',NULL,NULL),
	(11313,'用户管理',11312,'0901','','',1,'2017-06-15 16:02:19',NULL,NULL),
	(11314,'交易商',11313,'090101','fa-child','/pages/user/dealer',1,'2017-06-15 16:02:19',1,'2017-06-15 18:39:20'),
	(11318,'订单管理',0,'10','fa-bars',NULL,1,'2017-06-16 13:12:38',NULL,NULL),
	(11319,'订单管理',11318,'1001','','',1,'2017-06-16 13:13:01',NULL,NULL),
	(11320,'订单管理',11319,'100101','fa-server','/pages/history-order',1,'2017-06-16 13:13:01',1,'2017-06-16 20:11:34'),
	(11321,'风险监控',0,'11','fa-bars',NULL,1,'2017-06-16 13:21:47',NULL,NULL),
	(11322,'风险监控',11321,'1101','','',1,'2017-06-16 13:22:19',NULL,NULL),
	(11323,'交易商监控',11322,'110101','fa-binoculars','/pages/risk/dealer',1,'2017-06-16 13:22:19',1,'2017-06-16 20:10:35'),
	(11324,'持仓监控',11322,'110102','fa-bar-chart','/pages/risk/order',1,'2017-06-16 13:29:19',1,'2017-06-16 20:10:35'),
	(11325,'经纪人申请审核',11310,'080102','fa-bars','/pages/audit/broker-request',1,'2017-06-16 14:23:46',NULL,NULL),
	(11326,'经纪人',11313,'090102','fa-bars','/pages/user/broker',1,'2017-06-16 16:56:12',NULL,NULL),
	(11327,'代理商',11313,'090103','fa-bars','/pages/user/agent',1,'2017-06-16 17:16:18',NULL,NULL),
	(11328,'交易商出金审核',11310,'080103','fa-bars','/pages/audit/dealer-withdraw',1,'2017-06-19 15:35:46',1,'2017-06-20 10:39:09'),
	(11329,'代理商出金审核',11310,'080104','fa-bars','/pages/audit/agent-withdraw',1,'2017-06-20 10:39:09',NULL,NULL),
	(11330,'返佣管理',0,'12','fa-bars',NULL,1,'2017-06-20 11:25:02',NULL,NULL),
	(11331,'返佣管理',11330,'1201','','',1,'2017-06-20 11:26:01',NULL,NULL),
	(11332,'经纪人记录',11331,'120101','fa-bars','/pages/commission/broker',1,'2017-06-20 11:26:02',NULL,NULL),
	(11333,'代理商记录',11331,'120102','fa-bars','/pages/commission/agent',1,'2017-06-20 11:36:21',NULL,NULL);

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu_role`;

CREATE TABLE `sys_menu_role` (
  `rm_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`rm_id`),
  KEY `FK_Reference_5` (`menu_id`),
  KEY `FK_Reference_6` (`role_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单的关联关系表';

LOCK TABLES `sys_menu_role` WRITE;
/*!40000 ALTER TABLE `sys_menu_role` DISABLE KEYS */;

INSERT INTO `sys_menu_role` (`rm_id`, `menu_id`, `role_id`)
VALUES
	(824,1,1),
	(825,2,1),
	(826,4,1),
	(827,5,1),
	(828,6,1),
	(829,7,1),
	(830,8,1),
	(831,10,1),
	(832,11,1),
	(834,12,1),
	(836,11309,1),
	(837,11310,1),
	(838,11311,1),
	(839,3,1),
	(840,11312,1),
	(841,11313,1),
	(842,11314,1),
	(845,11318,1),
	(846,11319,1),
	(847,11320,1),
	(848,11321,1),
	(849,11322,1),
	(850,11323,1),
	(851,11324,1),
	(852,11325,1),
	(853,11326,1),
	(854,11327,1),
	(855,11328,1),
	(856,11329,1),
	(857,11330,1),
	(858,11331,1),
	(859,11332,1),
	(860,11333,1),
	(861,1,2),
	(862,11309,2),
	(863,11310,2),
	(864,11311,2),
	(865,11325,2),
	(866,11312,2),
	(867,11313,2),
	(868,11314,2),
	(869,11326,2),
	(870,11327,2),
	(871,2,2),
	(872,3,2),
	(873,4,2),
	(874,5,2),
	(875,6,2),
	(876,7,2),
	(877,8,2),
	(878,10,2),
	(879,11,2),
	(880,12,2);

/*!40000 ALTER TABLE `sys_menu_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_message`;

CREATE TABLE `sys_message` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `type` varchar(20) NOT NULL COMMENT '消息类型',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `read_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`message_id`),
  KEY `FK_Reference_8` (`user_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息表';

LOCK TABLES `sys_message` WRITE;
/*!40000 ALTER TABLE `sys_message` DISABLE KEYS */;

INSERT INTO `sys_message` (`message_id`, `user_id`, `title`, `content`, `type`, `send_time`, `read_flag`, `read_time`)
VALUES
	(7,1,'您的账户信息已修改。','管理员修改了您的账户信息。','SYSTEM','2017-04-08 11:14:30',b'1','2017-06-15 14:43:44'),
	(8,1,'您的账户信息已修改。','管理员修改了您的账户信息。','SYSTEM','2017-04-18 22:55:54',b'1','2017-06-15 14:43:42');

/*!40000 ALTER TABLE `sys_message` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(100) NOT NULL COMMENT '角色名',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`),
  KEY `FK_Reference_11` (`create_user`),
  KEY `FK_Reference_12` (`update_user`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`create_user`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`update_user`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`role_id`, `role_name`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'系统管理员',NULL,NULL,1,'2017-04-08 11:12:41'),
	(2,'内部测试角色',1,'2017-06-20 14:48:58',NULL,NULL);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_setting_display
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_setting_display`;

CREATE TABLE `sys_setting_display` (
  `display_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '显示id',
  `navigation_color` varchar(50) DEFAULT '' COMMENT '导航条颜色',
  `across_flag` varchar(50) DEFAULT '' COMMENT '通栏显示',
  `menu_theme` varchar(50) DEFAULT '' COMMENT '菜单主题',
  `menu_display` varchar(50) DEFAULT '' COMMENT '菜单显示',
  `menu_txt_icon` varchar(50) DEFAULT '' COMMENT '收起显示图标或文字',
  `theme_color` varchar(50) DEFAULT '' COMMENT '主题颜色',
  `tab_flag` varchar(50) DEFAULT '' COMMENT 'Tab页签',
  `global_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '系统全局设置',
  `default_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '系统默认设置',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`display_id`),
  KEY `FK_Reference_15` (`user_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统显示设置表';

LOCK TABLES `sys_setting_display` WRITE;
/*!40000 ALTER TABLE `sys_setting_display` DISABLE KEYS */;

INSERT INTO `sys_setting_display` (`display_id`, `navigation_color`, `across_flag`, `menu_theme`, `menu_display`, `menu_txt_icon`, `theme_color`, `tab_flag`, `global_flag`, `default_flag`, `user_id`, `update_time`)
VALUES
	(1,'','navbar-inverse','site-menubar-dark','site-menubar-unfold','site-menubar-keep','primary','site-contabs-open',b'0',b'1',NULL,NULL),
	(2,'','navbar-inverse','site-menubar-light','site-menubar-fold','site-menubar-keep','primary','site-contabs-open',b'1',b'0',NULL,'2017-06-15 18:35:05');

/*!40000 ALTER TABLE `sys_setting_display` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `login_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `state` varchar(50) NOT NULL COMMENT '状态',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '上次登录IP',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unq_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`user_id`, `login_name`, `password`, `login_count`, `state`, `last_login_time`, `last_login_ip`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'admui','d7b775bd8d001d3d5f4b94be27905b9a',793,'NORMAL','2017-06-22 15:00:04','117.114.192.50',NULL,'2016-12-21 11:16:00',1,'2017-04-18 22:55:54'),
	(2,'test','cc03e747a6afbbcbf8be7668acfebee5',1,'NORMAL','2017-06-20 14:51:27','0:0:0:0:0:0:0:1',1,'2017-06-20 14:50:19',NULL,NULL);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `ur_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`ur_id`),
  UNIQUE KEY `unq_user_role` (`user_id`,`role_id`),
  KEY `FK_Reference_4` (`role_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色的关联关系表';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`ur_id`, `user_id`, `role_id`)
VALUES
	(64,1,1),
	(65,2,2);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `token` varchar(255) DEFAULT NULL COMMENT '用户唯一标识码',
  `is_disable` int(11) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_closing` int(11) NOT NULL DEFAULT '0' COMMENT '是否销户',
  `register_time` bigint(20) DEFAULT NULL COMMENT '注册时间戳',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `mt4_real_account` varchar(255) DEFAULT NULL COMMENT 'MT4-真实账号',
  `mt4_history_order_last_sync_time` bigint(20) DEFAULT NULL COMMENT 'MT4-历史订单-上次同步时间戳',
  `my_broker_id` bigint(20) DEFAULT NULL COMMENT '所属经纪人-ID',
  `my_broker_name` varchar(255) DEFAULT NULL COMMENT '所属经纪人-姓名',
  `my_agent_id` bigint(20) DEFAULT NULL COMMENT '所属代理商-ID',
  `my_agent_name` varchar(255) DEFAULT NULL COMMENT '所属代理商-姓名',
  `open_account_realname` varchar(255) DEFAULT NULL COMMENT '开户-姓名',
  `open_account_identity_card_number` varchar(255) DEFAULT NULL COMMENT '开户-身份证号',
  `open_account_picture_url` varchar(255) DEFAULT NULL COMMENT '开户-手持身份证正面照URL',
  `open_account_agreements` varchar(255) DEFAULT NULL COMMENT '开户-签订协议',
  `open_account_sign_url` varchar(255) DEFAULT NULL COMMENT '开户-签名图片URL',
  `open_account_status` int(11) NOT NULL DEFAULT '0' COMMENT '开户-状态',
  `open_account_audit_user_id` bigint(20) DEFAULT NULL COMMENT '开户-审核人-ID',
  `open_account_audit_user_name` varchar(255) DEFAULT NULL COMMENT '开户-审核人-姓名',
  `open_account_audit_timestamp` bigint(20) DEFAULT NULL COMMENT '开户-审核时间戳',
  `open_account_audit_fail_reason` int(11) NOT NULL DEFAULT '0' COMMENT '开户-审核失败-原因',
  `open_account_time` bigint(20) DEFAULT NULL COMMENT '开户-申请时间戳',
  `open_account_audit_success_time` bigint(20) DEFAULT NULL COMMENT '开户-审核通过时间戳',
  `broker_request_agreements` varchar(255) DEFAULT NULL COMMENT '经纪人申请-签订协议',
  `broker_request_sign_url` varchar(255) DEFAULT NULL COMMENT '经纪人申请-签名图片URL',
  `broker_request_status` int(11) NOT NULL DEFAULT '0' COMMENT '经纪人申请-状态',
  `broker_request_audit_user_id` bigint(20) DEFAULT NULL COMMENT '经纪人申请-审核人-ID',
  `broker_request_audit_user_name` varchar(255) DEFAULT NULL COMMENT '经纪人申请-审核人-姓名',
  `broker_request_audit_timestamp` bigint(20) DEFAULT NULL COMMENT '经纪人申请-审核时间戳',
  `broker_request_audit_fail_reason` int(11) NOT NULL DEFAULT '0' COMMENT '经纪人申请-审核失败-原因',
  `broker_request_time` bigint(20) DEFAULT NULL COMMENT '经纪人申请-申请时间戳',
  `broker_request_audit_success_time` bigint(20) DEFAULT NULL COMMENT '经纪人申请-审核通过时间戳',
  `master_trader_total_profit` varchar(255) DEFAULT NULL COMMENT '交易大师-总盈利',
  `master_trader_single_profit` varchar(255) DEFAULT NULL COMMENT '交易大师-均单盈利',
  `master_trader_success_rate` varchar(255) DEFAULT NULL COMMENT '交易大师-成功率',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`phone`, `password`, `token`, `is_disable`, `is_closing`, `register_time`, `avatar`, `nickname`, `sex`, `country`, `mt4_real_account`, `mt4_history_order_last_sync_time`, `my_broker_id`, `my_broker_name`, `my_agent_id`, `my_agent_name`, `open_account_realname`, `open_account_identity_card_number`, `open_account_picture_url`, `open_account_agreements`, `open_account_sign_url`, `open_account_status`, `open_account_audit_user_id`, `open_account_audit_user_name`, `open_account_audit_timestamp`, `open_account_audit_fail_reason`, `open_account_time`, `open_account_audit_success_time`, `broker_request_agreements`, `broker_request_sign_url`, `broker_request_status`, `broker_request_audit_user_id`, `broker_request_audit_user_name`, `broker_request_audit_timestamp`, `broker_request_audit_fail_reason`, `broker_request_time`, `broker_request_audit_success_time`, `master_trader_total_profit`, `master_trader_single_profit`, `master_trader_success_rate`, `id`)
VALUES
	('13550311857',NULL,'3a0d9702-82c4-4f86-8f42-884f26f64e3f',0,0,1497602693321,'bff6221117f9ede6b68e7d5abe445de6','特朗普','男','美国','996000522',NULL,NULL,NULL,NULL,NULL,'特朗普','101012196812051588','033f48dd9ffa788f9590052c51651b3f','[\"1\",\"2\",\"3\",\"4\"]','19cde2d1553527daf9cab25086fc7dd7',2,1,'admui',1497604287695,0,1497604240173,1497604287695,'[\"1\",\"2\",\"3\"]','c09d0e4e7445b42ed5cf847d7e61c43d',2,1,'admui',1498014309774,0,1497605133226,1498014309774,NULL,NULL,NULL,18000100),
	('13051165888',NULL,'a80fc127-1b6a-47d3-afbe-2719cbbe1dfa',0,0,1497608297928,'ad2b0e184b973cccf6dc977a555b6ffa','我是神仙人民','男','马里','996000523',NULL,NULL,NULL,NULL,NULL,'哦婆婆','845755 7575 7575 7575','02c55586ea18f21ebd615c488a08c25a','[\"1\",\"2\",\"3\",\"4\"]','a80fc127-1b6a-47d3-afbe-2719cbbe1dfa',2,1,'admui',1497608785430,1,1497608757362,1497608785430,'[\"1\",\"2\",\"3\"]','a80fc127-1b6a-47d3-afbe-2719cbbe1dfaapply',2,1,'admui',1497608823302,0,1497608806184,1497608823302,NULL,NULL,NULL,18000101),
	('13641122206',NULL,'78ee35e7-92d0-4898-82ed-7b75fb6e217f',0,0,1497840614619,NULL,NULL,NULL,NULL,'996000524',NULL,NULL,NULL,NULL,NULL,'的地方','222455 5665 5532 4325','b1545589317a9c8020f9724d4b08701b','[\"1\",\"2\",\"3\",\"4\"]','c1579c7c-2def-4646-9acf-72305c45d2bc',2,1,'admui',1498114823127,0,1498114726158,1498114823127,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,18000102),
	('15811003838',NULL,'a07958f5-afdb-4741-8a67-2415ada22708',0,0,1498012695334,'72f12fc586de9e6e6aee70fe8bf1cff6','袋鼠','男','阿拉伯联合酋长国',NULL,NULL,NULL,NULL,NULL,NULL,'袋鼠','455757575757575776','bff6221117f9ede6b68e7d5abe445de6','[\"1\",\"2\",\"3\",\"4\"]','1762b356176b0c7246e294b675ae572e',3,1,'admui',1498012986503,1,1498012961916,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,18000103);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
