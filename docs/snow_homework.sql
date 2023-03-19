/*
 Navicat Premium Data Transfer

 Source Server         : csdn_root
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : mysql-internet-cn-north-1-c4c8ba40fabf4547-external.csdn.net.cn:3306
 Source Schema         : snow_homework

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 19/03/2023 14:39:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for core_homework
-- ----------------------------
DROP TABLE IF EXISTS `core_homework`;
CREATE TABLE `core_homework`
(
    `id`          bigint                                  DEFAULT NULL,
    `create_time` datetime                                DEFAULT NULL,
    `update_time` datetime                                DEFAULT NULL,
    `title`       varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `content`     longtext COLLATE utf8mb4_general_ci,
    `start_time`  datetime                                DEFAULT NULL,
    `end_time`    datetime                                DEFAULT NULL,
    `course_id`   bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_homework
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for core_studenthomeworkhandin
-- ----------------------------
DROP TABLE IF EXISTS `core_studenthomeworkhandin`;
CREATE TABLE `core_studenthomeworkhandin`
(
    `id`            bigint   DEFAULT NULL,
    `create_time`   datetime DEFAULT NULL,
    `update_time`   datetime DEFAULT NULL,
    `submit_time`   datetime DEFAULT NULL,
    `submit_detail` longtext COLLATE utf8mb4_general_ci,
    `course_id`     bigint   DEFAULT NULL,
    `homework_id`   bigint   DEFAULT NULL,
    `student_id`    bigint   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_studenthomeworkhandin
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
