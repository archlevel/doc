/*
 Navicat Premium Data Transfer

 Source Server         : msf_monitor测试数据库
 Source Server Type    : MySQL
 Source Server Version : 100131
 Source Host           : 192.168.60.19:3306
 Source Schema         : msf_monitor

 Target Server Type    : MySQL
 Target Server Version : 100131
 File Encoding         : 65001

 Date: 28/10/2019 10:33:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dubbo_invoke
-- ----------------------------
DROP TABLE IF EXISTS `dubbo_invoke`;
CREATE TABLE `dubbo_invoke` (
  `id` bigint(255) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `invoke_date` datetime NOT NULL COMMENT '调用时间',
  `application` varchar(100) DEFAULT '' COMMENT '服务应用提供者信息',
  `service` varchar(255) DEFAULT NULL COMMENT '服务接口名',
  `method` varchar(255) DEFAULT NULL COMMENT '方法名',
  `consumer` varchar(255) DEFAULT NULL COMMENT '消费端IP',
  `provider` varchar(255) DEFAULT NULL COMMENT '服务提供端IP',
  `type` varchar(255) DEFAULT '' COMMENT '类型 消费端和服务端',
  `invoke_time` bigint(20) DEFAULT NULL COMMENT '调用时间long',
  `success` int(11) DEFAULT NULL COMMENT '成功数',
  `failure` int(11) DEFAULT NULL COMMENT '失败数',
  `elapsed` int(11) DEFAULT NULL COMMENT '平均耗时',
  `concurrent` int(11) DEFAULT NULL COMMENT '平均并发数',
  `max_elapsed` int(11) DEFAULT NULL COMMENT '最大耗时',
  `max_concurrent` int(11) DEFAULT NULL COMMENT '最大并发数',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `relatedKey` varchar(50) DEFAULT '' COMMENT '消费端和提供端关联key',
  PRIMARY KEY (`id`),
  KEY `index_service` (`service`(191)) USING BTREE,
  KEY `index_method` (`method`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16213241 DEFAULT CHARSET=utf8mb4 COMMENT='MSF 监控数据表';

-- ----------------------------
-- Table structure for knowing_post_last
-- ----------------------------
DROP TABLE IF EXISTS `knowing_post_last`;
CREATE TABLE `knowing_post_last` (
  `id` int(11) NOT NULL COMMENT 'id',
  `lastEndId` bigint(20) DEFAULT NULL COMMENT '最后一条提交的数据ID',
  `updatedTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='提交konwing的最后记录表';

-- ----------------------------
-- Table structure for t_monitor_metrice
-- ----------------------------
DROP TABLE IF EXISTS `t_monitor_metrice`;
CREATE TABLE `t_monitor_metrice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `up_time` datetime DEFAULT NULL COMMENT '????ʱ??',
  `server_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '??????????\n',
  `client_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '?ͻ???????\n',
  `service` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '??????',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '????',
  `server_ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '??????ip',
  `client_ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '?ͻ???ip',
  `group` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '????',
  `app_type` tinyint(4) DEFAULT NULL COMMENT '1:?????? 2???ͻ???',
  `success` bigint(20) DEFAULT '0' COMMENT '?ۼƵ??óɹ???',
  `failure` bigint(20) DEFAULT '0' COMMENT '?ۼ?ʧ????',
  `elapsed` bigint(20) DEFAULT '0' COMMENT '?ۼƺ?ʱ',
  `limited_count` bigint(20) DEFAULT '0' COMMENT '?ۼ?????',
  `hash_key` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '?????˿ͻ???????32λΨһkey',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_inx` (`hash_key`)
) ENGINE=InnoDB AUTO_INCREMENT=98313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='monitor????metrice';

SET FOREIGN_KEY_CHECKS = 1;
