/*
 Navicat Premium Data Transfer

 Source Server         : csdn_root
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : mysql-internet-cn-north-1-c4c8ba40fabf4547-external.csdn.net.cn:3306
 Source Schema         : snow_clazz

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 19/03/2023 14:39:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for core_classroom
-- ----------------------------
DROP TABLE IF EXISTS `core_classroom`;
CREATE TABLE `core_classroom`
(
    `id`          bigint                                  DEFAULT NULL,
    `create_time` datetime                                DEFAULT NULL,
    `update_time` datetime                                DEFAULT NULL,
    `name`        varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `monitor`     int                                     DEFAULT NULL,
    `adviser_id`  bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_classroom
-- ----------------------------
BEGIN;
INSERT INTO `core_classroom` (`id`, `create_time`, `update_time`, `name`, `monitor`, `adviser_id`)
VALUES (3, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '20计科三', 0, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
