/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-12 12:46:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `article_id` int(20) NOT NULL COMMENT '关联文章',
  `name` varchar(120) NOT NULL,
  `content` text,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `contact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES ('1', '1', '吴之全', '这是一条评论', '2019-02-10 18:56:30', null);
INSERT INTO `blog_comment` VALUES ('2', '1', '吴之全', '这还是一条评论', '2019-02-10 18:58:26', '15017522926');
INSERT INTO `blog_comment` VALUES ('3', '1', '吴志群', '我又来了', '2019-02-10 18:59:07', '15017522926');
