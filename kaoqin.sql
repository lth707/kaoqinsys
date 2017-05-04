/*
Navicat MySQL Data Transfer

Source Server         : lth
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kaoqin

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-05-04 11:55:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '课程的名字',
  `classroom` varchar(255) DEFAULT NULL COMMENT '教室',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '语文', '1-4-1');
INSERT INTO `course` VALUES ('2', '数学', '1-4-2');
INSERT INTO `course` VALUES ('3', '英语', '1-4-3');
INSERT INTO `course` VALUES ('4', '高数', '1-4-2');
INSERT INTO `course` VALUES ('5', '大学英语', '2-3-1');
INSERT INTO `course` VALUES ('6', '体育', '1-4-1');
INSERT INTO `course` VALUES ('7', '政治', '2-3-1');
INSERT INTO `course` VALUES ('8', '物理', '1-4-3');
INSERT INTO `course` VALUES ('9', '生物', '1-5-1');
INSERT INTO `course` VALUES ('10', '化学', '1-3-2');
INSERT INTO `course` VALUES ('11', '历史', '2-3-9');
INSERT INTO `course` VALUES ('12', '美术', '3-6-5');

-- ----------------------------
-- Table structure for course_timemap
-- ----------------------------
DROP TABLE IF EXISTS `course_timemap`;
CREATE TABLE `course_timemap` (
  `course_id` int(11) DEFAULT NULL,
  `timemap` int(11) DEFAULT NULL COMMENT '时间map(0-50)',
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_timemap_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_timemap
-- ----------------------------
INSERT INTO `course_timemap` VALUES ('1', '0');
INSERT INTO `course_timemap` VALUES ('1', '5');
INSERT INTO `course_timemap` VALUES ('2', '1');
INSERT INTO `course_timemap` VALUES ('2', '6');
INSERT INTO `course_timemap` VALUES ('3', '2');
INSERT INTO `course_timemap` VALUES ('3', '7');
INSERT INTO `course_timemap` VALUES ('4', '3');
INSERT INTO `course_timemap` VALUES ('4', '8');
INSERT INTO `course_timemap` VALUES ('5', '4');
INSERT INTO `course_timemap` VALUES ('5', '9');
INSERT INTO `course_timemap` VALUES ('6', '15');
INSERT INTO `course_timemap` VALUES ('6', '10');
INSERT INTO `course_timemap` VALUES ('7', '11');
INSERT INTO `course_timemap` VALUES ('7', '16');
INSERT INTO `course_timemap` VALUES ('8', '12');
INSERT INTO `course_timemap` VALUES ('8', '17');
INSERT INTO `course_timemap` VALUES ('9', '13');
INSERT INTO `course_timemap` VALUES ('9', '18');
INSERT INTO `course_timemap` VALUES ('10', '14');
INSERT INTO `course_timemap` VALUES ('10', '19');
INSERT INTO `course_timemap` VALUES ('11', '20');
INSERT INTO `course_timemap` VALUES ('11', '25');
INSERT INTO `course_timemap` VALUES ('12', '21');
INSERT INTO `course_timemap` VALUES ('12', '26');

-- ----------------------------
-- Table structure for course_week
-- ----------------------------
DROP TABLE IF EXISTS `course_week`;
CREATE TABLE `course_week` (
  `course_id` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_week_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_week
-- ----------------------------
INSERT INTO `course_week` VALUES ('1', '20', '2016', '2');
INSERT INTO `course_week` VALUES ('2', '20', '2016', '2');
INSERT INTO `course_week` VALUES ('3', '19', '2016', '2');
INSERT INTO `course_week` VALUES ('4', '20', '2016', '2');
INSERT INTO `course_week` VALUES ('5', '20', '2016', '2');
INSERT INTO `course_week` VALUES ('6', '20', '2016', '2');
INSERT INTO `course_week` VALUES ('7', '20', '2016', '2');
INSERT INTO `course_week` VALUES ('8', '19', '2016', '2');
INSERT INTO `course_week` VALUES ('9', '14', '2016', '2');
INSERT INTO `course_week` VALUES ('10', '14', '2016', '2');
INSERT INTO `course_week` VALUES ('11', '14', '2016', '2');
INSERT INTO `course_week` VALUES ('12', '14', '2016', '2');

-- ----------------------------
-- Table structure for kaoqin_record
-- ----------------------------
DROP TABLE IF EXISTS `kaoqin_record`;
CREATE TABLE `kaoqin_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `time_map` int(11) DEFAULT NULL COMMENT '这是一个时间匹配，范围是0-49',
  `student_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '表示学生有没有来上课，1表示出勤，0代表缺勤',
  `week` int(255) DEFAULT NULL COMMENT '第几周的课',
  `year` int(11) DEFAULT NULL COMMENT '代表第几年',
  `term` tinyint(4) DEFAULT NULL COMMENT '学期',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `course_id` (`course_id`),
  KEY `time_map` (`time_map`),
  CONSTRAINT `kaoqin_record_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `kaoqin_record_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `kaoqin_record_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kaoqin_record
-- ----------------------------
INSERT INTO `kaoqin_record` VALUES ('335', '1', '1', '0', '1', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('336', '1', '1', '0', '2', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('337', '1', '1', '0', '3', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('338', '1', '1', '0', '4', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('339', '1', '1', '0', '5', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('340', '1', '1', '0', '7', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('341', '1', '1', '0', '9', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('342', '1', '1', '5', '1', '0', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('343', '1', '1', '5', '2', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('344', '1', '1', '5', '3', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('345', '1', '1', '5', '4', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('346', '1', '1', '5', '5', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('347', '1', '1', '5', '7', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('348', '1', '1', '5', '9', '1', '10', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('349', '1', '1', '0', '1', '1', '11', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('350', '1', '1', '0', '2', '1', '11', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('351', '1', '1', '0', '3', '1', '11', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('352', '1', '1', '0', '4', '1', '11', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('353', '1', '1', '0', '5', '1', '11', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('354', '1', '1', '0', '7', '1', '11', '2016', '2');
INSERT INTO `kaoqin_record` VALUES ('355', '1', '1', '0', '9', '1', '11', '2016', '2');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL COMMENT '学号',
  `classnum` int(255) DEFAULT NULL COMMENT '班级',
  `grade` int(11) DEFAULT NULL COMMENT '年级1-4',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '李同学', '1', '20130001', '5', '1');
INSERT INTO `student` VALUES ('2', '何同学', '1', '20130002', '5', '1');
INSERT INTO `student` VALUES ('3', '林同学', '0', '20130003', '5', '1');
INSERT INTO `student` VALUES ('4', '赵同学', '0', '20130004', '5', '1');
INSERT INTO `student` VALUES ('5', '钱同学', '1', '20130005', '5', '1');
INSERT INTO `student` VALUES ('6', '孙同学', '1', '20130006', '5', '1');
INSERT INTO `student` VALUES ('7', '周同学', '1', '20130007', '5', '1');
INSERT INTO `student` VALUES ('8', '吴同学', '0', '20130008', '5', '1');
INSERT INTO `student` VALUES ('9', '郑同学', '0', '20130009', '5', '1');
INSERT INTO `student` VALUES ('10', '王同学', '1', '20130010', '5', '1');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `student_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES ('1', '1');
INSERT INTO `student_course` VALUES ('2', '1');
INSERT INTO `student_course` VALUES ('3', '1');
INSERT INTO `student_course` VALUES ('4', '1');
INSERT INTO `student_course` VALUES ('5', '1');
INSERT INTO `student_course` VALUES ('2', '2');
INSERT INTO `student_course` VALUES ('4', '2');
INSERT INTO `student_course` VALUES ('5', '2');
INSERT INTO `student_course` VALUES ('6', '2');
INSERT INTO `student_course` VALUES ('7', '2');
INSERT INTO `student_course` VALUES ('7', '1');
INSERT INTO `student_course` VALUES ('9', '1');
INSERT INTO `student_course` VALUES ('1', '3');
INSERT INTO `student_course` VALUES ('1', '2');
INSERT INTO `student_course` VALUES ('1', '5');
INSERT INTO `student_course` VALUES ('1', '11');
INSERT INTO `student_course` VALUES ('2', '11');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) DEFAULT NULL COMMENT '工号',
  `name` varchar(255) DEFAULT NULL COMMENT '老师的名字',
  `sex` tinyint(4) DEFAULT NULL COMMENT '老师的性别',
  `password` varchar(255) DEFAULT NULL,
  `isadmin` tinyint(4) DEFAULT NULL COMMENT '是否是管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '1000', '李老师', '1', '123', '1');
INSERT INTO `teacher` VALUES ('2', '1001', '何老师', '1', '123', '0');
INSERT INTO `teacher` VALUES ('3', '1002', '林老师', '1', '123', '0');
INSERT INTO `teacher` VALUES ('4', '1003', '钱老师', '0', '123', '0');
INSERT INTO `teacher` VALUES ('5', '1004', '孙老师', '1', '123', '0');
INSERT INTO `teacher` VALUES ('6', '1005', '赵老师', '0', '123', '0');
INSERT INTO `teacher` VALUES ('7', '1007', '周老师', '1', '123', '0');
INSERT INTO `teacher` VALUES ('8', '1008', '吴老师', '0', '123', '0');
INSERT INTO `teacher` VALUES ('9', '1009', '郑老师', '0', '123', '0');
INSERT INTO `teacher` VALUES ('10', '1010', '王老师', '1', '123', '0');
INSERT INTO `teacher` VALUES ('11', '1011', '刘老师', '0', '1234', '0');
INSERT INTO `teacher` VALUES ('12', '1012', '林老师', '1', '123', '0');

-- ----------------------------
-- Table structure for teacher_course
-- ----------------------------
DROP TABLE IF EXISTS `teacher_course`;
CREATE TABLE `teacher_course` (
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  KEY `teacher_id` (`teacher_id`),
  KEY `courese_id` (`course_id`),
  CONSTRAINT `teacher_course_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `teacher_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_course
-- ----------------------------
INSERT INTO `teacher_course` VALUES ('1', '1');
INSERT INTO `teacher_course` VALUES ('2', '2');
INSERT INTO `teacher_course` VALUES ('3', '3');
INSERT INTO `teacher_course` VALUES ('4', '4');
INSERT INTO `teacher_course` VALUES ('5', '5');
INSERT INTO `teacher_course` VALUES ('6', '6');
INSERT INTO `teacher_course` VALUES ('7', '7');
INSERT INTO `teacher_course` VALUES ('8', '8');
INSERT INTO `teacher_course` VALUES ('9', '9');
INSERT INTO `teacher_course` VALUES ('10', '10');
INSERT INTO `teacher_course` VALUES ('1', '11');
INSERT INTO `teacher_course` VALUES ('2', '12');
