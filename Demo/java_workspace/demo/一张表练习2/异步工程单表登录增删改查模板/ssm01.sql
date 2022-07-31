/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ssm01

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-08-28 17:45:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `com`
-- ----------------------------
DROP TABLE IF EXISTS `com`;
CREATE TABLE `com` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of com
-- ----------------------------
INSERT INTO `com` VALUES ('1', 'IBM');
INSERT INTO `com` VALUES ('2', '惠普');
INSERT INTO `com` VALUES ('3', '戴尔');
INSERT INTO `com` VALUES ('4', '你好');

-- ----------------------------
-- Table structure for `mem`
-- ----------------------------
DROP TABLE IF EXISTS `mem`;
CREATE TABLE `mem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mem_com` (`comid`),
  CONSTRAINT `mem_com` FOREIGN KEY (`comid`) REFERENCES `com` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mem
-- ----------------------------
INSERT INTO `mem` VALUES ('1', '张三', '1');
INSERT INTO `mem` VALUES ('2', '李四', '1');
INSERT INTO `mem` VALUES ('3', '王五', '2');
INSERT INTO `mem` VALUES ('4', '李六', '2');

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('aaa', '47BCE5C74F589F4867DBD57E9CA9F808');
INSERT INTO `t_admin` VALUES ('abc', '202CB962AC59075B964B07152D234B70');
INSERT INTO `t_admin` VALUES ('abcd', 'F3ABB86BD34CF4D52698F14C0DA1DC60');
INSERT INTO `t_admin` VALUES ('q', '7694F4A66316E53C8CDD9D9954BD611D');
INSERT INTO `t_admin` VALUES ('qqq', '202CB962AC59075B964B07152D234B70');
INSERT INTO `t_admin` VALUES ('qwe', 'B59C67BF196A4758191E42F76670CEBA');
INSERT INTO `t_admin` VALUES ('三生', '6512BD43D9CAA6E02C990B0A82652DCA');
INSERT INTO `t_admin` VALUES ('天蝎', '698D51A19D8A121CE581499D7B701668');
INSERT INTO `t_admin` VALUES ('戚薇', '111123');

-- ----------------------------
-- Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `departmentNo` varchar(20) NOT NULL COMMENT 'departmentNo',
  `departmentName` varchar(50) NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`departmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('111', '111');
INSERT INTO `t_department` VALUES ('812', '222');
INSERT INTO `t_department` VALUES ('BM001', '财务部');
INSERT INTO `t_department` VALUES ('BM002', '市场部');
INSERT INTO `t_department` VALUES ('BM003', '开发部');
INSERT INTO `t_department` VALUES ('BM004', '广告部');
INSERT INTO `t_department` VALUES ('BM006', '测试部');
INSERT INTO `t_department` VALUES ('BM007', '测试部01');
INSERT INTO `t_department` VALUES ('qwe', '部门');

-- ----------------------------
-- Table structure for `t_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `employeeNo` varchar(20) NOT NULL COMMENT 'employeeNo',
  `positionObj` int(11) NOT NULL COMMENT '职位',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `employeePhoto` varchar(60) NOT NULL COMMENT '员工照片',
  `birthday` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `schoolRecord` varchar(20) NOT NULL COMMENT '学历',
  `employeeDesc` varchar(5000) DEFAULT NULL COMMENT '员工介绍',
  PRIMARY KEY (`employeeNo`),
  KEY `positionObj` (`positionObj`),
  CONSTRAINT `t_employee_ibfk_1` FOREIGN KEY (`positionObj`) REFERENCES `t_position` (`positionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('EM001', '1', '李明翠', '女', 'upload/137ea561-c82d-4025-9c2d-f3abf5cfb3b2.jpg', '1998-10-07', '大专', '精通公司财务管理');
INSERT INTO `t_employee` VALUES ('EM002', '4', '双鱼林', '男', 'upload/802350db-0589-46aa-a117-215551565eac.jpg', '1998-10-06', '硕士', '此人很牛逼，专业搞计算机源码开发，哈哈');
INSERT INTO `t_employee` VALUES ('EM003', '2', '李明', '男', '1', '1', '1', '1');
INSERT INTO `t_employee` VALUES ('EM004', '2', '小杨', '男', 'upload/802350db-0589-46aa-a117-215551565eac.jpg', '2000-11-16', '本科', '简介  就是很厉害');

-- ----------------------------
-- Table structure for `t_position`
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `positionId` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `departmentObj` varchar(20) NOT NULL COMMENT '所属部门',
  `positionName` varchar(50) NOT NULL COMMENT '职位名称',
  `baseSalary` float NOT NULL COMMENT '基本工资',
  `sellPercent` varchar(20) NOT NULL COMMENT '销售提成',
  PRIMARY KEY (`positionId`),
  KEY `departmentObj` (`departmentObj`),
  CONSTRAINT `t_position_ibfk_1` FOREIGN KEY (`departmentObj`) REFERENCES `t_department` (`departmentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES ('1', 'BM001', '财务会计', '5600', '0');
INSERT INTO `t_position` VALUES ('2', 'BM002', '市场营销专员', '2000', '18%');
INSERT INTO `t_position` VALUES ('3', 'BM001', '项目经理', '11111', '0');
INSERT INTO `t_position` VALUES ('4', 'BM003', '技术总监', '15000', '10%');
INSERT INTO `t_position` VALUES ('5', 'BM001', '总裁1', '11111', '0');
INSERT INTO `t_position` VALUES ('7', 'BM001', '财务会计2', '5000', '50%');
INSERT INTO `t_position` VALUES ('8', 'BM001', '总裁2', '111111', '0');
INSERT INTO `t_position` VALUES ('9', 'BM001', '总裁3', '11111', '0');
INSERT INTO `t_position` VALUES ('10', 'BM001', '总裁4', '11111', '0');
INSERT INTO `t_position` VALUES ('11', 'BM001', '总裁5', '11111', '0');
INSERT INTO `t_position` VALUES ('12', 'BM001', '总裁6', '11111', '0');
INSERT INTO `t_position` VALUES ('13', '111', '111', '1', '0%');
