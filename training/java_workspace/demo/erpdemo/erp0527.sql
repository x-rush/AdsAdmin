/*
Navicat MySQL Data Transfer

Source Server         : 192.168.100.101@3306
Source Server Version : 50519
Source Host           : 192.168.100.101:3306
Source Database       : erp0527

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2019-08-15 15:58:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cd_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `cd_purchase`;
CREATE TABLE `cd_purchase` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `total` double(50,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_purchase
-- ----------------------------
INSERT INTO `cd_purchase` VALUES ('1', 'JH201906280001', '1', '2019-06-28 00:00:00', '这里是测试备注', '23');

-- ----------------------------
-- Table structure for `cd_specifications`
-- ----------------------------
DROP TABLE IF EXISTS `cd_specifications`;
CREATE TABLE `cd_specifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `num` int(30) NOT NULL,
  `price` double(30,0) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `pu_id` int(11) unsigned NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_specifications
-- ----------------------------

-- ----------------------------
-- Table structure for `order_zhaowenxin`
-- ----------------------------
DROP TABLE IF EXISTS `order_zhaowenxin`;
CREATE TABLE `order_zhaowenxin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `danjuid` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `ads` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_zhaowenxin
-- ----------------------------
INSERT INTO `order_zhaowenxin` VALUES ('1', '2019071209302202', '20', '辽宁省大连市', '张三', '18222222222', '2019-07-12 14:43:19');
INSERT INTO `order_zhaowenxin` VALUES ('2', '2019071309302503', '25', '辽宁省沈阳市', '李四', '15656565656', '2019-07-12 15:58:51');
INSERT INTO `order_zhaowenxin` VALUES ('3', '2019071517030042', '26', '辽宁省沈阳市', '%鬼', '15456452323', '2019-07-15 17:06:01');
INSERT INTO `order_zhaowenxin` VALUES ('4', '2019071517040024', '29', '河北省秦皇岛市', '小黑', '17856451252', '2019-07-15 17:06:33');
INSERT INTO `order_zhaowenxin` VALUES ('5', '2019071517050001', '32', '中国上海市', '渐渐', '15624255636', '2019-07-15 17:07:31');
INSERT INTO `order_zhaowenxin` VALUES ('6', '2019071518290057', '27', '辽宁省沈阳市', '%雪', '15896324582', '2019-07-15 18:32:13');
INSERT INTO `order_zhaowenxin` VALUES ('7', '2019071518320048', '33', '中国北京市', '#%', '18956453698', '2019-07-15 18:35:19');

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('CfScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('CfScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'GMT+08:00');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('CfScheduler', 'TASK_1', 'DEFAULT', null, 'com.cf.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A87B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363333303230363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A312C226D6574686F644E616D65223A2274657374222C22706172616D73223A2270617261222C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C22737461747573223A307D7800);
INSERT INTO `qrtz_job_details` VALUES ('CfScheduler', 'TASK_2', 'DEFAULT', null, 'com.cf.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400997B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363437323935363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A322C226D6574686F644E616D65223A227465737432222C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C22737461747573223A317D7800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', 'TASK_1', 'DEFAULT', null, 'com.erpweb.erp.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A87B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363333303230363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A312C226D6574686F644E616D65223A2274657374222C22706172616D73223A2270617261222C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C22737461747573223A307D7800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', 'TASK_2', 'DEFAULT', null, 'com.erpweb.erp.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400997B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363437323935363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A322C226D6574686F644E616D65223A227465737432222C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C22737461747573223A317D7800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('CfScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('CfScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('CfScheduler', 'XB-20190418BZQU1558056267522', '1558060069743', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('CfScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1558060200000', '1558058400000', '5', 'WAITING', 'CRON', '1506567430000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A87B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363333303230363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A312C226D6574686F644E616D65223A2274657374222C22706172616D73223A2270617261222C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C22737461747573223A307D7800);
INSERT INTO `qrtz_triggers` VALUES ('CfScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1506567600000', '-1', '5', 'PAUSED', 'CRON', '1506567430000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400997B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363437323935363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A322C226D6574686F644E616D65223A227465737432222C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C22737461747573223A317D7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerFactoryBean', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1558321200000', '-1', '5', 'WAITING', 'CRON', '1558321115000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A87B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363333303230363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A312C226D6574686F644E616D65223A2274657374222C22706172616D73223A2270617261222C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C22737461747573223A307D7800);

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2450 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '修改密码', 'com.cf.controller.SysUserController.password()', '\"\"', '127.0.0.1', '2017-09-28 10:59:06');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存角色', 'com.cf.controller.SysRoleController.save()', '{\"menuIdList\":[1,2,15],\"remark\":\"只能查看用户信息\",\"roleName\":\"普通用户\"}', '0:0:0:0:0:0:0:1', '2019-04-30 14:12:37');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存用户', 'com.cf.controller.SysUserController.save()', '{\"qq\":1800339221,\"roleIdList\":[1],\"sex\":\"男\",\"status\":1,\"username\":\"user001\"}', '0:0:0:0:0:0:0:1', '2019-04-30 14:13:07');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存用户', 'com.cf.controller.SysUserController.save()', '{\"email\":\"a189@163.com\",\"qq\":1800339221,\"roleIdList\":[1],\"sex\":\"男\",\"status\":1,\"username\":\"user001\"}', '0:0:0:0:0:0:0:1', '2019-04-30 14:13:21');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存用户', 'com.cf.controller.SysUserController.save()', '{\"email\":\"A001@163.com\",\"mobile\":\"13677778888\",\"roleIdList\":[1],\"status\":1,\"username\":\"user001\"}', '0:0:0:0:0:0:0:1', '2019-04-30 14:32:41');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存用户', 'com.cf.controller.SysUserController.save()', '{\"email\":\"A001@163.com\",\"mobile\":\"13699932211\",\"roleIdList\":[1],\"status\":1,\"username\":\"user001\"}', '0:0:0:0:0:0:0:1', '2019-04-30 14:59:46');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存用户', 'com.cf.controller.SysUserController.save()', '{\"email\":\"A001@163.com\",\"mobile\":\"13677778888\",\"roleIdList\":[1],\"status\":1,\"username\":\"user001\"}', '0:0:0:0:0:0:0:1', '2019-04-30 15:04:06');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存用户', 'com.cf.controller.SysUserController.save()', '{\"email\":\"1234@163.com\",\"mobile\":\"13567890987\",\"status\":1,\"username\":\"admintest\"}', '0:0:0:0:0:0:0:1', '2019-05-16 09:24:32');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存角色', 'com.cf.controller.SysRoleController.save()', '{\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,28],\"remark\":\"所有系统管理功能\",\"roleName\":\"超级管理员\"}', '0:0:0:0:0:0:0:1', '2019-05-16 09:35:29');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存用户', 'com.cf.controller.SysUserController.save()', '{\"email\":\"1234@163.com\",\"mobile\":\"13567890987\",\"roleIdList\":[1],\"status\":1,\"username\":\"admintest\"}', '0:0:0:0:0:0:0:1', '2019-05-16 09:36:16');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存用户', 'com.cf.controller.SysUserController.save()', '{\"email\":\"1234@163.com\",\"mobile\":\"13567890987\",\"roleIdList\":[1],\"status\":1,\"username\":\"admintest02\"}', '0:0:0:0:0:0:0:1', '2019-05-16 09:36:22');
INSERT INTO `sys_log` VALUES ('12', 'admin', '删除用户', 'com.cf.controller.SysUserController.delete()', '{}', '0:0:0:0:0:0:0:1', '2019-05-16 10:29:00');
INSERT INTO `sys_log` VALUES ('13', 'admin', '删除用户', 'com.cf.controller.SysUserController.delete()', '[15,13,12]', '0:0:0:0:0:0:0:1', '2019-05-16 10:55:32');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"进货管理\",\"orderNum\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:09:21');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"基础资料\",\"orderNum\":2,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:12:47');
INSERT INTO `sys_log` VALUES ('16', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售管理\",\"orderNum\":2,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:13:57');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售出库\",\"orderNum\":1,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-05-21 14:14:56');
INSERT INTO `sys_log` VALUES ('18', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售出库\",\"orderNum\":1,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-05-21 14:15:19');
INSERT INTO `sys_log` VALUES ('19', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售出库\",\"orderNum\":1,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":1,\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:15:32');
INSERT INTO `sys_log` VALUES ('20', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售出库\",\"orderNum\":1,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":0,\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:16:40');
INSERT INTO `sys_log` VALUES ('21', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"客户退货\",\"orderNum\":2,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:17:12');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售单据查询\",\"orderNum\":3,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:17:38');
INSERT INTO `sys_log` VALUES ('23', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"客户退货查询\",\"orderNum\":4,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:17:57');
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售管理\",\"orderNum\":1,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:18:06');
INSERT INTO `sys_log` VALUES ('25', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"当前库存查询\",\"orderNum\":5,\"parentId\":32,\"parentName\":\"销售管理\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:18:16');
INSERT INTO `sys_log` VALUES ('26', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"进货管理\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:23:12');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"客户退货信息\",\"orderNum\":1,\"parentId\":34,\"parentName\":\"客户退货\",\"perms\":\"sys:user:list\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-05-21 14:23:21');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"库存管理\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:25:42');
INSERT INTO `sys_log` VALUES ('29', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"orderNum\":1,\"parentId\":33,\"parentName\":\"销售出库\",\"perms\":\"user:list,user:save,user:update,user:delete,user:info\",\"type\":1,\"url\":\"\\tsys/user.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:26:48');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售库存\",\"orderNum\":1,\"parentId\":33,\"parentName\":\"销售出库\",\"perms\":\"user:list,user:save,user:update,user:delete,user:info\",\"type\":1,\"url\":\"\\tsys/user.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:27:01');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"客户退货信息\",\"orderNum\":1,\"parentId\":34,\"parentName\":\"客户退货\",\"perms\":\"sys:user:list\",\"type\":1,\"url\":\"sys/user.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:29:18');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"库存查询\",\"orderNum\":1,\"parentId\":40,\"parentName\":\"库存管理\",\"perms\":\"sys:goods:list\",\"type\":1,\"url\":\"url/goods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:34:13');
INSERT INTO `sys_log` VALUES ('33', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"库存查询\",\"orderNum\":1,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:goods:list\",\"type\":1,\"url\":\"sys/goods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:35:52');
INSERT INTO `sys_log` VALUES ('34', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"增加\",\"orderNum\":0,\"parentId\":42,\"parentName\":\"客户退货信息\",\"perms\":\"sys:user:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-21 14:41:47');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":42,\"parentName\":\"客户退货信息\",\"perms\":\"sys:user:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-21 14:42:22');
INSERT INTO `sys_log` VALUES ('36', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":42,\"parentName\":\"客户退货信息\",\"perms\":\"sys:user:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-21 14:42:39');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品报损\",\"orderNum\":1,\"parentId\":40,\"parentName\":\"库存管理\",\"perms\":\"sys:menu:list\",\"type\":1,\"url\":\"sys/menu.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:43:50');
INSERT INTO `sys_log` VALUES ('38', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"查询\",\"orderNum\":0,\"parentId\":42,\"parentName\":\"客户退货信息\",\"perms\":\"sys:user:info\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-21 14:43:49');
INSERT INTO `sys_log` VALUES ('39', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品报损单查询\",\"orderNum\":1,\"parentId\":40,\"parentName\":\"库存管理\",\"perms\":\"sys:goods:list\",\"type\":1,\"url\":\"url/goods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:43:52');
INSERT INTO `sys_log` VALUES ('40', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"供应商管理\",\"orderNum\":1,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:supplier:list\",\"type\":1,\"url\":\"sys/supplier.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:44:28');
INSERT INTO `sys_log` VALUES ('41', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"日志\",\"orderNum\":1,\"parentId\":40,\"parentName\":\"库存管理\",\"perms\":\"sys:goods:list\",\"type\":1,\"url\":\"url/goods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:47:36');
INSERT INTO `sys_log` VALUES ('42', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"库存管理\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 14:50:28');
INSERT INTO `sys_log` VALUES ('43', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"客户管理\",\"orderNum\":2,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:customer:list\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-05-21 14:51:03');
INSERT INTO `sys_log` VALUES ('44', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品报损单查询\",\"orderNum\":1,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:damagelist:list\",\"type\":1,\"url\":\"sys/damagelist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:55:45');
INSERT INTO `sys_log` VALUES ('45', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"客户管理\",\"orderNum\":2,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:customer:list\",\"type\":1,\"url\":\"/admin/customer/list\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:57:13');
INSERT INTO `sys_log` VALUES ('46', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品报损单商品查询\",\"orderNum\":1,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:damagelistgoods:list\",\"type\":1,\"url\":\"sys/damagelistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:57:21');
INSERT INTO `sys_log` VALUES ('47', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品类别\",\"orderNum\":2,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:goodstype:list,sys:goodstype:save,sys:goodstype:update,sys:goodstype:delete,sys:goodstype:info\",\"type\":1,\"url\":\"sys/goodstype.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:57:29');
INSERT INTO `sys_log` VALUES ('48', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"日志\",\"orderNum\":1,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:log:list\",\"type\":1,\"url\":\"sys/log.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 14:58:05');
INSERT INTO `sys_log` VALUES ('49', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"菜单\",\"orderNum\":2,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:menu:list\",\"type\":1,\"url\":\"sys/menu.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:00:55');
INSERT INTO `sys_log` VALUES ('50', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品管理\",\"orderNum\":3,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:goods:list\",\"type\":1,\"url\":\"/admin/goods/list\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:01:04');
INSERT INTO `sys_log` VALUES ('51', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"角色菜单关联\",\"orderNum\":1,\"parentId\":32,\"parentName\":\"销售管理\",\"perms\":\"user:list\",\"type\":1,\"url\":\"rolemenu.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:02:13');
INSERT INTO `sys_log` VALUES ('52', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品报溢单查询\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:02:36');
INSERT INTO `sys_log` VALUES ('53', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"期初库存\",\"orderNum\":4,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:goods:listHasInventoryQuantity\",\"type\":1,\"url\":\"/admin/goods/listHasInventoryQuantity\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:03:34');
INSERT INTO `sys_log` VALUES ('54', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品报溢单商品查询\",\"orderNum\":6,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlistgoods:list\",\"type\":1,\"url\":\"sys/overflowlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:03:45');
INSERT INTO `sys_log` VALUES ('55', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品单位\",\"orderNum\":3,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:goodsunit:list\",\"type\":1,\"url\":\"sys/goodsunit.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:35:58');
INSERT INTO `sys_log` VALUES ('56', 'admin', '删除菜单', 'com.erpweb.erp.controller.SysMenuController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-05-21 15:36:56');
INSERT INTO `sys_log` VALUES ('57', 'admin', '删除菜单', 'com.erpweb.erp.controller.SysMenuController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-05-21 15:36:56');
INSERT INTO `sys_log` VALUES ('58', 'admin', '删除菜单', 'com.erpweb.erp.controller.SysMenuController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-05-21 15:36:56');
INSERT INTO `sys_log` VALUES ('59', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售管理\",\"orderNum\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-05-21 15:40:25');
INSERT INTO `sys_log` VALUES ('60', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"进货单\",\"orderNum\":1,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:purchaseList:list\",\"type\":1,\"url\":\"sys/purchaseList.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:50:53');
INSERT INTO `sys_log` VALUES ('61', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"进货单商品\",\"orderNum\":1,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:purchaseListGoods:list\",\"type\":1,\"url\":\"sys/purchaseListGoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 15:52:15');
INSERT INTO `sys_log` VALUES ('62', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"库存查询\",\"orderNum\":5,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:goods:list\",\"type\":1,\"url\":\"sys/goods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 18:58:36');
INSERT INTO `sys_log` VALUES ('63', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-05-21 18:59:26');
INSERT INTO `sys_log` VALUES ('64', 'admin', '删除菜单', 'com.erpweb.erp.controller.SysMenuController.delete()', '[30]', '0:0:0:0:0:0:0:1', '2019-05-21 18:59:41');
INSERT INTO `sys_log` VALUES ('65', 'admin', '删除菜单', 'com.erpweb.erp.controller.SysMenuController.delete()', '[30]', '0:0:0:0:0:0:0:1', '2019-05-21 18:59:45');
INSERT INTO `sys_log` VALUES ('66', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售单\",\"orderNum\":0,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:user:list\",\"type\":1,\"url\":\"salelist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-21 19:34:50');
INSERT INTO `sys_log` VALUES ('67', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":70,\"name\":\"销售单\",\"orderNum\":1,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:SaleList:list\",\"type\":1,\"url\":\"salelist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 09:16:47');
INSERT INTO `sys_log` VALUES ('68', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":70,\"name\":\"销售单\",\"orderNum\":1,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:SaleList:list\",\"type\":1,\"url\":\"sys/salelist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 10:03:40');
INSERT INTO `sys_log` VALUES ('69', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":69,\"parentName\":\"库存查询\",\"perms\":\"sys:goods:add\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 10:08:11');
INSERT INTO `sys_log` VALUES ('70', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":69,\"parentName\":\"库存查询\",\"perms\":\"sys:goods:add\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 10:11:32');
INSERT INTO `sys_log` VALUES ('71', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":69,\"parentName\":\"库存查询\",\"perms\":\"sys:goods:add\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 10:11:43');
INSERT INTO `sys_log` VALUES ('72', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":60,\"name\":\"商品管理\",\"orderNum\":3,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:returnlist:list\",\"type\":1,\"url\":\"sys/returnlist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 10:52:43');
INSERT INTO `sys_log` VALUES ('73', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"退货客户\",\"orderNum\":2,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:customer:list\",\"type\":1,\"url\":\"sys/customer.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 11:09:22');
INSERT INTO `sys_log` VALUES ('74', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"角色管理\",\"orderNum\":5,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:userrole:list\",\"type\":1,\"url\":\"sys/userrole.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 11:11:08');
INSERT INTO `sys_log` VALUES ('75', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":60,\"name\":\"商品管理\",\"orderNum\":3,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:returnlist:list\",\"type\":1,\"url\":\"sys/returnlist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 11:14:16');
INSERT INTO `sys_log` VALUES ('76', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":54,\"name\":\"商品报损单查询\",\"orderNum\":1,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:damagelist:list\",\"type\":1,\"url\":\"sys/damagelist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 11:21:50');
INSERT INTO `sys_log` VALUES ('77', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":54,\"name\":\"商品报损单查询\",\"orderNum\":1,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:damagelist:list\",\"type\":1,\"url\":\"sys/damagelist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 11:35:56');
INSERT INTO `sys_log` VALUES ('78', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":56,\"name\":\"商品报损单商品查询\",\"orderNum\":2,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:damagelistgoods:list\",\"type\":1,\"url\":\"sys/damagelistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 11:36:07');
INSERT INTO `sys_log` VALUES ('79', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":62,\"name\":\"商品报溢单查询\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 11:46:48');
INSERT INTO `sys_log` VALUES ('80', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增加\",\"orderNum\":0,\"parentId\":70,\"parentName\":\"销售单\",\"perms\":\"sys:salelist:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 13:26:14');
INSERT INTO `sys_log` VALUES ('81', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":70,\"parentName\":\"销售单\",\"perms\":\"sys:salelist:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 13:26:30');
INSERT INTO `sys_log` VALUES ('82', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":70,\"parentName\":\"销售单\",\"perms\":\"sys:salelist:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 13:26:45');
INSERT INTO `sys_log` VALUES ('83', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"增加\",\"orderNum\":0,\"parentId\":67,\"parentName\":\"进货单\",\"perms\":\"sys:purchaselist:add\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 13:46:32');
INSERT INTO `sys_log` VALUES ('84', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"6556\",\"orderNum\":0,\"parentId\":74,\"parentName\":\"退货客户\",\"perms\":\"sys:customer:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:03:36');
INSERT INTO `sys_log` VALUES ('85', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":74,\"parentName\":\"退货客户\",\"perms\":\"sys:customer:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:06:24');
INSERT INTO `sys_log` VALUES ('86', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":69,\"parentName\":\"库存查询\",\"perms\":\"sys:goods:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:07:10');
INSERT INTO `sys_log` VALUES ('87', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":69,\"parentName\":\"库存查询\",\"perms\":\"sys:goods:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:09:44');
INSERT INTO `sys_log` VALUES ('88', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":69,\"parentName\":\"库存查询\",\"perms\":\"sys:goods:del\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:10:27');
INSERT INTO `sys_log` VALUES ('89', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":69,\"parentName\":\"库存查询\",\"perms\":\"sys:goods:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:11:11');
INSERT INTO `sys_log` VALUES ('90', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":74,\"parentName\":\"退货客户\",\"perms\":\"sys:customer:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:11:14');
INSERT INTO `sys_log` VALUES ('91', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"增加\",\"orderNum\":0,\"parentId\":67,\"parentName\":\"进货单\",\"perms\":\"sys:purchase:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:10:32');
INSERT INTO `sys_log` VALUES ('92', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":67,\"parentName\":\"进货单\",\"perms\":\"sys:purchase:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:11:31');
INSERT INTO `sys_log` VALUES ('93', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":67,\"parentName\":\"进货单\",\"perms\":\"sys:purchase:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 14:12:01');
INSERT INTO `sys_log` VALUES ('94', 'admin', '删除用户', 'com.erpweb.erp.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-05-22 14:13:58');
INSERT INTO `sys_log` VALUES ('95', 'admin', '保存用户', 'com.erpweb.erp.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-05-22 14:16:58');
INSERT INTO `sys_log` VALUES ('96', 'admin', '保存用户', 'com.erpweb.erp.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-05-22 14:17:06');
INSERT INTO `sys_log` VALUES ('97', 'admin', '保存用户', 'com.erpweb.erp.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-05-22 14:17:12');
INSERT INTO `sys_log` VALUES ('98', 'admin', '保存用户', 'com.erpweb.erp.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-05-22 14:17:15');
INSERT INTO `sys_log` VALUES ('99', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":60,\"name\":\"退货单管理\",\"orderNum\":3,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:returnlist:list\",\"type\":1,\"url\":\"sys/returnlist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 14:24:37');
INSERT INTO `sys_log` VALUES ('100', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":121,\"lastpurchasingprice\":1212.0,\"minnum\":1212,\"model\":\"X\",\"name\":\"CD\",\"producer\":\"五月天\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 14:35:26');
INSERT INTO `sys_log` VALUES ('101', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 14:32:40');
INSERT INTO `sys_log` VALUES ('102', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 14:36:43');
INSERT INTO `sys_log` VALUES ('103', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 14:39:03');
INSERT INTO `sys_log` VALUES ('104', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[2,7]', '0:0:0:0:0:0:0:1', '2019-05-22 14:42:49');
INSERT INTO `sys_log` VALUES ('105', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 14:44:19');
INSERT INTO `sys_log` VALUES ('106', 'admin', '删除菜单', 'com.erpweb.erp.controller.SysMenuController.delete()', '[63]', '0:0:0:0:0:0:0:1', '2019-05-22 14:47:58');
INSERT INTO `sys_log` VALUES ('107', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":55,\"name\":\"退货商品管理\",\"orderNum\":2,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:returnlistgoods:list\",\"type\":1,\"url\":\"sys/returnlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-22 14:49:40');
INSERT INTO `sys_log` VALUES ('108', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 14:50:46');
INSERT INTO `sys_log` VALUES ('109', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-05-22 14:56:44');
INSERT INTO `sys_log` VALUES ('110', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 14:55:18');
INSERT INTO `sys_log` VALUES ('111', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 14:55:42');
INSERT INTO `sys_log` VALUES ('112', 'admin', '删除商品库存', 'com.erpweb.erp.controller.GoodsController.delete()', '[44]', '127.0.0.1', '2019-05-22 15:05:01');
INSERT INTO `sys_log` VALUES ('113', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-05-22 15:03:45');
INSERT INTO `sys_log` VALUES ('114', 'admin', '删除商品库存', 'com.erpweb.erp.controller.GoodsController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-05-22 15:06:56');
INSERT INTO `sys_log` VALUES ('115', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-05-22 15:07:10');
INSERT INTO `sys_log` VALUES ('116', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:09:32');
INSERT INTO `sys_log` VALUES ('117', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:15:03');
INSERT INTO `sys_log` VALUES ('118', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:18:52');
INSERT INTO `sys_log` VALUES ('119', 'admin', '删除商品库存', 'com.erpweb.erp.controller.GoodsController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-05-22 15:28:06');
INSERT INTO `sys_log` VALUES ('120', 'admin', '删除商品库存', 'com.erpweb.erp.controller.GoodsController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-05-22 15:28:11');
INSERT INTO `sys_log` VALUES ('121', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-05-22 15:37:26');
INSERT INTO `sys_log` VALUES ('122', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:36:48');
INSERT INTO `sys_log` VALUES ('123', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-05-22 15:41:17');
INSERT INTO `sys_log` VALUES ('124', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[1,8]', '0:0:0:0:0:0:0:1', '2019-05-22 15:41:59');
INSERT INTO `sys_log` VALUES ('125', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:39:43');
INSERT INTO `sys_log` VALUES ('126', 'admin', '删除商品库存', 'com.erpweb.erp.controller.GoodsController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-05-22 15:44:58');
INSERT INTO `sys_log` VALUES ('127', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"添加\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:add\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:45:07');
INSERT INTO `sys_log` VALUES ('128', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":90,\"name\":\"添加\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:46:11');
INSERT INTO `sys_log` VALUES ('129', 'admin', '删除商品库存', 'com.erpweb.erp.controller.GoodsController.delete()', '[45]', '0:0:0:0:0:0:0:1', '2019-05-22 15:46:18');
INSERT INTO `sys_log` VALUES ('130', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-05-22 15:43:43');
INSERT INTO `sys_log` VALUES ('131', 'admin', '删除商品库存', 'com.erpweb.erp.controller.GoodsController.delete()', '[46]', '0:0:0:0:0:0:0:1', '2019-05-22 15:47:31');
INSERT INTO `sys_log` VALUES ('132', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-05-22 15:45:11');
INSERT INTO `sys_log` VALUES ('133', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:48:02');
INSERT INTO `sys_log` VALUES ('134', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:46:06');
INSERT INTO `sys_log` VALUES ('135', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:46:35');
INSERT INTO `sys_log` VALUES ('136', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:47:00');
INSERT INTO `sys_log` VALUES ('137', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":91,\"name\":\"修改\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:50:12');
INSERT INTO `sys_log` VALUES ('138', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:47:49');
INSERT INTO `sys_log` VALUES ('139', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":91,\"name\":\"修改\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:50:50');
INSERT INTO `sys_log` VALUES ('140', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-05-22 15:51:25');
INSERT INTO `sys_log` VALUES ('141', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-05-22 15:51:27');
INSERT INTO `sys_log` VALUES ('142', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:51:48');
INSERT INTO `sys_log` VALUES ('143', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":54,\"parentName\":\"商品报损单查询\",\"perms\":\"sys:damagelist:save\",\"type\":2,\"url\":\"sys\"}', '0:0:0:0:0:0:0:1', '2019-05-22 15:53:26');
INSERT INTO `sys_log` VALUES ('144', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":54,\"parentName\":\"商品报损单查询\",\"perms\":\"sys:damagelist:update\",\"type\":2,\"url\":\"sys\"}', '0:0:0:0:0:0:0:1', '2019-05-22 15:54:21');
INSERT INTO `sys_log` VALUES ('145', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":54,\"parentName\":\"商品报损单查询\",\"perms\":\"sys:damagelist:delete\",\"type\":2,\"url\":\"sys\"}', '0:0:0:0:0:0:0:1', '2019-05-22 15:54:55');
INSERT INTO `sys_log` VALUES ('146', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":92,\"name\":\"删除\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:del\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:55:16');
INSERT INTO `sys_log` VALUES ('147', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":92,\"name\":\"删除\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:57:18');
INSERT INTO `sys_log` VALUES ('148', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":56,\"parentName\":\"商品报损单商品查询\",\"perms\":\"sys:damagelistgoods:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:58:11');
INSERT INTO `sys_log` VALUES ('149', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":56,\"parentName\":\"商品报损单商品查询\",\"perms\":\"sys:damagelistgoods:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:58:34');
INSERT INTO `sys_log` VALUES ('150', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":56,\"parentName\":\"商品报损单商品查询\",\"perms\":\"sys:damagelistgoods:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 15:58:52');
INSERT INTO `sys_log` VALUES ('151', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:57:41');
INSERT INTO `sys_log` VALUES ('152', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-22 15:58:31');
INSERT INTO `sys_log` VALUES ('153', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[]', '0:0:0:0:0:0:0:1', '2019-05-22 15:59:12');
INSERT INTO `sys_log` VALUES ('154', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-05-22 16:02:22');
INSERT INTO `sys_log` VALUES ('155', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-05-22 16:03:04');
INSERT INTO `sys_log` VALUES ('156', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 16:05:51');
INSERT INTO `sys_log` VALUES ('157', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 16:10:49');
INSERT INTO `sys_log` VALUES ('158', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":77,\"name\":\"修改\",\"orderNum\":0,\"parentId\":70,\"parentName\":\"销售单\",\"perms\":\"sys:salelist:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 16:15:41');
INSERT INTO `sys_log` VALUES ('159', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-05-22 16:16:03');
INSERT INTO `sys_log` VALUES ('160', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 16:16:07');
INSERT INTO `sys_log` VALUES ('161', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 16:17:35');
INSERT INTO `sys_log` VALUES ('162', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 16:17:49');
INSERT INTO `sys_log` VALUES ('163', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-05-22 16:18:15');
INSERT INTO `sys_log` VALUES ('164', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":2,\"lastpurchasingprice\":2.0,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 16:19:27');
INSERT INTO `sys_log` VALUES ('165', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":2,\"lastpurchasingprice\":2.0,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 16:19:34');
INSERT INTO `sys_log` VALUES ('166', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[14]', '0:0:0:0:0:0:0:1', '2019-05-22 16:19:32');
INSERT INTO `sys_log` VALUES ('167', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"添加\",\"orderNum\":0,\"parentId\":75,\"parentName\":\"角色管理\",\"perms\":\"sys:userrole:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 16:27:58');
INSERT INTO `sys_log` VALUES ('168', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":75,\"parentName\":\"角色管理\",\"perms\":\"sys:userrole:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 16:29:16');
INSERT INTO `sys_log` VALUES ('169', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":75,\"parentName\":\"角色管理\",\"perms\":\"sys:userrole:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-22 16:29:40');
INSERT INTO `sys_log` VALUES ('170', 'admin', '删除用户', 'com.erpweb.erp.controller.UserRoleController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2019-05-22 16:35:36');
INSERT INTO `sys_log` VALUES ('171', 'admin', '删除商品库存', 'com.erpweb.erp.controller.ReturnListController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-05-22 16:48:38');
INSERT INTO `sys_log` VALUES ('172', 'admin', '删除商品库存', 'com.erpweb.erp.controller.ReturnListController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-05-22 16:49:36');
INSERT INTO `sys_log` VALUES ('173', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 16:53:42');
INSERT INTO `sys_log` VALUES ('174', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"11\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:06:40');
INSERT INTO `sys_log` VALUES ('175', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:08:34');
INSERT INTO `sys_log` VALUES ('176', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:09:10');
INSERT INTO `sys_log` VALUES ('177', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"22222\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:09:20');
INSERT INTO `sys_log` VALUES ('178', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"purchasingprice\":1.0,\"remarks\":\"1\",\"state\":2,\"unit\":\"2\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:16:00');
INSERT INTO `sys_log` VALUES ('179', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":222,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"purchasingprice\":1.0,\"remarks\":\"1\",\"state\":2,\"unit\":\"2\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:16:30');
INSERT INTO `sys_log` VALUES ('180', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":2.0,\"minnum\":3,\"model\":\"4\",\"name\":\"5\",\"producer\":\"6\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:20:49');
INSERT INTO `sys_log` VALUES ('181', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":222,\"lastpurchasingprice\":2.0,\"minnum\":3,\"model\":\"4\",\"name\":\"5\",\"producer\":\"6\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:21:13');
INSERT INTO `sys_log` VALUES ('182', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:52:45');
INSERT INTO `sys_log` VALUES ('183', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:52:54');
INSERT INTO `sys_log` VALUES ('184', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:53:08');
INSERT INTO `sys_log` VALUES ('185', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:55:42');
INSERT INTO `sys_log` VALUES ('186', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 17:57:55');
INSERT INTO `sys_log` VALUES ('187', 'admin', '删除商品库存', 'com.erpweb.erp.controller.GoodsController.delete()', '[54,55,56,57,58]', '0:0:0:0:0:0:0:1', '2019-05-22 17:58:09');
INSERT INTO `sys_log` VALUES ('188', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 18:03:18');
INSERT INTO `sys_log` VALUES ('189', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 18:07:52');
INSERT INTO `sys_log` VALUES ('190', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 18:57:07');
INSERT INTO `sys_log` VALUES ('191', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 18:57:06');
INSERT INTO `sys_log` VALUES ('192', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 19:03:11');
INSERT INTO `sys_log` VALUES ('193', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140001\",\"remarks\":\"ccc\",\"userid\":22}', '0:0:0:0:0:0:0:1', '2019-05-22 19:10:27');
INSERT INTO `sys_log` VALUES ('194', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140006\",\"remarks\":\"cccc\",\"userid\":20}', '0:0:0:0:0:0:0:1', '2019-05-22 19:11:48');
INSERT INTO `sys_log` VALUES ('195', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140006\",\"remarks\":\"cccc\",\"userid\":15}', '0:0:0:0:0:0:0:1', '2019-05-22 19:13:27');
INSERT INTO `sys_log` VALUES ('196', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 19:11:08');
INSERT INTO `sys_log` VALUES ('197', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 19:14:04');
INSERT INTO `sys_log` VALUES ('198', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140008\",\"remarks\":\"cccc\",\"userid\":22}', '0:0:0:0:0:0:0:1', '2019-05-22 19:19:49');
INSERT INTO `sys_log` VALUES ('199', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 19:17:28');
INSERT INTO `sys_log` VALUES ('200', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 19:20:22');
INSERT INTO `sys_log` VALUES ('201', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 19:21:28');
INSERT INTO `sys_log` VALUES ('202', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 19:23:35');
INSERT INTO `sys_log` VALUES ('203', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140005\",\"remarks\":\"ccc\",\"userid\":23}', '0:0:0:0:0:0:0:1', '2019-05-22 19:26:33');
INSERT INTO `sys_log` VALUES ('204', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 19:27:10');
INSERT INTO `sys_log` VALUES ('205', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-22 19:27:53');
INSERT INTO `sys_log` VALUES ('206', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"amountpaid\":0.0,\"amountpayable\":1.0,\"id\":0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 19:31:43');
INSERT INTO `sys_log` VALUES ('207', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712150005\",\"remarks\":\"ccc\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-22 19:35:06');
INSERT INTO `sys_log` VALUES ('208', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 19:36:58');
INSERT INTO `sys_log` VALUES ('209', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"amountpaid\":0.0,\"amountpayable\":1111.0,\"id\":0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 19:40:03');
INSERT INTO `sys_log` VALUES ('210', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"amountpaid\":0.0,\"amountpayable\":111.0,\"id\":0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 19:41:38');
INSERT INTO `sys_log` VALUES ('211', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"amountpaid\":0.0,\"amountpayable\":123.0,\"id\":0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 19:50:52');
INSERT INTO `sys_log` VALUES ('212', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"amountpaid\":0.0,\"amountpayable\":1.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 19:55:41');
INSERT INTO `sys_log` VALUES ('213', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":0.0,\"amountpayable\":111.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-22 19:56:38');
INSERT INTO `sys_log` VALUES ('214', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":0.0,\"amountpayable\":111.0,\"purchasenumber\":\"123\",\"remarks\":\"123\",\"state\":123,\"supplierid\":123,\"userid\":123}', '0:0:0:0:0:0:0:1', '2019-05-22 19:58:02');
INSERT INTO `sys_log` VALUES ('215', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 08:28:05');
INSERT INTO `sys_log` VALUES ('216', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140006\",\"remarks\":\"ccc\",\"userid\":10}', '0:0:0:0:0:0:0:1', '2019-05-23 08:33:07');
INSERT INTO `sys_log` VALUES ('217', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[16,17]', '0:0:0:0:0:0:0:1', '2019-05-23 08:32:41');
INSERT INTO `sys_log` VALUES ('218', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":11111.0,\"amountpayable\":11111.0,\"purchasenumber\":\"11111\",\"remarks\":\"测试\",\"state\":111,\"supplierid\":111,\"userid\":111}', '0:0:0:0:0:0:0:1', '2019-05-23 08:33:01');
INSERT INTO `sys_log` VALUES ('219', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.save()', '{\"addr\":\"大连高新园区\",\"contact\":\"小王\",\"name\":\"金辉\",\"num\":\"165196814651\",\"remarks\":\"优质客户\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 08:39:28');
INSERT INTO `sys_log` VALUES ('220', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140006\",\"remarks\":\"ccccc\",\"userid\":9}', '0:0:0:0:0:0:0:1', '2019-05-23 08:42:15');
INSERT INTO `sys_log` VALUES ('221', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"11\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 08:46:42');
INSERT INTO `sys_log` VALUES ('222', 'admin', '修改商品库存', 'com.erpweb.erp.controller.GoodsController.update()', '{\"code\":\"2\",\"id\":36,\"inventoryquantity\":2,\"lastpurchasingprice\":2.0,\"minnum\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 08:47:12');
INSERT INTO `sys_log` VALUES ('223', 'admin', '保存商品库存', 'com.erpweb.erp.controller.ReturnListController.save()', '{\"amountpayable\":11.0,\"remarks\":\"1\",\"returnnumber\":\"11\",\"supplierid\":11,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 08:48:49');
INSERT INTO `sys_log` VALUES ('224', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"id\":12,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 08:50:23');
INSERT INTO `sys_log` VALUES ('225', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpayable\":1.0,\"id\":11,\"remarks\":\"1\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 08:50:35');
INSERT INTO `sys_log` VALUES ('226', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"id\":11,\"remarks\":\"1\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 08:50:44');
INSERT INTO `sys_log` VALUES ('227', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"id\":11,\"remarks\":\"1\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 08:51:00');
INSERT INTO `sys_log` VALUES ('228', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":11,\"remarks\":\"1\",\"salenum\":\"1\",\"state\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 08:51:19');
INSERT INTO `sys_log` VALUES ('229', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"id\":10,\"remarks\":\"1\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 08:53:04');
INSERT INTO `sys_log` VALUES ('230', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"1112\",\"remarks\":\"cc\"}', '0:0:0:0:0:0:0:1', '2019-05-23 08:53:43');
INSERT INTO `sys_log` VALUES ('231', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"1112\",\"remarks\":\"cc\",\"userid\":111}', '0:0:0:0:0:0:0:1', '2019-05-23 08:53:48');
INSERT INTO `sys_log` VALUES ('232', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"1112\",\"remarks\":\"cc\",\"userid\":111}', '0:0:0:0:0:0:0:1', '2019-05-23 08:53:59');
INSERT INTO `sys_log` VALUES ('233', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140008\",\"remarks\":\"ccccc\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-23 08:54:49');
INSERT INTO `sys_log` VALUES ('234', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140008\",\"remarks\":\"cc\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-23 08:55:03');
INSERT INTO `sys_log` VALUES ('235', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140008\",\"remarks\":\"cc\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-23 08:56:01');
INSERT INTO `sys_log` VALUES ('236', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140009\",\"remarks\":\"c\",\"userid\":9}', '0:0:0:0:0:0:0:1', '2019-05-23 09:02:41');
INSERT INTO `sys_log` VALUES ('237', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[12]', '0:0:0:0:0:0:0:1', '2019-05-23 09:07:43');
INSERT INTO `sys_log` VALUES ('238', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 09:08:10');
INSERT INTO `sys_log` VALUES ('239', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 09:08:16');
INSERT INTO `sys_log` VALUES ('240', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 09:08:20');
INSERT INTO `sys_log` VALUES ('241', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 09:08:25');
INSERT INTO `sys_log` VALUES ('242', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"2\"', '0:0:0:0:0:0:0:1', '2019-05-23 10:16:10');
INSERT INTO `sys_log` VALUES ('243', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"5\"', '0:0:0:0:0:0:0:1', '2019-05-23 10:16:19');
INSERT INTO `sys_log` VALUES ('244', 'admin', '修改用户', 'com.erpweb.erp.controller.CustomerController.update()', '{\"addr\":\"大连高新园区\",\"addtime\":1558572019000,\"contact\":\"小王\",\"id\":5,\"name\":\"锦辉高新店\",\"num\":\"165196814651\",\"remarks\":\"优质客户\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 10:16:30');
INSERT INTO `sys_log` VALUES ('245', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"amountpaid\":11111.0,\"amountpayable\":222.0,\"id\":18,\"purchasenumber\":\"11111\",\"remarks\":\"测试\",\"state\":111,\"supplierid\":111,\"userid\":111}', '0:0:0:0:0:0:0:1', '2019-05-23 10:16:15');
INSERT INTO `sys_log` VALUES ('246', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 10:19:39');
INSERT INTO `sys_log` VALUES ('247', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":11,\"remarks\":\"1\",\"salenum\":\"1\",\"state\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 10:37:37');
INSERT INTO `sys_log` VALUES ('248', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140009\",\"remarks\":\"cc\",\"userid\":10}', '0:0:0:0:0:0:0:1', '2019-05-23 10:57:23');
INSERT INTO `sys_log` VALUES ('249', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140009\",\"remarks\":\"cc\",\"userid\":10}', '0:0:0:0:0:0:0:1', '2019-05-23 10:57:51');
INSERT INTO `sys_log` VALUES ('250', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"5\"', '0:0:0:0:0:0:0:1', '2019-05-23 10:59:01');
INSERT INTO `sys_log` VALUES ('251', 'admin', '修改商品库存', 'com.erpweb.erp.controller.ReturnListController.update()', '{\"amountpayable\":11.0,\"id\":4,\"remarks\":\"1\",\"returnnumber\":\"11\",\"supplierid\":22222,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 11:19:20');
INSERT INTO `sys_log` VALUES ('252', 'admin', '保存商品库存', 'com.erpweb.erp.controller.ReturnListController.save()', '{\"amountpayable\":2.0,\"remarks\":\"2\",\"returnnumber\":\"222\",\"supplierid\":22,\"userid\":22}', '0:0:0:0:0:0:0:1', '2019-05-23 11:20:05');
INSERT INTO `sys_log` VALUES ('253', 'admin', '修改商品库存', 'com.erpweb.erp.controller.ReturnListController.update()', '{\"amountpayable\":2.0,\"id\":5,\"remarks\":\"2\",\"returnnumber\":\"222\",\"supplierid\":22,\"userid\":22333}', '0:0:0:0:0:0:0:1', '2019-05-23 11:20:12');
INSERT INTO `sys_log` VALUES ('254', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140002\",\"remarks\":\"c\",\"userid\":6}', '0:0:0:0:0:0:0:1', '2019-05-23 11:22:52');
INSERT INTO `sys_log` VALUES ('255', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140002\",\"remarks\":\"c\",\"userid\":6}', '0:0:0:0:0:0:0:1', '2019-05-23 11:23:08');
INSERT INTO `sys_log` VALUES ('256', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"amountpaid\":1.2312312E8,\"amountpayable\":222.0,\"id\":18,\"purchasenumber\":\"11111\",\"remarks\":\"测试\",\"state\":111,\"supplierid\":111,\"userid\":111}', '0:0:0:0:0:0:0:1', '2019-05-23 11:21:06');
INSERT INTO `sys_log` VALUES ('257', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140006\",\"remarks\":\"cc\",\"userid\":20}', '0:0:0:0:0:0:0:1', '2019-05-23 11:24:51');
INSERT INTO `sys_log` VALUES ('258', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140006\",\"remarks\":\"cc\",\"userid\":20}', '0:0:0:0:0:0:0:1', '2019-05-23 11:25:00');
INSERT INTO `sys_log` VALUES ('259', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140005\",\"remarks\":\"cc\",\"userid\":23}', '0:0:0:0:0:0:0:1', '2019-05-23 11:30:18');
INSERT INTO `sys_log` VALUES ('260', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-23 11:32:03');
INSERT INTO `sys_log` VALUES ('261', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"详情\",\"orderNum\":0,\"parentId\":70,\"parentName\":\"销售单\",\"perms\":\"sys:salelist:detal\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 13:53:23');
INSERT INTO `sys_log` VALUES ('262', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"1\",\"name\":\"\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 13:58:41');
INSERT INTO `sys_log` VALUES ('263', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"6\"', '0:0:0:0:0:0:0:1', '2019-05-23 13:58:50');
INSERT INTO `sys_log` VALUES ('264', 'admin', '修改用户', 'com.erpweb.erp.controller.CustomerController.update()', '{\"addr\":\"小白是二傻\",\"addtime\":1558591169000,\"contact\":\"对呀\",\"id\":6,\"name\":\"\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 13:59:04');
INSERT INTO `sys_log` VALUES ('265', 'admin', '修改商品库存', 'com.erpweb.erp.controller.ReturnListController.update()', '{\"amountpayable\":2.0,\"id\":5,\"remarks\":\"2\",\"returnnumber\":\"1111111\",\"supplierid\":22,\"userid\":22}', '0:0:0:0:0:0:0:1', '2019-05-23 13:59:03');
INSERT INTO `sys_log` VALUES ('266', 'admin', '保存用户', 'com.erpweb.erp.controller.UserRoleController.save()', '{\"roleid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 14:02:21');
INSERT INTO `sys_log` VALUES ('267', 'admin', '保存用户', 'com.erpweb.erp.controller.UserRoleController.save()', '{\"roleid\":2,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 14:03:43');
INSERT INTO `sys_log` VALUES ('268', 'admin', '修改商品库存', 'com.erpweb.erp.controller.ReturnListController.update()', '{\"amountpayable\":2.0,\"id\":5,\"remarks\":\"123123123123\",\"returnnumber\":\"222\",\"supplierid\":22,\"userid\":22}', '0:0:0:0:0:0:0:1', '2019-05-23 14:06:48');
INSERT INTO `sys_log` VALUES ('269', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-05-23 14:08:53');
INSERT INTO `sys_log` VALUES ('270', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":21,\"name\":\"修改\",\"orderNum\":0,\"parentId\":3,\"parentName\":\"角色管理\",\"perms\":\"sys:role:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 14:09:45');
INSERT INTO `sys_log` VALUES ('271', 'admin', '修改用户', 'com.erpweb.erp.controller.UserRoleController.update()', '{\"addtime\":1558591474000,\"id\":55,\"roleid\":23333,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 14:15:17');
INSERT INTO `sys_log` VALUES ('272', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":1233333}', '0:0:0:0:0:0:0:1', '2019-05-23 14:27:10');
INSERT INTO `sys_log` VALUES ('273', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":1233333}', '0:0:0:0:0:0:0:1', '2019-05-23 14:31:58');
INSERT INTO `sys_log` VALUES ('274', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-23 14:37:16');
INSERT INTO `sys_log` VALUES ('275', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":122}', '0:0:0:0:0:0:0:1', '2019-05-23 14:37:38');
INSERT INTO `sys_log` VALUES ('276', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"a\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-23 14:39:31');
INSERT INTO `sys_log` VALUES ('277', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":5555}', '0:0:0:0:0:0:0:1', '2019-05-23 14:41:52');
INSERT INTO `sys_log` VALUES ('278', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":123}', '0:0:0:0:0:0:0:1', '2019-05-23 14:43:02');
INSERT INTO `sys_log` VALUES ('279', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-23 14:43:43');
INSERT INTO `sys_log` VALUES ('280', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 14:43:50');
INSERT INTO `sys_log` VALUES ('281', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 14:45:32');
INSERT INTO `sys_log` VALUES ('282', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558582373000,\"id\":9,\"overflowdate\":1558582373000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cccccc\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 14:49:04');
INSERT INTO `sys_log` VALUES ('283', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:08:53');
INSERT INTO `sys_log` VALUES ('284', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":11.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":11,\"remarks\":\"1\",\"salenum\":\"1\",\"state\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 15:09:04');
INSERT INTO `sys_log` VALUES ('285', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":11,\"remarks\":\"1\",\"salenum\":\"1\",\"state\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 15:09:10');
INSERT INTO `sys_log` VALUES ('286', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:09:19');
INSERT INTO `sys_log` VALUES ('287', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-05-23 15:09:27');
INSERT INTO `sys_log` VALUES ('288', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"1\",\"salenum\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:09:32');
INSERT INTO `sys_log` VALUES ('289', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:19');
INSERT INTO `sys_log` VALUES ('290', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140009\",\"remarks\":\"20\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:28');
INSERT INTO `sys_log` VALUES ('291', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:11:52');
INSERT INTO `sys_log` VALUES ('292', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:55');
INSERT INTO `sys_log` VALUES ('293', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:55');
INSERT INTO `sys_log` VALUES ('294', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:55');
INSERT INTO `sys_log` VALUES ('295', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:55');
INSERT INTO `sys_log` VALUES ('296', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:55');
INSERT INTO `sys_log` VALUES ('297', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:55');
INSERT INTO `sys_log` VALUES ('298', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:56');
INSERT INTO `sys_log` VALUES ('299', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:56');
INSERT INTO `sys_log` VALUES ('300', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:56');
INSERT INTO `sys_log` VALUES ('301', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:56');
INSERT INTO `sys_log` VALUES ('302', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:56');
INSERT INTO `sys_log` VALUES ('303', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":11.0,\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:10:56');
INSERT INTO `sys_log` VALUES ('304', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[23,24,25,26,27,28,29,30]', '0:0:0:0:0:0:0:1', '2019-05-23 15:11:23');
INSERT INTO `sys_log` VALUES ('305', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[23,24,25,26,27,28,29,30]', '0:0:0:0:0:0:0:1', '2019-05-23 15:11:23');
INSERT INTO `sys_log` VALUES ('306', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:14:13');
INSERT INTO `sys_log` VALUES ('307', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:17:35');
INSERT INTO `sys_log` VALUES ('308', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:19:02');
INSERT INTO `sys_log` VALUES ('309', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:22:57');
INSERT INTO `sys_log` VALUES ('310', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:23:14');
INSERT INTO `sys_log` VALUES ('311', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"查看详情\",\"orderNum\":0,\"parentId\":69,\"parentName\":\"库存查询\",\"perms\":\"sys:goods:detail\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 15:24:27');
INSERT INTO `sys_log` VALUES ('312', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:27:35');
INSERT INTO `sys_log` VALUES ('313', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:29:47');
INSERT INTO `sys_log` VALUES ('314', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:31:01');
INSERT INTO `sys_log` VALUES ('315', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-05-23 15:39:08');
INSERT INTO `sys_log` VALUES ('316', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"111\",\"inventoryquantity\":11,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 15:44:55');
INSERT INTO `sys_log` VALUES ('317', 'admin', '修改商品库存', 'com.erpweb.erp.controller.GoodsController.update()', '{\"addtime\":1558597543000,\"code\":\"111\",\"id\":37,\"inventoryquantity\":11,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 16:00:19');
INSERT INTO `sys_log` VALUES ('318', 'admin', '修改商品库存', 'com.erpweb.erp.controller.GoodsController.update()', '{\"addtime\":1558597543000,\"code\":\"111\",\"id\":37,\"inventoryquantity\":11,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 16:01:15');
INSERT INTO `sys_log` VALUES ('319', 'admin', '修改商品库存', 'com.erpweb.erp.controller.GoodsController.update()', '{\"addtime\":1558597543000,\"code\":\"111\",\"id\":37,\"inventoryquantity\":11,\"lastpurchasingprice\":555.0,\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 16:01:39');
INSERT INTO `sys_log` VALUES ('320', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"1\",\"goodsid\":\"1\",\"model\":\"\",\"name\":\"\",\"num\":\"\",\"total\":\"\",\"unit\":\"\",\"userid\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 16:24:57');
INSERT INTO `sys_log` VALUES ('321', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"1\",\"goodsid\":\"1\",\"model\":\"\",\"name\":\"\",\"num\":\"\",\"total\":\"\",\"unit\":\"\",\"userid\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 16:25:01');
INSERT INTO `sys_log` VALUES ('322', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"1\",\"goodsid\":\"1\",\"model\":\"\",\"name\":\"\",\"num\":\"\",\"total\":\"\",\"unit\":\"\",\"userid\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-23 16:25:27');
INSERT INTO `sys_log` VALUES ('323', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558595477000,\"id\":10,\"overflowdate\":1558595477000,\"overflownumber\":\"BY201712140009\",\"remarks\":\"20\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-23 16:27:34');
INSERT INTO `sys_log` VALUES ('324', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY201712140001\",\"remarks\":\"cc\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 16:29:31');
INSERT INTO `sys_log` VALUES ('325', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558600220000,\"id\":11,\"overflowdate\":1558600220000,\"overflownumber\":\"BY201712140001\",\"remarks\":\"cc\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 16:29:57');
INSERT INTO `sys_log` VALUES ('326', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"123\",\"damagelistid\":\"123\",\"goodsid\":\"123\",\"model\":\"123\",\"name\":\"123\",\"num\":\"123\",\"price\":\"123\",\"total\":\"123\",\"typeid\":\"123\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-23 16:30:42');
INSERT INTO `sys_log` VALUES ('327', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558600220000,\"id\":11,\"overflowdate\":1558600220000,\"overflownumber\":\"BY201712140001\",\"remarks\":\"cc\",\"userid\":9}', '0:0:0:0:0:0:0:1', '2019-05-23 16:37:26');
INSERT INTO `sys_log` VALUES ('328', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"2421\",\"damagelistid\":\"3213213\",\"goodsid\":\"1421121\",\"model\":\"12321\",\"name\":\"1321321\",\"num\":\"123213\",\"price\":\"2123213213\",\"total\":\"21321321\",\"typeid\":\"213213\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-23 16:42:04');
INSERT INTO `sys_log` VALUES ('329', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-23 16:56:39');
INSERT INTO `sys_log` VALUES ('330', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerController.delete()', '[5]', '127.0.0.1', '2019-05-23 16:57:15');
INSERT INTO `sys_log` VALUES ('331', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-23 16:57:27');
INSERT INTO `sys_log` VALUES ('332', 'admin', '保存用户', 'com.erpweb.erp.controller.UserRoleController.save()', '{\"roleid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 17:02:48');
INSERT INTO `sys_log` VALUES ('333', 'admin', '修改用户', 'com.erpweb.erp.controller.UserRoleController.update()', '{\"addtime\":1558602218000,\"id\":56,\"roleid\":1,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 17:03:21');
INSERT INTO `sys_log` VALUES ('334', 'admin', '删除用户', 'com.erpweb.erp.controller.UserRoleController.delete()', '[56]', '0:0:0:0:0:0:0:1', '2019-05-23 17:03:42');
INSERT INTO `sys_log` VALUES ('335', 'admin', '修改用户', 'com.erpweb.erp.controller.UserRoleController.update()', '{\"addtime\":1558591474000,\"id\":55,\"roleid\":7,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 17:05:00');
INSERT INTO `sys_log` VALUES ('336', 'admin', '保存用户', 'com.erpweb.erp.controller.UserRoleController.save()', '{\"roleid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 17:09:47');
INSERT INTO `sys_log` VALUES ('337', 'admin', '修改用户', 'com.erpweb.erp.controller.UserRoleController.update()', '{\"addtime\":1558602637000,\"id\":57,\"roleid\":1,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 17:10:01');
INSERT INTO `sys_log` VALUES ('338', 'admin', '修改用户', 'com.erpweb.erp.controller.UserRoleController.update()', '{\"addtime\":1558602637000,\"id\":57,\"roleid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 17:10:15');
INSERT INTO `sys_log` VALUES ('339', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-23 17:18:45');
INSERT INTO `sys_log` VALUES ('340', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.save()', '{\"addr\":\"大连万达\",\"contact\":\"下例子\",\"name\":\"金辉高新店\",\"num\":\"132\",\"remarks\":\"优质客户\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 17:21:02');
INSERT INTO `sys_log` VALUES ('341', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"7\"', '0:0:0:0:0:0:0:1', '2019-05-23 17:21:12');
INSERT INTO `sys_log` VALUES ('342', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-05-23 17:21:29');
INSERT INTO `sys_log` VALUES ('343', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-23 17:21:45');
INSERT INTO `sys_log` VALUES ('344', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-23 17:21:54');
INSERT INTO `sys_log` VALUES ('345', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2019-05-23 17:22:02');
INSERT INTO `sys_log` VALUES ('346', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"3213\",\"damagelistid\":\"123\",\"goodsid\":\"21313\",\"model\":\"盒\",\"name\":\"仙女棒\",\"num\":\"23\",\"price\":\"23\",\"total\":\"34\",\"typeid\":\"1\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-23 17:22:41');
INSERT INTO `sys_log` VALUES ('347', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"13213\",\"damagelistid\":\"3213\",\"goodsid\":\"123213213\",\"model\":\"213123213\",\"name\":\"21321321\",\"num\":\"3213\",\"price\":\"213213\",\"total\":\"21\",\"typeid\":\"321\",\"unit\":\"\",\"userid\":\"13\"}', '0:0:0:0:0:0:0:1', '2019-05-23 17:23:47');
INSERT INTO `sys_log` VALUES ('348', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"132\",\"damagelistid\":\"21321\",\"goodsid\":\"123\",\"model\":\"213\",\"name\":\"321\",\"num\":\"2132\",\"price\":\"13213\",\"total\":\"213\",\"typeid\":\"13213\",\"unit\":\"\",\"userid\":\"312321\"}', '0:0:0:0:0:0:0:1', '2019-05-23 17:28:19');
INSERT INTO `sys_log` VALUES ('349', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"213\",\"damagelistid\":\"2131\",\"goodsid\":\"123\",\"model\":\"21\",\"name\":\"3\",\"num\":\"213\",\"price\":\"123\",\"total\":\"213\",\"typeid\":\"132\",\"unit\":\"\",\"userid\":\"3\"}', '0:0:0:0:0:0:0:1', '2019-05-23 17:32:42');
INSERT INTO `sys_log` VALUES ('350', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"12321\",\"damagelistid\":\"3\",\"goodsid\":\"21312\",\"model\":\"3213213\",\"name\":\"3213\",\"num\":\"313\",\"price\":\"13221\",\"total\":\"1321321\",\"typeid\":\"312\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-23 17:32:55');
INSERT INTO `sys_log` VALUES ('351', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-23 17:33:34');
INSERT INTO `sys_log` VALUES ('352', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-23 17:33:42');
INSERT INTO `sys_log` VALUES ('353', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"1\"', '0:0:0:0:0:0:0:1', '2019-05-23 17:35:27');
INSERT INTO `sys_log` VALUES ('354', 'admin', '修改用户', 'com.erpweb.erp.controller.CustomerController.update()', '{\"addr\":\"福州新弯曲5号\",\"addtime\":1558334044000,\"contact\":\"小李子\",\"id\":1,\"name\":\"福州艾玛超市\",\"num\":\"2132-23213421\",\"remarks\":\"\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 17:35:31');
INSERT INTO `sys_log` VALUES ('355', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"2\",\"damagelistid\":\"2\",\"goodsid\":\"2\",\"model\":\"2\",\"name\":\"2\",\"num\":\"2\",\"price\":\"2\",\"total\":\"22\",\"typeid\":\"1\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-23 18:36:48');
INSERT INTO `sys_log` VALUES ('356', 'admin', '修改商品库存', 'com.erpweb.erp.controller.ReturnListController.update()', '{\"amountpayable\":2.0,\"id\":5,\"remarks\":\"12312312312312212\",\"returnnumber\":\"222\",\"supplierid\":22,\"userid\":22}', '0:0:0:0:0:0:0:1', '2019-05-23 18:43:09');
INSERT INTO `sys_log` VALUES ('357', 'admin', '删除商品库存', 'com.erpweb.erp.controller.ReturnListController.delete()', '[4,5]', '0:0:0:0:0:0:0:1', '2019-05-23 18:43:21');
INSERT INTO `sys_log` VALUES ('358', 'admin', '保存商品库存', 'com.erpweb.erp.controller.ReturnListController.save()', '{\"amountpayable\":21.0,\"remarks\":\"1212\",\"returnnumber\":\"1212\",\"supplierid\":212,\"userid\":212}', '0:0:0:0:0:0:0:1', '2019-05-23 18:43:30');
INSERT INTO `sys_log` VALUES ('359', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[18,19,20,21,22]', '0:0:0:0:0:0:0:1', '2019-05-23 19:16:08');
INSERT INTO `sys_log` VALUES ('360', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":0.0,\"amountpayable\":1.0,\"purchasenumber\":\"1\",\"remarks\":\"\",\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:20:15');
INSERT INTO `sys_log` VALUES ('361', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":0.0,\"amountpayable\":1.0,\"purchasenumber\":\"1\",\"remarks\":\"\",\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:20:21');
INSERT INTO `sys_log` VALUES ('362', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":0.0,\"amountpayable\":1.0,\"purchasenumber\":\"\",\"remarks\":\"\",\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:20:28');
INSERT INTO `sys_log` VALUES ('363', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":0.0,\"amountpayable\":1.0,\"purchasenumber\":\"\",\"remarks\":\"\",\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:20:38');
INSERT INTO `sys_log` VALUES ('364', 'admin', '修改商品库存', 'com.erpweb.erp.controller.ReturnListController.update()', '{\"amountpaid\":197.0,\"amountpayable\":197.0,\"id\":1,\"remarks\":\"cc\",\"returndate\":1555556136000,\"returnnumber\":\"TH201712060001\",\"state\":2,\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:28:35');
INSERT INTO `sys_log` VALUES ('365', 'admin', '修改商品库存', 'com.erpweb.erp.controller.ReturnListController.update()', '{\"amountpayable\":21.0,\"id\":6,\"remarks\":\"1212\",\"returnnumber\":\"1212\",\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:29:00');
INSERT INTO `sys_log` VALUES ('366', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":9,\"remarks\":\"\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:47:44');
INSERT INTO `sys_log` VALUES ('367', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":10,\"remarks\":\"1\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:47:54');
INSERT INTO `sys_log` VALUES ('368', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[13,14,15,17,18,19,20,23,24,26,27,28,29,30]', '0:0:0:0:0:0:0:1', '2019-05-23 19:48:35');
INSERT INTO `sys_log` VALUES ('369', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"id\":16,\"remarks\":\"\",\"salenum\":\"\",\"state\":3,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:48:45');
INSERT INTO `sys_log` VALUES ('370', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":3,\"id\":16,\"remarks\":\"\",\"salenum\":\"\",\"state\":3,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:48:52');
INSERT INTO `sys_log` VALUES ('371', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"addtime\":1558595989000,\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":3,\"id\":25,\"remarks\":\"\",\"saledate\":1558595989000,\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:49:00');
INSERT INTO `sys_log` VALUES ('372', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":12.0,\"amountpayable\":12.0,\"customerid\":4,\"remarks\":\"\",\"salenum\":\"\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-23 19:52:52');
INSERT INTO `sys_log` VALUES ('373', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":112.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":9,\"remarks\":\"\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:53:32');
INSERT INTO `sys_log` VALUES ('374', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":112.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":9,\"remarks\":\"\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:56:29');
INSERT INTO `sys_log` VALUES ('375', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":112.0,\"amountpayable\":11.0,\"customerid\":1,\"id\":9,\"remarks\":\"\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:56:38');
INSERT INTO `sys_log` VALUES ('376', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"amountpaid\":112.0,\"amountpayable\":11.0,\"customerid\":1,\"id\":9,\"remarks\":\"\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-23 19:56:41');
INSERT INTO `sys_log` VALUES ('377', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"supplier:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:40:10');
INSERT INTO `sys_log` VALUES ('378', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"supplier:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:40:59');
INSERT INTO `sys_log` VALUES ('379', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"supplier:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:41:35');
INSERT INTO `sys_log` VALUES ('380', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"库存报警\",\"orderNum\":7,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:goodsalert:list\",\"type\":1,\"url\":\"sys/goodsalert/html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 09:43:28');
INSERT INTO `sys_log` VALUES ('381', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":104,\"name\":\"新增\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"sys:supplier:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:45:06');
INSERT INTO `sys_log` VALUES ('382', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":104,\"name\":\"新增\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"sys:supplier:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:46:16');
INSERT INTO `sys_log` VALUES ('383', 'admin', '删除菜单', 'com.erpweb.erp.controller.SysMenuController.delete()', '[104,105,106]', '0:0:0:0:0:0:0:1', '2019-05-24 09:47:01');
INSERT INTO `sys_log` VALUES ('384', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"添加\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"sys:supplier:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:47:38');
INSERT INTO `sys_log` VALUES ('385', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:supplier:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:49:31');
INSERT INTO `sys_log` VALUES ('386', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"sys:supplier:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:49:40');
INSERT INTO `sys_log` VALUES ('387', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"sys:supplier:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:50:17');
INSERT INTO `sys_log` VALUES ('388', 'admin', '修改用户', 'com.erpweb.erp.controller.UserRoleController.update()', '{\"addtime\":1558581269000,\"id\":19,\"roleid\":21,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 09:52:07');
INSERT INTO `sys_log` VALUES ('389', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售商品\",\"orderNum\":1,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:salelistgoods:list\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 09:53:53');
INSERT INTO `sys_log` VALUES ('390', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"销售商品\",\"orderNum\":1,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:salelistgoods:list\",\"type\":1,\"url\":\"sys/salelistgoods:html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 09:54:30');
INSERT INTO `sys_log` VALUES ('391', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":111,\"name\":\"销售商品\",\"orderNum\":1,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:salelistgoods:list\",\"type\":1,\"url\":\"sys/salelisgoodst.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 09:57:33');
INSERT INTO `sys_log` VALUES ('392', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":111,\"name\":\"销售商品\",\"orderNum\":3,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:salelistgoods:list\",\"type\":1,\"url\":\"sys/salelisgoodst.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 10:00:34');
INSERT INTO `sys_log` VALUES ('393', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":111,\"name\":\"销售商品\",\"orderNum\":3,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:salelistgoods:list\",\"type\":1,\"url\":\"sys:salelisgoodst.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 10:02:32');
INSERT INTO `sys_log` VALUES ('394', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":111,\"name\":\"销售商品\",\"orderNum\":3,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:salelistgoods:list\",\"type\":1,\"url\":\"sys/salelistgoodst.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 10:03:59');
INSERT INTO `sys_log` VALUES ('395', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":111,\"name\":\"销售商品\",\"orderNum\":3,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:salelistgoods:list\",\"type\":1,\"url\":\"sys/salelistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 10:04:45');
INSERT INTO `sys_log` VALUES ('396', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":111,\"parentName\":\"销售商品\",\"perms\":\"sys:salelistgoods:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 10:20:52');
INSERT INTO `sys_log` VALUES ('397', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":111,\"parentName\":\"销售商品\",\"perms\":\"sys:salelistgoods:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 10:21:14');
INSERT INTO `sys_log` VALUES ('398', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":111,\"parentName\":\"销售商品\",\"perms\":\"sys:salelistgoods:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 10:21:45');
INSERT INTO `sys_log` VALUES ('399', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 10:21:59');
INSERT INTO `sys_log` VALUES ('400', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListGoodsController.delete()', '[12]', '0:0:0:0:0:0:0:1', '2019-05-24 10:22:11');
INSERT INTO `sys_log` VALUES ('401', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 10:24:06');
INSERT INTO `sys_log` VALUES ('402', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListGoodsController.update()', '{\"code\":\"1\",\"id\":13,\"model\":\"1\",\"name\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 10:24:11');
INSERT INTO `sys_log` VALUES ('403', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListGoodsController.delete()', '[13]', '0:0:0:0:0:0:0:1', '2019-05-24 10:24:16');
INSERT INTO `sys_log` VALUES ('404', 'admin', '删除用户', 'com.erpweb.erp.controller.SaleListController.delete()', '[9,10,16]', '0:0:0:0:0:0:0:1', '2019-05-24 10:29:45');
INSERT INTO `sys_log` VALUES ('405', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":60,\"name\":\"退货单管理\",\"orderNum\":3,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:returnlist:list\",\"type\":1,\"url\":\"sys/returnlist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 11:08:03');
INSERT INTO `sys_log` VALUES ('406', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":55,\"name\":\"退货商品出库\",\"orderNum\":2,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:returnlistgoods:list\",\"type\":1,\"url\":\"sys/returnlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 11:09:36');
INSERT INTO `sys_log` VALUES ('407', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":60,\"name\":\"退货单查询\",\"orderNum\":3,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:returnlist:list\",\"type\":1,\"url\":\"sys/returnlist.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 11:13:07');
INSERT INTO `sys_log` VALUES ('408', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"1\",\"goodsid\":\"1\",\"model\":\"1\",\"name\":\"1\",\"num\":\"1\",\"price\":\"11\",\"total\":\"1\",\"typeid\":\"1\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 13:46:41');
INSERT INTO `sys_log` VALUES ('409', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"1\",\"goodsid\":\"1\",\"model\":\"1\",\"name\":\"1\",\"num\":\"\",\"total\":\"\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 13:56:14');
INSERT INTO `sys_log` VALUES ('410', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"1\",\"goodsid\":\"1\",\"model\":\"1\",\"name\":\"1\",\"num\":\"\",\"total\":\"1\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 14:01:03');
INSERT INTO `sys_log` VALUES ('411', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":64,\"name\":\"商品报溢单商品查询\",\"orderNum\":6,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlistgoods:list\",\"type\":1,\"url\":\"sys/overflowlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 14:09:11');
INSERT INTO `sys_log` VALUES ('412', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"添加\",\"orderNum\":0,\"parentId\":64,\"parentName\":\"商品报溢单商品查询\",\"perms\":\"sys:overflowlistgoods:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 14:20:08');
INSERT INTO `sys_log` VALUES ('413', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":64,\"parentName\":\"商品报溢单商品查询\",\"perms\":\"sys:overflowlistgoods:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 14:20:44');
INSERT INTO `sys_log` VALUES ('414', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":64,\"parentName\":\"商品报溢单商品查询\",\"perms\":\"sys:overflowlistgoods:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 14:21:35');
INSERT INTO `sys_log` VALUES ('415', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"11\",\"damagelistid\":\"1\",\"goodsid\":\"11\",\"model\":\"11\",\"name\":\"\",\"num\":\"11\",\"price\":\"1\",\"total\":\"1\",\"typeid\":\"1\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 14:23:56');
INSERT INTO `sys_log` VALUES ('416', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"11\",\"damagelistid\":\"1\",\"goodsid\":\"11\",\"model\":\"11\",\"name\":\"\",\"num\":\"11\",\"price\":\"1\",\"total\":\"1\",\"typeid\":\"11\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 14:24:08');
INSERT INTO `sys_log` VALUES ('417', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-05-24 14:48:57');
INSERT INTO `sys_log` VALUES ('418', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-05-24 14:49:53');
INSERT INTO `sys_log` VALUES ('419', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cc\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 14:54:04');
INSERT INTO `sys_log` VALUES ('420', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"33\",\"damagelistid\":\"3\",\"goodsid\":\"33\",\"model\":\"3\",\"name\":\"33\",\"num\":\"333\",\"price\":\"3\",\"total\":\"3\",\"typeid\":\"33\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 14:59:32');
INSERT INTO `sys_log` VALUES ('421', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"1\",\"damagelistid\":\"1\",\"goodsid\":\"1\",\"model\":\"1\",\"name\":\"1\",\"num\":\"\",\"price\":\"1\",\"total\":\"\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:03:40');
INSERT INTO `sys_log` VALUES ('422', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"addtime\":\"\",\"code\":\"333\",\"damagelistid\":\"33\",\"goodsid\":\"33\",\"model\":\"33\",\"name\":\"33\",\"num\":\"33\",\"price\":\"33\",\"total\":\"33\",\"typeid\":\"33\",\"unit\":\"\",\"userid\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:06:38');
INSERT INTO `sys_log` VALUES ('423', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品退货单\",\"orderNum\":1,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:customergoods:list\",\"type\":1,\"url\":\"sys/customerreturnlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:15:59');
INSERT INTO `sys_log` VALUES ('424', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"商品退货单\",\"orderNum\":5,\"parentId\":66,\"parentName\":\"销售管理\",\"perms\":\"sys:customergoods:list\",\"type\":1,\"url\":\"sys/customergoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:23:43');
INSERT INTO `sys_log` VALUES ('425', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"添加\",\"orderNum\":0,\"parentId\":119,\"parentName\":\"商品退货单\",\"perms\":\"sys:customergoods:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 15:30:57');
INSERT INTO `sys_log` VALUES ('426', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":119,\"parentName\":\"商品退货单\",\"perms\":\"sys:customergoods:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 15:31:23');
INSERT INTO `sys_log` VALUES ('427', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":119,\"parentName\":\"商品退货单\",\"perms\":\"sys:customergoods:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-24 15:32:05');
INSERT INTO `sys_log` VALUES ('428', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerReturnListGoodscontroller.save()', '{\"code\":\"006\",\"customerreturnlistid\":5,\"goodsid\":14,\"model\":\"300g装\",\"name\":\"金桔\",\"num\":2,\"price\":16.0,\"total\":24.0,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 15:36:40');
INSERT INTO `sys_log` VALUES ('429', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:41:37');
INSERT INTO `sys_log` VALUES ('430', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:41:47');
INSERT INTO `sys_log` VALUES ('431', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:41:54');
INSERT INTO `sys_log` VALUES ('432', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:43:04');
INSERT INTO `sys_log` VALUES ('433', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:43:16');
INSERT INTO `sys_log` VALUES ('434', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:45:55');
INSERT INTO `sys_log` VALUES ('435', 'admin', '查询单独用户', 'com.erpweb.erp.controller.CustomerReturnListGoodscontroller.selectOne()', '\"8\"', '0:0:0:0:0:0:0:1', '2019-05-24 15:51:33');
INSERT INTO `sys_log` VALUES ('436', 'admin', '查询单独用户', 'com.erpweb.erp.controller.CustomerReturnListGoodscontroller.selectOne()', '\"8\"', '0:0:0:0:0:0:0:1', '2019-05-24 15:51:41');
INSERT INTO `sys_log` VALUES ('437', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:51:58');
INSERT INTO `sys_log` VALUES ('438', 'admin', '查询单独用户', 'com.erpweb.erp.controller.CustomerReturnListGoodscontroller.selectOne()', '\"8\"', '0:0:0:0:0:0:0:1', '2019-05-24 15:54:56');
INSERT INTO `sys_log` VALUES ('439', 'admin', '查询单独用户', 'com.erpweb.erp.controller.CustomerReturnListGoodscontroller.selectOne()', '\"8\"', '0:0:0:0:0:0:0:1', '2019-05-24 15:55:07');
INSERT INTO `sys_log` VALUES ('440', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:55:30');
INSERT INTO `sys_log` VALUES ('441', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:55:40');
INSERT INTO `sys_log` VALUES ('442', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:57:48');
INSERT INTO `sys_log` VALUES ('443', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 15:57:59');
INSERT INTO `sys_log` VALUES ('444', 'admin', '查询单独用户', 'com.erpweb.erp.controller.CustomerReturnListGoodscontroller.selectOne()', '\"8\"', '0:0:0:0:0:0:0:1', '2019-05-24 15:58:40');
INSERT INTO `sys_log` VALUES ('445', 'admin', '修改用户', 'com.erpweb.erp.controller.CustomerReturnListGoodscontroller.update()', '{\"addtime\":1558683452000,\"code\":\"0006\",\"customerreturnlistid\":5,\"goodsid\":14,\"id\":8,\"model\":\"300g装\",\"name\":\"金桔\",\"num\":2,\"price\":16.0,\"total\":24.0,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 15:58:44');
INSERT INTO `sys_log` VALUES ('446', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerReturnListGoodscontroller.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-05-24 15:59:04');
INSERT INTO `sys_log` VALUES ('447', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 16:01:07');
INSERT INTO `sys_log` VALUES ('448', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 16:01:14');
INSERT INTO `sys_log` VALUES ('449', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 16:01:44');
INSERT INTO `sys_log` VALUES ('450', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 16:01:56');
INSERT INTO `sys_log` VALUES ('451', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 16:02:12');
INSERT INTO `sys_log` VALUES ('452', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 16:12:01');
INSERT INTO `sys_log` VALUES ('453', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 16:12:32');
INSERT INTO `sys_log` VALUES ('454', 'admin', '修改商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.update()', '{\"addtime\":871056000000,\"code\":\"1\",\"damagelistid\":122,\"goodsid\":1,\"id\":6,\"model\":1,\"name\":\"1\",\"num\":1,\"price\":\"1\",\"total\":\"1\",\"typeid\":1,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 16:13:37');
INSERT INTO `sys_log` VALUES ('455', 'admin', '修改商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.update()', '{\"addtime\":1558681645000,\"code\":\"333567\",\"damagelistid\":33,\"goodsid\":33,\"id\":7,\"model\":33,\"name\":\"33\",\"num\":33,\"price\":\"33\",\"total\":\"33\",\"typeid\":33,\"unit\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 16:13:53');
INSERT INTO `sys_log` VALUES ('456', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-05-24 16:14:05');
INSERT INTO `sys_log` VALUES ('457', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-24 16:14:19');
INSERT INTO `sys_log` VALUES ('458', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"002\",\"goodsid\":11,\"model\":\"500g\",\"name\":\"野生大米\",\"num\":11,\"overflowlistid\":1,\"price\":23.0,\"total\":23.0,\"typeid\":2,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 16:21:52');
INSERT INTO `sys_log` VALUES ('459', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListGoodsController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-05-24 16:27:43');
INSERT INTO `sys_log` VALUES ('460', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListGoodsController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-05-24 16:27:52');
INSERT INTO `sys_log` VALUES ('461', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListGoodsController.delete()', '[9]', '0:0:0:0:0:0:0:1', '2019-05-24 16:27:56');
INSERT INTO `sys_log` VALUES ('462', 'admin', '修改商品单位', 'com.erpweb.erp.controller.DamageListController.update()', '{\"damagenumber\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 17:00:30');
INSERT INTO `sys_log` VALUES ('463', 'admin', '修改商品单位', 'com.erpweb.erp.controller.DamageListController.update()', '{\"damagenumber\":\"\",\"remarks\":\"11\",\"userid\":11}', '0:0:0:0:0:0:0:1', '2019-05-24 17:00:48');
INSERT INTO `sys_log` VALUES ('464', 'admin', '修改商品单位', 'com.erpweb.erp.controller.DamageListController.update()', '{\"damagenumber\":\"1\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 17:02:22');
INSERT INTO `sys_log` VALUES ('465', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListController.save()', '{\"damagenumber\":\"1\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-05-24 17:05:42');
INSERT INTO `sys_log` VALUES ('466', 'admin', '修改商品单位', 'com.erpweb.erp.controller.DamageListController.update()', '{\"damagenumber\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 17:06:19');
INSERT INTO `sys_log` VALUES ('467', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListGoodsController.update()', '{\"addtime\":1558686161000,\"code\":\"002\",\"goodsid\":11,\"id\":11,\"model\":\"500g\",\"name\":\"野生大米\",\"num\":112,\"overflowlistid\":1,\"price\":23.0,\"total\":23.0,\"typeid\":2,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-24 17:15:04');
INSERT INTO `sys_log` VALUES ('468', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"yy\",\"name\":\"dl\",\"num\":\"12347862556\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-27 08:31:14');
INSERT INTO `sys_log` VALUES ('469', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"1\",\"name\":\"\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-27 10:10:19');
INSERT INTO `sys_log` VALUES ('470', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"1\",\"name\":\"\",\"num\":\"\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 10:42:55');
INSERT INTO `sys_log` VALUES ('471', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addr\":\"\",\"addtime\":1558925032000,\"contact\":\"1\",\"id\":16,\"name\":\"\",\"num\":\"\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 10:50:30');
INSERT INTO `sys_log` VALUES ('472', 'admin', '删除用户', 'com.erpweb.erp.controller.SupplierController.delete()', '[16]', '0:0:0:0:0:0:0:1', '2019-05-27 11:00:08');
INSERT INTO `sys_log` VALUES ('473', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"退货商品\",\"orderNum\":0,\"parentId\":39,\"parentName\":\"进货管理\",\"perms\":\"sys:returnlistgoods:list\",\"type\":1,\"url\":\"sys/returnlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-05-27 10:59:58');
INSERT INTO `sys_log` VALUES ('474', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":74,\"name\":\"客户管理\",\"orderNum\":3,\"parentId\":31,\"parentName\":\"基础资料\",\"perms\":\"sys:customer:list\",\"type\":1,\"url\":\"sys/customer.html\"}', '0:0:0:0:0:0:0:1', '2019-05-27 11:10:44');
INSERT INTO `sys_log` VALUES ('475', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"1\",\"name\":\"1\",\"num\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 11:12:24');
INSERT INTO `sys_log` VALUES ('476', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"5\"', '0:0:0:0:0:0:0:1', '2019-05-27 11:12:32');
INSERT INTO `sys_log` VALUES ('477', 'admin', '修改用户', 'com.erpweb.erp.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1558926801000,\"contact\":\"1\",\"id\":5,\"name\":\"1\",\"num\":\"1\",\"remarks\":\"\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-27 11:12:37');
INSERT INTO `sys_log` VALUES ('478', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-05-27 11:12:48');
INSERT INTO `sys_log` VALUES ('479', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"addtime\":1558595989000,\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":3,\"id\":25,\"remarks\":\"1\",\"saledate\":1558595989000,\"salenum\":\"1\",\"state\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 12:00:01');
INSERT INTO `sys_log` VALUES ('480', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-05-27 13:26:20');
INSERT INTO `sys_log` VALUES ('481', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListController.save()', '{\"damagenumber\":\"xx\",\"remarks\":\"dad\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 13:30:48');
INSERT INTO `sys_log` VALUES ('482', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 14:45:14');
INSERT INTO `sys_log` VALUES ('483', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"remarks\":\"\",\"salenum\":\"1\",\"state\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 14:47:59');
INSERT INTO `sys_log` VALUES ('484', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"customerid\":1,\"remarks\":\"\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 14:51:18');
INSERT INTO `sys_log` VALUES ('485', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":12.0,\"amountpayable\":12.0,\"purchasenumber\":\"12\",\"remarks\":\"12\",\"state\":12,\"supplierid\":12,\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-27 18:00:27');
INSERT INTO `sys_log` VALUES ('486', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1200.0,\"amountpayable\":1200.0,\"purchasenumber\":\"DC201905270001\",\"remarks\":\"wc\",\"state\":2,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 18:03:35');
INSERT INTO `sys_log` VALUES ('487', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1200.0,\"amountpayable\":1200.0,\"purchasenumber\":\"DF201905290002\",\"remarks\":\"wc\",\"state\":2,\"supplierid\":2,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-27 18:22:39');
INSERT INTO `sys_log` VALUES ('488', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:25:16');
INSERT INTO `sys_log` VALUES ('489', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:27:29');
INSERT INTO `sys_log` VALUES ('490', 'admin', '保存用户', 'com.erpweb.erp.controller.SaleListController.save()', '{\"amountpaid\":1.0,\"customerid\":1,\"remarks\":\"\",\"salenum\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 18:45:47');
INSERT INTO `sys_log` VALUES ('491', 'admin', '修改用户', 'com.erpweb.erp.controller.SaleListController.update()', '{\"addtime\":1558953996000,\"amountpaid\":2.0,\"amountpayable\":1.0,\"customerid\":1,\"id\":35,\"remarks\":\"\",\"saledate\":1558953996000,\"salenum\":\"\",\"state\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 18:46:38');
INSERT INTO `sys_log` VALUES ('492', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":12.0,\"amountpayable\":12.0,\"purchasenumber\":\"12\",\"remarks\":\"12\",\"state\":12,\"supplierid\":12,\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-27 18:46:09');
INSERT INTO `sys_log` VALUES ('493', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"purchasenumber\":\"1\",\"remarks\":\"1\",\"state\":1,\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 18:46:51');
INSERT INTO `sys_log` VALUES ('494', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:47:53');
INSERT INTO `sys_log` VALUES ('495', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:48:06');
INSERT INTO `sys_log` VALUES ('496', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:48:15');
INSERT INTO `sys_log` VALUES ('497', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:48:18');
INSERT INTO `sys_log` VALUES ('498', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:51:57');
INSERT INTO `sys_log` VALUES ('499', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:51:58');
INSERT INTO `sys_log` VALUES ('500', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:52:47');
INSERT INTO `sys_log` VALUES ('501', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:55:32');
INSERT INTO `sys_log` VALUES ('502', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:58:19');
INSERT INTO `sys_log` VALUES ('503', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 18:59:22');
INSERT INTO `sys_log` VALUES ('504', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 19:00:04');
INSERT INTO `sys_log` VALUES ('505', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 19:00:49');
INSERT INTO `sys_log` VALUES ('506', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 19:01:14');
INSERT INTO `sys_log` VALUES ('507', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-27 19:01:17');
INSERT INTO `sys_log` VALUES ('508', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[9]', '0:0:0:0:0:0:0:1', '2019-05-27 19:10:37');
INSERT INTO `sys_log` VALUES ('509', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-05-27 19:11:29');
INSERT INTO `sys_log` VALUES ('510', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-05-27 19:11:30');
INSERT INTO `sys_log` VALUES ('511', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-05-27 19:11:30');
INSERT INTO `sys_log` VALUES ('512', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"addtime\":1558504345000,\"amountpaid\":2.0,\"amountpayable\":2.0,\"id\":11,\"purchasedate\":1558504285000,\"purchasenumber\":\"JH201712040003\",\"remarks\":\"test03\",\"state\":2,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 19:11:56');
INSERT INTO `sys_log` VALUES ('513', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-05-27 19:12:02');
INSERT INTO `sys_log` VALUES ('514', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-05-27 19:12:05');
INSERT INTO `sys_log` VALUES ('515', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[12]', '0:0:0:0:0:0:0:1', '2019-05-27 19:12:38');
INSERT INTO `sys_log` VALUES ('516', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"addtime\":1558954232000,\"amountpaid\":22222.0,\"amountpayable\":1.0,\"id\":39,\"purchasenumber\":\"1\",\"remarks\":\"1\",\"state\":1,\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 19:15:56');
INSERT INTO `sys_log` VALUES ('517', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[39]', '0:0:0:0:0:0:0:1', '2019-05-27 19:16:12');
INSERT INTO `sys_log` VALUES ('518', 'admin', '保存商品单位', 'com.erpweb.erp.controller.DamageListGoodsController.save()', '{\"code\":\"1\",\"damagelistid\":1,\"goodsid\":1,\"model\":1,\"name\":\"1\",\"num\":1,\"price\":\"1\",\"total\":\"1\",\"unit\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 19:25:10');
INSERT INTO `sys_log` VALUES ('519', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"1\",\"model\":\"\",\"name\":\"\",\"overflowlistid\":1,\"typeid\":1,\"unit\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 19:26:37');
INSERT INTO `sys_log` VALUES ('520', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListGoodsController.save()', '{\"code\":\"1\",\"goodsid\":1,\"model\":\"1\",\"name\":\"1\",\"num\":1,\"overflowlistid\":1,\"price\":1.0,\"total\":1.0,\"typeid\":1,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 19:26:48');
INSERT INTO `sys_log` VALUES ('521', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListGoodsController.update()', '{\"addtime\":1558509046000,\"code\":\"0003\",\"goodsid\":22,\"id\":1,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"num\":1,\"overflowlistid\":1,\"price\":22.0,\"total\":22.0,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-27 19:26:57');
INSERT INTO `sys_log` VALUES ('522', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListGoodsController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2019-05-27 19:27:02');
INSERT INTO `sys_log` VALUES ('523', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addr\":\"南京将军路800号\",\"addtime\":1558675616000,\"contact\":\"小吴\",\"id\":13,\"name\":\"南京大陆食品公司\",\"num\":\"1\",\"remarks\":\"cc\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-27 19:47:52');
INSERT INTO `sys_log` VALUES ('524', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListGoodsController.update()', '{\"addtime\":1558685708000,\"code\":\"\",\"id\":10,\"model\":\"\",\"name\":\"小麦\",\"num\":0,\"price\":0.0,\"total\":0.0,\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-28 09:40:32');
INSERT INTO `sys_log` VALUES ('525', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListGoodsController.update()', '{\"addtime\":1558685708000,\"code\":\"\",\"id\":10,\"model\":\"500g装\",\"name\":\"小麦\",\"num\":0,\"overflowlistid\":2,\"price\":0.0,\"total\":0.0,\"typeid\":1,\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-28 09:41:07');
INSERT INTO `sys_log` VALUES ('526', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"1\",\"name\":\"1\",\"num\":\"1\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 09:56:44');
INSERT INTO `sys_log` VALUES ('527', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"num\":\"\",\"remarks\":\"\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 09:58:38');
INSERT INTO `sys_log` VALUES ('528', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addr\":\"\",\"addtime\":1559008776000,\"contact\":\"2\",\"id\":18,\"name\":\"\",\"num\":\"2\",\"remarks\":\"\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 09:58:54');
INSERT INTO `sys_log` VALUES ('529', 'admin', '删除用户', 'com.erpweb.erp.controller.SupplierController.delete()', '[18]', '0:0:0:0:0:0:0:1', '2019-05-28 09:59:06');
INSERT INTO `sys_log` VALUES ('530', 'admin', '删除用户', 'com.erpweb.erp.controller.SupplierController.delete()', '[17]', '0:0:0:0:0:0:0:1', '2019-05-28 09:59:52');
INSERT INTO `sys_log` VALUES ('531', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"num\":\"\",\"remarks\":\"\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-05-28 10:00:02');
INSERT INTO `sys_log` VALUES ('532', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"num\":\"\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 10:00:07');
INSERT INTO `sys_log` VALUES ('533', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"1\",\"name\":\"1\",\"num\":\"1\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 10:00:36');
INSERT INTO `sys_log` VALUES ('534', 'admin', '删除用户', 'com.erpweb.erp.controller.SupplierController.delete()', '[20,19]', '0:0:0:0:0:0:0:1', '2019-05-28 10:04:24');
INSERT INTO `sys_log` VALUES ('535', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"\",\"contact\":\"1\",\"name\":\"\",\"num\":\"\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 10:04:34');
INSERT INTO `sys_log` VALUES ('536', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListGoodsController.update()', '{\"addtime\":1558686161000,\"code\":\"002\",\"goodsid\":11,\"id\":11,\"model\":\"500g\",\"name\":\"野生大米\",\"num\":112,\"overflowlistid\":1,\"price\":23.0,\"total\":23.0,\"typeid\":2,\"unit\":\"盒\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 10:15:00');
INSERT INTO `sys_log` VALUES ('537', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"addtime\":1558952781000,\"amountpaid\":11.0,\"amountpayable\":1200.0,\"id\":37,\"purchasenumber\":\"DF201905290002\",\"remarks\":\"wc\",\"state\":2,\"supplierid\":2,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 10:16:09');
INSERT INTO `sys_log` VALUES ('538', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"contact\":\"1\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 10:22:35');
INSERT INTO `sys_log` VALUES ('539', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-28 14:06:09');
INSERT INTO `sys_log` VALUES ('540', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-28 14:07:10');
INSERT INTO `sys_log` VALUES ('541', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-28 14:08:37');
INSERT INTO `sys_log` VALUES ('542', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-05-28 14:09:00');
INSERT INTO `sys_log` VALUES ('543', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-05-28 14:18:18');
INSERT INTO `sys_log` VALUES ('544', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-05-28 14:18:48');
INSERT INTO `sys_log` VALUES ('545', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-28 14:30:21');
INSERT INTO `sys_log` VALUES ('546', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.save()', '{\"code\":\"12\",\"goodsid\":12,\"model\":\"12\",\"name\":\"1\",\"num\":1.0,\"price\":1.0,\"purchaselistid\":1,\"total\":1.0,\"typeid\":1,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 14:33:22');
INSERT INTO `sys_log` VALUES ('547', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.save()', '{\"addr\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 14:50:21');
INSERT INTO `sys_log` VALUES ('548', 'admin', '查询单独用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"6\"', '0:0:0:0:0:0:0:1', '2019-05-28 14:50:32');
INSERT INTO `sys_log` VALUES ('549', 'admin', '修改用户', 'com.erpweb.erp.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1559026280000,\"id\":6,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 14:50:35');
INSERT INTO `sys_log` VALUES ('550', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.save()', '{\"code\":\"1\",\"goodsid\":1,\"model\":\"1\",\"name\":\"1\",\"num\":1.0,\"price\":1.0,\"purchaselistid\":1,\"total\":1.0,\"typeid\":1,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 14:49:44');
INSERT INTO `sys_log` VALUES ('551', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.save()', '{\"code\":\"1\",\"goodsid\":1,\"model\":\"1\",\"name\":\"1\",\"num\":1.0,\"price\":1.0,\"purchaselistid\":1,\"total\":1.0,\"typeid\":1,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 15:09:59');
INSERT INTO `sys_log` VALUES ('552', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.save()', '{\"code\":\"6\",\"goodsid\":6,\"model\":\"6\",\"name\":\"6\",\"num\":6.0,\"price\":6.0,\"purchaselistid\":6,\"total\":6.0,\"typeid\":6,\"unit\":\"6\",\"userid\":6}', '0:0:0:0:0:0:0:1', '2019-05-28 15:10:50');
INSERT INTO `sys_log` VALUES ('553', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.save()', '{\"code\":\"11111111\",\"goodsid\":1,\"model\":\"12\",\"name\":\"12\",\"num\":12.0,\"price\":12.0,\"purchaselistid\":6,\"total\":123.0,\"typeid\":2,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 15:15:42');
INSERT INTO `sys_log` VALUES ('554', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.save()', '{\"addr\":\"3\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 15:21:07');
INSERT INTO `sys_log` VALUES ('555', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.save()', '{\"code\":\"00000\",\"goodsid\":1,\"model\":\"12\",\"name\":\"12\",\"num\":12.0,\"price\":12.0,\"purchaselistid\":8,\"total\":12.0,\"typeid\":1,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 15:18:31');
INSERT INTO `sys_log` VALUES ('556', 'admin', '保存用户', 'com.erpweb.erp.controller.CustomerController.save()', '{\"addr\":\"12\",\"contact\":\"12\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 15:21:54');
INSERT INTO `sys_log` VALUES ('557', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-28 15:19:13');
INSERT INTO `sys_log` VALUES ('558', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-28 15:22:52');
INSERT INTO `sys_log` VALUES ('559', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.delete()', '[0]', '0:0:0:0:0:0:0:1', '2019-05-28 15:25:42');
INSERT INTO `sys_log` VALUES ('560', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addtime\":1559010213000,\"contact\":\"1\",\"id\":23,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 15:38:32');
INSERT INTO `sys_log` VALUES ('561', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addtime\":1559010213000,\"contact\":\"1\",\"id\":23,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 15:39:12');
INSERT INTO `sys_log` VALUES ('562', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"qqqq\",\"remarks\":\"2\",\"userid\":3}', '0:0:0:0:0:0:0:1', '2019-05-28 15:43:02');
INSERT INTO `sys_log` VALUES ('563', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"ssss2\",\"remarks\":\"2\",\"userid\":3}', '0:0:0:0:0:0:0:1', '2019-05-28 15:43:29');
INSERT INTO `sys_log` VALUES ('564', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"hhhhh1\",\"remarks\":\"2\",\"userid\":3}', '0:0:0:0:0:0:0:1', '2019-05-28 15:43:41');
INSERT INTO `sys_log` VALUES ('565', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addtime\":1559010213000,\"contact\":\"1\",\"id\":23,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 15:44:37');
INSERT INTO `sys_log` VALUES ('566', 'admin', '删除用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.delete()', '[30]', '0:0:0:0:0:0:0:1', '2019-05-28 15:43:28');
INSERT INTO `sys_log` VALUES ('567', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 15:51:51');
INSERT INTO `sys_log` VALUES ('568', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 15:52:05');
INSERT INTO `sys_log` VALUES ('569', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"contact\":\"1\",\"name\":\"1\",\"num\":\"1\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 15:52:19');
INSERT INTO `sys_log` VALUES ('570', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addr\":\"1\",\"addtime\":1559029997000,\"contact\":\"1\",\"id\":26,\"name\":\"1\",\"num\":\"1\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 15:57:07');
INSERT INTO `sys_log` VALUES ('571', 'admin', '删除用户', 'com.erpweb.erp.controller.SupplierController.delete()', '[25,24]', '0:0:0:0:0:0:0:1', '2019-05-28 15:57:43');
INSERT INTO `sys_log` VALUES ('572', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListController.delete()', '[13]', '0:0:0:0:0:0:0:1', '2019-05-28 15:58:36');
INSERT INTO `sys_log` VALUES ('573', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.update()', '{\"addtime\":1559027929000,\"code\":\"1\",\"goodsid\":1,\"id\":29,\"model\":\"12\",\"name\":\"12\",\"num\":12.0,\"price\":12.0,\"purchaselistid\":6,\"total\":123.0,\"typeid\":2,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 16:02:43');
INSERT INTO `sys_log` VALUES ('574', 'admin', '修改商品库存', 'com.erpweb.erp.controller.GoodsController.update()', '{\"addtime\":1558597543000,\"code\":\"111\",\"id\":37,\"inventoryquantity\":11,\"lastpurchasingprice\":555.0,\"minnum\":111,\"model\":\"111\",\"name\":\"1\",\"producer\":\"1\",\"purchasingprice\":1.0,\"remarks\":\"1\",\"state\":1,\"unit\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 16:17:09');
INSERT INTO `sys_log` VALUES ('575', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListGoodsController.update()', '{\"addtime\":1559027929000,\"code\":\"222222\",\"goodsid\":1,\"id\":29,\"model\":\"12\",\"name\":\"12\",\"num\":12.0,\"price\":12.0,\"purchaselistid\":6,\"total\":123.0,\"typeid\":2,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 16:16:12');
INSERT INTO `sys_log` VALUES ('576', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"查看详情\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"sys:supplier.detail\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 16:24:43');
INSERT INTO `sys_log` VALUES ('577', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"查询详情\",\"orderNum\":0,\"parentId\":51,\"parentName\":\"供应商管理\",\"perms\":\"sys:supplier:detail\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 16:28:32');
INSERT INTO `sys_log` VALUES ('578', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"3131\",\"inventoryquantity\":221,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"刘佳辰\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-28 16:32:18');
INSERT INTO `sys_log` VALUES ('579', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"3131\",\"inventoryquantity\":221,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"刘佳辰\",\"producer\":\"1\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-28 16:32:22');
INSERT INTO `sys_log` VALUES ('580', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"3131\",\"inventoryquantity\":221,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"刘佳辰\",\"producer\":\"1\",\"remarks\":\"11\",\"state\":1,\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-05-28 16:32:31');
INSERT INTO `sys_log` VALUES ('581', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"查询详情\",\"orderNum\":0,\"parentId\":74,\"parentName\":\"客户管理\",\"perms\":\"sys:customer:detail\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-05-28 16:34:56');
INSERT INTO `sys_log` VALUES ('582', 'admin', '查询单独用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"8\"', '0:0:0:0:0:0:0:1', '2019-05-28 16:41:33');
INSERT INTO `sys_log` VALUES ('583', 'admin', '修改用户', 'com.erpweb.erp.controller.CustomerController.update()', '{\"addr\":\"12\",\"addtime\":1559028172000,\"contact\":\"12\",\"id\":8,\"name\":\"1\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-05-28 16:42:01');
INSERT INTO `sys_log` VALUES ('584', 'admin', '删除用户', 'com.erpweb.erp.controller.SupplierController.delete()', '[26,23,22]', '0:0:0:0:0:0:0:1', '2019-05-31 14:30:26');
INSERT INTO `sys_log` VALUES ('585', 'admin', '修改用户', 'com.erpweb.erp.controller.PurchaseListController.update()', '{\"addtime\":1559179666000,\"amountpaid\":16333.0,\"amountpayable\":16.0,\"id\":8,\"purchasedate\":1558661348000,\"purchasenumber\":\"JH201712040003\",\"remarks\":\"cc\",\"state\":2,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-01 10:44:54');
INSERT INTO `sys_log` VALUES ('586', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{\"amountpaid\":1200.0,\"amountpayable\":1200.0,\"purchasenumber\":\"123\",\"remarks\":\"123\",\"state\":1,\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-06-01 15:52:30');
INSERT INTO `sys_log` VALUES ('587', 'admin', '保存用户', 'com.erpweb.erp.controller.PurchaseListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-01 15:58:58');
INSERT INTO `sys_log` VALUES ('588', 'admin', '保存菜单', 'com.erpweb.erp.controller.SysMenuController.save()', '{\"name\":\"查询所有\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:suoyou\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-06-01 18:31:19');
INSERT INTO `sys_log` VALUES ('589', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":127,\"name\":\"查询所有\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-06-01 18:34:08');
INSERT INTO `sys_log` VALUES ('590', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":127,\"name\":\"查询详情\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:suoyou\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-06-01 18:34:59');
INSERT INTO `sys_log` VALUES ('591', 'admin', '修改菜单', 'com.erpweb.erp.controller.SysMenuController.update()', '{\"menuId\":127,\"name\":\"查询详情\",\"orderNum\":0,\"parentId\":62,\"parentName\":\"商品报溢单查询\",\"perms\":\"sys:overflowlist:all\",\"type\":2}', '0:0:0:0:0:0:0:1', '2019-06-01 18:38:16');
INSERT INTO `sys_log` VALUES ('592', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558680893000,\"id\":12,\"overflowdate\":1558680893000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cc\",\"userid\":1}', '127.0.0.1', '2019-06-01 18:53:15');
INSERT INTO `sys_log` VALUES ('593', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558680893000,\"id\":12,\"overflowdate\":1558680893000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cc\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-01 19:03:35');
INSERT INTO `sys_log` VALUES ('594', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-01 19:04:33');
INSERT INTO `sys_log` VALUES ('595', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1558680893000,\"id\":12,\"overflowdate\":1558680893000,\"overflownumber\":\"BY2017121400011\",\"remarks\":\"cc\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-01 19:18:57');
INSERT INTO `sys_log` VALUES ('596', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"12\",\"contact\":\"1231\",\"name\":\"13\",\"num\":\"165165161\"}', '0:0:0:0:0:0:0:1', '2019-06-03 09:32:40');
INSERT INTO `sys_log` VALUES ('597', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"13\",\"contact\":\"123\",\"name\":\"12\",\"num\":\"44\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-03 09:33:23');
INSERT INTO `sys_log` VALUES ('598', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"13\",\"contact\":\"131\",\"name\":\"13\",\"num\":\"13123\"}', '0:0:0:0:0:0:0:1', '2019-06-03 09:37:22');
INSERT INTO `sys_log` VALUES ('599', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"10\",\"contact\":\"41\",\"name\":\"11\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-03 10:38:23');
INSERT INTO `sys_log` VALUES ('600', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"28\",\"purchasingprice\":123.0,\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-03 10:41:52');
INSERT INTO `sys_log` VALUES ('601', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"29\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-03 10:43:08');
INSERT INTO `sys_log` VALUES ('602', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"29\",\"remarks\":\"\",\"state\":1,\"unit\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-03 10:43:36');
INSERT INTO `sys_log` VALUES ('603', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"28\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-03 10:47:34');
INSERT INTO `sys_log` VALUES ('604', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"28\",\"purchasingprice\":1.0,\"remarks\":\"1\",\"state\":1,\"unit\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-03 10:51:51');
INSERT INTO `sys_log` VALUES ('605', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"28\",\"purchasingprice\":1.0,\"remarks\":\"1\",\"state\":1,\"unit\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-03 10:52:08');
INSERT INTO `sys_log` VALUES ('606', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-03 10:59:00');
INSERT INTO `sys_log` VALUES ('607', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"1\",\"producer\":\"1\",\"purchasingprice\":1.0,\"remarks\":\"1\",\"state\":1,\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-03 11:01:26');
INSERT INTO `sys_log` VALUES ('608', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"purchasingprice\":1.0,\"remarks\":\"1\",\"state\":1,\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-03 11:03:25');
INSERT INTO `sys_log` VALUES ('609', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"1\",\"name\":\"1\",\"producer\":\"1\",\"purchasingprice\":1.0,\"remarks\":\"1\",\"state\":1,\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-03 11:03:44');
INSERT INTO `sys_log` VALUES ('610', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"2\",\"name\":\"3\",\"producer\":\"3\",\"purchasingprice\":3.0,\"remarks\":\"3\",\"sellingprice\":3.0,\"state\":3,\"unit\":\"3\"}', '0:0:0:0:0:0:0:1', '2019-06-03 12:50:49');
INSERT INTO `sys_log` VALUES ('611', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"1\",\"inventoryquantity\":1,\"lastpurchasingprice\":1.0,\"minnum\":1,\"model\":\"2\",\"name\":\"3\",\"producer\":\"3\",\"purchasingprice\":3.0,\"remarks\":\"3\",\"sellingprice\":3.0,\"state\":3,\"unit\":\"3\"}', '0:0:0:0:0:0:0:1', '2019-06-03 12:52:38');
INSERT INTO `sys_log` VALUES ('612', 'admin', '保存商品库存', 'com.erpweb.erp.controller.GoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"2\",\"purchasingprice\":2.0,\"remarks\":\"2\",\"sellingprice\":1.0,\"state\":1,\"unit\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-03 13:02:28');
INSERT INTO `sys_log` VALUES ('613', 'admin', '删除用户', 'com.erpweb.erp.controller.DamageListGoodsController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-06-03 13:59:30');
INSERT INTO `sys_log` VALUES ('614', 'admin', '查询单独用户', 'com.erpweb.erp.controller.CustomerController.selectOne()', '\"4\"', '0:0:0:0:0:0:0:1', '2019-06-03 14:03:55');
INSERT INTO `sys_log` VALUES ('615', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addr\":\"13\",\"addtime\":1559529564000,\"contact\":\"41\",\"id\":25,\"name\":\"11\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-03 14:04:28');
INSERT INTO `sys_log` VALUES ('616', 'admin', '修改用户', 'com.erpweb.erp.controller.SupplierController.update()', '{\"addr\":\"11\",\"addtime\":1558675616000,\"contact\":\"小吴\",\"id\":13,\"num\":\"1\",\"remarks\":\"cc\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-06-03 14:04:47');
INSERT INTO `sys_log` VALUES ('617', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"1\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-03 14:22:07');
INSERT INTO `sys_log` VALUES ('618', 'admin', '删除用户', 'com.erpweb.erp.controller.OverflowListController.delete()', '[16]', '0:0:0:0:0:0:0:1', '2019-06-03 14:22:14');
INSERT INTO `sys_log` VALUES ('619', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"12\",\"name\":\"12\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-03 14:25:00');
INSERT INTO `sys_log` VALUES ('620', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"1\",\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-03 14:27:49');
INSERT INTO `sys_log` VALUES ('621', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1559029464000,\"id\":14,\"overflowdate\":1559029464000,\"overflownumber\":\"ssss2\",\"remarks\":\"2\",\"userid\":3}', '0:0:0:0:0:0:0:1', '2019-06-03 14:30:54');
INSERT INTO `sys_log` VALUES ('622', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1559029464000,\"id\":14,\"overflowdate\":1559029464000,\"overflownumber\":\"ssss2\",\"remarks\":\"2\",\"userid\":3}', '0:0:0:0:0:0:0:1', '2019-06-03 14:30:58');
INSERT INTO `sys_log` VALUES ('623', 'admin', '保存用户', 'com.erpweb.erp.controller.OverflowListController.save()', '{\"overflownumber\":\"2\",\"remarks\":\"2\",\"userid\":2}', '0:0:0:0:0:0:0:1', '2019-06-03 14:49:23');
INSERT INTO `sys_log` VALUES ('624', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1559543330000,\"id\":17,\"overflowdate\":1559543330000,\"overflownumber\":\"1\",\"remarks\":\"1\",\"userid\":12}', '0:0:0:0:0:0:0:1', '2019-06-03 14:49:30');
INSERT INTO `sys_log` VALUES ('625', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1559543330000,\"id\":17,\"overflowdate\":1559543330000,\"overflownumber\":\"1\",\"remarks\":\"1\",\"userid\":8}', '0:0:0:0:0:0:0:1', '2019-06-03 14:49:42');
INSERT INTO `sys_log` VALUES ('626', 'admin', '修改用户', 'com.erpweb.erp.controller.OverflowListController.update()', '{\"addtime\":1559543330000,\"id\":17,\"overflowdate\":1559543330000,\"overflownumber\":\"1\",\"remarks\":\"2\",\"userid\":8}', '0:0:0:0:0:0:0:1', '2019-06-03 14:49:58');
INSERT INTO `sys_log` VALUES ('627', 'admin', '删除用户', 'com.erpweb.erp.controller.CustomerController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-06-06 09:08:37');
INSERT INTO `sys_log` VALUES ('628', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"1\",\"name\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-11 09:39:08');
INSERT INTO `sys_log` VALUES ('629', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"2222222\"}', '0:0:0:0:0:0:0:1', '2019-06-11 09:39:24');
INSERT INTO `sys_log` VALUES ('630', 'admin', '保存用户', 'com.erpweb.erp.controller.SupplierController.save()', '{\"addr\":\"2q\"}', '0:0:0:0:0:0:0:1', '2019-06-11 09:39:41');
INSERT INTO `sys_log` VALUES ('631', 'admin', '删除用户', 'com.erpweb.erp.controller.SupplierController.delete()', '[29,28]', '0:0:0:0:0:0:0:1', '2019-06-11 09:39:57');
INSERT INTO `sys_log` VALUES ('632', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品管理\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/goods.html\"}', '0:0:0:0:0:0:0:1', '2019-06-18 10:19:57');
INSERT INTO `sys_log` VALUES ('633', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"客户退货\",\"orderNum\":0,\"parentId\":66,\"parentName\":\"销售管理\",\"type\":1,\"url\":\"sys/customer_return_list.html\"}', '0:0:0:0:0:0:0:1', '2019-06-18 10:55:36');
INSERT INTO `sys_log` VALUES ('634', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"客户退货查询\",\"orderNum\":0,\"parentId\":66,\"parentName\":\"销售管理\",\"type\":1,\"url\":\"sys/customer_return_list_goods.html\"}', '0:0:0:0:0:0:0:1', '2019-06-18 10:57:00');
INSERT INTO `sys_log` VALUES ('635', 'admin', '保存', 'com.erpdemo.controller.SysProductController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 11:22:30');
INSERT INTO `sys_log` VALUES ('636', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 11:31:21');
INSERT INTO `sys_log` VALUES ('637', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"name\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-06-18 11:37:33');
INSERT INTO `sys_log` VALUES ('638', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 11:37:39');
INSERT INTO `sys_log` VALUES ('639', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"name\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-06-18 11:37:41');
INSERT INTO `sys_log` VALUES ('640', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"name\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-06-18 11:37:58');
INSERT INTO `sys_log` VALUES ('641', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 13:07:51');
INSERT INTO `sys_log` VALUES ('642', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 13:10:34');
INSERT INTO `sys_log` VALUES ('643', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 13:17:26');
INSERT INTO `sys_log` VALUES ('644', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 13:20:13');
INSERT INTO `sys_log` VALUES ('645', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 13:22:15');
INSERT INTO `sys_log` VALUES ('646', 'admin', '修改用户', 'com.erpdemo.controller.TGoodsController.update()', '{\"code\":\"0099\",\"inventoryquantity\":20,\"model\":\"\",\"name\":\"德芙\",\"producer\":\"巧克力工厂\",\"purchasingprice\":20.0,\"remarks\":\"\",\"unit\":\"条\"}', '0:0:0:0:0:0:0:1', '2019-06-18 13:27:30');
INSERT INTO `sys_log` VALUES ('647', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-18 13:28:52');
INSERT INTO `sys_log` VALUES ('648', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{\"code\":\"0022\",\"inventoryquantity\":20,\"model\":\"\",\"name\":\"德芙\",\"producer\":\"巧克力工厂\",\"purchasingprice\":9.0,\"remarks\":\"\",\"unit\":\"条\"}', '0:0:0:0:0:0:0:1', '2019-06-18 13:34:48');
INSERT INTO `sys_log` VALUES ('649', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{\"code\":\"0022\",\"inventoryquantity\":20,\"model\":\"\",\"name\":\"德芙\",\"producer\":\"巧克力工厂\",\"purchasingprice\":20.0,\"remarks\":\"\",\"unit\":\"条\"}', '0:0:0:0:0:0:0:1', '2019-06-18 13:38:05');
INSERT INTO `sys_log` VALUES ('650', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{\"code\":\"0022\",\"inventoryquantity\":20,\"model\":\"\",\"name\":\"德芙\",\"producer\":\"巧克力工厂\",\"purchasingprice\":9.0,\"remarks\":\"\",\"unit\":\"条\"}', '0:0:0:0:0:0:0:1', '2019-06-18 13:40:48');
INSERT INTO `sys_log` VALUES ('651', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{\"code\":\"0022\",\"inventoryquantity\":20,\"model\":\"\",\"name\":\"德芙\",\"producer\":\"巧克力工厂\",\"purchasingprice\":8.0,\"remarks\":\"\",\"unit\":\"条\"}', '0:0:0:0:0:0:0:1', '2019-06-18 13:43:26');
INSERT INTO `sys_log` VALUES ('652', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{\"code\":\"0022\",\"inventoryquantity\":20,\"model\":\"\",\"name\":\"德芙\",\"producer\":\"巧克力工厂\",\"purchasingprice\":9.0,\"remarks\":\"\",\"unit\":\"条\"}', '0:0:0:0:0:0:0:1', '2019-06-18 13:45:16');
INSERT INTO `sys_log` VALUES ('653', 'admin', '修改用户', 'com.erpdemo.controller.SysProductController.update()', '{\"name\":\"大饼\",\"ptypeid\":0}', '0:0:0:0:0:0:0:1', '2019-06-18 14:35:05');
INSERT INTO `sys_log` VALUES ('654', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2019-06-18 14:46:14');
INSERT INTO `sys_log` VALUES ('655', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"晋江市罗山后林西区41号\",\"addtime\":1558675595000,\"contact\":\"小李\",\"delflag\":0,\"id\":3,\"name\":\"福建省晋江市罗山惠康食品有限公司1\",\"num\":\"1\",\"remarks\":\"优质供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-18 14:46:26');
INSERT INTO `sys_log` VALUES ('656', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"晋江市罗山后林西区41号\",\"addtime\":1558675595000,\"contact\":\"小李\",\"delflag\":0,\"id\":3,\"name\":\"福建省晋江市罗山惠康食品有限公司1\",\"num\":\"1\",\"remarks\":\"优质供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-18 14:46:31');
INSERT INTO `sys_log` VALUES ('657', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"name\":\"阿斯顿\"}', '0:0:0:0:0:0:0:1', '2019-06-18 14:47:00');
INSERT INTO `sys_log` VALUES ('658', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[12]', '0:0:0:0:0:0:0:1', '2019-06-18 14:55:18');
INSERT INTO `sys_log` VALUES ('659', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":62,\"name\":\"商品报溢\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-06-18 14:57:40');
INSERT INTO `sys_log` VALUES ('660', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{\"code\":\"0033\",\"minnum\":30,\"model\":\"\",\"name\":\"草莓\",\"producer\":\"农夫山庄\",\"purchasingprice\":20.0,\"remarks\":\"\",\"typeid\":12,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-06-18 14:56:58');
INSERT INTO `sys_log` VALUES ('661', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1560841160000,\"damagenumber\":\"\",\"remarks\":\"hahaha\"}', '0:0:0:0:0:0:0:1', '2019-06-18 15:00:24');
INSERT INTO `sys_log` VALUES ('662', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-06-18 15:07:36');
INSERT INTO `sys_log` VALUES ('663', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-18 15:09:42');
INSERT INTO `sys_log` VALUES ('664', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1560842003000,\"damagenumber\":\"\",\"remarks\":\"ddssaa\"}', '0:0:0:0:0:0:0:1', '2019-06-18 15:13:20');
INSERT INTO `sys_log` VALUES ('665', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-06-18 15:16:41');
INSERT INTO `sys_log` VALUES ('666', 'admin', '修改用户', 'com.erpdemo.controller.TGoodsController.update()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delfalge\":0,\"id\":1,\"inventoryquantity\":171,\"lastpurchasingprice\":8.0,\"minnum\":1000,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油辣椒\",\"producer\":\"贵州省贵阳南明老干妈风味食品有限公司\",\"purchasingprice\":6.0,\"remarks\":\"好卖\",\"sellingprice\":8.0,\"state\":2,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-18 15:19:28');
INSERT INTO `sys_log` VALUES ('667', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":62,\"name\":\"商品报溢单查询\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-06-18 15:21:00');
INSERT INTO `sys_log` VALUES ('668', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560836851000,\"damagedate\":1559627233000,\"damagenumber\":\"BS201712130005\",\"delflag\":0,\"id\":5,\"remarks\":\"比比划划aassdd\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-18 15:31:10');
INSERT INTO `sys_log` VALUES ('669', 'admin', '修改用户', 'com.erpdemo.controller.TGoodsController.update()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delfalge\":0,\"id\":1,\"inventoryquantity\":171,\"lastpurchasingprice\":8.0,\"minnum\":1001,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉\",\"producer\":\"贵州省贵阳南明老干妈风味的食品有限公司\",\"purchasingprice\":7.0,\"remarks\":\"好卖又好吃\",\"sellingprice\":8.0,\"state\":2,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-18 15:32:54');
INSERT INTO `sys_log` VALUES ('670', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560836851000,\"damagedate\":1559627233000,\"damagenumber\":\"BS201712130005\",\"delflag\":0,\"id\":5,\"remarks\":\"比比划划aaass\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-18 15:35:23');
INSERT INTO `sys_log` VALUES ('671', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[42]', '0:0:0:0:0:0:0:1', '2019-06-18 15:35:56');
INSERT INTO `sys_log` VALUES ('672', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[42]', '0:0:0:0:0:0:0:1', '2019-06-18 15:54:14');
INSERT INTO `sys_log` VALUES ('673', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-06-18 15:56:03');
INSERT INTO `sys_log` VALUES ('674', 'admin', '修改用户', 'com.erpdemo.controller.TGoodsController.update()', '{\"addtime\":1560836793000,\"code\":\"0029\",\"delfalge\":0,\"id\":40,\"inventoryquantity\":20,\"lastpurchasingprice\":212.0,\"minnum\":23,\"model\":\"70g装\",\"name\":\"德芙\",\"producer\":\"巧克力工厂\",\"purchasingprice\":9.0,\"remarks\":\"\",\"sellingprice\":10.0,\"typeid\":11,\"unit\":\"条\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-18 15:59:13');
INSERT INTO `sys_log` VALUES ('675', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[37]', '0:0:0:0:0:0:0:1', '2019-06-18 15:59:26');
INSERT INTO `sys_log` VALUES ('676', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-06-18 16:04:15');
INSERT INTO `sys_log` VALUES ('677', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-06-18 16:08:25');
INSERT INTO `sys_log` VALUES ('678', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":62,\"name\":\"商品报溢\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-06-18 16:12:25');
INSERT INTO `sys_log` VALUES ('679', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-06-18 16:17:07');
INSERT INTO `sys_log` VALUES ('680', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2019-06-18 16:20:26');
INSERT INTO `sys_log` VALUES ('681', 'admin', '删除用户', 'com.erpdemo.controller.TGoodsController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2019-06-18 16:25:10');
INSERT INTO `sys_log` VALUES ('682', 'admin', '修改用户', 'com.erpdemo.controller.TGoodsController.update()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"id\":2,\"inventoryquantity\":140,\"lastpurchasingprice\":2220.0,\"minnum\":400,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"producer\":\"华为计算机系统有限公司\",\"purchasingprice\":1956.0,\"remarks\":\"热销\",\"sellingprice\":2200.0,\"state\":2,\"typeid\":16,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-18 16:32:38');
INSERT INTO `sys_log` VALUES ('683', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-18 16:54:23');
INSERT INTO `sys_log` VALUES ('684', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-18 17:47:56');
INSERT INTO `sys_log` VALUES ('685', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-06-18 18:45:50');
INSERT INTO `sys_log` VALUES ('686', 'admin', '删除用户', 'com.erpdemo.controller.SysProductController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-06-18 18:47:09');
INSERT INTO `sys_log` VALUES ('687', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-06-18 18:48:15');
INSERT INTO `sys_log` VALUES ('688', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[18]', '0:0:0:0:0:0:0:1', '2019-06-18 18:52:55');
INSERT INTO `sys_log` VALUES ('689', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[18]', '0:0:0:0:0:0:0:1', '2019-06-18 18:57:31');
INSERT INTO `sys_log` VALUES ('690', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[12]', '0:0:0:0:0:0:0:1', '2019-06-18 19:17:49');
INSERT INTO `sys_log` VALUES ('691', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-06-18 19:18:07');
INSERT INTO `sys_log` VALUES ('692', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[12]', '0:0:0:0:0:0:0:1', '2019-06-18 19:20:48');
INSERT INTO `sys_log` VALUES ('693', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-06-18 19:20:55');
INSERT INTO `sys_log` VALUES ('694', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-06-18 19:21:31');
INSERT INTO `sys_log` VALUES ('695', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[8,7]', '0:0:0:0:0:0:0:1', '2019-06-18 19:24:55');
INSERT INTO `sys_log` VALUES ('696', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[9,6]', '0:0:0:0:0:0:0:1', '2019-06-18 19:41:04');
INSERT INTO `sys_log` VALUES ('697', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-18 19:53:17');
INSERT INTO `sys_log` VALUES ('698', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560873600000,\"overflownumber\":\"dADFDS\",\"remarks\":\"ADFADF\"}', '0:0:0:0:0:0:0:1', '2019-06-19 08:37:09');
INSERT INTO `sys_log` VALUES ('699', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560873600000,\"overflownumber\":\"dafdf\",\"remarks\":\"adfaf\"}', '0:0:0:0:0:0:0:1', '2019-06-19 08:40:06');
INSERT INTO `sys_log` VALUES ('700', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1560182400000,\"damagenumber\":\"BS201906190012\",\"remarks\":\"lalalll\"}', '0:0:0:0:0:0:0:1', '2019-06-19 08:50:30');
INSERT INTO `sys_log` VALUES ('701', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"大连\",\"contact\":\"孙家旭\",\"name\":\"大连大\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 09:54:31');
INSERT INTO `sys_log` VALUES ('702', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"大连\",\"contact\":\"孙家旭\",\"name\":\"大连程余商贸\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 09:56:34');
INSERT INTO `sys_log` VALUES ('703', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[41]', '0:0:0:0:0:0:0:1', '2019-06-19 10:03:37');
INSERT INTO `sys_log` VALUES ('704', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-06-19 10:03:52');
INSERT INTO `sys_log` VALUES ('705', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"mtr\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:06:11');
INSERT INTO `sys_log` VALUES ('706', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"mtr\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:06:42');
INSERT INTO `sys_log` VALUES ('707', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560700800000,\"overflownumber\":\"dasfa\",\"remarks\":\"1`2314341454\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:26:33');
INSERT INTO `sys_log` VALUES ('708', 'admin', '修改用户', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560911269000,\"delflag\":0,\"id\":20,\"overflowdate\":1560787200000,\"overflownumber\":\"123134514514\",\"remarks\":\"fdgathqt\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 10:26:52');
INSERT INTO `sys_log` VALUES ('709', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560700800000,\"overflownumber\":\"adfafafdf\",\"remarks\":\"1233414\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:35:21');
INSERT INTO `sys_log` VALUES ('710', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560911798000,\"delflag\":0,\"id\":21,\"overflowdate\":1559750400000,\"overflownumber\":\"1234145565\",\"remarks\":\"gfhywtryj\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 10:35:36');
INSERT INTO `sys_log` VALUES ('711', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[21]', '0:0:0:0:0:0:0:1', '2019-06-19 10:36:48');
INSERT INTO `sys_log` VALUES ('712', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[19]', '0:0:0:0:0:0:0:1', '2019-06-19 10:36:54');
INSERT INTO `sys_log` VALUES ('713', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1559543330000,\"delflag\":0,\"id\":17,\"overflowdate\":1559491200000,\"overflownumber\":\"qwer\",\"remarks\":\"3456\",\"userid\":8}', '0:0:0:0:0:0:0:1', '2019-06-19 10:37:23');
INSERT INTO `sys_log` VALUES ('714', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560787200000,\"overflownumber\":\"12344515\",\"remarks\":\"qererqer\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:42:07');
INSERT INTO `sys_log` VALUES ('715', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560912203000,\"delflag\":0,\"id\":22,\"overflowdate\":1560787200000,\"overflownumber\":\"qrqerqerqer\",\"remarks\":\"13413241324\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 10:42:20');
INSERT INTO `sys_log` VALUES ('716', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560912203000,\"delflag\":0,\"id\":22,\"overflowdate\":1560787200000,\"overflownumber\":\"qerqerqre\",\"remarks\":\"12331414\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 10:44:27');
INSERT INTO `sys_log` VALUES ('717', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflownumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:46:29');
INSERT INTO `sys_log` VALUES ('718', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560912465000,\"delflag\":0,\"id\":23,\"overflowdate\":1560873600000,\"overflownumber\":\"qewrqqer\",\"remarks\":\"3145145\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 10:46:49');
INSERT INTO `sys_log` VALUES ('719', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560912465000,\"delflag\":0,\"id\":23,\"overflowdate\":1560873600000,\"overflownumber\":\"14514545\",\"remarks\":\"1451451\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 10:49:18');
INSERT INTO `sys_log` VALUES ('720', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560912465000,\"delflag\":0,\"id\":23,\"overflowdate\":1560873600000,\"overflownumber\":\"qerqerqe\",\"remarks\":\"qewrqwreqre\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 10:50:06');
INSERT INTO `sys_log` VALUES ('721', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-06-19 10:50:14');
INSERT INTO `sys_log` VALUES ('722', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-06-19 10:50:21');
INSERT INTO `sys_log` VALUES ('723', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-06-19 10:53:04');
INSERT INTO `sys_log` VALUES ('724', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560912203000,\"delflag\":0,\"id\":22,\"overflowdate\":1560787200000,\"overflownumber\":\"BY1906190001\",\"remarks\":\"ZSY001\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 10:53:41');
INSERT INTO `sys_log` VALUES ('725', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:54:53');
INSERT INTO `sys_log` VALUES ('726', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:54:58');
INSERT INTO `sys_log` VALUES ('727', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:57:37');
INSERT INTO `sys_log` VALUES ('728', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"123\"}', '0:0:0:0:0:0:0:1', '2019-06-19 10:59:53');
INSERT INTO `sys_log` VALUES ('729', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560873600000,\"overflownumber\":\"adfdf\",\"remarks\":\"adfadf\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:00:07');
INSERT INTO `sys_log` VALUES ('730', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560913284000,\"delflag\":0,\"id\":24,\"overflowdate\":1560873600000,\"overflownumber\":\"13413243\",\"remarks\":\"1324134\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:00:18');
INSERT INTO `sys_log` VALUES ('731', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[24]', '0:0:0:0:0:0:0:1', '2019-06-19 11:00:23');
INSERT INTO `sys_log` VALUES ('732', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560787200000,\"overflownumber\":\"ZSY0001\",\"remarks\":\"ZST0001\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:05:55');
INSERT INTO `sys_log` VALUES ('733', 'admin', '修改', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1560913632000,\"delflag\":0,\"id\":25,\"overflowdate\":1560787200000,\"overflownumber\":\"ZSY99990\",\"remarks\":\"ZST00009999\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:06:16');
INSERT INTO `sys_log` VALUES ('734', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListController.delete()', '[25]', '0:0:0:0:0:0:0:1', '2019-06-19 11:06:23');
INSERT INTO `sys_log` VALUES ('735', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:08:49');
INSERT INTO `sys_log` VALUES ('736', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"大连\",\"addtime\":1560909394000,\"contact\":\"孙家\",\"delflag\":0,\"id\":28,\"name\":\"大连程余商贸\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:11:27');
INSERT INTO `sys_log` VALUES ('737', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:13:18');
INSERT INTO `sys_log` VALUES ('738', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:14:14');
INSERT INTO `sys_log` VALUES ('739', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"南京鼓楼区世纪大楼123号\",\"addtime\":1558675614000,\"contact\":\"小三\",\"delflag\":0,\"id\":12,\"name\":\"南京大王科技\",\"num\":\"1\",\"remarks\":\"123\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:17:23');
INSERT INTO `sys_log` VALUES ('740', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[28,12]', '0:0:0:0:0:0:0:1', '2019-06-19 11:18:07');
INSERT INTO `sys_log` VALUES ('741', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":133.0,\"amountpayable\":133.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:19:44');
INSERT INTO `sys_log` VALUES ('742', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560905508000,\"damagedate\":1560182400000,\"damagenumber\":\"BS201906190012\",\"delflag\":0,\"id\":7,\"remarks\":\"lalalllaa\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:21:49');
INSERT INTO `sys_log` VALUES ('743', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:23:04');
INSERT INTO `sys_log` VALUES ('744', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560905508000,\"damagedate\":1560182400000,\"damagenumber\":\"BS201906190012\",\"delflag\":0,\"id\":7,\"remarks\":\"lalalll\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:24:22');
INSERT INTO `sys_log` VALUES ('745', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560905508000,\"damagedate\":1528646400000,\"damagenumber\":\"BS201906190013\",\"delflag\":0,\"id\":7,\"remarks\":\"lalahhh\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:24:41');
INSERT INTO `sys_log` VALUES ('746', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"请问\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:25:21');
INSERT INTO `sys_log` VALUES ('747', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-06-19 11:27:35');
INSERT INTO `sys_log` VALUES ('748', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560836851000,\"damagedate\":1559750400000,\"damagenumber\":\"BS201712130005\",\"delflag\":0,\"id\":5,\"remarks\":\"比比划划aaassaaa\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:28:23');
INSERT INTO `sys_log` VALUES ('749', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[41]', '0:0:0:0:0:0:0:1', '2019-06-19 11:28:30');
INSERT INTO `sys_log` VALUES ('750', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[41]', '0:0:0:0:0:0:0:1', '2019-06-19 11:28:37');
INSERT INTO `sys_log` VALUES ('751', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[41]', '0:0:0:0:0:0:0:1', '2019-06-19 11:31:45');
INSERT INTO `sys_log` VALUES ('752', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[41]', '0:0:0:0:0:0:0:1', '2019-06-19 11:31:54');
INSERT INTO `sys_log` VALUES ('753', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[41]', '0:0:0:0:0:0:0:1', '2019-06-19 11:34:31');
INSERT INTO `sys_log` VALUES ('754', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[41]', '0:0:0:0:0:0:0:1', '2019-06-19 11:37:47');
INSERT INTO `sys_log` VALUES ('755', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560836851000,\"damagedate\":1559750400000,\"damagenumber\":\"BS201712130005\",\"delflag\":0,\"id\":5,\"remarks\":\"比比划划\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:41:44');
INSERT INTO `sys_log` VALUES ('756', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"addtime\":1560836851000,\"damagedate\":1559750400000,\"damagenumber\":\"BS201712130005\",\"delflag\":0,\"remarks\":\"比比划划aa\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 11:41:56');
INSERT INTO `sys_log` VALUES ('757', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560787200000,\"overflownumber\":\"adfa\",\"remarks\":\"adfa\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:44:54');
INSERT INTO `sys_log` VALUES ('758', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560182400000,\"overflownumber\":\"dsfa\",\"remarks\":\"adfdf\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:49:30');
INSERT INTO `sys_log` VALUES ('759', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:52:03');
INSERT INTO `sys_log` VALUES ('760', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:53:26');
INSERT INTO `sys_log` VALUES ('761', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:55:49');
INSERT INTO `sys_log` VALUES ('762', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 11:57:58');
INSERT INTO `sys_log` VALUES ('763', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 12:00:32');
INSERT INTO `sys_log` VALUES ('764', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560915794000,\"damagedate\":1559750400000,\"damagenumber\":\"BS201712130005\",\"delflag\":0,\"id\":8,\"remarks\":\"比比划划\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 13:40:23');
INSERT INTO `sys_log` VALUES ('765', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560787200000,\"overflownumber\":\"\",\"remarks\":\"12312\"}', '0:0:0:0:0:0:0:1', '2019-06-19 13:40:36');
INSERT INTO `sys_log` VALUES ('766', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560915794000,\"damagedate\":1559750400000,\"damagenumber\":\"BS201712130005\",\"delflag\":0,\"id\":8,\"remarks\":\"比比划划asd\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 13:40:36');
INSERT INTO `sys_log` VALUES ('767', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"addtime\":1560915794000,\"damagedate\":1560268800000,\"damagenumber\":\"BS201906190014\",\"delflag\":0,\"remarks\":\"zzzz\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 13:41:08');
INSERT INTO `sys_log` VALUES ('768', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[2]', '0:0:0:0:0:0:0:1', '2019-06-19 13:42:51');
INSERT INTO `sys_log` VALUES ('769', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"南京市下关区金陵小区6村27-2-203室\",\"addtime\":1558675610000,\"contact\":\"小四\",\"delflag\":0,\"id\":10,\"name\":\"南京市下关区红鹰调味品商行\",\"num\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 13:47:15');
INSERT INTO `sys_log` VALUES ('770', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560922946000,\"damagedate\":1560268800000,\"damagenumber\":\"BS201906190014\",\"delflag\":0,\"id\":9,\"remarks\":\"zzzzdd\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 13:51:46');
INSERT INTO `sys_log` VALUES ('771', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560873600000,\"overflownumber\":\"\",\"remarks\":\"aferqe\"}', '0:0:0:0:0:0:0:1', '2019-06-19 13:59:42');
INSERT INTO `sys_log` VALUES ('772', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560787200000,\"overflownumber\":\"\",\"remarks\":\"agfrqreq\"}', '0:0:0:0:0:0:0:1', '2019-06-19 13:59:54');
INSERT INTO `sys_log` VALUES ('773', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560873600000,\"overflownumber\":\"\",\"remarks\":\"12312344\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:06:15');
INSERT INTO `sys_log` VALUES ('774', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560787200000,\"overflownumber\":\"\",\"remarks\":\"31413\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:06:21');
INSERT INTO `sys_log` VALUES ('775', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560096000000,\"overflownumber\":\"\",\"remarks\":\"134134\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:06:28');
INSERT INTO `sys_log` VALUES ('776', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"南京市下关区金陵小区6村27-2-203室\",\"addtime\":1558675610000,\"contact\":\"小五\",\"delflag\":0,\"id\":10,\"name\":\"南京市下关区红鹰调味品商行\",\"num\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 14:06:42');
INSERT INTO `sys_log` VALUES ('777', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560787200000,\"overflownumber\":\"\",\"remarks\":\"qweqwe\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:08:43');
INSERT INTO `sys_log` VALUES ('778', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"ad\",\"contact\":\"asd\",\"name\":\"asd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:13:20');
INSERT INTO `sys_log` VALUES ('779', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"荔浦县荔塔路１６－３６号\",\"addtime\":1558675612000,\"contact\":\"亲1\",\"delflag\":0,\"id\":11,\"name\":\"桂林阜康食品工业有限公司\",\"num\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 14:13:28');
INSERT INTO `sys_log` VALUES ('780', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"阿斯顿\",\"contact\":\"阿斯顿\",\"name\":\"阿斯顿\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:17:39');
INSERT INTO `sys_log` VALUES ('781', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"asd\",\"contact\":\"asd\",\"name\":\"asd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:20:27');
INSERT INTO `sys_log` VALUES ('782', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"asd\",\"contact\":\"asd\",\"name\":\"asd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:21:59');
INSERT INTO `sys_log` VALUES ('783', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"asd\",\"contact\":\"asd\",\"name\":\"asd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:25:17');
INSERT INTO `sys_log` VALUES ('784', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-06-19 14:25:51');
INSERT INTO `sys_log` VALUES ('785', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560873600000,\"overflownumber\":\"\",\"remarks\":\"qweqwr\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:30:32');
INSERT INTO `sys_log` VALUES ('786', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"ads\",\"contact\":\"asd\",\"name\":\"asd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:31:43');
INSERT INTO `sys_log` VALUES ('787', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560700800000,\"overflownumber\":\"\",\"remarks\":\"wqfgarfg\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:32:46');
INSERT INTO `sys_log` VALUES ('788', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"ads\",\"contact\":\"asd\",\"name\":\"asd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:36:12');
INSERT INTO `sys_log` VALUES ('789', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"asd\",\"contact\":\"asd\",\"name\":\"asd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:36:57');
INSERT INTO `sys_log` VALUES ('790', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"asd\",\"contact\":\"asd\",\"name\":\"asd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 14:56:48');
INSERT INTO `sys_log` VALUES ('791', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"aasd\",\"contact\":\"asd\",\"name\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:08:39');
INSERT INTO `sys_log` VALUES ('792', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"大连\",\"addtime\":1560909394000,\"contact\":\"孙家旭\",\"delflag\":0,\"id\":28,\"name\":\"大连程余商贸\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 15:09:19');
INSERT INTO `sys_log` VALUES ('793', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"荔浦县荔塔路１６－３６号\",\"addtime\":1558675612000,\"contact\":\"亲琴\",\"delflag\":0,\"id\":11,\"name\":\"桂林阜康食品工业有限公司\",\"num\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 15:09:31');
INSERT INTO `sys_log` VALUES ('794', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"荔浦县荔塔路１６－３６号\",\"addtime\":1558675612000,\"contact\":\"亲琴1\",\"delflag\":0,\"id\":11,\"name\":\"桂林阜康食品工业有限公司\",\"num\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 15:09:41');
INSERT INTO `sys_log` VALUES ('795', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-19 15:13:45');
INSERT INTO `sys_log` VALUES ('796', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-19 15:13:39');
INSERT INTO `sys_log` VALUES ('797', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"name\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:13:45');
INSERT INTO `sys_log` VALUES ('798', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"contact\":\"ee\",\"name\":\"da\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:13:52');
INSERT INTO `sys_log` VALUES ('799', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"contact\":\"ee\",\"name\":\"da\",\"num\":\"123\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:13:57');
INSERT INTO `sys_log` VALUES ('800', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"cc\",\"contact\":\"aa\",\"name\":\"tt\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:16:20');
INSERT INTO `sys_log` VALUES ('801', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"x\",\"contact\":\"s\",\"name\":\"a\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:17:45');
INSERT INTO `sys_log` VALUES ('802', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:18:18');
INSERT INTO `sys_log` VALUES ('803', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-19 15:18:32');
INSERT INTO `sys_log` VALUES ('804', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:19:23');
INSERT INTO `sys_log` VALUES ('805', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:21:03');
INSERT INTO `sys_log` VALUES ('806', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560787200000,\"remarks\":\"qqweewr\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:21:06');
INSERT INTO `sys_log` VALUES ('807', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-19 15:24:48');
INSERT INTO `sys_log` VALUES ('808', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"contact\":\"eee\",\"name\":\"er\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:26:05');
INSERT INTO `sys_log` VALUES ('809', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"西街\",\"contact\":\"无奈\",\"name\":\"无语\",\"num\":\"19565648456\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:26:35');
INSERT INTO `sys_log` VALUES ('810', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"33\",\"name\":\"rr\",\"num\":33.0,\"price\":22.0,\"typeid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 15:28:34');
INSERT INTO `sys_log` VALUES ('811', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"西街\",\"contact\":\"无奈\",\"name\":\"无语\",\"num\":\"19565648456\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:27:53');
INSERT INTO `sys_log` VALUES ('812', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"contact\":\"无奈\",\"name\":\"无语\",\"num\":\"19565648456\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:27:56');
INSERT INTO `sys_log` VALUES ('813', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"无奈\",\"name\":\"无语\",\"num\":\"\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:28:02');
INSERT INTO `sys_log` VALUES ('814', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"1\",\"num\":\"\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:28:10');
INSERT INTO `sys_log` VALUES ('815', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[30]', '0:0:0:0:0:0:0:1', '2019-06-19 15:32:40');
INSERT INTO `sys_log` VALUES ('816', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[29]', '0:0:0:0:0:0:0:1', '2019-06-19 15:32:45');
INSERT INTO `sys_log` VALUES ('817', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"无奈\",\"name\":\"南通\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:31:37');
INSERT INTO `sys_log` VALUES ('818', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"无奈\",\"name\":\"南通\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:31:54');
INSERT INTO `sys_log` VALUES ('819', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"林翌青\",\"contact\":\"林翌青\",\"name\":\"林翌青\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:33:41');
INSERT INTO `sys_log` VALUES ('820', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"林翌青\",\"addtime\":1560929621000,\"contact\":\"林翌青啊\",\"delflag\":0,\"id\":31,\"name\":\"林翌青\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 15:33:47');
INSERT INTO `sys_log` VALUES ('821', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-19 15:32:07');
INSERT INTO `sys_log` VALUES ('822', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"大连\",\"addtime\":1560909394000,\"contact\":\"孙家旭1\",\"delflag\":0,\"id\":28,\"name\":\"大连程余商贸\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 15:39:30');
INSERT INTO `sys_log` VALUES ('823', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"开发区学府大街十号\",\"addtime\":1560909394000,\"contact\":\"孙家旭\",\"delflag\":0,\"id\":28,\"name\":\"大连程余商贸\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 15:39:45');
INSERT INTO `sys_log` VALUES ('824', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"林清\",\"contact\":\"林观云\",\"name\":\"林肆玖\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:40:59');
INSERT INTO `sys_log` VALUES ('825', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[12]', '0:0:0:0:0:0:0:1', '2019-06-19 15:41:17');
INSERT INTO `sys_log` VALUES ('826', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-19 15:43:06');
INSERT INTO `sys_log` VALUES ('827', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"无奈\",\"name\":\"南通\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:43:23');
INSERT INTO `sys_log` VALUES ('828', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"无奈\",\"name\":\"南通\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 15:43:35');
INSERT INTO `sys_log` VALUES ('829', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-19 15:43:39');
INSERT INTO `sys_log` VALUES ('830', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-19 15:50:11');
INSERT INTO `sys_log` VALUES ('831', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-19 15:54:22');
INSERT INTO `sys_log` VALUES ('832', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-19 15:55:50');
INSERT INTO `sys_log` VALUES ('833', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"无奈\",\"name\":\"南通\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:00:36');
INSERT INTO `sys_log` VALUES ('834', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"圆通\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:15:59');
INSERT INTO `sys_log` VALUES ('835', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1234.0,\"amountpayable\":1234.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:18:12');
INSERT INTO `sys_log` VALUES ('836', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1234.0,\"amountpayable\":1234.0,\"remarks\":\"圆通\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:19:36');
INSERT INTO `sys_log` VALUES ('837', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:22:55');
INSERT INTO `sys_log` VALUES ('838', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:23:51');
INSERT INTO `sys_log` VALUES ('839', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123456.0,\"amountpayable\":123456.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:26:01');
INSERT INTO `sys_log` VALUES ('840', 'admin', '删除用户', 'com.erpdemo.controller.SysOverflowListGoodsController.delete()', '[12]', '0:0:0:0:0:0:0:1', '2019-06-19 16:26:01');
INSERT INTO `sys_log` VALUES ('841', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"无奈\",\"name\":\"南通\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:25:36');
INSERT INTO `sys_log` VALUES ('842', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-19 16:25:47');
INSERT INTO `sys_log` VALUES ('843', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[103]', '0:0:0:0:0:0:0:1', '2019-06-19 16:32:03');
INSERT INTO `sys_log` VALUES ('844', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[102]', '0:0:0:0:0:0:0:1', '2019-06-19 16:32:06');
INSERT INTO `sys_log` VALUES ('845', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[101]', '0:0:0:0:0:0:0:1', '2019-06-19 16:32:09');
INSERT INTO `sys_log` VALUES ('846', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[100]', '0:0:0:0:0:0:0:1', '2019-06-19 16:32:12');
INSERT INTO `sys_log` VALUES ('847', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"圆通\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:33:48');
INSERT INTO `sys_log` VALUES ('848', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12355.0,\"amountpayable\":12355.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:34:10');
INSERT INTO `sys_log` VALUES ('849', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12.0,\"amountpayable\":12.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:34:36');
INSERT INTO `sys_log` VALUES ('850', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[30]', '0:0:0:0:0:0:0:1', '2019-06-19 16:36:19');
INSERT INTO `sys_log` VALUES ('851', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"琴琴\",\"contact\":\"琴琴\",\"name\":\"琴琴\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:40:01');
INSERT INTO `sys_log` VALUES ('852', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[33]', '0:0:0:0:0:0:0:1', '2019-06-19 16:40:07');
INSERT INTO `sys_log` VALUES ('853', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"开发区学府大街十号\",\"addtime\":1560909394000,\"contact\":\"孙家旭\",\"delflag\":0,\"id\":28,\"name\":\"大连程余商贸公司\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-19 16:40:16');
INSERT INTO `sys_log` VALUES ('854', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1560182400000,\"damagenumber\":\"BS201906190008\",\"remarks\":\"我的麦克风\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:44:21');
INSERT INTO `sys_log` VALUES ('855', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123123.0,\"amountpayable\":123123.0,\"remarks\":\"上传\"}', '0:0:0:0:0:0:0:1', '2019-06-19 16:53:30');
INSERT INTO `sys_log` VALUES ('856', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[107]', '0:0:0:0:0:0:0:1', '2019-06-19 16:54:09');
INSERT INTO `sys_log` VALUES ('857', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[106,105,104]', '0:0:0:0:0:0:0:1', '2019-06-19 16:54:14');
INSERT INTO `sys_log` VALUES ('858', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{\"code\":\"安眠\",\"minnum\":40,\"model\":\"\",\"name\":\"精油\",\"producer\":\"阿芙\",\"purchasingprice\":20.0,\"remarks\":\"薰衣草味道\",\"typeid\":24,\"unit\":\"3\"}', '0:0:0:0:0:0:0:1', '2019-06-20 08:40:25');
INSERT INTO `sys_log` VALUES ('859', 'admin', '保存', 'com.erpdemo.controller.TGoodsController.save()', '{\"code\":\"夏日专属\",\"minnum\":10,\"model\":\"\",\"name\":\"碎碎冰\",\"producer\":\"旺仔\",\"purchasingprice\":3.0,\"remarks\":\"和夏天更配哦\",\"typeid\":11,\"unit\":\"条\"}', '0:0:0:0:0:0:0:1', '2019-06-20 08:43:10');
INSERT INTO `sys_log` VALUES ('860', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"数据导入\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/fileupload.html\"}', '0:0:0:0:0:0:0:1', '2019-06-20 08:56:16');
INSERT INTO `sys_log` VALUES ('861', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"南北\",\"name\":\"无那\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 09:13:12');
INSERT INTO `sys_log` VALUES ('862', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"南北\",\"name\":\"无那\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 09:13:20');
INSERT INTO `sys_log` VALUES ('863', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-20 09:13:24');
INSERT INTO `sys_log` VALUES ('864', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"多的\",\"name\":\"大\",\"num\":\"12344456788\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 09:20:01');
INSERT INTO `sys_log` VALUES ('865', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"多的\",\"name\":\"大\",\"num\":\"12344456788\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 09:20:11');
INSERT INTO `sys_log` VALUES ('866', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-20 09:20:16');
INSERT INTO `sys_log` VALUES ('867', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"lin\",\"contact\":\"lin\",\"name\":\"lin\"}', '0:0:0:0:0:0:0:1', '2019-06-20 10:05:00');
INSERT INTO `sys_log` VALUES ('868', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"lin\",\"addtime\":1560996300000,\"contact\":\"lin1\",\"delflag\":0,\"id\":34,\"name\":\"lin\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 10:05:05');
INSERT INTO `sys_log` VALUES ('869', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[34]', '0:0:0:0:0:0:0:1', '2019-06-20 10:05:09');
INSERT INTO `sys_log` VALUES ('870', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"2019红米Note\",\"name\":\"小米手机\",\"num\":2.0,\"price\":2000.0,\"typeid\":3}', '0:0:0:0:0:0:0:1', '2019-06-20 10:34:39');
INSERT INTO `sys_log` VALUES ('871', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"大\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 10:45:13');
INSERT INTO `sys_log` VALUES ('872', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"南通通州新金路888号\",\"addtime\":1558334053000,\"contact\":\"王二\",\"id\":4,\"name\":\"南通通州综艺集团\",\"num\":\"1832132321\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 10:45:31');
INSERT INTO `sys_log` VALUES ('873', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-20 10:45:36');
INSERT INTO `sys_log` VALUES ('874', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"大\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 10:49:16');
INSERT INTO `sys_log` VALUES ('875', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-20 10:49:26');
INSERT INTO `sys_log` VALUES ('876', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-20 11:01:31');
INSERT INTO `sys_log` VALUES ('877', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"大\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 11:07:30');
INSERT INTO `sys_log` VALUES ('878', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"南通通州新金路888号\",\"addtime\":1558334053000,\"contact\":\"王二\",\"id\":4,\"name\":\"南通通州综艺集团\",\"num\":\"1832132321\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 11:07:38');
INSERT INTO `sys_log` VALUES ('879', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-20 11:07:43');
INSERT INTO `sys_log` VALUES ('880', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"a\",\"name\":\"q\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 11:14:11');
INSERT INTO `sys_log` VALUES ('881', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"大\",\"num\":\"\",\"remarks\":\"\"}', '127.0.0.1', '2019-06-20 11:17:55');
INSERT INTO `sys_log` VALUES ('882', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"da\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 11:19:23');
INSERT INTO `sys_log` VALUES ('883', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-20 11:19:46');
INSERT INTO `sys_log` VALUES ('884', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"da\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 11:22:12');
INSERT INTO `sys_log` VALUES ('885', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"南通通州新金路888号\",\"addtime\":1558334053000,\"contact\":\"王二小\",\"id\":4,\"name\":\"南通通州综艺集团\",\"num\":\"1832132321\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 11:22:18');
INSERT INTO `sys_log` VALUES ('886', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-06-20 11:22:22');
INSERT INTO `sys_log` VALUES ('887', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"dd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 11:24:45');
INSERT INTO `sys_log` VALUES ('888', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"aa\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 11:26:39');
INSERT INTO `sys_log` VALUES ('889', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"dd\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 11:29:32');
INSERT INTO `sys_log` VALUES ('890', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-06-20 11:31:13');
INSERT INTO `sys_log` VALUES ('891', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-06-20 11:31:18');
INSERT INTO `sys_log` VALUES ('892', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"addtime\":1561001372000,\"contact\":\"\",\"id\":6,\"name\":\"大连\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 11:31:49');
INSERT INTO `sys_log` VALUES ('893', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"烤烟型\",\"name\":\"红梅\",\"num\":2.0,\"price\":8.0,\"typeid\":2}', '0:0:0:0:0:0:0:1', '2019-06-20 11:36:59');
INSERT INTO `sys_log` VALUES ('894', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[6,5]', '0:0:0:0:0:0:0:1', '2019-06-20 11:36:41');
INSERT INTO `sys_log` VALUES ('895', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"addtime\":1561001372000,\"contact\":\"无限\",\"id\":6,\"name\":\"大连\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 11:37:14');
INSERT INTO `sys_log` VALUES ('896', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"aa\",\"addtime\":1561001372000,\"contact\":\"无限\",\"id\":6,\"name\":\"大连\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 11:37:36');
INSERT INTO `sys_log` VALUES ('897', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"\",\"name\":\"\",\"typeid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 11:40:28');
INSERT INTO `sys_log` VALUES ('898', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"b\",\"addtime\":1561001372000,\"contact\":\"aa\",\"id\":6,\"name\":\"大连\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 11:39:24');
INSERT INTO `sys_log` VALUES ('899', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[5]', '127.0.0.1', '2019-06-20 11:44:38');
INSERT INTO `sys_log` VALUES ('900', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"期初库存\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/inventory.html\"}', '0:0:0:0:0:0:0:1', '2019-06-20 13:49:08');
INSERT INTO `sys_log` VALUES ('901', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":132,\"name\":\"期初库存\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/inventory.html\"}', '0:0:0:0:0:0:0:1', '2019-06-20 13:50:10');
INSERT INTO `sys_log` VALUES ('902', 'admin', '保存', 'com.erpdemo.controller.SysOverflowListController.save()', '{\"overflowdate\":1560873600000,\"remarks\":\"qwarewe\"}', '0:0:0:0:0:0:0:1', '2019-06-20 13:52:47');
INSERT INTO `sys_log` VALUES ('903', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 13:54:49');
INSERT INTO `sys_log` VALUES ('904', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[108]', '0:0:0:0:0:0:0:1', '2019-06-20 13:55:10');
INSERT INTO `sys_log` VALUES ('905', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:04:48');
INSERT INTO `sys_log` VALUES ('906', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"顺丰\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:07:39');
INSERT INTO `sys_log` VALUES ('907', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":1123.0,\"remarks\":\"圆通\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:21:45');
INSERT INTO `sys_log` VALUES ('908', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"123\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:24:13');
INSERT INTO `sys_log` VALUES ('909', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1234.0,\"amountpayable\":1234.0,\"remarks\":\"快递啊\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:28:48');
INSERT INTO `sys_log` VALUES ('910', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1234.0,\"amountpayable\":1234.0,\"remarks\":\"快递啊\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:29:36');
INSERT INTO `sys_log` VALUES ('911', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":345.0,\"amountpayable\":345.0,\"remarks\":\"快递aaaa\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:30:32');
INSERT INTO `sys_log` VALUES ('912', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":234.0,\"amountpayable\":234.0,\"remarks\":\"王亚\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:31:52');
INSERT INTO `sys_log` VALUES ('913', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[116,115,114,113,112,111,110]', '0:0:0:0:0:0:0:1', '2019-06-20 14:32:15');
INSERT INTO `sys_log` VALUES ('914', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"ac\",\"name\":\"ac\",\"num\":2.0,\"price\":23.0,\"typeid\":2}', '0:0:0:0:0:0:0:1', '2019-06-20 14:33:23');
INSERT INTO `sys_log` VALUES ('915', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1717.0,\"amountpayable\":1717.0,\"remarks\":\"程东\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:34:43');
INSERT INTO `sys_log` VALUES ('916', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[117]', '0:0:0:0:0:0:0:1', '2019-06-20 14:35:22');
INSERT INTO `sys_log` VALUES ('917', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"note\",\"name\":\"红米\",\"num\":1.0,\"price\":1888.0,\"typeid\":2}', '0:0:0:0:0:0:0:1', '2019-06-20 14:44:26');
INSERT INTO `sys_log` VALUES ('918', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[30]', '0:0:0:0:0:0:0:1', '2019-06-20 14:46:51');
INSERT INTO `sys_log` VALUES ('919', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12314.0,\"amountpayable\":12345.0,\"remarks\":\"袁彤彤\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:50:12');
INSERT INTO `sys_log` VALUES ('920', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12323.0,\"amountpayable\":12323.0,\"remarks\":\"成功过过\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:51:44');
INSERT INTO `sys_log` VALUES ('921', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":546.0,\"amountpayable\":546.0,\"remarks\":\"wqeqw\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:52:47');
INSERT INTO `sys_log` VALUES ('922', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[120,119,118]', '0:0:0:0:0:0:0:1', '2019-06-20 14:53:16');
INSERT INTO `sys_log` VALUES ('923', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1234.0,\"amountpayable\":1234.0,\"remarks\":\"耍哈刷\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:55:06');
INSERT INTO `sys_log` VALUES ('924', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":5768.0,\"amountpayable\":6878.0,\"remarks\":\"asbdhaj\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:56:45');
INSERT INTO `sys_log` VALUES ('925', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":5768.0,\"amountpayable\":6878.0,\"remarks\":\"asbdhaj\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:57:17');
INSERT INTO `sys_log` VALUES ('926', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"remarks\":\"袜带回家\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:57:30');
INSERT INTO `sys_log` VALUES ('927', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12312.0,\"amountpayable\":12312.0,\"remarks\":\"是一个大\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:58:08');
INSERT INTO `sys_log` VALUES ('928', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123123.0,\"amountpayable\":123123.0,\"remarks\":\"夫妇\"}', '0:0:0:0:0:0:0:1', '2019-06-20 14:58:54');
INSERT INTO `sys_log` VALUES ('929', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123123.0,\"amountpayable\":123123.0,\"remarks\":\"萨嘎\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 15:00:01');
INSERT INTO `sys_log` VALUES ('930', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[124,123,122,121]', '0:0:0:0:0:0:0:1', '2019-06-20 15:03:07');
INSERT INTO `sys_log` VALUES ('931', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1234.0,\"amountpayable\":1234.0,\"remarks\":\"我将承担\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 15:04:01');
INSERT INTO `sys_log` VALUES ('932', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[34]', '0:0:0:0:0:0:0:1', '2019-06-20 15:10:46');
INSERT INTO `sys_log` VALUES ('933', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"\",\"remarks\":\"旺大坝\",\"state\":2}', '0:0:0:0:0:0:0:1', '2019-06-20 15:50:01');
INSERT INTO `sys_log` VALUES ('934', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"\",\"remarks\":\"撒大概\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 15:53:21');
INSERT INTO `sys_log` VALUES ('935', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"\",\"remarks\":\"啥的\",\"state\":2}', '0:0:0:0:0:0:0:1', '2019-06-20 16:03:15');
INSERT INTO `sys_log` VALUES ('936', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[128,127,126,125]', '0:0:0:0:0:0:0:1', '2019-06-20 16:03:22');
INSERT INTO `sys_log` VALUES ('937', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"JH201906209309\",\"remarks\":\"我去恶趣味\",\"state\":2}', '0:0:0:0:0:0:0:1', '2019-06-20 16:19:45');
INSERT INTO `sys_log` VALUES ('938', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"JH201906200467\",\"remarks\":\"王企鹅\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 16:22:57');
INSERT INTO `sys_log` VALUES ('939', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123123.0,\"amountpayable\":123123.0,\"purchasenumber\":\"JH201906202820\",\"remarks\":\"萨达哈\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 16:36:58');
INSERT INTO `sys_log` VALUES ('940', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[131]', '0:0:0:0:0:0:0:1', '2019-06-20 16:37:05');
INSERT INTO `sys_log` VALUES ('941', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"purchasenumber\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-20 16:45:25');
INSERT INTO `sys_log` VALUES ('942', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1234.0,\"amountpayable\":1234.0,\"purchasenumber\":\"JH201906209761\",\"remarks\":\"asdasd\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 16:51:56');
INSERT INTO `sys_log` VALUES ('943', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"JH201906200831\",\"remarks\":\"33\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 16:54:11');
INSERT INTO `sys_log` VALUES ('944', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"JH201906200417\",\"remarks\":\"wawdna\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 16:57:41');
INSERT INTO `sys_log` VALUES ('945', 'admin', '修改用户', 'com.erpdemo.controller.SysDamageListController.update()', '{\"addtime\":1560933939000,\"damagedate\":1560182400000,\"damagenumber\":\"BS201906190008\",\"delflag\":0,\"id\":10,\"remarks\":\"我的麦克风1111\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 18:19:30');
INSERT INTO `sys_log` VALUES ('946', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"addtime\":1560933939000,\"damagedate\":1560787200000,\"damagenumber\":\"BS201906200009\",\"delflag\":0,\"remarks\":\"lllll\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-20 18:19:57');
INSERT INTO `sys_log` VALUES ('947', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[34]', '0:0:0:0:0:0:0:1', '2019-06-20 19:05:35');
INSERT INTO `sys_log` VALUES ('948', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[35]', '0:0:0:0:0:0:0:1', '2019-06-20 19:10:36');
INSERT INTO `sys_log` VALUES ('949', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[34]', '0:0:0:0:0:0:0:1', '2019-06-20 19:18:05');
INSERT INTO `sys_log` VALUES ('950', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[33]', '0:0:0:0:0:0:0:1', '2019-06-20 19:28:49');
INSERT INTO `sys_log` VALUES ('951', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[33,35]', '0:0:0:0:0:0:0:1', '2019-06-20 19:29:22');
INSERT INTO `sys_log` VALUES ('952', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[32,36]', '0:0:0:0:0:0:0:1', '2019-06-20 19:29:43');
INSERT INTO `sys_log` VALUES ('953', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[30]', '0:0:0:0:0:0:0:1', '2019-06-20 19:30:00');
INSERT INTO `sys_log` VALUES ('954', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[29,31]', '0:0:0:0:0:0:0:1', '2019-06-20 19:30:21');
INSERT INTO `sys_log` VALUES ('955', 'admin', '删除报溢单', 'com.erpdemo.controller.SysOverflowListController.delete()', '[19]', '0:0:0:0:0:0:0:1', '2019-06-21 09:06:25');
INSERT INTO `sys_log` VALUES ('956', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123123.0,\"amountpayable\":123123.0,\"purchasenumber\":\"\",\"remarks\":\"王\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 09:27:59');
INSERT INTO `sys_log` VALUES ('957', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12314.0,\"amountpayable\":12314.0,\"purchasenumber\":\"\",\"remarks\":\"nuuh\",\"state\":2}', '0:0:0:0:0:0:0:1', '2019-06-21 09:52:37');
INSERT INTO `sys_log` VALUES ('958', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"plus\",\"name\":\"苹果x\",\"num\":20.0,\"price\":6999.0,\"typeid\":4}', '0:0:0:0:0:0:0:1', '2019-06-21 09:53:40');
INSERT INTO `sys_log` VALUES ('959', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"plus\",\"name\":\"苹果x\",\"num\":15.0,\"price\":6999.0,\"typeid\":4}', '0:0:0:0:0:0:0:1', '2019-06-21 09:53:55');
INSERT INTO `sys_log` VALUES ('960', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12314.0,\"amountpayable\":12314.0,\"purchasenumber\":\"\",\"remarks\":\"qwe\",\"state\":2}', '0:0:0:0:0:0:0:1', '2019-06-21 09:56:02');
INSERT INTO `sys_log` VALUES ('961', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12314.0,\"amountpayable\":12314.0,\"purchasenumber\":\"\",\"remarks\":\"qwe\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 09:56:33');
INSERT INTO `sys_log` VALUES ('962', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[144,143,142,141,139,138,132]', '0:0:0:0:0:0:0:1', '2019-06-21 09:56:57');
INSERT INTO `sys_log` VALUES ('963', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12314.0,\"amountpayable\":12314.0,\"purchasenumber\":\"\",\"remarks\":\"qwe\",\"state\":2}', '0:0:0:0:0:0:0:1', '2019-06-21 09:58:12');
INSERT INTO `sys_log` VALUES ('964', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"\",\"remarks\":\"qwer\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 09:59:03');
INSERT INTO `sys_log` VALUES ('965', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasenumber\":\"\",\"remarks\":\"123\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:03:50');
INSERT INTO `sys_log` VALUES ('966', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12311.0,\"amountpayable\":12311.0,\"purchasenumber\":\"\",\"remarks\":\"ghjj\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:05:02');
INSERT INTO `sys_log` VALUES ('967', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561082776000,\"amountpaid\":12344.0,\"amountpayable\":12344.0,\"delflag\":0,\"id\":148,\"purchasenumber\":\"\",\"remarks\":\"rty\",\"state\":1,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:08:20');
INSERT INTO `sys_log` VALUES ('968', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561082704000,\"amountpaid\":12366.0,\"amountpayable\":12366.0,\"delflag\":0,\"id\":147,\"purchasenumber\":\"\",\"remarks\":\"123\",\"state\":1,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:08:57');
INSERT INTO `sys_log` VALUES ('969', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561082418000,\"amountpaid\":12399.0,\"amountpayable\":12399.0,\"delflag\":0,\"id\":146,\"purchasenumber\":\"\",\"remarks\":\"asd\",\"state\":2,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:09:23');
INSERT INTO `sys_log` VALUES ('970', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[148,147,146,145]', '0:0:0:0:0:0:0:1', '2019-06-21 10:09:37');
INSERT INTO `sys_log` VALUES ('971', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561021137000,\"amountpaid\":12377.0,\"amountpayable\":12377.0,\"delflag\":0,\"id\":140,\"purchasenumber\":\"JH201906200417\",\"remarks\":\"Yui\",\"state\":2,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:09:56');
INSERT INTO `sys_log` VALUES ('972', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:10:57');
INSERT INTO `sys_log` VALUES ('973', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:11:59');
INSERT INTO `sys_log` VALUES ('974', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:14:05');
INSERT INTO `sys_log` VALUES ('975', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:16:28');
INSERT INTO `sys_log` VALUES ('976', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:19:32');
INSERT INTO `sys_log` VALUES ('977', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":4556.0,\"amountpayable\":4556.0,\"purchasenumber\":\"JH201906218840\",\"remarks\":\"ggg\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:19:58');
INSERT INTO `sys_log` VALUES ('978', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561083672000,\"amountpaid\":4560.0,\"amountpayable\":4560.0,\"delflag\":0,\"id\":149,\"purchasenumber\":\"JH201906218840\",\"remarks\":\"hhhh\",\"state\":2,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:20:17');
INSERT INTO `sys_log` VALUES ('979', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[149]', '0:0:0:0:0:0:0:1', '2019-06-21 10:20:27');
INSERT INTO `sys_log` VALUES ('980', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:23:56');
INSERT INTO `sys_log` VALUES ('981', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1559022258000,\"code\":\"0002\",\"delflag\":0,\"goodsid\":1,\"id\":10,\"model\":\"Note8\",\"name\":\"华为荣耀Note8\",\"num\":3.0,\"price\":2220.0,\"purchaselistid\":6,\"total\":4440.0,\"typeid\":1,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:24:14');
INSERT INTO `sys_log` VALUES ('982', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"34\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:28:36');
INSERT INTO `sys_log` VALUES ('983', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"38\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:29:53');
INSERT INTO `sys_log` VALUES ('984', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1561082112000,\"delflag\":0,\"id\":38,\"model\":\"plus\",\"name\":\"苹果x\",\"num\":12.0,\"price\":6999.0,\"total\":104985.0,\"typeid\":4,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:29:59');
INSERT INTO `sys_log` VALUES ('985', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"34\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:32:58');
INSERT INTO `sys_log` VALUES ('986', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1561002103000,\"delflag\":0,\"id\":34,\"model\":\"note\",\"name\":\"华为\",\"num\":2.0,\"price\":2333.0,\"typeid\":4,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:33:20');
INSERT INTO `sys_log` VALUES ('987', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"30\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:33:26');
INSERT INTO `sys_log` VALUES ('988', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1560928789000,\"delflag\":0,\"id\":30,\"model\":\"电脑\",\"name\":\"联想\",\"num\":2.0,\"price\":3433.0,\"typeid\":4,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:33:46');
INSERT INTO `sys_log` VALUES ('989', 'admin', '删除报溢单', 'com.erpdemo.controller.SysOverflowListController.delete()', '[21]', '0:0:0:0:0:0:0:1', '2019-06-21 10:43:02');
INSERT INTO `sys_log` VALUES ('990', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"38\"', '0:0:0:0:0:0:0:1', '2019-06-21 10:50:20');
INSERT INTO `sys_log` VALUES ('991', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1561082112000,\"delflag\":0,\"id\":38,\"model\":\"plus\",\"name\":\"苹果x\",\"num\":15.0,\"price\":6999.0,\"total\":104985.0,\"typeid\":4,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 10:50:23');
INSERT INTO `sys_log` VALUES ('992', 'admin', '删除报溢单', 'com.erpdemo.controller.SysOverflowListController.delete()', '[21]', '0:0:0:0:0:0:0:1', '2019-06-21 10:53:29');
INSERT INTO `sys_log` VALUES ('993', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561079978000,\"delflag\":0,\"id\":20,\"overflowdate\":1560960000000,\"overflownumber\":\"qerqwerqerq\",\"remarks\":\"12341324132341\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:02:41');
INSERT INTO `sys_log` VALUES ('994', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561079978000,\"delflag\":0,\"id\":20,\"overflowdate\":1560960000000,\"overflownumber\":\"qerqwerqerq\",\"remarks\":\"qweqweqw\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:02:52');
INSERT INTO `sys_log` VALUES ('995', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-21 11:07:31');
INSERT INTO `sys_log` VALUES ('996', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561079978000,\"delflag\":0,\"id\":20,\"overflowdate\":1560960000000,\"overflownumber\":\"13324153646467585889\",\"remarks\":\"qerqeradsfadfzxcvzcv\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:09:55');
INSERT INTO `sys_log` VALUES ('997', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561079978000,\"delflag\":0,\"id\":20,\"overflowdate\":1560787200000,\"overflownumber\":\"qerqwerqerq\",\"remarks\":\"qerqeradsfadfzxcvzcv\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:10:07');
INSERT INTO `sys_log` VALUES ('998', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1560840411000,\"code\":\"0030\",\"delflag\":0,\"id\":41,\"minnum\":10,\"model\":\"100g\",\"name\":\"大饼\",\"producer\":\"大连食品厂\",\"purchasingprice\":2.0,\"remarks\":\"好吃\",\"sellingprice\":5.0,\"typeid\":10,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:13:08');
INSERT INTO `sys_log` VALUES ('999', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"id\":1,\"inventoryquantity\":171,\"lastpurchasingprice\":8.0,\"minnum\":1001,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"producer\":\"贵州省贵阳南明老干妈风味的食品有限公司\",\"purchasingprice\":7.0,\"remarks\":\"好卖又好吃\",\"sellingprice\":8.0,\"state\":2,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:14:13');
INSERT INTO `sys_log` VALUES ('1000', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1560840411000,\"code\":\"0030\",\"delflag\":0,\"id\":41,\"minnum\":10,\"model\":\"100g\",\"name\":\"大饼\",\"producer\":\"大连食品厂\",\"purchasingprice\":2.0,\"remarks\":\"好吃\",\"sellingprice\":5.0,\"typeid\":10,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:17:19');
INSERT INTO `sys_log` VALUES ('1001', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{}', '0:0:0:0:0:0:0:1', '2019-06-21 11:17:42');
INSERT INTO `sys_log` VALUES ('1002', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1560840411000,\"code\":\"0030\",\"delflag\":0,\"id\":41,\"minnum\":10,\"model\":\"100g\",\"name\":\"大饼\",\"producer\":\"大连食品厂\",\"purchasingprice\":2.0,\"remarks\":\"好吃\",\"sellingprice\":5.0,\"typeid\":10,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:22:12');
INSERT INTO `sys_log` VALUES ('1003', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1560840411000,\"code\":\"0030\",\"delflag\":0,\"id\":41,\"inventoryquantity\":100,\"minnum\":10,\"model\":\"100g\",\"name\":\"大饼\",\"producer\":\"大连食品厂\",\"purchasingprice\":2.0,\"remarks\":\"好吃\",\"sellingprice\":5.0,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:22:43');
INSERT INTO `sys_log` VALUES ('1004', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561087452000,\"delflag\":0,\"id\":22,\"overflowdate\":1560960000000,\"overflownumber\":\"213123123\",\"remarks\":\"123123123\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:23:13');
INSERT INTO `sys_log` VALUES ('1005', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561087452000,\"delflag\":0,\"id\":22,\"overflowdate\":1559318400000,\"overflownumber\":\"qerewrqer\",\"remarks\":\"qrqerqwe\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:23:29');
INSERT INTO `sys_log` VALUES ('1006', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561087452000,\"delflag\":0,\"id\":22,\"overflowdate\":1559836800000,\"overflownumber\":\"adfa\",\"remarks\":\"asd12312312\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:24:32');
INSERT INTO `sys_log` VALUES ('1007', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1560840411000,\"code\":\"0030\",\"delflag\":0,\"id\":41,\"inventoryquantity\":100,\"minnum\":10,\"model\":\"100g\",\"name\":\"大饼\",\"producer\":\"大连食品厂\",\"purchasingprice\":2.0,\"remarks\":\"好吃\",\"sellingprice\":5.0,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:25:00');
INSERT INTO `sys_log` VALUES ('1008', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561087452000,\"delflag\":0,\"id\":22,\"overflowdate\":1559836800000,\"overflownumber\":\"adfa\",\"remarks\":\"asd12312312\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:25:28');
INSERT INTO `sys_log` VALUES ('1009', 'admin', '修改报溢单', 'com.erpdemo.controller.SysOverflowListController.update()', '{\"addtime\":1561087617000,\"delflag\":0,\"id\":23,\"overflowdate\":1560182400000,\"overflownumber\":\"1432413241\",\"remarks\":\"123413241234\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:27:03');
INSERT INTO `sys_log` VALUES ('1010', 'admin', '删除报溢单', 'com.erpdemo.controller.SysOverflowListController.delete()', '[24]', '0:0:0:0:0:0:0:1', '2019-06-21 11:27:28');
INSERT INTO `sys_log` VALUES ('1011', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1560840411000,\"code\":\"0030\",\"delflag\":0,\"id\":41,\"inventoryquantity\":100,\"minnum\":10,\"model\":\"100g\",\"name\":\"大饼\",\"producer\":\"大连食品厂\",\"purchasingprice\":2.0,\"remarks\":\"好吃\",\"sellingprice\":5.0,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 11:33:25');
INSERT INTO `sys_log` VALUES ('1012', 'admin', '删除报溢单', 'com.erpdemo.controller.SysOverflowListController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-06-21 13:42:39');
INSERT INTO `sys_log` VALUES ('1013', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"id\":2,\"inventoryquantity\":140,\"lastpurchasingprice\":2220.0,\"minnum\":400,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"producer\":\"华为计算机系统有限公司\",\"purchasingprice\":1955.0,\"remarks\":\"热销\",\"sellingprice\":2200.0,\"state\":2,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:43:12');
INSERT INTO `sys_log` VALUES ('1014', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558581183000,\"code\":\"0027\",\"delflag\":0,\"id\":36,\"inventoryquantity\":2,\"lastpurchasingprice\":2.0,\"minnum\":5,\"model\":\"500ml\",\"name\":\"娃哈哈\",\"producer\":\"哇哈啊哈厂\",\"purchasingprice\":1.5,\"sellingprice\":3.0,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:43:59');
INSERT INTO `sys_log` VALUES ('1015', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486926000,\"code\":\"0026\",\"delflag\":0,\"id\":35,\"inventoryquantity\":2,\"lastpurchasingprice\":60.0,\"minnum\":10,\"model\":\"AFS JEEP\",\"name\":\"加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子\",\"producer\":\"c\",\"purchasingprice\":60.0,\"remarks\":\"\",\"sellingprice\":89.0,\"state\":2,\"unit\":\"条\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:44:39');
INSERT INTO `sys_log` VALUES ('1016', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486926000,\"code\":\"0026\",\"delflag\":0,\"id\":35,\"inventoryquantity\":2,\"lastpurchasingprice\":60.0,\"minnum\":10,\"model\":\"AFS JEEP\",\"name\":\"加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子\",\"producer\":\"c\",\"purchasingprice\":60.0,\"remarks\":\"\",\"sellingprice\":89.0,\"state\":2,\"unit\":\"条\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:45:01');
INSERT INTO `sys_log` VALUES ('1017', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486926000,\"code\":\"0026\",\"delflag\":0,\"id\":35,\"inventoryquantity\":2,\"lastpurchasingprice\":60.0,\"minnum\":10,\"model\":\"AFS JEEP\",\"name\":\"加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子\",\"producer\":\"c\",\"purchasingprice\":60.0,\"remarks\":\"\",\"sellingprice\":89.0,\"state\":2,\"unit\":\"条\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:46:22');
INSERT INTO `sys_log` VALUES ('1018', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486926000,\"code\":\"0026\",\"delflag\":0,\"id\":35,\"inventoryquantity\":2,\"lastpurchasingprice\":60.0,\"minnum\":10,\"model\":\"AFS JEEP\",\"name\":\"加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子\",\"producer\":\"c\",\"purchasingprice\":60.0,\"remarks\":\"\",\"sellingprice\":89.0,\"state\":2,\"unit\":\"条\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:47:31');
INSERT INTO `sys_log` VALUES ('1019', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486926000,\"code\":\"0026\",\"delflag\":0,\"id\":35,\"inventoryquantity\":2,\"lastpurchasingprice\":60.0,\"minnum\":10,\"model\":\"AFS JEEP\",\"name\":\"加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子\",\"producer\":\"c\",\"purchasingprice\":60.0,\"remarks\":\"\",\"sellingprice\":89.0,\"state\":2,\"unit\":\"条\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:47:51');
INSERT INTO `sys_log` VALUES ('1020', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"id\":2,\"inventoryquantity\":140,\"lastpurchasingprice\":2220.0,\"minnum\":400,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"producer\":\"华为计算机系统有限公司\",\"purchasingprice\":1955.0,\"remarks\":\"热销\",\"sellingprice\":2200.0,\"state\":2,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:47:55');
INSERT INTO `sys_log` VALUES ('1021', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1560840411000,\"code\":\"0030\",\"delflag\":0,\"id\":41,\"inventoryquantity\":100,\"minnum\":10,\"model\":\"100g\",\"name\":\"饼\",\"producer\":\"大连食品厂\",\"purchasingprice\":2.0,\"remarks\":\"好吃\",\"sellingprice\":5.0,\"typeid\":10,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 13:49:56');
INSERT INTO `sys_log` VALUES ('1022', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[45]', '0:0:0:0:0:0:0:1', '2019-06-21 14:06:34');
INSERT INTO `sys_log` VALUES ('1023', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2019-06-21 14:08:21');
INSERT INTO `sys_log` VALUES ('1024', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":111.0,\"amountpayable\":111.0,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201906218432\",\"remarks\":\"11\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 15:21:08');
INSERT INTO `sys_log` VALUES ('1025', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":111.0,\"amountpayable\":111.0,\"purchasedateStr\":\"2019-06-03\",\"purchasenumber\":\"JH201906219030\",\"remarks\":\"11\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 15:21:25');
INSERT INTO `sys_log` VALUES ('1026', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":111.0,\"amountpayable\":111.0,\"purchasedateStr\":\"2019-06-06\",\"purchasenumber\":\"JH201906210053\",\"remarks\":\"11\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 15:28:37');
INSERT INTO `sys_log` VALUES ('1027', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":111.0,\"amountpayable\":111.0,\"purchasedateStr\":\"2019-06-06\",\"purchasenumber\":\"JH201906210923\",\"remarks\":\"11\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 15:29:50');
INSERT INTO `sys_log` VALUES ('1028', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":111.0,\"amountpayable\":111.0,\"purchasedateStr\":\"2019-06-05\",\"purchasenumber\":\"JH201906216678\",\"remarks\":\"11\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 15:30:37');
INSERT INTO `sys_log` VALUES ('1029', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[151,150]', '0:0:0:0:0:0:0:1', '2019-06-21 15:31:21');
INSERT INTO `sys_log` VALUES ('1030', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[140]', '0:0:0:0:0:0:0:1', '2019-06-21 15:31:25');
INSERT INTO `sys_log` VALUES ('1031', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-06-20\",\"purchasenumber\":\"JH201906210033\",\"remarks\":\"23\",\"state\":2}', '0:0:0:0:0:0:0:1', '2019-06-21 15:31:49');
INSERT INTO `sys_log` VALUES ('1032', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201906213203\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-21 15:40:40');
INSERT INTO `sys_log` VALUES ('1033', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-06-14\",\"purchasenumber\":\"JH201906219371\",\"remarks\":\"ttt\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 16:24:27');
INSERT INTO `sys_log` VALUES ('1034', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561105541000,\"amountpaid\":1255.0,\"amountpayable\":1255.0,\"delflag\":0,\"id\":154,\"purchasedate\":1560441600000,\"purchasedateStr\":\"2019-06-13\",\"purchasenumber\":\"JH201906219371\",\"remarks\":\"tttyyy\",\"state\":1,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 16:24:43');
INSERT INTO `sys_log` VALUES ('1035', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561105541000,\"amountpaid\":1255.0,\"amountpayable\":1255.0,\"delflag\":0,\"id\":154,\"purchasedate\":1560441600000,\"purchasenumber\":\"JH201906219371\",\"remarks\":\"tttyytttt\",\"state\":1,\"supplierid\":2,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 16:24:57');
INSERT INTO `sys_log` VALUES ('1036', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[32,31]', '0:0:0:0:0:0:0:1', '2019-06-21 16:26:14');
INSERT INTO `sys_log` VALUES ('1037', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":23123.0,\"amountpayable\":232131.0,\"purchasedateStr\":\"2019-06-21\",\"purchasenumber\":\"JH201906216895\",\"remarks\":\"ytytyt\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-21 16:32:18');
INSERT INTO `sys_log` VALUES ('1038', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"数据导入\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/fileupload.html\"}', '0:0:0:0:0:0:0:1', '2019-06-24 08:53:03');
INSERT INTO `sys_log` VALUES ('1039', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":56,\"name\":\"商品报损\",\"orderNum\":2,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:damagelistgoods:list\",\"type\":1,\"url\":\"sys/damagelistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-06-24 09:08:23');
INSERT INTO `sys_log` VALUES ('1040', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[131]', '0:0:0:0:0:0:0:1', '2019-06-24 09:22:33');
INSERT INTO `sys_log` VALUES ('1041', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1222.0,\"amountpayable\":1222.0,\"purchasedateStr\":\"2019-06-20\",\"purchasenumber\":\"JH201906244228\",\"remarks\":\"dddd\",\"state\":2,\"supplierid\":0}', '0:0:0:0:0:0:0:1', '2019-06-24 09:23:26');
INSERT INTO `sys_log` VALUES ('1042', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1223.0,\"amountpayable\":1223.0,\"purchasedateStr\":\"2019-06-14\",\"purchasenumber\":\"JH201906241584\",\"remarks\":\"gggg\",\"state\":1,\"supplierid\":3}', '0:0:0:0:0:0:0:1', '2019-06-24 09:23:52');
INSERT INTO `sys_log` VALUES ('1043', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":122224.0,\"amountpayable\":122224.0,\"purchasedateStr\":\"2019-06-29\",\"purchasenumber\":\"JH201906240547\",\"remarks\":\"wwww\",\"state\":1,\"supplierid\":3}', '0:0:0:0:0:0:0:1', '2019-06-24 09:25:19');
INSERT INTO `sys_log` VALUES ('1044', 'admin', '保存', 'com.erpdemo.controller.SysDamageListGoodsController.save()', '{\"code\":\"\",\"name\":\"\",\"price\":\"\",\"total\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-24 10:52:34');
INSERT INTO `sys_log` VALUES ('1045', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1111222.0,\"amountpayable\":1111222.0,\"purchasedateStr\":\"2019-06-19\",\"purchasenumber\":\"JH201906245100\",\"remarks\":\"tttt\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-06-24 11:08:10');
INSERT INTO `sys_log` VALUES ('1046', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"a\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-24 11:18:20');
INSERT INTO `sys_log` VALUES ('1047', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"\",\"addtime\":1561346301000,\"contact\":\"\",\"id\":7,\"name\":\"as\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-24 11:18:36');
INSERT INTO `sys_log` VALUES ('1048', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[7]', '0:0:0:0:0:0:0:1', '2019-06-24 11:18:42');
INSERT INTO `sys_log` VALUES ('1049', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":111.0,\"amountpayable\":111.0,\"purchasedateStr\":\"2019-06-18\",\"purchasenumber\":\"JH201906247319\",\"remarks\":\"aa\",\"state\":1,\"supplierid\":11}', '0:0:0:0:0:0:0:1', '2019-06-24 13:49:33');
INSERT INTO `sys_log` VALUES ('1050', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561355453000,\"amountpaid\":11122.0,\"amountpayable\":11122.0,\"delflag\":0,\"id\":159,\"purchasedate\":1560787200000,\"purchasedateStr\":\"2019-06-20\",\"purchasenumber\":\"JH201906247319\",\"remarks\":\"aabb\",\"state\":1,\"supplierid\":9,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-24 13:50:49');
INSERT INTO `sys_log` VALUES ('1051', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":222111.0,\"amountpayable\":222111.0,\"purchasedateStr\":\"2019-06-18\",\"purchasenumber\":\"JH201906240996\",\"remarks\":\"ffff\",\"state\":1,\"supplierid\":7}', '0:0:0:0:0:0:0:1', '2019-06-24 13:57:23');
INSERT INTO `sys_log` VALUES ('1052', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":111.0,\"amountpayable\":111.0,\"purchasedateStr\":\"2019-06-18\",\"purchasenumber\":\"JH201906246455\",\"remarks\":\"\",\"state\":1,\"supplierid\":6}', '0:0:0:0:0:0:0:1', '2019-06-24 14:07:19');
INSERT INTO `sys_log` VALUES ('1053', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[161]', '0:0:0:0:0:0:0:1', '2019-06-24 14:39:50');
INSERT INTO `sys_log` VALUES ('1054', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561339600000,\"amountpaid\":122224.0,\"amountpayable\":122224.0,\"delflag\":0,\"id\":157,\"purchasedate\":1561737600000,\"purchasenumber\":\"JH201906247591\",\"remarks\":\"wwww\",\"state\":1,\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-24 14:40:37');
INSERT INTO `sys_log` VALUES ('1055', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[35]', '0:0:0:0:0:0:0:1', '2019-06-24 15:57:00');
INSERT INTO `sys_log` VALUES ('1056', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[36]', '0:0:0:0:0:0:0:1', '2019-06-24 15:57:09');
INSERT INTO `sys_log` VALUES ('1057', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"大连成成\",\"addtime\":1561363411000,\"contact\":\"成成\",\"delflag\":0,\"id\":37,\"name\":\"大连成成\",\"num\":\"1\",\"remarks\":\"诚信\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-24 16:20:25');
INSERT INTO `sys_log` VALUES ('1058', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-24 16:43:13');
INSERT INTO `sys_log` VALUES ('1059', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":130,\"name\":\"客户退货查询\",\"orderNum\":0,\"parentId\":66,\"parentName\":\"销售管理\",\"type\":1,\"url\":\"sys/CustomerReturnListGoods.html\"}', '0:0:0:0:0:0:0:1', '2019-06-25 11:05:21');
INSERT INTO `sys_log` VALUES ('1060', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":129,\"name\":\"客户退货\",\"orderNum\":0,\"parentId\":66,\"parentName\":\"销售管理\",\"type\":1,\"url\":\"sys/CustomerReturnList.html\"}', '0:0:0:0:0:0:0:1', '2019-06-25 11:05:42');
INSERT INTO `sys_log` VALUES ('1061', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[13]', '0:0:0:0:0:0:0:1', '2019-06-27 11:02:02');
INSERT INTO `sys_log` VALUES ('1062', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[160]', '0:0:0:0:0:0:0:1', '2019-06-27 14:59:47');
INSERT INTO `sys_log` VALUES ('1063', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品调价\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/goodspriceupdate.html\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:08:36');
INSERT INTO `sys_log` VALUES ('1064', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[134]', '0:0:0:0:0:0:0:1', '2019-06-27 15:13:13');
INSERT INTO `sys_log` VALUES ('1065', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品调价\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/goodspriceupdate.html\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:14:10');
INSERT INTO `sys_log` VALUES ('1066', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[135]', '0:0:0:0:0:0:0:1', '2019-06-27 15:14:56');
INSERT INTO `sys_log` VALUES ('1067', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品调价\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/goodspriceupdate.html\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:17:13');
INSERT INTO `sys_log` VALUES ('1068', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561620536704\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:28:59');
INSERT INTO `sys_log` VALUES ('1069', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561620594729\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:29:56');
INSERT INTO `sys_log` VALUES ('1070', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561620638745\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:30:40');
INSERT INTO `sys_log` VALUES ('1071', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"组装\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-06-27 15:32:10');
INSERT INTO `sys_log` VALUES ('1072', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"库存\",\"orderNum\":0,\"parentId\":137,\"parentName\":\"组装\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-06-27 15:32:28');
INSERT INTO `sys_log` VALUES ('1073', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561620757927\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:32:39');
INSERT INTO `sys_log` VALUES ('1074', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561620791735\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:33:13');
INSERT INTO `sys_log` VALUES ('1075', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"产品库存\",\"orderNum\":0,\"parentId\":137,\"parentName\":\"组装\",\"type\":1,\"url\":\"sys/stock.html\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:35:12');
INSERT INTO `sys_log` VALUES ('1076', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"组装并出库\",\"orderNum\":0,\"parentId\":137,\"parentName\":\"组装\",\"type\":1,\"url\":\"sys/release.html\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:36:35');
INSERT INTO `sys_log` VALUES ('1077', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":138,\"name\":\"半成品or成品库存\",\"orderNum\":0,\"parentId\":137,\"parentName\":\"组装\",\"type\":1,\"url\":\"sys/stock.html\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:37:48');
INSERT INTO `sys_log` VALUES ('1078', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561621085189\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:38:42');
INSERT INTO `sys_log` VALUES ('1079', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[37]', '0:0:0:0:0:0:0:1', '2019-06-27 15:45:23');
INSERT INTO `sys_log` VALUES ('1080', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561621725602\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:48:46');
INSERT INTO `sys_log` VALUES ('1081', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561621746540\"}', '0:0:0:0:0:0:0:1', '2019-06-27 15:49:07');
INSERT INTO `sys_log` VALUES ('1082', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561622841007\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:07:23');
INSERT INTO `sys_log` VALUES ('1083', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561623085438\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:11:26');
INSERT INTO `sys_log` VALUES ('1084', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"model\":\"\",\"name\":\"\",\"typeid\":4}', '0:0:0:0:0:0:0:1', '2019-06-27 16:11:40');
INSERT INTO `sys_log` VALUES ('1085', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561623156692\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:12:37');
INSERT INTO `sys_log` VALUES ('1086', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561623366856\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:16:08');
INSERT INTO `sys_log` VALUES ('1087', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561623380012\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:16:21');
INSERT INTO `sys_log` VALUES ('1088', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624019899\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:27:01');
INSERT INTO `sys_log` VALUES ('1089', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624174209\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:29:35');
INSERT INTO `sys_log` VALUES ('1090', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624208740\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:30:10');
INSERT INTO `sys_log` VALUES ('1091', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624266837\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:31:07');
INSERT INTO `sys_log` VALUES ('1092', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624338722\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:32:19');
INSERT INTO `sys_log` VALUES ('1093', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624536912\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:35:38');
INSERT INTO `sys_log` VALUES ('1094', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624713737\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:38:35');
INSERT INTO `sys_log` VALUES ('1095', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624738399\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:38:59');
INSERT INTO `sys_log` VALUES ('1096', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624753794\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:39:15');
INSERT INTO `sys_log` VALUES ('1097', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624863703\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:41:05');
INSERT INTO `sys_log` VALUES ('1098', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624918438\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:41:59');
INSERT INTO `sys_log` VALUES ('1099', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561624982478\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:43:03');
INSERT INTO `sys_log` VALUES ('1100', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561625550966\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:52:33');
INSERT INTO `sys_log` VALUES ('1101', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561625616514\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:53:39');
INSERT INTO `sys_log` VALUES ('1102', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561625798198\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:56:39');
INSERT INTO `sys_log` VALUES ('1103', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561625798201\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:56:50');
INSERT INTO `sys_log` VALUES ('1104', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561625798204\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:56:56');
INSERT INTO `sys_log` VALUES ('1105', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561625981859\"}', '0:0:0:0:0:0:0:1', '2019-06-27 16:59:44');
INSERT INTO `sys_log` VALUES ('1106', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品盘点管理\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/GoodsCheck.html\"}', '0:0:0:0:0:0:0:1', '2019-06-27 19:05:26');
INSERT INTO `sys_log` VALUES ('1107', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561634396187\"}', '0:0:0:0:0:0:0:1', '2019-06-27 19:19:58');
INSERT INTO `sys_log` VALUES ('1108', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561634538574\"}', '0:0:0:0:0:0:0:1', '2019-06-27 19:22:19');
INSERT INTO `sys_log` VALUES ('1109', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListGoodsController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2019-06-27 19:53:32');
INSERT INTO `sys_log` VALUES ('1110', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":62,\"name\":\"商品报溢单商品\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:03:27');
INSERT INTO `sys_log` VALUES ('1111', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":64,\"name\":\"商品报溢\",\"orderNum\":6,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlistgoods:list\",\"type\":1,\"url\":\"sys/overflowlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:03:58');
INSERT INTO `sys_log` VALUES ('1112', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":62,\"name\":\"商品报溢单商品查询\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:04:09');
INSERT INTO `sys_log` VALUES ('1113', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561684435643\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:13:57');
INSERT INTO `sys_log` VALUES ('1114', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561684841484\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:20:42');
INSERT INTO `sys_log` VALUES ('1115', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561684850607\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:20:52');
INSERT INTO `sys_log` VALUES ('1116', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561685003662\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:23:25');
INSERT INTO `sys_log` VALUES ('1117', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561685315319\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:28:36');
INSERT INTO `sys_log` VALUES ('1118', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":64,\"name\":\"商品报损报溢查询\",\"orderNum\":6,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlistgoods:list\",\"type\":1,\"url\":\"sys/overflowlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:34:29');
INSERT INTO `sys_log` VALUES ('1119', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686232129\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:43:53');
INSERT INTO `sys_log` VALUES ('1120', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686266843\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:44:28');
INSERT INTO `sys_log` VALUES ('1121', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686704204\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:51:46');
INSERT INTO `sys_log` VALUES ('1122', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686720102\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:52:01');
INSERT INTO `sys_log` VALUES ('1123', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686735433\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:52:16');
INSERT INTO `sys_log` VALUES ('1124', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686806559\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:53:27');
INSERT INTO `sys_log` VALUES ('1125', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686844556\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:54:06');
INSERT INTO `sys_log` VALUES ('1126', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686863136\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:54:24');
INSERT INTO `sys_log` VALUES ('1127', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686900104\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:55:01');
INSERT INTO `sys_log` VALUES ('1128', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561686946035\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:55:46');
INSERT INTO `sys_log` VALUES ('1129', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687007961\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:56:51');
INSERT INTO `sys_log` VALUES ('1130', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687030710\"}', '0:0:0:0:0:0:0:1', '2019-06-28 09:57:12');
INSERT INTO `sys_log` VALUES ('1131', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687331849\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:02:13');
INSERT INTO `sys_log` VALUES ('1132', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687364620\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:02:46');
INSERT INTO `sys_log` VALUES ('1133', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687364623\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:03:03');
INSERT INTO `sys_log` VALUES ('1134', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687425461\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:03:46');
INSERT INTO `sys_log` VALUES ('1135', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687481806\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:04:43');
INSERT INTO `sys_log` VALUES ('1136', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687609860\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:06:51');
INSERT INTO `sys_log` VALUES ('1137', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687721994\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:08:43');
INSERT INTO `sys_log` VALUES ('1138', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687721998\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:08:54');
INSERT INTO `sys_log` VALUES ('1139', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561687936144\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:12:17');
INSERT INTO `sys_log` VALUES ('1140', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688012675\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:13:35');
INSERT INTO `sys_log` VALUES ('1141', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688118749\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:15:20');
INSERT INTO `sys_log` VALUES ('1142', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688248357\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:17:29');
INSERT INTO `sys_log` VALUES ('1143', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688305402\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:18:26');
INSERT INTO `sys_log` VALUES ('1144', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688578959\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:23:00');
INSERT INTO `sys_log` VALUES ('1145', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688680810\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:24:43');
INSERT INTO `sys_log` VALUES ('1146', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688723455\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:25:24');
INSERT INTO `sys_log` VALUES ('1147', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688798061\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:26:39');
INSERT INTO `sys_log` VALUES ('1148', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561688798064\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:26:49');
INSERT INTO `sys_log` VALUES ('1149', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689026148\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:30:27');
INSERT INTO `sys_log` VALUES ('1150', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689047323\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:30:49');
INSERT INTO `sys_log` VALUES ('1151', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689124664\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:32:05');
INSERT INTO `sys_log` VALUES ('1152', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689165800\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:32:47');
INSERT INTO `sys_log` VALUES ('1153', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689278151\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:34:39');
INSERT INTO `sys_log` VALUES ('1154', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689346555\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:35:47');
INSERT INTO `sys_log` VALUES ('1155', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689532976\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:38:56');
INSERT INTO `sys_log` VALUES ('1156', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689627278\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:40:29');
INSERT INTO `sys_log` VALUES ('1157', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689699036\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:41:42');
INSERT INTO `sys_log` VALUES ('1158', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689726612\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:42:07');
INSERT INTO `sys_log` VALUES ('1159', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689944942\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:45:46');
INSERT INTO `sys_log` VALUES ('1160', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561689999944\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:46:41');
INSERT INTO `sys_log` VALUES ('1161', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561690245845\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:50:50');
INSERT INTO `sys_log` VALUES ('1162', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561690352749\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:52:34');
INSERT INTO `sys_log` VALUES ('1163', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561690436112\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:53:57');
INSERT INTO `sys_log` VALUES ('1164', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561690445144\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:54:06');
INSERT INTO `sys_log` VALUES ('1165', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561690457665\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:54:18');
INSERT INTO `sys_log` VALUES ('1166', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品详情\",\"orderNum\":0,\"parentId\":128,\"parentName\":\"商品管理\",\"type\":1,\"url\":\"sys/goodsdetail.html\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:55:38');
INSERT INTO `sys_log` VALUES ('1167', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品详情\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/goodsdetail.html\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:56:06');
INSERT INTO `sys_log` VALUES ('1168', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[141]', '0:0:0:0:0:0:0:1', '2019-06-28 10:58:11');
INSERT INTO `sys_log` VALUES ('1169', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561690737661\"}', '0:0:0:0:0:0:0:1', '2019-06-28 10:58:58');
INSERT INTO `sys_log` VALUES ('1170', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691008884\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:03:30');
INSERT INTO `sys_log` VALUES ('1171', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691055221\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:04:17');
INSERT INTO `sys_log` VALUES ('1172', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691084249\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:04:45');
INSERT INTO `sys_log` VALUES ('1173', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691111610\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:05:12');
INSERT INTO `sys_log` VALUES ('1174', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691402554\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:10:03');
INSERT INTO `sys_log` VALUES ('1175', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691450342\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:10:54');
INSERT INTO `sys_log` VALUES ('1176', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691581996\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:13:03');
INSERT INTO `sys_log` VALUES ('1177', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691632682\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:13:54');
INSERT INTO `sys_log` VALUES ('1178', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561691747136\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:15:48');
INSERT INTO `sys_log` VALUES ('1179', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561692261830\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:24:24');
INSERT INTO `sys_log` VALUES ('1180', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 11:29:40');
INSERT INTO `sys_log` VALUES ('1181', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561693336132\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:42:27');
INSERT INTO `sys_log` VALUES ('1182', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561693467891\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:44:31');
INSERT INTO `sys_log` VALUES ('1183', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 11:44:37');
INSERT INTO `sys_log` VALUES ('1184', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561693681725\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:48:56');
INSERT INTO `sys_log` VALUES ('1185', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561693782012\"}', '0:0:0:0:0:0:0:1', '2019-06-28 11:49:43');
INSERT INTO `sys_log` VALUES ('1186', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701135132\"}', '0:0:0:0:0:0:0:1', '2019-06-28 13:52:16');
INSERT INTO `sys_log` VALUES ('1187', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701211870\"}', '0:0:0:0:0:0:0:1', '2019-06-28 13:53:33');
INSERT INTO `sys_log` VALUES ('1188', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701413824\"}', '0:0:0:0:0:0:0:1', '2019-06-28 13:56:55');
INSERT INTO `sys_log` VALUES ('1189', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701425371\"}', '0:0:0:0:0:0:0:1', '2019-06-28 13:57:06');
INSERT INTO `sys_log` VALUES ('1190', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701477299\"}', '0:0:0:0:0:0:0:1', '2019-06-28 13:57:58');
INSERT INTO `sys_log` VALUES ('1191', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701504548\"}', '0:0:0:0:0:0:0:1', '2019-06-28 13:58:25');
INSERT INTO `sys_log` VALUES ('1192', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701565861\"}', '0:0:0:0:0:0:0:1', '2019-06-28 13:59:27');
INSERT INTO `sys_log` VALUES ('1193', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701622658\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:00:24');
INSERT INTO `sys_log` VALUES ('1194', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701719269\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:02:01');
INSERT INTO `sys_log` VALUES ('1195', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:02:32');
INSERT INTO `sys_log` VALUES ('1196', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:02:34');
INSERT INTO `sys_log` VALUES ('1197', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:02:41');
INSERT INTO `sys_log` VALUES ('1198', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:02:46');
INSERT INTO `sys_log` VALUES ('1199', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701747880\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:02:47');
INSERT INTO `sys_log` VALUES ('1200', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561701747882\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:02:56');
INSERT INTO `sys_log` VALUES ('1201', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:01');
INSERT INTO `sys_log` VALUES ('1202', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:01');
INSERT INTO `sys_log` VALUES ('1203', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:01');
INSERT INTO `sys_log` VALUES ('1204', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:02');
INSERT INTO `sys_log` VALUES ('1205', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:40');
INSERT INTO `sys_log` VALUES ('1206', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:41');
INSERT INTO `sys_log` VALUES ('1207', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:41');
INSERT INTO `sys_log` VALUES ('1208', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:41');
INSERT INTO `sys_log` VALUES ('1209', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:41');
INSERT INTO `sys_log` VALUES ('1210', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:03:41');
INSERT INTO `sys_log` VALUES ('1211', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:04:14');
INSERT INTO `sys_log` VALUES ('1212', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-06-28 14:08:25');
INSERT INTO `sys_log` VALUES ('1213', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-06-28 14:08:30');
INSERT INTO `sys_log` VALUES ('1214', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[9,8]', '0:0:0:0:0:0:0:1', '2019-06-28 14:08:36');
INSERT INTO `sys_log` VALUES ('1215', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[7,5]', '0:0:0:0:0:0:0:1', '2019-06-28 14:08:42');
INSERT INTO `sys_log` VALUES ('1216', 'admin', '删除用户', 'com.erpdemo.controller.SysDamageListController.delete()', '[4,3]', '0:0:0:0:0:0:0:1', '2019-06-28 14:08:50');
INSERT INTO `sys_log` VALUES ('1217', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702159689\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:09:20');
INSERT INTO `sys_log` VALUES ('1218', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702250634\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:10:52');
INSERT INTO `sys_log` VALUES ('1219', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:11:55');
INSERT INTO `sys_log` VALUES ('1220', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702250644\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:14:34');
INSERT INTO `sys_log` VALUES ('1221', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702482066\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:14:50');
INSERT INTO `sys_log` VALUES ('1222', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:14:57');
INSERT INTO `sys_log` VALUES ('1223', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702482070\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:15:00');
INSERT INTO `sys_log` VALUES ('1224', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702536462\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:15:38');
INSERT INTO `sys_log` VALUES ('1225', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"10\"', '0:0:0:0:0:0:0:1', '2019-06-28 14:15:46');
INSERT INTO `sys_log` VALUES ('1226', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702536467\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:15:48');
INSERT INTO `sys_log` VALUES ('1227', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702853782\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:20:55');
INSERT INTO `sys_log` VALUES ('1228', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561702888186\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:21:29');
INSERT INTO `sys_log` VALUES ('1229', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703214540\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:26:55');
INSERT INTO `sys_log` VALUES ('1230', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703411497\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:30:13');
INSERT INTO `sys_log` VALUES ('1231', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703434526\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:30:38');
INSERT INTO `sys_log` VALUES ('1232', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703458823\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:31:00');
INSERT INTO `sys_log` VALUES ('1233', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703470462\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:31:11');
INSERT INTO `sys_log` VALUES ('1234', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703518180\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:31:59');
INSERT INTO `sys_log` VALUES ('1235', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703563079\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:32:45');
INSERT INTO `sys_log` VALUES ('1236', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703724678\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:35:34');
INSERT INTO `sys_log` VALUES ('1237', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703833951\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:37:20');
INSERT INTO `sys_log` VALUES ('1238', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561703908883\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:38:29');
INSERT INTO `sys_log` VALUES ('1239', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561703958800\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:39:18');
INSERT INTO `sys_log` VALUES ('1240', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561703944234\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:39:05');
INSERT INTO `sys_log` VALUES ('1241', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561703978211\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:39:38');
INSERT INTO `sys_log` VALUES ('1242', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561704013946\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:40:14');
INSERT INTO `sys_log` VALUES ('1243', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561704142140\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:42:22');
INSERT INTO `sys_log` VALUES ('1244', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561704198737\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:43:18');
INSERT INTO `sys_log` VALUES ('1245', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561704236514\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:43:56');
INSERT INTO `sys_log` VALUES ('1246', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561704283969\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:44:44');
INSERT INTO `sys_log` VALUES ('1247', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561704300939\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:45:01');
INSERT INTO `sys_log` VALUES ('1248', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561704358577\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:46:00');
INSERT INTO `sys_log` VALUES ('1249', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561704413828\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:46:53');
INSERT INTO `sys_log` VALUES ('1250', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561704398341\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:46:39');
INSERT INTO `sys_log` VALUES ('1251', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561704708613\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:51:59');
INSERT INTO `sys_log` VALUES ('1252', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561704785395\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:53:07');
INSERT INTO `sys_log` VALUES ('1253', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1122.0,\"amountpayable\":1122.0,\"purchasedateStr\":\"2019-06-28\",\"purchasenumber\":\"JH201906280247\",\"remarks\":\"qwq\",\"state\":1,\"supplierid\":39}', '0:0:0:0:0:0:0:1', '2019-06-28 14:57:32');
INSERT INTO `sys_log` VALUES ('1254', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561705088074\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:58:09');
INSERT INTO `sys_log` VALUES ('1255', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561705137955\"}', '0:0:0:0:0:0:0:1', '2019-06-28 14:58:58');
INSERT INTO `sys_log` VALUES ('1256', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561705203744\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:00:03');
INSERT INTO `sys_log` VALUES ('1257', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561705335394\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:02:17');
INSERT INTO `sys_log` VALUES ('1258', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561705369495\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:02:49');
INSERT INTO `sys_log` VALUES ('1259', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561705495998\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:04:58');
INSERT INTO `sys_log` VALUES ('1260', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561705496002\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:06:58');
INSERT INTO `sys_log` VALUES ('1261', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561705496005\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:07:06');
INSERT INTO `sys_log` VALUES ('1262', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561705955312\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:12:37');
INSERT INTO `sys_log` VALUES ('1263', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561705969764\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:12:50');
INSERT INTO `sys_log` VALUES ('1264', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"id\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":20.0,\"price\":50.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-28 15:13:44');
INSERT INTO `sys_log` VALUES ('1265', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561706348838\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:19:09');
INSERT INTO `sys_log` VALUES ('1266', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561706427886\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:20:28');
INSERT INTO `sys_log` VALUES ('1267', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561706522850\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:22:05');
INSERT INTO `sys_log` VALUES ('1268', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561706633333\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:23:54');
INSERT INTO `sys_log` VALUES ('1269', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561706773755\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:26:14');
INSERT INTO `sys_log` VALUES ('1270', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561706759018\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:26:04');
INSERT INTO `sys_log` VALUES ('1271', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561706803141\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:26:43');
INSERT INTO `sys_log` VALUES ('1272', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561706876486\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:27:56');
INSERT INTO `sys_log` VALUES ('1273', 'admin', '类别', 'com.erpdemo.controller.SysPurchaseGoodsController.selectAll()', '{\"_\":\"1561706943959\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:29:07');
INSERT INTO `sys_log` VALUES ('1274', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561706992362\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:29:52');
INSERT INTO `sys_log` VALUES ('1275', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561707207502\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:33:27');
INSERT INTO `sys_log` VALUES ('1276', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"供货商单据明细\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/docdetail.html\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:44:04');
INSERT INTO `sys_log` VALUES ('1277', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[142]', '0:0:0:0:0:0:0:1', '2019-06-28 15:44:49');
INSERT INTO `sys_log` VALUES ('1278', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561707936261\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:45:36');
INSERT INTO `sys_log` VALUES ('1279', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"供货商单据明细\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/docdetail.html\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:45:54');
INSERT INTO `sys_log` VALUES ('1280', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561708096727\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:48:16');
INSERT INTO `sys_log` VALUES ('1281', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1561651200000,\"damagenumber\":\"XT201906280002\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:49:28');
INSERT INTO `sys_log` VALUES ('1282', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"id\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":3.0,\"price\":2.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-28 15:53:33');
INSERT INTO `sys_log` VALUES ('1283', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"1\"', '0:0:0:0:0:0:0:1', '2019-06-28 15:55:24');
INSERT INTO `sys_log` VALUES ('1284', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"13\"', '0:0:0:0:0:0:0:1', '2019-06-28 15:56:24');
INSERT INTO `sys_log` VALUES ('1285', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1561651200000,\"damagenumber\":\"XT201906280002\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:58:00');
INSERT INTO `sys_log` VALUES ('1286', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1561651200000,\"damagenumber\":\"XT201906280002\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-28 15:59:20');
INSERT INTO `sys_log` VALUES ('1287', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 16:00:05');
INSERT INTO `sys_log` VALUES ('1288', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"13\"', '0:0:0:0:0:0:0:1', '2019-06-28 16:02:16');
INSERT INTO `sys_log` VALUES ('1289', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"13\"', '0:0:0:0:0:0:0:1', '2019-06-28 16:02:54');
INSERT INTO `sys_log` VALUES ('1290', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1561651200000,\"damagenumber\":\"XT201906280002\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-28 16:04:09');
INSERT INTO `sys_log` VALUES ('1291', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 16:06:20');
INSERT INTO `sys_log` VALUES ('1292', 'admin', '保存', 'com.erpdemo.controller.SysDamageListController.save()', '{\"damagedate\":1561651200000,\"damagenumber\":\"XT201906280002\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-06-28 16:06:48');
INSERT INTO `sys_log` VALUES ('1293', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-06-28 16:07:36');
INSERT INTO `sys_log` VALUES ('1294', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":33.0,\"price\":2.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-28 16:11:47');
INSERT INTO `sys_log` VALUES ('1295', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":2.0,\"price\":4.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-28 16:12:56');
INSERT INTO `sys_log` VALUES ('1296', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":11.0,\"amountpayable\":11.0,\"purchasedateStr\":\"2019-06-28\",\"purchasenumber\":\"JH201906281849\",\"remarks\":\"qw\",\"state\":1,\"supplierid\":39}', '0:0:0:0:0:0:0:1', '2019-06-28 16:40:08');
INSERT INTO `sys_log` VALUES ('1297', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":22.0,\"price\":3.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-06-28 17:13:44');
INSERT INTO `sys_log` VALUES ('1298', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561943050229\"}', '0:0:0:0:0:0:0:1', '2019-07-01 09:04:10');
INSERT INTO `sys_log` VALUES ('1299', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561943286911\"}', '0:0:0:0:0:0:0:1', '2019-07-01 09:08:07');
INSERT INTO `sys_log` VALUES ('1300', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561943392073\"}', '0:0:0:0:0:0:0:1', '2019-07-01 09:09:52');
INSERT INTO `sys_log` VALUES ('1301', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561950435332\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:07:15');
INSERT INTO `sys_log` VALUES ('1302', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951202387\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:20:02');
INSERT INTO `sys_log` VALUES ('1303', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951214972\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:20:15');
INSERT INTO `sys_log` VALUES ('1304', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951226381\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:20:26');
INSERT INTO `sys_log` VALUES ('1305', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951342757\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:22:22');
INSERT INTO `sys_log` VALUES ('1306', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951359654\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:22:39');
INSERT INTO `sys_log` VALUES ('1307', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951439147\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:23:59');
INSERT INTO `sys_log` VALUES ('1308', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951484599\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:24:44');
INSERT INTO `sys_log` VALUES ('1309', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951511842\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:25:12');
INSERT INTO `sys_log` VALUES ('1310', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951552756\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:25:52');
INSERT INTO `sys_log` VALUES ('1311', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951572689\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:26:12');
INSERT INTO `sys_log` VALUES ('1312', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951652240\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:27:32');
INSERT INTO `sys_log` VALUES ('1313', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951708642\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:28:28');
INSERT INTO `sys_log` VALUES ('1314', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561951977619\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:32:57');
INSERT INTO `sys_log` VALUES ('1315', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsController.queryMore()', '{\"_\":\"1561952861536\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:47:41');
INSERT INTO `sys_log` VALUES ('1316', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561953156432\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:52:36');
INSERT INTO `sys_log` VALUES ('1317', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561953204792\"}', '0:0:0:0:0:0:0:1', '2019-07-01 11:53:25');
INSERT INTO `sys_log` VALUES ('1318', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561960188048\"}', '0:0:0:0:0:0:0:1', '2019-07-01 13:49:48');
INSERT INTO `sys_log` VALUES ('1319', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561960455930\"}', '0:0:0:0:0:0:0:1', '2019-07-01 13:54:16');
INSERT INTO `sys_log` VALUES ('1320', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561960643157\"}', '0:0:0:0:0:0:0:1', '2019-07-01 13:57:23');
INSERT INTO `sys_log` VALUES ('1321', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561961978233\"}', '0:0:0:0:0:0:0:1', '2019-07-01 14:19:38');
INSERT INTO `sys_log` VALUES ('1322', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561962025354\"}', '0:0:0:0:0:0:0:1', '2019-07-01 14:20:25');
INSERT INTO `sys_log` VALUES ('1323', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561962249557\"}', '0:0:0:0:0:0:0:1', '2019-07-01 14:24:09');
INSERT INTO `sys_log` VALUES ('1324', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561962422373\"}', '0:0:0:0:0:0:0:1', '2019-07-01 14:27:02');
INSERT INTO `sys_log` VALUES ('1325', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561962539535\"}', '0:0:0:0:0:0:0:1', '2019-07-01 14:28:59');
INSERT INTO `sys_log` VALUES ('1326', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561964251888\"}', '0:0:0:0:0:0:0:1', '2019-07-01 14:57:32');
INSERT INTO `sys_log` VALUES ('1327', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561964267468\"}', '0:0:0:0:0:0:0:1', '2019-07-01 14:57:47');
INSERT INTO `sys_log` VALUES ('1328', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561964348044\"}', '0:0:0:0:0:0:0:1', '2019-07-01 14:59:08');
INSERT INTO `sys_log` VALUES ('1329', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561964418651\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:00:18');
INSERT INTO `sys_log` VALUES ('1330', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561964431976\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:00:32');
INSERT INTO `sys_log` VALUES ('1331', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561964592510\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:03:12');
INSERT INTO `sys_log` VALUES ('1332', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561964640858\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:04:01');
INSERT INTO `sys_log` VALUES ('1333', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"_\":\"1561964646363\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:04:06');
INSERT INTO `sys_log` VALUES ('1334', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"11\":\"\",\"_\":\"1561964756449\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:05:56');
INSERT INTO `sys_log` VALUES ('1335', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561964901687\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:08:21');
INSERT INTO `sys_log` VALUES ('1336', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561965016299\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:10:16');
INSERT INTO `sys_log` VALUES ('1337', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"26\",\"_\":\"1561965252442\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:14:12');
INSERT INTO `sys_log` VALUES ('1338', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561965348776\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:15:48');
INSERT INTO `sys_log` VALUES ('1339', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561965388338\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:16:28');
INSERT INTO `sys_log` VALUES ('1340', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"11\",\"_\":\"1561965398078\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:16:38');
INSERT INTO `sys_log` VALUES ('1341', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"14\",\"_\":\"1561965412875\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:16:53');
INSERT INTO `sys_log` VALUES ('1342', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561965445292\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:17:25');
INSERT INTO `sys_log` VALUES ('1343', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561965491600\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:18:11');
INSERT INTO `sys_log` VALUES ('1344', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561965511312\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:18:31');
INSERT INTO `sys_log` VALUES ('1345', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561965556797\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:19:17');
INSERT INTO `sys_log` VALUES ('1346', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561966192929\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:29:53');
INSERT INTO `sys_log` VALUES ('1347', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561966423238\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:33:43');
INSERT INTO `sys_log` VALUES ('1348', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966446150\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:34:06');
INSERT INTO `sys_log` VALUES ('1349', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561966573381\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:36:13');
INSERT INTO `sys_log` VALUES ('1350', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966596396\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:36:36');
INSERT INTO `sys_log` VALUES ('1351', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561966693505\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:38:13');
INSERT INTO `sys_log` VALUES ('1352', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"11\",\"_\":\"1561966697368\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:38:17');
INSERT INTO `sys_log` VALUES ('1353', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561966699378\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:38:19');
INSERT INTO `sys_log` VALUES ('1354', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966701138\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:38:21');
INSERT INTO `sys_log` VALUES ('1355', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1561966768234\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:39:28');
INSERT INTO `sys_log` VALUES ('1356', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966770672\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:39:30');
INSERT INTO `sys_log` VALUES ('1357', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966806536\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:40:06');
INSERT INTO `sys_log` VALUES ('1358', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966856747\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:40:56');
INSERT INTO `sys_log` VALUES ('1359', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966932915\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:42:13');
INSERT INTO `sys_log` VALUES ('1360', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966950516\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:42:30');
INSERT INTO `sys_log` VALUES ('1361', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966962082\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:42:42');
INSERT INTO `sys_log` VALUES ('1362', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561966987076\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:43:07');
INSERT INTO `sys_log` VALUES ('1363', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1561967046479\"}', '0:0:0:0:0:0:0:1', '2019-07-01 15:44:06');
INSERT INTO `sys_log` VALUES ('1364', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品报溢\",\"orderNum\":0,\"parentId\":53,\"parentName\":\"库存管理\",\"type\":1,\"url\":\"sys/OverflowList.html\"}', '0:0:0:0:0:0:0:1', '2019-07-01 16:19:18');
INSERT INTO `sys_log` VALUES ('1365', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":1112.0,\"amountpayable\":1112.0,\"id\":8,\"purchasedateStr\":\"2019-07-01\",\"purchasenumber\":\"JH201907010001\",\"remarks\":\"qq\",\"state\":1,\"supplierid\":38}', '0:0:0:0:0:0:0:1', '2019-07-01 16:36:48');
INSERT INTO `sys_log` VALUES ('1366', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1112.0,\"amountpayable\":1112.0,\"purchasedateStr\":\"2019-07-01\",\"purchasenumber\":\"JH201907010002\",\"remarks\":\"www\",\"state\":1,\"supplierid\":11}', '0:0:0:0:0:0:0:1', '2019-07-01 16:55:24');
INSERT INTO `sys_log` VALUES ('1367', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":22.0,\"amountpayable\":22.0,\"purchasedateStr\":\"2019-07-01\",\"purchasenumber\":\"JH201907010003\",\"remarks\":\"eee\",\"state\":2,\"supplierid\":11}', '0:0:0:0:0:0:0:1', '2019-07-01 16:55:59');
INSERT INTO `sys_log` VALUES ('1368', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"盘点商品查询\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/GoodsCheckList.html\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:47:08');
INSERT INTO `sys_log` VALUES ('1369', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":145,\"name\":\"商品盘点查询\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/GoodsCheckList.html\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:48:21');
INSERT INTO `sys_log` VALUES ('1370', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[138,139]', '0:0:0:0:0:0:0:1', '2019-07-02 08:50:24');
INSERT INTO `sys_log` VALUES ('1371', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[137]', '0:0:0:0:0:0:0:1', '2019-07-02 08:51:23');
INSERT INTO `sys_log` VALUES ('1372', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562029036077\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:57:16');
INSERT INTO `sys_log` VALUES ('1373', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562029040342\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:57:20');
INSERT INTO `sys_log` VALUES ('1374', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"11\",\"_\":\"1562029049821\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:57:29');
INSERT INTO `sys_log` VALUES ('1375', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"24\",\"_\":\"1562029065498\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:57:45');
INSERT INTO `sys_log` VALUES ('1376', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"24\",\"_\":\"1562029081349\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:58:01');
INSERT INTO `sys_log` VALUES ('1377', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"26\",\"_\":\"1562029087185\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:58:07');
INSERT INTO `sys_log` VALUES ('1378', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"27\",\"_\":\"1562029094750\"}', '0:0:0:0:0:0:0:1', '2019-07-02 08:58:14');
INSERT INTO `sys_log` VALUES ('1379', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":3.0,\"price\":2.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-02 09:27:46');
INSERT INTO `sys_log` VALUES ('1380', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562033513316\"}', '0:0:0:0:0:0:0:1', '2019-07-02 10:11:53');
INSERT INTO `sys_log` VALUES ('1381', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562033560185\"}', '0:0:0:0:0:0:0:1', '2019-07-02 10:12:40');
INSERT INTO `sys_log` VALUES ('1382', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[52]', '0:0:0:0:0:0:0:1', '2019-07-02 13:44:54');
INSERT INTO `sys_log` VALUES ('1383', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"图表展示\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/echarts01.html\"}', '0:0:0:0:0:0:0:1', '2019-07-02 15:03:35');
INSERT INTO `sys_log` VALUES ('1384', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562051232936\"}', '0:0:0:0:0:0:0:1', '2019-07-02 15:07:13');
INSERT INTO `sys_log` VALUES ('1385', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562051380980\"}', '0:0:0:0:0:0:0:1', '2019-07-02 15:09:41');
INSERT INTO `sys_log` VALUES ('1386', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"24\",\"_\":\"1562051387937\"}', '0:0:0:0:0:0:0:1', '2019-07-02 15:09:48');
INSERT INTO `sys_log` VALUES ('1387', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[146]', '0:0:0:0:0:0:0:1', '2019-07-02 15:12:26');
INSERT INTO `sys_log` VALUES ('1388', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[165]', '0:0:0:0:0:0:0:1', '2019-07-02 16:06:11');
INSERT INTO `sys_log` VALUES ('1389', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"123\",\"contact\":\"123\",\"name\":\"a\",\"remarks\":\"123\"}', '0:0:0:0:0:0:0:1', '2019-07-02 16:30:19');
INSERT INTO `sys_log` VALUES ('1390', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[40]', '0:0:0:0:0:0:0:1', '2019-07-02 16:30:24');
INSERT INTO `sys_log` VALUES ('1391', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"退货商品图分析\",\"orderNum\":0,\"parentId\":66,\"parentName\":\"销售管理\",\"type\":1,\"url\":\"sys/CustomerReturnListGoodsecharts.html\"}', '0:0:0:0:0:0:0:1', '2019-07-02 17:45:42');
INSERT INTO `sys_log` VALUES ('1392', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"报损统计\",\"orderNum\":0,\"parentId\":53,\"parentName\":\"库存管理\",\"type\":1,\"url\":\"sys/damageecharts.html\"}', '0:0:0:0:0:0:0:1', '2019-07-03 14:08:25');
INSERT INTO `sys_log` VALUES ('1393', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486787000,\"code\":\"0003\",\"delflag\":0,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-03 14:32:33');
INSERT INTO `sys_log` VALUES ('1394', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486787000,\"code\":\"0003\",\"delflag\":0,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"num\":1.0,\"price\":1.0,\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-03 14:34:06');
INSERT INTO `sys_log` VALUES ('1395', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"32\",\"_\":\"1562138366834\"}', '0:0:0:0:0:0:0:1', '2019-07-03 15:19:27');
INSERT INTO `sys_log` VALUES ('1396', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":2.0,\"price\":2.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-03 15:43:19');
INSERT INTO `sys_log` VALUES ('1397', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"id\":8,\"purchasedateStr\":\"2019-07-24\",\"purchasenumber\":\"JH201907030001\",\"remarks\":\"12\",\"state\":1,\"supplierid\":8}', '0:0:0:0:0:0:0:1', '2019-07-03 16:22:34');
INSERT INTO `sys_log` VALUES ('1398', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":11.0,\"amountpayable\":11.0,\"purchasedateStr\":\"2019-07-24\",\"purchasenumber\":\"JH201907030001\",\"remarks\":\"qq\",\"state\":1,\"supplierid\":39}', '0:0:0:0:0:0:0:1', '2019-07-03 16:23:45');
INSERT INTO `sys_log` VALUES ('1399', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":112.0,\"amountpayable\":112.0,\"purchasedateStr\":\"2019-07-24\",\"purchasenumber\":\"JH201907030002\",\"remarks\":\"qqww\",\"state\":1,\"supplierid\":9}', '0:0:0:0:0:0:0:1', '2019-07-03 16:23:59');
INSERT INTO `sys_log` VALUES ('1400', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":1.0,\"price\":1.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-03 16:37:35');
INSERT INTO `sys_log` VALUES ('1401', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486787000,\"code\":\"0003\",\"delflag\":0,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-03 17:07:31');
INSERT INTO `sys_log` VALUES ('1402', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"id\":167,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907030003\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-03 17:32:13');
INSERT INTO `sys_log` VALUES ('1403', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":64,\"name\":\"商品报溢\",\"orderNum\":6,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlistgoods:list\",\"type\":1,\"url\":\"sys/overflowlistgoods.html\"}', '0:0:0:0:0:0:0:1', '2019-07-04 08:24:36');
INSERT INTO `sys_log` VALUES ('1404', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":144,\"name\":\"商品报溢报损查询\",\"orderNum\":0,\"parentId\":53,\"parentName\":\"库存管理\",\"type\":1,\"url\":\"sys/OverflowList.html\"}', '0:0:0:0:0:0:0:1', '2019-07-04 08:25:49');
INSERT INTO `sys_log` VALUES ('1405', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1561971447000,\"amountpaid\":22.0,\"amountpayable\":22.0,\"delflag\":0,\"id\":8,\"purchaseGoods\":[],\"purchasedate\":1561910400000,\"purchasenumber\":\"JH201907010003\",\"remarks\":\"eee\",\"state\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 09:18:33');
INSERT INTO `sys_log` VALUES ('1406', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562209284283\"}', '0:0:0:0:0:0:0:1', '2019-07-04 11:01:24');
INSERT INTO `sys_log` VALUES ('1407', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562209316494\"}', '0:0:0:0:0:0:0:1', '2019-07-04 11:01:56');
INSERT INTO `sys_log` VALUES ('1408', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562209412156\"}', '0:0:0:0:0:0:0:1', '2019-07-04 11:03:32');
INSERT INTO `sys_log` VALUES ('1409', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562209439498\"}', '0:0:0:0:0:0:0:1', '2019-07-04 11:03:59');
INSERT INTO `sys_log` VALUES ('1410', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562209476761\"}', '0:0:0:0:0:0:0:1', '2019-07-04 11:04:36');
INSERT INTO `sys_log` VALUES ('1411', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562209532817\"}', '0:0:0:0:0:0:0:1', '2019-07-04 11:05:32');
INSERT INTO `sys_log` VALUES ('1412', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562209540120\"}', '0:0:0:0:0:0:0:1', '2019-07-04 11:05:40');
INSERT INTO `sys_log` VALUES ('1413', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":122.0,\"amountpayable\":122.0,\"purchasedateStr\":\"2019-07-04\",\"purchasenumber\":\"JH201907040001\",\"remarks\":\"qwe\",\"state\":1,\"supplierid\":11}', '0:0:0:0:0:0:0:1', '2019-07-04 16:04:15');
INSERT INTO `sys_log` VALUES ('1414', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":12.0,\"price\":2.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 16:04:38');
INSERT INTO `sys_log` VALUES ('1415', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":222.0,\"amountpayable\":222.0,\"purchasedateStr\":\"2019-07-16\",\"purchasenumber\":\"JH201907040002\",\"remarks\":\"qqq\",\"state\":1,\"supplierid\":7}', '0:0:0:0:0:0:0:1', '2019-07-04 16:47:48');
INSERT INTO `sys_log` VALUES ('1416', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":221.0,\"amountpayable\":221.0,\"purchasedateStr\":\"2019-07-16\",\"purchasenumber\":\"JH201907040003\",\"remarks\":\"www\",\"state\":1,\"supplierid\":5}', '0:0:0:0:0:0:0:1', '2019-07-04 16:48:03');
INSERT INTO `sys_log` VALUES ('1417', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":2323.0,\"amountpayable\":2323.0,\"purchasedateStr\":\"2019-07-24\",\"purchasenumber\":\"JH201907040004\",\"remarks\":\"eeee\",\"state\":1,\"supplierid\":4}', '0:0:0:0:0:0:0:1', '2019-07-04 17:07:06');
INSERT INTO `sys_log` VALUES ('1418', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1212.0,\"amountpayable\":1212.0,\"purchasedateStr\":\"2019-07-30\",\"purchasenumber\":\"JH201907040005\",\"remarks\":\"eeee\",\"state\":1,\"supplierid\":3}', '0:0:0:0:0:0:0:1', '2019-07-04 17:07:20');
INSERT INTO `sys_log` VALUES ('1419', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":2.0,\"price\":22.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 17:08:22');
INSERT INTO `sys_log` VALUES ('1420', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":2.0,\"price\":2.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 17:33:59');
INSERT INTO `sys_log` VALUES ('1421', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":22.0,\"price\":22.0,\"purchaselistid\":171,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 17:47:35');
INSERT INTO `sys_log` VALUES ('1422', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":3.0,\"price\":2.0,\"purchaselistid\":171,\"typeid\":1,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 17:53:31');
INSERT INTO `sys_log` VALUES ('1423', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":62,\"name\":\"商品报溢\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-07-04 18:21:27');
INSERT INTO `sys_log` VALUES ('1424', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":22.0,\"price\":2.0,\"purchaselistid\":171,\"typeid\":4,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 18:27:18');
INSERT INTO `sys_log` VALUES ('1425', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486791000,\"code\":\"0004\",\"delflag\":0,\"model\":\"2斤装\",\"name\":\"新疆红枣\",\"num\":2.0,\"price\":2.0,\"purchaselistid\":171,\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 18:43:09');
INSERT INTO `sys_log` VALUES ('1426', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486794000,\"code\":\"0005\",\"delflag\":0,\"goodsid\":13,\"model\":\"散装500克\",\"name\":\"麦片燕麦巧克力\",\"num\":3.0,\"price\":22.0,\"purchaselistid\":171,\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-04 18:51:03');
INSERT INTO `sys_log` VALUES ('1427', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486809000,\"code\":\"0009\",\"delflag\":0,\"goodsid\":17,\"model\":\"240g装\",\"name\":\"休闲零食坚果特产精品干果无漂白大个开心果\",\"num\":22.0,\"price\":12.0,\"purchaselistid\":171,\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 08:47:28');
INSERT INTO `sys_log` VALUES ('1428', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[44]', '0:0:0:0:0:0:0:1', '2019-07-05 08:48:03');
INSERT INTO `sys_log` VALUES ('1429', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":62,\"name\":\"商品报溢添加\",\"orderNum\":4,\"parentId\":53,\"parentName\":\"库存管理\",\"perms\":\"sys:overflowlist:list\",\"type\":1,\"url\":\"sys/overflowlist.html\"}', '0:0:0:0:0:0:0:1', '2019-07-05 08:55:57');
INSERT INTO `sys_log` VALUES ('1430', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[40,41]', '0:0:0:0:0:0:0:1', '2019-07-05 09:02:35');
INSERT INTO `sys_log` VALUES ('1431', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"大连\",\"addtime\":1561001372000,\"contact\":\"王二\",\"id\":6,\"name\":\"aa\",\"num\":\"13956879654\",\"remarks\":\"优质客户\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 09:26:51');
INSERT INTO `sys_log` VALUES ('1432', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"大连\",\"addtime\":1561001372000,\"contact\":\"王小二\",\"id\":6,\"name\":\"aa\",\"num\":\"13956879654\",\"remarks\":\"优质客户\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 09:27:04');
INSERT INTO `sys_log` VALUES ('1433', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"大连\",\"addtime\":1561001372000,\"contact\":\"王二小\",\"id\":6,\"name\":\"aa\",\"num\":\"13956879654\",\"remarks\":\"优质客户\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 09:28:31');
INSERT INTO `sys_log` VALUES ('1434', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品报溢查询(y)\",\"orderNum\":0,\"parentId\":53,\"parentName\":\"库存管理\",\"type\":1,\"url\":\"sys/OverflowListly.html\"}', '0:0:0:0:0:0:0:1', '2019-07-05 09:58:36');
INSERT INTO `sys_log` VALUES ('1435', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":149,\"name\":\"商品报溢查询y\",\"orderNum\":0,\"parentId\":53,\"parentName\":\"库存管理\",\"type\":1,\"url\":\"sys/overflowlistgoodsly.html\"}', '0:0:0:0:0:0:0:1', '2019-07-05 09:59:22');
INSERT INTO `sys_log` VALUES ('1436', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":10.0,\"price\":1399.0,\"typeid\":4,\"unit\":\"台\",\"userid\":1}', '127.0.0.1', '2019-07-05 10:12:01');
INSERT INTO `sys_log` VALUES ('1437', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[25,27,29]', '0:0:0:0:0:0:0:1', '2019-07-05 10:19:24');
INSERT INTO `sys_log` VALUES ('1438', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907050001\",\"remarks\":\"不要钱\",\"supplierid\":41}', '0:0:0:0:0:0:0:1', '2019-07-05 10:32:51');
INSERT INTO `sys_log` VALUES ('1439', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907050001\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-05 11:00:38');
INSERT INTO `sys_log` VALUES ('1440', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.123,\"amountpayable\":123.123,\"purchasedateStr\":\"2019-07-18\",\"purchasenumber\":\"JH201907050001\",\"remarks\":\"不要钱了\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 11:04:55');
INSERT INTO `sys_log` VALUES ('1441', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486801000,\"code\":\"0007\",\"delflag\":0,\"goodsid\":15,\"model\":\"500g装\",\"name\":\"吉利人家牛肉味蛋糕\",\"num\":22.0,\"price\":9.0,\"purchaselistid\":171,\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 11:15:01');
INSERT INTO `sys_log` VALUES ('1442', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-02\",\"purchasenumber\":\"JH201907050002\",\"remarks\":\"啊啊\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 11:16:18');
INSERT INTO `sys_log` VALUES ('1443', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1234.0,\"amountpayable\":1234.0,\"purchasedateStr\":\"2019-07-16\",\"purchasenumber\":\"JH201907050003\",\"remarks\":\"qwe\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 11:27:25');
INSERT INTO `sys_log` VALUES ('1444', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12344.0,\"amountpayable\":12344.0,\"purchasedateStr\":\"2019-07-11\",\"purchasenumber\":\"JH201907050004\",\"remarks\":\"嗯嗯嗯\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 11:29:50');
INSERT INTO `sys_log` VALUES ('1445', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-21\",\"purchasenumber\":\"JH201907050005\",\"remarks\":\"123\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 11:38:38');
INSERT INTO `sys_log` VALUES ('1446', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":3.0,\"price\":2.0,\"purchaselistid\":179,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 11:40:15');
INSERT INTO `sys_log` VALUES ('1447', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-30\",\"purchasenumber\":\"JH201907050006\",\"remarks\":\"轻微\",\"state\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 11:42:57');
INSERT INTO `sys_log` VALUES ('1448', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1231.0,\"amountpayable\":1231.0,\"purchasedateStr\":\"2019-07-11\",\"purchasenumber\":\"JH201907050007\",\"remarks\":\"权威\",\"state\":1,\"supplierid\":39}', '0:0:0:0:0:0:0:1', '2019-07-05 11:45:11');
INSERT INTO `sys_log` VALUES ('1449', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12.0,\"amountpayable\":12.0,\"purchasedateStr\":\"2019-07-16\",\"purchasenumber\":\"JH201907050008\",\"remarks\":\"王企鹅\",\"state\":2,\"supplierid\":6}', '0:0:0:0:0:0:0:1', '2019-07-05 11:50:10');
INSERT INTO `sys_log` VALUES ('1450', 'admin', '保存', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"id\":0,\"sellingprice\":0.0,\"userid\":0}', '0:0:0:0:0:0:0:1', '2019-07-05 13:30:50');
INSERT INTO `sys_log` VALUES ('1451', 'admin', '保存', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"id\":0,\"sellingprice\":0.0,\"userid\":0}', '0:0:0:0:0:0:0:1', '2019-07-05 13:31:01');
INSERT INTO `sys_log` VALUES ('1452', 'admin', '保存', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"id\":0,\"sellingprice\":0.0,\"userid\":0}', '0:0:0:0:0:0:0:1', '2019-07-05 13:32:32');
INSERT INTO `sys_log` VALUES ('1453', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.123,\"amountpayable\":123.123,\"purchasedateStr\":\"2019-07-16\",\"purchasenumber\":\"JH201907050009\",\"remarks\":\"asd\",\"state\":1,\"supplierid\":9}', '0:0:0:0:0:0:0:1', '2019-07-05 13:37:35');
INSERT INTO `sys_log` VALUES ('1454', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"goodsid\":2,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":1.0,\"price\":1333.0,\"purchaselistid\":184,\"typeid\":4,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 13:43:15');
INSERT INTO `sys_log` VALUES ('1455', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486794000,\"code\":\"0005\",\"delflag\":0,\"goodsid\":13,\"model\":\"散装500克\",\"name\":\"麦片燕麦巧克力\",\"num\":10000.0,\"price\":2.0,\"purchaselistid\":184,\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 13:44:15');
INSERT INTO `sys_log` VALUES ('1456', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562305142000,\"amountpaid\":1333.0,\"amountpayable\":1333.0,\"delflag\":0,\"id\":184,\"purchaseGoods\":[],\"purchasedate\":1563206400000,\"purchasedateStr\":\"2019-07-24\",\"purchasenumber\":\"JH201907050009\",\"remarks\":\"不要钱\",\"state\":1,\"supplierid\":6,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 13:44:59');
INSERT INTO `sys_log` VALUES ('1457', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[168]', '0:0:0:0:0:0:0:1', '2019-07-05 13:49:48');
INSERT INTO `sys_log` VALUES ('1458', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[184]', '0:0:0:0:0:0:0:1', '2019-07-05 13:59:02');
INSERT INTO `sys_log` VALUES ('1459', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[184]', '0:0:0:0:0:0:0:1', '2019-07-05 13:59:31');
INSERT INTO `sys_log` VALUES ('1460', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-05 14:00:41');
INSERT INTO `sys_log` VALUES ('1461', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"18\",\"_\":\"1562306515200\"}', '0:0:0:0:0:0:0:1', '2019-07-05 14:02:00');
INSERT INTO `sys_log` VALUES ('1462', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[183,182,181]', '0:0:0:0:0:0:0:1', '2019-07-05 14:04:16');
INSERT INTO `sys_log` VALUES ('1463', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[171]', '0:0:0:0:0:0:0:1', '2019-07-05 14:05:47');
INSERT INTO `sys_log` VALUES ('1464', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-05 14:06:18');
INSERT INTO `sys_log` VALUES ('1465', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[184]', '0:0:0:0:0:0:0:1', '2019-07-05 14:08:22');
INSERT INTO `sys_log` VALUES ('1466', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-07-05 14:09:37');
INSERT INTO `sys_log` VALUES ('1467', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-05 14:11:15');
INSERT INTO `sys_log` VALUES ('1468', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-05 14:13:40');
INSERT INTO `sys_log` VALUES ('1469', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562298697000,\"amountpaid\":12.0,\"amountpayable\":12.0,\"delflag\":0,\"id\":183,\"purchaseGoods\":[],\"purchasedate\":1563206400000,\"purchasenumber\":\"JH201907050008\",\"remarks\":\"王企鹅\",\"state\":2,\"supplierid\":6,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 14:26:09');
INSERT INTO `sys_log` VALUES ('1470', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486806000,\"code\":\"0008\",\"delflag\":0,\"goodsid\":16,\"model\":\"128g装\",\"name\":\"奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品\",\"purchaselistid\":0,\"typeid\":8,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 14:27:12');
INSERT INTO `sys_log` VALUES ('1471', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562298697000,\"amountpaid\":12.0,\"amountpayable\":12.0,\"delflag\":0,\"id\":183,\"purchaseGoods\":[],\"purchasedate\":1563206400000,\"purchasedateStr\":\"2019-07-09\",\"purchasenumber\":\"JH201907050008\",\"remarks\":\"王企鹅\",\"state\":2,\"supplierid\":6,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 14:32:05');
INSERT INTO `sys_log` VALUES ('1472', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"18\",\"_\":\"1562308690492\"}', '0:0:0:0:0:0:0:1', '2019-07-05 14:38:17');
INSERT INTO `sys_log` VALUES ('1473', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"18\",\"_\":\"1562309048910\"}', '0:0:0:0:0:0:0:1', '2019-07-05 14:44:15');
INSERT INTO `sys_log` VALUES ('1474', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[2]', '0:0:0:0:0:0:0:1', '2019-07-05 14:46:11');
INSERT INTO `sys_log` VALUES ('1475', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"id\":1,\"inventoryquantity\":173,\"lastpurchasingprice\":8.0,\"minnum\":1001,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"producer\":\"贵州省贵阳南明老干妈风味的食品有限公司\",\"purchasingprice\":7.0,\"remarks\":\"好卖又好吃\",\"sellingprice\":8.0,\"state\":2,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 14:55:30');
INSERT INTO `sys_log` VALUES ('1476', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"id\":1,\"inventoryquantity\":172,\"lastpurchasingprice\":8.0,\"minnum\":1001,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"producer\":\"贵州省贵阳南明老干妈风味的食品有限公司\",\"purchasingprice\":7.0,\"remarks\":\"好卖又好吃\",\"sellingprice\":8.0,\"state\":2,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 14:55:39');
INSERT INTO `sys_log` VALUES ('1477', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-07-05 14:56:51');
INSERT INTO `sys_log` VALUES ('1478', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"id\":2,\"inventoryquantity\":138,\"lastpurchasingprice\":2220.0,\"minnum\":400,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"producer\":\"华为计算机系统有限公司\",\"purchasingprice\":1955.0,\"remarks\":\"热销\",\"sellingprice\":8888.0,\"state\":2,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 14:57:49');
INSERT INTO `sys_log` VALUES ('1479', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"id\":2,\"lastpurchasingprice\":2220.0,\"minnum\":400,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"producer\":\"华为计算机系统有限公司\",\"purchasingprice\":1955.0,\"remarks\":\"热销\",\"sellingprice\":8888.0,\"state\":2,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 14:58:59');
INSERT INTO `sys_log` VALUES ('1480', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"id\":2,\"lastpurchasingprice\":2220.0,\"minnum\":400,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"producer\":\"华为计算机系统有限公司\",\"remarks\":\"热销\",\"sellingprice\":8888.0,\"state\":2,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 14:59:08');
INSERT INTO `sys_log` VALUES ('1481', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"id\":1,\"inventoryquantity\":172,\"lastpurchasingprice\":8.0,\"minnum\":1001,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"producer\":\"贵州省贵阳南明老干妈风味的食品有限公司\",\"purchasingprice\":21.0,\"remarks\":\"好卖又好吃\",\"sellingprice\":8.0,\"state\":2,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 15:10:37');
INSERT INTO `sys_log` VALUES ('1482', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"id\":1,\"inventoryquantity\":172,\"lastpurchasingprice\":8.0,\"minnum\":1001,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"producer\":\"贵州省贵阳南明老干妈风味的食品有限公司\",\"purchasingprice\":7.0,\"remarks\":\"好卖又好吃\",\"sellingprice\":8.0,\"state\":2,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 15:10:49');
INSERT INTO `sys_log` VALUES ('1483', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:19:50');
INSERT INTO `sys_log` VALUES ('1484', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:19:51');
INSERT INTO `sys_log` VALUES ('1485', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:19:53');
INSERT INTO `sys_log` VALUES ('1486', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"id\":1,\"inventoryquantity\":172,\"lastpurchasingprice\":8.0,\"minnum\":1001,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"producer\":\"贵州省贵阳南明老干妈风味的食品有限公司\",\"purchasingprice\":7.0,\"remarks\":\"好卖又好吃\",\"sellingprice\":8.0,\"state\":2,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 15:21:36');
INSERT INTO `sys_log` VALUES ('1487', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"18\",\"_\":\"1562311619848\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:27:09');
INSERT INTO `sys_log` VALUES ('1488', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"12\",\"_\":\"1562311768150\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:29:38');
INSERT INTO `sys_log` VALUES ('1489', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"13\",\"_\":\"1562311932856\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:32:19');
INSERT INTO `sys_log` VALUES ('1490', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"12\",\"_\":\"1562312089917\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:34:57');
INSERT INTO `sys_log` VALUES ('1491', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"12\",\"_\":\"1562312264032\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:37:50');
INSERT INTO `sys_log` VALUES ('1492', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"1333\",\"_\":\"1562312307987\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:38:36');
INSERT INTO `sys_log` VALUES ('1493', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"8\",\"userid\":\"1\",\"newprice\":\"5888\",\"_\":\"1562313109645\"}', '0:0:0:0:0:0:0:1', '2019-07-05 15:52:00');
INSERT INTO `sys_log` VALUES ('1494', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[179]', '0:0:0:0:0:0:0:1', '2019-07-05 15:59:50');
INSERT INTO `sys_log` VALUES ('1495', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[184]', '0:0:0:0:0:0:0:1', '2019-07-05 16:01:25');
INSERT INTO `sys_log` VALUES ('1496', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[179]', '0:0:0:0:0:0:0:1', '2019-07-05 16:02:14');
INSERT INTO `sys_log` VALUES ('1497', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[183,182,181]', '0:0:0:0:0:0:0:1', '2019-07-05 16:04:22');
INSERT INTO `sys_log` VALUES ('1498', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[171]', '0:0:0:0:0:0:0:1', '2019-07-05 16:06:06');
INSERT INTO `sys_log` VALUES ('1499', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"5888\",\"userid\":\"1\",\"newprice\":\"1888\",\"_\":\"1562313994560\"}', '0:0:0:0:0:0:0:1', '2019-07-05 16:06:46');
INSERT INTO `sys_log` VALUES ('1500', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[184]', '0:0:0:0:0:0:0:1', '2019-07-05 16:10:47');
INSERT INTO `sys_log` VALUES ('1501', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"1888\",\"userid\":\"1\",\"newprice\":\"188\",\"_\":\"1562314290056\"}', '0:0:0:0:0:0:0:1', '2019-07-05 16:11:38');
INSERT INTO `sys_log` VALUES ('1502', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[179]', '0:0:0:0:0:0:0:1', '2019-07-05 16:12:32');
INSERT INTO `sys_log` VALUES ('1503', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"188\",\"userid\":\"1\",\"newprice\":\"68\",\"_\":\"1562314387143\"}', '0:0:0:0:0:0:0:1', '2019-07-05 16:13:15');
INSERT INTO `sys_log` VALUES ('1504', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"68\",\"userid\":\"1\",\"newprice\":\"19\",\"_\":\"1562314474880\"}', '0:0:0:0:0:0:0:1', '2019-07-05 16:14:44');
INSERT INTO `sys_log` VALUES ('1505', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"8888\",\"userid\":\"1\",\"newprice\":\"7778\",\"_\":\"1562314474884\"}', '0:0:0:0:0:0:0:1', '2019-07-05 16:15:18');
INSERT INTO `sys_log` VALUES ('1506', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-07-05 16:22:55');
INSERT INTO `sys_log` VALUES ('1507', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-05 16:23:51');
INSERT INTO `sys_log` VALUES ('1508', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-07-05 16:25:44');
INSERT INTO `sys_log` VALUES ('1509', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-07-05 16:25:45');
INSERT INTO `sys_log` VALUES ('1510', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-05 16:28:09');
INSERT INTO `sys_log` VALUES ('1511', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[182]', '0:0:0:0:0:0:0:1', '2019-07-05 16:36:17');
INSERT INTO `sys_log` VALUES ('1512', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[184]', '0:0:0:0:0:0:0:1', '2019-07-05 16:40:05');
INSERT INTO `sys_log` VALUES ('1513', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[179]', '0:0:0:0:0:0:0:1', '2019-07-05 16:41:19');
INSERT INTO `sys_log` VALUES ('1514', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[183,182,181,180]', '0:0:0:0:0:0:0:1', '2019-07-05 16:41:25');
INSERT INTO `sys_log` VALUES ('1515', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[178,169]', '0:0:0:0:0:0:0:1', '2019-07-05 16:41:30');
INSERT INTO `sys_log` VALUES ('1516', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[168]', '0:0:0:0:0:0:0:1', '2019-07-05 16:48:48');
INSERT INTO `sys_log` VALUES ('1517', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":3.0,\"price\":2.0,\"purchaselistid\":176,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 17:22:28');
INSERT INTO `sys_log` VALUES ('1518', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"goodsid\":2,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":1.0,\"price\":2222.0,\"purchaselistid\":166,\"typeid\":16,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 17:23:10');
INSERT INTO `sys_log` VALUES ('1519', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486787000,\"code\":\"0003\",\"delflag\":0,\"goodsid\":11,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"num\":2.0,\"price\":-1.0,\"purchaselistid\":166,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-05 17:25:03');
INSERT INTO `sys_log` VALUES ('1520', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"11\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:35:32');
INSERT INTO `sys_log` VALUES ('1521', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"56\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:36:23');
INSERT INTO `sys_log` VALUES ('1522', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"55\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:36:35');
INSERT INTO `sys_log` VALUES ('1523', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"52\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:36:55');
INSERT INTO `sys_log` VALUES ('1524', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"49\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:37:14');
INSERT INTO `sys_log` VALUES ('1525', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"50\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:37:21');
INSERT INTO `sys_log` VALUES ('1526', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"52\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:37:42');
INSERT INTO `sys_log` VALUES ('1527', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"53\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:37:46');
INSERT INTO `sys_log` VALUES ('1528', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"55\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:18');
INSERT INTO `sys_log` VALUES ('1529', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"56\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:21');
INSERT INTO `sys_log` VALUES ('1530', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"54\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:24');
INSERT INTO `sys_log` VALUES ('1531', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"54\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:30');
INSERT INTO `sys_log` VALUES ('1532', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"30\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:39');
INSERT INTO `sys_log` VALUES ('1533', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"56\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:45');
INSERT INTO `sys_log` VALUES ('1534', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"55\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:50');
INSERT INTO `sys_log` VALUES ('1535', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"54\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:54');
INSERT INTO `sys_log` VALUES ('1536', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"54\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:39:57');
INSERT INTO `sys_log` VALUES ('1537', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"53\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:03');
INSERT INTO `sys_log` VALUES ('1538', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"52\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:06');
INSERT INTO `sys_log` VALUES ('1539', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"50\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:09');
INSERT INTO `sys_log` VALUES ('1540', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"49\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:12');
INSERT INTO `sys_log` VALUES ('1541', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"30\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:18');
INSERT INTO `sys_log` VALUES ('1542', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"49\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:39');
INSERT INTO `sys_log` VALUES ('1543', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"47\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:44');
INSERT INTO `sys_log` VALUES ('1544', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"45\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:47');
INSERT INTO `sys_log` VALUES ('1545', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"43\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:49');
INSERT INTO `sys_log` VALUES ('1546', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"42\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:53');
INSERT INTO `sys_log` VALUES ('1547', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"49\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:40:59');
INSERT INTO `sys_log` VALUES ('1548', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"49\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:41:35');
INSERT INTO `sys_log` VALUES ('1549', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"43\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:42:04');
INSERT INTO `sys_log` VALUES ('1550', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1562234098000,\"code\":\"0002\",\"delflag\":0,\"id\":43,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":3.0,\"price\":2333.0,\"purchaselistid\":171,\"total\":6.0,\"typeid\":1,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 08:42:45');
INSERT INTO `sys_log` VALUES ('1551', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"43\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:43:03');
INSERT INTO `sys_log` VALUES ('1552', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"43\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:45:36');
INSERT INTO `sys_log` VALUES ('1553', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"42\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:46:08');
INSERT INTO `sys_log` VALUES ('1554', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"46\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:46:53');
INSERT INTO `sys_log` VALUES ('1555', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"42\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:47:03');
INSERT INTO `sys_log` VALUES ('1556', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1562233742000,\"code\":\"0001\",\"delflag\":0,\"id\":42,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":22.0,\"price\":2223.0,\"purchaselistid\":171,\"total\":484.0,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 08:48:04');
INSERT INTO `sys_log` VALUES ('1557', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"56\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:53:00');
INSERT INTO `sys_log` VALUES ('1558', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1562318793000,\"code\":\"0003\",\"delflag\":0,\"goodsid\":11,\"id\":56,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"num\":2.0,\"price\":222.0,\"purchaselistid\":166,\"total\":-2.0,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 08:53:05');
INSERT INTO `sys_log` VALUES ('1559', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"55\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:53:10');
INSERT INTO `sys_log` VALUES ('1560', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"56\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:53:34');
INSERT INTO `sys_log` VALUES ('1561', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1562318793000,\"code\":\"0003\",\"delflag\":0,\"goodsid\":11,\"id\":56,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"num\":333.0,\"price\":222.0,\"purchaselistid\":166,\"total\":-2.0,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 08:53:39');
INSERT INTO `sys_log` VALUES ('1562', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"56\"', '0:0:0:0:0:0:0:1', '2019-07-08 08:54:00');
INSERT INTO `sys_log` VALUES ('1563', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"num\":333.0,\"price\":222.0,\"purchaselistid\":166,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 08:54:48');
INSERT INTO `sys_log` VALUES ('1564', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"大连湾\",\"addtime\":1562235893000,\"contact\":\"是你\",\"delflag\":0,\"id\":41,\"name\":\"大连成成成\",\"num\":\"1\",\"remarks\":\"优质供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 09:08:23');
INSERT INTO `sys_log` VALUES ('1565', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[39]', '127.0.0.1', '2019-07-08 09:23:44');
INSERT INTO `sys_log` VALUES ('1566', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"功能测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-08 09:33:25');
INSERT INTO `sys_log` VALUES ('1567', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李豪的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 09:35:17');
INSERT INTO `sys_log` VALUES ('1568', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"韩涛的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/temp_hantao.html\"}', '127.0.0.1', '2019-07-08 09:52:43');
INSERT INTO `sys_log` VALUES ('1569', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"sellingprice\":\"19\",\"userid\":\"1\",\"newprice\":\"17\",\"_\":\"1562550798964\"}', '0:0:0:0:0:0:0:1', '2019-07-08 09:53:37');
INSERT INTO `sys_log` VALUES ('1570', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"功能测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1}', '127.0.0.1', '2019-07-08 09:55:01');
INSERT INTO `sys_log` VALUES ('1571', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"赵文鑫的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/user.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 09:56:31');
INSERT INTO `sys_log` VALUES ('1572', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"功能测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-08 09:57:27');
INSERT INTO `sys_log` VALUES ('1573', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"试试就逝世\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 09:57:59');
INSERT INTO `sys_log` VALUES ('1574', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"试试就逝世\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-08 09:58:21');
INSERT INTO `sys_log` VALUES ('1575', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562231327000,\"amountpaid\":111.0,\"amountpayable\":111.0,\"delflag\":0,\"id\":171,\"purchaseGoods\":[],\"purchasedate\":1564416000000,\"purchasedateStr\":\"2019-07-30\",\"purchasenumber\":\"JH201907080001\",\"remarks\":\"rrr\",\"state\":1,\"supplierid\":11,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:02:18');
INSERT INTO `sys_log` VALUES ('1576', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"功能测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-08 10:03:13');
INSERT INTO `sys_log` VALUES ('1577', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"大禹的测试\",\"orderNum\":0,\"parentId\":155,\"parentName\":\"试试就逝世\",\"type\":1,\"url\":\"sys/temp/xiayu.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:02:45');
INSERT INTO `sys_log` VALUES ('1578', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562231327000,\"amountpaid\":1211.0,\"amountpayable\":1211.0,\"delflag\":0,\"id\":171,\"purchaseGoods\":[],\"purchasedate\":1564416000000,\"purchasedateStr\":\"2019-07-30\",\"purchasenumber\":\"JH201907080002\",\"remarks\":\"tttrrr\",\"state\":1,\"supplierid\":1,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:03:09');
INSERT INTO `sys_log` VALUES ('1579', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562231327000,\"amountpaid\":1.11111112E8,\"amountpayable\":1.1111111E7,\"delflag\":0,\"id\":171,\"purchaseGoods\":[],\"purchasedate\":1564416000000,\"purchasedateStr\":\"2019-07-30\",\"purchasenumber\":\"JH201907080003\",\"remarks\":\"gggg\",\"state\":1,\"supplierid\":42,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:05:45');
INSERT INTO `sys_log` VALUES ('1580', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"刘莉的功能测试\",\"orderNum\":0,\"parentId\":154,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:08:54');
INSERT INTO `sys_log` VALUES ('1581', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562296665000,\"amountpaid\":1231.0,\"amountpayable\":1231.0,\"delflag\":0,\"id\":177,\"purchaseGoods\":[],\"purchasedate\":1561996800000,\"purchasedateStr\":\"2019-07-02\",\"purchasenumber\":\"JH201907080004\",\"remarks\":\"rrr\",\"state\":1,\"supplierid\":38,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:09:47');
INSERT INTO `sys_log` VALUES ('1582', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"张健的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:10:30');
INSERT INTO `sys_log` VALUES ('1583', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"刘莉的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:13:05');
INSERT INTO `sys_log` VALUES ('1584', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"工程测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:12:37');
INSERT INTO `sys_log` VALUES ('1585', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":444.0,\"amountpayable\":444.0,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907080005\",\"remarks\":\"ttt\",\"state\":1,\"supplierid\":28}', '0:0:0:0:0:0:0:1', '2019-07-08 10:14:10');
INSERT INTO `sys_log` VALUES ('1586', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[161]', '0:0:0:0:0:0:0:1', '2019-07-08 10:14:10');
INSERT INTO `sys_log` VALUES ('1587', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[160]', '0:0:0:0:0:0:0:1', '2019-07-08 10:14:12');
INSERT INTO `sys_log` VALUES ('1588', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"icon\":\"https://icon.52112.com/icon/2147457.html\",\"name\":\"杨帆的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:15:03');
INSERT INTO `sys_log` VALUES ('1589', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":444.0,\"amountpayable\":444.0,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907080005\",\"remarks\":\"rrr\",\"state\":1,\"supplierid\":28}', '0:0:0:0:0:0:0:1', '2019-07-08 10:15:14');
INSERT INTO `sys_log` VALUES ('1590', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[154]', '0:0:0:0:0:0:0:1', '2019-07-08 10:15:03');
INSERT INTO `sys_log` VALUES ('1591', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"田源的测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:16:26');
INSERT INTO `sys_log` VALUES ('1592', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"刘莉的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:17:17');
INSERT INTO `sys_log` VALUES ('1593', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"田源的测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/tianyuan.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:16:46');
INSERT INTO `sys_log` VALUES ('1594', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907080005\",\"remarks\":\"rrr\",\"state\":1,\"supplierid\":28}', '0:0:0:0:0:0:0:1', '2019-07-08 10:17:24');
INSERT INTO `sys_log` VALUES ('1595', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":159,\"name\":\"张健的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/zhangjian.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:17:47');
INSERT INTO `sys_log` VALUES ('1596', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"黄蓉的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:19:00');
INSERT INTO `sys_log` VALUES ('1597', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"icon\":\"T.T\",\"menuId\":162,\"name\":\"杨帆的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/yf_product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:24:07');
INSERT INTO `sys_log` VALUES ('1598', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":6.0,\"amountpayable\":6.0,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907080005\",\"remarks\":\"y\",\"state\":1,\"supplierid\":42}', '0:0:0:0:0:0:0:1', '2019-07-08 10:24:48');
INSERT INTO `sys_log` VALUES ('1599', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:25:14');
INSERT INTO `sys_log` VALUES ('1600', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":6.0,\"amountpayable\":6.0,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907080005\",\"remarks\":\"y\",\"state\":1,\"supplierid\":42}', '0:0:0:0:0:0:0:1', '2019-07-08 10:25:55');
INSERT INTO `sys_log` VALUES ('1601', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:26:01');
INSERT INTO `sys_log` VALUES ('1602', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":2010.0,\"amountpayable\":2010.0,\"purchasedateStr\":\"2019-07-08\",\"purchasenumber\":\"JH201907080005\",\"remarks\":\"231\",\"state\":1,\"supplierid\":41}', '0:0:0:0:0:0:0:1', '2019-07-08 10:26:45');
INSERT INTO `sys_log` VALUES ('1603', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0,\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:26:24');
INSERT INTO `sys_log` VALUES ('1604', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":444.0,\"amountpayable\":444.0,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907080006\",\"remarks\":\"1\",\"state\":1,\"supplierid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:29:38');
INSERT INTO `sys_log` VALUES ('1605', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"LR的测试\",\"orderNum\":0,\"parentId\":166,\"parentName\":\"测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:39:07');
INSERT INTO `sys_log` VALUES ('1606', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[167]', '0:0:0:0:0:0:0:1', '2019-07-08 10:41:38');
INSERT INTO `sys_log` VALUES ('1607', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒\",\"purchaselistid\":171,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:43:51');
INSERT INTO `sys_log` VALUES ('1608', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[166]', '0:0:0:0:0:0:0:1', '2019-07-08 10:43:28');
INSERT INTO `sys_log` VALUES ('1609', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李瑞的测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 10:44:31');
INSERT INTO `sys_log` VALUES ('1610', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"purchasedateStr\":\"\",\"purchasenumber\":\"JH201907080006\",\"remarks\":\"r\",\"state\":1,\"supplierid\":42}', '0:0:0:0:0:0:0:1', '2019-07-08 10:45:22');
INSERT INTO `sys_log` VALUES ('1611', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1.0,\"amountpayable\":1.0,\"purchasedateStr\":\"2019-07-17\",\"purchasenumber\":\"JH201907080006\",\"remarks\":\"t\",\"state\":1,\"supplierid\":42}', '0:0:0:0:0:0:0:1', '2019-07-08 10:47:18');
INSERT INTO `sys_log` VALUES ('1612', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562296665000,\"amountpaid\":1.0,\"amountpayable\":1.0,\"delflag\":0,\"id\":177,\"purchaseGoods\":[],\"purchasedate\":1561996800000,\"purchasedateStr\":\"2019-07-03\",\"purchasenumber\":\"JH201907080007\",\"remarks\":\"r\",\"state\":1,\"supplierid\":38,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:58:07');
INSERT INTO `sys_log` VALUES ('1613', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562554131000,\"amountpaid\":1.0,\"amountpayable\":1.0,\"delflag\":0,\"id\":186,\"purchaseGoods\":[],\"purchasedate\":1563292800000,\"purchasedateStr\":\"2019-07-15\",\"purchasenumber\":\"JH201907080006\",\"remarks\":\"t\",\"state\":1,\"supplierid\":42,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 10:59:10');
INSERT INTO `sys_log` VALUES ('1614', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":153,\"name\":\"赵文鑫的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/wenxin.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:05:26');
INSERT INTO `sys_log` VALUES ('1615', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":165,\"name\":\"黄蓉的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:06:14');
INSERT INTO `sys_log` VALUES ('1616', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李亚娟的功能测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/temp/user.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:11:08');
INSERT INTO `sys_log` VALUES ('1617', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486787000,\"code\":\"0003\",\"delflag\":0,\"goodsid\":11,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:10:25');
INSERT INTO `sys_log` VALUES ('1618', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"功能测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-08 11:11:15');
INSERT INTO `sys_log` VALUES ('1619', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"王奇的的功能测试\",\"orderNum\":0,\"parentId\":156,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:13:40');
INSERT INTO `sys_log` VALUES ('1620', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":170,\"name\":\"功能测试1\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-08 11:16:58');
INSERT INTO `sys_log` VALUES ('1621', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[170]', '0:0:0:0:0:0:0:1', '2019-07-08 11:17:46');
INSERT INTO `sys_log` VALUES ('1622', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486787000,\"code\":\"0003\",\"delflag\":0,\"goodsid\":11,\"model\":\"500g装\",\"name\":\"野生东北黑木耳\",\"num\":33.0,\"price\":1.0,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:16:04');
INSERT INTO `sys_log` VALUES ('1623', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[169]', '0:0:0:0:0:0:0:1', '2019-07-08 11:17:56');
INSERT INTO `sys_log` VALUES ('1624', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":156,\"name\":\"功能测试23\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-08 11:18:20');
INSERT INTO `sys_log` VALUES ('1625', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[156]', '0:0:0:0:0:0:0:1', '2019-07-08 11:19:13');
INSERT INTO `sys_log` VALUES ('1626', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试测试测试\",\"price\":1.0,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:18:45');
INSERT INTO `sys_log` VALUES ('1627', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李亚娟的功能测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/temp/user.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:21:17');
INSERT INTO `sys_log` VALUES ('1628', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/temp/wangqi.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:20:22');
INSERT INTO `sys_log` VALUES ('1629', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"王奇的测试功能\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/temp/wangqi.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:20:47');
INSERT INTO `sys_log` VALUES ('1630', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[172]', '0:0:0:0:0:0:0:1', '2019-07-08 11:22:39');
INSERT INTO `sys_log` VALUES ('1631', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李亚娟的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/user.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:24:48');
INSERT INTO `sys_log` VALUES ('1632', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[171,173]', '0:0:0:0:0:0:0:1', '2019-07-08 11:25:21');
INSERT INTO `sys_log` VALUES ('1633', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"goodsid\":2,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"typeid\":16,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:28:15');
INSERT INTO `sys_log` VALUES ('1634', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"goodsid\":2,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":20.0,\"price\":2.0,\"typeid\":16,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:29:21');
INSERT INTO `sys_log` VALUES ('1635', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"goodsid\":2,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":13.0,\"price\":12.0,\"typeid\":16,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:31:21');
INSERT INTO `sys_log` VALUES ('1636', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"大连\",\"contact\":\"王二小\",\"name\":\"as\",\"num\":\"13598659879\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:31:05');
INSERT INTO `sys_log` VALUES ('1637', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"大连\",\"addtime\":1562556666000,\"contact\":\"王二小\",\"id\":7,\"name\":\"as\",\"num\":\"13569894978\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:31:31');
INSERT INTO `sys_log` VALUES ('1638', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试\",\"num\":123.0,\"price\":12.0,\"purchaselistid\":184,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:34:01');
INSERT INTO `sys_log` VALUES ('1639', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"大凉山妥洛村\",\"addtime\":1558334050000,\"contact\":\"小爱\",\"id\":3,\"name\":\"大凉山希望小学\",\"num\":\"13233243211\",\"remarks\":\"照顾客户2\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:31:51');
INSERT INTO `sys_log` VALUES ('1640', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"65\"', '0:0:0:0:0:0:0:1', '2019-07-08 11:34:10');
INSERT INTO `sys_log` VALUES ('1641', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1562556933000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"id\":65,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试\",\"num\":123.0,\"price\":11.0,\"purchaselistid\":184,\"total\":1476.0,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:34:15');
INSERT INTO `sys_log` VALUES ('1642', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"65\"', '0:0:0:0:0:0:0:1', '2019-07-08 11:34:24');
INSERT INTO `sys_log` VALUES ('1643', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1562556933000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"id\":65,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试\",\"num\":123.0,\"price\":10.0,\"purchaselistid\":184,\"total\":1353.0,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 11:34:31');
INSERT INTO `sys_log` VALUES ('1644', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":174,\"name\":\"李亚娟的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/user.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:44:28');
INSERT INTO `sys_log` VALUES ('1645', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"王奇的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/wangqi.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 11:47:54');
INSERT INTO `sys_log` VALUES ('1646', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0002\",\"delflag\":0,\"goodsid\":2,\"model\":\"Note8\",\"name\":\"华为荣耀Note9\",\"num\":20.0,\"price\":20.0,\"purchaselistid\":185,\"typeid\":16,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 13:08:47');
INSERT INTO `sys_log` VALUES ('1647', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"王思宇的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 13:12:17');
INSERT INTO `sys_log` VALUES ('1648', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试\",\"num\":22.0,\"price\":8.0,\"purchaselistid\":185,\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 13:24:14');
INSERT INTO `sys_log` VALUES ('1649', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486798000,\"code\":\"0006\",\"delflag\":0,\"goodsid\":14,\"model\":\"300g装\",\"name\":\"冰糖金桔干\",\"num\":13.0,\"price\":8.0,\"purchaselistid\":185,\"typeid\":11,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 13:24:27');
INSERT INTO `sys_log` VALUES ('1650', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486812000,\"code\":\"0010\",\"delflag\":0,\"goodsid\":18,\"model\":\"250g装\",\"name\":\"劲仔小鱼干\",\"num\":3.0,\"price\":22.0,\"purchaselistid\":185,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 13:24:37');
INSERT INTO `sys_log` VALUES ('1651', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486806000,\"code\":\"0008\",\"delflag\":0,\"goodsid\":16,\"model\":\"128g装\",\"name\":\"奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品\",\"num\":33.0,\"price\":22.0,\"purchaselistid\":185,\"typeid\":11,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 13:24:51');
INSERT INTO `sys_log` VALUES ('1652', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486801000,\"code\":\"0007\",\"delflag\":0,\"goodsid\":15,\"model\":\"500g装\",\"name\":\"吉利人家牛肉味蛋糕\",\"num\":22.0,\"price\":30.0,\"purchaselistid\":185,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 13:25:13');
INSERT INTO `sys_log` VALUES ('1653', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486887000,\"code\":\"0020\",\"delflag\":0,\"goodsid\":29,\"model\":\"190WDPT\",\"name\":\"haier\",\"num\":33.0,\"price\":2222.0,\"purchaselistid\":185,\"typeid\":14,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 13:32:28');
INSERT INTO `sys_log` VALUES ('1654', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[66]', '0:0:0:0:0:0:0:1', '2019-07-08 13:39:00');
INSERT INTO `sys_log` VALUES ('1655', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"132456789\",\"mobile\":\"15555445568\",\"roleIdList\":[],\"status\":1,\"username\":\"user\"}', '0:0:0:0:0:0:0:1', '2019-07-08 13:42:08');
INSERT INTO `sys_log` VALUES ('1656', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"132456789@qq.com\",\"mobile\":\"15555445568\",\"roleIdList\":[],\"status\":1,\"username\":\"user\"}', '0:0:0:0:0:0:0:1', '2019-07-08 13:42:15');
INSERT INTO `sys_log` VALUES ('1657', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"132456789@qq.com\",\"mobile\":\"15555445568\",\"roleIdList\":[],\"status\":1,\"username\":\"user\"}', '0:0:0:0:0:0:0:1', '2019-07-08 13:42:22');
INSERT INTO `sys_log` VALUES ('1658', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"132456789@qq.com\",\"mobile\":\"15555445568\",\"roleIdList\":[],\"status\":1,\"username\":\"user\"}', '0:0:0:0:0:0:0:1', '2019-07-08 13:42:26');
INSERT INTO `sys_log` VALUES ('1659', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[71,72]', '0:0:0:0:0:0:0:1', '2019-07-08 13:45:23');
INSERT INTO `sys_log` VALUES ('1660', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"67\"', '0:0:0:0:0:0:0:1', '2019-07-08 13:54:01');
INSERT INTO `sys_log` VALUES ('1661', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"70\"', '0:0:0:0:0:0:0:1', '2019-07-08 13:54:22');
INSERT INTO `sys_log` VALUES ('1662', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"70\"', '0:0:0:0:0:0:0:1', '2019-07-08 13:54:35');
INSERT INTO `sys_log` VALUES ('1663', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"70\"', '0:0:0:0:0:0:0:1', '2019-07-08 13:54:48');
INSERT INTO `sys_log` VALUES ('1664', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"70\"', '0:0:0:0:0:0:0:1', '2019-07-08 13:55:03');
INSERT INTO `sys_log` VALUES ('1665', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"mobile\":\"15712341234\",\"roleIdList\":[],\"status\":1,\"username\":\"weq\"}', '0:0:0:0:0:0:0:1', '2019-07-08 13:58:20');
INSERT INTO `sys_log` VALUES ('1666', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"@12312\",\"mobile\":\"15712341234\",\"roleIdList\":[],\"status\":1,\"username\":\"weq\"}', '0:0:0:0:0:0:0:1', '2019-07-08 13:58:27');
INSERT INTO `sys_log` VALUES ('1667', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"70\"', '0:0:0:0:0:0:0:1', '2019-07-08 14:00:05');
INSERT INTO `sys_log` VALUES ('1668', 'admin', '修改用户', 'com.erpdemo.controller.SysPurchaseGoodsController.update()', '{\"addtime\":1562563583000,\"code\":\"0008\",\"delflag\":0,\"goodsid\":16,\"id\":70,\"model\":\"128g装\",\"name\":\"奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品\",\"num\":10.0,\"price\":30.0,\"purchaselistid\":185,\"total\":726.0,\"typeid\":11,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 14:00:29');
INSERT INTO `sys_log` VALUES ('1669', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"1231@qq.com\",\"mobile\":\"15712341234\",\"roleIdList\":[],\"status\":1,\"username\":\"weq\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:01:03');
INSERT INTO `sys_log` VALUES ('1670', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"1231@qq.com\",\"mobile\":\"15712341234\",\"roleIdList\":[],\"status\":1,\"username\":\"是暗示\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:01:20');
INSERT INTO `sys_log` VALUES ('1671', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"辽宁省大连市甘井子区\",\"contact\":\"小爱\",\"name\":\"小黄鸭有限公司\",\"num\":\"135987655484\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:00:57');
INSERT INTO `sys_log` VALUES ('1672', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试\",\"sellingprice\":\"17\",\"userid\":\"1\",\"newprice\":\"18\",\"_\":\"1562565792319\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:03:20');
INSERT INTO `sys_log` VALUES ('1673', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"num\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:03:53');
INSERT INTO `sys_log` VALUES ('1674', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-08 14:09:06');
INSERT INTO `sys_log` VALUES ('1675', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-08 14:13:06');
INSERT INTO `sys_log` VALUES ('1676', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:23:07');
INSERT INTO `sys_log` VALUES ('1677', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[50]', '0:0:0:0:0:0:0:1', '2019-07-08 14:23:13');
INSERT INTO `sys_log` VALUES ('1678', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-08 14:21:48');
INSERT INTO `sys_log` VALUES ('1679', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-08 14:24:34');
INSERT INTO `sys_log` VALUES ('1680', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"asd\",\"contact\":\"asd\",\"name\":\"\",\"remarks\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:33:51');
INSERT INTO `sys_log` VALUES ('1681', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[51]', '0:0:0:0:0:0:0:1', '2019-07-08 14:33:55');
INSERT INTO `sys_log` VALUES ('1682', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-08 14:35:47');
INSERT INTO `sys_log` VALUES ('1683', 'admin', '删除用户', 'com.erpdemo.controller.HantaoUserController.delete()', '[null]', '127.0.0.1', '2019-07-08 14:40:20');
INSERT INTO `sys_log` VALUES ('1684', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[49,48,47,46,45,43,41]', '0:0:0:0:0:0:0:1', '2019-07-08 14:40:45');
INSERT INTO `sys_log` VALUES ('1685', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"createUserId\":0,\"email\":\"78945613@qq.com\",\"mobile\":\"15555445568\",\"roleIdList\":[],\"status\":1,\"userid\":0,\"username\":\"111\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:41:28');
INSERT INTO `sys_log` VALUES ('1686', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"createUserId\":0,\"email\":\"123456@qq.com\",\"mobile\":\"123456\",\"roleIdList\":[2],\"status\":1,\"userid\":0,\"username\":\"user\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:42:11');
INSERT INTO `sys_log` VALUES ('1687', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"createUserId\":0,\"email\":\"123456@qq.com\",\"mobile\":\"123456\",\"roleIdList\":[2],\"status\":1,\"userid\":0,\"username\":\"user\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:42:15');
INSERT INTO `sys_log` VALUES ('1688', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null,null]', '0:0:0:0:0:0:0:1', '2019-07-08 14:44:21');
INSERT INTO `sys_log` VALUES ('1689', 'admin', '删除用户', 'com.erpdemo.controller.HantaoUserController.delete()', '[null]', '127.0.0.1', '2019-07-08 14:44:18');
INSERT INTO `sys_log` VALUES ('1690', 'admin', '删除用户', 'com.erpdemo.controller.HantaoUserController.delete()', '[null]', '127.0.0.1', '2019-07-08 14:50:26');
INSERT INTO `sys_log` VALUES ('1691', 'admin', '删除用户', 'com.erpdemo.controller.HantaoUserController.delete()', '[null]', '127.0.0.1', '2019-07-08 14:53:08');
INSERT INTO `sys_log` VALUES ('1692', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[176]', '0:0:0:0:0:0:0:1', '2019-07-08 14:53:17');
INSERT INTO `sys_log` VALUES ('1693', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"WSY测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/wangsy.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 14:56:10');
INSERT INTO `sys_log` VALUES ('1694', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-08 15:02:04');
INSERT INTO `sys_log` VALUES ('1695', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"大连\",\"addtime\":1562556666000,\"contact\":\"王二小\",\"id\":7,\"name\":\"大脸猫\",\"num\":\"13569894978\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 15:04:38');
INSERT INTO `sys_log` VALUES ('1696', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[198]', '0:0:0:0:0:0:0:1', '2019-07-08 15:11:48');
INSERT INTO `sys_log` VALUES ('1697', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"大连开发区\",\"contact\":\"孙嘉\",\"name\":\"大连程宇\",\"remarks\":\"优质供货商\"}', '0:0:0:0:0:0:0:1', '2019-07-08 15:17:10');
INSERT INTO `sys_log` VALUES ('1698', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"尚海玉的功能测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/product.html\"}', '0:0:0:0:0:0:0:1', '2019-07-08 15:19:30');
INSERT INTO `sys_log` VALUES ('1699', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"大连开发区\",\"contact\":\"孙嘉\",\"name\":\"大连程宇\",\"remarks\":\"优质供货商\"}', '0:0:0:0:0:0:0:1', '2019-07-08 15:21:16');
INSERT INTO `sys_log` VALUES ('1700', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[52]', '0:0:0:0:0:0:0:1', '2019-07-08 15:21:21');
INSERT INTO `sys_log` VALUES ('1701', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"大连开发区\",\"addtime\":1562570476000,\"contact\":\"孙嘉\",\"delflag\":0,\"id\":53,\"name\":\"大连程宇\",\"num\":\"1\",\"remarks\":\"优质供货商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 15:42:41');
INSERT INTO `sys_log` VALUES ('1702', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"createUserId\":0,\"email\":\"456123@qq.com\",\"mobile\":\"123456789\",\"roleIdList\":[],\"status\":1,\"userid\":0,\"username\":\"user\"}', '127.0.0.1', '2019-07-08 15:43:09');
INSERT INTO `sys_log` VALUES ('1703', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[53]', '0:0:0:0:0:0:0:1', '2019-07-08 15:44:43');
INSERT INTO `sys_log` VALUES ('1704', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-08 15:43:07');
INSERT INTO `sys_log` VALUES ('1705', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"成都\",\"addtime\":1562235893000,\"contact\":\"是他\",\"delflag\":0,\"id\":42,\"name\":\"盛驰公司\",\"num\":\"1\",\"remarks\":\"优质供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 15:51:29');
INSERT INTO `sys_log` VALUES ('1706', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '127.0.0.1', '2019-07-08 15:57:14');
INSERT INTO `sys_log` VALUES ('1707', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-10\",\"purchasenumber\":\"JH201907080001\",\"remarks\":\"r\",\"state\":1,\"supplierid\":42}', '0:0:0:0:0:0:0:1', '2019-07-08 16:11:14');
INSERT INTO `sys_log` VALUES ('1708', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-16\",\"purchasenumber\":\"JH201907080001\",\"remarks\":\"\",\"state\":1,\"supplierid\":42}', '0:0:0:0:0:0:0:1', '2019-07-08 16:19:31');
INSERT INTO `sys_log` VALUES ('1709', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[205]', '0:0:0:0:0:0:0:1', '2019-07-08 16:19:37');
INSERT INTO `sys_log` VALUES ('1710', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[204]', '0:0:0:0:0:0:0:1', '2019-07-08 16:27:40');
INSERT INTO `sys_log` VALUES ('1711', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[203,202,185]', '0:0:0:0:0:0:0:1', '2019-07-08 16:29:56');
INSERT INTO `sys_log` VALUES ('1712', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1562231327000,\"amountpaid\":1.11111E8,\"amountpayable\":1.11111E7,\"delflag\":0,\"id\":171,\"purchaseGoods\":[],\"purchasedate\":1564416000000,\"purchasedateStr\":\"2019-07-30\",\"purchasenumber\":\"JH201907080003\",\"remarks\":\"gggg\",\"state\":1,\"supplierid\":38,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 16:43:51');
INSERT INTO `sys_log` VALUES ('1713', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562575625030\"}', '0:0:0:0:0:0:0:1', '2019-07-08 16:47:05');
INSERT INTO `sys_log` VALUES ('1714', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562575630180\"}', '0:0:0:0:0:0:0:1', '2019-07-08 16:47:10');
INSERT INTO `sys_log` VALUES ('1715', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562575762547\"}', '0:0:0:0:0:0:0:1', '2019-07-08 16:49:22');
INSERT INTO `sys_log` VALUES ('1716', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562575767855\"}', '0:0:0:0:0:0:0:1', '2019-07-08 16:49:27');
INSERT INTO `sys_log` VALUES ('1717', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486778000,\"code\":\"0001\",\"delflag\":0,\"goodsid\":1,\"model\":\"红色装\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"num\":6.0,\"price\":5.0,\"purchaselistid\":183,\"typeid\":1,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-08 17:26:47');
INSERT INTO `sys_log` VALUES ('1718', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"createUserId\":0,\"email\":\"789456@qq.com\",\"mobile\":\"123456789\",\"roleIdList\":[],\"status\":1,\"userid\":0,\"username\":\"user\"}', '127.0.0.1', '2019-07-08 17:33:45');
INSERT INTO `sys_log` VALUES ('1719', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 09:39:20');
INSERT INTO `sys_log` VALUES ('1720', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"1\",\"roleIdList\":[],\"status\":1,\"username\":\"345\"}', '0:0:0:0:0:0:0:1', '2019-07-09 10:39:55');
INSERT INTO `sys_log` VALUES ('1721', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"1585095906@qq.com\",\"roleIdList\":[],\"status\":1,\"username\":\"345\"}', '0:0:0:0:0:0:0:1', '2019-07-09 10:40:14');
INSERT INTO `sys_log` VALUES ('1722', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"1585095906@qq.com\",\"mobile\":\"15850321\",\"roleIdList\":[],\"status\":1,\"username\":\"345\"}', '0:0:0:0:0:0:0:1', '2019-07-09 10:40:24');
INSERT INTO `sys_log` VALUES ('1723', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1561612242000,\"code\":\"0040\",\"delflag\":0,\"id\":49,\"inventoryquantity\":4,\"minnum\":2,\"model\":\"500g\",\"name\":\"苹果\",\"producer\":\"大连特产\",\"purchasingprice\":3.0,\"remarks\":\"哈哈\",\"sellingprice\":8.0,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 10:57:06');
INSERT INTO `sys_log` VALUES ('1724', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"0099\",\"minnum\":12,\"model\":\"100g\",\"name\":\"冰咖啡\",\"producer\":\"雀巢咖啡公司\",\"purchasingprice\":10.0,\"remarks\":\"提神醒脑必备之佳品\",\"typeid\":11,\"unit\":\"瓶\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:15:43');
INSERT INTO `sys_log` VALUES ('1725', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 11:18:44');
INSERT INTO `sys_log` VALUES ('1726', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"fdsf\",\"mobile\":\"\",\"roleIdList\":[],\"status\":1,\"username\":\"sd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:18:57');
INSERT INTO `sys_log` VALUES ('1727', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"fdsf@\",\"mobile\":\"\",\"roleIdList\":[],\"status\":1,\"username\":\"sd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:19:05');
INSERT INTO `sys_log` VALUES ('1728', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"fdsf@.qq.com\",\"mobile\":\"\",\"roleIdList\":[],\"status\":1,\"username\":\"sd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:19:15');
INSERT INTO `sys_log` VALUES ('1729', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"11231@.qq.com\",\"mobile\":\"\",\"roleIdList\":[],\"status\":1,\"username\":\"sd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:19:31');
INSERT INTO `sys_log` VALUES ('1730', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"131231@.qq.com\",\"mobile\":\"\",\"roleIdList\":[],\"status\":1,\"username\":\"sd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:19:42');
INSERT INTO `sys_log` VALUES ('1731', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"131231@qq.com\",\"mobile\":\"\",\"roleIdList\":[],\"status\":1,\"username\":\"sd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:19:54');
INSERT INTO `sys_log` VALUES ('1732', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"minnum\":20,\"model\":\"500g\",\"name\":\"大枣\",\"producer\":\"新疆食品\",\"purchasingprice\":50.0,\"typeid\":11,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:34:31');
INSERT INTO `sys_log` VALUES ('1733', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"minnum\":20,\"model\":\"500g\",\"name\":\"大枣\",\"producer\":\"新疆食品\",\"purchasingprice\":50.0,\"typeid\":11,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:38:14');
INSERT INTO `sys_log` VALUES ('1734', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"minnum\":5,\"model\":\"das\",\"name\":\"asda\",\"producer\":\"asdsadasd\",\"purchasingprice\":20.0,\"typeid\":47,\"unit\":\"盆\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:40:39');
INSERT INTO `sys_log` VALUES ('1735', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"0055\",\"minnum\":9,\"model\":\"100g\",\"name\":\"酸奶疙瘩\",\"producer\":\"新疆天山\",\"purchasingprice\":9.0,\"remarks\":\"很开胃\",\"typeid\":11,\"unit\":\"袋\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:40:44');
INSERT INTO `sys_log` VALUES ('1736', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"minnum\":5,\"model\":\"sada\",\"name\":\"sdadas\",\"producer\":\"sadadsadsadsa\",\"purchasingprice\":20.0,\"typeid\":53,\"unit\":\"瓶\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:42:42');
INSERT INTO `sys_log` VALUES ('1737', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"minnum\":5,\"model\":\"dasd\",\"name\":\"sdadba\",\"producer\":\"asdsa\",\"purchasingprice\":210.0,\"typeid\":50,\"unit\":\"新\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:44:06');
INSERT INTO `sys_log` VALUES ('1738', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"minnum\":5,\"model\":\"asda\",\"name\":\"asdsad\",\"producer\":\"sad\",\"purchasingprice\":20.0,\"typeid\":95,\"unit\":\"瓶\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:48:22');
INSERT INTO `sys_log` VALUES ('1739', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"minnum\":1,\"model\":\"asda\",\"name\":\"asdasd\",\"producer\":\"asdasdas\",\"purchasingprice\":520.0,\"typeid\":47,\"unit\":\"瓶\"}', '0:0:0:0:0:0:0:1', '2019-07-09 11:50:11');
INSERT INTO `sys_log` VALUES ('1740', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 12:00:05');
INSERT INTO `sys_log` VALUES ('1741', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"18\",\"userid\":\"1\",\"newprice\":\"17\",\"_\":\"1562644509866\"}', '0:0:0:0:0:0:0:1', '2019-07-09 12:04:09');
INSERT INTO `sys_log` VALUES ('1742', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[54]', '0:0:0:0:0:0:0:1', '2019-07-09 12:50:23');
INSERT INTO `sys_log` VALUES ('1743', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"minnum\":20,\"model\":\"500g\",\"name\":\"大枣\",\"producer\":\"新疆食品厂\",\"purchasingprice\":50.0,\"typeid\":11,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-09 12:50:36');
INSERT INTO `sys_log` VALUES ('1744', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[11]', '0:0:0:0:0:0:0:1', '2019-07-09 13:15:20');
INSERT INTO `sys_log` VALUES ('1745', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1562647925000,\"code\":\"0056\",\"delflag\":0,\"id\":56,\"minnum\":20,\"model\":\"500g\",\"name\":\"大枣\",\"producer\":\"新疆食品厂\",\"purchasingprice\":50.0,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 13:26:01');
INSERT INTO `sys_log` VALUES ('1746', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1562647925000,\"code\":\"0056\",\"delflag\":0,\"id\":56,\"minnum\":20,\"model\":\"500g\",\"name\":\"大枣\",\"producer\":\"新疆食品厂\",\"purchasingprice\":50.0,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 13:32:17');
INSERT INTO `sys_log` VALUES ('1747', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1562647925000,\"code\":\"0056\",\"delflag\":0,\"id\":56,\"minnum\":20,\"model\":\"500g\",\"name\":\"大枣\",\"producer\":\"新疆食品厂\",\"purchasingprice\":50.0,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 13:39:45');
INSERT INTO `sys_log` VALUES ('1748', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486801000,\"code\":\"0007\",\"delflag\":0,\"id\":15,\"inventoryquantity\":100000,\"lastpurchasingprice\":4.0,\"minnum\":400,\"model\":\"500g装\",\"name\":\"香蕉味蛋糕\",\"producer\":\"合肥吉利人家食品有限公司\",\"purchasingprice\":4.0,\"remarks\":\"good\",\"sellingprice\":58.0,\"state\":2,\"typeid\":11,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 13:53:11');
INSERT INTO `sys_log` VALUES ('1749', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 14:28:23');
INSERT INTO `sys_log` VALUES ('1750', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"asd\",\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 14:28:27');
INSERT INTO `sys_log` VALUES ('1751', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"asd@asd\",\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 14:28:31');
INSERT INTO `sys_log` VALUES ('1752', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"asd@asd\",\"mobile\":\"123\",\"roleIdList\":[],\"status\":1,\"username\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 14:28:38');
INSERT INTO `sys_log` VALUES ('1753', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"梵蒂冈递归\",\"contact\":\"东方\",\"name\":\"东方\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-09 14:55:28');
INSERT INTO `sys_log` VALUES ('1754', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"荔浦县荔塔路１６－３６号\",\"addtime\":1558675612000,\"contact\":\"亲琴东方\",\"delflag\":0,\"id\":11,\"name\":\"桂林阜康食品工业有限公司\",\"num\":\"1\",\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 14:55:50');
INSERT INTO `sys_log` VALUES ('1755', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[8]', '0:0:0:0:0:0:0:1', '2019-07-09 14:56:21');
INSERT INTO `sys_log` VALUES ('1756', 'admin', '删除', 'com.erpdemo.controller.HerololController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-07-09 14:56:19');
INSERT INTO `sys_log` VALUES ('1757', 'admin', '删除', 'com.erpdemo.controller.HerololController.delete()', '[5,6]', '0:0:0:0:0:0:0:1', '2019-07-09 14:56:33');
INSERT INTO `sys_log` VALUES ('1758', 'admin', '删除', 'com.erpdemo.controller.HerololController.delete()', '[5]', '0:0:0:0:0:0:0:1', '2019-07-09 15:04:02');
INSERT INTO `sys_log` VALUES ('1759', 'admin', '删除', 'com.erpdemo.controller.HerololController.delete()', '[6]', '0:0:0:0:0:0:0:1', '2019-07-09 15:04:25');
INSERT INTO `sys_log` VALUES ('1760', 'admin', '删除', 'com.erpdemo.controller.HerololController.delete()', '[7,8]', '0:0:0:0:0:0:0:1', '2019-07-09 15:04:37');
INSERT INTO `sys_log` VALUES ('1761', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562656574768\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:16:14');
INSERT INTO `sys_log` VALUES ('1762', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-18\",\"purchasenumber\":\"JH201907090001\",\"remarks\":\"r\",\"state\":1,\"supplierid\":11}', '0:0:0:0:0:0:0:1', '2019-07-09 15:22:06');
INSERT INTO `sys_log` VALUES ('1763', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486791000,\"code\":\"0004\",\"delflag\":0,\"goodsid\":12,\"model\":\"2斤装\",\"name\":\"新疆红枣\",\"num\":133.0,\"price\":2.0,\"purchaselistid\":206,\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 15:22:39');
INSERT INTO `sys_log` VALUES ('1764', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486798000,\"code\":\"0006\",\"delflag\":0,\"goodsid\":14,\"model\":\"300g装\",\"name\":\"冰糖金桔干\",\"num\":111111.0,\"price\":13.0,\"purchaselistid\":206,\"typeid\":1,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 15:22:51');
INSERT INTO `sys_log` VALUES ('1765', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"asdqwe\",\"state\":0,\"tel\":\"1234\",\"username\":\"asdasd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:23:09');
INSERT INTO `sys_log` VALUES ('1766', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"asdqwe\",\"state\":0,\"tel\":\"1234\",\"username\":\"asdasd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:23:10');
INSERT INTO `sys_log` VALUES ('1767', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"asdqwe\",\"state\":0,\"tel\":\"1234\",\"username\":\"asdasd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:23:11');
INSERT INTO `sys_log` VALUES ('1768', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"asdqwe\",\"state\":0,\"tel\":\"1234\",\"username\":\"asdasd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:23:11');
INSERT INTO `sys_log` VALUES ('1769', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1,\"username\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:23:25');
INSERT INTO `sys_log` VALUES ('1770', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"1344444@.com\",\"mobile\":\"111111111\",\"roleIdList\":[],\"status\":1,\"username\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:23:40');
INSERT INTO `sys_log` VALUES ('1771', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"8888888@qq.com\",\"mobile\":\"111111111\",\"roleIdList\":[],\"status\":1,\"username\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:23:51');
INSERT INTO `sys_log` VALUES ('1772', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"zaq\",\"state\":1,\"tel\":\"123\",\"username\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:24:31');
INSERT INTO `sys_log` VALUES ('1773', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"1234123\",\"state\":1,\"tel\":\"12345\",\"username\":\"sddsd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:26:59');
INSERT INTO `sys_log` VALUES ('1774', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"username\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:27:47');
INSERT INTO `sys_log` VALUES ('1775', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"username\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:27:48');
INSERT INTO `sys_log` VALUES ('1776', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"username\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:27:49');
INSERT INTO `sys_log` VALUES ('1777', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"username\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:27:49');
INSERT INTO `sys_log` VALUES ('1778', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"username\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:27:49');
INSERT INTO `sys_log` VALUES ('1779', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"username\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:27:50');
INSERT INTO `sys_log` VALUES ('1780', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"退货单\",\"orderNum\":0,\"parentId\":39,\"parentName\":\"进货管理\",\"type\":1,\"url\":\"sys/returnlist.html\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:35:10');
INSERT INTO `sys_log` VALUES ('1781', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"1231412\",\"state\":0,\"tel\":\"12312312\",\"username\":\"qqqqqqq\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:38:55');
INSERT INTO `sys_log` VALUES ('1782', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"1231412\",\"state\":0,\"tel\":\"12312312\",\"username\":\"qqqqqqq\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:38:57');
INSERT INTO `sys_log` VALUES ('1783', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"\",\"model\":\"\",\"name\":\"\",\"producer\":\"\",\"remarks\":\"\",\"unit\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-09 15:43:02');
INSERT INTO `sys_log` VALUES ('1784', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1558486870000,\"code\":\"0015\",\"delflag\":0,\"id\":24,\"inventoryquantity\":60,\"lastpurchasingprice\":8000.0,\"minnum\":100,\"model\":\"X\",\"name\":\"iPhone X\",\"producer\":\"xx2\",\"purchasingprice\":8000.0,\"remarks\":\"xxx2\",\"sellingprice\":6888.0,\"state\":2,\"typeid\":16,\"unit\":\"台\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 15:43:57');
INSERT INTO `sys_log` VALUES ('1785', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 15:55:33');
INSERT INTO `sys_log` VALUES ('1786', 'admin', '保存', 'com.erpdemo.controller.HerololController.save()', '{\"name\":\"狐狸\",\"position\":\"法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:06:26');
INSERT INTO `sys_log` VALUES ('1787', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":0,\"tel\":\"123\",\"username\":\"三大\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:12:36');
INSERT INTO `sys_log` VALUES ('1788', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":0,\"tel\":\"123\",\"username\":\"阿斯顿\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:13:40');
INSERT INTO `sys_log` VALUES ('1789', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":0,\"tel\":\"123\",\"username\":\"阿斯顿\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:13:42');
INSERT INTO `sys_log` VALUES ('1790', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":0,\"tel\":\"123\",\"username\":\"阿斯顿\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:13:43');
INSERT INTO `sys_log` VALUES ('1791', 'admin', '保存', 'com.erpdemo.controller.HerololController.save()', '{\"name\":\"狐狸\",\"position\":\"法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:14:07');
INSERT INTO `sys_log` VALUES ('1792', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"刺客and法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:14:47');
INSERT INTO `sys_log` VALUES ('1793', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-07-09 16:14:38');
INSERT INTO `sys_log` VALUES ('1794', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1,\"username\":\"哈哈哈哈哈\"}', '127.0.0.1', '2019-07-09 16:19:25');
INSERT INTO `sys_log` VALUES ('1795', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 16:27:13');
INSERT INTO `sys_log` VALUES ('1796', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 16:27:34');
INSERT INTO `sys_log` VALUES ('1797', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 16:27:44');
INSERT INTO `sys_log` VALUES ('1798', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 16:27:52');
INSERT INTO `sys_log` VALUES ('1799', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{}', '0:0:0:0:0:0:0:1', '2019-07-09 16:30:30');
INSERT INTO `sys_log` VALUES ('1800', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{}', '0:0:0:0:0:0:0:1', '2019-07-09 16:32:50');
INSERT INTO `sys_log` VALUES ('1801', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"id\":\"5\",\"_\":\"1562661503143\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:38:25');
INSERT INTO `sys_log` VALUES ('1802', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"123\",\"mobile\":\"123\",\"roleIdList\":[1],\"status\":1,\"username\":\"a\"}', '127.0.0.1', '2019-07-09 16:42:01');
INSERT INTO `sys_log` VALUES ('1803', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"11111111@11\",\"mobile\":\"1231\",\"roleIdList\":[1],\"status\":1,\"username\":\"a\"}', '127.0.0.1', '2019-07-09 16:42:13');
INSERT INTO `sys_log` VALUES ('1804', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 16:41:14');
INSERT INTO `sys_log` VALUES ('1805', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 16:41:31');
INSERT INTO `sys_log` VALUES ('1806', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"爱仕达\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:43:07');
INSERT INTO `sys_log` VALUES ('1807', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"爱仕达\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:43:09');
INSERT INTO `sys_log` VALUES ('1808', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '0:0:0:0:0:0:0:1', '2019-07-09 16:43:40');
INSERT INTO `sys_log` VALUES ('1809', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"EZ\",\"position\":\"射手and法师\",\"sex\":\"男\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:44:12');
INSERT INTO `sys_log` VALUES ('1810', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"EZ\",\"position\":\"射手and法师\",\"sex\":\"男\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:46:01');
INSERT INTO `sys_log` VALUES ('1811', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"阿斯达\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:49:03');
INSERT INTO `sys_log` VALUES ('1812', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"刺客法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:49:42');
INSERT INTO `sys_log` VALUES ('1813', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"刺客法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:51:35');
INSERT INTO `sys_log` VALUES ('1814', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"自行车\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:51:34');
INSERT INTO `sys_log` VALUES ('1815', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"自行车\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:51:53');
INSERT INTO `sys_log` VALUES ('1816', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:55:57');
INSERT INTO `sys_log` VALUES ('1817', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"刺客法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:57:27');
INSERT INTO `sys_log` VALUES ('1818', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"41241\",\"username\":\"全文\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:58:37');
INSERT INTO `sys_log` VALUES ('1819', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"全文\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:59:00');
INSERT INTO `sys_log` VALUES ('1820', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"全文\"}', '0:0:0:0:0:0:0:1', '2019-07-09 16:59:16');
INSERT INTO `sys_log` VALUES ('1821', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"请问\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:00:25');
INSERT INTO `sys_log` VALUES ('1822', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"刺客法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:00:34');
INSERT INTO `sys_log` VALUES ('1823', 'admin', '保存', 'com.erpdemo.controller.HerololController.save()', '{\"name\":\"赵信\",\"position\":\"战士\",\"sex\":\"男\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:02:05');
INSERT INTO `sys_log` VALUES ('1824', 'admin', '保存用户', 'com.erpdemo.controller.TempUserController.save()', '{\"mail\":\"123\",\"state\":1,\"tel\":\"123\",\"username\":\"地方官\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:02:08');
INSERT INTO `sys_log` VALUES ('1825', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"刺客f\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:05:18');
INSERT INTO `sys_log` VALUES ('1826', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:15:17');
INSERT INTO `sys_log` VALUES ('1827', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"name\":\"皎月\",\"position\":\"法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:17:06');
INSERT INTO `sys_log` VALUES ('1828', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"id\":4,\"name\":\"皎月\",\"position\":\"法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:18:50');
INSERT INTO `sys_log` VALUES ('1829', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"id\":3,\"name\":\"佐伊\",\"position\":\"法师d\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:23:21');
INSERT INTO `sys_log` VALUES ('1830', 'admin', '修改', 'com.erpdemo.controller.HerololController.update()', '{\"id\":3,\"name\":\"佐伊\",\"position\":\"法师\",\"sex\":\"女\"}', '0:0:0:0:0:0:0:1', '2019-07-09 17:24:24');
INSERT INTO `sys_log` VALUES ('1831', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"1\",\"_\":\"1562719692790\"}', '0:0:0:0:0:0:0:1', '2019-07-10 08:48:12');
INSERT INTO `sys_log` VALUES ('1832', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562719698023\"}', '0:0:0:0:0:0:0:1', '2019-07-10 08:48:18');
INSERT INTO `sys_log` VALUES ('1833', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"24\",\"_\":\"1562719765472\"}', '0:0:0:0:0:0:0:1', '2019-07-10 08:49:25');
INSERT INTO `sys_log` VALUES ('1834', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-11\",\"purchasenumber\":\"JH201907100001\",\"remarks\":\"wadc\",\"state\":1,\"supplierid\":56}', '127.0.0.1', '2019-07-10 08:51:50');
INSERT INTO `sys_log` VALUES ('1835', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1558486801000,\"code\":\"0007\",\"delflag\":0,\"model\":\"500g装\",\"name\":\"香蕉味蛋糕\",\"typeid\":1,\"unit\":\"袋\",\"userid\":1}', '127.0.0.1', '2019-07-10 08:56:34');
INSERT INTO `sys_log` VALUES ('1836', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":123.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-20\",\"purchasenumber\":\"JH201907100001\",\"remarks\":\"123\",\"state\":2,\"supplierid\":55}', '127.0.0.1', '2019-07-10 09:08:16');
INSERT INTO `sys_log` VALUES ('1837', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1562647925000,\"code\":\"0056\",\"delflag\":0,\"goodsid\":56,\"model\":\"500g\",\"name\":\"大枣\",\"num\":13.0,\"price\":12123.0,\"purchaselistid\":208,\"typeid\":11,\"unit\":\"斤\",\"userid\":1}', '127.0.0.1', '2019-07-10 09:09:05');
INSERT INTO `sys_log` VALUES ('1838', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[155,157]', '0:0:0:0:0:0:0:1', '2019-07-10 09:10:33');
INSERT INTO `sys_log` VALUES ('1839', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[205]', '0:0:0:0:0:0:0:1', '2019-07-10 09:11:01');
INSERT INTO `sys_log` VALUES ('1840', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"大禹的测试\",\"orderNum\":0,\"parentId\":150,\"parentName\":\"功能测试\",\"type\":1,\"url\":\"sys/temp/xiayu.html\"}', '0:0:0:0:0:0:0:1', '2019-07-10 09:14:32');
INSERT INTO `sys_log` VALUES ('1841', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562721427002\"}', '0:0:0:0:0:0:0:1', '2019-07-10 09:17:07');
INSERT INTO `sys_log` VALUES ('1842', 'admin', '查看商品规格型号', 'com.erpdemo.controller.SysGoodsMoreController.queryMore()', '{\"id\":\"2\",\"_\":\"1562721446076\"}', '0:0:0:0:0:0:0:1', '2019-07-10 09:17:26');
INSERT INTO `sys_log` VALUES ('1843', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486872000,\"code\":\"0016\",\"delflag\":0,\"id\":25,\"inventoryquantity\":1,\"lastpurchasingprice\":103.0,\"minnum\":12,\"model\":\"X\",\"name\":\"21\",\"producer\":\"32\",\"purchasingprice\":103.0,\"remarks\":\"21\",\"sellingprice\":58.0,\"state\":0,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-10 09:33:23');
INSERT INTO `sys_log` VALUES ('1844', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"17\",\"userid\":\"1\",\"newprice\":\"12\",\"_\":\"1562722408645\"}', '0:0:0:0:0:0:0:1', '2019-07-10 09:33:45');
INSERT INTO `sys_log` VALUES ('1845', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[37]', '0:0:0:0:0:0:0:1', '2019-07-10 09:34:41');
INSERT INTO `sys_log` VALUES ('1846', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"13\"', '0:0:0:0:0:0:0:1', '2019-07-10 09:41:49');
INSERT INTO `sys_log` VALUES ('1847', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"塘关\",\"addtime\":1562659180000,\"contact\":\"陈\",\"delflag\":0,\"id\":56,\"name\":\"陈塘有限公司\",\"num\":\"1\",\"remarks\":\"如\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-10 09:46:45');
INSERT INTO `sys_log` VALUES ('1848', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"12\",\"userid\":\"1\",\"newprice\":\"22\",\"_\":\"1562725218949\"}', '0:0:0:0:0:0:0:1', '2019-07-10 10:20:40');
INSERT INTO `sys_log` VALUES ('1849', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"030\",\"minnum\":4,\"model\":\"\",\"name\":\"可可\",\"producer\":\"浙江\",\"purchasingprice\":1.0,\"remarks\":\"\",\"typeid\":24,\"unit\":\"瓶\"}', '0:0:0:0:0:0:0:1', '2019-07-10 10:35:11');
INSERT INTO `sys_log` VALUES ('1850', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562726206000,\"code\":\"030\",\"delflag\":0,\"id\":58,\"minnum\":4,\"model\":\"650gl\",\"name\":\"可可\",\"producer\":\"浙江\",\"purchasingprice\":1.0,\"remarks\":\"\",\"typeid\":24,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-10 10:35:44');
INSERT INTO `sys_log` VALUES ('1851', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562726206000,\"code\":\"030\",\"delflag\":0,\"id\":58,\"minnum\":4,\"model\":\"650g\",\"name\":\"可可\",\"producer\":\"浙江\",\"purchasingprice\":1.0,\"remarks\":\"\",\"typeid\":11,\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-10 10:36:27');
INSERT INTO `sys_log` VALUES ('1852', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[58]', '0:0:0:0:0:0:0:1', '2019-07-10 10:36:42');
INSERT INTO `sys_log` VALUES ('1853', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"7778\",\"userid\":\"1\",\"newprice\":\"22222\",\"_\":\"1562726538447\"}', '0:0:0:0:0:0:0:1', '2019-07-10 10:42:36');
INSERT INTO `sys_log` VALUES ('1854', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"大连\",\"contact\":\"联系人\",\"name\":\"客户\",\"num\":\"1233333333\",\"remarks\":\"备注\"}', '127.0.0.1', '2019-07-10 10:53:11');
INSERT INTO `sys_log` VALUES ('1855', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"大连\",\"contact\":\"联系人1\",\"name\":\"客户1\",\"num\":\"11111111111\",\"remarks\":\"备注\"}', '127.0.0.1', '2019-07-10 10:54:21');
INSERT INTO `sys_log` VALUES ('1856', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"哈哈哈\",\"contact\":\"联系人客户\",\"name\":\"客户联系人\",\"num\":\"139111111\"}', '127.0.0.1', '2019-07-10 10:55:57');
INSERT INTO `sys_log` VALUES ('1857', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"啊啊啊啊\",\"contact\":\"21\",\"name\":\"哈哈发货\",\"num\":\"3333\",\"remarks\":\"啊\"}', '127.0.0.1', '2019-07-10 11:03:25');
INSERT INTO `sys_log` VALUES ('1858', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1561617881000,\"code\":\"0042\",\"delflag\":0,\"id\":51,\"inventoryquantity\":11,\"minnum\":3,\"model\":\"500ml\",\"name\":\"雪碧\",\"producer\":\"可口可乐有限公司\",\"purchasingprice\":2.0,\"remarks\":\"哈哈\",\"sellingprice\":8.0,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-10 11:09:10');
INSERT INTO `sys_log` VALUES ('1859', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1562642238000,\"code\":\"0099\",\"delflag\":0,\"id\":53,\"inventoryquantity\":10,\"minnum\":12,\"model\":\"100g\",\"name\":\"冰咖啡\",\"producer\":\"雀巢咖啡公司\",\"purchasingprice\":9.0,\"remarks\":\"提神醒脑必备之佳品\",\"unit\":\"瓶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-10 11:09:27');
INSERT INTO `sys_log` VALUES ('1860', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"111@111\",\"mobile\":\"123333333\",\"roleIdList\":[1],\"status\":1,\"username\":\"b\"}', '127.0.0.1', '2019-07-10 11:17:42');
INSERT INTO `sys_log` VALUES ('1861', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[26]', '127.0.0.1', '2019-07-10 11:19:30');
INSERT INTO `sys_log` VALUES ('1862', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":123.0,\"amountpayable\":213.0,\"id\":208,\"purchasedateStr\":\"2019-07-06\",\"purchasenumber\":\"JH201907100001\",\"remarks\":\"\",\"state\":2,\"supplierid\":28}', '127.0.0.1', '2019-07-10 11:37:16');
INSERT INTO `sys_log` VALUES ('1863', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1561617881000,\"code\":\"0041\",\"delflag\":0,\"goodsid\":50,\"model\":\"500ml\",\"name\":\"可口可乐\",\"num\":23.0,\"price\":213.0,\"purchaselistid\":208,\"typeid\":10,\"unit\":\"个\",\"userid\":1}', '127.0.0.1', '2019-07-10 11:37:54');
INSERT INTO `sys_log` VALUES ('1864', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[56]', '127.0.0.1', '2019-07-10 11:44:00');
INSERT INTO `sys_log` VALUES ('1865', 'admin', '删除', 'com.erpdemo.controller.SysPurchaseController.delete()', '[208]', '0:0:0:0:0:0:0:1', '2019-07-10 17:13:59');
INSERT INTO `sys_log` VALUES ('1866', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"22222\",\"userid\":\"1\",\"newprice\":\"22211\",\"_\":\"1562808482174\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:28:15');
INSERT INTO `sys_log` VALUES ('1867', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"玩儿若群二\",\"contact\":\"俄文温热\",\"name\":\"陈\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:50:32');
INSERT INTO `sys_log` VALUES ('1868', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"大多数\",\"contact\":\"热\",\"name\":\"大连接待室\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:51:05');
INSERT INTO `sys_log` VALUES ('1869', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"大多数\",\"contact\":\"史蒂夫\",\"name\":\"大连大叔大婶\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:51:20');
INSERT INTO `sys_log` VALUES ('1870', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"收到\",\"contact\":\"收到\",\"name\":\"大连时代大厦\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:51:34');
INSERT INTO `sys_log` VALUES ('1871', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"大蒜\",\"contact\":\"山东\",\"name\":\"大连水电费\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:51:50');
INSERT INTO `sys_log` VALUES ('1872', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"大蒜\",\"contact\":\"天后\",\"name\":\"大连手动阀\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:52:06');
INSERT INTO `sys_log` VALUES ('1873', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"还给他\",\"contact\":\"搞不好好\",\"name\":\"大连华国锋\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:52:20');
INSERT INTO `sys_log` VALUES ('1874', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"特特\",\"contact\":\"退回\",\"name\":\"大连团购会他\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:52:41');
INSERT INTO `sys_log` VALUES ('1875', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"惹他\",\"contact\":\"热\",\"name\":\"大连贴合\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:52:59');
INSERT INTO `sys_log` VALUES ('1876', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"惹他\",\"contact\":\"惹\",\"name\":\"大连是大热\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:53:18');
INSERT INTO `sys_log` VALUES ('1877', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"惹他\",\"contact\":\"惹\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 09:57:07');
INSERT INTO `sys_log` VALUES ('1878', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 10:05:47');
INSERT INTO `sys_log` VALUES ('1879', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[53]', '0:0:0:0:0:0:0:1', '2019-07-11 10:07:22');
INSERT INTO `sys_log` VALUES ('1880', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"22211\",\"userid\":\"1\",\"newprice\":\"2222\",\"_\":\"1562808889239\"}', '0:0:0:0:0:0:0:1', '2019-07-11 10:08:26');
INSERT INTO `sys_log` VALUES ('1881', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"06-660\",\"minnum\":50,\"model\":\"yt-uii\",\"name\":\"椰子灰\",\"producer\":\"大连贸易\",\"purchasingprice\":0.5,\"remarks\":\"\",\"typeid\":11,\"unit\":\"个\"}', '0:0:0:0:0:0:0:1', '2019-07-11 10:12:08');
INSERT INTO `sys_log` VALUES ('1882', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1561617881000,\"code\":\"0041\",\"delflag\":0,\"id\":50,\"inventoryquantity\":8,\"minnum\":100,\"model\":\"250ml\",\"name\":\"可口可乐\",\"producer\":\"可口可乐有限公司\",\"purchasingprice\":3.0,\"remarks\":\"哈哈\",\"sellingprice\":8.0,\"typeid\":10,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 10:15:09');
INSERT INTO `sys_log` VALUES ('1883', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 10:17:25');
INSERT INTO `sys_log` VALUES ('1884', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[69,68,67]', '0:0:0:0:0:0:0:1', '2019-07-11 10:20:04');
INSERT INTO `sys_log` VALUES ('1885', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"34\",\"addtime\":1562809998000,\"contact\":\"453\",\"delflag\":0,\"id\":66,\"name\":\"大连是大热\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 10:23:11');
INSERT INTO `sys_log` VALUES ('1886', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"\",\"addtime\":1562809998000,\"contact\":\"\",\"delflag\":0,\"id\":66,\"name\":\"\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 10:28:50');
INSERT INTO `sys_log` VALUES ('1887', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"大连市\",\"contact\":\"客户1\",\"name\":\"普通客户\",\"num\":\"13856565656\",\"remarks\":\"无\"}', '0:0:0:0:0:0:0:1', '2019-07-11 10:30:14');
INSERT INTO `sys_log` VALUES ('1888', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"大连市\",\"contact\":\"客户111111\",\"name\":\"普通客户\",\"num\":\"13856565656\",\"remarks\":\"无\"}', '0:0:0:0:0:0:0:1', '2019-07-11 10:44:32');
INSERT INTO `sys_log` VALUES ('1889', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"大连市\",\"contact\":\"客户111111\",\"name\":\"普通客户111111\",\"num\":\"13856565656\",\"remarks\":\"无\"}', '0:0:0:0:0:0:0:1', '2019-07-11 10:44:58');
INSERT INTO `sys_log` VALUES ('1890', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"98779\",\"minnum\":8989,\"model\":\"798798\",\"name\":\"45456\",\"producer\":\"iou\",\"purchasingprice\":89.0,\"remarks\":\"\",\"typeid\":97,\"unit\":\"盆\"}', '0:0:0:0:0:0:0:1', '2019-07-11 10:54:44');
INSERT INTO `sys_log` VALUES ('1891', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-11 11:09:15');
INSERT INTO `sys_log` VALUES ('1892', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562813781000,\"code\":\"98779\",\"delflag\":0,\"id\":60,\"minnum\":15,\"model\":\"ty-98\",\"name\":\"狗粮\",\"producer\":\"iou\",\"purchasingprice\":190.0,\"remarks\":\"\",\"typeid\":97,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 11:12:09');
INSERT INTO `sys_log` VALUES ('1893', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562813781000,\"code\":\"98779\",\"delflag\":0,\"id\":60,\"minnum\":15,\"model\":\"-89\",\"name\":\"狗粮\",\"producer\":\"iou\",\"purchasingprice\":190.0,\"remarks\":\"\",\"typeid\":97,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 11:13:04');
INSERT INTO `sys_log` VALUES ('1894', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562813781000,\"code\":\"98779\",\"delflag\":0,\"id\":60,\"minnum\":15,\"model\":\"89\",\"name\":\"狗粮\",\"producer\":\"iou\",\"purchasingprice\":190.0,\"remarks\":\"\",\"typeid\":97,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 11:13:17');
INSERT INTO `sys_log` VALUES ('1895', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562813781000,\"code\":\"98779\",\"delflag\":0,\"id\":60,\"minnum\":15,\"model\":\"8989\",\"name\":\"狗粮\",\"producer\":\"iou\",\"purchasingprice\":190.0,\"remarks\":\"\",\"typeid\":97,\"unit\":\"袋\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 11:17:13');
INSERT INTO `sys_log` VALUES ('1896', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562813781000,\"code\":\"5345\",\"delflag\":0,\"id\":60,\"minnum\":23432424,\"model\":\"w223\",\"name\":\"jkjk\",\"producer\":\"iov\",\"purchasingprice\":2442.0,\"remarks\":\"\",\"typeid\":95,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 11:18:02');
INSERT INTO `sys_log` VALUES ('1897', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1560991467000,\"code\":\"0037\",\"delflag\":0,\"id\":46,\"inventoryquantity\":2,\"minnum\":10,\"model\":\"\",\"name\":\"碎碎冰\",\"producer\":\"旺仔\",\"purchasingprice\":4.0,\"remarks\":\"和夏天更配哦\",\"sellingprice\":8.0,\"unit\":\"条\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 11:19:24');
INSERT INTO `sys_log` VALUES ('1898', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"123\",\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"你测\",\"purchasingprice\":123.0,\"remarks\":\"\",\"typeid\":50,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-11 11:20:03');
INSERT INTO `sys_log` VALUES ('1899', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562813781000,\"code\":\"5345\",\"delflag\":0,\"id\":60,\"minnum\":2,\"model\":\"898989\",\"name\":\"狗粮\",\"producer\":\"iov\",\"purchasingprice\":24.0,\"remarks\":\"\",\"typeid\":96,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-11 11:22:14');
INSERT INTO `sys_log` VALUES ('1900', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[61]', '0:0:0:0:0:0:0:1', '2019-07-11 11:28:04');
INSERT INTO `sys_log` VALUES ('1901', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"3\",\"contact\":\"33\",\"name\":\"sss\",\"num\":\"3\",\"remarks\":\"3\"}', '127.0.0.1', '2019-07-11 13:59:10');
INSERT INTO `sys_log` VALUES ('1902', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486806000,\"code\":\"0008\",\"delflag\":0,\"id\":16,\"inventoryquantity\":196,\"lastpurchasingprice\":2.0,\"minnum\":500,\"model\":\"128g装\",\"name\":\"奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品\",\"producer\":\"潮州市潮安区正大食品有限公司\",\"purchasingprice\":3.0,\"remarks\":\"\",\"sellingprice\":68.0,\"state\":2,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-12 10:38:16');
INSERT INTO `sys_log` VALUES ('1903', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1558486806000,\"code\":\"0008\",\"delflag\":0,\"id\":16,\"inventoryquantity\":196,\"lastpurchasingprice\":2.0,\"minnum\":500,\"model\":\"128g装\",\"name\":\"奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品\",\"producer\":\"潮州市潮安区正大食品有限公司\",\"purchasingprice\":3.0,\"remarks\":\"\",\"sellingprice\":68.0,\"state\":2,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-12 10:38:17');
INSERT INTO `sys_log` VALUES ('1904', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"2019-0712-测试\",\"orderNum\":10,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-12 13:31:34');
INSERT INTO `sys_log` VALUES ('1905', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"张健的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":0}', '0:0:0:0:0:0:0:1', '2019-07-12 13:49:22');
INSERT INTO `sys_log` VALUES ('1906', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"刘莉\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"order_liuli\"}', '0:0:0:0:0:0:0:1', '2019-07-12 13:50:47');
INSERT INTO `sys_log` VALUES ('1907', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"田源的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"/temp/tianyuan.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 13:54:28');
INSERT INTO `sys_log` VALUES ('1908', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":184,\"name\":\"田源的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"/sys/temp/tianyuan.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 13:57:02');
INSERT INTO `sys_log` VALUES ('1909', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"赵文鑫的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/zhaowenxin.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 13:58:27');
INSERT INTO `sys_log` VALUES ('1910', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"黄蓉的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"documents.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 13:59:23');
INSERT INTO `sys_log` VALUES ('1911', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"刘莉的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1}', '0:0:0:0:0:0:0:1', '2019-07-12 14:01:43');
INSERT INTO `sys_log` VALUES ('1912', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[182]', '0:0:0:0:0:0:0:1', '2019-07-12 14:02:21');
INSERT INTO `sys_log` VALUES ('1913', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"刘莉的数据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/goods.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 14:04:53');
INSERT INTO `sys_log` VALUES ('1914', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[183]', '0:0:0:0:0:0:0:1', '2019-07-12 14:05:17');
INSERT INTO `sys_log` VALUES ('1915', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"张健的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"/sys/temp/zhangjian.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 14:09:08');
INSERT INTO `sys_log` VALUES ('1916', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/wangqi.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 14:10:20');
INSERT INTO `sys_log` VALUES ('1917', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"王奇的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/wangqi.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 14:10:41');
INSERT INTO `sys_log` VALUES ('1918', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[186]', '0:0:0:0:0:0:0:1', '2019-07-12 14:18:57');
INSERT INTO `sys_log` VALUES ('1919', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"韩涛的单据表\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/hantao/hantao.html\"}', '127.0.0.1', '2019-07-12 14:19:19');
INSERT INTO `sys_log` VALUES ('1920', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[190]', '127.0.0.1', '2019-07-12 14:19:57');
INSERT INTO `sys_log` VALUES ('1921', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"韩涛的单据表\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/hantao/hantao.html\"}', '127.0.0.1', '2019-07-12 14:20:28');
INSERT INTO `sys_log` VALUES ('1922', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"黄蓉的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/table.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 14:20:45');
INSERT INTO `sys_log` VALUES ('1923', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[191]', '127.0.0.1', '2019-07-12 14:20:53');
INSERT INTO `sys_log` VALUES ('1924', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"韩涛的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/hantao/hantao.html\"}', '127.0.0.1', '2019-07-12 14:21:21');
INSERT INTO `sys_log` VALUES ('1925', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"王思宇的测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/temp/djb.html\\t \\t\"}', '0:0:0:0:0:0:0:1', '2019-07-12 14:37:32');
INSERT INTO `sys_log` VALUES ('1926', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[194]', '0:0:0:0:0:0:0:1', '2019-07-12 14:38:12');
INSERT INTO `sys_log` VALUES ('1927', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[194]', '0:0:0:0:0:0:0:1', '2019-07-12 14:38:23');
INSERT INTO `sys_log` VALUES ('1928', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"王思宇的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/djb.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 14:39:06');
INSERT INTO `sys_log` VALUES ('1929', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李亚娟的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"\\tsys/temp/goods.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:02:54');
INSERT INTO `sys_log` VALUES ('1930', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-07-12 15:04:18');
INSERT INTO `sys_log` VALUES ('1931', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李瑞的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/order/order.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:04:53');
INSERT INTO `sys_log` VALUES ('1932', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"杨帆的单据表\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/temp/order_yangfan.html\"}', '127.0.0.1', '2019-07-12 15:08:53');
INSERT INTO `sys_log` VALUES ('1933', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"杨帆的单据单\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/order_yangfan.html\"}', '127.0.0.1', '2019-07-12 15:14:40');
INSERT INTO `sys_log` VALUES ('1934', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"123\",\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"123\",\"purchasingprice\":123.0,\"remarks\":\"\",\"unit\":\"盆\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:25:04');
INSERT INTO `sys_log` VALUES ('1935', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"132\",\"mobile\":\"132\",\"roleIdList\":[],\"status\":1,\"username\":\"123\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:46:11');
INSERT INTO `sys_log` VALUES ('1936', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"email\":\"132@qq.com\",\"mobile\":\"132\",\"roleIdList\":[],\"status\":1,\"username\":\"123\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:46:18');
INSERT INTO `sys_log` VALUES ('1937', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":1234.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:47:36');
INSERT INTO `sys_log` VALUES ('1938', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":123.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:48:09');
INSERT INTO `sys_log` VALUES ('1939', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"asd\",\"orderPeople\":\"asd\",\"orderPrise\":1234.0,\"orderTel\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:48:37');
INSERT INTO `sys_log` VALUES ('1940', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":123.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:49:34');
INSERT INTO `sys_log` VALUES ('1941', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":123.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:51:01');
INSERT INTO `sys_log` VALUES ('1942', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[192]', '0:0:0:0:0:0:0:1', '2019-07-12 15:51:12');
INSERT INTO `sys_log` VALUES ('1943', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"黄蓉的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/table.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:51:50');
INSERT INTO `sys_log` VALUES ('1944', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":1234.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:52:21');
INSERT INTO `sys_log` VALUES ('1945', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":123.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:57:42');
INSERT INTO `sys_log` VALUES ('1946', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":234.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 15:59:12');
INSERT INTO `sys_log` VALUES ('1947', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[198]', '0:0:0:0:0:0:0:1', '2019-07-12 16:00:01');
INSERT INTO `sys_log` VALUES ('1948', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":123.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:00:14');
INSERT INTO `sys_log` VALUES ('1949', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"asd\",\"orderPrise\":123.0,\"orderTel\":\"zxc\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:01:30');
INSERT INTO `sys_log` VALUES ('1950', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":555.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:04:05');
INSERT INTO `sys_log` VALUES ('1951', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1,\"username\":\"111\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:06:15');
INSERT INTO `sys_log` VALUES ('1952', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[196]', '0:0:0:0:0:0:0:1', '2019-07-12 16:07:25');
INSERT INTO `sys_log` VALUES ('1953', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李亚娟的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"\\tsys/temp/goodsliyj.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:12:02');
INSERT INTO `sys_log` VALUES ('1954', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":201,\"name\":\"李亚娟的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/goodsliyj.html\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:14:13');
INSERT INTO `sys_log` VALUES ('1955', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save()', '{\"roleIdList\":[],\"status\":1}', '0:0:0:0:0:0:0:1', '2019-07-12 16:26:25');
INSERT INTO `sys_log` VALUES ('1956', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":1234.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:26:32');
INSERT INTO `sys_log` VALUES ('1957', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":1234.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:29:39');
INSERT INTO `sys_log` VALUES ('1958', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":123.0,\"orderTel\":\"qwe2\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:30:49');
INSERT INTO `sys_log` VALUES ('1959', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"ssdf\",\"orderPrise\":123.0,\"orderTel\":\"zxc\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:33:55');
INSERT INTO `sys_log` VALUES ('1960', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"qwe\",\"orderPeople\":\"qwe\",\"orderPrise\":123.0,\"orderTel\":\"qwe\"}', '0:0:0:0:0:0:0:1', '2019-07-12 16:34:44');
INSERT INTO `sys_log` VALUES ('1961', 'admin', '保存用户', 'com.erpdemo.controller.SysUserController.save2()', '{\"orderAddress\":\"asd\",\"orderPeople\":\"asd\",\"orderPrise\":1234.0,\"orderTel\":\"asd\"}', '0:0:0:0:0:0:0:1', '2019-07-12 17:25:51');
INSERT INTO `sys_log` VALUES ('1962', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":1212.0,\"amountpayable\":1212.0,\"purchasedateStr\":\"2019-07-27\",\"purchasenumber\":\"JH201907150001\",\"remarks\":\"2113\",\"state\":2,\"supplierid\":60}', '127.0.0.1', '2019-07-15 09:30:07');
INSERT INTO `sys_log` VALUES ('1963', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[41]', '0:0:0:0:0:0:0:1', '2019-07-15 09:46:40');
INSERT INTO `sys_log` VALUES ('1964', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1560836793000,\"code\":\"0088\",\"delflag\":0,\"id\":40,\"inventoryquantity\":0,\"lastpurchasingprice\":212.0,\"minnum\":23,\"model\":\"55g装\",\"name\":\"德芙\",\"producer\":\"巧克力工厂\",\"purchasingprice\":9.0,\"remarks\":\"\",\"sellingprice\":8.0,\"typeid\":11,\"unit\":\"条\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-15 09:47:43');
INSERT INTO `sys_log` VALUES ('1965', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[40]', '0:0:0:0:0:0:0:1', '2019-07-15 09:48:09');
INSERT INTO `sys_log` VALUES ('1966', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":195,\"name\":\"王思宇的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/temp/user.html\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:10:39');
INSERT INTO `sys_log` VALUES ('1967', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"1\",\"name\":\"1\",\"num\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:30:18');
INSERT INTO `sys_log` VALUES ('1968', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"1\",\"name\":\"11\",\"num\":\"1\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:30:27');
INSERT INTO `sys_log` VALUES ('1969', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"11\",\"contact\":\"111\",\"name\":\"111\",\"num\":\"111\",\"remarks\":\"111\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:30:39');
INSERT INTO `sys_log` VALUES ('1970', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"11\",\"contact\":\"111\",\"name\":\"11111\",\"num\":\"11\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:30:47');
INSERT INTO `sys_log` VALUES ('1971', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"1\",\"name\":\"%%1\",\"num\":\"1\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:33:57');
INSERT INTO `sys_log` VALUES ('1972', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":195,\"name\":\"王思宇的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"static/sys/temp/wang.html\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:37:27');
INSERT INTO `sys_log` VALUES ('1973', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":195,\"name\":\"王思宇的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/wangsiyu/user.html\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:39:03');
INSERT INTO `sys_log` VALUES ('1974', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"huh\",\"minnum\":100,\"model\":\"huh\",\"name\":\"%huh\",\"producer\":\"dalian\",\"purchasingprice\":55.0,\"remarks\":\"\",\"typeid\":51,\"unit\":\"箱\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:51:05');
INSERT INTO `sys_log` VALUES ('1975', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"123\",\"minnum\":100,\"model\":\"huh\",\"name\":\"%huhu\",\"producer\":\"大连\",\"purchasingprice\":23.0,\"remarks\":\"\",\"typeid\":53,\"unit\":\"箱\"}', '0:0:0:0:0:0:0:1', '2019-07-15 10:56:12');
INSERT INTO `sys_log` VALUES ('1976', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"0990\",\"minnum\":6,\"model\":\"67_78\",\"name\":\"jij\",\"producer\":\"%湖北\",\"purchasingprice\":5.0,\"remarks\":\"\",\"typeid\":99,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-15 11:23:18');
INSERT INTO `sys_log` VALUES ('1977', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"9898\",\"minnum\":78,\"model\":\"89_9090\",\"name\":\"uu\",\"producer\":\"$湖南\",\"purchasingprice\":6.0,\"remarks\":\"\",\"typeid\":96,\"unit\":\"盆\"}', '0:0:0:0:0:0:0:1', '2019-07-15 11:25:17');
INSERT INTO `sys_log` VALUES ('1978', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"878\",\"minnum\":2,\"model\":\"98_98\",\"name\":\"yu\",\"producer\":\"$美洲\",\"purchasingprice\":2.0,\"remarks\":\"\",\"typeid\":97,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-15 11:28:08');
INSERT INTO `sys_log` VALUES ('1979', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"22\",\"userid\":\"1\",\"newprice\":\"\",\"_\":\"1563161795604\"}', '0:0:0:0:0:0:0:1', '2019-07-15 11:37:47');
INSERT INTO `sys_log` VALUES ('1980', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"222\",\"contact\":\"222\",\"name\":\"2222\",\"num\":\"222\",\"remarks\":\"22\"}', '0:0:0:0:0:0:0:1', '2019-07-15 11:38:47');
INSERT INTO `sys_log` VALUES ('1981', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"22\",\"userid\":\"1\",\"newprice\":\"23\",\"_\":\"1563171234162\"}', '0:0:0:0:0:0:0:1', '2019-07-15 14:16:37');
INSERT INTO `sys_log` VALUES ('1982', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"8898\",\"minnum\":78,\"model\":\"89_89889\",\"name\":\"hj\",\"producer\":\"_积极\",\"purchasingprice\":6.0,\"remarks\":\"\",\"typeid\":99,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-15 14:44:24');
INSERT INTO `sys_log` VALUES ('1983', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562916400000,\"code\":\"123\",\"delflag\":0,\"id\":62,\"inventoryquantity\":1000,\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"123\",\"purchasingprice\":123.0,\"remarks\":\"\",\"typeid\":12,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-15 14:56:06');
INSERT INTO `sys_log` VALUES ('1984', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1561617881000,\"code\":\"0043\",\"delflag\":0,\"id\":52,\"inventoryquantity\":6000,\"minnum\":3,\"model\":\"500ml\",\"name\":\"芬达\",\"producer\":\"$可口可乐有限公司\",\"purchasingprice\":2.0,\"remarks\":\"哈哈\",\"sellingprice\":8.0,\"typeid\":10,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-15 14:56:27');
INSERT INTO `sys_log` VALUES ('1985', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[10]', '127.0.0.1', '2019-07-15 15:03:11');
INSERT INTO `sys_log` VALUES ('1986', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[68,67,66]', '127.0.0.1', '2019-07-15 15:03:13');
INSERT INTO `sys_log` VALUES ('1987', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[89]', '127.0.0.1', '2019-07-15 15:03:44');
INSERT INTO `sys_log` VALUES ('1988', 'admin', '删除用户', 'com.erpdemo.controller.SysPurchaseGoodsController.delete()', '[11]', '127.0.0.1', '2019-07-15 15:03:55');
INSERT INTO `sys_log` VALUES ('1989', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1563161102000,\"code\":\"0990\",\"delflag\":0,\"id\":65,\"inventoryquantity\":100,\"minnum\":6,\"model\":\"67_78\",\"name\":\"ji%j\",\"producer\":\"%湖北\",\"purchasingprice\":5.0,\"remarks\":\"\",\"unit\":\"斤\",\"userid\":1}', '127.0.0.1', '2019-07-15 15:04:02');
INSERT INTO `sys_log` VALUES ('1990', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1563159500000,\"code\":\"123\",\"delflag\":0,\"id\":64,\"inventoryquantity\":200,\"minnum\":100,\"model\":\"huh\",\"name\":\"%huhu\",\"producer\":\"大连\",\"purchasingprice\":23.0,\"remarks\":\"\",\"unit\":\"箱\",\"userid\":1}', '127.0.0.1', '2019-07-15 15:04:13');
INSERT INTO `sys_log` VALUES ('1991', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[65]', '0:0:0:0:0:0:0:1', '2019-07-15 15:04:34');
INSERT INTO `sys_log` VALUES ('1992', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562916400000,\"code\":\"123\",\"delflag\":0,\"id\":62,\"inventoryquantity\":1000,\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"%123\",\"purchasingprice\":123.0,\"remarks\":\"\",\"typeid\":12,\"unit\":\"盆\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-15 15:08:58');
INSERT INTO `sys_log` VALUES ('1993', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562815314000,\"code\":\"123\",\"delflag\":0,\"id\":61,\"inventoryquantity\":1000,\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"%你测\",\"purchasingprice\":123.0,\"remarks\":\"\",\"typeid\":50,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-15 15:09:13');
INSERT INTO `sys_log` VALUES ('1994', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562813781000,\"code\":\"5345\",\"delflag\":0,\"id\":60,\"inventoryquantity\":1000,\"minnum\":2,\"model\":\"798798\",\"name\":\"狗粮\",\"producer\":\"iov$\",\"purchasingprice\":24.0,\"remarks\":\"\",\"typeid\":96,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-15 15:09:26');
INSERT INTO `sys_log` VALUES ('1995', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562811225000,\"code\":\"06-660\",\"delflag\":0,\"id\":59,\"inventoryquantity\":1000,\"minnum\":50,\"model\":\"yt-uii\",\"name\":\"椰子灰\",\"producer\":\"大连贸易%\",\"purchasingprice\":4.0,\"remarks\":\"\",\"typeid\":52,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-15 15:12:16');
INSERT INTO `sys_log` VALUES ('1996', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562726206000,\"code\":\"030\",\"delflag\":0,\"id\":58,\"inventoryquantity\":1000,\"minnum\":4,\"model\":\"\",\"name\":\"可可\",\"producer\":\"_浙江\",\"purchasingprice\":1.0,\"remarks\":\"\",\"typeid\":53,\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-15 15:22:41');
INSERT INTO `sys_log` VALUES ('1997', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"userid\":\"1\",\"newprice\":\"\",\"_\":\"1563175518544\"}', '0:0:0:0:0:0:0:1', '2019-07-15 15:25:34');
INSERT INTO `sys_log` VALUES ('1998', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"11111\",\"addr\":\"11\",\"receiver\":\"11\",\"tel\":\"11\",\"_\":\"1563177341169\"}', '0:0:0:0:0:0:0:1', '2019-07-15 15:57:36');
INSERT INTO `sys_log` VALUES ('1999', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"22222\",\"addr\":\"222\",\"receiver\":\"22\",\"tel\":\"222\",\"_\":\"1563177341172\"}', '0:0:0:0:0:0:0:1', '2019-07-15 15:59:44');
INSERT INTO `sys_log` VALUES ('2000', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"数据导入\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/fileupload.html\"}', '0:0:0:0:0:0:0:1', '2019-07-15 16:38:32');
INSERT INTO `sys_log` VALUES ('2001', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":12.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-11\",\"purchasenumber\":\"JH201907150001\",\"remarks\":\"1231\",\"state\":1,\"supplierid\":64}', '127.0.0.1', '2019-07-15 16:48:43');
INSERT INTO `sys_log` VALUES ('2002', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":234.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-18\",\"purchasenumber\":\"JH201907150001\",\"remarks\":\"123\",\"state\":1,\"supplierid\":11}', '127.0.0.1', '2019-07-15 16:52:07');
INSERT INTO `sys_log` VALUES ('2003', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":321.0,\"amountpayable\":232.0,\"purchasedateStr\":\"2019-07-16\",\"purchasenumber\":\"JH201907150001\",\"remarks\":\"232\",\"state\":1,\"supplierid\":2}', '127.0.0.1', '2019-07-15 16:57:33');
INSERT INTO `sys_log` VALUES ('2004', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":321.0,\"amountpayable\":321.0,\"purchasedateStr\":\"2019-07-18\",\"purchasenumber\":\"JH201907150002\",\"remarks\":\"123\",\"state\":2,\"supplierid\":63}', '127.0.0.1', '2019-07-15 17:08:50');
INSERT INTO `sys_log` VALUES ('2005', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":3232.0,\"amountpayable\":123.0,\"purchasedateStr\":\"2019-07-17\",\"purchasenumber\":\"%H201907150003\",\"remarks\":\"32132\",\"state\":1,\"supplierid\":62}', '127.0.0.1', '2019-07-15 17:09:56');
INSERT INTO `sys_log` VALUES ('2006', 'admin', '删除用户', 'com.erpdemo.controller.SysUserController.delete()', '[null]', '127.0.0.1', '2019-07-15 17:15:40');
INSERT INTO `sys_log` VALUES ('2007', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"李豪的测试\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/lihao/lihao.html\"}', '127.0.0.1', '2019-07-15 17:27:14');
INSERT INTO `sys_log` VALUES ('2008', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":203,\"name\":\"李豪的单据表\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/lihao/lihao.html\"}', '127.0.0.1', '2019-07-15 17:28:04');
INSERT INTO `sys_log` VALUES ('2009', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":185,\"name\":\"赵文鑫的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/zhaowenxin/zhaowenxin.html\"}', '127.0.0.1', '2019-07-15 18:40:31');
INSERT INTO `sys_log` VALUES ('2010', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":185,\"name\":\"赵文鑫的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/zhaowenxin.html\"}', '127.0.0.1', '2019-07-15 18:44:09');
INSERT INTO `sys_log` VALUES ('2011', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"8\"', '127.0.0.1', '2019-07-16 08:29:16');
INSERT INTO `sys_log` VALUES ('2012', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[70,66]', '0:0:0:0:0:0:0:1', '2019-07-16 08:43:20');
INSERT INTO `sys_log` VALUES ('2013', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"wer\",\"contact\":\"wew\",\"name\":\"ewrwq\",\"remarks\":\"ew\"}', '0:0:0:0:0:0:0:1', '2019-07-16 08:43:32');
INSERT INTO `sys_log` VALUES ('2014', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"234\",\"addtime\":1563237812000,\"contact\":\"wew\",\"delflag\":0,\"id\":71,\"name\":\"ewrwq\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-16 08:43:42');
INSERT INTO `sys_log` VALUES ('2015', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"数据导入\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/fileupload.html\"}', '0:0:0:0:0:0:0:1', '2019-07-16 09:18:03');
INSERT INTO `sys_log` VALUES ('2016', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"userid\":\"1\",\"newprice\":\"\",\"_\":\"1563240173857\"}', '0:0:0:0:0:0:0:1', '2019-07-16 09:23:22');
INSERT INTO `sys_log` VALUES ('2017', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"6\"', '0:0:0:0:0:0:0:1', '2019-07-16 09:37:08');
INSERT INTO `sys_log` VALUES ('2018', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"6\"', '0:0:0:0:0:0:0:1', '2019-07-16 09:38:37');
INSERT INTO `sys_log` VALUES ('2019', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"003\",\"minnum\":78,\"model\":\"03-033\",\"name\":\"咖啡豆\",\"producer\":\"8889999\",\"purchasingprice\":50.0,\"remarks\":\"\",\"typeid\":3,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-16 09:44:31');
INSERT INTO `sys_log` VALUES ('2020', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[69]', '0:0:0:0:0:0:0:1', '2019-07-16 09:46:10');
INSERT INTO `sys_log` VALUES ('2021', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"123\",\"minnum\":299,\"model\":\"321\",\"name\":\"q\",\"producer\":\"da\",\"purchasingprice\":24.0,\"remarks\":\"\",\"typeid\":96,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-16 09:53:40');
INSERT INTO `sys_log` VALUES ('2022', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-16 10:13:11');
INSERT INTO `sys_log` VALUES ('2023', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[72]', '0:0:0:0:0:0:0:1', '2019-07-16 10:13:51');
INSERT INTO `sys_log` VALUES ('2024', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[70]', '0:0:0:0:0:0:0:1', '2019-07-16 10:13:40');
INSERT INTO `sys_log` VALUES ('2025', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[58]', '0:0:0:0:0:0:0:1', '2019-07-16 10:14:08');
INSERT INTO `sys_log` VALUES ('2026', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-16 10:16:36');
INSERT INTO `sys_log` VALUES ('2027', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"userid\":\"1\",\"newprice\":\"2\",\"_\":\"1563243501880\"}', '0:0:0:0:0:0:0:1', '2019-07-16 10:18:33');
INSERT INTO `sys_log` VALUES ('2028', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-16 10:19:21');
INSERT INTO `sys_log` VALUES ('2029', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[74,73]', '0:0:0:0:0:0:0:1', '2019-07-16 10:19:33');
INSERT INTO `sys_log` VALUES ('2030', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"userid\":\"1\",\"newprice\":\"22\",\"_\":\"1563243501884\"}', '0:0:0:0:0:0:0:1', '2019-07-16 10:19:09');
INSERT INTO `sys_log` VALUES ('2031', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"userid\":\"1\",\"newprice\":\"23\",\"_\":\"1563243501886\"}', '0:0:0:0:0:0:0:1', '2019-07-16 10:20:01');
INSERT INTO `sys_log` VALUES ('2032', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"userid\":\"1\",\"newprice\":\"\",\"_\":\"1563244224805\"}', '0:0:0:0:0:0:0:1', '2019-07-16 10:30:29');
INSERT INTO `sys_log` VALUES ('2033', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-16 10:50:22');
INSERT INTO `sys_log` VALUES ('2034', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[75]', '0:0:0:0:0:0:0:1', '2019-07-16 10:50:28');
INSERT INTO `sys_log` VALUES ('2035', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":199,\"name\":\"杨帆的单据单\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/yangfan/order_yangfan.html\"}', '127.0.0.1', '2019-07-16 10:53:12');
INSERT INTO `sys_log` VALUES ('2036', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"\",\"contact\":\"\",\"name\":\"\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:14:07');
INSERT INTO `sys_log` VALUES ('2037', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[76]', '0:0:0:0:0:0:0:1', '2019-07-16 11:14:13');
INSERT INTO `sys_log` VALUES ('2038', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"wqe\",\"contact\":\"wq\",\"name\":\"we\",\"remarks\":\"wq\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:19:34');
INSERT INTO `sys_log` VALUES ('2039', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[77]', '0:0:0:0:0:0:0:1', '2019-07-16 11:19:40');
INSERT INTO `sys_log` VALUES ('2040', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[71]', '0:0:0:0:0:0:0:1', '2019-07-16 11:20:19');
INSERT INTO `sys_log` VALUES ('2041', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"we\",\"contact\":\"wer\",\"name\":\"erw\",\"remarks\":\"qe\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:27:19');
INSERT INTO `sys_log` VALUES ('2042', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[78]', '0:0:0:0:0:0:0:1', '2019-07-16 11:28:21');
INSERT INTO `sys_log` VALUES ('2043', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"sd\",\"contact\":\"sa\",\"name\":\"as\",\"remarks\":\"s\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:33:42');
INSERT INTO `sys_log` VALUES ('2044', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"wq\",\"contact\":\"qw\",\"name\":\"wq\",\"remarks\":\"qw\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:36:55');
INSERT INTO `sys_log` VALUES ('2045', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[80,79]', '0:0:0:0:0:0:0:1', '2019-07-16 11:37:03');
INSERT INTO `sys_log` VALUES ('2046', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"wq\",\"contact\":\"qw\",\"name\":\"wq\",\"remarks\":\"qw\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:38:03');
INSERT INTO `sys_log` VALUES ('2047', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"we\",\"minnum\":32,\"model\":\"ew\",\"name\":\"er\",\"producer\":\"ewr\",\"purchasingprice\":32.0,\"remarks\":\"\",\"typeid\":17,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:41:15');
INSERT INTO `sys_log` VALUES ('2048', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[81]', '0:0:0:0:0:0:0:1', '2019-07-16 11:41:35');
INSERT INTO `sys_log` VALUES ('2049', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"wer\",\"contact\":\"wer\",\"name\":\"er\",\"remarks\":\"erw\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:44:30');
INSERT INTO `sys_log` VALUES ('2050', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"ww\",\"contact\":\"we\",\"name\":\"we\",\"remarks\":\"ew\"}', '0:0:0:0:0:0:0:1', '2019-07-16 11:45:45');
INSERT INTO `sys_log` VALUES ('2051', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[83,82]', '0:0:0:0:0:0:0:1', '2019-07-16 11:46:06');
INSERT INTO `sys_log` VALUES ('2052', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"qwewqe\",\"contact\":\"$$$$\",\"name\":\"%%%\",\"remarks\":\"qwqweqweq\"}', '127.0.0.1', '2019-07-16 14:07:34');
INSERT INTO `sys_log` VALUES ('2053', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"qwewqe\",\"contact\":\"__\",\"name\":\"%%%\",\"remarks\":\"qwqweqweq\"}', '127.0.0.1', '2019-07-16 14:08:07');
INSERT INTO `sys_log` VALUES ('2054', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562815314000,\"code\":\"567\",\"delflag\":0,\"id\":61,\"inventoryquantity\":1000,\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"%你测\",\"purchasingprice\":123.0,\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 08:43:11');
INSERT INTO `sys_log` VALUES ('2055', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562815314000,\"code\":\"567\",\"delflag\":0,\"id\":61,\"inventoryquantity\":1000,\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"%你测\",\"purchasingprice\":123.0,\"remarks\":\"\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 08:43:16');
INSERT INTO `sys_log` VALUES ('2056', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1563248540000,\"code\":\"234\",\"delflag\":0,\"id\":71,\"minnum\":32,\"model\":\"ew\",\"name\":\"er\",\"producer\":\"ewr\",\"purchasingprice\":32.0,\"remarks\":\"\",\"typeid\":96,\"unit\":\"盆\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 08:43:39');
INSERT INTO `sys_log` VALUES ('2057', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562916400000,\"code\":\"456\",\"delflag\":0,\"id\":62,\"inventoryquantity\":1000,\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"%123\",\"purchasingprice\":123.0,\"remarks\":\"\",\"typeid\":12,\"unit\":\"盆\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 08:44:08');
INSERT INTO `sys_log` VALUES ('2058', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1562815314000,\"code\":\"789\",\"delflag\":0,\"id\":61,\"inventoryquantity\":1000,\"minnum\":123,\"model\":\"123\",\"name\":\"123\",\"producer\":\"%你测\",\"purchasingprice\":123.0,\"remarks\":\"\",\"typeid\":50,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 08:44:25');
INSERT INTO `sys_log` VALUES ('2059', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"2\",\"contact\":\"22\",\"name\":\"222\",\"num\":\"2\",\"remarks\":\"2\"}', '0:0:0:0:0:0:0:1', '2019-07-17 09:14:25');
INSERT INTO `sys_log` VALUES ('2060', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"6\",\"contact\":\"6\",\"name\":\"666\",\"num\":\"6\",\"remarks\":\"6\"}', '0:0:0:0:0:0:0:1', '2019-07-17 09:14:53');
INSERT INTO `sys_log` VALUES ('2061', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"6\",\"addtime\":1563326093000,\"contact\":\"6\",\"id\":26,\"name\":\"666hh\",\"num\":\"6\",\"remarks\":\"6\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 09:15:04');
INSERT INTO `sys_log` VALUES ('2062', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[26,25,23]', '0:0:0:0:0:0:0:1', '2019-07-17 09:15:16');
INSERT INTO `sys_log` VALUES ('2063', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[21,20]', '0:0:0:0:0:0:0:1', '2019-07-17 09:15:35');
INSERT INTO `sys_log` VALUES ('2064', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"009\",\"minnum\":9,\"model\":\"09-09\",\"name\":\"jk\",\"producer\":\"大连\",\"purchasingprice\":6.0,\"remarks\":\"\",\"sellingprice\":12.0,\"typeid\":96,\"unit\":\"斤\"}', '0:0:0:0:0:0:0:1', '2019-07-17 09:24:44');
INSERT INTO `sys_log` VALUES ('2065', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1563326788000,\"code\":\"009\",\"delflag\":0,\"id\":72,\"inventoryquantity\":7,\"minnum\":9,\"model\":\"09-09\",\"name\":\"jk\",\"producer\":\"大连\",\"purchasingprice\":6.0,\"remarks\":\"\",\"sellingprice\":12.0,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 09:46:13');
INSERT INTO `sys_log` VALUES ('2066', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1563248540000,\"code\":\"234\",\"delflag\":0,\"id\":71,\"inventoryquantity\":30,\"minnum\":32,\"model\":\"ew\",\"name\":\"er\",\"producer\":\"ewr\",\"purchasingprice\":32.0,\"remarks\":\"\",\"sellingprice\":35.0,\"unit\":\"盆\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 09:46:25');
INSERT INTO `sys_log` VALUES ('2067', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"11\",\"contact\":\"1111\",\"name\":\"1222\",\"num\":\"111\",\"remarks\":\"111\"}', '0:0:0:0:0:0:0:1', '2019-07-17 09:58:38');
INSERT INTO `sys_log` VALUES ('2068', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"11\",\"addtime\":1563328718000,\"contact\":\"1111\",\"id\":27,\"name\":\"3322\",\"num\":\"111\",\"remarks\":\"111\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 09:58:53');
INSERT INTO `sys_log` VALUES ('2069', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"11\",\"addtime\":1563328718000,\"contact\":\"1111\",\"id\":27,\"name\":\"8322\",\"num\":\"111\",\"remarks\":\"111\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 09:59:36');
INSERT INTO `sys_log` VALUES ('2070', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[27]', '0:0:0:0:0:0:0:1', '2019-07-17 09:59:44');
INSERT INTO `sys_log` VALUES ('2071', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"6\"', '127.0.0.1', '2019-07-17 10:08:06');
INSERT INTO `sys_log` VALUES ('2072', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseController.save()', '{\"amountpaid\":23.0,\"amountpayable\":23.0,\"purchasedateStr\":\"2019-07-19\",\"purchasenumber\":\"JH201907170001\",\"remarks\":\"23\",\"state\":2,\"supplierid\":44}', '127.0.0.1', '2019-07-17 10:20:44');
INSERT INTO `sys_log` VALUES ('2073', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1562811225000,\"code\":\"06-660\",\"delflag\":0,\"id\":59,\"inventoryquantity\":1000,\"minnum\":50,\"model\":\"yt-uii\",\"name\":\"椰子灰\",\"producer\":\"大连贸易%\",\"purchasingprice\":10.0,\"remarks\":\"\",\"sellingprice\":6.0,\"unit\":\"斤\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 10:37:52');
INSERT INTO `sys_log` VALUES ('2074', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1561617881000,\"code\":\"0042\",\"delflag\":0,\"id\":51,\"inventoryquantity\":11000,\"minnum\":3,\"model\":\"500ml\",\"name\":\"雪碧\",\"producer\":\"可口可乐有限公司\",\"purchasingprice\":3.0,\"remarks\":\"哈哈\",\"sellingprice\":8.0,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 10:42:07');
INSERT INTO `sys_log` VALUES ('2075', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"addtime\":1563181155000,\"amountpaid\":321.0,\"amountpayable\":232.0,\"delflag\":0,\"id\":212,\"purchaseGoods\":[],\"purchasedate\":1563206400000,\"purchasedateStr\":\"2019-07-16\",\"purchasenumber\":\"JH201907150001\",\"remarks\":\"232\",\"state\":2,\"supplierid\":2,\"userid\":1}', '127.0.0.1', '2019-07-17 11:06:17');
INSERT INTO `sys_log` VALUES ('2076', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseController.update()', '{\"amountpaid\":11111.0,\"amountpayable\":11111.0,\"id\":211,\"purchasedateStr\":\"2019-07-06\",\"purchasenumber\":\"JH201907170002\",\"remarks\":\"123\",\"state\":1,\"supplierid\":44}', '127.0.0.1', '2019-07-17 11:07:19');
INSERT INTO `sys_log` VALUES ('2077', 'admin', '保存', 'com.erpdemo.controller.SysPurchaseGoodsController.save()', '{\"addtime\":1562813781000,\"code\":\"5345\",\"delflag\":0,\"goodsid\":60,\"model\":\"798798\",\"name\":\"狗粮\",\"num\":123.0,\"price\":123.0,\"typeid\":96,\"unit\":\"斤\",\"userid\":1}', '127.0.0.1', '2019-07-17 11:07:45');
INSERT INTO `sys_log` VALUES ('2078', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[60]', '0:0:0:0:0:0:0:1', '2019-07-17 11:08:54');
INSERT INTO `sys_log` VALUES ('2079', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[82]', '0:0:0:0:0:0:0:1', '2019-07-17 11:10:45');
INSERT INTO `sys_log` VALUES ('2080', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[83,81,80,44]', '0:0:0:0:0:0:0:1', '2019-07-17 11:27:30');
INSERT INTO `sys_log` VALUES ('2081', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[51]', '0:0:0:0:0:0:0:1', '2019-07-17 11:27:38');
INSERT INTO `sys_log` VALUES ('2082', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"5555\",\"addr\":\"5\",\"receiver\":\"5\",\"tel\":\"5\",\"_\":\"1563344494859\"}', '0:0:0:0:0:0:0:1', '2019-07-17 14:22:55');
INSERT INTO `sys_log` VALUES ('2083', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"99\",\"addr\":\"9\",\"receiver\":\"9\",\"tel\":\"9\",\"_\":\"1563344494864\"}', '0:0:0:0:0:0:0:1', '2019-07-17 14:23:29');
INSERT INTO `sys_log` VALUES ('2084', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"sd\",\"contact\":\"sd\",\"name\":\"ad\",\"remarks\":\"sa\"}', '0:0:0:0:0:0:0:1', '2019-07-17 14:48:46');
INSERT INTO `sys_log` VALUES ('2085', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"243\",\"addtime\":1563346126000,\"contact\":\"sd\",\"delflag\":0,\"id\":86,\"name\":\"ad\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 14:48:56');
INSERT INTO `sys_log` VALUES ('2086', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[86]', '0:0:0:0:0:0:0:1', '2019-07-17 14:49:02');
INSERT INTO `sys_log` VALUES ('2087', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"ew\",\"contact\":\"we\",\"name\":\"wq\",\"remarks\":\"e\"}', '0:0:0:0:0:0:0:1', '2019-07-17 14:49:53');
INSERT INTO `sys_log` VALUES ('2088', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"435\",\"contact\":\"435\",\"name\":\"435\",\"remarks\":\"54\"}', '0:0:0:0:0:0:0:1', '2019-07-17 14:52:30');
INSERT INTO `sys_log` VALUES ('2089', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[88]', '0:0:0:0:0:0:0:1', '2019-07-17 14:53:55');
INSERT INTO `sys_log` VALUES ('2090', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"21312\",\"addtime\":1563346194000,\"contact\":\"we\",\"delflag\":0,\"id\":87,\"name\":\"wq\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 14:54:55');
INSERT INTO `sys_log` VALUES ('2091', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[87]', '0:0:0:0:0:0:0:1', '2019-07-17 15:16:13');
INSERT INTO `sys_log` VALUES ('2092', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1563157818000,\"contact\":\"1\",\"id\":18,\"name\":\"1111\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 16:23:51');
INSERT INTO `sys_log` VALUES ('2093', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1563157818000,\"contact\":\"1\",\"id\":18,\"name\":\"1111ha\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 16:24:06');
INSERT INTO `sys_log` VALUES ('2094', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[18]', '0:0:0:0:0:0:0:1', '2019-07-17 16:24:40');
INSERT INTO `sys_log` VALUES ('2095', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"6\",\"contact\":\"6\",\"name\":\"66\",\"num\":\"6\",\"remarks\":\"6\"}', '0:0:0:0:0:0:0:1', '2019-07-17 16:24:51');
INSERT INTO `sys_log` VALUES ('2096', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"sd\",\"addtime\":1563248022000,\"contact\":\"sa\",\"delflag\":0,\"id\":79,\"name\":\"12433\",\"num\":\"1\",\"remarks\":\"失信供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 17:32:00');
INSERT INTO `sys_log` VALUES ('2097', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"sd\",\"addtime\":1563248022000,\"contact\":\"1233\",\"delflag\":0,\"id\":79,\"name\":\"12433\",\"num\":\"1\",\"remarks\":\"失信供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 17:34:24');
INSERT INTO `sys_log` VALUES ('2098', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"123\",\"addtime\":1563248022000,\"contact\":\"1233\",\"delflag\":0,\"id\":79,\"name\":\"12433\",\"num\":\"1\",\"remarks\":\"失信供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-17 17:35:38');
INSERT INTO `sys_log` VALUES ('2099', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"userid\":\"1\",\"newprice\":\"\",\"_\":\"1563410777100\"}', '0:0:0:0:0:0:0:1', '2019-07-18 08:46:30');
INSERT INTO `sys_log` VALUES ('2100', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"userid\":\"1\",\"newprice\":\"24\",\"_\":\"1563412553869\"}', '0:0:0:0:0:0:0:1', '2019-07-18 09:16:04');
INSERT INTO `sys_log` VALUES ('2101', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"wre\",\"contact\":\"wer\",\"name\":\"qwe\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-18 09:53:16');
INSERT INTO `sys_log` VALUES ('2102', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"6\",\"addtime\":1563351891000,\"contact\":\"6\",\"id\":28,\"name\":\"66hh\",\"num\":\"6\",\"remarks\":\"6\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-18 10:15:14');
INSERT INTO `sys_log` VALUES ('2103', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"6\",\"addtime\":1563351891000,\"contact\":\"6\",\"id\":28,\"name\":\"66hha\",\"num\":\"6\",\"remarks\":\"6\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-18 10:42:58');
INSERT INTO `sys_log` VALUES ('2104', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"1\",\"name\":\"14\",\"num\":\"1\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 10:43:09');
INSERT INTO `sys_log` VALUES ('2105', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[29]', '0:0:0:0:0:0:0:1', '2019-07-18 10:43:14');
INSERT INTO `sys_log` VALUES ('2106', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"24\",\"userid\":\"1\",\"newprice\":\"\",\"_\":\"1563418345794\"}', '0:0:0:0:0:0:0:1', '2019-07-18 10:52:31');
INSERT INTO `sys_log` VALUES ('2107', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"11\",\"addr\":\"1\",\"receiver\":\"1\",\"tel\":\"1\",\"_\":\"1563419212467\"}', '0:0:0:0:0:0:0:1', '2019-07-18 11:07:01');
INSERT INTO `sys_log` VALUES ('2108', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"a\",\"addr\":\"a\",\"receiver\":\"a\",\"tel\":\"1\",\"_\":\"1563419527822\"}', '0:0:0:0:0:0:0:1', '2019-07-18 11:12:31');
INSERT INTO `sys_log` VALUES ('2109', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"11134\",\"addr\":\"1\",\"receiver\":\"1\",\"tel\":\"1\",\"_\":\"1563419527825\"}', '0:0:0:0:0:0:0:1', '2019-07-18 11:12:50');
INSERT INTO `sys_log` VALUES ('2110', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1256\",\"minnum\":1000,\"model\":\"500ml\",\"name\":\"大雪碧\",\"producer\":\"涛哥生产厂\",\"purchasingprice\":6.0,\"remarks\":\"喝就完了\",\"sellingprice\":8.0,\"typeid\":11,\"unit\":\"桶\"}', '0:0:0:0:0:0:0:1', '2019-07-18 11:14:57');
INSERT INTO `sys_log` VALUES ('2111', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1563419800000,\"code\":\"1256\",\"delflag\":0,\"id\":70,\"inventoryquantity\":100,\"minnum\":1000,\"model\":\"500ml\",\"name\":\"大雪碧\",\"producer\":\"涛哥生产厂\",\"purchasingprice\":6.0,\"remarks\":\"喝就完了\",\"sellingprice\":8.0,\"unit\":\"桶\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-18 11:16:33');
INSERT INTO `sys_log` VALUES ('2112', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[70]', '0:0:0:0:0:0:0:1', '2019-07-18 11:23:02');
INSERT INTO `sys_log` VALUES ('2113', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"24\",\"userid\":\"1\",\"newprice\":\"2\",\"_\":\"1563430686976\"}', '0:0:0:0:0:0:0:1', '2019-07-18 14:18:16');
INSERT INTO `sys_log` VALUES ('2114', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"24\",\"userid\":\"1\",\"newprice\":\"2\",\"_\":\"1563430686978\"}', '0:0:0:0:0:0:0:1', '2019-07-18 14:18:29');
INSERT INTO `sys_log` VALUES ('2115', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"324\",\"addtime\":1563414796000,\"contact\":\"wer\",\"delflag\":0,\"id\":89,\"name\":\"qwe\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-18 14:32:06');
INSERT INTO `sys_log` VALUES ('2116', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":201,\"name\":\"李亚娟的单据\",\"orderNum\":0,\"parentId\":181,\"parentName\":\"2019-0712-测试\",\"type\":1,\"url\":\"sys/liyajuan/goodsliyj.html\"}', '0:0:0:0:0:0:0:1', '2019-07-18 14:32:34');
INSERT INTO `sys_log` VALUES ('2117', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"2\",\"addr\":\"2\",\"receiver\":\"2\",\"tel\":\"2\",\"_\":\"1563431644722\"}', '0:0:0:0:0:0:0:1', '2019-07-18 14:36:51');
INSERT INTO `sys_log` VALUES ('2118', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"ew\",\"contact\":\"ew\",\"name\":\"ew\",\"remarks\":\"ew\"}', '0:0:0:0:0:0:0:1', '2019-07-18 14:57:47');
INSERT INTO `sys_log` VALUES ('2119', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"wq\",\"contact\":\"wq\",\"name\":\"qwe\",\"remarks\":\"e\"}', '0:0:0:0:0:0:0:1', '2019-07-18 15:01:56');
INSERT INTO `sys_log` VALUES ('2120', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"1234\",\"addtime\":1563433383000,\"contact\":\"wq\",\"delflag\":0,\"id\":90,\"name\":\"qwe\",\"num\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-18 15:02:14');
INSERT INTO `sys_log` VALUES ('2121', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品规格\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys\\\\goodsmodel.html\"}', '0:0:0:0:0:0:0:1', '2019-07-18 15:22:57');
INSERT INTO `sys_log` VALUES ('2122', 'admin', '修改', 'com.erpdemo.controller.SysPurchaseGoodsController.selectOne()', '\"6\"', '0:0:0:0:0:0:0:1', '2019-07-18 15:27:35');
INSERT INTO `sys_log` VALUES ('2123', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"\",\"_\":\"1563435668108\"}', '0:0:0:0:0:0:0:1', '2019-07-18 15:41:40');
INSERT INTO `sys_log` VALUES ('2124', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[90]', '0:0:0:0:0:0:0:1', '2019-07-18 15:46:59');
INSERT INTO `sys_log` VALUES ('2125', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[89,78]', '0:0:0:0:0:0:0:1', '2019-07-18 15:47:08');
INSERT INTO `sys_log` VALUES ('2126', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"fd\",\"contact\":\"df\",\"name\":\"fdv\",\"remarks\":\"fd\"}', '0:0:0:0:0:0:0:1', '2019-07-18 15:47:17');
INSERT INTO `sys_log` VALUES ('2127', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[91]', '0:0:0:0:0:0:0:1', '2019-07-18 15:47:38');
INSERT INTO `sys_log` VALUES ('2128', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[91]', '0:0:0:0:0:0:0:1', '2019-07-18 15:47:53');
INSERT INTO `sys_log` VALUES ('2129', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[91]', '0:0:0:0:0:0:0:1', '2019-07-18 15:48:05');
INSERT INTO `sys_log` VALUES ('2130', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"123\",\"addtime\":1563248022000,\"contact\":\"1233\",\"delflag\":0,\"id\":79,\"name\":\"rrr\",\"num\":\"1\",\"remarks\":\"失信供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-18 15:52:55');
INSERT INTO `sys_log` VALUES ('2131', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"a\",\"num\":\"1\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 15:55:27');
INSERT INTO `sys_log` VALUES ('2132', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"a\",\"num\":\"1\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 15:56:15');
INSERT INTO `sys_log` VALUES ('2133', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"ew\",\"contact\":\"we\",\"name\":\"ew\",\"remarks\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-18 15:58:25');
INSERT INTO `sys_log` VALUES ('2134', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"ew\",\"contact\":\"we\",\"remarks\":\"ew\"}', '0:0:0:0:0:0:0:1', '2019-07-18 15:58:31');
INSERT INTO `sys_log` VALUES ('2135', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"d\",\"contact\":\"ds\",\"name\":\"sd\",\"remarks\":\"d\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:00:29');
INSERT INTO `sys_log` VALUES ('2136', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[93]', '0:0:0:0:0:0:0:1', '2019-07-18 16:04:22');
INSERT INTO `sys_log` VALUES ('2137', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"\",\"_\":\"1563437312509\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:08:43');
INSERT INTO `sys_log` VALUES ('2138', 'admin', '修改用户', 'com.erpdemo.controller.SysSupplierController.update()', '{\"addr\":\"34243\",\"addtime\":1563436771000,\"contact\":\"we\",\"delflag\":0,\"id\":92,\"name\":\"ew\",\"num\":\"1\",\"remarks\":\"失信供应商\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-18 16:15:34');
INSERT INTO `sys_log` VALUES ('2139', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"2222\",\"newprice\":\"\",\"_\":\"1563437921573\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:18:58');
INSERT INTO `sys_log` VALUES ('2140', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[47]', '0:0:0:0:0:0:0:1', '2019-07-18 16:29:44');
INSERT INTO `sys_log` VALUES ('2141', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"11\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:32:07');
INSERT INTO `sys_log` VALUES ('2142', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"11111\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:32:15');
INSERT INTO `sys_log` VALUES ('2143', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"1111111111\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:32:23');
INSERT INTO `sys_log` VALUES ('2144', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"11111111111\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:32:29');
INSERT INTO `sys_log` VALUES ('2145', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"商品颜色\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"基础资料\",\"type\":1,\"url\":\"sys/goodscolor.html\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:45:58');
INSERT INTO `sys_log` VALUES ('2146', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"11111\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:46:48');
INSERT INTO `sys_log` VALUES ('2147', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"13555555555\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:47:10');
INSERT INTO `sys_log` VALUES ('2148', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"a\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"a\",\"remarks\":\"a\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:47:41');
INSERT INTO `sys_log` VALUES ('2149', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"a\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"222\",\"remarks\":\"a\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:47:45');
INSERT INTO `sys_log` VALUES ('2150', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"a\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"22233\",\"remarks\":\"a\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:47:48');
INSERT INTO `sys_log` VALUES ('2151', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"a\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"22233444\",\"remarks\":\"a\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:47:51');
INSERT INTO `sys_log` VALUES ('2152', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"a\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"22233444555\",\"remarks\":\"a\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:47:54');
INSERT INTO `sys_log` VALUES ('2153', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"a\",\"contact\":\"a\",\"name\":\"aa\",\"num\":\"13833444555\",\"remarks\":\"a\"}', '0:0:0:0:0:0:0:1', '2019-07-18 16:47:59');
INSERT INTO `sys_log` VALUES ('2154', 'admin', '保存用户', 'com.erpdemo.controller.GoodsController.add()', '{\"price\":\"33\",\"addr\":\"3\",\"receiver\":\"3\",\"tel\":\"3\",\"_\":\"1563440983517\"}', '127.0.0.1', '2019-07-18 17:11:16');
INSERT INTO `sys_log` VALUES ('2155', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"222\",\"_\":\"1563442388575\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:33:16');
INSERT INTO `sys_log` VALUES ('2156', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"222\",\"_\":\"1563442416334\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:33:42');
INSERT INTO `sys_log` VALUES ('2157', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"222\",\"_\":\"1563442441917\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:34:10');
INSERT INTO `sys_log` VALUES ('2158', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"222\",\"_\":\"1563442480295\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:34:48');
INSERT INTO `sys_log` VALUES ('2159', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"22\",\"_\":\"1563442480300\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:35:20');
INSERT INTO `sys_log` VALUES ('2160', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"222\",\"_\":\"1563442806872\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:40:13');
INSERT INTO `sys_log` VALUES ('2161', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"22\",\"_\":\"1563442937259\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:42:23');
INSERT INTO `sys_log` VALUES ('2162', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"223\",\"_\":\"1563443440066\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:50:51');
INSERT INTO `sys_log` VALUES ('2163', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"2332\",\"_\":\"1563443607794\"}', '0:0:0:0:0:0:0:1', '2019-07-18 17:53:43');
INSERT INTO `sys_log` VALUES ('2164', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"19\",\"_\":\"1563444020523\"}', '0:0:0:0:0:0:0:1', '2019-07-18 18:00:36');
INSERT INTO `sys_log` VALUES ('2165', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"223\",\"_\":\"1563444108749\"}', '0:0:0:0:0:0:0:1', '2019-07-18 18:02:52');
INSERT INTO `sys_log` VALUES ('2166', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"13\",\"_\":\"1563444249890\"}', '0:0:0:0:0:0:0:1', '2019-07-18 18:04:17');
INSERT INTO `sys_log` VALUES ('2167', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"3\",\"_\":\"1563444532076\"}', '0:0:0:0:0:0:0:1', '2019-07-18 18:09:02');
INSERT INTO `sys_log` VALUES ('2168', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"223\",\"_\":\"1563444812194\"}', '0:0:0:0:0:0:0:1', '2019-07-18 18:13:49');
INSERT INTO `sys_log` VALUES ('2169', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"_\":\"1563445645791\"}', '0:0:0:0:0:0:0:1', '2019-07-18 18:27:32');
INSERT INTO `sys_log` VALUES ('2170', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[21]', '0:0:0:0:0:0:0:1', '2019-07-18 18:27:10');
INSERT INTO `sys_log` VALUES ('2171', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[18]', '0:0:0:0:0:0:0:1', '2019-07-18 18:28:40');
INSERT INTO `sys_log` VALUES ('2172', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"23\",\"_\":\"1563496263930\"}', '0:0:0:0:0:0:0:1', '2019-07-19 08:31:16');
INSERT INTO `sys_log` VALUES ('2173', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"\",\"_\":\"1563496730535\"}', '127.0.0.1', '2019-07-19 08:39:04');
INSERT INTO `sys_log` VALUES ('2174', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"\",\"_\":\"1563496769481\"}', '127.0.0.1', '2019-07-19 08:39:40');
INSERT INTO `sys_log` VALUES ('2175', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"333\",\"_\":\"1563497028221\"}', '0:0:0:0:0:0:0:1', '2019-07-19 08:43:55');
INSERT INTO `sys_log` VALUES ('2176', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"\",\"_\":\"1563497147145\"}', '0:0:0:0:0:0:0:1', '2019-07-19 08:45:52');
INSERT INTO `sys_log` VALUES ('2177', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"12\",\"_\":\"1563497147148\"}', '0:0:0:0:0:0:0:1', '2019-07-19 08:46:01');
INSERT INTO `sys_log` VALUES ('2178', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2\",\"newprice\":\"\",\"_\":\"1563497852077\"}', '0:0:0:0:0:0:0:1', '2019-07-19 08:57:43');
INSERT INTO `sys_log` VALUES ('2179', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[17]', '0:0:0:0:0:0:0:1', '2019-07-19 09:34:29');
INSERT INTO `sys_log` VALUES ('2180', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[17]', '0:0:0:0:0:0:0:1', '2019-07-19 09:43:22');
INSERT INTO `sys_log` VALUES ('2181', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[18]', '0:0:0:0:0:0:0:1', '2019-07-19 09:47:55');
INSERT INTO `sys_log` VALUES ('2182', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"2222\",\"newprice\":\"2222\",\"_\":\"1563500989264\"}', '0:0:0:0:0:0:0:1', '2019-07-19 09:50:08');
INSERT INTO `sys_log` VALUES ('2183', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[17]', '0:0:0:0:0:0:0:1', '2019-07-19 09:58:38');
INSERT INTO `sys_log` VALUES ('2184', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[17]', '0:0:0:0:0:0:0:1', '2019-07-19 10:01:50');
INSERT INTO `sys_log` VALUES ('2185', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:03:14');
INSERT INTO `sys_log` VALUES ('2186', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"12\",\"newprice\":\"12\",\"_\":\"1563501849431\"}', '0:0:0:0:0:0:0:1', '2019-07-19 10:04:14');
INSERT INTO `sys_log` VALUES ('2187', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"12\",\"newprice\":\"12\",\"_\":\"1563501942913\"}', '0:0:0:0:0:0:0:1', '2019-07-19 10:05:49');
INSERT INTO `sys_log` VALUES ('2188', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"2222\",\"newprice\":\"2323\",\"_\":\"1563502037868\"}', '0:0:0:0:0:0:0:1', '2019-07-19 10:07:35');
INSERT INTO `sys_log` VALUES ('2189', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"2323\",\"newprice\":\"2323\",\"_\":\"1563502075075\"}', '0:0:0:0:0:0:0:1', '2019-07-19 10:08:08');
INSERT INTO `sys_log` VALUES ('2190', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:08:08');
INSERT INTO `sys_log` VALUES ('2191', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:09:45');
INSERT INTO `sys_log` VALUES ('2192', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:13:36');
INSERT INTO `sys_log` VALUES ('2193', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:17:05');
INSERT INTO `sys_log` VALUES ('2194', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"e\",\"contact\":\"e\",\"name\":\"32\",\"remarks\":\"e\"}', '0:0:0:0:0:0:0:1', '2019-07-19 10:22:08');
INSERT INTO `sys_log` VALUES ('2195', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[9]', '0:0:0:0:0:0:0:1', '2019-07-19 10:21:18');
INSERT INTO `sys_log` VALUES ('2196', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"11\",\"name\":\"野生东北黑木耳\",\"sellingprice\":\"18\",\"newprice\":\"138\",\"_\":\"1563502963601\"}', '0:0:0:0:0:0:0:1', '2019-07-19 10:23:02');
INSERT INTO `sys_log` VALUES ('2197', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"d\",\"contact\":\"d\",\"name\":\"df\",\"remarks\":\"d\"}', '0:0:0:0:0:0:0:1', '2019-07-19 10:23:50');
INSERT INTO `sys_log` VALUES ('2198', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:39:20');
INSERT INTO `sys_log` VALUES ('2199', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:40:51');
INSERT INTO `sys_log` VALUES ('2200', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:41:31');
INSERT INTO `sys_log` VALUES ('2201', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:43:06');
INSERT INTO `sys_log` VALUES ('2202', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:46:19');
INSERT INTO `sys_log` VALUES ('2203', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:47:43');
INSERT INTO `sys_log` VALUES ('2204', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:49:32');
INSERT INTO `sys_log` VALUES ('2205', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:54:09');
INSERT INTO `sys_log` VALUES ('2206', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 10:56:48');
INSERT INTO `sys_log` VALUES ('2207', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"33\",\"contact\":\"32\",\"name\":\"3\",\"remarks\":\"3\"}', '0:0:0:0:0:0:0:1', '2019-07-19 11:15:05');
INSERT INTO `sys_log` VALUES ('2208', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"1\",\"contact\":\"1\",\"name\":\"1\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-19 11:28:46');
INSERT INTO `sys_log` VALUES ('2209', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[96,95,94]', '0:0:0:0:0:0:0:1', '2019-07-19 11:38:12');
INSERT INTO `sys_log` VALUES ('2210', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"1\",\"contact\":\"1\",\"name\":\"1\",\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-19 11:37:33');
INSERT INTO `sys_log` VALUES ('2211', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[98,97]', '0:0:0:0:0:0:0:1', '2019-07-19 11:37:44');
INSERT INTO `sys_log` VALUES ('2212', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 11:42:42');
INSERT INTO `sys_log` VALUES ('2213', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 11:43:15');
INSERT INTO `sys_log` VALUES ('2214', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 11:48:53');
INSERT INTO `sys_log` VALUES ('2215', 'admin', '保存用户', 'com.erpdemo.controller.SysSupplierController.save()', '{\"addr\":\"f\",\"contact\":\"fd\",\"name\":\"ew\",\"remarks\":\"fr\"}', '0:0:0:0:0:0:0:1', '2019-07-19 12:33:09');
INSERT INTO `sys_log` VALUES ('2216', 'admin', '删除用户', 'com.erpdemo.controller.SysSupplierController.delete()', '[99]', '0:0:0:0:0:0:0:1', '2019-07-19 12:33:31');
INSERT INTO `sys_log` VALUES ('2217', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[46]', '0:0:0:0:0:0:0:1', '2019-07-19 13:54:34');
INSERT INTO `sys_log` VALUES ('2218', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 14:28:57');
INSERT INTO `sys_log` VALUES ('2219', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 14:29:08');
INSERT INTO `sys_log` VALUES ('2220', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"12\",\"newprice\":\"13\",\"_\":\"1563518075241\"}', '0:0:0:0:0:0:0:1', '2019-07-19 14:34:49');
INSERT INTO `sys_log` VALUES ('2221', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"12\",\"userid\":\"1\",\"newprice\":\"2342\",\"_\":\"1563518288366\"}', '0:0:0:0:0:0:0:1', '2019-07-19 14:38:17');
INSERT INTO `sys_log` VALUES ('2222', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2342\",\"userid\":\"1\",\"newprice\":\"22131\",\"_\":\"1563518357162\"}', '0:0:0:0:0:0:0:1', '2019-07-19 14:39:25');
INSERT INTO `sys_log` VALUES ('2223', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1563516832000,\"code\":\"4\",\"delflag\":0,\"id\":71,\"inventoryquantity\":60,\"minnum\":6,\"model\":\"14\",\"name\":\"300g装\",\"producer\":\"冰糖金桔干\",\"purchasingprice\":33.0,\"remarks\":\"13\",\"sellingprice\":429.0,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-19 14:45:17');
INSERT INTO `sys_log` VALUES ('2224', 'admin', '修改期初库存', 'com.erpdemo.controller.SysGoodsController.updateinventory()', '{\"addtime\":1563516832000,\"code\":\"5\",\"delflag\":0,\"id\":72,\"inventoryquantity\":50,\"minnum\":6,\"model\":\"14\",\"name\":\"300g装\",\"producer\":\"冰糖金桔干\",\"purchasingprice\":10.0,\"remarks\":\"13\",\"sellingprice\":130.0,\"unit\":\"盒\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-19 14:45:28');
INSERT INTO `sys_log` VALUES ('2225', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"22131\",\"userid\":\"1\",\"newprice\":\"123\",\"_\":\"1563518888992\"}', '0:0:0:0:0:0:0:1', '2019-07-19 14:48:22');
INSERT INTO `sys_log` VALUES ('2226', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"123\",\"userid\":\"1\",\"newprice\":\"1234\",\"_\":\"1563519295249\"}', '0:0:0:0:0:0:0:1', '2019-07-19 14:55:15');
INSERT INTO `sys_log` VALUES ('2227', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"1234\",\"userid\":\"1\",\"newprice\":\"23\",\"_\":\"1563519417404\"}', '0:0:0:0:0:0:0:1', '2019-07-19 14:57:05');
INSERT INTO `sys_log` VALUES ('2228', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"userid\":\"1\",\"newprice\":\"23\",\"_\":\"1563519479151\"}', '0:0:0:0:0:0:0:1', '2019-07-19 14:58:07');
INSERT INTO `sys_log` VALUES ('2229', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"userid\":\"1\",\"newprice\":\"165\",\"_\":\"1563519540047\"}', '0:0:0:0:0:0:0:1', '2019-07-19 14:59:08');
INSERT INTO `sys_log` VALUES ('2230', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{}', '0:0:0:0:0:0:0:1', '2019-07-19 15:07:17');
INSERT INTO `sys_log` VALUES ('2231', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"165\",\"userid\":\"1\",\"newprice\":\"23\",\"_\":\"1563520286859\"}', '0:0:0:0:0:0:0:1', '2019-07-19 15:11:33');
INSERT INTO `sys_log` VALUES ('2232', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{}', '0:0:0:0:0:0:0:1', '2019-07-19 15:11:58');
INSERT INTO `sys_log` VALUES ('2233', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"newprice\":\"\",\"_\":\"1563521127135\"}', '0:0:0:0:0:0:0:1', '2019-07-19 15:25:34');
INSERT INTO `sys_log` VALUES ('2234', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[204]', '0:0:0:0:0:0:0:1', '2019-07-19 15:29:12');
INSERT INTO `sys_log` VALUES ('2235', 'admin', '删除菜单', 'com.erpdemo.controller.SysMenuController.delete()', '[202]', '0:0:0:0:0:0:0:1', '2019-07-19 15:30:54');
INSERT INTO `sys_log` VALUES ('2236', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"23\",\"newprice\":\"65\",\"_\":\"1563521474373\"}', '0:0:0:0:0:0:0:1', '2019-07-19 15:31:27');
INSERT INTO `sys_log` VALUES ('2237', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"65\",\"newprice\":\"32\",\"_\":\"1563522361029\"}', '0:0:0:0:0:0:0:1', '2019-07-19 15:46:17');
INSERT INTO `sys_log` VALUES ('2238', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 15:51:57');
INSERT INTO `sys_log` VALUES ('2239', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsModelController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-19 16:02:08');
INSERT INTO `sys_log` VALUES ('2240', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"32\",\"newprice\":\"2324\",\"_\":\"1563524931088\"}', '0:0:0:0:0:0:0:1', '2019-07-19 16:29:12');
INSERT INTO `sys_log` VALUES ('2241', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"2324\",\"newprice\":\"24\",\"_\":\"1563755618498\"}', '0:0:0:0:0:0:0:1', '2019-07-22 08:35:31');
INSERT INTO `sys_log` VALUES ('2242', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-22 08:48:53');
INSERT INTO `sys_log` VALUES ('2243', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[21]', '0:0:0:0:0:0:0:1', '2019-07-22 08:49:06');
INSERT INTO `sys_log` VALUES ('2244', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"11\",\"name\":\"野生东北黑木耳\",\"sellingprice\":\"138\",\"newprice\":\"145\",\"_\":\"1563757391636\"}', '0:0:0:0:0:0:0:1', '2019-07-22 09:03:18');
INSERT INTO `sys_log` VALUES ('2245', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 09:03:19');
INSERT INTO `sys_log` VALUES ('2246', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 09:15:19');
INSERT INTO `sys_log` VALUES ('2247', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"12\",\"name\":\"新疆红枣\",\"sellingprice\":\"28\",\"newprice\":\"67\",\"_\":\"1563757745815\"}', '0:0:0:0:0:0:0:1', '2019-07-22 09:33:05');
INSERT INTO `sys_log` VALUES ('2248', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 09:34:43');
INSERT INTO `sys_log` VALUES ('2249', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 09:37:08');
INSERT INTO `sys_log` VALUES ('2250', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 09:40:07');
INSERT INTO `sys_log` VALUES ('2251', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 09:40:34');
INSERT INTO `sys_log` VALUES ('2252', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 09:43:52');
INSERT INTO `sys_log` VALUES ('2253', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[23]', '0:0:0:0:0:0:0:1', '2019-07-22 09:51:37');
INSERT INTO `sys_log` VALUES ('2254', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-22 15:01:54');
INSERT INTO `sys_log` VALUES ('2255', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-22 15:07:54');
INSERT INTO `sys_log` VALUES ('2256', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"12\",\"name\":\"新疆红枣\",\"sellingprice\":\"67\",\"newprice\":\"21\",\"_\":\"1563781621192\"}', '0:0:0:0:0:0:0:1', '2019-07-22 15:49:25');
INSERT INTO `sys_log` VALUES ('2257', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"2323\",\"newprice\":\"324\",\"_\":\"1563781822676\"}', '0:0:0:0:0:0:0:1', '2019-07-22 15:51:16');
INSERT INTO `sys_log` VALUES ('2258', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-22 16:40:43');
INSERT INTO `sys_log` VALUES ('2259', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-22 16:41:01');
INSERT INTO `sys_log` VALUES ('2260', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49,48]', '0:0:0:0:0:0:0:1', '2019-07-22 16:56:53');
INSERT INTO `sys_log` VALUES ('2261', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 17:01:03');
INSERT INTO `sys_log` VALUES ('2262', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"11\",\"model\":\"11\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-22 17:06:00');
INSERT INTO `sys_log` VALUES ('2263', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 17:06:27');
INSERT INTO `sys_log` VALUES ('2264', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[49]', '0:0:0:0:0:0:0:1', '2019-07-22 17:11:38');
INSERT INTO `sys_log` VALUES ('2265', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-22 17:38:50');
INSERT INTO `sys_log` VALUES ('2266', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"q\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-22 18:35:06');
INSERT INTO `sys_log` VALUES ('2267', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[83,82,74,73]', '0:0:0:0:0:0:0:1', '2019-07-23 11:17:13');
INSERT INTO `sys_log` VALUES ('2268', 'admin', '删除用户', 'com.erpdemo.controller.SysGoodsController.delete()', '[84]', '0:0:0:0:0:0:0:1', '2019-07-23 11:25:26');
INSERT INTO `sys_log` VALUES ('2269', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"销售订单统计\",\"orderNum\":0,\"parentId\":66,\"parentName\":\"销售管理\",\"type\":1,\"url\":\"sys/salegoods.html\"}', '127.0.0.1', '2019-07-24 09:48:48');
INSERT INTO `sys_log` VALUES ('2270', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"324\",\"newprice\":\"225\",\"_\":\"1563948644609\"}', '0:0:0:0:0:0:0:1', '2019-07-24 14:11:10');
INSERT INTO `sys_log` VALUES ('2271', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"225\",\"newprice\":\"243\",\"_\":\"1563948765398\"}', '0:0:0:0:0:0:0:1', '2019-07-24 14:12:52');
INSERT INTO `sys_log` VALUES ('2272', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"11\",\"name\":\"野生东北黑木耳\",\"sellingprice\":\"145\",\"newprice\":\"23\",\"_\":\"1563950071632\"}', '0:0:0:0:0:0:0:1', '2019-07-24 14:34:39');
INSERT INTO `sys_log` VALUES ('2273', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"243\",\"newprice\":\"1231\",\"_\":\"1563951055906\"}', '0:0:0:0:0:0:0:1', '2019-07-24 14:51:05');
INSERT INTO `sys_log` VALUES ('2274', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"Csj测试页\",\"orderNum\":1,\"parentId\":150,\"parentName\":\"功能测试\",\"perms\":\"user:list,user:creacte\",\"type\":1,\"url\":\"/sys/CustomerReturnListEcharts.html\"}', '0:0:0:0:0:0:0:1', '2019-07-24 14:56:29');
INSERT INTO `sys_log` VALUES ('2275', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":208,\"name\":\"Csj测试页\",\"orderNum\":1,\"parentId\":150,\"parentName\":\"功能测试\",\"perms\":\"\",\"type\":1,\"url\":\"sys/CustomerReturnListEcharts.html\"}', '0:0:0:0:0:0:0:1', '2019-07-24 14:58:31');
INSERT INTO `sys_log` VALUES ('2276', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"12\",\"name\":\"新疆红枣\",\"sellingprice\":\"21\",\"newprice\":\"24\",\"_\":\"1563954013752\"}', '0:0:0:0:0:0:0:1', '2019-07-24 15:40:19');
INSERT INTO `sys_log` VALUES ('2277', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{}', '0:0:0:0:0:0:0:1', '2019-07-24 15:41:29');
INSERT INTO `sys_log` VALUES ('2278', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{}', '0:0:0:0:0:0:0:1', '2019-07-24 15:41:41');
INSERT INTO `sys_log` VALUES ('2279', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"12\",\"name\":\"新疆红枣\",\"sellingprice\":\"21\",\"newprice\":\"25\",\"_\":\"1563954463760\"}', '0:0:0:0:0:0:0:1', '2019-07-24 15:47:56');
INSERT INTO `sys_log` VALUES ('2280', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"11\",\"name\":\"野生东北黑木耳\",\"sellingprice\":\"145\",\"newprice\":\"131\",\"_\":\"1563955722717\"}', '0:0:0:0:0:0:0:1', '2019-07-24 16:08:52');
INSERT INTO `sys_log` VALUES ('2281', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"11\",\"name\":\"野生东北黑木耳\",\"sellingprice\":\"131\",\"newprice\":\"120\",\"_\":\"1563956316964\"}', '0:0:0:0:0:0:0:1', '2019-07-24 16:18:45');
INSERT INTO `sys_log` VALUES ('2282', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"12\",\"name\":\"新疆红枣\",\"sellingprice\":\"25\",\"newprice\":\"13\",\"_\":\"1563956542398\"}', '0:0:0:0:0:0:0:1', '2019-07-24 16:22:28');
INSERT INTO `sys_log` VALUES ('2283', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"1231\",\"newprice\":\"13\",\"_\":\"1563957831119\"}', '0:0:0:0:0:0:0:1', '2019-07-24 16:44:05');
INSERT INTO `sys_log` VALUES ('2284', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"13\",\"newprice\":\"15\",\"_\":\"1563957908236\"}', '0:0:0:0:0:0:0:1', '2019-07-24 16:45:17');
INSERT INTO `sys_log` VALUES ('2285', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"11\",\"name\":\"野生东北黑木耳\",\"sellingprice\":\"120\",\"newprice\":\"128\",\"_\":\"1563958197131\"}', '0:0:0:0:0:0:0:1', '2019-07-24 16:50:05');
INSERT INTO `sys_log` VALUES ('2286', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"15\",\"newprice\":\"16\",\"_\":\"1563959148560\"}', '0:0:0:0:0:0:0:1', '2019-07-24 17:05:55');
INSERT INTO `sys_log` VALUES ('2287', 'admin', '保存菜单', 'com.erpdemo.controller.SysMenuController.save()', '{\"name\":\"退货图表\",\"orderNum\":0,\"parentId\":39,\"parentName\":\"进货管理\",\"type\":1,\"url\":\"/sys/returnlistecharts\"}', '0:0:0:0:0:0:0:1', '2019-07-24 17:09:04');
INSERT INTO `sys_log` VALUES ('2288', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"13\",\"name\":\"麦片燕麦巧克力\",\"sellingprice\":\"38\",\"newprice\":\"24\",\"_\":\"1563959552331\"}', '0:0:0:0:0:0:0:1', '2019-07-24 17:12:39');
INSERT INTO `sys_log` VALUES ('2289', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"24\",\"newprice\":\"26\",\"_\":\"1563959596388\"}', '0:0:0:0:0:0:0:1', '2019-07-24 17:13:24');
INSERT INTO `sys_log` VALUES ('2290', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"11\",\"name\":\"野生东北黑木耳\",\"sellingprice\":\"128\",\"newprice\":\"160\",\"_\":\"1563960377573\"}', '0:0:0:0:0:0:0:1', '2019-07-24 17:26:25');
INSERT INTO `sys_log` VALUES ('2291', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"11\",\"name\":\"野生东北黑木耳\",\"sellingprice\":\"160\",\"newprice\":\"214\",\"_\":\"1563960698026\"}', '0:0:0:0:0:0:0:1', '2019-07-24 17:31:44');
INSERT INTO `sys_log` VALUES ('2292', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"2\",\"name\":\"华为荣耀Note9\",\"sellingprice\":\"16\",\"newprice\":\"17\",\"_\":\"1563960806273\"}', '0:0:0:0:0:0:0:1', '2019-07-24 17:33:32');
INSERT INTO `sys_log` VALUES ('2293', 'admin', '修改', 'com.erpdemo.controller.GoodsPriceUpdateNoteController.saveAndUpdateAll()', '{\"goodsid\":\"1\",\"name\":\"陶华碧老干妈香辣脆油牛肉粒测试测试\",\"sellingprice\":\"26\",\"newprice\":\"13\",\"_\":\"1563961327559\"}', '0:0:0:0:0:0:0:1', '2019-07-24 17:42:13');
INSERT INTO `sys_log` VALUES ('2294', 'admin', '修改菜单', 'com.erpdemo.controller.SysMenuController.update()', '{\"menuId\":209,\"name\":\"退货图表\",\"orderNum\":0,\"parentId\":39,\"parentName\":\"进货管理\",\"type\":1,\"url\":\"/sys/returnlistecharts.html\"}', '0:0:0:0:0:0:0:1', '2019-07-25 08:34:41');
INSERT INTO `sys_log` VALUES ('2295', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"areaid\":690,\"cityid\":682,\"proid\":645}', '0:0:0:0:0:0:0:1', '2019-07-25 09:13:04');
INSERT INTO `sys_log` VALUES ('2296', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"11\",\"areaid\":690,\"cityid\":682,\"contact\":\"123\",\"name\":\"123\",\"num\":\"13812312312\",\"proid\":645,\"remarks\":\"11\"}', '0:0:0:0:0:0:0:1', '2019-07-25 09:13:16');
INSERT INTO `sys_log` VALUES ('2297', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"areaid\":890,\"cityid\":887,\"contact\":\"1\",\"name\":\"333\",\"num\":\"13890909090\",\"proid\":804,\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-25 09:21:32');
INSERT INTO `sys_log` VALUES ('2298', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"11\",\"addtime\":1564017306000,\"areaid\":1091,\"cityid\":1087,\"contact\":\"123\",\"delflag\":0,\"id\":3,\"name\":\"123\",\"num\":\"13812312312\",\"proid\":1015,\"remarks\":\"11\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-25 09:24:28');
INSERT INTO `sys_log` VALUES ('2299', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564017791000,\"areaid\":821,\"cityid\":817,\"contact\":\"1\",\"delflag\":0,\"id\":4,\"name\":\"3334\",\"num\":\"13890909090\",\"proid\":804,\"remarks\":\"1\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-25 09:33:43');
INSERT INTO `sys_log` VALUES ('2300', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"13\",\"addtime\":1564017791000,\"areaid\":819,\"cityid\":887,\"contact\":\"133\",\"delflag\":0,\"id\":4,\"name\":\"3334\",\"num\":\"13890909090\",\"proid\":804,\"remarks\":\"13\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-25 09:34:04');
INSERT INTO `sys_log` VALUES ('2301', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"13\",\"addtime\":1564017791000,\"areaid\":946,\"cityid\":940,\"contact\":\"133\",\"delflag\":0,\"id\":4,\"name\":\"3334\",\"num\":\"13890909090\",\"proid\":914,\"remarks\":\"13\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-25 09:34:23');
INSERT INTO `sys_log` VALUES ('2302', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[4]', '0:0:0:0:0:0:0:1', '2019-07-25 09:34:47');
INSERT INTO `sys_log` VALUES ('2303', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"5\",\"areaid\":916,\"cityid\":915,\"contact\":\"55\",\"name\":\"5555\",\"num\":\"13878787878\",\"proid\":914,\"remarks\":\"5\"}', '0:0:0:0:0:0:0:1', '2019-07-25 11:14:42');
INSERT INTO `sys_log` VALUES ('2304', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"areaid\":1099,\"cityid\":1096,\"contact\":\"1\",\"name\":\"1\",\"num\":\"13889898989\",\"proid\":1015,\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-25 11:29:02');
INSERT INTO `sys_log` VALUES ('2305', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"5\",\"addtime\":1564024580000,\"areaid\":897,\"cityid\":894,\"contact\":\"55\",\"delflag\":0,\"id\":9,\"name\":\"556\",\"num\":\"13878787878\",\"proid\":804,\"remarks\":\"5\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-25 11:32:26');
INSERT INTO `sys_log` VALUES ('2306', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"5\",\"addtime\":1564024580000,\"areaid\":1065,\"cityid\":1063,\"contact\":\"55\",\"delflag\":0,\"id\":9,\"name\":\"53\",\"num\":\"13878787878\",\"proid\":1015,\"remarks\":\"5\",\"userid\":1}', '127.0.0.1', '2019-07-25 11:39:46');
INSERT INTO `sys_log` VALUES ('2307', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[9]', '0:0:0:0:0:0:0:1', '2019-07-26 10:50:18');
INSERT INTO `sys_log` VALUES ('2308', 'admin', '删除用户', 'com.erpdemo.controller.CustomerController.delete()', '[10]', '0:0:0:0:0:0:0:1', '2019-07-26 11:00:18');
INSERT INTO `sys_log` VALUES ('2309', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"areaid\":1024,\"cityid\":1016,\"contact\":\"1\",\"name\":\"11111\",\"num\":\"13789898989\",\"nums\":0,\"proid\":1015,\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-26 14:29:48');
INSERT INTO `sys_log` VALUES ('2310', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"请假呗别的墙壁\",\"areaid\":747,\"cityid\":738,\"contact\":\"去哦我你\",\"name\":\"我i保不齐\",\"num\":\"13989898989\",\"nums\":0,\"proid\":645}', '127.0.0.1', '2019-07-26 15:13:26');
INSERT INTO `sys_log` VALUES ('2311', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"areaid\":1082,\"cityid\":1079,\"contact\":\"1\",\"name\":\"1\",\"num\":\"13890909090\",\"nums\":0,\"proid\":1015,\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-26 15:21:45');
INSERT INTO `sys_log` VALUES ('2312', 'admin', '保存用户', 'com.erpdemo.controller.CustomerController.save()', '{\"addr\":\"1\",\"areaid\":1251,\"cityid\":1248,\"contact\":\"11\",\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":1232,\"remarks\":\"1\"}', '0:0:0:0:0:0:0:1', '2019-07-26 15:27:29');
INSERT INTO `sys_log` VALUES ('2313', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:36:32');
INSERT INTO `sys_log` VALUES ('2314', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:37:02');
INSERT INTO `sys_log` VALUES ('2315', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":884,\"cityid\":877,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":804,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:41:36');
INSERT INTO `sys_log` VALUES ('2316', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":1214,\"cityid\":1137,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":804,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:43:03');
INSERT INTO `sys_log` VALUES ('2317', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":768,\"cityid\":765,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":645,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:46:26');
INSERT INTO `sys_log` VALUES ('2318', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":987,\"cityid\":983,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":914,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:46:51');
INSERT INTO `sys_log` VALUES ('2319', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564125802000,\"areaid\":899,\"cityid\":894,\"contact\":\"1\",\"delflag\":0,\"id\":13,\"name\":\"1\",\"num\":\"13890909090\",\"nums\":0,\"proid\":804,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:47:48');
INSERT INTO `sys_log` VALUES ('2320', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":898,\"cityid\":894,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":804,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:49:04');
INSERT INTO `sys_log` VALUES ('2321', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":1191,\"cityid\":1137,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":804,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:50:05');
INSERT INTO `sys_log` VALUES ('2322', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":987,\"cityid\":983,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":914,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:50:16');
INSERT INTO `sys_log` VALUES ('2323', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"cityid\":983,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":914,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:50:41');
INSERT INTO `sys_log` VALUES ('2324', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":1178,\"cityid\":1137,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":914,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:51:10');
INSERT INTO `sys_log` VALUES ('2325', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":890,\"cityid\":887,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":804,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:52:09');
INSERT INTO `sys_log` VALUES ('2326', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564126147000,\"areaid\":1101,\"cityid\":1096,\"contact\":\"11\",\"delflag\":0,\"id\":14,\"name\":\"1111111111\",\"num\":\"13890909090\",\"nums\":0,\"proid\":1015,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:52:33');
INSERT INTO `sys_log` VALUES ('2327', 'admin', '修改用户', 'com.erpdemo.controller.CustomerController.update()', '{\"addr\":\"1\",\"addtime\":1564125802000,\"areaid\":1197,\"cityid\":1191,\"contact\":\"1\",\"delflag\":0,\"id\":13,\"name\":\"1\",\"num\":\"13890909090\",\"nums\":0,\"proid\":1137,\"remarks\":\"1\",\"userid\":1}', '127.0.0.1', '2019-07-26 16:59:10');
INSERT INTO `sys_log` VALUES ('2328', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-29 09:13:08');
INSERT INTO `sys_log` VALUES ('2329', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-29 09:13:08');
INSERT INTO `sys_log` VALUES ('2330', 'admin', '保存', 'com.erpdemo.controller.SysGoodsController.save()', '{\"code\":\"1\",\"model\":\"1\",\"name\":\"\"}', '0:0:0:0:0:0:0:1', '2019-07-29 09:13:08');
INSERT INTO `sys_log` VALUES ('2331', 'admin', '删除商品', 'com.erpdemo.controller.SysGoodsColorController.delete()', '[52]', '0:0:0:0:0:0:0:1', '2019-07-29 09:13:26');
INSERT INTO `sys_log` VALUES ('2332', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 10:44:54');
INSERT INTO `sys_log` VALUES ('2333', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130,131,79]', '0:0:0:0:0:0:0:1', '2019-07-29 10:45:26');
INSERT INTO `sys_log` VALUES ('2334', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129,130]', '0:0:0:0:0:0:0:1', '2019-07-29 10:54:18');
INSERT INTO `sys_log` VALUES ('2335', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129,130]', '0:0:0:0:0:0:0:1', '2019-07-29 10:54:20');
INSERT INTO `sys_log` VALUES ('2336', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130,131]', '0:0:0:0:0:0:0:1', '2019-07-29 10:55:12');
INSERT INTO `sys_log` VALUES ('2337', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130,131]', '0:0:0:0:0:0:0:1', '2019-07-29 10:55:14');
INSERT INTO `sys_log` VALUES ('2338', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 11:00:25');
INSERT INTO `sys_log` VALUES ('2339', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 14:29:40');
INSERT INTO `sys_log` VALUES ('2340', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129,130]', '0:0:0:0:0:0:0:1', '2019-07-29 15:02:56');
INSERT INTO `sys_log` VALUES ('2341', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 15:07:48');
INSERT INTO `sys_log` VALUES ('2342', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 15:09:03');
INSERT INTO `sys_log` VALUES ('2343', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 15:12:45');
INSERT INTO `sys_log` VALUES ('2344', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 15:12:45');
INSERT INTO `sys_log` VALUES ('2345', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 15:15:52');
INSERT INTO `sys_log` VALUES ('2346', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 16:14:46');
INSERT INTO `sys_log` VALUES ('2347', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 16:28:07');
INSERT INTO `sys_log` VALUES ('2348', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 17:04:10');
INSERT INTO `sys_log` VALUES ('2349', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-29 17:52:52');
INSERT INTO `sys_log` VALUES ('2350', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:29:54');
INSERT INTO `sys_log` VALUES ('2351', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:32:56');
INSERT INTO `sys_log` VALUES ('2352', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:43:35');
INSERT INTO `sys_log` VALUES ('2353', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:49:38');
INSERT INTO `sys_log` VALUES ('2354', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:49:39');
INSERT INTO `sys_log` VALUES ('2355', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:49:41');
INSERT INTO `sys_log` VALUES ('2356', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:49:41');
INSERT INTO `sys_log` VALUES ('2357', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:51:15');
INSERT INTO `sys_log` VALUES ('2358', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 08:51:16');
INSERT INTO `sys_log` VALUES ('2359', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 09:19:33');
INSERT INTO `sys_log` VALUES ('2360', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 09:34:50');
INSERT INTO `sys_log` VALUES ('2361', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 10:03:47');
INSERT INTO `sys_log` VALUES ('2362', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 10:04:24');
INSERT INTO `sys_log` VALUES ('2363', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 10:13:56');
INSERT INTO `sys_log` VALUES ('2364', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 10:14:42');
INSERT INTO `sys_log` VALUES ('2365', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130]', '0:0:0:0:0:0:0:1', '2019-07-30 10:35:00');
INSERT INTO `sys_log` VALUES ('2366', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130]', '0:0:0:0:0:0:0:1', '2019-07-30 10:38:40');
INSERT INTO `sys_log` VALUES ('2367', 'admin', '修改用户', 'com.erpdemo.controller.SysGoodsController.update()', '{\"addtime\":1564022449000,\"code\":\"6255\",\"delflag\":0,\"id\":89,\"inventoryquantity\":250,\"lastpurchasingprice\":10.0,\"minnum\":88998,\"model\":\"黑色\",\"name\":\"电竞椅\",\"producer\":\"广东商场\",\"purchasingprice\":100.0,\"remarks\":\"热销\",\"sellingprice\":200.0,\"state\":2,\"typeid\":24,\"unit\":\"个\",\"userid\":1}', '0:0:0:0:0:0:0:1', '2019-07-30 10:46:20');
INSERT INTO `sys_log` VALUES ('2368', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 11:41:45');
INSERT INTO `sys_log` VALUES ('2369', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '{}', '0:0:0:0:0:0:0:1', '2019-07-30 14:47:50');
INSERT INTO `sys_log` VALUES ('2370', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '{}', '0:0:0:0:0:0:0:1', '2019-07-30 14:48:58');
INSERT INTO `sys_log` VALUES ('2371', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '{}', '0:0:0:0:0:0:0:1', '2019-07-30 14:59:03');
INSERT INTO `sys_log` VALUES ('2372', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '{}', '0:0:0:0:0:0:0:1', '2019-07-30 14:59:18');
INSERT INTO `sys_log` VALUES ('2373', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '{}', '0:0:0:0:0:0:0:1', '2019-07-30 14:59:21');
INSERT INTO `sys_log` VALUES ('2374', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '{}', '0:0:0:0:0:0:0:1', '2019-07-30 15:01:28');
INSERT INTO `sys_log` VALUES ('2375', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '{\"id\":\"129\",\"_\":\"1564470733872\"}', '0:0:0:0:0:0:0:1', '2019-07-30 15:12:15');
INSERT INTO `sys_log` VALUES ('2376', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '{\"id\":\"129\",\"_\":\"1564470775394\"}', '0:0:0:0:0:0:0:1', '2019-07-30 15:12:57');
INSERT INTO `sys_log` VALUES ('2377', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 15:26:25');
INSERT INTO `sys_log` VALUES ('2378', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 15:45:01');
INSERT INTO `sys_log` VALUES ('2379', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 15:55:14');
INSERT INTO `sys_log` VALUES ('2380', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 15:58:45');
INSERT INTO `sys_log` VALUES ('2381', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:01:16');
INSERT INTO `sys_log` VALUES ('2382', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:02:52');
INSERT INTO `sys_log` VALUES ('2383', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '130', '0:0:0:0:0:0:0:1', '2019-07-30 16:04:13');
INSERT INTO `sys_log` VALUES ('2384', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:07:49');
INSERT INTO `sys_log` VALUES ('2385', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:10:44');
INSERT INTO `sys_log` VALUES ('2386', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '131', '0:0:0:0:0:0:0:1', '2019-07-30 16:12:46');
INSERT INTO `sys_log` VALUES ('2387', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '79', '0:0:0:0:0:0:0:1', '2019-07-30 16:16:05');
INSERT INTO `sys_log` VALUES ('2388', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[131]', '0:0:0:0:0:0:0:1', '2019-07-30 16:33:49');
INSERT INTO `sys_log` VALUES ('2389', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[79]', '0:0:0:0:0:0:0:1', '2019-07-30 16:36:19');
INSERT INTO `sys_log` VALUES ('2390', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[77]', '0:0:0:0:0:0:0:1', '2019-07-30 16:37:50');
INSERT INTO `sys_log` VALUES ('2391', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 16:39:29');
INSERT INTO `sys_log` VALUES ('2392', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:40:53');
INSERT INTO `sys_log` VALUES ('2393', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 16:42:45');
INSERT INTO `sys_log` VALUES ('2394', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:42:55');
INSERT INTO `sys_log` VALUES ('2395', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 16:44:48');
INSERT INTO `sys_log` VALUES ('2396', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:45:22');
INSERT INTO `sys_log` VALUES ('2397', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:48:42');
INSERT INTO `sys_log` VALUES ('2398', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '127.0.0.1', '2019-07-30 16:49:35');
INSERT INTO `sys_log` VALUES ('2399', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:49:58');
INSERT INTO `sys_log` VALUES ('2400', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:52:13');
INSERT INTO `sys_log` VALUES ('2401', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:56:19');
INSERT INTO `sys_log` VALUES ('2402', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 16:58:21');
INSERT INTO `sys_log` VALUES ('2403', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 17:00:58');
INSERT INTO `sys_log` VALUES ('2404', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 17:02:21');
INSERT INTO `sys_log` VALUES ('2405', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 17:02:37');
INSERT INTO `sys_log` VALUES ('2406', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130]', '0:0:0:0:0:0:0:1', '2019-07-30 17:04:17');
INSERT INTO `sys_log` VALUES ('2407', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '130', '0:0:0:0:0:0:0:1', '2019-07-30 17:04:30');
INSERT INTO `sys_log` VALUES ('2408', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 17:06:54');
INSERT INTO `sys_log` VALUES ('2409', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 17:07:37');
INSERT INTO `sys_log` VALUES ('2410', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 17:08:44');
INSERT INTO `sys_log` VALUES ('2411', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 17:09:41');
INSERT INTO `sys_log` VALUES ('2412', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 17:09:56');
INSERT INTO `sys_log` VALUES ('2413', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 17:10:05');
INSERT INTO `sys_log` VALUES ('2414', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 17:12:21');
INSERT INTO `sys_log` VALUES ('2415', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '130', '0:0:0:0:0:0:0:1', '2019-07-30 17:12:48');
INSERT INTO `sys_log` VALUES ('2416', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 17:12:53');
INSERT INTO `sys_log` VALUES ('2417', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 17:20:05');
INSERT INTO `sys_log` VALUES ('2418', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 17:32:26');
INSERT INTO `sys_log` VALUES ('2419', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 17:33:43');
INSERT INTO `sys_log` VALUES ('2420', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[129]', '0:0:0:0:0:0:0:1', '2019-07-30 17:35:22');
INSERT INTO `sys_log` VALUES ('2421', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130]', '0:0:0:0:0:0:0:1', '2019-07-30 17:43:40');
INSERT INTO `sys_log` VALUES ('2422', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '130', '0:0:0:0:0:0:0:1', '2019-07-30 17:43:52');
INSERT INTO `sys_log` VALUES ('2423', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130]', '0:0:0:0:0:0:0:1', '2019-07-30 17:59:25');
INSERT INTO `sys_log` VALUES ('2424', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-30 18:00:32');
INSERT INTO `sys_log` VALUES ('2425', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 11:25:00');
INSERT INTO `sys_log` VALUES ('2426', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 11:28:53');
INSERT INTO `sys_log` VALUES ('2427', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 11:29:43');
INSERT INTO `sys_log` VALUES ('2428', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 11:30:04');
INSERT INTO `sys_log` VALUES ('2429', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 11:33:03');
INSERT INTO `sys_log` VALUES ('2430', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 11:38:41');
INSERT INTO `sys_log` VALUES ('2431', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 11:47:18');
INSERT INTO `sys_log` VALUES ('2432', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 13:47:04');
INSERT INTO `sys_log` VALUES ('2433', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '142', '0:0:0:0:0:0:0:1', '2019-07-31 13:48:19');
INSERT INTO `sys_log` VALUES ('2434', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 13:48:24');
INSERT INTO `sys_log` VALUES ('2435', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 13:53:40');
INSERT INTO `sys_log` VALUES ('2436', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 13:54:31');
INSERT INTO `sys_log` VALUES ('2437', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 13:57:36');
INSERT INTO `sys_log` VALUES ('2438', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 13:59:41');
INSERT INTO `sys_log` VALUES ('2439', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 14:05:19');
INSERT INTO `sys_log` VALUES ('2440', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 14:11:24');
INSERT INTO `sys_log` VALUES ('2441', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 14:17:39');
INSERT INTO `sys_log` VALUES ('2442', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 14:20:20');
INSERT INTO `sys_log` VALUES ('2443', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 14:21:32');
INSERT INTO `sys_log` VALUES ('2444', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '127.0.0.1', '2019-07-31 14:24:15');
INSERT INTO `sys_log` VALUES ('2445', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '127.0.0.1', '2019-07-31 14:25:19');
INSERT INTO `sys_log` VALUES ('2446', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 14:29:20');
INSERT INTO `sys_log` VALUES ('2447', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '129', '0:0:0:0:0:0:0:1', '2019-07-31 14:34:04');
INSERT INTO `sys_log` VALUES ('2448', 'admin', '添加图片', 'com.erpdemo.controller.SysSupplierController.addprint()', '[130]', '0:0:0:0:0:0:0:1', '2019-08-01 08:25:02');
INSERT INTO `sys_log` VALUES ('2449', 'admin', '图片详情', 'com.erpdemo.controller.SysSupplierController.details()', '130', '0:0:0:0:0:0:0:1', '2019-08-01 08:25:18');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户管理', 'sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务管理', 'sys/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('28', '1', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '8');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('31', '0', '基础资料', null, null, '0', null, '2');
INSERT INTO `sys_menu` VALUES ('39', '0', '进货管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '33', '销售库存', '	sys/user.html', 'user:list,user:save,user:update,user:delete,user:info', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('45', '42', '增加', null, 'sys:user:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '42', '修改', null, 'sys:user:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '42', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('49', '42', '查询', null, 'sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '31', '供应商管理', 'sys/supplier.html', 'sys:supplier:list', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('53', '0', '库存管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '商品报损单查询', 'sys/damagelist.html', 'sys:damagelist:list', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('56', '53', '商品报损', 'sys/damagelistgoods.html', 'sys:damagelistgoods:list', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('57', '39', '商品类别', 'sys/goodstype.html', 'sys:goodstype:list', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('58', '53', '日志', 'sys/log.html', 'sys:log:list', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('59', '53', '菜单', 'sys/menu.html', 'sys:menu:list', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('60', '39', '退货单查询', 'sys/returnlist.html', 'sys:returnlist:list', '1', null, '3');
INSERT INTO `sys_menu` VALUES ('62', '53', '商品报溢添加', 'sys/overflowlist.html', 'sys:overflowlist:list', '1', null, '4');
INSERT INTO `sys_menu` VALUES ('64', '53', '商品报溢', 'sys/overflowlistgoods.html', 'sys:overflowlistgoods:list', '1', null, '6');
INSERT INTO `sys_menu` VALUES ('65', '39', '商品单位', 'sys/goodsunit.html', 'sys:goodsunit:list', '1', null, '3');
INSERT INTO `sys_menu` VALUES ('66', '0', '销售管理', null, null, '0', null, '1');
INSERT INTO `sys_menu` VALUES ('67', '39', '进货单', 'sys/purchaseList.html', 'sys:purchaseList:list', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('68', '39', '进货单商品', 'sys/purchaseListGoods.html', 'sys:purchaseListGoods:list', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('69', '39', '库存查询', 'sys/goods.html', 'sys:goods:list', '1', null, '5');
INSERT INTO `sys_menu` VALUES ('70', '66', '销售单', 'sys/salelist.html', 'sys:SaleList:list', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('74', '31', '客户管理', 'sys/customer.html', 'sys:customer:list', '1', null, '3');
INSERT INTO `sys_menu` VALUES ('75', '31', '角色管理', 'sys/userrole.html', 'sys:userrole:list', '1', null, '5');
INSERT INTO `sys_menu` VALUES ('76', '70', '新增加', null, 'sys:salelist:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('77', '70', '修改', null, 'sys:salelist:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('78', '70', '删除', null, 'sys:salelist:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('79', '67', '增加', null, 'sys:purchaselist:add', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '74', '修改', null, 'sys:customer:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '74', '新增', null, 'sys:customer:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('82', '69', '新增', null, 'sys:goods:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '69', '修改', null, 'sys:goods:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '69', '删除', null, 'sys:goods:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('86', '74', '删除', null, 'sys:customer:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('87', '67', '增加', null, 'sys:purchase:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('88', '67', '修改', null, 'sys:purchase:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '67', '删除', null, 'sys:purchase:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '62', '添加', null, 'sys:overflowlist:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('91', '62', '修改', null, 'sys:overflowlist:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('92', '62', '删除', null, 'sys:overflowlist:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('93', '54', '新增', 'sys', 'sys:damagelist:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('94', '54', '修改', 'sys', 'sys:damagelist:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('95', '54', '删除', 'sys', 'sys:damagelist:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('96', '56', '新增', null, 'sys:damagelistgoods:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('97', '56', '修改', null, 'sys:damagelistgoods:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('98', '56', '删除', null, 'sys:damagelistgoods:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('99', '75', '添加', null, 'sys:userrole:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('100', '75', '修改', null, 'sys:userrole:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('101', '75', '删除', null, 'sys:userrole:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('102', '70', '详情', null, 'sys:salelist:detail', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('103', '69', '查看详情', null, 'sys:goods:detail', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('107', '53', '库存报警', 'sys/goodsalert.html', 'sys:goods:alertlist', '1', null, '7');
INSERT INTO `sys_menu` VALUES ('108', '51', '添加', null, 'sys:supplier:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('109', '51', '修改', null, 'sys:supplier:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('110', '51', '删除', null, 'sys:supplier:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('111', '66', '销售商品', 'sys/salelistgoods.html', 'sys:salelistgoods:list', '1', null, '3');
INSERT INTO `sys_menu` VALUES ('112', '111', '新增', null, 'sys:salelistgoods:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('113', '111', '修改', null, 'sys:salelistgoods:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('114', '111', '删除', null, 'sys:salelistgoods:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('115', '64', '添加', null, 'sys:overflowlistgoods:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('116', '64', '修改', null, 'sys:overflowlistgoods:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('117', '64', '删除', null, 'sys:overflowlistgoods:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('118', '66', '商品退货单', 'sys/customerreturnlistgoods.html', 'sys:customergoods:list', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('119', '66', '商品退货单', 'sys/customergoods.html', 'sys:customergoods:list', '1', null, '5');
INSERT INTO `sys_menu` VALUES ('120', '119', '添加', null, 'sys:customergoods:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('121', '119', '修改', null, 'sys:customergoods:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('122', '119', '删除', null, 'sys:customergoods:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('123', '39', '退货商品', 'sys/returnlistgoods.html', 'sys:returnlistgoods:list', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('124', '51', '查看详情', null, 'sys:supplier.detail', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('125', '51', '查询详情', null, 'sys:supplier:detail', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('126', '74', '查询详情', null, 'sys:customer:detail', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('127', '62', '查询详情', null, 'sys:overflowlist:all', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('128', '31', '商品管理', 'sys/goods.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('129', '66', '客户退货', 'sys/CustomerReturnList.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('130', '66', '客户退货查询', 'sys/CustomerReturnListGoods.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('132', '31', '期初库存', 'sys/inventory.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('136', '31', '商品调价', 'sys/goodspriceupdate.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('140', '31', '商品盘点管理', 'sys/GoodsCheck.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('143', '31', '供货商单据明细', 'sys/docdetail.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('144', '53', '商品报溢报损查询', 'sys/OverflowList.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('145', '31', '商品盘点查询', 'sys/GoodsCheckList.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('147', '66', '退货商品图分析', 'sys/CustomerReturnListGoodsecharts.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('148', '53', '报损统计', 'sys/damageecharts.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('149', '53', '商品报溢查询y', 'sys/overflowlistgoodsly.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('179', '39', '退货单', 'sys/returnlist.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('205', '31', '商品规格', 'sys\\goodsmodel.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('206', '31', '商品颜色', 'sys/goodscolor.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('207', '66', '销售订单统计', 'sys/salegoods.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('209', '39', '退货图表', '/sys/returnlistecharts.html', null, '1', null, '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '普通用户', '只能查看用户信息', '1', '2019-04-30 14:12:37');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '所有系统管理功能', '1', '2019-05-16 09:35:29');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '2', '2');
INSERT INTO `sys_role_menu` VALUES ('6', '2', '15');
INSERT INTO `sys_role_menu` VALUES ('7', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('8', '2', '17');
INSERT INTO `sys_role_menu` VALUES ('9', '2', '18');
INSERT INTO `sys_role_menu` VALUES ('10', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('11', '2', '19');
INSERT INTO `sys_role_menu` VALUES ('12', '2', '20');
INSERT INTO `sys_role_menu` VALUES ('13', '2', '21');
INSERT INTO `sys_role_menu` VALUES ('14', '2', '22');
INSERT INTO `sys_role_menu` VALUES ('15', '2', '4');
INSERT INTO `sys_role_menu` VALUES ('16', '2', '23');
INSERT INTO `sys_role_menu` VALUES ('17', '2', '24');
INSERT INTO `sys_role_menu` VALUES ('18', '2', '25');
INSERT INTO `sys_role_menu` VALUES ('19', '2', '26');
INSERT INTO `sys_role_menu` VALUES ('20', '2', '5');
INSERT INTO `sys_role_menu` VALUES ('21', '2', '6');
INSERT INTO `sys_role_menu` VALUES ('22', '2', '7');
INSERT INTO `sys_role_menu` VALUES ('23', '2', '8');
INSERT INTO `sys_role_menu` VALUES ('24', '2', '9');
INSERT INTO `sys_role_menu` VALUES ('25', '2', '10');
INSERT INTO `sys_role_menu` VALUES ('26', '2', '11');
INSERT INTO `sys_role_menu` VALUES ('27', '2', '12');
INSERT INTO `sys_role_menu` VALUES ('28', '2', '13');
INSERT INTO `sys_role_menu` VALUES ('29', '2', '14');
INSERT INTO `sys_role_menu` VALUES ('30', '2', '27');
INSERT INTO `sys_role_menu` VALUES ('31', '2', '29');
INSERT INTO `sys_role_menu` VALUES ('32', '2', '28');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '100@qq.com', '13666666666', '1', '1', '2017-06-01 15:33:20');
INSERT INTO `sys_user` VALUES ('2', 'superadmin', 'e10adc3949ba59abbe56e057f20f883e', '3.com', '123456', null, null, '2019-07-17 09:14:27');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '15', '1');

-- ----------------------------
-- Table structure for `tb_token`
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------

-- ----------------------------
-- Table structure for `t_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_area
-- ----------------------------
INSERT INTO `t_area` VALUES ('1', '北京市', '110000', '0', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('2', '东城区', '110101', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('3', '西城区', '110102', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('4', '朝阳区', '110105', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('5', '丰台区', '110106', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('6', '石景山区', '110107', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('7', '海淀区', '110108', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('8', '门头沟区', '110109', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('9', '房山区', '110111', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('10', '通州区', '110112', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('11', '顺义区', '110113', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('12', '昌平区', '110114', '1', '2019-07-24 11:04:57');
INSERT INTO `t_area` VALUES ('13', '大兴区', '110115', '1', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('14', '怀柔区', '110116', '1', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('15', '平谷区', '110117', '1', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('16', '密云区', '110118', '1', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('17', '延庆区', '110119', '1', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('18', '天津市', '120000', '0', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('19', '和平区', '120101', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('20', '河东区', '120102', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('21', '河西区', '120103', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('22', '南开区', '120104', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('23', '河北区', '120105', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('24', '红桥区', '120106', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('25', '东丽区', '120110', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('26', '西青区', '120111', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('27', '津南区', '120112', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('28', '北辰区', '120113', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('29', '武清区', '120114', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('30', '宝坻区', '120115', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('31', '滨海新区', '120116', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('32', '宁河区', '120117', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('33', '静海区', '120118', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('34', '蓟州区', '120119', '18', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('35', '河北省', '130000', '0', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('36', '石家庄市', '130100', '35', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('37', '长安区', '130102', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('38', '桥西区', '130104', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('39', '新华区', '130105', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('40', '井陉矿区', '130107', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('41', '裕华区', '130108', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('42', '藁城区', '130109', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('43', '鹿泉区', '130110', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('44', '栾城区', '130111', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('45', '井陉县', '130121', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('46', '正定县', '130123', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('47', '行唐县', '130125', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('48', '灵寿县', '130126', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('49', '高邑县', '130127', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('50', '深泽县', '130128', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('51', '赞皇县', '130129', '36', '2019-07-24 11:04:58');
INSERT INTO `t_area` VALUES ('52', '无极县', '130130', '36', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('53', '平山县', '130131', '36', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('54', '元氏县', '130132', '36', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('55', '赵县', '130133', '36', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('56', '辛集市', '130181', '36', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('57', '晋州市', '130183', '36', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('58', '新乐市', '130184', '36', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('59', '唐山市', '130200', '36', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('60', '路南区', '130202', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('61', '路北区', '130203', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('62', '古冶区', '130204', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('63', '开平区', '130205', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('64', '丰南区', '130207', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('65', '丰润区', '130208', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('66', '曹妃甸区', '130209', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('67', '滦南县', '130224', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('68', '乐亭县', '130225', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('69', '迁西县', '130227', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('70', '玉田县', '130229', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('71', '遵化市', '130281', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('72', '迁安市', '130283', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('73', '滦州市', '130284', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('74', '秦皇岛市', '130300', '59', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('75', '海港区', '130302', '74', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('76', '山海关区', '130303', '74', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('77', '北戴河区', '130304', '74', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('78', '抚宁区', '130306', '74', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('79', '青龙满族自治县', '130321', '74', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('80', '昌黎县', '130322', '74', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('81', '卢龙县', '130324', '74', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('82', '邯郸市', '130400', '74', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('83', '邯山区', '130402', '82', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('84', '丛台区', '130403', '82', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('85', '复兴区', '130404', '82', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('86', '峰峰矿区', '130406', '82', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('87', '肥乡区', '130407', '82', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('88', '永年区', '130408', '82', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('89', '临漳县', '130423', '82', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('90', '成安县', '130424', '82', '2019-07-24 11:04:59');
INSERT INTO `t_area` VALUES ('91', '大名县', '130425', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('92', '涉县', '130426', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('93', '磁县', '130427', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('94', '邱县', '130430', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('95', '鸡泽县', '130431', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('96', '广平县', '130432', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('97', '馆陶县', '130433', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('98', '魏县', '130434', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('99', '曲周县', '130435', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('100', '武安市', '130481', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('101', '邢台市', '130500', '82', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('102', '桥东区', '130502', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('103', '桥西区', '130503', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('104', '邢台县', '130521', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('105', '临城县', '130522', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('106', '内丘县', '130523', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('107', '柏乡县', '130524', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('108', '隆尧县', '130525', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('109', '任县', '130526', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('110', '南和县', '130527', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('111', '宁晋县', '130528', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('112', '巨鹿县', '130529', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('113', '新河县', '130530', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('114', '广宗县', '130531', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('115', '平乡县', '130532', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('116', '威县', '130533', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('117', '清河县', '130534', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('118', '临西县', '130535', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('119', '南宫市', '130581', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('120', '沙河市', '130582', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('121', '保定市', '130600', '101', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('122', '竞秀区', '130602', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('123', '莲池区', '130606', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('124', '满城区', '130607', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('125', '清苑区', '130608', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('126', '徐水区', '130609', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('127', '涞水县', '130623', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('128', '阜平县', '130624', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('129', '定兴县', '130626', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('130', '唐县', '130627', '121', '2019-07-24 11:05:00');
INSERT INTO `t_area` VALUES ('131', '高阳县', '130628', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('132', '容城县', '130629', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('133', '涞源县', '130630', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('134', '望都县', '130631', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('135', '安新县', '130632', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('136', '易县', '130633', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('137', '曲阳县', '130634', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('138', '蠡县', '130635', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('139', '顺平县', '130636', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('140', '博野县', '130637', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('141', '雄县', '130638', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('142', '涿州市', '130681', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('143', '定州市', '130682', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('144', '安国市', '130683', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('145', '高碑店市', '130684', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('146', '张家口市', '130700', '121', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('147', '桥东区', '130702', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('148', '桥西区', '130703', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('149', '宣化区', '130705', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('150', '下花园区', '130706', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('151', '万全区', '130708', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('152', '崇礼区', '130709', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('153', '张北县', '130722', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('154', '康保县', '130723', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('155', '沽源县', '130724', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('156', '尚义县', '130725', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('157', '蔚县', '130726', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('158', '阳原县', '130727', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('159', '怀安县', '130728', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('160', '怀来县', '130730', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('161', '涿鹿县', '130731', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('162', '赤城县', '130732', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('163', '承德市', '130800', '146', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('164', '双桥区', '130802', '163', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('165', '双滦区', '130803', '163', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('166', '鹰手营子矿区', '130804', '163', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('167', '承德县', '130821', '163', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('168', '兴隆县', '130822', '163', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('169', '滦平县', '130824', '163', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('170', '隆化县', '130825', '163', '2019-07-24 11:05:01');
INSERT INTO `t_area` VALUES ('171', '丰宁满族自治县', '130826', '163', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('172', '宽城满族自治县', '130827', '163', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('173', '围场满族蒙古族自治县', '130828', '163', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('174', '平泉市', '130881', '163', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('175', '沧州市', '130900', '163', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('176', '新华区', '130902', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('177', '运河区', '130903', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('178', '沧县', '130921', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('179', '青县', '130922', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('180', '东光县', '130923', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('181', '海兴县', '130924', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('182', '盐山县', '130925', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('183', '肃宁县', '130926', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('184', '南皮县', '130927', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('185', '吴桥县', '130928', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('186', '献县', '130929', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('187', '孟村回族自治县', '130930', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('188', '泊头市', '130981', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('189', '任丘市', '130982', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('190', '黄骅市', '130983', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('191', '河间市', '130984', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('192', '廊坊市', '131000', '175', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('193', '安次区', '131002', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('194', '广阳区', '131003', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('195', '固安县', '131022', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('196', '永清县', '131023', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('197', '香河县', '131024', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('198', '大城县', '131025', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('199', '文安县', '131026', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('200', '大厂回族自治县', '131028', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('201', '霸州市', '131081', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('202', '三河市', '131082', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('203', '衡水市', '131100', '192', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('204', '桃城区', '131102', '203', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('205', '冀州区', '131103', '203', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('206', '枣强县', '131121', '203', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('207', '武邑县', '131122', '203', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('208', '武强县', '131123', '203', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('209', '饶阳县', '131124', '203', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('210', '安平县', '131125', '203', '2019-07-24 11:05:02');
INSERT INTO `t_area` VALUES ('211', '故城县', '131126', '203', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('212', '景县', '131127', '203', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('213', '阜城县', '131128', '203', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('214', '深州市', '131182', '203', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('215', '山西省', '140000', '0', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('216', '太原市', '140100', '215', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('217', '小店区', '140105', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('218', '迎泽区', '140106', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('219', '杏花岭区', '140107', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('220', '尖草坪区', '140108', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('221', '万柏林区', '140109', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('222', '晋源区', '140110', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('223', '清徐县', '140121', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('224', '阳曲县', '140122', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('225', '娄烦县', '140123', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('226', '古交市', '140181', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('227', '大同市', '140200', '216', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('228', '新荣区', '140212', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('229', '平城区', '140213', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('230', '云冈区', '140214', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('231', '云州区', '140215', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('232', '阳高县', '140221', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('233', '天镇县', '140222', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('234', '广灵县', '140223', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('235', '灵丘县', '140224', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('236', '浑源县', '140225', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('237', '左云县', '140226', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('238', '阳泉市', '140300', '227', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('239', '城区', '140302', '238', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('240', '矿区', '140303', '238', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('241', '郊区', '140311', '238', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('242', '平定县', '140321', '238', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('243', '盂县', '140322', '238', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('244', '长治市', '140400', '238', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('245', '潞州区', '140403', '244', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('246', '上党区', '140404', '244', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('247', '屯留区', '140405', '244', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('248', '潞城区', '140406', '244', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('249', '襄垣县', '140423', '244', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('250', '平顺县', '140425', '244', '2019-07-24 11:05:03');
INSERT INTO `t_area` VALUES ('251', '黎城县', '140426', '244', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('252', '壶关县', '140427', '244', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('253', '长子县', '140428', '244', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('254', '武乡县', '140429', '244', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('255', '沁县', '140430', '244', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('256', '沁源县', '140431', '244', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('257', '晋城市', '140500', '244', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('258', '城区', '140502', '257', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('259', '沁水县', '140521', '257', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('260', '阳城县', '140522', '257', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('261', '陵川县', '140524', '257', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('262', '泽州县', '140525', '257', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('263', '高平市', '140581', '257', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('264', '朔州市', '140600', '257', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('265', '朔城区', '140602', '264', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('266', '平鲁区', '140603', '264', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('267', '山阴县', '140621', '264', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('268', '应县', '140622', '264', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('269', '右玉县', '140623', '264', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('270', '怀仁市', '140681', '264', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('271', '晋中市', '140700', '264', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('272', '榆次区', '140702', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('273', '榆社县', '140721', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('274', '左权县', '140722', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('275', '和顺县', '140723', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('276', '昔阳县', '140724', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('277', '寿阳县', '140725', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('278', '太谷县', '140726', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('279', '祁县', '140727', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('280', '平遥县', '140728', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('281', '灵石县', '140729', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('282', '介休市', '140781', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('283', '运城市', '140800', '271', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('284', '盐湖区', '140802', '283', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('285', '临猗县', '140821', '283', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('286', '万荣县', '140822', '283', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('287', '闻喜县', '140823', '283', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('288', '稷山县', '140824', '283', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('289', '新绛县', '140825', '283', '2019-07-24 11:05:04');
INSERT INTO `t_area` VALUES ('290', '绛县', '140826', '283', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('291', '垣曲县', '140827', '283', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('292', '夏县', '140828', '283', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('293', '平陆县', '140829', '283', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('294', '芮城县', '140830', '283', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('295', '永济市', '140881', '283', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('296', '河津市', '140882', '283', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('297', '忻州市', '140900', '283', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('298', '忻府区', '140902', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('299', '定襄县', '140921', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('300', '五台县', '140922', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('301', '代县', '140923', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('302', '繁峙县', '140924', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('303', '宁武县', '140925', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('304', '静乐县', '140926', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('305', '神池县', '140927', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('306', '五寨县', '140928', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('307', '岢岚县', '140929', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('308', '河曲县', '140930', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('309', '保德县', '140931', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('310', '偏关县', '140932', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('311', '原平市', '140981', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('312', '临汾市', '141000', '297', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('313', '尧都区', '141002', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('314', '曲沃县', '141021', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('315', '翼城县', '141022', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('316', '襄汾县', '141023', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('317', '洪洞县', '141024', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('318', '古县', '141025', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('319', '安泽县', '141026', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('320', '浮山县', '141027', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('321', '吉县', '141028', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('322', '乡宁县', '141029', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('323', '大宁县', '141030', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('324', '隰县', '141031', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('325', '永和县', '141032', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('326', '蒲县', '141033', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('327', '汾西县', '141034', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('328', '侯马市', '141081', '312', '2019-07-24 11:05:05');
INSERT INTO `t_area` VALUES ('329', '霍州市', '141082', '312', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('330', '吕梁市', '141100', '312', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('331', '离石区', '141102', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('332', '文水县', '141121', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('333', '交城县', '141122', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('334', '兴县', '141123', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('335', '临县', '141124', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('336', '柳林县', '141125', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('337', '石楼县', '141126', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('338', '岚县', '141127', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('339', '方山县', '141128', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('340', '中阳县', '141129', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('341', '交口县', '141130', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('342', '孝义市', '141181', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('343', '汾阳市', '141182', '330', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('344', '内蒙古自治区', '150000', '0', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('345', '呼和浩特市', '150100', '344', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('346', '新城区', '150102', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('347', '回民区', '150103', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('348', '玉泉区', '150104', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('349', '赛罕区', '150105', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('350', '土默特左旗', '150121', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('351', '托克托县', '150122', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('352', '和林格尔县', '150123', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('353', '清水河县', '150124', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('354', '武川县', '150125', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('355', '包头市', '150200', '345', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('356', '东河区', '150202', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('357', '昆都仑区', '150203', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('358', '青山区', '150204', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('359', '石拐区', '150205', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('360', '白云鄂博矿区', '150206', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('361', '九原区', '150207', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('362', '土默特右旗', '150221', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('363', '固阳县', '150222', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('364', '达尔罕茂明安联合旗', '150223', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('365', '乌海市', '150300', '355', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('366', '海勃湾区', '150302', '365', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('367', '海南区', '150303', '365', '2019-07-24 11:05:06');
INSERT INTO `t_area` VALUES ('368', '乌达区', '150304', '365', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('369', '赤峰市', '150400', '365', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('370', '红山区', '150402', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('371', '元宝山区', '150403', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('372', '松山区', '150404', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('373', '阿鲁科尔沁旗', '150421', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('374', '巴林左旗', '150422', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('375', '巴林右旗', '150423', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('376', '林西县', '150424', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('377', '克什克腾旗', '150425', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('378', '翁牛特旗', '150426', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('379', '喀喇沁旗', '150428', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('380', '宁城县', '150429', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('381', '敖汉旗', '150430', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('382', '通辽市', '150500', '369', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('383', '科尔沁区', '150502', '382', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('384', '科尔沁左翼中旗', '150521', '382', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('385', '科尔沁左翼后旗', '150522', '382', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('386', '开鲁县', '150523', '382', '2019-07-24 11:05:07');
INSERT INTO `t_area` VALUES ('387', '库伦旗', '150524', '382', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('388', '奈曼旗', '150525', '382', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('389', '扎鲁特旗', '150526', '382', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('390', '霍林郭勒市', '150581', '382', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('391', '鄂尔多斯市', '150600', '382', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('392', '东胜区', '150602', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('393', '康巴什区', '150603', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('394', '达拉特旗', '150621', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('395', '准格尔旗', '150622', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('396', '鄂托克前旗', '150623', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('397', '鄂托克旗', '150624', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('398', '杭锦旗', '150625', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('399', '乌审旗', '150626', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('400', '伊金霍洛旗', '150627', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('401', '呼伦贝尔市', '150700', '391', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('402', '海拉尔区', '150702', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('403', '扎赉诺尔区', '150703', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('404', '阿荣旗', '150721', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('405', '莫力达瓦达斡尔族自治旗', '150722', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('406', '鄂伦春自治旗', '150723', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('407', '鄂温克族自治旗', '150724', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('408', '陈巴尔虎旗', '150725', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('409', '新巴尔虎左旗', '150726', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('410', '新巴尔虎右旗', '150727', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('411', '满洲里市', '150781', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('412', '牙克石市', '150782', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('413', '扎兰屯市', '150783', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('414', '额尔古纳市', '150784', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('415', '根河市', '150785', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('416', '巴彦淖尔市', '150800', '401', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('417', '临河区', '150802', '416', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('418', '五原县', '150821', '416', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('419', '磴口县', '150822', '416', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('420', '乌拉特前旗', '150823', '416', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('421', '乌拉特中旗', '150824', '416', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('422', '乌拉特后旗', '150825', '416', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('423', '杭锦后旗', '150826', '416', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('424', '乌兰察布市', '150900', '416', '2019-07-24 11:05:08');
INSERT INTO `t_area` VALUES ('425', '集宁区', '150902', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('426', '卓资县', '150921', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('427', '化德县', '150922', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('428', '商都县', '150923', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('429', '兴和县', '150924', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('430', '凉城县', '150925', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('431', '察哈尔右翼前旗', '150926', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('432', '察哈尔右翼中旗', '150927', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('433', '察哈尔右翼后旗', '150928', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('434', '四子王旗', '150929', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('435', '丰镇市', '150981', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('436', '兴安盟', '152200', '424', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('437', '乌兰浩特市', '152201', '436', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('438', '阿尔山市', '152202', '436', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('439', '科尔沁右翼前旗', '152221', '436', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('440', '科尔沁右翼中旗', '152222', '436', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('441', '扎赉特旗', '152223', '436', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('442', '突泉县', '152224', '436', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('443', '锡林郭勒盟', '152500', '436', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('444', '二连浩特市', '152501', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('445', '锡林浩特市', '152502', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('446', '阿巴嘎旗', '152522', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('447', '苏尼特左旗', '152523', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('448', '苏尼特右旗', '152524', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('449', '东乌珠穆沁旗', '152525', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('450', '西乌珠穆沁旗', '152526', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('451', '太仆寺旗', '152527', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('452', '镶黄旗', '152528', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('453', '正镶白旗', '152529', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('454', '正蓝旗', '152530', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('455', '多伦县', '152531', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('456', '阿拉善盟', '152900', '443', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('457', '阿拉善左旗', '152921', '456', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('458', '阿拉善右旗', '152922', '456', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('459', '额济纳旗', '152923', '456', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('460', '辽宁省', '210000', '0', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('461', '沈阳市', '210100', '460', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('462', '和平区', '210102', '461', '2019-07-24 11:05:09');
INSERT INTO `t_area` VALUES ('463', '沈河区', '210103', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('464', '大东区', '210104', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('465', '皇姑区', '210105', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('466', '铁西区', '210106', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('467', '苏家屯区', '210111', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('468', '浑南区', '210112', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('469', '沈北新区', '210113', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('470', '于洪区', '210114', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('471', '辽中区', '210115', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('472', '康平县', '210123', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('473', '法库县', '210124', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('474', '新民市', '210181', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('475', '大连市', '210200', '461', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('476', '中山区', '210202', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('477', '西岗区', '210203', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('478', '沙河口区', '210204', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('479', '甘井子区', '210211', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('480', '旅顺口区', '210212', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('481', '金州区', '210213', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('482', '普兰店区', '210214', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('483', '长海县', '210224', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('484', '瓦房店市', '210281', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('485', '庄河市', '210283', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('486', '鞍山市', '210300', '475', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('487', '铁东区', '210302', '486', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('488', '铁西区', '210303', '486', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('489', '立山区', '210304', '486', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('490', '千山区', '210311', '486', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('491', '台安县', '210321', '486', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('492', '岫岩满族自治县', '210323', '486', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('493', '海城市', '210381', '486', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('494', '抚顺市', '210400', '486', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('495', '新抚区', '210402', '494', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('496', '东洲区', '210403', '494', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('497', '望花区', '210404', '494', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('498', '顺城区', '210411', '494', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('499', '抚顺县', '210421', '494', '2019-07-24 11:05:10');
INSERT INTO `t_area` VALUES ('500', '新宾满族自治县', '210422', '494', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('501', '清原满族自治县', '210423', '494', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('502', '本溪市', '210500', '494', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('503', '平山区', '210502', '502', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('504', '溪湖区', '210503', '502', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('505', '明山区', '210504', '502', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('506', '南芬区', '210505', '502', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('507', '本溪满族自治县', '210521', '502', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('508', '桓仁满族自治县', '210522', '502', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('509', '丹东市', '210600', '502', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('510', '元宝区', '210602', '509', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('511', '振兴区', '210603', '509', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('512', '振安区', '210604', '509', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('513', '宽甸满族自治县', '210624', '509', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('514', '东港市', '210681', '509', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('515', '凤城市', '210682', '509', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('516', '锦州市', '210700', '509', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('517', '古塔区', '210702', '516', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('518', '凌河区', '210703', '516', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('519', '太和区', '210711', '516', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('520', '黑山县', '210726', '516', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('521', '义县', '210727', '516', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('522', '凌海市', '210781', '516', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('523', '北镇市', '210782', '516', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('524', '营口市', '210800', '516', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('525', '站前区', '210802', '524', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('526', '西市区', '210803', '524', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('527', '鲅鱼圈区', '210804', '524', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('528', '老边区', '210811', '524', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('529', '盖州市', '210881', '524', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('530', '大石桥市', '210882', '524', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('531', '阜新市', '210900', '524', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('532', '海州区', '210902', '531', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('533', '新邱区', '210903', '531', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('534', '太平区', '210904', '531', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('535', '清河门区', '210905', '531', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('536', '细河区', '210911', '531', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('537', '阜新蒙古族自治县', '210921', '531', '2019-07-24 11:05:11');
INSERT INTO `t_area` VALUES ('538', '彰武县', '210922', '531', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('539', '辽阳市', '211000', '531', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('540', '白塔区', '211002', '539', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('541', '文圣区', '211003', '539', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('542', '宏伟区', '211004', '539', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('543', '弓长岭区', '211005', '539', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('544', '太子河区', '211011', '539', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('545', '辽阳县', '211021', '539', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('546', '灯塔市', '211081', '539', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('547', '盘锦市', '211100', '539', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('548', '双台子区', '211102', '547', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('549', '兴隆台区', '211103', '547', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('550', '大洼区', '211104', '547', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('551', '盘山县', '211122', '547', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('552', '铁岭市', '211200', '547', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('553', '银州区', '211202', '552', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('554', '清河区', '211204', '552', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('555', '铁岭县', '211221', '552', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('556', '西丰县', '211223', '552', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('557', '昌图县', '211224', '552', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('558', '调兵山市', '211281', '552', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('559', '开原市', '211282', '552', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('560', '朝阳市', '211300', '552', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('561', '双塔区', '211302', '560', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('562', '龙城区', '211303', '560', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('563', '朝阳县', '211321', '560', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('564', '建平县', '211322', '560', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('565', '喀喇沁左翼蒙古族自治县', '211324', '560', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('566', '北票市', '211381', '560', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('567', '凌源市', '211382', '560', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('568', '葫芦岛市', '211400', '560', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('569', '连山区', '211402', '568', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('570', '龙港区', '211403', '568', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('571', '南票区', '211404', '568', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('572', '绥中县', '211421', '568', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('573', '建昌县', '211422', '568', '2019-07-24 11:05:12');
INSERT INTO `t_area` VALUES ('574', '兴城市', '211481', '568', '2019-07-24 11:05:12');

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(300) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(20) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `proid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `areaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1', '福州新弯曲5号', '张三', '福州艾玛超市', '12999999999', '普通客户', '2019-05-20 14:34:04', '1', '0', '645', '646', '647');
INSERT INTO `t_customer` VALUES ('2', '天津兴达大街888号', '李四', '天津王大连锁酒店', '18888888888', '优质客户', '2019-05-20 14:34:07', '1', '0', '645', '646', '647');
INSERT INTO `t_customer` VALUES ('7', '大连市沙河口区', '张三', '17', '2147483647', '添加', '2019-07-25 11:11:05', '1', '0', '645', '646', '647');
INSERT INTO `t_customer` VALUES ('8', '大连市沙河口区', '李四', '18', '2147483647', '添加', '2019-07-25 11:11:05', '1', '0', '645', '646', '647');

-- ----------------------------
-- Table structure for `t_customer_photo`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_photo`;
CREATE TABLE `t_customer_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phoid` int(11) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `delflg` int(10) unsigned zerofill DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_photo
-- ----------------------------
INSERT INTO `t_customer_photo` VALUES ('7', '14', '/upload/20190730184111.jpg', '02.jpg', '0000000000', '2019-07-30 18:42:51');
INSERT INTO `t_customer_photo` VALUES ('8', '7', '/upload/20190730203105.jpg', '01.jpg', '0000000000', '2019-07-30 20:32:46');
INSERT INTO `t_customer_photo` VALUES ('9', '8', '/upload/20190730203118.jpg', '02.jpg', '0000000000', '2019-07-30 20:32:59');
INSERT INTO `t_customer_photo` VALUES ('10', '2', '/upload/20190730203130.jpg', '03.jpg', '0000000000', '2019-07-30 20:33:10');
INSERT INTO `t_customer_photo` VALUES ('11', '1', '/upload/20190730203149.jpg', '04.jpg', '0000000000', '2019-07-30 20:33:30');
INSERT INTO `t_customer_photo` VALUES ('12', '8', '/upload/20190731154830.jpg', '04.jpg', '0000000000', '2019-07-31 15:50:10');

-- ----------------------------
-- Table structure for `t_customer_return_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list`;
CREATE TABLE `t_customer_return_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amountpaid` float NOT NULL,
  `amountpayable` float NOT NULL,
  `customerreturndate` datetime DEFAULT NULL,
  `customerreturnnumber` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `delflag` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_return_list
-- ----------------------------
INSERT INTO `t_customer_return_list` VALUES ('3', '25', '25', '2019-05-20 14:33:46', 'XT201712110003', 'cc', '1', '1', '1', '2019-05-20 14:33:46', '0');
INSERT INTO `t_customer_return_list` VALUES ('4', '13', '13', '2019-05-20 14:33:48', 'XT201712120001', 'xx', '1', '1', '1', '2019-05-20 14:33:48', '0');
INSERT INTO `t_customer_return_list` VALUES ('5', '26', '26', '2019-05-20 14:33:54', 'XT201712120002', 'cc', '1', '1', '1', '2019-05-20 14:33:54', '0');
INSERT INTO `t_customer_return_list` VALUES ('7', '1199', '1199', '2019-06-27 00:00:00', 'XT201906270001', '4', '1', '4', '1', '2019-06-27 15:07:25', '0');
INSERT INTO `t_customer_return_list` VALUES ('8', '6600', '6600', '2019-06-27 00:00:00', 'XT201906270002', '4', '1', '4', '1', '2019-06-27 15:14:39', '0');
INSERT INTO `t_customer_return_list` VALUES ('9', '0', '0', '2019-06-27 00:00:00', 'XT201906270003', '4', '1', '4', '1', '2019-06-27 15:18:32', '0');
INSERT INTO `t_customer_return_list` VALUES ('10', '0', '0', '2019-06-27 00:00:00', 'XT201906270004', '4', '1', '4', '1', '2019-06-27 15:19:12', '0');
INSERT INTO `t_customer_return_list` VALUES ('11', '2200', '2200', '2019-06-28 00:00:00', 'XT201906280001', '4', '1', '4', '1', '2019-06-28 14:05:46', '0');
INSERT INTO `t_customer_return_list` VALUES ('13', '986568', '986568', '2019-07-02 00:00:00', 'XT201907020002', '3', '1', '3', '1', '2019-07-02 16:12:36', '0');
INSERT INTO `t_customer_return_list` VALUES ('14', '8664', '8664', '2019-07-02 00:00:00', 'XT201907020003', '南通通州综艺集团', '1', '4', '1', '2019-07-02 17:01:34', '0');
INSERT INTO `t_customer_return_list` VALUES ('15', '17776', '17776', '2019-07-02 00:00:00', 'XT201907020004', '大连', '1', '6', '1', '2019-07-02 17:03:10', '0');
INSERT INTO `t_customer_return_list` VALUES ('16', '78', '78', '2019-07-02 00:00:00', 'XT201907020005', '福州艾玛超市', '1', '1', '1', '2019-07-02 17:05:06', '0');
INSERT INTO `t_customer_return_list` VALUES ('17', '6776', '6776', '2019-07-02 00:00:00', 'XT201907020006', '大连', '1', '6', '1', '2019-07-02 17:29:13', '0');
INSERT INTO `t_customer_return_list` VALUES ('18', '15568', '15568', '2019-07-03 00:00:00', 'XT201907030001', '大凉山希望小学', '1', '3', '1', '2019-07-03 17:19:23', '0');
INSERT INTO `t_customer_return_list` VALUES ('19', '17808', '17808', '2019-07-04 00:00:00', 'XT201907040001', '福州艾玛超市', '1', '1', '1', '2019-07-04 14:00:33', '0');
INSERT INTO `t_customer_return_list` VALUES ('20', '22560', '22560', '2019-07-04 00:00:00', 'XT201907040001', 'as', '1', '7', '1', '2019-07-04 17:49:19', '0');
INSERT INTO `t_customer_return_list` VALUES ('21', '17776', '17776', '2019-07-04 00:00:00', 'XT201907040002', 'aa', '1', '5', '1', '2019-07-04 17:50:13', '0');
INSERT INTO `t_customer_return_list` VALUES ('22', '68880', '68880', '2019-07-05 00:00:00', 'XT201907050001', 'aa', '1', '6', '1', '2019-07-05 14:31:08', '0');
INSERT INTO `t_customer_return_list` VALUES ('26', '5', '6', '2019-07-08 00:00:00', 'XT201907080001', '南通通州综艺集团', '1', '4', '1', '2019-07-08 11:23:37', '0');
INSERT INTO `t_customer_return_list` VALUES ('27', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-08 14:56:55', '0');
INSERT INTO `t_customer_return_list` VALUES ('28', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-08 15:02:17', '0');
INSERT INTO `t_customer_return_list` VALUES ('29', '20664', '20664', '2019-07-09 00:00:00', 'XT201907090001', '南通通州综艺集团', '1', '4', '1', '2019-07-09 10:38:45', '0');
INSERT INTO `t_customer_return_list` VALUES ('30', '0', '0', '2019-07-18 00:00:00', 'XT201907180001', '66', '1', '28', '1', '2019-07-18 09:58:40', '0');
INSERT INTO `t_customer_return_list` VALUES ('31', '0', '0', '2019-07-18 00:00:00', 'XT201907180002', '11', '1', '19', '1', '2019-07-18 14:54:03', '0');
INSERT INTO `t_customer_return_list` VALUES ('32', '68880', '68880', '2019-07-18 00:00:00', 'XT201907180003', '大脸猫', '1', '7', '1', '2019-07-18 14:55:30', '0');
INSERT INTO `t_customer_return_list` VALUES ('33', '0', '0', '2019-07-18 00:00:00', 'XT201907180004', '66hha', '1', '28', '1', '2019-07-18 16:03:48', '0');
INSERT INTO `t_customer_return_list` VALUES ('34', '0', '0', '2019-07-18 00:00:00', 'XT201907180005', '66hha', '1', '28', '1', '2019-07-18 16:03:59', '0');
INSERT INTO `t_customer_return_list` VALUES ('35', '0', '0', '2019-07-18 00:00:00', 'XT201907180006', '66hha', '1', '28', '1', '2019-07-18 16:05:27', '0');
INSERT INTO `t_customer_return_list` VALUES ('36', '61992', '61992', '2019-07-18 00:00:00', 'XT201907180007', '66hha', '1', '28', '1', '2019-07-18 16:06:37', '0');
INSERT INTO `t_customer_return_list` VALUES ('37', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:49:09', null);
INSERT INTO `t_customer_return_list` VALUES ('38', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:49:09', null);
INSERT INTO `t_customer_return_list` VALUES ('39', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:49:09', null);
INSERT INTO `t_customer_return_list` VALUES ('40', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:51:32', null);
INSERT INTO `t_customer_return_list` VALUES ('41', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:51:32', null);
INSERT INTO `t_customer_return_list` VALUES ('42', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:51:32', null);
INSERT INTO `t_customer_return_list` VALUES ('43', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:53:57', null);
INSERT INTO `t_customer_return_list` VALUES ('44', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:53:57', null);
INSERT INTO `t_customer_return_list` VALUES ('45', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', null, '2019-07-23 18:53:57', null);
INSERT INTO `t_customer_return_list` VALUES ('46', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', '1', '2019-07-24 09:38:09', null);
INSERT INTO `t_customer_return_list` VALUES ('47', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', '1', '2019-07-24 09:38:12', null);
INSERT INTO `t_customer_return_list` VALUES ('48', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', '1', '2019-07-24 09:38:14', null);
INSERT INTO `t_customer_return_list` VALUES ('49', '25', '25', '2019-05-20 14:33:46', 'XX201712110003', 'cc', '1', '1', '1', '2019-07-24 09:51:46', null);
INSERT INTO `t_customer_return_list` VALUES ('50', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-25 09:42:06', '0');
INSERT INTO `t_customer_return_list` VALUES ('51', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-25 09:46:13', '0');
INSERT INTO `t_customer_return_list` VALUES ('52', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-30 16:49:56', '0');
INSERT INTO `t_customer_return_list` VALUES ('53', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-30 16:50:50', '0');
INSERT INTO `t_customer_return_list` VALUES ('54', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 08:38:30', '0');
INSERT INTO `t_customer_return_list` VALUES ('55', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 08:47:18', '0');
INSERT INTO `t_customer_return_list` VALUES ('56', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 10:03:39', '0');
INSERT INTO `t_customer_return_list` VALUES ('57', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 10:15:08', '0');
INSERT INTO `t_customer_return_list` VALUES ('58', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 10:20:18', '0');
INSERT INTO `t_customer_return_list` VALUES ('59', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 10:24:53', '0');
INSERT INTO `t_customer_return_list` VALUES ('60', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 13:24:36', '0');
INSERT INTO `t_customer_return_list` VALUES ('61', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 13:25:39', '0');
INSERT INTO `t_customer_return_list` VALUES ('62', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 16:46:40', '0');
INSERT INTO `t_customer_return_list` VALUES ('63', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 16:50:43', '0');
INSERT INTO `t_customer_return_list` VALUES ('64', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 16:55:11', '0');
INSERT INTO `t_customer_return_list` VALUES ('65', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 16:57:03', '0');
INSERT INTO `t_customer_return_list` VALUES ('66', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 16:58:57', '0');
INSERT INTO `t_customer_return_list` VALUES ('67', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 17:00:30', '0');
INSERT INTO `t_customer_return_list` VALUES ('68', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 17:01:20', '0');
INSERT INTO `t_customer_return_list` VALUES ('69', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 17:21:56', '0');
INSERT INTO `t_customer_return_list` VALUES ('70', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-07-31 17:23:02', '0');
INSERT INTO `t_customer_return_list` VALUES ('71', '1', '1', '2019-07-08 00:00:00', '测试', '南通通州综艺集团', '1', '4', '1', '2019-08-01 10:35:27', '0');
INSERT INTO `t_customer_return_list` VALUES ('72', '0', '0', '2019-08-07 00:00:00', 'XT201908070001', '天津王大连锁酒店', '1', '2', '1', '2019-08-07 17:12:27', '0');

-- ----------------------------
-- Table structure for `t_customer_return_list_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list_goods`;
CREATE TABLE `t_customer_return_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `customerreturnlistid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_return_list_goods
-- ----------------------------
INSERT INTO `t_customer_return_list_goods` VALUES ('5', '0004', '12', '2斤装', '新疆红枣', '1', '25', '25', '袋', '3', '10', '2019-05-20 14:33:33', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('6', '0006', '14', '300g装', '冰糖金桔干', '1', '13', '13', '盒', '4', '11', '2019-05-20 14:33:36', '1', '1');
INSERT INTO `t_customer_return_list_goods` VALUES ('7', '0006', '14', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '5', '11', '2019-05-20 14:33:39', '1', '1');
INSERT INTO `t_customer_return_list_goods` VALUES ('8', '0021', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '1', '1199', '1199', '台', '4', '12', '2019-06-27 15:07:25', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('9', '0002', '2', 'Note8', '华为荣耀Note9', '2', '2200', '6600', '台', '4', '16', '2019-06-27 15:14:39', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('10', '0002', '2', 'Note8', '华为荣耀Note9', '1', '2200', '2200', '台', '4', '16', '2019-07-01 14:05:46', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('11', '0020', '29', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', '111', '8888', '986568', '台', '3', '14', '2019-07-02 16:12:36', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('12', '0022', '31', 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', '3', '2888', '8664', '台', '4', '13', '2019-07-02 17:01:34', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('13', '0020', '29', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', '2', '8888', '17776', '台', '6', '14', '2019-07-02 17:03:10', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('14', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '3', '8', '78', '瓶', '1', '11', '2019-07-02 17:05:06', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('15', '0003', '11', '500g装', '野生东北黑木耳', '3', '18', '78', '袋', '1', '11', '2019-07-02 17:05:06', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('16', '0021', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '1', '1888', '6776', '台', '17', '12', '2019-07-02 17:29:13', '1', '1');
INSERT INTO `t_customer_return_list_goods` VALUES ('17', '0017', '26', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', '1', '4888', '6776', '台', '17', '15', '2019-07-02 17:29:13', '1', '1');
INSERT INTO `t_customer_return_list_goods` VALUES ('18', '0017', '26', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', '2', '4888', '15568', '台', '18', '15', '2019-07-03 17:19:23', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('19', '0022', '31', 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', '2', '2888', '15568', '台', '18', '13', '2019-07-03 17:19:23', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('20', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '2', '8', '15568', '瓶', '18', '11', '2019-07-03 17:19:23', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('21', '0020', '29', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', '2', '8888', '17808', '台', '19', '14', '2019-07-04 14:00:33', '1', '1');
INSERT INTO `t_customer_return_list_goods` VALUES ('22', '0034', '43', 'TCL-1000-12623', 'TCL电视', '2', '8', '17808', '台', '19', '15', '2019-07-04 14:00:33', '1', '1');
INSERT INTO `t_customer_return_list_goods` VALUES ('23', '0030', '41', '100g', '饼', '2', '8', '17808', '个', '19', '10', '2019-07-04 14:00:33', '1', '1');
INSERT INTO `t_customer_return_list_goods` VALUES ('24', '0020', '29', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', '2', '8888', '22560', '台', '20', '14', '2019-07-04 17:49:19', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('25', '0021', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '1', '1888', '22560', '台', '20', '12', '2019-07-04 17:49:19', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('26', '0034', '43', 'TCL-1000-12623', 'TCL电视', '1', '8', '22560', '台', '20', '15', '2019-07-04 17:49:20', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('27', '0019', '28', 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', '1', '2888', '22560', '台', '20', '17', '2019-07-04 17:49:20', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('28', '0020', '29', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', '2', '8888', '17776', '台', '21', '14', '2019-07-04 17:50:13', '1', '1');
INSERT INTO `t_customer_return_list_goods` VALUES ('29', '0015', '24', 'X', 'iPhone X', '10', '6888', '68880', '台', '22', '16', '2019-07-05 14:31:11', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('30', '0044', '54', '100ml', '测试', '1', '1', '10', '个', '27', '99', '2019-07-08 14:56:56', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('31', '0044', '54', '100ml', '测试', '2', '1', '10', '个', '28', '99', '2019-07-08 15:02:17', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('32', '0015', '24', 'X', 'iPhone X', '3', '6888', '20664', '台', '29', '16', '2019-07-09 10:38:45', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('33', '0015', '24', 'X', 'iPhone X', '10', '6888', '68880', '台', '32', '16', '2019-07-18 14:55:30', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('34', '0015', '24', 'X', 'iPhone X', '9', '6888', '61992', '台', '36', '16', '2019-07-18 16:06:38', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('35', '0004', '12', '2斤装', '迁西板栗', '1', '25', '25', '袋', '3', '10', '2019-07-22 09:25:28', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('36', '0006', '14', '300g装', '冰糖金桔干', '1', '13', '13', '盒', '4', '11', '2019-07-22 09:25:44', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('37', '0006', '14', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '5', '11', '2019-07-22 09:26:03', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('38', '0021', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '1', '1199', '1199', '台', '4', '12', '2019-07-22 09:26:52', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('39', '2331', '12', '2斤装', '迁西板栗', '1', '25', '25', '袋', '3', '10', '2019-07-22 11:37:43', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('40', '2332', '14', '300g装', '冰糖金桔干', '1', '13', '13', '盒', '4', '11', '2019-07-22 11:37:43', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('41', '2333', '14', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '5', '11', '2019-07-22 11:37:43', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('42', '2334', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '1', '1199', '1199', '台', '4', '12', '2019-07-22 11:37:43', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('43', '2335', '2', 'Note8', '华为荣耀Note9', '2', '2200', '6600', '台', '4', '16', '2019-07-22 11:37:43', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('44', '2336', '2', 'P30', '华为P30', '1', '4200', '2200', '台', '4', '16', '2019-07-22 11:37:43', '1', null);
INSERT INTO `t_customer_return_list_goods` VALUES ('45', '2331', '12', '2斤装', '迁西板栗', '1', '25', '25', '袋', '3', '10', '2019-07-23 09:53:21', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('46', '2332', '14', '300g装', '冰糖金桔干', '1', '13', '13', '盒', '4', '11', '2019-07-23 09:53:21', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('47', '2333', '14', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '5', '11', '2019-07-23 09:53:21', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('48', '2334', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '1', '1199', '1199', '台', '4', '12', '2019-07-23 09:53:21', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('49', '2335', '2', 'Note8', '华为荣耀Note9', '2', '2200', '6600', '台', '4', '16', '2019-07-23 09:53:21', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('50', '2331', '12', '2斤装', '迁西板栗', '1', '25', '25', '袋', '3', '10', '2019-07-23 10:09:03', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('51', '2332', '14', '300g装', '冰糖金桔干', '1', '13', '13', '盒', '4', '11', '2019-07-23 10:09:03', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('52', '2333', '14', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '5', '11', '2019-07-23 10:09:03', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('53', '2334', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '1', '1199', '1199', '台', '4', '12', '2019-07-23 10:09:03', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('54', '2335', '2', 'Note8', '华为荣耀Note9', '2', '2200', '6600', '台', '4', '16', '2019-07-23 10:09:03', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('55', '2331', '12', '2斤装', '新疆红枣', '1', '25', '25', '袋', '1', '10', '2019-07-23 18:53:57', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('56', '2332', '14', '300g装', '冰糖金桔干', '1', '13', '13', '盒', '1', '11', '2019-07-23 18:53:57', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('57', '2333', '14', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '1', '11', '2019-07-23 18:53:57', null, null);
INSERT INTO `t_customer_return_list_goods` VALUES ('58', '0054', '54', '100g', '酸奶疙瘩', '990', '9', '10', '袋', '50', '11', '2019-07-25 09:42:06', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('59', '0054', '54', '100g', '酸奶疙瘩', '1980', '9', '10', '袋', '51', '11', '2019-07-25 09:46:14', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('60', '0054', '54', '100g', '酸奶疙瘩', '3960', '9', '10', '袋', '52', '11', '2019-07-30 16:49:56', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('61', '0054', '54', '100g', '酸奶疙瘩', '7920', '9', '10', '袋', '53', '11', '2019-07-30 16:50:50', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('62', '0054', '54', '100g', '酸奶疙瘩', '15840', '9', '10', '袋', '54', '11', '2019-07-31 08:38:30', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('63', '0054', '54', '100g', '酸奶疙瘩', '31680', '9', '10', '袋', '55', '11', '2019-07-31 08:47:18', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('64', '0054', '54', '100g', '酸奶疙瘩', '63360', '9', '10', '袋', '56', '11', '2019-07-31 10:03:40', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('65', '0054', '54', '100g', '酸奶疙瘩', '126720', '9', '10', '袋', '57', '11', '2019-07-31 10:15:08', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('66', '0054', '54', '100g', '酸奶疙瘩', '253440', '9', '10', '袋', '58', '11', '2019-07-31 10:20:19', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('67', '0054', '54', '100g', '酸奶疙瘩', '506880', '9', '10', '袋', '59', '11', '2019-07-31 10:24:53', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('68', '0054', '54', '100g', '酸奶疙瘩', '1013760', '9', '10', '袋', '60', '11', '2019-07-31 13:24:36', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('69', '0054', '54', '100g', '酸奶疙瘩', '2027520', '9', '10', '袋', '61', '11', '2019-07-31 13:25:39', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('70', '0054', '54', '100g', '酸奶疙瘩', '4055040', '9', '10', '袋', '62', '11', '2019-07-31 16:46:40', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('71', '0054', '54', '100g', '酸奶疙瘩', '8110080', '9', '10', '袋', '63', '11', '2019-07-31 16:50:43', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('72', '0054', '54', '100g', '酸奶疙瘩', '16220160', '9', '10', '袋', '64', '11', '2019-07-31 16:55:11', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('73', '0054', '54', '100g', '酸奶疙瘩', '32440320', '9', '10', '袋', '65', '11', '2019-07-31 16:57:03', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('74', '0054', '54', '100g', '酸奶疙瘩', '64880640', '9', '10', '袋', '66', '11', '2019-07-31 16:58:57', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('75', '0054', '54', '100g', '酸奶疙瘩', '129761280', '9', '10', '袋', '67', '11', '2019-07-31 17:00:30', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('76', '0054', '54', '100g', '酸奶疙瘩', '259522560', '9', '10', '袋', '68', '11', '2019-07-31 17:01:20', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('77', '0054', '54', '100g', '酸奶疙瘩', '519045120', '9', '10', '袋', '69', '11', '2019-07-31 17:21:56', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('78', '0054', '54', '100g', '酸奶疙瘩', '1038090240', '9', '10', '袋', '70', '11', '2019-07-31 17:23:02', '1', '0');
INSERT INTO `t_customer_return_list_goods` VALUES ('79', '0054', '54', '100g', '酸奶疙瘩', '2076180480', '9', '10', '袋', '71', '11', '2019-08-01 10:35:28', '1', '0');

-- ----------------------------
-- Table structure for `t_damage_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list`;
CREATE TABLE `t_damage_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `damagedate` datetime DEFAULT NULL,
  `damagenumber` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_damage_list
-- ----------------------------
INSERT INTO `t_damage_list` VALUES ('1', '2019-05-16 15:42:51', 'BS201712130001', 'cc', '0', '2019-05-24 09:00:30', '1');
INSERT INTO `t_damage_list` VALUES ('2', '2019-05-09 15:42:55', 'BS201712130002', 'xx', '0', '2019-05-16 09:00:36', '1');
INSERT INTO `t_damage_list` VALUES ('19', '2019-07-01 00:00:00', 'BS201907010003', 'fffddss', '0', '2019-07-01 09:49:13', '1');
INSERT INTO `t_damage_list` VALUES ('20', '2019-07-01 00:00:00', 'BS201907010004', 'hhhhh', '0', '2019-07-01 09:58:40', '1');
INSERT INTO `t_damage_list` VALUES ('21', '2019-07-01 00:00:00', 'BS201907010005', 'aaasss', '0', '2019-07-01 14:28:39', '1');
INSERT INTO `t_damage_list` VALUES ('22', '2019-07-01 00:00:00', 'BS201907010006', 'aasxcv', '0', '2019-07-01 15:05:01', '1');
INSERT INTO `t_damage_list` VALUES ('23', '2019-07-01 00:00:00', 'BS201907010007', '啊啊啊', '0', '2019-07-01 16:35:41', '1');
INSERT INTO `t_damage_list` VALUES ('24', '2019-07-02 00:00:00', 'BS201907020001', 'aaww', '0', '2019-07-02 15:24:58', '1');
INSERT INTO `t_damage_list` VALUES ('25', '2019-07-03 00:00:00', 'BS201907030001', 'sss', '0', '2019-07-03 16:24:31', '1');
INSERT INTO `t_damage_list` VALUES ('26', '2019-07-04 00:00:00', 'BS201907040001', 'fffff', '0', '2019-07-04 09:16:21', '1');
INSERT INTO `t_damage_list` VALUES ('27', '2019-07-04 00:00:00', 'BS201907040002', 'dcdvb', '0', '2019-07-04 09:21:46', '1');
INSERT INTO `t_damage_list` VALUES ('28', '2019-07-04 00:00:00', 'BS201907040003', 'bbnbn', '0', '2019-07-04 09:22:56', '1');
INSERT INTO `t_damage_list` VALUES ('29', '2019-07-04 00:00:00', 'BS201907040004', 'hhnhn', '1', '2019-07-04 09:25:04', '1');
INSERT INTO `t_damage_list` VALUES ('30', '2019-07-04 00:00:00', 'BS201907040005', 'ggg', '0', '2019-07-04 09:28:32', '1');
INSERT INTO `t_damage_list` VALUES ('31', '2019-07-04 00:00:00', 'BS201907040006', 'ddd', '1', '2019-07-04 10:12:45', '1');
INSERT INTO `t_damage_list` VALUES ('33', '2019-07-05 00:00:00', 'BS201907050001', 'dddfg', '1', '2019-07-05 17:17:29', '1');
INSERT INTO `t_damage_list` VALUES ('34', '2019-07-05 00:00:00', 'BS201907050002', 'gggg', '1', '2019-07-05 17:21:24', '1');
INSERT INTO `t_damage_list` VALUES ('35', '2019-07-10 00:00:00', 'BS201907100001', 'fffff', '1', '2019-07-10 09:34:42', '1');
INSERT INTO `t_damage_list` VALUES ('36', '2019-07-17 00:00:00', 'BS201907170001', '', '1', '2019-07-17 09:30:02', '1');
INSERT INTO `t_damage_list` VALUES ('37', '2019-07-17 00:00:00', 'BS201907170002', '', '1', '2019-07-17 09:30:11', '1');
INSERT INTO `t_damage_list` VALUES ('38', '2019-07-17 00:00:00', 'BS201907170003', '椰子灰 发霉', '1', '2019-07-17 11:02:51', '1');
INSERT INTO `t_damage_list` VALUES ('39', '2019-07-17 00:00:00', 'BS201907170004', '', '1', '2019-07-17 15:11:08', '1');
INSERT INTO `t_damage_list` VALUES ('40', '2019-07-17 00:00:00', 'BS201907170005', '', '1', '2019-07-17 16:46:31', '1');
INSERT INTO `t_damage_list` VALUES ('41', '2019-07-18 00:00:00', 'BS201907180001', 'dda', '1', '2019-07-18 11:08:58', '1');
INSERT INTO `t_damage_list` VALUES ('42', '2019-07-18 00:00:00', 'BS201907180002', '', '1', '2019-07-18 11:49:14', '1');
INSERT INTO `t_damage_list` VALUES ('43', '2019-07-18 00:00:00', 'BS201907180002', '525', '1', '2019-07-18 16:19:08', '1');
INSERT INTO `t_damage_list` VALUES ('44', '2019-07-24 00:00:00', 'BS201907240001', '不能转动', '1', '2019-07-24 13:10:11', '1');
INSERT INTO `t_damage_list` VALUES ('45', '2019-07-24 00:00:00', 'BS201907240002', 'ss', '1', '2019-07-24 16:39:30', '1');

-- ----------------------------
-- Table structure for `t_damage_list_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list_goods`;
CREATE TABLE `t_damage_list_goods` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `goodsid` int(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `num` int(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `damagelistid` int(255) DEFAULT NULL,
  `typeid` int(255) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_damage_list_goods
-- ----------------------------
INSERT INTO `t_damage_list_goods` VALUES ('1', '0003', '11', '500', '野生东北黑木耳', '1', '22', '22', '袋', '1', '11', '0', '2019-05-20 14:23:24', '1');
INSERT INTO `t_damage_list_goods` VALUES ('2', '0006', '14', '300', '冰糖金桔干', '2', '4', '8', '盒', '1', '11', '0', '2019-05-15 14:23:19', '1');
INSERT INTO `t_damage_list_goods` VALUES ('3', '0003', '11', '500', '野生东北黑木耳', '2', '22', '44', '袋', '2', '11', '0', '2019-05-24 14:23:15', '1');
INSERT INTO `t_damage_list_goods` VALUES ('4', '0002', '2', 'Note8', '华为荣耀Note9', '1', '2200', '2200', '台', '19', '16', '0', '2019-07-01 09:49:13', '1');
INSERT INTO `t_damage_list_goods` VALUES ('5', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '20', '11', '0', '2019-07-01 09:58:40', '1');
INSERT INTO `t_damage_list_goods` VALUES ('6', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '21', '11', '0', '2019-07-01 14:28:39', '1');
INSERT INTO `t_damage_list_goods` VALUES ('7', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '2', '8', '16', '瓶', '22', '11', '0', '2019-07-01 15:05:01', '1');
INSERT INTO `t_damage_list_goods` VALUES ('8', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '23', '11', '0', '2019-07-01 16:35:41', '1');
INSERT INTO `t_damage_list_goods` VALUES ('9', '0002', '2', 'Note8', '华为荣耀Note9', '1', '8888', '8888', '台', '24', '16', '0', '2019-07-02 15:24:58', '1');
INSERT INTO `t_damage_list_goods` VALUES ('10', '0021', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '2', '1888', '3776', '台', '25', '12', '0', '2019-07-03 16:24:31', '1');
INSERT INTO `t_damage_list_goods` VALUES ('11', '0024', '33', 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', '2', '18', '36', '件', '25', '6', '0', '2019-07-03 16:24:31', '1');
INSERT INTO `t_damage_list_goods` VALUES ('12', '0004', '12', '2斤装', '新疆红枣', '1', '28', '28', '袋', '26', '10', '0', '2019-07-04 09:16:21', '1');
INSERT INTO `t_damage_list_goods` VALUES ('13', '0002', '2', 'Note8', '华为荣耀Note9', '1', '8888', '8888', '台', '27', '16', '0', '2019-07-04 09:21:46', '1');
INSERT INTO `t_damage_list_goods` VALUES ('14', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '28', '11', '0', '2019-07-04 09:22:56', '1');
INSERT INTO `t_damage_list_goods` VALUES ('15', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '29', '11', '0', '2019-07-04 09:25:04', '1');
INSERT INTO `t_damage_list_goods` VALUES ('16', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '30', '11', '0', '2019-07-04 09:28:32', '1');
INSERT INTO `t_damage_list_goods` VALUES ('17', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '31', '11', '0', '2019-07-04 10:12:45', '1');
INSERT INTO `t_damage_list_goods` VALUES ('19', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '19', '19', '瓶', '33', '11', '0', '2019-07-05 17:17:29', '1');
INSERT INTO `t_damage_list_goods` VALUES ('20', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '19', '19', '瓶', '34', '11', '0', '2019-07-05 17:21:24', '1');
INSERT INTO `t_damage_list_goods` VALUES ('21', '0025', '34', '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', '1', '28', '28', '件', '35', '7', '0', '2019-07-10 09:34:42', '1');
INSERT INTO `t_damage_list_goods` VALUES ('22', '06-660', '59', 'yt-uii', '椰子灰', '25', '6', '150', '斤', '38', '52', '0', '2019-07-17 11:02:51', '1');
INSERT INTO `t_damage_list_goods` VALUES ('23', '0041', '50', '550ml', '可口可乐', '23', '8', '184', '个', '39', '10', '0', '2019-07-17 15:11:08', '1');
INSERT INTO `t_damage_list_goods` VALUES ('24', '0056', '56', '500g', '大枣', '58', '6', '348', '斤', '40', '11', '0', '2019-07-17 16:46:31', '1');
INSERT INTO `t_damage_list_goods` VALUES ('25', '06-660', '59', 'yt-uii', '椰子灰', '58', '6', '348', '斤', '41', '52', '0', '2019-07-18 11:08:58', '1');
INSERT INTO `t_damage_list_goods` VALUES ('26', '0056', '56', '500g', '大枣', '3', '6', '18', '斤', '42', '11', '0', '2019-07-18 11:49:14', '1');
INSERT INTO `t_damage_list_goods` VALUES ('27', '0099', '53', '100g', '冰咖啡', '252', '9', '2268', '瓶', '43', '11', '0', '2019-07-18 16:19:08', '1');
INSERT INTO `t_damage_list_goods` VALUES ('28', '99', '87', '240g装', '电扇', '25', '45', '1125', '袋', '44', '24', '0', '2019-07-24 13:10:11', '1');
INSERT INTO `t_damage_list_goods` VALUES ('29', '0041', '50', '550ml', '可口可乐', '2', '8', '16', '个', '45', '10', '0', '2019-07-24 16:39:30', '1');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `inventoryquantity` int(11) DEFAULT NULL,
  `lastpurchasingprice` float(200,0) DEFAULT NULL,
  `minnum` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `producer` varchar(200) DEFAULT NULL,
  `purchasingprice` float(200,0) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `sellingprice` float(200,0) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `delflag` int(10) DEFAULT NULL,
  `typeid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '0001', '119', '4', '1001', '红色装', '陶华碧老干妈香辣脆油牛肉粒测试测试测试测试测试测试测试测试测试测试', '贵州省贵阳南明老干妈风味的食品有限公司', '13', '好卖又好吃', '13', '2', '瓶', '2019-05-22 08:59:38', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('2', '0002', '139', '2220', '400', 'Note8', '华为荣耀Note9', '华为计算机系统有限公司', '1955', '热销', '17', '2', '台', '2019-05-22 08:59:38', '1', '0', '16');
INSERT INTO `t_goods` VALUES ('11', '0003', '2738', '22', '400', '500g装', '野生东北黑木耳', '辉南县博康土特产有限公司', '23', '够黑2', '214', '2', '袋', '2019-05-22 08:59:47', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('12', '0004', '318', '13', '300', '2斤装', '新疆红枣', '沧州铭鑫食品有限公司', '13', '好吃', '13', '2', '袋', '2019-05-22 08:59:51', '1', '0', '10');
INSERT INTO `t_goods` VALUES ('13', '0005', '58', '8', '1000', '散装500克', '麦片燕麦巧克力', '福建省麦德好食品工业有限公司', '8', 'Goods', '24', '2', '袋', '2019-05-22 08:59:54', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('14', '0006', '1700', '4', '1999', '300g装', '冰糖金桔干', '揭西县同心食品有限公司', '5', '', '48', '2', '盒', '2019-05-22 08:59:58', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('15', '0007', '100000', '4', '400', '500g装', '香蕉味蛋糕', '合肥吉利人家食品有限公司', '4', 'good', '58', '2', '袋', '2019-05-22 09:00:01', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('16', '0008', '196', '2', '500', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '潮州市潮安区正大食品有限公司', '3', '', '68', '2', '盒', '2019-05-22 09:00:06', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('17', '0009', '374', '20', '1000', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '石家庄博群食品有限公司', '20', '', '78', '2', '袋', '2019-05-22 09:00:09', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('18', '0010', '1000', '12', '300', '250g装', '劲仔小鱼干', '湖南省华文食品有限公司', '12', '', '88', '2', '袋', '2019-05-22 09:00:12', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('19', '0011', '1200', '3', '300', '198g装', '山楂条', '临朐县七贤升利食品厂', '3', '', '98', '2', '袋', '2019-05-22 09:00:16', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('20', '0012', '2300', '20', '200', '500g装', '大乌梅干', '长春市鼎丰真食品有限责任公司', '20', '', '88', '2', '袋', '2019-05-22 09:00:18', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('21', '0013', '400', '3', '100', '250g装', '手工制作芝麻香酥麻通', '桂林兰雨食品有限公司', '3', '', '78', '2', '袋', '2019-05-22 09:00:22', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('22', '0014', '1600', '5', '200', '250g装', '美国青豆原味 蒜香', '菲律宾', '5', '', '68', '2', '袋', '2019-05-22 09:01:07', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('24', '0015', '6219', '8000', '100', 'X', 'iPhone X', 'xx2', '8000', 'xxx2', '6888', '2', '台', '2019-05-22 09:01:10', '1', '0', '16');
INSERT INTO `t_goods` VALUES ('25', '0016', '0', '6000', '12', 'XX', 'HUAWE X', '32', '6000', '21', '6888', '2', '台', '2019-05-22 09:01:12', '1', '0', '15');
INSERT INTO `t_goods` VALUES ('26', '0017', '2000', '3000', '100', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', 'xxx', '3000', 'xxx', '4888', '2', '台', '2019-05-22 09:01:15', '1', '0', '15');
INSERT INTO `t_goods` VALUES ('27', '0018', '1000', '800', '400', 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', 'xx', '800', 'xxx', '3888', '2', '台', '2019-05-22 09:01:20', '1', '0', '15');
INSERT INTO `t_goods` VALUES ('28', '0019', '1000', '60', '300', 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', 'xxxx', '60', '', '2888', '0', '台', '2019-05-22 09:01:22', '1', '0', '17');
INSERT INTO `t_goods` VALUES ('29', '0020', '1000', '1000', '50', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', 'cc', '1000', '', '8888', '0', '台', '2019-05-22 09:01:27', '1', '0', '14');
INSERT INTO `t_goods` VALUES ('30', '0021', '1000', '721', '320', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', 'cc', '721', '', '1888', '0', '台', '2019-05-22 09:01:30', '1', '0', '12');
INSERT INTO `t_goods` VALUES ('31', '0022', '9000', '400', '40', 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', 'cc', '400', '', '2888', '0', '台', '2019-05-22 09:01:55', '1', '0', '13');
INSERT INTO `t_goods` VALUES ('32', '0023', '800', '5', '1000', '80g*2', '台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2', 'cc', '4', '', '8', '2', '袋', '2019-05-22 09:01:58', '1', '0', '9');
INSERT INTO `t_goods` VALUES ('33', '0024', '1380', '180', '10', 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', 'cc', '172', '', '18', '2', '件', '2019-05-22 09:02:01', '1', '0', '6');
INSERT INTO `t_goods` VALUES ('34', '0025', '5210', '189', '10', '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', 'cc', '189', '', '28', '0', '件', '2019-05-22 09:02:04', '1', '0', '7');
INSERT INTO `t_goods` VALUES ('35', '0026', '5000', '60', '10', 'AFS JEEP', '加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子', 'c', '60', '', '38', '2', '条', '2019-05-22 09:02:06', '1', '0', '8');
INSERT INTO `t_goods` VALUES ('36', '0027', '2000', '2', '5', '500ml', '娃哈哈', '哇哈啊哈厂', '1', null, '48', null, '瓶', '2019-05-23 11:13:03', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('37', '0028', '1100', '555', '111', '111', '1', '1', '1', '1', '8', '1', '斤', '2019-05-23 15:45:43', '1', '0', '6');
INSERT INTO `t_goods` VALUES ('40', '0088', '1000', '212', '23', '70g装', '德芙', '巧克力工厂', '9', '', '8', null, '条', '2019-06-18 13:46:33', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('41', '0030', '6000', null, '10', '100g', '饼', '大连食品厂', '2', '好吃', '8', null, '个', '2019-06-18 14:46:51', '1', '0', '10');
INSERT INTO `t_goods` VALUES ('42', '0033', '4000', null, '30', '', '草莓', '农夫山庄', '20', '', '8', null, '斤', '2019-06-18 14:58:15', '1', '0', '12');
INSERT INTO `t_goods` VALUES ('43', '0034', '1000', null, '10', 'TCL-1000-12623', 'TCL电视', 'TCL有限公司', '5000', '好好好', '8', null, '台', '2019-06-18 15:39:44', '1', '0', '15');
INSERT INTO `t_goods` VALUES ('44', '0035', '5000', null, '100', '100g', '呀土豆', '好丽友', '2', '好吃', '8', null, '袋', '2019-06-18 15:51:34', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('45', '0036', '6000', null, '40', '', '精油', '阿芙', '20', '薰衣草味道', '8', null, '盒', '2019-06-20 08:41:42', '1', '0', '24');
INSERT INTO `t_goods` VALUES ('46', '0037', '1999', null, '10', '', '碎碎冰', '旺仔', '4', '和夏天更配哦', '8', null, '条', '2019-06-20 08:44:27', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('47', '0038', '999', null, '5', '150g', '可爱多冰淇淋', '雀巢有限公司', '3', '', '8', null, '个', '2019-06-24 07:31:33', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('48', '0039', '9000', null, '5', '200g', '大冰棍', '德式', '3', '', '8', null, '个', '2019-06-27 11:21:30', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('49', '0040', '1200', null, '2', '500g', '苹果', '大连特产', '3', '哈哈', '8', null, '个', '2019-06-27 13:10:42', '1', '0', '10');
INSERT INTO `t_goods` VALUES ('50', '0041', '7955', null, '100', '550ml', '可口可乐', '可口可乐有限公司', '3', '哈哈', '8', null, '个', '2019-06-27 14:44:41', '1', '0', '10');
INSERT INTO `t_goods` VALUES ('51', '0042', '11000', null, '3', '500ml', '雪碧', '可口可乐有限公司', '3', '哈哈', '8', null, '个', '2019-06-27 14:44:41', '1', '0', '10');
INSERT INTO `t_goods` VALUES ('52', '0043', '6000', null, '3', '500ml', '芬达', '$可口可乐有限公司', '2', '哈哈', '8', null, '个', '2019-06-27 14:44:41', '1', '0', '10');
INSERT INTO `t_goods` VALUES ('53', null, null, null, null, null, '阿华田牛奶', null, null, null, null, null, null, '2019-08-01 15:03:23', '1', '0', null);
INSERT INTO `t_goods` VALUES ('54', '0054', '-142606336', null, '9', '100g', '酸奶疙瘩', '新疆天山', '9', '很开胃', '9', null, '袋', '2019-07-09 11:42:19', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('56', '0056', '938', null, '20', '500g', '大枣', '新疆食品厂', '50', null, '6', null, '斤', '2019-07-09 12:52:05', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('58', '030', '1000', null, '4', '', '可可', '_浙江', '1', '', '9', null, '瓶', '2019-07-10 10:36:46', '1', '1', '53');
INSERT INTO `t_goods` VALUES ('59', '06-660', '830', null, '50', 'yt-uii', '椰子灰', '大连贸易%', '10', '', '6', null, '斤', '2019-07-11 10:13:45', '1', '0', '52');
INSERT INTO `t_goods` VALUES ('60', '5345', '1000', null, '2', '798798', '狗粮', 'iov$', '24', '', '6', null, '斤', '2019-07-11 10:56:21', '1', '1', '96');
INSERT INTO `t_goods` VALUES ('69', '003', null, null, '78', '03-033', '咖啡豆', '8889999', '50', '', '54', null, '斤', '2019-07-16 09:46:13', '1', '1', '3');
INSERT INTO `t_goods` VALUES ('70', '1256', '90', null, '1000', '500ml', '大雪碧', '涛哥生产厂', '6', '喝就完了', '8', null, '桶', '2019-07-18 11:16:40', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('71', '4', '60', null, '6', '14', '300g装', '冰糖金桔干', '33', '13', '429', null, '盒', '2019-07-19 14:13:52', '1', '0', '2');
INSERT INTO `t_goods` VALUES ('72', '5', '50', null, '6', '14', '300g装', '冰糖金桔干', '10', '13', '130', null, '盒', '2019-07-19 14:13:52', '1', '0', '3');
INSERT INTO `t_goods` VALUES ('73', '9990', '889', '7', '88998', '240g装', '秋葵', '大连', '8', '热销', '45', '2', '袋', '2019-07-22 09:13:34', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('74', '9990', '889', '7', '88998', '240g装', '秋葵', '大连', '8', '热销', '45', '2', '袋', '2019-07-22 09:28:23', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('75', '1', null, null, null, '1', '', null, null, null, null, null, null, '2019-07-22 15:04:11', '1', '0', null);
INSERT INTO `t_goods` VALUES ('76', '1', null, null, null, '1', '', null, null, null, null, null, null, '2019-07-22 15:10:11', '1', '0', null);
INSERT INTO `t_goods` VALUES ('77', '1', null, null, null, '1', '', null, null, null, null, null, null, '2019-07-22 16:43:00', '1', '0', null);
INSERT INTO `t_goods` VALUES ('78', '1', null, null, null, '1', '', null, null, null, null, null, null, '2019-07-22 16:43:18', '1', '0', null);
INSERT INTO `t_goods` VALUES ('79', '11', null, null, null, '11', '', null, null, null, null, null, null, '2019-07-22 17:08:17', '1', '0', null);
INSERT INTO `t_goods` VALUES ('80', '1', null, null, null, '1', '', null, null, null, null, null, null, '2019-07-22 17:41:06', '1', '0', null);
INSERT INTO `t_goods` VALUES ('81', 'q', null, null, null, null, '', null, null, null, null, null, null, '2019-07-22 18:37:23', '1', '0', null);
INSERT INTO `t_goods` VALUES ('82', '9990', '889', '7', '88998', '240g装', '秋葵', '大连', '8', '热销', '45', '2', '袋', '2019-07-23 08:47:19', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('83', '9990', '889', '7', '88998', '240g装', '秋葵', '大连', '8', '热销', '45', '2', '袋', '2019-07-23 10:15:29', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('84', '9990', '889', '7', '88998', '240g装', '秋葵', '大连', '8', '热销', '45', '2', '袋', '2019-07-23 11:25:43', '1', '1', '11');
INSERT INTO `t_goods` VALUES ('85', '9990', '889', '7', '88998', '240g装', '秋葵', '大连', '8', '热销', '45', '2', '袋', '2019-07-23 11:27:26', '1', '0', '11');
INSERT INTO `t_goods` VALUES ('86', '99', '889', '7', '88998', '240g装', '电扇', '大连', '8', '热销', '45', '2', '袋', '2019-07-23 11:36:52', '1', '0', '24');
INSERT INTO `t_goods` VALUES ('87', '99', '864', '7', '88998', '240g装', '电扇', '大连', '8', '热销', '45', '2', '袋', '2019-07-24 11:38:06', '1', '0', '24');
INSERT INTO `t_goods` VALUES ('88', '99', '889', '7', '88998', '240g装', '电扇', '大连', '8', '热销', '45', '2', '袋', '2019-07-24 15:22:11', '1', '0', '24');
INSERT INTO `t_goods` VALUES ('89', '6255', '250', '10', '88998', '黑色', '电竞椅', '广东商场', '100', '热销', '200', '2', '个', '2019-07-25 10:40:49', '1', '0', '24');
INSERT INTO `t_goods` VALUES ('90', '1', null, null, null, '1', '', null, null, null, null, null, null, '2019-07-29 09:15:39', '1', '0', null);
INSERT INTO `t_goods` VALUES ('91', '1', null, null, null, '1', '', null, null, null, null, null, null, '2019-07-29 09:15:39', '1', '0', null);
INSERT INTO `t_goods` VALUES ('92', '1', null, null, null, '1', '', null, null, null, null, null, null, '2019-07-29 09:15:39', '1', '0', null);
INSERT INTO `t_goods` VALUES ('580', '1', '44445', null, '67', null, '牛奶', null, null, null, null, null, null, '2019-08-01 15:49:57', '1', '0', null);
INSERT INTO `t_goods` VALUES ('588', null, null, null, null, null, '牛奶测试测试测试测试测试测试测试', null, null, null, null, null, null, '2019-08-01 15:43:36', '1', '0', null);

-- ----------------------------
-- Table structure for `t_goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodstype
-- ----------------------------
INSERT INTO `t_goodstype` VALUES ('1', 'icon-folderOpen', '所有类别', '-1', '1', '2019-05-23 18:57:19', '1', '0');
INSERT INTO `t_goodstype` VALUES ('2', 'icon-folder', '服饰', '1', '1', '2019-05-23 18:57:22', '1', '0');
INSERT INTO `t_goodstype` VALUES ('3', 'icon-folder', '食品', '1', '1', '2019-05-23 18:57:25', '1', '0');
INSERT INTO `t_goodstype` VALUES ('4', 'icon-folder', '家电', '1', '1', '2019-05-23 18:57:30', '1', '0');
INSERT INTO `t_goodstype` VALUES ('5', 'icon-folder', '数码', '1', '1', '2019-05-23 18:57:35', '1', '1');
INSERT INTO `t_goodstype` VALUES ('6', 'icon-folder', '连衣裙', '2', '0', '2019-05-23 18:57:37', '1', '0');
INSERT INTO `t_goodstype` VALUES ('7', 'icon-folder', '男士西装', '2', '0', '2019-05-23 18:57:39', '1', '0');
INSERT INTO `t_goodstype` VALUES ('8', 'icon-folder', '牛仔裤', '2', '0', '2019-05-23 18:57:42', '1', '0');
INSERT INTO `t_goodstype` VALUES ('9', 'icon-folder', '进口食品', '3', '0', '2019-05-23 18:57:45', '1', '0');
INSERT INTO `t_goodstype` VALUES ('10', 'icon-folder', '地方特产', '3', '0', '2019-05-23 18:57:47', '1', '0');
INSERT INTO `t_goodstype` VALUES ('11', 'icon-folder', '休闲食品', '3', '0', '2019-05-23 18:57:53', '1', '0');
INSERT INTO `t_goodstype` VALUES ('12', 'icon-folder', '电视机', '4', '0', '2019-05-23 18:57:55', '1', '0');
INSERT INTO `t_goodstype` VALUES ('13', 'icon-folder', '洗衣机', '4', '0', '2019-05-23 18:58:03', '1', '0');
INSERT INTO `t_goodstype` VALUES ('14', 'icon-folder', '冰箱', '4', '0', '2019-05-23 18:58:05', '1', '0');
INSERT INTO `t_goodstype` VALUES ('15', 'icon-folder', '相机', '5', '0', '2019-05-23 18:58:08', '1', '1');
INSERT INTO `t_goodstype` VALUES ('16', 'icon-folder', '手机', '5', '0', '2019-05-23 18:58:10', '1', '1');
INSERT INTO `t_goodstype` VALUES ('17', 'icon-folder', '音箱', '5', '0', '2019-05-23 18:58:12', '1', '1');
INSERT INTO `t_goodstype` VALUES ('21', 'icon-folder', '测试', '99', '0', '2019-05-23 18:58:14', '1', '0');
INSERT INTO `t_goodstype` VALUES ('24', null, '日用百货', '1', null, null, null, '0');
INSERT INTO `t_goodstype` VALUES ('25', null, '娱乐', '1', null, null, null, '0');
INSERT INTO `t_goodstype` VALUES ('27', null, '耳机', '5', null, null, null, '1');
INSERT INTO `t_goodstype` VALUES ('30', null, '投影仪', '25', null, null, null, '0');
INSERT INTO `t_goodstype` VALUES ('34', null, '家具', '1', null, null, null, '0');
INSERT INTO `t_goodstype` VALUES ('47', null, '玩具', '1', null, '2019-06-20 15:08:54', null, '1');
INSERT INTO `t_goodstype` VALUES ('48', null, '空调', '4', null, '2019-06-20 15:10:47', null, '0');
INSERT INTO `t_goodstype` VALUES ('49', null, '洗衣粉', '24', null, '2019-06-20 15:11:42', null, '0');
INSERT INTO `t_goodstype` VALUES ('50', null, '洗衣液', '24', null, '2019-06-20 15:12:03', null, '0');
INSERT INTO `t_goodstype` VALUES ('51', null, '沙发', '34', null, '2019-06-20 15:21:29', null, '0');
INSERT INTO `t_goodstype` VALUES ('52', null, '床', '34', null, '2019-06-21 09:06:20', null, '0');
INSERT INTO `t_goodstype` VALUES ('53', null, '桌子', '34', null, '2019-06-21 09:06:50', null, '0');
INSERT INTO `t_goodstype` VALUES ('54', null, '茶几', '34', null, '2019-06-21 09:17:25', null, '0');
INSERT INTO `t_goodstype` VALUES ('94', null, '肥皂', '24', null, '2019-06-27 16:04:01', null, '0');
INSERT INTO `t_goodstype` VALUES ('95', null, '汽车', '1', null, '2019-06-27 16:04:13', null, '1');
INSERT INTO `t_goodstype` VALUES ('96', null, '肉', '3', null, '2019-06-27 16:13:29', null, '0');
INSERT INTO `t_goodstype` VALUES ('100', null, '进口商品', '1', null, '2019-06-27 16:31:52', '1', '1');
INSERT INTO `t_goodstype` VALUES ('101', null, '针织衫', '100', null, '2019-06-27 16:32:08', '1', '1');
INSERT INTO `t_goodstype` VALUES ('102', null, '电器', '1', null, '2019-07-05 08:44:49', '1', '1');
INSERT INTO `t_goodstype` VALUES ('113', null, '吸尘器', '4', null, '2019-07-05 10:22:05', null, '0');
INSERT INTO `t_goodstype` VALUES ('114', null, '肥皂', '24', null, '2019-07-05 10:23:35', null, '0');
INSERT INTO `t_goodstype` VALUES ('131', null, '奔驰', '95', null, '2019-07-08 14:18:21', '1', '1');
INSERT INTO `t_goodstype` VALUES ('135', null, '宝马', '95', null, '2019-07-08 16:25:38', '1', '1');
INSERT INTO `t_goodstype` VALUES ('136', null, '蔬菜', '11', null, '2019-07-09 14:49:54', '1', '0');
INSERT INTO `t_goodstype` VALUES ('137', null, '蔬菜', '3', null, '2019-07-09 14:50:09', '1', '1');
INSERT INTO `t_goodstype` VALUES ('138', null, '饮料', '3', null, '2019-07-09 14:50:30', '1', '1');
INSERT INTO `t_goodstype` VALUES ('139', null, '奶制品', '3', null, '2019-07-09 14:50:58', '1', '1');
INSERT INTO `t_goodstype` VALUES ('140', null, '休闲', '1', null, '2019-07-10 13:58:08', '1', '1');
INSERT INTO `t_goodstype` VALUES ('142', null, '汽车', '1', null, '2019-07-17 08:58:23', '1', '1');
INSERT INTO `t_goodstype` VALUES ('143', null, '红色', '1', null, '2019-07-17 15:39:03', '1', '1');
INSERT INTO `t_goodstype` VALUES ('144', null, '红色', '1', null, '2019-07-17 15:42:01', '1', '1');
INSERT INTO `t_goodstype` VALUES ('145', null, '红色', '1', null, '2019-07-17 16:14:50', '1', '1');
INSERT INTO `t_goodstype` VALUES ('146', null, '红色', '1', null, '2019-07-17 16:14:52', '1', '1');
INSERT INTO `t_goodstype` VALUES ('147', null, 'jkkja', '1', null, '2019-07-18 09:07:20', '1', '1');
INSERT INTO `t_goodstype` VALUES ('148', null, '酒红色', '1', null, '2019-07-18 09:10:42', '1', '1');
INSERT INTO `t_goodstype` VALUES ('149', null, null, '22', null, '2019-07-31 13:24:36', null, null);
INSERT INTO `t_goodstype` VALUES ('150', null, null, '22', null, '2019-07-31 13:25:39', null, '0');
INSERT INTO `t_goodstype` VALUES ('151', null, null, '22', null, '2019-07-31 16:46:39', null, '0');
INSERT INTO `t_goodstype` VALUES ('152', null, null, '22', null, '2019-07-31 16:50:43', null, '0');
INSERT INTO `t_goodstype` VALUES ('153', null, null, '22', null, '2019-07-31 16:55:11', null, '0');
INSERT INTO `t_goodstype` VALUES ('154', null, null, '22', null, '2019-07-31 16:57:02', null, '0');
INSERT INTO `t_goodstype` VALUES ('155', null, null, '22', null, '2019-07-31 16:58:57', null, '0');
INSERT INTO `t_goodstype` VALUES ('156', null, null, '22', null, '2019-07-31 17:00:30', null, '0');
INSERT INTO `t_goodstype` VALUES ('157', null, null, '22', null, '2019-07-31 17:01:20', null, '0');
INSERT INTO `t_goodstype` VALUES ('158', null, null, '22', null, '2019-07-31 17:21:56', null, '0');
INSERT INTO `t_goodstype` VALUES ('159', null, null, '22', null, '2019-07-31 17:23:02', null, '0');
INSERT INTO `t_goodstype` VALUES ('160', null, null, '22', null, '2019-08-01 10:35:27', null, '0');
INSERT INTO `t_goodstype` VALUES ('200', null, '装修', null, null, '2019-08-01 14:44:52', null, null);
INSERT INTO `t_goodstype` VALUES ('201', null, '宝马', '95', null, '2019-08-01 14:44:52', '1', '0');

-- ----------------------------
-- Table structure for `t_goodsunit`
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsunit`;
CREATE TABLE `t_goodsunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsunit
-- ----------------------------
INSERT INTO `t_goodsunit` VALUES ('1', '个', '2019-05-24 08:23:59', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('2', '袋', '2019-05-24 08:24:02', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('3', '盒', '2019-05-24 08:24:04', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('4', '箱', '2019-05-24 08:24:06', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('5', '台', '2019-05-24 08:24:08', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('6', '包', '2019-05-24 08:24:12', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('11', '件', '2019-05-24 08:24:16', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('12', '条', '2019-05-24 08:24:19', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('13', '新', '2019-05-24 08:24:21', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('14', '瓶', '2019-05-24 11:01:36', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('53', '桶', '2019-06-27 13:36:45', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('54', '盆', '2019-06-27 13:36:45', '1', '0');
INSERT INTO `t_goodsunit` VALUES ('55', '斤', '2019-06-27 13:36:45', '1', '0');

-- ----------------------------
-- Table structure for `t_goods_check`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_check`;
CREATE TABLE `t_goods_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checknumber` varchar(15) DEFAULT NULL,
  `stocknum` int(11) DEFAULT NULL,
  `result` varchar(2) DEFAULT NULL,
  `checknum` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `memo` varchar(30) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `delflag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_check
-- ----------------------------
INSERT INTO `t_goods_check` VALUES ('11', 'PD201907020001', '-1', '是', '12', '1', '', '2019-07-02 14:09:01', '0');
INSERT INTO `t_goods_check` VALUES ('12', 'PD201907020002', '12', '是', '8', '1', ' ', '2019-07-02 14:10:00', '0');
INSERT INTO `t_goods_check` VALUES ('13', 'PD201907040001', '2', '否', '90', '1', ' ', '2019-07-04 17:52:05', '0');
INSERT INTO `t_goods_check` VALUES ('14', 'PD201907110001', '12', '是', '12', '1', ' ', '2019-07-11 10:11:03', '0');
INSERT INTO `t_goods_check` VALUES ('15', 'PD201907110002', '62', '是', '12', '1', ' ', '2019-07-11 10:11:52', '0');
INSERT INTO `t_goods_check` VALUES ('16', 'PD201907110003', '9000', '是', '12', '1', '', '2019-07-11 10:11:58', '0');
INSERT INTO `t_goods_check` VALUES ('17', 'PD201907110004', '9', '是', '12', '1', ' ', '2019-07-11 10:27:52', '0');
INSERT INTO `t_goods_check` VALUES ('18', 'PD201907110005', '8', '是', '12', '1', ' ', '2019-07-11 10:29:36', '0');
INSERT INTO `t_goods_check` VALUES ('19', 'PD201907120001', '12', '是', '12', '1', '', '2019-07-12 09:31:33', '0');
INSERT INTO `t_goods_check` VALUES ('20', 'PD201907120002', '521', '是', '12', '1', '  ', '2019-07-12 09:39:42', '0');
INSERT INTO `t_goods_check` VALUES ('27', 'PD201971720034', '100', '是', '23', '1', '', '2019-07-19 15:46:23', '0');
INSERT INTO `t_goods_check` VALUES ('28', 'PD201971720035', '101', '否', '24', '1', '', '2019-07-19 15:46:23', '0');
INSERT INTO `t_goods_check` VALUES ('29', 'PD201971720036', '102', '是', '25', '1', ' ', '2019-07-19 15:46:23', '0');
INSERT INTO `t_goods_check` VALUES ('30', 'PD201907220001', '10210', '是', '48', '1', '', '2019-07-22 16:46:33', '0');
INSERT INTO `t_goods_check` VALUES ('35', 'PD201972320034', '1000', '是', '100', '1', '   ', '2019-07-24 11:09:55', '0');
INSERT INTO `t_goods_check` VALUES ('36', 'PD201972320035', '2000', '是', '200', '1', '', '2019-07-24 11:09:55', '0');
INSERT INTO `t_goods_check` VALUES ('37', 'PD201907240001', '938', '是', '4', '1', '', '2019-07-24 16:55:24', '0');
INSERT INTO `t_goods_check` VALUES ('62', 'PD201972520034', '1000', '是', '100', '1', '', '2019-07-25 11:33:23', '0');
INSERT INTO `t_goods_check` VALUES ('63', 'PD201972520037', '2000', '是', '200', '1', '', '2019-07-25 11:33:23', '0');
INSERT INTO `t_goods_check` VALUES ('64', 'PD201907260001', '748', '是', '12', '1', ' ', '2019-07-26 09:31:10', '0');

-- ----------------------------
-- Table structure for `t_goods_check_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_check_list`;
CREATE TABLE `t_goods_check_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `marketnum` int(11) DEFAULT NULL,
  `returnnum` int(11) DEFAULT NULL,
  `stocknum` int(11) DEFAULT NULL,
  `unit` varchar(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `result` varchar(2) DEFAULT NULL,
  `memo` varchar(50) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `goodscheckid` int(11) DEFAULT NULL,
  `delflag` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_check_list
-- ----------------------------
INSERT INTO `t_goods_check_list` VALUES ('23', '0019', '28', 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', '5', '1', '2', '3', '台', '17', '1', '是', '', '2019-07-02 14:09:31', '11', '0');
INSERT INTO `t_goods_check_list` VALUES ('24', '0018', '27', 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', '7', '0', '0', '-1', '台', '15', '1', '是', '', '2019-07-02 14:09:31', '11', '0');
INSERT INTO `t_goods_check_list` VALUES ('25', '0020', '29', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', '8', '0', '0', '0', '台', '14', '1', '是', '', '2019-07-02 14:10:01', '12', '0');
INSERT INTO `t_goods_check_list` VALUES ('26', '0017', '26', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', '9', '0', '0', '1', '台', '15', '1', '否', '11', '2019-07-04 17:52:05', '13', '0');
INSERT INTO `t_goods_check_list` VALUES ('27', '0018', '27', 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', '78', '0', '0', '1', '台', '15', '1', '否', '12', '2019-07-04 17:52:05', '13', '0');
INSERT INTO `t_goods_check_list` VALUES ('28', '0019', '28', 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', '3', '0', '1', '0', '台', '17', '1', '否', '13', '2019-07-04 17:52:05', '13', '0');
INSERT INTO `t_goods_check_list` VALUES ('29', '0034', '43', 'TCL-1000-12623', 'TCL电视', '0', '0', '0', '0', '台', '15', '1', '是', '', '2019-07-11 10:11:03', '14', '0');
INSERT INTO `t_goods_check_list` VALUES ('30', '0015', '24', 'X', 'iPhone X', '0', '0', '0', '62', '台', '16', '1', '是', '', '2019-07-11 10:11:53', '15', '0');
INSERT INTO `t_goods_check_list` VALUES ('31', '0022', '31', 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', '0', '0', '0', '9000', '台', '13', '1', '是', '', '2019-07-11 10:11:58', '16', '0');
INSERT INTO `t_goods_check_list` VALUES ('32', '0039', '48', '200g', '大冰棍', '0', '0', '0', '9', '个', '11', '1', '是', '', '2019-07-11 10:27:52', '17', '0');
INSERT INTO `t_goods_check_list` VALUES ('33', '0041', '50', '500ml', '可口可乐', '0', '0', '0', '8', '个', '10', '1', '是', '', '2019-07-11 10:29:36', '18', '0');
INSERT INTO `t_goods_check_list` VALUES ('34', '0025', '34', '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', '0', '0', '0', '521', '件', '7', '1', '是', '', '2019-07-12 09:39:42', '20', '0');
INSERT INTO `t_goods_check_list` VALUES ('35', '0035', '44', '100g', '呀土豆', '23', '0', '0', '5000', '袋', '11', '1', '是', '', '2019-07-22 16:46:34', '30', null);
INSERT INTO `t_goods_check_list` VALUES ('36', '0025', '34', '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', '25', '0', '0', '5210', '件', '7', '1', '是', '', '2019-07-22 16:46:34', '30', null);
INSERT INTO `t_goods_check_list` VALUES ('42', '0056', '56', '500g', '大枣', '0', '0', '0', '938', '斤', '11', '1', '是', '', '2019-07-24 16:55:25', '37', null);
INSERT INTO `t_goods_check_list` VALUES ('43', '0019', '100', 'QB', '音响', '12', '23', '34', '45', '台', '100', '1', '是', '', '2019-07-25 11:33:23', '62', null);
INSERT INTO `t_goods_check_list` VALUES ('44', '0018', '100', 'IXUS', '相机', '12', '24', '35', '46', '台', '100', '1', '是', '', '2019-07-25 11:33:23', '62', null);
INSERT INTO `t_goods_check_list` VALUES ('45', '0020', '100', 'ICEL', '冰箱', '12', '25', '36', '47', '台', '100', '1', '是', '', '2019-07-25 11:33:23', '62', null);
INSERT INTO `t_goods_check_list` VALUES ('46', '0019', '100', 'QB', '音响', '12', '23', '34', '45', '台', '100', '1', '是', '', '2019-07-25 11:33:23', '63', null);
INSERT INTO `t_goods_check_list` VALUES ('47', '0018', '100', 'IXUS', '相机', '12', '24', '35', '46', '台', '100', '1', '是', '', '2019-07-25 11:33:23', '63', null);
INSERT INTO `t_goods_check_list` VALUES ('48', '0020', '100', 'ICEL', '冰箱', '12', '25', '36', '47', '台', '100', '1', '是', '', '2019-07-25 11:33:23', '63', null);
INSERT INTO `t_goods_check_list` VALUES ('49', '0099', '53', '100g', '冰咖啡', '0', '0', '0', '748', '瓶', '11', '1', '是', '', '2019-07-26 09:31:10', '64', null);

-- ----------------------------
-- Table structure for `t_goods_color`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_color`;
CREATE TABLE `t_goods_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品颜色主键',
  `tid` int(11) DEFAULT NULL COMMENT '商品类型id',
  `name` varchar(20) DEFAULT NULL COMMENT '商品颜色',
  `price` double(10,0) DEFAULT NULL COMMENT '价格',
  `userid` int(11) DEFAULT NULL COMMENT '操作者id',
  `delflag` int(11) DEFAULT NULL COMMENT '删除记录',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_color
-- ----------------------------
INSERT INTO `t_goods_color` VALUES ('1', '16', '幻夜黑', '0', '1', '0', '2019-06-28 09:09:13');
INSERT INTO `t_goods_color` VALUES ('2', '16', '幻夜蓝', '100', '1', '0', '2019-06-28 09:10:35');
INSERT INTO `t_goods_color` VALUES ('3', '16', '深空灰', '100', '1', '0', '2019-06-28 09:15:40');
INSERT INTO `t_goods_color` VALUES ('4', '16', '热情红', '200', '1', '0', '2019-06-28 09:16:23');
INSERT INTO `t_goods_color` VALUES ('5', '15', '黑色', '0', '1', '0', '2019-06-28 09:17:06');
INSERT INTO `t_goods_color` VALUES ('6', '15', '白色', '100', '1', '0', '2019-06-28 09:17:25');
INSERT INTO `t_goods_color` VALUES ('7', '15', '银色', '100', '1', '0', '2019-06-28 09:17:44');
INSERT INTO `t_goods_color` VALUES ('8', '2', '红色', '13', '1', '0', '2019-07-01 15:15:31');
INSERT INTO `t_goods_color` VALUES ('9', '2', '绿色', '15', '1', '0', '2019-07-15 15:15:56');
INSERT INTO `t_goods_color` VALUES ('10', '2', '白色', '12', '1', '0', '2019-05-27 16:28:44');
INSERT INTO `t_goods_color` VALUES ('11', '2', '蓝色', '20', '1', '0', '2019-06-26 16:29:57');
INSERT INTO `t_goods_color` VALUES ('12', '3', '包装色', '50', '1', '0', '2019-06-26 16:33:42');
INSERT INTO `t_goods_color` VALUES ('13', '4', '银灰色', '1200', '1', '0', '2019-07-12 15:02:41');
INSERT INTO `t_goods_color` VALUES ('14', '5', '黑色', '200', '1', '0', '2019-06-24 15:45:22');
INSERT INTO `t_goods_color` VALUES ('15', '6', '碎花', '60', '1', '0', '2019-06-25 15:45:28');
INSERT INTO `t_goods_color` VALUES ('16', '6', '刺绣', '60', '1', '0', '2019-06-26 15:45:32');
INSERT INTO `t_goods_color` VALUES ('17', '6', '纯白', '60', '1', '0', '2019-06-27 15:45:36');
INSERT INTO `t_goods_color` VALUES ('18', '7', '黑', '100', '1', '0', '2019-06-28 15:45:39');
INSERT INTO `t_goods_color` VALUES ('19', '7', '灰', '100', '1', '0', '2019-06-29 15:45:43');
INSERT INTO `t_goods_color` VALUES ('20', '8', '深蓝', '30', '1', '0', '2019-06-30 15:45:46');
INSERT INTO `t_goods_color` VALUES ('21', '8', '浅蓝', '30', '1', '0', '2019-07-01 15:45:50');
INSERT INTO `t_goods_color` VALUES ('22', '9', '红', '30', '1', '0', '2019-07-02 15:45:57');
INSERT INTO `t_goods_color` VALUES ('23', '10', '墨绿', '75', '1', '0', '2019-07-03 15:46:01');
INSERT INTO `t_goods_color` VALUES ('24', '11', '海蓝', '100', '1', '0', '2019-07-04 15:46:05');
INSERT INTO `t_goods_color` VALUES ('25', '12', '黑', '90', '1', '0', '2019-07-30 11:05:52');
INSERT INTO `t_goods_color` VALUES ('26', '13', '银灰', '80', '1', '0', '2019-07-30 11:05:55');
INSERT INTO `t_goods_color` VALUES ('27', '14', '红', '80', '1', '0', '2019-07-30 11:05:58');
INSERT INTO `t_goods_color` VALUES ('28', '14', '黑', '50', '1', '0', '2019-07-30 11:06:01');
INSERT INTO `t_goods_color` VALUES ('29', '14', '银灰', '30', '1', '0', '2019-07-30 11:06:03');
INSERT INTO `t_goods_color` VALUES ('30', '17', '黑', '15', '1', '0', '2019-07-30 11:06:06');
INSERT INTO `t_goods_color` VALUES ('31', '27', '白', '15', '1', '0', '2019-07-30 11:06:22');
INSERT INTO `t_goods_color` VALUES ('32', '27', '黑', '15', '1', '0', '2019-07-03 11:06:25');
INSERT INTO `t_goods_color` VALUES ('33', '27', '红', '72', '1', '0', '2019-07-30 11:06:30');
INSERT INTO `t_goods_color` VALUES ('34', '48', '白', '45', '1', '0', '2019-07-02 11:06:34');
INSERT INTO `t_goods_color` VALUES ('35', '48', '红', '32', '1', '0', '2019-07-04 11:06:38');
INSERT INTO `t_goods_color` VALUES ('36', '52', '天蓝', '430', '1', '0', '2019-07-05 11:06:41');
INSERT INTO `t_goods_color` VALUES ('37', '52', '樱花粉', '300', '1', '0', '2019-07-03 11:07:43');
INSERT INTO `t_goods_color` VALUES ('38', '52', '暖黄', '225', '1', '0', '2019-07-02 11:07:47');
INSERT INTO `t_goods_color` VALUES ('39', '94', '玫瑰紫', '10', '1', '0', '2019-07-08 11:07:51');
INSERT INTO `t_goods_color` VALUES ('40', '94', '樱空粉', '10', '1', '0', '2019-07-17 11:07:54');
INSERT INTO `t_goods_color` VALUES ('41', '9', '炫紫', '3000', '1', '0', '2019-05-16 11:07:57');
INSERT INTO `t_goods_color` VALUES ('42', '9', '酒红', '3000', '1', '0', '2019-04-10 11:08:03');
INSERT INTO `t_goods_color` VALUES ('43', '9', '银灰', '3000', '1', '0', '2019-05-23 11:08:10');
INSERT INTO `t_goods_color` VALUES ('44', '9', '深黑', '3000', '1', '0', '2019-05-31 11:08:16');
INSERT INTO `t_goods_color` VALUES ('45', '10', '白', '10', '1', '0', '2019-04-25 11:08:23');
INSERT INTO `t_goods_color` VALUES ('46', '10', '橙色', '45', '1', '0', '2019-03-28 11:08:30');
INSERT INTO `t_goods_color` VALUES ('47', '10', '浅绿', '32', '1', '0', '2019-03-20 11:08:37');
INSERT INTO `t_goods_color` VALUES ('48', '9', '天蓝', '30', '1', '0', '2019-07-17 15:34:52');
INSERT INTO `t_goods_color` VALUES ('49', '12', '无', '60', '1', '0', '2019-07-19 13:56:38');
INSERT INTO `t_goods_color` VALUES ('50', '40', '酒红', '60', '1', '0', '2019-07-19 13:58:12');
INSERT INTO `t_goods_color` VALUES ('51', '2', '灰', '12', '1', '0', '2019-07-25 11:39:18');
INSERT INTO `t_goods_color` VALUES ('52', '2', '灰', '12', '1', '0', '2019-07-25 11:40:17');

-- ----------------------------
-- Table structure for `t_goods_model`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_model`;
CREATE TABLE `t_goods_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_model
-- ----------------------------
INSERT INTO `t_goods_model` VALUES ('1', '16', ' 8GB', '4500', '1', '0', '2019-07-23 14:41:32');
INSERT INTO `t_goods_model` VALUES ('2', '16', '32GB', '6000', '1', '0', '2019-07-23 14:41:32');
INSERT INTO `t_goods_model` VALUES ('3', '2', 'XL', '400', '1', '0', '2019-07-23 14:41:32');
INSERT INTO `t_goods_model` VALUES ('4', '2', 'L', '400', '1', '0', '2019-07-23 14:41:54');
INSERT INTO `t_goods_model` VALUES ('5', '2', 'M', '400', '1', '0', '2019-07-23 14:41:54');
INSERT INTO `t_goods_model` VALUES ('6', '3', '500g', '20', '1', '0', '2019-07-23 14:41:54');
INSERT INTO `t_goods_model` VALUES ('7', '3', '1000g', '40', '1', '0', '2019-07-23 14:45:28');
INSERT INTO `t_goods_model` VALUES ('8', '4', '16寸', '3000', '1', '0', '2019-07-23 14:45:29');
INSERT INTO `t_goods_model` VALUES ('9', '4', '32寸', '4500', '1', '0', '2019-07-23 14:45:29');
INSERT INTO `t_goods_model` VALUES ('10', '2', 'XL', '400', '1', '0', '2019-07-31 09:29:49');
INSERT INTO `t_goods_model` VALUES ('14', '2', 'XL', '400', '1', '0', '2019-07-31 09:40:12');

-- ----------------------------
-- Table structure for `t_goods_more`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_more`;
CREATE TABLE `t_goods_more` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_more
-- ----------------------------
INSERT INTO `t_goods_more` VALUES ('1', '16', '1', '1', '1', '0', '2019-07-01 09:23:13');
INSERT INTO `t_goods_more` VALUES ('2', '16', '2', '1', '1', '0', '2019-07-01 09:23:16');
INSERT INTO `t_goods_more` VALUES ('3', '16', '3', '1', '1', '0', '2019-07-01 09:23:19');
INSERT INTO `t_goods_more` VALUES ('4', '16', '4', '1', '1', '0', '2019-07-01 09:23:23');
INSERT INTO `t_goods_more` VALUES ('5', '16', '5', '1', '1', '0', '2019-07-01 09:23:27');
INSERT INTO `t_goods_more` VALUES ('6', '16', '6', '1', '1', '0', '2019-07-01 09:23:31');
INSERT INTO `t_goods_more` VALUES ('7', '16', '1', '2', '1', '0', '2019-07-01 09:23:37');
INSERT INTO `t_goods_more` VALUES ('8', '16', '2', '2', '1', '0', '2019-07-01 09:23:40');
INSERT INTO `t_goods_more` VALUES ('9', '16', '3', '2', '1', '0', '2019-07-01 09:23:44');
INSERT INTO `t_goods_more` VALUES ('10', '16', '4', '2', '1', '0', '2019-07-01 09:23:48');
INSERT INTO `t_goods_more` VALUES ('11', '16', '5', '2', '1', '0', '2019-07-01 09:23:52');
INSERT INTO `t_goods_more` VALUES ('12', '16', '6', '2', '1', '0', '2019-07-01 09:23:57');
INSERT INTO `t_goods_more` VALUES ('13', '16', '1', '3', '1', '0', '2019-07-01 09:24:02');
INSERT INTO `t_goods_more` VALUES ('14', '16', '2', '3', '1', '0', '2019-07-01 09:24:05');
INSERT INTO `t_goods_more` VALUES ('15', '16', '3', '3', '1', '0', '2019-07-01 09:24:09');
INSERT INTO `t_goods_more` VALUES ('16', '16', '4', '3', '1', '0', '2019-07-01 09:24:12');
INSERT INTO `t_goods_more` VALUES ('17', '16', '5', '3', '1', '0', '2019-07-01 09:24:16');
INSERT INTO `t_goods_more` VALUES ('18', '16', '6', '3', '1', '0', '2019-07-01 09:24:26');
INSERT INTO `t_goods_more` VALUES ('19', '16', '1', '4', '1', '0', '2019-07-01 09:24:35');
INSERT INTO `t_goods_more` VALUES ('20', '16', '2', '4', '1', '0', '2019-07-01 09:24:38');
INSERT INTO `t_goods_more` VALUES ('21', '16', '3', '4', '1', '0', '2019-07-01 09:24:45');
INSERT INTO `t_goods_more` VALUES ('22', '16', '4', '4', '1', '0', '2019-07-01 09:24:49');
INSERT INTO `t_goods_more` VALUES ('23', '16', '5', '4', '1', '0', '2019-07-01 09:24:51');
INSERT INTO `t_goods_more` VALUES ('24', '16', '6', '4', '1', '0', '2019-07-01 09:24:57');

-- ----------------------------
-- Table structure for `t_goods_picture`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_picture`;
CREATE TABLE `t_goods_picture` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgoodsid` int(10) DEFAULT NULL,
  `pictureurl` varchar(100) DEFAULT NULL,
  `delflag` int(10) unsigned zerofill DEFAULT '0000000000',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_picture
-- ----------------------------
INSERT INTO `t_goods_picture` VALUES ('4', '89', '/upload/20190730115207.jpg', '0000000000', '2019-07-30 11:54:01');
INSERT INTO `t_goods_picture` VALUES ('5', '88', '/upload/20190730143518.jpg', '0000000000', '2019-07-30 14:37:13');
INSERT INTO `t_goods_picture` VALUES ('6', '88', '/upload/20190730144406.jpg', '0000000000', '2019-07-30 14:46:01');
INSERT INTO `t_goods_picture` VALUES ('7', '89', '/upload/20190730144623.jpg', '0000000000', '2019-07-30 14:48:18');
INSERT INTO `t_goods_picture` VALUES ('8', '88', '/upload/20190730160253.jpg', '0000000000', '2019-07-30 16:04:47');

-- ----------------------------
-- Table structure for `t_goods_price_update`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_price_update`;
CREATE TABLE `t_goods_price_update` (
  `id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(50) DEFAULT NULL,
  `inventoryquantity` int(11) DEFAULT NULL,
  `lastpurchasingprice` float(200,0) DEFAULT NULL,
  `minnum` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `producer` varchar(200) DEFAULT NULL,
  `purchasingprice` float(200,0) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `sellingprice` float(200,0) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` int(10) DEFAULT NULL,
  `typeid` int(10) DEFAULT NULL,
  `priceupdaterid` int(11) DEFAULT NULL,
  `priceupdatetime` datetime DEFAULT NULL,
  `priceupdateid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_price_update
-- ----------------------------
INSERT INTO `t_goods_price_update` VALUES ('1', '0001', '171', '8', '1001', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '贵州省贵阳南明老干妈风味的食品有限公司', '7', '好卖又好吃', '8', '2', '瓶', '2019-05-22 08:59:38', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('2', '0002', '140', '2220', '400', 'Note8', '华为荣耀Note9', '华为计算机系统有限公司', '1955', '热销', '2200', '2', '台', '2019-05-22 08:59:38', '1', '0', '16', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('11', '0003', '2735', '22', '400', '500g装', '野生东北黑木耳', '辉南县博康土特产有限公司', '23', '够黑2', '38', '2', '袋', '2019-05-22 08:59:47', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('12', '0004', '315', '13', '300', '2斤装', '新疆红枣', '沧州铭鑫食品有限公司', '13', '好吃', '25', '2', '袋', '2019-05-22 08:59:51', '1', '0', '10', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('13', '0005', '53', '8', '1000', '散装500克', '麦片燕麦巧克力', '福建省麦德好食品工业有限公司', '8', 'Goods', '15', '2', '袋', '2019-05-22 08:59:54', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('14', '0006', '17', '4', '1999', '300g装', '冰糖金桔干', '揭西县同心食品有限公司', '5', '', '13', '2', '盒', '2019-05-22 08:59:58', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('15', '0007', '100650', '4', '400', '500g装', '吉利人家牛肉味蛋糕', '合肥吉利人家食品有限公司', '4', 'good', '10', '2', '袋', '2019-05-22 09:00:01', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('16', '0008', '197', '2', '500', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '潮州市潮安区正大食品有限公司', '3', '', '10', '2', '盒', '2019-05-22 09:00:06', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('17', '0009', '371', '20', '1000', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '石家庄博群食品有限公司', '20', '', '33', '2', '袋', '2019-05-22 09:00:09', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('18', '0010', '9', '12', '300', '250g装', '劲仔小鱼干', '湖南省华文食品有限公司', '12', '', '20', '2', '袋', '2019-05-22 09:00:12', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('19', '0011', '12', '3', '300', '198g装', '山楂条', '临朐县七贤升利食品厂', '3', '', '10', '2', '袋', '2019-05-22 09:00:16', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('20', '0012', '23', '20', '200', '500g装', '大乌梅干', '长春市鼎丰真食品有限责任公司', '20', '', '25', '2', '袋', '2019-05-22 09:00:18', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('21', '0013', '400', '3', '100', '250g装', '手工制作芝麻香酥麻通', '桂林兰雨食品有限公司', '3', '', '8', '2', '袋', '2019-05-22 09:00:22', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('22', '0014', '12', '5', '200', '250g装', '美国青豆原味 蒜香', '菲律宾', '5', '', '8', '2', '袋', '2019-05-22 09:01:07', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('24', '0015', '47', '8000', '100', 'X', ' iPhone X', 'xx2', '8000', 'xxx2', '9500', '2', '台', '2019-05-22 09:01:10', '1', '0', '16', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('25', '0016', '0', '103', '12', 'X', '21', '32', '103', '21', '120', '0', '盒', '2019-05-22 09:01:12', '1', '0', '3', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('26', '0017', '-1', '3000', '100', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', 'xxx', '3000', 'xxx', '3650', '2', '台', '2019-05-22 09:01:15', '1', '0', '15', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('27', '0018', '-1', '800', '400', 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', 'xx', '800', 'xxx', '1299', '2', '台', '2019-05-22 09:01:20', '1', '0', '15', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('28', '0019', '0', '60', '300', 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', 'xxxx', '60', '', '129', '0', '台', '2019-05-22 09:01:22', '1', '0', '17', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('29', '0020', '0', '1000', '50', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', 'cc', '1000', '', '1699', '0', '台', '2019-05-22 09:01:27', '1', '0', '14', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('30', '0021', '1000', '721', '320', '4A ', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', 'cc', '721', '', '1199', '0', '台', '2019-05-22 09:01:30', '1', '0', '12', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('31', '0022', '0', '400', '40', 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', 'cc', '400', '', '729', '0', '台', '2019-05-22 09:01:55', '1', '0', '13', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('32', '0023', '8', '5', '1000', '80g*2', '台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2', 'cc', '4', '', '15', '2', '袋', '2019-05-22 09:01:58', '1', '0', '9', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('33', '0024', '140', '180', '10', 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', 'cc', '172', '', '298', '2', '件', '2019-05-22 09:02:01', '1', '0', '6', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('34', '0025', '0', '189', '10', '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', 'cc', '189', '', '299', '0', '件', '2019-05-22 09:02:04', '1', '0', '7', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('35', '0026', '2', '60', '10', 'AFS JEEP', '加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子', 'c', '60', '', '89', '2', '条', '2019-05-22 09:02:06', '1', '0', '8', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('36', '0027', '2', '2', '5', '500ml', '娃哈哈', '哇哈啊哈厂', '1', null, '3', null, '瓶', '2019-05-23 11:13:03', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('37', '0028', '11', '555', '111', '111', '1', '1', '1', '1', '70', '1', '', '2019-05-23 15:45:43', '1', '0', '6', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('40', '0029', '20', '212', '23', '70g装', '德芙', '巧克力工厂', '9', '', '10', null, '条', '2019-06-18 13:46:33', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('41', '0030', '100', null, '10', '100g', '饼', '大连食品厂', '2', '好吃', '5', null, '个', '2019-06-18 14:46:51', '1', '0', '10', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('42', '0033', null, null, '30', '', '草莓', '农夫山庄', '20', '', null, null, '斤', '2019-06-18 14:58:15', '1', '1', '12', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('43', '0034', null, null, '10', 'TCL-1000-12623', 'TCL电视', 'TCL有限公司', '5000', '好好好', '6999', null, '台', '2019-06-18 15:39:44', '1', '0', '15', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('44', '0035', null, null, '100', '100g', '呀土豆', '好丽友', '2', '好吃', '3', null, '袋', '2019-06-18 15:51:34', '1', '1', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('45', '0036', null, null, '40', '', '精油', '阿芙', '20', '薰衣草味道', null, null, '盒', '2019-06-20 08:41:42', '1', '1', '24', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('46', '0037', null, null, '10', '', '碎碎冰', '旺仔', '3', '和夏天更配哦', null, null, '条', '2019-06-20 08:44:27', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('47', '0038', null, null, '5', '150g', '可爱多冰淇淋', '雀巢有限公司', '3', '', '5', null, '个', '2019-06-25 14:31:33', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('48', '0039', null, null, '5', '200g', '大冰棍', '德式', '3', '', '5', null, '个', '2019-06-27 11:21:30', '1', '0', '11', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('49', '0040', null, null, '2', '500g', '苹果', '大连特产', '2', '哈哈', '3', null, '个', '2019-06-27 13:10:42', '1', '0', '10', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('50', '0041', null, null, '3', '500ml', '可口可乐', '可口可乐有限公司', '2', '哈哈', '3', null, '个', '2019-06-27 14:44:41', '1', '0', '10', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('51', '0042', null, null, '3', '500ml', '雪碧', '可口可乐有限公司', '2', '哈哈', '3', null, '个', '2019-06-27 14:44:41', '1', '0', '10', null, null, null);
INSERT INTO `t_goods_price_update` VALUES ('52', '0043', null, null, '3', '500ml', '芬达', '可口可乐有限公司', '2', '哈哈', '3', null, '个', '2019-06-27 14:44:41', '1', '0', '10', null, null, null);

-- ----------------------------
-- Table structure for `t_goods_price_update_note`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_price_update_note`;
CREATE TABLE `t_goods_price_update_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `goodsname` varchar(255) DEFAULT NULL,
  `beforeupdateprice` float DEFAULT NULL,
  `afterupdateprice` float DEFAULT NULL,
  `userid` int(30) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_price_update_note
-- ----------------------------
INSERT INTO `t_goods_price_update_note` VALUES ('1', '1', '陶华碧老干妈香辣脆油牛肉粒', '8', '18', '1', '2019-07-05 14:45:45');
INSERT INTO `t_goods_price_update_note` VALUES ('2', '1', '陶华碧老干妈香辣脆油牛肉粒', '8', '18', '1', '2019-07-05 15:28:39');
INSERT INTO `t_goods_price_update_note` VALUES ('3', '1', '陶华碧老干妈香辣脆油牛肉粒', '8', '12', '1', '2019-07-05 15:31:08');
INSERT INTO `t_goods_price_update_note` VALUES ('4', '1', '陶华碧老干妈香辣脆油牛肉粒', '8', '13', '1', '2019-07-05 15:33:49');
INSERT INTO `t_goods_price_update_note` VALUES ('5', '1', '陶华碧老干妈香辣脆油牛肉粒', '8', '12', '1', '2019-07-05 15:36:27');
INSERT INTO `t_goods_price_update_note` VALUES ('6', '1', '陶华碧老干妈香辣脆油牛肉粒', '8', '12', '1', '2019-07-05 15:39:20');
INSERT INTO `t_goods_price_update_note` VALUES ('7', '1', '陶华碧老干妈香辣脆油牛肉粒', '8', '1333', '1', '2019-07-05 15:40:06');
INSERT INTO `t_goods_price_update_note` VALUES ('8', '1', '陶华碧老干妈香辣脆油牛肉粒', '8', '5888', '1', '2019-07-05 15:53:31');
INSERT INTO `t_goods_price_update_note` VALUES ('9', '1', '陶华碧老干妈香辣脆油牛肉粒', '5888', '1888', '1', '2019-07-05 16:08:16');
INSERT INTO `t_goods_price_update_note` VALUES ('10', '1', '陶华碧老干妈香辣脆油牛肉粒', '1888', '188', '1', '2019-07-05 16:13:09');
INSERT INTO `t_goods_price_update_note` VALUES ('11', '1', '陶华碧老干妈香辣脆油牛肉粒', '188', '68', '1', '2019-07-05 16:14:45');
INSERT INTO `t_goods_price_update_note` VALUES ('12', '1', '陶华碧老干妈香辣脆油牛肉粒', '68', '19', '1', '2019-07-05 16:16:14');
INSERT INTO `t_goods_price_update_note` VALUES ('13', '2', '华为荣耀Note9', '8888', '7778', '1', '2019-07-05 16:16:48');
INSERT INTO `t_goods_price_update_note` VALUES ('14', '1', '陶华碧老干妈香辣脆油牛肉粒', '19', '17', '1', '2019-07-08 09:55:10');
INSERT INTO `t_goods_price_update_note` VALUES ('15', '1', '陶华碧老干妈香辣脆油牛肉粒测试', '17', '18', '1', '2019-07-08 14:04:52');
INSERT INTO `t_goods_price_update_note` VALUES ('16', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '18', '17', '1', '2019-07-09 12:05:42');
INSERT INTO `t_goods_price_update_note` VALUES ('17', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '17', '12', '1', '2019-07-10 09:35:19');
INSERT INTO `t_goods_price_update_note` VALUES ('18', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '12', '22', '1', '2019-07-10 10:22:17');
INSERT INTO `t_goods_price_update_note` VALUES ('19', '2', '华为荣耀Note9', '7778', '22222', '1', '2019-07-10 10:44:13');
INSERT INTO `t_goods_price_update_note` VALUES ('20', '2', '华为荣耀Note9', '22222', '22211', '1', '2019-07-11 09:29:56');
INSERT INTO `t_goods_price_update_note` VALUES ('21', '2', '华为荣耀Note9', '22211', '2222', '1', '2019-07-11 10:10:08');
INSERT INTO `t_goods_price_update_note` VALUES ('22', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '22', '23', '1', '2019-07-15 14:18:18');
INSERT INTO `t_goods_price_update_note` VALUES ('23', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '23', '2', '1', '2019-07-16 10:20:16');
INSERT INTO `t_goods_price_update_note` VALUES ('24', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '2', '22', '1', '2019-07-16 10:20:52');
INSERT INTO `t_goods_price_update_note` VALUES ('25', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '2', '23', '1', '2019-07-16 10:21:45');
INSERT INTO `t_goods_price_update_note` VALUES ('26', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '23', '24', '1', '2019-07-18 09:17:53');
INSERT INTO `t_goods_price_update_note` VALUES ('27', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '24', '2', '1', '2019-07-18 14:20:00');
INSERT INTO `t_goods_price_update_note` VALUES ('36', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '12', '2342', '1', '2019-07-19 14:40:01');
INSERT INTO `t_goods_price_update_note` VALUES ('37', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '2342', '22131', '1', '2019-07-19 14:41:10');
INSERT INTO `t_goods_price_update_note` VALUES ('38', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '22131', '123', '1', '2019-07-19 14:50:06');
INSERT INTO `t_goods_price_update_note` VALUES ('39', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '123', '1234', '1', '2019-07-19 14:56:59');
INSERT INTO `t_goods_price_update_note` VALUES ('40', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '1234', '23', '1', '2019-07-19 14:58:49');
INSERT INTO `t_goods_price_update_note` VALUES ('41', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '23', '23', '1', '2019-07-19 14:59:51');
INSERT INTO `t_goods_price_update_note` VALUES ('42', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '23', '165', '1', '2019-07-19 15:00:52');
INSERT INTO `t_goods_price_update_note` VALUES ('43', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '165', '23', '1', '2019-07-19 15:13:17');
INSERT INTO `t_goods_price_update_note` VALUES ('64', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '24', '26', null, '2019-07-24 17:15:13');
INSERT INTO `t_goods_price_update_note` VALUES ('65', '11', '野生东北黑木耳', '128', '160', null, '2019-07-24 17:28:14');
INSERT INTO `t_goods_price_update_note` VALUES ('66', '1', '陶华碧老干妈香辣脆油牛肉粒测试测试', '26', '13', null, '2019-07-24 17:44:02');

-- ----------------------------
-- Table structure for `t_ordernumber`
-- ----------------------------
DROP TABLE IF EXISTS `t_ordernumber`;
CREATE TABLE `t_ordernumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ordernumber
-- ----------------------------
INSERT INTO `t_ordernumber` VALUES ('1', 'JH', '1', '2019-06-20 14:16:28');
INSERT INTO `t_ordernumber` VALUES ('2', 'XT', '1', '2019-06-20 14:16:36');
INSERT INTO `t_ordernumber` VALUES ('3', 'XS', '1', '2019-06-20 14:16:46');

-- ----------------------------
-- Table structure for `t_overflow_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list`;
CREATE TABLE `t_overflow_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overflowdate` datetime DEFAULT NULL,
  `overflownumber` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `delflag` int(2) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_overflow_list
-- ----------------------------
INSERT INTO `t_overflow_list` VALUES ('1', '2019-05-22 13:37:57', 'BY201712140001', 'cc', '1', '0', '2019-05-22 13:38:09');
INSERT INTO `t_overflow_list` VALUES ('2', '2019-05-22 13:38:00', 'BY201712140002', 'cc', '1', '0', '2019-05-22 13:38:11');
INSERT INTO `t_overflow_list` VALUES ('3', '2019-05-22 13:38:03', 'BY201712150001', 'cc', '1', '0', '2019-05-22 13:38:14');
INSERT INTO `t_overflow_list` VALUES ('4', '2019-05-22 13:38:07', 'BY201712150002', 'cccc', '1', '0', '2019-05-22 13:38:16');
INSERT INTO `t_overflow_list` VALUES ('5', '2019-05-22 16:00:50', 'BY201712140001', 'cc', '1', '0', '2019-05-22 16:01:10');
INSERT INTO `t_overflow_list` VALUES ('9', '2019-05-23 11:32:53', 'BY2017121400011', 'cccccc', '1', '0', '2019-05-23 11:32:53');
INSERT INTO `t_overflow_list` VALUES ('12', '2019-05-24 14:54:53', 'BY2017121400011', 'cc', '1', '0', '2019-05-24 14:54:53');
INSERT INTO `t_overflow_list` VALUES ('19', '2019-06-19 00:00:00', 'BY201906200003', 'qwarewe', '1', '0', '2019-06-20 13:54:02');
INSERT INTO `t_overflow_list` VALUES ('20', '2019-06-18 00:00:00', 'qerqwerqerq', 'qerqeradsfadfzxcvzcv', '1', '0', '2019-06-21 09:19:38');
INSERT INTO `t_overflow_list` VALUES ('21', '2019-06-19 00:00:00', 'adfadfadf', '4674657', '1', '0', '2019-06-21 09:46:59');
INSERT INTO `t_overflow_list` VALUES ('22', '2019-06-07 00:00:00', 'adfa', 'asd12312312', '1', '0', '2019-06-21 11:24:12');
INSERT INTO `t_overflow_list` VALUES ('23', '2019-06-11 00:00:00', '1432413241', '123413241234', '1', '0', '2019-06-21 11:26:57');
INSERT INTO `t_overflow_list` VALUES ('24', '2019-06-18 00:00:00', 'BY201908010001', '4134132', '1', '0', '2019-06-21 11:28:33');
INSERT INTO `t_overflow_list` VALUES ('25', '2019-07-04 00:00:00', 'BY201907040001', 'zsy0401', '1', '0', '2019-07-04 08:24:07');
INSERT INTO `t_overflow_list` VALUES ('32', '2019-07-05 00:00:00', 'BY201907050001', 'zsy', '1', '0', '2019-07-05 09:46:51');
INSERT INTO `t_overflow_list` VALUES ('33', '2019-07-05 00:00:00', 'BY201907050002', 'zsy', '1', '0', '2019-07-05 09:52:41');
INSERT INTO `t_overflow_list` VALUES ('34', '2019-07-05 00:00:00', 'BY201907050003', 'zst', '1', '0', '2019-07-05 10:20:15');
INSERT INTO `t_overflow_list` VALUES ('35', '2019-07-05 00:00:00', 'BY201907050004', '123', '1', '0', '2019-07-05 14:20:28');
INSERT INTO `t_overflow_list` VALUES ('36', '2019-07-05 00:00:00', 'BY201907050005', 'zsy', '1', '0', '2019-07-05 14:21:13');
INSERT INTO `t_overflow_list` VALUES ('37', '2019-07-05 00:00:00', 'BY201907050006', 'zsy', '1', '0', '2019-07-05 14:30:16');
INSERT INTO `t_overflow_list` VALUES ('38', '2019-07-05 00:00:00', 'BY201907050007', 'lijing', '1', '0', '2019-07-05 16:24:35');
INSERT INTO `t_overflow_list` VALUES ('39', '2019-07-05 00:00:00', 'BY201907050008', 'zsy', '1', '0', '2019-07-05 16:24:38');
INSERT INTO `t_overflow_list` VALUES ('40', '2019-07-05 00:00:00', 'BY201907050009', 'llili', '1', '0', '2019-07-05 16:25:16');
INSERT INTO `t_overflow_list` VALUES ('41', '2019-07-08 00:00:00', 'BY201907080001', 'ZSY', '1', '0', '2019-07-08 14:11:45');
INSERT INTO `t_overflow_list` VALUES ('42', '2019-07-10 00:00:00', 'BY201907100001', 'dddd', '1', '0', '2019-07-10 08:56:12');
INSERT INTO `t_overflow_list` VALUES ('44', '2019-07-11 00:00:00', 'BY201907100002', '', '1', '0', '2019-07-10 09:05:08');
INSERT INTO `t_overflow_list` VALUES ('45', '2019-07-11 00:00:00', 'BY201907100003', '44', '1', '0', '2019-07-10 09:07:19');
INSERT INTO `t_overflow_list` VALUES ('46', '2019-07-10 00:00:00', 'BY201907100004', '111', '1', '0', '2019-07-10 09:08:18');
INSERT INTO `t_overflow_list` VALUES ('47', '2019-07-10 00:00:00', 'BY201907100005', 'cofe', '1', '0', '2019-07-10 09:08:40');
INSERT INTO `t_overflow_list` VALUES ('48', '2019-07-10 00:00:00', 'BY201907100006', 'cofe', '1', '0', '2019-07-10 09:08:42');
INSERT INTO `t_overflow_list` VALUES ('49', '2019-07-10 00:00:00', 'BY201907100006', 'cofe', '1', '0', '2019-07-10 09:08:44');
INSERT INTO `t_overflow_list` VALUES ('50', '2019-07-10 00:00:00', 'BY201907100007', 'TV', '1', '0', '2019-07-10 09:09:57');
INSERT INTO `t_overflow_list` VALUES ('51', '2019-07-18 00:00:00', 'BY201907100008', '123', '1', '0', '2019-07-10 09:18:25');
INSERT INTO `t_overflow_list` VALUES ('52', '2019-07-11 00:00:00', 'BY201907100009', '456', '1', '0', '2019-07-10 09:19:33');
INSERT INTO `t_overflow_list` VALUES ('53', '2019-07-10 00:00:00', 'BY201907100010', '苹果', '1', '0', '2019-07-10 09:21:13');
INSERT INTO `t_overflow_list` VALUES ('54', '2019-07-13 00:00:00', 'BY201907100011', '456', '1', '0', '2019-07-10 09:24:27');
INSERT INTO `t_overflow_list` VALUES ('55', '2019-07-11 00:00:00', 'BY201907100012', 'kloko', '1', '0', '2019-07-10 09:27:59');
INSERT INTO `t_overflow_list` VALUES ('56', '2019-07-10 00:00:00', 'BY201907100013', '123', '1', '0', '2019-07-10 09:32:21');
INSERT INTO `t_overflow_list` VALUES ('57', '2019-07-10 00:00:00', 'BY201907100014', '3', '1', '0', '2019-07-10 09:35:41');
INSERT INTO `t_overflow_list` VALUES ('58', '2019-07-10 00:00:00', 'BY201907100015', '123', '1', '0', '2019-07-10 09:38:19');
INSERT INTO `t_overflow_list` VALUES ('59', '2019-07-10 00:00:00', 'BY201907100016', '123', '1', '0', '2019-07-10 09:39:13');
INSERT INTO `t_overflow_list` VALUES ('60', '2019-07-10 00:00:00', 'BY201907100017', '123', '1', '0', '2019-07-10 09:39:45');
INSERT INTO `t_overflow_list` VALUES ('61', '2019-07-10 00:00:00', 'BY201907100018', '123', '1', '0', '2019-07-10 09:42:37');
INSERT INTO `t_overflow_list` VALUES ('62', '2019-07-10 00:00:00', 'BY201907100019', '123', '1', '0', '2019-07-10 09:43:44');
INSERT INTO `t_overflow_list` VALUES ('63', '2019-07-10 00:00:00', 'BY201907100020', '123', '1', '0', '2019-07-10 09:45:32');
INSERT INTO `t_overflow_list` VALUES ('64', '2019-07-14 00:00:00', 'BY201907100021', '485', '1', '0', '2019-07-10 09:48:40');
INSERT INTO `t_overflow_list` VALUES ('65', '2019-07-14 00:00:00', 'BY201907100022', '62', '1', '0', '2019-07-10 10:44:58');
INSERT INTO `t_overflow_list` VALUES ('68', '2019-07-16 10:00:00', 'BY201907168888', '报溢单', '1', '0', '2019-07-25 10:38:05');
INSERT INTO `t_overflow_list` VALUES ('69', '2019-07-16 10:00:00', 'BY201907165269', '报溢单', '1', '0', '2019-07-25 10:38:05');

-- ----------------------------
-- Table structure for `t_overflow_list_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list_goods`;
CREATE TABLE `t_overflow_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `overflowlistid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `delflag` int(2) NOT NULL,
  `addtime` datetime NOT NULL,
  `userid` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_overflow_list_goods
-- ----------------------------
INSERT INTO `t_overflow_list_goods` VALUES ('2', '0006', '14', '300g装', '冰糖金桔干', '2', '4', '8', '盒', '1', '11', '0', '2019-05-22 15:10:50', '2');
INSERT INTO `t_overflow_list_goods` VALUES ('3', '0005', '13', '散装500克', '麦片燕麦巧克力', '1', '8', '8', '袋', '2', '11', '0', '2019-05-22 15:10:53', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('4', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '8', '24', '袋', '22', '11', '0', '2019-05-22 15:10:55', '3');
INSERT INTO `t_overflow_list_goods` VALUES ('5', '0008', '16', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '2', '2', '4', '盒', '23', '11', '0', '2019-05-22 15:10:57', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('6', '0006', '14', '300g装', '冰糖金桔干', '2', '4', '8', '盒', '24', '11', '0', '2019-05-22 15:10:59', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('10', '', null, '500g装', '小麦', '0', '0', '0', '', '23', '1', '0', '2019-05-24 16:15:08', null);
INSERT INTO `t_overflow_list_goods` VALUES ('11', '002', '11', '500g', '野生大米', '112', '23', '23', '盒', '24', '2', '0', '2019-05-24 16:22:41', '2');
INSERT INTO `t_overflow_list_goods` VALUES ('12', '1', '1', '1', '1', '1', '1', '1', '1', '23', '1', '0', '2019-05-27 19:27:42', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('13', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '2', '8', '16', '瓶', '25', '11', '0', '2019-07-04 08:24:07', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('14', '0005', '13', '散装500克', '麦片燕麦巧克力', '2', '8', '16', '袋', '25', '11', '0', '2019-07-04 08:24:07', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('15', '0002', '2', 'Note8', '华为荣耀Note9', '2', '2220', '4440', '台', '26', '16', '0', '2019-07-04 08:29:13', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('16', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '5', '8', '40', '瓶', '27', '11', '0', '2019-07-04 10:06:39', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('17', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '28', '11', '0', '2019-07-05 09:29:17', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('18', '0004', '12', '2斤装', '新疆红枣', '2', '13', '26', '袋', '29', '10', '0', '2019-07-05 09:30:56', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('19', '0002', '2', 'Note8', '华为荣耀Note9', '3', '2220', '6660', '台', '30', '16', '0', '2019-07-05 09:33:10', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('20', '0003', '11', '500g装', '野生东北黑木耳', '2', '22', '44', '袋', '31', '11', '0', '2019-07-05 09:40:29', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('21', '0003', '11', '500g装', '野生东北黑木耳', '2', '22', '44', '袋', '33', '11', '0', '2019-07-05 09:52:41', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('22', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '8', '24', '袋', '33', '11', '0', '2019-07-05 09:52:41', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('23', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '2', '8', '16', '瓶', '34', '11', '0', '2019-07-05 10:20:16', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('24', '0003', '11', '500g装', '野生东北黑木耳', '2', '22', '44', '袋', '34', '11', '0', '2019-07-05 10:20:16', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('25', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '2', '8', '16', '瓶', '35', '11', '0', '2019-07-05 14:20:28', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('26', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '4', '8', '32', '瓶', '36', '11', '0', '2019-07-05 14:21:13', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('27', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '2', '8', '16', '瓶', '37', '11', '0', '2019-07-05 14:30:16', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('28', '0005', '13', '散装500克', '麦片燕麦巧克力', '5', '8', '40', '袋', '37', '11', '0', '2019-07-05 14:30:16', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('29', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '1', '8', '8', '瓶', '38', '11', '0', '2019-07-05 16:24:35', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('30', '0003', '11', '500g装', '野生东北黑木耳', '3', '22', '66', '袋', '39', '11', '0', '2019-07-05 16:24:38', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('31', '0002', '2', 'Note8', '华为荣耀Note9', '1', '2220', '2220', '台', '40', '16', '0', '2019-07-05 16:25:16', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('32', '0004', '12', '2斤装', '新疆红枣', '4', '13', '52', '袋', '41', '10', '0', '2019-07-08 14:11:45', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('33', '0003', '11', '500g装', '野生东北黑木耳', '3', '22', '66', '袋', '40', '11', '0', '2019-07-09 15:49:07', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('34', '0056', '56', '500g', '大枣', '10', '10', '100', '斤', '42', '11', '0', '2019-07-10 08:56:12', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('35', '0041', '50', '555ml', '可口可乐', '0', '5', '0', '个', '45', '10', '0', '2019-07-10 09:07:19', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('36', '0040', '49', '500g', '苹果', '5', '5', '25', '个', '46', '10', '0', '2019-07-10 09:08:18', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('37', '0099', '53', '100g', '冰咖啡', '2', '10', '20', '瓶', '47', '11', '0', '2019-07-10 09:08:40', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('38', '0099', '53', '100g', '冰咖啡', '2', '10', '20', '瓶', '48', '11', '0', '2019-07-10 09:08:42', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('39', '0099', '53', '100g', '冰咖啡', '2', '10', '20', '瓶', '49', '11', '0', '2019-07-10 09:08:44', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('40', '0034', '43', 'TCL-1000-12623', 'TCL电视', '1', '5555', '5555', '台', '50', '15', '0', '2019-07-10 09:09:57', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('41', '0041', '50', '550ml', '可口可乐', '4', '3', '12', '个', '56', '10', '0', '2019-07-10 09:32:21', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('42', '0042', '51', '500ml', '雪碧', '4', '3', '12', '个', '57', '10', '0', '2019-07-10 09:35:41', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('43', '0040', '49', '500g', '苹果', '4', '3', '12', '个', '58', '10', '0', '2019-07-10 09:38:19', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('44', '0026', '35', 'AFS JEEP', '加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子', '3', '60', '180', '条', '59', '8', '0', '2019-07-10 09:39:13', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('45', '0014', '22', '250g装', '美国青豆原味 蒜香', '4', '5', '20', '袋', '60', '11', '0', '2019-07-10 09:39:45', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('46', '0009', '17', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '3', '20', '60', '袋', '61', '11', '0', '2019-07-10 09:42:37', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('47', '0015', '24', 'X', 'iPhone X', '2', '8000', '16000', '台', '62', '16', '0', '2019-07-10 09:43:45', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('48', '0021', '30', '4A', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', '2', '721', '1442', '台', '63', '12', '0', '2019-07-10 09:45:32', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('49', '06-660', '59', 'yt-uii', '椰子灰', '465', '456', '212040', '个', '68', '11', '0', '2019-07-11 12:05:26', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('50', '06-660', '59', 'yt-uii', '椰子灰', '465', '456', '212040', '个', '69', '11', '0', '2019-07-11 12:05:36', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('51', '06-660', '59', 'yt-uii', '椰子灰', '465', '456', '212040', '个', '70', '11', '0', '2019-07-11 12:05:51', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('52', '06-660', '59', 'yt-uii', '椰子灰', '465', '456', '212040', '个', '71', '11', '0', '2019-07-11 12:06:15', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('53', '0034', '43', 'TCL-1000-12623', 'TCL电视', '1', '8888', '8888', '台', '73', '15', '0', '2019-07-15 09:38:25', '1');
INSERT INTO `t_overflow_list_goods` VALUES ('54', '5555', '50', '50克装', '大白兔软糖', '10', '5', '56', '袋', '45', '10', '0', '2019-07-22 14:53:54', '0');
INSERT INTO `t_overflow_list_goods` VALUES ('55', '6666', '50', '50克装', '上海酒糖', '20', '6', '100', '袋', '45', '10', '0', '2019-07-22 14:53:54', '0');
INSERT INTO `t_overflow_list_goods` VALUES ('56', '5555', '50', '50克装', '大白兔软糖', '10', '5', '56', '袋', '45', '10', '0', '2019-07-22 14:55:03', '0');
INSERT INTO `t_overflow_list_goods` VALUES ('57', '6666', '50', '50克装', '上海酒糖', '20', '6', '100', '袋', '45', '10', '0', '2019-07-22 14:55:03', '0');
INSERT INTO `t_overflow_list_goods` VALUES ('58', '5555', '50', '50克装', '大白兔软糖', '10', '5', '56', '袋', '45', '10', '0', '2019-07-29 12:06:58', '0');
INSERT INTO `t_overflow_list_goods` VALUES ('59', '6666', '50', '50克装', '上海酒糖', '20', '6', '100', '袋', '45', '10', '0', '2019-07-29 12:06:58', '0');
INSERT INTO `t_overflow_list_goods` VALUES ('60', '0003', '11', '500g装', '野生东北黑木耳', '3', '22', '66', '袋', '40', '11', '0', '2019-08-01 10:49:40', '1');

-- ----------------------------
-- Table structure for `t_print`
-- ----------------------------
DROP TABLE IF EXISTS `t_print`;
CREATE TABLE `t_print` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) DEFAULT NULL,
  `supplierid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `delflag` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_print
-- ----------------------------
INSERT INTO `t_print` VALUES ('14', '/upload/02.jpg', '129', '2019-07-30 16:50:55', '0000000000');
INSERT INTO `t_print` VALUES ('15', '/upload/03.jpg', '129', '2019-07-30 16:51:09', '0000000000');
INSERT INTO `t_print` VALUES ('17', '/upload/02.jpg', '130', '2019-07-30 17:05:37', '0000000000');
INSERT INTO `t_print` VALUES ('18', '/upload/05.jpg', '129', '2019-07-30 17:11:25', '0000000000');
INSERT INTO `t_print` VALUES ('19', '/upload/04.jpg', '129', '2019-07-30 17:13:43', '0000000000');
INSERT INTO `t_print` VALUES ('23', '/upload/02.jpg', '129', '2019-07-30 17:36:43', '0000000000');
INSERT INTO `t_print` VALUES ('24', '/upload/03.jpg', '130', '2019-07-30 17:45:03', '0000000000');
INSERT INTO `t_print` VALUES ('25', '/upload/01.jpg', '130', '2019-08-01 08:26:28', '0000000000');

-- ----------------------------
-- Table structure for `t_purchase_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list`;
CREATE TABLE `t_purchase_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amountpaid` float DEFAULT NULL,
  `amountpayable` float DEFAULT NULL,
  `purchasedate` datetime DEFAULT NULL,
  `purchasenumber` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `supplierid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` int(2) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase_list
-- ----------------------------
INSERT INTO `t_purchase_list` VALUES ('6', '123.123', '123.123', '2019-07-18 00:00:00', 'JH201907050001', '不要钱了', '1', '1', '1', '0', '2019-07-05 11:06:22');
INSERT INTO `t_purchase_list` VALUES ('8', '111111000', '11111100', '2019-07-30 00:00:00', 'JH201907080003', 'gggg', '1', '38', '1', '0', '2019-07-04 17:08:47');
INSERT INTO `t_purchase_list` VALUES ('177', '1', '1', '2019-07-02 00:00:00', 'JH201907080007', 'r', '1', '38', '1', '1', '2019-07-05 11:17:45');
INSERT INTO `t_purchase_list` VALUES ('178', '1234', '1234', '2019-07-16 00:00:00', 'JH201907050003', 'qwe', '1', '39', '1', '1', '2019-07-05 11:28:52');
INSERT INTO `t_purchase_list` VALUES ('179', '12344', '12344', '2019-07-11 00:00:00', 'JH201907050004', '嗯嗯嗯', '1', '11', '1', '0', '2019-07-05 11:31:17');
INSERT INTO `t_purchase_list` VALUES ('180', '123', '123', '2019-07-21 00:00:00', 'JH201907050005', '123', '1', '4', '1', '0', '2019-07-05 11:40:05');
INSERT INTO `t_purchase_list` VALUES ('181', '123', '123', '2019-07-30 00:00:00', 'JH201907050006', '轻微', '1', '4', '1', '0', '2019-07-05 11:44:24');
INSERT INTO `t_purchase_list` VALUES ('182', '1231', '1231', '2019-07-11 00:00:00', 'JH201907050007', '权威', '1', '39', '1', '0', '2019-07-05 11:46:38');
INSERT INTO `t_purchase_list` VALUES ('183', '12', '12', '2019-07-16 00:00:00', 'JH201907050008', '王企鹅', '2', '6', '1', '0', '2019-07-05 11:51:37');
INSERT INTO `t_purchase_list` VALUES ('184', '1333', '1333', '2019-07-16 00:00:00', 'JH201907050009', '不要钱', '1', '6', '1', '0', '2019-07-05 13:39:02');
INSERT INTO `t_purchase_list` VALUES ('185', '2010', '2010', '2019-07-08 00:00:00', 'JH201907080005', '231', '1', '41', '1', '0', '2019-07-08 10:28:17');
INSERT INTO `t_purchase_list` VALUES ('212', '321', '232', '2019-07-16 00:00:00', 'JH201907150001', '232', '2', '2', '1', '0', '2019-07-15 16:59:15');
INSERT INTO `t_purchase_list` VALUES ('215', '23', '23', '2019-07-19 00:00:00', 'JH201907170001', '23', '2', '44', '1', '0', '2019-07-17 10:22:27');
INSERT INTO `t_purchase_list` VALUES ('216', '2323', '2323', '2019-07-25 00:00:00', 'JH201907250001', '1111111', '1', '1', '1', '0', '2019-07-25 13:47:55');
INSERT INTO `t_purchase_list` VALUES ('217', '2323', '2323', '2019-07-25 00:00:00', 'JH201907250001', '1111111', '1', '1', '1', '0', '2019-07-29 09:30:37');
INSERT INTO `t_purchase_list` VALUES ('218', '2323', '2323', '2019-07-25 00:00:00', 'JH201907250001', '1111111', '1', '1', '1', '0', '2019-07-29 09:30:38');
INSERT INTO `t_purchase_list` VALUES ('219', '2323', '2424', '2019-07-25 00:00:00', 'JH201907290001', '1111111', '1', '1', '1', '0', '2019-07-29 14:07:23');
INSERT INTO `t_purchase_list` VALUES ('220', '1111', '1111', '3919-08-21 00:00:00', 'JH201907210001', '测试了', '1', '1', '1', '0', '2019-08-01 10:28:17');
INSERT INTO `t_purchase_list` VALUES ('221', '12.4', '12.4', '2019-07-05 00:00:00', 'JH201907230001', '测试修改', '2', '2', null, '1', '2019-08-01 10:35:55');
INSERT INTO `t_purchase_list` VALUES ('222', '1111', '1111', '3919-08-21 00:00:00', 'JH201907210001', '测试了', '1', '1', '1', '0', '2019-08-01 10:36:15');
INSERT INTO `t_purchase_list` VALUES ('223', '1111', '1111', '3919-08-21 00:00:00', 'JH201907210001', '测试了', '1', '1', '1', '0', '2019-08-01 10:37:30');
INSERT INTO `t_purchase_list` VALUES ('224', '1111', '1111', '3919-08-21 00:00:00', 'JH201907210001', '测试了', '1', '1', '1', '0', '2019-08-01 10:37:53');
INSERT INTO `t_purchase_list` VALUES ('225', '112', '112', null, 'JH201907090002', '12', '1', '2', '1', '0', '2019-08-01 10:52:20');

-- ----------------------------
-- Table structure for `t_purchase_list_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list_goods`;
CREATE TABLE `t_purchase_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `purchaselistid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `delflag` int(2) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase_list_goods
-- ----------------------------
INSERT INTO `t_purchase_list_goods` VALUES ('6', '0002', '1', 'Note8', '华为荣耀Note8', '3', '2220', '4440', '台', '8', '1', '0', '2019-05-28 13:44:18', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('11', '0008', '2', '128g装', '桃肉蜜饯果脯果干桃肉干休闲零食品', '1', '2', '2', '盒', '181', '2', '0', '2019-05-28 13:44:21', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('13', '0006', '1', '300g装', '冰糖金桔干', '4', '4', '16', '盒', '181', '3', '0', '2019-05-28 13:44:24', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('25', '111', '1', '1', '12312312', '2', '44', '44', '个', '181', '2', '0', '2019-05-28 14:29:03', '2');
INSERT INTO `t_purchase_list_goods` VALUES ('26', '1', '1', '1', '1', '1', '1', '1', '1', '182', '1', '0', '2019-05-28 15:18:43', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('27', '1', '1', '1', '1', '1', '1', '1', '1', '182', '1', '0', '2019-05-28 15:18:47', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('29', '222222', '1', '12', '12', '12', '12', '123', '1', '182', '2', '0', '2019-05-28 15:18:49', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('46', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '22', '66', '袋', '182', '1', '0', '2019-07-04 18:52:33', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('47', '0009', '17', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '22', '12', '264', '袋', '182', '1', '0', '2019-07-05 08:48:57', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('49', '0007', '15', '500g装', '吉利人家牛肉味蛋糕', '22', '9', '198', '袋', '183', '1', '0', '2019-07-05 11:16:30', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('50', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '6', '5', '6', '瓶', '183', '1', '0', '2019-07-05 11:41:44', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('51', '0002', '2', 'Note8', '华为荣耀Note9', '1', '1333', '1333', '台', '183', '4', '1', '2019-07-05 13:44:41', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('52', '0005', '13', '散装500克', '麦片燕麦巧克力', '10000', '2', '20000', '袋', '184', '1', '0', '2019-07-05 13:45:42', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('54', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '3', '2', '6', '瓶', '183', '11', '0', '2019-07-05 17:23:57', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('55', '0002', '2', 'Note8', '华为荣耀Note9', '1', '2222', '2222', '台', '183', '16', '0', '2019-07-05 17:24:40', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('56', '0003', '11', '500g装', '野生东北黑木耳', '333', '222', '-2', '袋', '183', '11', '0', '2019-07-05 17:26:33', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('57', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '333', '222', '73926', '瓶', '166', '11', '0', '2019-07-08 08:56:20', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('65', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒测试', '123', '10', '1230', '瓶', '184', '11', '0', '2019-07-08 11:35:33', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('66', '0002', '2', 'Note8', '华为荣耀Note9', '20', '20', '400', '台', '185', '16', '1', '2019-07-08 13:10:20', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('67', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒测试', '22', '8', '176', '瓶', '185', '11', '0', '2019-07-08 13:25:46', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('68', '0006', '14', '300g装', '冰糖金桔干', '13', '8', '104', '盒', '185', '11', '0', '2019-07-08 13:25:59', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('69', '0010', '18', '250g装', '劲仔小鱼干', '3', '22', '66', '袋', '185', '11', '0', '2019-07-08 13:26:09', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('70', '0008', '16', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '10', '30', '300', '盒', '185', '11', '0', '2019-07-08 13:26:23', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('71', '0007', '15', '500g装', '吉利人家牛肉味蛋糕', '22', '30', '660', '袋', '183', '11', '1', '2019-07-08 13:26:46', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('72', '0020', '29', '190WDPT', 'haier', '33', '2222', '73326', '台', '185', '14', '1', '2019-07-08 13:34:00', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('74', '0005', '13', '散装500克', '麦片燕麦巧克力', '1', '1', '1', '袋', '183', '1', '0', '2019-07-08 16:50:20', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('75', '0005', '13', '散装500克', '麦片燕麦巧克力', '1', '1', '1', '袋', '176', '1', '0', '2019-07-08 16:53:13', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('76', '0005', '13', '散装500克', '麦片燕麦巧克力', '1', '1', '1', '袋', '183', '1', '0', '2019-07-08 16:55:03', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('77', '0005', '13', '散装500克', '麦片燕麦巧克力', '1', '1', '1', '袋', '176', '1', '0', '2019-07-08 17:06:34', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('78', '0005', '13', '散装500克', '麦片燕麦巧克力', '1', '1', '1', '袋', '190', '1', '0', '2019-07-08 17:07:43', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('79', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '190', '1', '0', '2019-07-08 17:13:02', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('80', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '1220', '1', '0', '2019-07-08 17:14:49', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('81', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒测试测试', '6', '5', '30', '瓶', '183', '1', '0', '2019-07-08 17:28:20', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('82', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '1220', '1', '0', '2019-07-08 17:45:27', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('83', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-07-08 17:53:35', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('84', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-07-09 11:20:53', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('85', '0004', '12', '2斤装', '新疆红枣', '133', '2', '266', '袋', '206', '1', '0', '2019-07-09 15:24:12', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('86', '0006', '14', '300g装', '冰糖金桔干', '111111', '13', '1444440', '盒', '206', '1', '0', '2019-07-09 15:24:24', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('88', '0056', '56', '500g', '大枣', '13', '12123', '157599', '斤', '208', '11', '0', '2019-07-10 09:10:42', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('89', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:40:44', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('90', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:41:19', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('91', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:42:06', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('92', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:43:46', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('93', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:44:27', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('94', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:45:12', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('95', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:46:35', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('96', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:47:29', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('97', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '3', '9', '袋', '180', '1', '0', '2019-08-01 10:49:48', '1');

-- ----------------------------
-- Table structure for `t_return_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list`;
CREATE TABLE `t_return_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货单据编号',
  `amountpaid` float DEFAULT NULL COMMENT '支出金额',
  `amountpayable` float DEFAULT NULL COMMENT '应付金额',
  `remarks` varchar(1000) DEFAULT NULL COMMENT '备注',
  `returndate` datetime DEFAULT NULL COMMENT '退货时间',
  `returnnumber` varchar(100) DEFAULT NULL COMMENT '退货单号',
  `state` int(11) DEFAULT NULL COMMENT '退货状态',
  `supplierid` int(11) DEFAULT NULL COMMENT '供货商编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户编号',
  `delflag` int(10) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_return_list
-- ----------------------------
INSERT INTO `t_return_list` VALUES ('1', '197', '197', 'cc', '2019-04-18 10:55:36', 'TH201712060001', '2', '1', '1', '0', null);
INSERT INTO `t_return_list` VALUES ('2', '0', '4464', 'cc', '2019-05-22 10:55:44', 'TH201712060002', '1', '1', '1', '0', null);
INSERT INTO `t_return_list` VALUES ('3', '60', '60', '', '2019-05-22 10:55:48', 'TH201712060003', '2', '1', '1', '0', null);

-- ----------------------------
-- Table structure for `t_return_list_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list_goods`;
CREATE TABLE `t_return_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货货物编号',
  `code` varchar(50) DEFAULT NULL COMMENT '退货编码',
  `goodsid` int(11) DEFAULT NULL COMMENT '货物编号',
  `model` varchar(50) DEFAULT NULL COMMENT '货物规格',
  `name` varchar(50) DEFAULT NULL COMMENT '货物名称',
  `num` int(11) DEFAULT NULL COMMENT '货物数量',
  `price` float DEFAULT NULL COMMENT '货物价格',
  `total` float DEFAULT NULL COMMENT '货物总量',
  `unit` varchar(10) DEFAULT NULL COMMENT '货物单位',
  `returnlistid` int(11) DEFAULT NULL COMMENT '退货表编号',
  `typeid` int(11) DEFAULT NULL COMMENT '种类编号',
  `userid` int(11) DEFAULT NULL COMMENT '用户编号',
  `delflag` int(10) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_return_list_goods
-- ----------------------------
INSERT INTO `t_return_list_goods` VALUES ('1', '0001', '1', '红色装', '陶华碧老干妈香辣脆油辣椒', '2', '8.5', '17', '瓶', '1', '10', null, '1', '2019-06-27 15:27:32');
INSERT INTO `t_return_list_goods` VALUES ('2', '0024', '33', 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', '1', '180', '180', '件', '1', '6', null, '1', null);
INSERT INTO `t_return_list_goods` VALUES ('3', '0002', '2', 'Note8', '华为荣耀Note8', '2', '2220', '4440', '台', '2', '16', null, '1', null);
INSERT INTO `t_return_list_goods` VALUES ('4', '0005', '13', '散装500克', '麦片燕麦巧克力', '3', '8', '24', '袋', '2', '11', null, '1', null);
INSERT INTO `t_return_list_goods` VALUES ('5', '0003', '11', '500g装', '野生东北黑木耳', '2', '22', '44', '袋', '3', '11', null, '1', null);
INSERT INTO `t_return_list_goods` VALUES ('6', '0006', '14', '300g装', '冰糖金桔干', '4', '4', '16', '盒', '3', '11', null, '1', null);

-- ----------------------------
-- Table structure for `t_sale_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list`;
CREATE TABLE `t_sale_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amountpaid` float DEFAULT NULL,
  `amountpayable` float DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `saledate` datetime DEFAULT NULL,
  `salenum` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `delflag` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale_list
-- ----------------------------
INSERT INTO `t_sale_list` VALUES ('2', '449', '449', '测试', '2019-05-22 10:33:31', 'XS201712100002', '1', '1', '1', '2019-05-22 10:33:03', '1');
INSERT INTO `t_sale_list` VALUES ('3', '130', '130', 'cc', '2019-05-22 10:33:38', 'XS201712120001', '1', '1', '1', '2019-05-22 10:33:07', '1');
INSERT INTO `t_sale_list` VALUES ('4', '140', '140', 'cc', '2019-05-22 10:33:42', 'XS201712120001', '1', '1', '1', '2019-05-22 10:33:11', '1');
INSERT INTO `t_sale_list` VALUES ('5', '1', '1', 'cc', '2019-05-23 15:11:06', 'XS201712120001', '1', '2', '1', '2019-05-23 15:11:06', '1');
INSERT INTO `t_sale_list` VALUES ('6', '1', '1', '', '2019-05-23 15:12:39', 'XS201712230001', '1', '1', '1', '2019-05-23 15:12:39', '1');
INSERT INTO `t_sale_list` VALUES ('39', '1900', '1800', '差一百块钱没给', '2019-07-10 00:00:00', 'XS201907050001', '1', '1', '1', '2019-07-05 09:50:45', '1');
INSERT INTO `t_sale_list` VALUES ('40', '1400', '1400', '老板亲戚，手机便宜点', '2019-07-18 00:00:00', 'XS201907050002', '1', '1', '1', '2019-07-05 09:54:59', '1');
INSERT INTO `t_sale_list` VALUES ('41', '3531', '3111', '这里是备注', '2019-07-17 00:00:00', 'XS201907050003', '1', '3', '1', '2019-07-05 10:28:21', '1');
INSERT INTO `t_sale_list` VALUES ('42', '3000', '3000', '这里是备注', '2019-07-17 00:00:00', 'XS201907050004', '1', '3', '1', '2019-07-05 10:29:16', '1');
INSERT INTO `t_sale_list` VALUES ('43', '264', '12', '这里是备注', '2019-07-30 00:00:00', 'XS201907050005', '2', '3', '1', '2019-07-05 10:29:45', '1');
INSERT INTO `t_sale_list` VALUES ('44', '73326', '33', '这里是备足', '2019-07-11 00:00:00', 'XS201907050006', '1', '3', '1', '2019-07-05 10:30:06', '1');
INSERT INTO `t_sale_list` VALUES ('45', '650', '123', '这里是备足', '2019-07-03 00:00:00', 'XS201907050007', '1', '3', '1', '2019-07-05 11:10:05', '1');
INSERT INTO `t_sale_list` VALUES ('46', '650', '650', '这里是备足', '2019-07-11 00:00:00', 'XS201907050008', '1', '4', '1', '2019-07-05 11:16:32', '1');
INSERT INTO `t_sale_list` VALUES ('47', '650', '650', '这里是备足', '2019-07-11 00:00:00', 'XS201907050009', '1', '1', '1', '2019-07-05 11:20:24', '1');
INSERT INTO `t_sale_list` VALUES ('48', '650', '750', '求求你成功吧', '2019-07-10 00:00:00', 'XS201907050010', '1', '3', '1', '2019-07-05 11:22:43', '1');
INSERT INTO `t_sale_list` VALUES ('49', '3000', '1', '1', '2019-07-03 00:00:00', 'XS201907050011', '2', '1', '1', '2019-07-05 16:46:36', '1');
INSERT INTO `t_sale_list` VALUES ('50', '2222', '2222', '啊拉拉', '2019-07-09 00:00:00', 'XS201907080001', '1', '3', '1', '2019-07-08 10:38:20', '1');
INSERT INTO `t_sale_list` VALUES ('57', '100', '100', '这里是备注', '2009-06-01 00:00:00', 'XS201907080002', '1', '1', '1', '2019-07-08 18:47:46', '1');
INSERT INTO `t_sale_list` VALUES ('58', '500', '20', '没有添加备注', '2019-07-09 00:00:00', 'XS201907100001', '1', '1', '1', '2019-07-10 08:53:17', '1');
INSERT INTO `t_sale_list` VALUES ('59', '32', '32', '没有添加备注', '2019-07-10 00:00:00', 'XS201907100002', '1', '7', '1', '2019-07-10 14:36:18', '1');
INSERT INTO `t_sale_list` VALUES ('60', '56', '56', '凉快', '2019-07-10 15:27:55', 'XS201907100003', '1', '7', '1', '2019-07-10 14:37:55', '1');
INSERT INTO `t_sale_list` VALUES ('61', '80', '80', '没有添加备注', '2019-07-10 00:00:00', 'XS201907100004', '1', '7', '1', '2019-07-10 15:33:30', '1');
INSERT INTO `t_sale_list` VALUES ('62', '100', '100', '没有添加备注', '2019-07-10 00:00:00', 'XS201907100005', '1', '7', '1', '2019-07-10 15:48:29', '1');
INSERT INTO `t_sale_list` VALUES ('63', '80', '80', '没有添加备注', '2019-07-10 00:00:00', 'XS201907100006', '1', '7', '1', '2019-07-10 16:15:46', '1');
INSERT INTO `t_sale_list` VALUES ('64', '320', '320', '没有添加备注', '2019-07-10 00:00:00', 'XS201907110001', '1', '7', '1', '2019-07-11 10:29:19', '1');
INSERT INTO `t_sale_list` VALUES ('65', '1', '1', '没有添加备注', '2019-07-10 00:00:00', 'XS201907110002', '1', '7', '1', '2019-07-11 10:31:20', '1');
INSERT INTO `t_sale_list` VALUES ('66', '8', '8', '没有添加备注', '2019-07-10 00:00:00', 'XS201907110003', '1', '7', '1', '2019-07-11 10:31:51', '1');
INSERT INTO `t_sale_list` VALUES ('67', '1', '1', '没有添加备注', '2019-07-11 00:00:00', 'XS201907110004', '1', '7', '1', '2019-07-11 10:32:42', '1');
INSERT INTO `t_sale_list` VALUES ('68', '8', '8', '没有添加备注', '2019-07-11 00:00:00', 'XS201907110005', '1', '4', '1', '2019-07-11 10:51:41', '1');
INSERT INTO `t_sale_list` VALUES ('69', '8', '8', '没有添加备注', '2019-07-15 00:00:00', 'XS201907150001', '1', '7', '1', '2019-07-15 09:55:13', '1');
INSERT INTO `t_sale_list` VALUES ('70', '8', '8', '没有添加备注', '2019-07-15 00:00:00', 'XS201907150002', '1', '1', '1', '2019-07-15 10:48:14', '1');
INSERT INTO `t_sale_list` VALUES ('71', '8', '8', '没有添加备注', '2019-07-15 00:00:00', 'XS201907150003', '1', '22', '1', '2019-07-15 10:51:10', '1');
INSERT INTO `t_sale_list` VALUES ('72', '80', '80', '没有添加备注', '2019-07-17 00:00:00', 'XS201907170001', '1', '4', '1', '2019-07-17 09:08:27', '1');
INSERT INTO `t_sale_list` VALUES ('73', '80', '80', '没有添加备注', '2019-07-16 00:00:00', 'XS201907170002', '2', '3', '1', '2019-07-17 09:23:17', '1');
INSERT INTO `t_sale_list` VALUES ('74', '50', '50', '没有添加备注', '2019-07-17 00:00:00', 'XS201907170003', '1', '1', '1', '2019-07-17 09:33:42', '1');
INSERT INTO `t_sale_list` VALUES ('75', '60', '60', '没有添加备注', '2019-07-17 00:00:00', 'XS201907170004', '1', '3', '1', '2019-07-17 09:37:41', '1');
INSERT INTO `t_sale_list` VALUES ('76', '50', '50', '没有添加备注', '2019-07-17 00:00:00', 'XS201907170005', '1', '2', '1', '2019-07-17 09:38:58', '1');
INSERT INTO `t_sale_list` VALUES ('77', '50', '50', '没有添加备注', '2019-07-16 00:00:00', 'XS201907170006', '1', '3', '1', '2019-07-17 09:40:24', '1');
INSERT INTO `t_sale_list` VALUES ('78', '50', '50', '没有添加备注', '2019-07-17 00:00:00', 'XS201907170007', '1', '4', '1', '2019-07-17 09:41:43', '1');
INSERT INTO `t_sale_list` VALUES ('79', '50', '50', '没有添加备注', '2019-07-17 00:00:00', 'XS201907170008', '1', '7', '1', '2019-07-17 09:43:32', '1');
INSERT INTO `t_sale_list` VALUES ('80', '50', '50', '没有添加备注', '2019-07-16 00:00:00', 'XS201907170009', '1', '3', '1', '2019-07-17 09:46:57', '1');
INSERT INTO `t_sale_list` VALUES ('81', '350', '350', '没有添加备注', '2019-07-23 17:46:15', 'XS201907170010', '1', '2', '1', '2019-07-17 09:55:39', '2');
INSERT INTO `t_sale_list` VALUES ('82', '50', '50', '没有添加备注', '2019-07-22 17:46:19', 'XS201907170011', '1', '2', '1', '2019-07-17 09:56:57', '2');
INSERT INTO `t_sale_list` VALUES ('83', '12', '12', '没有添加备注', '2019-07-16 00:00:00', 'XS201907170012', '1', '3', '1', '2019-07-17 10:20:52', '1');
INSERT INTO `t_sale_list` VALUES ('84', '450', '450', '没有添加备注', '2019-07-17 00:00:00', 'XS201907170013', '1', '2', '1', '2019-07-17 18:09:04', '1');
INSERT INTO `t_sale_list` VALUES ('85', '200', '200', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180001', '1', '1', '1', '2019-07-18 11:21:30', '1');
INSERT INTO `t_sale_list` VALUES ('86', '6', '6', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180002', '1', '1', '1', '2019-07-18 11:39:48', '1');
INSERT INTO `t_sale_list` VALUES ('87', '8', '8', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180003', '1', '1', '1', '2019-07-18 14:01:34', '1');
INSERT INTO `t_sale_list` VALUES ('88', '6', '6', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180004', '1', '1', '1', '2019-07-18 14:04:14', '1');
INSERT INTO `t_sale_list` VALUES ('89', '6', '6', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180005', '1', '1', '1', '2019-07-18 14:26:56', '1');
INSERT INTO `t_sale_list` VALUES ('90', '6', '6', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180006', '1', '1', '1', '2019-07-18 14:33:57', '1');
INSERT INTO `t_sale_list` VALUES ('91', '6', '6', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180007', '1', '2', '1', '2019-07-18 14:46:36', '1');
INSERT INTO `t_sale_list` VALUES ('92', '6', '6', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180008', '1', '2', '1', '2019-07-18 15:10:49', '1');
INSERT INTO `t_sale_list` VALUES ('93', '800', '800', '没有添加备注', '2019-07-18 00:00:00', 'XS201907180009', '1', '2', '1', '2019-07-18 16:25:56', '1');

-- ----------------------------
-- Table structure for `t_sale_list_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list_goods`;
CREATE TABLE `t_sale_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `salelistid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale_list_goods
-- ----------------------------
INSERT INTO `t_sale_list_goods` VALUES ('3', '0010', '18', '250g装', '劲仔小鱼干', '1', '20', '20', '袋', '2', '11', '2019-05-24 10:07:46', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('4', '0006', '14', '300g装', '冰糖金桔干', '33', '13', '429', '盒', '2', '11', '2019-05-24 10:07:52', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('5', '0006', '14', '300g装', '冰糖金桔干', '10', '13', '130', '盒', '3', '11', '2019-05-24 10:07:58', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('6', '0003', '11', '500g装', '野生东北黑木耳', '3', '38', '114', '袋', '4', '11', '2019-05-24 10:08:02', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('7', '0006', '14', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '4', '11', '2019-05-24 10:08:06', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('8', '0004', '12', '2斤装', '新疆红枣', '10', '25', '250', '袋', '5', '10', '2019-05-24 10:08:09', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('9', '0003', '11', '500g装', '野生东北黑木耳', '30', '38', '1140', '袋', '5', '11', '2019-05-24 10:08:11', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('10', '0003', '11', '500g装', '野生东北黑木耳', '100', '38', '3800', '袋', '6', '11', '2019-05-24 10:08:15', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('11', '0002', '2', 'Note8', '华为荣耀Note8', '1', '2200', '2200', '台', '7', '2', '2019-07-01 10:08:18', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('12', '0003', '11', '500g装', '野生东北黑木耳', '1', '900', '900', '袋', '39', '10', '2019-07-05 09:50:45', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('13', '0004', '12', '2斤装', '新疆红枣', '1', '200', '600', '袋', '39', '11', '2019-07-05 09:50:45', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('14', '0006', '14', '300g装', '冰糖金桔干', '1', '100', '400', '盒', '39', '8', '2019-07-05 09:50:45', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('15', '0008', '16', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '10', '100', '1000', '盒', '40', '13', '2019-07-05 09:55:14', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('16', '0010', '18', '250g装', '劲仔小鱼干', '2', '200', '400', '袋', '40', '11', '2019-07-05 09:55:22', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('17', '0002', '2', 'Note8', '华为荣耀Note9', '11', '321', '3531', '台', '41', '12', '2019-07-05 10:28:28', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('18', '0004', '12', '2斤装', '新疆红枣', '1000', '3', '3000', '袋', '42', '11', '2019-07-05 10:29:18', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('19', '0003', '11', '500g装', '野生东北黑木耳', '22', '12', '264', '袋', '43', '12', '2019-07-05 10:29:45', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('20', '0003', '11', '500g装', '野生东北黑木耳', '22', '3333', '73326', '袋', '44', '11', '2019-07-05 10:30:06', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('21', '0007', '15', '500g装', '吉利人家牛肉味蛋糕', '650', '1', '650', '袋', '45', '13', '2019-07-05 11:10:05', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('22', '0007', '15', '500g装', '吉利人家牛肉味蛋糕', '650', '1', '650', '袋', '46', '12', '2019-07-05 11:16:40', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('23', '0007', '15', '500g装', '吉利人家牛肉味蛋糕', '650', '1', '650', '袋', '47', '11', '2019-07-05 11:20:24', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('24', '0007', '15', '500g装', '吉利人家牛肉味蛋糕', '650', '1', '650', '袋', '48', '14', '2019-07-05 11:22:43', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('25', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '60', '50', '3000', '瓶', '49', '11', '2019-07-05 16:46:36', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('26', '0001', '1', '红色装', '陶华碧老干妈香辣脆油牛肉粒', '2', '1111', '2222', '瓶', '50', '12', '2019-07-08 10:38:20', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('27', '0030', '41', '100g', '饼', '50', '10', '500', '个', '58', '15', '2019-07-10 08:53:17', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('28', '0034', '43', 'TCL-1000-12623', 'TCL电视', '4', '8', '32', '台', '59', '13', '2019-07-10 14:36:18', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('29', '0037', '46', '', '碎碎冰', '7', '8', '56', '条', '60', '12', '2019-07-10 14:37:55', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('30', '0038', '47', '150g', '可爱多冰淇淋', '10', '8', '80', '个', '61', '13', '2019-07-10 15:33:30', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('31', '0030', '41', '100g', '饼', '10', '10', '100', '个', '62', '14', '2019-07-10 15:48:29', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('32', '0029', '40', '70g装', '德芙', '10', '8', '80', '条', '63', '12', '2019-07-10 16:15:46', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('33', '0030', '41', '100g', '饼', '10', '8', '80', '个', '64', '13', '2019-07-11 10:29:19', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('34', '0030', '41', '100g', '饼', '10', '8', '80', '个', '64', '12', '2019-07-11 10:29:19', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('35', '0029', '40', '70g装', '德芙', '10', '8', '80', '条', '64', '13', '2019-07-11 10:29:19', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('36', '0030', '41', '100g', '饼', '10', '8', '80', '个', '64', '12', '2019-07-11 10:29:19', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('37', '0030', '41', '100g', '饼', '1', '1', '1', '个', '65', '13', '2019-07-11 10:31:20', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('38', '0030', '41', '100g', '饼', '1', '8', '8', '个', '66', '14', '2019-07-11 10:31:52', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('39', '0030', '41', '100g', '饼', '1', '1', '1', '个', '67', '12', '2019-07-11 10:32:43', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('40', '0030', '41', '100g', '饼', '1', '8', '8', '个', '68', '13', '2019-07-11 10:51:41', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('41', '0040', '49', '500g', '苹果', '1', '8', '8', '个', '69', '12', '2019-07-15 09:55:13', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('42', '0037', '46', '', '碎碎冰', '1', '8', '8', '条', '70', '14', '2019-07-15 10:48:14', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('43', '0038', '47', '150g', '可爱多冰淇淋', '1', '8', '8', '个', '71', '15', '2019-07-15 10:51:10', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('44', '0041', '50', '550ml', '可口可乐', '10', '8', '80', '个', '72', '12', '2019-07-17 09:08:27', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('45', '0041', '50', '550ml', '可口可乐', '10', '8', '80', '个', '73', '13', '2019-07-17 09:23:17', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('46', '456', '62', '123', '123', '10', '5', '50', '盆', '74', '14', '2019-07-17 09:33:42', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('47', '789', '61', '123', '123', '10', '6', '60', '斤', '75', '12', '2019-07-17 09:37:41', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('48', '123', '64', 'huh', '%huhu', '10', '5', '50', '箱', '76', '13', '2019-07-17 09:38:58', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('49', '123', '64', 'huh', '%huhu', '10', '5', '50', '箱', '77', '15', '2019-07-17 09:40:24', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('50', '123', '64', 'huh', '%huhu', '10', '5', '50', '箱', '78', '12', '2019-07-17 09:41:43', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('51', '123', '64', 'huh', '%huhu', '10', '5', '50', '箱', '79', '14', '2019-07-17 09:43:32', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('52', '123', '64', 'huh', '%huhu', '10', '5', '50', '箱', '80', '12', '2019-07-17 09:46:58', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('53', '234', '71', 'ew', 'er', '10', '35', '350', '盆', '81', '13', '2019-07-17 09:55:39', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('54', '456', '62', '123', '123', '10', '5', '50', '盆', '82', '12', '2019-07-17 09:56:57', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('55', '009', '72', '09-09', 'jk', '1', '12', '12', '斤', '83', '14', '2019-07-17 10:20:52', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('56', '06-660', '59', 'yt-uii', '椰子灰', '75', '6', '450', '斤', '84', '12', '2019-07-17 18:09:04', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('57', '1256', '70', '500ml', '大雪碧', '10', '10', '100', '桶', '85', '13', '2019-07-18 11:21:30', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('58', '0054', '54', '100g', '酸奶疙瘩', '10', '10', '100', '袋', '85', '14', '2019-07-18 11:21:30', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('59', '06-660', '59', 'yt-uii', '椰子灰', '1', '6', '6', '斤', '86', '13', '2019-07-18 11:39:48', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('60', '06-660', '59', 'yt-uii', '椰子灰', '1', '6', '6', '斤', '91', '12', '2019-07-18 14:46:36', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('61', '0056', '56', '500g', '大枣', '1', '6', '6', '斤', '92', '14', '2019-07-18 15:10:49', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('62', '06-660', '59', 'yt-uii', '椰子灰', '10', '10', '100', '斤', '93', '12', '2019-07-18 16:25:56', '1', '1');
INSERT INTO `t_sale_list_goods` VALUES ('65', '789', '1', '500桶转', '大瓶可乐', '789456', '50', '1000', '桶', '97', '999', '2019-07-29 14:51:39', '2', '1');
INSERT INTO `t_sale_list_goods` VALUES ('66', '147', '1', '700箱', '衣服', '258369', '50', '2000', '箱', '97', '52525', '2019-07-29 14:51:39', '2', '1');

-- ----------------------------
-- Table structure for `t_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(300) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delflag` int(2) unsigned zerofill NOT NULL DEFAULT '00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('1', '上海市金山区张堰镇松金公路2072号6607室', '小张', '上海福桂食品有限公司', '1', '失信供应商', '2019-01-24 13:26:27', '1', '01');
INSERT INTO `t_supplier` VALUES ('2', '安徽省合肥市肥西县桃花工业园合派路', '小王', '安徽麦堡食品工业有限公司', '1', '失信供应商', '2019-02-24 13:26:30', '1', '00');
INSERT INTO `t_supplier` VALUES ('3', '晋江市罗山后林西区41号', '小李', '福建省晋江市罗山惠康食品有限公司', '1', '优质供应商', '2019-02-24 13:26:35', '1', '00');
INSERT INTO `t_supplier` VALUES ('4', '南京市江宁区科学园竹山路565号1幢', '小丽', '南京含羞草食品有限公司', '1', '优质供应商', '2019-03-24 13:26:39', '1', '00');
INSERT INTO `t_supplier` VALUES ('5', '南京市高淳县阳江镇新桥村下桥278号', '王大狗', '南京禾乃美工贸有限公司', '1', '失信供应商', '2019-03-24 13:26:41', '1', '00');
INSERT INTO `t_supplier` VALUES ('6', '开平市水口镇东埠路６号', '小七', '开平广合腐乳有限公司', '1', '优质供应商', '2019-04-24 13:26:43', '1', '00');
INSERT INTO `t_supplier` VALUES ('7', '汕头市跃进路２３号利鸿基中心大厦写字楼２座', '刘钩子', '汕头市金茂食品有限公司', '1', '优质供应商', '2019-04-24 13:26:44', '1', '00');
INSERT INTO `t_supplier` VALUES ('8', '南京市溧水区经济开发区', '七枷社', '南京喜之郎食品有限公司', '1', '失信供应商', '2019-04-24 13:26:47', '1', '00');
INSERT INTO `t_supplier` VALUES ('9', '深圳市罗湖区翠竹北路中深石化区厂房B栋6楼', '小蔡', '深圳昌信实业有限公司', '1', '优质供应商', '2019-04-24 13:26:49', '1', '00');
INSERT INTO `t_supplier` VALUES ('10', '南京市下关区金陵小区6村27-2-203室', '小五', '南京市下关区红鹰调味品商行', '1', '优质供应商', '2019-05-24 13:26:50', '1', '00');
INSERT INTO `t_supplier` VALUES ('11', '荔浦县荔塔路１６－３６号', '亲琴东方', '桂林阜康食品工业有限公司', '1', '失信供应商', '2019-05-24 13:26:52', '1', '00');
INSERT INTO `t_supplier` VALUES ('12', '南京鼓楼区世纪大楼123号', '小三', '南京大王科技', '1', '123', '2019-05-24 13:26:54', '1', '00');
INSERT INTO `t_supplier` VALUES ('28', '开发区学府大街十号', '孙家旭', '大连程余商贸公司', '1', '失信供应商', '2019-06-19 09:56:34', '1', '00');
INSERT INTO `t_supplier` VALUES ('31', '林翌青', '林翌青啊', '林翌青', '1', '失信供应商', '2019-06-19 15:33:41', '1', '00');
INSERT INTO `t_supplier` VALUES ('32', '林清', '林观云', '林肆玖', '1', '失信供应商', '2019-06-19 15:40:59', '1', '00');
INSERT INTO `t_supplier` VALUES ('33', '琴琴', '琴琴', '琴琴', '1', '失信供应商', '2019-06-19 16:40:01', '1', '00');
INSERT INTO `t_supplier` VALUES ('35', '大连成成', '成成', '大连成成', '1', '失信供应商', '2019-06-24 15:44:53', '1', '00');
INSERT INTO `t_supplier` VALUES ('36', '大连呼呼', '呼呼', '大连呼呼', '1', '失信供应商', '2019-06-24 15:44:53', '1', '00');
INSERT INTO `t_supplier` VALUES ('37', '大连成成', '成成', '大连成成', '1', '诚信', '2019-06-24 16:03:31', '1', '00');
INSERT INTO `t_supplier` VALUES ('38', '大连呼呼', '呼呼', '大连呼呼', '1', '失信供应商', '2019-06-24 16:03:31', '1', '00');
INSERT INTO `t_supplier` VALUES ('39', '大连xx街道xx路xx号', '孙策\r\n', '大连xxxx有限公司\r\n', '1', '失信供应商', '2019-06-25 13:43:14', '1', '00');
INSERT INTO `t_supplier` VALUES ('41', '大连湾', '是你', '大连成成成', '1', '优质供应商', '2019-06-04 18:24:53', '1', '00');
INSERT INTO `t_supplier` VALUES ('42', '成都', '是他', '盛驰公司', '1', '优质供应商', '2019-07-04 18:24:53', '1', '00');
INSERT INTO `t_supplier` VALUES ('43', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-08 11:25:28', '1', '00');
INSERT INTO `t_supplier` VALUES ('44', '大连塘关', '塘关关', '陈塘关', '10', '优质供货商', '2019-07-31 09:49:37', '1', '00');
INSERT INTO `t_supplier` VALUES ('45', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-08 11:28:14', '1', '00');
INSERT INTO `t_supplier` VALUES ('46', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-08 11:33:20', '1', '00');
INSERT INTO `t_supplier` VALUES ('47', '大连塘关', '塘关', '陈塘关', '1', '失信供应商', '2019-07-08 11:50:16', '1', '00');
INSERT INTO `t_supplier` VALUES ('48', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-08 13:48:09', '1', '00');
INSERT INTO `t_supplier` VALUES ('49', '塘关', '陈', '陈塘有限公司', '1', '失信供应商', '2019-07-08 13:54:36', '1', '00');
INSERT INTO `t_supplier` VALUES ('51', 'asd', 'asd', '', '1', '失信供应商', '2019-08-08 14:33:51', '1', '01');
INSERT INTO `t_supplier` VALUES ('52', '大连开发区', '孙嘉', '大连程宇', '1', '失信供应商', '2019-08-08 15:17:10', '1', '00');
INSERT INTO `t_supplier` VALUES ('53', '大连开发区', '孙嘉', '大连程宇', '1', '优质供货商', '2019-09-08 15:21:16', '1', '00');
INSERT INTO `t_supplier` VALUES ('54', '梵蒂冈递归', '东方', '东方', '1', '失信供应商', '2019-09-09 14:55:28', '1', '00');
INSERT INTO `t_supplier` VALUES ('55', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-09-09 15:55:55', '1', '00');
INSERT INTO `t_supplier` VALUES ('77', 'wqe', 'wq', 'we', '1', '失信供应商', '2019-10-16 11:19:35', '1', '00');
INSERT INTO `t_supplier` VALUES ('78', 'we', 'wer', 'erw', '1', '失信供应商', '2019-10-16 11:27:19', '1', '01');
INSERT INTO `t_supplier` VALUES ('79', '123', '1233', 'rrr', '1', '失信供应商', '2019-11-16 11:33:42', '1', '00');
INSERT INTO `t_supplier` VALUES ('91', 'fd', 'df', 'fdv', '1', '失信供应商', '2019-11-18 15:48:23', '1', '01');
INSERT INTO `t_supplier` VALUES ('129', '3rere', '小王', '34', '1', '失信供应商', '2019-12-25 12:44:16', '1', '00');
INSERT INTO `t_supplier` VALUES ('130', '33', '32', '23', '1', '失信供应商', '2019-12-25 12:44:16', '1', '00');
INSERT INTO `t_supplier` VALUES ('131', '23', '23', '23', '1', '失信供应商', '2019-12-25 12:44:16', '1', '00');
INSERT INTO `t_supplier` VALUES ('132', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-31 09:04:13', '1', '00');
INSERT INTO `t_supplier` VALUES ('133', '塘关', '陈', '陈塘有限公司', '1', null, '2019-07-31 09:04:13', '1', '00');
INSERT INTO `t_supplier` VALUES ('134', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-31 09:21:38', '1', '00');
INSERT INTO `t_supplier` VALUES ('135', '塘关', '陈', '陈塘有限公司', '1', null, '2019-07-31 09:21:38', '1', '00');
INSERT INTO `t_supplier` VALUES ('136', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-31 09:37:13', '1', '00');
INSERT INTO `t_supplier` VALUES ('137', '塘关', '陈', '陈塘有限公司', '1', null, '2019-07-31 09:37:13', '1', '00');
INSERT INTO `t_supplier` VALUES ('138', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-31 09:48:31', '1', '00');
INSERT INTO `t_supplier` VALUES ('139', '塘关', '陈', '陈塘有限公司', '1', null, '2019-07-31 09:48:31', '1', '00');
INSERT INTO `t_supplier` VALUES ('140', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-31 09:49:54', '1', '00');
INSERT INTO `t_supplier` VALUES ('141', '塘关', '陈', '陈塘有限公司', '1', null, '2019-07-31 09:49:54', '1', '00');
INSERT INTO `t_supplier` VALUES ('142', '大连塘关', '塘关', '陈塘关', '10', '优质供货商', '2019-07-31 09:50:53', '1', '00');
INSERT INTO `t_supplier` VALUES ('143', '塘关', '陈', '陈塘有限公司', '1', null, '2019-07-31 09:50:53', '1', '00');
