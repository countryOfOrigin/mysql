/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : specialty

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-05 10:41:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`class_id`),
  KEY `class_name` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classification
-- ----------------------------

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `coll_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`coll_id`),
  KEY `fk_collection_goods_good_id` (`good_id`),
  KEY `fk_collection_users_user_id` (`user_id`),
  CONSTRAINT `fk_collection_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_collection_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `selection` int(11) NOT NULL COMMENT '评选项',
  `time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comm_id`),
  KEY `fk_comment_goods_good_id` (`good_id`),
  KEY `fk_comment_users_user_id` (`user_id`),
  CONSTRAINT `fk_comment_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL COMMENT '价格',
  `count` int(11) NOT NULL COMMENT '数量',
  `cost` decimal(10,0) NOT NULL COMMENT '成本',
  `sales_volume` int(11) NOT NULL COMMENT '销量',
  `time` datetime NOT NULL COMMENT '上架时间',
  `parameter` varchar(255) NOT NULL COMMENT '产品参数',
  `recommend` tinyint(4) NOT NULL COMMENT '推荐商品标志',
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for goods_classification
-- ----------------------------
DROP TABLE IF EXISTS `goods_classification`;
CREATE TABLE `goods_classification` (
  `goodclass_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  PRIMARY KEY (`goodclass_id`),
  KEY `fk_goods_classification_classification_class_name` (`class_name`),
  KEY `fk_goods_classification_goods_good_id` (`good_id`),
  CONSTRAINT `fk_goods_classification_classification_class_name` FOREIGN KEY (`class_name`) REFERENCES `classification` (`class_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_classification_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_classification
-- ----------------------------

-- ----------------------------
-- Table structure for goods_receipt
-- ----------------------------
DROP TABLE IF EXISTS `goods_receipt`;
CREATE TABLE `goods_receipt` (
  `receipt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '收货人姓名',
  `telephone` varchar(255) NOT NULL COMMENT '收货人电话',
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`receipt_id`),
  KEY `fk_goods_receipt_users_user_id` (`user_id`),
  CONSTRAINT `fk_goods_receipt_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_receipt
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL COMMENT '订单时间',
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_goods_good_id` (`good_id`),
  KEY `fk_orders_users_user_id` (`user_id`),
  KEY `fk_orders_goods_receipt_receipt_id` (`receipt_id`),
  CONSTRAINT `fk_orders_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_goods_receipt_receipt_id` FOREIGN KEY (`receipt_id`) REFERENCES `goods_receipt` (`receipt_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for recent_browse
-- ----------------------------
DROP TABLE IF EXISTS `recent_browse`;
CREATE TABLE `recent_browse` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` datetime NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`good_id`),
  KEY `fk_recent_browse_users_user_id` (`user_id`),
  CONSTRAINT `fk_recent_browse_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_recent_browse_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recent_browse
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品数量',
  PRIMARY KEY (`shop_id`),
  KEY `fk_shopping_cart_goods_good_id` (`good_id`),
  KEY `fk_shopping_cart_users_user_id` (`user_id`),
  CONSTRAINT `fk_shopping_cart_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shopping_cart_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `time` datetime NOT NULL COMMENT '注册时间',
  `grade` int(11) NOT NULL COMMENT '等级',
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL COMMENT '收货默认地址',
  `telephone` varchar(255) NOT NULL COMMENT '绑定电话',
  `url` varchar(255) NOT NULL COMMENT '头像路径',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
