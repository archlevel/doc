/*
 Navicat Premium Data Transfer

 Source Server         : ipublish
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : 192.168.60.204:3306
 Source Schema         : ipublish

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 28/10/2019 11:31:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apollo_queue_list
-- ----------------------------
DROP TABLE IF EXISTS `apollo_queue_list`;
CREATE TABLE `apollo_queue_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '队列自增id',
  `biz_type` tinyint(4) DEFAULT '0' COMMENT '业务类型 1：项目 2：版本 ',
  `biz_id` int(11) NOT NULL DEFAULT '0' COMMENT '根据不同的业务存不同的id',
  `act` tinyint(4) NOT NULL DEFAULT '0' COMMENT '动作类型：1：同步 2：删除',
  `params` varchar(10000) NOT NULL DEFAULT '' COMMENT '需要存一些参数',
  `cmd_output` text NOT NULL COMMENT '命令的输出内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：-2：待运行 -1 :运行中 0：运行失败 1：运行成功',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `ops_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=832 DEFAULT CHARSET=utf8 COMMENT='阿波罗配置同步表';

-- ----------------------------
-- Table structure for app_access_log
-- ----------------------------
DROP TABLE IF EXISTS `app_access_log`;
CREATE TABLE `app_access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referUrl` varchar(1000) NOT NULL DEFAULT '' COMMENT '当前访问的refer',
  `targetUrl` varchar(1000) NOT NULL DEFAULT '' COMMENT '访问的url',
  `queryParams` longtext NOT NULL COMMENT 'get和post参数',
  `ua` varchar(1000) NOT NULL DEFAULT '' COMMENT '访问ua',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '访问ip',
  `note` varchar(4500) NOT NULL DEFAULT '' COMMENT 'json格式备注字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '访问用户uid',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_create` (`created_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5430437 DEFAULT CHARSET=utf8 COMMENT='admin端访问记录表';

-- ----------------------------
-- Table structure for app_access_log_20180929
-- ----------------------------
DROP TABLE IF EXISTS `app_access_log_20180929`;
CREATE TABLE `app_access_log_20180929` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referUrl` varchar(1000) NOT NULL DEFAULT '' COMMENT '当前访问的refer',
  `targetUrl` varchar(1000) NOT NULL DEFAULT '' COMMENT '访问的url',
  `queryParams` text NOT NULL COMMENT 'get和post参数',
  `ua` varchar(255) NOT NULL DEFAULT '' COMMENT '访问ua',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '访问ip',
  `note` varchar(4500) NOT NULL DEFAULT '' COMMENT 'json格式备注字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '访问用户uid',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4019408 DEFAULT CHARSET=utf8 COMMENT='admin端访问记录表';

-- ----------------------------
-- Table structure for app_error_log
-- ----------------------------
DROP TABLE IF EXISTS `app_error_log`;
CREATE TABLE `app_error_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `requestUri` varchar(255) NOT NULL DEFAULT '' COMMENT '请求uri',
  `content` text NOT NULL COMMENT '日志内容',
  `ip` varchar(500) NOT NULL DEFAULT '' COMMENT 'ip',
  `ua` varchar(1000) NOT NULL DEFAULT '' COMMENT 'ua信息',
  `cookies` varchar(1000) NOT NULL DEFAULT '' COMMENT 'cookie信息。如果有的话',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13894 DEFAULT CHARSET=utf8 COMMENT='app错误日表';

-- ----------------------------
-- Table structure for auto_test_queue
-- ----------------------------
DROP TABLE IF EXISTS `auto_test_queue`;
CREATE TABLE `auto_test_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `targetType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 1：项目 2：版本',
  `targetId` int(11) NOT NULL DEFAULT '0' COMMENT '对应id',
  `testId` varchar(20) NOT NULL DEFAULT '0' COMMENT '自动化测试id',
  `serverIp` varchar(20) NOT NULL DEFAULT '' COMMENT '服务器ip',
  `extra` varchar(4500) NOT NULL DEFAULT '' COMMENT '扩展字段',
  `testType` tinyint(2) DEFAULT '1' COMMENT '自动化测试类型 1：API自动化测试 2：UI自动化测试',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 -1：待运行 1：已提交 0：提交失败',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1407 DEFAULT CHARSET=utf8 COMMENT='自动化测试队列';

-- ----------------------------
-- Table structure for branch_version
-- ----------------------------
DROP TABLE IF EXISTS `branch_version`;
CREATE TABLE `branch_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分支类型：1：dev（开发）  2:release/hotfix 3: develop(公测)',
  `date` int(11) NOT NULL DEFAULT '0' COMMENT '日期:年月日',
  `counter` int(11) NOT NULL DEFAULT '0' COMMENT '计数器',
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_type_date` (`type`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1315 DEFAULT CHARSET=utf8 COMMENT='分支计数器，以每天为单位生成';

-- ----------------------------
-- Table structure for communication_record
-- ----------------------------
DROP TABLE IF EXISTS `communication_record`;
CREATE TABLE `communication_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIp` varchar(45) NOT NULL COMMENT '用户IP扫码人',
  `targetIp` varchar(45) DEFAULT NULL COMMENT '目标IP要指向的IP',
  `gourdPort` varchar(45) DEFAULT NULL COMMENT '访问指定端口',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `messageDevops` varchar(255) DEFAULT NULL COMMENT '运维接口返回信息',
  `userName` varchar(45) DEFAULT NULL COMMENT '扫码用户名字',
  `projectBranch` varchar(45) DEFAULT NULL COMMENT '项目分支',
  `projectId` varchar(45) DEFAULT NULL COMMENT '项目ID',
  PRIMARY KEY (`id`),
  KEY `index2` (`userIp`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for git_branch_jenkinsfile
-- ----------------------------
DROP TABLE IF EXISTS `git_branch_jenkinsfile`;
CREATE TABLE `git_branch_jenkinsfile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `git` varchar(200) DEFAULT NULL COMMENT 'git名称如mgzf-search-service',
  `branch` varchar(200) DEFAULT NULL COMMENT 'branch如dev_20181111001',
  `jenkinsfile` mediumtext COMMENT '原始jenkinsfile文件内容',
  `stages` varchar(200) DEFAULT NULL COMMENT '逗号分隔的stages如 sonar,apitest',
  `updateTime` datetime DEFAULT NULL,
  `stagesDev` varchar(200) DEFAULT NULL,
  `stagesTst` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='jenkinsfile维护表';

-- ----------------------------
-- Table structure for gourd_port
-- ----------------------------
DROP TABLE IF EXISTS `gourd_port`;
CREATE TABLE `gourd_port` (
  `gourdId` bigint(20) NOT NULL AUTO_INCREMENT,
  `projectId` bigint(20) DEFAULT NULL COMMENT '项目ID',
  `branchName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分支名称',
  `packageName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '包名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1 可用 0 不可用',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  `typePort` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据类型用来区分端口所属',
  `packageJarName` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '包路径后面定时任务去查找葫芦用',
  `isRunHulu` tinyint(4) DEFAULT '0' COMMENT '定时任务检测葫芦服务是否在k8s 中正常启动。0是初始化未启动 1是启动 2 异常状态没有获取到结果',
  PRIMARY KEY (`gourdId`)
) ENGINE=InnoDB AUTO_INCREMENT=61007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for history_log
-- ----------------------------
DROP TABLE IF EXISTS `history_log`;
CREATE TABLE `history_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `targetType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 1：项目 2：版本',
  `targetId` int(11) NOT NULL DEFAULT '0' COMMENT '对应表id字段',
  `branchName` varchar(50) NOT NULL DEFAULT '' COMMENT '分支名称',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作类型 1：新建分支 2：提测 3：组内测试  4：集成测试 5：DBA操作 6：灰度 7：生产',
  `note` text NOT NULL COMMENT '备注信息',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人uid',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  PRIMARY KEY (`id`),
  KEY `target_type_id` (`targetType`,`targetId`)
) ENGINE=InnoDB AUTO_INCREMENT=599156 DEFAULT CHARSET=utf8 COMMENT='所有的操作日志';

-- ----------------------------
-- Table structure for jenkins_log
-- ----------------------------
DROP TABLE IF EXISTS `jenkins_log`;
CREATE TABLE `jenkins_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `targetId` int(11) unsigned DEFAULT NULL COMMENT '项目或版本ID',
  `targetType` tinyint(2) unsigned DEFAULT NULL COMMENT '类型 1:项目 2:版本',
  `packageName` varchar(45) DEFAULT NULL COMMENT '包名',
  `branchName` varchar(45) DEFAULT NULL COMMENT '版本名称',
  `targetUrl` varchar(200) DEFAULT NULL COMMENT '包地址',
  `packageId` int(11) unsigned DEFAULT NULL COMMENT '包ID',
  `userName` varchar(45) DEFAULT NULL COMMENT '打包人',
  `taskId` varchar(45) DEFAULT NULL COMMENT '任务ID',
  `createTime` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_targetId` (`targetId`),
  KEY `idx_taskId` (`taskId`),
  KEY `idx_branchName` (`branchName`)
) ENGINE=InnoDB AUTO_INCREMENT=204107 DEFAULT CHARSET=utf8 COMMENT='jenkins 回调日志';

-- ----------------------------
-- Table structure for jenkins_tasks
-- ----------------------------
DROP TABLE IF EXISTS `jenkins_tasks`;
CREATE TABLE `jenkins_tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `targetType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：项目 1：版本',
  `targetId` int(11) NOT NULL DEFAULT '0' COMMENT '对应表id',
  `parentId` int(11) NOT NULL DEFAULT '0' COMMENT '父任务id',
  `groupId` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组id',
  `jobName` varchar(100) NOT NULL DEFAULT '' COMMENT 'Job名称',
  `buildId` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  `buildUrl` varchar(500) NOT NULL DEFAULT '' COMMENT '任务地址',
  `buildParams` varchar(500) NOT NULL DEFAULT '' COMMENT '构建任务参数',
  `buildConsoleLog` varchar(3000) NOT NULL DEFAULT '' COMMENT '提交构建任务返回参数',
  `triggerJobs` varchar(1000) NOT NULL DEFAULT '' COMMENT '成功之后出发其他Job',
  `consoleLog` text COMMENT '日志内容',
  `status` tinyint(1) NOT NULL DEFAULT '-5' COMMENT '状态值： -5 提交构建任务  -1 运行中  0：失败  1：成功',
  `updateTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_groupId` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=26716 DEFAULT CHARSET=utf8 COMMENT='jenkins打包任务表';

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '项目名称',
  `branchName` varchar(50) NOT NULL DEFAULT '' COMMENT '分支名称',
  `techOwner` int(11) NOT NULL DEFAULT '0' COMMENT '技术负责人',
  `testOwner` int(11) NOT NULL DEFAULT '0' COMMENT '测试负责人',
  `projectOwner` int(11) NOT NULL DEFAULT '0' COMMENT '产品负责人',
  `startDate` date NOT NULL COMMENT '开始日期',
  `endDate` date NOT NULL COMMENT '结束时间',
  `gaDate` date NOT NULL COMMENT '上线时间',
  `repo` varchar(1000) NOT NULL COMMENT '使用json存储关联repo',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态0 :删除 1：创建  2:自测阶段 3: 设计待评审 4: 设计评审通过   5：提测    10：测试通过 15：合并上线分支  20：灰度发布 21：灰度发布成功  22：灰度验证通过  30：生成发布 31：生成发布成功 32：生成验证通过',
  `gitStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'git分支状态 1：正常 0：已删除',
  `note` varchar(10000) NOT NULL DEFAULT '' COMMENT '备注字段',
  `testNote` varchar(3000) DEFAULT NULL COMMENT '提测内容',
  `testServerId` int(11) NOT NULL DEFAULT '0' COMMENT '测试服务器id',
  `designUrl` varchar(500) DEFAULT NULL COMMENT '设计方案地址',
  `rejectNote` varchar(3000) NOT NULL DEFAULT '' COMMENT '驳回原因',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `realTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '实际上线时间',
  `devOkTime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '提测时间',
  `testOkTime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '提测时间',
  `mergerReleaseTime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '提测时间',
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  `projectType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '项目类型 (0:业务项目 1：技术项目)',
  `utCoverage` float(4,3) DEFAULT NULL COMMENT 'ut覆盖率',
  `findbugsFlag` int(11) DEFAULT '0' COMMENT 'findbugs执行标记为 0未执行 1通过 2不通过',
  `testExecutor` int(11) DEFAULT NULL COMMENT 'ut&findbugs执行人id',
  `selfTest` tinyint(1) DEFAULT '0' COMMENT '是否自测',
  `repos` varchar(45) DEFAULT NULL COMMENT '部署包的顺序',
  `deploys` varchar(225) DEFAULT NULL COMMENT '启动包顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5296 DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Table structure for project_data
-- ----------------------------
DROP TABLE IF EXISTS `project_data`;
CREATE TABLE `project_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 1：sql 2:Job 3:配置',
  `title` varchar(2000) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容，使用json',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  `betaStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公测同步状态：1：已同步 0：未同步',
  `auditStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态： 0:待审核 1:初审通过 2:运维审核通过',
  `auditUid` int(11) NOT NULL DEFAULT '0' COMMENT '审核人UID',
  `auditTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `rejectNote` varchar(1000) NOT NULL DEFAULT '' COMMENT '审核不通过原因',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_projectId_type` (`projectId`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5912 DEFAULT CHARSET=utf8 COMMENT='项目上线资料';

-- ----------------------------
-- Table structure for project_data_history_log
-- ----------------------------
DROP TABLE IF EXISTS `project_data_history_log`;
CREATE TABLE `project_data_history_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `branchName` varchar(50) NOT NULL DEFAULT '' COMMENT '分支名称',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 1：sql 2:Job 3:配置',
  `note` text NOT NULL COMMENT '内容，使用json',
  `auditStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 0：未通过 1：通过',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人uid',
  `userName` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `submitUid` int(11) NOT NULL DEFAULT '0' COMMENT '提交者',
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_auditStatus` (`auditStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=7229 DEFAULT CHARSET=utf8 COMMENT='物料操作日志表';

-- ----------------------------
-- Table structure for project_holder
-- ----------------------------
DROP TABLE IF EXISTS `project_holder`;
CREATE TABLE `project_holder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL DEFAULT '0' COMMENT '项目表的id',
  `holderId` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_type_id` (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=3382 DEFAULT CHARSET=utf8 COMMENT='项目关联干系人';

-- ----------------------------
-- Table structure for project_jira
-- ----------------------------
DROP TABLE IF EXISTS `project_jira`;
CREATE TABLE `project_jira` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL COMMENT '项目id',
  `issueKey` varchar(100) NOT NULL DEFAULT '',
  `assignee` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(300) NOT NULL DEFAULT '',
  `createBy` varchar(50) NOT NULL,
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5284 DEFAULT CHARSET=utf8 COMMENT='jira 项目 issue';

-- ----------------------------
-- Table structure for project_pipeline
-- ----------------------------
DROP TABLE IF EXISTS `project_pipeline`;
CREATE TABLE `project_pipeline` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int(11) unsigned NOT NULL COMMENT 'ipublish projectid',
  `git` varchar(200) DEFAULT NULL COMMENT 'git名称如mgzf-search-service',
  `branch` varchar(200) DEFAULT NULL COMMENT 'branch如dev_20181111001',
  `jenkinsBuildId` int(11) unsigned NOT NULL COMMENT 'jenkins buildid',
  `startTime` datetime DEFAULT NULL,
  `jenkinsUrl` varchar(500) DEFAULT NULL,
  `operatedBy` varchar(200) DEFAULT NULL,
  `operatedType` int(11) DEFAULT NULL,
  `stages` varchar(500) DEFAULT NULL,
  `packages` varchar(1000) DEFAULT NULL,
  `machine` varchar(100) DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pipeline表';

-- ----------------------------
-- Table structure for project_pipeline_current
-- ----------------------------
DROP TABLE IF EXISTS `project_pipeline_current`;
CREATE TABLE `project_pipeline_current` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int(11) unsigned NOT NULL COMMENT 'ipublish projectid',
  `git` varchar(200) DEFAULT NULL COMMENT 'git名称如mgzf-search-service',
  `branch` varchar(200) DEFAULT NULL COMMENT 'branch如dev_20181111001',
  `jenkinsBuildId` int(11) unsigned NOT NULL COMMENT 'jenkins buildid',
  `startTime` datetime DEFAULT NULL,
  `jenkinsUrl` varchar(500) DEFAULT NULL,
  `operatedBy` varchar(200) DEFAULT NULL,
  `operatedType` int(1) DEFAULT NULL,
  `stages` varchar(500) DEFAULT NULL,
  `packages` varchar(1000) DEFAULT NULL,
  `machine` varchar(100) DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `stagestotal` int(5) DEFAULT NULL,
  `stagesdone` int(5) DEFAULT NULL,
  `totalrun` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='当前运行的pipeline表';

-- ----------------------------
-- Table structure for project_pipeline_stages
-- ----------------------------
DROP TABLE IF EXISTS `project_pipeline_stages`;
CREATE TABLE `project_pipeline_stages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int(11) unsigned NOT NULL COMMENT 'ipublish projectid',
  `git` varchar(200) DEFAULT NULL COMMENT 'git名称如mgzf-search-service',
  `branch` varchar(200) DEFAULT NULL COMMENT 'branch如dev_20181111001',
  `jenkinsBuildId` int(11) unsigned NOT NULL COMMENT 'jenkins buildid',
  `result` varchar(10000) DEFAULT NULL COMMENT '执行结果',
  `url` varchar(1000) DEFAULT NULL COMMENT '链接',
  `status` int(1) unsigned NOT NULL COMMENT '状态',
  `updateTime` datetime DEFAULT NULL,
  `stage` varchar(45) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pipeline stage表';

-- ----------------------------
-- Table structure for project_release_package
-- ----------------------------
DROP TABLE IF EXISTS `project_release_package`;
CREATE TABLE `project_release_package` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `targetType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 1：项目 2：版本',
  `targetId` int(11) NOT NULL DEFAULT '0' COMMENT '对应表id字段',
  `packageId` int(4) NOT NULL DEFAULT '0' COMMENT '包表对应id',
  `targetUrl` varchar(500) NOT NULL DEFAULT '' COMMENT '包war链接地址',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注信息',
  `status` tinyint(3) NOT NULL DEFAULT '-2' COMMENT '状态 -2：未上传 -1：上传中 0：上传失败 1：上传成功  5:灰度发布中 6：灰度发布失败 7：灰度发布成功  10：生产发布中 11：生产发布失败 12：生产发布成功  15:smoke 发布中 16：smoke发布失败 17：smoke发布成功 20:标记失败 25：灰度回滚中 26：灰度回滚失败 27：灰度回滚成功 30：生产回滚中 31：生产回滚失败 32：生成回滚成功 70:切流量中 71：切流量失败 72：切流量成功',
  `taskId` varchar(100) NOT NULL DEFAULT '' COMMENT '上传任务id',
  `proSha1` varchar(100) NOT NULL DEFAULT '' COMMENT '前端git sha1码',
  `proTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '发生产的成功时间',
  `apiVersion` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'api版本号',
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  `sonarIsPost` tinyint(1) DEFAULT '0' COMMENT 'sonar是否通过1是通过2是未通过0是初始状态',
  PRIMARY KEY (`id`),
  KEY `target_type_id` (`targetType`,`targetId`)
) ENGINE=InnoDB AUTO_INCREMENT=17281 DEFAULT CHARSET=utf8 COMMENT='项目和版本关联的包';

-- ----------------------------
-- Table structure for pub_branch
-- ----------------------------
DROP TABLE IF EXISTS `pub_branch`;
CREATE TABLE `pub_branch` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目分支ID',
  `projectId` int(11) DEFAULT NULL COMMENT '项目ID',
  `projectName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `branchName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分支名',
  `branchType` int(4) DEFAULT NULL COMMENT '10 dev\n            20 hotfix\n            30 公测版本\n\n            40  release\n            \n            ',
  `startDate` date DEFAULT NULL COMMENT '计划开始时间',
  `endDate` date DEFAULT NULL COMMENT '计划结束时间',
  `deliveryDate` date DEFAULT NULL COMMENT '计划上线时间',
  `beforeSql` tinyint(4) DEFAULT NULL COMMENT '是否发布前执行sql',
  `afterSql` tinyint(4) DEFAULT NULL COMMENT '发布后执行sql',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `status` int(2) DEFAULT NULL COMMENT '0  创建失败 \\n 5 创建中 \\n  10   创建\\n  20 开发完成\\n   30   分支测试通过\\n 40   上线完成\\n   35   上线申请中',
  `techOwner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '技术负责人',
  `businessOwner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品负责人',
  `testOwner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `updateBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `versionNo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Jira 项目编号',
  PRIMARY KEY (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=2347 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='项目分支';

-- ----------------------------
-- Table structure for pub_branch_holder
-- ----------------------------
DROP TABLE IF EXISTS `pub_branch_holder`;
CREATE TABLE `pub_branch_holder` (
  `branchHolderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '分支干系人ID',
  `branchId` int(11) DEFAULT NULL COMMENT '项目分支ID',
  `holderName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `holderType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '干系人角色',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`branchHolderId`)
) ENGINE=InnoDB AUTO_INCREMENT=5558 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='项目分支干系人';

-- ----------------------------
-- Table structure for pub_branch_item
-- ----------------------------
DROP TABLE IF EXISTS `pub_branch_item`;
CREATE TABLE `pub_branch_item` (
  `branchItemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '上线物料ID',
  `branchId` int(11) DEFAULT NULL COMMENT '项目分支ID',
  `branchName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemType` int(2) DEFAULT NULL COMMENT '               10 软件包\n\n                            11上线功能列表\n\n                            12 SQL语句\n\n                            13 配置文件\n\n                             14 定时器\n\n                            15 组内测试报告\n\n                            16 集成测试报告\n\n                            17 验收报告\n\n                            18 上线公告\n\n                            19 其他',
  `itemContent` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`branchItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='项目分支物料';

-- ----------------------------
-- Table structure for pub_branch_jiraissue
-- ----------------------------
DROP TABLE IF EXISTS `pub_branch_jiraissue`;
CREATE TABLE `pub_branch_jiraissue` (
  `branchIssueId` int(11) NOT NULL AUTO_INCREMENT,
  `branchId` int(11) DEFAULT NULL COMMENT '项目分支ID',
  `issueKey` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assignee` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jiraProject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`branchIssueId`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='jira 项目 issue';

-- ----------------------------
-- Table structure for pub_delivery_apply
-- ----------------------------
DROP TABLE IF EXISTS `pub_delivery_apply`;
CREATE TABLE `pub_delivery_apply` (
  `deliveryApplyId` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `projectName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `projectId` int(11) DEFAULT NULL COMMENT '项目ID',
  `deliveryBranchId` int(11) DEFAULT NULL COMMENT '上线分支',
  `deliveryBranchName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上线分支名',
  `deliveryVersion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本号',
  `importantLevel` char(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '重要级别',
  `urgencyLevel` char(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '紧急级别',
  `deliveryDate` date DEFAULT NULL COMMENT '计划上线日期',
  `applicant` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请发起人',
  `applyTime` datetime DEFAULT NULL COMMENT '发起时间',
  `approveTestingBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '测试审核人',
  `approveTestingTime` datetime DEFAULT NULL COMMENT '测试审核时间',
  `approveDeliveryBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上线审核人',
  `approveDeliveryTime` datetime DEFAULT NULL COMMENT '上线审核时间',
  `deliveryBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '运维上线人',
  `deliveryFinishTime` datetime DEFAULT NULL COMMENT '上线完成时间',
  `deliveryResult` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上线结果',
  `failureReason` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmBy` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上线验证人',
  `integrateDate` date DEFAULT NULL,
  `lockDate` date DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '10 待测试经理审核\n\n            11 测试通过\n\n            20 评审通过\n\n            39 预发布\n\n            40 上线完成\n\n            ',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `updateBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `needPubBranch` tinyint(4) DEFAULT '1',
  `needHotDeploy` tinyint(4) DEFAULT '0' COMMENT '0 不热发\n\n            1 热发',
  `needPreDeploy` tinyint(4) DEFAULT '1',
  `preDeployTime` datetime DEFAULT NULL,
  `preDeployReason` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preDeployResult` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beforeSql` tinyint(4) DEFAULT NULL,
  `afterSql` tinyint(4) DEFAULT NULL,
  `branchType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rollbackTime` datetime DEFAULT NULL COMMENT '回滚成功时间',
  `rollbackApplyTime` datetime DEFAULT NULL COMMENT '回滚申请时间',
  PRIMARY KEY (`deliveryApplyId`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='项目上线申请';

-- ----------------------------
-- Table structure for pub_delivery_apply_branch
-- ----------------------------
DROP TABLE IF EXISTS `pub_delivery_apply_branch`;
CREATE TABLE `pub_delivery_apply_branch` (
  `deliveryApplyId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL COMMENT '项目分支ID',
  `branchName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分支名',
  `startDate` date DEFAULT NULL COMMENT '计划开始时间',
  `endDate` date DEFAULT NULL COMMENT '计划结束时间',
  `techOwner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分支技术负责人',
  `businessOwner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品负责人',
  `testOwner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `beforeSql` tinyint(4) DEFAULT NULL COMMENT '是否发布前执行sql',
  `afterSql` tinyint(4) DEFAULT NULL COMMENT '发布后执行sql',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `jiraProjectId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Jira 项目编号',
  `jiraProjectName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'jira项目名称',
  PRIMARY KEY (`deliveryApplyId`,`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='上线申请开发分支';

-- ----------------------------
-- Table structure for pub_delivery_apply_item
-- ----------------------------
DROP TABLE IF EXISTS `pub_delivery_apply_item`;
CREATE TABLE `pub_delivery_apply_item` (
  `deliveryApplyItemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '上线物料ID',
  `branchId` int(11) DEFAULT NULL,
  `branchName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliveryApplyId` int(11) DEFAULT NULL,
  `itemType` int(2) DEFAULT NULL COMMENT '                10 软件包\n\n                            11上线功能列表\n\n                            12 SQL语句\n\n                            13 配置文件\n\n                             14 定时器\n\n                            15 组内测试报告\n\n                            16 集成测试报告\n\n                            17 验收报告\n\n                            18 上线公告\n\n                            19 其他',
  `itemName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemContent` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemPackage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '包名',
  `status` tinyint(1) DEFAULT NULL COMMENT '上传状态(-1:上传失败 0:上传中 1:上传成功)',
  `taskId` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传包的任务id',
  PRIMARY KEY (`deliveryApplyItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for pub_delivery_apply_publish
-- ----------------------------
DROP TABLE IF EXISTS `pub_delivery_apply_publish`;
CREATE TABLE `pub_delivery_apply_publish` (
  `deliveryApplyPublishId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id，建议全部都是id',
  `deliveryApplyId` bigint(20) DEFAULT NULL COMMENT 'delivery_apply 表id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 1：灰度 2：生成 3：回滚',
  `groupId` varchar(64) NOT NULL DEFAULT '' COMMENT '组id.多个任务组id一致',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `project` varchar(50) DEFAULT NULL COMMENT '项目标识',
  `env` varchar(50) DEFAULT NULL COMMENT '环境标识 gray:灰度 production:生产',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 -1：进行中  0：失败  1：成功  ',
  `taskId` varchar(200) DEFAULT NULL COMMENT '运维返回的 任务id',
  `updateTime` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`deliveryApplyPublishId`),
  KEY `idx_groupId` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='发布状态队列表';

-- ----------------------------
-- Table structure for pub_delivery_holder
-- ----------------------------
DROP TABLE IF EXISTS `pub_delivery_holder`;
CREATE TABLE `pub_delivery_holder` (
  `deliveryHolderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '分支干系人ID',
  `deliveryApplyId` int(11) DEFAULT NULL COMMENT '申请id',
  `branchId` int(11) DEFAULT NULL,
  `branchName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holderName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `holderType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '干系人角色',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`deliveryHolderId`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='上线干系人列表';

-- ----------------------------
-- Table structure for pub_git_project
-- ----------------------------
DROP TABLE IF EXISTS `pub_git_project`;
CREATE TABLE `pub_git_project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `projectName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `gitUrl` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'git地址',
  `gitPath` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `udpateBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `gitId` int(11) DEFAULT NULL COMMENT 'gitlab id',
  `gitType` int(11) DEFAULT NULL COMMENT '0-gitlab,1-testgitlab',
  `apiPriveteToken` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '私人token',
  `apiDomain` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'git网址',
  `packageType` tinyint(1) DEFAULT NULL COMMENT '(0:不需要打包 1:需要打包)',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发布项目';

-- ----------------------------
-- Table structure for pub_holder
-- ----------------------------
DROP TABLE IF EXISTS `pub_holder`;
CREATE TABLE `pub_holder` (
  `holderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目干系人ID',
  `userName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holderName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `parentId` int(11) DEFAULT '0' COMMENT '上级管理人员的holderId',
  `holderType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '干系人类型: 00 技术经理,10 PMO  ,20 测试负责人,  30 版本经理, 40 运维 ,50 DBA ,60 产品负责人\n\n            \n            ',
  `roleType` tinyint(3) DEFAULT '1' COMMENT '角色 1：研发 5：技术经理 10：测试  15:dba  20:运维  25：产品  99：超级管理员',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1 有效 0 无效',
  `powerScope` tinyint(4) DEFAULT '2' COMMENT '权能范围  1 前端   2 后端',
  `userGroup` tinyint(4) DEFAULT NULL COMMENT '用户属于组',
  PRIMARY KEY (`holderId`),
  UNIQUE KEY `idx_username` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for pub_mail_log
-- ----------------------------
DROP TABLE IF EXISTS `pub_mail_log`;
CREATE TABLE `pub_mail_log` (
  `mailId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目邮件 ID',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收件人邮件地址',
  `ccMail` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '抄送人地址，多个以;分割',
  `mailParams` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮件参数',
  `mailTemplate` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮件模板',
  `businessId` int(11) DEFAULT NULL,
  `businessType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(10000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮件正文内容',
  `sendStatus` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0 待发送\n\n            1 发送中\n\n            2 发送成功\n\n            3 发送失败',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `updateBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`mailId`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='项目版本邮件日志';

-- ----------------------------
-- Table structure for pub_notice_message
-- ----------------------------
DROP TABLE IF EXISTS `pub_notice_message`;
CREATE TABLE `pub_notice_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL COMMENT '通知类型 1:邮件 2:钉钉 3:微信 4:短信',
  `params` varchar(2000) DEFAULT NULL COMMENT '通知所需要参数',
  `content` varchar(10000) DEFAULT NULL COMMENT '通知正文内容',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '通知执行状态 -2:待发送 -1:运行中 1:成功 0:失败 ',
  `errorMessage` varchar(200) DEFAULT NULL COMMENT '失败信息',
  `createTime` datetime DEFAULT NULL COMMENT '插入时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=31512 DEFAULT CHARSET=utf8 COMMENT='通知队列表';

-- ----------------------------
-- Table structure for pub_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pub_operate_log`;
CREATE TABLE `pub_operate_log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `businessId` int(11) DEFAULT NULL,
  `businessStep` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logCate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'branch  分支\n\n            delivery  上线申请 \n\n            ',
  `operateType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logContent` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operateTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`logId`),
  KEY `idx_logcat_bizstep` (`logCate`,`businessStep`)
) ENGINE=InnoDB AUTO_INCREMENT=10607 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志';

-- ----------------------------
-- Table structure for pub_package_project
-- ----------------------------
DROP TABLE IF EXISTS `pub_package_project`;
CREATE TABLE `pub_package_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `packageName` varchar(100) DEFAULT NULL COMMENT '包名，jenkins提供',
  `displayName` varchar(100) DEFAULT NULL COMMENT '展示名称',
  `projectName` varchar(100) DEFAULT NULL COMMENT '发布项目名称。运维提供',
  `owner` varchar(20) NOT NULL COMMENT '负责人',
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  `autoPublish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持调用运维api发布',
  `hasBizConfig` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有独立配置文件',
  `notGrayStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有灰度环境',
  `isFront` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是前端包',
  `noUpdateStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有上传阶段',
  `hulu` tinyint(1) DEFAULT '0' COMMENT '是否是hulu，1：是，0：不是',
  `contextPath` varchar(225) DEFAULT NULL COMMENT '项目contextPatch，比如葫芦 room-find-web',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1:有效 0s:无效',
  `weight` int(2) NOT NULL DEFAULT '0' COMMENT '发包顺序',
  `apiVersion` tinyint(1) NOT NULL DEFAULT '2' COMMENT 'api版本号',
  `newProjectName` varchar(100) DEFAULT NULL COMMENT '新增传输NG配置修改的项目名称',
  `packagePom` varchar(255) DEFAULT NULL COMMENT 'pom文件路径',
  `packageGit` varchar(255) DEFAULT NULL COMMENT '包的git路径',
  `packageTarget` varchar(255) DEFAULT NULL COMMENT 'maven包路径',
  `gitProjectId` int(11) NOT NULL DEFAULT '0' COMMENT 'git项目ID',
  `omgWebNumber` int(2) DEFAULT '0' COMMENT '前端包在运维发布系统中编号 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='项目和包名对应表';

-- ----------------------------
-- Table structure for pub_project_sonar_pass
-- ----------------------------
DROP TABLE IF EXISTS `pub_project_sonar_pass`;
CREATE TABLE `pub_project_sonar_pass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) DEFAULT NULL COMMENT '''创建的项目ID''',
  `gitProjectId` int(11) DEFAULT NULL COMMENT 'git地址项目ID',
  `sonarStatus` tinyint(4) DEFAULT '0' COMMENT 'sonar执行是否通过：0新建1通过2未通过',
  `gitProjectName` varchar(45) DEFAULT NULL COMMENT '''git上面项目名称''',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDelete` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1是用0是删除',
  PRIMARY KEY (`id`),
  KEY `projectIds` (`projectId`),
  KEY `gitProjectIds` (`gitProjectId`),
  KEY `projectIdAndgitProjectId` (`projectId`,`gitProjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=6634 DEFAULT CHARSET=latin1 COMMENT='project关联git统计执行结果是否pass';

-- ----------------------------
-- Table structure for pub_queue_list
-- ----------------------------
DROP TABLE IF EXISTS `pub_queue_list`;
CREATE TABLE `pub_queue_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '队列自增id',
  `act` tinyint(4) NOT NULL DEFAULT '0' COMMENT '动作类型：1：创建分支  2：合并分支 3: 打tag 4:merge 5:分支保护',
  `repo` varchar(40) NOT NULL DEFAULT '' COMMENT '操作仓库',
  `groupId` varchar(64) NOT NULL DEFAULT '' COMMENT '组id，同一组可以看得比较清楚',
  `cmd` varchar(2000) NOT NULL DEFAULT '' COMMENT '命令内容',
  `params` varchar(1000) NOT NULL DEFAULT '' COMMENT '需要存一些参数',
  `cmd_output` varchar(10000) NOT NULL DEFAULT '' COMMENT '命令的输出内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：-2：待运行 -1 :运行中 0：运行失败 1：运行成功',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `biz_type` tinyint(4) DEFAULT '0' COMMENT '业务类型 1：开发分支/项目 2：上线申请/版本',
  `biz_id` int(11) NOT NULL DEFAULT '0' COMMENT '根据不同的业务存不同的id',
  `ops_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_time` datetime NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `ops_uid` (`ops_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=456982 DEFAULT CHARSET=utf8 COMMENT='发布系统操作队列';

-- ----------------------------
-- Table structure for release
-- ----------------------------
DROP TABLE IF EXISTS `release`;
CREATE TABLE `release` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branchName` varchar(50) NOT NULL DEFAULT '' COMMENT '分支名称',
  `branchType` tinyint(1) NOT NULL DEFAULT '2' COMMENT '2：release  3:hotfix 4:develop',
  `ver` varchar(20) NOT NULL DEFAULT '' COMMENT '版本号（去掉前缀的，例如 201705200001）',
  `gaDate` date NOT NULL COMMENT '上线时间',
  `testDate` date NOT NULL COMMENT '集测时间',
  `lockDate` date DEFAULT NULL COMMENT '集测时间',
  `repo` varchar(1000) NOT NULL DEFAULT '' COMMENT '使用json存储关联repo',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1：刚创建 9：集测不通过 10：集测通过  15：DBA操作完成   20：灰度发布 21：灰度发布成功  22：灰度验证通过  30：生产发布 31：生产发布成功 32：生产验证通过',
  `betaStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公测环境是否已同步 1：已同步 0：未同步',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注信息',
  `hasSql` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有sql 1：有 0：没有',
  `testAuditUid` int(11) NOT NULL DEFAULT '0' COMMENT '测试审核人UID',
  `testAuditTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '测试审核时间',
  `testServerId` int(11) NOT NULL DEFAULT '0' COMMENT '测试服务器id',
  `grayAuditUid` int(11) NOT NULL DEFAULT '0' COMMENT '灰度审核人',
  `grayAuditTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '灰度审核时间',
  `gaAuditUid` int(11) NOT NULL DEFAULT '0' COMMENT 'ga审核人',
  `gaAuditTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'ga审核时间',
  `mergerMasterUid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '合入master人',
  `mergerMasterTime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '合入时间',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  `hasNg` tinyint(1) DEFAULT '0' COMMENT '是否有NG 1：有 0：没有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2346 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for release_project
-- ----------------------------
DROP TABLE IF EXISTS `release_project`;
CREATE TABLE `release_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `releaseId` int(11) NOT NULL DEFAULT '0' COMMENT '版本表id',
  `projectId` int(11) NOT NULL DEFAULT '0' COMMENT '项目表id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3890 DEFAULT CHARSET=utf8 COMMENT='release关联的project';

-- ----------------------------
-- Table structure for release_publish_queue
-- ----------------------------
DROP TABLE IF EXISTS `release_publish_queue`;
CREATE TABLE `release_publish_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id，建议全部都是id',
  `releaseId` int(11) NOT NULL DEFAULT '0' COMMENT 'release表对应ID',
  `releasePackageId` int(11) NOT NULL DEFAULT '0' COMMENT 'project_release_package对应ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 1：灰度 2：生成 3：回滚  4:切流量',
  `groupId` varchar(64) NOT NULL DEFAULT '' COMMENT '组id.多个任务组id一致',
  `branchName` varchar(30) NOT NULL DEFAULT '' COMMENT '分支名称',
  `version` varchar(200) NOT NULL DEFAULT '' COMMENT '版本号',
  `packageName` varchar(50) NOT NULL DEFAULT '' COMMENT '包标示',
  `env` varchar(50) NOT NULL DEFAULT '' COMMENT '环境标识 gray:灰度 production:生产',
  `status` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '状态 -1：进行中  0：失败  1：成功  ',
  `taskId` varchar(200) NOT NULL DEFAULT '' COMMENT '运维返回的 任务id',
  `apiVersion` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'api版本号',
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=19349 DEFAULT CHARSET=utf8 COMMENT='发布状态队列表';

-- ----------------------------
-- Table structure for sonar_build_log
-- ----------------------------
DROP TABLE IF EXISTS `sonar_build_log`;
CREATE TABLE `sonar_build_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '唯一键，去重用',
  `project_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '仓库下面可能多个包',
  `package_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '包名称',
  `branch` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '项目分支',
  `project_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ipublish中project表ID',
  `result` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'sonar执行结果1: success  2: failed',
  `bugs` int(11) NOT NULL COMMENT 'bug数量',
  `vulnerabilities` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_smells` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coverage` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duplications` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blocker` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `critical` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT '2' COMMENT '1: daily build  2: push event',
  `execution_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_execution_time` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sonar运行消耗时间',
  `ncloc` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '需要扫描的代码行数',
  `jenkinsId` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行jenkins任务ID',
  `success` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口通过概率',
  `unitTests` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '测试接口个数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mgzf_build_log_transactionId_uindex` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for stat_daily_app_summary
-- ----------------------------
DROP TABLE IF EXISTS `stat_daily_app_summary`;
CREATE TABLE `stat_daily_app_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `bizType` int(11) NOT NULL DEFAULT '0' COMMENT '业务组id',
  `bizDesc` varchar(100) NOT NULL DEFAULT '' COMMENT '业务组名称',
  `performance` int(11) NOT NULL DEFAULT '0' COMMENT '性能单位毫秒',
  `slowFun` int(11) NOT NULL DEFAULT '0' COMMENT '慢方法数量',
  `slowSql` int(11) NOT NULL DEFAULT '0' COMMENT '慢SQL数量',
  `errorCnt` int(11) NOT NULL DEFAULT '0' COMMENT '错误数量',
  `updateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_date_bizType` (`date`,`bizType`)
) ENGINE=InnoDB AUTO_INCREMENT=1465 DEFAULT CHARSET=utf8 COMMENT='每日app概况统计';

-- ----------------------------
-- Table structure for stat_daily_slowurl
-- ----------------------------
DROP TABLE IF EXISTS `stat_daily_slowurl`;
CREATE TABLE `stat_daily_slowurl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `bizType` int(11) NOT NULL DEFAULT '0' COMMENT '业务组id',
  `bizDesc` varchar(100) NOT NULL DEFAULT '' COMMENT '业务组名称',
  `level1` int(11) NOT NULL DEFAULT '0' COMMENT 'L1数量',
  `level2` int(11) NOT NULL DEFAULT '0' COMMENT 'L2数量',
  `level3` int(11) NOT NULL DEFAULT '0' COMMENT 'L3数量',
  `updateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_date_bizType` (`date`,`bizType`)
) ENGINE=InnoDB AUTO_INCREMENT=8460 DEFAULT CHARSET=utf8 COMMENT='每日慢url统计';

-- ----------------------------
-- Table structure for stat_daily_slowurl_list
-- ----------------------------
DROP TABLE IF EXISTS `stat_daily_slowurl_list`;
CREATE TABLE `stat_daily_slowurl_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '统计日期',
  `bizType` int(11) NOT NULL DEFAULT '0' COMMENT '业务组id',
  `bizDesc` varchar(100) NOT NULL DEFAULT '' COMMENT '业务组名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT 'url地址',
  `level` tinyint(3) NOT NULL DEFAULT '0' COMMENT '级别',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '总数量',
  `speed` int(11) NOT NULL DEFAULT '0' COMMENT '速度单位毫秒',
  `updateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次更新时间',
  `createTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_data_bizType_url` (`date`,`bizType`,`url`)
) ENGINE=InnoDB AUTO_INCREMENT=31075 DEFAULT CHARSET=utf8 COMMENT='每日慢url详情';

-- ----------------------------
-- Table structure for stat_stage_time_consuming
-- ----------------------------
DROP TABLE IF EXISTS `stat_stage_time_consuming`;
CREATE TABLE `stat_stage_time_consuming` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `targetType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：项目 2：版本',
  `targetId` int(11) NOT NULL DEFAULT '0' COMMENT '对应表id',
  `targetCreateTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '对应的创建时间',
  `branchName` varchar(50) NOT NULL DEFAULT '' COMMENT '版本名称',
  `codeTime` int(11) NOT NULL DEFAULT '0' COMMENT '研发时长',
  `testTime` int(11) NOT NULL DEFAULT '0' COMMENT '测试时长（版本就是集测）',
  `mergeReleaseTime` int(11) NOT NULL DEFAULT '0' COMMENT '合入release时长',
  `releaseTime` int(11) NOT NULL DEFAULT '0' COMMENT '合入release到上线时长',
  `dbaTime` int(11) NOT NULL DEFAULT '0' COMMENT 'dba操作时间',
  `grayTime` int(11) NOT NULL DEFAULT '0' COMMENT '灰度通过时间',
  `gaTime` int(11) NOT NULL DEFAULT '0' COMMENT '生产消耗时间',
  `totalTime` int(11) NOT NULL DEFAULT '0' COMMENT '总时长消耗',
  `updateTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_target_type_id` (`targetType`,`targetId`)
) ENGINE=InnoDB AUTO_INCREMENT=5013 DEFAULT CHARSET=utf8 COMMENT='统计时间消耗';

-- ----------------------------
-- Table structure for test_env
-- ----------------------------
DROP TABLE IF EXISTS `test_env`;
CREATE TABLE `test_env` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hostIp` varchar(40) NOT NULL DEFAULT '' COMMENT '主机ip',
  `userName` varchar(20) NOT NULL DEFAULT '' COMMENT '使用者姓名',
  `applyDate` date NOT NULL COMMENT '申请日志',
  `validTo` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1 可申请  2：被申请',
  `note` varchar(200) NOT NULL DEFAULT '' COMMENT '备注干什么的',
  `belongGroup` varchar(100) NOT NULL DEFAULT '' COMMENT '所属组',
  `targetType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 1：项目 2：版本',
  `targetId` int(11) NOT NULL DEFAULT '0' COMMENT '对应表id',
  `forbidStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁止申请 1：禁止 0：不禁止',
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `packageIdList` varchar(500) NOT NULL COMMENT '使用json存储关联复选框(本机部署的服务ID)',
  `automationId` varchar(200) DEFAULT NULL COMMENT 'DEV自动化脚本类型',
  `groupNumber` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 , "磐石组" 10, "EQ组" 20, "马丁组" 30 , "天一组" 40 , "捷豹组" 50 , "前端组" 60 , "经纪人组" 70 , "天霸组" 80 , "极光组" 90 , "野帝组" 100 , "中青台"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='测试环境';

-- ----------------------------
-- Table structure for test_env_history
-- ----------------------------
DROP TABLE IF EXISTS `test_env_history`;
CREATE TABLE `test_env_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `envId` int(11) NOT NULL DEFAULT '0' COMMENT '环境id',
  `hostIp` varchar(50) NOT NULL DEFAULT '' COMMENT '主机Ip',
  `userName` varchar(50) NOT NULL DEFAULT '' COMMENT '使用着姓名',
  `note` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_envId` (`envId`)
) ENGINE=InnoDB AUTO_INCREMENT=63714 DEFAULT CHARSET=utf8 COMMENT='测试环境使用历史表';

-- ----------------------------
-- Table structure for test_report
-- ----------------------------
DROP TABLE IF EXISTS `test_report`;
CREATE TABLE `test_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `releaseId` int(11) NOT NULL DEFAULT '0' COMMENT '版本ID',
  `report` text COMMENT '测试报告',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `releaseId` (`releaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='测试报告';

SET FOREIGN_KEY_CHECKS = 1;
