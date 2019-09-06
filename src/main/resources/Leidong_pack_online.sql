/*
 Navicat Premium Data Transfer

 Source Server         : Maya
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : Leidong_pack_online

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 06/09/2019 10:13:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_action_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_action_log`;
CREATE TABLE `tbl_action_log` (
  `actionId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '操作Id',
  `actionName` varchar(128) NOT NULL COMMENT '操作名',
  `actionUser` varchar(64) NOT NULL COMMENT '操作者',
  `actionUrl` text NOT NULL COMMENT '操作链接',
  `actionDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `actionParam` text COMMENT '操作参数',
  `actionResult` text COMMENT '操作结果',
  PRIMARY KEY (`actionId`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_action_log
-- ----------------------------
BEGIN;
INSERT INTO `tbl_action_log` VALUES (1, '渠道添加', 'tenglili', '/packManager/cch/add', '2018-07-13 11:13:13', 'cchId=101&cchName=飞淼安卓&ver.cchVerName=0&ver.cchVerUpDesc=1.1.4&cchAllParam=&cchShortName=feimiao&cchWeight=1&cchRequireParam=&cchSplash=有(自带)', NULL);
INSERT INTO `tbl_action_log` VALUES (2, '渠道编辑', 'tenglili', '/packManager/cch/edit', '2018-07-13 11:52:38', 'cchId=101&cchName=飞淼安卓&ver.cchVerName=0&ver.cchVerUpDesc=更新&cchAllParam=&cchShortName=feimiao&cchWeight=1&id=100&ver.cchVerUpStatus=2&cchRequireParam=&cchSplash=有(自带)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (3, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-13 11:56:55', 'gameId=100013&gameType=1&isLandScape=0&gameName=迷失的永恒&replaceR=0&ver.gameVerUpDesc=首次提交&gameShortName=msdyh&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (4, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-16 11:53:18', 'gameId=100013&gameType=1&isLandScape=0&gameName=遗失的永恒&replaceR=0&ver.gameVerUpDesc=第一次提交&gameShortName=ysdyh&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (5, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-16 11:55:07', 'gameId=100013&gameType=1&isLandScape=0&gameName=遗失的永恒&replaceR=0&ver.gameVerUpDesc=第一次提交&gameShortName=ysdyh&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (6, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-16 11:56:56', 'gameId=100013&gameType=2&isLandScape=0&gameName=遗失的永恒&replaceR=0&ver.gameVerUpDesc=第一次提交&gameShortName=ysdyh&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (7, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-16 11:58:37', 'gameId=100013&gameType=1&isLandScape=0&gameName=遗失的永恒&replaceR=0&ver.gameVerUpDesc=第一次提交&gameShortName=ysdyh&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (8, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-19 19:59:28', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (9, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-19 20:09:47', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (10, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-19 20:10:12', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (11, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-19 20:11:31', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (12, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-19 20:14:37', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (13, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-19 20:16:51', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (14, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-20 11:12:30', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (15, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-20 14:11:07', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (16, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-20 20:54:48', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (17, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-20 21:26:21', 'gameId=100006&gameType=1&isLandScape=1&gameName=wzzg&replaceR=0&ver.gameVerUpDesc=1&gameShortName=王者之光&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (18, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-20 21:28:48', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (19, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-20 21:46:48', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (20, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-20 21:51:54', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (21, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-20 21:55:21', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (22, '通用功能打包', 'tenglili', '/andrPack/apkChange/submit', '2018-07-23 10:55:13', 'apkChangeCchId=152&apkChangeVersionName=13.14&apkChangeName=换个游戏名&fileSource=1&apkChangePackage=com.test.lala.o78k&apkChangeSign=1&apkChangeGameId=111000&apkChangeVersionNo=1314&apkChangeMdId=10002&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (23, '通用功能打包', 'tenglili', '/andrPack/apkChange/submit', '2018-07-23 10:59:39', 'apkChangeCchId=152&apkChangeVersionName=13.14&apkChangeName=换个游戏名&fileSource=1&apkChangePackage=com.test.lala.o78k&apkChangeSign=1&apkChangeGameId=111000&apkChangeVersionNo=1314&apkChangeMdId=10002&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (24, '通用功能打包', 'tenglili', '/andrPack/apkChange/submit', '2018-07-23 11:09:39', 'apkChangeCchId=152&apkChangeVersionName=13.14&apkChangeName=换个游戏名&fileSource=1&apkChangePackage=com.test.lala.o78k&apkChangeSign=1&apkChangeGameId=111000&apkChangeVersionNo=1314&apkChangeMdId=10002&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (25, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 15:32:16', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (26, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 15:38:48', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=2&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (27, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 15:51:08', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=23&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (28, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 15:53:28', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=4&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (29, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 16:16:03', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=5&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (30, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 16:24:45', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (31, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 17:28:53', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (32, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 17:34:35', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (33, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 17:38:11', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (34, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 17:40:15', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (35, '游戏添加', 'tenglili', '/packManager/game/add', '2018-07-26 17:44:22', 'gameId=100006&gameType=1&isLandScape=1&gameName=王者之光&replaceR=0&ver.gameVerUpDesc=1&gameShortName=wzzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (36, '通用功能打包', 'tenglili', '/andrPack/apkChange/submit', '2018-07-26 18:53:53', 'apkChangeCchId=152&apkChangeVersionName=13.14&apkChangeName=换个游戏名&fileSource=2&apkChangePackage=com.test.lala.o78k&apkChangeSign=1&apkChangeGameId=111000&apkChangeVersionNo=1314&apkChangeMdId=10002&game_Id=1', NULL);
INSERT INTO `tbl_action_log` VALUES (37, '通用功能打包', 'tenglili', '/andrPack/apkChange/submit', '2018-07-26 19:15:55', 'apkChangeCchId=152&apkChangeVersionName=13.14&apkChangeName=换个游戏名&fileSource=2&apkChangePackage=com.test.lala.o78k&apkChangeSign=1&apkChangeGameId=111000&apkChangeVersionNo=1314&apkChangeMdId=10002&game_Id=1', NULL);
INSERT INTO `tbl_action_log` VALUES (38, '通用功能打包', 'tenglili', '/andrPack/apkChange/submit', '2018-07-26 19:31:32', 'apkChangeCchId=152&apkChangeVersionName=13.14&apkChangeName=换个游戏名&fileSource=2&apkChangePackage=com.test.lala.o78k&apkChangeSign=1&apkChangeGameId=111000&apkChangeVersionNo=1314&apkChangeMdId=10002&game_Id=1', NULL);
INSERT INTO `tbl_action_log` VALUES (39, '通用功能打包', 'tenglili', '/andrPack/apkChange/submit', '2018-07-27 11:53:40', 'apkChangeCchId=152&apkChangeVersionName=13.14&apkChangeName=换个游戏名&fileSource=1&apkChangePackage=com.test.lala.o78k&apkChangeSign=1&apkChangeGameId=111000&apkChangeVersionNo=1314&apkChangeMdId=10002&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (40, '广告推广包打包', 'tenglili', '/andrPack/mdPack/submit', '2018-07-27 12:24:30', 'fileSource=1&mdRecordEnd=10080&game_Id=&mdRecordStart=10080', NULL);
INSERT INTO `tbl_action_log` VALUES (41, '广告推广包打包', 'tenglili', '/andrPack/mdPack/submit', '2018-07-27 12:27:19', 'fileSource=1&mdRecordEnd=10080&game_Id=&mdRecordStart=10080', NULL);
INSERT INTO `tbl_action_log` VALUES (42, '广告推广包打包', 'tenglili', '/andrPack/mdPack/submit', '2018-07-27 12:31:08', 'fileSource=1&mdRecordEnd=10080&game_Id=&mdRecordStart=10080', NULL);
INSERT INTO `tbl_action_log` VALUES (43, '广告推广包打包', 'tenglili', '/andrPack/mdPack/submit', '2018-07-27 12:31:19', 'fileSource=1&mdRecordEnd=10080&game_Id=&mdRecordStart=10080', NULL);
INSERT INTO `tbl_action_log` VALUES (44, '广告推广包打包', 'tenglili', '/andrPack/mdPack/submit', '2018-07-27 12:32:31', 'fileSource=1&mdRecordEnd=10085&game_Id=&mdRecordStart=10080', NULL);
INSERT INTO `tbl_action_log` VALUES (45, '广告推广包打包', 'tenglili', '/andrPack/mdPack/submit', '2018-07-27 12:32:46', 'fileSource=2&mdRecordEnd=10085&game_Id=1&mdRecordStart=10080', NULL);
INSERT INTO `tbl_action_log` VALUES (46, '渠道添加', 'tenglili', '/packManager/cch/add', '2018-07-27 14:21:31', 'cchId=118&cchName=360&ver.cchVerName=0&ver.cchVerUpDesc=2.0.0_608&cchAllParam=appid=游戏ID\r\nappkey=游戏Key\r\nsecret= secretKey\r\ndebug=测试模式&cchShortName=360&cchWeight=3&cchRequireParam=appid=游戏ID\r\nappkey=游戏Key\r\nsecret= secretKey&cchSplash=不需要', NULL);
INSERT INTO `tbl_action_log` VALUES (47, '渠道添加', 'tenglili', '/packManager/cch/add', '2018-07-27 14:25:27', 'cchId=118&cchName=360&ver.cchVerName=0&ver.cchVerUpDesc=1&cchAllParam=appid=游戏ID\r\nappkey=游戏Key\r\nsecret= secretKey\r\ndebug=测试模式&cchShortName=360&cchWeight=2&cchRequireParam=appid=\r\nappkey=\r\nsecret= &cchSplash=不需要', NULL);
INSERT INTO `tbl_action_log` VALUES (48, '渠道添加', 'tenglili', '/packManager/cch/add', '2018-07-27 14:38:00', 'cchId=118&cchName=360&ver.cchVerName=0&ver.cchVerUpDesc=1&cchAllParam=appid=游戏ID\r\nappkey=游戏Key\r\nsecret= secretKey\r\ndebug=测试模式&cchShortName=360&cchWeight=2&cchRequireParam=appid=\r\nappkey=\r\nsecret= &cchSplash=不需要', NULL);
INSERT INTO `tbl_action_log` VALUES (49, '渠道编辑', 'tenglili', '/packManager/cch/edit', '2018-07-27 15:19:41', 'cchId=101&cchName=飞淼安卓&ver.cchVerName=0&ver.cchVerUpDesc=2&cchAllParam=&cchShortName=feimiao&cchWeight=1&id=100&ver.cchVerUpStatus=2&cchRequireParam=&cchSplash=有(自带)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (50, '渠道添加', 'tenglili', '/packManager/cch/add', '2018-07-27 15:20:41', 'cchId=118&cchName=360&ver.cchVerName=0&ver.cchVerUpDesc=1&cchAllParam=appid=游戏ID\r\nappkey=游戏Key\r\nsecret= secretKey\r\ndebug=测试模式&cchShortName=360&cchWeight=2&cchRequireParam=appid=\r\nappkey=\r\nsecret= &cchSplash=不需要', NULL);
INSERT INTO `tbl_action_log` VALUES (51, '游戏参数添加', 'tenglili', '/packManager/gameParam/add', '2018-07-27 15:24:13', 'record.isFinal=1&game.id=1&record.isLandScape=1&cch.id=101&record.pname=com.feimiao.ky.wzzg.qihoo&record.gpRecordUpDesc=1&allParam-debug=0&allParam-appkey=79e3af20a6e43cc0572881fc8f996202&allParam-secret=59593a8220e33dba9836597cfabc3076&record.replaceR=0&allParam-appid=204203446', NULL);
INSERT INTO `tbl_action_log` VALUES (52, '渠道包打包重复检查', 'tenglili', '/andrPack/cchPack/checkRunning', '2018-07-27 15:24:42', 'idsList=[1]', NULL);
INSERT INTO `tbl_action_log` VALUES (53, '渠道包打包', 'tenglili', '/andrPack/cchPack/submit', '2018-07-27 15:24:44', 'gameId=1&idsList=[1]', NULL);
INSERT INTO `tbl_action_log` VALUES (54, '渠道包打包重复检查', 'tenglili', '/andrPack/cchPack/checkRunning', '2018-07-27 15:29:57', 'idsList=[1]', NULL);
INSERT INTO `tbl_action_log` VALUES (55, '渠道包打包', 'tenglili', '/andrPack/cchPack/submit', '2018-07-27 15:29:58', 'gameId=1&idsList=[1]', NULL);
INSERT INTO `tbl_action_log` VALUES (56, '渠道包打包重复检查', 'tenglili', '/andrPack/cchPack/checkRunning', '2018-07-27 15:32:58', 'idsList=[1]', NULL);
INSERT INTO `tbl_action_log` VALUES (57, '渠道包打包', 'tenglili', '/andrPack/cchPack/submit', '2018-07-27 15:32:59', 'gameId=1&idsList=[1]', NULL);
INSERT INTO `tbl_action_log` VALUES (58, '渠道包打包重复检查', 'tenglili', '/andrPack/cchPack/checkRunning', '2018-07-27 17:17:07', 'idsList=[1]', NULL);
INSERT INTO `tbl_action_log` VALUES (59, '渠道包打包', 'tenglili', '/andrPack/cchPack/submit', '2018-07-27 17:17:08', 'gameId=1&idsList=[1]', NULL);
INSERT INTO `tbl_action_log` VALUES (60, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-17 10:20:59', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=com.maya.odb&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (61, '用户添加', 'oudongbo', '/user/add', '2019-01-17 10:26:04', 'username=hanxiaoyan&password=123456&realname=韩孝岩&userGroupId=2&mobile=&email=&status=1', NULL);
INSERT INTO `tbl_action_log` VALUES (62, '用户添加', 'oudongbo', '/user/add', '2019-01-17 10:26:49', 'username=wuwenhao&password=123456&realname=伍文晧&userGroupId=2&mobile=&email=&status=0', NULL);
INSERT INTO `tbl_action_log` VALUES (63, '用户添加', 'oudongbo', '/user/add', '2019-01-17 10:27:30', 'username=liuxiaodong&password=123456&realname=刘晓东&userGroupId=2&mobile=&email=&status=1', NULL);
INSERT INTO `tbl_action_log` VALUES (64, '用户编辑', 'oudongbo', '/user/edit', '2019-01-17 10:27:37', 'userId=4&username=wuwenhao&realname=伍文晧&userGroupId=2&mobile=&email=&status=1', NULL);
INSERT INTO `tbl_action_log` VALUES (65, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-17 10:34:00', 'apkChangeCchId=&apkChangeVersionName=2.0.0&apkChangeName=龙族契约&fileSource=1&apkChangePackage=com.maya.wzzg&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (66, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-17 10:48:23', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=com.maya.ledong&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (67, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-17 11:12:52', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=com.maya.ledong&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (68, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-17 11:37:12', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=com.maya.wzzg&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (69, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-17 11:38:10', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=com.maya.wzzg&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (70, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-23 09:58:25', 'apkChangeCchId=&apkChangeVersionName=2.0.0&apkChangeName=龙族契约&fileSource=1&apkChangePackage=com.maya.odb&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (71, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-25 16:53:39', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=com.maya.wzzg&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (72, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-01-25 18:04:42', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=com.maya.odb&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (73, '游戏添加', 'oudongbo', '/packManager/game/add', '2019-07-30 13:01:16', 'gameId=100052&gameType=1&isLandScape=1&gameName=test&replaceR=0&ver.gameVerUpDesc=首次提交\r\n&gameShortName=test&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (74, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-07-30 13:02:46', 'cchId=101&cchName=雷动安卓&ver.cchVerName=0&ver.cchVerUpDesc=首次提交&cchAllParam=&cchShortName=leidong&cchWeight=1&id=100&ver.cchVerUpStatus=2&cchRequireParam=&cchSplash=有(自带)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (75, '游戏删除', 'oudongbo', '/packManager/game/status', '2019-07-30 13:03:02', 'id=2', NULL);
INSERT INTO `tbl_action_log` VALUES (76, '游戏添加', 'oudongbo', '/packManager/game/add', '2019-07-30 13:03:36', 'gameId=100052&gameType=1&isLandScape=1&gameName=test&replaceR=0&ver.gameVerUpDesc=首次提交&gameShortName=test&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (77, '游戏删除', 'oudongbo', '/packManager/game/status', '2019-07-30 14:41:26', 'id=3', NULL);
INSERT INTO `tbl_action_log` VALUES (78, '游戏添加', 'oudongbo', '/packManager/game/add', '2019-07-30 14:43:41', 'gameId=100052&gameType=1&isLandScape=1&gameName=test&replaceR=0&ver.gameVerUpDesc=首次提交&gameShortName=test&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (79, '游戏删除', 'oudongbo', '/packManager/game/status', '2019-07-30 14:45:18', 'id=4', NULL);
INSERT INTO `tbl_action_log` VALUES (80, '游戏添加', 'oudongbo', '/packManager/game/add', '2019-07-30 14:45:42', 'gameId=100052&gameType=2&isLandScape=1&gameName=test&replaceR=0&ver.gameVerUpDesc=test&gameShortName=test&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (81, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-07-30 15:10:11', 'cchId=116&cchName=百度&ver.cchVerName=0&ver.cchVerUpDesc=首次提交！&cchAllParam=appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥&cchShortName=baidu&cchWeight=3&cchRequireParam=appid=\r\nappkey=&cchSplash=不需要', NULL);
INSERT INTO `tbl_action_log` VALUES (82, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-07-30 15:11:19', 'record.isFinal=1&game.id=5&record.isLandScape=0&cch.id=102&record.pname=com.test.baudu&record.gpRecordUpDesc=首次建立参数&allParam-appkey=test2&record.replaceR=0&allParam-appid=test1', NULL);
INSERT INTO `tbl_action_log` VALUES (83, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-07-30 15:11:30', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (84, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-07-30 15:11:31', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (85, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-07-30 15:34:55', 'cchId=162&cchName=B站&ver.cchVerName=0&ver.cchVerUpDesc=首次提交&cchAllParam=mAppId=应用唯一ID\r\nmAppKey=应用秘钥\r\nmerchant_id=\r\nserever_id=渠道分配的服务器ID&cchShortName=bilibili&cchWeight=3&cchRequireParam=mAppId=\r\nmAppKey=\r\nmerchant_id=\r\nserever_id=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (86, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-07-30 15:36:12', 'record.isFinal=1&game.id=5&record.isLandScape=0&cch.id=103&record.pname=com.blibli.test&allParam-merchant_id=testmerchant&record.gpRecordUpDesc=建立测试参数&allParam-mAppKey=testappkey&allParam-mAppId=testappid&allParam-serever_id=testserver&record.replaceR=0', NULL);
INSERT INTO `tbl_action_log` VALUES (87, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-07-30 15:36:28', 'idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (88, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-07-30 15:36:29', 'gameId=5&idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (89, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-07-30 16:11:00', 'idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (90, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-07-30 16:11:01', 'gameId=5&idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (91, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-07-30 16:17:02', 'cchId=162&cchName=B站&ver.cchVerName=0&ver.cchVerUpDesc=修复bug&cchAllParam=mAppId=应用唯一ID\r\nmAppKey=应用秘钥\r\nmerchant_id=\r\nserever_id=渠道分配的服务器ID&cchShortName=bilibili&cchWeight=3&id=103&ver.cchVerUpStatus=2&cchRequireParam=mAppId=\r\nmAppKey=\r\nmerchant_id=\r\nserever_id=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (92, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-07-30 16:17:14', 'idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (93, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-07-30 16:17:15', 'gameId=5&idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (94, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-07-30 16:38:12', 'idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (95, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-07-30 16:38:13', 'gameId=5&idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (96, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-07-31 12:25:52', 'idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (97, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-07-31 12:25:53', 'gameId=5&idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (98, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-07-31 14:45:20', 'cchId=119&cchName=华为&ver.cchVerName=0&ver.cchVerUpDesc=首次提交data&cchAllParam=appid=应用唯一ID\r\ncpid=渠道提供滴cpid&cchShortName=huawei&cchWeight=3&cchRequireParam=appid=\r\ncpid=&cchSplash=不需要', NULL);
INSERT INTO `tbl_action_log` VALUES (99, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-07-31 14:48:08', 'record.isFinal=1&game.id=5&record.isLandScape=1&cch.id=104&record.pname=com.&record.gpRecordUpDesc=首次建立测试参数&allParam-cpid=testcpid&record.replaceR=0&allParam-appid=testappid', NULL);
INSERT INTO `tbl_action_log` VALUES (100, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-07-31 14:48:17', 'idsList=[4]', NULL);
INSERT INTO `tbl_action_log` VALUES (101, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-07-31 14:48:18', 'gameId=5&idsList=[4]', NULL);
INSERT INTO `tbl_action_log` VALUES (102, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-07-31 15:49:30', 'cchId=124&cchName=魅族&ver.cchVerName=0&ver.cchVerUpDesc=首次提交&cchAllParam=appid=应用唯一ID\r\nappkey=应用秘钥&cchShortName=meizu&cchWeight=3&cchRequireParam=appid=\r\nappkey=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (103, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-07-31 15:49:55', 'cchId=124&cchName=魅族&ver.cchVerName=0&ver.cchVerUpDesc=首次提交&cchAllParam=appid=应用唯一ID\r\nappkey=应用秘钥&cchShortName=meizu&cchWeight=3&cchRequireParam=appid=\r\nappkey=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (104, '用户添加', 'oudongbo', '/user/add', '2019-07-31 15:53:24', 'username=gujingwei&password=123456&realname=古竟维&userGroupId=0&mobile=&email=&status=1', NULL);
INSERT INTO `tbl_action_log` VALUES (105, '用户添加', 'oudongbo', '/user/add', '2019-07-31 15:53:35', 'username=gujingwei&password=123456&realname=古竟维&userGroupId=2&mobile=&email=&status=1', NULL);
INSERT INTO `tbl_action_log` VALUES (106, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-01 10:04:28', 'cchId=120&cchName=小米&ver.cchVerName=0&ver.cchVerUpDesc=首次提交数据&cchAllParam=appid=應用唯ID\r\nappkey=應用密鑰&cchShortName=mi&cchWeight=3&cchRequireParam=appid=\r\nappkey=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (107, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-01 10:05:37', 'record.isFinal=1&game.id=5&record.isLandScape=1&cch.id=105&record.pname=com.meizu.test&record.gpRecordUpDesc=首次建立参数&allParam-appkey=Testkey&record.replaceR=0&allParam-appid=testID', NULL);
INSERT INTO `tbl_action_log` VALUES (108, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-01 10:06:13', 'record.isFinal=1&game.id=5&record.isLandScape=1&cch.id=106&record.pname=com.xiaomi.test&record.gpRecordUpDesc=test&allParam-appkey=testkey&record.replaceR=0&allParam-appid=testid', NULL);
INSERT INTO `tbl_action_log` VALUES (109, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 10:06:22', 'idsList=[5]', NULL);
INSERT INTO `tbl_action_log` VALUES (110, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 10:06:23', 'gameId=5&idsList=[5]', NULL);
INSERT INTO `tbl_action_log` VALUES (111, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 11:29:19', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (112, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 11:29:20', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (113, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-01 12:16:58', 'cchId=120&cchName=小米&ver.cchVerName=0&ver.cchVerUpDesc=修复bug&cchAllParam=appid=應用唯ID\r\nappkey=應用密鑰&cchShortName=mi&cchWeight=3&id=106&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (114, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-01 15:50:25', 'cchId=120&cchName=小米&ver.cchVerName=0&ver.cchVerUpDesc=解决65535问题！！！&cchAllParam=appid=應用唯ID\r\nappkey=應用密鑰&cchShortName=mi&cchWeight=3&id=106&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (115, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 15:51:40', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (116, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 15:51:41', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (117, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 15:56:56', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (118, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 15:57:03', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (119, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 16:38:02', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (120, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 16:38:03', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (121, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 16:39:32', 'idsList=[5]', NULL);
INSERT INTO `tbl_action_log` VALUES (122, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 16:39:34', 'gameId=5&idsList=[5]', NULL);
INSERT INTO `tbl_action_log` VALUES (123, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-01 16:49:11', 'cchId=122&cchName=酷派&ver.cchVerName=0&ver.cchVerUpDesc=首次提交data&cchAllParam=appid=渠道分配的应用唯一ID\r\npaykey=渠道分配的支付秘钥&cchShortName=coolpad&cchWeight=3&cchRequireParam=appid=\r\npaykey=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (124, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-01 16:50:31', 'record.isFinal=1&game.id=5&record.isLandScape=1&cch.id=107&record.pname=com.coolpad.test&record.gpRecordUpDesc=首次提交data&allParam-paykey=testpaykey&record.replaceR=0&allParam-appid=testappid', NULL);
INSERT INTO `tbl_action_log` VALUES (125, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 16:50:41', 'idsList=[7]', NULL);
INSERT INTO `tbl_action_log` VALUES (126, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 16:50:42', 'gameId=5&idsList=[7]', NULL);
INSERT INTO `tbl_action_log` VALUES (127, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 16:53:53', 'idsList=[5]', NULL);
INSERT INTO `tbl_action_log` VALUES (128, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 16:53:59', 'gameId=5&idsList=[5]', NULL);
INSERT INTO `tbl_action_log` VALUES (129, '游戏编辑', 'oudongbo', '/packManager/game/edit', '2019-08-01 17:04:03', 'gameId=100052&gameType=2&isLandScape=1&gameName=test&replaceR=0&ver.gameVerUpDesc=更新test&gameShortName=test&isFinal=1&id=5', NULL);
INSERT INTO `tbl_action_log` VALUES (130, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 17:05:04', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (131, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 17:05:05', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (132, '游戏添加', 'oudongbo', '/packManager/game/add', '2019-08-01 18:52:01', 'gameId=100027&gameType=1&isLandScape=1&gameName=遗失的永恒&replaceR=0&ver.gameVerUpDesc=首次提交测试&gameShortName=ysdrh&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (133, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-01 18:55:42', 'record.isFinal=1&game.id=6&record.isLandScape=1&cch.id=107&record.pname=com.ysdyh.test&record.gpRecordUpDesc=首次建立参数&allParam-paykey=testkey&record.replaceR=0&allParam-appid=testappid', NULL);
INSERT INTO `tbl_action_log` VALUES (134, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-01 18:55:59', 'idsList=[8]', NULL);
INSERT INTO `tbl_action_log` VALUES (135, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-01 18:56:00', 'gameId=6&idsList=[8]', NULL);
INSERT INTO `tbl_action_log` VALUES (136, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 10:29:35', 'cchId=122&cchName=酷派&ver.cchVerName=0&ver.cchVerUpDesc=修复bug&cchAllParam=appid=渠道分配的应用唯一ID\r\npaykey=渠道分配的支付秘钥&cchShortName=coolpad&cchWeight=3&id=107&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\npaykey=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (137, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 10:30:14', 'idsList=[7]', NULL);
INSERT INTO `tbl_action_log` VALUES (138, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 10:30:15', 'gameId=5&idsList=[7]', NULL);
INSERT INTO `tbl_action_log` VALUES (139, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 10:37:01', 'cchId=120&cchName=小米&ver.cchVerName=0&ver.cchVerUpDesc=修复超方法数超65535问题！！！&cchAllParam=appid=應用唯ID\r\nappkey=應用密鑰&cchShortName=mi&cchWeight=3&id=106&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (140, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 10:37:20', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (141, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 10:37:21', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (142, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 10:45:35', 'idsList=[2,3,4,5,6,7]', NULL);
INSERT INTO `tbl_action_log` VALUES (143, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 10:45:38', 'gameId=5&idsList=[2,3,4,5,6,7]', NULL);
INSERT INTO `tbl_action_log` VALUES (144, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 12:16:53', 'cchId=116&cchName=百度&ver.cchVerName=0&ver.cchVerUpDesc=修复65535问题！！！&cchAllParam=appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥&cchShortName=baidu&cchWeight=3&id=102&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=&cchSplash=有(自带)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (145, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 12:17:22', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (146, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 12:17:24', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (147, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 12:18:18', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (148, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 12:18:19', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (149, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 12:20:11', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (150, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 12:20:12', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (151, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 12:21:03', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (152, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 12:21:04', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (153, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 12:25:13', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (154, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 12:25:20', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (155, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 12:27:34', 'cchId=116&cchName=百度&ver.cchVerName=0&ver.cchVerUpDesc=修复打包超65535问题！！&cchAllParam=appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥&cchShortName=baidu&cchWeight=3&id=102&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=&cchSplash=有(自带)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (156, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 12:28:05', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (157, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 12:28:07', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (158, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 14:22:40', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (159, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 14:22:43', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (160, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 14:29:19', 'idsList=[2,6]', NULL);
INSERT INTO `tbl_action_log` VALUES (161, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 14:29:20', 'gameId=5&idsList=[2,6]', NULL);
INSERT INTO `tbl_action_log` VALUES (162, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 14:31:19', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (163, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 14:31:20', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (164, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 14:34:02', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (165, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 14:34:03', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (166, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 14:38:43', 'cchId=116&cchName=百度&ver.cchVerName=0&ver.cchVerUpDesc=解决65535问题&cchAllParam=appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥&cchShortName=baidu&cchWeight=3&id=102&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=&cchSplash=有(自带)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (167, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 14:45:18', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (168, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 14:45:19', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (169, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-02 14:49:38', 'cchId=125&cchName=三星&ver.cchVerName=0&ver.cchVerUpDesc=首次提交data&cchAllParam=appid=渠道分配的应用ID\r\nloginParams=该参数找技术相关人员索取&cchShortName=samsung&cchWeight=3&cchRequireParam=appid=\r\nloginParams=&cchSplash=不需要', NULL);
INSERT INTO `tbl_action_log` VALUES (170, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-02 14:51:02', 'id=8', NULL);
INSERT INTO `tbl_action_log` VALUES (171, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-02 14:51:47', 'record.isFinal=1&game.id=5&record.isLandScape=1&cch.id=108&record.pname=com.samsung.test&record.gpRecordUpDesc=test&record.replaceR=0&allParam-appid=testappid&allParam-loginParams=testlogin', NULL);
INSERT INTO `tbl_action_log` VALUES (172, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 14:52:00', 'idsList=[9]', NULL);
INSERT INTO `tbl_action_log` VALUES (173, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 14:52:01', 'gameId=5&idsList=[9]', NULL);
INSERT INTO `tbl_action_log` VALUES (174, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-02 14:55:53', 'cchId=126&cchName=金立&ver.cchVerName=0&ver.cchVerUpDesc=首次提交data&cchAllParam=APIKey=渠道分配的apikey&cchShortName=jinli&cchWeight=3&cchRequireParam=APIKey=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (175, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-02 14:56:34', 'record.isFinal=1&allParam-APIKey=testapikey&game.id=5&record.isLandScape=1&cch.id=109&record.pname=com.jingli.test&record.gpRecordUpDesc=test&record.replaceR=0', NULL);
INSERT INTO `tbl_action_log` VALUES (176, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 14:57:01', 'idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (177, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 14:57:02', 'gameId=5&idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (178, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 15:27:09', 'idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (179, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 15:27:21', 'idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (180, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 15:27:22', 'gameId=5&idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (181, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 15:32:44', 'idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (182, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 15:32:45', 'gameId=5&idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (183, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 15:38:23', 'idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (184, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 15:38:23', 'gameId=5&idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (185, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 15:40:17', 'cchId=126&cchName=金立&ver.cchVerName=0&ver.cchVerUpDesc=修复R文件问题&cchAllParam=APIKey=渠道分配的apikey&cchShortName=jinli&cchWeight=3&id=109&ver.cchVerUpStatus=2&cchRequireParam=APIKey=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (186, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 15:41:13', 'idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (187, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 15:41:13', 'gameId=5&idsList=[10]', NULL);
INSERT INTO `tbl_action_log` VALUES (188, '渠道删除', 'oudongbo', '/packManager/cch/status', '2019-08-02 15:43:57', 'id=102', NULL);
INSERT INTO `tbl_action_log` VALUES (189, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-02 15:45:21', 'cchId=116&cchName=百度&ver.cchVerName=0&ver.cchVerUpDesc=首次提交&cchAllParam=appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥&cchShortName=baidu&cchWeight=3&cchRequireParam=appid=\r\nappkey=&cchSplash=有(自带)', NULL);
INSERT INTO `tbl_action_log` VALUES (190, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 15:45:43', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (191, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 15:45:44', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (192, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-02 15:49:10', 'cchId=123&cchName=联想&ver.cchVerName=0&ver.cchVerUpDesc=首次提交&cchAllParam=openid=渠道分配的openid&cchShortName=lenovo&cchWeight=3&cchRequireParam=openid=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (193, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-02 15:49:56', 'record.isFinal=1&game.id=5&record.isLandScape=1&cch.id=111&allParam-openid=testopenid&record.pname=com.lenovo.test&record.gpRecordUpDesc=test&record.replaceR=0', NULL);
INSERT INTO `tbl_action_log` VALUES (194, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 15:50:06', 'idsList=[11]', NULL);
INSERT INTO `tbl_action_log` VALUES (195, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 15:50:07', 'gameId=5&idsList=[11]', NULL);
INSERT INTO `tbl_action_log` VALUES (196, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-02 15:59:37', 'cchId=162&cchName=B站&ver.cchVerName=0&ver.cchVerUpDesc=首次提交！！&cchAllParam=mAppId=应用唯一ID\r\nmAppKey=应用秘钥\r\nmerchant_id=渠道提供的cpid商户id\r\nserever_id=渠道提供的服务器ID&cchShortName=bilibili&cchWeight=3&cchRequireParam=mAppId=\r\nmAppKey=\r\nmerchant_id=\r\nserever_id=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (197, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 16:00:13', 'idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (198, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 16:00:14', 'gameId=5&idsList=[3]', NULL);
INSERT INTO `tbl_action_log` VALUES (199, '渠道修改', 'oudongbo', '/packManager/cch/change', '2019-08-02 16:01:47', 'cchId=162&cchName=B站&cchAllParam=mAppId=应用唯一ID\r\nmAppKey=应用秘钥\r\nmerchant_id=渠道提供的cpid商户id\r\nserever_id=渠道分配的服务器ID&cchShortName=bilibili&cchWeight=3&id=103&cchRequireParam=mAppId=\r\nmAppKey=\r\nmerchant_id=\r\nserever_id=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (200, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-02 16:06:43', 'cchId=156&cchName=4399&ver.cchVerName=0&ver.cchVerUpDesc=首次提交！！&cchAllParam=mAppKey=渠道分配的GameKey&cchShortName=4399&cchWeight=3&cchRequireParam=mAppKey=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (201, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-02 16:07:34', 'record.isFinal=1&game.id=5&record.isLandScape=1&cch.id=112&record.pname=com.m4399.test&record.gpRecordUpDesc=test&allParam-mAppKey=testgamekey&record.replaceR=0', NULL);
INSERT INTO `tbl_action_log` VALUES (202, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 16:07:53', 'idsList=[12]', NULL);
INSERT INTO `tbl_action_log` VALUES (203, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 16:07:57', 'gameId=5&idsList=[12]', NULL);
INSERT INTO `tbl_action_log` VALUES (204, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-02 16:18:37', 'cchId=118&cchName=奇虎360&ver.cchVerName=0&ver.cchVerUpDesc=首次提交！！&cchAllParam=appid=QHOPENSDK_APPID\r\nappkey=QHOPENSDK_APPKEY\r\nsecret=QHOPENSDK_PRIVATEKEY\r\nweixin_appid=微信平台分配的appid\r\nqq_appid=QQ平台分配的appid&cchShortName=360&cchWeight=3&cchRequireParam=appid=\r\nappkey=\r\nsecret=\r\nweixin_appid=\r\nqq_appid=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (205, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-02 16:19:51', 'record.isFinal=1&game.id=5&record.isLandScape=1&allParam-weixin_appid=testweixin_appid&cch.id=113&record.pname=com.m360.test&record.gpRecordUpDesc=test&allParam-qq_appid=testqq_appid&allParam-appkey=testappkey&allParam-secret=testsecret&record.replaceR=0&allParam-appid=testappid', NULL);
INSERT INTO `tbl_action_log` VALUES (206, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 16:20:09', 'idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (207, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 16:20:10', 'gameId=5&idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (208, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 16:29:51', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (209, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 16:29:52', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (210, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 16:35:03', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (211, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 16:35:04', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (212, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 17:09:59', 'idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (213, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 17:10:02', 'gameId=5&idsList=[6]', NULL);
INSERT INTO `tbl_action_log` VALUES (214, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 17:11:04', 'idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (215, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 17:11:05', 'gameId=5&idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (216, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 18:00:57', 'cchId=118&cchName=奇虎360&ver.cchVerName=0&ver.cchVerUpDesc=解决65535问题&cchAllParam=appid=QHOPENSDK_APPID\r\nappkey=QHOPENSDK_APPKEY\r\nsecret=QHOPENSDK_PRIVATEKEY\r\nweixin_appid=微信平台分配的appid\r\nqq_appid=QQ平台分配的appid&cchShortName=360&cchWeight=3&id=113&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=\r\nsecret=\r\nweixin_appid=\r\nqq_appid=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (217, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 18:01:43', 'idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (218, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 18:01:44', 'gameId=5&idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (219, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 18:06:08', 'idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (220, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 18:06:09', 'gameId=5&idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (221, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 18:07:15', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (222, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 18:07:16', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (223, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 18:08:06', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (224, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 18:08:07', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (225, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 18:09:05', 'idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (226, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 18:09:07', 'gameId=5&idsList=[2]', NULL);
INSERT INTO `tbl_action_log` VALUES (227, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 18:25:14', 'cchId=118&cchName=奇虎360&ver.cchVerName=0&ver.cchVerUpDesc=修复65535问题！！&cchAllParam=appid=QHOPENSDK_APPID\r\nappkey=QHOPENSDK_APPKEY\r\nsecret=QHOPENSDK_PRIVATEKEY\r\nweixin_appid=微信平台分配的appid\r\nqq_appid=QQ平台分配的appid&cchShortName=360&cchWeight=3&id=113&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=\r\nsecret=\r\nweixin_appid=\r\nqq_appid=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (228, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 18:28:47', 'idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (229, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 18:28:49', 'gameId=5&idsList=[13]', NULL);
INSERT INTO `tbl_action_log` VALUES (230, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 18:32:20', 'cchId=116&cchName=百度&ver.cchVerName=0&ver.cchVerUpDesc=解决65535问题！！！！&cchAllParam=appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥&cchShortName=baidu&cchWeight=3&id=110&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=&cchSplash=有(自带)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (231, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-02 18:35:04', 'cchId=116&cchName=百度&ver.cchVerName=0&ver.cchVerUpDesc=test！！！&cchAllParam=appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥&cchShortName=baidu&cchWeight=3&id=110&ver.cchVerUpStatus=2&cchRequireParam=appid=\r\nappkey=&cchSplash=有(自带)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (232, '渠道删除', 'oudongbo', '/packManager/cch/status', '2019-08-02 18:35:27', 'id=110', NULL);
INSERT INTO `tbl_action_log` VALUES (233, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-02 18:37:53', 'cchId=116&cchName=百度&ver.cchVerName=0&ver.cchVerUpDesc=提交data数据&cchAllParam=appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥&cchShortName=baidu&cchWeight=3&cchRequireParam=appid=\r\nappkey=&cchSplash=有(自带)', NULL);
INSERT INTO `tbl_action_log` VALUES (234, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-02 18:39:50', 'record.isFinal=1&game.id=5&record.isLandScape=1&cch.id=114&record.pname=com.baidu.test&record.gpRecordUpDesc=test&allParam-appkey=testappkey&record.replaceR=0&allParam-appid=testappid', NULL);
INSERT INTO `tbl_action_log` VALUES (235, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 18:39:59', 'idsList=[14]', NULL);
INSERT INTO `tbl_action_log` VALUES (236, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 18:40:00', 'gameId=5&idsList=[14]', NULL);
INSERT INTO `tbl_action_log` VALUES (237, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-02 18:42:40', 'idsList=[3,4,5,6,7,9,10,11,12,13,14]', NULL);
INSERT INTO `tbl_action_log` VALUES (238, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-02 18:42:42', 'gameId=5&idsList=[3,4,5,6,7,9,10,11,12,13,14]', NULL);
INSERT INTO `tbl_action_log` VALUES (239, '用户添加', 'oudongbo', '/user/add', '2019-08-05 14:16:03', 'username=chenzehui&password=9524789&realname=陈泽晖&userGroupId=2&mobile=&email=&status=1', NULL);
INSERT INTO `tbl_action_log` VALUES (240, '游戏删除', 'oudongbo', '/packManager/game/status', '2019-08-13 12:58:57', 'id=5', NULL);
INSERT INTO `tbl_action_log` VALUES (241, '游戏添加', 'oudongbo', '/packManager/game/add', '2019-08-13 13:00:09', 'gameId=100052&gameType=2&isLandScape=1&gameName=全民主公&replaceR=0&ver.gameVerUpDesc=首次添加母包！&gameShortName=qmzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (242, '渠道添加', 'oudongbo', '/packManager/cch/add', '2019-08-13 13:04:17', 'cchId=338&cchName=九玩&ver.cchVerName=0&ver.cchVerUpDesc=首次提交data&cchAllParam=HS_APPID=app_id(游戏ID)\r\nHS_CLIENTID=client_id(客户端ID)\r\nHS_CLIENTKEY=client_key(客户端KEY)&cchShortName=jiuwan&cchWeight=3&cchRequireParam=HS_APPID=\r\nHS_CLIENTID=\r\nHS_CLIENTKEY=&cchSplash=有(手动)', NULL);
INSERT INTO `tbl_action_log` VALUES (243, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-13 13:06:33', 'record.isFinal=1&game.id=7&record.isLandScape=1&allParam-HS_APPID=6122&cch.id=115&record.pname=com.my.ld.mjfx.jwsy&record.gpRecordUpDesc=首次建立参数&allParam-HS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b&allParam-HS_CLIENTID=130&record.replaceR=0', NULL);
INSERT INTO `tbl_action_log` VALUES (244, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-13 13:06:48', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (245, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-13 13:06:49', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (246, '渠道编辑', 'oudongbo', '/packManager/cch/edit', '2019-08-13 17:32:54', 'cchId=338&cchName=九玩&ver.cchVerName=0&ver.cchVerUpDesc=解决65535问题&cchAllParam=HS_APPID=app_id(游戏ID)\r\nHS_CLIENTID=client_id(客户端ID)\r\nHS_CLIENTKEY=client_key(客户端KEY)&cchShortName=jiuwan&cchWeight=3&id=115&ver.cchVerUpStatus=2&cchRequireParam=HS_APPID=\r\nHS_CLIENTID=\r\nHS_CLIENTKEY=&cchSplash=有(手动)&cchSubscript=', NULL);
INSERT INTO `tbl_action_log` VALUES (247, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-13 17:33:10', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (248, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-13 17:33:11', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (249, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-13 17:35:02', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (250, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-13 17:35:03', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (251, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-13 17:36:47', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (252, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-13 17:36:48', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (253, '渠道包打包重复检查', 'chenzehui', '/andrPack/cchPack/checkRunning', '2019-08-13 17:39:54', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (254, '渠道包打包', 'chenzehui', '/andrPack/cchPack/submit', '2019-08-13 17:39:56', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (255, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:23', 'id=14', NULL);
INSERT INTO `tbl_action_log` VALUES (256, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:28', 'id=3', NULL);
INSERT INTO `tbl_action_log` VALUES (257, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:31', 'id=4', NULL);
INSERT INTO `tbl_action_log` VALUES (258, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:34', 'id=5', NULL);
INSERT INTO `tbl_action_log` VALUES (259, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:36', 'id=6', NULL);
INSERT INTO `tbl_action_log` VALUES (260, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:39', 'id=7', NULL);
INSERT INTO `tbl_action_log` VALUES (261, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:42', 'id=9', NULL);
INSERT INTO `tbl_action_log` VALUES (262, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:45', 'id=10', NULL);
INSERT INTO `tbl_action_log` VALUES (263, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:47', 'id=11', NULL);
INSERT INTO `tbl_action_log` VALUES (264, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:50', 'id=12', NULL);
INSERT INTO `tbl_action_log` VALUES (265, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-13 17:40:54', 'id=13', NULL);
INSERT INTO `tbl_action_log` VALUES (266, '游戏编辑', 'oudongbo', '/packManager/game/edit', '2019-08-13 17:53:11', 'gameId=100052&gameType=2&isLandScape=1&gameName=全民主公&replaceR=0&ver.gameVerUpDesc=更换母包！！！&gameShortName=qmzg&isFinal=1&id=7', NULL);
INSERT INTO `tbl_action_log` VALUES (267, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-08-13 17:53:46', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=&apkChangeSign=1&apkChangeGameId=100052&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (268, '游戏编辑', 'oudongbo', '/packManager/game/edit', '2019-08-13 17:54:52', 'gameId=100052&gameType=2&isLandScape=1&gameName=全民主公&replaceR=0&ver.gameVerUpDesc=替换母包！！！&gameShortName=qmzg&isFinal=1&id=7', NULL);
INSERT INTO `tbl_action_log` VALUES (269, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-13 17:55:41', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (270, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-13 17:55:42', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (271, '渠道包打包重复检查', 'chenzehui', '/andrPack/cchPack/checkRunning', '2019-08-13 17:56:46', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (272, '渠道包打包', 'chenzehui', '/andrPack/cchPack/submit', '2019-08-13 17:56:48', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (273, '通用功能打包', 'oudongbo', '/andrPack/apkChange/submit', '2019-08-13 18:13:31', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=&fileSource=1&apkChangePackage=&apkChangeSign=1&apkChangeGameId=100052&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (274, '游戏编辑', 'oudongbo', '/packManager/game/edit', '2019-08-13 18:14:34', 'gameId=100052&gameType=2&isLandScape=1&gameName=全民主公&replaceR=0&ver.gameVerUpDesc=更换母包！！！！&gameShortName=qmzg&isFinal=1&id=7', NULL);
INSERT INTO `tbl_action_log` VALUES (275, '渠道包打包重复检查', 'chenzehui', '/andrPack/cchPack/checkRunning', '2019-08-13 18:15:26', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (276, '渠道包打包', 'chenzehui', '/andrPack/cchPack/submit', '2019-08-13 18:15:27', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (277, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-13 18:16:43', 'idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (278, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-13 18:16:44', 'gameId=7&idsList=[15]', NULL);
INSERT INTO `tbl_action_log` VALUES (279, '游戏删除', 'oudongbo', '/packManager/game/status', '2019-08-14 14:17:48', 'id=7', NULL);
INSERT INTO `tbl_action_log` VALUES (280, '游戏添加', 'oudongbo', '/packManager/game/add', '2019-08-14 14:18:43', 'gameId=100036&gameType=2&isLandScape=1&gameName=全民主公&replaceR=0&ver.gameVerUpDesc=首次提交母包！！！！&gameShortName=qmzg&isFinal=1', NULL);
INSERT INTO `tbl_action_log` VALUES (281, '游戏参数删除', 'oudongbo', '/packManager/gameParam/status', '2019-08-14 14:19:44', 'id=15', NULL);
INSERT INTO `tbl_action_log` VALUES (282, '游戏参数添加', 'oudongbo', '/packManager/gameParam/add', '2019-08-14 14:22:55', 'record.isFinal=1&game.id=8&record.isLandScape=0&allParam-HS_APPID=6122&cch.id=115&record.pname=com.my.ld.mjfx.jwsy&record.gpRecordUpDesc=首次提交&allParam-HS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b&allParam-HS_CLIENTID=130&record.replaceR=0', NULL);
INSERT INTO `tbl_action_log` VALUES (283, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-14 14:23:07', 'idsList=[16]', NULL);
INSERT INTO `tbl_action_log` VALUES (284, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-14 14:23:08', 'gameId=8&idsList=[16]', NULL);
INSERT INTO `tbl_action_log` VALUES (285, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-14 15:23:46', 'idsList=[16]', NULL);
INSERT INTO `tbl_action_log` VALUES (286, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-14 15:23:47', 'gameId=8&idsList=[16]', NULL);
INSERT INTO `tbl_action_log` VALUES (287, '渠道包打包重复检查', 'chenzehui', '/andrPack/cchPack/checkRunning', '2019-08-14 15:33:32', 'idsList=[16]', NULL);
INSERT INTO `tbl_action_log` VALUES (288, '渠道包打包', 'chenzehui', '/andrPack/cchPack/submit', '2019-08-14 15:33:33', 'gameId=8&idsList=[16]', NULL);
INSERT INTO `tbl_action_log` VALUES (289, '通用功能打包', 'chenzehui', '/andrPack/apkChange/submit', '2019-08-14 16:53:12', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=盟军防线&fileSource=1&apkChangePackage=&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
INSERT INTO `tbl_action_log` VALUES (290, '渠道包打包重复检查', 'oudongbo', '/andrPack/cchPack/checkRunning', '2019-08-14 17:41:36', 'idsList=[16]', NULL);
INSERT INTO `tbl_action_log` VALUES (291, '渠道包打包', 'oudongbo', '/andrPack/cchPack/submit', '2019-08-14 17:41:37', 'gameId=8&idsList=[16]', NULL);
INSERT INTO `tbl_action_log` VALUES (292, '通用功能打包', 'chenzehui', '/andrPack/apkChange/submit', '2019-08-22 18:38:41', 'apkChangeCchId=&apkChangeVersionName=&apkChangeName=盟军防线&fileSource=1&apkChangePackage=&apkChangeSign=1&apkChangeGameId=&apkChangeVersionNo=&apkChangeMdId=&game_Id=', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tbl_apk_change
-- ----------------------------
DROP TABLE IF EXISTS `tbl_apk_change`;
CREATE TABLE `tbl_apk_change` (
  `apkChangeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'apk修改ID',
  `gameId` varchar(11) NOT NULL COMMENT '游戏ID',
  `gameName` varchar(80) DEFAULT NULL COMMENT '游戏名',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `apkChangeIcon` tinyint(1) DEFAULT NULL COMMENT 'apk修改图标',
  `apkChangeName` varchar(128) DEFAULT NULL COMMENT 'apk修改游戏名',
  `apkChangePackage` varchar(128) DEFAULT NULL COMMENT 'apk修改包名',
  `apkChangeVersionNo` varchar(128) DEFAULT NULL COMMENT 'apk修改版本号',
  `apkChangeVersionName` varchar(128) DEFAULT NULL COMMENT 'apk修改版本名',
  `apkChangeSign` tinyint(1) DEFAULT '0' COMMENT 'apk重新签名',
  `apkChangeStartDate` datetime NOT NULL COMMENT 'apk修改开始时间',
  `apkChangeEndDate` datetime DEFAULT NULL COMMENT 'apk修改结束时间',
  `apkChangeResultMsg` varchar(128) DEFAULT NULL,
  `apkChangeGameId` varchar(128) DEFAULT NULL COMMENT 'apk修改游戏id',
  `apkChangeCchId` varchar(128) DEFAULT NULL COMMENT 'apk修改渠道id',
  `apkChangeMdId` varchar(128) DEFAULT NULL COMMENT 'apk修改推广包id',
  `apkChangeOutput` text COMMENT 'apk推广包输出文件',
  `apkChangeInput` text COMMENT 'apk母包文件',
  `apkChangeFileSource` tinyint(1) DEFAULT '0' COMMENT 'apk母包来源',
  PRIMARY KEY (`apkChangeId`),
  KEY `FK_ReferenceUserId4` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='apk修改表';

-- ----------------------------
-- Records of tbl_apk_change
-- ----------------------------
BEGIN;
INSERT INTO `tbl_apk_change` VALUES (6, '100010', '神迹觉醒BT', 2, 0, '', 'com.maya.odb', '', '', 1, '2019-01-17 10:21:00', '2019-01-17 10:21:54', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190117102100/oudongbo/new_20190117102100_1547691660046_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190117102100/oudongbo/1547691660046_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (7, '100010', '神迹觉醒BT', 2, 0, '龙族契约', 'com.maya.wzzg', '', '2.0.0', 1, '2019-01-17 10:34:00', '2019-01-17 10:34:57', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190117103400/oudongbo/new_20190117103400_1547692440477_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190117103400/oudongbo/1547692440477_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (8, '100010', '神迹觉醒BT', 2, 0, '', 'com.maya.ledong', '', '', 1, '2019-01-17 10:48:24', '2019-01-17 10:49:23', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190117104823/oudongbo/new_20190117104824_1547693303882_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190117104823/oudongbo/1547693303882_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (9, '100010', '神迹觉醒BT', 2, 0, '', 'com.maya.ledong', '', '', 1, '2019-01-17 11:12:53', '2019-01-17 11:13:49', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190117111252/oudongbo/new_20190117111252_1547694772615_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190117111252/oudongbo/1547694772615_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (10, '', '七日秩序', 2, 0, '', 'com.maya.wzzg', '', '', 1, '2019-01-17 11:37:13', NULL, 'cmd打包执行完成，但找不到输出文件, 请联系技术人员解决', '', '', '', NULL, '/Leidong_pack_online/resource/pack/other/20190117113712/oudongbo/1547696232840_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (11, '100010', '神迹觉醒BT', 2, 0, '', 'com.maya.wzzg', '', '', 1, '2019-01-17 11:38:10', '2019-01-17 11:39:07', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190117113810/oudongbo/new_20190117113810_1547696290032_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190117113810/oudongbo/1547696290032_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (12, '100027', '玛雅奇迹BT', 2, 0, '龙族契约', 'com.maya.odb', '', '2.0.0', 1, '2019-01-23 09:58:26', '2019-01-23 09:59:23', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190123095825/oudongbo/new_20190123095826_1548208705723_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190123095825/oudongbo/1548208705723_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (13, '100027', '玛雅奇迹BT', 2, 0, '', 'com.maya.wzzg', '', '', 1, '2019-01-25 16:53:40', '2019-01-25 16:54:43', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190125165339/oudongbo/new_20190125165340_1548406419680_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190125165339/oudongbo/1548406419680_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (14, '100027', '战刃之影满V版', 2, 0, '', 'com.maya.odb', '', '', 1, '2019-01-25 18:04:43', '2019-01-25 18:07:02', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190125180442/oudongbo/new_20190125180442_1548410682654_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190125180442/oudongbo/1548410682654_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (15, '100036', '盟军防线', 2, 0, '', '', '', '', 1, '2019-08-13 17:53:47', '2019-08-13 17:53:48', '', '100052', '', '', '/Leidong_pack_online/resource/pack/other/20190813175346/oudongbo/new_20190813175346_1565690026525_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190813175346/oudongbo/1565690026525_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (16, '100036', '主公来了', 2, 0, '', '', '', '', 1, '2019-08-13 18:13:31', '2019-08-13 18:13:33', '', '100052', '', '', '/Leidong_pack_online/resource/pack/other/20190813181331/oudongbo/new_20190813181331_1565691211406_oudongbo.apk', '/Leidong_pack_online/resource/pack/other/20190813181331/oudongbo/1565691211406_oudongbo.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (17, '100036', '主公来了', 7, 0, '盟军防线', '', '', '', 1, '2019-08-14 16:53:12', '2019-08-14 16:53:37', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190814165312/chenzehui/new_20190814165312_1565772792336_chenzehui.apk', '/Leidong_pack_online/resource/pack/other/20190814165312/chenzehui/1565772792336_chenzehui.apk', 1);
INSERT INTO `tbl_apk_change` VALUES (18, '100036', '主公来了', 7, 0, '盟军防线', '', '', '', 1, '2019-08-22 18:38:41', '2019-08-22 18:39:01', '', '', '', '', '/Leidong_pack_online/resource/pack/other/20190822183841/chenzehui/new_20190822183841_1566470321284_chenzehui.apk', '/Leidong_pack_online/resource/pack/other/20190822183841/chenzehui/1566470321284_chenzehui.apk', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_channel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_channel`;
CREATE TABLE `tbl_channel` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cchId` varchar(32) NOT NULL COMMENT '渠道标识',
  `cchName` varchar(48) NOT NULL COMMENT '渠道名',
  `cchShortName` varchar(32) NOT NULL COMMENT '渠道标识',
  `cchAllParam` text COMMENT '渠道全部参数',
  `cchRequireParam` text COMMENT '渠道必填参数',
  `cchSplash` varchar(32) DEFAULT NULL COMMENT '渠道闪屏',
  `cchSubscript` varchar(48) DEFAULT '' COMMENT '渠道角标(一共四个角)',
  `cchCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '启用状态(0为停用 1为启用)',
  `cchWeight` tinyint(1) DEFAULT '3' COMMENT '渠道权重',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='渠道表';

-- ----------------------------
-- Records of tbl_channel
-- ----------------------------
BEGIN;
INSERT INTO `tbl_channel` VALUES (100, '101', '雷动安卓', 'leidong', '', '', '有(自带)', '', '2018-07-13 11:13:14', 1, 1);
INSERT INTO `tbl_channel` VALUES (103, '162', 'B站', 'bilibili', 'mAppId=应用唯一ID\r\nmAppKey=应用秘钥\r\nmerchant_id=渠道提供的cpid商户id\r\nserever_id=渠道分配的服务器ID', 'mAppId=\r\nmAppKey=\r\nmerchant_id=\r\nserever_id=', '有(手动)', '', '2019-07-30 15:34:56', 1, 3);
INSERT INTO `tbl_channel` VALUES (104, '119', '华为', 'huawei', 'appid=应用唯一ID\r\ncpid=渠道提供滴cpid', 'appid=\r\ncpid=', '不需要', NULL, '2019-07-31 14:45:20', 1, 3);
INSERT INTO `tbl_channel` VALUES (105, '124', '魅族', 'meizu', 'appid=应用唯一ID\r\nappkey=应用秘钥', 'appid=\r\nappkey=', '有(手动)', NULL, '2019-07-31 15:49:55', 1, 3);
INSERT INTO `tbl_channel` VALUES (106, '120', '小米', 'mi', 'appid=應用唯ID\r\nappkey=應用密鑰', 'appid=\r\nappkey=', '有(手动)', '', '2019-08-01 10:04:28', 1, 3);
INSERT INTO `tbl_channel` VALUES (107, '122', '酷派', 'coolpad', 'appid=渠道分配的应用唯一ID\r\npaykey=渠道分配的支付秘钥', 'appid=\r\npaykey=', '有(手动)', '', '2019-08-01 16:49:12', 1, 3);
INSERT INTO `tbl_channel` VALUES (108, '125', '三星', 'samsung', 'appid=渠道分配的应用ID\r\nloginParams=该参数找技术相关人员索取', 'appid=\r\nloginParams=', '不需要', NULL, '2019-08-02 14:49:38', 1, 3);
INSERT INTO `tbl_channel` VALUES (109, '126', '金立', 'jinli', 'APIKey=渠道分配的apikey', 'APIKey=', '有(手动)', '', '2019-08-02 14:55:54', 1, 3);
INSERT INTO `tbl_channel` VALUES (110, '116', '百度', 'baidu', 'appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥', 'appid=\r\nappkey=', '有(自带)', NULL, '2019-08-02 15:45:22', 0, 3);
INSERT INTO `tbl_channel` VALUES (111, '123', '联想', 'lenovo', 'openid=渠道分配的openid', 'openid=', '有(手动)', NULL, '2019-08-02 15:49:10', 1, 3);
INSERT INTO `tbl_channel` VALUES (112, '156', '4399', '4399', 'mAppKey=渠道分配的GameKey', 'mAppKey=', '有(手动)', NULL, '2019-08-02 16:06:44', 1, 3);
INSERT INTO `tbl_channel` VALUES (113, '118', '奇虎360', '360', 'appid=QHOPENSDK_APPID\r\nappkey=QHOPENSDK_APPKEY\r\nsecret=QHOPENSDK_PRIVATEKEY\r\nweixin_appid=微信平台分配的appid\r\nqq_appid=QQ平台分配的appid', 'appid=\r\nappkey=\r\nsecret=\r\nweixin_appid=\r\nqq_appid=', '有(手动)', '', '2019-08-02 16:18:38', 1, 3);
INSERT INTO `tbl_channel` VALUES (114, '116', '百度', 'baidu', 'appid=渠道分配的应用唯一ID\r\nappkey=渠道分配的应用秘钥', 'appid=\r\nappkey=', '有(自带)', NULL, '2019-08-02 18:37:54', 1, 3);
INSERT INTO `tbl_channel` VALUES (115, '338', '九玩', 'jiuwan', 'HS_APPID=app_id(游戏ID)\r\nHS_CLIENTID=client_id(客户端ID)\r\nHS_CLIENTKEY=client_key(客户端KEY)', 'HS_APPID=\r\nHS_CLIENTID=\r\nHS_CLIENTKEY=', '有(手动)', '', '2019-08-13 13:04:17', 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for tbl_channel_file
-- ----------------------------
DROP TABLE IF EXISTS `tbl_channel_file`;
CREATE TABLE `tbl_channel_file` (
  `cchFileId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '渠道包文件标识',
  `cchRecordId` int(11) NOT NULL COMMENT '渠道包记录标识',
  `gameParamId` int(11) NOT NULL COMMENT '渠道标识',
  `cchFileSuccess` tinyint(1) NOT NULL DEFAULT '0' COMMENT '打包是否成功(1 成功 0 失败)',
  `cchFileGPRecordData` text COMMENT '渠道打包文件记录游戏参数数据',
  PRIMARY KEY (`cchFileId`),
  KEY `FK_ReferenceChanRecordId1` (`cchRecordId`),
  KEY `FK_ReferenceGameParamId2` (`gameParamId`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='渠道包文件表';

-- ----------------------------
-- Records of tbl_channel_file
-- ----------------------------
BEGIN;
INSERT INTO `tbl_channel_file` VALUES (1, 1, 1, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.feimiao.ky.wzzg.qihoo\r\ndebug=0\r\nappkey=79e3af20a6e43cc0572881fc8f996202\r\nsecret=59593a8220e33dba9836597cfabc3076\r\nappid=204203446');
INSERT INTO `tbl_channel_file` VALUES (2, 2, 1, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.feimiao.ky.wzzg.qihoo\r\ndebug=0\r\nappkey=79e3af20a6e43cc0572881fc8f996202\r\nsecret=59593a8220e33dba9836597cfabc3076\r\nappid=204203446');
INSERT INTO `tbl_channel_file` VALUES (3, 3, 1, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.feimiao.ky.wzzg.qihoo\r\ndebug=0\r\nappkey=79e3af20a6e43cc0572881fc8f996202\r\nsecret=59593a8220e33dba9836597cfabc3076\r\nappid=204203446');
INSERT INTO `tbl_channel_file` VALUES (4, 4, 1, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.feimiao.ky.wzzg.qihoo\r\ndebug=0\r\nappkey=79e3af20a6e43cc0572881fc8f996202\r\nsecret=59593a8220e33dba9836597cfabc3076\r\nappid=204203446');
INSERT INTO `tbl_channel_file` VALUES (5, 5, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (6, 6, 3, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver');
INSERT INTO `tbl_channel_file` VALUES (7, 7, 3, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver');
INSERT INTO `tbl_channel_file` VALUES (8, 8, 3, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver');
INSERT INTO `tbl_channel_file` VALUES (9, 9, 3, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver');
INSERT INTO `tbl_channel_file` VALUES (10, 10, 3, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver');
INSERT INTO `tbl_channel_file` VALUES (11, 11, 4, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.\r\ncpid=testcpid\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (12, 12, 5, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.meizu.test\r\nappkey=Testkey\r\nappid=testID');
INSERT INTO `tbl_channel_file` VALUES (13, 13, 6, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (14, 14, 6, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (15, 15, 6, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (16, 16, 6, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (17, 17, 5, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.meizu.test\r\nappkey=Testkey\r\nappid=testID');
INSERT INTO `tbl_channel_file` VALUES (18, 18, 7, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.coolpad.test\r\npaykey=testpaykey\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (19, 19, 5, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.meizu.test\r\nappkey=Testkey\r\nappid=testID');
INSERT INTO `tbl_channel_file` VALUES (20, 20, 6, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (21, 21, 8, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.ysdyh.test\r\npaykey=testkey\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (22, 22, 7, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.coolpad.test\r\npaykey=testpaykey\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (23, 23, 6, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (24, 24, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (25, 24, 3, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver');
INSERT INTO `tbl_channel_file` VALUES (26, 24, 4, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.\r\ncpid=testcpid\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (27, 24, 5, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.meizu.test\r\nappkey=Testkey\r\nappid=testID');
INSERT INTO `tbl_channel_file` VALUES (28, 24, 6, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (29, 24, 7, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.coolpad.test\r\npaykey=testpaykey\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (30, 25, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (31, 26, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (32, 27, 6, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (33, 28, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (34, 29, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (35, 30, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (36, 31, 6, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (37, 32, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (38, 32, 6, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (39, 33, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (40, 34, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (41, 35, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (42, 36, 9, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.samsung.test\r\nappid=testappid\r\nloginParams=testlogin');
INSERT INTO `tbl_channel_file` VALUES (43, 37, 10, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.jingli.test\r\nAPIKey=testapikey');
INSERT INTO `tbl_channel_file` VALUES (44, 38, 10, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.jingli.test\r\nAPIKey=testapikey');
INSERT INTO `tbl_channel_file` VALUES (45, 39, 10, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.jingli.test\r\nAPIKey=testapikey');
INSERT INTO `tbl_channel_file` VALUES (46, 40, 10, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.jingli.test\r\nAPIKey=testapikey');
INSERT INTO `tbl_channel_file` VALUES (47, 41, 10, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.jingli.test\r\nAPIKey=testapikey');
INSERT INTO `tbl_channel_file` VALUES (48, 42, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (49, 43, 11, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.lenovo.test\r\nopenid=testopenid');
INSERT INTO `tbl_channel_file` VALUES (50, 44, 3, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver');
INSERT INTO `tbl_channel_file` VALUES (51, 45, 12, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m4399.test\r\nmAppKey=testgamekey');
INSERT INTO `tbl_channel_file` VALUES (52, 46, 13, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m360.test\r\nweixin_appid=testweixin_appid\r\nqq_appid=testqq_appid\r\nappkey=testappkey\r\nsecret=testsecret\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (53, 47, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (54, 48, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (55, 49, 6, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (56, 50, 13, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m360.test\r\nweixin_appid=testweixin_appid\r\nqq_appid=testqq_appid\r\nappkey=testappkey\r\nsecret=testsecret\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (57, 51, 13, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m360.test\r\nweixin_appid=testweixin_appid\r\nqq_appid=testqq_appid\r\nappkey=testappkey\r\nsecret=testsecret\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (58, 52, 13, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m360.test\r\nweixin_appid=testweixin_appid\r\nqq_appid=testqq_appid\r\nappkey=testappkey\r\nsecret=testsecret\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (59, 53, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (60, 54, 2, 0, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1');
INSERT INTO `tbl_channel_file` VALUES (61, 56, 13, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m360.test\r\nweixin_appid=testweixin_appid\r\nqq_appid=testqq_appid\r\nappkey=testappkey\r\nsecret=testsecret\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (62, 57, 14, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.baidu.test\r\nappkey=testappkey\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (63, 58, 3, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver');
INSERT INTO `tbl_channel_file` VALUES (64, 58, 4, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.\r\ncpid=testcpid\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (65, 58, 5, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.meizu.test\r\nappkey=Testkey\r\nappid=testID');
INSERT INTO `tbl_channel_file` VALUES (66, 58, 6, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid');
INSERT INTO `tbl_channel_file` VALUES (67, 58, 7, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.coolpad.test\r\npaykey=testpaykey\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (68, 58, 9, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.samsung.test\r\nappid=testappid\r\nloginParams=testlogin');
INSERT INTO `tbl_channel_file` VALUES (69, 58, 10, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.jingli.test\r\nAPIKey=testapikey');
INSERT INTO `tbl_channel_file` VALUES (70, 58, 11, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.lenovo.test\r\nopenid=testopenid');
INSERT INTO `tbl_channel_file` VALUES (71, 58, 12, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m4399.test\r\nmAppKey=testgamekey');
INSERT INTO `tbl_channel_file` VALUES (72, 58, 13, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m360.test\r\nweixin_appid=testweixin_appid\r\nqq_appid=testqq_appid\r\nappkey=testappkey\r\nsecret=testsecret\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (73, 58, 14, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.baidu.test\r\nappkey=testappkey\r\nappid=testappid');
INSERT INTO `tbl_channel_file` VALUES (74, 59, 15, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (75, 60, 15, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (76, 61, 15, 0, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (77, 62, 15, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (78, 63, 15, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (79, 64, 15, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (80, 65, 15, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (81, 66, 15, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (82, 67, 15, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (83, 68, 16, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (84, 69, 16, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (85, 70, 16, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
INSERT INTO `tbl_channel_file` VALUES (86, 71, 16, 1, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130');
COMMIT;

-- ----------------------------
-- Table structure for tbl_channel_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_channel_record`;
CREATE TABLE `tbl_channel_record` (
  `cchRecordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '渠道包打包标识',
  `userId` int(11) NOT NULL COMMENT '用户标识',
  `cchRecordStartDate` datetime NOT NULL COMMENT '渠道包打包开始时间',
  `cchRecordEndDate` datetime DEFAULT NULL COMMENT '渠道包打包结束时间',
  `cchRecordNum` int(11) NOT NULL COMMENT '渠道包个数',
  `cchRecordOutput` text COMMENT '渠道打包输出地址记录',
  `cchRecordResultMsg` varchar(128) DEFAULT NULL COMMENT '渠道打包记录结果信息',
  PRIMARY KEY (`cchRecordId`),
  KEY `FK_ReferenceUserId3` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='渠道包记录表';

-- ----------------------------
-- Records of tbl_channel_record
-- ----------------------------
BEGIN;
INSERT INTO `tbl_channel_record` VALUES (1, 1, '2018-07-27 15:24:44', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (2, 1, '2018-07-27 15:29:59', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (3, 1, '2018-07-27 15:32:59', '2018-07-27 15:34:41', 1, '/Feimiao_pack_online/resource/pack/main/20180727153259/tenglili/360_1532676779253_tenglili_feimiao_100006_20180726174422.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (4, 1, '2018-07-27 17:17:09', '2018-07-27 17:18:30', 1, '/Feimiao_pack_online/resource/pack/main/20180727171708/tenglili/360_1532683028876_tenglili_feimiao_100006_20180726174422.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (5, 2, '2019-07-30 15:11:31', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (6, 2, '2019-07-30 15:36:29', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (7, 2, '2019-07-30 16:11:02', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (8, 2, '2019-07-30 16:17:15', '2019-07-30 16:17:48', 1, '/Leidong_pack_online/resource/pack/main/20190730161715/oudongbo/bilibili_1564474635327_oudongbo_leidong_100052_20190730144542.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (9, 2, '2019-07-30 16:38:13', '2019-07-30 16:38:45', 1, '/Leidong_pack_online/resource/pack/main/20190730163813/oudongbo/bilibili_1564475893109_oudongbo_leidong_100052_20190730144542.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (10, 2, '2019-07-31 12:25:53', '2019-07-31 12:26:24', 1, '/Leidong_pack_online/resource/pack/main/20190731122553/oudongbo/bilibili_1564547153448_oudongbo_leidong_100052_20190730144542.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (11, 2, '2019-07-31 14:48:18', '2019-07-31 14:48:46', 1, '/Leidong_pack_online/resource/pack/main/20190731144818/oudongbo/huawei_1564555698474_oudongbo_leidong_100052_20190730144542.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (12, 2, '2019-08-01 10:06:23', '2019-08-01 10:06:47', 1, '/Leidong_pack_online/resource/pack/main/20190801100623/oudongbo/meizu_1564625183241_oudongbo_leidong_100052_20190730144542.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (13, 2, '2019-08-01 11:29:21', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (14, 2, '2019-08-01 15:51:41', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (15, 2, '2019-08-01 15:57:03', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (16, 2, '2019-08-01 16:38:04', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (17, 2, '2019-08-01 16:39:34', '2019-08-01 16:40:01', 1, '/Leidong_pack_online/resource/pack/main/20190801163934/oudongbo/meizu_1564648774079_oudongbo_leidong_100052_20190730144542.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (18, 2, '2019-08-01 16:50:42', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (19, 2, '2019-08-01 16:54:00', '2019-08-01 16:54:30', 1, '/Leidong_pack_online/resource/pack/main/20190801165359/oudongbo/meizu_1564649639924_oudongbo_leidong_100052_20190730144542.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (20, 2, '2019-08-01 17:05:06', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (21, 2, '2019-08-01 18:56:00', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (22, 2, '2019-08-02 10:30:16', '2019-08-02 10:30:43', 1, '/Leidong_pack_online/resource/pack/main/20190802103015/oudongbo/coolpad_1564713015620_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (23, 2, '2019-08-02 10:37:22', '2019-08-02 10:38:00', 1, '/Leidong_pack_online/resource/pack/main/20190802103721/oudongbo/mi_1564713441501_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (24, 2, '2019-08-02 10:45:38', '2019-08-02 10:48:10', 6, '/Leidong_pack_online/resource/pack/main/20190802104538/oudongbo/oudongbo.zip', NULL);
INSERT INTO `tbl_channel_record` VALUES (25, 2, '2019-08-02 12:17:24', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (26, 2, '2019-08-02 12:18:20', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (27, 2, '2019-08-02 12:20:13', '2019-08-02 12:20:49', 1, '/Leidong_pack_online/resource/pack/main/20190802122012/oudongbo/mi_1564719612728_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (28, 2, '2019-08-02 12:21:05', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (29, 2, '2019-08-02 12:25:20', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (30, 2, '2019-08-02 12:28:07', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (31, 2, '2019-08-02 14:22:44', '2019-08-02 14:23:27', 1, '/Leidong_pack_online/resource/pack/main/20190802142243/oudongbo/mi_1564726963813_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (32, 2, '2019-08-02 14:29:21', '2019-08-02 14:30:27', 2, '/Leidong_pack_online/resource/pack/main/20190802142920/oudongbo/mi_1564727360791_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (33, 2, '2019-08-02 14:31:20', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (34, 2, '2019-08-02 14:34:04', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (35, 2, '2019-08-02 14:45:19', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (36, 2, '2019-08-02 14:52:02', '2019-08-02 14:52:31', 1, '/Leidong_pack_online/resource/pack/main/20190802145201/oudongbo/samsung_1564728721762_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (37, 2, '2019-08-02 14:57:03', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (38, 2, '2019-08-02 15:27:23', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (39, 2, '2019-08-02 15:32:46', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (40, 2, '2019-08-02 15:38:24', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (41, 2, '2019-08-02 15:41:14', '2019-08-02 15:41:48', 1, '/Leidong_pack_online/resource/pack/main/20190802154113/oudongbo/jinli_1564731673973_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (42, 2, '2019-08-02 15:45:44', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (43, 2, '2019-08-02 15:50:08', '2019-08-02 15:50:41', 1, '/Leidong_pack_online/resource/pack/main/20190802155007/oudongbo/lenovo_1564732207615_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (44, 2, '2019-08-02 16:00:14', '2019-08-02 16:00:47', 1, '/Leidong_pack_online/resource/pack/main/20190802160014/oudongbo/bilibili_1564732814378_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (45, 2, '2019-08-02 16:07:57', '2019-08-02 16:08:28', 1, '/Leidong_pack_online/resource/pack/main/20190802160757/oudongbo/4399_1564733277341_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (46, 2, '2019-08-02 16:20:11', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (47, 2, '2019-08-02 16:29:53', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (48, 2, '2019-08-02 16:35:05', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (49, 2, '2019-08-02 17:10:02', '2019-08-02 17:10:41', 1, '/Leidong_pack_online/resource/pack/main/20190802171002/oudongbo/mi_1564737002498_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (50, 2, '2019-08-02 17:11:06', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (51, 2, '2019-08-02 18:01:45', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (52, 2, '2019-08-02 18:06:10', '2019-08-02 18:06:51', 1, '/Leidong_pack_online/resource/pack/main/20190802180609/oudongbo/360_1564740369638_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (53, 2, '2019-08-02 18:07:17', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (54, 2, '2019-08-02 18:08:08', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (55, 2, '2019-08-02 18:09:07', NULL, 1, NULL, NULL);
INSERT INTO `tbl_channel_record` VALUES (56, 2, '2019-08-02 18:28:49', '2019-08-02 18:29:29', 1, '/Leidong_pack_online/resource/pack/main/20190802182849/oudongbo/360_1564741729366_oudongbo_leidong_100052_20190801170403.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (57, 2, '2019-08-02 18:40:00', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (58, 2, '2019-08-02 18:42:42', '2019-08-02 18:47:20', 11, '/Leidong_pack_online/resource/pack/main/20190802184242/oudongbo/oudongbo.zip', NULL);
INSERT INTO `tbl_channel_record` VALUES (59, 2, '2019-08-13 13:06:49', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (60, 2, '2019-08-13 17:33:11', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (61, 2, '2019-08-13 17:35:03', NULL, 1, NULL, 'cmd打包执行完成，但找不到输出文件，请联系技术人员解决');
INSERT INTO `tbl_channel_record` VALUES (62, 2, '2019-08-13 17:36:48', '2019-08-13 17:37:25', 1, '/Leidong_pack_online/resource/pack/main/20190813173648/oudongbo/jiuwan_1565689008484_oudongbo_leidong_100052_20190813130009.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (63, 7, '2019-08-13 17:39:56', '2019-08-13 17:40:31', 1, '/Leidong_pack_online/resource/pack/main/20190813173956/chenzehui/jiuwan_1565689196182_chenzehui_leidong_100052_20190813130009.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (64, 2, '2019-08-13 17:55:43', '2019-08-13 17:56:17', 1, '/Leidong_pack_online/resource/pack/main/20190813175542/oudongbo/jiuwan_1565690142557_oudongbo_leidong_100052_20190813175452.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (65, 7, '2019-08-13 17:56:48', '2019-08-13 17:57:21', 1, '/Leidong_pack_online/resource/pack/main/20190813175648/chenzehui/jiuwan_1565690208297_chenzehui_leidong_100052_20190813175452.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (66, 7, '2019-08-13 18:15:27', '2019-08-13 18:15:53', 1, '/Leidong_pack_online/resource/pack/main/20190813181527/chenzehui/jiuwan_1565691327362_chenzehui_leidong_100052_20190813181434.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (67, 2, '2019-08-13 18:16:44', '2019-08-13 18:17:09', 1, '/Leidong_pack_online/resource/pack/main/20190813181644/oudongbo/jiuwan_1565691404135_oudongbo_leidong_100052_20190813181434.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (68, 2, '2019-08-14 14:23:08', '2019-08-14 14:23:35', 1, '/Leidong_pack_online/resource/pack/main/20190814142308/oudongbo/jiuwan_1565763788319_oudongbo_leidong_100036_20190814141843.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (69, 2, '2019-08-14 15:23:47', '2019-08-14 15:24:14', 1, '/Leidong_pack_online/resource/pack/main/20190814152347/oudongbo/jiuwan_1565767427473_oudongbo_leidong_100036_20190814141843.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (70, 7, '2019-08-14 15:33:33', '2019-08-14 15:33:59', 1, '/Leidong_pack_online/resource/pack/main/20190814153333/chenzehui/jiuwan_1565768013388_chenzehui_leidong_100036_20190814141843.apk', NULL);
INSERT INTO `tbl_channel_record` VALUES (71, 2, '2019-08-14 17:41:37', '2019-08-14 17:42:03', 1, '/Leidong_pack_online/resource/pack/main/20190814174137/oudongbo/jiuwan_1565775697168_oudongbo_leidong_100036_20190814141843.apk', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tbl_channel_version
-- ----------------------------
DROP TABLE IF EXISTS `tbl_channel_version`;
CREATE TABLE `tbl_channel_version` (
  `cchVerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '渠道版本标识',
  `_cchId` bigint(20) NOT NULL COMMENT '渠道标识',
  `cchVerName` varchar(48) NOT NULL COMMENT '渠道版本名',
  `cchVerUpDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '渠道版本更新时间',
  `cchVerUpStatus` tinyint(1) NOT NULL COMMENT '渠道版本更新状态',
  `cchVerUpDesc` text COMMENT '渠道版本更新详情',
  `isNew` tinyint(1) DEFAULT '0' COMMENT '是否为最新(0表示不是最新 1表示为最新)',
  `status` tinyint(1) DEFAULT '0' COMMENT '启用状态(0表示停用 1标识启用)',
  `cchVerUpFDate` varchar(20) NOT NULL DEFAULT '' COMMENT '日期格式化字段',
  `cchVerUpDataPath` text NOT NULL COMMENT '渠道版本上传的data文件路径',
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`cchVerId`),
  KEY `FK_ReferenceCchId2` (`_cchId`),
  KEY `FK_ReferenceUserId6` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8 COMMENT='渠道版本表';

-- ----------------------------
-- Records of tbl_channel_version
-- ----------------------------
BEGIN;
INSERT INTO `tbl_channel_version` VALUES (543, 100, '1.1.4', '2018-07-13 11:13:14', 1, '1.1.4', 0, 1, '20180713111314', '/Feimiao_pack_online/resource/platform/data/feimiao/20180713111314/feimiao.zip', 1);
INSERT INTO `tbl_channel_version` VALUES (544, 100, '1.1.4', '2018-07-13 11:52:38', 2, '更新', 0, 1, '20180713115238', '/Feimiao_pack_online/resource/platform/data/feimiao/20180713115238/feimiao.zip', 1);
INSERT INTO `tbl_channel_version` VALUES (545, 100, '1.1.4', '2018-07-27 15:19:41', 2, '2', 0, 1, '20180727151941', '/Feimiao_pack_online/resource/platform/data/feimiao/20180727151941/feimiao.zip', 1);
INSERT INTO `tbl_channel_version` VALUES (546, 101, '2.0.0_608', '2018-07-27 15:20:42', 1, '1', 1, 1, '20180727152041', '/Feimiao_pack_online/resource/platform/data/360/20180727152041/360.zip', 1);
INSERT INTO `tbl_channel_version` VALUES (547, 100, '2.0.2', '2019-07-30 13:02:47', 2, '首次提交', 1, 1, '20190730130247', '/Leidong_pack_online/resource/platform/data/leidong/20190730130247/leidong.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (548, 102, '4.3.1', '2019-07-30 15:10:12', 1, '首次提交！', 0, 0, '20190730151011', '/Leidong_pack_online/resource/platform/data/baidu/20190730151011/baidu.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (549, 103, '2.2.1', '2019-07-30 15:34:56', 1, '首次提交', 0, 1, '20190730153455', '/Leidong_pack_online/resource/platform/data/bilibili/20190730153455/bilibili.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (550, 103, '2.2.1', '2019-07-30 16:17:03', 2, '修复bug', 1, 1, '20190730161702', '/Leidong_pack_online/resource/platform/data/bilibili/20190730161702/bilibili.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (551, 104, '2.6.3.306', '2019-07-31 14:45:20', 1, '首次提交data', 1, 1, '20190731144520', '/Leidong_pack_online/resource/platform/data/huawei/20190731144520/huawei.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (552, 105, '4.9.2', '2019-07-31 15:49:55', 1, '首次提交', 1, 1, '20190731154955', '/Leidong_pack_online/resource/platform/data/meizu/20190731154955/meizu.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (553, 106, '3.0.0', '2019-08-01 10:04:28', 1, '首次提交数据', 0, 1, '20190801100428', '/Leidong_pack_online/resource/platform/data/mi/20190801100428/mi.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (554, 106, '3.0.0', '2019-08-01 12:16:59', 2, '修复bug', 0, 1, '20190801121658', '/Leidong_pack_online/resource/platform/data/mi/20190801121658/mi.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (555, 106, '3.0.0', '2019-08-01 15:50:26', 2, '解决65535问题！！！', 0, 1, '20190801155025', '/Leidong_pack_online/resource/platform/data/mi/20190801155025/mi.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (556, 107, '3.1.6', '2019-08-01 16:49:12', 1, '首次提交data', 0, 1, '20190801164911', '/Leidong_pack_online/resource/platform/data/coolpad/20190801164911/coolpad.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (557, 107, '3.1.6', '2019-08-02 10:29:35', 2, '修复bug', 1, 1, '20190802102935', '/Leidong_pack_online/resource/platform/data/coolpad/20190802102935/coolpad.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (558, 106, '3.0.0', '2019-08-02 10:37:01', 2, '修复超方法数超65535问题！！！', 1, 1, '20190802103701', '/Leidong_pack_online/resource/platform/data/mi/20190802103701/mi.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (559, 102, '4.3.1', '2019-08-02 12:16:54', 2, '修复65535问题！！！', 0, 0, '20190802121653', '/Leidong_pack_online/resource/platform/data/baidu/20190802121653/baidu.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (560, 102, '4.3.1', '2019-08-02 12:27:35', 2, '修复打包超65535问题！！', 0, 0, '20190802122734', '/Leidong_pack_online/resource/platform/data/baidu/20190802122734/baidu.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (561, 102, '4.3.1', '2019-08-02 14:38:43', 2, '解决65535问题', 0, 0, '20190802143843', '/Leidong_pack_online/resource/platform/data/baidu/20190802143843/baidu.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (562, 108, '4.3.5', '2019-08-02 14:49:38', 1, '首次提交data', 1, 1, '20190802144938', '/Leidong_pack_online/resource/platform/data/samsung/20190802144938/samsung.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (563, 109, '4.0.9', '2019-08-02 14:55:54', 1, '首次提交data', 0, 1, '20190802145553', '/Leidong_pack_online/resource/platform/data/jinli/20190802145553/jinli.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (564, 109, '4.0.9', '2019-08-02 15:40:18', 2, '修复R文件问题', 1, 1, '20190802154018', '/Leidong_pack_online/resource/platform/data/jinli/20190802154018/jinli.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (565, 110, '4.3.1', '2019-08-02 15:45:22', 1, '首次提交', 0, 0, '20190802154521', '/Leidong_pack_online/resource/platform/data/baidu/20190802154521/baidu.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (566, 111, '2.6.8', '2019-08-02 15:49:10', 1, '首次提交', 1, 1, '20190802154910', '/Leidong_pack_online/resource/platform/data/lenovo/20190802154910/lenovo.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (567, 112, '2.26.0.3', '2019-08-02 16:06:44', 1, '首次提交！！', 1, 1, '20190802160643', '/Leidong_pack_online/resource/platform/data/4399/20190802160643/4399.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (568, 113, '2.1.8', '2019-08-02 16:18:38', 1, '首次提交！！', 0, 1, '20190802161837', '/Leidong_pack_online/resource/platform/data/360/20190802161837/360.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (569, 113, '2.1.8', '2019-08-02 18:00:58', 2, '解决65535问题', 0, 1, '20190802180057', '/Leidong_pack_online/resource/platform/data/360/20190802180057/360.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (570, 113, '2.1.8', '2019-08-02 18:25:14', 2, '修复65535问题！！', 1, 1, '20190802182514', '/Leidong_pack_online/resource/platform/data/360/20190802182514/360.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (571, 114, '4.3.1', '2019-08-02 18:37:54', 1, '提交data数据', 1, 1, '20190802183753', '/Leidong_pack_online/resource/platform/data/baidu/20190802183753/baidu.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (572, 115, '7.1', '2019-08-13 13:04:17', 1, '首次提交data', 0, 1, '20190813130417', '/Leidong_pack_online/resource/platform/data/jiuwan/20190813130417/jiuwan.zip', 2);
INSERT INTO `tbl_channel_version` VALUES (573, 115, '7.1', '2019-08-13 17:32:54', 2, '解决65535问题', 1, 1, '20190813173254', '/Leidong_pack_online/resource/platform/data/jiuwan/20190813173254/jiuwan.zip', 2);
COMMIT;

-- ----------------------------
-- Table structure for tbl_company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE `tbl_company` (
  `companyId` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司id',
  `companyName` varchar(128) NOT NULL COMMENT '公司名',
  `companyDesc` text,
  `companyCreateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '公司创建时间',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_company
-- ----------------------------
BEGIN;
INSERT INTO `tbl_company` VALUES (1, '玛雅雷动', '玛雅发行', '2018-07-12 17:58:09', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_game
-- ----------------------------
DROP TABLE IF EXISTS `tbl_game`;
CREATE TABLE `tbl_game` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '游戏自增id',
  `gameId` varchar(32) NOT NULL COMMENT '游戏标识',
  `companyId` int(11) NOT NULL COMMENT '公司Id',
  `gameName` varchar(80) NOT NULL COMMENT '游戏名',
  `gameShortName` varchar(32) DEFAULT NULL COMMENT '游戏编码',
  `gameType` tinyint(4) NOT NULL COMMENT '游戏运营类型(1表示独代 2表示联运  其他表示未知)',
  `gameCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT '0' COMMENT '启用状态(0表示停用 1表示启用)',
  PRIMARY KEY (`_id`),
  KEY `FK_ReferenceCompanyId2` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='游戏表';

-- ----------------------------
-- Records of tbl_game
-- ----------------------------
BEGIN;
INSERT INTO `tbl_game` VALUES (2, '100052', 1, 'test', 'test', 1, '2019-07-30 13:01:17', 0);
INSERT INTO `tbl_game` VALUES (3, '100052', 1, 'test', 'test', 1, '2019-07-30 13:03:36', 0);
INSERT INTO `tbl_game` VALUES (4, '100052', 1, 'test', 'test', 1, '2019-07-30 14:43:42', 0);
INSERT INTO `tbl_game` VALUES (5, '100052', 1, 'test', 'test', 2, '2019-07-30 14:45:42', 0);
INSERT INTO `tbl_game` VALUES (6, '100027', 1, '遗失的永恒', 'ysdrh', 1, '2019-08-01 18:52:02', 1);
INSERT INTO `tbl_game` VALUES (7, '100052', 1, '全民主公', 'qmzg', 2, '2019-08-13 13:00:10', 0);
INSERT INTO `tbl_game` VALUES (8, '100036', 1, '全民主公', 'qmzg', 2, '2019-08-14 14:18:43', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_game_param
-- ----------------------------
DROP TABLE IF EXISTS `tbl_game_param`;
CREATE TABLE `tbl_game_param` (
  `gameParamId` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏参数标识',
  `_gameId` bigint(20) NOT NULL COMMENT '游戏标识',
  `_cchId` bigint(20) NOT NULL COMMENT '渠道标识',
  `gameParamCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '游戏参数创建时间',
  `gameParamIcon` tinyint(4) DEFAULT NULL COMMENT '游戏图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '启用状态(0表示停用 1表示启用)',
  PRIMARY KEY (`_gameId`,`_cchId`),
  UNIQUE KEY `AK_UniqueKeyGameParamId` (`gameParamId`),
  KEY `FK_ReferenceCchId1` (`_cchId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='游戏参数表';

-- ----------------------------
-- Records of tbl_game_param
-- ----------------------------
BEGIN;
INSERT INTO `tbl_game_param` VALUES (1, 1, 101, '2018-07-27 15:24:14', 1, 1);
INSERT INTO `tbl_game_param` VALUES (2, 5, 102, '2019-07-30 15:11:20', 0, 1);
INSERT INTO `tbl_game_param` VALUES (3, 5, 103, '2019-07-30 15:36:12', 0, 0);
INSERT INTO `tbl_game_param` VALUES (4, 5, 104, '2019-07-31 14:48:08', 0, 0);
INSERT INTO `tbl_game_param` VALUES (5, 5, 105, '2019-08-01 10:05:38', 0, 0);
INSERT INTO `tbl_game_param` VALUES (6, 5, 106, '2019-08-01 10:06:14', 0, 0);
INSERT INTO `tbl_game_param` VALUES (7, 5, 107, '2019-08-01 16:50:32', 0, 0);
INSERT INTO `tbl_game_param` VALUES (9, 5, 108, '2019-08-02 14:51:48', 0, 0);
INSERT INTO `tbl_game_param` VALUES (10, 5, 109, '2019-08-02 14:56:34', 0, 0);
INSERT INTO `tbl_game_param` VALUES (11, 5, 111, '2019-08-02 15:49:56', 0, 0);
INSERT INTO `tbl_game_param` VALUES (12, 5, 112, '2019-08-02 16:07:34', 0, 0);
INSERT INTO `tbl_game_param` VALUES (13, 5, 113, '2019-08-02 16:19:52', 0, 0);
INSERT INTO `tbl_game_param` VALUES (14, 5, 114, '2019-08-02 18:39:50', 0, 0);
INSERT INTO `tbl_game_param` VALUES (8, 6, 107, '2019-08-01 18:55:43', 0, 0);
INSERT INTO `tbl_game_param` VALUES (15, 7, 115, '2019-08-13 13:06:34', 1, 0);
INSERT INTO `tbl_game_param` VALUES (16, 8, 115, '2019-08-14 14:22:55', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_game_param_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_game_param_record`;
CREATE TABLE `tbl_game_param_record` (
  `gpRecordId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '游戏参数记录标识',
  `gameParamId` int(11) NOT NULL COMMENT '游戏参数标识',
  `gpRecordData` text NOT NULL COMMENT '游戏参数数据',
  `gpRecordUpDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '游戏参数更新时间',
  `userId` int(11) NOT NULL COMMENT '用户标识',
  `gpRecordUpDesc` text COMMENT '游戏参数更新详情',
  `isNew` tinyint(4) DEFAULT '0' COMMENT '是否为最新(0表示不是最新 1表示最新)',
  `status` tinyint(4) DEFAULT '0' COMMENT '启用状态(0表示停用 1表示启用)',
  PRIMARY KEY (`gpRecordId`),
  KEY `FK_ReferenceGameParamId1` (`gameParamId`),
  KEY `FK_ReferenceUserId1` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='游戏参数记录表';

-- ----------------------------
-- Records of tbl_game_param_record
-- ----------------------------
BEGIN;
INSERT INTO `tbl_game_param_record` VALUES (1, 1, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.feimiao.ky.wzzg.qihoo\r\ndebug=0\r\nappkey=79e3af20a6e43cc0572881fc8f996202\r\nsecret=59593a8220e33dba9836597cfabc3076\r\nappid=204203446', '2018-07-27 15:24:14', 1, '1', 1, 1);
INSERT INTO `tbl_game_param_record` VALUES (2, 2, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.test.baudu\r\nappkey=test2\r\nappid=test1', '2019-07-30 15:11:20', 2, '首次建立参数', 1, 1);
INSERT INTO `tbl_game_param_record` VALUES (3, 3, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.blibli.test\r\nmerchant_id=testmerchant\r\nmAppKey=testappkey\r\nmAppId=testappid\r\nserever_id=testserver', '2019-07-30 15:36:12', 2, '建立测试参数', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (4, 4, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.\r\ncpid=testcpid\r\nappid=testappid', '2019-07-31 14:48:08', 2, '首次建立测试参数', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (5, 5, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.meizu.test\r\nappkey=Testkey\r\nappid=testID', '2019-08-01 10:05:38', 2, '首次建立参数', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (6, 6, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.xiaomi.test\r\nappkey=testkey\r\nappid=testid', '2019-08-01 10:06:14', 2, 'test', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (7, 7, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.coolpad.test\r\npaykey=testpaykey\r\nappid=testappid', '2019-08-01 16:50:32', 2, '首次提交data', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (8, 8, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.ysdyh.test\r\npaykey=testkey\r\nappid=testappid', '2019-08-01 18:55:43', 2, '首次建立参数', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (9, 9, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.samsung.test\r\nappid=testappid\r\nloginParams=testlogin', '2019-08-02 14:51:48', 2, 'test', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (10, 10, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.jingli.test\r\nAPIKey=testapikey', '2019-08-02 14:56:34', 2, 'test', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (11, 11, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.lenovo.test\r\nopenid=testopenid', '2019-08-02 15:49:56', 2, 'test', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (12, 12, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m4399.test\r\nmAppKey=testgamekey', '2019-08-02 16:07:34', 2, 'test', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (13, 13, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.m360.test\r\nweixin_appid=testweixin_appid\r\nqq_appid=testqq_appid\r\nappkey=testappkey\r\nsecret=testsecret\r\nappid=testappid', '2019-08-02 16:19:52', 2, 'test', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (14, 14, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.baidu.test\r\nappkey=testappkey\r\nappid=testappid', '2019-08-02 18:39:50', 2, 'test', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (15, 15, 'isLandScape=1\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130', '2019-08-13 13:06:34', 2, '首次建立参数', 0, 0);
INSERT INTO `tbl_game_param_record` VALUES (16, 16, 'isLandScape=0\r\nisFinal=1\r\nreplaceR=0\r\npname=com.my.ld.mjfx.jwsy\r\nHS_APPID=6122\r\nHS_CLIENTKEY=0fc97536f420be395971b68b2aa67c1b\r\nHS_CLIENTID=130', '2019-08-14 14:22:55', 2, '首次提交', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_game_version
-- ----------------------------
DROP TABLE IF EXISTS `tbl_game_version`;
CREATE TABLE `tbl_game_version` (
  `gameVerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '游戏版本标识',
  `_gameId` bigint(20) NOT NULL COMMENT '游戏标识',
  `gameVerNum` varchar(32) NOT NULL COMMENT '游戏版本号',
  `gameVerName` varchar(48) NOT NULL COMMENT '游戏版本名',
  `gameVerUpCPPath` text NOT NULL COMMENT '游戏版本上传的CP包路径',
  `gameVerUpSJoysPath` text NOT NULL COMMENT '游戏版本上传的星趣包路径',
  `gameVerUpDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '游戏版本更新时间',
  `gameVerUpDesc` text COMMENT '游戏版本详情',
  `isNew` tinyint(4) DEFAULT '0' COMMENT '是否为最新(0表示不是最新 1表示最新)',
  `status` tinyint(4) DEFAULT '0' COMMENT '启用状态(0表示停用 1表示启用)',
  `gameVerUpFDate` text NOT NULL COMMENT '更新格式化时间',
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`gameVerId`),
  KEY `FK_ReferenceGameId2` (`_gameId`),
  KEY `FK_ReferenceUserId7` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='游戏版本表';

-- ----------------------------
-- Records of tbl_game_version
-- ----------------------------
BEGIN;
INSERT INTO `tbl_game_version` VALUES (1, 1, '101', '1.0.1', '/game/cp/wzzg/20180726174422/cp_100006_20180726174422.apk', '/game/feimiao/wzzg/20180726174422/feimiao_100006_20180726174422.apk', '2018-07-26 17:44:23', '1', 1, 1, '20180726174422', 1);
INSERT INTO `tbl_game_version` VALUES (2, 2, '102', '1.02', '/game/cp/test/20190730130116/cp_100052_20190730130116.apk', '/game/leidong/test/20190730130116/leidong_100052_20190730130116.apk', '2019-07-30 13:01:17', '首次提交\r\n', 0, 0, '20190730130116', 2);
INSERT INTO `tbl_game_version` VALUES (3, 3, '102', '1.02', '/game/cp/test/20190730130336/cp_100052_20190730130336.apk', '/game/leidong/test/20190730130336/leidong_100052_20190730130336.apk', '2019-07-30 13:03:36', '首次提交', 0, 0, '20190730130336', 2);
INSERT INTO `tbl_game_version` VALUES (4, 4, '102', '1.02', '/game/cp/test/20190730144341/cp_100052_20190730144341.apk', '/game/leidong/test/20190730144341/leidong_100052_20190730144341.apk', '2019-07-30 14:43:42', '首次提交', 0, 0, '20190730144341', 2);
INSERT INTO `tbl_game_version` VALUES (5, 5, '102', '1.02', '/game/cp/test/20190730144542/cp_100052_20190730144542.apk', '/game/leidong/test/20190730144542/leidong_100052_20190730144542.apk', '2019-07-30 14:45:42', 'test', 0, 0, '20190730144542', 2);
INSERT INTO `tbl_game_version` VALUES (6, 5, '102', '1.02', '/game/cp/test/20190801170403/cp_100052_20190801170403.apk', '/game/leidong/test/20190801170403/leidong_100052_20190801170403.apk', '2019-08-01 17:04:03', '更新test', 0, 0, '20190801170403', 2);
INSERT INTO `tbl_game_version` VALUES (7, 6, '10000001', '1.0.0', '/game/cp/ysdrh/20190801185201/cp_100027_20190801185201.apk', '/game/leidong/ysdrh/20190801185201/leidong_100027_20190801185201.apk', '2019-08-01 18:52:02', '首次提交测试', 1, 1, '20190801185201', 2);
INSERT INTO `tbl_game_version` VALUES (8, 7, '103', '1.03', '/game/cp/qmzg/20190813130009/cp_100052_20190813130009.apk', '/game/leidong/qmzg/20190813130009/leidong_100052_20190813130009.apk', '2019-08-13 13:00:10', '首次添加母包！', 0, 0, '20190813130009', 2);
INSERT INTO `tbl_game_version` VALUES (9, 7, '103', '1.03', '/game/cp/qmzg/20190813175452/cp_100052_20190813175452.apk', '/game/leidong/qmzg/20190813175452/leidong_100052_20190813175452.apk', '2019-08-13 17:54:52', '替换母包！！！', 0, 0, '20190813175452', 2);
INSERT INTO `tbl_game_version` VALUES (10, 7, '102', '1.02', '/game/cp/qmzg/20190813181434/cp_100052_20190813181434.apk', '/game/leidong/qmzg/20190813181434/leidong_100052_20190813181434.apk', '2019-08-13 18:14:35', '更换母包！！！！', 0, 0, '20190813181434', 2);
INSERT INTO `tbl_game_version` VALUES (11, 8, '102', '1.02', '/game/cp/qmzg/20190814141843/cp_100036_20190814141843.apk', '/game/leidong/qmzg/20190814141843/leidong_100036_20190814141843.apk', '2019-08-14 14:18:43', '首次提交母包！！！！', 1, 1, '20190814141843', 2);
COMMIT;

-- ----------------------------
-- Table structure for tbl_icon_merge_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_icon_merge_record`;
CREATE TABLE `tbl_icon_merge_record` (
  `icMergeRecordId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '打角标记录id',
  `_gameId` bigint(20) DEFAULT NULL COMMENT '游戏自增id',
  `_cchId` bigint(20) DEFAULT NULL COMMENT '渠道自增id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `icMergeRecordDirection` varchar(64) NOT NULL COMMENT '打角标记录方向',
  `icMergeRecordStartDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '打角标记录开始时间',
  `icMergeRecordEndDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '打角标记录结束时间',
  `icMergeRecordMsgResult` varchar(160) DEFAULT NULL COMMENT '打角标记录结果信息',
  `icMergeRecordOutput` text COMMENT '打角标记录结果输出路径',
  PRIMARY KEY (`icMergeRecordId`),
  KEY `FK_ReferenceGameId3` (`_gameId`) USING BTREE,
  KEY `FK_ReferenceCchId3` (`_cchId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_md_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_md_record`;
CREATE TABLE `tbl_md_record` (
  `mdRecordId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '推广包标识',
  `gameId` varchar(11) NOT NULL COMMENT '游戏标识',
  `gameName` varchar(80) DEFAULT NULL COMMENT '游戏名',
  `mdRecordStart` varchar(32) NOT NULL COMMENT '推广包起始标识',
  `mdRecordEnd` varchar(32) NOT NULL COMMENT '推广包结束标识',
  `mdRecordNum` int(11) DEFAULT '1' COMMENT '推广包个数',
  `userId` int(11) NOT NULL COMMENT '推广包打包者标识',
  `mdRecordStartDate` datetime NOT NULL COMMENT '推广包打包开始时间',
  `mdRecordEndDate` datetime DEFAULT NULL COMMENT '推广包打包结束时间',
  `mdRecordResultMsg` varchar(128) DEFAULT NULL COMMENT '打包记录结果信息',
  `mdRecordOutput` text COMMENT '推广包打包记录输出文件',
  `mdRecordFileSource` tinyint(1) DEFAULT '0' COMMENT '推广包打包记录母包来源',
  PRIMARY KEY (`mdRecordId`),
  KEY `FK_ReferenceUserId2` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='推广包记录表';

-- ----------------------------
-- Records of tbl_md_record
-- ----------------------------
BEGIN;
INSERT INTO `tbl_md_record` VALUES (1, '100006', '王者之光', '10080', '10080', 1, 1, '2018-07-27 12:24:30', NULL, 'cmd异常结束，请联系技术人员解决', NULL, 1);
INSERT INTO `tbl_md_record` VALUES (2, '100006', '王者之光', '10080', '10080', 1, 1, '2018-07-27 12:27:20', '2018-07-27 12:27:32', '', '/Feimiao_pack_online/resource/pack/main/20180727122719/tenglili/101_100006_10080.apk', 1);
INSERT INTO `tbl_md_record` VALUES (3, '100006', '王者之光', '10080', '10080', 1, 1, '2018-07-27 12:31:19', '2018-07-27 12:31:30', '', '/Feimiao_pack_online/resource/pack/main/20180727123119/tenglili/100006_101_10080.apk', 1);
INSERT INTO `tbl_md_record` VALUES (4, '100006', '王者之光', '10080', '10085', 6, 1, '2018-07-27 12:32:47', '2018-07-27 12:34:31', '', '/Feimiao_pack_online/resource/pack/main/20180727123246/tenglili/tenglili.zip', 2);
COMMIT;

-- ----------------------------
-- Table structure for tbl_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单标识',
  `menuName` varchar(128) NOT NULL COMMENT '菜单名',
  `menuParentId` int(11) NOT NULL COMMENT '父菜单标识',
  `menuUrl` text COMMENT '菜单网址',
  `menuDesc` text COMMENT '菜单说明',
  `menuSort` int(11) DEFAULT '0' COMMENT '菜单排序',
  `menuIcon` text COMMENT '菜单图标',
  `moduleId` int(11) NOT NULL COMMENT '模块标识(FK)',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态(0表示不可用 1标识可用)',
  `isShow` tinyint(4) DEFAULT '0' COMMENT '是否显示(0表示不显示,1表示显示)',
  PRIMARY KEY (`menuId`),
  KEY `FK_ReferenceModuleId` (`moduleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='菜单表\r\n通过关联父菜单标识展示菜单的分级关系';

-- ----------------------------
-- Records of tbl_menu
-- ----------------------------
BEGIN;
INSERT INTO `tbl_menu` VALUES (1, '用户管理', 0, '/user', '用户管理', 3, 'user-green', 1, 1, 1);
INSERT INTO `tbl_menu` VALUES (2, '菜单管理', 0, '/system/menuManager', '菜单管理', 4, 'chart-organisation', 1, 1, 1);
INSERT INTO `tbl_menu` VALUES (3, '用户组管理', 0, '/system/userGroupManager', '用户组管理', 2, 'users', 1, 1, 1);
INSERT INTO `tbl_menu` VALUES (4, '用户列表', 1, '/user/list', '用户列表', 0, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (5, '用户添加', 1, '/user/add', '用户添加', 0, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (6, '上传文件', 0, '/upload', '上传文件', 0, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (7, '下载文件', 0, '/download', '下载文件', 0, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (8, '用户编辑', 1, '/user/edit', '用户编辑', 0, NULL, 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (9, '用户状态', 1, '/user/status', '用户状态', 0, NULL, 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (10, '广告推广包', 0, '/andrPack/mdPack', '广告推广包', 2, 'box-picture', 3, 1, 1);
INSERT INTO `tbl_menu` VALUES (11, '广告推广包打包', 10, '/andrPack/mdPack/submit', '广告推广包打包', 0, NULL, 3, 1, 0);
INSERT INTO `tbl_menu` VALUES (12, '渠道管理', 0, '/packManager/cch', '渠道管理', 2, 'lorry', 2, 1, 1);
INSERT INTO `tbl_menu` VALUES (13, '通用功能', 0, '/andrPack/apkChange', '通用功能', 1, 'box', 3, 1, 1);
INSERT INTO `tbl_menu` VALUES (14, '通用功能打包', 13, '/andrPack/apkChange/submit', '通用功能打包', 0, NULL, 3, 1, 0);
INSERT INTO `tbl_menu` VALUES (15, '渠道列表', 12, '/packManager/cch/list', '渠道列表', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (16, '渠道版本管理', 12, '/packManager/cchVersion', '渠道版本管理', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (17, '渠道版本列表', 16, '/packManager/cchVersion/list', '渠道版本列表', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (18, '渠道添加', 12, '/packManager/cch/add', '渠道添加', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (19, '渠道编辑', 12, '/packManager/cch/edit', '渠道编辑', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (20, '渠道删除', 12, '/packManager/cch/status', '渠道删除', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (21, '渠道版本编辑', 16, '/packManager/cchVersion/edit', '渠道版本编辑', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (22, '渠道版本删除', 16, '/packManager/cchVersion/status', '渠道版本删除', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (23, '游戏管理', 0, '/packManager/game', '游戏管理', 1, 'keyboard', 2, 1, 1);
INSERT INTO `tbl_menu` VALUES (24, '游戏列表', 23, '/packManager/game/list', '游戏列表', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (25, '游戏版本管理', 23, '/packManager/gameVersion', '游戏版本管理', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (26, '游戏版本列表', 25, '/packManager/gameVersion/list', '游戏版本列表', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (27, '游戏添加', 23, '/packManager/game/add', '游戏添加', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (28, '游戏编辑', 23, '/packManager/game/edit', '游戏编辑', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (29, '游戏删除', 23, '/packManager/game/status', '游戏删除', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (30, '游戏参数管理', 0, '/packManager/gameParam', '游戏参数管理', 3, 'application-view-detail', 2, 1, 1);
INSERT INTO `tbl_menu` VALUES (31, '游戏参数列表', 30, '/packManager/gameParam/list', '游戏参数列表', 0, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (32, '游戏参数添加', 30, '/packManager/gameParam/add', '游戏参数添加', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (33, '游戏参数更新', 30, '/packManager/gameParam/edit', '游戏参数更新', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (34, '游戏参数删除', 30, '/packManager/gameParam/status', '游戏参数删除', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (35, '游戏参数记录管理', 30, '/packManager/gameParamRecord', '游戏参数记录管理', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (36, '游戏参数记录列表', 35, '/packManager/gameParamRecord/list', '游戏参数记录列表', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (37, '游戏参数记录编辑', 35, '/packManager/gameParamRecord/edit', '游戏参数记录编辑', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (38, '游戏版本编辑', 25, '/packManager/gameVersion/edit', '游戏版本编辑', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (39, '渠道包', 0, '/andrPack/cchPack', '渠道包', 3, 'build', 3, 1, 1);
INSERT INTO `tbl_menu` VALUES (40, '游戏参数渠道数据修改', 35, '/packManager/gameParamRecord/updateRecordData', '游戏参数渠道数据修改', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (41, '渠道包打包', 39, '/andrPack/cchPack/submit', '渠道包打包', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (42, '渠道包打包重复检查', 39, '/andrPack/cchPack/checkRunning', '渠道包打包重复检查', 0, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (43, '渠道打包记录', 0, '/packRecord/cchPackRecord', '渠道打包记录', 3, 'page-break', 4, 1, 1);
INSERT INTO `tbl_menu` VALUES (44, '渠道打包记录列表', 43, '/packRecord/cchPackRecord/list', '渠道打包记录列表', 0, '', 4, 1, 0);
INSERT INTO `tbl_menu` VALUES (45, '推广包打包记录', 0, '/packRecord/mdPackRecord', '推广包打包记录', 2, 'page-landscape-shot', 4, 1, 1);
INSERT INTO `tbl_menu` VALUES (46, '推广包打包记录列表', 45, '/packRecord/mdPackRecord/list', '推广包打包记录列表', 0, NULL, 4, 1, 0);
INSERT INTO `tbl_menu` VALUES (47, '通用功能打包记录', 0, '/packRecord/commonPackRecord', '通用功能打包记录', 1, 'page-green', 4, 1, 1);
INSERT INTO `tbl_menu` VALUES (48, '通用功能打包记录列表', 47, '/packRecord/commonPackRecord/list', '通用功能打包记录列表', 0, NULL, 4, 1, 0);
INSERT INTO `tbl_menu` VALUES (49, '游戏修改', 23, '/packManager/game/change', '游戏修改', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (50, '渠道修改', 12, '/packManager/cch/change', '渠道修改', 0, NULL, 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (51, '图标合并工具', 0, '/toolbox/iconMerge', '图标合并工具', 0, 'shape-move-backwards', 5, 1, 1);
INSERT INTO `tbl_menu` VALUES (52, '图标合并打包', 51, '/toolbox/iconMerge/submit', '图标合并打包', 0, NULL, 5, 1, 0);
INSERT INTO `tbl_menu` VALUES (53, '图标合并记录', 0, '/toolboxRecord/iconMergeRecord', '图标合并记录', 0, 'page-landscape-shot', 6, 1, 1);
INSERT INTO `tbl_menu` VALUES (54, '图标合并记录列表', 53, '/toolboxRecord/iconMergeRecord/list', '图标合并记录列表', 0, NULL, 6, 1, 0);
INSERT INTO `tbl_menu` VALUES (55, '控制台日志', 0, '/systemLog/consoleLog', '控制台日志', 3, 'application-xp-terminal', 7, 1, 1);
INSERT INTO `tbl_menu` VALUES (56, '控制台日志清除', 55, '/systemLog/consoleLog/submit', '控制台日志清除', 0, NULL, 7, 1, 0);
INSERT INTO `tbl_menu` VALUES (57, '菜单列表', 2, '/system/menuManager/list', '菜单列表', 0, NULL, 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (58, '菜单添加', 2, '/system/menuManager/add', '菜单添加', 0, NULL, 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (59, '菜单编辑', 2, '/system/menuManager/edit', '菜单编辑', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (60, '用户组列表', 3, '/system/userGroupManager/list', '用户组列表', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (61, '用户组添加', 3, '/system/userGroupManager/add', '用户组添加', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (62, '用户组编辑', 3, '/system/userGroupManager/edit', '用户组编辑', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (63, '用户组权限设置', 3, '/system/userGroupManager/authSet', '用户组权限设置', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (64, '行为日志', 0, '/systemLog/actionLog', '行为日志', 1, 'page-portrait-shot', 7, 1, 1);
INSERT INTO `tbl_menu` VALUES (65, '行为日志列表', 64, '/systemLog/actionLog/list', '行为日志列表', 1, '', 7, 1, 0);
INSERT INTO `tbl_menu` VALUES (66, '公司管理', 0, '/system/companyManager', '', 1, 'building', 1, 1, 1);
INSERT INTO `tbl_menu` VALUES (67, '公司列表', 66, '/system/companyManager/list', '公司列表', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (68, '公司添加', 66, '/system/companyManager/add', '公司添加', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (69, '公司编辑', 66, '/system/companyManager/edit', '公司编辑', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (70, '打包日志', 0, '/systemLog/packLog', '打包日志', 2, 'page-go', 7, 1, 1);
INSERT INTO `tbl_menu` VALUES (71, '打包日志列表', 70, '/systemLog/packLog/list', '打包日志列表', 1, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (72, '打包工具管理', 0, '/system/packToolManager', '打包工具管理', 5, 'package', 2, 1, 1);
INSERT INTO `tbl_menu` VALUES (73, '打包工具列表', 72, '/system/packToolManager/list', '打包工具列表', 1, '', 1, 1, 0);
INSERT INTO `tbl_menu` VALUES (74, '打包工具添加', 72, '/system/packToolManager/add', '打包工具添加', 1, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (75, '打包工具更新', 72, '/system/packToolManager/edit', '打包工具更新', 1, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (76, '打包工具修改', 72, '/system/packToolManager/change', '打包工具修改', 1, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (77, '打包工具记录管理', 72, '/system/packToolRecordManager', '打包工具记录管理', 1, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (78, '打包工具记录列表', 77, '/system/packToolRecordManager/list', '打包工具记录列表', 1, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (79, '打包工具记录编辑', 77, '/system/packToolRecordManager/edit', '打包工具记录编辑', 1, '', 2, 1, 0);
INSERT INTO `tbl_menu` VALUES (80, '安卓国内SDK', 0, '/sdk/sdkManager', '国内SDK', 1, 'door', 8, 1, 1);
INSERT INTO `tbl_menu` VALUES (81, '安卓国内SDK列表', 80, '/sdk/sdkManager/list', '国内SDK列表', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (82, '安卓国内SDK添加', 80, '/sdk/sdkManager/add', '国内SDK添加', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (83, '安卓国内SDK更新', 80, '/sdk/sdkManager/edit', '国内SDK更新', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (84, '安卓国内SDK修改', 80, '/sdk/sdkManager/change', '国内SDK修改', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (85, '安卓国内SDK版本管理', 80, '/sdk/sdkVersionManager', '国内SDK版本管理', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (86, '安卓国内SDK版本列表', 85, '/sdk/sdkVersionManager/list', '国内SDK版本列表', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (87, '安卓国内SDK版本编辑', 85, '/sdk/sdkVersionManager/edit', '国内SDK版本编辑', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (88, '安卓海外SDK', 0, '/sdk/sdkOverseaManager', '海外SDK', 2, 'door-open', 8, 1, 1);
INSERT INTO `tbl_menu` VALUES (89, '安卓海外SDK列表', 88, '/sdk/sdkOverseaManager/list', '海外SDK列表', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (90, '安卓海外SDK添加', 88, '/sdk/sdkOverseaManager/add', '海外SDK添加', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (91, '安卓海外SDK更新', 88, '/sdk/sdkOverseaManager/edit', '海外SDK更新', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (92, '安卓海外SDK修改', 88, '/sdk/sdkOverseaManager/change', '海外SDK修改', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (93, '安卓海外SDK版本管理', 88, '/sdk/sdkVersionOverseaManager', '海外SDK版本管理', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (94, '安卓海外SDK版本列表', 93, '/sdk/sdkVersionOverseaManager/list', '海外SDK版本列表', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (95, '安卓海外SDK版本编辑', 93, '/sdk/sdkVersionOverseaManager/edit', '海外SDK版本编辑', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (96, 'iOS国内SDK', 0, '/sdk/sdkIOSManager', 'iOS国内SDK', 3, 'door-in', 8, 1, 1);
INSERT INTO `tbl_menu` VALUES (97, 'iOS国内SDK列表', 96, '/sdk/sdkIOSManager/list', 'iOS国内SDK列表', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (98, 'iOS国内SDK添加', 96, '/sdk/sdkIOSManager/add', 'iOS国内SDK添加', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (99, 'iOS国内SDK更新', 96, '/sdk/sdkIOSManager/edit', 'iOS国内SDK更新', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (100, 'iOS国内SDK修改', 96, '/sdk/sdkIOSManager/change', 'iOS国内SDK修改', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (101, 'iOS国内SDK版本管理', 96, '/sdk/sdkVersionIOSManager', 'iOS国内SDK版本管理', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (102, 'iOS国内SDK版本列表', 101, '/sdk/sdkVersionIOSManager/list', 'iOS国内SDK版本列表', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (103, 'iOS国内SDK版本编辑', 101, '/sdk/sdkVersionIOSManager/edit', 'iOS国内SDK版本编辑', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (104, 'iOS海外SDK', 0, '/sdk/sdkIOSOverseaManager', 'iOS海外SDK', 4, 'door-out', 8, 1, 1);
INSERT INTO `tbl_menu` VALUES (105, 'iOS海外SDK列表', 104, '/sdk/sdkIOSOverseaManager/list', 'iOS海外SDK列表', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (106, 'iOS海外SDK添加', 104, '/sdk/sdkIOSOverseaManager/add', 'iOS海外SDK添加', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (107, 'iOS海外SDK编辑', 104, '/sdk/sdkIOSOverseaManager/edit', 'iOS海外SDK编辑', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (108, 'iOS海外SDK修改', 104, '/sdk/sdkIOSOverseaManager/change', 'iOS海外SDK修改', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (109, 'iOS海外SDK版本管理', 104, '/sdk/sdkVersionIOSOverseaManager', 'iOS海外SDK版本管理', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (110, 'iOS海外SDK版本列表', 109, '/sdk/sdkVersionIOSOverseaManager/list', 'iOS海外SDK版本列表', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (111, 'iOS海外SDK版本编辑', 109, '/sdk/sdkVersionIOSOverseaManager/edit', 'iOS海外SDK版本编辑', 1, '', 8, 1, 0);
INSERT INTO `tbl_menu` VALUES (112, '用户修改密码', 1, '/user/change', '用户修改密码', 1, '', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_module
-- ----------------------------
DROP TABLE IF EXISTS `tbl_module`;
CREATE TABLE `tbl_module` (
  `moduleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块标识',
  `moduleName` varchar(128) NOT NULL COMMENT '模块名',
  `moduleUrl` text NOT NULL COMMENT '模块网址',
  `moduleDesc` text COMMENT '模块说明',
  `moduleSort` int(11) DEFAULT '0' COMMENT '模块排序',
  `moduleIcon` text,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态(0表示不可用 1表示可用)',
  `isShow` tinyint(1) DEFAULT '0' COMMENT '是否展示(0表示不展示 1表示展示)',
  PRIMARY KEY (`moduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of tbl_module
-- ----------------------------
BEGIN;
INSERT INTO `tbl_module` VALUES (1, '系统管理', '/index', '系统管理', 6, 'cog', 1, 1);
INSERT INTO `tbl_module` VALUES (2, '打包管理', '/packManager', '打包管理', 3, 'bricks', 1, 1);
INSERT INTO `tbl_module` VALUES (3, '安卓打包', '/andPack', '安卓打包', 1, 'cup', 1, 1);
INSERT INTO `tbl_module` VALUES (4, '打包记录', '/packRecord', '打包记录', 2, 'disk-black', 1, 1);
INSERT INTO `tbl_module` VALUES (5, '工具箱', '/toolbox', '工具箱', 3, 'advancedsettings', 1, 1);
INSERT INTO `tbl_module` VALUES (6, '工具箱记录', '/toolboxRecord', '工具箱记录', 4, 'database-wrench', 1, 1);
INSERT INTO `tbl_module` VALUES (7, '系统日志', '/systemLog', '系统日志', 7, 'database-gear', 1, 1);
INSERT INTO `tbl_module` VALUES (8, 'SDK版本管理', '/sdk', 'SDK版本管理', 5, 'door', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_pack_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pack_log`;
CREATE TABLE `tbl_pack_log` (
  `packLogId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '打包日志id',
  `menuId` int(11) NOT NULL COMMENT '打包菜单id',
  `userId` int(11) NOT NULL COMMENT '打包者id',
  `packLogPath` text NOT NULL COMMENT '打包日志路径',
  `packLogDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '打包日志创建时间',
  `packLogResult` tinyint(1) DEFAULT '0' COMMENT '打包日志打包结果(1 成功 0 失败)',
  `status` tinyint(1) DEFAULT '0' COMMENT '0表示删除 1表示活跃',
  PRIMARY KEY (`packLogId`)
) ENGINE=InnoDB AUTO_INCREMENT=2105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_pack_log
-- ----------------------------
BEGIN;
INSERT INTO `tbl_pack_log` VALUES (2008, 11, 25, '/pack/log/20171107/log_TT_ZhongWenYuan_20171107174936.txt', '2017-11-07 17:49:36', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2009, 41, 3, '/pack/log/20171107/log_Ben_20171107184740.txt', '2017-11-07 18:47:40', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2010, 41, 34, '/pack/log/20171107/log_TT_WangXiaoCan_20171107205347.txt', '2017-11-07 20:53:47', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2011, 11, 17, '/pack/log/20171108/log_XiaoYi_20171108093753.txt', '2017-11-08 09:37:53', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2012, 11, 17, '/pack/log/20171108/log_XiaoYi_20171108142906.txt', '2017-11-08 14:29:06', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2013, 14, 1, '/pack/log/20180723/log_tenglili_20180723110939.txt', '2018-07-23 11:09:39', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2014, 14, 1, '/pack/log/20180726/log_tenglili_20180726185353.txt', '2018-07-26 18:53:53', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2015, 14, 1, '/pack/log/20180726/log_tenglili_20180726191555.txt', '2018-07-26 19:15:56', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2016, 14, 1, '/pack/log/20180726/log_tenglili_20180726193132.txt', '2018-07-26 19:31:32', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2017, 14, 1, '/pack/log/20180727/log_tenglili_20180727115340.txt', '2018-07-27 11:53:40', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2018, 11, 1, '/pack/log/20180727/log_tenglili_20180727122430.txt', '2018-07-27 12:24:30', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2019, 11, 1, '/pack/log/20180727/log_tenglili_20180727122719.txt', '2018-07-27 12:27:20', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2020, 11, 1, '/pack/log/20180727/log_tenglili_20180727123119.txt', '2018-07-27 12:31:19', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2021, 11, 1, '/pack/log/20180727/log_tenglili_20180727123246.txt', '2018-07-27 12:32:47', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2022, 41, 1, '/pack/log/20180727/log_tenglili_20180727152444.txt', '2018-07-27 15:24:44', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2023, 41, 1, '/pack/log/20180727/log_tenglili_20180727152958.txt', '2018-07-27 15:29:59', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2024, 41, 1, '/pack/log/20180727/log_tenglili_20180727153259.txt', '2018-07-27 15:32:59', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2025, 41, 1, '/pack/log/20180727/log_tenglili_20180727171708.txt', '2018-07-27 17:17:09', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2026, 14, 2, '/pack/log/20190117/log_oudongbo_20190117102100.txt', '2019-01-17 10:21:00', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2027, 14, 2, '/pack/log/20190117/log_oudongbo_20190117103400.txt', '2019-01-17 10:34:00', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2028, 14, 2, '/pack/log/20190117/log_oudongbo_20190117104823.txt', '2019-01-17 10:48:24', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2029, 14, 2, '/pack/log/20190117/log_oudongbo_20190117111252.txt', '2019-01-17 11:12:53', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2030, 14, 2, '/pack/log/20190117/log_oudongbo_20190117113712.txt', '2019-01-17 11:37:13', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2031, 14, 2, '/pack/log/20190117/log_oudongbo_20190117113810.txt', '2019-01-17 11:38:10', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2032, 14, 2, '/pack/log/20190123/log_oudongbo_20190123095825.txt', '2019-01-23 09:58:26', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2033, 14, 2, '/pack/log/20190125/log_oudongbo_20190125165339.txt', '2019-01-25 16:53:40', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2034, 14, 2, '/pack/log/20190125/log_oudongbo_20190125180442.txt', '2019-01-25 18:04:43', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2035, 41, 2, '/pack/log/20190730/log_oudongbo_20190730151131.txt', '2019-07-30 15:11:31', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2036, 41, 2, '/pack/log/20190730/log_oudongbo_20190730153629.txt', '2019-07-30 15:36:29', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2037, 41, 2, '/pack/log/20190730/log_oudongbo_20190730161101.txt', '2019-07-30 16:11:02', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2038, 41, 2, '/pack/log/20190730/log_oudongbo_20190730161715.txt', '2019-07-30 16:17:15', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2039, 41, 2, '/pack/log/20190730/log_oudongbo_20190730163813.txt', '2019-07-30 16:38:13', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2040, 41, 2, '/pack/log/20190731/log_oudongbo_20190731122553.txt', '2019-07-31 12:25:53', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2041, 41, 2, '/pack/log/20190731/log_oudongbo_20190731144818.txt', '2019-07-31 14:48:18', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2042, 41, 2, '/pack/log/20190801/log_oudongbo_20190801100623.txt', '2019-08-01 10:06:23', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2043, 41, 2, '/pack/log/20190801/log_oudongbo_20190801112920.txt', '2019-08-01 11:29:21', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2044, 41, 2, '/pack/log/20190801/log_oudongbo_20190801155141.txt', '2019-08-01 15:51:41', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2045, 41, 2, '/pack/log/20190801/log_oudongbo_20190801155703.txt', '2019-08-01 15:57:03', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2046, 41, 2, '/pack/log/20190801/log_oudongbo_20190801163803.txt', '2019-08-01 16:38:04', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2047, 41, 2, '/pack/log/20190801/log_oudongbo_20190801163934.txt', '2019-08-01 16:39:34', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2048, 41, 2, '/pack/log/20190801/log_oudongbo_20190801165042.txt', '2019-08-01 16:50:42', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2049, 41, 2, '/pack/log/20190801/log_oudongbo_20190801165359.txt', '2019-08-01 16:54:00', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2050, 41, 2, '/pack/log/20190801/log_oudongbo_20190801170505.txt', '2019-08-01 17:05:06', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2051, 41, 2, '/pack/log/20190801/log_oudongbo_20190801185600.txt', '2019-08-01 18:56:00', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2052, 41, 2, '/pack/log/20190802/log_oudongbo_20190802103015.txt', '2019-08-02 10:30:16', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2053, 41, 2, '/pack/log/20190802/log_oudongbo_20190802103721.txt', '2019-08-02 10:37:22', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2054, 41, 2, '/pack/log/20190802/log_oudongbo_20190802104538.txt', '2019-08-02 10:45:38', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2055, 41, 2, '/pack/log/20190802/log_oudongbo_20190802121724.txt', '2019-08-02 12:17:24', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2056, 41, 2, '/pack/log/20190802/log_oudongbo_20190802121819.txt', '2019-08-02 12:18:20', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2057, 41, 2, '/pack/log/20190802/log_oudongbo_20190802122012.txt', '2019-08-02 12:20:13', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2058, 41, 2, '/pack/log/20190802/log_oudongbo_20190802122104.txt', '2019-08-02 12:21:05', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2059, 41, 2, '/pack/log/20190802/log_oudongbo_20190802122520.txt', '2019-08-02 12:25:20', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2060, 41, 2, '/pack/log/20190802/log_oudongbo_20190802122807.txt', '2019-08-02 12:28:07', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2061, 41, 2, '/pack/log/20190802/log_oudongbo_20190802142243.txt', '2019-08-02 14:22:44', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2062, 41, 2, '/pack/log/20190802/log_oudongbo_20190802142920.txt', '2019-08-02 14:29:21', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2063, 41, 2, '/pack/log/20190802/log_oudongbo_20190802143120.txt', '2019-08-02 14:31:20', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2064, 41, 2, '/pack/log/20190802/log_oudongbo_20190802143403.txt', '2019-08-02 14:34:04', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2065, 41, 2, '/pack/log/20190802/log_oudongbo_20190802144519.txt', '2019-08-02 14:45:19', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2066, 41, 2, '/pack/log/20190802/log_oudongbo_20190802145201.txt', '2019-08-02 14:52:02', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2067, 41, 2, '/pack/log/20190802/log_oudongbo_20190802145702.txt', '2019-08-02 14:57:03', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2068, 41, 2, '/pack/log/20190802/log_oudongbo_20190802152722.txt', '2019-08-02 15:27:23', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2069, 41, 2, '/pack/log/20190802/log_oudongbo_20190802153245.txt', '2019-08-02 15:32:46', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2070, 41, 2, '/pack/log/20190802/log_oudongbo_20190802153823.txt', '2019-08-02 15:38:24', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2071, 41, 2, '/pack/log/20190802/log_oudongbo_20190802154113.txt', '2019-08-02 15:41:14', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2072, 41, 2, '/pack/log/20190802/log_oudongbo_20190802154544.txt', '2019-08-02 15:45:44', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2073, 41, 2, '/pack/log/20190802/log_oudongbo_20190802155007.txt', '2019-08-02 15:50:08', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2074, 41, 2, '/pack/log/20190802/log_oudongbo_20190802160014.txt', '2019-08-02 16:00:14', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2075, 41, 2, '/pack/log/20190802/log_oudongbo_20190802160757.txt', '2019-08-02 16:07:57', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2076, 41, 2, '/pack/log/20190802/log_oudongbo_20190802162010.txt', '2019-08-02 16:20:11', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2077, 41, 2, '/pack/log/20190802/log_oudongbo_20190802162952.txt', '2019-08-02 16:29:53', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2078, 41, 2, '/pack/log/20190802/log_oudongbo_20190802163504.txt', '2019-08-02 16:35:05', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2079, 41, 2, '/pack/log/20190802/log_oudongbo_20190802171002.txt', '2019-08-02 17:10:02', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2080, 41, 2, '/pack/log/20190802/log_oudongbo_20190802171105.txt', '2019-08-02 17:11:06', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2081, 41, 2, '/pack/log/20190802/log_oudongbo_20190802180144.txt', '2019-08-02 18:01:45', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2082, 41, 2, '/pack/log/20190802/log_oudongbo_20190802180609.txt', '2019-08-02 18:06:10', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2083, 41, 2, '/pack/log/20190802/log_oudongbo_20190802180716.txt', '2019-08-02 18:07:17', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2084, 41, 2, '/pack/log/20190802/log_oudongbo_20190802180807.txt', '2019-08-02 18:08:08', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2085, 41, 2, '/pack/log/20190802/log_oudongbo_20190802182849.txt', '2019-08-02 18:28:49', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2086, 41, 2, '/pack/log/20190802/log_oudongbo_20190802184000.txt', '2019-08-02 18:40:00', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2087, 41, 2, '/pack/log/20190802/log_oudongbo_20190802184242.txt', '2019-08-02 18:42:42', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2088, 41, 2, '/pack/log/20190813/log_oudongbo_20190813130649.txt', '2019-08-13 13:06:49', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2089, 41, 2, '/pack/log/20190813/log_oudongbo_20190813173311.txt', '2019-08-13 17:33:11', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2090, 41, 2, '/pack/log/20190813/log_oudongbo_20190813173503.txt', '2019-08-13 17:35:03', 0, 1);
INSERT INTO `tbl_pack_log` VALUES (2091, 41, 2, '/pack/log/20190813/log_oudongbo_20190813173648.txt', '2019-08-13 17:36:48', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2092, 41, 7, '/pack/log/20190813/log_chenzehui_20190813173956.txt', '2019-08-13 17:39:56', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2093, 14, 2, '/pack/log/20190813/log_oudongbo_20190813175346.txt', '2019-08-13 17:53:47', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2094, 41, 2, '/pack/log/20190813/log_oudongbo_20190813175542.txt', '2019-08-13 17:55:43', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2095, 41, 7, '/pack/log/20190813/log_chenzehui_20190813175648.txt', '2019-08-13 17:56:48', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2096, 14, 2, '/pack/log/20190813/log_oudongbo_20190813181331.txt', '2019-08-13 18:13:31', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2097, 41, 7, '/pack/log/20190813/log_chenzehui_20190813181527.txt', '2019-08-13 18:15:27', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2098, 41, 2, '/pack/log/20190813/log_oudongbo_20190813181644.txt', '2019-08-13 18:16:44', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2099, 41, 2, '/pack/log/20190814/log_oudongbo_20190814142308.txt', '2019-08-14 14:23:08', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2100, 41, 2, '/pack/log/20190814/log_oudongbo_20190814152347.txt', '2019-08-14 15:23:47', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2101, 41, 7, '/pack/log/20190814/log_chenzehui_20190814153333.txt', '2019-08-14 15:33:33', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2102, 14, 7, '/pack/log/20190814/log_chenzehui_20190814165312.txt', '2019-08-14 16:53:12', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2103, 41, 2, '/pack/log/20190814/log_oudongbo_20190814174137.txt', '2019-08-14 17:41:37', 1, 1);
INSERT INTO `tbl_pack_log` VALUES (2104, 14, 7, '/pack/log/20190822/log_chenzehui_20190822183841.txt', '2019-08-22 18:38:41', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_pack_path
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pack_path`;
CREATE TABLE `tbl_pack_path` (
  `packPathId` int(20) NOT NULL AUTO_INCREMENT COMMENT '打包路径ID',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `packPathText` text NOT NULL COMMENT '打包路径文本',
  `packPathCreateDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '打包路径记录创建时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '是否启用(0 删除 1 存在)',
  PRIMARY KEY (`packPathId`),
  KEY `FK_ReferenceUserId5` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2633 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_pack_path
-- ----------------------------
BEGIN;
INSERT INTO `tbl_pack_path` VALUES (2108, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011090956/XiaoYi', '2017-10-13 08:54:45', 0);
INSERT INTO `tbl_pack_path` VALUES (2109, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011090933/TT_ZhongWenYuan', '2017-10-13 08:54:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2110, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011093053/Andy', '2017-10-13 08:54:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2111, 22, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011093441/TT_JunBao', '2017-10-13 08:54:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2112, 20, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011093901/Ranger', '2017-10-13 08:54:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2113, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011095543/TT_ZhongWenYuan', '2017-10-13 08:54:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2114, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011100748/XiaoYi', '2017-10-13 08:54:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2115, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011100958/XiaoYi', '2017-10-13 08:54:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2116, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011102606/TT_ZhongWenYuan', '2017-10-13 08:54:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2117, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011103043/TT_ZhongWenYuan', '2017-10-13 08:54:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2118, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011103810/Andy', '2017-10-13 08:54:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2119, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011103941/XiaoYi', '2017-10-13 08:54:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2120, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011104859/XiaoYi', '2017-10-13 08:54:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2121, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011105341/XiaoYi', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2122, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011111659/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2123, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011114842/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2124, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011112739/XiaoYi', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2125, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011122604/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2126, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011135535/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2127, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011135719/XiaoYi', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2128, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011141028/Ben', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2129, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011145011/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2130, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011151322/TT_BoLunRui', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2131, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011152541/TT_BoLunRui', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2132, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011160231/Ben', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2133, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011161140/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2134, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011161659/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2135, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171011174245/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2136, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011185050/Ken', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2137, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171011192826/TT_BoLunRui', '2017-10-13 08:54:50', 0);
INSERT INTO `tbl_pack_path` VALUES (2138, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012100244/Ken', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2139, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012113045/Andy', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2140, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012140613/Andy', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2141, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012150133/TT_BoLunRui', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2142, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012170031/Ken', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2143, 18, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012170851/TianTuo', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2144, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012174552/TT_BoLunRui', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2145, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012183607/Andy', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2146, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012184849/Andy', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2147, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012185149/TT_BoLunRui', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2148, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171012191244/Andy', '2017-10-14 16:14:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2149, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013085450/XiaoYi', '2017-10-16 09:43:45', 0);
INSERT INTO `tbl_pack_path` VALUES (2150, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013094419/XiaoYi', '2017-10-16 09:43:45', 0);
INSERT INTO `tbl_pack_path` VALUES (2151, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171013105809/XiaoYi', '2017-10-16 09:43:45', 0);
INSERT INTO `tbl_pack_path` VALUES (2152, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013111551/Ben', '2017-10-16 09:43:45', 0);
INSERT INTO `tbl_pack_path` VALUES (2153, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171013114941/Andy', '2017-10-16 09:43:45', 0);
INSERT INTO `tbl_pack_path` VALUES (2154, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013114959/Andy', '2017-10-16 09:43:45', 0);
INSERT INTO `tbl_pack_path` VALUES (2155, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013142949/TT_BoLunRui', '2017-10-16 09:43:45', 0);
INSERT INTO `tbl_pack_path` VALUES (2156, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013152910/Andy', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2157, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013155814/XiaoYi', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2158, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013160834/TT_BoLunRui', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2159, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013161355/Andy', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2160, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013161359/Andy', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2161, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013161438/Andy', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2162, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013161721/Andy', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2163, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013164731/Ben', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2164, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013173649/XiaoYi', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2165, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171013210733/TT_BoLunRui', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2166, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171014161447/TT_WangXiaoCan', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2167, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171014172443/TT_BoLunRui', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2168, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171014173551/TT_BoLunRui', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2169, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171014220535/TT_BoLunRui', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2170, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171014220933/TT_BoLunRui', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2171, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171014221035/TT_BoLunRui', '2017-10-16 09:43:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2172, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016094346/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2173, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016094420/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2174, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016094908/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2175, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016094940/Ben', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2176, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016095928/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2177, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016095708/Ben', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2178, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016102443/XiaoYi', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2179, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016104206/Ben', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2180, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016105636/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2181, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016110210/Ben', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2182, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016110332/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2183, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016111159/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2184, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016112313/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2185, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016112404/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2186, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016112940/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2187, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016113200/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2188, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016115220/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2189, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016125011/Andy', '2017-10-18 09:16:33', 0);
INSERT INTO `tbl_pack_path` VALUES (2190, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016132214/Andy', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2191, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016144709/Ben', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2192, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016161102/Andy', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2193, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016163803/Ben', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2194, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016173742/TT_WangXiaoCan', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2195, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016174939/Andy', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2196, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016175740/TT_WangXiaoCan', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2197, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016183502/Andy', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2198, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171016184317/Andy', '2017-10-18 09:16:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2199, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017115020/TT_BoLunRui', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2200, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017115340/Andy', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2201, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017115726/Ben', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2202, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017115855/TT_BoLunRui', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2203, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017115952/Ben', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2204, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017150615/TT_BoLunRui', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2205, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017151025/TT_BoLunRui', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2206, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017155343/Ben', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2207, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017160415/TT_BoLunRui', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2208, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017160548/TT_BoLunRui', '2017-10-19 09:06:56', 0);
INSERT INTO `tbl_pack_path` VALUES (2209, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017164613/TT_ZhongWenYuan', '2017-10-19 09:06:57', 0);
INSERT INTO `tbl_pack_path` VALUES (2210, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017165932/TT_WangXiaoCan', '2017-10-19 09:06:57', 0);
INSERT INTO `tbl_pack_path` VALUES (2211, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017170636/TT_ZhongWenYuan', '2017-10-19 09:06:58', 0);
INSERT INTO `tbl_pack_path` VALUES (2212, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017171533/TT_BoLunRui', '2017-10-19 09:06:58', 0);
INSERT INTO `tbl_pack_path` VALUES (2213, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017172530/Andy', '2017-10-19 09:06:58', 0);
INSERT INTO `tbl_pack_path` VALUES (2214, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017173931/Ken', '2017-10-19 09:06:58', 0);
INSERT INTO `tbl_pack_path` VALUES (2215, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017173317/TT_ZhongWenYuan', '2017-10-19 09:06:59', 0);
INSERT INTO `tbl_pack_path` VALUES (2216, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017175430/TT_BoLunRui', '2017-10-19 09:06:59', 0);
INSERT INTO `tbl_pack_path` VALUES (2217, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017175540/TT_ZhongWenYuan', '2017-10-19 09:06:59', 0);
INSERT INTO `tbl_pack_path` VALUES (2218, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017175912/TT_BoLunRui', '2017-10-19 09:06:59', 0);
INSERT INTO `tbl_pack_path` VALUES (2219, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017180312/TT_BoLunRui', '2017-10-19 09:06:59', 0);
INSERT INTO `tbl_pack_path` VALUES (2220, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017182509/TT_BoLunRui', '2017-10-19 09:07:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2221, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017182801/TT_ZhongWenYuan', '2017-10-19 09:07:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2222, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017185923/TT_ZhongWenYuan', '2017-10-19 09:07:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2223, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017191636/TT_BoLunRui', '2017-10-19 09:07:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2224, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017191853/TT_BoLunRui', '2017-10-19 09:07:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2225, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017192226/TT_BoLunRui', '2017-10-19 09:07:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2226, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017192847/TT_ZhongWenYuan', '2017-10-19 09:07:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2227, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171017195448/TT_ZhongWenYuan', '2017-10-19 09:07:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2228, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018091634/TT_BoLunRui', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2229, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018103925/Andy', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2230, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018112115/Andy', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2231, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018112156/Ken', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2232, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018113308/Ken', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2233, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018113840/Andy', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2234, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171018142128/TT_BoLunRui', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2235, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018143436/Andy', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2236, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018143820/Andy', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2237, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018144002/Andy', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2238, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018145050/TT_BoLunRui', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2239, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018145832/Andy', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2240, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018150049/Andy', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2241, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171018161753/TT_BoLunRui', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2242, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018170858/TT_BoLunRui', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2243, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018173407/TT_BoLunRui', '2017-10-20 10:45:16', 0);
INSERT INTO `tbl_pack_path` VALUES (2244, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018174312/Andy', '2017-10-20 10:45:17', 0);
INSERT INTO `tbl_pack_path` VALUES (2245, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018174610/Andy', '2017-10-20 10:45:17', 0);
INSERT INTO `tbl_pack_path` VALUES (2246, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018200304/TT_GuYan', '2017-10-20 10:45:17', 0);
INSERT INTO `tbl_pack_path` VALUES (2247, 33, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171018203513/td_linzhihua', '2017-10-20 10:45:17', 0);
INSERT INTO `tbl_pack_path` VALUES (2248, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019091012/XiaoYi', '2017-10-21 02:29:05', 0);
INSERT INTO `tbl_pack_path` VALUES (2249, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019090700/TT_GuYan', '2017-10-21 02:29:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2250, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019100001/TT_GuYan', '2017-10-21 02:29:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2251, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019103152/TT_BoLunRui', '2017-10-21 02:29:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2252, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019104459/TT_GuYan', '2017-10-21 02:29:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2253, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019105413/TT_BoLunRui', '2017-10-21 02:29:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2254, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019111228/TT_GuYan', '2017-10-21 02:29:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2255, 33, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019140420/td_linzhihua', '2017-10-21 02:29:09', 0);
INSERT INTO `tbl_pack_path` VALUES (2256, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019140351/TT_GuYan', '2017-10-21 02:29:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2257, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019142719/TT_GuYan', '2017-10-21 02:29:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2258, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019144830/TT_GuYan', '2017-10-21 02:29:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2259, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171019184728/Andy', '2017-10-21 02:29:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2260, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171019185001/TT_HuangShaoHai', '2017-10-21 02:29:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2261, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171019193800/TT_HuangShaoHai', '2017-10-21 02:29:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2262, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020104517/TT_HuangShaoHai', '2017-10-23 09:24:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2263, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020104645/TT_HuangShaoHai', '2017-10-23 09:24:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2264, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020105038/TT_HuangShaoHai', '2017-10-23 09:24:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2265, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171020112207/Ken', '2017-10-23 09:24:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2266, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020112650/XiaoYi', '2017-10-23 09:24:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2267, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020125552/Ben', '2017-10-23 09:24:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2268, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020140131/TT_HuangShaoHai', '2017-10-23 09:24:07', 0);
INSERT INTO `tbl_pack_path` VALUES (2269, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020142807/TT_BoLunRui', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2270, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020144104/TT_HuangShaoHai', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2271, 23, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171020145217/TT_ZhouWeiFeng', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2272, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020152915/TT_BoLunRui', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2273, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020153806/TT_BoLunRui', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2274, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020154202/TT_BoLunRui', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2275, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020160949/Ben', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2276, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020172245/TT_BoLunRui', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2277, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020191010/TT_BoLunRui', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2278, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171020224052/Ken', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2279, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171020233757/Ken', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2280, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171020235418/Ken', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2281, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171021022912/Ken', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2282, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171021023309/Ken', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2283, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171021024525/Ken', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2284, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171021144123/Ken', '2017-10-23 09:24:08', 0);
INSERT INTO `tbl_pack_path` VALUES (2285, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023092408/XiaoYi', '2017-10-25 10:57:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2286, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023100314/Ben', '2017-10-25 10:57:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2287, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023101603/Ken', '2017-10-25 10:57:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2288, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023115013/TT_BoLunRui', '2017-10-25 10:57:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2289, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023144325/Ben', '2017-10-25 10:57:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2290, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023150812/Ben', '2017-10-25 10:57:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2291, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023170337/TT_BoLunRui', '2017-10-25 10:57:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2292, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023182346/TT_BoLunRui', '2017-10-25 10:57:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2293, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023182755/TT_BoLunRui', '2017-10-25 10:57:42', 0);
INSERT INTO `tbl_pack_path` VALUES (2294, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171023210352/TT_BoLunRui', '2017-10-25 10:57:42', 0);
INSERT INTO `tbl_pack_path` VALUES (2295, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024085310/Ken', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2296, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024090018/Ken', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2297, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024095246/Andy', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2298, 20, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024095752/Ranger', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2299, 20, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024095814/Ranger', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2300, 20, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024095844/Ranger', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2301, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024100153/Ken', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2302, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171024102810/Ken', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2303, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024103807/Andy', '2017-10-26 09:02:21', 0);
INSERT INTO `tbl_pack_path` VALUES (2304, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024105517/XiaoYi', '2017-10-26 09:02:23', 0);
INSERT INTO `tbl_pack_path` VALUES (2305, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024112402/TT_GuYan', '2017-10-26 09:02:28', 0);
INSERT INTO `tbl_pack_path` VALUES (2306, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024134834/TT_ZhongWenYuan', '2017-10-26 09:02:28', 0);
INSERT INTO `tbl_pack_path` VALUES (2307, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024120100/TT_GuYan', '2017-10-26 09:02:31', 0);
INSERT INTO `tbl_pack_path` VALUES (2308, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024135140/TT_ZhongWenYuan', '2017-10-26 09:02:31', 0);
INSERT INTO `tbl_pack_path` VALUES (2309, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024135334/TT_ZhongWenYuan', '2017-10-26 09:02:31', 0);
INSERT INTO `tbl_pack_path` VALUES (2310, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024135608/TT_ZhongWenYuan', '2017-10-26 09:02:31', 0);
INSERT INTO `tbl_pack_path` VALUES (2311, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024135804/TT_ZhongWenYuan', '2017-10-26 09:02:31', 0);
INSERT INTO `tbl_pack_path` VALUES (2312, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024140005/TT_ZhongWenYuan', '2017-10-26 09:02:31', 0);
INSERT INTO `tbl_pack_path` VALUES (2313, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024113300/XiaoYi', '2017-10-26 09:02:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2314, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024140145/TT_ZhongWenYuan', '2017-10-26 09:02:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2315, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024145536/TT_ZhongWenYuan', '2017-10-26 09:02:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2316, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024150825/TT_BoLunRui', '2017-10-26 09:02:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2317, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171024160706/TT_ZhongWenYuan', '2017-10-26 09:02:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2318, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171024161245/TT_ZhongWenYuan', '2017-10-26 09:02:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2319, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024155432/TT_ZhongWenYuan', '2017-10-26 09:02:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2320, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024155752/TT_WangXiaoCan', '2017-10-26 09:02:34', 0);
INSERT INTO `tbl_pack_path` VALUES (2321, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024161700/XiaoYi', '2017-10-26 09:02:36', 0);
INSERT INTO `tbl_pack_path` VALUES (2322, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024170403/TT_HuangShaoHai', '2017-10-26 09:02:37', 0);
INSERT INTO `tbl_pack_path` VALUES (2323, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024175740/TT_GuYan', '2017-10-26 09:02:37', 0);
INSERT INTO `tbl_pack_path` VALUES (2324, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024164009/TT_WangXiaoCan', '2017-10-26 09:02:38', 0);
INSERT INTO `tbl_pack_path` VALUES (2325, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024180042/TT_HuangShaoHai', '2017-10-26 09:02:38', 0);
INSERT INTO `tbl_pack_path` VALUES (2326, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024184636/TT_HuangShaoHai', '2017-10-26 09:02:38', 0);
INSERT INTO `tbl_pack_path` VALUES (2327, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024190648/TT_ZhongWenYuan', '2017-10-26 09:02:38', 0);
INSERT INTO `tbl_pack_path` VALUES (2328, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024182508/TT_GuYan', '2017-10-26 09:02:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2329, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024193202/TT_ZhongWenYuan', '2017-10-26 09:02:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2330, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024183907/TT_WangXiaoCan', '2017-10-26 09:02:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2331, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171024201241/Ben', '2017-10-26 09:02:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2332, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171024214557/TT_BoLunRui', '2017-10-26 09:02:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2333, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025105742/TT_ZhongWenYuan', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2334, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025113345/TT_HuangShaoHai', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2335, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025112554/TT_ZhongWenYuan', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2336, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025115957/TT_HuangShaoHai', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2337, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025124152/TT_HuangShaoHai', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2338, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025125323/TT_WangXiaoCan', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2339, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025141517/XiaoYi', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2340, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025140826/TT_ZhongWenYuan', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2341, 20, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025144826/Ranger', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2342, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025141913/Ken', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2343, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025150408/XiaoYi', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2344, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171025151141/TT_WangXiaoCan', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2345, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025152729/XiaoYi', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2346, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171025154924/Ben', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2347, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025155511/Ben', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2348, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025155629/Ben', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2349, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025151310/Ken', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2350, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025163344/Ken', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2351, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025172116/Ben', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2352, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025173149/Ben', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2353, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025180117/TT_BoLunRui', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2354, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171025181008/Ken', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2355, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171025184343/Ken', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2356, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025190344/Andy', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2357, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025190706/Andy', '2017-10-27 09:12:12', 0);
INSERT INTO `tbl_pack_path` VALUES (2358, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025190557/Ken', '2017-10-27 09:12:13', 0);
INSERT INTO `tbl_pack_path` VALUES (2359, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171025191820/Ken', '2017-10-27 09:12:13', 0);
INSERT INTO `tbl_pack_path` VALUES (2360, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026090241/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2361, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026093711/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2362, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026110214/Ben', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2363, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026113301/Andy', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2364, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026134753/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2365, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171026145250/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2366, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026150229/TT_HuangShaoHai', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2367, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026150916/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2368, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171026152735/TT_GuYan', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2369, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026153334/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2370, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026154701/TT_ZhongWenYuan', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2371, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026154900/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2372, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171026160115/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2373, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026163300/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2374, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026163734/Ken', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2375, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026163857/TT_ZhongWenYuan', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2376, 20, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026171409/Ranger', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2377, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171026172205/XiaoYi', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2378, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026170827/TT_ZhongWenYuan', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2379, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026174413/TT_BoLunRui', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2380, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026174946/XiaoYi', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2381, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171026180809/TT_BoLunRui', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2382, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171026182743/Andy', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2383, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026183630/Andy', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2384, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171026184012/XiaoYi', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2385, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026184708/TT_BoLunRui', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2386, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026184714/Andy', '2017-10-28 11:21:46', 0);
INSERT INTO `tbl_pack_path` VALUES (2387, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026192832/TT_WangXiaoCan', '2017-10-28 11:21:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2388, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026193352/TT_WangXiaoCan', '2017-10-28 11:21:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2389, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171026201603/Ken', '2017-10-28 11:21:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2390, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026203255/Ken', '2017-10-28 11:21:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2391, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171026204645/Ken', '2017-10-28 11:21:47', 0);
INSERT INTO `tbl_pack_path` VALUES (2392, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027091213/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2393, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027093610/TT_WangXiaoCan', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2394, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027094232/TT_WangXiaoCan', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2395, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171027095037/XiaoYi', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2396, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171027103101/Ken', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2397, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171027110103/Ken', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2398, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027111445/TT_BoLunRui', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2399, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171027112053/Ken', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2400, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027112830/XiaoYi', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2401, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171027114134/Ken', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2402, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171027114104/XiaoYi', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2403, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027114637/TT_BoLunRui', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2404, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027122905/TT_ZhongWenYuan', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2405, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171027125822/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2406, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027140805/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2407, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027143938/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2408, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027144301/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2409, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027145459/TT_WangXiaoCan', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2410, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027145536/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2411, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027161711/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2412, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027165546/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2413, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027171911/TT_BoLunRui', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2414, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027174236/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2415, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027174937/TT_BoLunRui', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2416, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027175230/TT_BoLunRui', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2417, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171027193258/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2418, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171027193712/Andy', '2017-10-30 10:22:10', 0);
INSERT INTO `tbl_pack_path` VALUES (2419, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171028112147/Andy', '2017-10-30 10:22:11', 0);
INSERT INTO `tbl_pack_path` VALUES (2420, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171028113051/TT_BoLunRui', '2017-10-30 10:22:11', 0);
INSERT INTO `tbl_pack_path` VALUES (2421, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030102211/TT_ZhongWenYuan', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2422, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030110349/TT_BoLunRui', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2423, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030114441/Andy', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2424, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171030143610/Ken', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2425, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171030143650/Ken', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2426, 23, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171030150352/TT_ZhouWeiFeng', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2427, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030151517/Ben', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2428, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030153848/Ben', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2429, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030155005/Andy', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2430, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030155019/TT_BoLunRui', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2431, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030160026/XiaoYi', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2432, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171030162215/Andy', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2433, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030163624/TT_HuangShaoHai', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2434, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171030165216/TT_BoLunRui', '2017-11-01 09:12:43', 0);
INSERT INTO `tbl_pack_path` VALUES (2435, 33, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171030235324/td_linzhihua', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2436, 33, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031091220/td_linzhihua', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2437, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171031092906/Ben', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2438, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031093113/Ben', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2439, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031110854/Ken', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2440, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031112823/TT_BoLunRui', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2441, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031112945/TT_BoLunRui', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2442, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031154214/XiaoYi', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2443, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171031155630/TT_BoLunRui', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2444, 23, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171031161606/TT_ZhouWeiFeng', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2445, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031180159/TT_BoLunRui', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2446, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031182722/TT_BoLunRui', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2447, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031184156/TT_BoLunRui', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2448, 31, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031192114/TT_HuangShaoHai', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2449, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031192129/TT_BoLunRui', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2450, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171031205424/TT_BoLunRui', '2017-11-02 09:14:48', 0);
INSERT INTO `tbl_pack_path` VALUES (2451, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101091243/Ben', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2452, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101102158/TT_BoLunRui', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2453, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101102755/TT_BoLunRui', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2454, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101104743/Ben', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2455, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101112120/XiaoYi', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2456, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101150156/Ben', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2457, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101163953/TT_BoLunRui', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2458, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101170541/Ben', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2459, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101174647/TT_BoLunRui', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2460, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101180601/TT_BoLunRui', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2461, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101182801/Ben', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2462, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171101184900/TT_BoLunRui', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2463, 9, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171101190141/Ken', '2017-11-03 09:18:27', 0);
INSERT INTO `tbl_pack_path` VALUES (2464, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171102091448/Ben', '2017-11-04 22:44:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2465, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171102094124/XiaoYi', '2017-11-04 22:44:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2466, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171102094854/Ben', '2017-11-04 22:44:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2467, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171102102021/XiaoYi', '2017-11-04 22:44:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2468, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171102112505/XiaoYi', '2017-11-04 22:44:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2469, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171102113304/Ben', '2017-11-04 22:44:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2470, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171102144210/Ben', '2017-11-04 22:44:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2471, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171102151937/XiaoYi', '2017-11-04 22:44:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2472, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103091827/XiaoYi', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2473, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103095308/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2474, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103100403/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2475, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103100532/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2476, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103101457/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2477, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103111020/XiaoYi', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2478, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103142613/TT_BoLunRui', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2479, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103150510/TT_WangXiaoCan', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2480, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103160002/TT_BoLunRui', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2481, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103161502/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2482, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171103165050/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2483, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103175017/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2484, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103175536/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2485, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103175758/Andy', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2486, 20, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103230609/Ranger', '2017-11-05 09:54:22', 0);
INSERT INTO `tbl_pack_path` VALUES (2487, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171103231403/Ben', '2017-11-05 09:54:23', 0);
INSERT INTO `tbl_pack_path` VALUES (2488, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171104224422/XiaoYi', '2017-11-06 09:54:30', 0);
INSERT INTO `tbl_pack_path` VALUES (2489, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171105100200/TT_ZhongWenYuan', '2017-11-07 09:38:40', 0);
INSERT INTO `tbl_pack_path` VALUES (2490, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171105101009/TT_ZhongWenYuan', '2017-11-07 09:38:40', 0);
INSERT INTO `tbl_pack_path` VALUES (2491, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171105104309/TT_ZhongWenYuan', '2017-11-07 09:38:40', 0);
INSERT INTO `tbl_pack_path` VALUES (2492, 33, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106095430/td_linzhihua', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2493, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106103834/TT_BoLunRui', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2494, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106105622/Ben', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2495, 23, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106112146/TT_ZhouWeiFeng', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2496, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171106131528/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2497, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106133355/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2498, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106135001/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2499, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171106135453/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2500, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171106140907/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2501, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106143007/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2502, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171106142939/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2503, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106142247/TT_ZhongWenYuan', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2504, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106144406/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2505, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106144929/Ben', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2506, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106144820/TT_ZhongWenYuan', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2507, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106151707/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2508, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106151705/TT_ZhongWenYuan', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2509, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106154953/TT_ZhongWenYuan', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2510, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106155412/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2511, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106155910/Ben', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2512, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106160713/Andy', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2513, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106160928/Andy', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2514, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106170642/Ben', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2515, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171106172100/TT_BoLunRui', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2516, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171106172446/Andy', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2517, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106172505/Andy', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2518, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106172452/XiaoYi', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2519, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171106183610/Andy', '2017-11-08 09:37:53', 0);
INSERT INTO `tbl_pack_path` VALUES (2520, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107093840/TT_BoLunRui', '2017-11-07 09:40:44', 1);
INSERT INTO `tbl_pack_path` VALUES (2521, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107093939/Andy', '2018-07-23 10:55:13', 0);
INSERT INTO `tbl_pack_path` VALUES (2522, 24, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171107094606/TT_BoLunRui', '2017-11-07 09:48:09', 1);
INSERT INTO `tbl_pack_path` VALUES (2523, 30, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107094853/TT_GuYan', '2017-11-07 09:49:04', 1);
INSERT INTO `tbl_pack_path` VALUES (2524, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107094626/Ben', '2019-01-17 10:34:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2525, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107095353/TT_WangXiaoCan', '2017-11-07 09:55:37', 1);
INSERT INTO `tbl_pack_path` VALUES (2526, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171107100443/TT_WangXiaoCan', '2017-11-07 10:06:29', 1);
INSERT INTO `tbl_pack_path` VALUES (2527, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107104218/TT_WangXiaoCan', '2017-11-07 10:42:32', 1);
INSERT INTO `tbl_pack_path` VALUES (2528, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107105507/XiaoYi', '2017-11-07 11:00:53', 1);
INSERT INTO `tbl_pack_path` VALUES (2529, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107111458/XiaoYi', '2017-11-07 11:16:56', 1);
INSERT INTO `tbl_pack_path` VALUES (2530, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107140839/Ben', '2019-01-17 10:34:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2531, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171107141304/XiaoYi', '2017-11-07 14:14:31', 1);
INSERT INTO `tbl_pack_path` VALUES (2532, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107144751/XiaoYi', '2017-11-07 14:51:43', 1);
INSERT INTO `tbl_pack_path` VALUES (2533, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171107152053/XiaoYi', '2017-11-07 15:22:30', 1);
INSERT INTO `tbl_pack_path` VALUES (2534, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107155253/XiaoYi', '2017-11-07 15:54:41', 1);
INSERT INTO `tbl_pack_path` VALUES (2535, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/other/20171107160953/XiaoYi', '2017-11-07 16:11:30', 1);
INSERT INTO `tbl_pack_path` VALUES (2536, 20, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107162958/Ranger', '2017-11-07 16:29:59', 1);
INSERT INTO `tbl_pack_path` VALUES (2537, 1, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107164727/Andy', '2018-07-23 10:55:13', 0);
INSERT INTO `tbl_pack_path` VALUES (2538, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107174444/TT_ZhongWenYuan', '2017-11-07 17:46:12', 1);
INSERT INTO `tbl_pack_path` VALUES (2539, 25, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107174936/TT_ZhongWenYuan', '2017-11-07 17:49:37', 1);
INSERT INTO `tbl_pack_path` VALUES (2540, 3, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107184740/Ben', '2019-01-17 10:34:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2541, 34, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171107205347/TT_WangXiaoCan', '2017-11-07 20:55:37', 1);
INSERT INTO `tbl_pack_path` VALUES (2542, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171108093753/XiaoYi', '2017-11-08 10:41:43', 1);
INSERT INTO `tbl_pack_path` VALUES (2543, 17, '/Users/sj_android/TomcatResource/SJoy_pack_online/pack/main/20171108142906/XiaoYi', '2017-11-08 14:32:10', 1);
INSERT INTO `tbl_pack_path` VALUES (2544, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/other/20180726185353/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2545, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/other/20180726191555/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2546, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/other/20180726193132/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2547, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/other/20180727115340/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2548, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/main/20180727122719/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2549, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/main/20180727123119/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2550, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/main/20180727123246/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2551, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/main/20180727152444/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2552, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/main/20180727152958/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2553, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/main/20180727153259/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2554, 1, '/Users/smalli/TomcatResource/Feimiao_pack_online/pack/main/20180727171708/tenglili', '2019-01-17 10:21:00', 0);
INSERT INTO `tbl_pack_path` VALUES (2555, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190117102100/oudongbo', '2019-01-23 09:58:25', 0);
INSERT INTO `tbl_pack_path` VALUES (2556, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190117103400/oudongbo', '2019-01-23 09:58:25', 0);
INSERT INTO `tbl_pack_path` VALUES (2557, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190117104823/oudongbo', '2019-01-23 09:58:25', 0);
INSERT INTO `tbl_pack_path` VALUES (2558, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190117111252/oudongbo', '2019-01-23 09:58:25', 0);
INSERT INTO `tbl_pack_path` VALUES (2559, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190117113810/oudongbo', '2019-01-23 09:58:25', 0);
INSERT INTO `tbl_pack_path` VALUES (2560, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190123095825/oudongbo', '2019-01-25 16:53:39', 0);
INSERT INTO `tbl_pack_path` VALUES (2561, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190125165339/oudongbo', '2019-07-30 15:11:31', 0);
INSERT INTO `tbl_pack_path` VALUES (2562, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190125180442/oudongbo', '2019-07-30 15:11:31', 0);
INSERT INTO `tbl_pack_path` VALUES (2563, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190730151131/oudongbo', '2019-08-01 10:06:23', 0);
INSERT INTO `tbl_pack_path` VALUES (2564, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190730153629/oudongbo', '2019-08-01 10:06:23', 0);
INSERT INTO `tbl_pack_path` VALUES (2565, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190730161101/oudongbo', '2019-08-01 10:06:23', 0);
INSERT INTO `tbl_pack_path` VALUES (2566, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190730161715/oudongbo', '2019-08-01 10:06:23', 0);
INSERT INTO `tbl_pack_path` VALUES (2567, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190730163813/oudongbo', '2019-08-01 10:06:23', 0);
INSERT INTO `tbl_pack_path` VALUES (2568, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190731122553/oudongbo', '2019-08-02 10:30:15', 0);
INSERT INTO `tbl_pack_path` VALUES (2569, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190731144818/oudongbo', '2019-08-02 10:30:15', 0);
INSERT INTO `tbl_pack_path` VALUES (2570, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801100623/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2571, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801112920/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2572, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801155141/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2573, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801155703/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2574, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801163803/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2575, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801163934/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2576, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801165042/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2577, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801165359/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2578, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801170505/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2579, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190801185600/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2580, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802103015/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2581, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802103721/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2582, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802104538/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2583, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802121724/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2584, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802121819/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2585, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802122012/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2586, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802122104/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2587, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802122520/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2588, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802122807/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2589, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802142243/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2590, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802142920/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2591, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802143120/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2592, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802143403/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2593, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802144519/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2594, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802145201/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2595, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802145702/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2596, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802152722/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2597, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802153245/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2598, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802153823/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2599, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802154113/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2600, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802154544/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2601, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802155007/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2602, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802160014/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2603, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802160757/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2604, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802162010/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2605, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802162952/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2606, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802163504/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2607, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802171002/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2608, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802171105/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2609, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802180144/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2610, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802180609/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2611, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802180716/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2612, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802180807/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2613, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802182849/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2614, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802184000/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2615, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190802184242/oudongbo', '2019-08-13 13:06:49', 0);
INSERT INTO `tbl_pack_path` VALUES (2616, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813130649/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2617, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813173311/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2618, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813173503/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2619, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813173648/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2620, 7, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813173956/chenzehui', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2621, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190813175346/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2622, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813175542/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2623, 7, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813175648/chenzehui', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2624, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190813181331/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2625, 7, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813181527/chenzehui', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2626, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190813181644/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2627, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190814142308/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2628, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190814152347/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2629, 7, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190814153333/chenzehui', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2630, 7, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190814165312/chenzehui', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2631, 2, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/main/20190814174137/oudongbo', '2019-08-22 18:38:41', 0);
INSERT INTO `tbl_pack_path` VALUES (2632, 7, '/Users/mayauc.com/TomcatResource/Leidong_pack_online/pack/other/20190822183841/chenzehui', '2019-08-22 18:39:01', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_pack_tool
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pack_tool`;
CREATE TABLE `tbl_pack_tool` (
  `packToolId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '打包工具Id',
  `packToolName` varchar(128) NOT NULL COMMENT '打包工具名称',
  `packToolFileName` varchar(128) NOT NULL COMMENT '打包工具文件名',
  `packToolCreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0' COMMENT '0表示删除 1表示活跃',
  PRIMARY KEY (`packToolId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_pack_tool
-- ----------------------------
BEGIN;
INSERT INTO `tbl_pack_tool` VALUES (3, '渠道打包工具', 'pack_cch', '2017-05-08 12:21:23', 1);
INSERT INTO `tbl_pack_tool` VALUES (4, '通用功能打包工具', 'pack_common', '2017-05-08 12:21:55', 1);
INSERT INTO `tbl_pack_tool` VALUES (5, '广告推广包打包工具', 'pack_md', '2017-05-08 12:22:25', 1);
INSERT INTO `tbl_pack_tool` VALUES (6, '压缩包打包工具', 'pack_zip', '2017-05-08 12:23:09', 1);
INSERT INTO `tbl_pack_tool` VALUES (7, '图标合并工具', 'tool_icon', '2017-05-08 12:23:37', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_pack_tool_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pack_tool_record`;
CREATE TABLE `tbl_pack_tool_record` (
  `ptRecordId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '打包工具记录id',
  `packToolId` bigint(20) NOT NULL COMMENT '打包工具Id',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `ptRecordUpPath` text NOT NULL COMMENT '打包工具记录工具上传路径',
  `ptRecordUpDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '打包工具记录更新日期',
  `ptRecordUpDesc` text COMMENT '打包工具记录更新说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '0表示删除 1表示活跃',
  PRIMARY KEY (`ptRecordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sdk
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sdk`;
CREATE TABLE `tbl_sdk` (
  `sdkId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sdk唯一标识',
  `_cchId` bigint(20) NOT NULL COMMENT '渠道id',
  `sdkSystem` tinyint(1) DEFAULT NULL COMMENT 'sdk所属系统(1代表安卓, 2代表iOS)',
  `sdkCreateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'sdk创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态(0表示删除 1表示活跃)',
  PRIMARY KEY (`sdkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sdk_ios
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sdk_ios`;
CREATE TABLE `tbl_sdk_ios` (
  `sdkId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sdk唯一标识',
  `sdkName` varchar(128) NOT NULL COMMENT 'sdk名称',
  `sdkCchId` varchar(64) NOT NULL COMMENT 'sdk所属渠道id',
  `sdkCreateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'sdk创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态(0表示删除 1表示活跃)',
  PRIMARY KEY (`sdkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sdk_ios_oversea
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sdk_ios_oversea`;
CREATE TABLE `tbl_sdk_ios_oversea` (
  `sdkId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sdk唯一标识',
  `sdkName` varchar(128) NOT NULL COMMENT 'sdk名称',
  `sdkCchId` varchar(64) NOT NULL COMMENT 'sdk所属渠道id',
  `sdkCreateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'sdk创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态(0表示删除 1表示活跃)',
  PRIMARY KEY (`sdkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sdk_oversea
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sdk_oversea`;
CREATE TABLE `tbl_sdk_oversea` (
  `sdkId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sdk唯一标识',
  `_cchId` bigint(20) DEFAULT NULL COMMENT '渠道id',
  `sdkSystem` tinyint(1) DEFAULT NULL COMMENT 'sdk所属系统(1代表安卓, 2代表iOS)',
  `sdkCreateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'sdk创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态(0表示删除 1表示活跃)',
  PRIMARY KEY (`sdkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sdk_version
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sdk_version`;
CREATE TABLE `tbl_sdk_version` (
  `sdkVerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sdk版本id',
  `sdkId` bigint(20) NOT NULL COMMENT 'sdk唯一标识符',
  `userId` bigint(20) NOT NULL COMMENT '用户id',
  `sdkVerName` varchar(128) NOT NULL COMMENT 'sdk版本名',
  `sdkVerUpDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'sdk版本更新时间',
  `sdkVerUpDesc` text COMMENT 'sdk版本更新说明',
  `sdkVerUpPath` text COMMENT 'sdk版本上传路径',
  `isNew` tinyint(1) DEFAULT '0' COMMENT '是否为最新',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态(0表示删除 1表示活跃)',
  PRIMARY KEY (`sdkVerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sdk_version_ios
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sdk_version_ios`;
CREATE TABLE `tbl_sdk_version_ios` (
  `sdkVerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sdk版本id',
  `sdkId` bigint(20) NOT NULL COMMENT 'sdk唯一标识符',
  `userId` bigint(20) NOT NULL COMMENT '用户id',
  `sdkVerName` varchar(128) NOT NULL COMMENT 'sdk版本名',
  `sdkVerUpDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'sdk版本更新时间',
  `sdkVerUpDesc` text COMMENT 'sdk版本更新说明',
  `sdkVerUpPath` text COMMENT 'sdk版本上传路径',
  `isNew` tinyint(1) DEFAULT '0' COMMENT '是否为最新',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态(0表示删除 1表示活跃)',
  PRIMARY KEY (`sdkVerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sdk_version_ios_oversea
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sdk_version_ios_oversea`;
CREATE TABLE `tbl_sdk_version_ios_oversea` (
  `sdkVerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sdk版本id',
  `sdkId` bigint(20) NOT NULL COMMENT 'sdk唯一标识符',
  `userId` bigint(20) NOT NULL COMMENT '用户id',
  `sdkVerName` varchar(128) NOT NULL COMMENT 'sdk版本名',
  `sdkVerUpDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'sdk版本更新时间',
  `sdkVerUpDesc` text COMMENT 'sdk版本更新说明',
  `sdkVerUpPath` text COMMENT 'sdk版本上传路径',
  `isNew` tinyint(1) DEFAULT '0' COMMENT '是否为最新',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态(0表示删除 1表示活跃)',
  PRIMARY KEY (`sdkVerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sdk_version_oversea
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sdk_version_oversea`;
CREATE TABLE `tbl_sdk_version_oversea` (
  `sdkVerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sdk版本id',
  `sdkId` bigint(20) NOT NULL COMMENT 'sdk唯一标识符',
  `userId` bigint(20) NOT NULL COMMENT '用户id',
  `sdkVerName` varchar(128) NOT NULL COMMENT 'sdk版本名',
  `sdkVerUpDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'sdk版本更新时间',
  `sdkVerUpDesc` text COMMENT 'sdk版本更新说明',
  `sdkVerUpPath` text COMMENT 'sdk版本上传路径',
  `isNew` tinyint(1) DEFAULT '0' COMMENT '是否为最新',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态(0表示删除 1表示活跃)',
  PRIMARY KEY (`sdkVerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户标识',
  `userGroupId` int(11) NOT NULL COMMENT '用户组标识',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `realname` varchar(128) NOT NULL COMMENT '姓名',
  `mobile` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  `userDesc` text COMMENT '用户详情',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态(0表示不可用 1表示可用)',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `AK_UnqUsername` (`username`) USING BTREE,
  KEY `FK_ReferenceUserGroupId` (`userGroupId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
BEGIN;
INSERT INTO `tbl_user` VALUES (2, 1, 'oudongbo', '123456', '欧东波', '', '', NULL, '2018-06-29 18:44:35', 1);
INSERT INTO `tbl_user` VALUES (3, 2, 'hanxiaoyan', '123456', '韩孝岩', '', '', NULL, '2019-01-17 10:26:05', 1);
INSERT INTO `tbl_user` VALUES (4, 2, 'wuwenhao', 'yanxiang', '伍文晧', '', '', NULL, '2019-01-17 10:26:49', 1);
INSERT INTO `tbl_user` VALUES (5, 2, 'liuxiaodong', '123456', '刘晓东', '', '', NULL, '2019-01-17 10:27:31', 1);
INSERT INTO `tbl_user` VALUES (6, 2, 'gujingwei', '123456', '古竟维', '', '', NULL, '2019-07-31 15:53:36', 1);
INSERT INTO `tbl_user` VALUES (7, 2, 'chenzehui', '9524789', '陈泽晖', '', '', NULL, '2019-08-05 14:16:03', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_group`;
CREATE TABLE `tbl_user_group` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组标识',
  `companyId` int(11) NOT NULL COMMENT '公司Id',
  `groupName` varchar(128) NOT NULL COMMENT '用户组名称',
  `groupMenus` text COMMENT '用户组菜单权限',
  `groupActs` text COMMENT '用户组操作权限',
  `groupDesc` text COMMENT '用户组说明',
  `groupOwnId` int(11) NOT NULL COMMENT '用户组主人标识',
  `groupCreateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '用户组创建时间',
  `groupSuperManager` tinyint(1) DEFAULT '0' COMMENT '是否为超级管理员(1 是 0 不是)',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态(0表示不可用 1表示可用)',
  PRIMARY KEY (`groupId`),
  KEY `FK_ReferenceCompanyId1` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of tbl_user_group
-- ----------------------------
BEGIN;
INSERT INTO `tbl_user_group` VALUES (1, 1, '技术组', '1,2,3,10,12,13,16,23,25,30,35,39,43,45,47,51,53,55,64', '4,5,8,9,11,14,15,16,17,18,19,20,21,22,24,25,26,27,28,29,31,32,33,34,35,36,37,38,40,41,42,44,46,48,49,50,52,54,56,57,58,59,60,61,62,63,65', '技术组', 0, '2016-12-29 17:20:22', 1, 1);
INSERT INTO `tbl_user_group` VALUES (2, 1, '运营组', '10,13,23,25,30,35,39,43,45,47,51,53', '11,14,24,25,26,27,28,29,31,32,33,34,35,36,37,38,40,41,42,44,46,48,49,52,54', '运营组', 0, '2017-02-16 12:10:11', 1, 1);
INSERT INTO `tbl_user_group` VALUES (3, 1, '商务组', '12,16', '15,17', '商务组', 0, '2017-04-06 15:39:50', 0, 1);
INSERT INTO `tbl_user_group` VALUES (4, 1, '产品组', '1,2,3,10,12,13,16,23,25,30,35,39,43,45,47,51,53,55,64', '4,5,8,9,11,14,15,16,17,18,19,20,21,22,24,25,26,27,28,29,31,32,33,34,35,36,37,38,40,41,42,44,46,48,49,50,52,54,56,57,58,59,60,61,62,63,65', '产品组', 0, '2017-04-06 18:21:07', 0, 1);
INSERT INTO `tbl_user_group` VALUES (5, 1, '支撑组', '10,13,23,25,39,43,45,47', '11,14,24,25,26,27,28,29,38,41,42,44,46,48,49', '支撑组,  打包权限，游戏管理，打包记录\r\n', 0, '2017-04-14 14:14:56', 0, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
