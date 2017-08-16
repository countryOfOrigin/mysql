/*
Navicat MySQL Data Transfer

Source Server         : maple
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : specialty

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-08-16 10:24:11
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1', '1', '12', '0000-00-00');
INSERT INTO `collection` VALUES ('2', '2', '1', '0000-00-00');
INSERT INTO `collection` VALUES ('3', '3', '7', '0000-00-00');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '12', 'asdasd', '6', '0000-00-00');
INSERT INTO `comment` VALUES ('2', '2', '1', 'asdasd', '3', '0000-00-00');

-- ----------------------------
-- Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `preferential` decimal(10,0) NOT NULL COMMENT '优惠金额',
  `limit` decimal(10,0) NOT NULL COMMENT '限制金额',
  `get_time` date NOT NULL COMMENT '获得时间',
  `deadline` date NOT NULL COMMENT '截至时间',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
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
INSERT INTO `goods` VALUES ('1', '土豆', '2', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/nongfu/01.jpg');
INSERT INTO `goods` VALUES ('2', '瓜子', '2313', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/ganhuo/02.jpg');
INSERT INTO `goods` VALUES ('3', '薯片', '1231', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/lingshi/03.jpg');
INSERT INTO `goods` VALUES ('4', '鲜虾', '12', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/shuichan/04.jpg');
INSERT INTO `goods` VALUES ('5', '海带', '0', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/shuichan/05.jpg');
INSERT INTO `goods` VALUES ('6', '1111', '0', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/shuichan/06.jpg');
INSERT INTO `goods` VALUES ('7', '22222', '1', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/shuichan/07.jpg');
INSERT INTO `goods` VALUES ('8', '23123123', '0', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/shuichan/08.jpg');
INSERT INTO `goods` VALUES ('9', '谁打谁', '0', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/shuichan/09.jpg');
INSERT INTO `goods` VALUES ('10', '好了', '0', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/shuichan/10.jpg');
INSERT INTO `goods` VALUES ('11', '哈尔滨啤酒', '3', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/jiucha/11.jpg');
INSERT INTO `goods` VALUES ('12', '人参', '20', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/yangsheng/12\r\n.jpg');
INSERT INTO `goods` VALUES ('13', '苹果', '2', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/shengxian/13\r\n.jpg');
INSERT INTO `goods` VALUES ('14', '居家', '20', '10', '0', '0', '0000-00-00', 'aa', '0', '../../static/img/jujia/14\r\n.jpg');
INSERT INTO `goods` VALUES ('15', '居家', '2323', '10', '0', '0', '0000-00-00', 'aa', '0', '');

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
  `province` varchar(255) NOT NULL COMMENT '省',
  `city` varchar(255) NOT NULL COMMENT '市',
  `area` varchar(255) NOT NULL COMMENT '区',
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`receipt_id`),
  KEY `fk_goods_receipt_users_user_id` (`user_id`),
  CONSTRAINT `fk_goods_receipt_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_receipt
-- ----------------------------
INSERT INTO `goods_receipt` VALUES ('1', '1', 'qwe', '741', '', '', '', 'address');
INSERT INTO `goods_receipt` VALUES ('3', '2', 'wsx', '741', '', '', '', 'address');

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
  `total` decimal(10,0) NOT NULL COMMENT '总价',
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
INSERT INTO `orders` VALUES ('1', '0000-00-00', '1', '12', '1', '3', '3', '60');
INSERT INTO `orders` VALUES ('3', '0000-00-00', '3', '7', '3', '6', '4', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recent_browse
-- ----------------------------
INSERT INTO `recent_browse` VALUES ('1', '2', '0000-00-00');
INSERT INTO `recent_browse` VALUES ('7', '3', '0000-00-00');
INSERT INTO `recent_browse` VALUES ('12', '1', '0000-00-00');

-- ----------------------------
-- Table structure for `sales`
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT '售出数量',
  `time` date NOT NULL COMMENT '售出时间',
  PRIMARY KEY (`sale_id`),
  KEY `fk_sales_goods_good_id` (`good_id`),
  CONSTRAINT `fk_sales_goods_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('1', '12', '3', '0000-00-00');
INSERT INTO `sales` VALUES ('2', '1', '4', '0000-00-00');
INSERT INTO `sales` VALUES ('3', '7', '6', '0000-00-00');

-- ----------------------------
-- Table structure for `search`
-- ----------------------------
DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `times` int(11) DEFAULT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search
-- ----------------------------
INSERT INTO `search` VALUES ('1', '哈哈', '22');
INSERT INTO `search` VALUES ('2', '吃翔', '890');
INSERT INTO `search` VALUES ('3', '你好呀', '56');
INSERT INTO `search` VALUES ('4', '四云奶盖贡茶', '333');
INSERT INTO `search` VALUES ('5', '11', '22');
INSERT INTO `search` VALUES ('6', '33', '44');
INSERT INTO `search` VALUES ('7', '555', '66');
INSERT INTO `search` VALUES ('8', 'asda', '231');
INSERT INTO `search` VALUES ('9', '大法师', '23');
INSERT INTO `search` VALUES ('10', '阿达', '33');
INSERT INTO `search` VALUES ('11', '一月又一月晕', '231');
INSERT INTO `search` VALUES ('12', '虾', '1');

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
INSERT INTO `shopping_cart` VALUES ('2', '2', '1', '4');
INSERT INTO `shopping_cart` VALUES ('3', '3', '7', '6');
INSERT INTO `shopping_cart` VALUES ('5', '1', '2', '5');
INSERT INTO `shopping_cart` VALUES ('6', '1', '3', '49');
INSERT INTO `shopping_cart` VALUES ('7', '1', '14', '1');

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
  `receipt_id` int(11) NOT NULL COMMENT '收货默认地址id',
  `telephone` varchar(255) NOT NULL COMMENT '绑定电话',
  `url` varchar(255) NOT NULL COMMENT '头像路径',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'asd1', 'asdf', '0000-00-00', '0', 'email', '0', '123', 'uploads/p1.jpg');
INSERT INTO `users` VALUES ('2', 'asd2', 'asdf', '0000-00-00', '0', 'email', '0', '456', 'uploads/p1.jpg');
INSERT INTO `users` VALUES ('3', 'asd3', 'asdf', '0000-00-00', '0', 'email', '0', '852', 'uploads/p1.jpg');

-- ----------------------------
-- Table structure for `user_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_coupon
-- ----------------------------
INSERT INTO `user_coupon` VALUES ('1', '1', '1');
INSERT INTO `user_coupon` VALUES ('2', '1', '2');
INSERT INTO `user_coupon` VALUES ('3', '1', '3');
INSERT INTO `user_coupon` VALUES ('4', '2', '2');
