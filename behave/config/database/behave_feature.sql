/*
Navicat MySQL Data Transfer

Source Server         : qa_all
Source Server Version : 50632
Source Host           : 172.17.0.203:3306
Source Database       : qa_automation

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2020-03-06 22:22:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for behave_feature
-- ----------------------------
DROP TABLE IF EXISTS `behave_feature`;
CREATE TABLE `behave_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Domain` varchar(255) NOT NULL COMMENT '功能域',
  `Feature` varchar(255) NOT NULL COMMENT '专题',
  `Status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `behave_feature` (`Feature`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='行为驱动专题表';

-- ----------------------------
-- Records of behave_feature
-- ----------------------------
INSERT INTO `behave_feature` VALUES ('1', '测试', '第一', '1');
INSERT INTO `behave_feature` VALUES ('2', '测试', '第二', '1');
