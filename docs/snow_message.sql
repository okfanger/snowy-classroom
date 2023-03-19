/*
 Navicat Premium Data Transfer

 Source Server         : csdn_root
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : mysql-internet-cn-north-1-c4c8ba40fabf4547-external.csdn.net.cn:3306
 Source Schema         : snow_message

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 19/03/2023 14:39:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for core_innermail
-- ----------------------------
DROP TABLE IF EXISTS `core_innermail`;
CREATE TABLE `core_innermail`
(
    `id`           bigint                                  DEFAULT NULL,
    `create_time`  datetime                                DEFAULT NULL,
    `update_time`  datetime                                DEFAULT NULL,
    `content`      longtext COLLATE utf8mb4_general_ci,
    `title`        varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `send_date`    datetime                                DEFAULT NULL,
    `receive_date` datetime                                DEFAULT NULL,
    `is_read`      tinyint                                 DEFAULT NULL,
    `from_user_id` bigint                                  DEFAULT NULL,
    `to_user_id`   bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_innermail
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
