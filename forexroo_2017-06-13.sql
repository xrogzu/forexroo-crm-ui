# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: rm-wz9g37e75ha54f140o.mysql.rds.aliyuncs.com (MySQL 5.6.34)
# Database: forexroo
# Generation Time: 2017-06-13 07:03:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table demo_employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `demo_employee`;

CREATE TABLE `demo_employee` (
  `employee_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `title` varchar(100) NOT NULL COMMENT '职位',
  `base` varchar(100) NOT NULL COMMENT '工作地点',
  `age` int(11) NOT NULL COMMENT '年龄',
  `hire_date` date NOT NULL COMMENT '入职时间',
  `salary` decimal(10,0) NOT NULL COMMENT '年薪',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='datatables员工演示数据';

LOCK TABLES `demo_employee` WRITE;
/*!40000 ALTER TABLE `demo_employee` DISABLE KEYS */;

INSERT INTO `demo_employee` (`employee_id`, `name`, `title`, `base`, `age`, `hire_date`, `salary`)
VALUES
	(1,'李霞','系统架构师','北京',61,'2011-04-25',320800),
	(2,'杜重治','会计','上海',63,'2011-07-25',170750),
	(3,'陈锋','初级开发者','深圳',66,'2009-01-12',86000),
	(4,'郑伯宁','高级JavaScript开发者','北京',22,'2012-03-29',433060),
	(5,'施华军','会计','上海',33,'2008-11-28',162700),
	(6,'吴书振','集成专家','南京',61,'2012-12-03',372000),
	(7,'张宁','销售代表','深圳',59,'2012-08-06',137500),
	(8,'马世波','集成专家','上海',55,'2010-10-14',327900),
	(9,'张章','Javascript开发者','深圳',39,'2009-09-15',205500),
	(10,'张竹影','软件工程师','北京',23,'2008-12-15',103600),
	(11,'韩庆福','办公室主管','广州',30,'2008-12-19',90560),
	(12,'刘勇','客户服务','北京',22,'2013-03-03',342000),
	(13,'张忆湫','大区经理','深圳',36,'2008-10-16',470600),
	(14,'尚志兴','高级营销设计师','广州',43,'2013-12-18',313500),
	(15,'杜若芳','大区经理','广州',19,'2010-03-17',385750),
	(16,'杨乔松','营销设计师','广州',66,'2012-11-27',198500),
	(17,'闫跃进','CEO','南京',64,'2010-06-09',725000),
	(18,'孙凯','系统管理员','南京',59,'2009-04-10',237500),
	(19,'赖祥校','软件工程师','广州',41,'2012-10-13',132000),
	(20,'郭晖','人事主管','北京',35,'2012-09-26',217500),
	(21,'贺光明','技术主管','南京',30,'2011-09-03',345000),
	(22,'邓小燕','CMO','南京',40,'2009-06-25',675000),
	(23,'白莉惠','售前支持','南京',21,'2011-12-12',106450),
	(24,'杨海霞','销售代表','成都',23,'2010-09-20',85600),
	(25,'利旭日','CEO','广州',47,'2009-10-09',1200000),
	(26,'范永胜','开发者','北京',42,'2010-12-22',92575),
	(27,'于怀斌','大区经理','苏州',28,'2010-11-14',357650),
	(28,'赵淑娜','软件工程师','深圳',28,'2011-06-07',206850),
	(29,'张淑杰','COO','深圳',48,'2010-03-11',850000),
	(30,'陈俊军','区域销售','上海',20,'2011-08-15',163000),
	(31,'郭增杰','集成专家','成都',37,'2011-06-02',95400),
	(32,'林云','开发者','广州',53,'2009-10-22',114500),
	(33,'郭述龙','技术作者','广州',27,'2011-05-07',145000),
	(34,'杨军','团队主管','深圳',22,'2008-10-26',235500),
	(35,'张海龙','售后支持','北京',46,'2011-03-09',324050),
	(36,'耿静','营销设计师','深圳',47,'2009-12-09',85675),
	(37,'刘晋荣','办公室主管','深圳',51,'2008-12-16',164500),
	(38,'孙宁','秘书','深圳',41,'2010-02-12',109850),
	(39,'邢洪锐','财务总监','深圳',62,'2009-02-14',452500),
	(40,'陈云云','办公室主管','广州',37,'2008-12-11',136200),
	(41,'张禄','主任','南京',65,'2008-09-26',645750),
	(42,'王增凤','技术支持工程师','苏州',64,'2011-02-03',234500),
	(43,'沈捷','软件工程师','广州',38,'2011-05-03',163500),
	(44,'汪化言','技术支持工程师','上海',37,'2009-08-19',139575),
	(45,'杨正机','开发者','南京',61,'2013-08-13',985400),
	(46,'戴向军','技术支持工程师','深圳',47,'2009-07-07',87500),
	(47,'王延芳','数据分析工程师','苏州',64,'2012-02-09',138575),
	(48,'沈健','软件工程师','南京',63,'2010-01-14',125250),
	(49,'刘伟峰','软件工程师','深圳',56,'2012-06-01',115000),
	(50,'陆先生','初级Javascript开发者','北京',43,'2013-02-01',75650),
	(51,'纪虹羽','销售代表','南京',46,'2011-12-06',145600),
	(52,'肖艳','大区经理','广州',47,'2011-03-21',356250),
	(53,'沈国金','系统管理员','广州',21,'2009-02-27',103500),
	(54,'王燕峰','开发者','深圳',30,'2010-07-14',86500),
	(55,'徐若琳','大区经理','北京',51,'2008-11-13',183000),
	(56,'徐成业','Javascript开发者','苏州',29,'2011-06-27',183000),
	(57,'李岸白','客户服务','南京',27,'2011-01-25',112000);

/*!40000 ALTER TABLE `demo_employee` ENABLE KEYS */;
UNLOCK TABLES;


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
  `time` bigint(20) DEFAULT NULL COMMENT '时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `deposit_and_withdraw` WRITE;
/*!40000 ALTER TABLE `deposit_and_withdraw` DISABLE KEYS */;

INSERT INTO `deposit_and_withdraw` (`raw_request`, `mt4_raw_request`, `mt4_raw_response`, `mt4_request_time`, `mt4_response_time`, `type`, `order_id`, `amount`, `comment`, `user_id`, `time`, `id`)
VALUES
	('{\"amount\":\"01\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497263032411,\"sendToEngineTimestamp\":0,\"token\":\"88ab9909-bbca-4325-bd15-ca174b1aa88f\",\"uuid\":\"662b81fe-9003-4114-87ed-3a796b61c49d\"}','{\"amount\":1.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626349,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"933ea9f6-bbb3-4ce1-9b66-5d177a72ca30\"}',1497263032421,1497263032536,1,'46626349','1.0',NULL,1,1497263032536,1),
	('{\"amount\":\"02\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497263049306,\"sendToEngineTimestamp\":0,\"token\":\"88ab9909-bbca-4325-bd15-ca174b1aa88f\",\"uuid\":\"7f69773c-c177-4e89-966d-d866b060f470\"}','{\"amount\":2.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626350,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"efe2756a-3fc0-49e4-b2da-494e7d9f5b1c\"}',1497263049314,1497263049431,1,'46626350','2.0',NULL,1,1497263049431,2),
	('{\"amount\":\"0002\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497263732556,\"sendToEngineTimestamp\":0,\"token\":\"88ab9909-bbca-4325-bd15-ca174b1aa88f\",\"uuid\":\"b643844c-2cd3-42ae-8d12-667455df3ae6\"}','{\"amount\":2.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626351,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"5f309c72-49ff-46b0-8114-d742156293ad\"}',1497263732565,1497263732675,1,'46626351','2.0',NULL,1,1497263732675,3),
	('{\"amount\":\"0000.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497320881261,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"5f50d457-a2c3-4389-8a32-eeb0be42613e\"}','{\"amount\":0.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626352,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"7356af13-dd76-4c6f-8b2d-f7f24a8edeb1\"}',1497320881269,1497320893880,1,'46626352','0.0',NULL,1,1497320893880,4),
	('{\"amount\":\"0000.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497320888947,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"c4a4eb18-6194-413e-b5e7-31cca88ac514\"}','{\"amount\":0.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626353,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"7735e824-ae7c-4a83-a226-98629511b30f\"}',1497320888955,1497320941749,1,'46626353','0.0',NULL,1,1497320941749,5),
	('{\"amount\":\"889\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497320907498,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"26fdea06-d092-4e1c-9708-d711a7e83f67\"}','{\"amount\":889.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626354,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"fba11412-5650-4cf8-b530-65570e63a741\"}',1497320907507,1497320943416,1,'46626354','889.0',NULL,1,1497320943416,6),
	('{\"amount\":\"889\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497320926916,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"60dbb93a-b437-46e3-9e79-c11a28bb8798\"}','{\"amount\":889.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626355,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"04e718b6-934c-45f3-9687-134bd9f84585\"}',1497320926926,1497320945717,1,'46626355','889.0',NULL,1,1497320945717,7),
	('{\"amount\":\"0000.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497321119522,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"2ff890cd-3170-467e-9466-f23a5b1cb8ad\"}','{\"amount\":0.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626356,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"da6aeacc-34d2-4082-9674-1e0d1a22c9ae\"}',1497321119536,1497321120798,1,'46626356','0.0',NULL,1,1497321120798,8),
	('{\"amount\":\"000.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497321272029,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"4d805060-f59c-4b6d-8ba9-ed7f9b75244b\"}','{\"amount\":0.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626357,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"1e092b3b-eff8-449e-aff6-94812204e900\"}',1497321272040,1497321283840,1,'46626357','0.0',NULL,1,1497321283840,9),
	('{\"amount\":\"500.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497321680341,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"3a5ea91b-72d2-4f15-9c04-42077dad2d38\"}','{\"amount\":500.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626358,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"156d899a-9993-460c-a1d9-fab8e9a050cf\"}',1497321680350,1497321686569,1,'46626358','500.0',NULL,1,1497321686569,10),
	('{\"amount\":\"8000\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497321706275,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"0ba06eb5-bb32-47e2-bad4-0fe747fb7f42\"}','{\"amount\":8000.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626359,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"7762f819-a9e2-4b1f-8612-05efc95a5b20\"}',1497321706283,1497321715940,1,'46626359','8000.0',NULL,1,1497321715940,11),
	('{\"amount\":\"2000.00\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497323277931,\"sendToEngineTimestamp\":0,\"token\":\"0164b441-c220-421f-bc6a-53b81765bf93\",\"uuid\":\"c5633fc8-3e25-4f2c-87bc-c79e65567c29\"}','{\"amount\":2000.0,\"operationtype\":1,\"login\":996000494}','{\"orderid\":46626360,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000494,\"reqid\":\"3942733b-6a4c-40e1-9986-ac675c3376c7\"}',1497323277941,1497323278344,1,'46626360','2000.0',NULL,1,1497323278344,12),
	('{\"amount\":\"500\",\"apiName\":\"Deposit_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497323415898,\"sendToEngineTimestamp\":0,\"token\":\"19ee4e7c-f99a-47bb-864f-0a8a6c5f47bd\",\"uuid\":\"4bc497ca-087c-4882-8e5e-30006caecf09\"}','{\"amount\":500.0,\"operationtype\":1,\"login\":996000495}','{\"orderid\":46626361,\"comment\":\"\",\"operationtype\":1,\"error\":\"\",\"login\":996000495,\"reqid\":\"b17bbde5-e825-4332-b215-37b38bce43f8\"}',1497323415906,1497323417372,1,'46626361','500.0',NULL,2,1497323417372,13),
	('{\"amount\":\"100\",\"apiName\":\"Withdraw_SubmitAmount_Api\",\"executeByEngineTimestamp\":1497327811392,\"sendToEngineTimestamp\":0,\"token\":\"8e0708cc-1e66-4f65-800f-39e01518ea8d\",\"uuid\":\"d72b4794-978d-4c5a-bda2-220cdeed7cbb\"}','{\"amount\":100.0,\"operationtype\":2,\"login\":996000495}','{\"orderid\":46626376,\"comment\":\"\",\"operationtype\":2,\"error\":\"\",\"login\":996000495,\"reqid\":\"25976777-b0ab-4427-85b9-52067060f97f\"}',1497327811400,1497327813137,2,'46626376','100.0',NULL,2,1497327813137,14);

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
	('EURUSD',1,1497261106944,1),
	('USDJPY',1,1497261106944,2),
	('AUDUSD',1,1497261106944,3),
	('XAUUSD',1,1497261106944,4),
	('UKOUSD',1,1497261106944,5),
	('EURUSD',2,1497261229159,6),
	('USDJPY',2,1497261229159,7),
	('AUDUSD',2,1497261229159,8),
	('XAUUSD',2,1497261229159,9),
	('UKOUSD',2,1497261229159,10),
	('100GBP',1,1497262209183,11);

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
	(1,'1.0','CreateTableUser','JDBC','com.github.xuzw.forexroo.database.migration.V1_0__CreateTableUser',NULL,'forexroo','2017-06-12 17:37:35',111,1),
	(2,'1.1','CreateTableMasterTraderRankingsHistory','JDBC','com.github.xuzw.forexroo.database.migration.V1_1__CreateTableMasterTraderRankingsHistory',NULL,'forexroo','2017-06-12 17:37:36',96,1),
	(3,'1.2','CreateTableFeedback','JDBC','com.github.xuzw.forexroo.database.migration.V1_2__CreateTableFeedback',NULL,'forexroo','2017-06-12 17:37:36',95,1),
	(4,'1.3','CreateTableMySymbol','JDBC','com.github.xuzw.forexroo.database.migration.V1_3__CreateTableMySymbol',NULL,'forexroo','2017-06-12 17:37:37',94,1),
	(5,'1.4','CreateTableMyMasterTrader','JDBC','com.github.xuzw.forexroo.database.migration.V1_4__CreateTableMyMasterTrader',NULL,'forexroo','2017-06-12 17:37:38',92,1),
	(6,'1.5','CreateTableMyBankCard','JDBC','com.github.xuzw.forexroo.database.migration.V1_5__CreateTableMyBankCard',NULL,'forexroo','2017-06-12 17:37:39',94,1),
	(7,'1.6','CreateTableDepositAndWithdraw','JDBC','com.github.xuzw.forexroo.database.migration.V1_6__CreateTableDepositAndWithdraw',NULL,'forexroo','2017-06-12 17:37:39',100,1);

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
	(306,'/system/login','登录','[loginName=admui password=d7b775bd8d001d3d5f4b94be27905b9a validCode=ag6w ]',1,'2017-06-13 14:59:03','0:0:0:0:0:0:0:1');

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
	(3,'我的账户',1,'0702','','',NULL,NULL,1,'2016-12-18 14:46:18'),
	(4,'菜单管理',2,'070101','fa-bars','/system/menu',NULL,NULL,1,'2016-12-18 14:46:18'),
	(5,'用户管理',2,'070102','fa-street-view','/system/user',NULL,NULL,1,'2017-03-24 11:29:23'),
	(6,'日志信息',2,'070103','fa-file-text-o','/system/log',NULL,NULL,1,'2017-03-24 11:29:23'),
	(7,'黑名单',2,'070104','fa-shield','/system/blacklist',NULL,NULL,1,'2017-03-24 11:29:23'),
	(8,'系统设置',2,'070105','fa-gear','',NULL,NULL,1,'2017-03-24 11:29:23'),
	(10,'显示设置',8,'07010501','','/system/settings/display',NULL,NULL,1,'2017-03-24 11:29:23'),
	(11,'日志设置',8,'07010502','','/system/settings/log',NULL,NULL,1,'2017-03-24 11:29:23'),
	(12,'账户信息',3,'070201','fa-key','/system/account',NULL,NULL,1,'2016-12-18 14:46:18'),
	(11309,'审核管理',0,'08','fa-bars',NULL,1,'2017-06-13 13:57:39',NULL,NULL),
	(11310,'审核管理',11309,'0801','','',1,'2017-06-13 13:58:46',NULL,NULL),
	(11311,'交易商开户申请审核',11310,'080101','fa-bars','/pages/audit/open-account',1,'2017-06-13 13:58:47',NULL,NULL);

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
	(833,3,1),
	(834,12,1),
	(836,11309,1),
	(837,11310,1),
	(838,11311,1);

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
	(7,1,'您的账户信息已修改。','管理员修改了您的账户信息。','SYSTEM','2017-04-08 11:14:30',b'0',NULL),
	(8,1,'您的账户信息已修改。','管理员修改了您的账户信息。','SYSTEM','2017-04-18 22:55:54',b'0',NULL);

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
	(1,'系统管理员',NULL,NULL,1,'2017-04-08 11:12:41');

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
	(2,'','navbar-inverse','site-menubar-dark','site-menubar-unfold','site-menubar-keep','primary','site-contabs-open',b'1',b'0',NULL,'2017-04-01 13:12:26');

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
	(1,'admui','d7b775bd8d001d3d5f4b94be27905b9a',687,'NORMAL','2017-06-13 14:59:02','0:0:0:0:0:0:0:1',NULL,'2016-12-21 11:16:00',1,'2017-04-18 22:55:54');

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
	(64,1,1);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `token` varchar(255) DEFAULT NULL COMMENT '用户唯一标识码',
  `register_time` bigint(20) DEFAULT NULL COMMENT '注册时间',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `open_account_realname` varchar(255) DEFAULT NULL COMMENT '开户-姓名',
  `open_account_identity_card_number` varchar(255) DEFAULT NULL COMMENT '开户-身份证号',
  `open_account_picture_url` varchar(255) DEFAULT NULL COMMENT '开户-手持身份证正面照URL',
  `open_account_agreements` varchar(255) DEFAULT NULL COMMENT '开户-签订协议',
  `open_account_sign_url` varchar(255) DEFAULT NULL COMMENT '开户-签名图片URL',
  `open_account_status` int(11) DEFAULT NULL COMMENT '开户-状态',
  `broker_request_agreements` varchar(255) DEFAULT NULL COMMENT '经纪人申请-签订协议',
  `broker_request_sign_url` varchar(255) DEFAULT NULL COMMENT '经纪人申请-签名图片URL',
  `broker_request_status` int(11) DEFAULT NULL COMMENT '经纪人申请-状态',
  `master_trader_total_profit` varchar(255) DEFAULT NULL COMMENT '交易大师-总盈利',
  `master_trader_single_profit` varchar(255) DEFAULT NULL COMMENT '交易大师-均单盈利',
  `master_trader_success_rate` varchar(255) DEFAULT NULL COMMENT '交易大师-成功率',
  `mt4_real_account` varchar(255) DEFAULT NULL COMMENT 'MT4-真实账号',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`phone`, `password`, `token`, `register_time`, `avatar`, `nickname`, `sex`, `country`, `open_account_realname`, `open_account_identity_card_number`, `open_account_picture_url`, `open_account_agreements`, `open_account_sign_url`, `open_account_status`, `broker_request_agreements`, `broker_request_sign_url`, `broker_request_status`, `master_trader_total_profit`, `master_trader_single_profit`, `master_trader_success_rate`, `mt4_real_account`, `id`)
VALUES
	('13550311857',NULL,'de1014b3-0bdb-4e0c-a6e2-651efccdc226',1497261106889,'2fe050a9a2a63419dce2d390e90f9530','特朗普TTis','0','阿富汗','特朗普','635848809635845866','2999b6958fa270118e1df73ca92f0ab6','[\"1\",\"2\",\"3\",\"4\"]','6fa1c6a93e1919cf05db1fe87f154e34',2,NULL,NULL,NULL,NULL,NULL,NULL,'996000494',1),
	('13641122206',NULL,'e471577f-6f03-45f4-8632-dd12fcb49479',1497261229124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'996000495',2);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
