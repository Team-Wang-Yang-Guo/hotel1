-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.13 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 hotel 的数据库结构
CREATE DATABASE IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `hotel`;

-- 导出  表 hotel.d_type 结构
CREATE TABLE IF NOT EXISTS `d_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  `ddkey` int(11) DEFAULT NULL,
  `ddvalue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  hotel.d_type 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `d_type` DISABLE KEYS */;
INSERT INTO `d_type` (`id`, `type_name`, `ddkey`, `ddvalue`) VALUES
	(1, '角色', 1, '管理员'),
	(2, '角色', 2, '前台接待员'),
	(3, '角色', 3, '收银员'),
	(4, '角色', 4, '房管员'),
	(5, '房间状态', 1, '已预订'),
	(6, '房间状态', 2, '已入住'),
	(7, '房间状态', 3, '空房'),
	(8, '房间类型', 1, '单人标准间'),
	(9, '房间类型', 2, '双人标准间'),
	(10, '房间类型', 3, '豪华双人间'),
	(11, '房间类型', 4, '豪华三人间'),
	(12, '房间类型', 5, '总统套房');
/*!40000 ALTER TABLE `d_type` ENABLE KEYS */;

-- 导出  表 hotel.t_customer 结构
CREATE TABLE IF NOT EXISTS `t_customer` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL DEFAULT '0',
  `cidcard` varchar(50) NOT NULL DEFAULT '0',
  `csex` varchar(50) NOT NULL DEFAULT '0',
  `cloc` varchar(50) DEFAULT '0',
  `cphone` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  hotel.t_customer 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;

-- 导出  表 hotel.t_live 结构
CREATE TABLE IF NOT EXISTS `t_live` (
  `lno` int(11) NOT NULL AUTO_INCREMENT,
  `cno` int(11) NOT NULL DEFAULT '0',
  `rno` int(11) NOT NULL DEFAULT '0',
  `lin` date NOT NULL,
  `lout` date NOT NULL,
  `ldeposit` int(11) NOT NULL DEFAULT '0',
  `lnet` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lno`),
  KEY `FK_live_customer` (`cno`),
  KEY `FK_live_room` (`rno`),
  CONSTRAINT `FK_live_customer` FOREIGN KEY (`cno`) REFERENCES `t_customer` (`cno`),
  CONSTRAINT `FK_live_room` FOREIGN KEY (`rno`) REFERENCES `t_room` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  hotel.t_live 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_live` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_live` ENABLE KEYS */;

-- 导出  表 hotel.t_network 结构
CREATE TABLE IF NOT EXISTS `t_network` (
  `nno` int(11) NOT NULL AUTO_INCREMENT,
  `rno` int(11) NOT NULL DEFAULT '0',
  `cno` int(11) NOT NULL DEFAULT '0',
  `opentime` date NOT NULL,
  `closetime` date NOT NULL,
  PRIMARY KEY (`nno`),
  KEY `FK_Network_room` (`rno`),
  KEY `FK_Network_customer` (`cno`),
  CONSTRAINT `FK_Network_customer` FOREIGN KEY (`cno`) REFERENCES `t_customer` (`cno`),
  CONSTRAINT `FK_Network_room` FOREIGN KEY (`rno`) REFERENCES `t_room` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  hotel.t_network 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_network` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_network` ENABLE KEYS */;

-- 导出  表 hotel.t_order 结构
CREATE TABLE IF NOT EXISTS `t_order` (
  `ono` int(11) NOT NULL AUTO_INCREMENT,
  `otime` date NOT NULL,
  `cname` varchar(50) NOT NULL DEFAULT '0',
  `rno` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ono`),
  KEY `FK_order_room` (`rno`),
  CONSTRAINT `FK_order_room` FOREIGN KEY (`rno`) REFERENCES `t_room` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  hotel.t_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;

-- 导出  表 hotel.t_role 结构
CREATE TABLE IF NOT EXISTS `t_role` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) NOT NULL DEFAULT '0',
  `rpwd` varchar(50) NOT NULL DEFAULT '0',
  `rtype` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  hotel.t_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;

-- 导出  表 hotel.t_room 结构
CREATE TABLE IF NOT EXISTS `t_room` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `rloc` varchar(50) NOT NULL DEFAULT '0',
  `rtype` varchar(50) DEFAULT '0',
  `requipment` varchar(50) DEFAULT '0',
  `rstatus` varchar(50) DEFAULT '0',
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  hotel.t_room 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_room` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
