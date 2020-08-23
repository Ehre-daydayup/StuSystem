/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : stusystem

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2018-05-12 17:41:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `score_id` int(20) NOT NULL AUTO_INCREMENT,
  `student_id` int(20) NOT NULL,
  `subject_id` int(20) NOT NULL,
  `score` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`score_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '10001', '1', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(20) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(10) NOT NULL,
  `stu_sex` varchar(1) NOT NULL,
  `stu_system` varchar(10) NOT NULL,
  `stu_class` varchar(10) NOT NULL,
  `stu_phone` varchar(20) NOT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('10001', '123', '男', '123', '123', '18482173147');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_id` int(10) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(20) NOT NULL,
  `teacher_name` varchar(10) NOT NULL,
  `subject_credit` varchar(3) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '123', '123', '123');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` int(20) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(10) NOT NULL,
  `teacher_sex` varchar(1) NOT NULL,
  `teacher_system` varchar(20) NOT NULL,
  `teacher_phone` varchar(20) NOT NULL,
  `teacher_email` varchar(20) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('20001', '123', '男', '123', '18482173147', '1093615728@qq.com');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(5) NOT NULL,
  `admin` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10001', '李四', '1234', '3');
INSERT INTO `user` VALUES ('10003', 'admin', 'admin', '1');
INSERT INTO `user` VALUES ('20001', '王二', '1234', '2');
