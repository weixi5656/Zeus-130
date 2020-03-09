/*
Navicat MySQL Data Transfer

Source Server         : qa_all
Source Server Version : 50632
Source Host           : 172.17.0.203:3306
Source Database       : qa_automation

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2020-03-06 22:23:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for behave_scenario
-- ----------------------------
DROP TABLE IF EXISTS `behave_scenario`;
CREATE TABLE `behave_scenario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ScenOderId` int(11) NOT NULL COMMENT '执行编号',
  `Feature` varchar(255) NOT NULL COMMENT '专题',
  `Scenario` varchar(255) NOT NULL COMMENT '方案',
  `Status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `behave_featurefk_1` (`Feature`),
  CONSTRAINT `behave_featurefk_1` FOREIGN KEY (`Feature`) REFERENCES `behave_feature` (`Feature`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='行为驱动方案表';

-- ----------------------------
-- Records of behave_scenario
-- ----------------------------
INSERT INTO `behave_scenario` VALUES ('1', '1', '第一', '第一场景', '1');
INSERT INTO `behave_scenario` VALUES ('2', '2', '第一', '第二场景', '1');
INSERT INTO `behave_scenario` VALUES ('3', '1', '第二', '第二测试场景', '1');
