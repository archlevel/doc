/*
 Navicat Premium Data Transfer

 Source Server         : sonar数据库
 Source Server Type    : MySQL
 Source Server Version : 50639
 Source Host           : 192.168.60.185:33066
 Source Schema         : omg_production

 Target Server Type    : MySQL
 Target Server Version : 50639
 File Encoding         : 65001

 Date: 28/10/2019 17:49:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_disk
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_disk`;
CREATE TABLE `cmdb_disk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Instance_id` int(11) DEFAULT NULL,
  `DiskId` varchar(100) DEFAULT NULL,
  `DiskName` varchar(100) DEFAULT NULL,
  `Device` varchar(100) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Category` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `CreationTime` datetime DEFAULT NULL,
  `ExpiredTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DiskId` (`DiskId`),
  KEY `cmdb_disk_Instance_id_1584c06f8c363154_fk_cmdb_instance_id` (`Instance_id`),
  CONSTRAINT `cmdb_disk_Instance_id_1584c06f8c363154_fk_cmdb_instance_id` FOREIGN KEY (`Instance_id`) REFERENCES `cmdb_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_idc
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_idc`;
CREATE TABLE `cmdb_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdcName` varchar(100) NOT NULL,
  `CreationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IdcName` (`IdcName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_image
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_image`;
CREATE TABLE `cmdb_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Region_id` int(11) DEFAULT NULL,
  `ImageId` varchar(100) NOT NULL,
  `ImageName` varchar(100) NOT NULL,
  `Platform` int(11) NOT NULL,
  `OSType` int(11) NOT NULL,
  `OSName` varchar(500) NOT NULL,
  `Size` varchar(50) NOT NULL,
  `Architecture` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `CreationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ImageId` (`ImageId`),
  KEY `cmdb_image_Region_id_30cd2b97c45c064a_fk_cmdb_region_id` (`Region_id`),
  CONSTRAINT `cmdb_image_Region_id_30cd2b97c45c064a_fk_cmdb_region_id` FOREIGN KEY (`Region_id`) REFERENCES `cmdb_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_instance
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_instance`;
CREATE TABLE `cmdb_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InstanceId` varchar(100) NOT NULL,
  `Zone_id` int(11) DEFAULT NULL,
  `ENV_id` int(11) DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `User` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `HostName` varchar(50) DEFAULT NULL,
  `Cpu` varchar(100) DEFAULT NULL,
  `SerialNumber` varchar(100) DEFAULT NULL,
  `MemorySize` varchar(100) DEFAULT NULL,
  `PublicIpAddress` char(39) DEFAULT NULL,
  `EipAddress` char(39) DEFAULT NULL,
  `ImageId` varchar(100) DEFAULT NULL,
  `Architecture` varchar(50) DEFAULT NULL,
  `OSName` varchar(500) DEFAULT NULL,
  `OSType` int(11) DEFAULT NULL,
  `Platform` int(11) DEFAULT NULL,
  `InstanceType` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `ExpiredTime` datetime DEFAULT NULL,
  `CreationTime` datetime DEFAULT NULL,
  `SSHKey` varchar(100) DEFAULT NULL,
  `IsPush` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_instance_Zone_id_3855f5b83989f973_fk_cmdb_zone_id` (`Zone_id`),
  KEY `cmdb_instance_ENV_id_4701b805668745e9_fk_sysadmin_sysenv_id` (`ENV_id`),
  CONSTRAINT `cmdb_instance_ENV_id_4701b805668745e9_fk_sysadmin_sysenv_id` FOREIGN KEY (`ENV_id`) REFERENCES `sysadmin_sysenv` (`id`),
  CONSTRAINT `cmdb_instance_Zone_id_3855f5b83989f973_fk_cmdb_zone_id` FOREIGN KEY (`Zone_id`) REFERENCES `cmdb_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_instance_operator
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_instance_operator`;
CREATE TABLE `cmdb_instance_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instance_id` (`instance_id`,`user_id`),
  KEY `cmdb_instance_Opera_user_id_69161ad2d039859e_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `cmdb_instance_O_instance_id_4ce2ac80c384ed9a_fk_cmdb_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `cmdb_instance` (`id`),
  CONSTRAINT `cmdb_instance_Opera_user_id_69161ad2d039859e_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_instance_securitygroup
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_instance_securitygroup`;
CREATE TABLE `cmdb_instance_securitygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL,
  `securitygroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instance_id` (`instance_id`,`securitygroup_id`),
  KEY `cmdb__securitygroup_id_79320b856cdfaed5_fk_cmdb_securitygroup_id` (`securitygroup_id`),
  CONSTRAINT `cmdb__securitygroup_id_79320b856cdfaed5_fk_cmdb_securitygroup_id` FOREIGN KEY (`securitygroup_id`) REFERENCES `cmdb_securitygroup` (`id`),
  CONSTRAINT `cmdb_instance_S_instance_id_37cba465e95a6f26_fk_cmdb_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `cmdb_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27500 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_interface
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_interface`;
CREATE TABLE `cmdb_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Instance_id` int(11) DEFAULT NULL,
  `MacAddress` varchar(100) DEFAULT NULL,
  `PrimaryIpAddress` varchar(100) DEFAULT NULL,
  `NetworkInterfaceId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_interface_Instance_id_1bbc38aa047c4675_fk_cmdb_instance_id` (`Instance_id`),
  CONSTRAINT `cmdb_interface_Instance_id_1bbc38aa047c4675_fk_cmdb_instance_id` FOREIGN KEY (`Instance_id`) REFERENCES `cmdb_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27500 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_network
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_network`;
CREATE TABLE `cmdb_network` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Zone_id` int(11) DEFAULT NULL,
  `CidrBlock` varchar(100) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `VSwitchName` varchar(100) NOT NULL,
  `VSwitchId` varchar(100) NOT NULL,
  `VpcId` varchar(100) NOT NULL,
  `AvailableIpAddressCount` int(11) DEFAULT NULL,
  `CreationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `VSwitchId` (`VSwitchId`),
  KEY `cmdb_network_Zone_id_261914ac3e51f10b_fk_cmdb_zone_id` (`Zone_id`),
  CONSTRAINT `cmdb_network_Zone_id_261914ac3e51f10b_fk_cmdb_zone_id` FOREIGN KEY (`Zone_id`) REFERENCES `cmdb_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_region
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_region`;
CREATE TABLE `cmdb_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Idc_id` int(11) DEFAULT NULL,
  `RegionId` varchar(100) NOT NULL,
  `LocalName` varchar(100) NOT NULL,
  `CreationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RegionId` (`RegionId`),
  KEY `cmdb_region_Idc_id_2af54d4a0a895a61_fk_cmdb_idc_id` (`Idc_id`),
  CONSTRAINT `cmdb_region_Idc_id_2af54d4a0a895a61_fk_cmdb_idc_id` FOREIGN KEY (`Idc_id`) REFERENCES `cmdb_idc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_securitygroup
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_securitygroup`;
CREATE TABLE `cmdb_securitygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Region_id` int(11) DEFAULT NULL,
  `SecurityGroupId` varchar(100) NOT NULL,
  `SecurityGroupName` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `VpcId` varchar(100) NOT NULL,
  `CreationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SecurityGroupId` (`SecurityGroupId`),
  KEY `cmdb_securitygroup_Region_id_4cd88b456acc7652_fk_cmdb_region_id` (`Region_id`),
  CONSTRAINT `cmdb_securitygroup_Region_id_4cd88b456acc7652_fk_cmdb_region_id` FOREIGN KEY (`Region_id`) REFERENCES `cmdb_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_usagerate
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_usagerate`;
CREATE TABLE `cmdb_usagerate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Instance_id` int(11) DEFAULT NULL,
  `Cpu` int(11) NOT NULL,
  `InstanceId` varchar(100) DEFAULT NULL,
  `CpuCount` varchar(100) DEFAULT NULL,
  `Memory` varchar(100) DEFAULT NULL,
  `DataDiskSize` varchar(100) DEFAULT NULL,
  `SysDiskSize` varchar(100) DEFAULT NULL,
  `DataDisk` varchar(100) DEFAULT NULL,
  `DataDiskIOWrite` varchar(100) DEFAULT NULL,
  `DataDiskIORead` varchar(100) DEFAULT NULL,
  `SysDisk` varchar(100) DEFAULT NULL,
  `SysDiskIOWrite` varchar(100) DEFAULT NULL,
  `SysDiskIORead` varchar(100) DEFAULT NULL,
  `NetWorkIN` varchar(100) DEFAULT NULL,
  `NetWorkOUT` varchar(100) DEFAULT NULL,
  `TcpConnect` varchar(100) DEFAULT NULL,
  `Total` varchar(100) DEFAULT NULL,
  `Timestamp` varchar(100) NOT NULL,
  `CreationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_usagerate_Instance_id_6fa8baac06dd25e5_fk_cmdb_instance_id` (`Instance_id`),
  CONSTRAINT `cmdb_usagerate_Instance_id_6fa8baac06dd25e5_fk_cmdb_instance_id` FOREIGN KEY (`Instance_id`) REFERENCES `cmdb_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29486 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_vpcinterface
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_vpcinterface`;
CREATE TABLE `cmdb_vpcinterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Instance_id` int(11) DEFAULT NULL,
  `VpcId` varchar(100) DEFAULT NULL,
  `VSwitchId` varchar(100) DEFAULT NULL,
  `PrivateIpAddress` varchar(100) DEFAULT NULL,
  `NatIpAddress` char(39) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_vpcinterfa_Instance_id_2837a622bb6a37d7_fk_cmdb_instance_id` (`Instance_id`),
  CONSTRAINT `cmdb_vpcinterfa_Instance_id_2837a622bb6a37d7_fk_cmdb_instance_id` FOREIGN KEY (`Instance_id`) REFERENCES `cmdb_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27500 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_zone
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_zone`;
CREATE TABLE `cmdb_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Region_id` int(11) DEFAULT NULL,
  `ZoneId` varchar(100) NOT NULL,
  `LocalName` varchar(100) NOT NULL,
  `CreationTime` datetime DEFAULT NULL,
  `NetworkTypes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ZoneId` (`ZoneId`),
  KEY `cmdb_zone_Region_id_4ba968afe68adff2_fk_cmdb_region_id` (`Region_id`),
  CONSTRAINT `cmdb_zone_Region_id_4ba968afe68adff2_fk_cmdb_region_id` FOREIGN KEY (`Region_id`) REFERENCES `cmdb_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_app_metric
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_app_metric`;
CREATE TABLE `datereport_index_app_metric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) DEFAULT NULL,
  `metric_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datereport_index_app_metric_6bc0a4eb` (`application_id`),
  KEY `datereport_index_app_metric_75a21318` (`metric_id`),
  CONSTRAINT `D00acbd7e0d4124b22bf09d0680430ed` FOREIGN KEY (`metric_id`) REFERENCES `datereport_index_metric_tempalte` (`id`),
  CONSTRAINT `dd2f9c2ded9be9ba998a85b6dfeaf489` FOREIGN KEY (`application_id`) REFERENCES `datereport_index_application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_application
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_application`;
CREATE TABLE `datereport_index_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_func_metric
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_func_metric`;
CREATE TABLE `datereport_index_func_metric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `resptime` int(11) NOT NULL,
  `reqcount` int(11) NOT NULL,
  `performance` int(11) NOT NULL,
  `func_id` int(11) DEFAULT NULL,
  `respfaile` int(11) NOT NULL,
  `respmax` int(11) NOT NULL,
  `respmin` int(11) NOT NULL,
  `reqid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`time`),
  KEY `datereport_index_func_metric_07cc694b` (`time`),
  KEY `datereport_index_func_metric_bd36eb99` (`func_id`),
  KEY `datereport_index_func_metric_641690a6` (`reqid`),
  CONSTRAINT `date_func_id_54df9b1afdbc4ef1_fk_datereport_index_metric_func_id` FOREIGN KEY (`func_id`) REFERENCES `datereport_index_metric_func` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20070258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_metric_float
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_metric_float`;
CREATE TABLE `datereport_index_metric_float` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `value` double NOT NULL,
  `count` int(11) NOT NULL,
  `metric_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dat_metric_id_59740adcec919694_fk_datereport_index_app_metric_id` (`metric_id`),
  KEY `datereport_index_metric_float_07cc694b` (`time`),
  CONSTRAINT `dat_metric_id_59740adcec919694_fk_datereport_index_app_metric_id` FOREIGN KEY (`metric_id`) REFERENCES `datereport_index_app_metric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_metric_func
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_metric_func`;
CREATE TABLE `datereport_index_metric_func` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `value` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `metric_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`value`),
  KEY `dat_metric_id_26d27fd85edb8c05_fk_datereport_index_app_metric_id` (`metric_id`),
  KEY `datereport_index_metric_func_07cc694b` (`time`),
  KEY `datereport_index_metric_func_2063c160` (`value`),
  CONSTRAINT `dat_metric_id_26d27fd85edb8c05_fk_datereport_index_app_metric_id` FOREIGN KEY (`metric_id`) REFERENCES `datereport_index_app_metric` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7065326 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_metric_int
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_metric_int`;
CREATE TABLE `datereport_index_metric_int` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `value` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `metric_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dat_metric_id_22a2caf805112765_fk_datereport_index_app_metric_id` (`metric_id`),
  KEY `datereport_index_metric_int_07cc694b` (`time`),
  CONSTRAINT `dat_metric_id_22a2caf805112765_fk_datereport_index_app_metric_id` FOREIGN KEY (`metric_id`) REFERENCES `datereport_index_app_metric` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_metric_string
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_metric_string`;
CREATE TABLE `datereport_index_metric_string` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `value` varchar(128) NOT NULL,
  `count` int(11) NOT NULL,
  `metric_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dat_metric_id_363e471de828f630_fk_datereport_index_app_metric_id` (`metric_id`),
  KEY `datereport_index_metric_string_07cc694b` (`time`),
  KEY `datereport_index_metric_string_value_7174ca106a373c9b_uniq` (`value`),
  CONSTRAINT `dat_metric_id_363e471de828f630_fk_datereport_index_app_metric_id` FOREIGN KEY (`metric_id`) REFERENCES `datereport_index_app_metric` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47595 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_metric_tempalte
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_metric_tempalte`;
CREATE TABLE `datereport_index_metric_tempalte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `datatype` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_index_metric_text
-- ----------------------------
DROP TABLE IF EXISTS `datereport_index_metric_text`;
CREATE TABLE `datereport_index_metric_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `value` longtext NOT NULL,
  `count` int(11) NOT NULL,
  `metric_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dat_metric_id_761d4d520b9b6f24_fk_datereport_index_app_metric_id` (`metric_id`),
  KEY `datereport_index_metric_text_07cc694b` (`time`),
  CONSTRAINT `dat_metric_id_761d4d520b9b6f24_fk_datereport_index_app_metric_id` FOREIGN KEY (`metric_id`) REFERENCES `datereport_index_app_metric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_ipublish_config
-- ----------------------------
DROP TABLE IF EXISTS `datereport_ipublish_config`;
CREATE TABLE `datereport_ipublish_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` varchar(128) NOT NULL,
  `version` varchar(50) NOT NULL,
  `jkname` varchar(128) NOT NULL,
  `jknumber` int(11) NOT NULL,
  `errcode` int(11) NOT NULL,
  `errmsg` varchar(255) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `modified_time` datetime DEFAULT NULL,
  `added_time` datetime DEFAULT NULL,
  `env_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskid` (`taskid`),
  KEY `datereport_ipublish_config_2ce84611` (`env_id`),
  KEY `datereport_ipublish_config_b098ad43` (`project_id`),
  CONSTRAINT `da_project_id_3df64dd081bf627c_fk_datereport_ipublish_project_id` FOREIGN KEY (`project_id`) REFERENCES `datereport_ipublish_project` (`id`),
  CONSTRAINT `datereport__env_id_5c584640f92ecea_fk_datereport_ipublish_env_id` FOREIGN KEY (`env_id`) REFERENCES `datereport_ipublish_env` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_ipublish_env
-- ----------------------------
DROP TABLE IF EXISTS `datereport_ipublish_env`;
CREATE TABLE `datereport_ipublish_env` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `modified_time` datetime DEFAULT NULL,
  `added_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_ipublish_package
-- ----------------------------
DROP TABLE IF EXISTS `datereport_ipublish_package`;
CREATE TABLE `datereport_ipublish_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` varchar(128) NOT NULL,
  `version` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `jkname` varchar(128) NOT NULL,
  `jknumber` int(11) NOT NULL,
  `progress` varchar(10) NOT NULL,
  `errcode` int(11) NOT NULL,
  `errmsg` varchar(255) NOT NULL,
  `download_success` tinyint(1) NOT NULL,
  `upload_success` tinyint(1) NOT NULL,
  `md5` varchar(256) NOT NULL,
  `alijkname` varchar(128) NOT NULL,
  `alijknumber` int(11) NOT NULL,
  `modified_time` datetime DEFAULT NULL,
  `added_time` datetime DEFAULT NULL,
  `env_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskid` (`taskid`),
  KEY `datereport_env_id_6fa89189dda53b25_fk_datereport_ipublish_env_id` (`env_id`),
  KEY `datereport_ipublish_package_b098ad43` (`project_id`),
  CONSTRAINT `da_project_id_1f5cf680c94ea94b_fk_datereport_ipublish_project_id` FOREIGN KEY (`project_id`) REFERENCES `datereport_ipublish_project` (`id`),
  CONSTRAINT `datereport_env_id_6fa89189dda53b25_fk_datereport_ipublish_env_id` FOREIGN KEY (`env_id`) REFERENCES `datereport_ipublish_env` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5618 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_ipublish_project
-- ----------------------------
DROP TABLE IF EXISTS `datereport_ipublish_project`;
CREATE TABLE `datereport_ipublish_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `byname` varchar(100) NOT NULL DEFAULT '' COMMENT '字段要加备注要',
  `name` varchar(100) NOT NULL,
  `version` varchar(50) NOT NULL DEFAULT '' COMMENT '在线版本',
  `packagename` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `confpath` varchar(255) DEFAULT NULL,
  `isgray` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `released` tinyint(1) NOT NULL,
  `hotswitch` tinyint(1) NOT NULL,
  `jtaskname` varchar(128) DEFAULT NULL,
  `checkurl` varchar(128) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `added_time` datetime DEFAULT NULL,
  `upstream` tinyint(1) NOT NULL,
  `packageupload` tinyint(1) NOT NULL,
  `policy` int(11) DEFAULT NULL,
  `docker_enabled` tinyint(1) NOT NULL,
  `docker_gcmaxmem` int(11) NOT NULL,
  `docker_maxcpu` int(11) NOT NULL,
  `docker_maxmem` int(11) NOT NULL,
  `entryurl` varchar(128) DEFAULT NULL,
  `api_version` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'api版本',
  `pool_id` int(11) NOT NULL DEFAULT '0' COMMENT 'pool的id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_ipublish_release
-- ----------------------------
DROP TABLE IF EXISTS `datereport_ipublish_release`;
CREATE TABLE `datereport_ipublish_release` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` varchar(128) NOT NULL,
  `version` varchar(50) NOT NULL,
  `progress` varchar(10) NOT NULL,
  `errcode` int(11) NOT NULL,
  `errmsg` varchar(255) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `alijkname` varchar(128) NOT NULL,
  `alijknumber` int(11) NOT NULL,
  `step` int(11) NOT NULL,
  `hosts` longtext NOT NULL,
  `rollback` tinyint(1) NOT NULL,
  `modified_time` datetime DEFAULT NULL,
  `added_time` datetime DEFAULT NULL,
  `env_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `executor` int(11) NOT NULL,
  `restart` tinyint(1) NOT NULL,
  `restartconfig` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskid` (`taskid`),
  KEY `datereport_env_id_33589567e3d952de_fk_datereport_ipublish_env_id` (`env_id`),
  KEY `da_project_id_22f9df5efe3ecc88_fk_datereport_ipublish_project_id` (`project_id`),
  CONSTRAINT `da_project_id_22f9df5efe3ecc88_fk_datereport_ipublish_project_id` FOREIGN KEY (`project_id`) REFERENCES `datereport_ipublish_project` (`id`),
  CONSTRAINT `datereport_env_id_33589567e3d952de_fk_datereport_ipublish_env_id` FOREIGN KEY (`env_id`) REFERENCES `datereport_ipublish_env` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12737 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_ipublish_version
-- ----------------------------
DROP TABLE IF EXISTS `datereport_ipublish_version`;
CREATE TABLE `datereport_ipublish_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `added_time` datetime DEFAULT NULL,
  `env_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datereport_env_id_49c62ba31470eb59_fk_datereport_ipublish_env_id` (`env_id`),
  KEY `da_project_id_288a08f3ae8bbc81_fk_datereport_ipublish_project_id` (`project_id`),
  CONSTRAINT `da_project_id_288a08f3ae8bbc81_fk_datereport_ipublish_project_id` FOREIGN KEY (`project_id`) REFERENCES `datereport_ipublish_project` (`id`),
  CONSTRAINT `datereport_env_id_49c62ba31470eb59_fk_datereport_ipublish_env_id` FOREIGN KEY (`env_id`) REFERENCES `datereport_ipublish_env` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7752 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_k8s_branch
-- ----------------------------
DROP TABLE IF EXISTS `datereport_k8s_branch`;
CREATE TABLE `datereport_k8s_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `url` varchar(255) NOT NULL,
  `added_time` datetime DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datereport_k8s_branch_b098ad43` (`project_id`),
  CONSTRAINT `da_project_id_507fe3382668b2bd_fk_datereport_ipublish_project_id` FOREIGN KEY (`project_id`) REFERENCES `datereport_ipublish_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156806 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_k8s_release
-- ----------------------------
DROP TABLE IF EXISTS `datereport_k8s_release`;
CREATE TABLE `datereport_k8s_release` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` varchar(128) NOT NULL,
  `branch` varchar(128) NOT NULL,
  `cbranch` varchar(128) NOT NULL,
  `action` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `errcode` int(11) NOT NULL,
  `errmsg` varchar(255) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `jkname` varchar(128) NOT NULL,
  `jknumber` int(11) NOT NULL,
  `executor` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `modified_time` datetime DEFAULT NULL,
  `added_time` datetime DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskid` (`taskid`),
  KEY `datereport_k8s_release_b098ad43` (`project_id`),
  CONSTRAINT `da_project_id_6a1629024d68e3ef_fk_datereport_ipublish_project_id` FOREIGN KEY (`project_id`) REFERENCES `datereport_ipublish_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_show_metric
-- ----------------------------
DROP TABLE IF EXISTS `datereport_show_metric`;
CREATE TABLE `datereport_show_metric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `mtype` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datereport_show_project
-- ----------------------------
DROP TABLE IF EXISTS `datereport_show_project`;
CREATE TABLE `datereport_show_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `metricname` varchar(80) NOT NULL,
  `begintime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `log_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `metricname` (`metricname`),
  KEY `datereport_show_project_5072fa9e` (`log_id`),
  CONSTRAINT `datereport__log_id_5bbf6b14fe75b684_fk_sysadmin_log_attribute_id` FOREIGN KEY (`log_id`) REFERENCES `sysadmin_log_attribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for omg_auth_policy
-- ----------------------------
DROP TABLE IF EXISTS `omg_auth_policy`;
CREATE TABLE `omg_auth_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT NULL,
  `policy` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for omg_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `omg_auth_role`;
CREATE TABLE `omg_auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `types` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for omg_auth_role_policies
-- ----------------------------
DROP TABLE IF EXISTS `omg_auth_role_policies`;
CREATE TABLE `omg_auth_role_policies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `policy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_id` (`role_id`,`policy_id`),
  KEY `omg_auth_role_p_policy_id_734cca9a13727678_fk_omg_auth_policy_id` (`policy_id`),
  CONSTRAINT `omg_auth_role_p_policy_id_734cca9a13727678_fk_omg_auth_policy_id` FOREIGN KEY (`policy_id`) REFERENCES `omg_auth_policy` (`id`),
  CONSTRAINT `omg_auth_role_polic_role_id_7a425f7da73b0378_fk_omg_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `omg_auth_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for omg_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `omg_auth_user`;
CREATE TABLE `omg_auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `modified` tinyint(1) NOT NULL,
  `permissions` longtext NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `is_headman` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11882 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for omg_auth_user_groupname
-- ----------------------------
DROP TABLE IF EXISTS `omg_auth_user_groupname`;
CREATE TABLE `omg_auth_user_groupname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`usergroup_id`),
  KEY `omg_auth__usergroup_id_4143b4f54a1cc1c7_fk_omg_auth_usergroup_id` (`usergroup_id`),
  CONSTRAINT `omg_auth__usergroup_id_4143b4f54a1cc1c7_fk_omg_auth_usergroup_id` FOREIGN KEY (`usergroup_id`) REFERENCES `omg_auth_usergroup` (`id`),
  CONSTRAINT `omg_auth_user_group_user_id_394c7a2c3a8a0b43_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63608881 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for omg_auth_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `omg_auth_user_roles`;
CREATE TABLE `omg_auth_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`),
  KEY `omg_auth_user_roles_role_id_2ecea74ff6ff44b_fk_omg_auth_role_id` (`role_id`),
  CONSTRAINT `omg_auth_user_roles_role_id_2ecea74ff6ff44b_fk_omg_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `omg_auth_role` (`id`),
  CONSTRAINT `omg_auth_user_roles_user_id_751317aa3d46e700_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for omg_auth_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `omg_auth_usergroup`;
CREATE TABLE `omg_auth_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupId` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pool_upstream
-- ----------------------------
DROP TABLE IF EXISTS `pool_upstream`;
CREATE TABLE `pool_upstream` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) DEFAULT '0' COMMENT 'pool id',
  `ipublish_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ipublish_project id',
  `host_id` int(11) DEFAULT '0' COMMENT '主机id',
  `upload_id` int(11) DEFAULT '0',
  `port` int(11) DEFAULT '0' COMMENT '端口',
  `weigth` int(11) DEFAULT '0' COMMENT '权重',
  `online` tinyint(4) DEFAULT '0' COMMENT '在线状态 1：在线 0：不在线',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '主机状态',
  `env` int(11) DEFAULT '0' COMMENT '环境 gray 和production',
  `tag` varchar(100) NOT NULL DEFAULT '',
  `directory` varchar(255) NOT NULL DEFAULT '' COMMENT 'tomcat 目录',
  `version` varchar(100) NOT NULL DEFAULT '' COMMENT '版本',
  `sub_version` int(11) NOT NULL DEFAULT '1' COMMENT '子版本',
  `update_time` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COMMENT='pool和nginx upstream表';

-- ----------------------------
-- Table structure for publish_history_log
-- ----------------------------
DROP TABLE IF EXISTS `publish_history_log`;
CREATE TABLE `publish_history_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL DEFAULT '' COMMENT '项目名称',
  `version` varchar(100) NOT NULL DEFAULT '' COMMENT '版本号',
  `target_type` int(11) DEFAULT '0' COMMENT '类型 1：上传 2：发布 3：切流量 4：回滚',
  `target_id` int(11) DEFAULT '0' COMMENT '对应表的id字段',
  `note` varchar(5000) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5480 DEFAULT CHARSET=utf8 COMMENT='操作历史表';

-- ----------------------------
-- Table structure for record_account
-- ----------------------------
DROP TABLE IF EXISTS `record_account`;
CREATE TABLE `record_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `account_number` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `account_type` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_actionrecord
-- ----------------------------
DROP TABLE IF EXISTS `record_actionrecord`;
CREATE TABLE `record_actionrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recordtime` datetime NOT NULL,
  `text` longtext NOT NULL,
  `datetimeadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `recordtype_id` int(11) DEFAULT NULL,
  `username_id` int(11) DEFAULT NULL,
  `sendemail` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_actionrecord_07ba63f5` (`attachment_id`),
  KEY `record_actionrecord_de9f99fe` (`recordtype_id`),
  KEY `record_actionrecord_bbe0c9aa` (`username_id`),
  CONSTRAINT `record_ac_attachment_id_671ff7b20eb3851f_fk_record_attachment_id` FOREIGN KEY (`attachment_id`) REFERENCES `record_attachment` (`id`),
  CONSTRAINT `record_ac_recordtype_id_140665e0feadd811_fk_record_typerecord_id` FOREIGN KEY (`recordtype_id`) REFERENCES `record_typerecord` (`id`),
  CONSTRAINT `record_actionre_username_id_6760af8b3edca25a_fk_omg_auth_user_id` FOREIGN KEY (`username_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_actionrecord_hosts
-- ----------------------------
DROP TABLE IF EXISTS `record_actionrecord_hosts`;
CREATE TABLE `record_actionrecord_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionrecord_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `actionrecord_id` (`actionrecord_id`,`host_id`),
  KEY `record_actionrecord_host_id_40a9049d8900d356_fk_sysadmin_host_id` (`host_id`),
  CONSTRAINT `recor_actionrecord_id_77df976a970fa1f5_fk_record_actionrecord_id` FOREIGN KEY (`actionrecord_id`) REFERENCES `record_actionrecord` (`id`),
  CONSTRAINT `record_actionrecord_host_id_40a9049d8900d356_fk_sysadmin_host_id` FOREIGN KEY (`host_id`) REFERENCES `sysadmin_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_alarm
-- ----------------------------
DROP TABLE IF EXISTS `record_alarm`;
CREATE TABLE `record_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AlarmName` varchar(255) DEFAULT NULL,
  `AlarmTime` datetime DEFAULT NULL,
  `AcceptTime` datetime DEFAULT NULL,
  `AcceptUser` varchar(255) DEFAULT NULL,
  `AlarmInfo` longtext,
  `AlarmAnalysis` longtext,
  `AffectDuration` int(11) DEFAULT NULL,
  `HandleTime` datetime DEFAULT NULL,
  `HandleUser` varchar(255) DEFAULT NULL,
  `HandleDesc` longtext,
  `HandleDuration` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `addedtime` datetime DEFAULT NULL,
  `adduser` int(11) DEFAULT NULL,
  `HandleResult_id` int(11) DEFAULT NULL,
  `Level_id` int(11) DEFAULT NULL,
  `Platform_id` int(11) DEFAULT NULL,
  `AffectDesc` longtext,
  `DoneTime` datetime DEFAULT NULL,
  `Jira` varchar(255) DEFAULT NULL,
  `Remark` longtext,
  `AlarmCount` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `Host` varchar(255) DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `ItemID` varchar(255) DEFAULT NULL,
  `TriggeRName` varchar(255) DEFAULT NULL,
  `TriggeRID` varchar(255) DEFAULT NULL,
  `TriggeRStatus` varchar(255) DEFAULT NULL,
  `EventID` varchar(255) DEFAULT NULL,
  `RecoryMessage` longtext,
  `Message` longtext,
  `TriggeRLevel` varchar(255) DEFAULT NULL,
  `AlertTime` datetime DEFAULT NULL,
  `RecoryTime` datetime DEFAULT NULL,
  `Plat` int(11) DEFAULT NULL,
  `Result` int(11) DEFAULT NULL,
  `AlarmLevel` int(11) DEFAULT NULL,
  `requrl` varchar(255) DEFAULT NULL,
  `GroupExpan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `record_alarm_4a4a79ba` (`HandleResult_id`),
  KEY `record_alarm_68f8ce2e` (`Level_id`),
  KEY `record_alarm_219060a1` (`Platform_id`),
  CONSTRAINT `record_HandleResult_id_779d9619cc08f6ce_fk_record_alarmresult_id` FOREIGN KEY (`HandleResult_id`) REFERENCES `record_alarmresult` (`id`),
  CONSTRAINT `record_al_Platform_id_3c79780bbb8a81e_fk_record_alarmplatform_id` FOREIGN KEY (`Platform_id`) REFERENCES `record_alarmplatform` (`id`),
  CONSTRAINT `record_alarm_Level_id_6118d905032f5fec_fk_record_alarmlevel_id` FOREIGN KEY (`Level_id`) REFERENCES `record_alarmlevel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81628 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_alarmlevel
-- ----------------------------
DROP TABLE IF EXISTS `record_alarmlevel`;
CREATE TABLE `record_alarmlevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `AddedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_alarmplatform
-- ----------------------------
DROP TABLE IF EXISTS `record_alarmplatform`;
CREATE TABLE `record_alarmplatform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `AddedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_alarmresult
-- ----------------------------
DROP TABLE IF EXISTS `record_alarmresult`;
CREATE TABLE `record_alarmresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `AddedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_attachment
-- ----------------------------
DROP TABLE IF EXISTS `record_attachment`;
CREATE TABLE `record_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_externalapp
-- ----------------------------
DROP TABLE IF EXISTS `record_externalapp`;
CREATE TABLE `record_externalapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `datetimeadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `externaltype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `record_externalapp_9296131c` (`externaltype_id`),
  CONSTRAINT `recor_externaltype_id_7b831be58b9f5d1b_fk_record_typeexternal_id` FOREIGN KEY (`externaltype_id`) REFERENCES `record_typeexternal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_externalpermission
-- ----------------------------
DROP TABLE IF EXISTS `record_externalpermission`;
CREATE TABLE `record_externalpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `external_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `record_ext_external_id_567a2b43c90f47d8_fk_record_externalapp_id` (`external_id`),
  CONSTRAINT `record_ext_external_id_567a2b43c90f47d8_fk_record_externalapp_id` FOREIGN KEY (`external_id`) REFERENCES `record_externalapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_todo_list
-- ----------------------------
DROP TABLE IF EXISTS `record_todo_list`;
CREATE TABLE `record_todo_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `serviceprovider` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `remind` tinyint(1) NOT NULL,
  `remind_time` datetime DEFAULT NULL,
  `remind_repeat` int(11) DEFAULT NULL,
  `remind_repeatend` int(11) DEFAULT NULL,
  `remind_repeatend_time` datetime DEFAULT NULL,
  `notifier_type` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `todotype_id` int(11) DEFAULT NULL,
  `remind_daysago` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_todo_list_9eef1fcd` (`todotype_id`),
  CONSTRAINT `record_todo__todotype_id_726bf19b46ad847b_fk_record_todo_type_id` FOREIGN KEY (`todotype_id`) REFERENCES `record_todo_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_todo_list_msg
-- ----------------------------
DROP TABLE IF EXISTS `record_todo_list_msg`;
CREATE TABLE `record_todo_list_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `addtime` datetime NOT NULL,
  `todolist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `record_todo_list_msg_f1088a70` (`todolist_id`),
  CONSTRAINT `record_todo__todolist_id_75aa5b812106c405_fk_record_todo_list_id` FOREIGN KEY (`todolist_id`) REFERENCES `record_todo_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_todo_list_notifier
-- ----------------------------
DROP TABLE IF EXISTS `record_todo_list_notifier`;
CREATE TABLE `record_todo_list_notifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `todo_list_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `todo_list_id` (`todo_list_id`,`user_id`),
  KEY `record_todo_list_no_user_id_5b2014d582245acc_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `record_todo__todo_list_id_c66289c656ff5fd_fk_record_todo_list_id` FOREIGN KEY (`todo_list_id`) REFERENCES `record_todo_list` (`id`),
  CONSTRAINT `record_todo_list_no_user_id_5b2014d582245acc_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_todo_type
-- ----------------------------
DROP TABLE IF EXISTS `record_todo_type`;
CREATE TABLE `record_todo_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_typeexternal
-- ----------------------------
DROP TABLE IF EXISTS `record_typeexternal`;
CREATE TABLE `record_typeexternal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_typerecord
-- ----------------------------
DROP TABLE IF EXISTS `record_typerecord`;
CREATE TABLE `record_typerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sendemail` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for release_queue
-- ----------------------------
DROP TABLE IF EXISTS `release_queue`;
CREATE TABLE `release_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) DEFAULT '0' COMMENT 'pool id',
  `project_name` varchar(100) NOT NULL DEFAULT '' COMMENT '项目名称',
  `version` varchar(100) NOT NULL DEFAULT '' COMMENT '版本号',
  `env` varchar(100) NOT NULL DEFAULT '' COMMENT '环境 gray 和 production',
  `status` int(11) DEFAULT '0' COMMENT '状态 -2 ：待处理 -1 ：处理中  0：失败 1：成功',
  `output` text COMMENT '执行操作记录',
  `params` varchar(100) NOT NULL DEFAULT '' COMMENT '参数',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8 COMMENT='发布队列表';

-- ----------------------------
-- Table structure for roll_back_queue
-- ----------------------------
DROP TABLE IF EXISTS `roll_back_queue`;
CREATE TABLE `roll_back_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) DEFAULT '0' COMMENT 'pool的id',
  `project_name` varchar(100) NOT NULL DEFAULT '' COMMENT '项目名称',
  `version` varchar(100) NOT NULL DEFAULT '' COMMENT '版本号',
  `env` varchar(100) NOT NULL DEFAULT '' COMMENT '环境 gray 和 production',
  `status` int(11) DEFAULT '0' COMMENT '状态 -2 ：待处理 -1 ：处理中  0：失败 1：成功',
  `output` text COMMENT '执行操作记录',
  `params` varchar(1000) NOT NULL DEFAULT '' COMMENT '参数',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_pool_od` (`pool_id`),
  KEY `idx_project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='回滚对列表';

-- ----------------------------
-- Table structure for switch_queue
-- ----------------------------
DROP TABLE IF EXISTS `switch_queue`;
CREATE TABLE `switch_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) DEFAULT '0' COMMENT 'pool id',
  `project_name` varchar(100) NOT NULL DEFAULT '' COMMENT '项目名称',
  `version` varchar(100) NOT NULL DEFAULT '' COMMENT '版本号',
  `env` varchar(100) NOT NULL DEFAULT '' COMMENT '环境 gray 和 production',
  `status` int(11) DEFAULT '0' COMMENT '状态 -2 ：待处理 -1 ：处理中  0：失败 1：成功',
  `output` text COMMENT '执行操作记录',
  `params` varchar(1000) NOT NULL DEFAULT '' COMMENT '参数',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8 COMMENT='切流量对列表';

-- ----------------------------
-- Table structure for sysadmin_app_aplication
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_app_aplication`;
CREATE TABLE `sysadmin_app_aplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `apptype` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` varchar(25) NOT NULL,
  `configuration` longtext NOT NULL,
  `state` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `env_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_app_aplication_2ce84611` (`env_id`),
  CONSTRAINT `sysadmin_app_aplic_env_id_1e13f3c20f581514_fk_sysadmin_sysenv_id` FOREIGN KEY (`env_id`) REFERENCES `sysadmin_sysenv` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_app_aplication_confs
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_app_aplication_confs`;
CREATE TABLE `sysadmin_app_aplication_confs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `destpath` varchar(255) NOT NULL,
  `aplication_id` int(11) DEFAULT NULL,
  `confgroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_aplication_id_2c9e3bde2e4d033e_fk_sysadmin_app_aplication_id` (`aplication_id`),
  KEY `sysadmin_app_aplication_confs_c11caf89` (`confgroup_id`),
  CONSTRAINT `sys_aplication_id_2c9e3bde2e4d033e_fk_sysadmin_app_aplication_id` FOREIGN KEY (`aplication_id`) REFERENCES `sysadmin_app_aplication` (`id`),
  CONSTRAINT `sysadmin__confgroup_id_1b042f7ea7f8b716_fk_sysadmin_confgroup_id` FOREIGN KEY (`confgroup_id`) REFERENCES `sysadmin_confgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_app_aplication_hosts
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_app_aplication_hosts`;
CREATE TABLE `sysadmin_app_aplication_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_aplication_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_aplication_id` (`app_aplication_id`,`host_id`),
  KEY `sysadmin_app_aplica_host_id_73506352944e99d2_fk_sysadmin_host_id` (`host_id`),
  CONSTRAINT `D40e078c3afb030796b5b612ac2b2af7` FOREIGN KEY (`app_aplication_id`) REFERENCES `sysadmin_app_aplication` (`id`),
  CONSTRAINT `sysadmin_app_aplica_host_id_73506352944e99d2_fk_sysadmin_host_id` FOREIGN KEY (`host_id`) REFERENCES `sysadmin_host` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_app_project
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_app_project`;
CREATE TABLE `sysadmin_app_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_app_project_application
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_app_project_application`;
CREATE TABLE `sysadmin_app_project_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_project_id` int(11) NOT NULL,
  `app_aplication_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_project_id` (`app_project_id`,`app_aplication_id`),
  KEY `app_aplication_id_46acfbbc9dfc923_fk_sysadmin_app_aplication_id` (`app_aplication_id`),
  CONSTRAINT `app_aplication_id_46acfbbc9dfc923_fk_sysadmin_app_aplication_id` FOREIGN KEY (`app_aplication_id`) REFERENCES `sysadmin_app_aplication` (`id`),
  CONSTRAINT `sysad_app_project_id_31c73f803b0acd01_fk_sysadmin_app_project_id` FOREIGN KEY (`app_project_id`) REFERENCES `sysadmin_app_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_appmetric_group
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_appmetric_group`;
CREATE TABLE `sysadmin_appmetric_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addedtime` datetime DEFAULT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `token` varchar(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_appmetric_items
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_appmetric_items`;
CREATE TABLE `sysadmin_appmetric_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addedtime` datetime DEFAULT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `developer` varchar(50) NOT NULL,
  `accuracy` varchar(10) NOT NULL,
  `mtype` varchar(25) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmi_group_id_4a1ff06bb55450c1_fk_sysadmin_appmetric_group_id` (`group_id`),
  CONSTRAINT `sysadmi_group_id_4a1ff06bb55450c1_fk_sysadmin_appmetric_group_id` FOREIGN KEY (`group_id`) REFERENCES `sysadmin_appmetric_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_confgroup
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_confgroup`;
CREATE TABLE `sysadmin_confgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `env_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sysadmin_confgroup_2ce84611` (`env_id`),
  CONSTRAINT `sysadmin_confgroup_env_id_3656b13b89c47510_fk_sysadmin_sysenv_id` FOREIGN KEY (`env_id`) REFERENCES `sysadmin_sysenv` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_confitem
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_confitem`;
CREATE TABLE `sysadmin_confitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `describe` varchar(255) NOT NULL,
  `policyid` int(11) DEFAULT NULL,
  `objectid` int(11) DEFAULT NULL,
  `uuid` varchar(100) NOT NULL,
  `pid` int(11) NOT NULL,
  `filetype` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `confgroupid_id` int(11) DEFAULT NULL,
  `templateid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `sysadmi_confgroupid_id_1c59cc816170f518_fk_sysadmin_confgroup_id` (`confgroupid_id`),
  KEY `sysadmin_confitem_3c31d2b3` (`templateid_id`),
  CONSTRAINT `D42925d5ff56f6d34444f94630cb046e` FOREIGN KEY (`templateid_id`) REFERENCES `sysadmin_conftemplatecontent` (`id`),
  CONSTRAINT `sysadmi_confgroupid_id_1c59cc816170f518_fk_sysadmin_confgroup_id` FOREIGN KEY (`confgroupid_id`) REFERENCES `sysadmin_confgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_conftemplatecontent
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_conftemplatecontent`;
CREATE TABLE `sysadmin_conftemplatecontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `describe` varchar(255) NOT NULL,
  `content` longtext,
  `deleted` tinyint(1) NOT NULL,
  `filetype` int(11) NOT NULL,
  `env_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_conftemplatecontent_2ce84611` (`env_id`),
  CONSTRAINT `sysadmin_conftempl_env_id_707c6e619141ac4e_fk_sysadmin_sysenv_id` FOREIGN KEY (`env_id`) REFERENCES `sysadmin_sysenv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_conftextcontent
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_conftextcontent`;
CREATE TABLE `sysadmin_conftextcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `confid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_conf_confid_id_70728054c5a30f7a_fk_sysadmin_confitem_id` (`confid_id`),
  CONSTRAINT `sysadmin_conf_confid_id_70728054c5a30f7a_fk_sysadmin_confitem_id` FOREIGN KEY (`confid_id`) REFERENCES `sysadmin_confitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_confversion
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_confversion`;
CREATE TABLE `sysadmin_confversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(25) NOT NULL,
  `describe` varchar(255) NOT NULL,
  `confgroupid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `sysadmi_confgroupid_id_7a1bb246c6633216_fk_sysadmin_confgroup_id` (`confgroupid_id`),
  CONSTRAINT `sysadmi_confgroupid_id_7a1bb246c6633216_fk_sysadmin_confgroup_id` FOREIGN KEY (`confgroupid_id`) REFERENCES `sysadmin_confgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_health_host
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_health_host`;
CREATE TABLE `sysadmin_health_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `time` datetime DEFAULT NULL,
  `score` int(11) NOT NULL,
  `scoremap` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104672 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_health_platform
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_health_platform`;
CREATE TABLE `sysadmin_health_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `score` int(11) NOT NULL,
  `scoremap` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104672 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_host
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_host`;
CREATE TABLE `sysadmin_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(100) NOT NULL,
  `inerip` char(39) NOT NULL,
  `managerip` char(39) NOT NULL,
  `outip` char(39) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mac` varchar(100) DEFAULT NULL,
  `remote_ip` varchar(16) DEFAULT NULL,
  `brand` varchar(64) DEFAULT NULL,
  `cpu` varchar(64) DEFAULT NULL,
  `memory` varchar(128) DEFAULT NULL,
  `disk` varchar(1024) DEFAULT NULL,
  `system_name` varchar(320) DEFAULT NULL,
  `system_type` varchar(32) DEFAULT NULL,
  `system_version` varchar(8) DEFAULT NULL,
  `system_arch` varchar(16) DEFAULT NULL,
  `cabinet` varchar(32) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `hoststatus` int(11) DEFAULT NULL,
  `hosttype` int(11) DEFAULT NULL,
  `sn` varchar(128) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `sshkey` varchar(100) DEFAULT NULL,
  `sshkey_push` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `env_id` int(11) DEFAULT NULL,
  `roomname_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_host_2ce84611` (`env_id`),
  KEY `sysadmin_host_938fb28e` (`roomname_id`),
  CONSTRAINT `sysadmin_host_env_id_56714448ceffc4b0_fk_sysadmin_sysenv_id` FOREIGN KEY (`env_id`) REFERENCES `sysadmin_sysenv` (`id`),
  CONSTRAINT `sysadmin_host_roomname_id_7e4d14df4860f346_fk_sysadmin_room_id` FOREIGN KEY (`roomname_id`) REFERENCES `sysadmin_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_host_groupname
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_host_groupname`;
CREATE TABLE `sysadmin_host_groupname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `hostgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host_id` (`host_id`,`hostgroup_id`),
  KEY `sysadmin__hostgroup_id_50345d1bfd3badc3_fk_sysadmin_hostgroup_id` (`hostgroup_id`),
  CONSTRAINT `sysadmin__hostgroup_id_50345d1bfd3badc3_fk_sysadmin_hostgroup_id` FOREIGN KEY (`hostgroup_id`) REFERENCES `sysadmin_hostgroup` (`id`),
  CONSTRAINT `sysadmin_host_group_host_id_4564f062fa1ebb99_fk_sysadmin_host_id` FOREIGN KEY (`host_id`) REFERENCES `sysadmin_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_hostgroup
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_hostgroup`;
CREATE TABLE `sysadmin_hostgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(100) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `hostnum` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_kvconfcontent
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_kvconfcontent`;
CREATE TABLE `sysadmin_kvconfcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext,
  `describe` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `confid_id` int(11) DEFAULT NULL,
  `kvgroupid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_kvco_confid_id_2b96bb19109ae606_fk_sysadmin_confitem_id` (`confid_id`),
  KEY `sysadmin_kvconfcontent_46ab66bc` (`kvgroupid_id`),
  CONSTRAINT `sysadmi_kvgroupid_id_618353b031ab341f_fk_sysadmin_kvconfgroup_id` FOREIGN KEY (`kvgroupid_id`) REFERENCES `sysadmin_kvconfgroup` (`id`),
  CONSTRAINT `sysadmin_kvco_confid_id_2b96bb19109ae606_fk_sysadmin_confitem_id` FOREIGN KEY (`confid_id`) REFERENCES `sysadmin_confitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_kvconfgroup
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_kvconfgroup`;
CREATE TABLE `sysadmin_kvconfgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `confid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_kvco_confid_id_47f6c910fbe611de_fk_sysadmin_confitem_id` (`confid_id`),
  CONSTRAINT `sysadmin_kvco_confid_id_47f6c910fbe611de_fk_sysadmin_confitem_id` FOREIGN KEY (`confid_id`) REFERENCES `sysadmin_confitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_kvconftemplatecontent
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_kvconftemplatecontent`;
CREATE TABLE `sysadmin_kvconftemplatecontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext,
  `describe` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `kvgroupid_id` int(11) DEFAULT NULL,
  `tplid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_kvconftemplatecontent_46ab66bc` (`kvgroupid_id`),
  KEY `sysadmin_kvconftemplatecontent_145ed20e` (`tplid_id`),
  CONSTRAINT `D1f46448fe1738ab6ef3d9c95b368a76` FOREIGN KEY (`kvgroupid_id`) REFERENCES `sysadmin_kvconftemplategroup` (`id`),
  CONSTRAINT `sys_tplid_id_2b172dab9d6f6481_fk_sysadmin_conftemplatecontent_id` FOREIGN KEY (`tplid_id`) REFERENCES `sysadmin_conftemplatecontent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_kvconftemplategroup
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_kvconftemplategroup`;
CREATE TABLE `sysadmin_kvconftemplategroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tplid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_tplid_id_5f14899e517c9e2b_fk_sysadmin_conftemplatecontent_id` (`tplid_id`),
  CONSTRAINT `sys_tplid_id_5f14899e517c9e2b_fk_sysadmin_conftemplatecontent_id` FOREIGN KEY (`tplid_id`) REFERENCES `sysadmin_conftemplatecontent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_log_applyfor
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_log_applyfor`;
CREATE TABLE `sysadmin_log_applyfor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `state` int(11) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_log_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_log_attribute`;
CREATE TABLE `sysadmin_log_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `logtype` int(11) NOT NULL,
  `logsource` int(11) NOT NULL,
  `hoststype` int(11) NOT NULL,
  `file_tools` int(11) NOT NULL,
  `file_path` longtext,
  `file_prefix` longtext,
  `es_port` int(11) DEFAULT NULL,
  `es_index` varchar(255) DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `validtime` int(11) NOT NULL,
  `offsettime` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `developer` varchar(128) DEFAULT NULL,
  `es_index_template` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_log_attribute_hosts
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_log_attribute_hosts`;
CREATE TABLE `sysadmin_log_attribute_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_attribute_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_attribute_id` (`log_attribute_id`,`host_id`),
  KEY `sysadmin_log_attrib_host_id_4de65331c89a6822_fk_sysadmin_host_id` (`host_id`),
  CONSTRAINT `s_log_attribute_id_3900e5f4c8456a0e_fk_sysadmin_log_attribute_id` FOREIGN KEY (`log_attribute_id`) REFERENCES `sysadmin_log_attribute` (`id`),
  CONSTRAINT `sysadmin_log_attrib_host_id_4de65331c89a6822_fk_sysadmin_host_id` FOREIGN KEY (`host_id`) REFERENCES `sysadmin_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_log_attribute_permission
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_log_attribute_permission`;
CREATE TABLE `sysadmin_log_attribute_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `log_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_lo_log_id_3b08c4298071d43e_fk_sysadmin_log_attribute_id` (`log_id`),
  CONSTRAINT `sysadmin_lo_log_id_3b08c4298071d43e_fk_sysadmin_log_attribute_id` FOREIGN KEY (`log_id`) REFERENCES `sysadmin_log_attribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=684 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_log_projectindex
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_log_projectindex`;
CREATE TABLE `sysadmin_log_projectindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_modeltest
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_modeltest`;
CREATE TABLE `sysadmin_modeltest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `policyid` int(11) NOT NULL,
  `objectid` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_room
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_room`;
CREATE TABLE `sysadmin_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomname` varchar(100) NOT NULL,
  `bandwidth` varchar(32) DEFAULT NULL,
  `linkman` varchar(16) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `network` longtext,
  `date_added` date DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `hostnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roomname` (`roomname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_service
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_service`;
CREATE TABLE `sysadmin_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `env_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sysadmin_service_2ce84611` (`env_id`),
  CONSTRAINT `sysadmin_service_env_id_623a00d7059fb5c_fk_sysadmin_sysenv_id` FOREIGN KEY (`env_id`) REFERENCES `sysadmin_sysenv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_service_developuser
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_service_developuser`;
CREATE TABLE `sysadmin_service_developuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_id` (`service_id`,`user_id`),
  KEY `sysadmin_service_de_user_id_3f77daabbeb09b90_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `sysadmin_serv_service_id_310c5f6157ecc931_fk_sysadmin_service_id` FOREIGN KEY (`service_id`) REFERENCES `sysadmin_service` (`id`),
  CONSTRAINT `sysadmin_service_de_user_id_3f77daabbeb09b90_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_service_hosts
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_service_hosts`;
CREATE TABLE `sysadmin_service_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_id` (`service_id`,`host_id`),
  KEY `sysadmin_service_ho_host_id_4f6d72d4a9a80fc6_fk_sysadmin_host_id` (`host_id`),
  CONSTRAINT `sysadmin_serv_service_id_6bc45ba482200726_fk_sysadmin_service_id` FOREIGN KEY (`service_id`) REFERENCES `sysadmin_service` (`id`),
  CONSTRAINT `sysadmin_service_ho_host_id_4f6d72d4a9a80fc6_fk_sysadmin_host_id` FOREIGN KEY (`host_id`) REFERENCES `sysadmin_host` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_service_opsuser
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_service_opsuser`;
CREATE TABLE `sysadmin_service_opsuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_id` (`service_id`,`user_id`),
  KEY `sysadmin_service_op_user_id_6538374980d274bb_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `sysadmin_serv_service_id_237bd493dd9220bc_fk_sysadmin_service_id` FOREIGN KEY (`service_id`) REFERENCES `sysadmin_service` (`id`),
  CONSTRAINT `sysadmin_service_op_user_id_6538374980d274bb_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_sysenv
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_sysenv`;
CREATE TABLE `sysadmin_sysenv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_sysenv_user
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_sysenv_user`;
CREATE TABLE `sysadmin_sysenv_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysenv_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysenv_id` (`sysenv_id`,`user_id`),
  KEY `sysadmin_sysenv_user_user_id_ba0a889f8c8abec_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `sysadmin_sysenv_sysenv_id_5ba5fa6c87d888bd_fk_sysadmin_sysenv_id` FOREIGN KEY (`sysenv_id`) REFERENCES `sysadmin_sysenv` (`id`),
  CONSTRAINT `sysadmin_sysenv_user_user_id_ba0a889f8c8abec_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_system_record
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_system_record`;
CREATE TABLE `sysadmin_system_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addedtime` datetime DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `module` varchar(25) NOT NULL,
  `content` longtext,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74862 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_upyun
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_upyun`;
CREATE TABLE `sysadmin_upyun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` varchar(100) NOT NULL,
  `operator` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_upyundir
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_upyundir`;
CREATE TABLE `sysadmin_upyundir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(500) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `upyun_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_upyundir_upyun_id_2ec86e69273c74fe_fk_sysadmin_upyun_id` (`upyun_id`),
  CONSTRAINT `sysadmin_upyundir_upyun_id_2ec86e69273c74fe_fk_sysadmin_upyun_id` FOREIGN KEY (`upyun_id`) REFERENCES `sysadmin_upyun` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_upyundirpermission
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_upyundirpermission`;
CREATE TABLE `sysadmin_upyundirpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `createdir` tinyint(1) NOT NULL,
  `uploadfile` tinyint(1) NOT NULL,
  `deletefile` tinyint(1) NOT NULL,
  `downloadfile` tinyint(1) NOT NULL,
  `upyundir_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_up_upyundir_id_4a3c93914c0c6367_fk_sysadmin_upyundir_id` (`upyundir_id`),
  CONSTRAINT `sysadmin_up_upyundir_id_4a3c93914c0c6367_fk_sysadmin_upyundir_id` FOREIGN KEY (`upyundir_id`) REFERENCES `sysadmin_upyundir` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_upyunpermission
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_upyunpermission`;
CREATE TABLE `sysadmin_upyunpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `upyun_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_upyunper_upyun_id_65a14541e8422d3f_fk_sysadmin_upyun_id` (`upyun_id`),
  CONSTRAINT `sysadmin_upyunper_upyun_id_65a14541e8422d3f_fk_sysadmin_upyun_id` FOREIGN KEY (`upyun_id`) REFERENCES `sysadmin_upyun` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_usability
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_usability`;
CREATE TABLE `sysadmin_usability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` double DEFAULT NULL,
  `inittime` datetime DEFAULT NULL,
  `addedtime` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_usabilityevent
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_usabilityevent`;
CREATE TABLE `sysadmin_usabilityevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `userid` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `description` longtext,
  `filishtime` datetime DEFAULT NULL,
  `addedtime` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `leve_id` int(11) DEFAULT NULL,
  `send_to` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_usabilityevent_f3c7339a` (`leve_id`),
  CONSTRAINT `sysadmin__leve_id_4b829d7d580afef6_fk_sysadmin_usabilitylevel_id` FOREIGN KEY (`leve_id`) REFERENCES `sysadmin_usabilitylevel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_usabilitylevel
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_usabilitylevel`;
CREATE TABLE `sysadmin_usabilitylevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `value` double DEFAULT NULL,
  `addedtime` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_usabilitymessage
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_usabilitymessage`;
CREATE TABLE `sysadmin_usabilitymessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `attachment` longtext NOT NULL,
  `message` longtext NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `usability_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_usabilitymessage_8eb0c81d` (`usability_id`),
  CONSTRAINT `sysa_usability_id_345981687970bad4_fk_sysadmin_usabilityevent_id` FOREIGN KEY (`usability_id`) REFERENCES `sysadmin_usabilityevent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_wifienv
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_wifienv`;
CREATE TABLE `sysadmin_wifienv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `policyid` int(11) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `appid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_wifipolicy
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_wifipolicy`;
CREATE TABLE `sysadmin_wifipolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `description` varchar(50) NOT NULL,
  `wifienv_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_wifi_wifienv_id_4245f878c55d7f90_fk_sysadmin_wifienv_id` (`wifienv_id`),
  CONSTRAINT `sysadmin_wifi_wifienv_id_4245f878c55d7f90_fk_sysadmin_wifienv_id` FOREIGN KEY (`wifienv_id`) REFERENCES `sysadmin_wifienv` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_wifipolicydetail
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_wifipolicydetail`;
CREATE TABLE `sysadmin_wifipolicydetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sip` varchar(100) NOT NULL,
  `dip` varchar(100) NOT NULL,
  `sport` int(11) DEFAULT NULL,
  `dport` int(11) DEFAULT NULL,
  `addedtime` datetime DEFAULT NULL,
  `wifipolicy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmi_wifipolicy_id_402836d3137f9183_fk_sysadmin_wifipolicy_id` (`wifipolicy_id`),
  CONSTRAINT `sysadmi_wifipolicy_id_402836d3137f9183_fk_sysadmin_wifipolicy_id` FOREIGN KEY (`wifipolicy_id`) REFERENCES `sysadmin_wifipolicy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workorder
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workorder`;
CREATE TABLE `sysadmin_workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `priority` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  `attachment` longtext NOT NULL,
  `orderfield` longtext NOT NULL,
  `send_to` varchar(512) NOT NULL,
  `send_cc` varchar(512) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `confirmtime` datetime DEFAULT NULL,
  `closetime` datetime DEFAULT NULL,
  `confirmuser` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `delete` tinyint(1) NOT NULL,
  `ordertemp_id` int(11) DEFAULT NULL,
  `ordernum` varchar(100) DEFAULT NULL,
  `hidestatus` varchar(45) DEFAULT NULL,
  `auditgroup` varchar(100) NOT NULL,
  `audittime` datetime DEFAULT NULL,
  `audituser` int(11) DEFAULT NULL,
  `dealtime` double DEFAULT NULL,
  `conftime` double DEFAULT NULL,
  `reopentime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_workorder_cb848637` (`ordertemp_id`),
  CONSTRAINT `sysad_ordertemp_id_5a69562bfa9d4c7b_fk_sysadmin_workordertemp_id` FOREIGN KEY (`ordertemp_id`) REFERENCES `sysadmin_workordertemp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7617 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workorder_auditusers
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workorder_auditusers`;
CREATE TABLE `sysadmin_workorder_auditusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workorder_id` (`workorder_id`,`user_id`),
  KEY `sysadmin_workorder__user_id_52516e309b8e1c6e_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `sysadmin__workorder_id_13060a5613d7eb9f_fk_sysadmin_workorder_id` FOREIGN KEY (`workorder_id`) REFERENCES `sysadmin_workorder` (`id`),
  CONSTRAINT `sysadmin_workorder__user_id_52516e309b8e1c6e_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11413 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workorder_ccusers
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workorder_ccusers`;
CREATE TABLE `sysadmin_workorder_ccusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workorder_id` (`workorder_id`,`user_id`),
  KEY `sysadmin_workorder__user_id_5326472a1b04ce76_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `sysadmin__workorder_id_335589e0e40e0945_fk_sysadmin_workorder_id` FOREIGN KEY (`workorder_id`) REFERENCES `sysadmin_workorder` (`id`),
  CONSTRAINT `sysadmin_workorder__user_id_5326472a1b04ce76_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2335 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workorder_tousers
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workorder_tousers`;
CREATE TABLE `sysadmin_workorder_tousers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workorder_id` (`workorder_id`,`user_id`),
  KEY `sysadmin_workorder__user_id_11c1f5df950e9949_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `sysadmin__workorder_id_4448d34763b71268_fk_sysadmin_workorder_id` FOREIGN KEY (`workorder_id`) REFERENCES `sysadmin_workorder` (`id`),
  CONSTRAINT `sysadmin_workorder__user_id_11c1f5df950e9949_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workordereff
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workordereff`;
CREATE TABLE `sysadmin_workordereff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` double DEFAULT NULL,
  `addedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workorderfield
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workorderfield`;
CREATE TABLE `sysadmin_workorderfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `delete` tinyint(1) NOT NULL,
  `fieldtype_id` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sysadmin_workorderfield_381a7c0e` (`fieldtype_id`),
  CONSTRAINT `fieldtype_id_79ceb38e59244b20_fk_sysadmin_workorderfieldtype_id` FOREIGN KEY (`fieldtype_id`) REFERENCES `sysadmin_workorderfieldtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workorderfieldtype
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workorderfieldtype`;
CREATE TABLE `sysadmin_workorderfieldtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `temp` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workordermessage
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workordermessage`;
CREATE TABLE `sysadmin_workordermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `attachment` longtext NOT NULL,
  `message` longtext NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `orderid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_wo_orderid_id_50709ab5aa72ecca_fk_sysadmin_workorder_id` (`orderid_id`),
  CONSTRAINT `sysadmin_wo_orderid_id_50709ab5aa72ecca_fk_sysadmin_workorder_id` FOREIGN KEY (`orderid_id`) REFERENCES `sysadmin_workorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34263 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workordertemp
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workordertemp`;
CREATE TABLE `sysadmin_workordertemp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `default_send` varchar(1024) NOT NULL,
  `cc` varchar(1024) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `delete` tinyint(1) NOT NULL,
  `typeid_id` int(11) DEFAULT NULL,
  `is_audit` tinyint(1) NOT NULL,
  `is_attachment` tinyint(1) NOT NULL,
  `is_cc` tinyint(1) NOT NULL,
  `is_confirm` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sysadmin_workordertemp_84e44270` (`typeid_id`),
  CONSTRAINT `sysadmin_typeid_id_58e7a33a6ea0ad71_fk_sysadmin_workordertype_id` FOREIGN KEY (`typeid_id`) REFERENCES `sysadmin_workordertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workordertemp_auditgroup
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workordertemp_auditgroup`;
CREATE TABLE `sysadmin_workordertemp_auditgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workordertemp_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workordertemp_id` (`workordertemp_id`,`usergroup_id`),
  KEY `sysadmin_w_usergroup_id_b33a92a783d099d_fk_omg_auth_usergroup_id` (`usergroup_id`),
  CONSTRAINT `s_workordertemp_id_19e2c757788d69aa_fk_sysadmin_workordertemp_id` FOREIGN KEY (`workordertemp_id`) REFERENCES `sysadmin_workordertemp` (`id`),
  CONSTRAINT `sysadmin_w_usergroup_id_b33a92a783d099d_fk_omg_auth_usergroup_id` FOREIGN KEY (`usergroup_id`) REFERENCES `omg_auth_usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3395 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workordertemp_ccusers
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workordertemp_ccusers`;
CREATE TABLE `sysadmin_workordertemp_ccusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workordertemp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workordertemp_id` (`workordertemp_id`,`user_id`),
  KEY `sysadmin_workordert_user_id_7ee3eea705ebd93c_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `s_workordertemp_id_66b48f5b420fcc79_fk_sysadmin_workordertemp_id` FOREIGN KEY (`workordertemp_id`) REFERENCES `sysadmin_workordertemp` (`id`),
  CONSTRAINT `sysadmin_workordert_user_id_7ee3eea705ebd93c_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1715 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workordertemp_fieldid
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workordertemp_fieldid`;
CREATE TABLE `sysadmin_workordertemp_fieldid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workordertemp_id` int(11) NOT NULL,
  `workorderfield_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workordertemp_id` (`workordertemp_id`,`workorderfield_id`),
  KEY `workorderfield_id_3d2ab72c94ecbd9_fk_sysadmin_workorderfield_id` (`workorderfield_id`),
  CONSTRAINT `s_workordertemp_id_6f0745c77cde4dfe_fk_sysadmin_workordertemp_id` FOREIGN KEY (`workordertemp_id`) REFERENCES `sysadmin_workordertemp` (`id`),
  CONSTRAINT `workorderfield_id_3d2ab72c94ecbd9_fk_sysadmin_workorderfield_id` FOREIGN KEY (`workorderfield_id`) REFERENCES `sysadmin_workorderfield` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2090 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workordertemp_tousers
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workordertemp_tousers`;
CREATE TABLE `sysadmin_workordertemp_tousers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workordertemp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workordertemp_id` (`workordertemp_id`,`user_id`),
  KEY `sysadmin_workordert_user_id_5bb534d08b6ecead_fk_omg_auth_user_id` (`user_id`),
  CONSTRAINT `s_workordertemp_id_5b155d677bef6ff0_fk_sysadmin_workordertemp_id` FOREIGN KEY (`workordertemp_id`) REFERENCES `sysadmin_workordertemp` (`id`),
  CONSTRAINT `sysadmin_workordert_user_id_5bb534d08b6ecead_fk_omg_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `omg_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysadmin_workordertype
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin_workordertype`;
CREATE TABLE `sysadmin_workordertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `addedtime` datetime DEFAULT NULL,
  `delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tmp_user
-- ----------------------------
DROP TABLE IF EXISTS `tmp_user`;
CREATE TABLE `tmp_user` (
  `email` varchar(254) NOT NULL,
  `username` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt1
-- ----------------------------
DROP TABLE IF EXISTS `tt1`;
CREATE TABLE `tt1` (
  `id` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  `value` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `metric_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for upload_queue
-- ----------------------------
DROP TABLE IF EXISTS `upload_queue`;
CREATE TABLE `upload_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL DEFAULT '' COMMENT '项目名称',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '包url地址',
  `version` varchar(100) NOT NULL DEFAULT '' COMMENT '版本号',
  `progress` varchar(100) DEFAULT '' COMMENT '进度比例',
  `status` int(11) DEFAULT '0' COMMENT '状态 -2：待上传 -1：上传中 0：上传失败 1：上传成功',
  `output` text COMMENT '输出结果',
  `update_time` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
