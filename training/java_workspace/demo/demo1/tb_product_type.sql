/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : ssm190107

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-08-14 10:43:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_product_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_type`;
CREATE TABLE `tb_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_type
-- ----------------------------
INSERT INTO `tb_product_type` VALUES ('1', '熟食', '2019-04-02 10:25:29');
INSERT INTO `tb_product_type` VALUES ('2', '膨化食品', null);
INSERT INTO `tb_product_type` VALUES ('3', '蔬菜', null);
INSERT INTO `tb_product_type` VALUES ('4', '水果', null);
