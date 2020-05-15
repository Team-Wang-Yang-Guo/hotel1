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

-- 导出  表 hotel.customer 结构
CREATE TABLE IF NOT EXISTS `customer` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL DEFAULT '0',
  `cidcard` varchar(50) NOT NULL DEFAULT '0',
  `csex` varchar(50) NOT NULL DEFAULT '0',
  `cloc` varchar(50) DEFAULT '0',
  `cphone` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 数据导出被取消选择。
-- 导出  表 hotel.live 结构
CREATE TABLE IF NOT EXISTS `live` (
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
  CONSTRAINT `FK_live_customer` FOREIGN KEY (`cno`) REFERENCES `customer` (`cno`),
  CONSTRAINT `FK_live_room` FOREIGN KEY (`rno`) REFERENCES `room` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 数据导出被取消选择。
-- 导出  表 hotel.network 结构
CREATE TABLE IF NOT EXISTS `network` (
  `nno` int(11) NOT NULL AUTO_INCREMENT,
  `rno` int(11) NOT NULL DEFAULT '0',
  `cno` int(11) NOT NULL DEFAULT '0',
  `opentime` date NOT NULL,
  `closetime` date NOT NULL,
  PRIMARY KEY (`nno`),
  KEY `FK_Network_room` (`rno`),
  KEY `FK_Network_customer` (`cno`),
  CONSTRAINT `FK_Network_customer` FOREIGN KEY (`cno`) REFERENCES `customer` (`cno`),
  CONSTRAINT `FK_Network_room` FOREIGN KEY (`rno`) REFERENCES `room` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 数据导出被取消选择。
-- 导出  表 hotel.order 结构
CREATE TABLE IF NOT EXISTS `order` (
  `ono` int(11) NOT NULL AUTO_INCREMENT,
  `otime` date NOT NULL,
  `cname` varchar(50) NOT NULL DEFAULT '0',
  `rno` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ono`),
  KEY `FK_order_room` (`rno`),
  CONSTRAINT `FK_order_room` FOREIGN KEY (`rno`) REFERENCES `room` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 数据导出被取消选择。
-- 导出  表 hotel.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) NOT NULL DEFAULT '0',
  `rpwd` varchar(50) NOT NULL DEFAULT '0',
  `rtype` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 数据导出被取消选择。
-- 导出  表 hotel.room 结构
CREATE TABLE IF NOT EXISTS `room` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `rloc` varchar(50) NOT NULL DEFAULT '0',
  `rtype` varchar(50) DEFAULT '0',
  `requipment` varchar(50) DEFAULT '0',
  `rstatus` varchar(50) DEFAULT '0',
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
