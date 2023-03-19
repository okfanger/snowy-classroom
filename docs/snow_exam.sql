/*
 Navicat Premium Data Transfer

 Source Server         : csdn_root
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : mysql-internet-cn-north-1-c4c8ba40fabf4547-external.csdn.net.cn:3306
 Source Schema         : snow_exam

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 19/03/2023 14:39:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for core_exam
-- ----------------------------
DROP TABLE IF EXISTS `core_exam`;
CREATE TABLE `core_exam`
(
    `id`          bigint                                  DEFAULT NULL,
    `create_time` datetime                                DEFAULT NULL,
    `update_time` datetime                                DEFAULT NULL,
    `name`        varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `type`        varchar(10) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `start_time`  datetime                                DEFAULT NULL,
    `end_time`    datetime                                DEFAULT NULL,
    `course_id`   bigint                                  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_exam
-- ----------------------------
BEGIN;
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (1, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '高等数学期中考试', '线上考试', '2022-12-19 02:06:19',
        '2022-12-19 02:06:19', 1);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (100, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '软件需求练习题', '线上', '2022-12-19 02:06:19',
        '2022-12-19 12:06:19', 4);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (101, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '软件测试', '线下', '2022-12-19 02:06:20',
        '2022-12-19 12:06:20', 4);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (102, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '支付与维护测试题', '线上', '2022-12-19 02:06:20',
        '2022-12-19 12:06:20', 4);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (103, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '详细设计', '线下', '2022-12-19 02:06:21',
        '2022-12-19 12:06:21', 4);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (104, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '概要设计', '线上', '2022-12-19 02:06:22',
        '2022-12-19 12:06:22', 4);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (105, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '软件工程概述练习题', '线下', '2022-12-19 02:06:23',
        '2022-12-19 12:06:23', 4);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (106, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '软件编码', '线上', '2022-12-19 02:06:24',
        '2022-12-19 12:06:24', 4);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (107, '2023-02-10 00:01:56', '2023-02-10 00:01:56', '小考试', '线上', '2023-02-10 16:01:42',
        '2023-03-16 16:01:42', 4);
INSERT INTO `core_exam` (`id`, `create_time`, `update_time`, `name`, `type`, `start_time`, `end_time`, `course_id`)
VALUES (108, '2023-02-10 00:02:14', '2023-02-10 00:02:14', '小考试', '线上', '2023-02-01 08:01:00',
        '2023-03-31 08:01:00', 4);
COMMIT;

-- ----------------------------
-- Table structure for core_examquestionresult
-- ----------------------------
DROP TABLE IF EXISTS `core_examquestionresult`;
CREATE TABLE `core_examquestionresult`
(
    `id`           bigint   DEFAULT NULL,
    `create_time`  datetime DEFAULT NULL,
    `update_time`  datetime DEFAULT NULL,
    `stu_answer`   int      DEFAULT NULL,
    `right_answer` int      DEFAULT NULL,
    `right`        tinyint  DEFAULT NULL,
    `score`        int      DEFAULT NULL,
    `exam_join_id` bigint   DEFAULT NULL,
    `question_id`  bigint   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_examquestionresult
-- ----------------------------
BEGIN;
INSERT INTO `core_examquestionresult` (`id`, `create_time`, `update_time`, `stu_answer`, `right_answer`, `right`,
                                       `score`, `exam_join_id`, `question_id`)
VALUES (1, '2023-02-10 00:03:19', '2023-02-10 00:03:28', 278, NULL, 0, 0, 1, 70);
COMMIT;

-- ----------------------------
-- Table structure for core_examstudentattend
-- ----------------------------
DROP TABLE IF EXISTS `core_examstudentattend`;
CREATE TABLE `core_examstudentattend`
(
    `id`          bigint   DEFAULT NULL,
    `create_time` datetime DEFAULT NULL,
    `update_time` datetime DEFAULT NULL,
    `score`       double   DEFAULT NULL,
    `is_done`     tinyint  DEFAULT NULL,
    `course_id`   bigint   DEFAULT NULL,
    `exam_id`     bigint   DEFAULT NULL,
    `student_id`  bigint   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_examstudentattend
-- ----------------------------
BEGIN;
INSERT INTO `core_examstudentattend` (`id`, `create_time`, `update_time`, `score`, `is_done`, `course_id`, `exam_id`,
                                      `student_id`)
VALUES (1, '2023-02-10 00:03:17', '2023-02-10 00:03:28', 0, 1, 4, 108, 4);
INSERT INTO `core_examstudentattend` (`id`, `create_time`, `update_time`, `score`, `is_done`, `course_id`, `exam_id`,
                                      `student_id`)
VALUES (2, '2023-03-12 09:30:50', '2023-03-12 09:30:50', 0, 0, 4, 107, 4);
COMMIT;

-- ----------------------------
-- Table structure for core_question
-- ----------------------------
DROP TABLE IF EXISTS `core_question`;
CREATE TABLE `core_question`
(
    `id`          bigint                                   DEFAULT NULL,
    `create_time` datetime                                 DEFAULT NULL,
    `update_time` datetime                                 DEFAULT NULL,
    `type`        varchar(10) COLLATE utf8mb4_general_ci   DEFAULT NULL,
    `title`       varchar(256) COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `content`     varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `exam_id`     bigint                                   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_question
-- ----------------------------
BEGIN;
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (1, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题', '软件需求分析一般应确定的是用户对软件的（  ）。',
        '软件需求分析一般应确定的是用户对软件的（  ）。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (2, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题',
        '软件需求管理过程包括需求获取、需求分析、编写需求规格说明书、需求评审以及（   ）。',
        '软件需求管理过程包括需求获取、需求分析、编写需求规格说明书、需求评审以及（   ）。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (3, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题', '软件需求分析阶段建立原型的主要目的是（    ）。',
        '软件需求分析阶段建立原型的主要目的是（    ）。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (4, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题', '软件开发过程中，需求活动的主要任务是（ ）。',
        '软件开发过程中，需求活动的主要任务是（ ）。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (5, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题',
        '在需求分析阶段，需求分析人员需要了解用户的需求，认真仔细地调研、分析，最终应 建立目标系统的逻辑模型并写出（ ）。',
        '在需求分析阶段，需求分析人员需要了解用户的需求，认真仔细地调研、分析，最终应 建立目标系统的逻辑模型并写出（ ）。',
        100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (6, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题',
        '软件需求规格说明文档中包括多方面的内容，下述（    ）不是软件需求规格说明文 档中应包括的内容。',
        '软件需求规格说明文档中包括多方面的内容，下述（    ）不是软件需求规格说明文 档中应包括的内容。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (7, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题', '结构化分析方法中，描述软件功能需求的常用工具有（  ）。',
        '结构化分析方法中，描述软件功能需求的常用工具有（  ）。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (8, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题', '软件需求阶段要解决的问题是（   ）。',
        '软件需求阶段要解决的问题是（   ）。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (9, '2022-12-19 02:06:19', '2022-12-19 02:06:19', '单选题',
        '在原型法中开发人员根据（    ）需求不断修改原型，直到满足用户要求为止。',
        '在原型法中开发人员根据（    ）需求不断修改原型，直到满足用户要求为止。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (10, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题',
        '结构化分析方法以数据流图、（ ）和加工说明等描述工具，即用直观的图和简介的语 言来描述软件系统模型。',
        '结构化分析方法以数据流图、（ ）和加工说明等描述工具，即用直观的图和简介的语 言来描述软件系统模型。', 100);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (11, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题', '集成测试主要是针对（ ）阶段的错误。',
        '集成测试主要是针对（ ）阶段的错误。', 101);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (12, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题',
        '（   ）方法需要考察模块间的接口和各个模块之间的关系。', '（   ）方法需要考察模块间的接口和各个模块之间的关系。',
        101);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (13, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题', '在测试中，下列说法错误的是（    ）。',
        '在测试中，下列说法错误的是（    ）。', 101);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (14, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题', '以下（  ）不属于白盒测试技术。',
        '以下（  ）不属于白盒测试技术。', 101);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (15, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题',
        '单元测试又称为（    ），可以用白盒法也可以采用黑盒法测试。',
        '单元测试又称为（    ），可以用白盒法也可以采用黑盒法测试。', 101);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (16, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题',
        '（  ）能够有效地检测输入条件的各种组合可能引起的错误。', '（  ）能够有效地检测输入条件的各种组合可能引起的错误。',
        101);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (17, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题',
        '在软件测试中，设计测试用例主要由输入输出数据和（   ）两部分组成',
        '在软件测试中，设计测试用例主要由输入输出数据和（   ）两部分组成', 101);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (18, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题', '通过程序设计的控制结构导出测试用例的测试方法是（ ）',
        '通过程序设计的控制结构导出测试用例的测试方法是（ ）', 101);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (19, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题',
        '对于软件的 （  ），有一种简单的面向时间的度量，叫做平均变更等待时间 MTTC （Mean Time To Change)。 这个时间包括开始分析变更要求、设计合适的修改、实现    变更 并测试它、以及把这种变更发送给所有的用户',
        '对于软件的 （  ），有一种简单的面向时间的度量，叫做平均变更等待时间 MTTC （Mean Time To Change)。 这个时间包括开始分析变更要求、设计合适的修改、实现    变更 并测试它、以及把这种变更发送给所有的用户',
        102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (20, '2022-12-19 02:06:20', '2022-12-19 02:06:20', '单选题',
        '软件维护是软件生命周期中的固有阶段，一般认为，各种不同的软件维护中以（  ）维护所占的维护量最小',
        '软件维护是软件生命周期中的固有阶段，一般认为，各种不同的软件维护中以（  ）维护所占的维护量最小', 102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (21, '2022-12-19 02:06:20', '2022-12-19 02:06:21', '单选题', '下面哪个不是交付过程的文档（   ）。',
        '下面哪个不是交付过程的文档（   ）。', 102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (22, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题', '诊断和消除程序在使用过程中发生错误的过程称为（）',
        '诊断和消除程序在使用过程中发生错误的过程称为（）', 102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (23, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题',
        '软件按照设计的要求，在规定时间和条件下达到不出故障、持续运行要求的质量特性称 为（   ）。',
        '软件按照设计的要求，在规定时间和条件下达到不出故障、持续运行要求的质量特性称 为（   ）。', 102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (24, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题', '为适应软件运行环境的变化而修改软件的活动称为（）。',
        '为适应软件运行环境的变化而修改软件的活动称为（）。', 102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (25, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题',
        '在软件生存期的维护阶段，继续诊断和修正错误的过程称为（）。',
        '在软件生存期的维护阶段，继续诊断和修正错误的过程称为（）。', 102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (26, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题',
        '度量软件的可维护性可以包括很多方面，下列（   ）不在措施之列。',
        '度量软件的可维护性可以包括很多方面，下列（   ）不在措施之列。', 102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (27, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题', '产生软件维护的副作用，是指（）。',
        '产生软件维护的副作用，是指（）。', 102);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (28, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题', '为了提高模块的独立性，模块内部最好是（  ） 。',
        '为了提高模块的独立性，模块内部最好是（  ） 。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (29, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题',
        '在详细设计阶段，一种二维树型结构并可自动生成程序代码的描述工具是(   )。',
        '在详细设计阶段，一种二维树型结构并可自动生成程序代码的描述工具是(   )。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (30, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题', '数据元素组成数据的方式的基本类型是（   ）。',
        '数据元素组成数据的方式的基本类型是（   ）。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (31, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题',
        '伪码又称为过程设计语言 PDL，一种典型的 PDL 是仿照（ ）编写的。',
        '伪码又称为过程设计语言 PDL，一种典型的 PDL 是仿照（ ）编写的。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (32, '2022-12-19 02:06:21', '2022-12-19 02:06:21', '单选题', '软件详细设计的主要任务是确定每个模块的（ ）。',
        '软件详细设计的主要任务是确定每个模块的（ ）。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (33, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题', '为了提高模块的独立性，模块之间最好是（ ） 。',
        '为了提高模块的独立性，模块之间最好是（ ） 。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (34, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题', '伪码作为详细设计的工具，缺点在于（   ）。',
        '伪码作为详细设计的工具，缺点在于（   ）。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (35, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题', '软件设计中，可应用于详细设计的工具有（ ）',
        '软件设计中，可应用于详细设计的工具有（ ）', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (36, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题',
        'JSD 设计方法是由 Jackson 所提出的，它是一种面向（ ）的软件设计方法。',
        'JSD 设计方法是由 Jackson 所提出的，它是一种面向（ ）的软件设计方法。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (37, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题',
        '结构化程序流程图中一般包括 3 种基本结构，下述结构中（   ）不属于其基本结构。',
        '结构化程序流程图中一般包括 3 种基本结构，下述结构中（   ）不属于其基本结构。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (38, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题', '程序流程图中的箭头代表的是（ ）。',
        '程序流程图中的箭头代表的是（ ）。', 103);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (39, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题',
        '内聚是从功能角度来度量模块内的联系，按照特定次序执行元素的模块属于（ ）方式',
        '内聚是从功能角度来度量模块内的联系，按照特定次序执行元素的模块属于（ ）方式', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (40, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题', '下面哪个阶段不是数据库设计的阶段（ ）',
        '下面哪个阶段不是数据库设计的阶段（ ）', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (41, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题', '面向数据流的设计方法把（  ）映射成软件结构。',
        '面向数据流的设计方法把（  ）映射成软件结构。', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (42, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题',
        '模块本身的内聚是模块独立性的重要度量因素之一，在 7 类内聚中，具有最强内聚的一 类是（  ）。',
        '模块本身的内聚是模块独立性的重要度量因素之一，在 7 类内聚中，具有最强内聚的一 类是（  ）。', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (43, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题', '软件设计是一个将（    ）转换为软件表示的过程。',
        '软件设计是一个将（    ）转换为软件表示的过程。', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (44, '2022-12-19 02:06:22', '2022-12-19 02:06:22', '单选题',
        '软件的结构化设计方法是以（ ）为依据的模块结构设计方法。', '软件的结构化设计方法是以（ ）为依据的模块结构设计方法。',
        104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (45, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题', '下列关于软件设计准则的描述，错误的是（   ）。',
        '下列关于软件设计准则的描述，错误的是（   ）。', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (46, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题',
        '耦合是软件各个模块间连接的一种度量。一组模块都访问同一数据结构应属于（  ）方 式。',
        '耦合是软件各个模块间连接的一种度量。一组模块都访问同一数据结构应属于（  ）方 式。', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (47, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题', '数据字典是定义（   ）中的数据的工具',
        '数据字典是定义（   ）中的数据的工具', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (48, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题',
        '概要设计是软件工程中很重要的技术活动，下列不是概要设计任务的是（  ）。',
        '概要设计是软件工程中很重要的技术活动，下列不是概要设计任务的是（  ）。', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (49, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题',
        '面向数据流的软件设计方法中，一般是把数据流图中的数据流分为（ ）两种流，再将数据流图映射为软件结构。',
        '面向数据流的软件设计方法中，一般是把数据流图中的数据流分为（ ）两种流，再将数据流图映射为软件结构。', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (50, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题', '数据存储和数据流都是（ ），仅仅是所处的状态不同。',
        '数据存储和数据流都是（ ），仅仅是所处的状态不同。', 104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (51, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题',
        '结构化的概要设计是以（    ）技术为基础的软件设计方法。', '结构化的概要设计是以（    ）技术为基础的软件设计方法。',
        104);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (52, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题', '软件工程的出现主要是由于（    ）',
        '软件工程的出现主要是由于（    ）', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (53, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题',
        '结构化的概要设计是以（    ）技术为基础的软件设计方法。', '结构化的概要设计是以（    ）技术为基础的软件设计方法。',
        105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (54, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题',
        '软件工程方法的提出起源于软件危机，其目的应该是最终解决软件的（    ）问题。',
        '软件工程方法的提出起源于软件危机，其目的应该是最终解决软件的（    ）问题。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (55, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题',
        '在结构化分析方法中，常用的描述软件功能需求的工具是（    ）。',
        '在结构化分析方法中，常用的描述软件功能需求的工具是（    ）。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (56, '2022-12-19 02:06:23', '2022-12-19 02:06:23', '单选题', '下列所述不是软件组成的是（    ）。',
        '下列所述不是软件组成的是（    ）。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (57, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题', '下列所述不是敏捷生存期模型的是（  ）。',
        '下列所述不是敏捷生存期模型的是（  ）。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (58, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题', '下面哪个不是 UML 的图示（   ）',
        '下面哪个不是 UML 的图示（   ）', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (59, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题', '以下（     ）不是软件危机的表现形式。',
        '以下（     ）不是软件危机的表现形式。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (60, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题',
        '以下哪项不是 SWEBOK V3 的软件工程实践中的知识域（    ）。',
        '以下哪项不是 SWEBOK V3 的软件工程实践中的知识域（    ）。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (61, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题',
        '软件工程学涉及软件开发技术和项目管理等方面的内容，下述内容中（   ）不属于开 发技术的范畴。',
        '软件工程学涉及软件开发技术和项目管理等方面的内容，下述内容中（   ）不属于开 发技术的范畴。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (62, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题', '下列对“计算机软件”描述正确的是（  ）。',
        '下列对“计算机软件”描述正确的是（  ）。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (63, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题',
        '结构化分析方法是面向（   ）的自顶向下逐步求精的分析方法。',
        '结构化分析方法是面向（   ）的自顶向下逐步求精的分析方法。', 105);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (64, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题',
        '下面是一段求最大值的程序，其中 datalist 是数据表，n 是数据表的长度，则其 McCabe 环路复杂性为 （  ） int GetMax(int n, int datalist[ ])  {        int k=0;                 for ( int j=1; j<n; j++ )  if ( datalist[j] > datalist[k] )  k=j;                  return k;  }',
        '下面是一段求最大值的程序，其中 datalist 是数据表，n 是数据表的长度，则其 McCabe 环路复杂性为 （  ） int GetMax(int n, int datalist[ ])  {        int k=0;                 for ( int j=1; j<n; j++ )  if ( datalist[j] > datalist[k] )  k=j;                  return k;  }',
        106);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (65, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题',
        '结构化程序设计要求程序由顺序、循环和（   ）三种结构组成。',
        '结构化程序设计要求程序由顺序、循环和（   ）三种结构组成。', 106);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (66, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题',
        '将每个模块的控制结构转换成计算机可接受的程序代码是(    )阶段的任务。',
        '将每个模块的控制结构转换成计算机可接受的程序代码是(    )阶段的任务。', 106);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (67, '2022-12-19 02:06:24', '2022-12-19 02:06:24', '单选题', '下列伪代码中，A=14，B=20，则 X 的值是（   ）',
        '下列伪代码中，A=14，B=20，则 X 的值是（   ）', 106);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (68, '2022-12-19 02:06:25', '2022-12-19 02:06:25', '单选题',
        '编码高效率原则包括提高运行效率，提高储存效率和提高( )', '编码高效率原则包括提高运行效率，提高储存效率和提高( )',
        106);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (69, '2022-12-19 02:06:25', '2022-12-19 02:06:25', '单选题', '软件调试的目的是（   ）。', '软件调试的目的是（   ）。',
        106);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (70, '2023-02-10 00:02:31', '2023-02-10 00:02:31', '单选题', '孕妇打架算群殴吗', '', 108);
INSERT INTO `core_question` (`id`, `create_time`, `update_time`, `type`, `title`, `content`, `exam_id`)
VALUES (71, '2023-03-14 14:12:43', '2023-03-14 14:12:43', '多选题', '你知道你犯了什么错吗', '', 108);
COMMIT;

-- ----------------------------
-- Table structure for core_questionoption
-- ----------------------------
DROP TABLE IF EXISTS `core_questionoption`;
CREATE TABLE `core_questionoption`
(
    `id`          bigint                                   DEFAULT NULL,
    `create_time` datetime                                 DEFAULT NULL,
    `update_time` datetime                                 DEFAULT NULL,
    `right`       tinyint                                  DEFAULT NULL,
    `content`     varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `exam_id`     bigint                                   DEFAULT NULL,
    `question_id` bigint                                   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of core_questionoption
-- ----------------------------
BEGIN;
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (1, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 1, '功能需求和非功能需求', 100, 1);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (2, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '性能需求', 100, 1);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (3, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '非功能需求', 100, 1);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (4, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '功能需求', 100, 1);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (5, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 1, '需求变更', 100, 2);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (6, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '用户参与', 100, 2);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (7, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '都不正确', 100, 2);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (8, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '总结', 100, 2);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (9, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 1, '确定系统是否满足用户要求', 100, 3);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (10, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '确定系统是否满足开发人员需要', 100, 3);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (11, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '确定系统的功能和性能要求', 100, 3);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (12, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '确定系统的性能要求', 100, 3);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (13, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '给出系统模块结构', 100, 4);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (14, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '给出软件解决方案', 100, 4);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (15, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '定义模块算法', 100, 4);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (16, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 1, '定义需求并建立系统模型', 100, 4);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (17, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '模块说明书', 100, 5);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (18, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 1, '需求规格说明书', 100, 5);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (19, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '合同文档', 100, 5);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (20, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '项目开发设计', 100, 5);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (21, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 1, '软件代码', 100, 6);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (22, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '功能描述', 100, 6);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (23, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '性能描述', 100, 6);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (24, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '安全描述', 100, 6);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (25, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 1, '数据流图，数据字典', 100, 7);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (26, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '软件流程图，模块说明', 100, 7);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (27, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '系统流程图，程序编码', 100, 7);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (28, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '业务图，数据字典', 100, 7);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (29, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '软件提供哪些信息', 100, 8);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (30, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '软件采用什么结构', 100, 8);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (31, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 0, '软件怎样做', 100, 8);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (32, '2022-12-19 02:06:19', '2022-12-19 02:06:19', 1, '软件做什么', 100, 8);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (33, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '程序员', 100, 9);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (34, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '系统分析员', 100, 9);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (35, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '用户', 100, 9);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (36, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '开发人员', 100, 9);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (37, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, 'HIPO 图', 100, 10);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (38, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, 'DFD 图', 100, 10);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (39, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, 'PAD 图', 100, 10);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (40, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '数据字典', 100, 10);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (41, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '详细设计', 101, 11);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (42, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '需求设计', 101, 11);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (43, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '编码', 101, 11);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (44, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '概要设计', 101, 11);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (45, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '集成测试', 101, 12);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (46, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '确认测试', 101, 12);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (47, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '系统测试', 101, 12);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (48, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '单元测试', 101, 12);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (49, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '测试是为了表明程序的正确性', 101, 13);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (50, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '成功的测试是发现了至今为止尚未发现的错误', 101, 13);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (51, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '测试是为了发现程序中的错误而执行程序的过程', 101, 13);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (52, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '好的测试方案是尽可能发现迄今为止尚未发现的错误', 101, 13);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (53, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '条件覆盖测试', 101, 14);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (54, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '逻辑覆盖测试', 101, 14);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (55, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '边界值分析', 101, 14);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (56, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '基本路径测试', 101, 14);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (57, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '静态测试', 101, 15);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (58, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '系统测试', 101, 15);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (59, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '模块测试', 101, 15);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (60, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '集成测试', 101, 15);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (61, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '因果图', 101, 16);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (62, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '等价类划分', 101, 16);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (63, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '错误猜测', 101, 16);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (64, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '边界值分析', 101, 16);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (65, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '测试计划', 101, 17);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (66, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '测试规则', 101, 17);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (67, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '以往测试记录分析', 101, 17);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (68, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '预期输出结果', 101, 17);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (69, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '边界测试', 101, 18);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (70, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '系统测试', 101, 18);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (71, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '白盒测试', 101, 18);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (72, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '黑盒测试', 101, 18);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (73, '2022-12-19 02:06:20', '2023-02-09 23:56:53', 0, '可靠性', 102, 19);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (74, '2022-12-19 02:06:20', '2023-02-09 23:56:54', 0, '可修改性', 102, 19);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (75, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '可维护性', 102, 19);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (76, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '可测试性', 102, 19);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (77, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '代码维护', 102, 20);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (78, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 0, '文档维护', 102, 20);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (79, '2022-12-19 02:06:20', '2023-02-09 23:57:01', 0, '纠错性维护', 102, 20);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (80, '2022-12-19 02:06:20', '2022-12-19 02:06:20', 1, '预防性维护', 102, 20);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (81, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '开发合同', 102, 21);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (82, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '用户手册', 102, 21);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (83, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '系统管理员手册', 102, 21);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (84, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '验收测试报告', 102, 21);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (85, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '预防性维护', 102, 22);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (86, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '完善性维护', 102, 22);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (87, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '适当性维护', 102, 22);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (88, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '校正性维护', 102, 22);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (89, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '完整性', 102, 23);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (90, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '可靠性', 102, 23);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (91, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '可用性', 102, 23);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (92, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '正确性', 102, 23);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (93, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '预防性维护', 102, 24);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (94, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '改善性维护', 102, 24);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (95, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '纠错性维护', 102, 24);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (96, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '适应性维护', 102, 24);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (97, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '改正性维护', 102, 25);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (98, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '适应性维护', 102, 25);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (99, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '完善性维护', 102, 25);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (100, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '预防性维护', 102, 25);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (101, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '可靠性', 102, 26);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (102, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '可理解性', 102, 26);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (103, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '程序的无错误性', 102, 26);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (104, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '可移植性', 102, 26);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (105, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '开发时的错误', 102, 27);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (106, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '隐含的错误', 102, 27);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (108, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '因修改软件而造成的错误', 102, 27);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (109, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '通信内聚', 103, 28);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (110, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '功能内聚', 103, 28);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (111, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '逻辑内聚', 103, 28);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (112, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '时间内聚', 103, 28);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (113, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, 'IPO', 103, 29);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (114, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, 'PDL', 103, 29);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (115, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '判定树', 103, 29);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (116, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, 'PAD', 103, 29);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (117, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '顺序的', 103, 30);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (118, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '选择的', 103, 30);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (119, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, '以上全部', 103, 30);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (120, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '循环的', 103, 30);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (121, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, 'FORTRAN', 103, 31);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (122, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, 'COBOL 语言', 103, 31);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (123, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 1, 'PASCAL 语言', 103, 31);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (124, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '汇编语言', 103, 31);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (125, '2022-12-19 02:06:21', '2022-12-19 02:06:21', 0, '外部接口', 103, 32);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (126, '2022-12-19 02:06:21', '2022-12-19 02:06:22', 0, '功能', 103, 32);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (127, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '编程', 103, 32);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (128, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '算法和使用的数据结构', 103, 32);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (129, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '控制耦合', 103, 33);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (130, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '公共耦合', 103, 33);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (131, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '数据耦合', 103, 33);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (132, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '内容耦合', 103, 33);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (133, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '容易使程序员不受任何约束，随意转移控制', 103, 34);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (134, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0,
        '每个符号对应于源程序的一行代码，对于提高系统的可理解性作用很小', 103, 34);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (135, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '不支持逐步求精，使程序员不去考虑系统的全局结构', 103, 34);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (136, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1,
        '不如其他图形工具直观，描述复杂的条件组合与动作间的对应关系不够明了', 103, 34);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (137, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '数据流程图、PAD 图、N-S 图和伪代码', 103, 35);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (138, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '程序流程图、PAD 图、N-S 图和伪代码', 103, 35);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (139, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '业务流程图、N-S 图、伪码', 103, 35);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (140, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '数据流程图、PAD 图、N-S 图', 103, 35);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (141, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '数据流', 103, 36);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (142, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '对象', 103, 36);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (143, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '控制结构', 103, 36);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (144, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '数据结构', 103, 36);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (145, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '顺序结构', 103, 37);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (146, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '选择结构', 103, 37);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (147, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '嵌套结构', 103, 37);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (148, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '条件结构', 103, 37);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (149, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '调用关系', 103, 38);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (150, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '控制流', 103, 38);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (151, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '数据流', 103, 38);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (152, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '组成关系', 103, 38);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (153, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '过程内聚', 104, 39);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (154, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '顺序内聚', 104, 39);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (155, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '逻辑内聚', 104, 39);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (156, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '时间内聚', 104, 39);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (157, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '模块划分', 104, 40);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (158, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '物理结构设计阶段', 104, 40);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (159, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '逻辑结构设计阶段', 104, 40);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (160, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '概念结构设计阶段', 104, 40);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (161, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '控制结构', 104, 41);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (162, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '系统结构', 104, 41);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (163, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '信息流', 104, 41);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (164, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '数据流', 104, 41);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (165, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '过程性内聚', 104, 42);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (166, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '逻辑性内聚', 104, 42);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (167, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '功能性内聚', 104, 42);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (168, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '顺序性内聚', 104, 42);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (169, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '系统分析', 104, 43);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (170, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '代码设计', 104, 43);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (171, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 1, '软件需求', 104, 43);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (172, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '详细设计', 104, 43);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (173, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '数据结构', 104, 44);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (174, '2022-12-19 02:06:22', '2022-12-19 02:06:22', 0, '系统数据要求', 104, 44);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (175, '2022-12-19 02:06:22', '2022-12-19 02:06:23', 1, '数据流图', 104, 44);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (176, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '数据流', 104, 44);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (177, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '体现统一的风格', 104, 45);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (178, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '结构应该尽可能满足变更的要求', 104, 45);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (179, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '使摸块的作用域在该模块的控制域外', 104, 45);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (180, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '提高模块的独立性', 104, 45);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (181, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '公共耦合', 104, 46);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (182, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '内容耦合', 104, 46);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (183, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '外部耦合', 104, 46);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (184, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '控制耦合', 104, 46);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (185, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '软件结构图', 104, 47);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (186, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '程序流程图', 104, 47);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (187, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '系统流程图', 104, 47);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (188, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '数据流图', 104, 47);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (189, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '数据结构和数据库设计', 104, 48);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (190, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '设计软件系统结构', 104, 48);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (191, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '编写概要设计文档', 104, 48);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (192, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '编写测试报告', 104, 48);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (193, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '交换流和数据流', 104, 49);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (194, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '信息流与控制流', 104, 49);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (195, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '交换流和事务流', 104, 49);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (196, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '数据流与事务流', 104, 49);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (197, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '事件', 104, 50);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (198, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '数据', 104, 50);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (199, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '分析结果', 104, 50);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (200, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '动作', 104, 50);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (201, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '信息隐蔽', 104, 51);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (202, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '模块化', 104, 51);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (203, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '自下而上', 104, 51);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (204, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '抽象', 104, 51);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (205, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '其他工程科学的影响', 105, 52);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (206, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '程序设计方法学的影响', 105, 52);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (207, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '软件危机的出现', 105, 52);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (208, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '计算机的发展', 105, 52);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (209, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '模块化', 105, 53);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (210, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '信息隐蔽', 105, 53);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (211, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '自下而上', 105, 53);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (212, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '抽象', 105, 53);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (213, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '开发效率', 105, 54);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (214, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '生产工程化', 105, 54);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (215, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '质量保证', 105, 54);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (216, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '软件危机', 105, 54);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (217, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '系统流程图、程序编码', 105, 55);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (218, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 1, '数据流程图、数据字典', 105, 55);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (219, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '软件流程图、模块说明', 105, 55);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (220, '2022-12-19 02:06:23', '2022-12-19 02:06:23', 0, '业务流程图、处理说明', 105, 55);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (221, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '数据', 105, 56);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (222, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '文档', 105, 56);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (223, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '界面', 105, 56);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (224, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '程序', 105, 56);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (225, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, 'V 模型', 105, 57);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (226, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, 'XP(eXtreme Programming ）', 105, 57);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (227, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, 'OPEN UP', 105, 57);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (228, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, 'Scrum', 105, 57);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (229, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '活动图', 105, 58);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (230, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '用例图', 105, 58);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (231, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '顺序图', 105, 58);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (232, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '流程图', 105, 58);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (233, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '开发的软件可靠性差', 105, 59);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (234, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '开发的软件不满足用户的需要', 105, 59);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (235, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '开发的软件可维护性差', 105, 59);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (236, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '开发的软件价格便宜', 105, 59);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (237, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '软件设计', 105, 60);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (238, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '软件构造', 105, 60);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (239, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '工程基础', 105, 60);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (240, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '软件需求', 105, 60);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (241, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '软件工程经济', 105, 61);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (242, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '软件工程环境', 105, 61);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (243, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '软件开发工具', 105, 61);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (244, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '软件开发方法', 105, 61);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (245, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '是在计算机硬件设备生产过程中生产出来的', 105, 62);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (246, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '不能作为商品参与交易', 105, 62);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (247, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '只存在于计算机系统工作时', 105, 62);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (248, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '是计算机系统的组成部分', 105, 62);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (249, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '数据流', 105, 63);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (250, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '目标', 105, 63);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (251, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '功能', 105, 63);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (252, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '对象', 105, 63);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (253, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '3', 106, 64);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (254, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '4', 106, 64);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (255, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '2', 106, 64);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (256, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '1', 106, 64);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (257, '2022-12-19 02:06:24', '2023-01-16 13:59:10', 0, '随意跳转', 106, 65);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (258, '2022-12-19 02:06:24', '2023-01-16 13:59:13', 0, '单出口', 106, 65);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (259, '2022-12-19 02:06:24', '2023-01-16 13:59:12', 0, '单入口', 106, 65);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (260, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '分支', 106, 65);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (261, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '需求分析', 106, 66);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (262, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '详细设计', 106, 66);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (263, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '测试', 106, 66);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (264, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 1, '编码', 106, 66);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (265, '2022-12-19 02:06:24', '2023-01-19 13:07:26', 0, '110', 106, 67);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (266, '2022-12-19 02:06:24', '2022-12-19 02:06:24', 0, '100', 106, 67);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (267, '2022-12-19 02:06:24', '2023-01-19 13:07:26', 1, '10', 106, 67);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (268, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 0, '0', 106, 67);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (269, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 0, '测试效率', 106, 68);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (270, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 0, '维护效率', 106, 68);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (271, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 0, '开发效率', 106, 68);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (272, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 1, '输入输出效率', 106, 68);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (273, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 1, '改正错误', 106, 69);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (274, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 0, '改善软件的性能', 106, 69);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (275, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 0, '发现错误', 106, 69);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (276, '2022-12-19 02:06:25', '2022-12-19 02:06:25', 0, '挖掘软件的潜能', 106, 69);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (277, '2023-02-10 00:02:40', '2023-03-14 14:14:12', 0, '算', 108, 70);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (278, '2023-02-10 00:02:40', '2023-02-10 00:06:20', 0, '不算', 108, 70);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (279, '2023-03-14 14:13:00', '2023-03-14 14:13:00', 0, '不知道', 108, 71);
INSERT INTO `core_questionoption` (`id`, `create_time`, `update_time`, `right`, `content`, `exam_id`, `question_id`)
VALUES (280, '2023-03-14 14:13:00', '2023-03-14 14:13:00', 0, '真的不知道', 108, 71);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
