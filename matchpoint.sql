/*
SQLyog Ultimate v9.10 
MySQL - 5.7.20-log : Database - matchpoint_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`matchpoint_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `matchpoint_db`;

/*Table structure for table `mp_activityassistunit` */

DROP TABLE IF EXISTS `mp_activityassistunit`;

CREATE TABLE `mp_activityassistunit` (
  `AssistUnitID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '协助单位ID',
  `ActivityGUID` varchar(50) NOT NULL COMMENT '赛事活动标识',
  `UnitName` varchar(200) NOT NULL COMMENT '协助单位名称',
  `DelStatus` int(11) NOT NULL COMMENT '删除状态（0=正常，1=删除）',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`AssistUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mp_activitycomment` */

DROP TABLE IF EXISTS `mp_activitycomment`;

CREATE TABLE `mp_activitycomment` (
  `ActivityCommentID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动评论ID',
  `ActivityGUID` varchar(50) NOT NULL COMMENT '赛事活动标识',
  `UserName` varchar(100) NOT NULL COMMENT '用户名',
  `Content` varchar(500) NOT NULL COMMENT '评论内容',
  `CreateOn` datetime NOT NULL,
  `LastestUpdate` datetime NOT NULL,
  PRIMARY KEY (`ActivityCommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mp_activitycontacts` */

DROP TABLE IF EXISTS `mp_activitycontacts`;

CREATE TABLE `mp_activitycontacts` (
  `ActivityContactId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityContactGuid` varchar(36) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL COMMENT '所属人，竞赛归属人',
  `ContactName` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `Tel` varchar(50) DEFAULT NULL,
  `QQ` varchar(50) DEFAULT NULL,
  `Weibo` varchar(50) DEFAULT NULL,
  `Weixin` varchar(50) DEFAULT NULL,
  `QRCode` varchar(200) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Note` varchar(500) DEFAULT NULL,
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ActivityContactId`),
  KEY `PK_ActivityContactGuid` (`ActivityContactGuid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_activitylikelog` */

DROP TABLE IF EXISTS `mp_activitylikelog`;

CREATE TABLE `mp_activitylikelog` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '账户',
  `ActivityGUID` varchar(50) NOT NULL COMMENT '赞的活动',
  `LikeStatus` int(11) NOT NULL COMMENT '赞的状态：1=赞，0=取消赞',
  `CreateOn` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mp_ad_keyword` */

DROP TABLE IF EXISTS `mp_ad_keyword`;

CREATE TABLE `mp_ad_keyword` (
  `AdKeywordId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一Id',
  `AdKeywordGuid` varchar(38) NOT NULL COMMENT '不可作为唯一Id，只用于和试题进行关联',
  `PaperGuid` varchar(38) NOT NULL COMMENT '所属试卷Id',
  `Adtype` smallint(6) NOT NULL COMMENT '广告类别：1~8，具体参考需求文档',
  `Keyword` varchar(40) DEFAULT NULL COMMENT '关键词',
  `WebAdditionalProperty` varchar(500) DEFAULT NULL COMMENT 'web附加属性',
  `WapAdditionalProperty` varchar(500) DEFAULT NULL COMMENT 'wap附加属性',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `QuestionType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '试题类型： 0:试卷试题 1：赛前练习上传试题',
  PRIMARY KEY (`AdKeywordId`)
) ENGINE=InnoDB AUTO_INCREMENT=109987 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_bindtel` */

DROP TABLE IF EXISTS `mp_bindtel`;

CREATE TABLE `mp_bindtel` (
  `BindID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '用户名',
  `ActionType` int(11) NOT NULL COMMENT '1:绑定，2:解绑',
  `Tel` varchar(20) NOT NULL COMMENT '手机号',
  `CreateOn` datetime NOT NULL,
  PRIMARY KEY (`BindID`),
  KEY `IDX_UserName_ActionType` (`UserName`,`ActionType`),
  KEY `IDX_Tel_ActionType` (`ActionType`,`Tel`)
) ENGINE=InnoDB AUTO_INCREMENT=4817 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_categorydic` */

DROP TABLE IF EXISTS `mp_categorydic`;

CREATE TABLE `mp_categorydic` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` smallint(6) NOT NULL DEFAULT '0' COMMENT '类型 1：期刊 2：编客 3：图书',
  `SSXSecCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '赛事二级分类编码',
  `SSXSecName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '赛事二级分类名称',
  `TargetCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '对应的分类编码',
  `TargetName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '对应的分类名称',
  `TargetLevel` smallint(6) NOT NULL DEFAULT '0' COMMENT '对应的分类级别',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `mp_challenge_webchatuser` */

DROP TABLE IF EXISTS `mp_challenge_webchatuser`;

CREATE TABLE `mp_challenge_webchatuser` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `WXNickName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '微信昵称',
  `WXHeadimgurl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '微信头像url',
  `Openid` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '加密后的openid',
  `PaperId` int(10) DEFAULT NULL COMMENT '试卷ID',
  `CreateOn` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_clicklike` */

DROP TABLE IF EXISTS `mp_clicklike`;

CREATE TABLE `mp_clicklike` (
  `LikeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '点赞的用户名',
  `LikeType` int(11) NOT NULL DEFAULT '0' COMMENT '赞的对象：1：Activity,2:Paper,3:Question',
  `LikeGuid` varchar(60) NOT NULL COMMENT '赞的对象的GUID',
  `LikeTitle` varchar(2000) NOT NULL COMMENT '赞的对象的标题',
  `DelStatus` int(11) NOT NULL DEFAULT '0' COMMENT '0：未删除，1：删除',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期时间',
  PRIMARY KEY (`LikeID`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_commentdictionary` */

DROP TABLE IF EXISTS `mp_commentdictionary`;

CREATE TABLE `mp_commentdictionary` (
  `CommentDicID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CommentDicCode` varchar(50) NOT NULL COMMENT '评论关键词编码',
  `Dictionary` varchar(100) NOT NULL COMMENT '评论词',
  `DictionaryStatus` int(11) NOT NULL COMMENT '词性：褒义，贬义，中性',
  `DelStatus` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态：0=正常，1=删除',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`CommentDicID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_companycategory` */

DROP TABLE IF EXISTS `mp_companycategory`;

CREATE TABLE `mp_companycategory` (
  `CompanyCategoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `CompanyCategoryCode` varchar(10) DEFAULT NULL COMMENT '行业编码,企业分类编码',
  `CompanyCategoryName` varchar(200) DEFAULT NULL COMMENT '行业名称,企业分类名称',
  `Level` int(11) DEFAULT NULL COMMENT '层级：1,2,3级，其中1级是最高层级',
  `ParentCode` varchar(10) DEFAULT NULL COMMENT '父节点Code',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`CompanyCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_convertaddress` */

DROP TABLE IF EXISTS `mp_convertaddress`;

CREATE TABLE `mp_convertaddress` (
  `AddressID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ShortAddress` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '短地址',
  `OriginalAddress` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '原始地址',
  `SourceType` int(11) NOT NULL COMMENT '资源类型(1.试卷;2.竞赛;3.URL)',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `Unique` (`ShortAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_erroritempool` */

DROP TABLE IF EXISTS `mp_erroritempool`;

CREATE TABLE `mp_erroritempool` (
  `ErrorItemPoolID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '错题来源试卷标识',
  `UserName` varchar(200) NOT NULL COMMENT '用户名',
  `QuestionGUID` varchar(50) NOT NULL COMMENT '错题的试题标识',
  `DelStatus` int(11) NOT NULL COMMENT '删除状态（0=正常，1=删除）',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ErrorItemPoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mp_examactivity` */

DROP TABLE IF EXISTS `mp_examactivity`;

CREATE TABLE `mp_examactivity` (
  `ActivityID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityGuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '活动标识',
  `PaperGuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '试卷Guid',
  `TradeFirstGenreCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '试题一级行业分类代号',
  `TradeSecondGenreCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '试题二级行业分类代号',
  `TradeThirdGenreCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '试题三级行业分类代号',
  `UserName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '活动举办的用户名(知网用户名)',
  `UserNameCreate` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '竞赛创建人的用户名',
  `UserType` tinyint(4) NOT NULL COMMENT '举办活动的用户的类型：1:个人，2：机构；3：被机构授权的个人',
  `ActivityName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '活动标题',
  `ActivityBriefIntroduction` text COLLATE utf8_bin COMMENT '活动介绍',
  `NewActivityImg` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '活动宣传图（原ExamPaperLogo）',
  `StartTime` datetime DEFAULT NULL COMMENT '活动起始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '活动结束时间',
  `FullScore` int(11) NOT NULL DEFAULT '0' COMMENT '设置的分数（满分）',
  `ExameRestrictType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '答题对象限制类型：1=公开；2=答题密码；3=指定用户名和群组；4=校验用户字段名',
  `LimitTime` int(11) NOT NULL COMMENT '答题限时（单位：秒)0=不限时（考试不限定时间）',
  `AnnounceAnswerStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '试卷公布答案状态设置：0=不公布，1=答题完成立即公布，2=竞赛活动结束公布答案，3=自由设置答案公布时间',
  `AnnounceAnswerDateTime` datetime DEFAULT NULL COMMENT '试卷公布答案时间',
  `AnswerCountLimitStatus` int(11) NOT NULL DEFAULT '0' COMMENT '试卷答题次数限制：0=不限制次数，1=限制1人1次',
  `WelcomePageLogo` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '答题欢迎页面的6个logo图片，用";"分割,图片分类为10',
  `IsVerifyTel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否必须验证手机号码才能答题（1:是，0:不是）',
  `LotteryStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '抽奖功能是否开启(0:未开启,1:开启)',
  `LotteryMode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '抽奖方式(1:手动,2:自动)',
  `ShareTitle` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '分享大标题',
  `ShareSubtitle` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '分享副标题',
  `SharePicture` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '分享图片地址',
  `AnsweredPersonCount` int(11) NOT NULL DEFAULT '0' COMMENT '参与考试的人数',
  `AnsweredTimesCount` int(11) NOT NULL DEFAULT '0' COMMENT '参与考试的次数',
  `IsAllowComment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否允许评论0:不允许1：允许',
  `CommentGrade` int(11) NOT NULL DEFAULT '10' COMMENT '试卷评分（用户对试卷出的好坏的评分的平均分，满分10分）',
  `CommentTotalCount` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总评论数',
  `FavourCommentCount` int(11) NOT NULL DEFAULT '0' COMMENT '试卷好评数',
  `IsShowRealTimeStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示参赛动态：0=不显示，1=显示',
  `IsShowPersonRanking` tinyint(4) NOT NULL DEFAULT '0' COMMENT '展示个人排行榜：0=不展示，1=展示',
  `RankingShowColumns` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '排行榜显示自定义列[{ColumnName:"UserNick":Title"昵称"}]',
  `RankingSplitColumns` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '排行榜分组字段(ColumnName#ColumnGuid)',
  `ChartSetting` varchar(2048) COLLATE utf8_bin DEFAULT NULL COMMENT '个性化统计设置',
  `PublishStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '发布状态：',
  `PublishDateTime` datetime DEFAULT NULL COMMENT '活动发布时间,(现在平台审核通过就是发布，所以平台审核通过时在更新这个字段)',
  `RefuseReason` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '被拒绝理由',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后更新时间',
  `DelStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态：0=正常未删除，1=已删除',
  `AntiCheating` tinyint(4) NOT NULL DEFAULT '0' COMMENT '防作弊次数 0 不限制',
  `OffShelf` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否下架：0=正常，1=下架',
  `IsOpenExercise` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启练习模式 0:未开启 1：已开启',
  `ExerciseQuesSource` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赛前练习题来源 0:默认 1：上传练习题 2：使用试卷试题',
  `ExerciseDisplayForm` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赛前练习题展示方式 0:默认 1:不展示分类 2：按试题栏目分类展示 3：按知识点分类展示',
  `ExerciseForm` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赛前练习模式 0:默认 1:学习模式 2:练习模式 3:学习+练习',
  `SimulatedRaceUrl` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '模拟参赛url 非空:开启 空:关闭',
  `ExerciseMemo` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '赛前练习说明',
  PRIMARY KEY (`ActivityID`),
  KEY `IDX_ActivityGUID` (`ActivityGuid`),
  KEY `IDX_ActivityStartTime` (`StartTime`),
  KEY `IDX_ActivityEndTime` (`EndTime`),
  KEY `IDX_PaperGuid` (`PaperGuid`)
) ENGINE=InnoDB AUTO_INCREMENT=918 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_examineemsg` */

DROP TABLE IF EXISTS `mp_examineemsg`;

CREATE TABLE `mp_examineemsg` (
  `ExamineeMsgID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '考生信息收集Id',
  `ExamineeMsgGUID` varchar(50) NOT NULL COMMENT '考生信息收集标识',
  `ExamineePaperGUID` varchar(50) DEFAULT NULL COMMENT '考生答题试卷标识',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试题Id',
  `ActivityGUID` varchar(50) DEFAULT NULL COMMENT '活动GUID',
  `AttributeA` varchar(512) DEFAULT NULL COMMENT '属性A（规定是6个属性） 是否必须 采用$符号后面加1  有1标识必须  ',
  `AttributeB` varchar(512) DEFAULT NULL,
  `AttributeC` varchar(512) DEFAULT NULL,
  `AttributeD` varchar(512) DEFAULT NULL,
  `AttributeE` varchar(512) DEFAULT NULL,
  `AttributeF` varchar(512) DEFAULT NULL,
  `AttributeG` varchar(256) DEFAULT NULL,
  `AttributeH` varchar(256) DEFAULT NULL,
  `AttributeI` varchar(256) DEFAULT NULL,
  `AttributeJ` varchar(256) DEFAULT NULL,
  `AttributeK` varchar(256) DEFAULT NULL,
  `AttributeL` varchar(256) DEFAULT NULL,
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `CreateUserName` varchar(100) NOT NULL COMMENT '创建人',
  `LastUpdate` datetime NOT NULL COMMENT '更改时间',
  `IsTitle` int(11) NOT NULL DEFAULT '0' COMMENT '是否标题：标题记录标题信息0：用户信息1：标题信息',
  `TitleTip` varchar(100) DEFAULT NULL COMMENT '信息收集标题',
  PRIMARY KEY (`ExamineeMsgID`),
  UNIQUE KEY `IN_ExamineeMsgGUID` (`ExamineeMsgGUID`),
  KEY `IN_ExamPaperGUID` (`ExamPaperGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=8386 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_examineepaperinfo` */

DROP TABLE IF EXISTS `mp_examineepaperinfo`;

CREATE TABLE `mp_examineepaperinfo` (
  `ExamineePaperID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '考生试卷ID',
  `ExamineePaperGUID` varchar(50) NOT NULL COMMENT '考生答题试卷标识（对于可以多次考试的试卷，区分每一次考试的试卷）',
  `ActivityGUID` varchar(50) DEFAULT NULL COMMENT '活动标识',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `ExamType` int(11) NOT NULL DEFAULT '1' COMMENT '试卷类型：1=普通试卷，2=竞赛试卷',
  `UserNameExaminee` varchar(200) NOT NULL COMMENT '考生用户名',
  `ExamineeIP` varchar(50) DEFAULT NULL COMMENT '考生IP地址',
  `IPArea` varchar(100) DEFAULT NULL COMMENT 'Ip所属地域',
  `ExamineeRegion` varchar(200) DEFAULT NULL,
  `ExaminerNick` varchar(200) DEFAULT NULL COMMENT '出题机构名称或者用户的昵称',
  `ExaminerType` int(11) NOT NULL DEFAULT '1' COMMENT '出题人类型：1=个人，2=机构',
  `UserNameExaminer` varchar(200) DEFAULT NULL COMMENT '出题人（个人或者机构）用户名',
  `SubmitMode` int(11) NOT NULL DEFAULT '0' COMMENT '交卷方式：0=未提交，1=到点自动提交，2=主动提交',
  `ExamStatus` int(11) NOT NULL DEFAULT '0' COMMENT '考试状态：0=未开始，1=考试中，2=考试结束',
  `CurrentQuestionGUID` varchar(50) DEFAULT NULL COMMENT '当前正在处理的试题标识',
  `TotalQuestionCount` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总题目数',
  `CorrectTotalCount` int(11) NOT NULL DEFAULT '0' COMMENT '正确题目数',
  `ErrorTotalCount` int(11) NOT NULL DEFAULT '0' COMMENT '错误题目数',
  `IsDisplayScore` int(11) NOT NULL DEFAULT '1' COMMENT '是否可以查看试卷分数（批改完毕，才能查看：0=不能查看，1=可以查看，2=）',
  `StartTime` datetime DEFAULT NULL COMMENT '考试开始时间',
  `SubmitTime` datetime DEFAULT NULL COMMENT '交卷时间',
  `TakeTime` int(11) NOT NULL DEFAULT '0' COMMENT '考试耗时（秒）',
  `IsCompletedMark` int(11) NOT NULL DEFAULT '0' COMMENT '是否完成试卷评分：0=未完成，1=完成自动评分，2=手动评分完成，3=完成评分',
  `AutoScroe` int(11) NOT NULL DEFAULT '0' COMMENT '自动评分得分',
  `ManualScroe` int(11) NOT NULL DEFAULT '0' COMMENT '手动评分得分',
  `FullScore` int(11) NOT NULL DEFAULT '0' COMMENT '试卷满分',
  `UserScore` int(11) NOT NULL DEFAULT '0' COMMENT '用户得分',
  `ScoreLevel` int(11) NOT NULL DEFAULT '4' COMMENT '分数等级（优良中差）1优 2良 3中 4差',
  `Ranking` int(11) NOT NULL DEFAULT '0' COMMENT '总排名',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  `Comment` text,
  `CommentDate` datetime DEFAULT NULL,
  `CommentUserName` varchar(100) DEFAULT NULL,
  `ParticipateNumber` int(11) NOT NULL DEFAULT '0' COMMENT '第几次参加试卷',
  `PaperPublishStatus` int(11) NOT NULL DEFAULT '0' COMMENT '试卷发布的状态（100=个人待提交，110=机构驳回拒绝，120=平台驳回拒绝，200=机构待提交，210=机构待审核，220=平台拒绝，300=个人提交审核，310=机构提交审核，350=提交到测试，400=平台审核通过,500=已发布）',
  `IP_Country` varchar(128) DEFAULT NULL COMMENT 'IP国家',
  `IP_Province` varchar(128) DEFAULT NULL COMMENT 'IP省',
  `IP_City` varchar(128) DEFAULT NULL COMMENT 'IP城市',
  `IsDataToMysql` smallint(6) NOT NULL DEFAULT '0' COMMENT '考题是否从Redis回到Mysql库：0=未回，1=已回库',
  PRIMARY KEY (`ExamineePaperID`),
  KEY `INDEX` (`ExamineePaperGUID`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=33224 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_examineequestions` */

DROP TABLE IF EXISTS `mp_examineequestions`;

CREATE TABLE `mp_examineequestions` (
  `ExamineeQueID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ExamineeQuetionGUID` varchar(50) NOT NULL COMMENT '考生的试题标识',
  `SectionGUID` varchar(50) NOT NULL COMMENT '栏目标识',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `ExamineePaperGUID` varchar(50) NOT NULL COMMENT '考生答题卷标识',
  `QuestionGUID` varchar(50) NOT NULL COMMENT '试题标识',
  `QuestionType` int(11) NOT NULL DEFAULT '1' COMMENT '题型（单选1，多选2，填空3，判断4，简答5）',
  `UserNameExaminee` varchar(300) NOT NULL COMMENT '考生用户名',
  `OptionsTactics` varchar(100) DEFAULT NULL COMMENT '选项随机策略',
  `StandardAnswer` varchar(2000) NOT NULL COMMENT '标准正确答案',
  `SequenceNumber` int(11) NOT NULL DEFAULT '0' COMMENT '试题排序序号',
  `IsHasSign` int(11) NOT NULL DEFAULT '0' COMMENT '是否标记:（0=未标记，1=已标记）',
  `IsAnswered` int(11) NOT NULL DEFAULT '0' COMMENT '是否答过:（0=未答，1=已答）',
  `UserAnswer` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户的答案',
  `CorrectOrNot` int(11) NOT NULL DEFAULT '0' COMMENT '是否正确：0=错误(部分正确)，1=正确',
  `QuestionScore` int(11) NOT NULL DEFAULT '0' COMMENT '本题分值',
  `GainScore` int(11) NOT NULL DEFAULT '0' COMMENT '考生得分',
  `MarkMode` int(11) NOT NULL DEFAULT '0' COMMENT '评分方式：1=自动评分，2=人工评分',
  `IsCompletedMark` int(11) NOT NULL DEFAULT '0' COMMENT '是否完成试题评分：0=未完成，1=已完成',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  `UserNameMark` varchar(300) DEFAULT NULL COMMENT '评分人用户名',
  `MarkDateTime` datetime DEFAULT NULL COMMENT '评分时间',
  `ParticipateNumber` int(11) NOT NULL DEFAULT '0' COMMENT '第几次参加试卷',
  `PaperPublishStatus` int(11) NOT NULL DEFAULT '0' COMMENT '试卷发布的状态（100=个人待提交，110=机构驳回拒绝，120=平台驳回拒绝，200=机构待提交，210=机构待审核，220=平台拒绝，300=个人提交审核，310=机构提交审核，350=提交到测试，400=平台审核通过,500=已发布）',
  `MergeSectionGUID` varchar(50) DEFAULT NULL COMMENT '合并后的栏目标识',
  PRIMARY KEY (`ExamineeQueID`),
  KEY `IDX_AnswereQuestionRight` (`IsAnswered`,`CorrectOrNot`),
  KEY `IDX_ExamQuestionGUID` (`QuestionGUID`),
  KEY `IDX_MarkPaper` (`QuestionType`,`IsAnswered`,`IsCompletedMark`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGUID`),
  KEY `IDX_ExamineePaperGUID` (`ExamineePaperGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=812120 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_examinemsgoption` */

DROP TABLE IF EXISTS `mp_examinemsgoption`;

CREATE TABLE `mp_examinemsgoption` (
  `OptionID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '考生信息收集  信息选项标识',
  `OptionGUID` varchar(50) NOT NULL COMMENT '考生信息收集  信息选项标识',
  `MsgColumnGUID` varchar(50) DEFAULT NULL COMMENT '信息收集列标识',
  `ParentGUID` varchar(50) DEFAULT NULL COMMENT '父级标识',
  `Level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '级别 1：第一级 2：第二级',
  `OptionContent` varchar(200) DEFAULT NULL COMMENT '选项内容',
  PRIMARY KEY (`OptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6715 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_exampapercomment` */

DROP TABLE IF EXISTS `mp_exampapercomment`;

CREATE TABLE `mp_exampapercomment` (
  `CommentID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `CommentGUID` varchar(50) NOT NULL COMMENT '评论标识',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `ActivityGUID` varchar(50) DEFAULT NULL COMMENT '活动GUID',
  `CommentCode` varchar(200) DEFAULT NULL COMMENT '评论词编码（;分隔）',
  `UserName` varchar(200) NOT NULL COMMENT '评论用户名',
  `UserNick` varchar(200) NOT NULL COMMENT '用户昵称',
  `CommentScore` int(11) NOT NULL COMMENT '评论分数',
  `UserIP` varchar(20) DEFAULT NULL COMMENT '用户IP',
  `UserPosition` varbinary(200) DEFAULT NULL COMMENT '用户位置',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`CommentID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_exampaperinfo` */

DROP TABLE IF EXISTS `mp_exampaperinfo`;

CREATE TABLE `mp_exampaperinfo` (
  `ExamPaperID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `ActivityGUID` varchar(50) DEFAULT NULL COMMENT '活动标识',
  `ExamType` int(11) NOT NULL DEFAULT '1' COMMENT '试卷类型：1=普通试卷，2=竞赛试卷',
  `ExamPaperForm` int(11) NOT NULL DEFAULT '1' COMMENT '试卷出题组卷的形态（形式）：1=固定试题，2=随机试题，3=闯关试题',
  `UserNameCreate` varchar(200) NOT NULL COMMENT '试卷创建人的用户名',
  `UserName` varchar(200) DEFAULT NULL COMMENT '试卷归属人的用户名',
  `TotalSection` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总栏目数',
  `TotalQuestion` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总题目数',
  `KnowledgePoint` varchar(500) DEFAULT NULL COMMENT '试卷知识点（每一道题的知识点$$分隔，只用来读取）',
  `PaperPublicityType` int(11) NOT NULL DEFAULT '3' COMMENT '试卷公开类型（1公开，2半公开，3私有）',
  `IsUpsetOptions` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否打乱选项',
  `IsAddAdKeyword` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已完成添加广告关键词',
  `ManualAddAdKeywordFlag` smallint(6) NOT NULL DEFAULT '0' COMMENT '手动添加关键词标识：0，自动 ，1：手动',
  `PublishStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '活动状态：活动状态：100=个人待提交，110=机构驳回拒绝，120=平台驳回拒绝，200=机构待提交，210=机构待审核，220=平台拒绝，300=个人提交审核，310=机构提交审核，400=平台审核通过（暂时不使用），500=发布',
  `DelStatus` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态：0=正常，1=删除',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  `PublishDateTime` datetime DEFAULT NULL,
  `SectionIsMerged` int(11) DEFAULT '0' COMMENT '栏目是否被合并',
  PRIMARY KEY (`ExamPaperID`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGUID`),
  KEY `IDX_fActivityGUID` (`ActivityGUID`),
  KEY `IDX_eUserNameCreate` (`UserNameCreate`)
) ENGINE=InnoDB AUTO_INCREMENT=2181 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_exampapersection` */

DROP TABLE IF EXISTS `mp_exampapersection`;

CREATE TABLE `mp_exampapersection` (
  `SectionID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `SectionGUID` varchar(50) NOT NULL COMMENT '栏目标识',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `SectionName` varchar(100) DEFAULT NULL COMMENT '栏目名称',
  `TotalMark` int(11) NOT NULL DEFAULT '0' COMMENT '栏目总分数',
  `TotalQuesCount` int(11) NOT NULL DEFAULT '0' COMMENT '栏目总题数目',
  `RandomQuesCount` int(11) NOT NULL DEFAULT '0' COMMENT '随机试卷栏目设置抽取题目数',
  `IsRandom` int(11) NOT NULL DEFAULT '0' COMMENT '栏目中试题是否随机0：不随机 1：随机',
  `SequenceNum` int(11) NOT NULL DEFAULT '0' COMMENT '栏目排序序号',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后更新时间',
  `QuestionType` int(11) NOT NULL DEFAULT '0' COMMENT '题型（五个固定值）1-5：单选多选填空判断简单',
  `ScorePerQues` int(11) NOT NULL DEFAULT '0' COMMENT '每题的分数，针对随机试题',
  PRIMARY KEY (`SectionID`),
  UNIQUE KEY `IDX_SectionGUID` (`SectionGUID`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGUID`),
  KEY `IDX_PublicTtemPool` (`CreateOn`)
) ENGINE=InnoDB AUTO_INCREMENT=4513 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_exercisequestion` */

DROP TABLE IF EXISTS `mp_exercisequestion`;

CREATE TABLE `mp_exercisequestion` (
  `QuestionID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '试卷栏目试题ID',
  `QuestionGUID` varchar(50) DEFAULT NULL COMMENT '临时试题标识',
  `SectionGUID` varchar(50) NOT NULL COMMENT '栏目标识',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `QuestionType` smallint(6) NOT NULL DEFAULT '1' COMMENT '题型（单选1，多选2，填空3，判断4，简答5）',
  `SequenceNumber` smallint(6) NOT NULL DEFAULT '1' COMMENT '试题排序序号：对于试题库随机类试卷，该排序无效，只有固定试题试卷才有效。',
  `UserNameCreate` varchar(50) NOT NULL COMMENT '试题创建用户名',
  `UserName` varchar(200) DEFAULT NULL COMMENT '试题归属用户名',
  `Question` varchar(2000) DEFAULT NULL COMMENT '试题题干',
  `QuestionPureText` varchar(2000) DEFAULT NULL COMMENT '纯文本试题题干',
  `KnowledgePoint` varchar(200) DEFAULT NULL COMMENT '题目知识点（知识点;分隔）',
  `Option` varchar(1500) DEFAULT NULL COMMENT '选项XML或者JSON',
  `StandardAnswer` varchar(2000) DEFAULT NULL COMMENT '试题标准答案  填空题，同一个空的可选答案之间用&@&分割 不校验答案顺序%*%',
  `IsAotoGiveScore` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否自动评分：1=自动，2=人工',
  `AnswerAnalysis` mediumtext COMMENT '答案解析',
  `AdKeywords` varchar(400) DEFAULT NULL COMMENT '广告关键词（这里记录关键词的Guid，使用'',''分割）',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`QuestionID`),
  UNIQUE KEY `IDX_ExamPaperGUID_QuestionGUID` (`ExamPaperGUID`,`QuestionGUID`),
  KEY `IDX_SectionGUID` (`SectionGUID`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_exercisesection` */

DROP TABLE IF EXISTS `mp_exercisesection`;

CREATE TABLE `mp_exercisesection` (
  `SectionID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '赛前练习-栏目ID',
  `SectionGUID` varchar(50) NOT NULL COMMENT '赛前练习-栏目标识',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `SectionName` varchar(100) DEFAULT NULL COMMENT '栏目名称',
  `SequenceNum` smallint(6) NOT NULL DEFAULT '0' COMMENT '栏目排序序号',
  `QuestionType` smallint(6) NOT NULL DEFAULT '0' COMMENT '题型（五个固定值）1-5：单选多选填空判断简单',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后更新时间',
  `TotalQuesCount` smallint(6) NOT NULL DEFAULT '0' COMMENT '栏目下的试题总数',
  PRIMARY KEY (`SectionID`),
  UNIQUE KEY `IDX_ExamPaperGUID_SectionGUID` (`SectionGUID`,`ExamPaperGUID`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_favoritepaper` */

DROP TABLE IF EXISTS `mp_favoritepaper`;

CREATE TABLE `mp_favoritepaper` (
  `FavoritePaperID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '试卷收藏id',
  `FavoritePaperGUID` varchar(50) NOT NULL COMMENT '试卷收藏guid',
  `UserName` varchar(200) NOT NULL COMMENT '用户名',
  `UserNick` varchar(200) DEFAULT NULL COMMENT '用户昵称',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷id',
  `ActivityGUID` varchar(50) DEFAULT NULL COMMENT '活动GUID',
  `ExamType` int(11) NOT NULL COMMENT '试卷类型：1=普通试卷，2=竞赛试卷',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LastUpdate` datetime NOT NULL COMMENT '更改时间',
  PRIMARY KEY (`FavoritePaperID`),
  KEY `IDX_ExamType` (`ExamType`),
  KEY `IDX_fExamPaperGUID` (`ExamPaperGUID`),
  KEY `IDX_CreateOn` (`CreateOn`),
  KEY `IDX_fUserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=675 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_favoritequestions` */

DROP TABLE IF EXISTS `mp_favoritequestions`;

CREATE TABLE `mp_favoritequestions` (
  `FavoriteID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `FavoriteGUID` varchar(50) NOT NULL COMMENT '收藏标识(FA+GUID)',
  `Type` int(11) DEFAULT NULL COMMENT '类型：(类型：1=目录,2=试题)',
  `UserName` varchar(200) DEFAULT NULL COMMENT '收藏的用户名',
  `Question` varchar(2000) DEFAULT NULL COMMENT '收藏目录名称或者试题标题',
  `QuestionGUID` varchar(50) DEFAULT NULL COMMENT '收藏的试题标识',
  `Level` int(11) DEFAULT NULL COMMENT '层级（默认0级是根目录）',
  `ParentFavoriteGUID` varchar(200) DEFAULT NULL COMMENT '父级收藏标识',
  `DelStatus` int(11) DEFAULT NULL COMMENT '删除状态：0=正常，1=逻辑删除，2=彻底删除',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`FavoriteID`),
  KEY `IDX_FaQuestionGUID` (`QuestionGUID`),
  KEY `IDX_UserName` (`UserName`),
  KEY `IDX_Type` (`Type`),
  KEY `IDX_ParentFavoriteGUID` (`ParentFavoriteGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=30243 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_follow` */

DROP TABLE IF EXISTS `mp_follow`;

CREATE TABLE `mp_follow` (
  `FollowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '关注者',
  `UserNameFollowed` varchar(100) NOT NULL COMMENT '被关注的个人用户或机构用户',
  `FollowedUserNick` varchar(100) DEFAULT NULL COMMENT '被关注的个人用户或机构用户昵称',
  `UserNick` varchar(100) DEFAULT NULL COMMENT '粉丝昵称',
  `FollowStatus` int(11) NOT NULL DEFAULT '1' COMMENT '关注状态：1=关注，2=逻辑删除',
  `UserType` int(11) NOT NULL DEFAULT '1' COMMENT '用户类型  1：个人 2：机构',
  `CreateOn` datetime NOT NULL,
  `LatestUpdate` datetime NOT NULL,
  PRIMARY KEY (`FollowID`),
  UNIQUE KEY `IDX_UserName_UserNameFollowed` (`UserName`,`UserNameFollowed`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_friend` */

DROP TABLE IF EXISTS `mp_friend`;

CREATE TABLE `mp_friend` (
  `FriendID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '好友表ID',
  `UserNameCreate` varchar(200) DEFAULT NULL COMMENT '发起添加好友用户名',
  `UserNameReceive` varchar(200) DEFAULT NULL COMMENT '同意添加好友用户名',
  `Relation` int(11) DEFAULT NULL COMMENT '与对方的关系状态：',
  `AgreeDT` datetime DEFAULT NULL COMMENT '同意成为好友时间',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`FriendID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mp_imagefilemapping` */

DROP TABLE IF EXISTS `mp_imagefilemapping`;

CREATE TABLE `mp_imagefilemapping` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ImageGuid` varchar(50) DEFAULT NULL COMMENT '图片标识',
  `Format` varchar(10) DEFAULT NULL COMMENT '图片格式；jpg,gif,png等允许的图片格式',
  `ImageType` varchar(10) DEFAULT NULL COMMENT '图片类型：',
  `FolderYear` int(11) DEFAULT NULL COMMENT '图片保存的年份目录',
  `FolderWeekOfYear` int(11) DEFAULT NULL COMMENT '图片保存的周数目录',
  `UserName` varchar(100) DEFAULT NULL COMMENT '上传用户名',
  `ClientIP` varchar(100) DEFAULT NULL COMMENT '上传图片的客户IP',
  `StatusFlag` int(11) DEFAULT NULL COMMENT '图片状态标志：0=正常，1=删除',
  `CreateOn` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=894 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_industrycategory` */

DROP TABLE IF EXISTS `mp_industrycategory`;

CREATE TABLE `mp_industrycategory` (
  `IndustryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IndustryCode` varchar(50) DEFAULT NULL COMMENT '行业编码',
  `IndustryName` varchar(200) DEFAULT NULL COMMENT '行业名称',
  `Level` int(11) DEFAULT NULL COMMENT '层级：1,2,3级，其中1级是最高层级',
  `ParentIndustryCode` varchar(50) DEFAULT NULL COMMENT '行业的父节点',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  `ShortName` varchar(20) DEFAULT '',
  PRIMARY KEY (`IndustryID`),
  KEY `IDX_IndustryCode` (`IndustryCode`),
  KEY `IDX_IndustryName` (`IndustryName`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_institutionauthority` */

DROP TABLE IF EXISTS `mp_institutionauthority`;

CREATE TABLE `mp_institutionauthority` (
  `AuthorityID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserNameInsti` varchar(200) DEFAULT NULL COMMENT '机构用户名',
  `UserNamePer` varchar(200) DEFAULT NULL COMMENT '个人用户名',
  `ResourceCode` int(11) DEFAULT NULL COMMENT '资源代码',
  `IsAllowed` bit(1) DEFAULT NULL COMMENT '是否允许访问资源',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  `DelStatus` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态：0=正常，1=逻辑删除，2=彻底删除',
  `CreateBy` varchar(200) DEFAULT NULL COMMENT '创建人的用户名',
  PRIMARY KEY (`AuthorityID`)
) ENGINE=InnoDB AUTO_INCREMENT=1317 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_institutiongroup` */

DROP TABLE IF EXISTS `mp_institutiongroup`;

CREATE TABLE `mp_institutiongroup` (
  `InstiGroupID` bigint(20) NOT NULL AUTO_INCREMENT,
  `InstiGroupGUID` varchar(50) NOT NULL COMMENT '群组标识',
  `GroupName` varchar(200) DEFAULT NULL COMMENT '群组名称',
  `UserName` varchar(200) DEFAULT NULL COMMENT '群组所属的用户',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`InstiGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_institutiongroupmember` */

DROP TABLE IF EXISTS `mp_institutiongroupmember`;

CREATE TABLE `mp_institutiongroupmember` (
  `IGMemberID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机构群组成员表ID',
  `IGMemberGUID` varchar(50) NOT NULL COMMENT '机构群组成员表guid',
  `InstitutionUserName` varchar(50) NOT NULL COMMENT '所属机构用户名',
  `UserName` varchar(200) DEFAULT NULL COMMENT '成员的用户名',
  `Name` varchar(200) NOT NULL COMMENT '成员姓名',
  `UserFillName` varchar(100) DEFAULT NULL COMMENT '用户填入的名称',
  `Position` varchar(50) DEFAULT NULL COMMENT '成员职位',
  `FLDepartment` varchar(50) DEFAULT NULL COMMENT '一级部门',
  `TLDepartment` varchar(50) DEFAULT NULL COMMENT '二级部门',
  `JobNumber` varchar(50) DEFAULT NULL COMMENT '员工工号',
  `Tel` varchar(50) NOT NULL COMMENT '成员手机号',
  `UserSource` int(11) NOT NULL DEFAULT '1' COMMENT '用户来源：1：excel上传2：单个邀请3：用户申请',
  `CheckStatus` int(11) NOT NULL DEFAULT '2' COMMENT '是否校验通过,1:未注册、2：未认证3：待验证4-5：已认证（包括5：自动通过4已通过） 6被拒绝7拒绝  被拒绝是被机构拒绝',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`IGMemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_institutiongroupmrelation` */

DROP TABLE IF EXISTS `mp_institutiongroupmrelation`;

CREATE TABLE `mp_institutiongroupmrelation` (
  `IGMemberRelationID` int(20) NOT NULL AUTO_INCREMENT COMMENT '机构群组成员关联表',
  `IGMemberRelationGUID` varchar(50) NOT NULL,
  `IGGUID` varchar(50) NOT NULL COMMENT '机构群组ID',
  `IGMemberGUID` varchar(50) NOT NULL COMMENT '机构群组成员ID',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `CreateUserName` varchar(50) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`IGMemberRelationID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_institutioninfo` */

DROP TABLE IF EXISTS `mp_institutioninfo`;

CREATE TABLE `mp_institutioninfo` (
  `InstituID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '认证信息ID',
  `InstitutionGUID` varchar(50) NOT NULL COMMENT '机构GuId',
  `UserName` varchar(200) DEFAULT NULL COMMENT '用户名',
  `Name` varchar(200) DEFAULT NULL COMMENT '注册人姓名',
  `Mail` varchar(200) DEFAULT NULL COMMENT '注册人邮箱',
  `IDCard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `IDCardFaceImg` varchar(200) DEFAULT NULL COMMENT '身份证正面图片地址',
  `IDCardBackImg` varchar(200) DEFAULT NULL COMMENT '身份证反面图片地址',
  `CompanyName` varchar(100) DEFAULT NULL COMMENT '公司注册全名',
  `CompaPropagateName` varchar(100) DEFAULT NULL COMMENT '公司宣传名称',
  `CompanyIntroduction` varchar(500) DEFAULT NULL COMMENT '公司介绍',
  `BusinessLicenseNum` varchar(100) DEFAULT NULL COMMENT '营业执照号',
  `BLFaceImg` varchar(200) DEFAULT NULL COMMENT '营业执照正面图片地址',
  `BLBackImg` varchar(200) DEFAULT NULL COMMENT '营业执照反面图片地址',
  `CompanyLogo` varchar(200) DEFAULT NULL COMMENT '公司logo图片地址',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  `RegisterQQ` varchar(20) DEFAULT NULL,
  `RegisterPhone` varchar(20) DEFAULT NULL COMMENT '注册人手机号码',
  `OrganizationCode` varchar(20) DEFAULT NULL COMMENT '组织机构代码',
  `BusinessScope` varchar(500) DEFAULT NULL COMMENT '经营范围',
  `CompanyAddress` varchar(500) DEFAULT NULL COMMENT '企业地址',
  `AdvertisementImg` varchar(200) DEFAULT NULL COMMENT '首页广告图片',
  `InfoCheckedStatus` int(11) DEFAULT NULL COMMENT '资料审核状态 1.待提交 2.待审核 3.被驳回 4.审核通过',
  `RejectReason` varchar(500) DEFAULT NULL COMMENT '驳回原因',
  `InstitutionType` varchar(50) DEFAULT 'Company',
  `AttestationStep` int(11) NOT NULL DEFAULT '0',
  `CompanyGenreFirstCode` varchar(50) DEFAULT NULL,
  `CompanyGenreSecendCode` varchar(50) DEFAULT NULL,
  `OfficialWebsite` varchar(200) DEFAULT NULL,
  `LocationCountry` varchar(100) DEFAULT NULL,
  `LocationProvince` varchar(100) DEFAULT NULL,
  `LocationCity` varchar(100) DEFAULT NULL,
  `InvitationLetter` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`InstituID`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_ipinfo` */

DROP TABLE IF EXISTS `mp_ipinfo`;

CREATE TABLE `mp_ipinfo` (
  `IP` varchar(100) NOT NULL COMMENT 'IP',
  `Country` varchar(150) DEFAULT NULL COMMENT '国家',
  `Province` varchar(150) DEFAULT NULL COMMENT '省份（中国），其他国家，则直接是国家',
  `City` varchar(150) DEFAULT NULL COMMENT '城市',
  `ISP` varchar(150) DEFAULT NULL COMMENT '互联网服务提供商',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LastestUpdate` datetime DEFAULT NULL COMMENT '最近一次更新时间',
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mp_jiangpinginfo` */

DROP TABLE IF EXISTS `mp_jiangpinginfo`;

CREATE TABLE `mp_jiangpinginfo` (
  `JiangpingId` bigint(20) NOT NULL AUTO_INCREMENT,
  `JiangpingGuid` varchar(39) DEFAULT NULL COMMENT 'jp[Guid]',
  `ShortAddressId` varchar(20) DEFAULT NULL,
  `JiangpingTitle` varchar(100) DEFAULT NULL,
  `UserType` int(11) NOT NULL,
  `UserNameBlongTo` varchar(200) DEFAULT NULL COMMENT '归属人',
  `UserNameCreate` varchar(200) DEFAULT NULL COMMENT '创建人',
  `PublishStatus` smallint(6) NOT NULL,
  `RefuseReason` varchar(100) DEFAULT NULL COMMENT '被拒绝原因',
  `PublishDateTime` datetime NOT NULL COMMENT '默认为添加时间',
  `CreateOn` datetime NOT NULL,
  `LatestUpdate` datetime NOT NULL,
  `ValidStatus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '有效状态（管理员操作）',
  `DelStatus` tinyint(4) NOT NULL DEFAULT '0',
  `RestrictType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '答题对象限制类型：1=公开；2=答题密码；3=指定用户名和群组',
  `IsSupportSearch` tinyint(4) NOT NULL DEFAULT '0' COMMENT '通过标题搜索是否可查看到该资料: 0=不支持；1=支持',
  `AllowLookStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户何时能查看点评：0=发布后立即可看；1=定时公开；',
  `AllowLookTime` datetime DEFAULT NULL COMMENT '定时公开点评时间',
  PRIMARY KEY (`JiangpingId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_jiangpingitem` */

DROP TABLE IF EXISTS `mp_jiangpingitem`;

CREATE TABLE `mp_jiangpingitem` (
  `JiangpingItemId` bigint(20) NOT NULL AUTO_INCREMENT,
  `JiangpingItemGuid` varchar(37) DEFAULT NULL COMMENT '讲评内，一个项（最大可编辑项）的Guid',
  `JiangpingGuid` varchar(39) DEFAULT NULL,
  `ItemSequence` int(11) NOT NULL COMMENT '排序字段',
  `Content` mediumtext,
  `UserName` varchar(200) DEFAULT NULL COMMENT '创建人',
  `CreateOn` datetime NOT NULL,
  `DelStatus` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`JiangpingItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mp_mapcategory` */

DROP TABLE IF EXISTS `mp_mapcategory`;

CREATE TABLE `mp_mapcategory` (
  `CategoryID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类主键',
  `CategoryCode` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '分类代码',
  `CategoryName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最近更新时间',
  `OrderValue` int(11) NOT NULL COMMENT '进行排序的字段',
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_mapmaterial` */

DROP TABLE IF EXISTS `mp_mapmaterial`;

CREATE TABLE `mp_mapmaterial` (
  `MaterialID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '宣传图素材主键',
  `MaterialGUID` varchar(50) COLLATE utf8_bin NOT NULL,
  `CategoryCode` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '分类',
  `CategoryName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '类别名称',
  `MaterialName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '素材名称',
  `MaterialImg` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '素材预览图片',
  `UploadTime` datetime NOT NULL COMMENT '素材上传时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最近更新时间',
  `DowloadCount` bigint(20) NOT NULL COMMENT '下载量',
  `JPGAddress` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'JPG包地址',
  `PSDAddress` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'PSD包地址',
  PRIMARY KEY (`MaterialID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_matchactivity` */

DROP TABLE IF EXISTS `mp_matchactivity`;

CREATE TABLE `mp_matchactivity` (
  `ActivityID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityGuid` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '活动标识',
  `PaperGuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '试卷Guid',
  `UserName` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动举办的用户名(知网用户名)',
  `UserNameCreate` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '竞赛创建人的用户名',
  `UserType` tinyint(4) NOT NULL COMMENT '活动举办的用户名权限：1:个人，2：机构；3：被机构授权的个人',
  `TradeFirstGenreCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '试题一级行业分类代号',
  `TradeSecondGenreCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '试题二级行业分类代号',
  `TradeThirdGenreCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '试题三级行业分类代号',
  `ActivityName` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动名称',
  `ActivityBriefIntroduction` text COLLATE utf8_bin COMMENT '活动介绍',
  `ActivityUnit` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动举办单位',
  `UndertakeUnitName` text COLLATE utf8_bin,
  `AssitUnitName` text COLLATE utf8_bin,
  `CertificateImg` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '资质证明的图片（可以定位到哪张图片的，多张资质证明可以$$分隔）',
  `NewActivityImg` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '新自定义活动宣传图',
  `BigActivityImg` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '竞赛宣传大图',
  `StartTime` datetime DEFAULT NULL COMMENT '活动起始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '活动结束时间',
  `FullScore` int(11) NOT NULL DEFAULT '0' COMMENT '设置的分数（满分）',
  `ThemeStyle` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '大赛主页样式',
  `WelcomePageLogo` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '答题欢迎页面的6个logo图片，用";"分割,图片分类为10',
  `IsVerifyTel` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否必须验证手机号码才能答题（1:是，0:不是）',
  `ExameRestrictType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '答题对象限制类型：1=公开；2=答题密码；3=指定用户名和群组；4=校验用户字段名',
  `LimitTime` int(11) NOT NULL DEFAULT '0' COMMENT '答题限时（单位：分钟)9999=不限时（考试不限定时间）',
  `AnswerCountLimitStatus` int(11) NOT NULL DEFAULT '0' COMMENT '试卷答题次数限制：0=不限制次数，1=限制1人1次',
  `AnnounceAnswerStatus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '试卷公布答案状态设置：0=不公布，1=答题完成立即公布，2=竞赛活动结束公布答案，3=自由设置答案公布时间',
  `AnnounceAnswerDateTime` datetime DEFAULT NULL COMMENT '试卷公布答案时间',
  `Announcement` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '公告（{Cover:xxx.jpg,Title:XXX竞赛公告,Pdf:XXX.pdf,PdfSize:102400}）（PdfSize单位是b）',
  `HasPrize` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有奖品：0=无奖品，1=旧版有奖品 2：列表模式 3.分组模式',
  `PrizeRule` text COLLATE utf8_bin COMMENT '奖品得奖规则',
  `PrizeInfo` text COLLATE utf8_bin COMMENT '比赛奖品内容：奖品的名称及数量',
  `RankingShowColumns` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '排行榜显示自定义列[{ColumnName:"UserNick":Title"昵称"}]',
  `RankingSplitColumns` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '排行榜分组字段(ColumnName#ColumnGuid)',
  `ChartSetting` varchar(2048) CHARACTER SET utf8 DEFAULT NULL COMMENT '个性化统计设置',
  `IsShowRealTimeStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示实时参赛状态：0=不显示，1=显示',
  `IsShowPersonRanking` tinyint(4) NOT NULL DEFAULT '0' COMMENT '展示个人排行榜：0=不展示，1=展示',
  `IsPublishResult` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公布结果：0=未公布结果，1=已公布结果',
  `IsAllowComment` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许评论0:不允许1：允许',
  `CommentGrade` int(11) NOT NULL DEFAULT '10' COMMENT '试卷评分（用户对试卷出的好坏的评分的平均分，满分10分）',
  `CommentTotalCount` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总评论数',
  `FavourCommentCount` int(11) NOT NULL DEFAULT '0' COMMENT '试卷好评数',
  `ActivityContactGuid` varchar(36) CHARACTER SET utf8 DEFAULT NULL COMMENT '竞赛联系人Guid',
  `AnsweredPersonCount` int(11) NOT NULL DEFAULT '0' COMMENT '参与考试的人数',
  `AnsweredTimesCount` int(11) NOT NULL DEFAULT '0' COMMENT '参与考试的次数',
  `LotteryStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '抽奖功能是否开启(0:未开启,1:开启)',
  `LotteryMode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '抽奖方式(1:手动,2:自动)',
  `ShareTitle` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '分享大标题',
  `ShareSubtitle` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '分享副标题',
  `SharePicture` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '分享图片地址',
  `PublishStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '活动状态：活动状态：100=个人待提交，110=机构驳回拒绝，120=平台驳回拒绝，200=机构待提交，210=机构待审核，220=平台拒绝，300=个人提交审核，310=机构提交审核，400=平台审核通过（暂时不使用），500=发布',
  `PublishDateTime` datetime DEFAULT NULL COMMENT '活动发布时间,(现在平台审核通过就是发布，所以平台审核通过时在更新这个字段)',
  `RefuseReason` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '拒绝理由（平台审核失败）',
  `DelStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态：0=正常未删除，1=已删除',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后更新时间',
  `AntiCheating` tinyint(4) NOT NULL DEFAULT '0' COMMENT '防作弊次数 0 不限制',
  `OffShelf` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否下架：0=正常，1=下架',
  `IsOpenExercise` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启练习模式 0:未开启 1：已开启',
  `ExerciseQuesSource` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赛前练习题来源 0:默认 1：上传练习题 2：使用试卷试题',
  `ExerciseDisplayForm` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赛前练习题展示方式 0:默认 1:不展示分类 2：按试题栏目分类展示 3：按知识点分类展示',
  `ExerciseForm` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赛前练习模式 0:默认 1:学习模式 2:练习模式 3:学习+练习',
  `SimulatedRaceUrl` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '模拟参赛url 非空:开启 空:关闭',
  `ExerciseMemo` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '赛前练习说明',
  PRIMARY KEY (`ActivityID`),
  KEY `IDX_ActivityGUID` (`ActivityGuid`),
  KEY `IDX_ActivityStartTime` (`StartTime`),
  KEY `IDX_ActivityFinishTime` (`EndTime`),
  KEY `IDX_PaperGuid` (`PaperGuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1067 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_matchresult` */

DROP TABLE IF EXISTS `mp_matchresult`;

CREATE TABLE `mp_matchresult` (
  `MatchResultID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MatchResultGUID` varchar(50) NOT NULL,
  `ActivityGUID` varchar(50) DEFAULT NULL,
  `UserNameBelongTo` varchar(50) DEFAULT NULL COMMENT '活动举办单位[UserName]',
  `EditMode` int(11) NOT NULL DEFAULT '100' COMMENT '编辑模式（100：固定模式，200：自由模式）',
  `ResultPublishStatus` int(11) NOT NULL DEFAULT '100' COMMENT '结果发布状态（100：待提交，200：待审核[已提交]，400：拒绝，500：审核通过）',
  `ResultCoutent` mediumtext,
  `CreateBy` varchar(50) DEFAULT NULL COMMENT '创建比赛结果的用户名[UserName]（机构用户或机构成员）',
  `LatestEditPerson` varchar(50) DEFAULT NULL COMMENT '最后一次编辑比赛机构的用户[UserName]',
  `RejectReason` varchar(200) DEFAULT NULL COMMENT '被拒绝发布的原因',
  `CreateOn` datetime NOT NULL,
  `LatestUpdate` datetime NOT NULL,
  PRIMARY KEY (`MatchResultID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_mergesection` */

DROP TABLE IF EXISTS `mp_mergesection`;

CREATE TABLE `mp_mergesection` (
  `MergeSectionID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '合并后章节的自增ID',
  `ExamPaperGUID` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '试卷GUID',
  `MergeSectionGUID` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '合并新章节GUID',
  `SectionGUID` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '章节GUID',
  `MergeSectionName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '合并新章节名称',
  `MergerSectionSequenceNum` int(11) DEFAULT NULL COMMENT '合并新章节排序编号',
  `TotalMark` int(11) DEFAULT NULL COMMENT '栏目总分数',
  `TotalQuesCount` int(11) DEFAULT NULL COMMENT '栏目总题数目',
  `CreateOn` datetime DEFAULT NULL,
  `LatestUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`MergeSectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_message` */

DROP TABLE IF EXISTS `mp_message`;

CREATE TABLE `mp_message` (
  `MessageID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `MessageGUID` varchar(50) NOT NULL COMMENT '消息标识',
  `UserNameCreate` varchar(200) NOT NULL COMMENT '消息创建用户名',
  `MsgType` int(11) NOT NULL DEFAULT '1' COMMENT '消息类型：1-管理员-带审核消息;2-竞赛发布通知;3-试卷发布通知;4-拒绝通知;5-修改比赛时间通知;6-结束提醒通知;7-认证通过通知;8-批卷消息;9-引用消息;',
  `ReceiveType` int(11) DEFAULT '1' COMMENT '消息受众类型：1个人，2群组，3全部（广播）',
  `Title` varchar(200) DEFAULT NULL COMMENT '消息标题',
  `ContentModel` varchar(100) DEFAULT NULL COMMENT '消息模型',
  `Content` varchar(500) DEFAULT NULL COMMENT '消息内容（HTML或者TXT）',
  `ExpireTime` datetime DEFAULT NULL COMMENT '消息过期时间',
  `DelStatus` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态；0=正常，1=逻辑删除，2=彻底删除',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`MessageID`),
  KEY `IDX_MessageGUID` (`MessageGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=697 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_paperaudithistory` */

DROP TABLE IF EXISTS `mp_paperaudithistory`;

CREATE TABLE `mp_paperaudithistory` (
  `HistoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityGUID` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动标识',
  `ExamPaperGUID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '试卷标识',
  `OperationType` int(11) NOT NULL DEFAULT '0' COMMENT '操作类型 0=试卷的发布状体；1=试卷的上线下线状态；2=试卷的删除状态',
  `UserNameOperate` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '状态操作用户',
  `RoleType` int(11) DEFAULT NULL COMMENT '用户类型：1=个人，2=机构，3=平台',
  `CurrentStatus` int(11) NOT NULL COMMENT '当前状态【转换前的状态】',
  `TargetStatus` int(11) NOT NULL COMMENT '目标状态【转换后的状态】',
  `RmMark` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '试卷状态修改的备注',
  `CreateOn` datetime NOT NULL,
  PRIMARY KEY (`HistoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3951 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_paperrestrictinfo` */

DROP TABLE IF EXISTS `mp_paperrestrictinfo`;

CREATE TABLE `mp_paperrestrictinfo` (
  `RestrictInfoID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '试卷答题对象限制表主键',
  `RestrictInfoGUID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '试卷答题对象限制表标识',
  `ExamPaperGuid` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '试卷标识',
  `ActivityGUID` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动GUID',
  `RestrictType` int(11) NOT NULL DEFAULT '1' COMMENT '答题对象限制状态设置：1=公开，不限制，2=设置答题密码，3=指定用户可答群组，4=自定义用户列表（Xsl模板）',
  `PermitUser` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '指定用户 -用户id 唯一',
  `PermitUserName` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '指定用户 -用户名',
  `PermitGroup` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '指定群组-群组id',
  `PermitGroupName` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '指定群组-群组名称',
  `Password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '设定的密码',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LastUpdate` datetime DEFAULT NULL COMMENT '修改时间',
  `UserNameCreate` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  PRIMARY KEY (`RestrictInfoID`),
  UNIQUE KEY `IDX_RestrictInfoGUID` (`RestrictInfoGUID`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGuid`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_personalmodel` */

DROP TABLE IF EXISTS `mp_personalmodel`;

CREATE TABLE `mp_personalmodel` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模板Id',
  `ActivityGUID` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'mp_matchactivity表活动标识',
  `UserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `ModelTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '模板标题',
  `ModelContext` text COLLATE utf8_bin COMMENT '模板内容',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_persongroup` */

DROP TABLE IF EXISTS `mp_persongroup`;

CREATE TABLE `mp_persongroup` (
  `PerGroupID` bigint(20) NOT NULL COMMENT '群组ID',
  `PerGroupGUID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '群组标识',
  `Name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '群组名称',
  `BriefIntroduction` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '群组简介',
  `IsPublic` int(11) DEFAULT NULL COMMENT '群组是否公开',
  `PeopleCount` int(11) DEFAULT NULL COMMENT '群组人数',
  `UserName` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '群组所属的用户',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`PerGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_persongroupmember` */

DROP TABLE IF EXISTS `mp_persongroupmember`;

CREATE TABLE `mp_persongroupmember` (
  `PerGroupMemberID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PerGroupMemberGUID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '群组标识',
  `UserName` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '成员用户名',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`PerGroupMemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_picturematerial` */

DROP TABLE IF EXISTS `mp_picturematerial`;

CREATE TABLE `mp_picturematerial` (
  `materialID` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`materialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `mp_points` */

DROP TABLE IF EXISTS `mp_points`;

CREATE TABLE `mp_points` (
  `PointID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `PointsType` int(11) DEFAULT NULL COMMENT '积分类型',
  `Points` int(11) DEFAULT NULL COMMENT '积分值',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`PointID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_costomresource` */

DROP TABLE IF EXISTS `mp_prize_costomresource`;

CREATE TABLE `mp_prize_costomresource` (
  `PrizeID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PrizeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品GUID',
  `PrizeQuantity` int(10) NOT NULL COMMENT '奖品数量',
  `PrizeImg` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品图片',
  `UserName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '上传奖品用户名',
  `UploadDateTime` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`PrizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_deliveryinfo` */

DROP TABLE IF EXISTS `mp_prize_deliveryinfo`;

CREATE TABLE `mp_prize_deliveryinfo` (
  `DeliveryID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `DeliveryGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '配送信息GUID',
  `MyPrizeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '我的奖品GUID',
  `RecipientsGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '收件人信息GUID',
  `CourierNumber` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '快递单号',
  `CourierName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '快递名称',
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '0 未发放 1已发放',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `UpdateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`DeliveryID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_inpackage` */

DROP TABLE IF EXISTS `mp_prize_inpackage`;

CREATE TABLE `mp_prize_inpackage` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `InPackageGUID` varchar(50) COLLATE utf8_bin NOT NULL,
  `PackageGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '礼包GUID',
  `PrizeTypeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品类别GUID',
  `PrizeNumber` int(10) DEFAULT NULL COMMENT '奖品数量',
  `Remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_package` */

DROP TABLE IF EXISTS `mp_prize_package`;

CREATE TABLE `mp_prize_package` (
  `PackageID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '奖品礼包ID',
  `PackageGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '礼包GUID',
  `SerialNumber` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '礼包编号',
  `PackageName` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '礼包名称',
  `ValidityStartTime` datetime DEFAULT NULL COMMENT '有效期起始时间',
  `ValidityEndTime` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `ImgUrl` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包图片',
  `PackageStatus` int(10) NOT NULL DEFAULT '0' COMMENT '启用状态(0:未启用,1:已启用,2:已停用)',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  `Remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`PackageID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_papersetting` */

DROP TABLE IF EXISTS `mp_prize_papersetting`;

CREATE TABLE `mp_prize_papersetting` (
  `PaperPrizeSetID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PaperPrizeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '竞赛奖品GUID',
  `ExamPaperGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '竞赛GUID',
  `PrizeLevel` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品等级',
  `PrizePackageGUID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包GUID',
  `PackageSerialNum` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包编号',
  `ValidityStartTime` datetime DEFAULT NULL COMMENT '礼包有效期开始时间',
  `ValidityEndTime` datetime DEFAULT NULL COMMENT '礼包有效期结束时间',
  `PrizePackageName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包名称',
  `MaxCountOneDay` int(10) DEFAULT NULL COMMENT '奖品每天最多发放数量',
  `ImgUrl` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包图片',
  `WinningProbability` decimal(10,5) NOT NULL COMMENT '中奖概率',
  `PackageSequence` int(11) NOT NULL COMMENT '礼包序号',
  `ResourceType` int(11) NOT NULL DEFAULT '1' COMMENT '资源类型(1:试卷 2:问卷)',
  PRIMARY KEY (`PaperPrizeSetID`)
) ENGINE=InnoDB AUTO_INCREMENT=4500 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_prizeextension` */

DROP TABLE IF EXISTS `mp_prize_prizeextension`;

CREATE TABLE `mp_prize_prizeextension` (
  `PrizeID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PrizeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键GUID',
  `PrizeName` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '奖品名称',
  `PrizeTotalNum` int(11) NOT NULL DEFAULT '0' COMMENT '奖品累计总数',
  `PrizeAvailableNum` int(11) NOT NULL DEFAULT '0' COMMENT '奖品可用数量',
  `WinningProbability` decimal(10,5) NOT NULL COMMENT '中奖概率',
  `UpdateTime` datetime NOT NULL COMMENT '修改时间',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `PrizeType` int(11) NOT NULL DEFAULT '4' COMMENT '1 一等奖 2 二等奖 3等奖 4 谢谢参与',
  `ActiveTime` datetime NOT NULL COMMENT '启用时间',
  `UsedNumber` int(11) NOT NULL DEFAULT '0' COMMENT '奖品已用过的数',
  `PrizeImage` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品图片',
  PRIMARY KEY (`PrizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1399 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_recipientsinfo` */

DROP TABLE IF EXISTS `mp_prize_recipientsinfo`;

CREATE TABLE `mp_prize_recipientsinfo` (
  `RecipientsID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `RecipientsGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '收件人GUID',
  `RecipientsName` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `RecipientsTel` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收件人电话',
  `DetailAddress` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收件人详细地址',
  `UserName` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名(外建)',
  `Province` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '省',
  `City` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '市',
  `County` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '县(区)',
  `Postcode` varchar(10) COLLATE utf8_bin DEFAULT '' COMMENT '邮编',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `UpdateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`RecipientsID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_resource` */

DROP TABLE IF EXISTS `mp_prize_resource`;

CREATE TABLE `mp_prize_resource` (
  `PrizeID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PrizeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品GUID',
  `PrizeType` int(10) DEFAULT NULL COMMENT '奖品类别(0:赠券,1:代金券,2:期刊,3:自定义)',
  `PrizeTypeSerialNum` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品类别编码',
  `PrizeName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品名称',
  `PrizeQuantity` int(10) DEFAULT '1' COMMENT '奖品数量',
  `PrizeValue` int(10) DEFAULT NULL COMMENT '面值',
  `CardNumber` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '卡号',
  `CardPassword` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `ValidityStartTime` datetime NOT NULL COMMENT '有效期起始时间',
  `ValidityEndTime` datetime NOT NULL COMMENT '有效期结束时间',
  `ImportBatch` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '导入批次',
  `UploadDateTime` datetime DEFAULT NULL COMMENT '导入时间',
  `IsAvailable` int(10) DEFAULT '1' COMMENT '是否已用(0:已用,1:可用,2:已过期可用)',
  `EffectDateLimit` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '使用有效天数',
  PRIMARY KEY (`PrizeID`),
  UNIQUE KEY `NewIndex1` (`CardNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=80759 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_template` */

DROP TABLE IF EXISTS `mp_prize_template`;

CREATE TABLE `mp_prize_template` (
  `TemplateId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模板ID',
  `TemplateGuid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板GUID',
  `TemplateName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `ActivityType` tinyint(4) NOT NULL DEFAULT '1' COMMENT '模板类型(1:竞赛2:考试3:问卷)',
  `LotteryStatus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '抽奖状态(1:开启0:关闭)',
  `LotteryMode` tinyint(4) NOT NULL COMMENT '抽奖模式(1:手动2:自动)',
  `PrizeContent` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖品内容',
  `UpdateTime` datetime NOT NULL COMMENT '更新时间',
  `TemplateStatus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '模板状态(1:正常0:无效)',
  PRIMARY KEY (`TemplateId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `mp_prize_typeresource` */

DROP TABLE IF EXISTS `mp_prize_typeresource`;

CREATE TABLE `mp_prize_typeresource` (
  `PrizeTypeID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PrizeTypeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品类型GUID',
  `PrizeType` int(10) DEFAULT NULL COMMENT '奖品类型代码(1:赠券,2:代金券,3:期刊,4:自定义类型,5:实物奖品)',
  `SerialNumber` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品类别编号',
  `PrizeTypeName` varchar(150) COLLATE utf8_bin NOT NULL COMMENT '奖品类型名称',
  `PrizeTotalQuantity` int(10) DEFAULT '0' COMMENT '奖品总数量',
  `PrizeQuantityAvail` int(10) DEFAULT '0' COMMENT '该类型下奖品可用数量',
  `DisplayImg` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '展示图片目录',
  `PrizeTypeRule` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品使用规则',
  `Remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `CreatedDateTime` datetime NOT NULL COMMENT '创建时间',
  `IsAvailable` int(10) NOT NULL DEFAULT '1' COMMENT '奖品状态(0:已停用,1:启用中)',
  `AddUser` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '添加奖品的用户名',
  `UserType` int(10) DEFAULT NULL COMMENT '用户类型：1:管理员,2:普通用户',
  `ActivityCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '活动代码(代金券专用用)',
  `VouchersType` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '代金券种类(代金券专用)',
  `Purpose` int(10) DEFAULT NULL COMMENT '奖品用途(1:手机知网;2:手机知网客户端;3:中国知网)',
  PRIMARY KEY (`PrizeTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_winner` */

DROP TABLE IF EXISTS `mp_prize_winner`;

CREATE TABLE `mp_prize_winner` (
  `MyPrizeID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `MyPrizeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '我的奖品GUID',
  `PrizeGUID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品GUID',
  `ExamPaperGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '在哪场竞赛中获奖',
  `UserName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '获奖用户名',
  `PrizeName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品名称',
  `PrizeImg` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品图片',
  `LotteryTime` datetime NOT NULL COMMENT '抽奖时间',
  `ValidityEndTime` datetime DEFAULT NULL COMMENT '奖品有效期结束时间',
  `PrizeDescription` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品说明',
  `IsAvailable` int(10) DEFAULT '1' COMMENT '是否可用(0:不可用,1:可用,2:已过期)',
  `PackageGUID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包GUID',
  `PackageSerialNum` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包编号',
  `PackageName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包名字',
  `PackageImgUrl` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '礼包图片',
  `LotteryBacth` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '中奖批次',
  `ExamineePaperGUID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '从哪次考卷中获得',
  `ActivityGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '活动标识',
  `PrizeType` int(11) DEFAULT NULL COMMENT '奖品类型',
  `PrizeValue` int(10) DEFAULT NULL COMMENT '赠券或代金券的面值',
  `CardNumber` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '赠券的卡号',
  `CardPassword` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '赠券的密码',
  `PeriodicalNumber` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '期刊编号',
  `PrizeTypeRule` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品使用规则',
  `PeriodicalName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '期刊名称',
  `PeriodicalYear` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '期刊出版的期数',
  `ActivityCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '活动代码',
  `ValidityStartTime` datetime DEFAULT NULL COMMENT '奖品有效期开始时间',
  `Purpose` int(10) DEFAULT NULL COMMENT '奖品用途(1:手机知网;2:手机知网客户端)',
  `UseMeetCondition` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '使用代金券满足的条件',
  `DurationHour` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '有效时长，以小时为单位',
  `PrizeTypeSerialNum` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品类别编号',
  `PrizeTypeName` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品类别名称',
  `EffectDateLimit` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '使用有效天数',
  `DeliveryStatus` int(10) DEFAULT '0' COMMENT '实物奖品发放状态 0未发放 1已发放',
  `LotteryType` int(10) DEFAULT '1' COMMENT '抽奖类型 1 手动 2 自动',
  `ResourceType` int(10) NOT NULL DEFAULT '1' COMMENT '资源类型(1:竞赛 2:问卷 3：试卷)',
  PRIMARY KEY (`MyPrizeID`),
  KEY `NewIndex1` (`CardNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=6986 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_prize_winnerextension` */

DROP TABLE IF EXISTS `mp_prize_winnerextension`;

CREATE TABLE `mp_prize_winnerextension` (
  `MyPrizeID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `MyPrizeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键GUID',
  `PrizeGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品GUID',
  `UserName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '中奖用户名',
  `ActivityGUID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '竞赛活动GUID',
  `LotteryTime` datetime NOT NULL COMMENT '中奖时间',
  `PrizeType` int(11) NOT NULL COMMENT '奖品类型',
  `ExamineePaperGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '考试试卷GUID',
  `UserPhone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户手机号',
  `UserCollectionPhone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户收集手机号',
  `Operators` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '运营商',
  PRIMARY KEY (`MyPrizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_propagandatemplate` */

DROP TABLE IF EXISTS `mp_propagandatemplate`;

CREATE TABLE `mp_propagandatemplate` (
  `TemplateID` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片模板自增',
  `TemplateCode` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `TemplateName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片名（地址）',
  `TemplateType` int(11) DEFAULT NULL COMMENT '图片类型：0-默认宣传图',
  `TemplateImg` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `IsDel` int(11) DEFAULT NULL COMMENT '0未删除；1已经删除',
  `CreateOn` datetime DEFAULT NULL COMMENT '图片模板创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '图片模板最后更新时间',
  PRIMARY KEY (`TemplateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_publicitempool` */

DROP TABLE IF EXISTS `mp_publicitempool`;

CREATE TABLE `mp_publicitempool` (
  `QuestionID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公共试题ID',
  `QuestionGUID` varchar(50) NOT NULL COMMENT '公共试题GUID',
  `QuestionType` int(11) NOT NULL DEFAULT '1' COMMENT '题型（单选1，多选2，填空3，判断4，简答5）',
  `UserNameCreate` varchar(200) NOT NULL COMMENT '试题创建用户名',
  `UserNameBelongTo` varchar(200) DEFAULT NULL COMMENT '试题归属用户名',
  `ExamPaperGUID` varchar(50) DEFAULT NULL COMMENT '试卷标识',
  `TradeFirstGenreCode` varchar(50) DEFAULT NULL COMMENT '试题一级行业分类代号',
  `TradeSecondGenreCode` varchar(50) DEFAULT NULL COMMENT '试题二级行业分类代号',
  `TradeThirdGenreCode` varchar(50) DEFAULT NULL COMMENT '试题三级行业分类代号',
  `QuestionTitle` varchar(2000) DEFAULT NULL COMMENT '试题题干',
  `QuestionPureText` varchar(2000) DEFAULT NULL COMMENT '纯文本试题题干',
  `QuestionImg` varchar(200) DEFAULT NULL COMMENT '题干包含图片',
  `KnowledgePoint` varchar(200) DEFAULT NULL COMMENT '试题知识点',
  `OptionJson` varchar(1500) DEFAULT NULL COMMENT '选项JSON',
  `StandardAnswer` varchar(2000) DEFAULT NULL COMMENT '试题标准答案',
  `IsUseStandardAnswer` int(11) NOT NULL DEFAULT '1' COMMENT '是否使用标准答案1:使用0：不使用',
  `PublishDateTime` datetime DEFAULT NULL COMMENT '试题发布日期',
  `IsSingleQuestion` int(11) NOT NULL DEFAULT '0' COMMENT '是否单题 0:不是  1：是',
  `VisitStatus` int(11) NOT NULL DEFAULT '1' COMMENT '试题的可访问状态: 1=公开，2=半公开，3=私有',
  `PublicStatus` int(11) NOT NULL DEFAULT '1' COMMENT '1:未发布 2：待审核 3：已发布 4：被拒绝',
  `DelStatus` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态：0=正常，1=逻辑删除,2=彻底删除',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  `AnswerAnalysis` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`QuestionID`),
  KEY `IDX_PublicItemPool` (`QuestionType`,`QuestionTitle`(255),`KnowledgePoint`,`UserNameCreate`,`OptionJson`(255)),
  KEY `IDX_QuestionGUID` (`QuestionGUID`),
  KEY `IDX_KeyWord` (`QuestionTitle`(255),`KnowledgePoint`),
  KEY `IDX_DelStatus` (`DelStatus`),
  KEY `IDX_UserNameCreate` (`UserNameCreate`),
  KEY `IDX_QuestionTitle` (`QuestionTitle`(255)),
  KEY `IDX_KnowledgePoint` (`KnowledgePoint`)
) ENGINE=InnoDB AUTO_INCREMENT=57923 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_publicitempoolcount` */

DROP TABLE IF EXISTS `mp_publicitempoolcount`;

CREATE TABLE `mp_publicitempoolcount` (
  `QuestionUsedID` bigint(11) NOT NULL AUTO_INCREMENT,
  `QuestionGUID` varchar(50) NOT NULL COMMENT '公共试题GUID',
  `ReferenceCount` bigint(11) NOT NULL DEFAULT '0' COMMENT '试题被引次数',
  `CollectCount` bigint(11) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `CorrectCount` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题答题正确次数（试卷）',
  `AnswerQuestionCount` bigint(11) NOT NULL DEFAULT '0' COMMENT '答题次数（试卷）',
  `SingleCorrectCount` bigint(20) NOT NULL DEFAULT '0' COMMENT '单题答题正确次数',
  `SingleAnswerQuestionCount` bigint(20) NOT NULL DEFAULT '0' COMMENT '单题答题次数',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`QuestionUsedID`),
  KEY `IDX_CountQuestionGUID` (`QuestionGUID`)
) ENGINE=MyISAM AUTO_INCREMENT=56777 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_receivemessage` */

DROP TABLE IF EXISTS `mp_receivemessage`;

CREATE TABLE `mp_receivemessage` (
  `ReceiveMsgID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ReceiveMsgGUID` varchar(50) NOT NULL,
  `MessageGUID` varchar(50) NOT NULL COMMENT '消息GUID',
  `UserNameCreate` varchar(200) NOT NULL COMMENT '消息发送人用户名',
  `NickName` varchar(200) DEFAULT NULL COMMENT '消息发送人昵称或者机构名',
  `UserNameReceive` varchar(200) DEFAULT NULL COMMENT '消息接收人用户名：个人',
  `ReceiveDateTime` datetime DEFAULT NULL COMMENT '消息接收时间',
  `ExpireDateTime` datetime DEFAULT NULL COMMENT '消息过期时间',
  `DelStatus` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态；0=正常，1=逻辑删除，2=彻底删除',
  `ReceiveStatus` int(11) NOT NULL DEFAULT '0' COMMENT '消息接收状态：0=未接收，1=已接收',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后修改时间',
  `UserTypeReceive` int(11) NOT NULL,
  PRIMARY KEY (`ReceiveMsgID`),
  KEY `IDX_UserNameReceive` (`UserNameReceive`)
) ENGINE=InnoDB AUTO_INCREMENT=682 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_recommendjournal` */

DROP TABLE IF EXISTS `mp_recommendjournal`;

CREATE TABLE `mp_recommendjournal` (
  `JournalId` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) DEFAULT NULL COMMENT '期刊代码（4个字母）',
  `Name` varchar(200) DEFAULT NULL COMMENT '期刊中文名字',
  `NameEn` varchar(200) DEFAULT NULL COMMENT '期刊英文名字',
  `LastPeriod` varchar(50) DEFAULT NULL COMMENT '最新期刊',
  `TenAlbumCode` varchar(20) DEFAULT NULL COMMENT '10大专辑代码',
  `168Code` varchar(100) DEFAULT NULL COMMENT '168专题代码',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`JournalId`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_resourcerecommend` */

DROP TABLE IF EXISTS `mp_resourcerecommend`;

CREATE TABLE `mp_resourcerecommend` (
  `RecommendId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增标识',
  `RecommendGuid` varchar(50) NOT NULL COMMENT '资源推荐唯一标识',
  `IndustryCode` varchar(50) DEFAULT NULL COMMENT '分类代码',
  `IndustryLevel` int(11) DEFAULT NULL COMMENT '分类所属级别',
  `ResourceLevel` int(11) DEFAULT NULL COMMENT '推荐的内容所属级别 进来时的序号',
  `ResourceType` int(11) DEFAULT NULL COMMENT '资源类型 1竞赛  2试卷 3单题  4机构',
  `ResourceGuid` varchar(50) DEFAULT NULL COMMENT '推荐对象的GUID',
  `ResourceTitle` varchar(2000) DEFAULT NULL COMMENT '推荐对象的标题',
  `ResourceImgUrl` varchar(200) DEFAULT NULL COMMENT '推荐对象的图片地址',
  `IsMustRecommend` int(11) DEFAULT NULL COMMENT '本资源第一次是否必推',
  `RecommendTime` datetime DEFAULT NULL COMMENT '推荐时间',
  `ExpirationTime` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`RecommendId`),
  KEY `IDX_IndustryCode` (`IndustryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2276557 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_searchhistory` */

DROP TABLE IF EXISTS `mp_searchhistory`;

CREATE TABLE `mp_searchhistory` (
  `SearchHistoryID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '搜索记录表主键',
  `SearchHistoryGUID` varchar(50) NOT NULL COMMENT '搜索记录标识',
  `CurrentUserName` varchar(100) DEFAULT NULL COMMENT '当前用户名',
  `CurrentUserNick` varchar(100) DEFAULT NULL COMMENT '当前用户昵称',
  `LocationType` int(11) NOT NULL COMMENT '搜索位置类型：0:全部 1：试卷 2：竞赛 3：单题 4：用户',
  `KeyWord` varchar(200) DEFAULT NULL COMMENT '搜索关键词',
  `IP` varchar(50) NOT NULL COMMENT '用户Ip',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`SearchHistoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=43179 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_sectionitempool` */

DROP TABLE IF EXISTS `mp_sectionitempool`;

CREATE TABLE `mp_sectionitempool` (
  `SectionItemPoolID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '试卷栏目试题ID',
  `TemporaryQuesGUID` varchar(50) DEFAULT NULL COMMENT '临时试题标识',
  `SectionGUID` varchar(50) NOT NULL COMMENT '栏目标识',
  `ExamPaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `QuestionGUID` varchar(50) NOT NULL COMMENT '试题标识',
  `TradeFirstGenreCode` varchar(50) DEFAULT NULL COMMENT '试题一级行业分类代号',
  `TradeSecondGenreCode` varchar(50) DEFAULT NULL COMMENT '试题二级行业分类代号',
  `TradeThirdGenreCode` varchar(50) DEFAULT NULL COMMENT '试题三级行业分类代号',
  `QuestionType` int(11) NOT NULL DEFAULT '1' COMMENT '题型（单选1，多选2，填空3，判断4，简答5）',
  `SequenceNumber` int(11) NOT NULL DEFAULT '1' COMMENT '试题排序序号：对于试题库随机类试卷，该排序无效，只有固定试题试卷才有效。',
  `CreateUserName` varchar(50) NOT NULL COMMENT '试题创建用户名',
  `UserName` varchar(200) DEFAULT NULL COMMENT '试题归属用户名',
  `UnitName` varchar(200) DEFAULT NULL COMMENT '试题归属机构名称',
  `Question` varchar(2000) DEFAULT NULL COMMENT '试题题干',
  `QuestionPureText` varchar(2000) DEFAULT NULL COMMENT '纯文本试题题干',
  `QuestionImg` varchar(200) DEFAULT NULL COMMENT '题干包含图片',
  `KnowledgePoint` varchar(200) DEFAULT NULL COMMENT '题目知识点（知识点;分隔）',
  `Option` varchar(1500) DEFAULT NULL COMMENT '选项XML或者JSON',
  `StandardAnswer` varchar(2000) DEFAULT NULL COMMENT '试题标准答案  填空题，同一个空的可选答案之间用&@&分割 不校验答案顺序%*%',
  `QuestionScore` int(11) NOT NULL DEFAULT '0' COMMENT '本题分值',
  `SourceType` int(11) NOT NULL DEFAULT '1' COMMENT '试题来源：1：用户新添加试题 2：引用公开试题或者个人私有试题',
  `IsAotoGiveScore` int(11) NOT NULL DEFAULT '0' COMMENT '是否自动评分：1=自动，2=人工',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  `AnswerAnalysis` mediumtext CHARACTER SET utf8mb4 COMMENT '答案解析',
  `AdKeywords` varchar(400) DEFAULT NULL COMMENT '广告关键词（这里记录关键词的Guid，使用'',''分割）',
  PRIMARY KEY (`SectionItemPoolID`),
  UNIQUE KEY `IDX_ExamPaperGUID_QuestionGUID` (`ExamPaperGUID`,`QuestionGUID`),
  KEY `IDX_SectionGUID` (`SectionGUID`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=105031 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_singlequestionanswer` */

DROP TABLE IF EXISTS `mp_singlequestionanswer`;

CREATE TABLE `mp_singlequestionanswer` (
  `SingleQueAnswerID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SingleQueAnswerGUID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '单题答题标识',
  `QuestionGUID` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '试题标识',
  `UserNameExaminee` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '考生用户名',
  `UserAnswer` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '考生的答案',
  `CorrectOrNot` int(11) NOT NULL DEFAULT '0' COMMENT '是否正确：0=错误(部分正确)，1=正确',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  `DelStatus` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态，0=整除，1=删除',
  `IsAnonymity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SingleQueAnswerID`),
  KEY `IDX_sQuestionGUID` (`QuestionGUID`),
  KEY `IDX_sUserNameExaminee` (`UserNameExaminee`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_siteresources` */

DROP TABLE IF EXISTS `mp_siteresources`;

CREATE TABLE `mp_siteresources` (
  `ResourceID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ResourceGUID` varchar(50) DEFAULT NULL COMMENT '资源Guid',
  `ResourceCode` int(11) DEFAULT NULL COMMENT '资源代码',
  `ResourceType` int(11) DEFAULT NULL COMMENT '资源类型，1:页面，2:按钮',
  `Name` varchar(200) DEFAULT NULL COMMENT '资源名称',
  `Text` varchar(200) DEFAULT NULL COMMENT '显示文本',
  `Link` varchar(500) DEFAULT NULL COMMENT '链接',
  `Script` varchar(200) DEFAULT NULL COMMENT 'JavaScript脚本',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`ResourceID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_smallguest` */

DROP TABLE IF EXISTS `mp_smallguest`;

CREATE TABLE `mp_smallguest` (
  `GuestId` bigint(20) NOT NULL AUTO_INCREMENT,
  `GuestGUID` varchar(60) DEFAULT NULL,
  `GuestIP` varchar(200) DEFAULT NULL COMMENT '访客IP',
  `GuestProvince` varchar(100) DEFAULT NULL COMMENT '访客省份',
  `AccessTime` datetime DEFAULT NULL COMMENT '访客来访时间',
  `PaperId` bigint(20) NOT NULL COMMENT '答题的试卷ID',
  `GuestScore` int(11) NOT NULL COMMENT '游客得分',
  `Randdom` varchar(30) DEFAULT NULL COMMENT '游客每次答题的随机数',
  `StartTime` datetime DEFAULT NULL COMMENT '答题开始时间',
  `FinishTime` datetime DEFAULT NULL COMMENT '答题结束时间',
  `TakeTimeSecond` bigint(20) NOT NULL COMMENT '耗时秒数',
  `Openid` varchar(200) DEFAULT NULL COMMENT '加密后的openid',
  PRIMARY KEY (`GuestId`),
  KEY `index_PaperId` (`PaperId`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_smallpapers` */

DROP TABLE IF EXISTS `mp_smallpapers`;

CREATE TABLE `mp_smallpapers` (
  `PaperId` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaperGUID` varchar(60) DEFAULT NULL COMMENT '试卷GUID',
  `PaperImage` varchar(500) DEFAULT NULL,
  `PaperTitle` varchar(500) DEFAULT NULL COMMENT '试卷标题',
  `PaperCategoryName` varchar(500) DEFAULT NULL COMMENT '试卷分类名称（赛点）',
  `CategoryCode` varchar(100) DEFAULT NULL COMMENT '分类代码（赛点）',
  `QuestionCount` int(11) NOT NULL COMMENT '本卷试题数目（随机抽取）',
  `RandomConfig` varchar(100) DEFAULT NULL COMMENT '随机试题分配策略{ Random : 0, QType1: 10 ,QType2: 10 ,QType3: 10 ,QType4: 10 }',
  `LimitTimeLength` int(11) NOT NULL DEFAULT '0' COMMENT '答题限时（秒,0表示不限时）',
  `SumCount` int(11) NOT NULL COMMENT '试题总数目',
  `SumScore` int(11) NOT NULL COMMENT '试卷总分',
  PRIMARY KEY (`PaperId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_smallquestions` */

DROP TABLE IF EXISTS `mp_smallquestions`;

CREATE TABLE `mp_smallquestions` (
  `QuestionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `QuestionGUID` varchar(60) DEFAULT NULL,
  `PaperId` bigint(20) NOT NULL COMMENT '所属试卷',
  `QuestionType` int(11) NOT NULL COMMENT '题目类型：1=选择，2=多选，3=判断，4=填空',
  `QuestionScore` int(11) NOT NULL COMMENT '试题分数',
  `QuestionTitle` varchar(1000) DEFAULT NULL COMMENT '题干',
  `StandardAnswer` varchar(2000) DEFAULT NULL COMMENT '标准答案',
  `QuestionOptions` text COMMENT '试题选项',
  `CreateOn` datetime NOT NULL,
  PRIMARY KEY (`QuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=1262 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_specifywinners` */

DROP TABLE IF EXISTS `mp_specifywinners`;

CREATE TABLE `mp_specifywinners` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Tel` char(11) NOT NULL,
  `Level` smallint(6) NOT NULL,
  `ActivityCode` varchar(10) NOT NULL,
  `ExpressNumber` varchar(100) DEFAULT NULL,
  `CreateOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1701 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_topscoreinfo` */

DROP TABLE IF EXISTS `mp_topscoreinfo`;

CREATE TABLE `mp_topscoreinfo` (
  `TopScoreID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TopScoreGUID` varchar(50) CHARACTER SET utf8 NOT NULL,
  `ActivityGUID` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动标识',
  `ExamPaperGUID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '试卷标识（公共试卷）',
  `ExamineePaperGUID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '考卷标识',
  `UserNameExaminee` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '考生用户名',
  `ExamPaperScore` int(11) NOT NULL DEFAULT '0' COMMENT '试卷得分',
  `ScoreLevel` int(11) NOT NULL DEFAULT '4' COMMENT '分数等级(0:零分 1:优秀 2:良好 3:及格 4:不及格 100:满分)',
  `FullScore` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总分',
  `ResponseLimitCount` int(11) NOT NULL DEFAULT '1' COMMENT '答题次数',
  `TakeTime` int(11) NOT NULL DEFAULT '0' COMMENT '答题耗时(秒)',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '最后修改时间',
  `StartTime` datetime NOT NULL,
  `SubmitTime` datetime NOT NULL,
  PRIMARY KEY (`TopScoreID`),
  KEY `IDX_ExamPaperGUID` (`ExamPaperGUID`),
  KEY `IDX_ExamineePaperGUID` (`ExamineePaperGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=4763 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_trafficrecommend` */

DROP TABLE IF EXISTS `mp_trafficrecommend`;

CREATE TABLE `mp_trafficrecommend` (
  `RID` int(11) NOT NULL AUTO_INCREMENT COMMENT '推荐ID',
  `OneName` varchar(30) DEFAULT NULL COMMENT '一级名称',
  `OneCode` varchar(30) DEFAULT NULL COMMENT '一级代码',
  `TwoName` varchar(30) DEFAULT NULL COMMENT '二级名称',
  `TwoCode` varchar(30) DEFAULT NULL COMMENT '二级代码',
  `ThreeName` varchar(30) DEFAULT NULL COMMENT '三级名称',
  `ThreeCode` varchar(30) DEFAULT NULL COMMENT '三级代码',
  `RecommendGrade` int(11) DEFAULT NULL COMMENT '推荐根据级别：1，one；2，two；3，three；',
  `Type` smallint(6) DEFAULT NULL COMMENT '推荐资源类型：1,期刊；2，知网书；',
  `ObjectName` varchar(200) DEFAULT NULL COMMENT '推荐内容的名称',
  `ObjectCode` varchar(20) DEFAULT NULL COMMENT '推荐内容的编码',
  `Author` varchar(100) DEFAULT NULL COMMENT '作者：',
  `Achievement` varchar(20) DEFAULT NULL COMMENT '成就：优先顺序：独家>获奖>核心',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_user` */

DROP TABLE IF EXISTS `mp_user`;

CREATE TABLE `mp_user` (
  `UserID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserGUID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户标识',
  `UserName` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '知网用户名',
  `UserNick` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '本系统昵称',
  `UserType` int(11) DEFAULT NULL COMMENT '用户类型：1:个人，2：机构；3：被机构授权的个人',
  `RealName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户真实姓名',
  `Tel` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号/电话',
  `UserAvatar` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '个人头像',
  `IsVerifyTel` int(11) DEFAULT NULL COMMENT '是否验证过手机号/电话 1:未验证 2：已验证',
  `UserSex` int(11) NOT NULL DEFAULT '0' COMMENT '性别；0:保密,1:男,2:女',
  `UserJob` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '职业',
  `UserCompany` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在的工作单位',
  `Birthday` date DEFAULT NULL COMMENT '生日',
  `UserNameInstitution` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '机构知网用户名 当用户类型为3的时候',
  `InstitutionName` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '机构名称',
  `TotalIntegral` bigint(20) DEFAULT NULL COMMENT '账户总积分',
  `IsInstituAuthentication` int(11) DEFAULT NULL COMMENT '是否通过机构认证',
  `BriefIntroduction` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '简介',
  `IsRegisterHere` int(11) DEFAULT NULL COMMENT '是否是通过赛点系统注册用户',
  `AddressProvince` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址-省份',
  `AddressCity` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址-城市',
  `AddressArea` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址-区、县',
  `AddressDetailed` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址-详细地址',
  `IsBlackListUser` int(11) NOT NULL DEFAULT '0' COMMENT '是否是黑名单用户',
  `Note` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户备注（管理员使用）',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `LatestUpdate` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `IDX_UserGUID` (`UserGUID`),
  UNIQUE KEY `IDX_UserName` (`UserName`),
  KEY `IDX_UserType` (`UserType`)
) ENGINE=InnoDB AUTO_INCREMENT=5366 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_userbindweixin` */

DROP TABLE IF EXISTS `mp_userbindweixin`;

CREATE TABLE `mp_userbindweixin` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CnkiUserName` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '知网账号',
  `WXNickName` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '微信昵称',
  `WXHeadimgurl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '微信头像url',
  `Openid` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '加密后的openid',
  `CreateOn` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IDX_openid` (`Openid`),
  KEY `IDX_CnkiUserName` (`CnkiUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `mp_userevent` */

DROP TABLE IF EXISTS `mp_userevent`;

CREATE TABLE `mp_userevent` (
  `EventID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '事件动态自增ID',
  `EventGUID` varchar(50) NOT NULL COMMENT '动态标识',
  `EventType` int(11) NOT NULL COMMENT '动态的类型：1=发布试卷，2=评价了试卷，3=参加了竞赛，4=参加了试卷，5=参加了单题，6=关注机构（暂时没有，二期会有）,7=发布了单题,8=关注了用户',
  `UserName` varchar(200) NOT NULL COMMENT '发生动态用户名',
  `MainMessageGUID` varchar(50) NOT NULL COMMENT '主要信息标识',
  `ExamPaperGUID` varchar(50) DEFAULT NULL COMMENT '试卷标识',
  `ActivityGUID` varchar(50) DEFAULT NULL COMMENT '活动标识',
  `QuestionGUID` varchar(50) DEFAULT NULL COMMENT '公共试题GUID',
  `ExamType` int(11) DEFAULT NULL COMMENT '考试试卷类型：1=普通试卷，2=竞赛试卷',
  `EPATitle` varchar(50) DEFAULT NULL COMMENT '试卷标题名称',
  `EPABriefIntroduction` text,
  `AnswerTotalPersonCount` int(11) DEFAULT '0' COMMENT '试卷被答题人数',
  `CommentGrade` int(11) DEFAULT '0' COMMENT '试卷评分（用户对试卷出的好坏的评分的平均分，满分10分）',
  `CommentTotalCount` int(11) DEFAULT '0' COMMENT '试卷总评论数(试卷评分人数？)',
  `ActivityUnit` varchar(200) DEFAULT NULL COMMENT '活动举办单位',
  `HasPrize` int(11) DEFAULT '0' COMMENT '是否有奖品：0=无奖品，1=有奖品',
  `ActivityBriefIntroduction` text,
  `ActivityImgUrl` varchar(300) DEFAULT NULL COMMENT '活动宣传图',
  `QuestionType` int(11) DEFAULT '1' COMMENT '题型（单选1，多选2，填空3，判断4，简答5）',
  `QuestionTitle` varchar(2000) DEFAULT NULL COMMENT '试题题干',
  `TradeFirstGenreCode` varchar(50) DEFAULT NULL COMMENT '试题一级行业分类代号',
  `TradeSecondGenreCode` varchar(50) DEFAULT NULL COMMENT '试题二级行业分类代号',
  `TradeThirdGenreCode` varchar(50) DEFAULT NULL COMMENT '试题三级行业分类代号',
  `KnowledgePoint` varchar(200) DEFAULT NULL COMMENT '试题知识点',
  `FollowUserType` int(11) DEFAULT NULL COMMENT '关注的用户类型：1=个人，2=机构',
  `FollowUserName` varchar(200) DEFAULT NULL COMMENT '关注的用户Cnki账户名',
  `FollowUserNickName` varchar(100) DEFAULT NULL COMMENT '关注的用户昵称或者机构名',
  `VisitStatus` int(11) DEFAULT NULL COMMENT '试题的可访问状态: 1=公开，2=半公开，3=私有',
  `UserAvatar` varchar(200) DEFAULT NULL COMMENT '个人头像',
  `ExamCommentGUID` varchar(50) DEFAULT NULL COMMENT '试卷评论GUID',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LastestUpdate` datetime NOT NULL COMMENT '最后更新',
  PRIMARY KEY (`EventID`),
  KEY `IDX_UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=27295 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_uservisitlog` */

DROP TABLE IF EXISTS `mp_uservisitlog`;

CREATE TABLE `mp_uservisitlog` (
  `VisitID` int(11) NOT NULL AUTO_INCREMENT,
  `VisitGuid` varchar(50) NOT NULL COMMENT '到访Guid',
  `VisitedUserName` varchar(200) NOT NULL COMMENT '被访问用户的用户名',
  `VisitUserName` varchar(200) NOT NULL COMMENT '到访用户的用户名',
  `VisitUserNick` varchar(200) DEFAULT NULL COMMENT '到访用户的用户昵称',
  `VisitUserAvatar` varchar(200) DEFAULT NULL COMMENT '到访用户的个人头像',
  `CreateOn` datetime NOT NULL COMMENT '创建日期',
  `LatestUpdate` datetime NOT NULL,
  PRIMARY KEY (`VisitID`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_wenjuananswers` */

DROP TABLE IF EXISTS `mp_wenjuananswers`;

CREATE TABLE `mp_wenjuananswers` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `WenJuanExamineGuid` varchar(50) DEFAULT NULL COMMENT '答卷guid',
  `WenJuanGuid` varchar(50) DEFAULT NULL COMMENT '问卷guid',
  `QuestionGuid` varchar(50) DEFAULT NULL COMMENT '题目guid',
  `QuestionType` int(11) NOT NULL COMMENT '题目类别',
  `SequenceNumber` int(11) NOT NULL COMMENT '题目序号',
  `UserAnswer` varchar(50) DEFAULT NULL COMMENT '用户答案',
  `UserAnswerExt` varchar(512) DEFAULT NULL COMMENT '用户答案扩展',
  `CreateOn` datetime NOT NULL COMMENT '答题时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1792 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_wenjuanexamine` */

DROP TABLE IF EXISTS `mp_wenjuanexamine`;

CREATE TABLE `mp_wenjuanexamine` (
  `WenJuanExamineId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '考生答卷id',
  `WenJuanExamineGuid` varchar(50) DEFAULT NULL COMMENT '考神答卷guid',
  `WenJuanGuid` varchar(50) DEFAULT NULL COMMENT '问卷guid',
  `UserNameExaminee` varchar(50) DEFAULT NULL COMMENT '被调查者用户名（可以是匿名用户）',
  `ExamineeIP` varchar(32) DEFAULT NULL COMMENT '被调查者ip',
  `IP_Country` varchar(128) DEFAULT NULL COMMENT 'ip国家',
  `IP_Province` varchar(128) DEFAULT NULL COMMENT 'ip省份',
  `IP_City` varchar(128) DEFAULT NULL COMMENT 'ip城市',
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `SubmitTime` datetime NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`WenJuanExamineId`),
  KEY `PRIMARY_GUID` (`WenJuanExamineGuid`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_wenjuaninfo` */

DROP TABLE IF EXISTS `mp_wenjuaninfo`;

CREATE TABLE `mp_wenjuaninfo` (
  `WenJuanId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '问卷表主键',
  `WenJuanGuid` varchar(50) NOT NULL COMMENT '问卷表标识',
  `ShortAddressId` varchar(50) DEFAULT NULL COMMENT '自定义Id，用于设置Url（短地址）',
  `ActivityGUID` varchar(50) DEFAULT NULL COMMENT '关联的竞赛Guid',
  `WenJuanTitle` varchar(50) NOT NULL COMMENT '问卷的标题',
  `BriefIntroduction` varchar(500) DEFAULT NULL COMMENT '问卷的导语',
  `TotalQuestionCount` int(11) NOT NULL DEFAULT '0' COMMENT '问卷的题目数量',
  `HasAnswerCount` int(11) NOT NULL DEFAULT '0' COMMENT '问卷已收集数量',
  `PublishInstitution` varchar(100) DEFAULT NULL COMMENT '发布机构（填写）',
  `PublishStatus` int(11) NOT NULL COMMENT '问卷的发布状态 100:编辑中 200:待审核 220:已拒绝 350:已暂停 500:已发布',
  `PublishDateTime` datetime DEFAULT NULL COMMENT '发布时间',
  `UserNameCreate` varchar(100) NOT NULL COMMENT '问卷创建人',
  `UserNameBlongTo` varchar(100) NOT NULL COMMENT '问卷归属人',
  `UserType` int(11) NOT NULL COMMENT '问卷归属人的用户类型：1：个人 2：机构',
  `MaxAnswerCount` int(11) NOT NULL DEFAULT '0' COMMENT '问卷最大收集数量',
  `IsShowSequenceNumber` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示题号',
  `WenJuanPassword` varchar(16) DEFAULT NULL COMMENT '问卷密码',
  `WenJuanLogo` varchar(50) DEFAULT NULL COMMENT '问卷Logo',
  `Auditor` varchar(50) DEFAULT NULL COMMENT '审核人（系统管理员UserName）',
  `AuditDateTime` datetime DEFAULT NULL COMMENT '审核时间',
  `RefuseReason` varchar(500) DEFAULT NULL COMMENT '拒绝原因',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `LatestUpdate` datetime NOT NULL COMMENT '修改时间第一次创建填充创建时间',
  `LotteryStatus` int(10) NOT NULL DEFAULT '0' COMMENT '抽奖功能(0:关闭 1:开启)',
  `ShareTitle` varchar(50) DEFAULT NULL COMMENT '分享功能标题',
  `ShareSubtitle` varchar(200) DEFAULT NULL COMMENT '分享功能副标题',
  `SharePicture` varchar(200) DEFAULT NULL COMMENT '分享功能图片',
  `OffShelf` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否下架：0=正常，1=下架',
  PRIMARY KEY (`WenJuanId`),
  UNIQUE KEY `ShortAddressId` (`ShortAddressId`),
  KEY `IDX_WenJuanGuid` (`WenJuanGuid`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;

/*Table structure for table `mp_wenjuanquestion` */

DROP TABLE IF EXISTS `mp_wenjuanquestion`;

CREATE TABLE `mp_wenjuanquestion` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '问卷试题表Id',
  `QuestionGuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '问卷试题表标识',
  `WenJuanGuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '问卷表标识',
  `QuestionType` int(11) NOT NULL DEFAULT '1' COMMENT '题型（单选1，多选2，填空3，量表4）',
  `IsRequire` int(11) NOT NULL DEFAULT '0' COMMENT '是否必填 0：非必填 1：必填     对于单选多选 量表题有效',
  `SequenceNumber` int(11) NOT NULL DEFAULT '1' COMMENT '试题排序序号',
  `QuestionTitle` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '试题的题干',
  `QuestionTitlePureText` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '纯文本试题题干',
  `QuestionOption` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '[{"Key":"A","Value":"剪不断","IsInput":0,"Must":0,"Rule":"email"}] 单选or多选',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `UpdateTime` datetime NOT NULL COMMENT '修改时间第一次创建填充创建时间',
  `MutiMinSel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '多选题最小选择数量  0：不限制',
  `MutiMaxSel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '多选题最大选择数量  0：不限制',
  PRIMARY KEY (`Id`),
  KEY `IDX_QuestionGuid` (`QuestionGuid`),
  KEY `IDX_WenJuanGuid` (`WenJuanGuid`)
) ENGINE=InnoDB AUTO_INCREMENT=931 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `ol_attendnum` */

DROP TABLE IF EXISTS `ol_attendnum`;

CREATE TABLE `ol_attendnum` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ExamDate` varchar(20) DEFAULT NULL COMMENT '比赛日期',
  `AttendNum` bigint(10) DEFAULT NULL COMMENT '当天参赛人数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Table structure for table `ol_examattend` */

DROP TABLE IF EXISTS `ol_examattend`;

CREATE TABLE `ol_examattend` (
  `AttendID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '账户名',
  `ExamDate` date NOT NULL COMMENT '考试日期',
  `SubjectCode` varchar(100) NOT NULL COMMENT '主题代码',
  `PaperGUID` varchar(50) NOT NULL COMMENT '试卷标识',
  `PaperType` varchar(2) NOT NULL COMMENT '试卷类型：A或者B',
  `CreateOn` datetime NOT NULL,
  `IsShared` int(4) DEFAULT '0' COMMENT '是否分享',
  PRIMARY KEY (`AttendID`)
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8;

/*Table structure for table `ol_examschedule` */

DROP TABLE IF EXISTS `ol_examschedule`;

CREATE TABLE `ol_examschedule` (
  `ScheduleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ExamDate` date NOT NULL,
  `SubjectTitle` varchar(500) NOT NULL COMMENT '考试的主题标题',
  `SubjectShowName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) NOT NULL COMMENT '主题编码',
  `APaperGUID` varchar(50) NOT NULL COMMENT 'A试卷',
  `BPaperGUID` varchar(50) NOT NULL COMMENT 'B试卷',
  `SequenceNumber` int(11) NOT NULL COMMENT '显示次序',
  `CreateON` datetime NOT NULL COMMENT '创建日期',
  `IsUpdateWinAward` int(1) NOT NULL DEFAULT '0' COMMENT '是否已经更新获奖名单',
  PRIMARY KEY (`ScheduleID`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

/*Table structure for table `ol_mailingaddress` */

DROP TABLE IF EXISTS `ol_mailingaddress`;

CREATE TABLE `ol_mailingaddress` (
  `AddressID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '获奖用户名',
  `Name` varchar(100) NOT NULL COMMENT '获奖者名字',
  `Address` varchar(500) DEFAULT NULL COMMENT '奖品邮寄地址',
  `Tel` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `Email` varchar(200) DEFAULT NULL COMMENT 'Email邮箱',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  `SubjectCode` varchar(20) DEFAULT NULL COMMENT '分类',
  `Ranking` varchar(4) DEFAULT NULL COMMENT '排名',
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8;

/*Table structure for table `ol_olympicschedule` */

DROP TABLE IF EXISTS `ol_olympicschedule`;

CREATE TABLE `ol_olympicschedule` (
  `OlympicscheduleID` bigint(5) NOT NULL AUTO_INCREMENT,
  `GameDate` datetime DEFAULT NULL,
  `Sports` varchar(100) DEFAULT NULL,
  `Gamesitems` varchar(100) DEFAULT NULL,
  `GamesRound` varchar(100) DEFAULT NULL,
  `GamesTime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OlympicscheduleID`)
) ENGINE=InnoDB AUTO_INCREMENT=1955 DEFAULT CHARSET=utf8;

/*Table structure for table `ol_winaward` */

DROP TABLE IF EXISTS `ol_winaward`;

CREATE TABLE `ol_winaward` (
  `WinAwardID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '获奖用户名',
  `UserNick` varchar(100) NOT NULL COMMENT '用户昵称',
  `SubjectShowName` varchar(100) NOT NULL COMMENT '考试主题',
  `SucjectCode` varchar(100) NOT NULL COMMENT '主题代码',
  `Ranking` int(11) NOT NULL COMMENT '名次',
  `Score` int(4) NOT NULL COMMENT '得分',
  `TakeTime` int(11) NOT NULL COMMENT '耗时(秒)',
  `ReceiveAward` int(4) NOT NULL COMMENT '是否领奖',
  `CreateOn` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`WinAwardID`)
) ENGINE=InnoDB AUTO_INCREMENT=1779 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_admin_log` */

DROP TABLE IF EXISTS `sys_admin_log`;

CREATE TABLE `sys_admin_log` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '操作人',
  `UserIP` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '登录IP',
  `OperationType` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '操作类别',
  `TargetTable` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作对象Table',
  `TargetId` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作对象ID',
  `TargetName` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作对象名称',
  `Note` varchar(3000) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作描述',
  `CreateOn` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3651 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `sys_content_log` */

DROP TABLE IF EXISTS `sys_content_log`;

CREATE TABLE `sys_content_log` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `TargetTable` varchar(50) DEFAULT NULL,
  `TargetId` varchar(50) DEFAULT NULL,
  `UserAgent` varchar(800) DEFAULT NULL,
  `IPAddress` varchar(20) DEFAULT NULL,
  `IPArea` varchar(100) DEFAULT NULL,
  `ContentFile` varchar(100) DEFAULT NULL,
  `CreateOn` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8;

/*Table structure for table `tablenamedictionary` */

DROP TABLE IF EXISTS `tablenamedictionary`;

CREATE TABLE `tablenamedictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `tabledescription` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `createman` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tm_applyinfo` */

DROP TABLE IF EXISTS `tm_applyinfo`;

CREATE TABLE `tm_applyinfo` (
  `ApplyID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplyGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '申请信息GUID',
  `UnitName` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '单位名称',
  `ContactName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '活动联系人',
  `ContactTel` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '联系电话',
  `Position` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人职务',
  `Province` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `City` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `County` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '县',
  `Email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `Postcode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `PeopleNumber` int(11) NOT NULL DEFAULT '0' COMMENT '参赛人数',
  `CreateOn` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`ApplyID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tm_mediareport` */

DROP TABLE IF EXISTS `tm_mediareport`;

CREATE TABLE `tm_mediareport` (
  `MediaReportID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '媒体报道表标识',
  `MediaReportIDGUID` varchar(50) NOT NULL COMMENT '媒体报道表标识',
  `MediaName` varchar(200) DEFAULT NULL COMMENT '媒体名称',
  `MediaUrl` varchar(200) DEFAULT NULL COMMENT '媒体链接',
  `MediaLogo` varchar(200) DEFAULT NULL COMMENT '媒体图片',
  `ReportTitle` varchar(10000) DEFAULT NULL COMMENT '报道的标题',
  `ReportUrl` varchar(200) DEFAULT NULL COMMENT '报道的文章链接',
  `ReportTime` datetime NOT NULL COMMENT '报道时间',
  `ReportType` varchar(10) DEFAULT '',
  PRIMARY KEY (`MediaReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

/*Table structure for table `tm_mediareportorigin` */

DROP TABLE IF EXISTS `tm_mediareportorigin`;

CREATE TABLE `tm_mediareportorigin` (
  `MediaReportID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MediaReportIDGUID` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `MediaName` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `MediaUrl` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `MediaLogo` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `ReportTitle` varchar(10000) COLLATE utf8_bin DEFAULT NULL,
  `ReportUrl` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `ReportTime` datetime DEFAULT NULL,
  `ReportType` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`MediaReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tm_questionbank` */

DROP TABLE IF EXISTS `tm_questionbank`;

CREATE TABLE `tm_questionbank` (
  `QuestionBankID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '临时题库标识',
  `QuestionGUID` varchar(50) NOT NULL COMMENT '试题标识',
  `TradeFirstGenreCode` varchar(50) DEFAULT NULL COMMENT '试题一级行业分类代号',
  `TradeSecondGenreCode` varchar(50) DEFAULT NULL COMMENT '试题二级行业分类代号',
  `TradeThirdGenreCode` varchar(50) DEFAULT NULL COMMENT '试题三级行业分类代号',
  `QuestionType` int(11) NOT NULL DEFAULT '1' COMMENT '题型（单选1，多选2，填空3，判断4，简答5）',
  `Question` varchar(2000) DEFAULT NULL COMMENT '试题题干',
  `QuestionPureText` varchar(2000) DEFAULT NULL COMMENT '纯文本试题题干',
  `KnowledgePoint` varchar(200) DEFAULT NULL COMMENT '题目知识点（知识点;分隔）',
  `Option` varchar(1500) DEFAULT NULL COMMENT '选项XML或者JSON',
  `StandardAnswer` varchar(2000) DEFAULT NULL COMMENT '试题标准答案',
  `AnswerAnalysis` text,
  PRIMARY KEY (`QuestionBankID`),
  KEY `IDX_TradeFirstGenreCode` (`TradeFirstGenreCode`),
  KEY `IDX_TradeSecondGenreCode` (`TradeSecondGenreCode`)
) ENGINE=InnoDB AUTO_INCREMENT=1749 DEFAULT CHARSET=utf8;

/*Table structure for table `vote_opus` */

DROP TABLE IF EXISTS `vote_opus`;

CREATE TABLE `vote_opus` (
  `OpusID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OpusGuid` varchar(50) DEFAULT NULL COMMENT '作品编号',
  `Author` varchar(200) DEFAULT NULL COMMENT '作者',
  `OpusName` varchar(500) DEFAULT NULL COMMENT '作品名称',
  `Channel` varchar(500) DEFAULT NULL COMMENT '作品来源的渠道（行业）',
  `Unit` varchar(500) DEFAULT NULL COMMENT '作品来源单位',
  `FileName` varchar(1000) DEFAULT NULL COMMENT '文件名',
  `VoteGuid` varchar(50) DEFAULT NULL COMMENT '投票活动标识',
  `Order` int(11) DEFAULT '0' COMMENT '作品出现次序',
  `VoteTimes` int(11) DEFAULT NULL COMMENT '投票的总次数',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`OpusID`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

/*Table structure for table `vote_userclick` */

DROP TABLE IF EXISTS `vote_userclick`;

CREATE TABLE `vote_userclick` (
  `ClickID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VoteGuid` varchar(50) DEFAULT NULL COMMENT '投票活动标识',
  `UserName` varchar(100) DEFAULT NULL COMMENT '投票用户名',
  `OpusGuid` varchar(50) DEFAULT NULL COMMENT '作品编号',
  `OpusID` bigint(20) DEFAULT NULL COMMENT '作品ID',
  `Ip` varchar(100) DEFAULT NULL COMMENT '投票用户IP',
  `Area` varchar(100) DEFAULT NULL COMMENT '区域',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ClickID`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Table structure for table `z_table` */

DROP TABLE IF EXISTS `z_table`;

CREATE TABLE `z_table` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/* Trigger structure for table `mp_publicitempool` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `t_insert_publicitempoolcount` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `t_insert_publicitempoolcount` AFTER INSERT ON `mp_publicitempool` FOR EACH ROW INSERT INTO `mp_publicitempoolcount`(QuestionGUID,CreateOn) 
VALUES(new.QuestionGUID, NOW()) */$$


DELIMITER ;

/* Function  structure for function  `recursionGetCategoryCode` */

/*!50003 DROP FUNCTION IF EXISTS `recursionGetCategoryCode` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `recursionGetCategoryCode`(areaId varchar(50)) RETURNS varchar(4000) CHARSET utf8
BEGIN 
DECLARE sTemp VARCHAR(4000) DEFAULT '';
DECLARE sTempChd VARCHAR(4000) DEFAULT '';
SET sTemp = '';
SET sTempChd = areaId;
WHILE sTempChd is not NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT group_concat(IndustryCode) INTO sTempChd FROM mp_industrycategory where FIND_IN_SET(ParentIndustryCode,sTempChd)>0;
END WHILE;
return sTemp;
END */$$
DELIMITER ;

/* Function  structure for function  `recursionGetParentCategoryCode` */

/*!50003 DROP FUNCTION IF EXISTS `recursionGetParentCategoryCode` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `recursionGetParentCategoryCode`(areaId varchar(50)) RETURNS varchar(4000) CHARSET utf8
BEGIN 
DECLARE sTemp VARCHAR(4000) DEFAULT '';
DECLARE sTempChd VARCHAR(4000) DEFAULT '';
SET sTemp = '';
SET sTempChd = areaId;
WHILE sTempChd is not NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT group_concat(ParentIndustryCode) INTO sTempChd FROM mp_industrycategory where FIND_IN_SET(IndustryCode,sTempChd)>0;
END WHILE;
return sTemp;
END */$$
DELIMITER ;

/* Function  structure for function  `row_number` */

/*!50003 DROP FUNCTION IF EXISTS `row_number` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `row_number`() RETURNS int(11)
begin
    set @rm = @m + 1 ;
    return @m ;
end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_aaaa` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_aaaa` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_aaaa`(
    IN `examineeguid` VARCHAR(50)
)
BEGIN
DECLARE cr_stack_depth INTEGER DEFAULT cr_debug.ENTER_MODULE2('sp_aaaa', 'matchpoint_db', 7, 100632)/*[cr_debug.1]*/;
    CALL cr_debug.UPDATE_WATCH3('`examineeguid`', `examineeguid`, 'VARCHAR(50)', cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.TRACE(4, 4, 0, 5, cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.TRACE(5, 14, 4, 86, cr_stack_depth)/*[cr_debug.2]*/;
UPDATE mp_examineequestions t1 INNER JOIN (    
        SELECT t.`ExamineeQueID`, t.`SequenceNum`, t.`SequenceNumber`, (@rowNum:=@rowNum+1) AS rowNo
        FROM (
		SELECT  q.`ExamineeQueID`, s.`SequenceNum`, q.`SequenceNumber` 
		FROM `mp_examineequestions` AS q  JOIN `mp_exampapersection` AS s ON s.`SectionGUID` = q.`SectionGUID`
		WHERE q.`ExamineePaperGUID` = examineeguid
		ORDER BY  s.`SequenceNum`) AS t, (SELECT (@rowNum := 0)) r        
        ) AS t2
    SET t1.SequenceNumber = t2.rowNo
    WHERE t1.ExamineePaperGUID = examineeguid AND t1.ExamineeQueID = t2.ExamineeQueID;
CALL cr_debug.UPDATE_SYSTEM_CALLS(104)/*[cr_debug.1]*/;  
CALL cr_debug.TRACE(15, 15, 0, 3, cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.LEAVE_MODULE(cr_stack_depth - 1)/*[cr_debug.2]*/;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_BatchUpdateExamineeQuestionSequenceNumber` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_BatchUpdateExamineeQuestionSequenceNumber` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_BatchUpdateExamineeQuestionSequenceNumber`(
    IN `paperGuid` VARCHAR (50)
)
BEGIN	
    -- 需要定义接收游标数据的变量 
    DECLARE examguid VARCHAR(50);
    -- 遍历数据结束标志
    DECLARE done bool DEFAULT FALSE;
    -- 游标
    DECLARE cur1 CURSOR FOR SELECT `ExamineePaperGUID` FROM `mp_examineepaperinfo` WHERE `ExamPaperGUID` = paperGuid;
    -- 将结束标志绑定到游标
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur1;
    
    read_loop: LOOP
        FETCH cur1 INTO examguid;
        IF done THEN
            LEAVE read_loop;
        else
            call `sp_aaaa`(examguid);        
        END IF;    
    END LOOP read_loop;
    
    CLOSE cur1;   
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CopyExamActivityInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CopyExamActivityInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CopyExamActivityInfo`(
  IN `paperGuid` VARCHAR (50),
  IN `userNameCreate` VARCHAR (50),
  OUT `outNewPaperGuid` VARCHAR (50),
  OUT `outFlag` INT,
  OUT `outErrorMsg` VARCHAR (200) 
)
BEGIN    -- 复制考试存储过程-lyw
    DECLARE thisActivityGUID VARCHAR(50) DEFAULT '';
    DECLARE thisNewActivityGUID VARCHAR(50) DEFAULT '';
    DECLARE thisNewPaperGuid VARCHAR(50) DEFAULT '';
    DECLARE thisActivityName VARCHAR(100) DEFAULT '';
    DECLARE thisExamPaperForm INT DEFAULT 0;
    DECLARE thisPublishStatus INT DEFAULT 0;
    DECLARE thisNewPublishStatus INT DEFAULT 0;
    DECLARE thisExamType INT DEFAULT 0;
    DECLARE thisUserType INT DEFAULT 0;
    DECLARE thisUserName VARCHAR(50) DEFAULT '';
    DECLARE thisUserNameCreate VARCHAR(50) DEFAULT '';
    DECLARE thisSectionIsMerged INT DEFAULT 0;
    -- 需要定义接收游标数据的变量    
    DECLARE currentSectionGuid VARCHAR(50) DEFAULT NULL ;
    DECLARE currentNewSectionGuid VARCHAR(50) DEFAULT NULL ;
    -- 遍历数据结束标志
    DECLARE done INT DEFAULT FALSE;
    -- 游标
    DECLARE cursor_copysection CURSOR FOR SELECT  `SectionGUID`  FROM `mp_exampapersection`  WHERE `ExamPaperGUID`=paperGuid;
    -- 将结束标志绑定到游标
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;    
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET outFlag = 1;
    SET outFlag=0; -- 0：初始值;1：程序内部错误;2：自定义错误;3：复制成功
    SET outErrorMsg='';
    IF EXISTS(SELECT * FROM mp_exampaperinfo WHERE ExamPaperGUID = paperGuid AND DelStatus = 0) THEN 
	SELECT e.ActivityGUID,e.ExamType,e.UserName,e.UserNameCreate,m.UserType INTO 
	thisActivityGUID,thisExamType,thisUserName,thisUserNameCreate,thisUserType
	FROM mp_exampaperinfo e JOIN mp_examactivity m ON m.ActivityGuid=e.ActivityGUID 
	WHERE e.ExamPaperGUID = paperGuid AND e.DelStatus = 0; 	     
            IF(thisExamType=1 AND thisActivityGUID IS NOT NULL AND thisActivityGUID <>'') THEN
                IF EXISTS(SELECT * FROM `mp_examactivity` WHERE ActivityGUID = thisActivityGUID AND DelStatus=0) THEN
		    SELECT ActivityName INTO thisActivityName FROM `mp_examactivity` WHERE ActivityGUID = thisActivityGUID AND DelStatus=0;
                    SET thisNewActivityGUID = CONCAT('ks',UUID());
                    SET thisNewPaperGuid = CONCAT('sj',UUID());
                    SET thisActivityName = CONCAT('(副本)',thisActivityName);
                    SET thisNewPublishStatus=IF(thisUserName=thisUserNameCreate AND thisUserType=2,200,100); -- 分100和200  当100时
                    START  TRANSACTION;
                    
                        -- 复制考试信息
                        INSERT INTO `mp_examactivity` (`ActivityGuid`,`PaperGuid`,`TradeFirstGenreCode`,`TradeSecondGenreCode`,`TradeThirdGenreCode`,`UserName`,`UserNameCreate`,`UserType`,`ActivityName`,
			`ActivityBriefIntroduction`,`NewActivityImg`,`StartTime`,`EndTime`,`FullScore`,`ExameRestrictType`,`LimitTime`,`AnnounceAnswerStatus`,`AnnounceAnswerDateTime`,`AnswerCountLimitStatus`,`WelcomePageLogo`,
			`IsVerifyTel`,`ShareTitle`,`ShareSubtitle`,`SharePicture`,`IsAllowComment`,
			`IsShowRealTimeStatus`,`IsShowPersonRanking`,`RankingShowColumns`,`RankingSplitColumns`,`ChartSetting`,`PublishStatus`,`CreateOn`,`LatestUpdate`,AntiCheating,IsOpenExercise,ExerciseQuesSource,ExerciseDisplayForm,ExerciseForm,SimulatedRaceUrl,ExerciseMemo
                        )
                        SELECT thisNewActivityGUID,`thisNewPaperGuid`,`TradeFirstGenreCode`,`TradeSecondGenreCode`,TradeThirdGenreCode,`UserName`,
                        userNameCreate,`UserType`,thisActivityName,`ActivityBriefIntroduction`,`NewActivityImg`,`StartTime`,`EndTime`,`FullScore`,`ExameRestrictType`,`LimitTime`,`AnnounceAnswerStatus`,`AnnounceAnswerDateTime`,`AnswerCountLimitStatus`,`WelcomePageLogo`,
			`IsVerifyTel`,`ShareTitle`,`ShareSubtitle`,`SharePicture`,`IsAllowComment`,
			`IsShowRealTimeStatus`,`IsShowPersonRanking`,`RankingShowColumns`,`RankingSplitColumns`,`ChartSetting`,thisNewPublishStatus,NOW(),NOW(),AntiCheating,IsOpenExercise,ExerciseQuesSource,ExerciseDisplayForm,ExerciseForm,SimulatedRaceUrl,ExerciseMemo FROM  `mp_examactivity` WHERE ActivityGUID = thisActivityGUID AND DelStatus=0;
                        
                        -- 复制试卷信息                        
                        INSERT INTO `mp_exampaperinfo` (`ExamPaperGUID`,`ActivityGUID`,`ExamType`,`ExamPaperForm`,`UserNameCreate`,`UserName`,`TotalSection`,`TotalQuestion`,`KnowledgePoint`,
			`PaperPublicityType`,IsUpsetOptions,`PublishStatus`,`CreateOn`,`LatestUpdate`
                        )
                         SELECT thisNewPaperGuid,thisNewActivityGUID,`ExamType`,`ExamPaperForm`,userNameCreate,`UserName`,`TotalSection`,
                        `TotalQuestion`,`KnowledgePoint`,`PaperPublicityType`,IsUpsetOptions,thisNewPublishStatus,NOW(),NOW()
                        FROM mp_exampaperinfo WHERE ExamPaperGUID = paperGuid AND DelStatus = 0;
                        
                        SET outNewPaperGuid = thisNewPaperGuid;
                        
                        -- 复制信息收集 
                        IF EXISTS(SELECT * FROM `mp_examineemsg` WHERE ExamPaperGUID=paperGuid AND IsTitle=1) THEN
                            INSERT INTO `mp_examineemsg` (`ExamineeMsgGUID`,  `ExamineePaperGUID`,  `ExamPaperGUID`,`ActivityGUID`,  `AttributeA`,  `AttributeB`,  `AttributeC`,
                            `AttributeD`,  `AttributeE`,  `AttributeF`,  `AttributeG`,  `AttributeH`,  `AttributeI`,  `AttributeJ`,  `AttributeK`,  `AttributeL`,  `CreateOn`,  `CreateUserName`,
                            `LastUpdate`,  `IsTitle`,TitleTip
                            ) SELECT UUID(),NULL,  thisNewPaperGuid, thisNewActivityGUID, `AttributeA`,  `AttributeB`,  `AttributeC`,
                            `AttributeD`,  `AttributeE`,  `AttributeF`,  `AttributeG`,  `AttributeH`,  `AttributeI`,  `AttributeJ`,  `AttributeK`,  `AttributeL`,NOW(),  userNameCreate,
                            NOW(),  `IsTitle`,TitleTip FROM mp_examineemsg WHERE ExamPaperGUID=paperGuid AND IsTitle=1;
                        END IF;
                        
                        -- 复制试卷限制信息
                        IF EXISTS(SELECT * FROM `mp_paperrestrictinfo` WHERE ExamPaperGuid=paperGuid AND RestrictType IN(2,3)) THEN
                            INSERT INTO `mp_paperrestrictinfo` (`RestrictInfoGUID`,  `ExamPaperGuid`,`ActivityGUID`,  `RestrictType`,  `PermitUser`,  `PermitUserName`,
                              `PermitGroup`,  `PermitGroupName`,  `Password`,  `CreateOn`,  `LastUpdate`,  `UserNameCreate`
                            ) SELECT UUID(),  thisNewPaperGuid, thisNewActivityGUID, `RestrictType`,  `PermitUser`,  `PermitUserName`,
                              `PermitGroup`,  `PermitGroupName`,  `Password`,NOW(),NOW(),userNameCreate 
                              FROM mp_paperrestrictinfo WHERE ExamPaperGuid=paperGuid AND RestrictType IN(2,3);
                        END IF;
                        
                        -- 复制章节 试题
                        IF (thisSectionIsMerged=1) THEN -- 存在章节合并 特殊处理
                            INSERT INTO `mp_mergesection` (`ExamPaperGUID`,  `MergeSectionGUID`,  `SectionGUID`,  `MergeSectionName`,
                              `MergerSectionSequenceNum`,  `TotalMark`, `TotalQuesCount`,  `CreateOn`,  `LatestUpdate`
                              ) SELECT  thisNewPaperGuid,  `MergeSectionGUID`,  `SectionGUID`,  `MergeSectionName`,
                              `MergerSectionSequenceNum`,  `TotalMark`, `TotalQuesCount`,  NOW(),  NOW() FROM mp_mergesection 
                              WHERE ExamPaperGUID = paperGuid;
                              -- 更新章节合并表新的guid
                              UPDATE mp_mergesection m INNER JOIN (SELECT MergeSectionGUID,UUID() AS newMergeSectionGuid FROM mp_mergesection WHERE ExamPaperGUID=thisNewPaperGuid  GROUP BY MergeSectionGUID)m1
                            ON m.MergeSectionGUID = m1.MergeSectionGUID SET m.MergeSectionGUID=m1.newMergeSectionGuid WHERE m.ExamPaperGUID=thisNewPaperGuid;                              
                    
                        END IF;
                        
                        OPEN cursor_copysection;    
                        --  开始循环 循环方法二 while
                            FETCH cursor_copysection INTO currentSectionGuid;
                            WHILE (!done) DO 
                                SET currentNewSectionGuid = CONCAT('zj',UUID());                                            
                                IF (thisSectionIsMerged=1 AND (SELECT COUNT(1) FROM `mp_mergesection` WHERE ExamPaperGUID=thisNewPaperGuid AND SectionGUID=currentSectionGuid)>0) THEN
                                    -- 更新章节guid到最新的章节guid
                                    UPDATE `mp_mergesection` SET SectionGUID = currentNewSectionGuid WHERE ExamPaperGUID =thisNewPaperGuid AND SectionGUID = currentSectionGuid;
                                END IF;    
                                INSERT INTO `mp_exampapersection` (`SectionGUID`,  `ExamPaperGUID`,  `SectionName`,  `TotalMark`,  `TotalQuesCount`, 
                                 `RandomQuesCount`,  `IsRandom`,  `SequenceNum`,  `CreateOn`,  `LatestUpdate`,  `QuestionType`,  `ScorePerQues`
                                ) SELECT currentNewSectionGuid,  thisNewPaperGuid,  `SectionName`,  `TotalMark`,  `TotalQuesCount`, 
                                 `RandomQuesCount`,  `IsRandom`,  `SequenceNum`,NOW(),NOW(),  `QuestionType`,  `ScorePerQues` 
                                 FROM `mp_exampapersection` WHERE ExamPaperGUID = paperGuid AND SectionGUID = currentSectionGuid;
                                 INSERT INTO `mp_sectionitempool` (`SectionGUID`,  `ExamPaperGUID`,  `QuestionGUID`,  `TradeFirstGenreCode`,
                                  `TradeSecondGenreCode`,  `TradeThirdGenreCode`,  `QuestionType`,  `SequenceNumber`,  `CreateUserName`,  `UserName`,  `UnitName`,  `Question`,
                                  `QuestionPureText`,  `QuestionImg`,  `KnowledgePoint`,  `Option`,  `StandardAnswer`,  `QuestionScore`,  `SourceType`,  `IsAotoGiveScore`,  `CreateOn`,
                                  `LatestUpdate`,  `AnswerAnalysis`
                                ) SELECT currentNewSectionGuid,thisNewPaperGuid,QuestionGUID,`TradeFirstGenreCode`,
                                  `TradeSecondGenreCode`,  `TradeThirdGenreCode`,  `QuestionType`,  `SequenceNumber`,  userNameCreate,  `UserName`,  `UnitName`,  `Question`,
                                  `QuestionPureText`,  `QuestionImg`,  `KnowledgePoint`,  `Option`,  `StandardAnswer`,  `QuestionScore`,2,  `IsAotoGiveScore`,NOW(),
                                  NOW(),  `AnswerAnalysis` FROM `mp_sectionitempool` WHERE ExamPaperGUID = paperGuid AND SectionGUID = currentSectionGuid;                                
                                FETCH cursor_copysection INTO currentSectionGuid;
                            END WHILE;
                        -- 关闭游标
                        CLOSE cursor_copysection;
                        
                        
                    IF outFlag = 1 THEN  
                        ROLLBACK;
                        
                    ELSE  
                        COMMIT;  
                        SET outFlag=3;
                        SET outErrorMsg='复制完成！';
                    END IF;        
                ELSE
                    SET outFlag=2;
                    SET outErrorMsg='考试信息不存在！';
                END IF;
            ELSE
                SET outFlag=2;
                SET outErrorMsg='试卷还未发布，不能复制！';
            END IF;
    ELSE 
        SET outFlag=2;
        SET outErrorMsg='试卷找不到，可能已经被删除！';
    END IF;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CopyExamPaperInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CopyExamPaperInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CopyExamPaperInfo`(
  IN `paperGuid` VARCHAR (50),
  IN `userNameCreate` VARCHAR (50),
  OUT `outNewPaperGuid` VARCHAR (50),
  OUT `outFlag` INT,
  OUT `outErrorMsg` VARCHAR (200) 
)
BEGIN	-- 复制竞赛存储过程-lyw
	DECLARE thisActivityGUID VARCHAR(50) DEFAULT '';
	DECLARE thisNewActivityGUID VARCHAR(50) DEFAULT '';
	DECLARE thisNewPaperGuid VARCHAR(50) DEFAULT '';
	DECLARE thisActivityName VARCHAR(100) DEFAULT '';
	DECLARE thisExamPaperForm INT DEFAULT 0;
	DECLARE thisPublishStatus INT DEFAULT 0;
	DECLARE thisNewPublishStatus INT DEFAULT 0;
	DECLARE thisExamType INT DEFAULT 0;
	DECLARE thisUserType INT DEFAULT 0;
	DECLARE thisUserName VARCHAR(50) DEFAULT '';
	DECLARE thisUserNameCreate VARCHAR(50) DEFAULT '';
	DECLARE thisSectionIsMerged INT DEFAULT 0;
	-- 需要定义接收游标数据的变量	
	DECLARE currentSectionGuid VARCHAR(50) DEFAULT NULL ;
	DECLARE currentNewSectionGuid VARCHAR(50) DEFAULT NULL ;
	-- 遍历数据结束标志
	DECLARE done INT DEFAULT FALSE;
	-- 游标
	DECLARE cursor_copysection CURSOR FOR SELECT  `SectionGUID`  FROM `mp_exampapersection`  WHERE `ExamPaperGUID`=paperGuid;
	-- 将结束标志绑定到游标
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;	
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET outFlag = 1;
	-- begin	
-- 		
-- 		-- select @@error;
-- 		 GET DIAGNOSTICS CONDITION 1 
-- 		 @pcode=RETURNED_SQLSTATE;        
-- 		insert into `z_table` (name) values(@pcode);
-- 	end;
	SET outFlag=0; -- 0：初始值;1：程序内部错误;2：自定义错误;3：复制成功
	SET outErrorMsg='';
	IF EXISTS(SELECT *FROM mp_exampaperinfo WHERE ExamPaperGUID = paperGuid AND DelStatus = 0) THEN 
		SELECT e.ActivityGUID,e.ExamType,e.UserName,e.UserNameCreate,m.UserType INTO 
		thisActivityGUID,thisExamType,thisUserName,thisUserNameCreate,thisUserType
		FROM mp_exampaperinfo e JOIN mp_matchactivity m ON m.ActivityGuid=e.ActivityGUID 
		WHERE e.ExamPaperGUID = paperGuid AND e.DelStatus = 0; 		
		-- if(thisPaperPublishStatus=500) then
			IF(thisExamType=2 AND thisActivityGUID IS NOT NULL AND thisActivityGUID <>'') THEN
				IF EXISTS(SELECT * FROM `mp_matchactivity` WHERE ActivityGUID = thisActivityGUID AND DelStatus=0) THEN
					SELECT ActivityName INTO thisActivityName FROM `mp_matchactivity` WHERE ActivityGUID = thisActivityGUID AND DelStatus=0;
					SET thisNewActivityGUID = CONCAT('hd',UUID());
					SET thisNewPaperGuid=CONCAT('sj',UUID());
					SET thisActivityName = CONCAT('(副本)',thisActivityName);
					SET thisNewPublishStatus=IF(thisUserName=thisUserNameCreate AND thisUserType=2,200,100); -- 分100和200  当100时
					START  TRANSACTION;
					
						-- 复制竞赛信息
						INSERT INTO `mp_matchactivity` (`ActivityGUID`,`PaperGuid`,`UserName`,`UserNameCreate`,`UserType`,`TradeFirstGenreCode`,`TradeSecondGenreCode`,`TradeThirdGenreCode`,
						`ActivityName`,`ActivityBriefIntroduction`,`ActivityUnit`,`UndertakeUnitName`,`AssitUnitName`,`CertificateImg`,`NewActivityImg`,`BigActivityImg`,`StartTime`,`EndTime`,`FullScore`,`WelcomePageLogo`,
						`IsVerifyTel`,`ExameRestrictType`,`LimitTime`,`AnswerCountLimitStatus`,`AnnounceAnswerStatus`,`AnnounceAnswerDateTime`,`HasPrize`,`PrizeRule`,`PrizeInfo`,`RankingShowColumns`,
						`RankingSplitColumns`,`ChartSetting`,`IsShowRealTimeStatus`,`IsShowPersonRanking`,`IsPublishResult`,`IsAllowComment`,
						`ShareTitle`,`ShareSubtitle`,`SharePicture`,`PublishStatus`,`CreateOn`,`LatestUpdate`,AntiCheating,Announcement,IsOpenExercise,ExerciseQuesSource,ExerciseDisplayForm,ExerciseForm,SimulatedRaceUrl,ExerciseMemo
						)
						SELECT thisNewActivityGUID,thisNewPaperGuid,thisUserName,userNameCreate,`UserType`,`TradeFirstGenreCode`,`TradeSecondGenreCode`,`TradeThirdGenreCode`,
						thisActivityName,`ActivityBriefIntroduction`,`ActivityUnit`,`UndertakeUnitName`,`AssitUnitName`,`CertificateImg`,`NewActivityImg`,`BigActivityImg`,`StartTime`,`EndTime`,`FullScore`,`WelcomePageLogo`,
						`IsVerifyTel`,`ExameRestrictType`,`LimitTime`,`AnswerCountLimitStatus`,`AnnounceAnswerStatus`,`AnnounceAnswerDateTime`,`HasPrize`,`PrizeRule`,`PrizeInfo`,`RankingShowColumns`,
						`RankingSplitColumns`,`ChartSetting`,`IsShowRealTimeStatus`,`IsShowPersonRanking`,`IsPublishResult`,`IsAllowComment`,
						`ShareTitle`,`ShareSubtitle`,`SharePicture`,thisNewPublishStatus,NOW(),NOW(),AntiCheating,Announcement,IsOpenExercise,ExerciseQuesSource,ExerciseDisplayForm,ExerciseForm,SimulatedRaceUrl,ExerciseMemo FROM `mp_matchactivity` WHERE ActivityGUID = thisActivityGUID AND DelStatus=0;
						
						-- 复制试卷信息						
						
						INSERT INTO `mp_exampaperinfo` (`ExamPaperGUID`,`ActivityGUID`,`ExamType`,`ExamPaperForm`,`UserNameCreate`,`UserName`,`TotalSection`,`TotalQuestion`,`KnowledgePoint`,
						`PaperPublicityType`,IsUpsetOptions,`PublishStatus`,`CreateOn`,`LatestUpdate`
						)
						 SELECT thisNewPaperGuid,thisNewActivityGUID,`ExamType`,`ExamPaperForm`,userNameCreate,thisUserName,`TotalSection`,
						`TotalQuestion`,`KnowledgePoint`,`PaperPublicityType`,IsUpsetOptions,thisNewPublishStatus,NOW(),NOW()
						FROM mp_exampaperinfo WHERE ExamPaperGUID = paperGuid AND DelStatus = 0;
						
						SET outNewPaperGuid = thisNewPaperGuid;
						
						-- 复制信息收集 
						IF EXISTS(SELECT * FROM `mp_examineemsg` WHERE ExamPaperGUID=paperGuid AND IsTitle=1) THEN
							INSERT INTO `mp_examineemsg` (`ExamineeMsgGUID`,  `ExamineePaperGUID`,  `ExamPaperGUID`,`ActivityGUID`,`AttributeA`,  `AttributeB`,  `AttributeC`,
							`AttributeD`,  `AttributeE`,  `AttributeF`,  `AttributeG`,  `AttributeH`,  `AttributeI`,  `AttributeJ`,  `AttributeK`,  `AttributeL`,  `CreateOn`,  `CreateUserName`,
							`LastUpdate`,  `IsTitle`,TitleTip
							) SELECT UUID(),NULL,  thisNewPaperGuid,thisNewActivityGUID,`AttributeA`,  `AttributeB`,  `AttributeC`,
							`AttributeD`,  `AttributeE`,  `AttributeF`,  `AttributeG`,  `AttributeH`,  `AttributeI`,  `AttributeJ`,  `AttributeK`,  `AttributeL`,NOW(),  userNameCreate,
							NOW(),  `IsTitle`,TitleTip FROM mp_examineemsg WHERE ExamPaperGUID=paperGuid AND IsTitle=1;
						END IF;
						
						-- 复制试卷限制信息
						IF EXISTS(SELECT * FROM `mp_paperrestrictinfo` WHERE ExamPaperGuid=paperGuid AND RestrictType IN(2,3)) THEN
							INSERT INTO `mp_paperrestrictinfo` (`RestrictInfoGUID`,  `ExamPaperGuid`,`ActivityGUID`,`RestrictType`,  `PermitUser`,  `PermitUserName`,
							  `PermitGroup`,  `PermitGroupName`,  `Password`,  `CreateOn`,  `LastUpdate`,  `UserNameCreate`
							) SELECT UUID(),  thisNewPaperGuid,thisNewActivityGUID,`RestrictType`,  `PermitUser`,  `PermitUserName`,
							  `PermitGroup`,  `PermitGroupName`,  `Password`,NOW(),NOW(),userNameCreate 
							  FROM mp_paperrestrictinfo WHERE ExamPaperGuid=paperGuid AND RestrictType IN(2,3);
						END IF;
						
						-- 复制章节 试题
						IF (thisSectionIsMerged=1) THEN -- 存在章节合并 特殊处理
							INSERT INTO `mp_mergesection` (`ExamPaperGUID`,  `MergeSectionGUID`,  `SectionGUID`,  `MergeSectionName`,
							  `MergerSectionSequenceNum`,  `TotalMark`, `TotalQuesCount`,  `CreateOn`,  `LatestUpdate`
							  ) SELECT  thisNewPaperGuid,  `MergeSectionGUID`,  `SectionGUID`,  `MergeSectionName`,
							  `MergerSectionSequenceNum`,  `TotalMark`, `TotalQuesCount`,  NOW(),  NOW() FROM mp_mergesection 
							  WHERE ExamPaperGUID = paperGuid;
							  -- 更新章节合并表新的guid
							  UPDATE mp_mergesection m INNER JOIN (SELECT MergeSectionGUID,UUID() AS newMergeSectionGuid FROM mp_mergesection WHERE ExamPaperGUID=thisNewPaperGuid  GROUP BY MergeSectionGUID)m1
							ON m.MergeSectionGUID = m1.MergeSectionGUID SET m.MergeSectionGUID=m1.newMergeSectionGuid WHERE m.ExamPaperGUID=thisNewPaperGuid;							  
					
						END IF;
						
						OPEN cursor_copysection;	
						--  开始循环 循环方法二 while
							FETCH cursor_copysection INTO currentSectionGuid;
							WHILE (!done) DO 
								SET currentNewSectionGuid = CONCAT('zj',UUID());											
								IF (thisSectionIsMerged=1 AND (SELECT COUNT(1) FROM `mp_mergesection` WHERE ExamPaperGUID=thisNewPaperGuid AND SectionGUID=currentSectionGuid)>0) THEN
									-- 更新章节guid到最新的章节guid
									UPDATE `mp_mergesection` SET SectionGUID = currentNewSectionGuid WHERE ExamPaperGUID =thisNewPaperGuid AND SectionGUID = currentSectionGuid;
								END IF;	
								INSERT INTO `mp_exampapersection` (`SectionGUID`,  `ExamPaperGUID`,  `SectionName`,  `TotalMark`,  `TotalQuesCount`, 
								 `RandomQuesCount`,  `IsRandom`,  `SequenceNum`,  `CreateOn`,  `LatestUpdate`,  `QuestionType`,  `ScorePerQues`
								) SELECT currentNewSectionGuid,  thisNewPaperGuid,  `SectionName`,  `TotalMark`,  `TotalQuesCount`, 
								 `RandomQuesCount`,  `IsRandom`,  `SequenceNum`,NOW(),NOW(),  `QuestionType`,  `ScorePerQues` 
								 FROM `mp_exampapersection` WHERE ExamPaperGUID = paperGuid AND SectionGUID = currentSectionGuid;
								 
								  INSERT INTO `mp_sectionitempool` (`SectionGUID`,  `ExamPaperGUID`,  `QuestionGUID`,  `TradeFirstGenreCode`,
								  `TradeSecondGenreCode`,  `TradeThirdGenreCode`,  `QuestionType`,  `SequenceNumber`,  `CreateUserName`,  `UserName`,  `UnitName`,  `Question`,
								  `QuestionPureText`,  `QuestionImg`,  `KnowledgePoint`,  `Option`,  `StandardAnswer`,  `QuestionScore`,  `SourceType`,  `IsAotoGiveScore`,  `CreateOn`,
								  `LatestUpdate`,  `AnswerAnalysis`
								) SELECT currentNewSectionGuid,thisNewPaperGuid,QuestionGUID,`TradeFirstGenreCode`,
								  `TradeSecondGenreCode`,  `TradeThirdGenreCode`,  `QuestionType`,  `SequenceNumber`,  userNameCreate,  `UserName`,  `UnitName`,  `Question`,
								  `QuestionPureText`,  `QuestionImg`,  `KnowledgePoint`,  `Option`,  `StandardAnswer`,  `QuestionScore`,2,  `IsAotoGiveScore`,NOW(),
								  NOW(),  `AnswerAnalysis` FROM `mp_sectionitempool` WHERE ExamPaperGUID = paperGuid AND SectionGUID = currentSectionGuid;								
								FETCH cursor_copysection INTO currentSectionGuid;
							END WHILE;
						-- 关闭游标
						CLOSE cursor_copysection;
						
						
					IF outFlag = 1 THEN  
						ROLLBACK;
					    
					ELSE  
						COMMIT;  
						SET outFlag=3;
						SET outErrorMsg='复制完成！';
					END IF;		
				ELSE
					SET outFlag=2;
					SET outErrorMsg='竞赛信息不存在！';
				END IF;
				
			ELSE
				SET outFlag=2;
				SET outErrorMsg='只能复制竞赛！';
			END IF;
				
		-- else 
			-- set outFlag=2;
			-- set outErrorMsg='试卷还未发布，不能复制！';
		-- end if;
	
	ELSE 
		SET outFlag=2;
		SET outErrorMsg='试卷找不到，可能已经被删除！';
	END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CopyWenJuanInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CopyWenJuanInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CopyWenJuanInfo`(
  IN `wjguid` VARCHAR (50),
  IN `userNameCreate` VARCHAR (50),
  OUT `outNewWenJuanGuid` VARCHAR (50),
  OUT `outFlag` INT,
  OUT `outErrorMsg` VARCHAR (200) 
)
BEGIN	-- 复制问卷存储过程-lyw
	DECLARE thisWenJuanGUID VARCHAR(50) DEFAULT '';
	DECLARE thisNewWenJuanGUID VARCHAR(50) DEFAULT '';
	DECLARE thisWenJuanTitle VARCHAR(50) DEFAULT '';
	DECLARE thisPublishStatus VARCHAR(50) DEFAULT '';
	DECLARE thisHasAnswerCount INT DEFAULT 0;	
	-- 需要定义接收游标数据的变量	
	DECLARE currentQuestionGUID VARCHAR(50) DEFAULT '';
	DECLARE currentNewQuestionGUID VARCHAR(50) DEFAULT '';
	-- 遍历数据结束标志
	DECLARE done INT DEFAULT FALSE;
	-- 游标
	DECLARE cursor_copyquestion CURSOR FOR SELECT  `QuestionGuid`  FROM `mp_wenjuanquestion`  WHERE `WenJuanGuid`=wjguid;
	-- 将结束标志绑定到游标
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;	
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET outFlag = 1;
	SET outFlag=0; -- 0：初始值;1：程序内部错误;2：自定义错误;3：复制成功
	SET outErrorMsg='';
	IF EXISTS(SELECT * FROM mp_wenjuaninfo WHERE WenJuanGuid = wjguid) THEN 
		-- SELECT `WenJuanGuid` as thisWenJuanGUID,`WenJuanTitle` as thisWenJuanTitle,PublishStatus as thisPublishStatus
		SELECT `WenJuanGuid`,`WenJuanTitle`,PublishStatus
		into thisWenJuanGUID,thisWenJuanTitle,thisPublishStatus
		FROM mp_wenjuaninfo WHERE WenJuanGuid = wjguid;
		-- IF(thisPublishStatus=500 or thisPublishStatus=350) THEN
			IF(thisWenJuanGUID IS NOT NULL AND thisWenJuanGUID <>'') THEN
					SET thisNewWenJuanGUID = CONCAT('wj',UUID());
					SET thisWenJuanTitle = CONCAT('(副本)',thisWenJuanTitle);
					SET thisPublishStatus=100;
					START  TRANSACTION;
					
						-- 复制问卷信息
						INSERT INTO `mp_wenjuaninfo` (`WenJuanGuid`,`WenJuanTitle`,`BriefIntroduction`,`TotalQuestionCount`,`HasAnswerCount`,`PublishInstitution`,
						`PublishStatus`,`UserNameCreate`,`UserNameBlongTo`,`UserType`,`MaxAnswerCount`,`IsShowSequenceNumber`,`WenJuanPassword`,`ShareTitle`,`ShareSubtitle`,`SharePicture`,
						`WenJuanLogo`,`CreateOn`,`LatestUpdate`
						)
						SELECT thisNewWenJuanGUID,thisWenJuanTitle,`BriefIntroduction`,`TotalQuestionCount`,thisHasAnswerCount,`PublishInstitution`,thisPublishStatus,userNameCreate,
						`UserNameBlongTo`,`UserType`,`MaxAnswerCount`,`IsShowSequenceNumber`,`WenJuanPassword`,`ShareTitle`,`ShareSubtitle`,`SharePicture`,`WenJuanLogo`,NOW(),NOW() 
						FROM  `mp_wenjuaninfo` WHERE WenJuanGuid = wjguid;
						set outNewWenJuanGuid = thisNewWenJuanGUID;
						-- 复制问卷试题
						OPEN cursor_copyquestion;	
						--  开始循环 循环方法二 while
							FETCH cursor_copyquestion INTO currentQuestionGUID;
							WHILE (!done) DO 
								SET currentNewQuestionGUID = CONCAT('st',UUID());											
								INSERT INTO `mp_wenjuanquestion` (`QuestionGuid`,  `WenJuanGuid`,  `QuestionType`,  `IsRequire`,  `SequenceNumber`, 
								 `QuestionTitle`,  `QuestionTitlePureText`,  `QuestionOption`,  `CreateTime`,  `UpdateTime`)
								 SELECT currentNewQuestionGUID,thisNewWenJuanGUID,`QuestionType`,`IsRequire`,
								  `SequenceNumber`,  `QuestionTitle`,  `QuestionTitlePureText`,  `QuestionOption`, NOW(),NOW()
								  FROM `mp_wenjuanquestion` WHERE WenJuanGuid = wenjuanGuid AND QuestionGuid = currentQuestionGUID;						
								FETCH cursor_copyquestion INTO currentQuestionGUID;
							END WHILE;
						-- 关闭游标
						CLOSE cursor_copyquestion;
					IF outFlag = 1 THEN  
						ROLLBACK;
					    
					ELSE  
						COMMIT;  
						SET outFlag=3;
						SET outErrorMsg='复制完成！';
					END IF;		
			ELSE
				SET outFlag=2;
				SET outErrorMsg='只能复制问卷！';
			END IF;
				
		-- ELSE 
			-- SET outFlag=2;
			-- SET outErrorMsg='问卷还未发布，不能复制！';
		-- END IF;
	
	ELSE 
		SET outFlag=2;
		SET outErrorMsg='问卷找不到，可能已经被删除！';
	END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CountQuestionsLevel` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CountQuestionsLevel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CountQuestionsLevel`(
	IN `paperGuid` VARCHAR(50),
	IN `ParticipteNumber` INT
)
BEGIN
	SELECT 'FullRight' AS QuJian ,COUNT(*) AS CorrectQuestions FROM 
	
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    -- JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = @exampaperguid
		    WHERE eq.ExamPaperGUID = paperGuid  
		    AND ParticipateNumber = ParticipteNumber
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate=1
	UNION 
	
	SELECT 'YouXiu' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    -- JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = @exampaperguid
		    WHERE eq.ExamPaperGUID = paperGuid  
		    AND ParticipateNumber = ParticipteNumber
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate<1 AND res.correctrate>=0.75	 
	 UNION
	 
	 SELECT 'LiangHao' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    -- JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = @exampaperguid
		    WHERE eq.ExamPaperGUID = paperGuid  
		    AND ParticipateNumber = ParticipteNumber
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate<0.75 AND res.correctrate>=0.5	 
	 UNION
	 
	SELECT 'JiGe' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    -- JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = @exampaperguid
		    WHERE eq.ExamPaperGUID = paperGuid  
		    AND ParticipateNumber = ParticipteNumber
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate<0.5 AND res.correctrate>=0.25	 
		
	 UNION
	 
	 SELECT 'BuJiGe' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    -- JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = @exampaperguid
		    WHERE eq.ExamPaperGUID = paperGuid  
		    AND ParticipateNumber = ParticipteNumber
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate<0.25 AND res.correctrate>0	 
		
	UNION
	SELECT 'zero' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    -- JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = @exampaperguid
		    WHERE eq.ExamPaperGUID = paperGuid  
		    AND ParticipateNumber = ParticipteNumber
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate=0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CountQuestionsLevelFromTopScore` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CountQuestionsLevelFromTopScore` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CountQuestionsLevelFromTopScore`(
	IN `paperGuid` VARCHAR(50)
)
BEGIN
	SELECT 'FullRight' AS QuJian ,COUNT(*) AS CorrectQuestions FROM 
	
		(sELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = paperGuid
		    WHERE eq.ExamPaperGUID = paperGuid  -- and ParticipateNumber = 1
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate=1
	UNION 
	
	SELECT 'YouXiu' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = paperGuid
		    WHERE eq.ExamPaperGUID = paperGuid  -- and ParticipateNumber = 1
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate<1 and res.correctrate>=0.75	 
	 UNION
	 
	 SELECT 'LiangHao' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = paperGuid
		    WHERE eq.ExamPaperGUID = paperGuid  -- and ParticipateNumber = 1
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate<0.75 AND res.correctrate>=0.5	 
	 UNION
	 
	SELECT 'JiGe' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = paperGuid
		    WHERE eq.ExamPaperGUID = paperGuid  -- and ParticipateNumber = 1
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate<0.5 AND res.correctrate>=0.25	 
		
	 UNION
	 
	 SELECT 'BuJiGe' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = paperGuid
		    WHERE eq.ExamPaperGUID = paperGuid  -- and ParticipateNumber = 1
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate<0.25 AND res.correctrate>0	 
		
	UNION
	SELECT 'zero' AS qujian ,COUNT(*) AS CorrectQuestions FROM 
		(SELECT s.SequenceNumber, s.ExamPaperGUID, s.QuestionGUID, s.QuestionType
		     , s.Question AS QuestionTitle, s.QuestionPureText     
		     , IFNULL(t1.GainFullScoreCount, 0) AS GainFullScoreCount
		     , IFNULL(t1.RowsCount, 0) AS RowsCount
		     , IFNULL((GainFullScoreCount / RowsCount), 1) AS CorrectRate
		FROM mp_sectionitempool AS s
		LEFT JOIN (
		    SELECT eq.QuestionGUID, SUM(eq.CorrectOrNot) AS GainFullScoreCount, COUNT(1) AS RowsCount
		    FROM mp_examineequestions AS eq
		    JOIN mp_topscoreinfo AS ts ON ts.ExamineePaperGUID = eq.ExamineePaperGUID AND ts.ExamPaperGUID = paperGuid
		    WHERE eq.ExamPaperGUID = paperGuid  -- and ParticipateNumber = 1
		    AND ((eq.IsCompletedMark = 1) OR (eq.IsCompletedMark = 0 AND eq.IsAnswered = 0))
		    GROUP BY eq.QuestionGUID
		) AS t1 ON s.QuestionGUID = t1.QuestionGUID
		WHERE s.ExamPaperGUID = paperGuid) AS res WHERE res.correctrate=0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CountScoreLevel` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CountScoreLevel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CountScoreLevel`(
	IN `paperGuid` VARCHAR(50),
	IN `FullScore` INT,
	IN `ParticipteNumber` INT,
	IN `MoreThanTimes` DOUBLE,
	IN `LessThanTimes` DOUBLE
)
BEGIN
	SELECT COUNT(*) FROM `mp_examineepaperinfo` 
	WHERE ExamPaperGUID=paperGuid 
	AND ParticipateNumber=ParticipteNumber
	AND UserScore >=FullScore * MoreThanTimes
	AND UserScore < FullScore*LessThanTimes;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CountScoreLevelFromTopScoreInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CountScoreLevelFromTopScoreInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CountScoreLevelFromTopScoreInfo`(
	IN `paperGuid` VARCHAR(50),
	IN `FullScore` INT,
	IN `MoreThanTimes` DOUBLE,
	IN `LessThanTimes` DOUBLE
)
BEGIN
	SELECT COUNT(*) FROM `mp_topscoreinfo` 
	WHERE ExamPaperGUID=paperGuid 
	AND ExamPaperScore >=FullScore * MoreThanTimes
	AND ExamPaperScore < FullScore*LessThanTimes;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CountShortAnswerQuestionsFromTopScoreInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CountShortAnswerQuestionsFromTopScoreInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CountShortAnswerQuestionsFromTopScoreInfo`(
	IN `paperGuid` VARCHAR(50),
	IN `queguid` VARCHAR(50),
	IN `QuestionScore` INT
)
BEGIN
       SELECT 'Full' AS OptionName ,COUNT(*) AS 'CorrectNumbers',
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions qs 
			INNER JOIN mp_topscoreinfo si 
			ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
			left join mp_user u 
			ON u.UserName=si.UserNameExaminee
			WHERE qs.`QuestionGUID` = queguid 
			AND qs.`ExamPaperGUID` = paperGuid
			AND qs.`GainScore`=10*1)
		AS OptionAnsweredName  
	FROM mp_examineequestions qs
	INNER JOIN mp_topscoreinfo si 
	ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
	WHERE qs.`QuestionGUID` = queguid 
	AND qs.`ExamPaperGUID` = paperGuid
	AND qs.`GainScore`=QuestionScore*1
		
	UNION
	
	SELECT 'Pass' AS OptionName ,COUNT(*) AS 'CorrectNumbers' ,
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions qs 
			INNER JOIN mp_topscoreinfo si 
			ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
			LEFT JOIN mp_user u 
			ON u.UserName=si.UserNameExaminee
			WHERE qs.`QuestionGUID` = queguid 
			AND qs.`ExamPaperGUID` = paperGuid
			AND qs.`GainScore`>=QuestionScore*0.5 
			AND qs.`GainScore`<QuestionScore*1) 
		AS OptionAnsweredName 
	FROM mp_examineequestions qs
	INNER JOIN mp_topscoreinfo si 
	ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
	WHERE qs.`QuestionGUID` = queguid 
	AND qs.`ExamPaperGUID` = paperGuid
	AND qs.`GainScore`>=QuestionScore*0.5 
	AND qs.`GainScore`<QuestionScore*1
		
	UNION
	
	SELECT 'NotPass' AS OptionName ,COUNT(*) AS 'CorrectNumbers' ,
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions qs 
			INNER JOIN mp_topscoreinfo si 
			ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
			LEFT JOIN mp_user u 
			ON u.UserName=si.UserNameExaminee
			WHERE qs.`QuestionGUID` = queguid 
			AND qs.`ExamPaperGUID` = paperGuid
			AND qs.`GainScore`>0 
			AND qs.`GainScore`<QuestionScore*0.5) 
		AS OptionAnsweredName 
	FROM mp_examineequestions qs
	INNER JOIN mp_topscoreinfo si 
	ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
	WHERE qs.`QuestionGUID` = queguid 
	AND qs.`ExamPaperGUID` = paperGuid
	AND qs.`GainScore`>0 
	AND qs.`GainScore`<QuestionScore*0.5
	
	UNION
	
	SELECT 'Zero' AS OptionName ,COUNT(*) AS 'CorrectNumbers' ,
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions qs 
			INNER JOIN mp_topscoreinfo si 
			ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
			LEFT JOIN mp_user u 
			ON u.UserName=si.UserNameExaminee
			WHERE qs.`QuestionGUID` = queguid 
			AND qs.`ExamPaperGUID` = paperGuid
			AND qs.`GainScore`=0  
			AND qs.`IsCompletedMark` = 1) 
		AS OptionAnsweredName 
	FROM mp_examineequestions qs
	INNER JOIN mp_topscoreinfo si 
	ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
	WHERE qs.`QuestionGUID` = queguid 
	AND qs.`ExamPaperGUID` = paperGuid
	AND qs.`GainScore`=0 
	AND qs.`IsCompletedMark` = 1
	
	UNION
	
	SELECT 'NotCompletedMark' AS OptionName ,COUNT(*) AS 'CorrectNumbers',
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions qs 
			INNER JOIN mp_topscoreinfo si 
			ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
			LEFT JOIN mp_user u 
			ON u.UserName=si.UserNameExaminee
			WHERE qs.`QuestionGUID` = queguid 
			AND qs.`ExamPaperGUID` = paperGuid
			AND qs.`MarkMode`= 2 
			AND qs.`IsCompletedMark` = 0) 
		AS OptionAnsweredName  
	FROM mp_examineequestions qs
	INNER JOIN mp_topscoreinfo si 
	ON qs.`ExamineePaperGUID` = si.`ExamineePaperGUID`
	WHERE qs.`QuestionGUID` = queguid 
	AND qs.`ExamPaperGUID` = paperGuid
	AND qs.`MarkMode`= 2 
	AND qs.`IsCompletedMark` = 0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CountShortAnswerQuestionsLevel` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CountShortAnswerQuestionsLevel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CountShortAnswerQuestionsLevel`(
	IN `paperGuid` VARCHAR(50),
	IN `queguid` VARCHAR(50),
	IN `QuestionScore` INT,
	IN `ParticipteNumber` INT
)
BEGIN
       SELECT 'Full' AS OptionName ,COUNT(*) AS 'CorrectNumbers',
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions que 
			LEFT JOIN mp_examineepaperinfo pap 
			ON que.examineepaperguid = pap.examineepaperguid 
			LEFT JOIN mp_user u 
			ON u.UserName=pap.UserNameExaminee
			WHERE que.exampaperguid = paperGuid 
			AND  que.`QuestionGUID` = queguid
			AND que.ParticipateNumber =ParticipteNumber 
			AND que.GainScore=QuestionScore*1)
	AS OptionAnsweredName  
	FROM mp_examineequestions 
	WHERE exampaperguid = paperGuid 
	and QuestionGUID = queguid 
	AND ParticipateNumber=ParticipteNumber 
	AND GainScore=QuestionScore*1
		
	UNION
	
	SELECT 'Pass' AS OptionName ,COUNT(*) AS 'CorrectNumbers' ,
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions que 
			LEFT JOIN mp_examineepaperinfo pap 
			ON que.examineepaperguid = pap.examineepaperguid 
			LEFT JOIN mp_user u 
			ON u.UserName=pap.UserNameExaminee
			WHERE que.exampaperguid = paperGuid 
			AND  que.`QuestionGUID` = queguid 
			AND que.ParticipateNumber =ParticipteNumber 
			AND que.`GainScore`>=QuestionScore*0.5 
			AND que.`GainScore`<QuestionScore*1) 
		AS OptionAnsweredName 
	FROM mp_examineequestions 
	WHERE exampaperguid = paperGuid 
	and QuestionGUID = queguid 
	AND ParticipateNumber=ParticipteNumber
	AND GainScore>=QuestionScore*0.5 
	AND GainScore<QuestionScore*1
		
	UNION
	
	SELECT 'NotPass' AS OptionName ,COUNT(*) AS 'CorrectNumbers' ,
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions que 
			LEFT JOIN mp_examineepaperinfo pap 
			ON que.examineepaperguid = pap.examineepaperguid 
			LEFT JOIN mp_user u 
			ON u.UserName=pap.UserNameExaminee
			WHERE que.exampaperguid = paperGuid 
			AND  que.`QuestionGUID` = queguid
			AND que.ParticipateNumber =ParticipteNumber 
			AND que.`GainScore`>0 AND que.`GainScore`<QuestionScore*0.5) 
		AS OptionAnsweredName 
	FROM mp_examineequestions 
	WHERE exampaperguid = paperGuid 
	and QuestionGUID = queguid 
	AND ParticipateNumber=ParticipteNumber 
	AND GainScore>0 AND GainScore<QuestionScore*0.5
	
	UNION
	
	SELECT 'Zero' AS OptionName ,COUNT(*) AS 'CorrectNumbers' ,
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') FROM mp_examineequestions que 
			LEFT JOIN mp_examineepaperinfo pap 
			ON que.examineepaperguid = pap.examineepaperguid 
			LEFT JOIN mp_user u 
			ON u.UserName=pap.UserNameExaminee
			WHERE que.exampaperguid = paperGuid 
			AND  que.`QuestionGUID` = queguid 
			AND que.ParticipateNumber =ParticipteNumber 
			AND que.`GainScore`=0  
			AND que.`IsCompletedMark` = 1) 
		AS OptionAnsweredName 
	FROM mp_examineequestions 
	WHERE exampaperguid = paperGuid 
	and QuestionGUID = queguid 
	AND ParticipateNumber=ParticipteNumber 
	AND GainScore=0 
	AND IsCompletedMark = 1
	
	UNION
	
	SELECT 'NotCompletedMark' AS OptionName ,COUNT(*) AS 'CorrectNumbers',
		(SELECT GROUP_CONCAT(DISTINCT(IFNULL(u.UserNick, u.UserName)) SEPARATOR ';') 
			FROM mp_examineequestions que 
			LEFT JOIN mp_examineepaperinfo pap 
			ON que.examineepaperguid = pap.examineepaperguid 
			LEFT JOIN mp_user u 
			ON u.UserName=pap.UserNameExaminee
			WHERE que.exampaperguid = paperGuid 
			AND  que.`QuestionGUID` = queguid 
			AND que.ParticipateNumber =ParticipteNumber 
			AND que.`MarkMode`= 2 
			AND que.`IsCompletedMark` = 0) 
		AS OptionAnsweredName  
	FROM mp_examineequestions 
	WHERE exampaperguid = paperGuid
	and QuestionGUID = queguid 
	AND ParticipateNumber=ParticipteNumber 
	AND MarkMode= 2 
	AND IsCompletedMark = 0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CountTodayTakeExamPersons` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CountTodayTakeExamPersons` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_CountTodayTakeExamPersons`(
	IN `paperGuid` VARCHAR(50),
	IN `TakeTime` DATETIME
)
BEGIN
	SELECT COUNT(*) FROM `mp_topscoreinfo` 
	WHERE ExamPaperGUID=paperGuid 
	AND StartTime > TakeTime;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createpaper` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createpaper` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_createpaper`(
  IN `paperId` VARCHAR (50),
  IN `examineNme` VARCHAR (50),
  OUT `outExamineePaperGUID` VARCHAR (50),
  OUT `outFlag` INT,
  OUT `outErrorMsg` VARCHAR (200) 
)
BEGIN
	DECLARE p_paperForm INT DEFAULT NULL ;
	DECLARE p_publishStatus INT DEFAULT NULL ;
	DECLARE p_countLimitStatus INT DEFAULT NULL ;  
	DECLARE p_activityGuid VARCHAR(50) DEFAULT NULL;
	DECLARE p_examType INT DEFAULT NULL;
	declare p_fullScore int default null;
  
	-- 需要定义接收游标数据的变量	
	DECLARE currentSectionGuid VARCHAR(50) DEFAULT NULL ;
	DECLARE currentQuesCount INT DEFAULT 0 ;
	DECLARE currentScorePerQues INT DEFAULT NULL ;
	DECLARE currentSql MEDIUMTEXT DEFAULT NULL ;
	-- 遍历数据结束标志
	DECLARE done INT DEFAULT FALSE;
	-- 游标
	DECLARE cursor_createpaper CURSOR FOR SELECT  `SectionGUID`,`RandomQuesCount`,`ScorePerQues`  FROM `mp_exampapersection`  WHERE `ExamPaperGUID`=paperId; -- AND `IsRandom`=1;
	-- 将结束标志绑定到游标
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;	
	SET outFlag=0;
	SET outErrorMsg='';
	SET currentQuesCount=0;	
	SET currentSql='';
	IF(`paperId` IS NOT NULL AND `examineNme` IS NOT NULL)  THEN -- 如果参数有效
		IF EXISTS(SELECT * FROM mp_exampaperinfo WHERE ExamPaperGUID = paperId) THEN 
			SELECT ExamPaperForm, ExamType, ActivityGUID INTO p_paperForm, p_examType, p_activityGuid FROM mp_exampaperinfo WHERE ExamPaperGUID = paperId;
			if(`p_examType` is not null and `p_examType` = 1) then
			    select PublishStatus, AnswerCountLimitStatus, FullScore into p_publishStatus, p_countLimitStatus, p_fullScore from mp_examactivity where ActivityGuid = p_activityGuid;
			elseif (`p_examType` is not null and `p_examType` = 2) then
			    select PublishStatus, AnswerCountLimitStatus, FullScore into p_publishStatus, p_countLimitStatus, p_fullScore from mp_matchactivity where ActivityGuid = p_activityGuid;
			end if;
			IF(`p_publishStatus` IS NOT NULL AND (`p_publishStatus` = 500 OR `p_publishStatus` = 350))  THEN -- 如果试卷已发布
			
				IF((p_countLimitStatus IS NOT NULL AND p_countLimitStatus = 0) OR (p_countLimitStatus IS NOT NULL AND p_countLimitStatus >(SELECT COUNT(1) FROM `mp_examineepaperinfo` WHERE `UserNameExaminee` = `examineNme` AND `ExamPaperGUID` = `paperId`)))   THEN
					
					IF(`p_paperForm` IS NOT NULL AND `p_paperForm` = 1) THEN -- 固定试卷
						SELECT CONCAT('kj',UUID()) INTO outExamineePaperGUID ;
						  -- 创建考生试题
						  INSERT INTO `mp_examineequestions` (
						    `ExamineeQuetionGUID`,
						    `SectionGUID`,
						    `ExamPaperGUID`,
						    `ExamineePaperGUID`,
						    `QuestionGUID`,
						    `QuestionType`,
						    `UserNameExaminee`,
						    `StandardAnswer`,
						    `SequenceNumber`,
						    `IsHasSign`,
						    `IsAnswered`,
						    `UserAnswer`,
						    `CorrectOrNot`,
						    `QuestionScore`,
						    `GainScore`,
						    `MarkMode`,
						    `IsCompletedMark`,
						    `CreateOn`,
						    `LatestUpdate`,
						    `UserNameMark`,
						    `MarkDateTime`,
						    `PaperPublishStatus`
						  ) 
						  SELECT 
						    CONCAT('kt',UUID()),
						    `SectionGUID`,
						    `ExamPaperGUID`,
						    `outExamineePaperGUID`,
						    `QuestionGUID`,
						    `QuestionType`,
						    `examineNme`,
						    `StandardAnswer`,
						    `SequenceNumber`,
						    0,
						    0,
						    '',
						    0,
						    QuestionScore,
						    0,
						    `IsAotoGiveScore`,
						    0,
						    NOW(),
						    NOW(),
						    '',
						    NULL,
						    p_publishStatus 
						  FROM
						    `mp_sectionitempool` 
						  WHERE `ExamPaperGUID` = paperId ;
						  -- 创建考生试卷
						  INSERT INTO `mp_examineepaperinfo` (
						    `ExamineePaperGUID`,
						    `ActivityGUID`,
						    `ExamPaperGUID`,
						    `ExamType`,
						    `UserNameExaminee`,
						    `UserNameExaminer`,
						    `SubmitMode`,
						    `ExamStatus`,
						    `CurrentQuestionGUID`,
						    `TotalQuestionCount`,
						    `CorrectTotalCount`,
						    `ErrorTotalCount`,
						    `IsDisplayScore`,
						    `StartTime`,
						    `SubmitTime`,
						    `TakeTime`,
						    `IsCompletedMark`,
						    `AutoScroe`,
						    `ManualScroe`,
						    `FullScore`,
						    `UserScore`,
						    `ScoreLevel`,
						    `Ranking`,
						    `CreateOn`,
						    `LatestUpdate`,
						    `PaperPublishStatus`
						  ) 
						  SELECT 
						    outExamineePaperGUID,
						    `ActivityGUID`,
						    `paperId`,
						    `ExamType`,
						    `examineNme`,
						    `UserName`,
						    0,
						    0,
						    '',
						    `TotalQuestion`,
						    0,
						    0,
						    1,
						    NULL,
						    NULL,
						    0,
						    0,
						    0,
						    0,
						    p_fullScore,
						    0,
						    0,
						    0,
						    NOW(),
						    NOW(),
						    p_publishStatus 
						  FROM
						    `mp_exampaperinfo` 
						  WHERE ExamPaperGUID = paperId ;
						  SET outErrorMsg = '创建成功' ;
						  SET outFlag = 1 ;
					  ELSEIF (`p_paperForm` IS NOT NULL AND `p_paperForm` = 2) THEN 
						SELECT CONCAT('kj',UUID()) INTO outExamineePaperGUID ;
						  
						SET currentSql=CONCAT("","INSERT INTO `mp_examineequestions` (`ExamineeQuetionGUID`,`SectionGUID`,`ExamPaperGUID`,`ExamineePaperGUID`,`QuestionGUID`,`QuestionType`,`UserNameExaminee`,`StandardAnswer`,`SequenceNumber`,`IsHasSign`,`IsAnswered`,`UserAnswer`,`CorrectOrNot`,`QuestionScore`,`GainScore`,`MarkMode`,`IsCompletedMark`,`CreateOn`,`LatestUpdate`,`UserNameMark`,`MarkDateTime`,`PaperPublishStatus`) 
						  SELECT CONCAT('kt',UUID()), t.`SectionGUID`,t.`ExamPaperGUID`,'",outExamineePaperGUID,"',t.`QuestionGUID`,t.`QuestionType`,'",examineNme,"',t.`StandardAnswer`,t.`SequenceNumber`,0,0,'',0,t.QuestionScore,0,t.`IsAotoGiveScore`,0,NOW(),NOW(),'',NULL,'",p_publishStatus,"' FROM (");
						-- 打开游标
						OPEN cursor_createpaper;	
						--  开始循环 循环方法二 while
						FETCH cursor_createpaper INTO currentSectionGuid,currentQuesCount,currentScorePerQues;
						WHILE (!done) DO 
							-- IF (currentSectionGuid is not null) THEN
							-- 创建考生试题					
						SET outFlag=1;
						SET currentSql=CONCAT(currentSql,"(SELECT FLOOR(100000*RAND()) AS randid ,s.`SectionGUID`,s.`ExamPaperGUID`,s.`QuestionGUID`,s.`QuestionType`,s.`Question`,s.`QuestionPureText`,s.`Option`,s.`KnowledgePoint`,s.`StandardAnswer`,s.`SequenceNumber`,",currentScorePerQues," as `QuestionScore`,s.`IsAotoGiveScore` FROM mp_sectionitempool s WHERE  s.SectionGUID='",currentSectionGuid,"' ORDER BY randid DESC LIMIT ",currentQuesCount,")");
					    
						SET currentSql=CONCAT(currentSql,"UNION ");				
				
					-- END IF;
					FETCH cursor_createpaper INTO currentSectionGuid,currentQuesCount,currentScorePerQues;
					END WHILE;
					-- 关闭游标
					CLOSE cursor_createpaper;
					
					SET @currentSql=CONCAT(SUBSTRING(currentSql, 1, LENGTH(currentSql)-6),")t;"); 
					PREPARE STMT FROM @currentSql; 
					
					EXECUTE STMT;
					DEALLOCATE PREPARE STMT;
						-- 创建考生试卷
						  INSERT INTO `mp_examineepaperinfo` (
						    `ExamineePaperGUID`,
						    `ActivityGUID`,
						    `ExamPaperGUID`,
						     ExamType,
						    `UserNameExaminee`,
						    `UserNameExaminer`,
						    `SubmitMode`,
						    `ExamStatus`,
						    `CurrentQuestionGUID`,
						    `TotalQuestionCount`,
						    `CorrectTotalCount`,
						    `ErrorTotalCount`,
						    `IsDisplayScore`,
						    `StartTime`,
						    `SubmitTime`,
						    `TakeTime`,
						    `IsCompletedMark`,
						    `AutoScroe`,
						    `ManualScroe`,
						    `FullScore`,
						    `UserScore`,
						    `ScoreLevel`,
						    `Ranking`,
						    `CreateOn`,
						    `LatestUpdate`,
						    `PaperPublishStatus`
						  ) 
						  SELECT 
						    outExamineePaperGUID,
						    `ActivityGUID`,
						    `paperId`,
						    `ExamType`,
						    `examineNme`,
						    `UserName`,
						    0,
						    0,
						    '',
						    `TotalQuestion`,
						    0,
						    0,
						    1,
						    NULL,
						    NULL,
						    0,
						    0,
						    0,
						    0,
						    p_fullScore,
						    0,
						    0,
						    0,
						    NOW(),
						    NOW(),
						    p_publishStatus 
						  FROM
						    `mp_exampaperinfo` 
						  WHERE ExamPaperGUID = paperId ;					
					
					-- select currentSql;
					SET outErrorMsg = '随机试卷生成试题成功';
					SET outFlag=1;					
				-- SET outFlag=1;		
				ELSE SET outErrorMsg = '错误，试卷类型不明确' ;
				END IF ;
			  ELSE SET outErrorMsg = '试卷答题次数限制，您不能再次答题' ;
			  SET outFlag = 0 ;
			  END IF ;
		  ELSE SET outErrorMsg = '试卷还未发布,不允许创建试卷' ;
		  SET outFlag = 0 ;
		  END IF ;
	  ELSE SET outErrorMsg = '未找到该试卷，创建失败' ;
	  SET outFlag = 0 ;
	  END IF ;
  ELSE SET outErrorMsg = '传入的参数为空' ;
  SET outFlag = 0 ;
  END IF ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_DeleteCollection` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_DeleteCollection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_DeleteCollection`(
IN InuserName VARCHAR(200),
IN IncollectionId BIGINT(20),
OUT outFlag INT(11),
OUT outMessage VARCHAR(200)
)
BEGIN
  DECLARE CollectionTagId BIGINT(20);
  DECLARE done Bool DEFAULT True;  -- 定义done这一句必须在下一句的前面
  DECLARE cursor_SelectCollection CURSOR FOR SELECT TagId FROM `t_collection_tag_mapping` WHERE CollectionID=IncollectionId;
  DECLARE exit HANDLER FOR NOT FOUND SET done=False;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET outFlag=-1;
  SET outFlag=0; -- 正确为1，错误为0
  SET outMessage='';
  IF EXISTS(SELECT * FROM `t_collection` WHERE CollectionId = IncollectionId AND userName=InuserName AND IsDel=0 ) THEN
      SELECT '开始事物';
       START TRANSACTION;
       OPEN cursor_SelectCollection;
      FETCH cursor_SelectCollection INTO CollectionTagId;
      select done;
      
      
      CLOSE cursor_SelectCollection;
        UPDATE `t_collection` SET IsDel=1 WHERE CollectionId = IncollectionId AND userName=InuserName;
        DELETE FROM `t_collection_tag_mapping` WHERE  CollectionId = IncollectionId;
      IF outFlag=-1 THEN
         SELECT '异常结束事物';
         ROLLBACK;
         SET outFlag=0;
         SET outMessage='SQL执行过程有错误!'; -- 赋值用单引号
      ELSE
         SELECT '正常结束事物';
         COMMIT;
         SET outFlag=1;
         SET outMessage='成功!';
      END IF;
  ELSE
      SELECT '文集表没有查询到该条数据!';
      SET outMessage='文集表没有查询到该条数据!';
  END IF;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_DeleteMergeSctionAndUpdateMergeSection` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_DeleteMergeSctionAndUpdateMergeSection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_DeleteMergeSctionAndUpdateMergeSection`(IN examPaperGuid VARCHAR(50))
BEGIN 
 DELETE FROM mp_mergeSection 
 WHERE NOT EXISTS 
 (
     SELECT es.sectionGuid FROM mp_exampapersection es WHERE es.sectionGuid=mp_mergeSection.sectionGuid
 )
 AND ExamPaperGUID=examPaperGuid;
 -- 更新`mp_mergesection`表中的数据
 
 UPDATE mp_mergeSection AS me 
       SET me.TotalQuesCount= 
        (
            SELECT m.TotalQuesCount FROM 
            (
		SELECT ms.`MergeSectionGUID`,SUM(es.`RandomQuesCount`) AS TotalQuesCount FROM mp_mergeSection  ms LEFT JOIN mp_exampapersection es 
		ON es.`SectionGUID`=ms.`SectionGUID` 
		GROUP BY ms.`MergeSectionGUID`
            ) m WHERE m.`MergeSectionGUID`=me.MergeSectionGUID
        ),
	me.TotalMark=
	(
	     SELECT mm.TotalMark FROM 
	     (
                 SELECT ms2.MergeSectionGUID,SUM(es2.`RandomQuesCount`*es2.`ScorePerQues`) AS TotalMark FROM mp_mergeSection  ms2 LEFT JOIN mp_exampapersection es2 
                 ON es2.`SectionGUID`=ms2.`SectionGUID` 
		 GROUP BY ms2.`MergeSectionGUID`
	      ) mm WHERE mm.`MergeSectionGUID`=me.MergeSectionGUID
	)
 WHERE me.ExamPaperGUID=examPaperGuid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getexamineeranking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getexamineeranking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_getexamineeranking`(
	IN `pExamPaperGUID` VARCHAR (50),
	IN `pUserNameExaminee` VARCHAR (100)   
    )
BEGIN
SELECT c.`rowno` AS `Ranking`,c.`TopScoreGUID`,c.`ActivityGUID`,c.`ExamPaperGUID`,c.`ExamineePaperGUID`,c.`UserNameExaminee`,c.`ExamPaperScore`,c.`FullScore`,c.`ResponseLimitCount`,c.`TakeTime`,c. `CreateOn`,c.`LatestUpdate` FROM (
SELECT (@rowNO := @rowNo+1) AS rowno,`TopScoreID`,`TopScoreGUID`,`ActivityGUID`,`ExamPaperGUID`,`ExamineePaperGUID`,`UserNameExaminee`,`ExamPaperScore`,`FullScore`,`ResponseLimitCount`,`TakeTime`, `CreateOn`,`LatestUpdate` FROM 
(SELECT `TopScoreID`,`TopScoreGUID`,`ActivityGUID`,`ExamPaperGUID`,`ExamineePaperGUID`,`UserNameExaminee`,`ExamPaperScore`,`FullScore`,`ResponseLimitCount`,`TakeTime`, `CreateOn`,`LatestUpdate`  FROM mp_topscoreinfo  WHERE `ExamPaperGUID` = pExamPaperGUID order by ExamPaperScore desc,TakeTime asc ) a,
(SELECT @rowNO :=0) b 
) c
WHERE c.usernameexaminee=pUserNameExaminee;
    
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertPrizeExtension` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertPrizeExtension` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_InsertPrizeExtension`()
BEGIN
	DECLARE dt DATETIME;
	DECLARE endTime DATETIME;
	DECLARE startTime DATETIME;
	DECLARE i INT;
	SET dt=NOW();
	SET startTime = STR_TO_DATE('2017-11-17', '%Y-%m-%d'); 
	SET endTime=STR_TO_DATE('2017-12-10', '%Y-%m-%d'); 
	WHILE startTime <= endTime DO
		INSERT INTO mp_prize_prizeextension (PrizeGUID,PrizeName,PrizeTotalNum,PrizeAvailableNum,WinningProbability,UpdateTime,CreateTime,PrizeType,ActiveTime,UsedNumber,PrizeImage)
		VALUES (UUID(),'一等奖',10,5,0.05,dt,dt,1,startTime,0,'100-2.png');
 
		INSERT INTO mp_prize_prizeextension (PrizeGUID,PrizeName,PrizeTotalNum,PrizeAvailableNum,WinningProbability,UpdateTime,CreateTime,PrizeType,ActiveTime,UsedNumber,PrizeImage)
		VALUES (UUID(),'二等奖',30,15,0.05,dt,dt,2,startTime,0,'50-2.png');
	
		INSERT INTO mp_prize_prizeextension (PrizeGUID,PrizeName,PrizeTotalNum,PrizeAvailableNum,WinningProbability,UpdateTime,CreateTime,PrizeType,ActiveTime,UsedNumber,PrizeImage)
		VALUES (UUID(),'三等奖',60,30,0.05,dt,dt,3,startTime,0,'20-2.png');
 
		INSERT INTO mp_prize_prizeextension (PrizeGUID,PrizeName,PrizeTotalNum,PrizeAvailableNum,WinningProbability,UpdateTime,CreateTime,PrizeType,ActiveTime,UsedNumber,PrizeImage)
		VALUES ('00000000-0000-0000-0000-000000000000','谢谢参与',0,0,0.85,dt,dt,4,startTime,0,'thanks.png');
		SET startTime = DATE_ADD(startTime,INTERVAL 1 DAY);
	END WHILE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertWinnerExtension` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertWinnerExtension` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_InsertWinnerExtension`()
BEGIN
	DECLARE dt DATETIME;
	DECLARE i INT;
	declare dt1 varchar(20);
	DECLARE dt2 VARCHAR(20);
	DECLARE dt3 VARCHAR(20);
	SET dt = NOW(); 
	SET i = 0;
	WHILE i < 10 DO
	set dt1=concat('1777808936',i);
	
		INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a96892',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-12 16:53:36',1,UUID(),dt1,dt1,'电信');
	
		INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a96893',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-13 16:53:36',2,UUID(),dt1,dt1,'电信');
 
		INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a9689a',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-14 16:53:36',3,UUID(),dt1,dt1,'电信');
                
                SET dt1=CONCAT('1777808937',i);	
                INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a96892',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-12 16:53:36',2,UUID(),dt1,dt1,'电信');
	
		INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a96893',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-13 16:53:36',1,UUID(),dt1,dt1,'电信');
 
		INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a9689a',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-14 16:53:36',1,UUID(),dt1,dt1,'电信');
                
                SET dt1=CONCAT('1777808938',i);	
                INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a96892',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-12 16:53:36',3,UUID(),dt1,dt1,'电信');
	
		INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a96893',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-13 16:53:36',3,UUID(),dt1,dt1,'电信');
 
		INSERT mp_prize_winnerextension(MyPrizeGUID,PrizeGUID,UserName,ActivityGUID,LotteryTime,PrizeType,ExamineePaperGUID,UserPhone,UserCollectionPhone,Operators)
                VALUES(UUID(),'b5e17bfd-c51e-11e7-ac26-002219a9689a',dt1,'hd7b2c5c51-aa4c-455e-a959-53a314fd2a31','2017-11-14 16:53:36',2,UUID(),dt1,dt1,'电信');
	
		
		SET i = i +1;
	END WHILE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_SetParticipateNumber` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_SetParticipateNumber` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_SetParticipateNumber`(
IN examineeguid VARCHAR(50),
IN PaperGuid VARCHAR(50),
IN UserName VARCHAR(50)
)
BEGIN 
SELECT @maxParticipateNumber := MAX(ParticipateNumber) + 1
FROM mp_examineepaperinfo
WHERE ExamPaperGUID = PaperGuid
  AND UserNameExaminee = UserName;
IF @maxParticipateNumber > 0 THEN
    UPDATE mp_examineepaperinfo
    SET ParticipateNumber = @maxParticipateNumber
    WHERE ExamineePaperGUID = examineeguid AND ParticipateNumber = 0;
    UPDATE mp_examineequestions
    SET ParticipateNumber = @maxParticipateNumber
    WHERE ExamineePaperGUID = examineeguid AND ParticipateNumber = 0;
    UPDATE mp_topscoreinfo
    SET ResponseLimitCount = @maxParticipateNumber
    WHERE ExamPaperGUID = PaperGuid AND UserNameExaminee = UserName; 
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_SetParticipateNumber11` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_SetParticipateNumber11` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_SetParticipateNumber11`(
IN examineeguid VARCHAR(50),
IN PaperGuid VARCHAR(50),
IN UserName VARCHAR(50)
)
BEGIN 
SELECT @maxParticipateNumber := MAX(ParticipateNumber) + 1
FROM mp_examineepaperinfo
WHERE ExamPaperGUID = PaperGuid
  AND UserNameExaminee = UserName;
IF @maxParticipateNumber > 0 THEN
    UPDATE mp_examineepaperinfo
    SET ParticipateNumber = @maxParticipateNumber
    WHERE ExamineePaperGUID = examineeguid AND ParticipateNumber = 0;
    UPDATE mp_examineequestions
    SET ParticipateNumber = @maxParticipateNumber
    WHERE ExamineePaperGUID = examineeguid AND ParticipateNumber = 0;
    UPDATE mp_topscoreinfo
    SET ResponseLimitCount = @maxParticipateNumber
    WHERE ExamPaperGUID = PaperGuid AND UserNameExaminee = UserName; 
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_SetParticipateNumberRedis` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_SetParticipateNumberRedis` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_SetParticipateNumberRedis`(
IN examineeguid VARCHAR(50),
IN PaperGuid VARCHAR(50),
IN UserName VARCHAR(50)
)
BEGIN 
SELECT @maxParticipateNumber:=ParticipateNumber
FROM mp_examineepaperinfo
WHERE ExamineePaperGUID = examineeguid;
select @maxParticipateNumber;
IF @maxParticipateNumber > 0 THEN    
    UPDATE mp_topscoreinfo
    SET ResponseLimitCount = @maxParticipateNumber
    WHERE ExamPaperGUID = PaperGuid AND UserNameExaminee = UserName; 
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_settopscore` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_settopscore` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_settopscore`(
    IN `paperGuid` VARCHAR(50),
    IN `username` VARCHAR(50),
    OUT `topScore` INT
)
BEGIN
        -- 检查是否有 该用户改试卷 对应的最高分记录，如果没有则创建
        IF NOT EXISTS (SELECT * FROM `mp_topscoreinfo` WHERE ExamPaperGUID = paperGuid AND UserNameExaminee = username)
        THEN INSERT INTO `mp_topscoreinfo` 
            (`TopScoreGUID`, `ActivityGUID`, `ExamPaperGUID`, `ExamineePaperGUID`, `UserNameExaminee`, `ExamPaperScore`, 
            `FullScore`, `TakeTime`, `ResponseLimitCount`, `StartTime`, `SubmitTime`, `CreateOn`,`LatestUpdate`) 
            SELECT UUID() AS TopScoreGUID, `ActivityGUID`, `ExamPaperGUID`, '00000000-0000-0000-0000-000000000000' AS ExamineePaperGUID, 
                username AS UserNameExaminee, 0 AS ExamPaperScore, 0 AS `FullScore`, (30 * 24 * 3600) AS TakeTime, 1 AS ResponseLimitCount, 
                NOW() AS StartTime, NOW() AS SubmitTime, NOW() AS CreateOn, NOW() AS LatestUpdate 
            FROM `mp_exampaperinfo` WHERE ExamPaperGUID = paperGuid ;
        END IF ;
        
        -- 查询 该用户该试卷 的最高分
        SELECT @p_UserNameExaminee:=UserNameExaminee, @p_ExamineePaperGUID:=ExamineePaperGUID, 
               @p_UserScore:=UserScore,@p_ScoreLevel:=ScoreLevel , @p_TakeTime:=TakeTime, @p_StartTime:=StartTime, 
               @p_SubmitTime:=SubmitTime
        FROM `mp_examineepaperinfo`
        WHERE ExamStatus = 2 and IsCompletedMark > 0
        and ExamPaperGUID = paperGuid AND UserNameExaminee = username
        ORDER BY UserScore DESC, TakeTime ASC, SubmitTime ASC
        LIMIT 0, 1 ;
        
        -- 查询最高分记录表中 该用户该试卷 的最高分记录
        SELECT @o_UserScore:=ExamPaperScore, @o_TakeTime:=TakeTime, @o_SubmitTime:=SubmitTime
        FROM `mp_topscoreinfo`
        WHERE ExamPaperGUID = paperGuid  AND UserNameExaminee = username;
        
        SET topScore = @o_UserScore;
        
        -- 如果出现了新纪录，则对最高分记录表进行更新
        IF((@o_UserScore < @p_UserScore) OR (@o_UserScore = @p_UserScore AND @o_TakeTime > @p_TakeTime))
        THEN 
            UPDATE  `mp_topscoreinfo` 
            SET
            `ExamineePaperGUID` = @p_ExamineePaperGUID,
            `ExamPaperScore` = @p_UserScore,
            `ScoreLevel` = @p_ScoreLevel,
            `TakeTime` = @p_TakeTime,
            `StartTime` = @p_StartTime,
            `SubmitTime` = @p_SubmitTime,           
            `LatestUpdate` = NOW()
            WHERE ExamPaperGUID = paperGuid AND UserNameExaminee = username;
            SET topScore = @p_UserScore;
                        
        END IF ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_testRand` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_testRand` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_testRand`()
begin
declare notstartNum int default 0;
declare startNum INT DEFAULT 0;
select count(1) into startNum from mp_matchactivity 
     where StartTime<=NOW() AND FinishTime>NOW();
if startNum >=15
then
   select * from mp_matchactivity  WHERE StartTime<=NOW() AND FinishTime>NOW() order by rand() limit 8;
else 
    select count(*) into notstartNum from mp_matchactivity where StartTime>NOW();
    if notstartNum+startNum>=15
    then 
    set @a=15-startNum;
    prepare s1 from 'select * from ((SELECT * FROM mp_matchactivity 
    WHERE St`sp_GetRecommendMatch`artTime<=NOW() AND FinishTime>NOW()) 
    UNION 
    (SELECT * FROM mp_matchactivity WHERE StartTime>NOW() order by rand() limit ?)) t order by t.StartTime desc';
    execute s1 using @a;
    DEALLOCATE PREPARE s1;
    else
    set @b=15-notstartNum-startNum;
       prepare s2 from 'select * from ((SELECT *  FROM mp_matchactivity 
         WHERE StartTime<=NOW() AND FinishTime>NOW())
         UNION 
         (SELECT *  FROM mp_matchactivity 
            WHERE StartTime>NOW())
         UNION 
         (SELECT *  FROM mp_matchactivity 
             WHERE FinishTime<=NOW() 
             ORDER BY RAND() LIMIT ?)) t order by t.StartTime desc';
       execute s2 using @b;
       deallocate prepare s2;
    end if;
end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_TongjiDatiCishu` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_TongjiDatiCishu` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_TongjiDatiCishu`(
    IN `paperGuid` VARCHAR(50),
    IN `examType` int
)
BEGIN
    -- 定义变量
    DECLARE p_PaperGuid VARCHAR(50);
    declare p_ExamType int;
    DECLARE p_Cishu INT;
    DECLARE p_Renshu INT;
    set p_PaperGuid = `paperGuid`;
    SET p_ExamType = `examType`;
 
    SELECT COUNT(1) as Cishu into p_Cishu FROM mp_examineepaperinfo 
    WHERE ExamStatus = 2 AND ExamPaperGUID = p_PaperGuid;
    SELECT COUNT(DISTINCT UserNameExaminee) as Renshu into p_Renshu FROM mp_examineepaperinfo
    WHERE ExamStatus = 2 AND ExamPaperGUID = p_PaperGuid;
    
    IF(p_ExamType = 1) THEN 
        UPDATE mp_examactivity as e
        SET AnsweredTimesCount = p_Cishu,
            AnsweredPersonCount = p_Renshu
        WHERE e.PaperGuid = p_PaperGuid;
    ELSEIF (p_ExamType = 2) THEN 
        UPDATE mp_matchactivity as m
        SET AnsweredTimesCount = p_Cishu,
            AnsweredPersonCount = p_Renshu
        WHERE m.PaperGuid = p_PaperGuid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_updateexamineemsg` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_updateexamineemsg` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_updateexamineemsg`()
BEGIN
  
	-- 需要定义接收游标数据的变量	
	DECLARE currAttributeA VARCHAR(5000) DEFAULT NULL ;
	DECLARE currAttributeB VARCHAR(5000) DEFAULT NULL ;
	DECLARE currAttributeC VARCHAR(5000) DEFAULT NULL ;
	DECLARE currAttributeD VARCHAR(5000) DEFAULT NULL ;
	DECLARE currAttributeE VARCHAR(5000) DEFAULT NULL ;
	DECLARE currAttributeF VARCHAR(5000) DEFAULT NULL ;
	DECLARE currExamineeMsgGUID VARCHAR(50) DEFAULT NULL ;
	DECLARE newAttribute VARCHAR(5000) DEFAULT '' ;
	DECLARE thisGuid VARCHAR(50) DEFAULT '' ;
	DECLARE thisAttributeLength INT DEFAULT 0;
	-- 遍历数据结束标志
	DECLARE done INT DEFAULT FALSE;
	-- 游标
	DECLARE cursor_updatemsg CURSOR FOR SELECT  `AttributeA`,`AttributeB`,`AttributeC`,`AttributeD`,`AttributeE`,`AttributeF`,ExamineeMsgGUID  FROM `mp_examineemsg`  WHERE `IsTitle`=1;
	-- 将结束标志绑定到游标
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;	
					OPEN cursor_updatemsg;	
						--  开始循环 循环方法二 while
						FETCH cursor_updatemsg INTO currAttributeA,currAttributeB,currAttributeC,currAttributeD,currAttributeE,currAttributeF,currExamineeMsgGUID;
						WHILE (!done) DO 
						-- 必须是不为空的属性，并且不能是用新功能设置过的属性  才去处理，否则不处理
					-- A列
						IF (currAttributeA IS NOT NULL AND currAttributeA <>'' AND (SELECT LOCATE('{',currAttributeA))=0) THEN
							SET newAttribute='';
							SET thisAttributeLength=(SELECT LENGTH(currAttributeA) -  LENGTH(REPLACE(currAttributeA, '#', '')) + 1);							
							IF(thisAttributeLength=1)  THEN -- 如果是 姓名
								SET thisGuid=UUID();
								SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
								SET newAttribute=CONCAT(newAttribute,thisGuid);
								SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
								SET newAttribute=CONCAT(newAttribute,currAttributeA);
								SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":0,"SortNum":"1"}');
							ELSEIF(thisAttributeLength=2) THEN							
								IF((SELECT LOCATE('$',currAttributeA))=0) THEN  -- 如果是 姓名#guid	
									SET thisGuid=SUBSTRING_INDEX(currAttributeA,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeA,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":1,"SortNum":"1"}');
								ELSE -- 如果是姓名#$
									SET thisGuid=UUID();
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeA,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":0,"SortNum":"1"}');
								END IF;								
							ELSEIF (thisAttributeLength=3) THEN -- 如果是姓名#$#guid
									SET thisGuid=SUBSTRING_INDEX(currAttributeA,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeA,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":1,"SortNum":"1"}');							
							ELSE 		SET newAttribute=newAttribute;
							
							END IF;
						UPDATE 	mp_examineemsg SET AttributeA=newAttribute WHERE ExamineeMsgGUID = currExamineeMsgGUID;
						
						ELSE SET newAttribute=newAttribute;				 
						END IF;	
					-- B列
						IF (currAttributeB IS NOT NULL AND currAttributeB <>'' AND (SELECT LOCATE('{',currAttributeB))=0) THEN
							SET newAttribute='';
							SET thisAttributeLength=(SELECT LENGTH(currAttributeB) -  LENGTH(REPLACE(currAttributeB, '#', '')) + 1);							
							IF(thisAttributeLength=1)  THEN -- 如果是 姓名
								SET thisGuid=UUID();
								SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
								SET newAttribute=CONCAT(newAttribute,thisGuid);
								SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
								SET newAttribute=CONCAT(newAttribute,currAttributeB);
								SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":0,"SortNum":"2"}');
							ELSEIF(thisAttributeLength=2) THEN							
								IF((SELECT LOCATE('$',currAttributeB))=0) THEN  -- 如果是 姓名#guid	
									SET thisGuid=SUBSTRING_INDEX(currAttributeB,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeB,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":1,"SortNum":"2"}');
								ELSE -- 如果是姓名#$
									SET thisGuid=UUID();
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeB,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":0,"SortNum":"2"}');
								END IF;								
							ELSEIF (thisAttributeLength=3) THEN -- 如果是姓名#$#guid
									SET thisGuid=SUBSTRING_INDEX(currAttributeB,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeB,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":1,"SortNum":"2"}');							
							ELSE 		SET newAttribute=newAttribute;
							
							END IF;
						UPDATE 	mp_examineemsg SET AttributeB=newAttribute WHERE ExamineeMsgGUID = currExamineeMsgGUID;
						
						ELSE SET newAttribute=newAttribute;				 
						END IF;	
					-- C列
						IF (currAttributeC IS NOT NULL AND currAttributeC <>'' AND (SELECT LOCATE('{',currAttributeC))=0) THEN
							SET newAttribute='';
							SET thisAttributeLength=(SELECT LENGTH(currAttributeC) -  LENGTH(REPLACE(currAttributeC, '#', '')) + 1);							
							IF(thisAttributeLength=1)  THEN -- 如果是 姓名
								SET thisGuid=UUID();
								SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
								SET newAttribute=CONCAT(newAttribute,thisGuid);
								SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
								SET newAttribute=CONCAT(newAttribute,currAttributeC);
								SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":0,"SortNum":"3"}');
							ELSEIF(thisAttributeLength=2) THEN							
								IF((SELECT LOCATE('$',currAttributeC))=0) THEN  -- 如果是 姓名#guid	
									SET thisGuid=SUBSTRING_INDEX(currAttributeC,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeC,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":1,"SortNum":"3"}');
								ELSE -- 如果是姓名#$
									SET thisGuid=UUID();
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeC,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":0,"SortNum":"3"}');
								END IF;								
							ELSEIF (thisAttributeLength=3) THEN -- 如果是姓名#$#guid
									SET thisGuid=SUBSTRING_INDEX(currAttributeC,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeC,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":1,"SortNum":"3"}');							
							ELSE 		SET newAttribute=newAttribute;
							
							END IF;
						UPDATE 	mp_examineemsg SET AttributeC=newAttribute WHERE ExamineeMsgGUID = currExamineeMsgGUID;
						
						ELSE SET newAttribute=newAttribute;				 
						END IF;	
					-- D列
						IF (currAttributeD IS NOT NULL AND currAttributeD <>'' AND (SELECT LOCATE('{',currAttributeD))=0) THEN
							SET newAttribute='';
							SET thisAttributeLength=(SELECT LENGTH(currAttributeD) -  LENGTH(REPLACE(currAttributeD, '#', '')) + 1);							
							IF(thisAttributeLength=1)  THEN -- 如果是 姓名
								SET thisGuid=UUID();
								SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
								SET newAttribute=CONCAT(newAttribute,thisGuid);
								SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
								SET newAttribute=CONCAT(newAttribute,currAttributeD);
								SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":0,"SortNum":"4"}');
							ELSEIF(thisAttributeLength=2) THEN							
								IF((SELECT LOCATE('$',currAttributeD))=0) THEN  -- 如果是 姓名#guid	
									SET thisGuid=SUBSTRING_INDEX(currAttributeD,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeD,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":1,"SortNum":"4"}');
								ELSE -- 如果是姓名#$
									SET thisGuid=UUID();
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeD,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":0,"SortNum":"4"}');
								END IF;								
							ELSEIF (thisAttributeLength=3) THEN -- 如果是姓名#$#guid
									SET thisGuid=SUBSTRING_INDEX(currAttributeD,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeD,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":1,"SortNum":"4"}');							
							ELSE 		SET newAttribute=newAttribute;
							
							END IF;
						UPDATE 	mp_examineemsg SET AttributeD=newAttribute WHERE ExamineeMsgGUID = currExamineeMsgGUID;
						
						ELSE SET newAttribute=newAttribute;				 
						END IF;									
					-- E列
						IF (currAttributeE IS NOT NULL AND currAttributeE <>'' AND (SELECT LOCATE('{',currAttributeE))=0) THEN
							SET newAttribute='';
							SET thisAttributeLength=(SELECT LENGTH(currAttributeE) -  LENGTH(REPLACE(currAttributeE, '#', '')) + 1);							
							IF(thisAttributeLength=1)  THEN -- 如果是 姓名
								SET thisGuid=UUID();
								SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
								SET newAttribute=CONCAT(newAttribute,thisGuid);
								SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
								SET newAttribute=CONCAT(newAttribute,currAttributeE);
								SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":0,"SortNum":"5"}');
							ELSEIF(thisAttributeLength=2) THEN							
								IF((SELECT LOCATE('$',currAttributeE))=0) THEN  -- 如果是 姓名#guid	
									SET thisGuid=SUBSTRING_INDEX(currAttributeE,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeE,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":1,"SortNum":"5"}');
								ELSE -- 如果是姓名#$
									SET thisGuid=UUID();
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeE,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":0,"SortNum":"5"}');
								END IF;								
							ELSEIF (thisAttributeLength=3) THEN -- 如果是姓名#$#guid
									SET thisGuid=SUBSTRING_INDEX(currAttributeE,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeE,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":1,"SortNum":"5"}');							
							ELSE 		SET newAttribute=newAttribute;
							
							END IF;
						UPDATE 	mp_examineemsg SET AttributeE=newAttribute WHERE ExamineeMsgGUID = currExamineeMsgGUID;
						
						ELSE SET newAttribute=newAttribute;				 
						END IF;	
						
					-- F列
						IF (currAttributeF IS NOT NULL AND currAttributeF <>'' AND (SELECT LOCATE('{',currAttributeF))=0) THEN
							SET newAttribute='';
							SET thisAttributeLength=(SELECT LENGTH(currAttributeF) -  LENGTH(REPLACE(currAttributeF, '#', '')) + 1);							
							IF(thisAttributeLength=1)  THEN -- 如果是 姓名
								SET thisGuid=UUID();
								SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
								SET newAttribute=CONCAT(newAttribute,thisGuid);
								SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
								SET newAttribute=CONCAT(newAttribute,currAttributeF);
								SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":0,"SortNum":"6"}');
							ELSEIF(thisAttributeLength=2) THEN							
								IF((SELECT LOCATE('$',currAttributeF))=0) THEN  -- 如果是 姓名#guid	
									SET thisGuid=SUBSTRING_INDEX(currAttributeF,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeF,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":0,"IsSelect":1,"SortNum":"6"}');
								ELSE -- 如果是姓名#$
									SET thisGuid=UUID();
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeF,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":0,"SortNum":"6"}');
								END IF;								
							ELSEIF (thisAttributeLength=3) THEN -- 如果是姓名#$#guid
									SET thisGuid=SUBSTRING_INDEX(currAttributeF,'#', -1);
									SET newAttribute=CONCAT(newAttribute,'{"MsgColumnGUID":"');
									SET newAttribute=CONCAT(newAttribute,thisGuid);
									SET newAttribute=CONCAT(newAttribute,'","MsgName":"');
									SET newAttribute=CONCAT(newAttribute,SUBSTRING_INDEX(currAttributeF,'#', 1));
									SET newAttribute=CONCAT(newAttribute,'","IsNecessary":1,"IsSelect":1,"SortNum":"6"}');							
							ELSE 		SET newAttribute=newAttribute;
							
							END IF;
						UPDATE 	mp_examineemsg SET AttributeF=newAttribute WHERE ExamineeMsgGUID = currExamineeMsgGUID;
						
						ELSE SET newAttribute=newAttribute;				 
						END IF;					
						
					FETCH cursor_updatemsg INTO currAttributeA,currAttributeB,currAttributeC,currAttributeD,currAttributeE,currAttributeF,currExamineeMsgGUID;
					END WHILE;
					-- 关闭游标
					CLOSE cursor_updatemsg;
	
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdateExamineeQuestionSequenceNumber` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdateExamineeQuestionSequenceNumber` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdateExamineeQuestionSequenceNumber`(
    IN examineeguid VARCHAR(50)
)
BEGIN
    SET @examinee_guid = examineeguid;
    UPDATE mp_examineequestions t1 INNER JOIN(
        SELECT  q.`ExamineeQueID`, s.`SequenceNum`, q.`SequenceNumber`, @rowno:=@rowno+1 AS rowno
        FROM `mp_examineequestions` AS q  JOIN `mp_exampapersection` AS s ON s.`SectionGUID` = q.`SectionGUID`,(SELECT @rowno:=0) t
        WHERE q.`ExamineePaperGUID` = @examinee_guid ORDER BY  s.`SequenceNum`
    ) AS t2 ON t1.ExamineeQueID = t2.ExamineeQueID SET t1.SequenceNumber = t2.rowNo
    WHERE t1.ExamineePaperGUID = @examinee_guid AND t1.ExamineeQueID = t2.ExamineeQueID;
    UPDATE `mp_examineepaperinfo` ep SET ep.TotalQuestionCount =(
        SELECT COUNT(1) FROM `mp_examineequestions` eq WHERE eq.ExamineePaperGUID = @examinee_guid
    ) WHERE ep.ExamineePaperGUID = @examinee_guid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdateMergeSectionGUIDAndSequenceNumber` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdateMergeSectionGUIDAndSequenceNumber` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdateMergeSectionGUIDAndSequenceNumber`(
	in `paperGuid` VARCHAR(50)
)
BEGIN
	SET @ROW = 0;
	UPDATE 
		mp_examineequestions eqs 
	SET 
		eqs.MergeSectionGUID = 
		
			(SELECT distinct(m.MergeSectionGUID) from
					(SELECT eqs1.SectionGUID,mmn.MergeSectionGUID 
						FROM mp_examineequestions eqs1 
						JOIN mp_mergesection mmn 
						ON eqs1.`SectionGUID` = mmn.`SectionGUID`
						WHERE eqs1.`ExamineePaperGUID`=paperGuid) m
			WHERE eqs.`SectionGUID` = m.SectionGUID),
			
		eqs.`SequenceNumber` = 
			(SELECT n.SequenceNumber FROM 
					(SELECT (@ROW:=@ROW+1) AS SequenceNumber,eqs2.`ExamineeQuetionGUID` 
						FROM mp_examineequestions eqs2 
						JOIN mp_mergesection mmn2  
						ON eqs2.`SectionGUID` = mmn2.`SectionGUID` 
						WHERE eqs2.`ExamineePaperGUID` = paperGuid 
						ORDER BY mmn2.`SectionGUID`) n
			WHERE eqs.`ExamineeQuetionGUID` = n.`ExamineeQuetionGUID`)
			
	 WHERE eqs.`ExamineePaperGUID` = paperGuid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdateNumNew` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdateNumNew` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdateNumNew`(
     IN `examineePaperGuid` VARCHAR(50),
    IN `examPaperguid` VARCHAR(50)     
)
BEGIN	
	
	-- 需要定义接收游标数据的变量	
	DECLARE currentSectionGuid VARCHAR(50) DEFAULT NULL ;
	DECLARE currentNum INT DEFAULT 0;
	-- 遍历数据结束标志
	DECLARE done INT DEFAULT FALSE;
	-- 游标
	DECLARE cursor_copysection CURSOR FOR SELECT  `SectionGUID`  FROM `mp_exampapersection`  WHERE `ExamPaperGUID`=examPaperguid order by `SequenceNum`;
	-- 将结束标志绑定到游标
	
	OPEN cursor_copysection;	
	--  开始循环 循环方法二 while
		SELECT (@rowNum := 0);
		FETCH cursor_copysection INTO currentSectionGuid;
		WHILE (!done) DO 
		
		UPDATE mp_examineequestions t1 INNER JOIN (
		SELECT ExamineeQueID,(@rowNum:=@rowNum+1) AS rowNo
		FROM `mp_examineequestions` AS a
		WHERE ExamineePaperGUID = examineeguid
		) AS t2
	       SET t1.SequenceNumber = t2.rowNo
	       WHERE t1.ExamineePaperGUID = examineeguid and t1.SectionGUID=currentSectionGuid
	       AND t1.ExamineeQueID = t2.ExamineeQueID;					
									
		FETCH cursor_copysection INTO currentSectionGuid;
		END WHILE;
	-- 关闭游标
	CLOSE cursor_copysection;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdatePrizeAvailableQuantity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdatePrizeAvailableQuantity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdatePrizeAvailableQuantity`(
)
BEGIN
    -- 创建接收游标数据的变量  
    DECLARE SerialNum VARCHAR(20);  
    DECLARE Number INT;  
    declare TotalNumber int;
    -- 创建结束标志变量  
    DECLARE done INT DEFAULT FALSE;  
    -- 创建游标  
    DECLARE cur CURSOR FOR 
    SELECT b.PrizeTypeSerialNum AS SerialNum, 
	CASE WHEN a.quantity IS NULL THEN 0 ELSE a.quantity END AS Number,
	CASE WHEN c.TotalQuantity IS NULL THEN 0 ELSE c.TotalQuantity END AS TotalNumber
		FROM mp_prize_resource b 
		LEFT JOIN 
			(SELECT PrizeTypeSerialNum,COUNT(1) AS quantity FROM mp_prize_resource WHERE ValidityEndTime>=NOW() AND IsAvailable=1 AND PrizeType=1 GROUP BY PrizeTypeSerialNum) a ON a.PrizeTypeSerialNum = b.PrizeTypeSerialNum 
		LEFT JOIN
			(SELECT PrizeTypeSerialNum,COUNT(1) AS TotalQuantity FROM mp_prize_resource WHERE  PrizeType=1 GROUP BY PrizeTypeSerialNum) c ON b.PrizeTypeSerialNum = c.PrizeTypeSerialNum 
		GROUP BY b.PrizeTypeSerialNum;
    -- 指定游标循环结束时的返回值  
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;  
    -- 打开游标  
    OPEN cur;  
    -- 开始循环游标里的数据  
    read_loop:LOOP  
    -- 根据游标当前指向的一条数据  
    FETCH cur INTO SerialNum,Number,TotalNumber;  
    -- 判断游标的循环是否结束 
    IF done THEN  
        LEAVE read_loop;    -- 跳出游标循环  
    END IF;  
    -- 获取一条数据时，将SerialNumber中的PrizeQuantityAvail更新为Number，这里可以做任意你想做的操作，
    UPDATE mp_prize_typeresource SET PrizeQuantityAvail= Number,`PrizeTotalQuantity`=TotalNumber WHERE PrizeType=1 AND SerialNumber= SerialNum;
    -- 结束游标循环  
    END LOOP;  
    -- 关闭游标  
    CLOSE cur;  
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UpdateRandomPaperNum` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UpdateRandomPaperNum` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdateRandomPaperNum`(IN `examPaperguid1` VARCHAR(50),OUT totalId TEXT,OUT totalCount INT)
BEGIN	
	
	-- 需要定义接收游标数据的变量	
	DECLARE currentexamineeguid VARCHAR(50) DEFAULT NULL ;
	-- 遍历数据结束标志
	DECLARE done INT DEFAULT FALSE;
	-- 游标
	DECLARE cursor_copysection CURSOR FOR SELECT  `ExamineePaperGUID`  FROM `mp_examineepaperinfo`  WHERE `ExamPaperGUID`=examPaperguid1 ;
	-- 将结束标志绑定到游标
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;	
	
	OPEN cursor_copysection;	
	--  开始循环 循环方法二 while
		SET totalId='';
		SET totalCount=0;
		FETCH cursor_copysection INTO currentexamineeguid;
		WHILE (!done) DO 		
		SET totalId =CONCAT(totalId,currentexamineeguid);
		SET totalCount =totalCount+1;	
	call `sp_UpdateExamineeQuestionSequenceNumber`(currentexamineeguid);
		FETCH cursor_copysection INTO currentexamineeguid; -- 这一句是必须的 不然游标不会结束
		END WHILE;
	-- 关闭游标
	CLOSE cursor_copysection;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Updatevote_opusAndvote_userclick` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Updatevote_opusAndvote_userclick` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_Updatevote_opusAndvote_userclick`(
	in `opusid` VARCHAR(50),
	in `username` VARCHAR(50),
	in `ip` varchar(50),
	IN `areas` VARCHAR(50),
	in `times` datetime
)
BEGIN
	UPDATE vote_opus SET VoteTimes = VoteTimes + 1 WHERE opusguid = opusid;
	SELECT @VoteGuid:= VoteGuid,@OpusID:= OpusID from vote_opus WHERE OpusGuid = opusguid;
	INSERT INTO vote_userclick (VoteGuid,UserName,OpusGuid,OpusID,Ip,AREA,CreateOn) VALUES(@VoteGuid,username,opusid,@OpusID,ip,areas,times);
END */$$
DELIMITER ;

/*Table structure for table `resultmessage` */

DROP TABLE IF EXISTS `resultmessage`;

/*!50001 DROP VIEW IF EXISTS `resultmessage` */;
/*!50001 DROP TABLE IF EXISTS `resultmessage` */;

/*!50001 CREATE TABLE  `resultmessage`(
 `ReceiveMsgID` varchar(20) ,
 `ReceiveMsgGUID` varchar(50) ,
 `MessageGUID` varchar(50) ,
 `MsgType` int(11) ,
 `ReceiveType` int(11) ,
 `Title` varchar(200) ,
 `Content` varchar(500) ,
 `UserNameCreate` varchar(200) ,
 `NickName` varchar(200) ,
 `UserNameReceive` varchar(200) ,
 `ReceiveDateTime` varchar(19) ,
 `ExpireDateTime` varchar(19) ,
 `DelStatus` varchar(11) ,
 `ReceiveStatus` varchar(11) ,
 `CreateOn` varchar(19) ,
 `LatestUpdate` varchar(19) ,
 `UserAvatar` varchar(200) ,
 `UserGUID` varchar(50) ,
 `MessageID` varchar(20) ,
 `ExpireTime` varchar(19) 
)*/;

/*Table structure for table `view_answerquestioncount` */

DROP TABLE IF EXISTS `view_answerquestioncount`;

/*!50001 DROP VIEW IF EXISTS `view_answerquestioncount` */;
/*!50001 DROP TABLE IF EXISTS `view_answerquestioncount` */;

/*!50001 CREATE TABLE  `view_answerquestioncount`(
 `QuestionGUID` varchar(50) ,
 `CountRight` bigint(21) 
)*/;

/*Table structure for table `view_singlequestionanswer` */

DROP TABLE IF EXISTS `view_singlequestionanswer`;

/*!50001 DROP VIEW IF EXISTS `view_singlequestionanswer` */;
/*!50001 DROP TABLE IF EXISTS `view_singlequestionanswer` */;

/*!50001 CREATE TABLE  `view_singlequestionanswer`(
 `SingleQueAnswerID` bigint(20) ,
 `SingleQueAnswerGUID` varchar(50) ,
 `QuestionGUID` varchar(50) ,
 `UserNameExaminee` varchar(200) ,
 `IsAnonymity` int(11) ,
 `UserAnswer` varchar(2000) ,
 `CorrectOrNot` int(11) ,
 `CreateOn` datetime ,
 `LatestUpdate` datetime ,
 `QuestionType` int(11) ,
 `UserNameCreate` varchar(200) ,
 `UserNameBelongTo` varchar(200) ,
 `ExamPaperGUID` varchar(50) ,
 `TradeFirstGenreCode` varchar(50) ,
 `TradeSecondGenreCode` varchar(50) ,
 `TradeThirdGenreCode` varchar(50) ,
 `QuestionTitle` varchar(2000) ,
 `QuestionPureText` varchar(2000) ,
 `QuestionImg` varchar(200) ,
 `KnowledgePoint` varchar(200) ,
 `OptionJson` varchar(1500) ,
 `StandardAnswer` varchar(2000) ,
 `IsUseStandardAnswer` int(11) ,
 `AnswerAnalysis` text ,
 `PublishDateTime` datetime ,
 `VisitStatus` int(11) ,
 `DelStatus` int(11) 
)*/;

/*View structure for view resultmessage */

/*!50001 DROP TABLE IF EXISTS `resultmessage` */;
/*!50001 DROP VIEW IF EXISTS `resultmessage` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `resultmessage` AS (select '' AS `ReceiveMsgID`,'' AS `ReceiveMsgGUID`,`m`.`MessageGUID` AS `MessageGUID`,`m`.`MsgType` AS `MsgType`,`m`.`ReceiveType` AS `ReceiveType`,`m`.`Title` AS `Title`,`m`.`Content` AS `Content`,`m`.`UserNameCreate` AS `UserNameCreate`,'' AS `NickName`,'' AS `UserNameReceive`,'' AS `ReceiveDateTime`,'' AS `ExpireDateTime`,'' AS `DelStatus`,'' AS `ReceiveStatus`,'' AS `CreateOn`,'' AS `LatestUpdate`,'' AS `UserAvatar`,'' AS `UserGUID`,`m`.`MessageID` AS `MessageID`,`m`.`ExpireTime` AS `ExpireTime` from `mp_message` `m` where ((not(`m`.`MessageGUID` in (select distinct `r`.`MessageGUID` from `mp_receivemessage` `r` where ((1 = 1) and (`r`.`UserNameReceive` = 'datitest'))))) and (`m`.`ReceiveType` = 3) and (`m`.`ExpireTime` > now()) and (`m`.`DelStatus` = 0)) limit 0,200) union (select `r`.`ReceiveMsgID` AS `ReceiveMsgID`,`r`.`ReceiveMsgGUID` AS `ReceiveMsgGUID`,`r`.`MessageGUID` AS `MessageGUID`,`m`.`MsgType` AS `MsgType`,`m`.`ReceiveType` AS `ReceiveType`,`m`.`Title` AS `Title`,`m`.`Content` AS `Content`,`r`.`UserNameCreate` AS `UserNameCreate`,`r`.`NickName` AS `NickName`,`r`.`UserNameReceive` AS `UserNameReceive`,`r`.`ReceiveDateTime` AS `ReceiveDateTime`,`r`.`ExpireDateTime` AS `ExpireDateTime`,`r`.`DelStatus` AS `DelStatus`,`r`.`ReceiveStatus` AS `ReceiveStatus`,`r`.`CreateOn` AS `CreateOn`,`r`.`LatestUpdate` AS `LatestUpdate`,`u`.`UserAvatar` AS `UserAvatar`,`u`.`UserGUID` AS `UserGUID`,'' AS `MessageID`,'' AS `ExpireTime` from ((`mp_receivemessage` `r` left join `mp_message` `m` on((`r`.`MessageGUID` = `m`.`MessageGUID`))) left join `mp_user` `u` on((`r`.`UserNameCreate` = `u`.`UserName`))) where ((1 = 1) and (`r`.`UserNameReceive` = 'datitest')) order by `r`.`CreateOn` desc limit 0,200) */;

/*View structure for view view_answerquestioncount */

/*!50001 DROP TABLE IF EXISTS `view_answerquestioncount` */;
/*!50001 DROP VIEW IF EXISTS `view_answerquestioncount` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_answerquestioncount` AS select `mp_examineequestions`.`QuestionGUID` AS `QuestionGUID`,count(1) AS `CountRight` from `mp_examineequestions` where ((`mp_examineequestions`.`IsAnswered` = 1) and (`mp_examineequestions`.`CorrectOrNot` = 1)) group by `mp_examineequestions`.`QuestionGUID` */;

/*View structure for view view_singlequestionanswer */

/*!50001 DROP TABLE IF EXISTS `view_singlequestionanswer` */;
/*!50001 DROP VIEW IF EXISTS `view_singlequestionanswer` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_singlequestionanswer` AS select `t1`.`SingleQueAnswerID` AS `SingleQueAnswerID`,`t1`.`SingleQueAnswerGUID` AS `SingleQueAnswerGUID`,`t1`.`QuestionGUID` AS `QuestionGUID`,`t1`.`UserNameExaminee` AS `UserNameExaminee`,`t1`.`IsAnonymity` AS `IsAnonymity`,`t1`.`UserAnswer` AS `UserAnswer`,`t1`.`CorrectOrNot` AS `CorrectOrNot`,`t1`.`CreateOn` AS `CreateOn`,`t1`.`LatestUpdate` AS `LatestUpdate`,`t2`.`QuestionType` AS `QuestionType`,`t2`.`UserNameCreate` AS `UserNameCreate`,`t2`.`UserNameBelongTo` AS `UserNameBelongTo`,`t2`.`ExamPaperGUID` AS `ExamPaperGUID`,`t2`.`TradeFirstGenreCode` AS `TradeFirstGenreCode`,`t2`.`TradeSecondGenreCode` AS `TradeSecondGenreCode`,`t2`.`TradeThirdGenreCode` AS `TradeThirdGenreCode`,`t2`.`QuestionTitle` AS `QuestionTitle`,`t2`.`QuestionPureText` AS `QuestionPureText`,`t2`.`QuestionImg` AS `QuestionImg`,`t2`.`KnowledgePoint` AS `KnowledgePoint`,`t2`.`OptionJson` AS `OptionJson`,`t2`.`StandardAnswer` AS `StandardAnswer`,`t2`.`IsUseStandardAnswer` AS `IsUseStandardAnswer`,`t2`.`AnswerAnalysis` AS `AnswerAnalysis`,`t2`.`PublishDateTime` AS `PublishDateTime`,`t2`.`VisitStatus` AS `VisitStatus`,`t2`.`DelStatus` AS `DelStatus` from (`mp_singlequestionanswer` `t1` left join `mp_publicitempool` `t2` on((`t1`.`QuestionGUID` = `t2`.`QuestionGUID`))) where (`t1`.`DelStatus` = 0) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
