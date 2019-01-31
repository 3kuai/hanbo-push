/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-11-24 14:22:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_app`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_app
-- ----------------------------

-- ----------------------------
-- Table structure for `t_developer`
-- ----------------------------
DROP TABLE IF EXISTS `t_developer`;
CREATE TABLE `t_developer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `developer` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_developer
-- ----------------------------

-- ----------------------------
-- Table structure for `t_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------

-- ----------------------------
-- Table structure for `t_group_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_group_member`;
CREATE TABLE `t_group_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group_member
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_related`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_related
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;