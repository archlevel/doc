/*
 Navicat Premium Data Transfer

 Source Server         : job
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : rm-bp1z63ygq9jq8z3bd.mysql.rds.aliyuncs.com:3306
 Source Schema         : jobs_db

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : 65001

 Date: 28/10/2019 10:40:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alertgroup
-- ----------------------------
DROP TABLE IF EXISTS `alertgroup`;
CREATE TABLE `alertgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `userlist` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for alertjobdepend
-- ----------------------------
DROP TABLE IF EXISTS `alertjobdepend`;
CREATE TABLE `alertjobdepend` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `depend_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for alertjobdeploy
-- ----------------------------
DROP TABLE IF EXISTS `alertjobdeploy`;
CREATE TABLE `alertjobdeploy` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `content` varchar(300) NOT NULL,
  `deployfile` varchar(100) NOT NULL,
  `stat` int(11) DEFAULT NULL,
  `mod_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for alertjoberror
-- ----------------------------
DROP TABLE IF EXISTS `alertjoberror`;
CREATE TABLE `alertjoberror` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL COMMENT 'Job id',
  `error_id` int(11) NOT NULL,
  `findtime` datetime DEFAULT NULL COMMENT '发现错误时间',
  `reason` varchar(500) NOT NULL DEFAULT '' COMMENT '错误原因',
  `errorresult` varchar(500) NOT NULL,
  `errorlevel` varchar(10) NOT NULL,
  `process` varchar(500) NOT NULL,
  `finetime` datetime DEFAULT NULL,
  `mod_time` datetime DEFAULT NULL,
  `error_type` int(11) NOT NULL COMMENT '错误类型 1=>该结束未结束 2=>该运行未运行 3=>执行命令异常 4=>Job平台标识正在运行，但是在机器上没有发现job进程 5=>Job平台标识没有运行，但是在机器上发现了job进程 6=>运行时间过短',
  `stat` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11870957 DEFAULT CHARSET=utf8 COMMENT='错误日志记录';

-- ----------------------------
-- Table structure for alertjobhost
-- ----------------------------
DROP TABLE IF EXISTS `alertjobhost`;
CREATE TABLE `alertjobhost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `env` varchar(100) NOT NULL,
  `note` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `capacity` varchar(50) NOT NULL,
  `available_mem` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用内存',
  `total_mem` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总内存数量',
  `weight` tinyint(3) NOT NULL DEFAULT '1' COMMENT '权重',
  `time` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for alertjoblist
-- ----------------------------
DROP TABLE IF EXISTS `alertjoblist`;
CREATE TABLE `alertjoblist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Job的名字',
  `belong` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'job所属组',
  `belong_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'job类型 1：蘑菇 2：蘑菇哒 3：经纪人',
  `env` varchar(50) NOT NULL DEFAULT '' COMMENT '环境',
  `server` varchar(100) NOT NULL DEFAULT '' COMMENT '服务器',
  `owner` varchar(100) NOT NULL COMMENT '负责人uid',
  `relate_owner` varchar(100) NOT NULL COMMENT '相关人uid',
  `job_type` int(11) DEFAULT NULL COMMENT '类型 1：常驻 2：周期 3：一次性 4：依赖',
  `run_status` int(11) DEFAULT NULL COMMENT '状态：1 等待调度时间到来 2  运行中 3：一次性Job运行好了 ',
  `is_manage` int(11) DEFAULT NULL COMMENT '是否允许调度',
  `command` varchar(3000) NOT NULL DEFAULT '' COMMENT 'å‘½ä»¤',
  `job_start` varchar(50) NOT NULL DEFAULT '' COMMENT 'Jobcrontab配置',
  `job_first_start` int(11) NOT NULL COMMENT 'Job下一次运行时间',
  `job_runinterval` int(11) NOT NULL COMMENT '运行间隔（每隔多久运行一次）',
  `job_runtime` int(11) NOT NULL COMMENT '运行时长',
  `job_threshold_up` int(11) DEFAULT NULL COMMENT 'job运行时长上限',
  `job_threshold_down` int(11) DEFAULT NULL COMMENT 'job运行时长下限',
  `cur_log` varchar(50) NOT NULL COMMENT '游标值',
  `cur_path` varchar(100) NOT NULL COMMENT '游标路径',
  `cur_time` int(11) NOT NULL COMMENT '游标更新时间',
  `error_group` int(11) DEFAULT NULL COMMENT '错误组id',
  `error_code` int(11) DEFAULT NULL COMMENT '错误编码',
  `effect` varchar(500) NOT NULL COMMENT 'Job的标签',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT 'Job描述',
  `iswatch` int(11) NOT NULL DEFAULT '1',
  `watchmethod` varchar(500) NOT NULL,
  `islog` varchar(100) NOT NULL,
  `job_interval` varchar(10) NOT NULL,
  `job_interval_type` int(11) DEFAULT NULL,
  `delete_log` varchar(500) NOT NULL,
  `ontime` varchar(100) NOT NULL,
  `dbstat` varchar(500) NOT NULL,
  `read_db` varchar(500) NOT NULL,
  `write_db` varchar(500) NOT NULL,
  `mod_time` datetime DEFAULT NULL,
  `job_expected_end` varchar(10) NOT NULL,
  `job_end` varchar(10) NOT NULL,
  `offset` int(11) DEFAULT NULL,
  `job_max_times` int(11) DEFAULT NULL,
  `business_level` tinyint(3) NOT NULL DEFAULT '3' COMMENT '业务级别',
  `run_time_level` varchar(10) NOT NULL,
  `data_source` varchar(500) NOT NULL,
  `job_run_interval` varchar(10) NOT NULL COMMENT '运行间隔',
  `runstat` int(11) NOT NULL DEFAULT '1' COMMENT '是否展示： 1：展示 0：不展示',
  `queue_status` int(11) NOT NULL,
  `site` int(11) NOT NULL,
  `ref` int(11) NOT NULL,
  `max_mem` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用的最大内存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=778 DEFAULT CHARSET=utf8 COMMENT='Job列表';

-- ----------------------------
-- Table structure for alertjoblog
-- ----------------------------
DROP TABLE IF EXISTS `alertjoblog`;
CREATE TABLE `alertjoblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT 'job的id',
  `run_server` varchar(100) NOT NULL DEFAULT '' COMMENT '运行在哪台机器',
  `starttime` datetime DEFAULT NULL COMMENT 'job开始运行时间',
  `endtime` datetime DEFAULT NULL COMMENT 'job结束运行时间',
  `max_mem` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用的最大内存',
  `status` int(11) NOT NULL COMMENT '运转状态 0：成功 1：失败 -1:运行中',
  PRIMARY KEY (`id`),
  KEY `idx_job_id` (`job_id`),
  KEY `idx_starttime` (`starttime`)
) ENGINE=InnoDB AUTO_INCREMENT=14645239 DEFAULT CHARSET=utf8 COMMENT='Job运行日志表';

-- ----------------------------
-- Table structure for alertjobmodlog
-- ----------------------------
DROP TABLE IF EXISTS `alertjobmodlog`;
CREATE TABLE `alertjobmodlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL COMMENT 'job的id',
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT '谁修改的',
  `ontime` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '修改内容',
  `mod_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10039 DEFAULT CHARSET=utf8 COMMENT='Job修改记录';

-- ----------------------------
-- Table structure for alertjobqueue
-- ----------------------------
DROP TABLE IF EXISTS `alertjobqueue`;
CREATE TABLE `alertjobqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `env` varchar(100) NOT NULL,
  `server` varchar(100) NOT NULL,
  `ref` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7842 DEFAULT CHARSET=utf8 COMMENT='这个是停止job的表';

-- ----------------------------
-- Table structure for alertjobqueuelist
-- ----------------------------
DROP TABLE IF EXISTS `alertjobqueuelist`;
CREATE TABLE `alertjobqueuelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT 'Jenkins地址',
  `taskid` varchar(200) DEFAULT NULL COMMENT '运维返回的 任务id',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 -1：进行中  0：失败  1：成功  ',
  `created_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='job发布队列表';

-- ----------------------------
-- Table structure for alertlist
-- ----------------------------
DROP TABLE IF EXISTS `alertlist`;
CREATE TABLE `alertlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '错误级别，1：普通 2：重要',
  `module_id` int(11) DEFAULT NULL COMMENT '模块id',
  `group_id` int(11) DEFAULT NULL COMMENT '组id',
  `job_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Job的id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '告警内容',
  `param` varchar(500) NOT NULL,
  `stat` int(11) DEFAULT NULL COMMENT '状态 0：未处理 2：已处理 2：跳过（报警合并的时候可能会跳过）',
  `created_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_created_time` (`created_time`),
  KEY `idx_stat` (`stat`)
) ENGINE=InnoDB AUTO_INCREMENT=9374280 DEFAULT CHARSET=utf8 COMMENT='告警表';

-- ----------------------------
-- Table structure for alertuser
-- ----------------------------
DROP TABLE IF EXISTS `alertuser`;
CREATE TABLE `alertuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户UID',
  `oauth_Uid` int(11) NOT NULL COMMENT 'oauth的id',
  `superioroid` int(11) NOT NULL COMMENT '上级uid',
  `oauth_UName` varchar(255) NOT NULL DEFAULT '' COMMENT '花名',
  `oauth_EName` varchar(255) NOT NULL DEFAULT '' COMMENT '英文名字',
  `oauth_CName` varchar(255) NOT NULL DEFAULT '' COMMENT '中文名称',
  `oauth_Staffno` varchar(255) NOT NULL DEFAULT '' COMMENT '员工编号',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机',
  `is_admin` int(1) DEFAULT '0' COMMENT '是否是管理员账号(0:否 1:是)',
  `can_publish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发布权限 1：有 0：无',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for all_job_list
-- ----------------------------
DROP TABLE IF EXISTS `all_job_list`;
CREATE TABLE `all_job_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT 'job名称',
  `node_type` varchar(10) NOT NULL DEFAULT '' COMMENT 'job节点类型  mogo,mogoda,vic',
  `node_name` varchar(30) NOT NULL DEFAULT '' COMMENT '节点名称',
  `params` varchar(400) NOT NULL DEFAULT '' COMMENT '参数',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT '负责人uid',
  `relate_owner` int(11) NOT NULL DEFAULT '0' COMMENT '相关人uid',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT 'Job描述',
  `source_id` int(11) NOT NULL DEFAULT '0' COMMENT '原JobId',
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ipublish项目id',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mesg_record
-- ----------------------------
DROP TABLE IF EXISTS `mesg_record`;
CREATE TABLE `mesg_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templetId` int(11) NOT NULL,
  `pubMessageId` varchar(256) NOT NULL,
  `mesgParam` varchar(256) NOT NULL,
  `sendTime` datetime NOT NULL,
  `receiveBy` int(11) NOT NULL,
  `receiveByType` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `batchId` int(11) NOT NULL,
  `ext` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mesg_sms_tosend
-- ----------------------------
DROP TABLE IF EXISTS `mesg_sms_tosend`;
CREATE TABLE `mesg_sms_tosend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recordId` int(11) NOT NULL,
  `phoneNum` varchar(256) NOT NULL,
  `smsContent` varchar(256) NOT NULL,
  `willsendTime` datetime NOT NULL,
  `result` varchar(256) NOT NULL,
  `sendCount` int(11) NOT NULL,
  `reason` varchar(256) NOT NULL,
  `sendType` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `lastSendTime` datetime NOT NULL,
  `isSending` int(11) NOT NULL,
  `valid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for queue_list
-- ----------------------------
DROP TABLE IF EXISTS `queue_list`;
CREATE TABLE `queue_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Job id',
  `params` varchar(2000) NOT NULL DEFAULT '' COMMENT '参数',
  `result` text NOT NULL COMMENT '执行命令和结果',
  `status` tinyint(1) NOT NULL DEFAULT '-2' COMMENT '状态值 -2 ：待执行 -1 执行中 0：执行失败 1：执行成功',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `uname` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `updated_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后更新实际时间',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_jobid` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8044 DEFAULT CHARSET=utf8 COMMENT='队列表';

SET FOREIGN_KEY_CHECKS = 1;
