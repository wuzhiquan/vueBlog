/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-12 12:46:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_menu
-- ----------------------------
DROP TABLE IF EXISTS `blog_menu`;
CREATE TABLE `blog_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cnName` varchar(255) NOT NULL,
  `routeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_menu
-- ----------------------------
INSERT INTO `blog_menu` VALUES ('1', '首页', 'Welcome');
INSERT INTO `blog_menu` VALUES ('2', '关于我', 'AboutMe');
INSERT INTO `blog_menu` VALUES ('3', '博客', 'BlogList');
INSERT INTO `blog_menu` VALUES ('4', '相册', 'Picture');
INSERT INTO `blog_menu` VALUES ('5', '发布', 'Editor');
