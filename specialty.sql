/*
Navicat MySQL Data Transfer

Source Server         : maple
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : specialty

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-08-13 14:36:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `classification`
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`class_id`),
  KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES ('6', '养生');
INSERT INTO `classification` VALUES ('1', '农副      ');
INSERT INTO `classification` VALUES ('8', '居家');
INSERT INTO `classification` VALUES ('2', '干货');
INSERT INTO `classification` VALUES ('4', '水产');
INSERT INTO `classification` VALUES ('7', '生鲜');
INSERT INTO `classification` VALUES ('5', '酒茶');
INSERT INTO `classification` VALUES ('3', '零食');

-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `coll_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `time` date NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`coll_id`),
  KEY `fk_collection_goods_good_id` (`good_id`),
  KEY `fk_collection_users_user_id` (`user_id`),
  CONSTRAINT `fk_collection_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_collection_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1', '1', '1', '0000-00-00');
INSERT INTO `collection` VALUES ('2', '1', '2', '0000-00-00');
INSERT INTO `collection` VALUES ('3', '3', '3', '0000-00-00');
INSERT INTO `collection` VALUES ('4', '3', '2', '0000-00-00');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `selection` int(11) NOT NULL COMMENT '评选项',
  `time` date NOT NULL COMMENT '评论时间',
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
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `sales` int(11) DEFAULT NULL,
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL COMMENT '价格',
  `count` int(11) NOT NULL COMMENT '数量',
  `cost` decimal(10,0) NOT NULL COMMENT '成本',
  `sales_volume` int(11) NOT NULL COMMENT '销量',
  `time` date NOT NULL COMMENT '上架时间',
  `parameter` varchar(255) NOT NULL COMMENT '产品参数',
  `recommend` tinyint(4) NOT NULL COMMENT '推荐商品标志',
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', '1', '土豆', '23123', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/nongfu/01.jpg');
INSERT INTO `goods` VALUES ('3', '2', '瓜子', '2313', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/ganhuo/02.jpg');
INSERT INTO `goods` VALUES ('44', '3', '薯片', '1231', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/lingshi/03.jpg');
INSERT INTO `goods` VALUES ('23', '4', '鲜虾', '12', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/shuichan/04.jpg');
INSERT INTO `goods` VALUES ('221', '5', '海带', '0', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/shuichan/05.jpg');
INSERT INTO `goods` VALUES ('545', '6', '1111', '0', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/shuichan/06.jpg');
INSERT INTO `goods` VALUES ('23', '7', '22222', '0', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/shuichan/07.jpg');
INSERT INTO `goods` VALUES ('56', '8', '23123123', '0', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/shuichan/08.jpg');
INSERT INTO `goods` VALUES ('43', '9', '谁打谁', '0', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/shuichan/09.jpg');
INSERT INTO `goods` VALUES ('11', '10', '好了', '0', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/shuichan/10.jpg');
INSERT INTO `goods` VALUES ('23', '11', '哈尔滨啤酒', '3', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/jiucha/11.jpg');
INSERT INTO `goods` VALUES ('87', '12', '人参', '20', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/yangsheng/12\r\n.jpg');
INSERT INTO `goods` VALUES ('555', '13', '苹果', '2', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/shengxian/13\r\n.jpg');
INSERT INTO `goods` VALUES ('435', '14', '居家', '20', '0', '0', '0', '0000-00-00', '', '0', '../../static/img/jujia/14\r\n.jpg');
INSERT INTO `goods` VALUES ('43', '15', '居家', '2323', '0', '0', '0', '0000-00-00', '', '0', '');

-- ----------------------------
-- Table structure for `goods_classification`
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_classification
-- ----------------------------
INSERT INTO `goods_classification` VALUES ('1', '1', '农副');
INSERT INTO `goods_classification` VALUES ('2', '4', '水产');
INSERT INTO `goods_classification` VALUES ('3', '3', '零食');
INSERT INTO `goods_classification` VALUES ('4', '2', '干货');
INSERT INTO `goods_classification` VALUES ('5', '5', '水产');
INSERT INTO `goods_classification` VALUES ('6', '6', '水产');
INSERT INTO `goods_classification` VALUES ('15', '7', '水产');
INSERT INTO `goods_classification` VALUES ('16', '8', '水产');
INSERT INTO `goods_classification` VALUES ('17', '9', '水产');
INSERT INTO `goods_classification` VALUES ('19', '10', '水产');
INSERT INTO `goods_classification` VALUES ('20', '11', '酒茶');
INSERT INTO `goods_classification` VALUES ('21', '12', '养生');
INSERT INTO `goods_classification` VALUES ('22', '13', '生鲜');
INSERT INTO `goods_classification` VALUES ('24', '14', '居家');
INSERT INTO `goods_classification` VALUES ('26', '15', '居家');

-- ----------------------------
-- Table structure for `goods_receipt`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_receipt
-- ----------------------------
INSERT INTO `goods_receipt` VALUES ('1', '1', '2', '3', '4');
INSERT INTO `goods_receipt` VALUES ('2', '1', '2', '2', '3');
INSERT INTO `goods_receipt` VALUES ('3', '2', '3', '4', '5');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date NOT NULL COMMENT '订单时间',
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `state` varchar(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_goods_good_id` (`good_id`),
  KEY `fk_orders_users_user_id` (`user_id`),
  KEY `fk_orders_goods_receipt_receipt_id` (`receipt_id`),
  CONSTRAINT `fk_orders_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_goods_receipt_receipt_id` FOREIGN KEY (`receipt_id`) REFERENCES `goods_receipt` (`receipt_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '0000-00-00', '1', '1', '1', '3', '待付款');
INSERT INTO `orders` VALUES ('3', '0000-00-00', '1', '3', '2', '5', '待发货');

-- ----------------------------
-- Table structure for `recent_browse`
-- ----------------------------
DROP TABLE IF EXISTS `recent_browse`;
CREATE TABLE `recent_browse` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` date NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`good_id`),
  KEY `fk_recent_browse_users_user_id` (`user_id`),
  CONSTRAINT `fk_recent_browse_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_recent_browse_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recent_browse
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_cart`
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES ('1', '1', '2', '12');
INSERT INTO `shopping_cart` VALUES ('3', '2', '3', '17');
INSERT INTO `shopping_cart` VALUES ('7', '2', '4', '0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `time` date NOT NULL COMMENT '注册时间',
  `grade` int(11) NOT NULL COMMENT '等级',
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL COMMENT '收货默认地址',
  `telephone` varchar(255) NOT NULL COMMENT '绑定电话',
  `url` varchar(255) NOT NULL COMMENT '头像路径',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '123', 'asd', '0000-00-00', '3', '', '', '123', '1231231');
INSERT INTO `users` VALUES ('2', 'lehasdad', 'asdad1231', '0000-00-00', '0', '', '', '18454544545', '');
INSERT INTO `users` VALUES ('3', '', '', '0000-00-00', '0', '', '', '', '');
