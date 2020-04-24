/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 24/04/2020 15:34:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_app
-- ----------------------------
DROP TABLE IF EXISTS `t_app`;
CREATE TABLE `t_app`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `developer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_app
-- ----------------------------
INSERT INTO `t_app` VALUES (1, '7b3a24bda8f0434ebeb6efb75c2a6b17', 'stock-app', 'ed4a2b88d9', NULL, '1', 0, NULL);

-- ----------------------------
-- Table structure for t_developer
-- ----------------------------
DROP TABLE IF EXISTS `t_developer`;
CREATE TABLE `t_developer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `developer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_developer
-- ----------------------------
INSERT INTO `t_developer` VALUES (1, NULL, 'lucas', 'lucas', 0, NULL);

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES (1, '1', '15821303235', 1, 1, '2020-04-23 13:38:02', NULL);
INSERT INTO `t_device` VALUES (2, '1', '15821303234', 1, 1, '2020-04-23 13:38:02', NULL);
INSERT INTO `t_device` VALUES (3, '1', '15821303233', 1, 1, '2020-04-23 13:38:02', NULL);
INSERT INTO `t_device` VALUES (4, '1', '15821303232', 1, 1, '2020-04-23 13:38:02', NULL);

-- ----------------------------
-- Table structure for t_device_message
-- ----------------------------
DROP TABLE IF EXISTS `t_device_message`;
CREATE TABLE `t_device_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_id` bigint(20) NULL DEFAULT NULL,
  `message_id` bigint(11) NULL DEFAULT NULL,
  `delivery_state` int(1) NULL DEFAULT NULL,
  `read_state` int(1) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_device_message
-- ----------------------------
INSERT INTO `t_device_message` VALUES (10, '1', 'stock-app', 15821303235, 11, 1, 0, '2020-04-23 12:40:55', NULL);
INSERT INTO `t_device_message` VALUES (11, '1', 'stock-app', 15821303234, 12, 1, 0, '2020-04-23 14:59:04', '2020-04-23 15:34:00');
INSERT INTO `t_device_message` VALUES (12, '1', 'stock-app', 15821303235, 12, 1, 0, '2020-04-23 14:59:05', '2020-04-23 15:00:00');
INSERT INTO `t_device_message` VALUES (13, '1', 'stock-app', 15821303232, 12, 1, 0, '2020-04-23 14:59:05', '2020-04-23 15:34:00');
INSERT INTO `t_device_message` VALUES (14, '1', 'stock-app', 15821303233, 12, 1, 0, '2020-04-23 14:59:05', '2020-04-23 15:34:00');
INSERT INTO `t_device_message` VALUES (15, '1', 'stock-app', 15821303234, 13, 1, 0, '2020-04-23 15:35:00', NULL);
INSERT INTO `t_device_message` VALUES (16, '1', 'stock-app', 15821303235, 13, 1, 0, '2020-04-23 15:35:00', '2020-04-23 15:38:00');
INSERT INTO `t_device_message` VALUES (17, '1', 'stock-app', 15821303232, 13, 1, 0, '2020-04-23 15:35:00', NULL);
INSERT INTO `t_device_message` VALUES (18, '1', 'stock-app', 15821303233, 13, 1, 0, '2020-04-23 15:35:00', NULL);
INSERT INTO `t_device_message` VALUES (19, '1', 'stock-app', 15821303234, 14, 1, 0, '2020-04-23 15:39:05', NULL);
INSERT INTO `t_device_message` VALUES (20, '1', 'stock-app', 15821303235, 14, 1, 0, '2020-04-23 15:39:05', NULL);
INSERT INTO `t_device_message` VALUES (21, '1', 'stock-app', 15821303232, 14, 1, 0, '2020-04-23 15:39:05', NULL);
INSERT INTO `t_device_message` VALUES (22, '1', 'stock-app', 15821303233, 14, 1, 0, '2020-04-23 15:39:05', NULL);
INSERT INTO `t_device_message` VALUES (23, '1', 'stock-app', 15821303234, 15, 1, 0, '2020-04-23 15:41:30', NULL);
INSERT INTO `t_device_message` VALUES (24, '1', 'stock-app', 15821303235, 15, 1, 0, '2020-04-23 15:41:30', NULL);
INSERT INTO `t_device_message` VALUES (25, '1', 'stock-app', 15821303232, 15, 1, 0, '2020-04-23 15:41:30', NULL);
INSERT INTO `t_device_message` VALUES (26, '1', 'stock-app', 15821303233, 15, 1, 0, '2020-04-23 15:41:30', NULL);
INSERT INTO `t_device_message` VALUES (27, '1', 'stock-app', 15821303234, 16, 1, 0, '2020-04-23 15:42:38', NULL);
INSERT INTO `t_device_message` VALUES (28, '1', 'stock-app', 15821303235, 16, 1, 0, '2020-04-23 15:42:38', NULL);
INSERT INTO `t_device_message` VALUES (29, '1', 'stock-app', 15821303232, 16, 1, 0, '2020-04-23 15:42:38', NULL);
INSERT INTO `t_device_message` VALUES (30, '1', 'stock-app', 15821303233, 16, 1, 0, '2020-04-23 15:42:38', NULL);
INSERT INTO `t_device_message` VALUES (31, '1', 'stock-app', 15821303234, 17, 1, 0, '2020-04-23 15:43:25', NULL);
INSERT INTO `t_device_message` VALUES (32, '1', 'stock-app', 15821303235, 17, 1, 0, '2020-04-23 15:43:25', NULL);
INSERT INTO `t_device_message` VALUES (33, '1', 'stock-app', 15821303232, 17, 1, 0, '2020-04-23 15:43:25', NULL);
INSERT INTO `t_device_message` VALUES (34, '1', 'stock-app', 15821303233, 17, 1, 0, '2020-04-23 15:43:25', NULL);
INSERT INTO `t_device_message` VALUES (35, '1', 'stock-app', 15821303234, 18, 1, 0, '2020-04-23 15:56:28', NULL);
INSERT INTO `t_device_message` VALUES (36, '1', 'stock-app', 15821303235, 18, 1, 0, '2020-04-23 15:56:28', NULL);
INSERT INTO `t_device_message` VALUES (37, '1', 'stock-app', 15821303232, 18, 1, 0, '2020-04-23 15:56:28', NULL);
INSERT INTO `t_device_message` VALUES (38, '1', 'stock-app', 15821303233, 18, 1, 0, '2020-04-23 15:56:28', NULL);
INSERT INTO `t_device_message` VALUES (39, '1', 'stock-app', 15821303234, 19, 1, 0, '2020-04-24 13:31:30', NULL);
INSERT INTO `t_device_message` VALUES (40, '1', 'stock-app', 15821303235, 19, 1, 0, '2020-04-24 13:31:30', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES (41, '1', 'stock-app', 15821303232, 19, 1, 0, '2020-04-24 13:31:30', NULL);
INSERT INTO `t_device_message` VALUES (42, '1', 'stock-app', 15821303233, 19, 1, 0, '2020-04-24 13:31:30', NULL);
INSERT INTO `t_device_message` VALUES (43, '1', 'stock-app', 15821303234, 20, 1, 0, '2020-04-24 13:35:43', NULL);
INSERT INTO `t_device_message` VALUES (44, '1', 'stock-app', 15821303235, 20, 1, 0, '2020-04-24 13:35:43', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES (45, '1', 'stock-app', 15821303232, 20, 1, 0, '2020-04-24 13:35:43', NULL);
INSERT INTO `t_device_message` VALUES (46, '1', 'stock-app', 15821303233, 20, 1, 0, '2020-04-24 13:35:43', NULL);
INSERT INTO `t_device_message` VALUES (47, '1', 'stock-app', 15821303234, 21, 1, 0, '2020-04-24 13:37:34', NULL);
INSERT INTO `t_device_message` VALUES (48, '1', 'stock-app', 15821303235, 21, 1, 0, '2020-04-24 13:37:34', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES (49, '1', 'stock-app', 15821303232, 21, 1, 0, '2020-04-24 13:37:34', NULL);
INSERT INTO `t_device_message` VALUES (50, '1', 'stock-app', 15821303233, 21, 1, 0, '2020-04-24 13:37:34', NULL);
INSERT INTO `t_device_message` VALUES (51, '1', 'stock-app', 15821303234, 22, 1, 0, '2020-04-24 13:39:34', NULL);
INSERT INTO `t_device_message` VALUES (52, '1', 'stock-app', 15821303235, 22, 1, 0, '2020-04-24 13:39:34', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES (53, '1', 'stock-app', 15821303232, 22, 1, 0, '2020-04-24 13:39:34', NULL);
INSERT INTO `t_device_message` VALUES (54, '1', 'stock-app', 15821303233, 22, 1, 0, '2020-04-24 13:39:34', NULL);
INSERT INTO `t_device_message` VALUES (55, '1', 'stock-app', 15821303234, 23, 1, 0, '2020-04-24 14:01:58', NULL);
INSERT INTO `t_device_message` VALUES (56, '1', 'stock-app', 15821303235, 23, 1, 0, '2020-04-24 14:01:58', '2020-04-24 14:05:00');
INSERT INTO `t_device_message` VALUES (57, '1', 'stock-app', 15821303232, 23, 1, 0, '2020-04-24 14:01:58', NULL);
INSERT INTO `t_device_message` VALUES (58, '1', 'stock-app', 15821303233, 23, 1, 0, '2020-04-24 14:01:58', NULL);
INSERT INTO `t_device_message` VALUES (59, '1', 'stock-app', 15821303234, 24, 1, 0, '2020-04-24 14:12:12', '2020-04-24 14:13:00');
INSERT INTO `t_device_message` VALUES (60, '1', 'stock-app', 15821303235, 24, 1, 0, '2020-04-24 14:12:12', '2020-04-24 14:13:00');
INSERT INTO `t_device_message` VALUES (61, '1', 'stock-app', 15821303232, 24, 1, 0, '2020-04-24 14:12:12', '2020-04-24 14:13:00');
INSERT INTO `t_device_message` VALUES (62, '1', 'stock-app', 15821303233, 24, 1, 0, '2020-04-24 14:12:12', '2020-04-24 14:13:00');
INSERT INTO `t_device_message` VALUES (63, '1', 'stock-app', 15821303234, 25, 1, 0, '2020-04-24 14:16:04', NULL);
INSERT INTO `t_device_message` VALUES (64, '1', 'stock-app', 15821303235, 25, 1, 0, '2020-04-24 14:16:04', NULL);
INSERT INTO `t_device_message` VALUES (65, '1', 'stock-app', 15821303232, 25, 1, 0, '2020-04-24 14:16:04', NULL);
INSERT INTO `t_device_message` VALUES (66, '1', 'stock-app', 15821303233, 25, 1, 0, '2020-04-24 14:16:04', NULL);
INSERT INTO `t_device_message` VALUES (67, '1', 'stock-app', 15821303234, 26, 1, 0, '2020-04-24 14:18:51', NULL);
INSERT INTO `t_device_message` VALUES (68, '1', 'stock-app', 15821303235, 26, 1, 0, '2020-04-24 14:18:51', NULL);
INSERT INTO `t_device_message` VALUES (69, '1', 'stock-app', 15821303232, 26, 1, 0, '2020-04-24 14:18:51', NULL);
INSERT INTO `t_device_message` VALUES (70, '1', 'stock-app', 15821303233, 26, 1, 0, '2020-04-24 14:18:51', NULL);
INSERT INTO `t_device_message` VALUES (71, '1', 'stock-app', 15821303234, 27, 1, 0, '2020-04-24 14:33:18', '2020-04-24 14:34:00');
INSERT INTO `t_device_message` VALUES (72, '1', 'stock-app', 15821303235, 27, 1, 0, '2020-04-24 14:33:18', '2020-04-24 14:34:00');
INSERT INTO `t_device_message` VALUES (73, '1', 'stock-app', 15821303232, 27, 1, 0, '2020-04-24 14:33:18', '2020-04-24 14:34:00');
INSERT INTO `t_device_message` VALUES (74, '1', 'stock-app', 15821303233, 27, 1, 0, '2020-04-24 14:33:18', '2020-04-24 14:34:00');

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_member
-- ----------------------------
DROP TABLE IF EXISTS `t_group_member`;
CREATE TABLE `t_group_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_message_push
-- ----------------------------
DROP TABLE IF EXISTS `t_message_push`;
CREATE TABLE `t_message_push`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` int(11) NOT NULL,
  `push_state` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `total_cnt` int(8) NULL DEFAULT NULL,
  `send_success_cnt` int(8) NULL DEFAULT NULL,
  `send_fail_cnt` int(8) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message_push
-- ----------------------------
INSERT INTO `t_message_push` VALUES (4, '1', 'stock-app', 'good', '空即是色', NULL, 1, 1, 0, NULL, NULL, 1, 0, 1, '推送成功');
INSERT INTO `t_message_push` VALUES (5, '1', 'stock-app', '2', '1', NULL, 1, 1, 0, NULL, NULL, 1, 0, 1, '推送成功');
INSERT INTO `t_message_push` VALUES (6, '1', 'stock-app', '2', '2', NULL, 1, 1, 0, NULL, NULL, 1, 0, 1, '推送成功');
INSERT INTO `t_message_push` VALUES (7, '1', 'stock-app', 'x', '21', NULL, 1, 1, 0, NULL, NULL, 1, 1, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (8, '1', 'stock-app', 'x', '23123213', NULL, 1, 1, 0, NULL, NULL, 1, 1, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (9, '1', 'stock-app', '想', '2', NULL, 1, 1, 0, NULL, NULL, 1, 0, 1, '推送成功');
INSERT INTO `t_message_push` VALUES (10, '1', 'stock-app', 'x', '2', NULL, 1, 1, 0, NULL, NULL, 1, 0, 1, '推送成功');
INSERT INTO `t_message_push` VALUES (11, '1', 'stock-app', '想', '2嘻嘻嘻', NULL, 1, 1, 0, '2020-04-23 12:40:55', NULL, 1, 0, 1, '推送成功');
INSERT INTO `t_message_push` VALUES (12, '1', 'stock-app', '.........', 'asdasdasdasd1 11', NULL, 1, 1, 0, '2020-04-23 14:59:04', '2020-04-23 15:34:00', 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (13, '1', 'stock-app', '你好啊。这是一条推送消息', '请看。。。', NULL, 1, 1, 0, '2020-04-23 15:35:00', '2020-04-23 15:38:00', 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (14, '1', 'stock-app', 'x', '斑斑驳驳', NULL, 1, 1, 0, '2020-04-23 15:39:05', NULL, 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (15, '1', 'stock-app', '上', '2', NULL, 1, 1, 0, '2020-04-23 15:41:30', NULL, 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (16, '1', 'stock-app', 's', '1', NULL, 1, 1, 0, '2020-04-23 15:42:38', NULL, 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (17, '1', 'stock-app', '2', '2', NULL, 1, 1, 0, '2020-04-23 15:43:25', NULL, 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (18, '1', 'stock-app', '123', '123', NULL, 1, 1, 0, '2020-04-23 15:56:28', NULL, 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (19, '1', 'stock-app', '今天是个好日子', '阿斯顿撒大所', NULL, 1, 1, 0, '2020-04-24 13:31:30', '2020-04-24 14:05:00', 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (20, '1', 'stock-app', '一点点无误', '123', NULL, 1, 1, 0, '2020-04-24 13:35:43', '2020-04-24 14:05:00', 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (21, '1', 'stock-app', '硕士', '2', NULL, 1, 1, 0, '2020-04-24 13:37:34', '2020-04-24 14:05:00', 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (22, '1', 'stock-app', '1', '2', NULL, 1, 1, 0, '2020-04-24 13:39:34', '2020-04-24 14:05:00', 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (23, '1', 'stock-app', '恶', '1', NULL, 1, 1, 0, '2020-04-24 14:01:58', '2020-04-24 14:05:00', 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (24, '1', 'stock-app', '阿', '2', NULL, 1, 1, 0, '2020-04-24 14:12:12', '2020-04-24 14:13:00', 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (25, '1', 'stock-app', '2', '2', NULL, 1, 1, 0, '2020-04-24 14:16:04', NULL, 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (26, '1', 'stock-app', '13', '1', NULL, 1, 1, 0, '2020-04-24 14:18:51', NULL, 4, 4, 0, '推送成功');
INSERT INTO `t_message_push` VALUES (27, '1', 'stock-app', '555555554', '13213', NULL, 1, 1, 0, '2020-04-24 14:33:18', '2020-04-24 14:34:00', 4, 4, 0, '推送成功');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_related
-- ----------------------------
DROP TABLE IF EXISTS `t_user_related`;
CREATE TABLE `t_user_related`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `follow_state` int(11) NOT NULL,
  `follow_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
