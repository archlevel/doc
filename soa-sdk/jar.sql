/*
 Navicat Premium Data Transfer

 Source Server         : jar信息收集库
 Source Server Type    : MySQL
 Source Server Version : 100131
 Source Host           : 192.168.60.19:3306
 Source Schema         : jar

 Target Server Type    : MySQL
 Target Server Version : 100131
 File Encoding         : 65001

 Date: 28/10/2019 10:37:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_desc` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_alias` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`project_id`),
  KEY `Index 1` (`id`),
  KEY `Index 3` (`project_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for project_artifact
-- ----------------------------
DROP TABLE IF EXISTS `project_artifact`;
CREATE TABLE `project_artifact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publish_record_id` int(11) NOT NULL DEFAULT '0',
  `project_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artifact_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artifact_version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`artifact_id`),
  UNIQUE KEY `project_artifact_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for project_artifact_his
-- ----------------------------
DROP TABLE IF EXISTS `project_artifact_his`;
CREATE TABLE `project_artifact_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publish_record_id` int(11) NOT NULL,
  `project_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_version` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artifact_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artifact_version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `project_artifact_his_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for publish_record
-- ----------------------------
DROP TABLE IF EXISTS `publish_record`;
CREATE TABLE `publish_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publish_queue_id` int(11) DEFAULT NULL,
  `project_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_version` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `publish_record_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2394 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
