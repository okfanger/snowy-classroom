/*
 Navicat Premium Data Transfer

 Source Server         : csdn_root
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : mysql-internet-cn-north-1-c4c8ba40fabf4547-external.csdn.net.cn:3306
 Source Schema         : snow_course

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 19/03/2023 14:39:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for core_course
-- ----------------------------
DROP TABLE IF EXISTS `core_course`;
CREATE TABLE `core_course`
(
    `id`          bigint                                  DEFAULT NULL,
    `create_time` datetime                                DEFAULT NULL,
    `update_time` datetime                                DEFAULT NULL,
    `name`        varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `open_time`   datetime                                DEFAULT NULL,
    `completed`   tinyint                                 DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_course
-- ----------------------------
BEGIN;
INSERT INTO `core_course` (`id`, `create_time`, `update_time`, `name`, `open_time`, `completed`)
VALUES (1, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '高等数学', '2022-12-19 02:06:16', 0);
INSERT INTO `core_course` (`id`, `create_time`, `update_time`, `name`, `open_time`, `completed`)
VALUES (2, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '线性代数', '2022-12-19 02:06:16', 0);
INSERT INTO `core_course` (`id`, `create_time`, `update_time`, `name`, `open_time`, `completed`)
VALUES (3, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '概率论', '2022-12-19 02:06:16', 0);
INSERT INTO `core_course` (`id`, `create_time`, `update_time`, `name`, `open_time`, `completed`)
VALUES (4, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '软件工程概论', '2022-12-19 02:06:16', 0);
COMMIT;

-- ----------------------------
-- Table structure for core_courseattendtask
-- ----------------------------
DROP TABLE IF EXISTS `core_courseattendtask`;
CREATE TABLE `core_courseattendtask`
(
    `id`          bigint   DEFAULT NULL,
    `create_time` datetime DEFAULT NULL,
    `update_time` datetime DEFAULT NULL,
    `duration`    int      DEFAULT NULL,
    `expire_time` datetime DEFAULT NULL,
    `course_id`   bigint   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_courseattendtask
-- ----------------------------
BEGIN;
INSERT INTO `core_courseattendtask` (`id`, `create_time`, `update_time`, `duration`, `expire_time`, `course_id`)
VALUES (1, '2023-01-16 13:58:57', '2023-01-16 13:58:57', 10, '2023-01-16 14:08:57', 4);
INSERT INTO `core_courseattendtask` (`id`, `create_time`, `update_time`, `duration`, `expire_time`, `course_id`)
VALUES (2, '2023-02-09 23:55:06', '2023-02-09 23:55:06', 7, '2023-02-10 00:02:36', 4);
INSERT INTO `core_courseattendtask` (`id`, `create_time`, `update_time`, `duration`, `expire_time`, `course_id`)
VALUES (3, '2023-03-13 10:47:17', '2023-03-13 10:47:17', 1, '2023-03-13 10:48:17', 4);
INSERT INTO `core_courseattendtask` (`id`, `create_time`, `update_time`, `duration`, `expire_time`, `course_id`)
VALUES (4, '2023-03-13 10:59:40', '2023-03-13 10:59:40', 1, '2023-03-13 11:00:40', 4);
COMMIT;

-- ----------------------------
-- Table structure for core_group
-- ----------------------------
DROP TABLE IF EXISTS `core_group`;
CREATE TABLE `core_group`
(
    `id`          bigint                                  DEFAULT NULL,
    `create_time` datetime                                DEFAULT NULL,
    `update_time` datetime                                DEFAULT NULL,
    `name`        varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `course_id`   bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for core_groupstudentbinder
-- ----------------------------
DROP TABLE IF EXISTS `core_groupstudentbinder`;
CREATE TABLE `core_groupstudentbinder`
(
    `id`          bigint   DEFAULT NULL,
    `create_time` datetime DEFAULT NULL,
    `update_time` datetime DEFAULT NULL,
    `leader`      tinyint  DEFAULT NULL,
    `course_id`   bigint   DEFAULT NULL,
    `group_id`    bigint   DEFAULT NULL,
    `student_id`  bigint   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_groupstudentbinder
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for core_student_courses
-- ----------------------------
DROP TABLE IF EXISTS `core_student_courses`;
CREATE TABLE `core_student_courses`
(
    `id`         bigint DEFAULT NULL,
    `student_id` bigint DEFAULT NULL,
    `course_id`  bigint DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_student_courses
-- ----------------------------
BEGIN;
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (1, 1, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (59, 1, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (2, 2, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (60, 2, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (3, 3, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (61, 3, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (4, 4, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (32, 4, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (33, 4, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (62, 4, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (5, 5, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (63, 5, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (6, 6, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (64, 6, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (7, 7, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (65, 7, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (8, 8, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (66, 8, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (34, 9, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (9, 9, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (67, 9, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (35, 10, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (10, 10, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (68, 10, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (36, 11, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (11, 11, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (69, 11, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (37, 12, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (12, 12, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (70, 12, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (38, 13, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (13, 13, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (71, 13, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (39, 14, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (14, 14, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (72, 14, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (40, 15, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (15, 15, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (73, 15, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (41, 16, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (16, 16, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (74, 16, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (42, 17, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (17, 17, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (75, 17, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (43, 18, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (18, 18, 2);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (76, 18, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (44, 19, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (19, 19, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (77, 19, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (45, 20, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (20, 20, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (78, 20, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (46, 21, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (21, 21, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (79, 21, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (47, 22, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (22, 22, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (80, 22, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (48, 23, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (23, 23, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (81, 23, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (49, 24, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (24, 24, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (82, 24, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (50, 25, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (25, 25, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (83, 25, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (51, 26, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (26, 26, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (84, 26, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (52, 27, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (27, 27, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (85, 27, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (53, 28, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (28, 28, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (86, 28, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (54, 29, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (29, 29, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (87, 29, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (55, 30, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (30, 30, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (88, 30, 4);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (56, 31, 1);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (31, 31, 3);
INSERT INTO `core_student_courses` (`id`, `student_id`, `course_id`)
VALUES (89, 31, 4);
COMMIT;

-- ----------------------------
-- Table structure for core_studentcourseattend
-- ----------------------------
DROP TABLE IF EXISTS `core_studentcourseattend`;
CREATE TABLE `core_studentcourseattend`
(
    `id`           bigint                                  DEFAULT NULL,
    `create_time`  datetime                                DEFAULT NULL,
    `update_time`  datetime                                DEFAULT NULL,
    `sign_in_time` datetime                                DEFAULT NULL,
    `result`       varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `student_id`   bigint                                  DEFAULT NULL,
    `task_id`      bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_studentcourseattend
-- ----------------------------
BEGIN;
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (1, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '正常', 1, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (2, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '请假', 2, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (3, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 3, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (4, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 4, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (5, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 5, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (6, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 6, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (7, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 7, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (8, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 8, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (9, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 9, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (10, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 10, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (11, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 11, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (12, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 12, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (13, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 13, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (14, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 14, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (15, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 15, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (16, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 16, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (17, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 17, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (18, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 18, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (19, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 19, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (20, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 20, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (21, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 21, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (22, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 22, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (23, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 23, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (24, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 24, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (25, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 25, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (26, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 26, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (27, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 27, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (28, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 28, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (29, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 29, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (30, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 30, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (31, '2023-01-16 13:58:57', '2023-01-16 13:58:57', NULL, '缺勤', 31, 1);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (32, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 1, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (33, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '正常', 2, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (34, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 3, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (35, '2023-02-09 23:55:06', '2023-02-09 23:55:34', '2023-02-09 23:55:34', '正常', 4, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (36, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 5, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (37, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 6, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (38, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 7, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (39, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 8, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (40, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 9, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (41, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 10, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (42, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 11, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (43, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 12, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (44, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 13, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (45, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 14, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (46, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 15, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (47, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 16, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (48, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 17, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (49, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 18, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (50, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 19, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (51, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 20, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (52, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 21, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (53, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 22, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (54, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 23, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (55, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 24, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (56, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 25, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (57, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 26, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (58, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 27, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (59, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 28, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (60, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 29, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (61, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 30, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (62, '2023-02-09 23:55:06', '2023-02-09 23:55:06', NULL, '缺勤', 31, 2);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (63, '2023-03-13 10:47:17', '2023-03-13 10:47:17', NULL, '缺勤', 1, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (64, '2023-03-13 10:47:17', '2023-03-13 10:47:17', NULL, '请假', 2, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (65, '2023-03-13 10:47:17', '2023-03-13 10:47:17', NULL, '缺勤', 3, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (66, '2023-03-13 10:47:17', '2023-03-13 10:48:02', '2023-03-13 10:48:02', '正常', 4, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (67, '2023-03-13 10:47:17', '2023-03-13 10:47:17', NULL, '缺勤', 5, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (68, '2023-03-13 10:47:17', '2023-03-13 10:47:17', NULL, '缺勤', 6, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (69, '2023-03-13 10:47:17', '2023-03-13 10:47:17', NULL, '缺勤', 7, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (70, '2023-03-13 10:47:17', '2023-03-13 10:47:17', NULL, '缺勤', 8, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (71, '2023-03-13 10:47:17', '2023-03-13 10:47:17', NULL, '缺勤', 9, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (72, '2023-03-13 10:47:17', '2023-03-13 10:47:18', NULL, '缺勤', 10, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (73, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 11, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (74, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 12, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (75, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 13, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (76, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 14, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (77, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 15, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (78, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 16, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (79, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 17, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (80, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 18, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (81, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 19, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (82, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 20, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (83, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 21, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (84, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 22, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (85, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 23, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (86, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 24, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (87, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 25, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (88, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 26, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (89, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 27, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (90, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 28, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (91, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 29, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (92, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 30, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (93, '2023-03-13 10:47:18', '2023-03-13 10:47:18', NULL, '缺勤', 31, 3);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (94, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 1, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (95, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 2, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (96, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 3, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (97, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 4, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (98, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 5, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (99, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 6, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (100, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 7, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (101, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 8, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (102, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 9, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (103, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 10, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (104, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 11, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (105, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 12, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (106, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 13, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (107, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 14, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (108, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 15, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (109, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 16, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (110, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 17, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (111, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 18, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (112, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 19, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (113, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 20, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (114, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 21, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (115, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 22, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (116, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 23, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (117, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 24, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (118, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 25, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (119, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 26, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (120, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 27, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (121, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 28, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (122, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 29, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (123, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 30, 4);
INSERT INTO `core_studentcourseattend` (`id`, `create_time`, `update_time`, `sign_in_time`, `result`, `student_id`,
                                        `task_id`)
VALUES (124, '2023-03-13 10:59:40', '2023-03-13 10:59:40', NULL, '缺勤', 31, 4);
COMMIT;

-- ----------------------------
-- Table structure for core_studentcourseleave
-- ----------------------------
DROP TABLE IF EXISTS `core_studentcourseleave`;
CREATE TABLE `core_studentcourseleave`
(
    `id`          bigint                                   DEFAULT NULL,
    `create_time` datetime                                 DEFAULT NULL,
    `update_time` datetime                                 DEFAULT NULL,
    `reason`      varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `type`        varchar(128) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `remark`      varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `status`      int                                      DEFAULT NULL,
    `start_time`  datetime                                 DEFAULT NULL,
    `end_time`    datetime                                 DEFAULT NULL,
    `course_id`   bigint                                   DEFAULT NULL,
    `student_id`  bigint                                   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_studentcourseleave
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for core_teacher_courses
-- ----------------------------
DROP TABLE IF EXISTS `core_teacher_courses`;
CREATE TABLE `core_teacher_courses`
(
    `id`         bigint DEFAULT NULL,
    `teacher_id` bigint DEFAULT NULL,
    `course_id`  bigint DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_teacher_courses
-- ----------------------------
BEGIN;
INSERT INTO `core_teacher_courses` (`id`, `teacher_id`, `course_id`)
VALUES (1, 1, 1);
INSERT INTO `core_teacher_courses` (`id`, `teacher_id`, `course_id`)
VALUES (3, 1, 3);
INSERT INTO `core_teacher_courses` (`id`, `teacher_id`, `course_id`)
VALUES (2, 2, 2);
INSERT INTO `core_teacher_courses` (`id`, `teacher_id`, `course_id`)
VALUES (4, 3, 4);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
