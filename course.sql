/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : elective

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2021-04-26 21:55:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `credit` int(11) NOT NULL DEFAULT '0',
  `end_time` datetime DEFAULT NULL,
  `limit_num` int(11) NOT NULL DEFAULT '0',
  `name` varchar(25) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `selected` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKqwmcv0fcio215pf0ypi6ft96x` (`teacher_id`),
  CONSTRAINT `FKqwmcv0fcio215pf0ypi6ft96x` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('10000', '2021-02-24 09:44:15', '', '2021-03-01 09:44:27', '2021-03-18 09:44:37', '2', '2021-04-01 09:44:45', '100', '数学', '2', '0');
INSERT INTO `course` VALUES ('10001', '2021-04-11 08:03:00', '', '2021-04-11 08:03:55', '2021-04-11 08:00:00', '2', '2021-05-11 08:00:00', '100', '生活中的化学', '2', '0');
INSERT INTO `course` VALUES ('10002', '2021-04-11 08:03:00', '', '2021-04-25 09:42:15', '2021-06-10 09:16:59', '2', '2021-06-30 09:17:23', '100', '生活中的物理学', '1', '1');
INSERT INTO `course` VALUES ('10003', '2021-04-11 08:03:00', '', '2021-04-24 02:17:28', '2021-06-10 09:19:01', '2', '2021-06-30 09:19:12', '100', '心理学', '2', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `credit` int(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `number` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `status` tinyint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2021-04-11 08:03:53', '', '2021-04-23 14:25:33', '0', '张三', '10001', 'e10adc3949ba59abbe56e057f20f883e', '0', '1');
INSERT INTO `user` VALUES ('2', '2021-04-11 08:03:55', '', '2021-04-23 14:19:33', '0', '王老师', '00001', 'fc32d2ef26c4fcf6cbeb2cd222dd56c3', '1', '1');

-- ----------------------------
-- Table structure for `user_course`
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) DEFAULT NULL,
  `grade` double NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKka18m18kpimodvy8yg2icu083` (`course_id`),
  KEY `FK93qr1ow9fb8cpq3p77wlq3i9b` (`student_id`),
  CONSTRAINT `FK93qr1ow9fb8cpq3p77wlq3i9b` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKka18m18kpimodvy8yg2icu083` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_course
-- ----------------------------
INSERT INTO `user_course` VALUES ('2', '', '0', '0', '10002', '1', '2021-04-25 09:41:55', '2021-04-25 09:42:15');
