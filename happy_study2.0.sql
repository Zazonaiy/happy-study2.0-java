/*
Navicat MySQL Data Transfer

Source Server         : jdbc-learning
Source Server Version : 50149
Source Host           : localhost:3306
Source Database       : happy_study2.0

Target Server Type    : MYSQL
Target Server Version : 50149
File Encoding         : 65001

Date: 2021-02-25 21:00:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `id` varchar(32) NOT NULL,
  `cl_no` int(16) DEFAULT NULL COMMENT '班级号',
  `name` varchar(64) DEFAULT NULL,
  `clazz_type` int(1) DEFAULT '0' COMMENT '(0普通版 1文科班 2理科班 3艺体班)',
  `clazz_master_id` varchar(32) DEFAULT NULL COMMENT '班主任id',
  `clazz_master_name` varchar(64) DEFAULT NULL,
  `grade_id` varchar(32) DEFAULT NULL COMMENT '年级团队id',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('09fabd1816274644b9b2786ebf2e7a00', '122002001', 'update-test', '0', 'fad68364e8f74cb9b677f00802d214cf', 'addtest', '3b1f2890f31e4c79bafef14b1b48dc39', null, null, null, '2021-01-08 14:30:59', 'add clazz test to update test', '0');
INSERT INTO `clazz` VALUES ('1', '1001', '初一六班', '0', '2', '曹老师', '1', null, null, null, '2020-12-26 02:05:07', null, '0');
INSERT INTO `clazz` VALUES ('1cac834431d149d5823e3131ae0b3141', '122002002', 'del test', '0', '6d00127a89704a83a76674d09bf11b7e', 'update-test', '3b1f2890f31e4c79bafef14b1b48dc39', null, null, null, '2021-01-08 15:57:59', 'del test', '1');
INSERT INTO `clazz` VALUES ('3c9dc709dde54b6f9e538721556c4aff', '30302', '二班', '1', '369b5898d57648d18e7035efc2fa43e5', '邓汉军', '6b87678c498d46738bb0e8770d15a000', null, null, null, '2021-01-11 16:36:50', 'clazz add test with clazzType has been update ', '0');
INSERT INTO `clazz` VALUES ('467333560ffc4fe68f5c790e40988434', '30301', 'g del test', '0', '2d85cabb8526416b9e818e0063461070', 'yyy', 'bcca9d2061724705ad257df89ffb662b', null, null, null, '2021-01-09 14:28:44', 'del grade test with noGenerator has been update', '1');
INSERT INTO `clazz` VALUES ('71d8fb1da2f94ed4b2ea022ec79a07de', '30301', 'gdeltest', '0', '2d85cabb8526416b9e818e0063461070', 'yyy', 'bcca9d2061724705ad257df89ffb662b', null, null, null, '2021-01-09 14:33:26', 'grade del test', '1');
INSERT INTO `clazz` VALUES ('882c8501d10a44518ee712d7dcfe15bc', '30303', '三班', '0', '193f1ec79bca48788b9b8c9e9719df21', '杨敏', '6b87678c498d46738bb0e8770d15a000', null, null, null, '2021-01-11 17:29:37', 'add test', '0');
INSERT INTO `clazz` VALUES ('907f3c1c63c0473bb9b24f0d553a60e4', '122002002', 'del test', '0', '6d00127a89704a83a76674d09bf11b7e', 'update-test', '3b1f2890f31e4c79bafef14b1b48dc39', null, null, null, '2021-01-08 16:06:44', 'clazz del test', '0');
INSERT INTO `clazz` VALUES ('9162b14a4c3c43f58d794c031b7e0e9e', '30301', '一班', '0', '472bbf68364e44b58211516ab9874174', '徐乐乐', '6b87678c498d46738bb0e8770d15a000', null, null, null, '2021-01-11 14:42:35', 'test', '0');
INSERT INTO `clazz` VALUES ('b8bd9899fe574d489bc0e8b6d61d6583', '12005001', 'del test2', '0', '97566f3ad52b4cdfa3672d43b8212aeb', 'bbb', '145ad2325c6a4743b187487dd548d714', null, null, null, '2021-01-09 12:57:22', 'clazz del test', '1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` varchar(32) NOT NULL,
  `co_no` int(16) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `subject_id` varchar(32) DEFAULT NULL COMMENT '所属学课id',
  `teacher_id` varchar(32) DEFAULT NULL COMMENT '授课教师id',
  `clazz_id` varchar(32) DEFAULT NULL COMMENT '课程所属班级',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('3d2504d55a474244af226e4e70579d39', '600501', '生物 update-test', 'd906c8dcbd6d4942a14c17e6c6406c37', '6d00127a89704a83a76674d09bf11b7e', '09fabd1816274644b9b2786ebf2e7a00', null, null, null, '2021-01-11 13:31:50', 'course update test', '1');
INSERT INTO `course` VALUES ('5af18ad6b2654d27a7d2dd85e510bc02', '600502', '生物 del test', 'd906c8dcbd6d4942a14c17e6c6406c37', '2d85cabb8526416b9e818e0063461070', '907f3c1c63c0473bb9b24f0d553a60e4', null, null, null, '2021-01-11 14:15:27', 'subject del test', '1');
INSERT INTO `course` VALUES ('5c2e15c3e3c94686ac8961104dc29d75', '600501', '生物 update-test', 'd906c8dcbd6d4942a14c17e6c6406c37', '4e77eda800b8443c9dee62508bffb1cb', '09fabd1816274644b9b2786ebf2e7a00', null, null, null, '2021-01-11 14:15:27', 'subject del test', '1');
INSERT INTO `course` VALUES ('679fc57edc0849ee9464550a9a2a6b40', '600501', '历史 一班', '8b38d77b751b4603873e81c880ba9da9', '369b5898d57648d18e7035efc2fa43e5', '9162b14a4c3c43f58d794c031b7e0e9e', null, null, null, '2021-01-11 14:43:28', 'test', '0');
INSERT INTO `course` VALUES ('9f1853edf4d04e15b9138facb83c6879', '600201', '数学 一班', '6df0367ed6334b87b78af2ee77ec0da9', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', null, null, null, '2021-01-11 14:43:10', 'test', '0');
INSERT INTO `course` VALUES ('c639655d2b8e4f4fbfcf2f4f43771b37', '600901', '物理 一班', '7a6ecc7208f14a828a3def5ab5814455', '193f1ec79bca48788b9b8c9e9719df21', '9162b14a4c3c43f58d794c031b7e0e9e', null, null, null, '2021-01-11 14:44:18', 'test', '0');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` varchar(32) NOT NULL,
  `e_no` int(16) DEFAULT NULL COMMENT '考试编号',
  `exam_name` varchar(64) DEFAULT NULL COMMENT '考试名称',
  `exam_type` int(1) DEFAULT NULL COMMENT '考试类型（周考、月考、期末考试）',
  `semester_id` varchar(32) DEFAULT NULL COMMENT '学期id',
  `exam_state` int(1) DEFAULT '1' COMMENT '(0执行中 1创建中 2可执行 3执行完毕）',
  `create_progress` int(1) DEFAULT '0' COMMENT '0已完成 3人员分配 4创建任务',
  `grade_id` varchar(32) DEFAULT NULL COMMENT '举行考试的年级',
  `begin_date` varchar(64) DEFAULT NULL COMMENT '考试开始日期',
  `end_date` varchar(64) DEFAULT NULL COMMENT '考试结束日期',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('2bf6af8c46f34b469341861ce5748faf', '70032', 'latest test', '3', '', '2', '0', '6b87678c498d46738bb0e8770d15a000', '2021-02-20', '2021-02-21', null, null, null, '2021-02-19 17:42:55', 'latest', '0');
INSERT INTO `exam` VALUES ('35c70c928f504c15962cc0ea22f414c7', '70011', 'aaaa', '2', '1', '1', '3', '1', '2021-02-11', '2021-02-18', null, null, null, '2021-02-19 17:24:47', 'asdasd', '0');
INSERT INTO `exam` VALUES ('45a6f81df5fa4eb38f26cc9cec99e0cc', '70033', 'lllatest', '2', '1', '1', '3', '6b87678c498d46738bb0e8770d15a000', '2021-02-20', '2021-02-22', null, null, null, '2021-02-19 17:24:53', 'test', '0');
INSERT INTO `exam` VALUES ('64d5179845fe4b9cb594c8b7388779f3', '70037', 'demo', '2', '1', '1', '3', '6b87678c498d46738bb0e8770d15a000', '2021-02-25', '2021-02-28', null, null, null, '2021-02-25 20:46:43', 'demo', '0');
INSERT INTO `exam` VALUES ('811339531d554108a154a49e946a0617', '70030', 'test2', '2', '1', '2', '0', '6b87678c498d46738bb0e8770d15a000', '2021-01-31', '2021-02-02', null, null, null, '2021-02-15 15:40:54', 'test2', '0');
INSERT INTO `exam` VALUES ('e636081eb98d487986145b3eb7d640cf', '70036', 'txtxt', '3', '1', '2', '0', '6b87678c498d46738bb0e8770d15a000', '2021-02-23', '2021-02-25', null, null, null, '2021-02-19 17:41:20', 'test', '0');
INSERT INTO `exam` VALUES ('edc07759c9af4eb18b275c4c8e445063', '70034', 'www', '2', '1', '1', '3', '6b87678c498d46738bb0e8770d15a000', '2021-02-19', '2021-02-21', null, null, null, '2021-02-19 17:25:01', 'ww', '0');
INSERT INTO `exam` VALUES ('f000c74a427a40778ccb4b5d595f5137', '70035', 'rrr', '3', '1', '2', '3', '6b87678c498d46738bb0e8770d15a000', '2021-02-22', '2021-02-24', null, null, null, '2021-02-19 17:25:06', 'rrr', '0');

-- ----------------------------
-- Table structure for exam_room
-- ----------------------------
DROP TABLE IF EXISTS `exam_room`;
CREATE TABLE `exam_room` (
  `id` varchar(32) NOT NULL,
  `exam_id` varchar(32) DEFAULT NULL,
  `room_no` int(16) DEFAULT NULL,
  `room_place` varchar(128) DEFAULT NULL,
  `room_name` varchar(128) DEFAULT NULL,
  `different_place_tag` tinyint(1) DEFAULT NULL COMMENT '异地考试（0-用教室作为考场 1-在其他地方进行考试）',
  `rent_tag` tinyint(1) DEFAULT NULL,
  `rent_grade_id` varchar(32) DEFAULT NULL,
  `rent_state` int(1) DEFAULT '2' COMMENT '租借状态（0失败 1成功 2待批准）',
  `max_size` int(4) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_room
-- ----------------------------
INSERT INTO `exam_room` VALUES ('00ea96889766431ab052cf40d7489647', '35c70c928f504c15962cc0ea22f414c7', '71113', '1', '第1考场', '0', '0', '', '2', '60', null, null, null, '2021-02-15 15:27:35', null, '0');
INSERT INTO `exam_room` VALUES ('03e25fa0a1f04dc486bc4525137701be', '45a6f81df5fa4eb38f26cc9cec99e0cc', '71337', '3c9dc709dde54b6f9e538721556c4aff', '第1考场', '0', '0', '', '2', '60', null, null, null, '2021-02-19 16:41:25', null, '0');
INSERT INTO `exam_room` VALUES ('1b557916196148e58de9342d3b1997c1', 'e636081eb98d487986145b3eb7d640cf', '713616', '3c9dc709dde54b6f9e538721556c4aff', '第1考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 17:32:23', null, '0');
INSERT INTO `exam_room` VALUES ('1e2c8ce7a5624b449f3c9224b48e4edf', '811339531d554108a154a49e946a0617', '71301', '882c8501d10a44518ee712d7dcfe15bc', '第2考场', '0', '0', '', '2', '50', null, null, null, '2021-01-31 14:41:57', null, '0');
INSERT INTO `exam_room` VALUES ('319563663db744e783bf7d3b73b43e11', '45a6f81df5fa4eb38f26cc9cec99e0cc', '71339', '9162b14a4c3c43f58d794c031b7e0e9e', '第3考场', '0', '0', '', '2', '60', null, null, null, '2021-02-19 16:41:25', null, '0');
INSERT INTO `exam_room` VALUES ('32a059c589ed4f6cb34e79de122b2513', '2bf6af8c46f34b469341861ce5748faf', '71326', '9162b14a4c3c43f58d794c031b7e0e9e', '第3考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 16:37:48', null, '0');
INSERT INTO `exam_room` VALUES ('50261c0ad3a94c79a842d4b5dd7666c2', 'edc07759c9af4eb18b275c4c8e445063', '713411', '882c8501d10a44518ee712d7dcfe15bc', '第2考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 16:49:31', null, '0');
INSERT INTO `exam_room` VALUES ('5c694df694a74784878d8debe0b5f75d', '64d5179845fe4b9cb594c8b7388779f3', '713720', '882c8501d10a44518ee712d7dcfe15bc', '第2考场', '0', '0', '', '2', '50', null, null, null, '2021-02-25 20:46:43', null, '0');
INSERT INTO `exam_room` VALUES ('62fd5ed81dad48bbbfea302dab7f0b08', 'f000c74a427a40778ccb4b5d595f5137', '713515', '9162b14a4c3c43f58d794c031b7e0e9e', '第3考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 17:05:04', null, '0');
INSERT INTO `exam_room` VALUES ('6dc8297a72954c6bbca5514cd2b3c236', 'e636081eb98d487986145b3eb7d640cf', '713618', '9162b14a4c3c43f58d794c031b7e0e9e', '第3考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 17:32:23', null, '0');
INSERT INTO `exam_room` VALUES ('70ff1863ba6a4030a45f54010bc7bb95', 'edc07759c9af4eb18b275c4c8e445063', '713410', '3c9dc709dde54b6f9e538721556c4aff', '第1考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 16:49:31', null, '0');
INSERT INTO `exam_room` VALUES ('71ee64e3e4bd463a9f2ad7734640315b', 'edc07759c9af4eb18b275c4c8e445063', '713412', '9162b14a4c3c43f58d794c031b7e0e9e', '第3考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 16:49:31', null, '0');
INSERT INTO `exam_room` VALUES ('7dccdb7a6ea3449896ddca9f19ae1ec3', '2bf6af8c46f34b469341861ce5748faf', '71324', '3c9dc709dde54b6f9e538721556c4aff', '第1考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 16:37:48', null, '0');
INSERT INTO `exam_room` VALUES ('84dcedf7eef54778ae3f82fc60a11a31', 'e636081eb98d487986145b3eb7d640cf', '713617', '882c8501d10a44518ee712d7dcfe15bc', '第2考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 17:32:23', null, '0');
INSERT INTO `exam_room` VALUES ('8716fe4bb5e24fc4aebc6b79be40141d', 'f000c74a427a40778ccb4b5d595f5137', '713513', '3c9dc709dde54b6f9e538721556c4aff', '第1考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 17:05:04', null, '0');
INSERT INTO `exam_room` VALUES ('9a0736003f2a4a0295b76e60602e578e', '2bf6af8c46f34b469341861ce5748faf', '71325', '882c8501d10a44518ee712d7dcfe15bc', '第2考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 16:37:48', null, '0');
INSERT INTO `exam_room` VALUES ('9b81f7705dd742cc9a0a95c240e9bc2e', '811339531d554108a154a49e946a0617', '71300', '3c9dc709dde54b6f9e538721556c4aff', '第1考场', '0', '0', '', '2', '50', null, null, null, '2021-01-31 14:41:57', null, '0');
INSERT INTO `exam_room` VALUES ('a38c58ae27214f01937c0c5947726262', '64d5179845fe4b9cb594c8b7388779f3', '713719', '3c9dc709dde54b6f9e538721556c4aff', '第1考场', '0', '0', '', '2', '50', null, null, null, '2021-02-25 20:46:43', null, '0');
INSERT INTO `exam_room` VALUES ('be7799cabbef4ac59bfd23ff1636c65b', '45a6f81df5fa4eb38f26cc9cec99e0cc', '71338', '882c8501d10a44518ee712d7dcfe15bc', '第2考场', '0', '0', '', '2', '60', null, null, null, '2021-02-19 16:41:25', null, '0');
INSERT INTO `exam_room` VALUES ('ca73f4bdcc5f4c179a2e06c75fa3b913', '811339531d554108a154a49e946a0617', '71302', '9162b14a4c3c43f58d794c031b7e0e9e', '第3考场', '0', '0', '', '2', '50', null, null, null, '2021-01-31 14:41:57', null, '0');
INSERT INTO `exam_room` VALUES ('d0ffb09d979242ddbfd0b8ab4e037192', 'f000c74a427a40778ccb4b5d595f5137', '713514', '882c8501d10a44518ee712d7dcfe15bc', '第2考场', '0', '0', '', '2', '50', null, null, null, '2021-02-19 17:05:04', null, '0');
INSERT INTO `exam_room` VALUES ('d49fef8335804f2d9f0bb21a468ce830', '64d5179845fe4b9cb594c8b7388779f3', '713721', '9162b14a4c3c43f58d794c031b7e0e9e', '第3考场', '0', '0', '', '2', '50', null, null, null, '2021-02-25 20:46:43', null, '0');

-- ----------------------------
-- Table structure for exam_score
-- ----------------------------
DROP TABLE IF EXISTS `exam_score`;
CREATE TABLE `exam_score` (
  `id` varchar(32) NOT NULL,
  `exam_sub_stu_id` varchar(32) DEFAULT NULL COMMENT '表（exam_subject_student）id',
  `exam_teac_mar_id` varchar(32) DEFAULT NULL COMMENT '改卷教师id',
  `exam_subject_id` varchar(32) DEFAULT NULL COMMENT '考试（某科目）表id',
  `score` decimal(10,0) DEFAULT NULL COMMENT '分数',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_score
-- ----------------------------
INSERT INTO `exam_score` VALUES ('0003ce25fbc74df2a20b818b3a077a40', '915490cb2e9f47abb837f93b37aae813', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('0069f17a5da740829b2142ee41d69e74', '2f66b029991d48288668b4cc0c818185', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('0072907f8f2d4c3f8545a0bb8a343b38', 'd542926a25be423b905fd507d38431ba', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('0229ab24c88f4f7a89e87d6b726128ff', '1e56f6f03a5e43b6a7970115d4d92109', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('0463184c23454ed7a2a7cbfa6029478c', 'dfe287b6fd104b89a37865a3cfec490f', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('057d1985b7b34ba08204f0d4c2b8b230', 'a4e5eda61cb14b0e986cdc04d5a3af71', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('05d4ab6963d4436ab296ed3545067a8e', '96f19dba5d2848c881d94d984936a7a2', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('05dfb4e3208048fc8b6b27a61cf3beff', '531b4c365715492b9b92bfe0b56a4002', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('07ca23965a97462aa27dbba0e13080c1', '8119292ab05a4df6aed30fff87c2b931', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('086ba4756bbe44a8b30825f3d263bec7', '003efd34442c4bd0a44c2b2f46d2a824', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('08cdcbe533b34d168e6bbc83d388674f', '0ad54e0920dd44eeac16a881b0b2c4e6', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('091e62734a03475eb01b228e43106557', '067b911002814f7699b43252fc2cc6c2', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('0b565cd8fe534c248cc4827232f4b280', '55d8c1440297415ab5355e6365b1e7a9', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('0c59ac0cdba64776bb39d3f7da2a238f', '728734b82d9c48f8b0a11b00b1f84fdc', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('0d2cd72301df451ba2792009e5475b10', '86287cb0b2164df6aca4adef71b109d7', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('0d4ed2c13d8b4fa088d42117516ec328', '538b7452e39c4e8794c8b07bbd7d3e71', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('0dfd4fbd226247d79afd248ba6ad1e81', '18de8ff79b014dc0b53583be9f36d886', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('0ed6f44ddbfb4b24bd3d23758eb730c6', 'ebddd1cb99ba4f1dba2ba5f89079b48f', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('104364e8ec29402cb902256254432feb', '5a87607adf2940638c3f6cb2f0c314e7', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('10e6c4bcd01a45b5aae4f7af3ca3a818', 'c32af9e93add4d50affdaccb3500926d', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('12e279a294db450dbd64da4b7df8b56f', '82846d2471a846bf971bea1189e36402', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('12f2caca2fbe4119ad17f8ad3d9c85bd', '7cca9e79438045bab640526db13de29a', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('1308f00d049a486e9dfe63946b7767e4', '720e533a913c486089f29f9a5277cf26', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('1463c0c865a04787812b1e8d5d19cf7e', '3a2a5a0455d84164ab5bfa4cef7bb312', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('188aa0d108514988af18ba5f888ced63', 'cda0801a17da435aac8f62bf87da44aa', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('191bad3858ee4785b9dacf33797e5eef', '018955c13c2e4a5f81ac36fb14aedf11', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('19759060adfd40f686356434f74c98d7', '8ff4617f500147c1ad04812b6b22c83c', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('1c3c2f45bcfe48ba87dc6e7f9c0f310d', '3c90c98eb83b4091b0f6406441a1157a', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('1cd347bf3ee94e38b614ff1a04ab50ad', 'ae52da7db4274ee58611ca9342ef01b3', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('1d5ab232125c41199015dc40a5e3a72d', '55f97607ae414e76baa75ac561883bd1', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('1da93e7566b74ed7910c6274bf164a7a', '168a13c8b86a4bea9c54771b1252c07d', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('1e8382a6b5884acfbef6689719a8b81d', '445ad5f81fb14a34be931a8ee28cfdd7', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('1f17e2e2988f48d1ab0171d55a4b34a2', 'd952019a3b994436aac60bad53a93550', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('21246e7138654864bfb1175eeaaeb537', '607f4d2bca684470b0f89106cc632bae', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('21fe474f65584dc6b047e3c87b40f459', 'dd288e05cac946f2b3be11bb9d8069e0', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('22aa8e64db96411d8a3293c86c5db923', '2a58175a0462408eb69062318908057e', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('23b20ce1815e4f9d9d887b8e4b6ba02b', '27f2c6b022aa4fb2a8d97794b0fd1b78', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('245288a120fa4e8bb91b56d99a32ff74', 'eea08e7e288340d2926da891f17c840b', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('24f6ae5aa5334f52ba7ec850acca7ac3', '1243d3d8468c4df0ba0e08fbea1d0773', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('262ef1ac0cf349a5806ff2985deafe47', 'b1b8d6eca4844e68b878af280302878e', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('265cc82600cc496fa8b47ae97168f0b1', 'b524c2b946324a32a0bc156816bfcb60', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('26978883c6854895821c51c99ee476cd', '168a13c8b86a4bea9c54771b1252c07d', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('2775a4aa3da043edaf5758b597739d46', 'cf7be3e5d94643c9b6e60173b427fd75', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('277bcde22f3e41ceac157d0481dd69d3', 'cc7cc4aa60214194b47a3e5b5799df7e', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('27ae7b82e09a4774904f0d725b42c454', '0937638060224bc896300915f62333a3', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('2946e279c254457db81d036985871e67', '03d11ebf422641abb1cbba37d38d137d', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('2966cdf2446b4021aa7182b7d2ce2b46', 'a0c530c78c624544a9eb622d0bf53768', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('2ad81fe63b5142579f52fe8a8be93e64', '27a6d3c31ef8429da4eebc3ce7470ba7', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('2c2892916b8b47ec9c0c13f1b13bd165', '2171553e834b4b71bd6629be6c75edf7', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('2c3b6160f45340cf83157eb74234e1d8', 'cb5641b0263d440a87a3c5b71a870670', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('2eaf37f6bb314859a74135d63454165a', '002131ace3ed4ab783d0ce05315c1498', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('301b7d9870414306aeebad706b732cde', 'ce1674adde924bc8aba6a083e95d9cac', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('3188ee4fc91b4a14907b23d251b7e03c', 'c7afd60f5cf343ffbd34be4c0d8ed799', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('31bcb5ca21c54f94b0f417afe18adbcb', 'd2422d812caa45efa44b8715c3e70e99', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('3293898d23f8488283e2e5a31c329268', '7f514e4c4f2b44fabfbd9485cd7a72c5', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('333e422e96c141d48ba3e7dca55312e9', '9e95d8df722248f28bcd748a3cc4d429', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('34feb1609f7145039fa14e2f840416ec', '4613689b97834403aaf8c7637af74d3e', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('3591278eb4e74590b87977d3a36141c6', 'b1333aaf48aa4af59d27437e2f40f064', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('36f82e26ba4449348a99a2c61cc785f0', 'ce3e33268289420fb962c6f8aea00f11', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('38919cc095994517982d091de6b8921a', '15066dffa964461dbe4850ff9d8142de', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('39955b542c7b44179d971df080d981a4', '5e028ed5a46d436db7ef2911de8db796', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('3ae54fd848d1461fb816667547a346b9', '3c31aa3d7f8d4f429c3dfc479213b228', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('3dea4dfa0c144bf3aa0075f30b96982d', 'f14a2b57a6224730a58591dc8e5da030', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('3e58b804e22d4ba2956f50230e124ff2', 'a0a9d2ef95a74ea38d8be88022758804', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('3f4666467fd34a5194d3c55dae8422cd', '1534c31518094b43ac31a346e8f68a2e', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('3f6aba30eb604fb6ad3f5da1eebcdbbc', '78e20be911ca45178aa29d8e7c9f71e4', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('3fae787a72344b8caa1e430621193a0a', '32c3dd9a0ed14606a12bde35ef0884ca', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('3fbe98e19da340f69732c71856bf4529', '1464c93f55a743068e046d4c1c66209e', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('427d353327034d0d8d642c3e27141c62', 'cf8de9940b124152a7ca772b8b4a3bee', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('42e98e1ba9ed41d785d36d228b3de22d', 'b0880f70a41446be894cc1d4453cac25', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('4332127a80fd46408badca4058a67640', '002131ace3ed4ab783d0ce05315c1498', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('43a7e8e208ad4ddab1e2290830f77e4e', '1236b806d5384fc0895ed907ae6dd52b', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('44da749428594fd5ae54a32c411aec0e', '9004409c0cf44c3e8b5247caf3a16138', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('4575f536bdbd4026bdd8dcefb1e34508', '91f5cc2a8af448e1962a214115743073', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('45cb248f687b4816abf46bd8bd55b35d', 'd3cdc3a568624696a54c27830a2579ec', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('4744e22b97ad4fe2849495fc86a50332', 'ec91f32223f44f0abf054663ccbdaebd', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('484f4bad92ea486cb2f168c5014c282c', '96ee76a1700e41f2a93be588eb359c3d', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('48b93d5279094eff91ccb9224560fa8d', '6ff0f4a444574b09a74e8f3ecd89d70d', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('49c4fcb5f89e46d1a96be1d52215afb5', '960333c924834490a9596324275c5640', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('4b22c51ed01d4ee79bb058ca675430e2', 'f105e84d75304224b64a7428d3a5a1e4', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('4be3d17dc4e9488982eeb2d5670daa4b', '291811f5df204d69a38fffda79081573', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('4cd2857618f94cc09369cc2eb2d60a03', '8da25d0ffc0948f989d2d8b9afb21bea', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('4d9a28273b444a53a32f208e78cbf153', 'f354354717af4a66bb5cc0c06c19a5a9', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('4fe41d541f724b16abd3b482a18f0243', '3115479cf9d14440992508a9885ce2dd', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('5143af35767e4950bb26f463753fc9bd', '4adc8a58244d413d9f70f71f5de8f409', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('5243aaaef35b4695a19055495c3a5299', '9416a65ac410429585568de0459df6c2', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('546d955d75374be8b1fe53cce9157fd2', 'c558b41945bc40aa8506fa1f312678e3', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('54f1dca8a2ac465aa727289a155dc70d', '34503efc41bc411d8778fcb79a798299', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('56aadb41026c491b99120602b9b279c7', '16d8ee1748e9458aa7d6c3021ac24841', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('5759179abbc2478fa8fcd3c6d231a146', 'bb8b93002a614b3ea0d17ae1d62c86c3', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('577e21ac268541cda54428ee5cb1f503', '4a9a34d44741449d85457f8bc0148678', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('5881d43f0333495faf20377fc0b4976e', 'ea38c3827de246059bf11a83d4bc3530', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('58b1943935a543c58a08f45949c9421c', '0b5b622f193d49978085dcc7a3487e52', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('590a39f2e38f4743bcb268b1a1e4ddb3', '9dff87a1c0a34749baa1943b1cc1c7e1', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('59681dfde88548b9b534bb019fbee6c5', 'd9d272a5ebf8492a984a2ef057b82577', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('5a39a499eff34bae8ea30db05840be45', 'a3f576b5da9c4f019ad50f430b83a84e', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('5a3cc39a1dde47159efcecab2c1f4cee', '9e19f30cc98f49fabdc780109d4a5869', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('5d09b8042697444ead43e3b358640788', '7a1b81cd494a4a249290e8bd3b29235b', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('5ef6a063a48c4953bea30ed9151fcd5b', '0be569b65199492f9cc27e673f2a1deb', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('5f1612503e1c4365b4d283243bc4379b', '16d8ee1748e9458aa7d6c3021ac24841', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('616ebe5dacae4ca4b574c3eaf197ba38', '067b911002814f7699b43252fc2cc6c2', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('619cdf04db2b4147bd3cd923679f2d78', '1682588340a7400f8d92523eccfdb181', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-19 16:08:08', null, '0');
INSERT INTO `exam_score` VALUES ('61ab2bb765e84f9ba1cc095a973925cf', '286dbef0f4a6456e96e2c33e52a2bb7d', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('653c3982e4f6443eac560bc297b4078c', '2b69a4af8831451aab5242df1c607420', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('655f9b37726f4780b980b99669160836', 'd05c250dd7b046a49b8b29c401376cf4', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('65e9f92abd2842fab3cbf0cbd3970584', '1243d3d8468c4df0ba0e08fbea1d0773', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('66916c3aee254e51b7baafae3e7c7060', '19d8640fa33b4f7db11143b0aefa301e', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('67eb8b5d198344ed96921f388d8e7ccf', '003efd34442c4bd0a44c2b2f46d2a824', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('69614f4c362c4372ac2b1fe0912fe197', '1fac6157302a4773805f84677dd1ce9c', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('6ab3e89f4e3646eca00c1b5c79e5ae46', 'e2fd2ffde80a4780a8903b7b96ef74e5', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('6b51a8b3e6454dd1a9e153f47f0587f8', 'c7ac4c95239f4a7d98ae8fb8f63ec871', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('6d5ab706d1404b4099754cd4487c770a', 'd2572980623f45238c9aa38bdb44cad4', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('6e20817ba1524bf49b7ac7f1e9860c84', '3c227b80f2e94c82aee283f9150b1267', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('6ee030dc00964f128da5522246c25503', '9cf1a45be7244590bdf7fdf77dffacdf', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('6f062aa94a9c432e956152e6af11282c', '1464c93f55a743068e046d4c1c66209e', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('6f3ffc7b09d74e0083aa67332ef553bb', '067b911002814f7699b43252fc2cc6c2', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('70a3a5c0d62b4cb0961c9d278ccf73f3', 'fbb33e96c8ea49428613ef93422eba31', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('70ab4189038e4ba8b0f6788eb3ad3083', '261c31b9c2144325aea83804c0beee9e', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('71071332b65b483d88112f0fe48818ab', '24f5f0e9d26a4903998bcc818dc56782', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('74052bff939c44a6b6f72d248befc07d', '1534c31518094b43ac31a346e8f68a2e', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('74c69a2d7e024ce793fa51ab791972ee', 'b8d23f4c18424420aaca7e67f0cae938', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('74cbea6c569e42ca982c540b4a0e852d', '33544e9cb2fd43bfa69660772e217473', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('77a09caa6e444234895b040f38c45e39', '530c1073412648e3a3462c3fc389b143', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('79139eec595f4db1917a69199a4b86d2', '20c4a9c08eda43248f68e13b3d4fc40d', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('793886fe4ac7425e9d8879bec0ddd097', '0f6c4b4ab5314521bf95fd1707a274c5', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('7a3598e2d91d46058d5722d8877dbbf2', '730800dcbbdb4f44a22111dfafb74a95', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('7a6db5a152974c7baa803da7194a3716', '417dae28f895439fa05adbf292bbe505', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('7c02936c819845398594cd25db008b64', '0ad54e0920dd44eeac16a881b0b2c4e6', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('7c5334f41e1a49688fcc14b4e8b7a064', '1464c93f55a743068e046d4c1c66209e', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('7c6c3e126d6b4e34972f72af3a08e816', '3d99b2d8091342daa899ec34252c53c8', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('7e1b445262004d6f812964dcd96e25ca', 'bfcd04593785450a99d72794de48a31f', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('7e671c4a56224f5494b88400438facab', 'ecf12d67b9e241db9f02c949636aa702', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('7ef8d3f7576f462480810bd363accb0b', '366c48d1cde845c9a9e353770c8b1175', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('80dc798e85c14ccf9029b003a119279e', '1d1f4b6b83d5471694f020c015941456', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('8166659444ff4d7c80bad2339844dc12', 'cd97bdf109784160aa96b9879d169d18', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('82110b2ec84744a197088179f55d0889', '60280fbf2900408d95b65df18a9e942c', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('82212d9793a94d5e8f3cf5ff9ec5d686', 'e24e21f84189475f99aa5bf62f1d0de5', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('827ec8af5a4943a4afb84a524fdc3e91', 'cce9e787b6f84126929421923358bfe5', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('82f6c47f2fb4496e91da1db7af42e628', 'e0a787d4eec745d3ad613dd74209afe7', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('841eca0e83d84e80a5f1945baca09085', '1dc384c3637d4d06951aad09029b8a58', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('86a0876c5edd4ab9b41946aba7821dc3', 'c21e3a9980b543adbb2cad7f176700c9', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('879dc83d7780446598ed694a4ce391f5', '1534c31518094b43ac31a346e8f68a2e', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('8d09aa8c3df34104ad0fa5e4ce4b27f7', '4919adc237d74fcaa2fce580db193253', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('8e22a6f891b04eda8c2f957ea577d700', 'cd2c3d2ad0a143b7bba08e9157d5205e', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('8e74b9ef3a204e479d9f456d7ae5040b', '602e76793b6f4f49834d11bb62ca65aa', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('92861972ae094770841e50adfdb2698b', '018955c13c2e4a5f81ac36fb14aedf11', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('92a1e3172a3b46be9915bc972c97c77e', '168a13c8b86a4bea9c54771b1252c07d', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('934ab08a779c4f2d84479987d1fabaca', '67958bd4979e45db8fe1dbb842ac296c', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('939f86f696274ddd88d5222721dcd7d7', '88c37ca630c04227bfb2577c598c1854', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('95f8d11ade5240e2a0e481c7659232fb', '7e671dcbd6b2456ebfa15dc613463bc7', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('986076169de44a13a3465d9478f88def', '43d96fb291f64f10970ee93c1326da0a', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('98d0092305ba419ba9dceabd3699c5ed', 'f8a0b031340c4c0cb8415e526d23ef74', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('99b5f5251ae546ecb5f81c853f3a1457', 'bb49fccfbb5349cd8f4dfd90203db90f', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('9a57c9211c0a4571b575c38fb42a6b32', 'f33c067e311044829a5446e5f6d0a65f', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('9c36defaac834659a29afb0c8f7d13d1', 'be05b2dc672c44a7b19d9025ead6ba78', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('9e4091c4f4254d09b92eea9e708c7aa0', '03fa3198573a4e5c9362c096c96dab32', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('a02b7a04431a4efdbac3ad7aabfeef97', 'c165f17e05894bb5a480d1f032c092e5', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('a27ef27071bf44f7a43f4fd7df69ae51', '8513ca6d668842d59460b9f36bfcd42c', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('a30b3307d2364aef813bc3bbf01709f4', 'ebe944ee904442f8b129314256cf032a', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('a37b5466b12a4704a888d47737d67d3e', '7f55fc2bded043108e2f9641ad3955d7', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('a6d1cabb2b2a40168aae1bfb33312e91', '263a3492e86f411287354271495eee94', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('a74c422195464e5395c08509cab5a829', 'f96eb3cae89a4859af72fcea87fb2d74', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('a7bfe2b82166405a8d5078352d999584', '4630c236b9d1403fb027fa35af43411f', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('aa76b92c88314d39b5686b46a3576543', 'def91ef93ac44db0aeb9940151f2ddce', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('aacb8ef2e8a240e7af26bfbd4fda8a8d', '72ef170148e347eebf6d3dc6f779760d', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('ac102e9dc230479ea1fdc7a8d3fece20', '8c65ded12d5243abb9f7a20f7c14a1ce', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('ac439deced684e0fb73d80f03c2431c1', 'a234d9bfe0e84e70a6d5465d510993b3', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('ac82c952a8b24a538d36bce219cfafcf', '7c8c1fb0062b4d16907a4776b7ba22c8', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('af3a3811166940a384c2760d9e244f69', '008fcf303c9149309b7d5ce262a1506a', null, 'd09e609f13c34245a8092934354e9c89', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('b1bb8307c0854efb9870d36497734f29', 'ce3ef45a0db54b63b807219ef41edf75', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('b25b5c64fcbe456ea356b78d21d63590', '28900e40eb1143e193185e4b854bcc7c', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('b2bdcdc58b8a46daa6bcae485fde341e', '96c5cd2a65704e6c8df8bbaf15e19adb', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('b389843347404d7f861ff99d03a8a5b9', '0937638060224bc896300915f62333a3', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('b3fb7bd995ae4dce81cf150ad0067b38', 'd442dc91b54246b3904b7c54519044eb', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('b46d076055114eb78dfa8fda0e217975', '008fcf303c9149309b7d5ce262a1506a', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('b508e8c295b4493abef69063aed3b8d2', 'e98f7bf8378940e09a7ff3563d0748a0', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('b55f7a2f224c4bb6a1e84740055cfd36', '9adbdc853e934f849b2379701a09c9cc', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('b5b58f3be6294c9e924e4cb1c163034a', '295da1303422417ab82a8b56b9274f94', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('b5c7ac9b2ab74d1fbe8a89034cb40273', '1ecebc1e0f294960bc84ed324ee1d398', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('b66a20acbb614bfa8a1f07cd8e9e2490', '008fcf303c9149309b7d5ce262a1506a', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('b7c02f2a7b404895985800b5ef8d3810', 'c0eb6264ab6148e89f0a2976e28f604d', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('ba359c69d16849b18f41c88a6e4f7ea8', '78221713787244fbbc0f34d5af5e3a5f', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('ba59c24e0b254486bd16183d89448591', 'd4ebc01dce0a44af99771f1512646237', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('baa0b0205ec94b95b9094e6c09769f65', 'e3f6338f307f4ae89ce35930fa69589c', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('bc1c32095bf34d5d9812e6cc7eab4417', '24cc1ed547344a0ba19e7e507666a52e', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('bcda00b12c1f4ad3af1cbf20e68683fc', 'a77a609f2c2f418190653eee1c9816a7', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('be401dfea86948e9b1437d975e0b678e', 'a56dec3f3725480093045ccda16bc6d5', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('be5d2acb7aed4a95ad17ee8d5f7fe772', '0937638060224bc896300915f62333a3', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('c0b888215974488ab075be120849d5ce', 'efa7d3d8bf1b40f196f6e48ff47d5b38', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('c107b30c3cdf46e090f048d7160ad1ef', '0722d0b1a3a44baca9a269d6c442fb48', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('c1563f7e1ab04dff9f59c0fa6b7d224c', 'cd4dd8cdc12a4e82b7317e2efde3eac2', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('c179390dc2134ab1967757d80a2fdbfb', '7bed14eb4f1e4ccea64a9ebf3cdf0981', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('c213ef7c8e5140f9af9e09cb49f7b0c0', 'cb7bd3deb223471c96531aff33d6ef9a', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('c2bd1ba84c2246a8b32bc2856c69ee03', '906cc8137e854d39a89762db937a69c6', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('c307597158874fdaa3b35d4b3b6a13ff', '3df688d898c0479584981b14899a3f43', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('c30d0d57eb1b4984bbacb17579bf4bee', '8fefcb4e56954d6c96106b1b93437200', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('c4348baec40444fb83ca6ae7b9f42a66', '002131ace3ed4ab783d0ce05315c1498', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('c491085a95dc4b4b82bc823aea77489e', '1b1de7f66ced4d958f9a2944a04f8665', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('c5e3b8166a2c4e109a6dee0099257778', '2d384428aea1401797e2e8518726cfff', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('c6293d7b98af496595f715395e7486b5', '6c89a16f57384abf8de49d601ccab025', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('c6d5df2b327a4d0288881d3a199c3633', '707848dcd1e8485eb77096fbad3d408a', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('c8680b7b28de4b4db7b7201548603b38', 'df048aaf8091481a9c0f2935e6197282', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('c8a23ddacb48485585e112f74a71670d', '40b4f9b4f7a6493699ffd4c666cd0d59', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('c95884fd2c72492b9b681b6dc990e34c', '003efd34442c4bd0a44c2b2f46d2a824', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('c9c38349bdcd4039b664395801fea95d', '08e9e648f3f849398dba90870a4b14d2', 'todo', '144918602f5649b6bb5aea89b1d5601a', '88', null, null, null, '2021-02-19 17:48:24', null, '0');
INSERT INTO `exam_score` VALUES ('ca4cc622d8da4a9caef0e66ea97a495b', '39b4fa1f31f8461bb8e64e2ec9a3f285', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('cb5b0b0f57604635a3eb3b30f1aae195', '43b830d3960b4ffabbb77e5065c1a94d', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('cb7f1a4afb504af285894417dc7af23c', '7e08bb4924f0499db2e5d71c6f85a47c', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('cbd58db222bf4ad080efb6bfa0b50964', '16d8ee1748e9458aa7d6c3021ac24841', null, '1682588340a7400f8d92523eccfdb181', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('cc063a370a07463bb67d2d37bfda2cd6', '72e99b0d463743368d37295faaca0422', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('cf182b8a321f4537ae8414b2566230b0', 'fdd1536cecc54681864cf1eba9922859', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('cf93322923784fcd81720bb06dfa7161', '0ad54e0920dd44eeac16a881b0b2c4e6', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('d090aa7d51ef445aafe1855fdb2b6634', '1218fa9ba2534dcc9b90a249ab4133e6', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('d164263406aa4506817e7855c222df75', 'b9667d7a494e4a8b9b9469dd4a179cba', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('d33a2b0881d040feb98ed8d4abecb818', 'f0a849399ba6476d9888af8292724f13', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('d4134a9b86e84524af044f0415888311', '3734e44954874195a3cebfaefd93e611', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('d4313b82b26b4d41b7c0670828320632', '7bd311437a9c478791a7e7acc3fe901a', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('d46921acbdc84710862d63d003ad2726', 'fefd30f51bb447968793d2bb9f09a95f', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('d56bc4d70393433497b16507581ed302', '8eac597c4f614de1a6f913857043727a', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('d5fd44ad086d48e4a9dbf887b97c8101', '45b01d5c17214af4b1113839c6907865', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('d69610bd2d7242d1b701a081a4751acc', '6998484bd7924d09863cff62c5b868bc', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('d75e12e02ff74caf8e2f453dca2fce6c', '68d95029629143a58de1f569f7486c76', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('d76f9641b28f484390009a1ed9fa1e1a', '1c327acb78f04083a948611a7b0e77d4', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('d7ef991d54e3476096897360175afd1d', 'f544e1fa53c44916ba188ce0e6cf70a2', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('d846f54c0e13466598eaf201d58067a7', '3ace6e2399934afa91431b0c6fd327ee', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('d8908b0627c9409a9e37e0c190e2a4f5', 'a84ac48321de4be4bdc1e5cdd708c7ad', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('d9f58e53cd6f48f6855fc28f9d8e07a6', '018955c13c2e4a5f81ac36fb14aedf11', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('da1b46c48a9d4c40b66f85948cd1da62', 'ab4d599907f346c49b89fd831cc6fdee', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('da424585a3d84e448209850a716d1c9b', '7764661b32d54188ab5e683eab861f94', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('da4d077ec24840a5a6d0fecc59133b04', '2cf6e305bc3d4617b8e4ba66fe94c256', null, '144918602f5649b6bb5aea89b1d5601a', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('dcad52f627364abeb1b8dfdcc09feb37', '88390175cf2d4fc0a292a6679f677b49', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('dcfa3aabd8c84a7faa2ee870a7b8a870', 'cbda6f4636414dd888e2666559065a78', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('ddc5680f68c14e35b9abe1bf7b8dd1c8', '1da15e1f84494f99a4c6882eb7f268d8', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('de2bfd31a528414886b32d648936089c', 'ee7ec6464384419c8550e9443b8b676a', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('df39a8610433472eaef067313eb46452', '4c1095ac1aa0441c8170759d40b69fea', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('df577a5d7c104d908f8c29bf6a824232', '31519c755bff4a138fc1d7fd4462044a', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('e0cd7577e0534f0494a64baa0856af12', 'bedd78a7e6234e248bc8e785635f575e', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('e1cea7cd44c4451b81a02bd5e6a42a0d', 'e8a541907b8a48bdbd96365bfac9bff7', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('e26e044a9dc5465b9af45fffdd9c874f', '8fc7a2b1f4ae423582bfc8c8aa00906d', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('e3f33c472d884bdaaafce8ba7a113287', '22bc8ff8c3e241269cff02e5def25984', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('e55ed9f823b24af68ab0db734ba1241b', '1243d3d8468c4df0ba0e08fbea1d0773', null, '9a663063777a4c8f9dd8fc3996b37a46', null, null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_score` VALUES ('e59d0467565c402abf63c435e13a9dc6', 'df404085384c4a428631768befdb3d09', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('ea1fa5860b734982b76cf19e38f10cf5', '532b3590acc942ffa12d44c2f47134a7', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('ec1f7b9ff41b4425833b56b149f94133', '6ca06947ba5d4f24a3ccc6b39a798367', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('ec8b33af38bc4927b0c08d0d505c16a1', '909e05872993467d952a512436b9c56e', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('ed7f947784584f2a9113e725bf268322', '979f2b1a58cc4a14912cae4e44f12dd7', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_score` VALUES ('ef583903d1bf4f11826c720ace571419', 'eabeae1d4e0a491db373ac3ae904d166', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('f03d6d8266d24cc697b0b27ac2c25693', 'eb97605225bc4482a448054b4bda61b5', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('f10f3dfa184c425cb04b0779cb09791c', '7180e37a58034c12b68874670c3e00b1', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('f1da497837c841dcb22b507e7be2491f', 'f1ff425c7f304ae8883f6a97c5547afe', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('f2af1f7cdd2940ad9f6496496ab3e1f8', '06841c311f614289af19d3273e5a0dde', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('f681b3f34095466fa3e514d8a32b2e48', '94dc11c387d34c51a94bf144bfdc032a', null, '47f7a043c03f4fbba01013bb40abb2d2', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('f69e3e1c52144584a40b66d2a79f72d1', '7e279ce756434631b1f9cc320341056d', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('f6a94bb6d32941368c73c12a8dee0e2b', 'dfb8902a63c84a1b9961d8ba5d625acd', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('f712e4c5934148f98c47150a1fb2a8a9', 'a8a87a7558494ca492cd55f9d383d6ba', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('f71b7ea232ea439483aedb78972bfc2e', '037434f2936d454487508159b338c964', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('f83597f225654479b902ec0ae7686f40', '7e06f4779af7471ab11156d50386c56e', null, 'edc44581f0c845d2bf264ac98bcee681', null, null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_score` VALUES ('fa67ffb5da6c4d8c81e3fadb4bb6664e', 'b0ed23e0cea143cc87a3d65388bbd958', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('fc397bd29d2b43269d3c926ff5b505f3', '9ba71e3eaadc41068c09de71f488417d', null, '89d17bcbdf4246769179202e6067b1db', null, null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_score` VALUES ('fc7cb5d656ab4980acd7ca342306fc47', 'a463701521434888a6ae42080fd8f72d', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_score` VALUES ('fd6975c321724baa8af52060dcf28e31', 'e8ca02b3516e4e2dae200ff8d6919bb2', null, 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', null, null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_score` VALUES ('ff2ab9bd5a764191adee138f3a3f4c3e', '3ecef8ef616e4a66b3f5124d41364c9a', null, 'd2ec24526dc446feb5d43926df38f7f3', null, null, null, null, '2021-02-19 17:34:30', null, '0');

-- ----------------------------
-- Table structure for exam_subject
-- ----------------------------
DROP TABLE IF EXISTS `exam_subject`;
CREATE TABLE `exam_subject` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `exam_id` varchar(32) DEFAULT NULL,
  `subject_id` varchar(32) DEFAULT NULL,
  `begin_time` varchar(64) DEFAULT NULL COMMENT '该科目考试开始时间',
  `end_time` varchar(64) DEFAULT NULL COMMENT '该科目考试结束时间',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_subject
-- ----------------------------
INSERT INTO `exam_subject` VALUES ('06da2df7fb25450dba6a41f5b0bee318', '历史', 'f000c74a427a40778ccb4b5d595f5137', '8b38d77b751b4603873e81c880ba9da9', '02:00:00', '03:30:00', null, null, null, '2021-02-19 17:05:04', null, '0');
INSERT INTO `exam_subject` VALUES ('0d0d10332efe4f4d8ede0f138793e01d', '数学', 'edc07759c9af4eb18b275c4c8e445063', '6df0367ed6334b87b78af2ee77ec0da9', '16:46:47', '18:46:47', null, null, null, '2021-02-19 16:49:31', null, '0');
INSERT INTO `exam_subject` VALUES ('144918602f5649b6bb5aea89b1d5601a', '数学', '2bf6af8c46f34b469341861ce5748faf', '6df0367ed6334b87b78af2ee77ec0da9', '09:00:00', '11:00:00', null, null, null, '2021-02-19 16:37:48', null, '0');
INSERT INTO `exam_subject` VALUES ('1682588340a7400f8d92523eccfdb181', '数学', '811339531d554108a154a49e946a0617', '6df0367ed6334b87b78af2ee77ec0da9', '02:00:00', '04:00:00', null, null, null, '2021-01-31 14:41:57', null, '0');
INSERT INTO `exam_subject` VALUES ('1f63dc7fe2e349d2afbbbfd51322976d', '历史', '64d5179845fe4b9cb594c8b7388779f3', '8b38d77b751b4603873e81c880ba9da9', '20:46:37', '22:16:37', null, null, null, '2021-02-25 20:46:43', null, '0');
INSERT INTO `exam_subject` VALUES ('24b96859d0fb4a4db4fc74d25862d76a', '数学', '45a6f81df5fa4eb38f26cc9cec99e0cc', '6df0367ed6334b87b78af2ee77ec0da9', '02:00:00', '2:10:00', null, null, null, '2021-02-19 16:41:25', null, '0');
INSERT INTO `exam_subject` VALUES ('2bca484bb2144232b979bb9355ff359f', '物理', 'f000c74a427a40778ccb4b5d595f5137', '7a6ecc7208f14a828a3def5ab5814455', '02:00:00', '03:30:00', null, null, null, '2021-02-19 17:05:04', null, '0');
INSERT INTO `exam_subject` VALUES ('2dba6bb038074d8199aea16abb9191c4', '物理', 'edc07759c9af4eb18b275c4c8e445063', '7a6ecc7208f14a828a3def5ab5814455', '02:00:00', '03:30:00', null, null, null, '2021-02-19 16:49:31', null, '0');
INSERT INTO `exam_subject` VALUES ('47f7a043c03f4fbba01013bb40abb2d2', '物理', '2bf6af8c46f34b469341861ce5748faf', '7a6ecc7208f14a828a3def5ab5814455', '14:00:00', '15:30:00', null, null, null, '2021-02-19 16:37:48', null, '0');
INSERT INTO `exam_subject` VALUES ('574ba855e74b472bad5ade0d0cceef70', '数学', 'f000c74a427a40778ccb4b5d595f5137', '6df0367ed6334b87b78af2ee77ec0da9', '17:04:40', '19:04:40', null, null, null, '2021-02-19 17:05:04', null, '0');
INSERT INTO `exam_subject` VALUES ('5b058e89c5d74808997f1fd9b7ae0b85', '数学', '64d5179845fe4b9cb594c8b7388779f3', '6df0367ed6334b87b78af2ee77ec0da9', '20:46:18', '22:46:18', null, null, null, '2021-02-25 20:46:43', null, '0');
INSERT INTO `exam_subject` VALUES ('84308c27394249e7af98cc7227dd2473', '历史', 'edc07759c9af4eb18b275c4c8e445063', '8b38d77b751b4603873e81c880ba9da9', '02:00:00', '03:30:00', null, null, null, '2021-02-19 16:49:31', null, '0');
INSERT INTO `exam_subject` VALUES ('89d17bcbdf4246769179202e6067b1db', '数学', 'e636081eb98d487986145b3eb7d640cf', '6df0367ed6334b87b78af2ee77ec0da9', '17:31:58', '19:31:58', null, null, null, '2021-02-19 17:32:23', null, '0');
INSERT INTO `exam_subject` VALUES ('9a663063777a4c8f9dd8fc3996b37a46', '物理', '811339531d554108a154a49e946a0617', '7a6ecc7208f14a828a3def5ab5814455', '02:00:00', '03:30:00', null, null, null, '2021-01-31 14:41:57', null, '0');
INSERT INTO `exam_subject` VALUES ('a12b7e69c7ab4bd8a04cbdb9a4f5f504', '历史', '2bf6af8c46f34b469341861ce5748faf', '8b38d77b751b4603873e81c880ba9da9', '09:00:00', '10:30:00', null, null, null, '2021-02-19 16:37:48', null, '0');
INSERT INTO `exam_subject` VALUES ('be362f87ecf9441daceb944756b24e4b', '物理', '64d5179845fe4b9cb594c8b7388779f3', '7a6ecc7208f14a828a3def5ab5814455', '20:46:30', '22:16:30', null, null, null, '2021-02-25 20:46:43', null, '0');
INSERT INTO `exam_subject` VALUES ('d09e609f13c34245a8092934354e9c89', '历史', '811339531d554108a154a49e946a0617', '8b38d77b751b4603873e81c880ba9da9', '02:00:00', '03:30:00', null, null, null, '2021-01-31 14:41:57', null, '0');
INSERT INTO `exam_subject` VALUES ('d1c912308ff446ac87530601058f1761', '历史', '45a6f81df5fa4eb38f26cc9cec99e0cc', '8b38d77b751b4603873e81c880ba9da9', '02:00:00', '03:30:00', null, null, null, '2021-02-19 16:41:25', null, '0');
INSERT INTO `exam_subject` VALUES ('d2ec24526dc446feb5d43926df38f7f3', '历史', 'e636081eb98d487986145b3eb7d640cf', '8b38d77b751b4603873e81c880ba9da9', '02:00:00', '03:30:00', null, null, null, '2021-02-19 17:32:23', null, '0');
INSERT INTO `exam_subject` VALUES ('d988ceb71d424dee9fdb30bd0589dea5', '物理', '45a6f81df5fa4eb38f26cc9cec99e0cc', '7a6ecc7208f14a828a3def5ab5814455', '02:00:00', '03:30:00', null, null, null, '2021-02-19 16:41:25', null, '0');
INSERT INTO `exam_subject` VALUES ('edc44581f0c845d2bf264ac98bcee681', '物理', 'e636081eb98d487986145b3eb7d640cf', '7a6ecc7208f14a828a3def5ab5814455', '17:32:09', '19:02:09', null, null, null, '2021-02-19 17:32:23', null, '0');

-- ----------------------------
-- Table structure for exam_subject_student
-- ----------------------------
DROP TABLE IF EXISTS `exam_subject_student`;
CREATE TABLE `exam_subject_student` (
  `id` varchar(32) NOT NULL,
  `exam_id` varchar(32) DEFAULT NULL COMMENT '考试（总）id',
  `student_id` varchar(32) DEFAULT NULL,
  `exam_subject_id` varchar(32) DEFAULT NULL COMMENT '考试（某科目）id',
  `exam_room_id` varchar(32) DEFAULT NULL COMMENT '考室id',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_subject_student
-- ----------------------------
INSERT INTO `exam_subject_student` VALUES ('037434f2936d454487508159b338c964', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('03d11ebf422641abb1cbba37d38d137d', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('03fa3198573a4e5c9362c096c96dab32', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('06841c311f614289af19d3273e5a0dde', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('0722d0b1a3a44baca9a269d6c442fb48', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('08e9e648f3f849398dba90870a4b14d2', '2bf6af8c46f34b469341861ce5748faf', '067b911002814f7699b43252fc2cc6c2', '144918602f5649b6bb5aea89b1d5601a', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('0b5b622f193d49978085dcc7a3487e52', '2bf6af8c46f34b469341861ce5748faf', '0937638060224bc896300915f62333a3', '144918602f5649b6bb5aea89b1d5601a', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('0be569b65199492f9cc27e673f2a1deb', '2bf6af8c46f34b469341861ce5748faf', '018955c13c2e4a5f81ac36fb14aedf11', '47f7a043c03f4fbba01013bb40abb2d2', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('0f6c4b4ab5314521bf95fd1707a274c5', '2bf6af8c46f34b469341861ce5748faf', '1534c31518094b43ac31a346e8f68a2e', '47f7a043c03f4fbba01013bb40abb2d2', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1218fa9ba2534dcc9b90a249ab4133e6', '2bf6af8c46f34b469341861ce5748faf', '1534c31518094b43ac31a346e8f68a2e', '144918602f5649b6bb5aea89b1d5601a', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1236b806d5384fc0895ed907ae6dd52b', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('15066dffa964461dbe4850ff9d8142de', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('18de8ff79b014dc0b53583be9f36d886', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('19d8640fa33b4f7db11143b0aefa301e', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1b1de7f66ced4d958f9a2944a04f8665', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1be7e6821fc244d1b8356d5888c77a6a', '811339531d554108a154a49e946a0617', '067b911002814f7699b43252fc2cc6c2', '1682588340a7400f8d92523eccfdb181', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1c327acb78f04083a948611a7b0e77d4', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1d1f4b6b83d5471694f020c015941456', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1d52d1d399b54bde90d48f61e44084d4', '811339531d554108a154a49e946a0617', '1464c93f55a743068e046d4c1c66209e', 'd09e609f13c34245a8092934354e9c89', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1da15e1f84494f99a4c6882eb7f268d8', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1dc384c3637d4d06951aad09029b8a58', '2bf6af8c46f34b469341861ce5748faf', '0937638060224bc896300915f62333a3', '47f7a043c03f4fbba01013bb40abb2d2', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1e56f6f03a5e43b6a7970115d4d92109', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1ecebc1e0f294960bc84ed324ee1d398', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('1fac6157302a4773805f84677dd1ce9c', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('20c4a9c08eda43248f68e13b3d4fc40d', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('2171553e834b4b71bd6629be6c75edf7', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('22bc8ff8c3e241269cff02e5def25984', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('24cc1ed547344a0ba19e7e507666a52e', '2bf6af8c46f34b469341861ce5748faf', '191f0c5cdc194e06964437dc01921c19', '47f7a043c03f4fbba01013bb40abb2d2', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('24f5f0e9d26a4903998bcc818dc56782', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('261c31b9c2144325aea83804c0beee9e', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('263a3492e86f411287354271495eee94', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('27a6d3c31ef8429da4eebc3ce7470ba7', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('27f2c6b022aa4fb2a8d97794b0fd1b78', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('286dbef0f4a6456e96e2c33e52a2bb7d', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('28900e40eb1143e193185e4b854bcc7c', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('291811f5df204d69a38fffda79081573', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('295da1303422417ab82a8b56b9274f94', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('2a58175a0462408eb69062318908057e', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('2b69a4af8831451aab5242df1c607420', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('2cf6e305bc3d4617b8e4ba66fe94c256', '2bf6af8c46f34b469341861ce5748faf', '16d8ee1748e9458aa7d6c3021ac24841', '144918602f5649b6bb5aea89b1d5601a', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('2d384428aea1401797e2e8518726cfff', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('2d610c23b7a2478c98f30c7ef66bed18', '811339531d554108a154a49e946a0617', '1534c31518094b43ac31a346e8f68a2e', 'd09e609f13c34245a8092934354e9c89', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('2f028208b3d5461d84c138e1f854981f', '811339531d554108a154a49e946a0617', '0937638060224bc896300915f62333a3', '1682588340a7400f8d92523eccfdb181', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('2f66b029991d48288668b4cc0c818185', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3115479cf9d14440992508a9885ce2dd', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('31519c755bff4a138fc1d7fd4462044a', '2bf6af8c46f34b469341861ce5748faf', '1464c93f55a743068e046d4c1c66209e', '47f7a043c03f4fbba01013bb40abb2d2', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('32c3dd9a0ed14606a12bde35ef0884ca', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('33544e9cb2fd43bfa69660772e217473', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('34503efc41bc411d8778fcb79a798299', '2bf6af8c46f34b469341861ce5748faf', '191f0c5cdc194e06964437dc01921c19', '144918602f5649b6bb5aea89b1d5601a', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('366c48d1cde845c9a9e353770c8b1175', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3734e44954874195a3cebfaefd93e611', '2bf6af8c46f34b469341861ce5748faf', '17328ba59fbb4ad582127cdc36ad4fd1', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3829b48bf0c04260b7cb66e6911298dc', '811339531d554108a154a49e946a0617', '003efd34442c4bd0a44c2b2f46d2a824', '1682588340a7400f8d92523eccfdb181', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('39b4fa1f31f8461bb8e64e2ec9a3f285', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3a2a5a0455d84164ab5bfa4cef7bb312', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3ace6e2399934afa91431b0c6fd327ee', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3c227b80f2e94c82aee283f9150b1267', '2bf6af8c46f34b469341861ce5748faf', '003efd34442c4bd0a44c2b2f46d2a824', '144918602f5649b6bb5aea89b1d5601a', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3c31aa3d7f8d4f429c3dfc479213b228', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3c90c98eb83b4091b0f6406441a1157a', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3d99b2d8091342daa899ec34252c53c8', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3df688d898c0479584981b14899a3f43', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('3ecef8ef616e4a66b3f5124d41364c9a', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('40b4f9b4f7a6493699ffd4c666cd0d59', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('417dae28f895439fa05adbf292bbe505', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('43b830d3960b4ffabbb77e5065c1a94d', '2bf6af8c46f34b469341861ce5748faf', '17328ba59fbb4ad582127cdc36ad4fd1', '47f7a043c03f4fbba01013bb40abb2d2', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('43d96fb291f64f10970ee93c1326da0a', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('445ad5f81fb14a34be931a8ee28cfdd7', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('45b01d5c17214af4b1113839c6907865', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('45cf83b838654af0b11c55002c489a1f', '811339531d554108a154a49e946a0617', '008fcf303c9149309b7d5ce262a1506a', '9a663063777a4c8f9dd8fc3996b37a46', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4613689b97834403aaf8c7637af74d3e', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4630c236b9d1403fb027fa35af43411f', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4919adc237d74fcaa2fce580db193253', '2bf6af8c46f34b469341861ce5748faf', '184447334a7c47b2902fc17d1c10693d', '144918602f5649b6bb5aea89b1d5601a', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4a388d555d13434d9c427de7b3767912', '811339531d554108a154a49e946a0617', '1243d3d8468c4df0ba0e08fbea1d0773', '9a663063777a4c8f9dd8fc3996b37a46', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4a9a34d44741449d85457f8bc0148678', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4adc8a58244d413d9f70f71f5de8f409', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4baee687702d4977af8af87ae13b404c', '811339531d554108a154a49e946a0617', '1534c31518094b43ac31a346e8f68a2e', '1682588340a7400f8d92523eccfdb181', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4c1095ac1aa0441c8170759d40b69fea', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('4cdc0b9373b345dba6606c6068a676eb', '811339531d554108a154a49e946a0617', '0937638060224bc896300915f62333a3', '9a663063777a4c8f9dd8fc3996b37a46', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('530c1073412648e3a3462c3fc389b143', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('531b4c365715492b9b92bfe0b56a4002', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('532b3590acc942ffa12d44c2f47134a7', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('538b7452e39c4e8794c8b07bbd7d3e71', '2bf6af8c46f34b469341861ce5748faf', '018955c13c2e4a5f81ac36fb14aedf11', '144918602f5649b6bb5aea89b1d5601a', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('55d8c1440297415ab5355e6365b1e7a9', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('55f97607ae414e76baa75ac561883bd1', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('5a87607adf2940638c3f6cb2f0c314e7', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('5e028ed5a46d436db7ef2911de8db796', '2bf6af8c46f34b469341861ce5748faf', '1534c31518094b43ac31a346e8f68a2e', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('60280fbf2900408d95b65df18a9e942c', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('602e76793b6f4f49834d11bb62ca65aa', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('607f4d2bca684470b0f89106cc632bae', '2bf6af8c46f34b469341861ce5748faf', '008fcf303c9149309b7d5ce262a1506a', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('6216bcad67464dc58dee213b26b5976b', '811339531d554108a154a49e946a0617', '1464c93f55a743068e046d4c1c66209e', '9a663063777a4c8f9dd8fc3996b37a46', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('673856e8b2f7448a8e17c9a7d7483d49', '811339531d554108a154a49e946a0617', '16d8ee1748e9458aa7d6c3021ac24841', '1682588340a7400f8d92523eccfdb181', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('67958bd4979e45db8fe1dbb842ac296c', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('68d95029629143a58de1f569f7486c76', '2bf6af8c46f34b469341861ce5748faf', '0937638060224bc896300915f62333a3', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('6998484bd7924d09863cff62c5b868bc', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('6c89a16f57384abf8de49d601ccab025', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('6ca06947ba5d4f24a3ccc6b39a798367', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('6ff0f4a444574b09a74e8f3ecd89d70d', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('707848dcd1e8485eb77096fbad3d408a', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7180e37a58034c12b68874670c3e00b1', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('720e533a913c486089f29f9a5277cf26', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('728734b82d9c48f8b0a11b00b1f84fdc', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('72e99b0d463743368d37295faaca0422', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('72ef170148e347eebf6d3dc6f779760d', '2bf6af8c46f34b469341861ce5748faf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('730800dcbbdb4f44a22111dfafb74a95', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7764661b32d54188ab5e683eab861f94', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('77ec5eabed544a54b9c43005b4a9c505', '811339531d554108a154a49e946a0617', '002131ace3ed4ab783d0ce05315c1498', '1682588340a7400f8d92523eccfdb181', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('78221713787244fbbc0f34d5af5e3a5f', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('783e7113c0f24ef39d6cd29a92d6ff3b', '811339531d554108a154a49e946a0617', '018955c13c2e4a5f81ac36fb14aedf11', 'd09e609f13c34245a8092934354e9c89', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('78e20be911ca45178aa29d8e7c9f71e4', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('79df607a7c6849b9a6235256b4f07a96', '811339531d554108a154a49e946a0617', '16d8ee1748e9458aa7d6c3021ac24841', 'd09e609f13c34245a8092934354e9c89', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7a1b81cd494a4a249290e8bd3b29235b', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7b10960f2b884f9cb330c0c883c4d109', '811339531d554108a154a49e946a0617', '003efd34442c4bd0a44c2b2f46d2a824', '9a663063777a4c8f9dd8fc3996b37a46', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7bd311437a9c478791a7e7acc3fe901a', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7bed14eb4f1e4ccea64a9ebf3cdf0981', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7c8c1fb0062b4d16907a4776b7ba22c8', '2bf6af8c46f34b469341861ce5748faf', '1243d3d8468c4df0ba0e08fbea1d0773', '144918602f5649b6bb5aea89b1d5601a', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7cca9e79438045bab640526db13de29a', '2bf6af8c46f34b469341861ce5748faf', '0ad54e0920dd44eeac16a881b0b2c4e6', '144918602f5649b6bb5aea89b1d5601a', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7e06f4779af7471ab11156d50386c56e', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7e08bb4924f0499db2e5d71c6f85a47c', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7e279ce756434631b1f9cc320341056d', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7e671dcbd6b2456ebfa15dc613463bc7', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7e88670130fa4861b73e8e8d82a5aa48', '811339531d554108a154a49e946a0617', '168a13c8b86a4bea9c54771b1252c07d', '1682588340a7400f8d92523eccfdb181', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7f514e4c4f2b44fabfbd9485cd7a72c5', '2bf6af8c46f34b469341861ce5748faf', '002131ace3ed4ab783d0ce05315c1498', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('7f55fc2bded043108e2f9641ad3955d7', '2bf6af8c46f34b469341861ce5748faf', '168a13c8b86a4bea9c54771b1252c07d', '47f7a043c03f4fbba01013bb40abb2d2', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8119292ab05a4df6aed30fff87c2b931', '2bf6af8c46f34b469341861ce5748faf', '1464c93f55a743068e046d4c1c66209e', '144918602f5649b6bb5aea89b1d5601a', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('82846d2471a846bf971bea1189e36402', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('850c23bf1cb4490ca7468707175047b0', '811339531d554108a154a49e946a0617', '002131ace3ed4ab783d0ce05315c1498', 'd09e609f13c34245a8092934354e9c89', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8513ca6d668842d59460b9f36bfcd42c', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('86287cb0b2164df6aca4adef71b109d7', '2bf6af8c46f34b469341861ce5748faf', '0ad54e0920dd44eeac16a881b0b2c4e6', '47f7a043c03f4fbba01013bb40abb2d2', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('878d18e8d1c1476fbafbff88f478d57c', '811339531d554108a154a49e946a0617', '16d8ee1748e9458aa7d6c3021ac24841', '9a663063777a4c8f9dd8fc3996b37a46', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('88390175cf2d4fc0a292a6679f677b49', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('88c37ca630c04227bfb2577c598c1854', '2bf6af8c46f34b469341861ce5748faf', '17328ba59fbb4ad582127cdc36ad4fd1', '144918602f5649b6bb5aea89b1d5601a', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8934a380955144f385f9992416d821c2', '811339531d554108a154a49e946a0617', '018955c13c2e4a5f81ac36fb14aedf11', '1682588340a7400f8d92523eccfdb181', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('89e3085fe7404991821dac0211513fdf', '811339531d554108a154a49e946a0617', '1534c31518094b43ac31a346e8f68a2e', '9a663063777a4c8f9dd8fc3996b37a46', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8c65ded12d5243abb9f7a20f7c14a1ce', '2bf6af8c46f34b469341861ce5748faf', '018955c13c2e4a5f81ac36fb14aedf11', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8da25d0ffc0948f989d2d8b9afb21bea', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8eac597c4f614de1a6f913857043727a', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8f8910cbe19e4ba0853793b50ff75700', '811339531d554108a154a49e946a0617', '0ad54e0920dd44eeac16a881b0b2c4e6', 'd09e609f13c34245a8092934354e9c89', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8fc7a2b1f4ae423582bfc8c8aa00906d', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8fefcb4e56954d6c96106b1b93437200', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('8ff4617f500147c1ad04812b6b22c83c', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9004409c0cf44c3e8b5247caf3a16138', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('906cc8137e854d39a89762db937a69c6', '2bf6af8c46f34b469341861ce5748faf', '184447334a7c47b2902fc17d1c10693d', '47f7a043c03f4fbba01013bb40abb2d2', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('909e05872993467d952a512436b9c56e', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('915490cb2e9f47abb837f93b37aae813', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('91f5cc2a8af448e1962a214115743073', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9416a65ac410429585568de0459df6c2', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('94dc11c387d34c51a94bf144bfdc032a', '2bf6af8c46f34b469341861ce5748faf', '067b911002814f7699b43252fc2cc6c2', '47f7a043c03f4fbba01013bb40abb2d2', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('960333c924834490a9596324275c5640', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('96c5cd2a65704e6c8df8bbaf15e19adb', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('96ee76a1700e41f2a93be588eb359c3d', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('96f19dba5d2848c881d94d984936a7a2', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('975524bc528f4c4880a2da90f22b97f7', '811339531d554108a154a49e946a0617', '0937638060224bc896300915f62333a3', 'd09e609f13c34245a8092934354e9c89', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('979f2b1a58cc4a14912cae4e44f12dd7', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9905f570801342479758c4c8f7f9f901', '811339531d554108a154a49e946a0617', '1243d3d8468c4df0ba0e08fbea1d0773', 'd09e609f13c34245a8092934354e9c89', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9adbdc853e934f849b2379701a09c9cc', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9ba71e3eaadc41068c09de71f488417d', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9cf1a45be7244590bdf7fdf77dffacdf', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9dff87a1c0a34749baa1943b1cc1c7e1', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9e19f30cc98f49fabdc780109d4a5869', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('9e95d8df722248f28bcd748a3cc4d429', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a0a9d2ef95a74ea38d8be88022758804', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a0c530c78c624544a9eb622d0bf53768', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a234d9bfe0e84e70a6d5465d510993b3', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a3f576b5da9c4f019ad50f430b83a84e', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a463701521434888a6ae42080fd8f72d', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a4e5eda61cb14b0e986cdc04d5a3af71', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a56dec3f3725480093045ccda16bc6d5', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a77a609f2c2f418190653eee1c9816a7', '2bf6af8c46f34b469341861ce5748faf', '008fcf303c9149309b7d5ce262a1506a', '144918602f5649b6bb5aea89b1d5601a', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a84ac48321de4be4bdc1e5cdd708c7ad', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a8a87a7558494ca492cd55f9d383d6ba', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('a9a8dfeb8e7e4d63b8bff8e862bd837a', '811339531d554108a154a49e946a0617', '018955c13c2e4a5f81ac36fb14aedf11', '9a663063777a4c8f9dd8fc3996b37a46', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ab4d599907f346c49b89fd831cc6fdee', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ae52da7db4274ee58611ca9342ef01b3', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b0773cf986de4b85bef13effa8a8bcd1', '811339531d554108a154a49e946a0617', '003efd34442c4bd0a44c2b2f46d2a824', 'd09e609f13c34245a8092934354e9c89', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b0880f70a41446be894cc1d4453cac25', '2bf6af8c46f34b469341861ce5748faf', '16d8ee1748e9458aa7d6c3021ac24841', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b0ed23e0cea143cc87a3d65388bbd958', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b1333aaf48aa4af59d27437e2f40f064', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b1b8d6eca4844e68b878af280302878e', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b2001e1d2a764bb2a2467155f09b9314', '811339531d554108a154a49e946a0617', '008fcf303c9149309b7d5ce262a1506a', '1682588340a7400f8d92523eccfdb181', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b4fd598cce0a4cf29a8bd509ecc78bba', '811339531d554108a154a49e946a0617', '168a13c8b86a4bea9c54771b1252c07d', 'd09e609f13c34245a8092934354e9c89', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b524c2b946324a32a0bc156816bfcb60', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b5fca40aaa854452869a2dbcb98bb0cb', '811339531d554108a154a49e946a0617', '1464c93f55a743068e046d4c1c66209e', '1682588340a7400f8d92523eccfdb181', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b7c1240790984146b56c77f51c68856a', '811339531d554108a154a49e946a0617', '002131ace3ed4ab783d0ce05315c1498', '9a663063777a4c8f9dd8fc3996b37a46', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b87d3a10be2949ceb6bdadf6530fa47a', '811339531d554108a154a49e946a0617', '067b911002814f7699b43252fc2cc6c2', '9a663063777a4c8f9dd8fc3996b37a46', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b8d23f4c18424420aaca7e67f0cae938', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('b9667d7a494e4a8b9b9469dd4a179cba', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('bb49fccfbb5349cd8f4dfd90203db90f', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('bb8b93002a614b3ea0d17ae1d62c86c3', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('be05b2dc672c44a7b19d9025ead6ba78', '2bf6af8c46f34b469341861ce5748faf', '168a13c8b86a4bea9c54771b1252c07d', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('bedd78a7e6234e248bc8e785635f575e', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('bfcd04593785450a99d72794de48a31f', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('c0eb6264ab6148e89f0a2976e28f604d', '2bf6af8c46f34b469341861ce5748faf', '002131ace3ed4ab783d0ce05315c1498', '144918602f5649b6bb5aea89b1d5601a', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('c165f17e05894bb5a480d1f032c092e5', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('c21e3a9980b543adbb2cad7f176700c9', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('c32af9e93add4d50affdaccb3500926d', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('c558b41945bc40aa8506fa1f312678e3', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('c7ac4c95239f4a7d98ae8fb8f63ec871', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('c7afd60f5cf343ffbd34be4c0d8ed799', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cb5641b0263d440a87a3c5b71a870670', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cb7bd3deb223471c96531aff33d6ef9a', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cbda6f4636414dd888e2666559065a78', '2bf6af8c46f34b469341861ce5748faf', '1243d3d8468c4df0ba0e08fbea1d0773', '47f7a043c03f4fbba01013bb40abb2d2', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cc7cc4aa60214194b47a3e5b5799df7e', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cce9e787b6f84126929421923358bfe5', '2bf6af8c46f34b469341861ce5748faf', '002131ace3ed4ab783d0ce05315c1498', '47f7a043c03f4fbba01013bb40abb2d2', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cd2c3d2ad0a143b7bba08e9157d5205e', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cd4dd8cdc12a4e82b7317e2efde3eac2', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cd97bdf109784160aa96b9879d169d18', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cda0801a17da435aac8f62bf87da44aa', '2bf6af8c46f34b469341861ce5748faf', '168a13c8b86a4bea9c54771b1252c07d', '144918602f5649b6bb5aea89b1d5601a', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ce1674adde924bc8aba6a083e95d9cac', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ce3e33268289420fb962c6f8aea00f11', '2bf6af8c46f34b469341861ce5748faf', '16d8ee1748e9458aa7d6c3021ac24841', '47f7a043c03f4fbba01013bb40abb2d2', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ce3ef45a0db54b63b807219ef41edf75', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cf7be3e5d94643c9b6e60173b427fd75', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('cf8de9940b124152a7ca772b8b4a3bee', '2bf6af8c46f34b469341861ce5748faf', '003efd34442c4bd0a44c2b2f46d2a824', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d05c250dd7b046a49b8b29c401376cf4', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d1fca2fa51e8472c926a072d9e4deba8', '811339531d554108a154a49e946a0617', '067b911002814f7699b43252fc2cc6c2', 'd09e609f13c34245a8092934354e9c89', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d2422d812caa45efa44b8715c3e70e99', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d2572980623f45238c9aa38bdb44cad4', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d3cdc3a568624696a54c27830a2579ec', '2bf6af8c46f34b469341861ce5748faf', '191f0c5cdc194e06964437dc01921c19', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d442dc91b54246b3904b7c54519044eb', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d4ebc01dce0a44af99771f1512646237', 'e636081eb98d487986145b3eb7d640cf', '168a13c8b86a4bea9c54771b1252c07d', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d519656a2f9645d89731e01ee7e0a609', '811339531d554108a154a49e946a0617', '008fcf303c9149309b7d5ce262a1506a', 'd09e609f13c34245a8092934354e9c89', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d542926a25be423b905fd507d38431ba', '2bf6af8c46f34b469341861ce5748faf', '1243d3d8468c4df0ba0e08fbea1d0773', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d952019a3b994436aac60bad53a93550', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('d9d272a5ebf8492a984a2ef057b82577', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('da1081b9f6e84b3ebad6db3255bd601a', '811339531d554108a154a49e946a0617', '0ad54e0920dd44eeac16a881b0b2c4e6', '9a663063777a4c8f9dd8fc3996b37a46', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('dc433c70352049b1bf72d23ca7aea253', '811339531d554108a154a49e946a0617', '168a13c8b86a4bea9c54771b1252c07d', '9a663063777a4c8f9dd8fc3996b37a46', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('dd288e05cac946f2b3be11bb9d8069e0', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('def91ef93ac44db0aeb9940151f2ddce', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('df048aaf8091481a9c0f2935e6197282', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('df404085384c4a428631768befdb3d09', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('dfb8902a63c84a1b9961d8ba5d625acd', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('dfe287b6fd104b89a37865a3cfec490f', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('e0a787d4eec745d3ad613dd74209afe7', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('e24e21f84189475f99aa5bf62f1d0de5', '2bf6af8c46f34b469341861ce5748faf', '008fcf303c9149309b7d5ce262a1506a', '47f7a043c03f4fbba01013bb40abb2d2', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('e2fd2ffde80a4780a8903b7b96ef74e5', 'e636081eb98d487986145b3eb7d640cf', '067b911002814f7699b43252fc2cc6c2', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('e3f6338f307f4ae89ce35930fa69589c', '2bf6af8c46f34b469341861ce5748faf', '1464c93f55a743068e046d4c1c66209e', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('e8a541907b8a48bdbd96365bfac9bff7', 'e636081eb98d487986145b3eb7d640cf', '003efd34442c4bd0a44c2b2f46d2a824', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('e8ca02b3516e4e2dae200ff8d6919bb2', '2bf6af8c46f34b469341861ce5748faf', '067b911002814f7699b43252fc2cc6c2', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('e98f7bf8378940e09a7ff3563d0748a0', 'e636081eb98d487986145b3eb7d640cf', '002131ace3ed4ab783d0ce05315c1498', '89d17bcbdf4246769179202e6067b1db', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ea38c3827de246059bf11a83d4bc3530', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('eabeae1d4e0a491db373ac3ae904d166', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('eb3a9071e08a4c4980fb408c0a540e21', '811339531d554108a154a49e946a0617', '1243d3d8468c4df0ba0e08fbea1d0773', '1682588340a7400f8d92523eccfdb181', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('eb97605225bc4482a448054b4bda61b5', 'e636081eb98d487986145b3eb7d640cf', '16d8ee1748e9458aa7d6c3021ac24841', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ebddd1cb99ba4f1dba2ba5f89079b48f', '2bf6af8c46f34b469341861ce5748faf', '184447334a7c47b2902fc17d1c10693d', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ebe944ee904442f8b129314256cf032a', 'e636081eb98d487986145b3eb7d640cf', '1464c93f55a743068e046d4c1c66209e', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ec91f32223f44f0abf054663ccbdaebd', 'e636081eb98d487986145b3eb7d640cf', '0937638060224bc896300915f62333a3', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ecf12d67b9e241db9f02c949636aa702', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('ee7ec6464384419c8550e9443b8b676a', 'e636081eb98d487986145b3eb7d640cf', '1534c31518094b43ac31a346e8f68a2e', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('eea08e7e288340d2926da891f17c840b', 'e636081eb98d487986145b3eb7d640cf', '17328ba59fbb4ad582127cdc36ad4fd1', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('efa7d3d8bf1b40f196f6e48ff47d5b38', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f0a849399ba6476d9888af8292724f13', 'e636081eb98d487986145b3eb7d640cf', '1243d3d8468c4df0ba0e08fbea1d0773', '89d17bcbdf4246769179202e6067b1db', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f105e84d75304224b64a7428d3a5a1e4', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'edc44581f0c845d2bf264ac98bcee681', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f14a2b57a6224730a58591dc8e5da030', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', 'd2ec24526dc446feb5d43926df38f7f3', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f1ff425c7f304ae8883f6a97c5547afe', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f33c067e311044829a5446e5f6d0a65f', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f354354717af4a66bb5cc0c06c19a5a9', 'e636081eb98d487986145b3eb7d640cf', '184447334a7c47b2902fc17d1c10693d', 'edc44581f0c845d2bf264ac98bcee681', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f544e1fa53c44916ba188ce0e6cf70a2', '2bf6af8c46f34b469341861ce5748faf', '003efd34442c4bd0a44c2b2f46d2a824', '47f7a043c03f4fbba01013bb40abb2d2', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f8a0b031340c4c0cb8415e526d23ef74', 'e636081eb98d487986145b3eb7d640cf', '0ad54e0920dd44eeac16a881b0b2c4e6', 'd2ec24526dc446feb5d43926df38f7f3', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('f96eb3cae89a4859af72fcea87fb2d74', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', 'd2ec24526dc446feb5d43926df38f7f3', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_subject_student` VALUES ('fbb33e96c8ea49428613ef93422eba31', 'e636081eb98d487986145b3eb7d640cf', '191f0c5cdc194e06964437dc01921c19', '89d17bcbdf4246769179202e6067b1db', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_subject_student` VALUES ('fcc0cf58199d4769beb4798555f1e1ab', '811339531d554108a154a49e946a0617', '0ad54e0920dd44eeac16a881b0b2c4e6', '1682588340a7400f8d92523eccfdb181', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_subject_student` VALUES ('fdd1536cecc54681864cf1eba9922859', 'e636081eb98d487986145b3eb7d640cf', '008fcf303c9149309b7d5ce262a1506a', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_subject_student` VALUES ('fefd30f51bb447968793d2bb9f09a95f', 'e636081eb98d487986145b3eb7d640cf', '018955c13c2e4a5f81ac36fb14aedf11', 'edc44581f0c845d2bf264ac98bcee681', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');

-- ----------------------------
-- Table structure for exam_teacher_inviglate
-- ----------------------------
DROP TABLE IF EXISTS `exam_teacher_inviglate`;
CREATE TABLE `exam_teacher_inviglate` (
  `id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) DEFAULT NULL,
  `exam_subject_id` varchar(32) DEFAULT NULL COMMENT '考试科目 id',
  `exam_id` varchar(32) DEFAULT NULL COMMENT '考试（总）id',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_teacher_inviglate
-- ----------------------------
INSERT INTO `exam_teacher_inviglate` VALUES ('01d21f675402476db750a52845277f29', '193f1ec79bca48788b9b8c9e9719df21', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('0da55d09a03b4b53aefd2fe14a3fa89c', '369b5898d57648d18e7035efc2fa43e5', '1682588340a7400f8d92523eccfdb181', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('119b7402e4a64a23b2743a3829abc0a7', '369b5898d57648d18e7035efc2fa43e5', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('2195e0b0b7684205b93f052d3f8f9487', '369b5898d57648d18e7035efc2fa43e5', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('21a0aec2b5034aec9cf331d0bbdd6211', '193f1ec79bca48788b9b8c9e9719df21', 'd09e609f13c34245a8092934354e9c89', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('249714623b1340a9911554ced2361a92', '369b5898d57648d18e7035efc2fa43e5', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('2755017022ef45e5a53e7221dc4a3f06', '472bbf68364e44b58211516ab9874174', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('2938bae9562648a9a9fa7d21c2cfa266', '193f1ec79bca48788b9b8c9e9719df21', '9a663063777a4c8f9dd8fc3996b37a46', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('2f13d86a352446b584ec8856c0b05486', '472bbf68364e44b58211516ab9874174', '144918602f5649b6bb5aea89b1d5601a', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('3202355e72de4f29b557628889c6a688', '472bbf68364e44b58211516ab9874174', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('36a47c4281ff4a5e8ce5fc986e1004fd', '472bbf68364e44b58211516ab9874174', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('3c0a4752a5b040e596ff7568c12f6a96', '369b5898d57648d18e7035efc2fa43e5', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('3feddfcf4d5a4a7e992642ebbdf354f8', '472bbf68364e44b58211516ab9874174', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('41e9b28b8e3d496b94164fb225e3a1cb', '193f1ec79bca48788b9b8c9e9719df21', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('464b33b2c91d444b91f310c7d166f990', '472bbf68364e44b58211516ab9874174', '47f7a043c03f4fbba01013bb40abb2d2', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('47670c0c129e45078fdf487721ee7079', '193f1ec79bca48788b9b8c9e9719df21', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('48423f1803b14bc6869644db3c5e1e9b', '193f1ec79bca48788b9b8c9e9719df21', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('4c650f48bcaa406f84749becb6ec3a1d', '472bbf68364e44b58211516ab9874174', '1682588340a7400f8d92523eccfdb181', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('4d54e93f8fe1437989c27f6ad4d2ff01', '472bbf68364e44b58211516ab9874174', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('4d7f3cf75ed5437b861ae53e6a2337ef', '472bbf68364e44b58211516ab9874174', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('4feb66d07748400fb91b165fbe5894fd', '472bbf68364e44b58211516ab9874174', 'd09e609f13c34245a8092934354e9c89', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('58826377e2e9409c97991002d1715b3b', '369b5898d57648d18e7035efc2fa43e5', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('589b92ba36eb4ee8aa41358dec354adc', '193f1ec79bca48788b9b8c9e9719df21', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('5a83bdc7126f4c07b8e900e1f9e283aa', '193f1ec79bca48788b9b8c9e9719df21', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('5cd3be37421b41ebb1a157928c0d739c', '472bbf68364e44b58211516ab9874174', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('5e32bd7dc0b84f9da9ddbc9e44c940b8', '472bbf68364e44b58211516ab9874174', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('61d45f1612e349c291fb0b077f8e64a3', '369b5898d57648d18e7035efc2fa43e5', '47f7a043c03f4fbba01013bb40abb2d2', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('61ee68cf3dd846ce8d785cfdebb73f7a', '472bbf68364e44b58211516ab9874174', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('6c27684e964e4655a67e9e13da111ca7', '472bbf68364e44b58211516ab9874174', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('6e5b9d6749eb4d748567a43fbb90cb8f', '369b5898d57648d18e7035efc2fa43e5', '9a663063777a4c8f9dd8fc3996b37a46', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('81ccd557f49848cab4e879e33baa85ac', '193f1ec79bca48788b9b8c9e9719df21', '47f7a043c03f4fbba01013bb40abb2d2', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('85361886ff444b978ee6373768ce1080', '472bbf68364e44b58211516ab9874174', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('86dad6ad92e1428a959e4293208bf061', '193f1ec79bca48788b9b8c9e9719df21', '144918602f5649b6bb5aea89b1d5601a', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('8b88311fac40411e8141752fbc5f222c', '369b5898d57648d18e7035efc2fa43e5', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('9547f0e122b545f8a18e3ac4168fac18', '369b5898d57648d18e7035efc2fa43e5', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('955721f7a7aa47ea8cc99d6e303c8927', '193f1ec79bca48788b9b8c9e9719df21', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('9bf8c01780fe4588bbddde33538a09be', '369b5898d57648d18e7035efc2fa43e5', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('9ffdfdd9ea3c4c728eaf46048f83834e', '369b5898d57648d18e7035efc2fa43e5', '144918602f5649b6bb5aea89b1d5601a', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('a2770f7e7d444e66801e516b6e7f3380', '369b5898d57648d18e7035efc2fa43e5', 'd09e609f13c34245a8092934354e9c89', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('a4ba63dc39a84be9b454456181dc5960', '193f1ec79bca48788b9b8c9e9719df21', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('bd4f4e640f8541e381db1b6541277ebb', '193f1ec79bca48788b9b8c9e9719df21', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('d29758e783cd4eae8c4d40189128e2ff', '369b5898d57648d18e7035efc2fa43e5', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('d40ed73b16fc4d2093224b0b154819b4', '472bbf68364e44b58211516ab9874174', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('da5352ca429c4c609683443073e12c33', '369b5898d57648d18e7035efc2fa43e5', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('dc22fe6462a64419814bffde58472e45', '193f1ec79bca48788b9b8c9e9719df21', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('de52fe14989c426ab85d3d7c4f27f89a', '193f1ec79bca48788b9b8c9e9719df21', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('e4ce4048d2ef410cbfa5d163f70d0828', '193f1ec79bca48788b9b8c9e9719df21', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('e69b3f67c8684a9bb5b1599244d8bd00', '369b5898d57648d18e7035efc2fa43e5', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('eaedb743d2a643ee97cb6907d6201501', '369b5898d57648d18e7035efc2fa43e5', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('eb542bd20a9347b5b84334b06ac3d202', '193f1ec79bca48788b9b8c9e9719df21', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('f1f96955b8924592b48a8a129f19a665', '472bbf68364e44b58211516ab9874174', '9a663063777a4c8f9dd8fc3996b37a46', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('f3873f4fdfa647a184fcfb3179c2ead4', '472bbf68364e44b58211516ab9874174', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('f415afb12bc1483f8073ac156efad495', '369b5898d57648d18e7035efc2fa43e5', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_inviglate` VALUES ('fdfa47956dc44fc695ddbfe160c8056b', '193f1ec79bca48788b9b8c9e9719df21', '1682588340a7400f8d92523eccfdb181', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');

-- ----------------------------
-- Table structure for exam_teacher_marking
-- ----------------------------
DROP TABLE IF EXISTS `exam_teacher_marking`;
CREATE TABLE `exam_teacher_marking` (
  `id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) DEFAULT NULL,
  `exam_subject_id` varchar(32) DEFAULT NULL COMMENT '考试学科表(exam_subject) id',
  `exam_id` varchar(32) DEFAULT NULL COMMENT '考试（总）id',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_teacher_marking
-- ----------------------------
INSERT INTO `exam_teacher_marking` VALUES ('022c2b662a034dfaa2212767ba68953b', '4e77eda800b8443c9dee62508bffb1cb', 'd09e609f13c34245a8092934354e9c89', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('0f10dd30a7dd424cb3fdb8dc9a0bc4d3', '369b5898d57648d18e7035efc2fa43e5', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('1abbdd7894b4400fa648e96d6a21a66b', '369b5898d57648d18e7035efc2fa43e5', '144918602f5649b6bb5aea89b1d5601a', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('1c7b5707a98a4d33bd250f16667c860d', '472bbf68364e44b58211516ab9874174', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('1daac94ddc6c425a97234054cf611db9', '193f1ec79bca48788b9b8c9e9719df21', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('1e59486fb3bd40edbc5bcbf3aa3161da', '193f1ec79bca48788b9b8c9e9719df21', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('24155837c77841d4a1fd7b38bb014961', '193f1ec79bca48788b9b8c9e9719df21', '144918602f5649b6bb5aea89b1d5601a', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('2453a95d21304f469d6c182b2da9fa2b', '4e77eda800b8443c9dee62508bffb1cb', '1682588340a7400f8d92523eccfdb181', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('253f3adf4b9a4bc097d52d7ff8db7fca', '193f1ec79bca48788b9b8c9e9719df21', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('25e08b39bd684feeb06a7478a8f06742', '472bbf68364e44b58211516ab9874174', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('271a7858f763430685b25684225bf0e6', '369b5898d57648d18e7035efc2fa43e5', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('27fee487e2ba481ba1c6f8c8fdb2f6d7', '369b5898d57648d18e7035efc2fa43e5', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('2d6f23cbaa764adc9ce16f5c8b985f15', '472bbf68364e44b58211516ab9874174', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('2ed4860acb6d4c8f9adcb77f3144f521', '4e77eda800b8443c9dee62508bffb1cb', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('309f25b88f7446548d7bdd7a3258ce11', '369b5898d57648d18e7035efc2fa43e5', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('3169ec2e20f34b449d68f045c5b17cbd', '369b5898d57648d18e7035efc2fa43e5', '1682588340a7400f8d92523eccfdb181', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('3481f9ef0a404b518713396a0f2265f8', '193f1ec79bca48788b9b8c9e9719df21', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('3a8dfa6448144838bbca05889b3daaa5', '369b5898d57648d18e7035efc2fa43e5', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('3bd914360469490ca27e69a0153ef88b', '193f1ec79bca48788b9b8c9e9719df21', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('3d13d15655a04554ba9908fe980297d4', '472bbf68364e44b58211516ab9874174', '1682588340a7400f8d92523eccfdb181', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('433d862c12ee4871a52e3aacaa6a6497', '193f1ec79bca48788b9b8c9e9719df21', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('45e34061de6f404c8953571bd084eb29', '472bbf68364e44b58211516ab9874174', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('460843eca25a4c90bf6979786e3df95f', '472bbf68364e44b58211516ab9874174', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('4e3c365c129542db9df4e3e73bc767a9', '472bbf68364e44b58211516ab9874174', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('5054f6f41dc945c5999eee4416bf9202', '4e77eda800b8443c9dee62508bffb1cb', '47f7a043c03f4fbba01013bb40abb2d2', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('57be7214b2aa4f5a9515fde8955190ee', '472bbf68364e44b58211516ab9874174', '47f7a043c03f4fbba01013bb40abb2d2', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('59f4d1fca929420f9aa8b9e8ad2e37f3', '193f1ec79bca48788b9b8c9e9719df21', '47f7a043c03f4fbba01013bb40abb2d2', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('612142933b074135b0f52e9a084c68c8', '472bbf68364e44b58211516ab9874174', 'd09e609f13c34245a8092934354e9c89', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('6253d4e786a1489d99821192debbc9b2', '4e77eda800b8443c9dee62508bffb1cb', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('6498f8b49e28496ca4d0be48854f98e4', '4e77eda800b8443c9dee62508bffb1cb', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('6ab4215f05c14938a17628e36d35b9f4', '193f1ec79bca48788b9b8c9e9719df21', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('6f2b12f639a4478ca7e23f050ba937ac', '369b5898d57648d18e7035efc2fa43e5', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('84ff3c597e7749f7841133183ba764cb', '472bbf68364e44b58211516ab9874174', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('87acdde2115a437f98cc8f8f4b93c7ab', '369b5898d57648d18e7035efc2fa43e5', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('8c73087ce61c457496493d12f81781cc', '369b5898d57648d18e7035efc2fa43e5', '47f7a043c03f4fbba01013bb40abb2d2', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('8d9b88d65de548d6bc072846a1d4be3e', '4e77eda800b8443c9dee62508bffb1cb', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('8ec9d92176024f5e874fb2f03a9015bf', '369b5898d57648d18e7035efc2fa43e5', 'd09e609f13c34245a8092934354e9c89', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('8ede7bfd119a4606aa744d02d3fb993d', '193f1ec79bca48788b9b8c9e9719df21', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('8ef7deffa06c41d69a83b3e2fa41fe00', '4e77eda800b8443c9dee62508bffb1cb', '144918602f5649b6bb5aea89b1d5601a', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('8f8b9c5a302c42068638fd5a1257b167', '369b5898d57648d18e7035efc2fa43e5', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('8ff118f675fe4d699e09032290038c6e', '369b5898d57648d18e7035efc2fa43e5', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('9205f67936cc4894b942cd5cdf153256', '4e77eda800b8443c9dee62508bffb1cb', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('96f7b1bee1e8482a9ef3cd464769dc44', '193f1ec79bca48788b9b8c9e9719df21', '9a663063777a4c8f9dd8fc3996b37a46', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('99c736e325c64eafa917ba16c023b29d', '472bbf68364e44b58211516ab9874174', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('9a26d2d8a56f487aa52d63e3f1ba0885', '4e77eda800b8443c9dee62508bffb1cb', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('9e8865918fb940edb8a11e3a2d9bef33', '193f1ec79bca48788b9b8c9e9719df21', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('a1626263b827495b9652ea148240b37d', '4e77eda800b8443c9dee62508bffb1cb', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('a3ab4df9640e4590a6f0e04e59a149c2', '369b5898d57648d18e7035efc2fa43e5', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('af676e5ee1244930be0323cbc773731a', '4e77eda800b8443c9dee62508bffb1cb', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('b1bbbc4ec251443d90a77b9f5a941ce4', '472bbf68364e44b58211516ab9874174', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('b4085ee7559a49bf80652f0f32bcd08a', '4e77eda800b8443c9dee62508bffb1cb', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('b48df44bb69f4e44a4006f72756d511a', '193f1ec79bca48788b9b8c9e9719df21', 'd09e609f13c34245a8092934354e9c89', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('b72f125153e049d0b655c42bc867dc1b', '472bbf68364e44b58211516ab9874174', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('be2110d7a7684c0186328abf18a6739b', '193f1ec79bca48788b9b8c9e9719df21', '1682588340a7400f8d92523eccfdb181', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('ccb2048759744aef83879c0867920a3f', '4e77eda800b8443c9dee62508bffb1cb', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('cf148cb587974b699fc26ce1f10d826d', '4e77eda800b8443c9dee62508bffb1cb', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('d10e8a96fedf4b4598c008fac2e09d17', '472bbf68364e44b58211516ab9874174', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('d376cbc83e5643e696838289f75eb66c', '4e77eda800b8443c9dee62508bffb1cb', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('d4e28343dde7470085005e01e39671ed', '472bbf68364e44b58211516ab9874174', '144918602f5649b6bb5aea89b1d5601a', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('d832862b33804a60b7b3d7e11bc1c3c6', '369b5898d57648d18e7035efc2fa43e5', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('dbe7f1a130cb43778bb3bdb4b1fba875', '369b5898d57648d18e7035efc2fa43e5', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('e1d7c7757820482b8f1c839799a70a90', '369b5898d57648d18e7035efc2fa43e5', '9a663063777a4c8f9dd8fc3996b37a46', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('e20cf33b7748475cb14760c5e4b5e0ef', '472bbf68364e44b58211516ab9874174', '9a663063777a4c8f9dd8fc3996b37a46', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('e381080b44ff4652b801cf19108a262e', '4e77eda800b8443c9dee62508bffb1cb', '9a663063777a4c8f9dd8fc3996b37a46', '811339531d554108a154a49e946a0617', null, null, null, '2021-02-08 11:28:54', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('e410651e28c047648eee907cc05aa3f8', '193f1ec79bca48788b9b8c9e9719df21', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('f48e2fa4dc924960af0ad5e627486b0f', '193f1ec79bca48788b9b8c9e9719df21', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('f685dbb724a74084996375e469a8c731', '472bbf68364e44b58211516ab9874174', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('f7ee0689fbf44c0a8a7183c497dd7e2d', '193f1ec79bca48788b9b8c9e9719df21', 'a12b7e69c7ab4bd8a04cbdb9a4f5f504', '2bf6af8c46f34b469341861ce5748faf', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('fb6b9c79c9db4d5ab94eda38cf3c4d3b', '193f1ec79bca48788b9b8c9e9719df21', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('fc880b69f55e448d9806559df889dd3e', '369b5898d57648d18e7035efc2fa43e5', 'd2ec24526dc446feb5d43926df38f7f3', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('fc9d9c3d6c7b4ceb9feb02f4393101a1', '4e77eda800b8443c9dee62508bffb1cb', '89d17bcbdf4246769179202e6067b1db', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teacher_marking` VALUES ('ffd4ff1cd03344e8a0b4274600fa7b4c', '472bbf68364e44b58211516ab9874174', 'edc44581f0c845d2bf264ac98bcee681', 'e636081eb98d487986145b3eb7d640cf', null, null, null, '2021-02-19 17:33:51', null, '0');

-- ----------------------------
-- Table structure for exam_teac_inv_room_middle
-- ----------------------------
DROP TABLE IF EXISTS `exam_teac_inv_room_middle`;
CREATE TABLE `exam_teac_inv_room_middle` (
  `id` varchar(32) NOT NULL,
  `teacher_inv_id` varchar(32) DEFAULT NULL COMMENT '监考教师id',
  `exam_room_id` varchar(32) DEFAULT NULL COMMENT '考室id',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_teac_inv_room_middle
-- ----------------------------
INSERT INTO `exam_teac_inv_room_middle` VALUES ('08746e0502f74d4fb820d7dc8aca8014', '9ffdfdd9ea3c4c728eaf46048f83834e', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('11136dddc6f54a23a1f30440029766a1', '4c650f48bcaa406f84749becb6ec3a1d', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:33:13', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('17a8183d09e748739b9c5883a49a1d33', '464b33b2c91d444b91f310c7d166f990', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('1a7f74833160431b93b31f00cabb94c6', '3feddfcf4d5a4a7e992642ebbdf354f8', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('1be8be2b88a149c18399b48e38acb04c', 'bd4f4e640f8541e381db1b6541277ebb', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('20159bf94561451994562f40d9a34e3f', '6e5b9d6749eb4d748567a43fbb90cb8f', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:33:14', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('23ac55bb638841569b2cb0a1baa6ab7e', 'd29758e783cd4eae8c4d40189128e2ff', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('24d642f7518849e7b587487b21f0ae16', '81ccd557f49848cab4e879e33baa85ac', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('2e5efdf370204945a73b80cccdc8dbd3', '4feb66d07748400fb91b165fbe5894fd', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:33:15', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('32783d90fee64d15bde8f3152f7bbb74', '2f13d86a352446b584ec8856c0b05486', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('32ae6bf6e051416ea893706f6a4f7f9d', '85361886ff444b978ee6373768ce1080', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('3358918693b24053a99645ee3737fba6', '589b92ba36eb4ee8aa41358dec354adc', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('3755a551fcd341e4b1c365184e286c95', '47670c0c129e45078fdf487721ee7079', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('3e119ad6f712456abc5d0d9488dd08ce', '8b88311fac40411e8141752fbc5f222c', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('40e9534f40f7435eaa5b0b9aa818ae4e', '2755017022ef45e5a53e7221dc4a3f06', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('4692f40e7e564ce487e314c65a65b627', 'da5352ca429c4c609683443073e12c33', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('4852c75f578a42e1baad91bde355029d', '0da55d09a03b4b53aefd2fe14a3fa89c', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:33:16', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('4a78f905ea254fa0a9a9550939975f46', '61ee68cf3dd846ce8d785cfdebb73f7a', '9a0736003f2a4a0295b76e60602e578e', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('54cd73d3386d4714939247a2acedb4b5', '86dad6ad92e1428a959e4293208bf061', '32a059c589ed4f6cb34e79de122b2513', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('56cf0291f702403f90e05c5b4067e524', 'f3873f4fdfa647a184fcfb3179c2ead4', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('5c9cfa1bb2f64a2694c7c00d3648c71f', 'e4ce4048d2ef410cbfa5d163f70d0828', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('5ff0a5bb27a7487dacbf849eeafccbd6', '58826377e2e9409c97991002d1715b3b', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('636a9bdc5df04d7f81092e5131a19851', 'a2770f7e7d444e66801e516b6e7f3380', '9b81f7705dd742cc9a0a95c240e9bc2e', null, null, null, '2021-02-08 11:33:17', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('644705f2a1554a8393cfe73f59730df0', 'fdfa47956dc44fc695ddbfe160c8056b', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:33:18', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('72cc88c9db2d4c4ebe8eb8e633ab0785', 'eb542bd20a9347b5b84334b06ac3d202', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('86a2614dd34144988d86661aaed05151', 'f415afb12bc1483f8073ac156efad495', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('86c9e0d31d4646de8093e6070f87902f', '61d45f1612e349c291fb0b077f8e64a3', '7dccdb7a6ea3449896ddca9f19ae1ec3', null, null, null, '2021-02-19 17:42:44', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('8d91a5167cac424ca315faa4d5cd0cf5', 'f1f96955b8924592b48a8a129f19a665', 'ca73f4bdcc5f4c179a2e06c75fa3b913', null, null, null, '2021-02-08 11:33:18', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('9287013bd7bc4890b6b002de4b62e203', '6c27684e964e4655a67e9e13da111ca7', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('9423378647784767b6642023d929fd2a', '5cd3be37421b41ebb1a157928c0d739c', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('96882ed0151b4c4ab226f2d01798353e', '9bf8c01780fe4588bbddde33538a09be', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('97a667638cef41eb86cf2cbea2c01eb0', '9547f0e122b545f8a18e3ac4168fac18', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('9a3f7c9a9ecb4e6f98c3495a368b82ab', '36a47c4281ff4a5e8ce5fc986e1004fd', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('9b7fa0680f2042ea97ca76108de6134b', '4d7f3cf75ed5437b861ae53e6a2337ef', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('9bd9e7fc77f5472cb2e48650c545c17a', '5a83bdc7126f4c07b8e900e1f9e283aa', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('a3aecfaaa4d24e648c70e05b40e22eea', '2938bae9562648a9a9fa7d21c2cfa266', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:33:19', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('a725c8a734bd4aed9424e3d65fea7709', '249714623b1340a9911554ced2361a92', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('a9693219baee446bb8460bb7d30b6107', 'de52fe14989c426ab85d3d7c4f27f89a', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('ac045859895b4d34870211ad64a61ff5', '01d21f675402476db750a52845277f29', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('ae6f76b15d604313bbaba55552a6a2f5', '955721f7a7aa47ea8cc99d6e303c8927', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('af776bf916054bc69b9ef0c863481a3f', '119b7402e4a64a23b2743a3829abc0a7', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('b1e8fab9fa7f4f52841dd94d2899f4a0', '21a0aec2b5034aec9cf331d0bbdd6211', '1e2c8ce7a5624b449f3c9224b48e4edf', null, null, null, '2021-02-08 11:33:25', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('b274aaac4d984f1cbde3dfb30f0ad972', '41e9b28b8e3d496b94164fb225e3a1cb', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('b85f5ebb84244c92b8883ba7a141c72c', 'e69b3f67c8684a9bb5b1599244d8bd00', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:36:21', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('bb602bad734b4329ae250814ebf9dfeb', '3c0a4752a5b040e596ff7568c12f6a96', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('bdfba30ae1124427a196bce34b61c4c1', '48423f1803b14bc6869644db3c5e1e9b', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('c0dd778e9c724d359a4cd0958f565d16', 'dc22fe6462a64419814bffde58472e45', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('c10c86d39d0f45e884d10ecf82aefe72', 'd40ed73b16fc4d2093224b0b154819b4', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('ca6d4121d9eb424a9e8490575b7197c0', 'eaedb743d2a643ee97cb6907d6201501', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('d7bd9084bd864b55bbc5dd011627d57a', 'a4ba63dc39a84be9b454456181dc5960', '1b557916196148e58de9342d3b1997c1', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('db3cda8cdbc347f7beeadb430d3de6bd', '5e32bd7dc0b84f9da9ddbc9e44c940b8', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:30', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('dc5fbb04aaad44ad82cda1057aa8a83f', '3202355e72de4f29b557628889c6a688', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:34:10', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('e7b0a7743c304f3d866a6d8c239baa3c', '2195e0b0b7684205b93f052d3f8f9487', '6dc8297a72954c6bbca5514cd2b3c236', null, null, null, '2021-02-19 17:33:51', null, '0');
INSERT INTO `exam_teac_inv_room_middle` VALUES ('ec7dba87de104c4a99b8f2e7d47b71ec', '4d54e93f8fe1437989c27f6ad4d2ff01', '84dcedf7eef54778ae3f82fc60a11a31', null, null, null, '2021-02-19 17:36:21', null, '0');

-- ----------------------------
-- Table structure for grade_team
-- ----------------------------
DROP TABLE IF EXISTS `grade_team`;
CREATE TABLE `grade_team` (
  `id` varchar(32) NOT NULL,
  `g_no` int(16) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `grade_type` int(4) DEFAULT NULL COMMENT '年级类型（1初中 2高中）',
  `grade_master_id` varchar(32) DEFAULT NULL COMMENT '年级主任id',
  `grade_master_name` varchar(64) DEFAULT NULL,
  `enter_study_time` varchar(64) DEFAULT NULL COMMENT '入学时间',
  `end_study_time` varchar(64) DEFAULT NULL COMMENT '毕业时间',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade_team
-- ----------------------------
INSERT INTO `grade_team` VALUES ('1', '101', '初一年级', '1', '1', '徐老师', '2020-9-1', '2022-7-1', null, null, null, '2021-01-06 13:02:46', null, '0');
INSERT INTO `grade_team` VALUES ('145ad2325c6a4743b187487dd548d714', '12005', 'test3', '2', '97566f3ad52b4cdfa3672d43b8212aeb', 'bbb', '2017-09-09', '2021-07-07', null, null, null, '2021-01-09 12:57:22', 'del test', '1');
INSERT INTO `grade_team` VALUES ('215eb2b905d04965b2d24a6df8d21a6d', '122003', 'test2', '2', '4e77eda800b8443c9dee62508bffb1cb', 'aaa', '2017-09-01', '2021-07-01', null, null, null, '2021-01-09 12:59:01', 'del test', '1');
INSERT INTO `grade_team` VALUES ('3b1f2890f31e4c79bafef14b1b48dc39', '122002', 'test', '2', '2', '曹老师', '2017-09-01', '2021-07-01', null, null, null, '2021-01-05 12:22:48', 'add grade test', '0');
INSERT INTO `grade_team` VALUES ('6b87678c498d46738bb0e8770d15a000', '401203', 'latest', '2', '4e77eda800b8443c9dee62508bffb1cb', 'aaa', '2014-09-01', '2017-07-01', null, null, null, '2021-01-11 14:37:11', 'latest test', '0');
INSERT INTO `grade_team` VALUES ('978a23ac412b41289db167670b3b1ca5', '12004', 'test3', '2', '97566f3ad52b4cdfa3672d43b8212aeb', 'bbb', '2017-09-09', '2021-07-07', null, null, null, '2021-01-09 12:57:28', 'del test', '1');
INSERT INTO `grade_team` VALUES ('bcca9d2061724705ad257df89ffb662b', '401203', 'del test', '2', '4e77eda800b8443c9dee62508bffb1cb', 'aaa', '2017-09-01', '2021-07-01', null, null, null, '2021-01-09 14:33:26', 'del test with no has been update', '1');
INSERT INTO `grade_team` VALUES ('fe08500b94c34ae88523349ddc9f80b7', '4012003', 'del test', '2', '4e77eda800b8443c9dee62508bffb1cb', 'aaa', '2017-09-01', '2021-07-07', null, null, null, '2021-01-09 13:08:59', 'del test with no has been update', '1');

-- ----------------------------
-- Table structure for health_daily
-- ----------------------------
DROP TABLE IF EXISTS `health_daily`;
CREATE TABLE `health_daily` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL COMMENT '健康日报 代码编号',
  `member_id` varchar(32) DEFAULT NULL,
  `member_type` int(4) DEFAULT NULL,
  `health_status` tinyint(1) DEFAULT '0' COMMENT '健康状态（0健康 1不健康）',
  `symptoms` varchar(255) DEFAULT NULL COMMENT '症状描述',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of health_daily
-- ----------------------------

-- ----------------------------
-- Table structure for lg_permission
-- ----------------------------
DROP TABLE IF EXISTS `lg_permission`;
CREATE TABLE `lg_permission` (
  `id` varchar(32) NOT NULL,
  `permission_name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT 'role表外键',
  `permission_type` int(4) DEFAULT '0' COMMENT '权限种类(0一般权限 1特有权限)',
  `url` varchar(128) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_name` (`permission_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_permission
-- ----------------------------
INSERT INTO `lg_permission` VALUES ('1', '基本操作', '测试权限', '0', null, null, null, null, '2021-02-23 17:36:35', null, '0');
INSERT INTO `lg_permission` VALUES ('2', 'test1', '测试权限', '0', null, null, null, null, '2021-02-23 17:36:36', null, '0');
INSERT INTO `lg_permission` VALUES ('3', 'test2', '测试权限', '0', null, null, null, null, '2021-02-23 17:36:42', null, '0');

-- ----------------------------
-- Table structure for lg_role
-- ----------------------------
DROP TABLE IF EXISTS `lg_role`;
CREATE TABLE `lg_role` (
  `id` varchar(32) NOT NULL,
  `role_name` varchar(64) DEFAULT NULL,
  `role_type` int(4) DEFAULT '1' COMMENT '角色种类（0管理类角色 1成员角色 ）',
  `description` varchar(255) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_role
-- ----------------------------
INSERT INTO `lg_role` VALUES ('1', 'student', '1', '学生', null, null, null, '2021-02-23 17:33:20', null, '0');
INSERT INTO `lg_role` VALUES ('2', 'teacher', '1', '教师', null, null, null, '2021-02-23 17:33:31', null, '0');
INSERT INTO `lg_role` VALUES ('3', 'admin', '1', '管理员', null, null, null, '2021-02-23 17:33:44', null, '0');

-- ----------------------------
-- Table structure for lg_role_permission_middle
-- ----------------------------
DROP TABLE IF EXISTS `lg_role_permission_middle`;
CREATE TABLE `lg_role_permission_middle` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `permission_id` varchar(32) NOT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_role_permission_middle
-- ----------------------------
INSERT INTO `lg_role_permission_middle` VALUES ('1', '1', '1', null, null, null, '2021-02-23 17:37:23', null, '0');
INSERT INTO `lg_role_permission_middle` VALUES ('2', '2', '1', null, null, null, '2021-02-23 17:37:37', null, '0');
INSERT INTO `lg_role_permission_middle` VALUES ('3', '2', '2', null, null, null, '2021-02-23 17:37:42', null, '0');
INSERT INTO `lg_role_permission_middle` VALUES ('4', '3', '1', null, null, null, '2021-02-23 17:37:48', null, '0');
INSERT INTO `lg_role_permission_middle` VALUES ('5', '3', '2', null, null, null, '2021-02-23 17:38:00', null, '0');
INSERT INTO `lg_role_permission_middle` VALUES ('6', '3', '3', null, null, null, '2021-02-23 17:38:05', null, '0');

-- ----------------------------
-- Table structure for lg_user
-- ----------------------------
DROP TABLE IF EXISTS `lg_user`;
CREATE TABLE `lg_user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `password_salt` varchar(128) DEFAULT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `member_type` int(4) DEFAULT NULL,
  `phonenum` varchar(64) DEFAULT NULL,
  `vxnum` varchar(64) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `last_modify_user` varchar(32) DEFAULT NULL,
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_user
-- ----------------------------
INSERT INTO `lg_user` VALUES ('1', 'admin', '111', null, null, '4', null, null, null, null, null, '2021-02-23 17:32:16', null, '0');
INSERT INTO `lg_user` VALUES ('2', 'teacher', '111', null, null, '1', null, null, null, null, null, '2021-02-23 17:41:17', null, '0');
INSERT INTO `lg_user` VALUES ('3', 'student', '111', null, null, '2', null, null, null, null, null, '2021-02-23 17:34:52', null, '0');
INSERT INTO `lg_user` VALUES ('39dce15f9242412cb37b88e8db4f7f96', 'aiywh3', '7482b6e0fff1be7c7d5def4ea11a9c78', '2e20a6eef4fb3a27f7f6a867132c5193', 'admin', '4', null, null, 'testAdmin', null, 'testAdmin', '2021-02-24 15:30:34', null, '0');
INSERT INTO `lg_user` VALUES ('79c0da773d7a4c54a8f13e9192abb792', 'updatetest', 'ad349f15de528b373f68a5ee3200eef7', 'bae356bfb231899a81e694e405e6eee8', '067b911002814f7699b43252fc2cc6c2', '0', null, null, 'aiywh3', null, 'aiywh3', '2021-02-25 11:14:15', null, '0');

-- ----------------------------
-- Table structure for lg_user_role_middle
-- ----------------------------
DROP TABLE IF EXISTS `lg_user_role_middle`;
CREATE TABLE `lg_user_role_middle` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_user_role_middle
-- ----------------------------
INSERT INTO `lg_user_role_middle` VALUES ('1', '3', '1', null, null, null, '2021-02-23 17:34:07', null, '0');
INSERT INTO `lg_user_role_middle` VALUES ('128669412d5d40ae96058c7b85d022c0', '1', '79c0da773d7a4c54a8f13e9192abb792', null, null, null, '2021-02-25 10:54:41', null, '0');
INSERT INTO `lg_user_role_middle` VALUES ('2', '2', '2', null, null, null, '2021-02-23 17:34:09', null, '0');
INSERT INTO `lg_user_role_middle` VALUES ('3', '1', '3', null, null, null, '2021-02-23 17:40:46', null, '0');
INSERT INTO `lg_user_role_middle` VALUES ('db0ed9b492114a1e93e133770cf5a364', '3', '39dce15f9242412cb37b88e8db4f7f96', null, null, null, '2021-02-24 15:30:36', null, '0');

-- ----------------------------
-- Table structure for m
-- ----------------------------
DROP TABLE IF EXISTS `m`;
CREATE TABLE `m` (
  `id` varchar(32) NOT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m
-- ----------------------------

-- ----------------------------
-- Table structure for pro_change_teacher
-- ----------------------------
DROP TABLE IF EXISTS `pro_change_teacher`;
CREATE TABLE `pro_change_teacher` (
  `id` varchar(32) NOT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '更换授课教师、班主任',
  `new_teacher_id` varchar(32) DEFAULT NULL,
  `old_teacher_id` varchar(32) DEFAULT NULL,
  `course_id` varchar(32) DEFAULT NULL,
  `clazz_id` varchar(32) DEFAULT NULL,
  `applicant_id` varchar(32) DEFAULT NULL COMMENT '申请人id',
  `applicant_type` int(4) DEFAULT NULL COMMENT '申请人类型',
  `approval_by_id` varchar(32) DEFAULT NULL COMMENT '审批人id',
  `approval_by_type` int(4) DEFAULT NULL COMMENT '审批人类型',
  `launch_date` varchar(64) DEFAULT NULL,
  `dead_date` varchar(64) DEFAULT NULL,
  `pro_state` int(1) DEFAULT NULL,
  `opinion` int(1) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_change_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for pro_leave
-- ----------------------------
DROP TABLE IF EXISTS `pro_leave`;
CREATE TABLE `pro_leave` (
  `id` varchar(32) NOT NULL,
  `leave_type` int(1) DEFAULT NULL,
  `leave_reason` varchar(255) DEFAULT NULL,
  `leave_begin_date` varchar(64) DEFAULT NULL,
  `leave_end_date` varchar(64) DEFAULT NULL,
  `applicant_id` varchar(32) DEFAULT NULL,
  `applicant_type` int(4) DEFAULT NULL,
  `approval_by_id` varchar(32) DEFAULT NULL,
  `approval_by_type` int(4) DEFAULT NULL,
  `launch_date` varchar(64) DEFAULT NULL,
  `dead_date` varchar(64) DEFAULT NULL,
  `pro_state` int(1) DEFAULT NULL,
  `opinion` int(1) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_leave
-- ----------------------------

-- ----------------------------
-- Table structure for pro_make_risk
-- ----------------------------
DROP TABLE IF EXISTS `pro_make_risk`;
CREATE TABLE `pro_make_risk` (
  `id` varchar(32) NOT NULL,
  `level` int(1) DEFAULT NULL COMMENT '风险/危险 级别',
  `source_member_id` varchar(32) DEFAULT NULL COMMENT '风险危险源 id',
  `source_member_type` int(4) DEFAULT NULL COMMENT '风险/危险源类型',
  `confirm_tag` tinyint(1) DEFAULT NULL COMMENT '风险/危险确认id',
  `description` varchar(255) DEFAULT NULL COMMENT '风险/危险 描述',
  `danger_tag` tinyint(1) DEFAULT NULL COMMENT '0危险 1风险',
  `upgrade_tag` tinyint(1) DEFAULT NULL COMMENT '风险上升为危险（0是 1不是）',
  `applicant_id` varchar(32) DEFAULT NULL COMMENT '申请人id',
  `applicant_type` int(4) DEFAULT NULL COMMENT '申请人类型',
  `approval_by_id` varchar(32) DEFAULT NULL COMMENT '审批人id',
  `approval_by_type` int(4) DEFAULT NULL COMMENT '审批人类型',
  `launch_date` varchar(64) DEFAULT NULL,
  `dead_date` varchar(64) DEFAULT NULL,
  `pro_state` int(1) DEFAULT NULL,
  `opinion` int(1) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_make_risk
-- ----------------------------

-- ----------------------------
-- Table structure for pro_rent_exam_room
-- ----------------------------
DROP TABLE IF EXISTS `pro_rent_exam_room`;
CREATE TABLE `pro_rent_exam_room` (
  `id` varchar(32) NOT NULL,
  `rent_remark` varchar(255) DEFAULT '' COMMENT '租用说明',
  `applicant_id` varchar(32) DEFAULT NULL,
  `applicant_type` int(4) DEFAULT NULL COMMENT '申请人类型',
  `approval_by_id` varchar(32) DEFAULT NULL,
  `approval_by_type` int(4) DEFAULT NULL,
  `launch_date` varchar(64) DEFAULT NULL,
  `dead_date` varchar(64) DEFAULT NULL,
  `pro_state` int(1) DEFAULT NULL,
  `opinion` int(1) DEFAULT '0' COMMENT '0不同意 1同意',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_rent_exam_room
-- ----------------------------

-- ----------------------------
-- Table structure for pro_reward_punishment
-- ----------------------------
DROP TABLE IF EXISTS `pro_reward_punishment`;
CREATE TABLE `pro_reward_punishment` (
  `id` varchar(32) NOT NULL,
  `repu_type` tinyint(1) DEFAULT NULL COMMENT '更换授课教师、班主任',
  `repu_member_id` varchar(32) DEFAULT NULL,
  `repu_member_type` int(4) DEFAULT NULL,
  `repu_level` int(1) DEFAULT NULL,
  `repu_reason` varchar(255) DEFAULT NULL,
  `applicant_id` varchar(32) DEFAULT NULL COMMENT '申请人id',
  `applicant_type` int(4) DEFAULT NULL COMMENT '申请人类型',
  `approval_by_id` varchar(32) DEFAULT NULL COMMENT '审批人id',
  `approval_by_type` int(4) DEFAULT NULL COMMENT '审批人类型',
  `launch_date` varchar(64) DEFAULT NULL,
  `dead_date` varchar(64) DEFAULT NULL,
  `pro_state` int(1) DEFAULT NULL,
  `opinion` int(1) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_reward_punishment
-- ----------------------------

-- ----------------------------
-- Table structure for pro_update_score
-- ----------------------------
DROP TABLE IF EXISTS `pro_update_score`;
CREATE TABLE `pro_update_score` (
  `id` varchar(32) NOT NULL,
  `student_id` varchar(32) DEFAULT NULL COMMENT '修改成绩的学生',
  `course_id` varchar(32) DEFAULT NULL COMMENT '修改的成绩所关联的课程',
  `exam_score_id` varchar(32) DEFAULT NULL COMMENT '考试分数单id',
  `reason` varchar(255) DEFAULT NULL COMMENT '修改成绩原因',
  `applicant_id` varchar(32) DEFAULT NULL COMMENT '申请人id',
  `applicant_type` int(4) DEFAULT NULL COMMENT '申请人类型',
  `approval_by_id` varchar(32) DEFAULT NULL COMMENT '审批人id',
  `approval_by_type` int(4) DEFAULT NULL COMMENT '审批人类型',
  `launch_date` varchar(64) DEFAULT NULL,
  `dead_date` varchar(64) DEFAULT NULL,
  `pro_state` int(1) DEFAULT NULL,
  `opinion` int(1) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_update_score
-- ----------------------------

-- ----------------------------
-- Table structure for reward_punishment
-- ----------------------------
DROP TABLE IF EXISTS `reward_punishment`;
CREATE TABLE `reward_punishment` (
  `id` varchar(32) NOT NULL,
  `level` int(4) DEFAULT NULL COMMENT '奖励/惩罚 等级',
  `name` varchar(64) DEFAULT NULL COMMENT '奖励/惩罚 名称',
  `reason` varchar(255) DEFAULT NULL COMMENT '获得奖励/惩罚的缘由',
  `repu_type` tinyint(1) DEFAULT '0' COMMENT '0奖励 1惩罚',
  `obj_id` varchar(32) DEFAULT NULL COMMENT '获得奖励/惩罚的对象的id',
  `obj_type` int(4) DEFAULT NULL COMMENT '获得奖励/惩罚的对象的类型（学生、教师、班级、年级）',
  `date` varchar(32) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reward_punishment
-- ----------------------------

-- ----------------------------
-- Table structure for risk_danger
-- ----------------------------
DROP TABLE IF EXISTS `risk_danger`;
CREATE TABLE `risk_danger` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL COMMENT '风险危险 代码编号',
  `description` varchar(255) DEFAULT NULL COMMENT '风险危险 描述',
  `member_type` int(4) DEFAULT NULL COMMENT '风险危险源 id',
  `member_id` varchar(32) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '风险/危险 等级',
  `name` varchar(64) DEFAULT NULL COMMENT '风险/危险 名称',
  `begin_date` varchar(64) DEFAULT NULL COMMENT '风险/危险 产生日期',
  `solve_date` varchar(64) DEFAULT NULL COMMENT '危险/隐患 消除的日期时间',
  `solved_tag` tinyint(1) DEFAULT NULL COMMENT '已解决标签（0未解决 1已解决）',
  `upgrade_tag` tinyint(1) DEFAULT NULL COMMENT '由风险升级为危险的标签 （0是 1不是）',
  `danger_tag` tinyint(1) DEFAULT NULL COMMENT '是风险/危险的标签（0风险 1危险）',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of risk_danger
-- ----------------------------

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `id` varchar(32) NOT NULL,
  `value` int(8) DEFAULT NULL COMMENT '学期数（从系统启用的学期开始1，2，3......）',
  `name` varchar(64) DEFAULT NULL COMMENT '该学期的名称',
  `begin_time` varchar(64) DEFAULT NULL,
  `over_time` varchar(64) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES ('1', '1', '2020下半学期', '2020-09-01', '2021-01-15', null, null, null, '2021-01-13 21:14:32', null, '0');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '学生姓名',
  `sex` int(1) DEFAULT NULL COMMENT '性别（男0 女1）',
  `birthday` varchar(32) DEFAULT NULL,
  `member_type` int(4) DEFAULT NULL COMMENT '对象类型（学生0、教师1）',
  `resp_type` int(4) DEFAULT NULL COMMENT '职责类型（暂无null）',
  `s_no` int(16) DEFAULT NULL COMMENT '学号',
  `clazz_master_id` varchar(32) DEFAULT NULL COMMENT '班主任id',
  `clazz_id` varchar(32) DEFAULT NULL COMMENT '班级id',
  `father_name` varchar(64) DEFAULT NULL,
  `father_phone` varchar(64) DEFAULT NULL,
  `mother_name` varchar(64) DEFAULT NULL,
  `mother_phone` varchar(64) DEFAULT NULL,
  `em_contact_name` varchar(64) DEFAULT NULL COMMENT '紧急联系人姓名',
  `em_contact_phone` varchar(64) DEFAULT NULL COMMENT '紧急联系人电话',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('002131ace3ed4ab783d0ce05315c1498', 'test117', '0', '1999-10-06', '0', null, '130303010', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather117', '11111111111', 'tmother117', '11111111111', 'emcontect117', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('003efd34442c4bd0a44c2b2f46d2a824', 'test98', '0', '1999-09-17', '0', null, '13030235', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather98', '11111111111', 'tmother98', '11111111111', 'emcontect98', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('008fcf303c9149309b7d5ce262a1506a', 'test13', '0', '1999-06-24', '0', null, '130301013', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather13', '11111111111', 'tmother13', '11111111111', 'emcontect13', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('018955c13c2e4a5f81ac36fb14aedf11', 'test131', '0', '1999-10-20', '0', null, '13030324', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather131', '11111111111', 'tmother131', '11111111111', 'emcontect131', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('061a9a15508f4fe08313fab5ad5402b3', 'dt1', '0', '2014-01-23', '0', null, '13030101', null, null, 'dtf', '11111111111', 'dtm', '11111111111', 'dtc', '11111111111', null, null, null, '2021-01-09 14:33:26', 'grade del test', '0');
INSERT INTO `student` VALUES ('067b911002814f7699b43252fc2cc6c2', 'test17', '0', '1999-06-28', '0', null, '130301017', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather17', '11111111111', 'tmother17', '11111111111', 'emcontect17', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('0937638060224bc896300915f62333a3', 'test83', '0', '1999-09-02', '0', null, '13030220', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather83', '11111111111', 'tmother83', '11111111111', 'emcontect83', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('09a6552f83d341059f79642860301b84', 'ywh22', '0', '2014-01-08', '0', null, '100100029', '2', '1', 'ff', '18608336957', 'mm', '18608336957', 'co', '18608336957', null, null, null, '2021-01-06 22:55:51', 'add test', '0');
INSERT INTO `student` VALUES ('0ad54e0920dd44eeac16a881b0b2c4e6', 'test88', '0', '1999-09-07', '0', null, '13030225', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather88', '11111111111', 'tmother88', '11111111111', 'emcontect88', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('0d4cdbe50fb647d2820ef80fc40f579d', 'qqa', '0', '1999-06-20', '0', null, '100100027', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('1', '小明', '0', '2006-10-16', '0', null, '111', '2', '1', '小明爸爸', '123456', '小明妈妈', '123456', '小明爸爸', '123456', null, null, null, '2020-12-26 12:21:13', null, '0');
INSERT INTO `student` VALUES ('1165366fa9d7431da3138499da2ff57a', 'sst', '1', '1999-06-17', '0', null, '100100024', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('1243d3d8468c4df0ba0e08fbea1d0773', 'test36', '0', '1999-07-17', '0', null, '13030136', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather36', '11111111111', 'tmother36', '11111111111', 'emcontect36', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('130436ff980b43f48c5e5e71990bba89', 'ttd', '0', '1999-06-18', '0', null, '100100025', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('1464c93f55a743068e046d4c1c66209e', 'test6', '0', '1999-06-17', '0', null, '13030106', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather6', '11111111111', 'tmother6', '11111111111', 'emcontect6', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('1534c31518094b43ac31a346e8f68a2e', 'test19', '0', '1999-06-30', '0', null, '130301019', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather19', '11111111111', 'tmother19', '11111111111', 'emcontect19', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('168a13c8b86a4bea9c54771b1252c07d', 'test29', '0', '1999-07-10', '0', null, '13030129', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather29', '11111111111', 'tmother29', '11111111111', 'emcontect29', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('16d8ee1748e9458aa7d6c3021ac24841', 'test129', '0', '1999-10-18', '0', null, '13030322', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather129', '11111111111', 'tmother129', '11111111111', 'emcontect129', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('17328ba59fbb4ad582127cdc36ad4fd1', 'test70', '0', '1999-08-20', '0', null, '13030207', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather70', '11111111111', 'tmother70', '11111111111', 'emcontect70', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('184447334a7c47b2902fc17d1c10693d', 'test46', '0', '1999-07-27', '0', null, '13030146', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather46', '11111111111', 'tmother46', '11111111111', 'emcontect46', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('18f01da2cca74a30bda656cc8a2ebf76', 'efe', '1', '1999-06-15', '0', null, '100100022', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('191f0c5cdc194e06964437dc01921c19', 'test63', '0', '1999-08-13', '0', null, '13030163', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather63', '11111111111', 'tmother63', '11111111111', 'emcontect63', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('1c6f0a600e0b41ecb7b9264d799e9b65', 'test106', '0', '1999-09-25', '0', null, '13030243', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather106', '11111111111', 'tmother106', '11111111111', 'emcontect106', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('1d21d74eeeba4b9a8db020aeacbd5488', 'test68', '0', '1999-08-18', '0', null, '13030205', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather68', '11111111111', 'tmother68', '11111111111', 'emcontect68', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('1eb6b370f3064211ba74c242c809182c', 'test31', '0', '1999-07-12', '0', null, '13030131', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather31', '11111111111', 'tmother31', '11111111111', 'emcontect31', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('1efae5dcc593473993cda08d2f5b5b1b', 'test87', '0', '1999-09-06', '0', null, '13030224', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather87', '11111111111', 'tmother87', '11111111111', 'emcontect87', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('2', '小红xax', '1', '2020-12-22', '0', null, '222', '2', '1', '小红爸爸', '123456', '小红妈妈', '123456', '小红妈妈', '123456', null, null, null, '2020-12-28 22:02:22', 'asd', '0');
INSERT INTO `student` VALUES ('21cb3e4980ea4ebdbb7adaeea9f7b31d', 'test58', '0', '1999-08-08', '0', null, '13030158', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather58', '11111111111', 'tmother58', '11111111111', 'emcontect58', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('21d3cd96079c4341befabd2439452424', 'test91', '0', '1999-09-10', '0', null, '13030228', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather91', '11111111111', 'tmother91', '11111111111', 'emcontect91', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('227e58cc37314f2bbc40a6f15e326f42', 'test114', '0', '1999-10-03', '0', null, '13030307', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather114', '11111111111', 'tmother114', '11111111111', 'emcontect114', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('261f4e4bf68142af98b25fa386a6b8d9', 'test60', '0', '1999-08-10', '0', null, '13030160', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather60', '11111111111', 'tmother60', '11111111111', 'emcontect60', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('27bf23698e534d7a92d8f975e9c4be0c', 'qqa', '0', '1999-06-20', '0', null, '100100018', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('28d6222345314d328ab47a14befa534d', 'test135', '0', '1999-10-24', '0', null, '13030328', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather135', '11111111111', 'tmother135', '11111111111', 'emcontect135', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('2aae62dd246949a6b5e96222ab2aea7a', 'test48', '0', '1999-07-29', '0', null, '13030148', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather48', '11111111111', 'tmother48', '11111111111', 'emcontect48', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('2e7dd8ca30ac4de28e6c4b65dea31383', 'test76', '0', '1999-08-26', '0', null, '130302013', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather76', '11111111111', 'tmother76', '11111111111', 'emcontect76', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('2f66245e79df4d8db789d32ac27bfc66', 'test64', '0', '1999-08-14', '0', null, '13030201', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather64', '11111111111', 'tmother64', '11111111111', 'emcontect64', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('318c4a73100b4211874b1af5deb886c0', 'test7', '0', '1999-06-18', '0', null, '13030107', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather7', '11111111111', 'tmother7', '11111111111', 'emcontect7', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('31f2e1fc91cb4d9a96e1970e88922a9b', 'dt2', '1', '2012-11-07', '0', null, '13030102', null, null, 'dtf', '11111111111', 'dtm', '11111111111', 'dtc', '11111111111', null, null, null, '2021-01-09 14:33:26', 'grade del test', '0');
INSERT INTO `student` VALUES ('3266359662a64b3ca166c342051d1054', 'test90', '0', '1999-09-09', '0', null, '13030227', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather90', '11111111111', 'tmother90', '11111111111', 'emcontect90', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('34c9ab680b514419a3fa75fc93627612', 'test22', '0', '1999-07-03', '0', null, '13030122', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather22', '11111111111', 'tmother22', '11111111111', 'emcontect22', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('354df825e13c4bffaa158fc9ebf613d6', 'ccd', '0', '1999-06-14', '0', null, '100100012', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('388a432e9b834aee9212fa9361385bf4', 'llk', '1', '1999-06-19', '0', null, '100100017', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('3b4cd7a0b7f842f4b0c774e2f68ed216', 'test27', '0', '1999-07-08', '0', null, '13030127', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather27', '11111111111', 'tmother27', '11111111111', 'emcontect27', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('419cf7b8166f4cc0a8ddbe440d966887', 'test26', '0', '1999-07-07', '0', null, '13030126', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather26', '11111111111', 'tmother26', '11111111111', 'emcontect26', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('42c63b8b28ba4621bca3750bda3b1250', 'test15', '0', '1999-06-26', '0', null, '130301015', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather15', '11111111111', 'tmother15', '11111111111', 'emcontect15', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('42c6890323b141269f69794ef648f09b', 'test113', '0', '1999-10-02', '0', null, '13030306', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather113', '11111111111', 'tmother113', '11111111111', 'emcontect113', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('43b97b23719c45659641e9b576974ad8', 'test47', '0', '1999-07-28', '0', null, '13030147', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather47', '11111111111', 'tmother47', '11111111111', 'emcontect47', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('44771dcd0e2b4dbd8f0c5b5260c07fb7', 'test20', '0', '1999-07-01', '0', null, '13030120', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather20', '11111111111', 'tmother20', '11111111111', 'emcontect20', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('49903a2ef431451fb25324cac2200975', 'test41', '0', '1999-07-22', '0', null, '13030141', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather41', '11111111111', 'tmother41', '11111111111', 'emcontect41', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('4e95a61c8a254a419a157f9f1939f74e', 'efe', '1', '1999-06-15', '0', null, '100100013', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('4ee60d3d692e4e63b1b07e23da64de53', 'test137', '0', '1999-10-26', '0', null, '13030330', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather137', '11111111111', 'tmother137', '11111111111', 'emcontect137', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('50d8c71602704ac8ade2451474f3d562', 'asd', '0', '2020-12-16', '0', null, '10010003', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 00:30:15', 'asd', '1');
INSERT INTO `student` VALUES ('52834616b6cf42a9bc89e6b0f8d7c637', 'test73', '0', '1999-08-23', '0', null, '130302010', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather73', '11111111111', 'tmother73', '11111111111', 'emcontect73', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('5456dff05b5e4cef87b188b2181732f4', 'test52', '0', '1999-08-02', '0', null, '13030152', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather52', '11111111111', 'tmother52', '11111111111', 'emcontect52', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('55c3283ea8a74bd88a7df77542b9c841', 'test62', '0', '1999-08-12', '0', null, '13030162', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather62', '11111111111', 'tmother62', '11111111111', 'emcontect62', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('591d71d24a2a45c281c34053671431ef', 'bb', '0', '2020-12-08', '0', null, '10010004', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 13:18:40', 'bb', '0');
INSERT INTO `student` VALUES ('5ac0d7201e44490c9f38b715ff5a402f', 'test8', '0', '1999-06-19', '0', null, '13030108', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather8', '11111111111', 'tmother8', '11111111111', 'emcontect8', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('5db148e31a5e46af8fd3e5638927fe44', 'test1', '0', '1999-06-12', '0', null, '13030101', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather1', '11111111111', 'tmother1', '11111111111', 'emcontect1', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('5e1cab1c7a7a4ded8864d2f695bfc947', 'test94', '0', '1999-09-13', '0', null, '13030231', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather94', '11111111111', 'tmother94', '11111111111', 'emcontect94', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('5ecf86edb041416e9595ed4809fb341c', 'test75', '0', '1999-08-25', '0', null, '130302012', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather75', '11111111111', 'tmother75', '11111111111', 'emcontect75', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('61dc4fb2cc364b2b99be8ce7208eb9e7', 'test45', '0', '1999-07-26', '0', null, '13030145', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather45', '11111111111', 'tmother45', '11111111111', 'emcontect45', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('621549f452be4dbca7a8f19f26527ec7', 'test118', '0', '1999-10-07', '0', null, '130303011', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather118', '11111111111', 'tmother118', '11111111111', 'emcontect118', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('627907f78d684a5f8f045ac504dc8a86', 'test23', '0', '1999-07-04', '0', null, '13030123', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather23', '11111111111', 'tmother23', '11111111111', 'emcontect23', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('62a88df6f6664a5fadfec63cf61a7c0e', 'test95', '0', '1999-09-14', '0', null, '13030232', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather95', '11111111111', 'tmother95', '11111111111', 'emcontect95', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('6338998db7574cbfaf07ab844a2485c1', 'test44', '0', '1999-07-25', '0', null, '13030144', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather44', '11111111111', 'tmother44', '11111111111', 'emcontect44', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('63b5d37b531f4a4c81f8d2461e329db5', 'test123', '0', '1999-10-12', '0', null, '130303016', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather123', '11111111111', 'tmother123', '11111111111', 'emcontect123', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('6589d49ae2354aa7829ddfa4d31f5c8f', 'test16', '0', '1999-06-27', '0', null, '130301016', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather16', '11111111111', 'tmother16', '11111111111', 'emcontect16', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('67951847346548c8bfa824da58ef1b03', 'test110', '0', '1999-09-29', '0', null, '13030303', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather110', '11111111111', 'tmother110', '11111111111', 'emcontect110', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('6a7cd1e508344d2280c51d655229a31b', 'cc', '0', '2020-12-08', '0', null, '10010005', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 13:18:49', 'cc', '0');
INSERT INTO `student` VALUES ('6c6a4906b91b43e5a1055b27ce6d72c6', 'test92', '0', '1999-09-11', '0', null, '13030229', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather92', '11111111111', 'tmother92', '11111111111', 'emcontect92', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('6c73aedfef4c44d5acab69701b918d0d', 'hh', '0', '2020-12-17', '0', null, '10010009', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 13:38:56', 'hh', '0');
INSERT INTO `student` VALUES ('6edc5d22d47c45aebb8038008db05fd6', 'test14', '0', '1999-06-25', '0', null, '130301014', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather14', '11111111111', 'tmother14', '11111111111', 'emcontect14', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('6f71b197795a4955971d3556b8b42121', 'test9', '0', '1999-06-20', '0', null, '13030109', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather9', '11111111111', 'tmother9', '11111111111', 'emcontect9', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('6fb27aac21e044cbbb695a98d0ea6e7b', 'test55', '0', '1999-08-05', '0', null, '13030155', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather55', '11111111111', 'tmother55', '11111111111', 'emcontect55', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('6fe76e4f215b444fb58d5df0e1e7f782', 'test77', '0', '1999-08-27', '0', null, '130302014', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather77', '11111111111', 'tmother77', '11111111111', 'emcontect77', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('70e472974ec34c70ade441b82470400f', 'ASQS', '0', '2020-12-16', '0', null, '10010003', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 00:48:33', 'asdw', '1');
INSERT INTO `student` VALUES ('73b30eb70882408c8ea21415fc2e7840', 'test78', '0', '1999-08-28', '0', null, '130302015', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather78', '11111111111', 'tmother78', '11111111111', 'emcontect78', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('754c2ea5945a4712a68ed34b41168497', 'aad', '0', '1999-06-12', '0', null, '100100019', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('76283fe30a01471a973e5201d04bba0b', 'test10', '0', '1999-06-21', '0', null, '130301010', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather10', '11111111111', 'tmother10', '11111111111', 'emcontect10', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('774bdafc43ec4ac089597b2cd1a9c5e2', 'test25', '0', '1999-07-06', '0', null, '13030125', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather25', '11111111111', 'tmother25', '11111111111', 'emcontect25', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('77d049602f0247f3af363f49f03d6caf', 'test82', '0', '1999-09-01', '0', null, '130302019', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather82', '11111111111', 'tmother82', '11111111111', 'emcontect82', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('7955d282d42b4424b11f1998e78bc27f', 'test53', '0', '1999-08-03', '0', null, '13030153', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather53', '11111111111', 'tmother53', '11111111111', 'emcontect53', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('7a26e3524ed54ddb9661be93bca862fd', 'test71', '0', '1999-08-21', '0', null, '13030208', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather71', '11111111111', 'tmother71', '11111111111', 'emcontect71', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('7aeee738e5774d52af5fa24416da18e7', 'test37', '0', '1999-07-18', '0', null, '13030137', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather37', '11111111111', 'tmother37', '11111111111', 'emcontect37', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('7ba70acffe4d4031b17908d50b2ea4f0', 'test57', '0', '1999-08-07', '0', null, '13030157', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather57', '11111111111', 'tmother57', '11111111111', 'emcontect57', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('7ec6ddf855c041e3a777c9f545128eda', 'test111', '0', '1999-09-30', '0', null, '13030304', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather111', '11111111111', 'tmother111', '11111111111', 'emcontect111', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('8060c4b19bf44fcd98141ca4a0154e0d', 'test126', '0', '1999-10-15', '0', null, '130303019', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather126', '11111111111', 'tmother126', '11111111111', 'emcontect126', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('80d42f99916444429ebfdebd93d1a6cb', 'test79', '0', '1999-08-29', '0', null, '130302016', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather79', '11111111111', 'tmother79', '11111111111', 'emcontect79', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('815b08e2ceba47718d9ff0135c395e4c', 'test115', '0', '1999-10-04', '0', null, '13030308', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather115', '11111111111', 'tmother115', '11111111111', 'emcontect115', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('81ca97f34bbf445db2e6317116b1d89b', 'test59', '0', '1999-08-09', '0', null, '13030159', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather59', '11111111111', 'tmother59', '11111111111', 'emcontect59', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('830394c06a5c4ab089369715fff5e965', 'test84', '0', '1999-09-03', '0', null, '13030221', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather84', '11111111111', 'tmother84', '11111111111', 'emcontect84', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('83a78a6561384439a0024ebe02f3bc5d', 'test42', '0', '1999-07-23', '0', null, '13030142', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather42', '11111111111', 'tmother42', '11111111111', 'emcontect42', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('8493865f76be4b5da0c25cbdf84a93d0', 'test93', '0', '1999-09-12', '0', null, '13030230', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather93', '11111111111', 'tmother93', '11111111111', 'emcontect93', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('854f834ba2f4471b8c4d396cb8398054', 'test125', '0', '1999-10-14', '0', null, '130303018', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather125', '11111111111', 'tmother125', '11111111111', 'emcontect125', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('8670aab9ad604509be9cf421bfa41a63', 'test136', '0', '1999-10-25', '0', null, '13030329', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather136', '11111111111', 'tmother136', '11111111111', 'emcontect136', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('878a1244fde04db9b78b91ae3d6347f5', 'test101', '0', '1999-09-20', '0', null, '13030238', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather101', '11111111111', 'tmother101', '11111111111', 'emcontect101', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('893c4f98de9443c0942359ffc8fe370f', 'asda', '0', '2020-12-16', '0', null, '10010003', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 00:44:19', 'asd', '1');
INSERT INTO `student` VALUES ('8a480bccedfe44a19c9d7eac9924c33c', 'test2', '0', '1999-06-13', '0', null, '13030102', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather2', '11111111111', 'tmother2', '11111111111', 'emcontect2', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('8a57b0ae7dfe4fe38d4872f28909cb9a', 'gg', '0', '2020-12-08', '0', null, '10010008', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 13:38:33', 'gg', '0');
INSERT INTO `student` VALUES ('8dad4df880fd4935b19ea8f0bc29577b', 'test121', '0', '1999-10-10', '0', null, '130303014', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather121', '11111111111', 'tmother121', '11111111111', 'emcontect121', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('90246b40c1564fbe8aaef95d228175c0', 'test30', '0', '1999-07-11', '0', null, '13030130', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather30', '11111111111', 'tmother30', '11111111111', 'emcontect30', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('9047cc0651f3454bb37b0403aeecc78e', 'aaa', '0', '2020-12-09', '0', null, '10010003', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 13:14:54', 'asd', '1');
INSERT INTO `student` VALUES ('913b7b2be59344aebacf5d90d29bdcad', 'test12', '0', '1999-06-23', '0', null, '130301012', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather12', '11111111111', 'tmother12', '11111111111', 'emcontect12', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('96a0c539613b41b6bbe6d2884d115178', 'ccd', '0', '1999-06-14', '0', null, '100100021', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('997159729df64d4abb1935523d4db3b1', 'lbh', '0', '2021-01-12', '0', null, '100100028', '2', '1', 'aaa', '18608336957', 'bbb', '18608336957', 'ccc', '18608336957', null, null, null, '2021-01-03 11:52:38', 'test 2', '0');
INSERT INTO `student` VALUES ('99a1d675adbf48e1a19cb82b4201060b', 'test96', '0', '1999-09-15', '0', null, '13030233', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather96', '11111111111', 'tmother96', '11111111111', 'emcontect96', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('99ea6f772a534d61bfe37f18ad653c35', 'test35', '0', '1999-07-16', '0', null, '13030135', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather35', '11111111111', 'tmother35', '11111111111', 'emcontect35', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('9a205d05c7f745b4bea15d7e949f6154', 'test99', '0', '1999-09-18', '0', null, '13030236', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather99', '11111111111', 'tmother99', '11111111111', 'emcontect99', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('9a6bff7972964570bbac87a762d5fb27', 'ggk', '1', '1999-06-16', '0', null, '100100014', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('9acac9f957d146c5a6d8fa2964fbbf26', 'test50', '0', '1999-07-31', '0', null, '13030150', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather50', '11111111111', 'tmother50', '11111111111', 'emcontect50', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('9c164ece23834b9f9c3fb14349b52dee', 'aad', '0', '1999-06-12', '0', null, '100100010', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('9ca1ec5d56934060836e6288a88031dd', 'test85', '0', '1999-09-04', '0', null, '13030222', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather85', '11111111111', 'tmother85', '11111111111', 'emcontect85', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('9db1d71a6a40458c81efa6b7deefdfb6', 'aa', '0', '2020-12-01', '0', null, '10010003', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 13:18:31', 'ss', '0');
INSERT INTO `student` VALUES ('a2583707e27646b2aea9b985684715a7', 'asda', '0', '2021-01-13', '0', null, '10010009', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 11:44:54', 'asd', '0');
INSERT INTO `student` VALUES ('a27801b3280f443ab401ffeb78bdffb1', 'viewtest', '0', '2003-01-23', '0', null, '13030301', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'aaa', '11111111111', 'bbb', '11111111111', 'bbb', '11111111111', null, null, null, '2021-01-31 11:18:20', 'grade info view test', '0');
INSERT INTO `student` VALUES ('a4891b00c4ad42fb9b8b53aaec6a9ce5', 'test49', '0', '1999-07-30', '0', null, '13030149', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather49', '11111111111', 'tmother49', '11111111111', 'emcontect49', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('a5654d4ac1284304b453864f7a13b768', 'de', '0', '2020-12-09', '0', null, '10010003', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 00:23:54', 'asd', '1');
INSERT INTO `student` VALUES ('a64a325091e943508e5ab4b64c7f8880', 'test66', '0', '1999-08-16', '0', null, '13030203', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather66', '11111111111', 'tmother66', '11111111111', 'emcontect66', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('a6b976cdfd464b7b86f9e8e9824403c4', 'test107', '0', '1999-09-26', '0', null, '13030244', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather107', '11111111111', 'tmother107', '11111111111', 'emcontect107', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('a9eb1945524d47e4979e14ee3ae60065', 'test97', '0', '1999-09-16', '0', null, '13030234', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather97', '11111111111', 'tmother97', '11111111111', 'emcontect97', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('ab8b927e1c4c4ab0bbfc62e7bd6161e2', 'test86', '0', '1999-09-05', '0', null, '13030223', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather86', '11111111111', 'tmother86', '11111111111', 'emcontect86', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('ad8ec10ce6f2444a9d4f5b5a6d9a692c', 'test51', '0', '1999-08-01', '0', null, '13030151', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather51', '11111111111', 'tmother51', '11111111111', 'emcontect51', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('ad96fa47e25d48d5a6a55d3d7180c74b', 'test18', '0', '1999-06-29', '0', null, '130301018', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather18', '11111111111', 'tmother18', '11111111111', 'emcontect18', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('b06dd281a5cc492a88d05211c7689501', 'test39', '0', '1999-07-20', '0', null, '13030139', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather39', '11111111111', 'tmother39', '11111111111', 'emcontect39', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('b0f254a7278c4ee7ace9f52292773db8', 'test132', '0', '1999-10-21', '0', null, '13030325', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather132', '11111111111', 'tmother132', '11111111111', 'emcontect132', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('b1cb1d3a5e884901920c46ccfa27ff2f', 'test43', '0', '1999-07-24', '0', null, '13030143', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather43', '11111111111', 'tmother43', '11111111111', 'emcontect43', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('b37ae3519e61426580397c783dc53b85', 'test28', '0', '1999-07-09', '0', null, '13030128', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather28', '11111111111', 'tmother28', '11111111111', 'emcontect28', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('b41ec8cfbee94a3383639e1a7980a852', 'test72', '0', '1999-08-22', '0', null, '13030209', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather72', '11111111111', 'tmother72', '11111111111', 'emcontect72', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('b5e4f3ddcf2142dab798a94318a101e8', 'llk', '1', '1999-06-19', '0', null, '100100026', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('b75c2a7a3ba44b7fb84ecc48de3b5339', 'sst', '1', '1999-06-17', '0', null, '100100015', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('b84853749d1b43ea93dec4daf46f2e15', 'test40', '0', '1999-07-21', '0', null, '13030140', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather40', '11111111111', 'tmother40', '11111111111', 'emcontect40', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('b997dd0cb5bf4a36ad75f7b2fbebd3fa', 'test65', '0', '1999-08-15', '0', null, '13030202', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather65', '11111111111', 'tmother65', '11111111111', 'emcontect65', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('ba62cc26180343ef80b6840d824c13eb', 'test112', '0', '1999-10-01', '0', null, '13030305', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather112', '11111111111', 'tmother112', '11111111111', 'emcontect112', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('bb8c852ba8784c3d80f6f19ad7757eea', 'test103', '0', '1999-09-22', '0', null, '13030240', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather103', '11111111111', 'tmother103', '11111111111', 'emcontect103', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('be8208900b824cc1aefa00c39561cd91', 'test102', '0', '1999-09-21', '0', null, '13030239', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather102', '11111111111', 'tmother102', '11111111111', 'emcontect102', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('c0718fb124ed4d9ea0b874d391ca67d4', 'test21', '0', '1999-07-02', '0', null, '13030121', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather21', '11111111111', 'tmother21', '11111111111', 'emcontect21', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('c198053fe748403fa5b8e0b2aaed217c', 'test120', '0', '1999-10-09', '0', null, '130303013', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather120', '11111111111', 'tmother120', '11111111111', 'emcontect120', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('c1dc3578e43f42439d6bc193bdeb199a', 'test34', '0', '1999-07-15', '0', null, '13030134', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather34', '11111111111', 'tmother34', '11111111111', 'emcontect34', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('c1f490ff60ee491dadf2e42ba6f6dce0', 'ggk', '1', '1999-06-16', '0', null, '100100023', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('c2adb238b4714f43bb9dc5b9b76d878b', 'dd', '0', '2020-12-09', '0', null, '10010006', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 13:18:57', 'dd', '0');
INSERT INTO `student` VALUES ('c5d2697a50e74ebda96ecb735455f4da', 'test127', '0', '1999-10-16', '0', null, '13030320', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather127', '11111111111', 'tmother127', '11111111111', 'emcontect127', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('c631b4ce3a5248f48467431cdbd3eee8', 'test105', '0', '1999-09-24', '0', null, '13030242', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather105', '11111111111', 'tmother105', '11111111111', 'emcontect105', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('c786cf0984fc451cacea69e514e2ea5a', 'test89', '0', '1999-09-08', '0', null, '13030226', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather89', '11111111111', 'tmother89', '11111111111', 'emcontect89', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('c99796b8374b463d8d134961118d20c0', 'test24', '0', '1999-07-05', '0', null, '13030124', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather24', '11111111111', 'tmother24', '11111111111', 'emcontect24', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('cb7b6196ebd54ad996063ec7bc9812f3', 'test69', '0', '1999-08-19', '0', null, '13030206', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather69', '11111111111', 'tmother69', '11111111111', 'emcontect69', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('cd58e92f45944aa0aba8cd8555d7981d', 'ttd', '0', '1999-06-18', '0', null, '100100016', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('cda78bd8476645939312de2a9eb0250e', 'test128', '0', '1999-10-17', '0', null, '13030321', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather128', '11111111111', 'tmother128', '11111111111', 'emcontect128', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('cdcc7dbba8874c7fb64c8f6475127edb', 'test67', '0', '1999-08-17', '0', null, '13030204', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather67', '11111111111', 'tmother67', '11111111111', 'emcontect67', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('ce87b5e42e464117ae24cf03baa82e7f', 'test81', '0', '1999-08-31', '0', null, '130302018', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather81', '11111111111', 'tmother81', '11111111111', 'emcontect81', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('d0a42a1a493e44daab1edf7fd7e7ebea', 'test61', '0', '1999-08-11', '0', null, '13030161', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather61', '11111111111', 'tmother61', '11111111111', 'emcontect61', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('d0af99897d584c9a8e7b369c4a2761f1', 'test100', '0', '1999-09-19', '0', null, '13030237', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather100', '11111111111', 'tmother100', '11111111111', 'emcontect100', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('d17960d82c7c40b7a25b0b2023e3f865', 'test5', '0', '1999-06-16', '0', null, '13030105', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather5', '11111111111', 'tmother5', '11111111111', 'emcontect5', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('d3004636d6f04b4f8f3a45c8a0e09aa5', 'bbs', '0', '1999-06-13', '0', null, '100100011', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:55:33', null, '0');
INSERT INTO `student` VALUES ('d411c91ffbf2442ea5be1f366565e23a', 'test80', '0', '1999-08-30', '0', null, '130302017', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather80', '11111111111', 'tmother80', '11111111111', 'emcontect80', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('d4168a5896e3447db9bab040802383b9', 'test134', '0', '1999-10-23', '0', null, '13030327', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather134', '11111111111', 'tmother134', '11111111111', 'emcontect134', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('d54279f80c774b3bbe1aa9a9adf74db2', 'test74', '0', '1999-08-24', '0', null, '130302011', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather74', '11111111111', 'tmother74', '11111111111', 'emcontect74', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('d7ef690f4a9b48c796ffdfd92e4ed8f1', 'test109', '0', '1999-09-28', '0', null, '13030302', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather109', '11111111111', 'tmother109', '11111111111', 'emcontect109', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('d9a3a11c57f446999f70489bfef548ac', 'test119', '0', '1999-10-08', '0', null, '130303012', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather119', '11111111111', 'tmother119', '11111111111', 'emcontect119', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('de72f5866f43418ca15fef619882be1f', 'test56', '0', '1999-08-06', '0', null, '13030156', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather56', '11111111111', 'tmother56', '11111111111', 'emcontect56', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('df6a24c4de9d41c0bc1240049188bcb8', 'ee', '0', '2020-12-23', '0', null, '10010007', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-31 20:00:26', 'ee', '1');
INSERT INTO `student` VALUES ('e03bb7dd57094f16a72cb47b4dd79a39', 'test104', '0', '1999-09-23', '0', null, '13030241', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather104', '11111111111', 'tmother104', '11111111111', 'emcontect104', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('e19217587ede42a9b8a32e2616588390', 'tttttttttt', '0', '2020-12-09', '0', null, '10010005', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 00:20:43', 'add test', '1');
INSERT INTO `student` VALUES ('e305e03319864477ab8a9a7e7de0e89a', 'test133', '0', '1999-10-22', '0', null, '13030326', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather133', '11111111111', 'tmother133', '11111111111', 'emcontect133', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('e4178d10a1f34517b48f07ce2d840f0b', 'test11', '0', '1999-06-22', '0', null, '130301011', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather11', '11111111111', 'tmother11', '11111111111', 'emcontect11', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('e41fa88d01a34af1aa3d042e751686ff', 'test3', '0', '1999-06-14', '0', null, '13030103', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather3', '11111111111', 'tmother3', '11111111111', 'emcontect3', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('e557118b0490430b9beb5e76b4e66975', 'test108', '0', '1999-09-27', '0', null, '13030245', '369b5898d57648d18e7035efc2fa43e5', '3c9dc709dde54b6f9e538721556c4aff', 'tfather108', '11111111111', 'tmother108', '11111111111', 'emcontect108', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('e565b9f787e34df1bf545e12963d0b40', 'bbs', '0', '1999-06-13', '0', null, '100100020', '2', '1', null, null, null, null, null, null, null, null, null, '2021-01-02 14:56:23', null, '0');
INSERT INTO `student` VALUES ('e5dbea099ca34094bcc895c3e77be379', 'test116', '0', '1999-10-05', '0', null, '13030309', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather116', '11111111111', 'tmother116', '11111111111', 'emcontect116', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('eacb5f968d944459ac8ace127fd1f962', 'ddd', '0', '2020-12-24', '0', null, '10010004', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 13:14:54', 'd', '1');
INSERT INTO `student` VALUES ('eae6846fb7de46b8a0b727af0977f66e', 'asdw', '0', '2020-12-09', '0', null, '10010003', '2', '1', null, null, null, null, null, null, null, null, null, '2020-12-29 00:49:48', 'asdw', '1');
INSERT INTO `student` VALUES ('ee324be784bb4a70ba101350de3ee315', 'test124', '0', '1999-10-13', '0', null, '130303017', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather124', '11111111111', 'tmother124', '11111111111', 'emcontect124', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('f0010231cc7e4f58aaf52ca5bc3222d6', 'test33', '0', '1999-07-14', '0', null, '13030133', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather33', '11111111111', 'tmother33', '11111111111', 'emcontect33', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('f446239271f942459cc5da72720855c5', 'test32', '0', '1999-07-13', '0', null, '13030132', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather32', '11111111111', 'tmother32', '11111111111', 'emcontect32', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('f77c68453cc04b7aab3978fc59d4809e', 'test4', '0', '1999-06-15', '0', null, '13030104', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather4', '11111111111', 'tmother4', '11111111111', 'emcontect4', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('f8352fcd317d4eb18512fa989d704287', 'test54', '0', '1999-08-04', '0', null, '13030154', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather54', '11111111111', 'tmother54', '11111111111', 'emcontect54', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('f8b0695017ff4e1b9da76e2894601f18', 'test38', '0', '1999-07-19', '0', null, '13030138', '472bbf68364e44b58211516ab9874174', '9162b14a4c3c43f58d794c031b7e0e9e', 'tfather38', '11111111111', 'tmother38', '11111111111', 'emcontect38', '11111111111', null, null, null, '2021-01-31 13:25:44', 'by import', '0');
INSERT INTO `student` VALUES ('fba6d69ed47c4e359c2094a4cf8dd5cd', 'test122', '0', '1999-10-11', '0', null, '130303015', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather122', '11111111111', 'tmother122', '11111111111', 'emcontect122', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');
INSERT INTO `student` VALUES ('fbcabb655cdc46939e495f8879c247ef', 'test130', '0', '1999-10-19', '0', null, '13030323', '193f1ec79bca48788b9b8c9e9719df21', '882c8501d10a44518ee712d7dcfe15bc', 'tfather130', '11111111111', 'tmother130', '11111111111', 'emcontect130', '11111111111', null, null, null, '2021-01-31 13:25:45', 'by import', '0');

-- ----------------------------
-- Table structure for stu_daliy_assess
-- ----------------------------
DROP TABLE IF EXISTS `stu_daliy_assess`;
CREATE TABLE `stu_daliy_assess` (
  `id` varchar(32) NOT NULL,
  `student_id` varchar(32) DEFAULT NULL,
  `subject_id` varchar(32) DEFAULT NULL,
  `stu_daliy_perform_id` varchar(32) DEFAULT NULL COMMENT '打分项名称',
  `eva_name` varchar(64) DEFAULT NULL,
  `eva_star` int(1) DEFAULT NULL COMMENT '打分项分数（星级）',
  `group_tag` varchar(64) DEFAULT NULL COMMENT '打分项分组',
  `date` datetime DEFAULT NULL COMMENT '该评分的日期',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_daliy_assess
-- ----------------------------

-- ----------------------------
-- Table structure for stu_daliy_perform
-- ----------------------------
DROP TABLE IF EXISTS `stu_daliy_perform`;
CREATE TABLE `stu_daliy_perform` (
  `id` varchar(32) NOT NULL,
  `student_id` varchar(32) NOT NULL DEFAULT '' COMMENT '学生id',
  `name` varchar(64) DEFAULT NULL COMMENT '该表单名称',
  `day_value` int(4) DEFAULT NULL COMMENT '天数（数值）（每学期的第几天）',
  `week_value` int(4) DEFAULT NULL COMMENT '周数（数值）（每学期的第几周）',
  `month_value` int(4) DEFAULT NULL COMMENT '月数（数值）（每学期的第几个月）',
  `semester_id` varchar(32) DEFAULT NULL,
  `date` varchar(32) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_daliy_perform
-- ----------------------------

-- ----------------------------
-- Table structure for stu_daliy_repu_middle
-- ----------------------------
DROP TABLE IF EXISTS `stu_daliy_repu_middle`;
CREATE TABLE `stu_daliy_repu_middle` (
  `id` varchar(32) NOT NULL,
  `stu_repu_id` varchar(32) DEFAULT NULL COMMENT '奖励惩罚表id',
  `stu_daliy_perform_Id` varchar(32) DEFAULT NULL COMMENT '学生每天表现表id',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_daliy_repu_middle
-- ----------------------------

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` varchar(32) NOT NULL,
  `sub_no` int(16) DEFAULT NULL COMMENT '年级编号',
  `name` varchar(64) DEFAULT NULL COMMENT '年级名称',
  `subject_type` int(1) DEFAULT '0' COMMENT '学科类型(0通识课程 1文科 2理科 3艺体)',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('03c1dbf5761e4c6a91724cc9dc942bc5', '5003', '英语', '0', null, null, null, '2021-01-11 14:17:07', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('14bb66bb21364b7e961fb539b89be91e', '50010', '体育', '3', null, null, null, '2021-01-11 14:18:30', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('370f62ac94174a05b2049b4349ff0498', '5004', '政治', '1', null, null, null, '2021-01-11 14:17:20', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('4607ae900d424e269440e32aa3b77705', '5008', '化学', '2', null, null, null, '2021-01-11 14:18:08', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('542a12fc41be45b094a082d98349aa1c', '6', '语文', '0', null, null, null, '2021-01-11 14:15:53', 'subject add test', '1');
INSERT INTO `subject` VALUES ('6a4e0c513cc94c59bcabc681cf09774e', '5007', '生物', '2', null, null, null, '2021-01-11 14:17:59', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('6df0367ed6334b87b78af2ee77ec0da9', '5002', '数学', '0', null, null, null, '2021-01-11 14:16:53', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('76ebbcdb18634d11bdf8a0065263aca1', '50011', '美术', '3', null, null, null, '2021-01-11 14:18:39', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('7a6ecc7208f14a828a3def5ab5814455', '5009', '物理', '2', null, null, null, '2021-01-11 14:18:17', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('8b38d77b751b4603873e81c880ba9da9', '5005', '历史', '1', null, null, null, '2021-01-11 14:17:32', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('92881c789b8740d1a0a3c0984829bd16', '5001', '语文', '0', null, null, null, '2021-01-11 14:16:33', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('cf7e0ded0e9b4a0da10a0b4a0bce4b62', '7', '数学', '0', null, null, null, '2021-01-11 14:15:59', 'subject update test', '1');
INSERT INTO `subject` VALUES ('d13a84b4d2ac4b00b1e944133a79edd7', '8', '化学', '2', null, null, null, '2021-01-11 14:15:59', 'test', '1');
INSERT INTO `subject` VALUES ('d8c27a042e2b4022ade971b0aa61b901', '50012', '音乐', '3', null, null, null, '2021-01-11 14:18:51', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('d906c8dcbd6d4942a14c17e6c6406c37', '5005', '生物', '2', null, null, null, '2021-01-11 14:15:27', 'test with noGenerator has been update', '1');
INSERT INTO `subject` VALUES ('f15832c3e082476a81856d18338e8bec', '5006', '地理', '1', null, null, null, '2021-01-11 14:17:42', 'noGenerator has been update', '0');
INSERT INTO `subject` VALUES ('f47b50c1a5f044da88c7a8050ee67695', '54', '历史', '1', null, null, null, '2021-01-11 14:15:59', '', '1');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` varchar(32) NOT NULL,
  `cron` varchar(255) DEFAULT '* * 0/1 * * ?' COMMENT '定时任务的执行时间（默认一个小时一次）',
  `task_no` int(12) DEFAULT NULL COMMENT '定时任务编号',
  `name` varchar(64) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('11', '0/5 * * * * ?', null, null, null, null, null, '2021-01-12 13:34:23', null, '0');
INSERT INTO `task` VALUES ('22', '0/5 * * * * ?', null, null, null, null, null, '2021-01-12 15:34:56', null, '0');
INSERT INTO `task` VALUES ('6d746c8d6f9b47ae8d7c123c9b4ed95a', '0 0 7 * *', '3', 'task3', null, null, null, '2021-02-19 17:42:55', null, '0');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '教师姓名',
  `sex` int(1) DEFAULT '0' COMMENT '男0 女1',
  `birthday` varchar(32) DEFAULT NULL,
  `member_type` int(4) DEFAULT NULL COMMENT '对象类型（学生0、教师1）',
  `resp_type` int(4) DEFAULT '1' COMMENT '职责类型（一般教师1，班主任10，年级主任20，校长30）',
  `is_clazz_master` tinyint(1) DEFAULT '1' COMMENT '是否是班主任',
  `is_grade_master` tinyint(1) DEFAULT '1' COMMENT '是否是年级主任',
  `is_school_master` tinyint(1) DEFAULT '1' COMMENT '是否是校长',
  `t_no` int(16) DEFAULT NULL,
  `grade_id` varchar(32) DEFAULT NULL,
  `grade_master_id` varchar(32) DEFAULT NULL,
  `next_id` varchar(32) DEFAULT NULL COMMENT '责任链的下一个对象的id',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '徐老师', '0', '1974-02-26', '1', '20', '0', '1', '0', '10000', '1', '1', null, null, null, null, '2021-01-06 13:02:47', null, '0');
INSERT INTO `teacher` VALUES ('193f1ec79bca48788b9b8c9e9719df21', '杨敏', '0', '1984-01-11', '1', '1', '1', '0', '0', '20011', '6b87678c498d46738bb0e8770d15a000', '4e77eda800b8443c9dee62508bffb1cb', null, null, null, null, '2021-01-11 17:29:15', 'test', '0');
INSERT INTO `teacher` VALUES ('2', '曹老师', '0', '1970-05-12', '1', '10', '1', '1', '0', '10010', '3b1f2890f31e4c79bafef14b1b48dc39', '2', null, null, null, null, '2021-01-05 12:22:48', null, '0');
INSERT INTO `teacher` VALUES ('2d85cabb8526416b9e818e0063461070', 'yyy', '0', '1999-06-12', '1', '1', '0', '0', '0', '20008', null, null, null, null, null, null, '2021-01-09 14:33:26', 'grade del test with noGenerator has been update', '0');
INSERT INTO `teacher` VALUES ('369b5898d57648d18e7035efc2fa43e5', '邓汉军', '0', '1975-01-16', '1', '1', '1', '0', '0', '20009', '6b87678c498d46738bb0e8770d15a000', '4e77eda800b8443c9dee62508bffb1cb', null, null, null, null, '2021-01-11 16:36:50', 'test', '0');
INSERT INTO `teacher` VALUES ('472bbf68364e44b58211516ab9874174', '徐乐乐', '0', '1970-12-10', '1', '1', '1', '0', '0', '20010', '6b87678c498d46738bb0e8770d15a000', '4e77eda800b8443c9dee62508bffb1cb', null, null, null, null, '2021-01-11 14:42:35', 'test', '0');
INSERT INTO `teacher` VALUES ('4e77eda800b8443c9dee62508bffb1cb', 'aaa', '0', '2021-01-21', '1', '1', '0', '1', '0', '50000006', '6b87678c498d46738bb0e8770d15a000', '4e77eda800b8443c9dee62508bffb1cb', null, null, null, null, '2021-01-11 14:37:11', 'aaa', '0');
INSERT INTO `teacher` VALUES ('51be49a0c9914e35aa5ae7bdf6254201', 'delete test', '0', '2014-01-08', '1', '1', '0', '0', '0', '50000005', '3b1f2890f31e4c79bafef14b1b48dc39', '2', null, null, null, null, '2021-01-07 01:17:24', 'delete test', '1');
INSERT INTO `teacher` VALUES ('6d00127a89704a83a76674d09bf11b7e', 'update-test', '0', '1985-01-10', '1', '1', '1', '0', '0', '50000004', '3b1f2890f31e4c79bafef14b1b48dc39', '2', null, null, null, null, '2021-01-08 16:06:44', 'update test', '0');
INSERT INTO `teacher` VALUES ('785c770461244408a196de4a2bccc851', 'test2', '0', '2014-01-15', '1', '1', '0', '0', '0', '50000003', '3b1f2890f31e4c79bafef14b1b48dc39', '2', null, null, null, null, '2021-01-07 01:12:06', 'add test', '1');
INSERT INTO `teacher` VALUES ('fa23ddb09ff84cbd8fff15958dec4cac', 'gradeDelTest', '0', '1984-01-07', '1', '1', '0', '0', '0', '20008', null, null, null, null, null, null, '2021-01-09 14:33:26', 'grade del test with no has been update', '0');
INSERT INTO `teacher` VALUES ('fad68364e8f74cb9b677f00802d214cf', 'addtest', '0', '2014-01-07', '1', '1', '1', '0', '0', '50000002', '3b1f2890f31e4c79bafef14b1b48dc39', '2', null, null, null, null, '2021-01-08 13:26:49', 'add test', '0');

-- ----------------------------
-- Table structure for teac_daliy_assess
-- ----------------------------
DROP TABLE IF EXISTS `teac_daliy_assess`;
CREATE TABLE `teac_daliy_assess` (
  `id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) DEFAULT NULL,
  `teac_daliy_perform_id` varchar(32) DEFAULT NULL COMMENT '教师每日表现表的id',
  `eva_name` varchar(64) DEFAULT NULL COMMENT '该打分项的名称',
  `eva_star` int(1) DEFAULT NULL COMMENT '该打分项的分值（星数）',
  `group_tag` varchar(64) DEFAULT NULL,
  `date` varchar(64) DEFAULT NULL COMMENT '该打分的日期',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teac_daliy_assess
-- ----------------------------

-- ----------------------------
-- Table structure for teac_daliy_perform
-- ----------------------------
DROP TABLE IF EXISTS `teac_daliy_perform`;
CREATE TABLE `teac_daliy_perform` (
  `id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) DEFAULT NULL COMMENT '教师id',
  `name` varchar(64) DEFAULT NULL,
  `day_value` int(4) DEFAULT NULL,
  `week_value` int(4) DEFAULT NULL,
  `month_value` int(4) DEFAULT NULL,
  `semester_id` varchar(32) DEFAULT NULL,
  `date` varchar(64) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teac_daliy_perform
-- ----------------------------

-- ----------------------------
-- Table structure for teac_daliy_repu_middle
-- ----------------------------
DROP TABLE IF EXISTS `teac_daliy_repu_middle`;
CREATE TABLE `teac_daliy_repu_middle` (
  `id` varchar(32) NOT NULL,
  `teac_repu_id` varchar(32) DEFAULT NULL,
  `teac_daliy_perform_id` varchar(32) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teac_daliy_repu_middle
-- ----------------------------

-- ----------------------------
-- Table structure for user_member_middle
-- ----------------------------
DROP TABLE IF EXISTS `user_member_middle`;
CREATE TABLE `user_member_middle` (
  `id` varchar(32) NOT NULL,
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `last_modify_user` varchar(32) DEFAULT NULL COMMENT '最后一个修改的人',
  `last_modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `remark` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否弃用(0未弃用，1弃用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_member_middle
-- ----------------------------

-- ----------------------------
-- View structure for clazz_info_view
-- ----------------------------
DROP VIEW IF EXISTS `clazz_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clazz_info_view` AS select `v_clazz`.`id` AS `id`,`v_clazz`.`cl_no` AS `cl_no`,`v_clazz`.`name` AS `name`,`v_clazz`.`clazz_master_id` AS `clazz_master_id`,`v_clazz`.`clazz_master_name` AS `clazz_master_name`,`v_clazz`.`grade_id` AS `grade_id`,`v_clazz`.`clazz_type` AS `clazz_type`,`v_clazz`.`create_user` AS `create_user`,`v_clazz`.`create_time` AS `create_time`,`v_clazz`.`last_modify_user` AS `last_modify_user`,`v_clazz`.`last_modify_time` AS `last_modify_time`,`v_clazz`.`remark` AS `remark`,`v_clazz`.`deleted` AS `deleted`,count(`clazz_stu_view`.`student_id`) AS `student_count`,`v_grade_team`.`name` AS `grade_name`,`v_grade_team`.`grade_master_id` AS `grade_master_id`,`v_grade_team`.`grade_master_name` AS `grade_master_name`,`v_grade_team`.`grade_type` AS `grade_type` from ((`v_clazz` left join `clazz_stu_view` on((`v_clazz`.`id` = `clazz_stu_view`.`id`))) left join `v_grade_team` on((`v_clazz`.`grade_id` = `v_grade_team`.`id`))) group by `v_clazz`.`cl_no` ;

-- ----------------------------
-- View structure for clazz_stu_view
-- ----------------------------
DROP VIEW IF EXISTS `clazz_stu_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clazz_stu_view` AS (select `v_clazz`.`id` AS `id`,`v_clazz`.`cl_no` AS `cl_no`,`v_clazz`.`name` AS `name`,`v_clazz`.`clazz_master_id` AS `clazz_master_id`,`v_clazz`.`clazz_master_name` AS `clazz_master_name`,`v_clazz`.`grade_id` AS `grade_id`,`v_clazz`.`clazz_type` AS `clazz_type`,`v_clazz`.`create_user` AS `create_user`,`v_clazz`.`create_time` AS `create_time`,`v_clazz`.`last_modify_user` AS `last_modify_user`,`v_clazz`.`last_modify_time` AS `last_modify_time`,`v_clazz`.`remark` AS `remark`,`v_clazz`.`deleted` AS `deleted`,`v_student`.`id` AS `student_id`,`v_student`.`s_no` AS `student_no`,`v_student`.`name` AS `student_name` from (`v_clazz` left join `v_student` on((`v_clazz`.`id` = `v_student`.`clazz_id`)))) ;

-- ----------------------------
-- View structure for course_info_view
-- ----------------------------
DROP VIEW IF EXISTS `course_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `course_info_view` AS select `v_course`.`id` AS `id`,`v_course`.`co_no` AS `co_no`,`v_course`.`name` AS `name`,`v_course`.`subject_id` AS `subject_id`,`v_course`.`teacher_id` AS `teacher_id`,`v_course`.`clazz_id` AS `clazz_id`,`v_course`.`create_user` AS `create_user`,`v_course`.`create_time` AS `create_time`,`v_course`.`last_modify_user` AS `last_modify_user`,`v_course`.`last_modify_time` AS `last_modify_time`,`v_course`.`remark` AS `remark`,`v_course`.`deleted` AS `deleted`,`clazz_info_view`.`name` AS `clazz_name`,`clazz_info_view`.`grade_id` AS `grade_id`,`clazz_info_view`.`grade_name` AS `grade_name`,`clazz_info_view`.`grade_type` AS `grade_type`,`clazz_info_view`.`clazz_type` AS `clazz_type`,`clazz_info_view`.`student_count` AS `student_count`,`v_teacher`.`name` AS `teacher_name`,`v_subject`.`name` AS `subject_name`,`v_subject`.`subject_type` AS `subject_type` from (((`v_course` left join `clazz_info_view` on((`v_course`.`clazz_id` = `clazz_info_view`.`id`))) left join `v_teacher` on((`v_course`.`teacher_id` = `v_teacher`.`id`))) left join `v_subject` on((`v_course`.`subject_id` = `v_subject`.`id`))) ;

-- ----------------------------
-- View structure for course_teacher_view
-- ----------------------------
DROP VIEW IF EXISTS `course_teacher_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `course_teacher_view` AS select `v_course`.`clazz_id` AS `clazz_id`,`v_course`.`co_no` AS `course_no`,`v_course`.`name` AS `course_name`,`v_teacher`.`id` AS `teacher_id`,`v_teacher`.`t_no` AS `teacher_no`,`v_teacher`.`name` AS `teacher_name` from (`v_course` left join `v_teacher` on((`v_course`.`teacher_id` = `v_teacher`.`id`))) ;

-- ----------------------------
-- View structure for exam_info_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_info_view` AS select `v_exam`.`id` AS `id`,`v_exam`.`e_no` AS `e_no`,`v_exam`.`exam_name` AS `exam_name`,`v_exam`.`exam_type` AS `exam_type`,`v_exam`.`semester_id` AS `semester_id`,`v_semester`.`name` AS `semester_name`,`v_exam`.`exam_state` AS `exam_state`,`v_exam`.`grade_id` AS `grade_id`,`v_grade_team`.`name` AS `grade_name`,`v_exam`.`begin_date` AS `begin_date`,`v_exam`.`end_date` AS `end_date`,`v_exam_student_count`.`student_count` AS `student_count`,`v_exam_room_count`.`room_count` AS `room_count`,`v_exam`.`create_user` AS `create_user`,`v_exam`.`create_time` AS `create_time`,`v_exam`.`last_modify_user` AS `last_modify_user`,`v_exam`.`last_modify_time` AS `last_modify_time`,`v_exam`.`remark` AS `remark`,`v_exam`.`deleted` AS `deleted` from ((((`v_exam` left join `v_grade_team` on((`v_exam`.`grade_id` = `v_grade_team`.`id`))) left join `v_semester` on((`v_exam`.`semester_id` = `v_semester`.`id`))) left join `v_exam_student_count` on((`v_exam`.`id` = `v_exam_student_count`.`exam_id`))) left join `v_exam_room_count` on((`v_exam`.`id` = `v_exam_room_count`.`exam_id`))) ;

-- ----------------------------
-- View structure for exam_room_info_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_room_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_room_info_view` AS select `v_exam_room`.`id` AS `id`,`v_exam_room`.`exam_id` AS `exam_id`,`v_exam_room`.`room_no` AS `room_no`,`v_exam_room`.`room_place` AS `room_place`,`v_exam_room`.`room_name` AS `room_name`,`v_exam_room`.`different_place_tag` AS `different_place_tag`,`v_exam_room`.`rent_tag` AS `rent_tag`,`v_exam_room`.`rent_grade_id` AS `rent_grade_id`,`v_grade_team`.`name` AS `rent_grade_name`,`v_exam_room`.`rent_state` AS `rent_state`,`v_exam_room`.`max_size` AS `max_size`,`v_exam_room`.`create_user` AS `create_user`,`v_exam_room`.`create_time` AS `create_time`,`v_exam_room`.`last_modify_user` AS `last_modify_user`,`v_exam_room`.`last_modify_time` AS `last_modify_time`,`v_exam_room`.`remark` AS `remark`,`v_exam_room`.`deleted` AS `deleted` from (`v_exam_room` left join `v_grade_team` on((`v_exam_room`.`rent_grade_id` = `v_grade_team`.`id`))) ;

-- ----------------------------
-- View structure for exam_room_inv_map_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_room_inv_map_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_room_inv_map_view` AS select `v_exam_room`.`id` AS `id`,`v_exam_room`.`exam_id` AS `exam_id`,`v_exam_teacher_inviglate`.`exam_subject_id` AS `exam_subject_id`,`v_exam_room`.`room_no` AS `room_no`,`v_exam_room`.`room_place` AS `room_place`,`v_exam_room`.`room_name` AS `room_name`,`v_exam_room`.`different_place_tag` AS `different_place_tag`,`v_exam_room`.`rent_tag` AS `rent_tag`,`v_exam_room`.`rent_grade_id` AS `rent_grade_id`,`v_exam_room`.`rent_state` AS `rent_state`,`v_exam_room`.`max_size` AS `max_size`,`v_exam_teacher_inviglate`.`id` AS `teacher_inv_id`,`v_exam_teacher_inviglate`.`teacher_id` AS `teacher_id`,`v_teacher`.`name` AS `teacher_name`,`v_exam_room`.`create_user` AS `create_user`,`v_exam_room`.`create_time` AS `create_time`,`v_exam_room`.`last_modify_user` AS `last_modify_user`,`v_exam_room`.`last_modify_time` AS `last_modify_time`,`v_exam_room`.`remark` AS `remark`,`v_exam_room`.`deleted` AS `deleted` from (((`v_exam_room` left join `v_exam_teac_inv_room_middle` on((`v_exam_room`.`id` = `v_exam_teac_inv_room_middle`.`exam_room_id`))) left join `v_exam_teacher_inviglate` on((`v_exam_teac_inv_room_middle`.`teacher_inv_id` = `v_exam_teacher_inviglate`.`id`))) left join `v_teacher` on((`v_exam_teacher_inviglate`.`teacher_id` = `v_teacher`.`id`))) ;

-- ----------------------------
-- View structure for exam_score_info_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_score_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_score_info_view` AS select `v_exam_score`.`id` AS `id`,`v_exam_score`.`exam_sub_stu_id` AS `exam_sub_stu_id`,`v_exam_score`.`exam_teac_mar_id` AS `exam_teac_mar_id`,`v_exam_score`.`exam_subject_id` AS `exam_subject_id`,`v_exam_score`.`score` AS `score`,`v_exam_subject_student`.`student_id` AS `student_id`,`v_student`.`s_no` AS `s_no`,`v_student`.`name` AS `student_name`,`v_student`.`clazz_id` AS `clazz_id`,`v_clazz`.`name` AS `clazz_name`,`v_exam`.`grade_id` AS `grade_id`,`v_grade_team`.`name` AS `grade_name`,`v_exam_subject`.`subject_id` AS `subject_id`,`v_subject`.`name` AS `subject_name`,`v_exam_subject`.`exam_id` AS `exam_id`,`v_exam`.`exam_name` AS `exam_name`,`v_exam_subject_student`.`exam_room_id` AS `exam_room_id`,`v_teacher`.`name` AS `mar_teacher_name`,`v_exam_teacher_marking`.`teacher_id` AS `mar_teacher_id`,`v_exam_score`.`create_user` AS `create_user`,`v_exam_score`.`create_time` AS `create_time`,`v_exam_score`.`last_modify_user` AS `last_modify_user`,`v_exam_score`.`last_modify_time` AS `last_modify_time`,`v_exam_score`.`remark` AS `remark`,`v_exam_score`.`deleted` AS `deleted` from (((((((((`v_exam_score` left join `v_exam_subject_student` on((`v_exam_score`.`exam_sub_stu_id` = `v_exam_subject_student`.`id`))) left join `v_exam_subject` on((`v_exam_score`.`exam_subject_id` = `v_exam_subject`.`id`))) left join `v_exam` on((`v_exam_subject`.`exam_id` = `v_exam`.`id`))) left join `v_subject` on((`v_exam_subject`.`subject_id` = `v_subject`.`id`))) left join `v_student` on((`v_exam_subject_student`.`student_id` = `v_student`.`id`))) left join `v_exam_teacher_marking` on((`v_exam_score`.`exam_teac_mar_id` = `v_exam_teacher_marking`.`id`))) left join `v_teacher` on((`v_exam_teacher_marking`.`teacher_id` = `v_teacher`.`id`))) left join `v_clazz` on((`v_student`.`clazz_id` = `v_clazz`.`id`))) left join `v_grade_team` on((`v_exam`.`grade_id` = `v_grade_team`.`id`))) where (`v_exam_score`.`score` is not null) ;

-- ----------------------------
-- View structure for exam_subject_info_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_subject_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_subject_info_view` AS select `v_exam_subject`.`id` AS `id`,`v_exam_subject`.`exam_id` AS `exam_id`,`v_exam`.`exam_name` AS `exam_name`,`v_exam`.`exam_state` AS `exam_state`,`v_exam_subject`.`subject_id` AS `subject_id`,`v_subject`.`name` AS `subject_name`,`v_exam_subject`.`begin_time` AS `begin_time`,`v_exam_subject`.`end_time` AS `end_time`,`v_exam_subject`.`create_user` AS `create_user`,`v_exam_subject`.`create_time` AS `create_time`,`v_exam_subject`.`last_modify_user` AS `last_modify_user`,`v_exam_subject`.`last_modify_time` AS `last_modify_time`,`v_exam_subject`.`remark` AS `remark`,`v_exam_subject`.`deleted` AS `deleted` from ((`v_exam_subject` left join `v_exam` on((`v_exam_subject`.`exam_id` = `v_exam`.`id`))) left join `v_subject` on((`v_exam_subject`.`subject_id` = `v_subject`.`id`))) ;

-- ----------------------------
-- View structure for exam_subject_student_info_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_subject_student_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_subject_student_info_view` AS select `v_exam_subject_student`.`id` AS `id`,`v_exam_subject_student`.`exam_id` AS `exam_id`,`v_exam`.`exam_name` AS `exam_name`,`v_exam`.`exam_state` AS `exam_state`,`v_exam`.`exam_type` AS `exam_type`,`v_exam_subject_student`.`student_id` AS `student_id`,`v_student`.`name` AS `student_name`,`v_exam_subject_student`.`exam_subject_id` AS `exam_subject_id`,`v_exam_subject`.`subject_id` AS `subject_id`,`v_exam_subject`.`name` AS `exam_subject_name`,`v_exam_subject`.`begin_time` AS `exam_subject_begin_time`,`v_exam_subject`.`end_time` AS `exam_subject_end_time`,`v_exam_subject_student`.`exam_room_id` AS `room_id`,`exam_room_inv_map_view`.`room_no` AS `room_no`,`exam_room_inv_map_view`.`room_name` AS `room_name`,`exam_room_inv_map_view`.`room_place` AS `room_place`,`exam_room_inv_map_view`.`teacher_inv_id` AS `teacher_inv_id`,`exam_room_inv_map_view`.`teacher_id` AS `inv_teacher_id`,`exam_room_inv_map_view`.`teacher_name` AS `inv_teacher_name`,`v_exam_subject_student`.`create_user` AS `create_user`,`v_exam_subject_student`.`create_time` AS `create_time`,`v_exam_subject_student`.`last_modify_user` AS `last_modify_user`,`v_exam_subject_student`.`last_modify_time` AS `last_modify_time`,`v_exam_subject_student`.`remark` AS `remark`,`v_exam_subject_student`.`deleted` AS `deleted` from ((((`v_exam_subject_student` left join `v_exam` on((`v_exam_subject_student`.`exam_id` = `v_exam`.`id`))) left join `v_student` on((`v_exam_subject_student`.`student_id` = `v_student`.`id`))) left join `v_exam_subject` on((`v_exam_subject_student`.`exam_subject_id` = `v_exam_subject`.`id`))) left join `exam_room_inv_map_view` on((`v_exam_subject_student`.`exam_room_id` = `exam_room_inv_map_view`.`id`))) where (`v_exam_subject`.`id` = `exam_room_inv_map_view`.`exam_subject_id`) ;

-- ----------------------------
-- View structure for exam_teacher_inv_info_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_teacher_inv_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_teacher_inv_info_view` AS select `v_exam_teacher_inviglate`.`id` AS `id`,`v_exam_teacher_inviglate`.`teacher_id` AS `teacher_id`,`v_teacher`.`name` AS `teacher_name`,`v_exam_teacher_inviglate`.`exam_subject_id` AS `exam_subject_id`,`v_exam_subject`.`subject_id` AS `subject_id`,`v_exam_subject`.`name` AS `exam_subject_name`,`v_exam_subject`.`begin_time` AS `exam_subject_begin_time`,`v_exam_subject`.`end_time` AS `exam_subject_end_time`,`v_exam_teacher_inviglate`.`exam_id` AS `exam_id`,`v_exam`.`exam_name` AS `exam_name`,`v_exam`.`exam_state` AS `exam_state`,`v_exam`.`exam_type` AS `exam_type`,`v_exam_room`.`id` AS `room_id`,`v_exam_room`.`max_size` AS `room_max_size`,`v_exam_room`.`room_no` AS `room_no`,`v_exam_room`.`room_name` AS `room_name`,`v_exam_room`.`room_place` AS `room_place`,`v_exam_teac_inv_room_middle`.`id` AS `inv_room_middle_id`,`v_exam_teacher_inviglate`.`create_user` AS `create_user`,`v_exam_teacher_inviglate`.`create_time` AS `create_time`,`v_exam_teacher_inviglate`.`last_modify_user` AS `last_modify_user`,`v_exam_teacher_inviglate`.`last_modify_time` AS `last_modify_time`,`v_exam_teacher_inviglate`.`remark` AS `remark`,`v_exam_teacher_inviglate`.`deleted` AS `deleted` from (((((`v_exam_teacher_inviglate` left join `v_teacher` on((`v_exam_teacher_inviglate`.`teacher_id` = `v_teacher`.`id`))) left join `v_exam_subject` on((`v_exam_teacher_inviglate`.`exam_subject_id` = `v_exam_subject`.`id`))) left join `v_exam` on((`v_exam_teacher_inviglate`.`exam_id` = `v_exam`.`id`))) left join `v_exam_teac_inv_room_middle` on((`v_exam_teacher_inviglate`.`id` = `v_exam_teac_inv_room_middle`.`teacher_inv_id`))) left join `v_exam_room` on((`v_exam_teac_inv_room_middle`.`exam_room_id` = `v_exam_room`.`id`))) ;

-- ----------------------------
-- View structure for exam_teacher_mar_info_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_teacher_mar_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_teacher_mar_info_view` AS select `v_exam_teacher_marking`.`id` AS `id`,`v_exam_teacher_marking`.`teacher_id` AS `teacher_id`,`v_teacher`.`name` AS `teacher_name`,`v_exam_teacher_marking`.`exam_subject_id` AS `exam_subject_id`,`v_exam_subject`.`subject_id` AS `subject_id`,`v_exam_subject`.`name` AS `exam_subject_name`,`v_exam_subject`.`begin_time` AS `exam_subject_begin_time`,`v_exam_subject`.`end_time` AS `exam_subject_end_time`,`v_exam_teacher_marking`.`exam_id` AS `exam_id`,`v_exam`.`exam_name` AS `exam_name`,`v_exam`.`exam_state` AS `exam_state`,`v_exam`.`exam_type` AS `exam_type`,`v_exam_teacher_marking`.`create_user` AS `create_user`,`v_exam_teacher_marking`.`create_time` AS `create_time`,`v_exam_teacher_marking`.`last_modify_user` AS `last_modify_user`,`v_exam_teacher_marking`.`last_modify_time` AS `last_modify_time`,`v_exam_teacher_marking`.`remark` AS `remark`,`v_exam_teacher_marking`.`deleted` AS `deleted` from (((`v_exam_teacher_marking` left join `v_teacher` on((`v_exam_teacher_marking`.`teacher_id` = `v_teacher`.`id`))) left join `v_exam_subject` on((`v_exam_teacher_marking`.`exam_subject_id` = `v_exam_subject`.`id`))) left join `v_exam` on((`v_exam_teacher_marking`.`exam_id` = `v_exam`.`id`))) ;

-- ----------------------------
-- View structure for grade_info_view
-- ----------------------------
DROP VIEW IF EXISTS `grade_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grade_info_view` AS (select `v_grade_team`.`id` AS `id`,`v_grade_team`.`g_no` AS `g_no`,`v_grade_team`.`name` AS `name`,`v_grade_team`.`grade_type` AS `grade_type`,`v_grade_team`.`grade_master_id` AS `grade_master_id`,`v_grade_team`.`grade_master_name` AS `grade_master_name`,`v_grade_team`.`enter_study_time` AS `enter_study_time`,`v_grade_team`.`end_study_time` AS `end_study_time`,`v_grade_team`.`create_user` AS `create_user`,`v_grade_team`.`create_time` AS `create_time`,`v_grade_team`.`last_modify_user` AS `last_modify_user`,`v_grade_team`.`last_modify_time` AS `last_modify_time`,`v_grade_team`.`remark` AS `remark`,`v_grade_team`.`deleted` AS `deleted`,count(distinct `sub_grade_info_view`.`t_no`) AS `teacher_count`,count(distinct `sub_grade_info_view`.`s_no`) AS `student_count`,count(distinct `sub_grade_info_view`.`cl_no`) AS `clazz_count` from (`v_grade_team` left join `sub_grade_info_view` on((`v_grade_team`.`id` = `sub_grade_info_view`.`id`))) group by `v_grade_team`.`id`) ;

-- ----------------------------
-- View structure for grade_subject_simple_view
-- ----------------------------
DROP VIEW IF EXISTS `grade_subject_simple_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grade_subject_simple_view` AS select `v_subject`.`id` AS `id`,`v_subject`.`sub_no` AS `sub_no`,`v_subject`.`name` AS `name`,`v_subject`.`subject_type` AS `subject_type`,`v_subject`.`create_user` AS `create_user`,`v_subject`.`create_time` AS `create_time`,`v_subject`.`last_modify_user` AS `last_modify_user`,`v_subject`.`last_modify_time` AS `last_modify_time`,`v_subject`.`remark` AS `remark`,`v_subject`.`deleted` AS `deleted`,`course_info_view`.`grade_id` AS `grade_id`,`course_info_view`.`grade_name` AS `grade_name` from (`v_subject` left join `course_info_view` on((`v_subject`.`id` = `course_info_view`.`subject_id`))) ;

-- ----------------------------
-- View structure for lg_role_permission_view
-- ----------------------------
DROP VIEW IF EXISTS `lg_role_permission_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lg_role_permission_view` AS select `v_lg_role`.`id` AS `id`,`v_lg_role`.`role_name` AS `role_name`,`v_lg_role`.`role_type` AS `role_type`,`v_lg_role`.`description` AS `role_description`,`v_lg_permission`.`id` AS `permission_id`,`v_lg_permission`.`permission_name` AS `permission_name`,`v_lg_permission`.`permission_type` AS `permission_type`,`v_lg_permission`.`description` AS `permission_description`,`v_lg_permission`.`url` AS `url`,`v_lg_role`.`create_user` AS `create_user`,`v_lg_role`.`create_time` AS `create_time`,`v_lg_role`.`last_modify_user` AS `last_modify_user`,`v_lg_role`.`last_modify_time` AS `last_modify_time`,`v_lg_role`.`remark` AS `remark`,`v_lg_role`.`deleted` AS `deleted` from ((`v_lg_role` left join `v_lg_role_permission_middle` on((`v_lg_role`.`id` = `v_lg_role_permission_middle`.`role_id`))) left join `v_lg_permission` on((`v_lg_role_permission_middle`.`permission_id` = `v_lg_permission`.`id`))) ;

-- ----------------------------
-- View structure for lg_user_permission_view
-- ----------------------------
DROP VIEW IF EXISTS `lg_user_permission_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lg_user_permission_view` AS select `lg_user_role_view`.`id` AS `id`,`lg_user_role_view`.`username` AS `username`,`lg_user_role_view`.`member_type` AS `member_type`,`lg_user_role_view`.`member_id` AS `member_id`,`lg_user_role_view`.`phonenum` AS `phonenum`,`lg_user_role_view`.`vxnum` AS `vxnum`,`lg_user_role_view`.`role_id` AS `role_id`,`lg_user_role_view`.`role_name` AS `role_name`,`lg_role_permission_view`.`permission_id` AS `permission_id`,`lg_role_permission_view`.`permission_name` AS `permission_name`,`lg_role_permission_view`.`permission_description` AS `permission_description`,`lg_role_permission_view`.`permission_type` AS `permission_type`,`lg_role_permission_view`.`url` AS `url`,`lg_user_role_view`.`create_user` AS `create_user`,`lg_user_role_view`.`create_time` AS `create_time`,`lg_user_role_view`.`last_modify_user` AS `last_modify_user`,`lg_user_role_view`.`last_modify_time` AS `last_modify_time`,`lg_user_role_view`.`remark` AS `remark`,`lg_user_role_view`.`deleted` AS `deleted` from (`lg_user_role_view` left join `lg_role_permission_view` on((`lg_user_role_view`.`role_id` = `lg_role_permission_view`.`id`))) ;

-- ----------------------------
-- View structure for lg_user_role_view
-- ----------------------------
DROP VIEW IF EXISTS `lg_user_role_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lg_user_role_view` AS select `v_lg_user`.`id` AS `id`,`v_lg_user`.`username` AS `username`,`v_lg_user`.`password` AS `password`,`v_lg_user`.`password_salt` AS `password_salt`,`v_lg_user`.`member_id` AS `member_id`,`v_lg_user`.`member_type` AS `member_type`,`v_lg_user`.`phonenum` AS `phonenum`,`v_lg_user`.`vxnum` AS `vxnum`,`v_lg_role`.`id` AS `role_id`,`v_lg_role`.`role_name` AS `role_name`,`v_lg_role`.`role_type` AS `role_type`,`v_lg_role`.`description` AS `role_description`,`v_lg_user`.`create_user` AS `create_user`,`v_lg_user`.`create_time` AS `create_time`,`v_lg_user`.`last_modify_user` AS `last_modify_user`,`v_lg_user`.`last_modify_time` AS `last_modify_time`,`v_lg_user`.`remark` AS `remark`,`v_lg_user`.`deleted` AS `deleted` from ((`v_lg_user` left join `v_lg_user_role_middle` on((`v_lg_user`.`id` = `v_lg_user_role_middle`.`user_id`))) left join `v_lg_role` on((`v_lg_user_role_middle`.`role_id` = `v_lg_role`.`id`))) ;

-- ----------------------------
-- View structure for student_info_view
-- ----------------------------
DROP VIEW IF EXISTS `student_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_info_view` AS (select `v_student`.`id` AS `id`,`v_student`.`name` AS `name`,`v_student`.`sex` AS `sex`,`v_student`.`birthday` AS `birthday`,`v_student`.`member_type` AS `member_type`,`v_student`.`resp_type` AS `resp_type`,`v_student`.`s_no` AS `s_no`,`v_student`.`clazz_master_id` AS `clazz_master_id`,`v_student`.`clazz_id` AS `clazz_id`,`v_student`.`father_name` AS `father_name`,`v_student`.`father_phone` AS `father_phone`,`v_student`.`mother_name` AS `mother_name`,`v_student`.`mother_phone` AS `mother_phone`,`v_student`.`em_contact_name` AS `em_contact_name`,`v_student`.`em_contact_phone` AS `em_contact_phone`,`v_student`.`create_user` AS `create_user`,`v_student`.`create_time` AS `create_time`,`v_student`.`last_modify_user` AS `last_modify_user`,`v_student`.`last_modify_time` AS `last_modify_time`,`v_student`.`remark` AS `remark`,`v_student`.`deleted` AS `deleted`,`v_clazz`.`name` AS `clazz_name`,`v_clazz`.`clazz_type` AS `clazz_type`,`v_teacher`.`name` AS `clazz_master_name`,`v_grade_team`.`id` AS `grade_id`,`v_grade_team`.`name` AS `grade_name`,`v_grade_team`.`grade_master_id` AS `grade_master_id`,`v_grade_team`.`grade_master_name` AS `grade_master_name`,`v_grade_team`.`grade_type` AS `grade_type` from (((`v_student` left join `v_clazz` on((`v_student`.`clazz_id` = `v_clazz`.`id`))) left join `v_teacher` on((`v_clazz`.`clazz_master_id` = `v_teacher`.`id`))) left join `v_grade_team` on((`v_clazz`.`grade_id` = `v_grade_team`.`id`)))) ;

-- ----------------------------
-- View structure for subject_info_view
-- ----------------------------
DROP VIEW IF EXISTS `subject_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subject_info_view` AS select `v_subject`.`id` AS `id`,`v_subject`.`sub_no` AS `sub_no`,`v_subject`.`name` AS `name`,`v_subject`.`subject_type` AS `subject_type`,`v_subject`.`create_user` AS `create_user`,`v_subject`.`create_time` AS `create_time`,`v_subject`.`last_modify_user` AS `last_modify_user`,`v_subject`.`last_modify_time` AS `last_modify_time`,`v_subject`.`remark` AS `remark`,`v_subject`.`deleted` AS `deleted` from `v_subject` ;

-- ----------------------------
-- View structure for sub_grade_info_view
-- ----------------------------
DROP VIEW IF EXISTS `sub_grade_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sub_grade_info_view` AS select `v_grade_team`.`id` AS `id`,`v_grade_team`.`g_no` AS `g_no`,`v_grade_team`.`name` AS `name`,`v_grade_team`.`grade_type` AS `grade_type`,`v_grade_team`.`grade_master_id` AS `grade_master_id`,`v_grade_team`.`grade_master_name` AS `grade_master_name`,`v_grade_team`.`enter_study_time` AS `enter_study_time`,`v_grade_team`.`end_study_time` AS `end_study_time`,`v_student`.`s_no` AS `s_no`,`v_teacher`.`t_no` AS `t_no`,`v_clazz`.`cl_no` AS `cl_no`,`v_grade_team`.`create_time` AS `create_time`,`v_grade_team`.`create_user` AS `create_user`,`v_grade_team`.`last_modify_time` AS `last_modify_time`,`v_grade_team`.`last_modify_user` AS `last_modify_user`,`v_grade_team`.`remark` AS `remark`,`v_grade_team`.`deleted` AS `deleted` from (((`v_grade_team` left join `v_teacher` on((`v_teacher`.`grade_id` = `v_grade_team`.`id`))) left join `v_clazz` on((`v_clazz`.`grade_id` = `v_grade_team`.`id`))) left join `v_student` on((`v_clazz`.`id` = `v_student`.`clazz_id`))) ;

-- ----------------------------
-- View structure for teacher_info_view
-- ----------------------------
DROP VIEW IF EXISTS `teacher_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teacher_info_view` AS select `v_teacher`.`id` AS `id`,`v_teacher`.`name` AS `name`,`v_teacher`.`sex` AS `sex`,`v_teacher`.`birthday` AS `birthday`,`v_teacher`.`member_type` AS `member_type`,`v_teacher`.`resp_type` AS `resp_type`,`v_teacher`.`is_clazz_master` AS `is_clazz_master`,`v_teacher`.`is_grade_master` AS `is_grade_master`,`v_teacher`.`is_school_master` AS `is_school_master`,`v_teacher`.`t_no` AS `t_no`,`v_teacher`.`grade_id` AS `grade_id`,`v_teacher`.`grade_master_id` AS `grade_master_id`,`v_teacher`.`next_id` AS `next_id`,`v_teacher`.`create_user` AS `create_user`,`v_teacher`.`create_time` AS `create_time`,`v_teacher`.`last_modify_user` AS `last_modify_user`,`v_teacher`.`last_modify_time` AS `last_modify_time`,`v_teacher`.`remark` AS `remark`,`v_teacher`.`deleted` AS `deleted`,`v_clazz`.`id` AS `resp_clazz_id`,`v_clazz`.`cl_no` AS `resp_clazz_no`,`v_clazz`.`name` AS `resp_clazz_name`,`v_clazz`.`clazz_type` AS `resp_clazz_type`,`v_grade_team`.`id` AS `resp_grade_id`,`v_grade_team`.`g_no` AS `resp_grade_no`,`v_grade_team`.`name` AS `resp_grade_name`,`tb`.`grade_type` AS `grade_type`,`tb`.`name` AS `grade_name` from (((`v_teacher` left join `v_clazz` on((`v_teacher`.`id` = `v_clazz`.`clazz_master_id`))) left join `v_grade_team` on((`v_teacher`.`id` = `v_grade_team`.`grade_master_id`))) left join `v_grade_team` `tb` on((`v_teacher`.`grade_id` = `tb`.`id`))) ;

-- ----------------------------
-- View structure for v_clazz
-- ----------------------------
DROP VIEW IF EXISTS `v_clazz`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_clazz` AS select `clazz`.`id` AS `id`,`clazz`.`cl_no` AS `cl_no`,`clazz`.`name` AS `name`,`clazz`.`clazz_master_id` AS `clazz_master_id`,`clazz`.`clazz_master_name` AS `clazz_master_name`,`clazz`.`grade_id` AS `grade_id`,`clazz`.`clazz_type` AS `clazz_type`,`clazz`.`create_user` AS `create_user`,`clazz`.`create_time` AS `create_time`,`clazz`.`last_modify_user` AS `last_modify_user`,`clazz`.`last_modify_time` AS `last_modify_time`,`clazz`.`remark` AS `remark`,`clazz`.`deleted` AS `deleted` from `clazz` where (`clazz`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_course
-- ----------------------------
DROP VIEW IF EXISTS `v_course`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_course` AS select `course`.`id` AS `id`,`course`.`co_no` AS `co_no`,`course`.`name` AS `name`,`course`.`subject_id` AS `subject_id`,`course`.`teacher_id` AS `teacher_id`,`course`.`clazz_id` AS `clazz_id`,`course`.`create_user` AS `create_user`,`course`.`create_time` AS `create_time`,`course`.`last_modify_user` AS `last_modify_user`,`course`.`last_modify_time` AS `last_modify_time`,`course`.`remark` AS `remark`,`course`.`deleted` AS `deleted` from `course` where (`course`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_exam
-- ----------------------------
DROP VIEW IF EXISTS `v_exam`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam` AS select `exam`.`id` AS `id`,`exam`.`e_no` AS `e_no`,`exam`.`exam_name` AS `exam_name`,`exam`.`exam_type` AS `exam_type`,`exam`.`semester_id` AS `semester_id`,`exam`.`exam_state` AS `exam_state`,`exam`.`create_progress` AS `create_progress`,`exam`.`grade_id` AS `grade_id`,`exam`.`begin_date` AS `begin_date`,`exam`.`end_date` AS `end_date`,`exam`.`create_user` AS `create_user`,`exam`.`create_time` AS `create_time`,`exam`.`last_modify_user` AS `last_modify_user`,`exam`.`last_modify_time` AS `last_modify_time`,`exam`.`remark` AS `remark`,`exam`.`deleted` AS `deleted` from `exam` where (`exam`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_exam_room
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_room`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_room` AS select `exam_room`.`id` AS `id`,`exam_room`.`exam_id` AS `exam_id`,`exam_room`.`room_no` AS `room_no`,`exam_room`.`room_place` AS `room_place`,`exam_room`.`room_name` AS `room_name`,`exam_room`.`different_place_tag` AS `different_place_tag`,`exam_room`.`rent_tag` AS `rent_tag`,`exam_room`.`rent_grade_id` AS `rent_grade_id`,`exam_room`.`rent_state` AS `rent_state`,`exam_room`.`max_size` AS `max_size`,`exam_room`.`create_user` AS `create_user`,`exam_room`.`create_time` AS `create_time`,`exam_room`.`last_modify_user` AS `last_modify_user`,`exam_room`.`last_modify_time` AS `last_modify_time`,`exam_room`.`remark` AS `remark`,`exam_room`.`deleted` AS `deleted` from `exam_room` where (`exam_room`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_exam_room_count
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_room_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_room_count` AS select `v_exam`.`id` AS `exam_id`,count(distinct `v_exam_room`.`id`) AS `room_count` from (`v_exam` left join `v_exam_room` on((`v_exam`.`id` = `v_exam_room`.`exam_id`))) ;

-- ----------------------------
-- View structure for v_exam_score
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_score`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_score` AS select `exam_score`.`id` AS `id`,`exam_score`.`exam_sub_stu_id` AS `exam_sub_stu_id`,`exam_score`.`exam_teac_mar_id` AS `exam_teac_mar_id`,`exam_score`.`exam_subject_id` AS `exam_subject_id`,`exam_score`.`score` AS `score`,`exam_score`.`create_user` AS `create_user`,`exam_score`.`create_time` AS `create_time`,`exam_score`.`last_modify_user` AS `last_modify_user`,`exam_score`.`last_modify_time` AS `last_modify_time`,`exam_score`.`remark` AS `remark`,`exam_score`.`deleted` AS `deleted` from `exam_score` where (`exam_score`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_exam_student_count
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_student_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_student_count` AS select `v_exam`.`id` AS `exam_id`,count(distinct `v_exam_subject_student`.`student_id`) AS `student_count` from (`v_exam` left join `v_exam_subject_student` on((`v_exam`.`id` = `v_exam_subject_student`.`exam_id`))) group by `v_exam`.`id` ;

-- ----------------------------
-- View structure for v_exam_subject
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_subject`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_subject` AS select `exam_subject`.`id` AS `id`,`exam_subject`.`name` AS `name`,`exam_subject`.`exam_id` AS `exam_id`,`exam_subject`.`subject_id` AS `subject_id`,`exam_subject`.`begin_time` AS `begin_time`,`exam_subject`.`end_time` AS `end_time`,`exam_subject`.`create_user` AS `create_user`,`exam_subject`.`create_time` AS `create_time`,`exam_subject`.`last_modify_user` AS `last_modify_user`,`exam_subject`.`last_modify_time` AS `last_modify_time`,`exam_subject`.`remark` AS `remark`,`exam_subject`.`deleted` AS `deleted` from `exam_subject` where (`exam_subject`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_exam_subject_student
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_subject_student`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_subject_student` AS select `exam_subject_student`.`id` AS `id`,`exam_subject_student`.`exam_id` AS `exam_id`,`exam_subject_student`.`student_id` AS `student_id`,`exam_subject_student`.`exam_subject_id` AS `exam_subject_id`,`exam_subject_student`.`exam_room_id` AS `exam_room_id`,`exam_subject_student`.`create_user` AS `create_user`,`exam_subject_student`.`create_time` AS `create_time`,`exam_subject_student`.`last_modify_user` AS `last_modify_user`,`exam_subject_student`.`last_modify_time` AS `last_modify_time`,`exam_subject_student`.`remark` AS `remark`,`exam_subject_student`.`deleted` AS `deleted` from `exam_subject_student` where (`exam_subject_student`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_exam_teacher_inviglate
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_teacher_inviglate`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_teacher_inviglate` AS select `exam_teacher_inviglate`.`id` AS `id`,`exam_teacher_inviglate`.`teacher_id` AS `teacher_id`,`exam_teacher_inviglate`.`exam_subject_id` AS `exam_subject_id`,`exam_teacher_inviglate`.`exam_id` AS `exam_id`,`exam_teacher_inviglate`.`create_user` AS `create_user`,`exam_teacher_inviglate`.`create_time` AS `create_time`,`exam_teacher_inviglate`.`last_modify_user` AS `last_modify_user`,`exam_teacher_inviglate`.`last_modify_time` AS `last_modify_time`,`exam_teacher_inviglate`.`remark` AS `remark`,`exam_teacher_inviglate`.`deleted` AS `deleted` from `exam_teacher_inviglate` where (`exam_teacher_inviglate`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_exam_teacher_marking
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_teacher_marking`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_teacher_marking` AS select `exam_teacher_marking`.`id` AS `id`,`exam_teacher_marking`.`teacher_id` AS `teacher_id`,`exam_teacher_marking`.`exam_subject_id` AS `exam_subject_id`,`exam_teacher_marking`.`exam_id` AS `exam_id`,`exam_teacher_marking`.`create_user` AS `create_user`,`exam_teacher_marking`.`create_time` AS `create_time`,`exam_teacher_marking`.`last_modify_user` AS `last_modify_user`,`exam_teacher_marking`.`last_modify_time` AS `last_modify_time`,`exam_teacher_marking`.`remark` AS `remark`,`exam_teacher_marking`.`deleted` AS `deleted` from `exam_teacher_marking` where (`exam_teacher_marking`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_exam_teac_inv_room_middle
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_teac_inv_room_middle`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_teac_inv_room_middle` AS select `exam_teac_inv_room_middle`.`id` AS `id`,`exam_teac_inv_room_middle`.`teacher_inv_id` AS `teacher_inv_id`,`exam_teac_inv_room_middle`.`exam_room_id` AS `exam_room_id`,`exam_teac_inv_room_middle`.`create_user` AS `create_user`,`exam_teac_inv_room_middle`.`create_time` AS `create_time`,`exam_teac_inv_room_middle`.`last_modify_user` AS `last_modify_user`,`exam_teac_inv_room_middle`.`last_modify_time` AS `last_modify_time`,`exam_teac_inv_room_middle`.`remark` AS `remark`,`exam_teac_inv_room_middle`.`deleted` AS `deleted` from `exam_teac_inv_room_middle` where (`exam_teac_inv_room_middle`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_grade_team
-- ----------------------------
DROP VIEW IF EXISTS `v_grade_team`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_grade_team` AS select `grade_team`.`id` AS `id`,`grade_team`.`g_no` AS `g_no`,`grade_team`.`name` AS `name`,`grade_team`.`grade_type` AS `grade_type`,`grade_team`.`grade_master_id` AS `grade_master_id`,`grade_team`.`grade_master_name` AS `grade_master_name`,`grade_team`.`enter_study_time` AS `enter_study_time`,`grade_team`.`end_study_time` AS `end_study_time`,`grade_team`.`create_user` AS `create_user`,`grade_team`.`create_time` AS `create_time`,`grade_team`.`last_modify_user` AS `last_modify_user`,`grade_team`.`last_modify_time` AS `last_modify_time`,`grade_team`.`remark` AS `remark`,`grade_team`.`deleted` AS `deleted` from `grade_team` where (`grade_team`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_lg_permission
-- ----------------------------
DROP VIEW IF EXISTS `v_lg_permission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lg_permission` AS select `lg_permission`.`id` AS `id`,`lg_permission`.`permission_name` AS `permission_name`,`lg_permission`.`description` AS `description`,`lg_permission`.`permission_type` AS `permission_type`,`lg_permission`.`url` AS `url`,`lg_permission`.`create_user` AS `create_user`,`lg_permission`.`create_time` AS `create_time`,`lg_permission`.`last_modify_user` AS `last_modify_user`,`lg_permission`.`last_modify_time` AS `last_modify_time`,`lg_permission`.`remark` AS `remark`,`lg_permission`.`deleted` AS `deleted` from `lg_permission` where (`lg_permission`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_lg_role
-- ----------------------------
DROP VIEW IF EXISTS `v_lg_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lg_role` AS select `lg_role`.`id` AS `id`,`lg_role`.`role_name` AS `role_name`,`lg_role`.`role_type` AS `role_type`,`lg_role`.`description` AS `description`,`lg_role`.`create_user` AS `create_user`,`lg_role`.`create_time` AS `create_time`,`lg_role`.`last_modify_user` AS `last_modify_user`,`lg_role`.`last_modify_time` AS `last_modify_time`,`lg_role`.`remark` AS `remark`,`lg_role`.`deleted` AS `deleted` from `lg_role` where (`lg_role`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_lg_role_permission_middle
-- ----------------------------
DROP VIEW IF EXISTS `v_lg_role_permission_middle`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lg_role_permission_middle` AS select `lg_role_permission_middle`.`id` AS `id`,`lg_role_permission_middle`.`role_id` AS `role_id`,`lg_role_permission_middle`.`permission_id` AS `permission_id`,`lg_role_permission_middle`.`create_user` AS `create_user`,`lg_role_permission_middle`.`create_time` AS `create_time`,`lg_role_permission_middle`.`last_modify_user` AS `last_modify_user`,`lg_role_permission_middle`.`last_modify_time` AS `last_modify_time`,`lg_role_permission_middle`.`remark` AS `remark`,`lg_role_permission_middle`.`deleted` AS `deleted` from `lg_role_permission_middle` where (`lg_role_permission_middle`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_lg_user
-- ----------------------------
DROP VIEW IF EXISTS `v_lg_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lg_user` AS select `lg_user`.`id` AS `id`,`lg_user`.`username` AS `username`,`lg_user`.`password` AS `password`,`lg_user`.`password_salt` AS `password_salt`,`lg_user`.`member_id` AS `member_id`,`lg_user`.`member_type` AS `member_type`,`lg_user`.`phonenum` AS `phonenum`,`lg_user`.`vxnum` AS `vxnum`,`lg_user`.`create_user` AS `create_user`,`lg_user`.`create_time` AS `create_time`,`lg_user`.`last_modify_user` AS `last_modify_user`,`lg_user`.`last_modify_time` AS `last_modify_time`,`lg_user`.`remark` AS `remark`,`lg_user`.`deleted` AS `deleted` from `lg_user` where (`lg_user`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_lg_user_role_middle
-- ----------------------------
DROP VIEW IF EXISTS `v_lg_user_role_middle`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lg_user_role_middle` AS select `lg_user_role_middle`.`id` AS `id`,`lg_user_role_middle`.`role_id` AS `role_id`,`lg_user_role_middle`.`user_id` AS `user_id`,`lg_user_role_middle`.`create_user` AS `create_user`,`lg_user_role_middle`.`create_time` AS `create_time`,`lg_user_role_middle`.`last_modify_user` AS `last_modify_user`,`lg_user_role_middle`.`last_modify_time` AS `last_modify_time`,`lg_user_role_middle`.`remark` AS `remark`,`lg_user_role_middle`.`deleted` AS `deleted` from `lg_user_role_middle` where (`lg_user_role_middle`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_pro_rent_exam_room
-- ----------------------------
DROP VIEW IF EXISTS `v_pro_rent_exam_room`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pro_rent_exam_room` AS select `pro_rent_exam_room`.`id` AS `id`,`pro_rent_exam_room`.`rent_remark` AS `rent_remark`,`pro_rent_exam_room`.`applicant_id` AS `applicant_id`,`pro_rent_exam_room`.`applicant_type` AS `applicant_type`,`pro_rent_exam_room`.`approval_by_id` AS `approval_by_id`,`pro_rent_exam_room`.`approval_by_type` AS `approval_by_type`,`pro_rent_exam_room`.`launch_date` AS `launch_date`,`pro_rent_exam_room`.`dead_date` AS `dead_date`,`pro_rent_exam_room`.`pro_state` AS `pro_state`,`pro_rent_exam_room`.`opinion` AS `opinion`,`pro_rent_exam_room`.`create_user` AS `create_user`,`pro_rent_exam_room`.`create_time` AS `create_time`,`pro_rent_exam_room`.`last_modify_user` AS `last_modify_user`,`pro_rent_exam_room`.`last_modify_time` AS `last_modify_time`,`pro_rent_exam_room`.`remark` AS `remark`,`pro_rent_exam_room`.`deleted` AS `deleted` from `pro_rent_exam_room` where (`pro_rent_exam_room`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_semester
-- ----------------------------
DROP VIEW IF EXISTS `v_semester`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_semester` AS select `semester`.`id` AS `id`,`semester`.`value` AS `value`,`semester`.`name` AS `name`,`semester`.`begin_time` AS `begin_time`,`semester`.`over_time` AS `over_time`,`semester`.`create_user` AS `create_user`,`semester`.`create_time` AS `create_time`,`semester`.`last_modify_user` AS `last_modify_user`,`semester`.`last_modify_time` AS `last_modify_time`,`semester`.`remark` AS `remark`,`semester`.`deleted` AS `deleted` from `semester` where (`semester`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_student
-- ----------------------------
DROP VIEW IF EXISTS `v_student`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_student` AS select `student`.`id` AS `id`,`student`.`name` AS `name`,`student`.`sex` AS `sex`,`student`.`birthday` AS `birthday`,`student`.`member_type` AS `member_type`,`student`.`resp_type` AS `resp_type`,`student`.`s_no` AS `s_no`,`student`.`clazz_master_id` AS `clazz_master_id`,`student`.`clazz_id` AS `clazz_id`,`student`.`father_name` AS `father_name`,`student`.`father_phone` AS `father_phone`,`student`.`mother_name` AS `mother_name`,`student`.`mother_phone` AS `mother_phone`,`student`.`em_contact_name` AS `em_contact_name`,`student`.`em_contact_phone` AS `em_contact_phone`,`student`.`create_user` AS `create_user`,`student`.`create_time` AS `create_time`,`student`.`last_modify_user` AS `last_modify_user`,`student`.`last_modify_time` AS `last_modify_time`,`student`.`remark` AS `remark`,`student`.`deleted` AS `deleted` from `student` where (`student`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_subject
-- ----------------------------
DROP VIEW IF EXISTS `v_subject`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_subject` AS select `subject`.`id` AS `id`,`subject`.`sub_no` AS `sub_no`,`subject`.`name` AS `name`,`subject`.`subject_type` AS `subject_type`,`subject`.`create_user` AS `create_user`,`subject`.`create_time` AS `create_time`,`subject`.`last_modify_user` AS `last_modify_user`,`subject`.`last_modify_time` AS `last_modify_time`,`subject`.`remark` AS `remark`,`subject`.`deleted` AS `deleted` from `subject` where (`subject`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_task
-- ----------------------------
DROP VIEW IF EXISTS `v_task`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_task` AS select `task`.`id` AS `id`,`task`.`cron` AS `cron`,`task`.`task_no` AS `task_no`,`task`.`name` AS `name`,`task`.`create_user` AS `create_user`,`task`.`create_time` AS `create_time`,`task`.`last_modify_user` AS `last_modify_user`,`task`.`last_modify_time` AS `last_modify_time`,`task`.`remark` AS `remark`,`task`.`deleted` AS `deleted` from `task` where (`task`.`deleted` = 0) ;

-- ----------------------------
-- View structure for v_teacher
-- ----------------------------
DROP VIEW IF EXISTS `v_teacher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teacher` AS select `teacher`.`id` AS `id`,`teacher`.`name` AS `name`,`teacher`.`sex` AS `sex`,`teacher`.`birthday` AS `birthday`,`teacher`.`member_type` AS `member_type`,`teacher`.`resp_type` AS `resp_type`,`teacher`.`is_clazz_master` AS `is_clazz_master`,`teacher`.`is_grade_master` AS `is_grade_master`,`teacher`.`is_school_master` AS `is_school_master`,`teacher`.`t_no` AS `t_no`,`teacher`.`grade_id` AS `grade_id`,`teacher`.`grade_master_id` AS `grade_master_id`,`teacher`.`next_id` AS `next_id`,`teacher`.`create_user` AS `create_user`,`teacher`.`create_time` AS `create_time`,`teacher`.`last_modify_user` AS `last_modify_user`,`teacher`.`last_modify_time` AS `last_modify_time`,`teacher`.`remark` AS `remark`,`teacher`.`deleted` AS `deleted` from `teacher` where (`teacher`.`deleted` = 0) ;
