/*
 Navicat Premium Data Transfer

 Source Server         : sdkweb测试数据库
 Source Server Type    : MySQL
 Source Server Version : 50642
 Source Host           : 192.168.60.69:3306
 Source Schema         : easyweb

 Target Server Type    : MySQL
 Target Server Version : 50642
 File Encoding         : 65001

 Date: 28/10/2019 10:37:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) DEFAULT NULL,
  `sdk_version` varchar(2000) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lastup_time` datetime DEFAULT NULL,
  `app_port` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_appname` (`app_name`(20))
) ENGINE=InnoDB AUTO_INCREMENT=713 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for app_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `app_info_detail`;
CREATE TABLE `app_info_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `app_info` varchar(255) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `connect_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_topic` (`topic`(30)),
  KEY `idx_group` (`group`(30))
) ENGINE=InnoDB AUTO_INCREMENT=1847 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for sys_authorities
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorities`;
CREATE TABLE `sys_authorities` (
  `authority_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `authority_name` varchar(20) NOT NULL COMMENT '权限名称',
  `authority` varchar(40) DEFAULT NULL COMMENT '授权标识',
  `menu_url` varchar(40) DEFAULT NULL COMMENT '菜单url',
  `parent_id` int(11) NOT NULL DEFAULT '-1' COMMENT '父id',
  `is_menu` int(1) NOT NULL DEFAULT '0' COMMENT '0菜单，1按钮',
  `order_number` int(3) NOT NULL DEFAULT '0' COMMENT '排序号',
  `menu_icon` varchar(20) DEFAULT NULL COMMENT '菜单图标',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典';

-- ----------------------------
-- Table structure for sys_dictionarydata
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionarydata`;
CREATE TABLE `sys_dictionarydata` (
  `dictdata_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典项主键',
  `dict_code` int(11) NOT NULL COMMENT '字典主键',
  `dictdata_name` varchar(40) NOT NULL COMMENT '字典项值',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `sort_number` int(1) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`dictdata_code`),
  KEY `FK_Reference_36` (`dict_code`),
  CONSTRAINT `sys_dictionarydata_ibfk_1` FOREIGN KEY (`dict_code`) REFERENCES `sys_dictionary` (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='字典项';

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `os_name` varchar(40) DEFAULT NULL COMMENT '操作系统',
  `device` varchar(40) DEFAULT NULL COMMENT '设备名',
  `browser_type` varchar(40) DEFAULT NULL COMMENT '浏览器类型',
  `ip_address` varchar(40) DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`),
  KEY `FK_sys_login_record_user` (`user_id`),
  CONSTRAINT `sys_login_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6126 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for sys_person
-- ----------------------------
DROP TABLE IF EXISTS `sys_person`;
CREATE TABLE `sys_person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员id',
  `true_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `department_id` varchar(8) DEFAULT NULL COMMENT '部门id',
  `position_id` varchar(8) DEFAULT NULL COMMENT '职位id',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='人员表';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除，0否，1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Table structure for sys_role_authorities
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_authorities`;
CREATE TABLE `sys_role_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `authority_id` int(11) NOT NULL COMMENT '权限id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_sys_role_permission_pm` (`authority_id`),
  KEY `FK_sys_role_permission_role` (`role_id`),
  CONSTRAINT `sys_role_authorities_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `sys_role_authorities_ibfk_3` FOREIGN KEY (`authority_id`) REFERENCES `sys_authorities` (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色权限关联表';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '账号',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `nick_name` varchar(20) NOT NULL COMMENT '昵称',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `sex` varchar(1) NOT NULL DEFAULT '男' COMMENT '性别',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `email_verified` int(11) DEFAULT NULL COMMENT '邮箱是否验证，0未验证，1已验证',
  `person_id` varchar(8) DEFAULT NULL COMMENT '人员id,关联person表',
  `person_type` int(11) DEFAULT NULL COMMENT '人员类型,比如:0学生,1教师',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0正常，1冻结',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_account` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_user_role` (`user_id`),
  KEY `FK_sys_user_role_role` (`role_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

-- ----------------------------
-- Table structure for t_group_info
-- ----------------------------
DROP TABLE IF EXISTS `t_group_info`;
CREATE TABLE `t_group_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) DEFAULT NULL,
  `group_key` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remaker` varchar(255) DEFAULT NULL,
  `lastup_time` timestamp NULL DEFAULT NULL,
  `team_code` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `ddNumber` varchar(255) DEFAULT NULL,
  `offset` varchar(255) DEFAULT 'ZK',
  `kafka_group` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uiq_topic_group` (`group`(40),`topic`(60),`kafka_group`(6))
) ENGINE=InnoDB AUTO_INCREMENT=914 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_jar
-- ----------------------------
DROP TABLE IF EXISTS `t_jar`;
CREATE TABLE `t_jar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(100) DEFAULT NULL,
  `jar` varchar(60000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for t_topic_info
-- ----------------------------
DROP TABLE IF EXISTS `t_topic_info`;
CREATE TABLE `t_topic_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `topic_key` varchar(255) DEFAULT NULL,
  `kafka_group` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remaker` varchar(255) DEFAULT NULL,
  `lastup_time` timestamp NULL DEFAULT NULL,
  `team_code` varchar(255) DEFAULT NULL,
  `dd_number` varchar(255) DEFAULT NULL COMMENT '告警钉钉号',
  `packet` varchar(5) DEFAULT 'false' COMMENT '封包',
  `send_local` varchar(5) DEFAULT 'false' COMMENT '写本地',
  `rate_limit` int(11) NOT NULL DEFAULT '0' COMMENT '限流qps',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uiq_topic` (`topic`(60),`kafka_group`(6))
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
