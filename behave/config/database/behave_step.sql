/*
Navicat MySQL Data Transfer

Source Server         : qa_all
Source Server Version : 50632
Source Host           : 172.17.0.203:3306
Source Database       : qa_automation

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2020-03-06 22:23:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for behave_step
-- ----------------------------
DROP TABLE IF EXISTS `behave_step`;
CREATE TABLE `behave_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL COMMENT '执行编号',
  `Feature` varchar(255) NOT NULL COMMENT '专题',
  `Scenario` varchar(255) NOT NULL COMMENT '方案',
  `Behave` varchar(5) NOT NULL COMMENT '行为',
  `Step` text NOT NULL COMMENT '步骤',
  `Status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `behave_featurefk_2` (`Feature`),
  CONSTRAINT `behave_featurefk_2` FOREIGN KEY (`Feature`) REFERENCES `behave_feature` (`Feature`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='行为驱动业务表';

-- ----------------------------
-- Records of behave_step
-- ----------------------------
INSERT INTO `behave_step` VALUES ('1', '1', '第一', '第一场景', 'Given', '打开Given程序', '1');
INSERT INTO `behave_step` VALUES ('2', '2', '第一', '第一场景', 'When', '开始When程序', '1');
INSERT INTO `behave_step` VALUES ('3', '3', '第一', '第二场景', 'Then', '测试Then数据', '1');
INSERT INTO `behave_step` VALUES ('4', '1', '第二', '第二测试场景', 'Then', '测试Then数据', '1');
