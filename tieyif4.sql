/*
 Navicat Premium Data Transfer

 Source Server         : Terminal
 Source Server Type    : MySQL
 Source Server Version : 100135
 Source Host           : localhost:3306
 Source Schema         : tieyif4

 Target Server Type    : MySQL
 Target Server Version : 100135
 File Encoding         : 65001

 Date: 12/09/2018 08:46:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tieyif4_book_comment
-- ----------------------------
DROP TABLE IF EXISTS `tieyif4_book_comment`;
CREATE TABLE `tieyif4_book_comment`  (
  `cid` int(11) NOT NULL COMMENT '评论id',
  `bid` int(11) NULL DEFAULT NULL COMMENT '书本id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `score` tinyint(10) NULL DEFAULT NULL COMMENT '用户打分',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户评论',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `like` int(11) NULL DEFAULT NULL COMMENT '赞',
  `dislike` int(11) NULL DEFAULT NULL COMMENT '踩',
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `bid`(`bid`) USING BTREE,
  CONSTRAINT `tieyif4_book_comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `tieyif4_user_info` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tieyif4_book_comment_ibfk_3` FOREIGN KEY (`bid`) REFERENCES `tieyif4_book_list` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tieyif4_book_comment
-- ----------------------------
INSERT INTO `tieyif4_book_comment` VALUES (10000, 10001, 13220, 9, '暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心暖心', '2018-09-08 12:38:32', 'admin', 12, NULL);
INSERT INTO `tieyif4_book_comment` VALUES (10001, 10001, 13218, 8, '开心', '2018-09-08 12:38:32', 'admin2', 8, NULL);

-- ----------------------------
-- Table structure for tieyif4_book_list
-- ----------------------------
DROP TABLE IF EXISTS `tieyif4_book_list`;
CREATE TABLE `tieyif4_book_list`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书唯一标识',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书名',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `score` int(11) NULL DEFAULT NULL COMMENT '评分',
  `pagenum` int(11) NULL DEFAULT NULL COMMENT '页数',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图书简介',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '图书状态0：空闲，1：在借',
  `count` int(11) NULL DEFAULT NULL COMMENT '累计借阅',
  `ownerid` int(11) NULL DEFAULT NULL COMMENT '所有者ID',
  `holderid` int(11) NULL DEFAULT NULL COMMENT '持有者ID',
  PRIMARY KEY (`bid`) USING BTREE,
  INDEX `ownerid`(`ownerid`) USING BTREE,
  INDEX `holderid`(`holderid`) USING BTREE,
  CONSTRAINT `tieyif4_book_list_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `tieyif4_user_info` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10029 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tieyif4_book_list
-- ----------------------------
INSERT INTO `tieyif4_book_list` VALUES (10001, '解忧杂货店', '东野圭吾', 9, 291, '现代人内心流失的东西，这家杂货店能帮你找回——', 0, 123, 13218, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10002, '活着', '余华', 9, 195, '每读一页，都让我们止不住泪湿双眼...', 0, 123, 13218, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10003, '围城', '钱钟书', 9, 359, '除了各具特色的人物语言之外，作者夹叙其间的文字也显着机智与幽默', 0, 123, 13220, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10004, '囚鸟', '[美]库尔特·冯内古特', 8, 296, '我们都是受困于时代的“囚鸟”——既渴望逃离，又踟蹰不前。', 0, 123, 13220, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10005, '平凡的世界（全三部）', '路遥', 9, 1631, '《平凡的世界》是一部现实主义小说，也是一部小说形式的家族史。', 0, 123, 13220, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10006, '肖申克的救赎', '[美]斯蒂芬·金', 9, 466, '这本书收入斯蒂芬·金的四部中篇小说，是他作品中的杰出代表作。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10007, '台北人', '白先勇', 9, 392, '作为20世纪中文小说100强的《台北人》，是一部深具复杂性的短篇小说集', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10008, '我们仨', '杨绛', 9, 165, '《我们仨》是钱钟书夫人杨绛撰写的家庭生活回忆录。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10009, '目送', '龙应台', 9, 281, '目送共由七十四篇散文组成，是为一本极具亲情、感人至深的文集。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10010, '这些人，那些事', '吴念真', 9, 203, '吴念真累积多年、珍藏心底的体会与感动。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10011, '撒哈拉的故事', '三毛', 9, 240, '三毛作品中最膾炙人口的《撒哈拉的故事》，由１２篇精采動人的散文結合而成', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10012, '人间草木', '汪曾祺', 9, 315, '《人间草木》(汪曾祺著)是汪曾祺优秀的散文集。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10013, '我与地坛', '史铁生', 9, 399, '收有“午餐半小时”、“我的遥远的清平湾”、“命若琴弦”、“第一人称”、“两个故事”等15篇史铁生的代表作。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10014, '梦里花落知多少', '三毛', 9, 312, '梦里花落知多少》记录了荷西过世后三毛的生活，共23篇。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10015, '海子诗全集', '海子', 9, 1171, '《海子诗全集》收录迄今为止所有发现的海子文学作品。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10016, '奥克诺斯', '[西]路易斯·塞尔努达', 9, 162, '《奥克诺斯》是西班牙诗人塞尔努达的散文诗集。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10017, '三体', '刘慈欣', 9, 302, '文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展...', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10018, '天龙八部', '金庸', 9, 1978, '天龙八部乃金笔下的一部长篇小说，与《射雕》，《神雕》等 几部长篇小说一起被称为可读性最高的金庸小说。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10019, '巨人的陨落：世纪三部曲', '[英]肯·福莱特', 9, 1168, '在第一次世界大战的硝烟中，每一个迈向死亡的生命都在热烈地生长...', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10020, '史记（全十册）', '司马迁', 10, 3356, '史记是我国第一部通史。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10021, '人生的智慧', '[德]叔本华', 9, 272, '他于1850年写了《附录和补遗》一书，《人生的智慧》是该书中的一部分。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10022, '苏菲的世界', '（挪威）乔斯坦·贾德', 9, 535, '14岁的少女苏菲某天放学回家，发现了神秘的一封信。----你是谁？----世界从哪里来？', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10023, '大败局', '吴晓波', 8, 347, '这是一本放在手上令人发烫的书！', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10024, '百年孤独', '[哥伦比亚]加西亚·马尔克斯', 9, 360, '《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10025, '傲慢与偏见', '[英]简·奥斯丁', 9, 310, '《傲慢与偏见》是简·奥斯汀的代表作，是一部描写爱情与婚姻的经典小说。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10026, '了不起的盖茨比', '[美]弗·斯各特·菲茨杰拉德', 8, 192, '盖茨比为了久久地抱着的一个梦而付出了很高的代价。', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10027, '战争与和平（全四册）', '[俄]列夫·托尔斯泰', 9, 1596, '托尔斯泰思想中充满着矛盾，这种矛盾正是俄国社会错综复杂的矛盾的反映', 0, 123, 1001, NULL);
INSERT INTO `tieyif4_book_list` VALUES (10028, '邓小平时代', '[美]傅高义', 9, 754, '邓小平深刻影响了中国历史和世界历史的走向，也改变了每一当代中国人的命运。', 0, 123, 1001, NULL);

-- ----------------------------
-- Table structure for tieyif4_book_record
-- ----------------------------
DROP TABLE IF EXISTS `tieyif4_book_record`;
CREATE TABLE `tieyif4_book_record`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `uid` int(11) NOT NULL COMMENT '借入者id',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '借入时间',
  `bid` int(11) NOT NULL COMMENT '书籍id',
  `ownerid` int(11) NOT NULL COMMENT '所有者id',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态0：待确认，1：进行中，2：已完成，3：已拒绝',
  `left` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言',
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `tieyif4_book_record_ibfk_2`(`uid`) USING BTREE,
  INDEX `ownerid`(`ownerid`) USING BTREE,
  INDEX `bid`(`bid`) USING BTREE,
  CONSTRAINT `tieyif4_book_record_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `tieyif4_user_info` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tieyif4_book_record_ibfk_3` FOREIGN KEY (`ownerid`) REFERENCES `tieyif4_user_info` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tieyif4_book_record_ibfk_4` FOREIGN KEY (`bid`) REFERENCES `tieyif4_book_list` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tieyif4_book_record
-- ----------------------------
INSERT INTO `tieyif4_book_record` VALUES (10000, 1001, '2018-09-08 12:38:32', 10001, 1001, 0, NULL);
INSERT INTO `tieyif4_book_record` VALUES (10001, 13220, '2018-09-12 00:52:13', 10001, 1001, 3, 'hello');
INSERT INTO `tieyif4_book_record` VALUES (10002, 13220, '2018-09-12 00:53:52', 10002, 1001, 3, 'ada');

-- ----------------------------
-- Table structure for tieyif4_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `tieyif4_user_collection`;
CREATE TABLE `tieyif4_user_collection`  (
  `uid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `bid`) USING BTREE,
  INDEX `bid`(`bid`) USING BTREE,
  CONSTRAINT `tieyif4_user_collection_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `tieyif4_book_list` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tieyif4_user_collection
-- ----------------------------
INSERT INTO `tieyif4_user_collection` VALUES (0, 10001);
INSERT INTO `tieyif4_user_collection` VALUES (13217, 10001);
INSERT INTO `tieyif4_user_collection` VALUES (13217, 10002);
INSERT INTO `tieyif4_user_collection` VALUES (13217, 10003);
INSERT INTO `tieyif4_user_collection` VALUES (13217, 10005);
INSERT INTO `tieyif4_user_collection` VALUES (13220, 10001);

-- ----------------------------
-- Table structure for tieyif4_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tieyif4_user_info`;
CREATE TABLE `tieyif4_user_info`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一ID',
  `name` varchar(67) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `level_score` int(11) NULL DEFAULT NULL COMMENT '信用分',
  `level_star` tinyint(1) NULL DEFAULT NULL COMMENT '信用等级',
  `avatarUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `totalborrow` int(11) NULL DEFAULT 0 COMMENT '累计借入',
  `totallend` int(11) NULL DEFAULT 0 COMMENT '累计借出',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人简介',
  PRIMARY KEY (`uid`, `name`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13221 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tieyif4_user_info
-- ----------------------------
INSERT INTO `tieyif4_user_info` VALUES (1001, '1', 100, NULL, NULL, NULL, NULL, 0, 2, NULL);
INSERT INTO `tieyif4_user_info` VALUES (1006, 'aaaa', 100, 0, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tieyif4_user_info` VALUES (10007, 'louyy', 100, 0, 'https://q1.qlogo.cn/g?b=qq&k=nG2naPDMWsB5lx6tOgbCyA&s=100', '13278886615', '1207862938', 0, 0, NULL);
INSERT INTO `tieyif4_user_info` VALUES (13216, 'YYW', 100, 0, 'https://q1.qlogo.cn/g?b=qq&k=xyOnRe5ML3Aw96iaaQ1hh6w&s=100', '123456', '123456', 0, 0, NULL);
INSERT INTO `tieyif4_user_info` VALUES (13217, '123456', 100, 0, 'https://q1.qlogo.cn/g?b=qq&k=xyOnRe5ML3Aw96iaaQ1hh6w&s=100', '123456', '1207862938', 666, 666, NULL);
INSERT INTO `tieyif4_user_info` VALUES (13218, 'admin2', 100, 0, 'https://q1.qlogo.cn/g?b=qq&k=nG2naPDMWsB5lx6tOgbCyA&s=100', '1327886615', '1207862938', 0, 0, NULL);
INSERT INTO `tieyif4_user_info` VALUES (13219, '123', 100, 0, NULL, '123', '123', 0, 0, NULL);
INSERT INTO `tieyif4_user_info` VALUES (13220, 'admin', 100, 0, 'https://q1.qlogo.cn/g?b=qq&k=hQsRr2E10ExVSzbwfPNPYA&s=100', '123456', '1090726895', 2, 0, NULL);

-- ----------------------------
-- Table structure for tieyif4_user_pwd
-- ----------------------------
DROP TABLE IF EXISTS `tieyif4_user_pwd`;
CREATE TABLE `tieyif4_user_pwd`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一ID',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13221 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tieyif4_user_pwd
-- ----------------------------
INSERT INTO `tieyif4_user_pwd` VALUES (13215, 'ALQfrIxoWcMhm9pd8uHYiFVmkDkThqFzl4W3Eovm2IdI3bguCatgEXdOfmQqYXoln8njXMXvMta0gL2Wu/z1yZ4=', 'yW2LMSETr/nRyJ89i5HZMdJFjhQNhsTVOkUqK8jJD5s=');
INSERT INTO `tieyif4_user_pwd` VALUES (13216, 'AHg3kXb2ROenY7xuFSMwlw21OQz+U35wXY6293A37QegBEhRQBh9kQTyfdwYCo0zmSYNxLxzEKHD3QFdIBG4RH8=', '7IgELZyWuDTlCzvdoicIeZlWSHTWY1E65zCjXwE5Yko=');
INSERT INTO `tieyif4_user_pwd` VALUES (13217, 'AGi2ddCS1U7KXBXmfy2Kz7S9LaFqqTR7u/seJnXB+bG+RU5iBV+RNDDV8d17YrpACW+BeydPtJ60jYs81+LZYoo=', 'e0DLoq9ANXNXZKo1atNO85vqpUW+XDLoGbvXoODDvlM=');
INSERT INTO `tieyif4_user_pwd` VALUES (13218, 'ABUu/Z5CVAY3VI33M1CroF7Y5Oi8w8lO9bqX7vhQF6fwfMV2M9wgkY9xp+DfuMiz9nSDH1Sp0tv9d1rp877K2TE=', 'nuH1btfoBLTw0tZyuiItpsgqQ0nt1akKuPVNIzc6OjE=');
INSERT INTO `tieyif4_user_pwd` VALUES (13219, 'AF6Qkkm1L7MdFLRlLcg0tsyTY/MZSOQbxnxlCLQBghjTyJmwYD5OuaE/VTn1NFG0P6+iYbzS//IqSGTtUjIFUnc=', '347GwZFzFGTMQcJW2a8t34lCov0eXj+8/6hQoaOy5+U=');
INSERT INTO `tieyif4_user_pwd` VALUES (13220, 'AGsJ1aSxGUw/jnjp6ku+cI2+/LwnALGo+TBPCzwK0x4MNFR78PDqtS4u3tBNycf2j7sXxR9Tw6b0ckUcR+lQDNw=', 'oT1wDpBv+SrHX8k+AZMoUTSSrjDXAJKPXB0CnZEwfSs=');

-- ----------------------------
-- Triggers structure for table tieyif4_book_record
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger1`;
delimiter ;;
CREATE TRIGGER `trigger1` AFTER INSERT ON `tieyif4_book_record` FOR EACH ROW BEGIN
	UPDATE tieyif4_user_info SET `totalborrow` = `totalborrow` + 1 WHERE `uid` = new.uid;
	UPDATE tieyif4_user_info SET `totallend` = `totallend` + 1 WHERE `uid` = new.ownerid;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
