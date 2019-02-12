/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-12 12:46:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_tab
-- ----------------------------
DROP TABLE IF EXISTS `blog_tab`;
CREATE TABLE `blog_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tab_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tab
-- ----------------------------
INSERT INTO `blog_tab` VALUES ('1', 'HTML5');
INSERT INTO `blog_tab` VALUES ('2', 'CSS3');
INSERT INTO `blog_tab` VALUES ('3', 'Javascript');
INSERT INTO `blog_tab` VALUES ('4', 'Jquery');
INSERT INTO `blog_tab` VALUES ('5', 'es6');
INSERT INTO `blog_tab` VALUES ('6', 'VUE');
INSERT INTO `blog_tab` VALUES ('7', 'gulp');
INSERT INTO `blog_tab` VALUES ('8', 'webpack');
INSERT INTO `blog_tab` VALUES ('9', 'react');
