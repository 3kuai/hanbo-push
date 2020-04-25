/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-04-25 19:48:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_app
-- ----------------------------
DROP TABLE IF EXISTS `t_app`;
CREATE TABLE `t_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `app_secret` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `developer_id` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_app
-- ----------------------------
INSERT INTO `t_app` VALUES ('1', '7b3a24bda8f0434ebeb6efb75c2a6b17', 'stock-app', 'ed4a2b88d9', null, '1', '0', null);
INSERT INTO `t_app` VALUES ('2', 'c2a101dc5aaa4a7c8d6418f4440c543e', 'news-app', '7c4d7dac7d', null, '1', '0', null);
INSERT INTO `t_app` VALUES ('3', 'a519dc144c274c62a275c0f5ffef360e', 'wechat-app', '674fe39d40', null, '1', '0', null);

-- ----------------------------
-- Table structure for t_developer
-- ----------------------------
DROP TABLE IF EXISTS `t_developer`;
CREATE TABLE `t_developer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `developer` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_developer
-- ----------------------------
INSERT INTO `t_developer` VALUES ('1', null, 'lucas', 'lucas', '0', null);

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `platform` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES ('1', '1', '15821303235', '1', '1', '2020-04-23 13:38:02', null);
INSERT INTO `t_device` VALUES ('2', '1', '15821303234', '1', '1', '2020-04-23 13:38:02', null);
INSERT INTO `t_device` VALUES ('3', '1', '15821303233', '1', '1', '2020-04-23 13:38:02', null);
INSERT INTO `t_device` VALUES ('4', '1', '15821303232', '1', '1', '2020-04-23 13:38:02', null);
INSERT INTO `t_device` VALUES ('5', '1', '15821303236', '1', '1', '2020-04-24 21:00:45', null);
INSERT INTO `t_device` VALUES ('6', '1', '15821303237', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('7', '1', '15821303238', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('8', '1', '15821303239', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('9', '1', '15821303240', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('10', '1', '15821303241', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('11', '1', '15821303242', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('12', '1', '15821303243', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('13', '1', '15821303244', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('14', '1', '15821303245', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('15', '1', '15821303246', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('16', '1', '15821303247', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('17', '1', '15821303248', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('18', '1', '15821303249', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('19', '1', '15821303250', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('20', '1', '15821303251', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('21', '1', '15821303252', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('22', '1', '15821303253', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('23', '1', '15821303254', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('24', '1', '15821303255', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('25', '1', '15821303256', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('26', '1', '15821303257', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('27', '1', '15821303258', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('28', '1', '15821303259', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('29', '1', '15821303260', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('30', '1', '15821303261', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('31', '1', '15821303262', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('32', '1', '15821303263', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('33', '1', '15821303264', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('34', '1', '15821303265', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('35', '1', '15821303266', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('36', '1', '15821303267', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('37', '1', '15821303268', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('38', '1', '15821303269', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('39', '1', '15821303270', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('40', '1', '15821303271', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('41', '1', '15821303272', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('42', '1', '15821303273', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('43', '1', '15821303274', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('44', '1', '15821303275', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('45', '1', '15821303276', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('46', '1', '15821303277', '1', '1', '2020-04-25 14:48:07', null);
INSERT INTO `t_device` VALUES ('47', '1', '15821303278', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('48', '1', '15821303279', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('49', '1', '15821303280', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('50', '1', '15821303281', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('51', '1', '15821303282', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('52', '1', '15821303283', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('53', '1', '15821303284', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('54', '1', '15821303285', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('55', '1', '15821303286', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('56', '1', '15821303287', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('57', '1', '15821303288', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('58', '1', '15821303289', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('59', '1', '15821303290', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('60', '1', '15821303291', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('61', '1', '15821303292', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('62', '1', '15821303293', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('63', '1', '15821303294', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('64', '1', '15821303295', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('65', '1', '15821303296', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('66', '1', '15821303297', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('67', '1', '15821303298', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('68', '1', '15821303299', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('69', '1', '15821303300', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('70', '1', '15821303301', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('71', '1', '15821303302', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('72', '1', '15821303303', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('73', '1', '15821303304', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('74', '1', '15821303305', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('75', '1', '15821303306', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('76', '1', '15821303307', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('77', '1', '15821303308', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('78', '1', '15821303309', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('79', '1', '15821303310', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('80', '1', '15821303311', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('81', '1', '15821303312', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('82', '1', '15821303313', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('83', '1', '15821303314', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('84', '1', '15821303315', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('85', '1', '15821303316', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('86', '1', '15821303317', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('87', '1', '15821303318', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('88', '1', '15821303319', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('89', '1', '15821303320', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('90', '1', '15821303321', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('91', '1', '15821303322', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('92', '1', '15821303323', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('93', '1', '15821303324', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('94', '1', '15821303325', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('95', '1', '15821303326', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('96', '1', '15821303327', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('97', '1', '15821303328', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('98', '1', '15821303329', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('99', '1', '15821303330', '1', '1', '2020-04-25 14:48:08', null);
INSERT INTO `t_device` VALUES ('100', '1', '15821303331', '1', '1', '2020-04-25 14:48:08', null);

-- ----------------------------
-- Table structure for t_device_message
-- ----------------------------
DROP TABLE IF EXISTS `t_device_message`;
CREATE TABLE `t_device_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `message_id` bigint(11) DEFAULT NULL,
  `delivery_state` int(1) DEFAULT NULL,
  `read_state` int(1) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_device_message
-- ----------------------------
INSERT INTO `t_device_message` VALUES ('10', '1', 'stock-app', '15821303235', '11', '1', '0', '2020-04-23 12:40:55', null);
INSERT INTO `t_device_message` VALUES ('11', '1', 'stock-app', '15821303234', '12', '1', '0', '2020-04-23 14:59:04', '2020-04-23 15:34:00');
INSERT INTO `t_device_message` VALUES ('12', '1', 'stock-app', '15821303235', '12', '1', '0', '2020-04-23 14:59:05', '2020-04-23 15:00:00');
INSERT INTO `t_device_message` VALUES ('13', '1', 'stock-app', '15821303232', '12', '1', '0', '2020-04-23 14:59:05', '2020-04-23 15:34:00');
INSERT INTO `t_device_message` VALUES ('14', '1', 'stock-app', '15821303233', '12', '1', '0', '2020-04-23 14:59:05', '2020-04-23 15:34:00');
INSERT INTO `t_device_message` VALUES ('15', '1', 'stock-app', '15821303234', '13', '1', '0', '2020-04-23 15:35:00', null);
INSERT INTO `t_device_message` VALUES ('16', '1', 'stock-app', '15821303235', '13', '1', '0', '2020-04-23 15:35:00', '2020-04-23 15:38:00');
INSERT INTO `t_device_message` VALUES ('17', '1', 'stock-app', '15821303232', '13', '1', '0', '2020-04-23 15:35:00', null);
INSERT INTO `t_device_message` VALUES ('18', '1', 'stock-app', '15821303233', '13', '1', '0', '2020-04-23 15:35:00', null);
INSERT INTO `t_device_message` VALUES ('19', '1', 'stock-app', '15821303234', '14', '1', '0', '2020-04-23 15:39:05', null);
INSERT INTO `t_device_message` VALUES ('20', '1', 'stock-app', '15821303235', '14', '1', '0', '2020-04-23 15:39:05', null);
INSERT INTO `t_device_message` VALUES ('21', '1', 'stock-app', '15821303232', '14', '1', '0', '2020-04-23 15:39:05', null);
INSERT INTO `t_device_message` VALUES ('22', '1', 'stock-app', '15821303233', '14', '1', '0', '2020-04-23 15:39:05', null);
INSERT INTO `t_device_message` VALUES ('23', '1', 'stock-app', '15821303234', '15', '1', '0', '2020-04-23 15:41:30', null);
INSERT INTO `t_device_message` VALUES ('24', '1', 'stock-app', '15821303235', '15', '1', '0', '2020-04-23 15:41:30', null);
INSERT INTO `t_device_message` VALUES ('25', '1', 'stock-app', '15821303232', '15', '1', '0', '2020-04-23 15:41:30', null);
INSERT INTO `t_device_message` VALUES ('26', '1', 'stock-app', '15821303233', '15', '1', '0', '2020-04-23 15:41:30', null);
INSERT INTO `t_device_message` VALUES ('27', '1', 'stock-app', '15821303234', '16', '1', '0', '2020-04-23 15:42:38', null);
INSERT INTO `t_device_message` VALUES ('28', '1', 'stock-app', '15821303235', '16', '1', '0', '2020-04-23 15:42:38', null);
INSERT INTO `t_device_message` VALUES ('29', '1', 'stock-app', '15821303232', '16', '1', '0', '2020-04-23 15:42:38', null);
INSERT INTO `t_device_message` VALUES ('30', '1', 'stock-app', '15821303233', '16', '1', '0', '2020-04-23 15:42:38', null);
INSERT INTO `t_device_message` VALUES ('31', '1', 'stock-app', '15821303234', '17', '1', '0', '2020-04-23 15:43:25', null);
INSERT INTO `t_device_message` VALUES ('32', '1', 'stock-app', '15821303235', '17', '1', '0', '2020-04-23 15:43:25', null);
INSERT INTO `t_device_message` VALUES ('33', '1', 'stock-app', '15821303232', '17', '1', '0', '2020-04-23 15:43:25', null);
INSERT INTO `t_device_message` VALUES ('34', '1', 'stock-app', '15821303233', '17', '1', '0', '2020-04-23 15:43:25', null);
INSERT INTO `t_device_message` VALUES ('35', '1', 'stock-app', '15821303234', '18', '1', '0', '2020-04-23 15:56:28', null);
INSERT INTO `t_device_message` VALUES ('36', '1', 'stock-app', '15821303235', '18', '1', '0', '2020-04-23 15:56:28', null);
INSERT INTO `t_device_message` VALUES ('37', '1', 'stock-app', '15821303232', '18', '1', '0', '2020-04-23 15:56:28', null);
INSERT INTO `t_device_message` VALUES ('38', '1', 'stock-app', '15821303233', '18', '1', '0', '2020-04-23 15:56:28', null);
INSERT INTO `t_device_message` VALUES ('39', '1', 'stock-app', '15821303234', '19', '1', '0', '2020-04-24 13:31:30', null);
INSERT INTO `t_device_message` VALUES ('40', '1', 'stock-app', '15821303235', '19', '1', '0', '2020-04-24 13:31:30', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES ('41', '1', 'stock-app', '15821303232', '19', '1', '0', '2020-04-24 13:31:30', null);
INSERT INTO `t_device_message` VALUES ('42', '1', 'stock-app', '15821303233', '19', '1', '0', '2020-04-24 13:31:30', null);
INSERT INTO `t_device_message` VALUES ('43', '1', 'stock-app', '15821303234', '20', '1', '0', '2020-04-24 13:35:43', null);
INSERT INTO `t_device_message` VALUES ('44', '1', 'stock-app', '15821303235', '20', '1', '0', '2020-04-24 13:35:43', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES ('45', '1', 'stock-app', '15821303232', '20', '1', '0', '2020-04-24 13:35:43', null);
INSERT INTO `t_device_message` VALUES ('46', '1', 'stock-app', '15821303233', '20', '1', '0', '2020-04-24 13:35:43', null);
INSERT INTO `t_device_message` VALUES ('47', '1', 'stock-app', '15821303234', '21', '1', '0', '2020-04-24 13:37:34', null);
INSERT INTO `t_device_message` VALUES ('48', '1', 'stock-app', '15821303235', '21', '1', '0', '2020-04-24 13:37:34', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES ('49', '1', 'stock-app', '15821303232', '21', '1', '0', '2020-04-24 13:37:34', null);
INSERT INTO `t_device_message` VALUES ('50', '1', 'stock-app', '15821303233', '21', '1', '0', '2020-04-24 13:37:34', null);
INSERT INTO `t_device_message` VALUES ('51', '1', 'stock-app', '15821303234', '22', '1', '0', '2020-04-24 13:39:34', null);
INSERT INTO `t_device_message` VALUES ('52', '1', 'stock-app', '15821303235', '22', '1', '0', '2020-04-24 13:39:34', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES ('53', '1', 'stock-app', '15821303232', '22', '1', '0', '2020-04-24 13:39:34', null);
INSERT INTO `t_device_message` VALUES ('54', '1', 'stock-app', '15821303233', '22', '1', '0', '2020-04-24 13:39:34', null);
INSERT INTO `t_device_message` VALUES ('55', '1', 'stock-app', '15821303234', '23', '1', '0', '2020-04-24 14:01:58', null);
INSERT INTO `t_device_message` VALUES ('56', '1', 'stock-app', '15821303235', '23', '1', '0', '2020-04-24 14:01:58', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES ('57', '1', 'stock-app', '15821303232', '23', '1', '0', '2020-04-24 14:01:58', null);
INSERT INTO `t_device_message` VALUES ('58', '1', 'stock-app', '15821303233', '23', '1', '0', '2020-04-24 14:01:58', null);
INSERT INTO `t_device_message` VALUES ('59', '1', 'stock-app', '15821303234', '24', '1', '0', '2020-04-24 14:12:12', '2020-04-24 14:13:00');
INSERT INTO `t_device_message` VALUES ('60', '1', 'stock-app', '15821303235', '24', '1', '0', '2020-04-24 14:12:12', '2020-04-24 14:13:00');
INSERT INTO `t_device_message` VALUES ('61', '1', 'stock-app', '15821303232', '24', '1', '0', '2020-04-24 14:12:12', '2020-04-24 14:13:00');
INSERT INTO `t_device_message` VALUES ('62', '1', 'stock-app', '15821303233', '24', '1', '0', '2020-04-24 14:12:12', '2020-04-24 14:13:00');
INSERT INTO `t_device_message` VALUES ('63', '1', 'stock-app', '15821303234', '25', '1', '0', '2020-04-24 14:16:04', null);
INSERT INTO `t_device_message` VALUES ('64', '1', 'stock-app', '15821303235', '25', '1', '0', '2020-04-24 14:16:04', null);
INSERT INTO `t_device_message` VALUES ('65', '1', 'stock-app', '15821303232', '25', '1', '0', '2020-04-24 14:16:04', null);
INSERT INTO `t_device_message` VALUES ('66', '1', 'stock-app', '15821303233', '25', '1', '0', '2020-04-24 14:16:04', null);
INSERT INTO `t_device_message` VALUES ('67', '1', 'stock-app', '15821303234', '26', '1', '0', '2020-04-24 14:18:51', null);
INSERT INTO `t_device_message` VALUES ('68', '1', 'stock-app', '15821303235', '26', '1', '0', '2020-04-24 14:18:51', null);
INSERT INTO `t_device_message` VALUES ('69', '1', 'stock-app', '15821303232', '26', '1', '0', '2020-04-24 14:18:51', null);
INSERT INTO `t_device_message` VALUES ('70', '1', 'stock-app', '15821303233', '26', '1', '0', '2020-04-24 14:18:51', null);
INSERT INTO `t_device_message` VALUES ('71', '1', 'stock-app', '15821303234', '27', '1', '0', '2020-04-24 14:33:18', '2020-04-24 14:34:00');
INSERT INTO `t_device_message` VALUES ('72', '1', 'stock-app', '15821303235', '27', '1', '0', '2020-04-24 14:33:18', '2020-04-24 14:34:00');
INSERT INTO `t_device_message` VALUES ('73', '1', 'stock-app', '15821303232', '27', '1', '0', '2020-04-24 14:33:18', '2020-04-24 14:34:00');
INSERT INTO `t_device_message` VALUES ('74', '1', 'stock-app', '15821303233', '27', '1', '0', '2020-04-24 14:33:18', '2020-04-24 14:34:00');
INSERT INTO `t_device_message` VALUES ('75', '1', 'stock-app', '15821303236', '28', '1', '0', '2020-04-24 21:01:13', null);
INSERT INTO `t_device_message` VALUES ('76', '1', 'stock-app', '15821303234', '28', '1', '0', '2020-04-24 21:01:13', null);
INSERT INTO `t_device_message` VALUES ('77', '1', 'stock-app', '15821303235', '28', '1', '0', '2020-04-24 21:01:13', null);
INSERT INTO `t_device_message` VALUES ('78', '1', 'stock-app', '15821303232', '28', '1', '0', '2020-04-24 21:01:13', null);
INSERT INTO `t_device_message` VALUES ('79', '1', 'stock-app', '15821303233', '28', '1', '0', '2020-04-24 21:01:13', null);
INSERT INTO `t_device_message` VALUES ('80', '1', 'stock-app', '15821303236', '29', '1', '0', '2020-04-24 21:04:12', null);
INSERT INTO `t_device_message` VALUES ('81', '1', 'stock-app', '15821303234', '29', '1', '0', '2020-04-24 21:04:12', null);
INSERT INTO `t_device_message` VALUES ('82', '1', 'stock-app', '15821303235', '29', '1', '0', '2020-04-24 21:04:12', null);
INSERT INTO `t_device_message` VALUES ('83', '1', 'stock-app', '15821303232', '29', '1', '0', '2020-04-24 21:04:12', null);
INSERT INTO `t_device_message` VALUES ('84', '1', 'stock-app', '15821303233', '29', '1', '0', '2020-04-24 21:04:12', null);
INSERT INTO `t_device_message` VALUES ('85', '1', 'stock-app', '15821303236', '30', '1', '0', '2020-04-24 21:05:12', null);
INSERT INTO `t_device_message` VALUES ('86', '1', 'stock-app', '15821303234', '30', '1', '0', '2020-04-24 21:05:12', null);
INSERT INTO `t_device_message` VALUES ('87', '1', 'stock-app', '15821303235', '30', '1', '0', '2020-04-24 21:05:12', null);
INSERT INTO `t_device_message` VALUES ('88', '1', 'stock-app', '15821303232', '30', '1', '0', '2020-04-24 21:05:12', null);
INSERT INTO `t_device_message` VALUES ('89', '1', 'stock-app', '15821303233', '30', '1', '0', '2020-04-24 21:05:12', null);
INSERT INTO `t_device_message` VALUES ('90', '1', 'stock-app', '15821303236', '31', '1', '0', '2020-04-24 21:06:49', null);
INSERT INTO `t_device_message` VALUES ('91', '1', 'stock-app', '15821303234', '31', '1', '0', '2020-04-24 21:06:49', null);
INSERT INTO `t_device_message` VALUES ('92', '1', 'stock-app', '15821303235', '31', '1', '0', '2020-04-24 21:06:49', null);
INSERT INTO `t_device_message` VALUES ('93', '1', 'stock-app', '15821303232', '31', '1', '0', '2020-04-24 21:06:49', null);
INSERT INTO `t_device_message` VALUES ('94', '1', 'stock-app', '15821303233', '31', '1', '0', '2020-04-24 21:06:49', null);
INSERT INTO `t_device_message` VALUES ('95', '1', 'stock-app', '15821303236', '32', '1', '0', '2020-04-24 21:13:31', '2020-04-25 09:27:00');
INSERT INTO `t_device_message` VALUES ('96', '1', 'stock-app', '15821303234', '32', '1', '0', '2020-04-24 21:13:31', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('97', '1', 'stock-app', '15821303235', '32', '1', '0', '2020-04-24 21:13:31', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('98', '1', 'stock-app', '15821303232', '32', '1', '0', '2020-04-24 21:13:31', null);
INSERT INTO `t_device_message` VALUES ('99', '1', 'stock-app', '15821303233', '32', '1', '0', '2020-04-24 21:13:31', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('100', '1', 'stock-app', '15821303236', '33', '1', '0', '2020-04-25 09:05:36', '2020-04-25 09:27:00');
INSERT INTO `t_device_message` VALUES ('101', '1', 'stock-app', '15821303234', '33', '1', '0', '2020-04-25 09:05:36', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('102', '1', 'stock-app', '15821303235', '33', '1', '0', '2020-04-25 09:05:36', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('103', '1', 'stock-app', '15821303232', '33', '1', '0', '2020-04-25 09:05:36', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('104', '1', 'stock-app', '15821303233', '33', '1', '0', '2020-04-25 09:05:36', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('105', '1', 'stock-app', '15821303236', '34', '1', '0', '2020-04-25 09:15:46', '2020-04-25 09:27:00');
INSERT INTO `t_device_message` VALUES ('106', '1', 'stock-app', '15821303234', '34', '1', '0', '2020-04-25 09:15:46', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('107', '1', 'stock-app', '15821303235', '34', '1', '0', '2020-04-25 09:15:46', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('108', '1', 'stock-app', '15821303232', '34', '1', '0', '2020-04-25 09:15:46', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('109', '1', 'stock-app', '15821303233', '34', '1', '0', '2020-04-25 09:15:46', '2020-04-25 09:17:00');
INSERT INTO `t_device_message` VALUES ('110', '1', 'stock-app', '15821303236', '35', '1', '0', '2020-04-25 09:16:39', '2020-04-25 09:27:00');
INSERT INTO `t_device_message` VALUES ('111', '1', 'stock-app', '15821303234', '35', '1', '0', '2020-04-25 09:16:39', null);
INSERT INTO `t_device_message` VALUES ('112', '1', 'stock-app', '15821303235', '35', '1', '0', '2020-04-25 09:16:39', null);
INSERT INTO `t_device_message` VALUES ('113', '1', 'stock-app', '15821303232', '35', '1', '0', '2020-04-25 09:16:39', null);
INSERT INTO `t_device_message` VALUES ('114', '1', 'stock-app', '15821303233', '35', '1', '0', '2020-04-25 09:16:39', null);
INSERT INTO `t_device_message` VALUES ('115', '1', 'stock-app', '15821303236', '36', '1', '0', '2020-04-25 09:24:21', '2020-04-25 09:27:00');
INSERT INTO `t_device_message` VALUES ('116', '1', 'stock-app', '15821303234', '36', '1', '0', '2020-04-25 09:24:21', '2020-04-25 09:27:00');
INSERT INTO `t_device_message` VALUES ('117', '1', 'stock-app', '15821303235', '36', '1', '0', '2020-04-25 09:24:21', '2020-04-25 09:27:00');
INSERT INTO `t_device_message` VALUES ('118', '1', 'stock-app', '15821303232', '36', '1', '0', '2020-04-25 09:24:21', null);
INSERT INTO `t_device_message` VALUES ('119', '1', 'stock-app', '15821303233', '36', '1', '0', '2020-04-25 09:24:21', '2020-04-25 09:27:00');
INSERT INTO `t_device_message` VALUES ('120', '1', 'stock-app', '15821303236', '37', '1', '0', '2020-04-25 09:29:37', null);
INSERT INTO `t_device_message` VALUES ('121', '1', 'stock-app', '15821303234', '37', '1', '0', '2020-04-25 09:29:37', null);
INSERT INTO `t_device_message` VALUES ('122', '1', 'stock-app', '15821303235', '37', '1', '0', '2020-04-25 09:29:37', null);
INSERT INTO `t_device_message` VALUES ('123', '1', 'stock-app', '15821303232', '37', '1', '0', '2020-04-25 09:29:37', null);
INSERT INTO `t_device_message` VALUES ('124', '1', 'stock-app', '15821303233', '37', '1', '0', '2020-04-25 09:29:37', null);
INSERT INTO `t_device_message` VALUES ('125', '1', 'stock-app', '15821303236', '38', '1', '0', '2020-04-25 09:32:19', null);
INSERT INTO `t_device_message` VALUES ('126', '1', 'stock-app', '15821303234', '38', '1', '0', '2020-04-25 09:32:19', null);
INSERT INTO `t_device_message` VALUES ('127', '1', 'stock-app', '15821303235', '38', '1', '0', '2020-04-25 09:32:19', null);
INSERT INTO `t_device_message` VALUES ('128', '1', 'stock-app', '15821303232', '38', '1', '0', '2020-04-25 09:32:19', null);
INSERT INTO `t_device_message` VALUES ('129', '1', 'stock-app', '15821303233', '38', '1', '0', '2020-04-25 09:32:19', null);
INSERT INTO `t_device_message` VALUES ('130', '1', 'stock-app', '15821303236', '39', '1', '0', '2020-04-25 09:33:24', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('131', '1', 'stock-app', '15821303234', '39', '1', '0', '2020-04-25 09:33:24', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('132', '1', 'stock-app', '15821303235', '39', '1', '0', '2020-04-25 09:33:24', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('133', '1', 'stock-app', '15821303232', '39', '1', '0', '2020-04-25 09:33:24', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('134', '1', 'stock-app', '15821303233', '39', '1', '0', '2020-04-25 09:33:24', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('135', '1', 'stock-app', '15821303236', '40', '1', '0', '2020-04-25 09:33:42', null);
INSERT INTO `t_device_message` VALUES ('136', '1', 'stock-app', '15821303234', '40', '1', '0', '2020-04-25 09:33:42', null);
INSERT INTO `t_device_message` VALUES ('137', '1', 'stock-app', '15821303235', '40', '1', '0', '2020-04-25 09:33:42', null);
INSERT INTO `t_device_message` VALUES ('138', '1', 'stock-app', '15821303232', '40', '1', '0', '2020-04-25 09:33:42', null);
INSERT INTO `t_device_message` VALUES ('139', '1', 'stock-app', '15821303233', '40', '1', '0', '2020-04-25 09:33:42', null);
INSERT INTO `t_device_message` VALUES ('140', '1', 'stock-app', '15821303236', '41', '1', '0', '2020-04-25 09:40:10', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('141', '1', 'stock-app', '15821303234', '41', '1', '0', '2020-04-25 09:40:10', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('142', '1', 'stock-app', '15821303235', '41', '1', '0', '2020-04-25 09:40:10', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('143', '1', 'stock-app', '15821303232', '41', '1', '0', '2020-04-25 09:40:10', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('144', '1', 'stock-app', '15821303233', '41', '1', '0', '2020-04-25 09:40:10', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('145', '1', 'stock-app', '15821303236', '42', '1', '0', '2020-04-25 09:42:25', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('146', '1', 'stock-app', '15821303234', '42', '1', '0', '2020-04-25 09:42:25', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('147', '1', 'stock-app', '15821303235', '42', '1', '0', '2020-04-25 09:42:25', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('148', '1', 'stock-app', '15821303232', '42', '1', '0', '2020-04-25 09:42:25', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('149', '1', 'stock-app', '15821303233', '42', '1', '0', '2020-04-25 09:42:25', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('150', '1', 'stock-app', '15821303236', '43', '1', '0', '2020-04-25 09:45:36', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('151', '1', 'stock-app', '15821303234', '43', '1', '0', '2020-04-25 09:45:36', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('152', '1', 'stock-app', '15821303235', '43', '1', '0', '2020-04-25 09:45:36', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('153', '1', 'stock-app', '15821303232', '43', '1', '0', '2020-04-25 09:45:36', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('154', '1', 'stock-app', '15821303233', '43', '1', '0', '2020-04-25 09:45:36', '2020-04-25 09:46:00');
INSERT INTO `t_device_message` VALUES ('155', '1', 'stock-app', '15821303236', '44', '1', '0', '2020-04-25 09:46:29', null);
INSERT INTO `t_device_message` VALUES ('156', '1', 'stock-app', '15821303234', '44', '1', '0', '2020-04-25 09:46:29', null);
INSERT INTO `t_device_message` VALUES ('157', '1', 'stock-app', '15821303235', '44', '1', '0', '2020-04-25 09:46:29', null);
INSERT INTO `t_device_message` VALUES ('158', '1', 'stock-app', '15821303232', '44', '1', '0', '2020-04-25 09:46:29', null);
INSERT INTO `t_device_message` VALUES ('159', '1', 'stock-app', '15821303233', '44', '1', '0', '2020-04-25 09:46:29', null);
INSERT INTO `t_device_message` VALUES ('160', '1', 'stock-app', '15821303236', '46', '1', '0', '2020-04-25 09:49:06', null);
INSERT INTO `t_device_message` VALUES ('161', '1', 'stock-app', '15821303234', '46', '1', '0', '2020-04-25 09:49:06', null);
INSERT INTO `t_device_message` VALUES ('162', '1', 'stock-app', '15821303235', '46', '1', '0', '2020-04-25 09:49:06', null);
INSERT INTO `t_device_message` VALUES ('163', '1', 'stock-app', '15821303232', '46', '1', '0', '2020-04-25 09:49:06', null);
INSERT INTO `t_device_message` VALUES ('164', '1', 'stock-app', '15821303233', '46', '1', '0', '2020-04-25 09:49:06', null);
INSERT INTO `t_device_message` VALUES ('165', '1', 'stock-app', '15821303236', '47', '1', '0', '2020-04-25 09:50:32', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('166', '1', 'stock-app', '15821303234', '47', '1', '0', '2020-04-25 09:50:32', '2020-04-25 09:52:00');
INSERT INTO `t_device_message` VALUES ('167', '1', 'stock-app', '15821303235', '47', '1', '0', '2020-04-25 09:50:32', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('168', '1', 'stock-app', '15821303232', '47', '1', '0', '2020-04-25 09:50:32', null);
INSERT INTO `t_device_message` VALUES ('169', '1', 'stock-app', '15821303233', '47', '1', '0', '2020-04-25 09:50:32', '2020-04-25 09:52:00');
INSERT INTO `t_device_message` VALUES ('170', '1', 'stock-app', '15821303236', '49', '1', '0', '2020-04-25 10:10:44', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('171', '1', 'stock-app', '15821303234', '49', '1', '0', '2020-04-25 10:10:44', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('172', '1', 'stock-app', '15821303235', '49', '1', '0', '2020-04-25 10:10:44', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('173', '1', 'stock-app', '15821303232', '49', '1', '0', '2020-04-25 10:10:44', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('174', '1', 'stock-app', '15821303233', '49', '1', '0', '2020-04-25 10:10:44', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('175', '1', 'stock-app', '15821303236', '50', '1', '0', '2020-04-25 10:12:58', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('176', '1', 'stock-app', '15821303234', '50', '1', '0', '2020-04-25 10:12:58', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('177', '1', 'stock-app', '15821303235', '50', '1', '0', '2020-04-25 10:12:58', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('178', '1', 'stock-app', '15821303232', '50', '1', '0', '2020-04-25 10:12:58', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('179', '1', 'stock-app', '15821303233', '50', '1', '0', '2020-04-25 10:12:58', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('180', '1', 'stock-app', '15821303236', '51', '1', '0', '2020-04-25 10:14:14', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('181', '1', 'stock-app', '15821303234', '51', '1', '0', '2020-04-25 10:14:14', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('182', '1', 'stock-app', '15821303235', '51', '1', '0', '2020-04-25 10:14:14', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('183', '1', 'stock-app', '15821303232', '51', '1', '0', '2020-04-25 10:14:14', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('184', '1', 'stock-app', '15821303233', '51', '1', '0', '2020-04-25 10:14:14', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('185', '1', 'stock-app', '15821303236', '53', '1', '0', '2020-04-25 13:10:29', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('186', '1', 'stock-app', '15821303234', '53', '1', '0', '2020-04-25 13:10:29', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('187', '1', 'stock-app', '15821303235', '53', '1', '0', '2020-04-25 13:10:29', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('188', '1', 'stock-app', '15821303232', '53', '1', '0', '2020-04-25 13:10:29', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('189', '1', 'stock-app', '15821303233', '53', '1', '0', '2020-04-25 13:10:29', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('190', '1', 'stock-app', '15821303236', '54', '1', '0', '2020-04-25 13:10:55', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('191', '1', 'stock-app', '15821303234', '54', '1', '0', '2020-04-25 13:10:55', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('192', '1', 'stock-app', '15821303235', '54', '1', '0', '2020-04-25 13:10:55', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('193', '1', 'stock-app', '15821303232', '54', '1', '0', '2020-04-25 13:10:55', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('194', '1', 'stock-app', '15821303233', '54', '1', '0', '2020-04-25 13:10:55', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('195', '1', 'stock-app', '15821303236', '55', '1', '0', '2020-04-25 13:11:44', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('196', '1', 'stock-app', '15821303234', '55', '1', '0', '2020-04-25 13:11:44', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('197', '1', 'stock-app', '15821303235', '55', '1', '0', '2020-04-25 13:11:44', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('198', '1', 'stock-app', '15821303232', '55', '1', '0', '2020-04-25 13:11:44', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('199', '1', 'stock-app', '15821303233', '55', '1', '0', '2020-04-25 13:11:44', '2020-04-25 13:13:00');
INSERT INTO `t_device_message` VALUES ('200', '1', 'stock-app', '15821303236', '56', '1', '0', '2020-04-25 14:25:22', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('201', '1', 'stock-app', '15821303234', '56', '1', '0', '2020-04-25 14:25:22', null);
INSERT INTO `t_device_message` VALUES ('202', '1', 'stock-app', '15821303235', '56', '1', '0', '2020-04-25 14:25:22', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('203', '1', 'stock-app', '15821303232', '56', '1', '0', '2020-04-25 14:25:22', null);
INSERT INTO `t_device_message` VALUES ('204', '1', 'stock-app', '15821303233', '56', '1', '0', '2020-04-25 14:25:22', null);
INSERT INTO `t_device_message` VALUES ('205', '1', 'stock-app', '15821303261', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('206', '1', 'stock-app', '15821303262', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('207', '1', 'stock-app', '15821303260', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('208', '1', 'stock-app', '15821303265', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('209', '1', 'stock-app', '15821303266', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('210', '1', 'stock-app', '15821303263', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('211', '1', 'stock-app', '15821303264', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('212', '1', 'stock-app', '15821303269', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('213', '1', 'stock-app', '15821303302', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('214', '1', 'stock-app', '15821303303', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('215', '1', 'stock-app', '15821303300', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('216', '1', 'stock-app', '15821303267', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('217', '1', 'stock-app', '15821303268', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('218', '1', 'stock-app', '15821303301', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('219', '1', 'stock-app', '15821303306', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('220', '1', 'stock-app', '15821303307', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('221', '1', 'stock-app', '15821303304', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('222', '1', 'stock-app', '15821303305', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('223', '1', 'stock-app', '15821303308', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('224', '1', 'stock-app', '15821303309', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('225', '1', 'stock-app', '15821303272', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('226', '1', 'stock-app', '15821303273', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('227', '1', 'stock-app', '15821303270', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('228', '1', 'stock-app', '15821303271', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('229', '1', 'stock-app', '15821303276', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('230', '1', 'stock-app', '15821303310', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('231', '1', 'stock-app', '15821303277', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('232', '1', 'stock-app', '15821303274', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:00');
INSERT INTO `t_device_message` VALUES ('233', '1', 'stock-app', '15821303275', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('234', '1', 'stock-app', '15821303313', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('235', '1', 'stock-app', '15821303314', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('236', '1', 'stock-app', '15821303311', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('237', '1', 'stock-app', '15821303278', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('238', '1', 'stock-app', '15821303279', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('239', '1', 'stock-app', '15821303312', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('240', '1', 'stock-app', '15821303317', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('241', '1', 'stock-app', '15821303318', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('242', '1', 'stock-app', '15821303315', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('243', '1', 'stock-app', '15821303316', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('244', '1', 'stock-app', '15821303319', '57', '0', '0', '2020-04-25 14:52:01', null);
INSERT INTO `t_device_message` VALUES ('245', '1', 'stock-app', '15821303240', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('246', '1', 'stock-app', '15821303243', '57', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('247', '1', 'stock-app', '15821303244', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('248', '1', 'stock-app', '15821303241', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('249', '1', 'stock-app', '15821303242', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('250', '1', 'stock-app', '15821303247', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('251', '1', 'stock-app', '15821303248', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('252', '1', 'stock-app', '15821303245', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('253', '1', 'stock-app', '15821303246', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('254', '1', 'stock-app', '15821303249', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('255', '1', 'stock-app', '15821303250', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('256', '1', 'stock-app', '15821303251', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('257', '1', 'stock-app', '15821303254', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('258', '1', 'stock-app', '15821303255', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('259', '1', 'stock-app', '15821303252', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('260', '1', 'stock-app', '15821303253', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('261', '1', 'stock-app', '15821303258', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('262', '1', 'stock-app', '15821303259', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('263', '1', 'stock-app', '15821303256', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('264', '1', 'stock-app', '15821303257', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('265', '1', 'stock-app', '15821303232', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('266', '1', 'stock-app', '15821303233', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('267', '1', 'stock-app', '15821303236', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('268', '1', 'stock-app', '15821303237', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('269', '1', 'stock-app', '15821303234', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('270', '1', 'stock-app', '15821303235', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('271', '1', 'stock-app', '15821303238', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('272', '1', 'stock-app', '15821303239', '57', '1', '0', '2020-04-25 14:52:02', '2020-04-25 14:53:01');
INSERT INTO `t_device_message` VALUES ('273', '1', 'stock-app', '15821303280', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('274', '1', 'stock-app', '15821303283', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('275', '1', 'stock-app', '15821303284', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('276', '1', 'stock-app', '15821303281', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('277', '1', 'stock-app', '15821303282', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('278', '1', 'stock-app', '15821303287', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('279', '1', 'stock-app', '15821303320', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('280', '1', 'stock-app', '15821303288', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('281', '1', 'stock-app', '15821303321', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('282', '1', 'stock-app', '15821303285', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('283', '1', 'stock-app', '15821303286', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('284', '1', 'stock-app', '15821303324', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('285', '1', 'stock-app', '15821303325', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('286', '1', 'stock-app', '15821303289', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('287', '1', 'stock-app', '15821303322', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('288', '1', 'stock-app', '15821303323', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('289', '1', 'stock-app', '15821303328', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('290', '1', 'stock-app', '15821303329', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('291', '1', 'stock-app', '15821303326', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('292', '1', 'stock-app', '15821303327', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('293', '1', 'stock-app', '15821303290', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('294', '1', 'stock-app', '15821303291', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('295', '1', 'stock-app', '15821303294', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('296', '1', 'stock-app', '15821303295', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('297', '1', 'stock-app', '15821303292', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('298', '1', 'stock-app', '15821303293', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('299', '1', 'stock-app', '15821303331', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('300', '1', 'stock-app', '15821303298', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('301', '1', 'stock-app', '15821303299', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('302', '1', 'stock-app', '15821303296', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('303', '1', 'stock-app', '15821303297', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('304', '1', 'stock-app', '15821303330', '57', '0', '0', '2020-04-25 14:52:02', null);
INSERT INTO `t_device_message` VALUES ('305', '1', 'stock-app', '15821303261', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('306', '1', 'stock-app', '15821303262', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('307', '1', 'stock-app', '15821303260', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('308', '1', 'stock-app', '15821303265', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('309', '1', 'stock-app', '15821303266', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('310', '1', 'stock-app', '15821303263', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('311', '1', 'stock-app', '15821303264', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('312', '1', 'stock-app', '15821303269', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('313', '1', 'stock-app', '15821303302', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('314', '1', 'stock-app', '15821303303', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('315', '1', 'stock-app', '15821303300', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('316', '1', 'stock-app', '15821303267', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('317', '1', 'stock-app', '15821303268', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('318', '1', 'stock-app', '15821303301', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('319', '1', 'stock-app', '15821303306', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('320', '1', 'stock-app', '15821303307', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('321', '1', 'stock-app', '15821303304', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('322', '1', 'stock-app', '15821303305', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('323', '1', 'stock-app', '15821303308', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('324', '1', 'stock-app', '15821303309', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('325', '1', 'stock-app', '15821303272', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('326', '1', 'stock-app', '15821303273', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('327', '1', 'stock-app', '15821303270', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('328', '1', 'stock-app', '15821303271', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('329', '1', 'stock-app', '15821303276', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('330', '1', 'stock-app', '15821303310', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('331', '1', 'stock-app', '15821303277', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('332', '1', 'stock-app', '15821303274', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('333', '1', 'stock-app', '15821303275', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('334', '1', 'stock-app', '15821303313', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('335', '1', 'stock-app', '15821303314', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('336', '1', 'stock-app', '15821303278', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('337', '1', 'stock-app', '15821303311', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('338', '1', 'stock-app', '15821303279', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('339', '1', 'stock-app', '15821303312', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('340', '1', 'stock-app', '15821303317', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('341', '1', 'stock-app', '15821303318', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('342', '1', 'stock-app', '15821303315', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('343', '1', 'stock-app', '15821303316', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('344', '1', 'stock-app', '15821303319', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('345', '1', 'stock-app', '15821303240', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('346', '1', 'stock-app', '15821303243', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('347', '1', 'stock-app', '15821303244', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('348', '1', 'stock-app', '15821303241', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('349', '1', 'stock-app', '15821303242', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('350', '1', 'stock-app', '15821303247', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('351', '1', 'stock-app', '15821303248', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('352', '1', 'stock-app', '15821303245', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('353', '1', 'stock-app', '15821303246', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('354', '1', 'stock-app', '15821303249', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('355', '1', 'stock-app', '15821303250', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('356', '1', 'stock-app', '15821303251', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('357', '1', 'stock-app', '15821303254', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('358', '1', 'stock-app', '15821303255', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('359', '1', 'stock-app', '15821303252', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('360', '1', 'stock-app', '15821303253', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('361', '1', 'stock-app', '15821303258', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('362', '1', 'stock-app', '15821303259', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('363', '1', 'stock-app', '15821303256', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('364', '1', 'stock-app', '15821303257', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('365', '1', 'stock-app', '15821303232', '58', '1', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('366', '1', 'stock-app', '15821303233', '58', '1', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('367', '1', 'stock-app', '15821303236', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('368', '1', 'stock-app', '15821303237', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('369', '1', 'stock-app', '15821303234', '58', '1', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('370', '1', 'stock-app', '15821303235', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('371', '1', 'stock-app', '15821303238', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('372', '1', 'stock-app', '15821303239', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('373', '1', 'stock-app', '15821303280', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('374', '1', 'stock-app', '15821303283', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('375', '1', 'stock-app', '15821303284', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('376', '1', 'stock-app', '15821303281', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('377', '1', 'stock-app', '15821303282', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('378', '1', 'stock-app', '15821303287', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('379', '1', 'stock-app', '15821303320', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('380', '1', 'stock-app', '15821303288', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('381', '1', 'stock-app', '15821303321', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('382', '1', 'stock-app', '15821303285', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('383', '1', 'stock-app', '15821303286', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('384', '1', 'stock-app', '15821303324', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('385', '1', 'stock-app', '15821303325', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('386', '1', 'stock-app', '15821303289', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('387', '1', 'stock-app', '15821303322', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('388', '1', 'stock-app', '15821303323', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('389', '1', 'stock-app', '15821303328', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('390', '1', 'stock-app', '15821303329', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('391', '1', 'stock-app', '15821303326', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('392', '1', 'stock-app', '15821303327', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('393', '1', 'stock-app', '15821303290', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('394', '1', 'stock-app', '15821303291', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('395', '1', 'stock-app', '15821303294', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('396', '1', 'stock-app', '15821303295', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('397', '1', 'stock-app', '15821303292', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('398', '1', 'stock-app', '15821303293', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('399', '1', 'stock-app', '15821303298', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('400', '1', 'stock-app', '15821303331', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('401', '1', 'stock-app', '15821303299', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('402', '1', 'stock-app', '15821303296', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('403', '1', 'stock-app', '15821303330', '58', '0', '0', '2020-04-25 15:02:21', null);
INSERT INTO `t_device_message` VALUES ('404', '1', 'stock-app', '15821303297', '58', '0', '0', '2020-04-25 15:02:22', null);
INSERT INTO `t_device_message` VALUES ('405', '1', 'stock-app', '15821303261', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('406', '1', 'stock-app', '15821303262', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('407', '1', 'stock-app', '15821303260', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('408', '1', 'stock-app', '15821303265', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('409', '1', 'stock-app', '15821303266', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('410', '1', 'stock-app', '15821303263', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('411', '1', 'stock-app', '15821303264', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('412', '1', 'stock-app', '15821303269', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('413', '1', 'stock-app', '15821303302', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('414', '1', 'stock-app', '15821303303', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('415', '1', 'stock-app', '15821303300', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('416', '1', 'stock-app', '15821303267', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('417', '1', 'stock-app', '15821303301', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('418', '1', 'stock-app', '15821303268', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('419', '1', 'stock-app', '15821303306', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('420', '1', 'stock-app', '15821303307', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('421', '1', 'stock-app', '15821303304', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('422', '1', 'stock-app', '15821303305', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('423', '1', 'stock-app', '15821303308', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('424', '1', 'stock-app', '15821303309', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('425', '1', 'stock-app', '15821303272', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('426', '1', 'stock-app', '15821303273', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('427', '1', 'stock-app', '15821303270', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('428', '1', 'stock-app', '15821303271', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('429', '1', 'stock-app', '15821303276', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('430', '1', 'stock-app', '15821303310', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('431', '1', 'stock-app', '15821303277', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('432', '1', 'stock-app', '15821303274', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('433', '1', 'stock-app', '15821303275', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('434', '1', 'stock-app', '15821303313', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('435', '1', 'stock-app', '15821303314', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('436', '1', 'stock-app', '15821303311', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('437', '1', 'stock-app', '15821303278', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('438', '1', 'stock-app', '15821303279', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('439', '1', 'stock-app', '15821303312', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('440', '1', 'stock-app', '15821303317', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('441', '1', 'stock-app', '15821303318', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('442', '1', 'stock-app', '15821303315', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('443', '1', 'stock-app', '15821303316', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('444', '1', 'stock-app', '15821303319', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('445', '1', 'stock-app', '15821303240', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('446', '1', 'stock-app', '15821303243', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('447', '1', 'stock-app', '15821303244', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('448', '1', 'stock-app', '15821303241', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('449', '1', 'stock-app', '15821303242', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('450', '1', 'stock-app', '15821303247', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('451', '1', 'stock-app', '15821303248', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('452', '1', 'stock-app', '15821303245', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('453', '1', 'stock-app', '15821303246', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('454', '1', 'stock-app', '15821303249', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('455', '1', 'stock-app', '15821303250', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('456', '1', 'stock-app', '15821303251', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('457', '1', 'stock-app', '15821303254', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('458', '1', 'stock-app', '15821303255', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('459', '1', 'stock-app', '15821303252', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('460', '1', 'stock-app', '15821303253', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('461', '1', 'stock-app', '15821303258', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('462', '1', 'stock-app', '15821303259', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('463', '1', 'stock-app', '15821303256', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('464', '1', 'stock-app', '15821303257', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('465', '1', 'stock-app', '15821303232', '59', '1', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('466', '1', 'stock-app', '15821303233', '59', '1', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('467', '1', 'stock-app', '15821303236', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('468', '1', 'stock-app', '15821303237', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('469', '1', 'stock-app', '15821303234', '59', '1', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('470', '1', 'stock-app', '15821303235', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('471', '1', 'stock-app', '15821303238', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('472', '1', 'stock-app', '15821303239', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('473', '1', 'stock-app', '15821303280', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('474', '1', 'stock-app', '15821303283', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('475', '1', 'stock-app', '15821303284', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('476', '1', 'stock-app', '15821303281', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('477', '1', 'stock-app', '15821303282', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('478', '1', 'stock-app', '15821303320', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('479', '1', 'stock-app', '15821303287', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('480', '1', 'stock-app', '15821303288', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('481', '1', 'stock-app', '15821303321', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('482', '1', 'stock-app', '15821303285', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('483', '1', 'stock-app', '15821303286', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('484', '1', 'stock-app', '15821303324', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('485', '1', 'stock-app', '15821303325', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('486', '1', 'stock-app', '15821303322', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('487', '1', 'stock-app', '15821303289', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('488', '1', 'stock-app', '15821303323', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('489', '1', 'stock-app', '15821303328', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('490', '1', 'stock-app', '15821303329', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('491', '1', 'stock-app', '15821303326', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('492', '1', 'stock-app', '15821303327', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('493', '1', 'stock-app', '15821303290', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('494', '1', 'stock-app', '15821303291', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('495', '1', 'stock-app', '15821303294', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('496', '1', 'stock-app', '15821303295', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('497', '1', 'stock-app', '15821303292', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('498', '1', 'stock-app', '15821303293', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('499', '1', 'stock-app', '15821303331', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('500', '1', 'stock-app', '15821303298', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('501', '1', 'stock-app', '15821303299', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('502', '1', 'stock-app', '15821303296', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('503', '1', 'stock-app', '15821303330', '59', '0', '0', '2020-04-25 19:39:10', null);
INSERT INTO `t_device_message` VALUES ('504', '1', 'stock-app', '15821303297', '59', '0', '0', '2020-04-25 19:39:10', null);

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_group_member
-- ----------------------------
DROP TABLE IF EXISTS `t_group_member`;
CREATE TABLE `t_group_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_group_member
-- ----------------------------

-- ----------------------------
-- Table structure for t_message_push
-- ----------------------------
DROP TABLE IF EXISTS `t_message_push`;
CREATE TABLE `t_message_push` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `message_title` varchar(255) DEFAULT NULL,
  `message_content` varchar(255) DEFAULT NULL,
  `message_url` varchar(255) DEFAULT NULL,
  `platform` int(11) NOT NULL,
  `push_state` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `total_cnt` int(8) DEFAULT NULL,
  `send_success_cnt` int(8) DEFAULT NULL,
  `send_fail_cnt` int(8) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_message_push
-- ----------------------------
INSERT INTO `t_message_push` VALUES ('4', '1', 'stock-app', 'good', '空即是色', null, '1', '1', '0', null, null, '1', '0', '1', '推送成功');
INSERT INTO `t_message_push` VALUES ('5', '1', 'stock-app', '2', '1', null, '1', '1', '0', null, null, '1', '0', '1', '推送成功');
INSERT INTO `t_message_push` VALUES ('6', '1', 'stock-app', '2', '2', null, '1', '1', '0', null, null, '1', '0', '1', '推送成功');
INSERT INTO `t_message_push` VALUES ('7', '1', 'stock-app', 'x', '21', null, '1', '1', '0', null, null, '1', '1', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('8', '1', 'stock-app', 'x', '23123213', null, '1', '1', '0', null, null, '1', '1', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('9', '1', 'stock-app', '想', '2', null, '1', '1', '0', null, null, '1', '0', '1', '推送成功');
INSERT INTO `t_message_push` VALUES ('10', '1', 'stock-app', 'x', '2', null, '1', '1', '0', null, null, '1', '0', '1', '推送成功');
INSERT INTO `t_message_push` VALUES ('11', '1', 'stock-app', '想', '2嘻嘻嘻', null, '1', '1', '0', '2020-04-23 12:40:55', null, '1', '0', '1', '推送成功');
INSERT INTO `t_message_push` VALUES ('12', '1', 'stock-app', '.........', 'asdasdasdasd1 11', null, '1', '1', '0', '2020-04-23 14:59:04', '2020-04-23 15:34:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('13', '1', 'stock-app', '你好啊。这是一条推送消息', '请看。。。', null, '1', '1', '0', '2020-04-23 15:35:00', '2020-04-23 15:38:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('14', '1', 'stock-app', 'x', '斑斑驳驳', null, '1', '1', '0', '2020-04-23 15:39:05', null, '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('15', '1', 'stock-app', '上', '2', null, '1', '1', '0', '2020-04-23 15:41:30', null, '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('16', '1', 'stock-app', 's', '1', null, '1', '1', '0', '2020-04-23 15:42:38', null, '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('17', '1', 'stock-app', '2', '2', null, '1', '1', '0', '2020-04-23 15:43:25', null, '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('18', '1', 'stock-app', '123', '123', null, '1', '1', '0', '2020-04-23 15:56:28', null, '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('19', '1', 'stock-app', '今天是个好日子', '阿斯顿撒大所', null, '1', '1', '0', '2020-04-24 13:31:30', '2020-04-24 14:05:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('20', '1', 'stock-app', '一点点无误', '123', null, '1', '1', '0', '2020-04-24 13:35:43', '2020-04-24 14:05:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('21', '1', 'stock-app', '硕士', '2', null, '1', '1', '0', '2020-04-24 13:37:34', '2020-04-24 14:05:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('22', '1', 'stock-app', '1', '2', null, '1', '1', '0', '2020-04-24 13:39:34', '2020-04-24 14:05:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('23', '1', 'stock-app', '恶', '1', null, '1', '1', '0', '2020-04-24 14:01:58', '2020-04-24 14:05:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('24', '1', 'stock-app', '阿', '2', null, '1', '1', '0', '2020-04-24 14:12:12', '2020-04-24 14:13:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('25', '1', 'stock-app', '2', '2', null, '1', '1', '0', '2020-04-24 14:16:04', null, '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('26', '1', 'stock-app', '13', '1', null, '1', '1', '0', '2020-04-24 14:18:51', null, '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('27', '1', 'stock-app', '555555554', '13213', null, '1', '1', '0', '2020-04-24 14:33:18', '2020-04-24 14:34:00', '4', '4', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('28', '1', 'stock-app', '666', ',..saaaaaaaa', null, '1', '1', '0', '2020-04-24 21:01:13', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('29', '1', 'stock-app', '123', '123', null, '1', '1', '0', '2020-04-24 21:04:12', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('30', '1', 'stock-app', '123', '123', null, '1', '1', '0', '2020-04-24 21:05:12', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('31', '1', 'stock-app', '123', '123', null, '1', '1', '0', '2020-04-24 21:06:49', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('32', '1', 'stock-app', 'asd', 'asd', null, '1', '1', '0', '2020-04-24 21:13:31', '2020-04-25 09:27:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('33', '1', 'stock-app', '早啊。', '。。2', null, '1', '1', '0', '2020-04-25 09:05:36', '2020-04-25 09:27:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('34', '1', 'stock-app', '早啊。', 'vvv', null, '1', '1', '0', '2020-04-25 09:15:45', '2020-04-25 09:27:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('35', '1', 'stock-app', '早啊。', '大多数', null, '1', '1', '0', '2020-04-25 09:16:39', '2020-04-25 09:27:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('36', '1', 'stock-app', '我在吃饭', '123213', null, '1', '1', '0', '2020-04-25 09:24:21', '2020-04-25 09:27:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('37', '1', 'stock-app', '吃完了', '吃嘛嘛香', null, '1', '1', '0', '2020-04-25 09:29:37', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('38', '1', 'stock-app', '离线推送', '11', null, '1', '1', '0', '2020-04-25 09:32:19', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('39', '1', 'stock-app', '离线', '1', null, '1', '1', '0', '2020-04-25 09:33:24', '2020-04-25 09:46:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('40', '1', 'stock-app', '装修', '1', null, '1', '1', '0', '2020-04-25 09:33:42', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('41', '1', 'stock-app', '666', '1', null, '1', '1', '0', '2020-04-25 09:40:10', '2020-04-25 09:46:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('42', '1', 'stock-app', '做到极致', '2', null, '1', '1', '0', '2020-04-25 09:42:25', '2020-04-25 09:46:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('43', '1', 'stock-app', '早啊。', '，按时，大声道', null, '1', '1', '0', '2020-04-25 09:45:36', '2020-04-25 09:46:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('44', '1', 'stock-app', '666', '1111111111111111111111111111', null, '1', '1', '0', '2020-04-25 09:46:29', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('45', '2', 'news-app', '我在吃饭', '0000000000000', null, '1', '0', '0', '2020-04-25 09:47:43', null, '0', '0', '0', '该app下没有设备需要推送');
INSERT INTO `t_message_push` VALUES ('46', '1', 'stock-app', 'af', 'ggagg', null, '1', '1', '0', '2020-04-25 09:49:06', null, '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('47', '1', 'stock-app', 'aa', 'aaa', null, '1', '1', '0', '2020-04-25 09:50:32', '2020-04-25 14:53:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('48', '2', 'news-app', '666', '', null, '1', '0', '0', '2020-04-25 09:53:52', null, '0', '0', '0', '该app下没有设备需要推送');
INSERT INTO `t_message_push` VALUES ('49', '1', 'stock-app', 'binging after start ', '233', null, '1', '1', '0', '2020-04-25 10:10:44', '2020-04-25 14:53:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('50', '1', 'stock-app', 'ok', '431', null, '1', '1', '0', '2020-04-25 10:12:58', '2020-04-25 14:53:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('51', '1', 'stock-app', '1', '2', null, '1', '1', '0', '2020-04-25 10:14:14', '2020-04-25 14:53:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('52', '2', 'news-app', '来一张美丽的报表', '少时诵诗书所所所所所所', null, '1', '0', '0', '2020-04-25 13:07:31', null, '0', '0', '0', '该app下没有设备需要推送');
INSERT INTO `t_message_push` VALUES ('53', '1', 'stock-app', 'gx', '阿嘎嘎', null, '1', '1', '0', '2020-04-25 13:10:29', '2020-04-25 14:53:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('54', '1', 'stock-app', 'g', 'g', null, '1', '1', '0', '2020-04-25 13:10:54', '2020-04-25 14:53:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('55', '1', 'stock-app', '语文英语', '还让他忽然', null, '1', '1', '0', '2020-04-25 13:11:44', '2020-04-25 14:53:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('56', '1', 'stock-app', '下午好', '借鸡生蛋', null, '1', '1', '0', '2020-04-25 14:25:22', '2020-04-25 14:53:00', '5', '5', '0', '推送成功');
INSERT INTO `t_message_push` VALUES ('57', '1', 'stock-app', '下午好', '是是是', null, '1', '1', '0', '2020-04-25 14:52:01', '2020-04-25 14:53:01', '100', '46', '54', '推送成功');
INSERT INTO `t_message_push` VALUES ('58', '1', 'stock-app', '下午好', '发发发', null, '1', '1', '0', '2020-04-25 15:02:21', null, '100', '3', '97', '推送成功');
INSERT INTO `t_message_push` VALUES ('59', '1', 'stock-app', '晚上好。朋友们', '大家好', null, '1', '1', '0', '2020-04-25 19:39:10', null, '100', '3', '97', '推送成功');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_related
-- ----------------------------
DROP TABLE IF EXISTS `t_user_related`;
CREATE TABLE `t_user_related` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `follow_state` int(11) NOT NULL,
  `follow_user_id` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user_related
-- ----------------------------
