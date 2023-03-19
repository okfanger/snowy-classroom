/*
 Navicat Premium Data Transfer

 Source Server         : csdn_root
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : mysql-internet-cn-north-1-c4c8ba40fabf4547-external.csdn.net.cn:3306
 Source Schema         : snow_user

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 19/03/2023 14:39:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_dict_code
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_code`;
CREATE TABLE `base_dict_code`
(
    `id`      bigint                                  DEFAULT NULL,
    `code`    varchar(50) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `name`    varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `parent`  varchar(10) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `type_id` varchar(5) COLLATE utf8mb4_general_ci   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of base_dict_code
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for base_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_type`;
CREATE TABLE `base_dict_type`
(
    `type`      varchar(5) COLLATE utf8mb4_general_ci   DEFAULT NULL,
    `type_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of base_dict_type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for core_student
-- ----------------------------
DROP TABLE IF EXISTS `core_student`;
CREATE TABLE `core_student`
(
    `id`           bigint                                 DEFAULT NULL,
    `create_time`  datetime                               DEFAULT NULL,
    `update_time`  datetime                               DEFAULT NULL,
    `attend_date`  datetime                               DEFAULT NULL,
    `grade`        varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `classroom_id` bigint                                 DEFAULT NULL,
    `user_id`      bigint                                 DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_student
-- ----------------------------
BEGIN;
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (1, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 101);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (2, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 102);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (3, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 103);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (4, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 104);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (5, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 105);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (6, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 106);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (7, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 107);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (8, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 108);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (9, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 109);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (10, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 110);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (11, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 111);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (12, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 112);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (13, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 113);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (14, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 114);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (15, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 115);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (16, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 116);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (17, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 117);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (18, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 118);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (19, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 119);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (20, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 120);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (21, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 121);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (22, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 122);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (23, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 123);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (24, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 124);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (25, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 125);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (26, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '2022-12-19 02:06:15', '3', 3, 126);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (27, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '2022-12-19 02:06:16', '3', 3, 127);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (28, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '2022-12-19 02:06:16', '3', 3, 128);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (29, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '2022-12-19 02:06:16', '3', 3, 129);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (30, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '2022-12-19 02:06:16', '3', 3, 130);
INSERT INTO `core_student` (`id`, `create_time`, `update_time`, `attend_date`, `grade`, `classroom_id`, `user_id`)
VALUES (31, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '2022-12-19 02:06:16', '3', 3, 131);
COMMIT;

-- ----------------------------
-- Table structure for core_teacher
-- ----------------------------
DROP TABLE IF EXISTS `core_teacher`;
CREATE TABLE `core_teacher`
(
    `id`          bigint                                  DEFAULT NULL,
    `create_time` datetime                                DEFAULT NULL,
    `update_time` datetime                                DEFAULT NULL,
    `teach_age`   int                                     DEFAULT NULL,
    `rank`        varchar(10) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `desc`        varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `user_id`     bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_teacher
-- ----------------------------
BEGIN;
INSERT INTO `core_teacher` (`id`, `create_time`, `update_time`, `teach_age`, `rank`, `desc`, `user_id`)
VALUES (1, '2022-12-19 02:06:15', '2022-12-19 02:06:15', 10, '辅导员', '几乎见不到人', 901);
INSERT INTO `core_teacher` (`id`, `create_time`, `update_time`, `teach_age`, `rank`, `desc`, `user_id`)
VALUES (2, '2022-12-19 02:06:15', '2022-12-19 02:06:15', 1, '辅导员', '易班上的', 902);
INSERT INTO `core_teacher` (`id`, `create_time`, `update_time`, `teach_age`, `rank`, `desc`, `user_id`)
VALUES (3, '2022-12-19 02:06:15', '2022-12-19 02:06:15', 8, '教师', '是老师啊', 903);
COMMIT;

-- ----------------------------
-- Table structure for users_menurouter
-- ----------------------------
DROP TABLE IF EXISTS `users_menurouter`;
CREATE TABLE `users_menurouter`
(
    `id`                 bigint                                  DEFAULT NULL,
    `create_time`        datetime                                DEFAULT NULL,
    `update_time`        datetime                                DEFAULT NULL,
    `parentId`           int                                     DEFAULT NULL,
    `name`               varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `component`          varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `redirect`           varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `hidden`             tinyint                                 DEFAULT NULL,
    `hideChildrenInMenu` tinyint                                 DEFAULT NULL,
    `path`               varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `meta_id`            bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of users_menurouter
-- ----------------------------
BEGIN;
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (10028, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 0, 'account', 'RouteView', '/account/center', 0, 0, '', 1);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (10029, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 10028, 'center', 'AccountCenter', NULL, 0, 0, '', 2);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (10030, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 10028, 'settings', 'AccountSettings',
        '/account/settings/basic', 0, 0, '', 3);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (10031, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 10030, 'BasicSettings', 'BasicSetting', NULL, 0, 0,
        '/account/settings/basic', 4);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (10032, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 10030, 'SecuritySettings', 'SecuritySettings', NULL, 0, 0,
        '/account/settings/security', 5);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (10033, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 10030, 'CustomSettings', 'CustomSettings', NULL, 0, 0,
        '/account/settings/custom', 6);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (10034, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 10030, 'BindingSettings', 'BindingSettings', NULL, 0, 0,
        '/account/settings/binding', 7);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (10035, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 10030, 'NotificationSettings', 'NotificationSettings',
        NULL, 0, 0, '/account/settings/notification', 8);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (11001, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 0, 'message', 'RouteView', '/message/sendMail', 0, 0,
        'message', 9);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (11002, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 11001, 'sendMail', 'example/account/message/send.vue',
        NULL, 0, 0, 'sendMail', 10);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (11003, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 11001, 'receiveMail',
        'example/account/message/receive.vue', NULL, 0, 0, 'receiveMail', 11);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (11004, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 11001, 'mailDetail',
        'example/account/message/receiveDetail.vue', NULL, 0, 0, 'mailDetail', 12);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51001, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'dashboard', 'teacher/dashboard/index.vue', '', 0, 0,
        '/dashboard', 36);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51002, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'ikun', 'teacher/ikun/index.vue', '', 0, 0, '/ikun',
        37);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51003, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'homework', 'RouteView', '', 0, 0, 'homework', 38);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51004, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51003, 'sendHomeWork', 'teacher/course/sendHomework.vue',
        '', 0, 0, 'sendHomeWork', 39);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51005, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'classroom', 'RouteView', '', 0, 0, 'classroom', 42);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51006, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51005, 'approvalIndex',
        'teacher/classroom/ApprovalLeave/approval.vue', '', 0, 0, 'approvalIndex', 43);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51007, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51005, 'notice', 'teacher/classroom/notice/notice.vue', '',
        0, 0, 'notice', 44);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51008, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51005, 'myNotice', 'teacher/classroom/notice/myNotice.vue',
        '', 0, 0, 'myNotice', 45);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51009, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51005, 'myNoticeDetail',
        'teacher/classroom/notice/myNoticeDetail.vue', '', 0, 0, 'myNoticeDetail', 46);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51010, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51005, 'PickMonitor',
        'teacher/classroom/monitor/PickMonitor.vue', '', 0, 0, 'PickMonitor', 47);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51011, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51003, 'correctionHomework',
        'teacher/course/correctionHomework.vue', '', 0, 0, 'correctionHomework', 40);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51012, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51003, 'correctionDetail',
        'teacher/course/correctionDetail.vue', '', 0, 0, 'correctionDetail', 41);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51041, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'course', 'RouteView', '/course/index', 0, 0, 'course',
        48);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51042, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51041, 'courseIndex', 'teacher/course/index.vue', '', 0, 0,
        'index', 49);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51043, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 51041, 'courseDetail', 'teacher/course/detail.vue', '', 0,
        0, 'detail', 50);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51046, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'exam', 'RouteView', '', 0, 0, 'exam', 51);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51047, '2022-12-19 02:06:18', '2022-12-19 02:06:19', 51046, 'examCreate', 'teacher/exam/create.vue', '', 0, 0,
        'create', 52);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51048, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 51046, 'examIndex', 'teacher/exam/index.vue', '', 0, 0,
        'index', 53);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51050, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 51046, 'examEdit', 'teacher/exam/edit.vue', '', 0, 0,
        'edit', 54);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (51053, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 51046, 'examPreview', 'teacher/exam/preview.vue', '', 0, 0,
        'preview', 55);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61001, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 0, 'dashboard', 'student/dashboard/index.vue',
        '/course/index', 0, 0, '/dashboard', 21);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61002, '2022-12-19 02:06:17', '2022-12-19 02:06:18', 0, 'basketball', 'student/nba/index.vue', '', 0, 0, '/nba',
        22);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61003, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'apple', 'student/apple/index.vue', '', 0, 0, '/apple',
        23);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61004, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'course', 'RouteView', '/course/index.vue', 0, 0,
        'course', 24);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61005, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 61004, 'courseIndex', 'student/course/index.vue', '', 0, 0,
        'index', 25);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61006, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 61004, 'courseDetail', 'student/course/detail.vue', '', 0,
        0, 'detail', 26);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61007, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'classroom', 'RouteView', '', 0, 0, 'classroom', 27);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61008, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'onlineJudgeIndex', 'student/onlinejudge/index.vue', '',
        0, 0, 'onlinejudge', 31);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61009, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'exam', 'RouteView', '', 0, 0, 'exam', 32);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61010, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 61009, 'examLive', 'student/exam/live.vue', '', 0, 0,
        'live', 33);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61011, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 61007, 'leaveIndex', 'student/classroom/leave.vue', '', 0,
        0, 'leaveIndex', 28);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61012, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 61007, 'MyNoteIndex', 'student/classroom/MyNote.vue', '',
        0, 0, 'MyNoteIndex', 29);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61013, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 61007, 'checkMonitor',
        'student/classroom/checkMonitor.vue', '', 0, 0, 'checkMonitor', 30);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61014, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 0, 'homework', 'RouteView', '', 0, 0, 'homework', 34);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (61015, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 61014, 'pushHomework', 'student/course/pushHomework.vue',
        '', 0, 0, 'pushHomework', 35);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (71001, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 0, 'dashboard', 'admin/dashboard/index.vue', '', 0, 0,
        '/dashboard', 13);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (71002, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 0, 'overall', 'admin/overall/index.vue', '', 0, 0,
        '/overall', 14);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (71003, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 0, 'homework', 'admin/homework/homework.vue', '', 0, 0,
        'homework', 15);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (71004, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 0, 'classroom', 'RouteView', '', 0, 0, 'classroom', 16);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (71005, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 71004, 'checkLeave', 'admin/classroom/checkLeave.vue', '',
        0, 0, 'checkLeave', 17);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (71006, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 71004, 'checkMonitor', 'admin/classroom/checkMonitor.vue',
        '', 0, 0, 'checkMonitor', 18);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (71007, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 71004, 'checkNotice', 'admin/classroom/checkNotice.vue',
        '', 0, 0, 'checkNotice', 19);
INSERT INTO `users_menurouter` (`id`, `create_time`, `update_time`, `parentId`, `name`, `component`, `redirect`,
                                `hidden`, `hideChildrenInMenu`, `path`, `meta_id`)
VALUES (71008, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 71004, 'checkNoticeDetail',
        'admin/classroom/checkNoticeDetail.vue', '', 0, 0, 'checkNoticeDetail', 20);
COMMIT;

-- ----------------------------
-- Table structure for users_menuroutermeta
-- ----------------------------
DROP TABLE IF EXISTS `users_menuroutermeta`;
CREATE TABLE `users_menuroutermeta`
(
    `id`                  bigint                                  DEFAULT NULL,
    `create_time`         datetime                                DEFAULT NULL,
    `update_time`         datetime                                DEFAULT NULL,
    `title`               varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `icon`                varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `keepAlive`           tinyint                                 DEFAULT NULL,
    `target`              varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `hidden`              tinyint                                 DEFAULT NULL,
    `hiddenHeaderContent` tinyint                                 DEFAULT NULL,
    `hideChildren`        tinyint                                 DEFAULT NULL,
    `hideHeader`          tinyint                                 DEFAULT NULL,
    `show`                tinyint                                 DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of users_menuroutermeta
-- ----------------------------
BEGIN;
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (1, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.account', 'user', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (2, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.account.center', '', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (3, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.account.settings', '', 0, '', 0, 0, 1, 1, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (4, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.settings.menuMap.basic', '', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (5, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.settings.menuMap.security', '', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (6, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.settings.menuMap.custom', '', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (7, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.settings.menuMap.binding', '', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (8, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.settings.menuMap.notification', '', 0, '', 0, 0, 0, 0,
        0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (9, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.message', 'message', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (10, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.message.sendMail', 'message', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (11, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.message.receiveMail', 'message', 0, '', 0, 0, 0, 0,
        1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (12, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'account.message.receiveMail.detail', 'message', 0, '', 0, 0,
        0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (13, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.dashboard', 'dashboard', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (14, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.overall', 'dribbble', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (15, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.homework.look', 'book', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (16, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.classroom.index', 'usergroup-add', 0, '', 0, 0, 0, 0,
        1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (17, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.classroom.MyNote.index', 'usergroup-add', 0, '', 0, 0,
        0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (18, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.classroom.checkMonitor.index', 'usergroup-add', 0, '',
        0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (19, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.classroom.checkNotice.index', 'usergroup-add', 0, '', 0,
        0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (20, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.classroom.myNoticeDetail.index', 'usergroup-add', 0, '',
        0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (21, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.dashboard', 'dashboard', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (22, '2022-12-19 02:06:17', '2022-12-19 02:06:17', 'menu.nba', 'dribbble', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (23, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.apple', 'apple', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (24, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.course', 'profile', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (25, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.course.index', 'profile', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (26, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.course.detail', 'profile', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (27, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.index', 'usergroup-add', 0, '', 0, 0, 0, 0,
        1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (28, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.leave.index', 'usergroup-add', 0, '', 0, 0, 0,
        0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (29, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.MyNote.index', 'usergroup-add', 0, '', 0, 0,
        0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (30, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.checkMonitor.index', 'usergroup-add', 0, '',
        0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (31, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.onlineJudge.index', 'code', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (32, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.exam', 'paper', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (33, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.exam.live', 'paper', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (34, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.course.homework', 'paper', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (35, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.course.pushHomework', 'paper', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (36, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.dashboard', 'dashboard', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (37, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.ikun', 'dribbble', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (38, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.homework', 'book', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (39, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.sendHomework', 'book', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (40, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.correctionHomework', 'book', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (41, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.correctionDetail', 'book', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (42, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.index', 'usergroup-add', 0, '', 0, 0, 0, 0,
        1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (43, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.approval.index', 'usergroup-add', 0, '', 0, 0,
        0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (44, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.notice.index', 'usergroup-add', 0, '', 0, 0,
        0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (45, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.myNotice.index', 'usergroup-add', 0, '', 0, 0,
        0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (46, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.myNoticeDetail.index', 'usergroup-add', 0, '',
        0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (47, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.classroom.PickMonitor.index', 'usergroup-add', 0, '', 0,
        0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (48, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.course', 'profile', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (49, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.course.index', 'profile', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (50, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.course.detail', 'profile', 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (51, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.exam', 'profile', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (52, '2022-12-19 02:06:18', '2022-12-19 02:06:18', 'menu.exam.create', 'profile', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (53, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 'menu.exam.index', 'profile', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (54, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 'menu.exam.edit', 'profile', 0, '', 0, 0, 0, 0, 1);
INSERT INTO `users_menuroutermeta` (`id`, `create_time`, `update_time`, `title`, `icon`, `keepAlive`, `target`,
                                    `hidden`, `hiddenHeaderContent`, `hideChildren`, `hideHeader`, `show`)
VALUES (55, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 'menu.exam.preview', 'profile', 0, '', 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`
(
    `id`          bigint                                  DEFAULT NULL,
    `create_time` datetime                                DEFAULT NULL,
    `update_time` datetime                                DEFAULT NULL,
    `name`        varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `describe`    varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of users_role
-- ----------------------------
BEGIN;
INSERT INTO `users_role` (`id`, `create_time`, `update_time`, `name`, `describe`)
VALUES (1, '2022-12-19 02:06:14', '2022-12-19 02:06:14', 'admin', '管理员');
INSERT INTO `users_role` (`id`, `create_time`, `update_time`, `name`, `describe`)
VALUES (2, '2022-12-19 02:06:14', '2022-12-19 02:06:14', 'teacher', '教师');
INSERT INTO `users_role` (`id`, `create_time`, `update_time`, `name`, `describe`)
VALUES (3, '2022-12-19 02:06:14', '2022-12-19 02:06:14', 'student', '学生');
COMMIT;

-- ----------------------------
-- Table structure for users_role_menu_routes
-- ----------------------------
DROP TABLE IF EXISTS `users_role_menu_routes`;
CREATE TABLE `users_role_menu_routes`
(
    `id`            bigint DEFAULT NULL,
    `role_id`       bigint DEFAULT NULL,
    `menurouter_id` bigint DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of users_role_menu_routes
-- ----------------------------
BEGIN;
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (60, 1, 10028);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (61, 1, 10029);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (62, 1, 10030);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (63, 1, 10031);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (64, 1, 10032);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (65, 1, 10033);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (66, 1, 10034);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (67, 1, 10035);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (76, 1, 11001);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (77, 1, 11002);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (78, 1, 11003);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (79, 1, 11004);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (68, 1, 71001);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (69, 1, 71002);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (70, 1, 71003);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (71, 1, 71004);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (72, 1, 71005);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (73, 1, 71006);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (74, 1, 71007);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (75, 1, 71008);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (28, 2, 10028);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (29, 2, 10029);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (30, 2, 10030);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (31, 2, 10031);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (32, 2, 10032);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (33, 2, 10033);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (34, 2, 10034);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (35, 2, 10035);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (56, 2, 11001);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (57, 2, 11002);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (58, 2, 11003);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (59, 2, 11004);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (36, 2, 51001);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (37, 2, 51002);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (38, 2, 51003);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (39, 2, 51004);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (40, 2, 51005);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (41, 2, 51006);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (42, 2, 51007);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (43, 2, 51008);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (44, 2, 51009);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (45, 2, 51010);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (46, 2, 51011);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (47, 2, 51012);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (48, 2, 51041);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (49, 2, 51042);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (50, 2, 51043);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (51, 2, 51046);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (52, 2, 51047);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (53, 2, 51048);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (54, 2, 51050);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (55, 2, 51053);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (1, 3, 10028);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (2, 3, 10029);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (3, 3, 10030);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (4, 3, 10031);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (5, 3, 10032);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (6, 3, 10033);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (7, 3, 10034);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (8, 3, 10035);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (24, 3, 11001);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (25, 3, 11002);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (26, 3, 11003);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (27, 3, 11004);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (9, 3, 61001);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (10, 3, 61002);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (11, 3, 61003);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (12, 3, 61004);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (13, 3, 61005);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (14, 3, 61006);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (15, 3, 61007);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (16, 3, 61008);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (17, 3, 61009);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (18, 3, 61010);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (19, 3, 61011);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (20, 3, 61012);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (21, 3, 61013);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (22, 3, 61014);
INSERT INTO `users_role_menu_routes` (`id`, `role_id`, `menurouter_id`)
VALUES (23, 3, 61015);
COMMIT;

-- ----------------------------
-- Table structure for users_user
-- ----------------------------
DROP TABLE IF EXISTS `users_user`;
CREATE TABLE `users_user`
(
    `id`          bigint                                  DEFAULT NULL,
    `create_time` datetime                                DEFAULT NULL,
    `update_time` datetime                                DEFAULT NULL,
    `name`        varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `username`    varchar(64) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `password`    varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `email`       varchar(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `telephone`   varchar(20) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `type`        int                                     DEFAULT NULL,
    `role_id`     bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of users_user
-- ----------------------------
BEGIN;
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (101, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '杨关城', '2020122100611',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (102, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '卢佳彤', '2020122101835',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin1@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (103, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '陶秀军', '2020122102752',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin2@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (104, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '方宇杰', '2020122104559',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin3@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (105, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '安紫宁', '2020122104563',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin4@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (106, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '孔德旭', '2020122104568',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin5@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (107, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '谷志妍', '2020122104571',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin6@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (108, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '马士杰', '2020122104574',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin7@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (109, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '王嘉鹏', '2020122104578',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin8@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (110, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '王雅杰', '2020122104582',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin9@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (111, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '王东林', '2020122104591',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin10@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (112, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '段睿丰', '2020122104593',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin11@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (113, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '王磊', '2020122104599', '827ccb0eea8a706c4c34a16891f84e7b',
        'admin12@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (114, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '袁东方', '2020122104607',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin13@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (115, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '李子昊', '2020122104612',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin14@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (116, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '安楠', '2020122104613', '827ccb0eea8a706c4c34a16891f84e7b',
        'admin15@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (117, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '贾红宇', '2020122104617',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin16@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (118, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '韩镕泽', '2020122104618',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin17@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (119, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '徐欢', '2020122104619', '827ccb0eea8a706c4c34a16891f84e7b',
        'admin18@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (120, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '罗伟', '2020122104622', '827ccb0eea8a706c4c34a16891f84e7b',
        'admin19@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (121, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '李昕旺', '2020122104624',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin20@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (122, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '王艺然', '2020122104627',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin21@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (123, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '边柯丹', '2020122104637',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin22@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (124, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '高赫骞', '2020122104641',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin23@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (125, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '杨洋', '2020122104643', '827ccb0eea8a706c4c34a16891f84e7b',
        'admin24@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (126, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '云曦', '2020122104649', '827ccb0eea8a706c4c34a16891f84e7b',
        'admin25@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (127, '2022-12-19 02:06:15', '2022-12-19 02:06:16', '吴智辉', '2020122104650',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin26@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (128, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '张利婷', '2020122104654',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin27@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (129, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '侯瑞东', '2020122105640',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin28@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (130, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '刘瀚斌', '2020122105935',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin29@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (131, '2022-12-19 02:06:16', '2022-12-19 02:06:16', '额尔敦套古斯', '2020122109031',
        '827ccb0eea8a706c4c34a16891f84e7b', 'admin30@qq.com', '18999999999', 3, 3);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (901, '2022-12-19 02:06:14', '2022-12-19 02:06:14', '庄霞', 'misszhuang', '827ccb0eea8a706c4c34a16891f84e7b',
        'no@qq.com', '1008611', 2, 2);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (902, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '尤月', 'missyou', '827ccb0eea8a706c4c34a16891f84e7b',
        'nono@qq.com', '1008622', 2, 2);
INSERT INTO `users_user` (`id`, `create_time`, `update_time`, `name`, `username`, `password`, `email`, `telephone`,
                          `type`, `role_id`)
VALUES (903, '2022-12-19 02:06:15', '2022-12-19 02:06:15', '张丽', 'misslee', '827ccb0eea8a706c4c34a16891f84e7b',
        'lili@qq.com', '1008633', 2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
