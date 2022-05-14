/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : woniumall

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 13/05/2022 14:37:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area_code
-- ----------------------------
DROP TABLE IF EXISTS `area_code`;
CREATE TABLE `area_code`  (
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code_level` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `superior` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area_code
-- ----------------------------
INSERT INTO `area_code` VALUES ('410000', '湖南省', '1', '');
INSERT INTO `area_code` VALUES ('420000', '湖北省', '1', '');
INSERT INTO `area_code` VALUES ('420100', '武汉市', '2', '420000');
INSERT INTO `area_code` VALUES ('420101', '武汉市辖区', '3', '420100');
INSERT INTO `area_code` VALUES ('420102', '江岸', '3', '420100');
INSERT INTO `area_code` VALUES ('420103', '江汉', '3', '420100');
INSERT INTO `area_code` VALUES ('420105', '汉阳', '3', '420100');
INSERT INTO `area_code` VALUES ('420106', '武昌', '3', '420100');
INSERT INTO `area_code` VALUES ('420107', '青山', '3', '420100');
INSERT INTO `area_code` VALUES ('420111', '洪山', '3', '420100');
INSERT INTO `area_code` VALUES ('420112', '东西湖', '3', '420100');
INSERT INTO `area_code` VALUES ('420113', '汉南', '3', '420100');
INSERT INTO `area_code` VALUES ('420114', '蔡甸', '3', '420100');
INSERT INTO `area_code` VALUES ('420115', '江夏', '3', '420100');
INSERT INTO `area_code` VALUES ('420116', '黄陂', '3', '420100');
INSERT INTO `area_code` VALUES ('420117', '新洲', '3', '420100');
INSERT INTO `area_code` VALUES ('420200', '黄石市', '2', '420000');
INSERT INTO `area_code` VALUES ('420201', '市区营业部', '3', '420200');
INSERT INTO `area_code` VALUES ('420204', '下陆铁山营业部', '3', '420200');
INSERT INTO `area_code` VALUES ('420222', '阳新分公司', '3', '420200');
INSERT INTO `area_code` VALUES ('420281', '大冶分公司', '3', '420200');
INSERT INTO `area_code` VALUES ('420300', '十堰市', '2', '420000');
INSERT INTO `area_code` VALUES ('420301', '现业', '3', '420300');
INSERT INTO `area_code` VALUES ('420303', '张湾区', '3', '420300');
INSERT INTO `area_code` VALUES ('420321', '郧县', '3', '420300');
INSERT INTO `area_code` VALUES ('420322', '郧西', '3', '420300');
INSERT INTO `area_code` VALUES ('420323', '竹山', '3', '420300');
INSERT INTO `area_code` VALUES ('420324', '竹溪', '3', '420300');
INSERT INTO `area_code` VALUES ('420325', '房县', '3', '420300');
INSERT INTO `area_code` VALUES ('420381', '丹江口', '3', '420300');
INSERT INTO `area_code` VALUES ('420390', '神农架', '3', '420300');
INSERT INTO `area_code` VALUES ('420396', '武当山', '3', '420300');
INSERT INTO `area_code` VALUES ('420500', '宜昌市', '2', '420000');
INSERT INTO `area_code` VALUES ('420501', '现业', '3', '420500');
INSERT INTO `area_code` VALUES ('420521', '夷陵', '3', '420500');
INSERT INTO `area_code` VALUES ('420525', '远安', '3', '420500');
INSERT INTO `area_code` VALUES ('420526', '兴山', '3', '420500');
INSERT INTO `area_code` VALUES ('420527', '秭归', '3', '420500');
INSERT INTO `area_code` VALUES ('420528', '长阳', '3', '420500');
INSERT INTO `area_code` VALUES ('420529', '五峰', '3', '420500');
INSERT INTO `area_code` VALUES ('420581', '宜都', '3', '420500');
INSERT INTO `area_code` VALUES ('420582', '当阳', '3', '420500');
INSERT INTO `area_code` VALUES ('420583', '枝江', '3', '420500');
INSERT INTO `area_code` VALUES ('420600', '襄樊市', '2', '420000');
INSERT INTO `area_code` VALUES ('420601', '现业一', '3', '420600');
INSERT INTO `area_code` VALUES ('420606', '现业二', '3', '420600');
INSERT INTO `area_code` VALUES ('420621', '襄阳', '3', '420600');
INSERT INTO `area_code` VALUES ('420624', '南漳', '3', '420600');
INSERT INTO `area_code` VALUES ('420625', '谷城', '3', '420600');
INSERT INTO `area_code` VALUES ('420626', '保康', '3', '420600');
INSERT INTO `area_code` VALUES ('420682', '老河口', '3', '420600');
INSERT INTO `area_code` VALUES ('420683', '枣阳', '3', '420600');
INSERT INTO `area_code` VALUES ('420684', '宜城', '3', '420600');
INSERT INTO `area_code` VALUES ('420700', '鄂州市', '2', '420000');
INSERT INTO `area_code` VALUES ('420701', '现业', '3', '420700');
INSERT INTO `area_code` VALUES ('420800', '荆门市', '2', '420000');
INSERT INTO `area_code` VALUES ('420801', '现业', '3', '420800');
INSERT INTO `area_code` VALUES ('420821', '京山', '3', '420800');
INSERT INTO `area_code` VALUES ('420822', '沙洋', '3', '420800');
INSERT INTO `area_code` VALUES ('420881', '钟祥', '3', '420800');
INSERT INTO `area_code` VALUES ('420900', '孝感市', '2', '420000');
INSERT INTO `area_code` VALUES ('420901', '现业', '3', '420900');
INSERT INTO `area_code` VALUES ('420921', '孝昌', '3', '420900');
INSERT INTO `area_code` VALUES ('420922', '大悟', '3', '420900');
INSERT INTO `area_code` VALUES ('420923', '云梦', '3', '420900');
INSERT INTO `area_code` VALUES ('420981', '应城', '3', '420900');
INSERT INTO `area_code` VALUES ('420982', '安陆', '3', '420900');
INSERT INTO `area_code` VALUES ('420984', '汉川', '3', '420900');
INSERT INTO `area_code` VALUES ('421000', '荆州市', '2', '420000');
INSERT INTO `area_code` VALUES ('421001', '现业', '3', '421000');
INSERT INTO `area_code` VALUES ('421022', '公安', '3', '421000');
INSERT INTO `area_code` VALUES ('421023', '监利', '3', '421000');
INSERT INTO `area_code` VALUES ('421024', '江陵', '3', '421000');
INSERT INTO `area_code` VALUES ('421081', '石首', '3', '421000');
INSERT INTO `area_code` VALUES ('421083', '洪湖', '3', '421000');
INSERT INTO `area_code` VALUES ('421087', '松滋', '3', '421000');
INSERT INTO `area_code` VALUES ('421100', '黄冈市', '2', '420000');
INSERT INTO `area_code` VALUES ('421101', '现业', '3', '421100');
INSERT INTO `area_code` VALUES ('421121', '团凤', '3', '421100');
INSERT INTO `area_code` VALUES ('421122', '红安', '3', '421100');
INSERT INTO `area_code` VALUES ('421123', '罗田', '3', '421100');
INSERT INTO `area_code` VALUES ('421124', '英山', '3', '421100');
INSERT INTO `area_code` VALUES ('421125', '浠水', '3', '421100');
INSERT INTO `area_code` VALUES ('421126', '蕲春', '3', '421100');
INSERT INTO `area_code` VALUES ('421127', '黄梅', '3', '421100');
INSERT INTO `area_code` VALUES ('421181', '麻城', '3', '421100');
INSERT INTO `area_code` VALUES ('421182', '武穴', '3', '421100');
INSERT INTO `area_code` VALUES ('421200', '咸宁市', '2', '420000');
INSERT INTO `area_code` VALUES ('421201', '现业', '3', '421200');
INSERT INTO `area_code` VALUES ('421202', '咸安', '3', '421200');
INSERT INTO `area_code` VALUES ('421221', '嘉鱼', '3', '421200');
INSERT INTO `area_code` VALUES ('421222', '通城', '3', '421200');
INSERT INTO `area_code` VALUES ('421223', '崇阳', '3', '421200');
INSERT INTO `area_code` VALUES ('421224', '通山', '3', '421200');
INSERT INTO `area_code` VALUES ('421281', '赤壁', '3', '421200');
INSERT INTO `area_code` VALUES ('421300', '随州市', '2', '420000');
INSERT INTO `area_code` VALUES ('421301', '现业', '3', '421300');
INSERT INTO `area_code` VALUES ('421381', '广水市', '3', '421300');
INSERT INTO `area_code` VALUES ('422800', '恩施州', '2', '420000');
INSERT INTO `area_code` VALUES ('422801', '现业', '3', '422800');
INSERT INTO `area_code` VALUES ('422802', '利川', '3', '422800');
INSERT INTO `area_code` VALUES ('422822', '建始', '3', '422800');
INSERT INTO `area_code` VALUES ('422823', '巴东', '3', '422800');
INSERT INTO `area_code` VALUES ('422825', '宣恩', '3', '422800');
INSERT INTO `area_code` VALUES ('422826', '咸丰', '3', '422800');
INSERT INTO `area_code` VALUES ('422827', '来凤', '3', '422800');
INSERT INTO `area_code` VALUES ('422828', '鹤峰', '3', '422800');
INSERT INTO `area_code` VALUES ('429000', '江汉', '2', '420000');
INSERT INTO `area_code` VALUES ('429004', '仙桃', '3', '429000');
INSERT INTO `area_code` VALUES ('429005', '潜江', '3', '429000');
INSERT INTO `area_code` VALUES ('429006', '天门', '3', '429000');

-- ----------------------------
-- Table structure for mall_address
-- ----------------------------
DROP TABLE IF EXISTS `mall_address`;
CREATE TABLE `mall_address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `accept` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `street` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isdefault` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_address_user`(`userid`) USING BTREE,
  CONSTRAINT `FK_address_user` FOREIGN KEY (`userid`) REFERENCES `mall_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_address
-- ----------------------------
INSERT INTO `mall_address` VALUES (1, 48, '张三', '17683817443', '湖北省', '武汉市', '江夏区', '蜗牛学院', 'Y');
INSERT INTO `mall_address` VALUES (2, 48, '李四', '17683817443', '湖北省', '武汉市', '江夏区', '水晶丽都', 'N');

-- ----------------------------
-- Table structure for mall_admin
-- ----------------------------
DROP TABLE IF EXISTS `mall_admin`;
CREATE TABLE `mall_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_admin
-- ----------------------------
INSERT INTO `mall_admin` VALUES (1, 'admin', 'admin', '0');

-- ----------------------------
-- Table structure for mall_cart
-- ----------------------------
DROP TABLE IF EXISTS `mall_cart`;
CREATE TABLE `mall_cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `goodsid` int(0) NOT NULL,
  `num` int(0) NOT NULL,
  `addprice` decimal(10, 2) NOT NULL,
  `addtime` datetime(0) NOT NULL,
  `ischecked` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_4`(`goodsid`) USING BTREE,
  INDEX `FK_cart_user`(`userid`) USING BTREE,
  CONSTRAINT `FK_cart_user` FOREIGN KEY (`userid`) REFERENCES `mall_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`goodsid`) REFERENCES `mall_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_cart
-- ----------------------------
INSERT INTO `mall_cart` VALUES (9, 49, 43, 1, 100.00, '2022-05-12 16:17:26', '0');

-- ----------------------------
-- Table structure for mall_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_category`;
CREATE TABLE `mall_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_category
-- ----------------------------
INSERT INTO `mall_category` VALUES (10, 'IT测试', '0');
INSERT INTO `mall_category` VALUES (23, 'IT技术', '0');
INSERT INTO `mall_category` VALUES (24, '11', '0');
INSERT INTO `mall_category` VALUES (28, '测试', '1');

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `categoryid` int(0) NOT NULL,
  `stock` int(0) NOT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publisher` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publishtime` date NOT NULL,
  `marketprice` decimal(10, 2) NOT NULL,
  `saleprice` decimal(10, 2) NOT NULL,
  `isnew` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ishot` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uptime` datetime(0) DEFAULT NULL,
  `downtime` datetime(0) DEFAULT NULL,
  `salenum` int(0) DEFAULT NULL,
  `remarknum` int(0) DEFAULT NULL,
  `remarkscore` decimal(2, 1) DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_goods_category`(`categoryid`) USING BTREE,
  CONSTRAINT `FK_goods_category` FOREIGN KEY (`categoryid`) REFERENCES `mall_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_goods
-- ----------------------------
INSERT INTO `mall_goods` VALUES (28, '零基础学Java（全彩版）', 'WNBK1651915341969115137', 23, 100, '张三', '吉林大学出版社', '2022-05-12', 25.00, 10.00, 'y', 'y', '<p>一本好书</p>', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-07 00:00:00', NULL, NULL, NULL, NULL, '0');
INSERT INTO `mall_goods` VALUES (43, '测试', '10001', 10, 10, '董昊1', '中国出版社', '2022-05-06', 200.00, 100.00, 'n', 'y', '<p>hello</p>', 'upload/790504538ee84f1bb7f0d73660a0a27c.jpg', '2022-05-09 19:36:40', '2022-05-08 00:24:55', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (44, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 520.00, 'y', 'y', '<p>hello</p>', 'upload/bb7e8851cb804a7fb7a8444d61759436.jpg', '2022-05-09 19:36:40', '2022-05-08 00:24:55', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (45, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-09 19:36:40', '2022-05-08 00:24:55', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (46, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-09 19:36:40', '2022-05-08 00:24:55', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (47, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-09 19:36:40', '2022-05-08 00:24:55', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (48, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-09 19:36:40', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (49, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (50, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (51, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (52, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (53, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', '<p>hello</p>', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (54, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (55, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (56, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (57, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (58, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (59, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (60, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (61, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (62, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (64, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (65, ' Java从入门到精通（第6版）（软件开发视频大讲堂）', 'WNBK1651933660919141517', 23, 100, '清华大学', '清华大学出版社', '2022-05-04', 100.00, 50.00, 'y', 'y', '<p>这里写你的初始化内容</p>', 'upload/550afb7db871427fb424972f83a46196.jpg', '2022-05-07 00:00:00', '2022-05-08 00:28:55', NULL, NULL, NULL, '1');
INSERT INTO `mall_goods` VALUES (66, '123', 'WNBK1652023228529166276', 10, 123, '123', '132', '2022-05-04', 123.00, 123.00, 'y', 'y', '<p>这里写你的初始化内容</p>', 'upload/2259ec3d48df409f8dd093cbac9a825a.jpg', '2022-05-08 23:20:28', NULL, NULL, NULL, NULL, '0');
INSERT INTO `mall_goods` VALUES (67, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (68, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (69, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (70, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (71, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (72, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (73, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (74, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (75, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (76, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (77, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (78, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (79, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (80, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (81, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (82, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (83, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (84, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (85, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (86, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (87, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (88, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (89, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');
INSERT INTO `mall_goods` VALUES (90, '测试', '10001', 10, 10, '董昊', '中国出版社', '2022-05-06', 200.00, 100.00, 'y', 'y', 'hello', 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '2022-05-25 00:00:00', '2022-06-03 00:00:00', 10, 10, 5.0, '0');

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int(0) NOT NULL,
  `ordertime` datetime(0) NOT NULL,
  `paytype` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paytime` datetime(0) DEFAULT NULL,
  `receivetime` date DEFAULT NULL,
  `totalmoney` decimal(12, 2) NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accept` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_order_user`(`userid`) USING BTREE,
  CONSTRAINT `FK_order_user` FOREIGN KEY (`userid`) REFERENCES `mall_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES (40, 'WNBK1652414527854836892', 48, '2022-05-13 12:02:07', '0', NULL, '2022-05-13', 56880.00, '湖北省-武汉市-江夏区-蜗牛学院', '张三', '17683817443', '1');
INSERT INTO `mall_order` VALUES (41, 'WNBK1652414685712135905', 48, '2022-05-13 12:04:45', '0', NULL, '2022-05-13', 56880.00, '湖北省-武汉市-江夏区-蜗牛学院', '张三', '17683817443', '1');
INSERT INTO `mall_order` VALUES (42, 'WNBK1652415491436977360', 48, '2022-05-13 12:18:11', '0', NULL, '2022-05-13', 100.00, '湖北省-武汉市-江夏区-蜗牛学院', '张三', '17683817443', '1');
INSERT INTO `mall_order` VALUES (43, 'WNBK165241553667441302', 48, '2022-05-13 12:18:56', '0', NULL, '2022-05-13', 10180.00, '湖北省-武汉市-江夏区-蜗牛学院', '张三', '17683817443', '1');
INSERT INTO `mall_order` VALUES (44, 'WNBK1652422730755636251', 48, '2022-05-13 14:18:50', '0', NULL, '2022-05-13', 10.00, '湖北省-武汉市-江夏区-蜗牛学院', '张三', '17683817443', '1');

-- ----------------------------
-- Table structure for mall_order_item
-- ----------------------------
DROP TABLE IF EXISTS `mall_order_item`;
CREATE TABLE `mall_order_item`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `orderid` int(0) NOT NULL,
  `goodsid` int(0) NOT NULL,
  `num` int(0) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_category_goods`(`goodsid`) USING BTREE,
  INDEX `FK_order_item_order`(`orderid`) USING BTREE,
  CONSTRAINT `FK_category_goods` FOREIGN KEY (`goodsid`) REFERENCES `mall_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_order_item_order` FOREIGN KEY (`orderid`) REFERENCES `mall_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_order_item
-- ----------------------------
INSERT INTO `mall_order_item` VALUES (47, 40, 48, 2, 200.00);
INSERT INTO `mall_order_item` VALUES (48, 40, 44, 109, 56680.00);
INSERT INTO `mall_order_item` VALUES (49, 41, 48, 2, 200.00);
INSERT INTO `mall_order_item` VALUES (50, 41, 44, 109, 56680.00);
INSERT INTO `mall_order_item` VALUES (51, 42, 45, 1, 100.00);
INSERT INTO `mall_order_item` VALUES (52, 43, 28, 1008, 10080.00);
INSERT INTO `mall_order_item` VALUES (53, 43, 45, 1, 100.00);
INSERT INTO `mall_order_item` VALUES (54, 44, 28, 1, 10.00);

-- ----------------------------
-- Table structure for mall_remark
-- ----------------------------
DROP TABLE IF EXISTS `mall_remark`;
CREATE TABLE `mall_remark`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `goodsid` int(0) NOT NULL,
  `userid` int(0) NOT NULL,
  `score` decimal(2, 1) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarktime` datetime(0) NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_remark_goods`(`goodsid`) USING BTREE,
  INDEX `FK_remark_user`(`userid`) USING BTREE,
  CONSTRAINT `FK_remark_goods` FOREIGN KEY (`goodsid`) REFERENCES `mall_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_remark_user` FOREIGN KEY (`userid`) REFERENCES `mall_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int(0) NOT NULL,
  `regtime` datetime(0) NOT NULL,
  `money` decimal(10, 2) NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES (1, '1451361390', '1451361390', '1451361390@qq.com', 100, '2022-05-12 20:49:49', 200.00, '/', '0', '');
INSERT INTO `mall_user` VALUES (2, '1451369', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (3, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '0', '');
INSERT INTO `mall_user` VALUES (4, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (5, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '0', '');
INSERT INTO `mall_user` VALUES (6, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (7, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (8, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (9, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (10, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (11, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (12, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (13, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (14, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (15, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (16, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (17, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (18, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (19, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (20, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (21, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (22, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (23, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (24, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (25, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (26, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (27, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (28, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (29, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (30, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (31, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (32, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (33, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (34, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (35, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (36, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (37, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (38, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (39, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (40, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (41, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (42, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (43, '145136', '145136', '145136', 0, '2022-05-06 21:37:03', 0.00, '/', '2', '');
INSERT INTO `mall_user` VALUES (48, '17683817443', '17683817443', '1451361390@qq.com', 0, '2022-05-11 17:51:43', 0.00, 'upload/987bccd2b3fb42fa865a293add514a62.jpg', '0', '17683817443');
INSERT INTO `mall_user` VALUES (49, 'adminadmin', 'adminadmin', '1451361390@qq.com', 0, '2022-05-12 16:16:50', 0.00, '/', '0', '17683817443');

SET FOREIGN_KEY_CHECKS = 1;
