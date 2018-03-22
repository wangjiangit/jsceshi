/*
Navicat MySQL Data Transfer

Source Server         : 测试环境
Source Server Version : 50631
Source Host           : 120.26.120.234:3306
Source Database       : db1

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2018-03-22 16:52:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `--activity_project`
-- ----------------------------
DROP TABLE IF EXISTS `--activity_project`;
CREATE TABLE `--activity_project` (
  `id` varchar(255) NOT NULL COMMENT '表id',
  `activity_id` varchar(255) NOT NULL COMMENT '关联活动id',
  `project_id` varchar(255) NOT NULL COMMENT '关联项目id',
  `sort` bigint(1) DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动项目表,由于需求发生变化，该表已作废';

-- ----------------------------
-- Records of --activity_project
-- ----------------------------

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `image_logo` varchar(255) NOT NULL COMMENT '活动logo',
  `sponsor` varchar(255) NOT NULL COMMENT '活动主办方',
  `place` varchar(255) NOT NULL COMMENT '活动场所',
  `type` tinyint(4) DEFAULT NULL COMMENT '1.普通活动  2.项目活动',
  `is_hot` tinyint(4) DEFAULT NULL COMMENT '1.置顶    2.非置顶',
  `start_datetime` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_datetime` datetime DEFAULT NULL COMMENT '活动结束时间',
  `content` text NOT NULL COMMENT '活动内容',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在 ;2:不存在   (逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '创建者姓名',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  `update_user_name` varchar(255) DEFAULT NULL COMMENT '更新者姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_customer`
-- ----------------------------
DROP TABLE IF EXISTS `activity_customer`;
CREATE TABLE `activity_customer` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `user_id` varchar(255) DEFAULT NULL COMMENT '关联user表id',
  `activity_id` varchar(255) NOT NULL COMMENT '活动ID ，关联acitvitys表id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '冗余：用户姓名',
  `user_image_url` varchar(255) DEFAULT NULL COMMENT '冗余 ：图像',
  `user_position` varchar(255) DEFAULT NULL COMMENT '冗余：职位',
  `user_company` varchar(255) DEFAULT NULL COMMENT '冗余:机构',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动邀请嘉宾';

-- ----------------------------
-- Records of activity_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_user`
-- ----------------------------
DROP TABLE IF EXISTS `activity_user`;
CREATE TABLE `activity_user` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `user_id` varchar(255) NOT NULL COMMENT '关联user表id',
  `activity_id` varchar(255) NOT NULL COMMENT '活动ID ，关联acitvitys表id',
  `user_wechat_image_url` varchar(255) DEFAULT NULL COMMENT '冗余 ：用户微信图像',
  `user_wechat_nick_name` varchar(255) DEFAULT NULL COMMENT '冗余 ：用户微信昵称',
  `user_wechat_openid` varchar(255) DEFAULT NULL COMMENT '冗余 ：用户微信openid',
  `user_identity_text` varchar(255) DEFAULT NULL COMMENT '冗余 ：用户当时报名的身份',
  `user_position` varchar(255) DEFAULT NULL COMMENT '冗余：职位',
  `user_company` varchar(255) DEFAULT NULL COMMENT '冗余:机构',
  `is_sign` tinyint(1) DEFAULT NULL COMMENT '是否签到：1\\签到 ；2\\未签到 (报名用户是否到现场扫码签到)',
  `sign_date` datetime DEFAULT NULL COMMENT '签到日期',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动报名表';

-- ----------------------------
-- Records of activity_user
-- ----------------------------

-- ----------------------------
-- Table structure for `advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `image_url` varchar(255) DEFAULT NULL COMMENT '广告图片',
  `enabled` tinyint(4) NOT NULL COMMENT '1.启用  2.不启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '添加人姓名',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  `update_user_name` varchar(255) DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for `email_record`
-- ----------------------------
DROP TABLE IF EXISTS `email_record`;
CREATE TABLE `email_record` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '投资者id(发送人)',
  `email` varchar(255) DEFAULT NULL COMMENT '被接收人（创业者）的邮件',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件记录表';

-- ----------------------------
-- Records of email_record
-- ----------------------------

-- ----------------------------
-- Table structure for `favorite`
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT '表ID',
  `relation_id` varchar(255) NOT NULL COMMENT '某人收藏相关的id, 该id依据type字段',
  `type` tinyint(4) NOT NULL COMMENT ' 1.项目    2.新闻',
  `user_id` varchar(255) NOT NULL COMMENT '收藏人id,关联 user表中的id',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `finance_phase_relation`
-- ----------------------------
DROP TABLE IF EXISTS `finance_phase_relation`;
CREATE TABLE `finance_phase_relation` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL COMMENT '关联user的id',
  `system_data_id` varchar(255) DEFAULT NULL COMMENT '关联system_data的 id',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='融资阶段关系表';

-- ----------------------------
-- Records of finance_phase_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `friend_id` varchar(255) NOT NULL COMMENT '好友id',
  `user_id` varchar(255) NOT NULL COMMENT '我的id,关联user表id',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在   (逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友表';

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('friendsa64221192eb9426cb02559a2da4307b9bd1b', 'user5f85906f805c38a55385d128cffe72b0d303', 'userb44ae64b48dcb460494223d463a3a0baa8bd', '2018-03-21 09:38:48', null, '1', null, 'userb44ae64b48dcb460494223d463a3a0baa8bd', null);

-- ----------------------------
-- Table structure for `invest_area_relation`
-- ----------------------------
DROP TABLE IF EXISTS `invest_area_relation`;
CREATE TABLE `invest_area_relation` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL COMMENT '关联user的id',
  `system_data_id` varchar(255) DEFAULT NULL COMMENT '关联system_data的 id',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投资领域关系表';

-- ----------------------------
-- Records of invest_area_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `invest_case`
-- ----------------------------
DROP TABLE IF EXISTS `invest_case`;
CREATE TABLE `invest_case` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL COMMENT '投资者user_id ,关联user表',
  `case_title` varchar(255) NOT NULL COMMENT '案例标题',
  `case_content` varchar(255) DEFAULT NULL COMMENT '案例简介',
  `case_img_url` varchar(255) DEFAULT NULL COMMENT '案例图标',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投资案例表';

-- ----------------------------
-- Records of invest_case
-- ----------------------------
INSERT INTO `invest_case` VALUES ('', 'user35e4e0ee7402471bdd7baf570a2477389ba1', '易集', null, 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F1510071.jpg', '2018-03-22 15:11:37', null, '1', null, '22', null);

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `user_name` varchar(255) NOT NULL COMMENT '动作执行者姓名',
  `action_id` varchar(255) NOT NULL COMMENT '动作ID',
  `action_text` varchar(255) DEFAULT NULL COMMENT '动作文本',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `create_user` varchar(255) NOT NULL COMMENT '动作执行者ID',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新者ID',
  `ip` varchar(255) NOT NULL COMMENT 'IP地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `content` text NOT NULL COMMENT '消息内容',
  `type` tinyint(4) NOT NULL COMMENT '消息类型 :1\\system系统消息;2\\个人发送的消息',
  `way` tinyint(4) DEFAULT NULL COMMENT '发送方式：1\\ 站内消息; 2\\短信',
  `user_id` varchar(255) DEFAULT NULL COMMENT '发送人id ,关联user表id,如果是个人发送的消息，关联后台用户表id',
  `user_name` varchar(30) DEFAULT NULL COMMENT '发送人微信昵称或姓名',
  `to_user_id` varchar(255) DEFAULT NULL COMMENT '接收人id',
  `to_user_name` varchar(255) DEFAULT NULL COMMENT '接收人微信昵称或姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '接收人号码',
  `title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `is_read` tinyint(1) DEFAULT NULL COMMENT '1:已读;2:未读',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '创建者姓名',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('message17d61db865016648e567fd9604f22e0c245d', '行业【撒地方】，请在行研页查看', '1', '2', '0', 'system(系统)', 'userb44ae64b48dcb460494223d463a3a0baa8bd', '其', '18000000000', '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '短信发送失败', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('message2ad322e915fc3127401d3cd19b0b2bdc71ff', '行业【撒地方】，请在行研页查看', '1', '2', '0', 'system(系统)', 'user5f85906f805c38a55385d128cffe72b0d303', '音阙司听', '18000000000', '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '短信发送失败', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('message30aa384c95d8f9a896933779f55042a38f0f', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'userb77a2b6c24e9b24e312a70920e14cac15d03', '三千里外＆暖', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('message421e0c9b7f7d67e72d7059671ba7fc5f2986', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'user35e4e0ee7402471bdd7baf570a2477389ba1', '福哥v587丶', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('message6e57837d6807562dee62e836c93ac6ba2522', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'usera585901973c9b77905754d77e493e4b2539d', '0x776a', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('message7f9effd340a494add4400c242bf182c43179', '你收到一个新项目，等待审阅！,项目名称:蚂蚁项目领域:不限', '1', '1', '0', 'system(系统)', 'user35e4e0ee7402471bdd7baf570a2477389ba1', '福哥v587丶', null, '新项目通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('message81b10f348a5f4856ad80f8c8d8d6078dca66', '尊敬的海峰，您的会员申请已经通过', '1', '2', '0', 'system(系统)', 'user5f85906f805c38a55385d128cffe72b0d303', '音阙司听', '18000000000', '会员审核通知', '2', '2018-03-20 00:00:00', null, '1', '短信发送失败', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('message975d98803016d39d84326783f6acce284ded', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a', '福哥v587丶', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('messagebecbc8f48ceb080c9c8f9e08b9cfd8d62541', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'user65e1dd9216593165b9175e21478fac80ef78', '三千里外＆暖', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('messagecc1bb52096acf96a6e9513a924f24d5a9211', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'user226a9e5c729a077f2a744cd7225b14c42ab0', '音阙司听', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('messagecda95b033fa6f3c0dd3bb0938c16afc7ebd6', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'user52bf7444181c410f46142e91989cf469f27d', '跃双', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('messagece64fef9882558515687ad48ec13107f89d6', '尊敬的副歌，您的会员申请已经通过', '1', '2', '0', 'system(系统)', 'user35e4e0ee7402471bdd7baf570a2477389ba1', '福哥v587丶', '18000000000', '会员审核通知', '2', '2018-03-22 00:00:00', null, '1', '短信发送失败', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('messageece56ff050246549bb5946b55685bdd5a011', '行业【撒地方】，请在行研页查看', '1', '2', '0', 'system(系统)', 'user9bee261e28194286f12a8bd2069ce68814ed', '其', '18000000000', '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '短信发送失败', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('messageed267aa87f1aa77f6874a6b76ad43c3a0d66', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'useracebc8302a34e2e63e22ebb2f2d8b8d3f3e4', '跃双', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);
INSERT INTO `message` VALUES ('messagef376881f9b96f973e8915669fbe1f1100532', '行业【撒地方】，请在行研页查看', '1', '1', '0', 'system(系统)', 'user1c947bb0901f6900fb9aa5f9658a5afe5e27', '0x776a', null, '新行研通知', '2', '2018-03-22 00:00:00', null, '1', '', '0', 'system(系统)', null);

-- ----------------------------
-- Table structure for `message_crontab`
-- ----------------------------
DROP TABLE IF EXISTS `message_crontab`;
CREATE TABLE `message_crontab` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `content` longtext NOT NULL COMMENT '要发送对象的相关信息JSON格式',
  `send_datetime` datetime NOT NULL COMMENT '发送时间',
  `way` tinyint(4) DEFAULT NULL COMMENT '发送方式：1\\\\ 站内消息; 2\\\\短信',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '创建者姓名',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时消息表(该表有个定时任务在轮循执行，时间粒度是每分钟一次)';

-- ----------------------------
-- Records of message_crontab
-- ----------------------------

-- ----------------------------
-- Table structure for `message_template`
-- ----------------------------
DROP TABLE IF EXISTS `message_template`;
CREATE TABLE `message_template` (
  `id` varchar(255) NOT NULL COMMENT '表ID ',
  `name` varchar(255) NOT NULL COMMENT '模板名 如：会员开通',
  `type` tinyint(1) NOT NULL COMMENT '通知方式 1.站内消息  2.短信',
  `content` varchar(255) NOT NULL COMMENT '消息模板内容',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime NOT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '1:存在;2:不存在   (逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key_name` (`name`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息模板,仅针对系统消息';

-- ----------------------------
-- Records of message_template
-- ----------------------------
INSERT INTO `message_template` VALUES ('messagetemplate10110', '新项目通知 ', '0', '你收到一个新项目,等待审阅！，【项目名称】、【 项目领域】', '2018-03-15 15:58:40', '0000-00-00 00:00:00', '1', null, null, null);
INSERT INTO `message_template` VALUES ('messagetemplate101ab', '账号禁用', '0', '由于您近期的违规操作，我们对您的账号进行封停', '2018-03-15 16:13:27', '0000-00-00 00:00:00', '1', null, null, null);
INSERT INTO `message_template` VALUES ('messagetemplate11111', '会员审核通知 ', '0', '尊敬的【用户名称】，您的会员申请已经通过或拒绝', '2018-03-15 16:02:47', '0000-00-00 00:00:00', '1', null, null, null);
INSERT INTO `message_template` VALUES ('messagetemplate1234', '项目审核通知', '0', '您提交的项目【项目名称】已跟进或拒绝', '2018-03-15 15:57:03', '0000-00-00 00:00:00', '1', null, null, null);
INSERT INTO `message_template` VALUES ('messagetemplate45687', '账号启用', '0', '您的易集账号，已经正常恢复启用', '2018-03-15 16:09:12', '0000-00-00 00:00:00', '1', null, null, null);
INSERT INTO `message_template` VALUES ('messagetemplate5678', '点评通知', '0', '你好！ 你在易集投递的【项目名称】项目获得投资人点评【点评内容】', '2018-03-15 16:00:03', '0000-00-00 00:00:00', '1', null, null, null);

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `title` varchar(255) NOT NULL COMMENT '正标题',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `desc` varchar(255) NOT NULL COMMENT '副标题',
  `test_content` text COMMENT '试读内容',
  `content` longtext NOT NULL COMMENT '新闻内容',
  `image_url` varchar(255) DEFAULT NULL COMMENT '新闻图标',
  `source` varchar(255) NOT NULL COMMENT '新闻来源',
  `views` bigint(20) DEFAULT NULL COMMENT '阅读数',
  `actual_views` bigint(20) DEFAULT NULL COMMENT '实际阅读数',
  `favorite_count` bigint(20) DEFAULT NULL COMMENT '收藏数',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型1:普通新闻;2:行研',
  `user_id` varchar(255) DEFAULT NULL COMMENT '投资人user_id,关联user',
  `collect_way` tinyint(255) DEFAULT NULL COMMENT '收集方式：1\\爬虫  2\\后台自己添加',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态:0\\待审核 \\1一审同意(进入二审) ;\\2.发布 ;3.\\拒绝(一审拒绝);4\\未发布（二审中保存或后台人工添加中保存）;5.\\拒绝(二审拒绝);',
  `is_top` tinyint(4) DEFAULT NULL COMMENT '1置顶  2未置顶',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者ID',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '创建者姓名',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者ID',
  `update_user_name` varchar(255) DEFAULT NULL COMMENT '更新者姓名',
  `examine_user` varchar(255) DEFAULT NULL COMMENT '审核人',
  `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('news8d5a7e0582c8687eb2809b882f38605580a9', '星星点灯', '未名', '这是篇人生历程', null, '<p>每当一个人死去，他的灵魂就会凝作宇宙中的星星，照亮着与他有关的人或事。我们仰望天空，点点。</p>', null, '自提', '10', null, '0', '1', null, '2', '2', '2', '2018-03-22 16:16:25', null, '2', null, '22', '汪见', null, null, null, null);
INSERT INTO `news` VALUES ('news990544432ecdf2cfcd29e362a99a24cbe01d', '是打发第三方', '桉树', '撒地方撒旦', null, '<p>阿斯顿发斯蒂芬</p>', null, '啊发生', '0', null, '0', '1', null, '2', '2', '2', '2018-03-22 16:11:27', '2018-03-22 16:12:07', '1', null, '22', '汪见', '22', '汪见', null, null);
INSERT INTO `news` VALUES ('newsa9bf686682ef383c308863b8ab1fa985932d', '新闻1', '阿荡', '爱迪生', null, '<p>安抚噶水电费会计师对方立刻就阿萨是老款的价格</p>', null, '百度', '10', null, '0', '1', null, '2', '2', '2', '2018-03-22 11:43:32', null, '1', null, '22', '汪见', null, null, null, null);

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `object_id` varchar(255) DEFAULT NULL COMMENT '投资者id (关联user表id)',
  `create_user_id` varchar(255) DEFAULT NULL COMMENT '创业者id (关联user表id)',
  `template_id` varchar(255) DEFAULT NULL COMMENT '关联 templeate表中id',
  `ismustfield_project_name` varchar(255) NOT NULL COMMENT '项目名称',
  `ismustfield_project_domain` varchar(255) DEFAULT NULL COMMENT '项目领域ID,管理system_data表中的ID',
  `ismustfield_project_domain_text` varchar(255) DEFAULT NULL COMMENT '投资领域文本',
  `ismustfield_project_logo_url` varchar(255) DEFAULT NULL COMMENT '项目logo',
  `ismustfield_project_bp_url` varchar(255) DEFAULT NULL COMMENT '项目BP附件',
  `ismustfield_create_name` varchar(255) DEFAULT NULL COMMENT '项目创始人姓名',
  `ismustfield_create_phone` varchar(255) DEFAULT NULL COMMENT ' 项目创始人联系方式',
  `ismustfield_financing_phase` varchar(255) DEFAULT NULL COMMENT '项目融资阶段ID,管理system_data表中的id',
  `ismustfield_financing_phase_text` varchar(255) DEFAULT NULL COMMENT '融资阶段文本',
  `ismustfield_financing_money` varchar(255) DEFAULT NULL COMMENT '项目融资金额',
  `ismustfield_project_desc` varchar(10000) DEFAULT NULL COMMENT '项目概况',
  `content` text COMMENT '项目提交完整信息:[{"title":''''团队多少人'''',"field_type":text,"field_group":1,"field_group_location":2},{.....}]',
  `status` varchar(255) DEFAULT NULL COMMENT '项目状态  1待处理  2.跟进中  3.已拒绝',
  `collect_way` tinyint(4) DEFAULT NULL COMMENT '项目收集方式 1:当面扫一扫; 2:转发朋友; 3:发送邮件',
  `type` tinyint(4) DEFAULT NULL COMMENT '1:向投资提交的项目; 2:向项目活动提交的项目',
  `investor_view_time` datetime DEFAULT NULL COMMENT '投资者查看时间',
  `creator_view_time` datetime DEFAULT NULL COMMENT '创业者查看时间',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在; 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注或拒绝项目的理由',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('projectaf80b6a8568875f3175eba9532d7c96d5e6a', 'user35e4e0ee7402471bdd7baf570a2477389ba1', 'user9bee261e28194286f12a8bd2069ce68814ed', 'aa7737b50ae370478d635ce13fd7', '蚂蚁', '0', '不限', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F103902tmp_a6210c8c4b4e1edb3a9fc53e36e9076e1829c191a1a99b66.jpg', null, '这', '18000000000', '0', '不限', '500万', '通用', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"原创\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":0,\"txtStyle\":\"left:0px\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"蚂蚁\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":1,\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"通用\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":2,\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F103902tmp_a6210c8c4b4e1edb3a9fc53e36e9076e1829c191a1a99b66.jpg\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":3,\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":1,\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":4,\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"一周\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":5,\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"不限\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":6,\"txtStyle\":\"left:0px\",\"pickerArray\":[{\"id\":\"0\",\"name\":\"不限\"},{\"id\":\"systemdata0ab806fe78a2b76ab670b7c73970911961dd\",\"p_id\":\"0\",\"sort\":4,\"group\":1,\"name\":\"金融\",\"create_time\":\"2018-03-20 14:04:59\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdataad5f2f245d1515a35c573e35a234edf97afe\",\"p_id\":\"0\",\"sort\":3,\"group\":1,\"name\":\"电商\",\"create_time\":\"2018-03-20 14:04:42\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata52195334213512e58b23d40203d47ac8cd05\",\"p_id\":\"0\",\"sort\":2,\"group\":1,\"name\":\"教育\",\"create_time\":\"2018-03-20 14:04:31\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata08ea732a58f9d54f7a5fec156d414d3e8183\",\"p_id\":\"0\",\"sort\":1,\"group\":1,\"name\":\"医疗\",\"create_time\":\"2018-03-20 14:04:23\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null}],\"picker\":[\"不限\",\"金融\",\"电商\",\"教育\",\"医疗\"]},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"无\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":7,\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"玉米\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":8,\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"投\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":9,\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"跟我\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":10,\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"投\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":11,\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"无\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":12,\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"楼\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":13,\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"不限\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":0,\"txtStyle\":\"left:0px\",\"pickerArray\":[{\"id\":\"0\",\"name\":\"不限\"},{\"id\":\"systemdataa8e830147e5cd7be957f1137f702b858d251\",\"p_id\":\"0\",\"sort\":12,\"group\":2,\"name\":\"种子轮\",\"create_time\":\"2018-03-20 14:14:38\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata88c5d551750807081e79b8476f1a9e6b3271\",\"p_id\":\"0\",\"sort\":11,\"group\":2,\"name\":\"天使轮\",\"create_time\":\"2018-03-20 14:14:29\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdataf99ab8906d5e4600e0624b56b3c005c5fcca\",\"p_id\":\"0\",\"sort\":10,\"group\":2,\"name\":\"PreA轮\",\"create_time\":\"2018-03-20 14:14:17\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata6ca8d54b7d3267b3e07ba887bf7bd9eb9598\",\"p_id\":\"0\",\"sort\":9,\"group\":2,\"name\":\"A轮\",\"create_time\":\"2018-03-20 14:14:08\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata54ea5d825025856b725204f576c360aa622b\",\"p_id\":\"0\",\"sort\":8,\"group\":2,\"name\":\"A+轮\",\"create_time\":\"2018-03-20 14:13:58\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata2353c8be14dc1137281805e15a251079effe\",\"p_id\":\"0\",\"sort\":7,\"group\":2,\"name\":\"PreB轮\",\"create_time\":\"2018-03-20 14:13:47\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata170f482d773be7bd767b02e793a97cba7f73\",\"p_id\":\"0\",\"sort\":6,\"group\":2,\"name\":\"B轮\",\"create_time\":\"2018-03-20 14:13:32\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata10a5bd439a1fa9d1e99c3299edfe464509e0\",\"p_id\":\"0\",\"sort\":5,\"group\":2,\"name\":\"B+轮\",\"create_time\":\"2018-03-20 14:13:19\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdatabe50f8b88d9c582f258634d85858d542ac89\",\"p_id\":\"0\",\"sort\":4,\"group\":2,\"name\":\"C轮\",\"create_time\":\"2018-03-20 14:12:45\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata78e6c0921f8f011c2013fef117b273b3bb3c\",\"p_id\":\"0\",\"sort\":3,\"group\":2,\"name\":\"C+轮\",\"create_time\":\"2018-03-20 14:12:35\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdatac9af4b1a61370651376302e61bae5ce2af15\",\"p_id\":\"0\",\"sort\":2,\"group\":2,\"name\":\"D轮\",\"create_time\":\"2018-03-20 14:12:17\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null},{\"id\":\"systemdata2dc276fe7d1057600178ff5703ab5e7f1b40\",\"p_id\":\"0\",\"sort\":1,\"group\":2,\"name\":\"E轮及以后\",\"create_time\":\"2018-03-20 14:11:35\",\"update_time\":null,\"is_delete\":1,\"remark\":null,\"create_user\":\"22\",\"update_user\":null}],\"picker\":[\"不限\",\"种子轮\",\"天使轮\",\"PreA轮\",\"A轮\",\"A+轮\",\"PreB轮\",\"B轮\",\"B+轮\",\"C轮\",\"C+轮\",\"D轮\",\"E轮及以后\"]},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"500万\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":1,\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"150万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":2,\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"这\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":0,\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"18000000000\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":1,\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"抠门\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":0,\"txtStyle\":\"left:0px\"}]', '1', '2', '1', null, null, '2018-03-22 10:40:19', null, '1', null, 'user9bee261e28194286f12a8bd2069ce68814ed', null);

-- ----------------------------
-- Table structure for `project_record`
-- ----------------------------
DROP TABLE IF EXISTS `project_record`;
CREATE TABLE `project_record` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `content` varchar(255) NOT NULL COMMENT '记录内容',
  `user_id` varchar(255) NOT NULL COMMENT '投资者ID',
  `project_id` varchar(255) DEFAULT NULL COMMENT '关联project表中id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '状态： 1\\存在 2\\不存在',
  `remark` varchar(255) DEFAULT NULL COMMENT '注释',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_record
-- ----------------------------

-- ----------------------------
-- Table structure for `project_verity`
-- ----------------------------
DROP TABLE IF EXISTS `project_verity`;
CREATE TABLE `project_verity` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT '表ID',
  `project_id` varchar(255) NOT NULL COMMENT '项目ID关联project表中的id',
  `random_num` varchar(255) NOT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目BP附件';

-- ----------------------------
-- Records of project_verity
-- ----------------------------
INSERT INTO `project_verity` VALUES ('projectveritybe19ffbc3e9ea3e8093e26c3b8c37e30d967', 'projectaf80b6a8568875f3175eba9532d7c96d5e6a', '86400473', 'user9bee261e28194286f12a8bd2069ce68814ed', '2018-03-22 10:40:19', null, '1', null, 'user9bee261e28194286f12a8bd2069ce68814ed', null);

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `s_date` date DEFAULT NULL COMMENT '日程日期',
  `s_time` time DEFAULT NULL COMMENT '日程时间',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程表';

-- ----------------------------
-- Records of schedule
-- ----------------------------

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `key` varchar(255) NOT NULL COMMENT '键名',
  `display_name` varchar(255) NOT NULL COMMENT '展示名',
  `value` text NOT NULL COMMENT '值',
  `type` varchar(255) NOT NULL COMMENT '类型 图像:image;文本框:text;',
  `group` varchar(255) DEFAULT NULL COMMENT '分组',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of setting
-- ----------------------------

-- ----------------------------
-- Table structure for `system_data`
-- ----------------------------
DROP TABLE IF EXISTS `system_data`;
CREATE TABLE `system_data` (
  `id` varchar(255) NOT NULL COMMENT '表id',
  `p_id` varchar(255) NOT NULL COMMENT '父id 0：顶级',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `group` tinyint(12) DEFAULT NULL COMMENT '分组 1:投资领域; 2:投资阶段',
  `name` varchar(255) NOT NULL COMMENT '文本',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统相关参数分类表';

-- ----------------------------
-- Records of system_data
-- ----------------------------
INSERT INTO `system_data` VALUES ('systemdata08ea732a58f9d54f7a5fec156d414d3e8183', '0', '1', '1', '医疗', '2018-03-20 14:04:23', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata0ab806fe78a2b76ab670b7c73970911961dd', '0', '4', '1', '金融', '2018-03-20 14:04:59', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata0aec8d51346203d482384ba326e5c437f112', '0', '3', '1', '医疗', '2018-03-01 11:31:36', '2018-03-14 21:26:38', '2', null, '22', '22');
INSERT INTO `system_data` VALUES ('systemdata10a5bd439a1fa9d1e99c3299edfe464509e0', '0', '5', '2', 'B+轮', '2018-03-20 14:13:19', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata15cae3fe94fb2905dd976d4970dc0522a88c', '0', '2', '2', '阶段1', '2018-03-01 13:41:41', null, '2', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata170f482d773be7bd767b02e793a97cba7f73', '0', '6', '2', 'B轮', '2018-03-20 14:13:32', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata2097635d848ba87909847698087576f3c180', '0', '5', '1', '教育', '2018-03-16 10:32:44', null, '2', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata2353c8be14dc1137281805e15a251079effe', '0', '7', '2', 'PreB轮', '2018-03-20 14:13:47', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata2dc276fe7d1057600178ff5703ab5e7f1b40', '0', '1', '2', 'E轮及以后', '2018-03-20 14:11:35', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata45a047ff2abcb2e6442a2b82814b6ad2e798', '0', '5', '1', '教育', '2018-03-14 10:01:06', '2018-03-16 10:32:20', '2', null, '22', '22');
INSERT INTO `system_data` VALUES ('systemdata52195334213512e58b23d40203d47ac8cd05', '0', '2', '1', '教育', '2018-03-20 14:04:31', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata54ea5d825025856b725204f576c360aa622b', '0', '8', '2', 'A+轮', '2018-03-20 14:13:58', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata56a6a009942e098b6a9a6179bc5348a04f3d', '0', '2', '2', '天使轮', '2018-03-20 14:11:53', null, '2', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata6ca8d54b7d3267b3e07ba887bf7bd9eb9598', '0', '9', '2', 'A轮', '2018-03-20 14:14:08', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata74a887b1206bf2fbde260bc2d2bfc477d27e', '0', '5', '1', '电商', '2018-03-14 20:24:37', null, '2', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata78094cd16462e6cf306f914692ed4def458f', '0', '1', '2', 'A轮', '2018-03-14 09:54:58', null, '2', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata78e6c0921f8f011c2013fef117b273b3bb3c', '0', '3', '2', 'C+轮', '2018-03-20 14:12:35', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata88c5d551750807081e79b8476f1a9e6b3271', '0', '11', '2', '天使轮', '2018-03-20 14:14:29', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata938a139049894420ec480f8495c9b4849f88', '0', '1', '2', 'A轮', '2018-03-14 10:00:50', null, '2', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdata967707d3308cf3e74735c413f4b3936764b2', '0', '7', '1', '领域C', '2018-03-13 20:09:02', null, '2', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdataa8e830147e5cd7be957f1137f702b858d251', '0', '12', '2', '种子轮', '2018-03-20 14:14:38', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdataad5f2f245d1515a35c573e35a234edf97afe', '0', '3', '1', '电商', '2018-03-20 14:04:42', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdatabe50f8b88d9c582f258634d85858d542ac89', '0', '4', '2', 'C轮', '2018-03-20 14:12:45', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdatac9af4b1a61370651376302e61bae5ce2af15', '0', '2', '2', 'D轮', '2018-03-20 14:12:17', null, '1', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdatacd7567274765e426894ac324bca0212eecf9', '0', '2', '1', '领域B', '2018-03-13 20:00:43', null, '2', null, '22', null);
INSERT INTO `system_data` VALUES ('systemdataf99ab8906d5e4600e0624b56b3c005c5fcca', '0', '10', '2', 'PreA轮', '2018-03-20 14:14:17', null, '1', null, '22', null);

-- ----------------------------
-- Table structure for `template`
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL COMMENT '收集表模板所属人id(关联user表中的id),当为系统模板时为0',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '1:默认; 2:不是默认',
  `content` text COMMENT '模板格式:[{"title":''项目名称'',"field_key":"project_name","field_type":text,"field_is_must":1,"field_group":1,"field_group_location":2},{.....}]',
  `title` varchar(255) NOT NULL COMMENT '模板标题',
  `template_qrcode_url` varchar(500) NOT NULL COMMENT '模板二维码URL',
  `template_qrcode_expireat` datetime NOT NULL COMMENT '模板二维码到期日期',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在; 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '创建人名字',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  `update_user_name` varchar(255) DEFAULT NULL COMMENT '更新人姓名',
  `type` tinyint(1) DEFAULT NULL COMMENT '1:系统默认;2:项目活动模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='某位投资者创建的收集表模板';

-- ----------------------------
-- Records of template
-- ----------------------------
INSERT INTO `template` VALUES ('2ccb822b7605bec95e7c37ae0e8d', 'user65e1dd9216593165b9175e21478fac80ef78', '1', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"4ze865zoqz9\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"mdh749r07f\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"8x2fvupznpd\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"ytks9oft58\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"x6tu54gpzci\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"uix5bsffqq\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"stllk7zela9\",\"txtStyle\":\"left:0px\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"z1t4td75dpa\",\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"t5q5fyhp8ni\",\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"v7y9tvfnvo\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"5s0skmi7xwa\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"vw369gr7j6b\",\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"7w953i49cu6\",\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"k39w4qeaoa\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"8chyg9phe89\",\"txtStyle\":\"left:0px\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"6oe0x6is36f\",\"txtStyle\":\"left:0px\"},{\"title\":\"融资史\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX年-XX轮-XX万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":3,\"id\":\"jj3jerdomw\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"oasgpg193n\",\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"m1y9x59uwfq\",\"txtStyle\":\"left:0px\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"xw7b56x3h79\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"bfd4dr4f6wk\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"6bqqnhdlxw\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"dnbqxrmnsjj\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"6uk5ggkcpz9\",\"txtStyle\":\"left:0px\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"o5cbd9d2u8b\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"vibq44xjc0q\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员2背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":7,\"id\":\"tsp5vdefndc\",\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"i6ifxggfdfs\",\"txtStyle\":\"left:0px\"}]', '新模版', '', '0000-00-00 00:00:00', '2018-03-20 17:07:01', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('34a14db77f21cd86add93b53b350', 'user65e1dd9216593165b9175e21478fac80ef78', '2', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"8befpzfq3km\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"6n7izwdxi38\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"auv7gf6y4pb\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"29tgeminc9z\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"biq0etfd83n\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"brmxfovafq\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"0axb90c6kdaq\",\"txtStyle\":\"left:0px\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"s9gsurtas4d\",\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"f8rn0yx0tj\",\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"mlixvtxpxya\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"tngwp6pplwm\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"x501ltt2v9q\",\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"cgaknriozqm\",\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"qs2blwxn2t\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"1d3vj9m76xp\",\"txtStyle\":\"left:0px\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"bgy2l5yftgw\",\"txtStyle\":\"left:0px\"},{\"title\":\"融资史\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX年-XX轮-XX万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":3,\"id\":\"0m8lrr7940p\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"t9zjd19jdh9\",\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"m7vqdmvivsa\",\"txtStyle\":\"left:0px\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"9xzze7jc2ej\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"b88uhau3r9c\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"k5pnskgt9a9\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"7l2tpw5gcfu\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"mkg4twwli6d\",\"txtStyle\":\"left:0px\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"6371hcsejse\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"sfvmkmzcdm8\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员2背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":7,\"id\":\"qsgb3jvcxn\",\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"r3fgnyghglf\",\"txtStyle\":\"left:0px\"},{\"id\":\"ubf2l03y0g\",\"field_type\":\"text\",\"field_group\":4,\"field_prompt\":\"123456\",\"title\":\"1234567890\",\"txtStyle\":\"left:0px\"}]', '我的模版', '', '0000-00-00 00:00:00', '2018-03-20 17:11:06', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('4900d0053ea4a2d65febdfcc020f', 'user35e4e0ee7402471bdd7baf570a2477389ba1', '2', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"gikbui95ap7\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"fzxruex2caj\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"tkqqm6dvwr\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"usyhbnvxnzs\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"uh901jsyzw\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"verfzraobw\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"3z7k4g4vvmn\",\"txtStyle\":\"left:0px\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"rnqpeujhiim\",\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"ocmb6oenat\",\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"hdfgwelm2tm\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"mkdpuhp0ys\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"dr7595e1w9q\",\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"actngo03b9k\",\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"xp8lpguavlr\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"apsxt4lk16o\",\"txtStyle\":\"left:0px\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"did953rv9si\",\"txtStyle\":\"left:0px\"},{\"title\":\"融资史\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX年-XX轮-XX万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":3,\"id\":\"al8wmvqs4qp\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"fx431iaalmw\",\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"afikq9sdwnw\",\"txtStyle\":\"left:0px\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"laxczj053yr\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"19cdtkgzqht\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"9she2oaul8a\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"r33s8dvmygm\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"z9ksvi2tj1p\",\"txtStyle\":\"left:0px\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"r0c46zp6kbi\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"mca5kg3m4s\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员2背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":7,\"id\":\"jy1o1p03fzd\",\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"mv9qc304dub\",\"txtStyle\":\"left:0px\"}]', '模板1', '', '0000-00-00 00:00:00', '2018-03-21 17:38:53', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('821a4e21e82c8c2c2281f19803aa', 'userb44ae64b48dcb460494223d463a3a0baa8bd', '1', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"oc11p47rw8n\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"n9h19ukrat\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"yykjhozte8a\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"186zjd7rgnvj\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"6e7ub27ddgm\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"963gc4jixvc\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"xr3u6vrum9\",\"txtStyle\":\"left:0px\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"yd2g7k5vu3\",\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"q0ikshij989\",\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"z9g7ntkd9j\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"154vz7l969z\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"dhs26yav5dr\",\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"jrfyak0qcoi\",\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"btwusf7a6ra\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"77a2omrxk05\",\"txtStyle\":\"left:0px\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"qwl41d2vot\",\"txtStyle\":\"left:0px\"},{\"title\":\"融资史\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX年-XX轮-XX万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":3,\"id\":\"97zpu9s9gkq\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"9nlk8u1fezw\",\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"i5x8jzv1e1l\",\"txtStyle\":\"left:0px\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"soy6rwref7i\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"vorbdywxoh\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"xcukht67g7\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"xitc7jxomm\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"8xs7rvrsv59\",\"txtStyle\":\"left:0px\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"dfliw4sih6f\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"xwr8s1c3qjo\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员2背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":7,\"id\":\"0z1x84epnx0k\",\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"y0ssznteuea\",\"txtStyle\":\"left:0px\"}]', '我们', '', '0000-00-00 00:00:00', '2018-03-22 14:17:30', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('a137269ad915e23ebd84fee9ebd4', 'usera585901973c9b77905754d77e493e4b2539d', '2', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"s0j2n9407tb\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"c8klfr615zd\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"b63bn5ylp08\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"stj6lum24v\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"l9hhl4x6n4r\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"wi7e2jac0n\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"40uoaao7m43\",\"txtStyle\":\"left:0px\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"fwy3gyq06q6\",\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"6k7sh65t9m2\",\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"8ehri6h43hb\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"0dxp5980x9u\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"2ov6gata9ef\",\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"xswqm6u16zp\",\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"fm6gjvi0sdg\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"89u4iyug3ee\",\"txtStyle\":\"left:0px\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"shlfo87084\",\"txtStyle\":\"left:0px\"},{\"title\":\"融资史\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX年-XX轮-XX万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":3,\"id\":\"aevjymanxdd\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"el2ib1zmloc\",\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"79tznqd7af\",\"txtStyle\":\"left:0px\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"sac30i2q8j\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"kb78crz8syd\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"gya4fd9n2uq\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"l3jfr6ecwsq\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"gc68izhofc\",\"txtStyle\":\"left:0px\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"f4vd7smgtbi\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"uidahzklbc\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员2背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":7,\"id\":\"dg7tlb0f946\",\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"damnrdxyzd\",\"txtStyle\":\"left:0px\"}]', '家具', '', '0000-00-00 00:00:00', '2018-03-21 16:16:06', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('aa7737b50ae370478d635ce13fd7', 'user35e4e0ee7402471bdd7baf570a2477389ba1', '1', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"nf1pypjoei8\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"d19rvn43rxt\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"dfm3rmzd8l\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"2y26yuratm7\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"kcq484x5qc\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"isi7opgtsl\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"u37gxdkt64n\",\"txtStyle\":\"left:0px\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"m8srmz22xv\",\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"pcmz8urp3bk\",\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"0nxdeyykfad\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"x96j12zcl78\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"s74b3qbhu6g\",\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"ssty7f1w8es\",\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"2ix7ipu4zry\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"phrsvdtodj\",\"txtStyle\":\"left:0px\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"ms06mcaxfmr\",\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"ork66u2soo\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"vkh71gvgdt\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"6l0o5cg1xst\",\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"kvrow5pezy\",\"txtStyle\":\"left:0px\"}]', '模板', '', '0000-00-00 00:00:00', '2018-03-21 17:34:34', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('ac6063b2e1507668b6ecaa028867', 'user52bf7444181c410f46142e91989cf469f27d', '1', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"zf3dr9j293\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"25j5seuzluh\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"mazfghqsrp\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"0vzdnmlygxn\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"fbnx6kjhu5p\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"x3j3e9ru63b\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"2i9pdv29v27\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"wlq77x0yrib\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"66rty93ofkq\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"dxl0g9mi1qf\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"jfa8q6gco0d\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"98prppsvzdo\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"7zj5lknwls8\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"mty6q6jf0n\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"lk8hyljtixh\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"zmve7w1oqe\"},{\"title\":\"融资史\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX年-XX轮-XX万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":3,\"id\":\"7kfrw9avyvl\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"9z8839hc1bp\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"epgjykcdtsm\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"wyb2lf9swce\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"8y4dl56q83t\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"kmow25l0hf\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"6rjeyjq4wis\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"pvrzglnraa\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"j0ljw94d8ol\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"9dv66hckwo\"},{\"title\":\"核心团队成员2背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":7,\"id\":\"pplckn9y1ud\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"jkwzswszi8a\"}]', '默认收集表', '', '0000-00-00 00:00:00', '2018-03-21 11:00:04', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('bf23777abd9d97ab31dfcf3b6178', 'usera585901973c9b77905754d77e493e4b2539d', '1', '[{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"s8y7alk1wp\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"j4xc9tvq02s\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"nvgq2lwfit\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"e7bplbk3rnv\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"2cozh9vfosi\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"s53x19b5qe\",\"txtStyle\":\"left:0px\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"v0yu5txu7p\",\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"dc0qc6nw5uc\",\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"82gbabety2j\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"ygpydqr8pvc\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"3kwwksh4mrh\",\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"wt5v16x6boh\",\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"89zkqecxv56\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"cya08weulg\",\"txtStyle\":\"left:0px\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"bocrd97slhi\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"53g034fouq4\",\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"d53dbtxpw1\",\"txtStyle\":\"left:0px\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"x8bjqvjvdu\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"noto5bzph9j\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"hkq9fkb935r\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"2opol10ayh6\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"ct3jasw9g8j\",\"txtStyle\":\"left:0px\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"5z3gsevl7m7\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"b8qalz1dnj8\",\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"ni05bo059vk\",\"txtStyle\":\"left:0px\"}]', '模板1', '', '0000-00-00 00:00:00', '2018-03-20 17:01:51', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('df70accdd60cde68a32425927fca', 'user5f85906f805c38a55385d128cffe72b0d303', '1', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"sg61ejvhb7\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"sv1yy29htk\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"90he7y8cwqe\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"ssjmb8pxlup\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"vp0krwh0l7\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"i1w4p02gxb\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"1etewmhgnqh\",\"txtStyle\":\"left:0px\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"w1w2r6jbr9j\",\"txtStyle\":\"left:0px\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"zp6fg0ywbtm\",\"txtStyle\":\"left:0px\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"ozsq0pkf07\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"0m0cbbl4ztng\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"jt1rj71rfmf\",\"txtStyle\":\"left:0px\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"8setxkbb5ia\",\"txtStyle\":\"left:0px\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"y2yggsp9ck\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"tkotk2vucka\",\"txtStyle\":\"left:0px\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"2m7wvpl5zgt\",\"txtStyle\":\"left:0px\"},{\"title\":\"融资史\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX年-XX轮-XX万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":3,\"id\":\"uq1mok9wtvb\",\"txtStyle\":\"left:0px\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"r6zshuchi28\",\"txtStyle\":\"left:0px\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"olo6a7ibiq\",\"txtStyle\":\"left:0px\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"a3xtnlsrm3\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"qmfe4cxfij\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"lf76wbqex2\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"sisf7qqzgic\",\"txtStyle\":\"left:0px\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"1vg2w1m6huo\",\"txtStyle\":\"left:0px\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"nla7733og4s\",\"txtStyle\":\"left:0px\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"3pmf5r7uahj\",\"txtStyle\":\"left:-75px\"},{\"title\":\"核心团队成员2背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":7,\"id\":\"bt1zdw2cedg\",\"txtStyle\":\"left:0px\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"x6ikq6xpoli\",\"txtStyle\":\"left:0px\"}]', '模板1', '', '0000-00-00 00:00:00', '2018-03-21 16:00:18', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('f0b16d8e8586c49f5a190f076603', 'usera585901973c9b77905754d77e493e4b2539d', '2', '[{\"title\":\"公司名称\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":1,\"id\":\"zt4eghit25o\"},{\"title\":\"项目名称\",\"field_key\":\"project_name\",\"field_type\":\"text\",\"field_prompt\":\"项目名称\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":2,\"id\":\"qn78eovybmh\"},{\"title\":\"项目描述\",\"field_key\":\"project_desc\",\"field_type\":\"textarea\",\"field_prompt\":\"一句话描述项目\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":3,\"id\":\"okheh4fld98\"},{\"title\":\"项目LOGO\",\"field_key\":\"project_logo_url\",\"field_type\":\"image\",\"field_prompt\":\"上传图片\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":4,\"id\":\"363fi2f90y\"},{\"title\":\"项目BP\",\"field_key\":\"project_bp_url\",\"field_type\":\"file\",\"field_prompt\":\"上传附件\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":5,\"id\":\"dozaowr6oed\",\"txtStyle\":\"left:0px\"},{\"title\":\"项目所在地\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"地址信息\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":6,\"id\":\"xac62dej5t\"},{\"title\":\"项目所属行业领域\",\"field_key\":\"project_domain\",\"field_type\":\"select\",\"field_prompt\":\"\",\"field_is_must\":1,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":7,\"id\":\"7qdg57xxdjh\"},{\"title\":\"市场背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"市场容量，市场竞争格局\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":8,\"id\":\"8oka2it7xxl\"},{\"title\":\"商业模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":9,\"id\":\"buqa5o1iul\"},{\"title\":\"盈利模式\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":10,\"id\":\"0s8d78p4q8w9\"},{\"title\":\"核心竞争力\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"简短描述不可被复制原因\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":11,\"id\":\"snvmvqocd4\"},{\"title\":\"核心业务指标\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"列举已有运营数据\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":12,\"id\":\"o3hvrc6wh5f\"},{\"title\":\"已有资源背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"合作资源，客户资源，资质证明等\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":13,\"id\":\"4v7stdg9tfs\"},{\"title\":\"3年发展规划\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"业务数据量及财务预测\",\"field_is_must\":0,\"field_group\":1,\"field_group_title\":\"项目基本信息\",\"field_group_location\":14,\"id\":\"wsg60pbdqia\"},{\"title\":\"当前融资轮次\",\"field_key\":\"financing_phase\",\"field_type\":\"select\",\"field_prompt\":\"请选择\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":1,\"id\":\"ahyxfvw6e9c\"},{\"title\":\"计划融资额\",\"field_key\":\"financing_money\",\"field_type\":\"text\",\"field_prompt\":\"请输入\",\"field_is_must\":1,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":2,\"id\":\"0gvg2bwhdz7o\"},{\"title\":\"融资史\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX年-XX轮-XX万\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":3,\"id\":\"zc1vbem37e\"},{\"title\":\"当前股权结构\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"XX机构\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":4,\"id\":\"z87lc0ufgji\"},{\"title\":\"现有资金情况\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":5,\"id\":\"mq1waghfn2l\"},{\"title\":\"资金使用计划\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"资金使用情况\",\"field_is_must\":0,\"field_group\":2,\"field_group_title\":\"融资规划\",\"field_group_location\":6,\"id\":\"4v8exaldyf9\"},{\"title\":\"创始人姓名\",\"field_key\":\"create_name\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":1,\"id\":\"50o56lm03fn\"},{\"title\":\"创始人联系方式\",\"field_key\":\"create_phone\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":1,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":2,\"id\":\"ae5lskibkfd\"},{\"title\":\"创始人教育背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":3,\"id\":\"nznnkbyvdu\"},{\"title\":\"创始人背景\",\"field_key\":\"\",\"field_type\":\"textarea\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":4,\"id\":\"tjs2ejmcn3\"},{\"title\":\"团队人数\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"团队已有人数\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":5,\"id\":\"bf9gf7o2e9d\"},{\"title\":\"核心团队成员1背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":6,\"id\":\"9cqlk32mzxb\"},{\"title\":\"核心团队成员2背景\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"请填写\",\"field_is_must\":0,\"field_group\":3,\"field_group_title\":\"团队信息\",\"field_group_location\":7,\"id\":\"3kpu1tbctb5\"},{\"title\":\"其他信息\",\"field_key\":\"\",\"field_type\":\"text\",\"field_prompt\":\"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\"field_is_must\":0,\"field_group\":4,\"field_group_title\":\"其他信息\",\"field_group_location\":1,\"id\":\"1avq6znvpsx\"}]', '模板2', '', '0000-00-00 00:00:00', '2018-03-20 17:36:16', null, '1', null, null, null, null, null, null);
INSERT INTO `template` VALUES ('template35355cde26d9d261c82', '0', '1', '[{\r\n		\"title\": \"公司名称\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 1\r\n	},\r\n	{\r\n		\"title\": \"项目名称\",\r\n		\"field_key\": \"project_name\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"项目名称\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 2\r\n	},\r\n	{\r\n		\"title\": \"项目描述\",\r\n		\"field_key\": \"project_desc\",\r\n		\"field_type\": \"textarea\",\r\n		\"field_prompt\": \"一句话描述项目\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 3\r\n	},\r\n	{\r\n		\"title\": \"项目LOGO\",\r\n		\"field_key\": \"project_logo_url\",\r\n		\"field_type\": \"image\",\r\n		\"field_prompt\": \"上传图片\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 4\r\n	},\r\n	{\r\n		\"title\": \"项目BP\",\r\n		\"field_key\": \"project_bp_url\",\r\n		\"field_type\": \"file\",\r\n		\"field_prompt\": \"上传附件\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 5\r\n	},\r\n	{\r\n		\"title\": \"项目所在地\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"地址信息\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 6\r\n	},\r\n	{\r\n		\"title\": \"项目所属行业领域\",\r\n		\"field_key\": \"project_domain\",\r\n		\"field_type\": \"select\",\r\n		\"field_prompt\": \"\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 7\r\n	},\r\n	{\r\n		\"title\": \"市场背景\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"市场容量，市场竞争格局\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 8\r\n	},\r\n	{\r\n		\"title\": \"商业模式\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"请输入\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 9\r\n	},\r\n	{\r\n		\"title\": \"盈利模式\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"请输入\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 10\r\n	},\r\n	{\r\n		\"title\": \"核心竞争力\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"简短描述不可被复制原因\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 11\r\n	},\r\n	{\r\n		\"title\": \"核心业务指标\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"列举已有运营数据\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 12\r\n	},\r\n	{\r\n		\"title\": \"已有资源背景\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"textarea\",\r\n		\"field_prompt\": \"合作资源，客户资源，资质证明等\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 13\r\n	},\r\n	{\r\n		\"title\": \"3年发展规划\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"业务数据量及财务预测\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 1,\r\n		\"field_group_title\": \"项目基本信息\",\r\n		\"field_group_location\": 14\r\n	},\r\n	{\r\n		\"title\": \"当前融资轮次\",\r\n		\"field_key\": \"financing_phase\",\r\n		\"field_type\": \"select\",\r\n		\"field_prompt\": \"请选择\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 2,\r\n		\"field_group_title\": \"融资规划\",\r\n		\"field_group_location\": 1\r\n	},\r\n	{\r\n		\"title\": \"计划融资额\",\r\n		\"field_key\": \"financing_money\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"请输入\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 2,\r\n		\"field_group_title\": \"融资规划\",\r\n		\"field_group_location\": 2\r\n	},\r\n	{\r\n		\"title\": \"融资史\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"XX年-XX轮-XX万\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 2,\r\n		\"field_group_title\": \"融资规划\",\r\n		\"field_group_location\": 3\r\n	},\r\n	{\r\n		\"title\": \"当前股权结构\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"XX机构\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 2,\r\n		\"field_group_title\": \"融资规划\",\r\n		\"field_group_location\": 4\r\n	},\r\n	{\r\n		\"title\": \"现有资金情况\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"请填写\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 2,\r\n		\"field_group_title\": \"融资规划\",\r\n		\"field_group_location\": 5\r\n	},\r\n	{\r\n		\"title\": \"资金使用计划\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"textarea\",\r\n		\"field_prompt\": \"资金使用情况\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 2,\r\n		\"field_group_title\": \"融资规划\",\r\n		\"field_group_location\": 6\r\n	},\r\n	{\r\n		\"title\": \"创始人姓名\",\r\n		\"field_key\": \"create_name\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"请填写\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 3,\r\n		\"field_group_title\": \"团队信息\",\r\n		\"field_group_location\": 1\r\n	},\r\n	{\r\n		\"title\": \"创始人联系方式\",\r\n		\"field_key\": \"create_phone\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"请填写\",\r\n		\"field_is_must\": 1,\r\n		\"field_group\": 3,\r\n		\"field_group_title\": \"团队信息\",\r\n		\"field_group_location\": 2\r\n	},\r\n	{\r\n		\"title\": \"创始人教育背景\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"textarea\",\r\n		\"field_prompt\": \"请填写\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 3,\r\n		\"field_group_title\": \"团队信息\",\r\n		\"field_group_location\": 3\r\n	},\r\n	{\r\n		\"title\": \"创始人背景\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"textarea\",\r\n		\"field_prompt\": \"请填写\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 3,\r\n		\"field_group_title\": \"团队信息\",\r\n		\"field_group_location\": 4\r\n	},\r\n	{\r\n		\"title\": \"团队人数\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"团队已有人数\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 3,\r\n		\"field_group_title\": \"团队信息\",\r\n		\"field_group_location\": 5\r\n	},\r\n	{\r\n		\"title\": \"核心团队成员1背景\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"请填写\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 3,\r\n		\"field_group_title\": \"团队信息\",\r\n		\"field_group_location\": 6\r\n	},\r\n	{\r\n		\"title\": \"核心团队成员2背景\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"请填写\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 3,\r\n		\"field_group_title\": \"团队信息\",\r\n		\"field_group_location\": 7\r\n	},\r\n	{\r\n		\"title\": \"其他信息\",\r\n		\"field_key\": \"\",\r\n		\"field_type\": \"text\",\r\n		\"field_prompt\": \"若在浙江省创新创业大赛浙江省行业决赛中获奖，有高层次及海归人才，或其他说明，请在此填写\",\r\n		\"field_is_must\": 0,\r\n		\"field_group\": 4,\r\n		\"field_group_title\": \"其他信息\",\r\n		\"field_group_location\": 1\r\n	}\r\n\r\n]', '系统模板标题', '', '0000-00-00 00:00:00', '2017-12-21 11:40:13', null, '1', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT '表ID',
  `identity_type` tinyint(4) NOT NULL COMMENT '1:投资者; 2:创业者',
  `wechcat_open_id` varchar(255) NOT NULL COMMENT '微信open_id',
  `wechat_nick_name` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `wechat_head_url` varchar(255) DEFAULT NULL COMMENT '微信图像',
  `wechat_account` varchar(255) DEFAULT NULL COMMENT '微信号(完善信息)',
  `token` varchar(500) DEFAULT NULL COMMENT 'token',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名(完善信息)',
  `city` varchar(255) DEFAULT NULL COMMENT '城市(完善信息)',
  `mailbox` varchar(255) DEFAULT NULL COMMENT '邮箱(完善信息)',
  `enabled` tinyint(4) DEFAULT NULL COMMENT '是否激活 1:激活;2:未激活',
  `is_vip` tinyint(4) DEFAULT NULL COMMENT '是否会员 1:是; 2:不是',
  `phone` char(11) DEFAULT NULL COMMENT '电话(完善信息)',
  `company` varchar(255) DEFAULT NULL COMMENT '公司(完善信息)',
  `position` varchar(255) DEFAULT NULL COMMENT '职位(完善信息)',
  `cocupation_period` varchar(255) DEFAULT NULL COMMENT '职业从业年限(完善信息)',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址(完善信息)',
  `resident_address` varchar(255) DEFAULT NULL COMMENT '常驻地址详情(完善信息)',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `is_apply_vip` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投资者是否申请VIP: 1\\未申请; 2\\申请中 ;3\\已同意；4\\已拒绝 ',
  `apply_vip_date` datetime DEFAULT NULL COMMENT '会员申请时间',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在; 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  `remember_token` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投资者和创业者表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('user1c947bb0901f6900fb9aa5f9658a5afe5e27', '2', 'owZO84kIg0cNxYhgyX-wuDovrOqg', '0x776a', 'https://wx.qlogo.cn/mmopen/vi_32/WQF8vaZocNPzxhQuASA6CWOPqOqvEssdD9S0Ad0BP7ibFLDzrXS5lwKHRYnxj8A8JOsjicp0ick4nIZ992Jm2m0kw/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTYyMDE0MSwiZXhwIjoxNTIxODM2MTQxLCJuYmYiOjE1MjE2MjAxNDEsImp0aSI6IjkxOGE2YzdkYWRhMzkwNzIwNmIxZjc0ZTUzMTliOTk3Iiwic3ViIjoidXNlcjFjOTQ3YmIwOTAxZjY5MDBmYjlhYTVmOTY1OGE1YWZlNWUyNyJ9.rV4LQsNszNmY3QI0UzYCJAyeNavc23aQfQNL-e-1Jmw', null, null, null, '1', '2', null, null, null, null, null, null, '2018-03-21 16:15:41', '1', null, '2018-03-20 17:00:22', '2018-03-21 16:15:41', '1', '110\n', null, null, null, '$2y$10$O.Y/INkYix.kKb04MpmzKu5n.5tdB/vzOsXru855tDY5nhYzczEGi');
INSERT INTO `user` VALUES ('user226a9e5c729a077f2a744cd7225b14c42ab0', '2', 'owZO84p1zICH8BhAm-4DorLeXFsg', '音阙司听', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqDeE2iaa9vRGxsOYbcj3OJTHZJ2YeOUnF9SV8ibhnIc4qYG38fqDDICDHDm0YkEhHgN1VJjpicFABiag/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTcwMDcwOCwiZXhwIjoxNTIxOTE2NzA4LCJuYmYiOjE1MjE3MDA3MDgsImp0aSI6Ijk4Y2VhZDUyNDk4ZTRhZGI2OTY4YTBmYmQyMTg5ZGMxIiwic3ViIjoidXNlcjIyNmE5ZTVjNzI5YTA3N2YyYTc0NGNkNzIyNWIxNGM0MmFiMCJ9.7MGuNUkIyTgR9NkwkjSJMZhJ42tLTNOeN-Tv3hZknyU', null, null, null, '1', '2', null, null, null, null, null, null, '2018-03-22 14:38:28', '1', null, '2018-03-20 18:09:13', '2018-03-22 14:38:28', '1', null, null, null, null, '$2y$10$j2CDxMv1rjINk1QkKn6iAuhpRDaM9A/hJ1/JbtDGjgspwBr3xiPiy');
INSERT INTO `user` VALUES ('user35e4e0ee7402471bdd7baf570a2477389ba1', '1', 'owZO84stWL9hVMqAzansfrnjJcQQ', '福哥v587丶', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKREdPmD9ZLvhwaXNiapEkOHgxdbNgngyicG1mSiakxn8icOFjt7ibLYa6QjT6d9DsMDRia0yYiczPfT37EA/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTcwNDgxNywiZXhwIjoxNTIxOTIwODE3LCJuYmYiOjE1MjE3MDQ4MTcsImp0aSI6IjJmOGU5NWM5YjJjODYxZTc3YTZmNzVmY2UzYWE2NmE5Iiwic3ViIjoidXNlcjM1ZTRlMGVlNzQwMjQ3MWJkZDdiYWY1NzBhMjQ3NzM4OWJhMSJ9.6UstQGbr45jUEFiqqpqT9fYU3Wv2vHgQk4slgJas1C4', '副歌', '杭州', '9945@qq.com', '1', '1', '18000000000', '万福集团', '测试', null, '西湖', null, '2018-03-22 15:46:57', '3', '2018-03-22 10:55:11', '2018-03-21 17:34:04', '2018-03-22 15:46:57', '1', '很好的备注', null, null, null, '$2y$10$V6gg263TZbZUWYAp7KzWluUSmqIJjMRDD.jPqmzHh.V/6mU97F5Cy');
INSERT INTO `user` VALUES ('user52bf7444181c410f46142e91989cf469f27d', '1', 'owZO84sKU30KZFVPGWCeVwGsKqeM', '跃双', 'https://wx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM4lN3viaK8Mxz2hrOzyGGAS2NuicMO3woR8IWRBBS9kKpRB6zBpP8XSnF8hScE722YOy0ibpASF6cNsw/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTYwMTE4OCwiZXhwIjoxNTIxODE3MTg4LCJuYmYiOjE1MjE2MDExODgsImp0aSI6ImNjYjMzMjgwMGFhMmY1ZDAwMzlkMDVhNzMxNTRjZDZhIiwic3ViIjoidXNlcjUyYmY3NDQ0MTgxYzQxMGY0NjE0MmU5MTk4OWNmNDY5ZjI3ZCJ9.TLcroGP-5-Vrji1pTskJmLYzSlc8NJOtRQ9aSuDHeyA', null, null, null, '1', '2', null, null, null, null, null, null, '2018-03-21 10:59:48', '1', null, '2018-03-21 10:59:47', '2018-03-21 10:59:48', '1', null, null, null, null, '$2y$10$D4bYHFlFaT4BgnYXEnMzV.3aTMmW2s7a/VWyc2L5xFiGVwOWddLHy');
INSERT INTO `user` VALUES ('user5f85906f805c38a55385d128cffe72b0d303', '1', 'owZO84p1zICH8BhAm-4DorLeXFsg', '音阙司听', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqDeE2iaa9vRGxsOYbcj3OJTHZJ2YeOUnF9SV8ibhnIc4qYG38fqDDICDHDm0YkEhHgN1VJjpicFABiag/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTY5OTI0MSwiZXhwIjoxNTIxOTE1MjQxLCJuYmYiOjE1MjE2OTkyNDEsImp0aSI6ImRiOGFlY2YxNjBkNTViMjU0MTI5YzMyNzgzMmE5NjI2Iiwic3ViIjoidXNlcjVmODU5MDZmODA1YzM4YTU1Mzg1ZDEyOGNmZmU3MmIwZDMwMyJ9.dLfGL_kXx5XBfb58g8zs9xJokbxenGY44o9ek_HFQyA', '海峰', '杭州西湖', '999415@qq.com', '1', '1', '18000000000', '猿创', 'web', null, '西湖北站', null, '2018-03-22 14:14:01', '3', '2018-03-20 19:59:59', '2018-03-20 18:08:45', '2018-03-22 14:14:01', '1', '美尚', null, null, null, '$2y$10$A2z.va2oumRqhf75S48b8.RdVvG6LBVHjmXRa47jrVSAK/tI4mfAu');
INSERT INTO `user` VALUES ('user65e1dd9216593165b9175e21478fac80ef78', '1', 'owZO84vGJXNhgC2klMH-aTWkYPN0', '三千里外＆暖', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJvxTghIxGiaZ0uV6bpgmXyIC4eXlWqicaPrjdjT4F8OkGlFHtDWZRskCtlpC0UcENIl23SGt3CAjxg/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTcwNDY4MCwiZXhwIjoxNTIxOTIwNjgwLCJuYmYiOjE1MjE3MDQ2ODAsImp0aSI6ImEyM2Y0YTQwMWJhOTkwNzQyNTNmZWZlYzQwYjZlNmY2Iiwic3ViIjoidXNlcjY1ZTFkZDkyMTY1OTMxNjViOTE3NWUyMTQ3OGZhYzgwZWY3OCJ9.PureT8HHHcgClDMOyQbyeduERVLsxKYaIb6LY-Tc9iE', null, null, null, '1', '2', null, null, null, null, null, null, '2018-03-22 15:44:40', '1', null, '2018-03-20 16:52:08', '2018-03-22 15:44:40', '1', null, null, null, null, '$2y$10$RrlMAB2IGiSYQMm3HBwo1.b7YHAv5tK2iIP8kUwWFzLXkO44UHHRO');
INSERT INTO `user` VALUES ('user6f2e7e3e8c6dc8059585f6e8e64149a7e80a', '2', 'owZO84stWL9hVMqAzansfrnjJcQQ', '福哥v587丶', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKREdPmD9ZLvhwaXNiapEkOHgxdbNgngyicG1mSiakxn8icOFjt7ibLYa6QjT6d9DsMDRia0yYiczPfT37EA/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTY4NjcwNywiZXhwIjoxNTIxOTAyNzA3LCJuYmYiOjE1MjE2ODY3MDcsImp0aSI6ImRkMGJhN2MyZTRhMzZlODE4NmQwNjAzODNhNGUzYmJlIiwic3ViIjoidXNlcjZmMmU3ZTNlOGM2ZGM4MDU5NTg1ZjZlOGU2NDE0OWE3ZTgwYSJ9.hE3IAE6fOy3PyLKg5KqVNJ_k_TfqeJg86FsAi7TDZRE', null, null, null, '1', '2', null, null, null, null, null, null, '2018-03-22 10:45:07', '1', null, '2018-03-20 17:12:32', '2018-03-22 10:45:07', '1', null, null, null, null, '$2y$10$XdYgt2LXDgOxgGATJofgnudpF36cw6bfmYkWJtkJ457UtsrHy8Jce');
INSERT INTO `user` VALUES ('user9bee261e28194286f12a8bd2069ce68814ed', '2', 'owZO84qh1j2CWfelbnOyX3IcZzzs', '其', 'https://wx.qlogo.cn/mmopen/vi_32/9vskr12GhfdODa906RkahDKFHFN1oibJCYnfbqfzyTkaaD6kTic8wJcZwmgpzbqBpREk6xC82MoUzaPAY6o3bRDg/0', '18618', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTcwMzYxMywiZXhwIjoxNTIxOTE5NjEzLCJuYmYiOjE1MjE3MDM2MTMsImp0aSI6IjZjNjhkYWU1NjE2OWI3NzJjZjUxYTI0ZGNkNjgwZDY3Iiwic3ViIjoidXNlcjliZWUyNjFlMjgxOTQyODZmMTJhOGJkMjA2OWNlNjg4MTRlZCJ9.qbNDeBkfcgoxc2I80tisJLFbNjwKVPMaV3MFyZoNR9E', '郑学', '浙江省,杭州市,西湖区', '9945@qq.com', '1', '2', '18000000000', '猿创', 'web', '1~3年', '翠苑', '西湖', '2018-03-22 15:26:53', '1', null, '2018-03-20 16:45:21', '2018-03-22 15:26:53', '1', null, null, null, null, '$2y$10$ww9XoyN.AUXTaX6nsQQu7eAa1S1KAz4OoIrwAVCGYNK5XmHfj87eO');
INSERT INTO `user` VALUES ('usera585901973c9b77905754d77e493e4b2539d', '1', 'owZO84kIg0cNxYhgyX-wuDovrOqg', '0x776a', 'https://wx.qlogo.cn/mmopen/vi_32/WQF8vaZocNPzxhQuASA6CWOPqOqvEssdD9S0Ad0BP7ibFLDzrXS5lwKHRYnxj8A8JOsjicp0ick4nIZ992Jm2m0kw/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTYyMzk4MiwiZXhwIjoxNTIxODM5OTgyLCJuYmYiOjE1MjE2MjM5ODIsImp0aSI6IjljM2ZlOTMxZTgyNDRkOTAzNzJhMTZmOTI3Y2FkZjdlIiwic3ViIjoidXNlcmE1ODU5MDE5NzNjOWI3NzkwNTc1NGQ3N2U0OTNlNGIyNTM5ZCJ9.scAuQkFZj2fLvqOYERWjiHnjXQg794SozuWqF8VdFP0', null, null, null, '1', '2', null, null, null, null, null, null, '2018-03-21 17:19:42', '1', null, '2018-03-20 16:53:13', '2018-03-21 17:19:42', '1', null, null, null, null, '$2y$10$bRXOFkg37PjKAT8agVUziu3Zy6ABwJSVApA6bJLZp4uoAMjK3YMui');
INSERT INTO `user` VALUES ('useracebc8302a34e2e63e22ebb2f2d8b8d3f3e4', '2', 'owZO84sKU30KZFVPGWCeVwGsKqeM', '跃双', 'https://wx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM4lN3viaK8Mxz2hrOzyGGAS2NuicMO3woR8IWRBBS9kKpRB6zBpP8XSnF8hScE722YOy0ibpASF6cNsw/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTU5OTg2NiwiZXhwIjoxNTIxODE1ODY2LCJuYmYiOjE1MjE1OTk4NjYsImp0aSI6IjRhZDFiYjEwZTcyMjBjNGY1OTczZWIwOWIxZDkwN2QwIiwic3ViIjoidXNlcmFjZWJjODMwMmEzNGUyZTYzZTIyZWJiMmYyZDhiOGQzZjNlNCJ9.99lRTGFi5n2zrczDeS0QVjTJjtmcAtLzealTUCCZ0G0', null, null, null, '1', '2', null, null, null, null, null, null, '2018-03-21 10:37:46', '1', null, '2018-03-21 10:35:48', '2018-03-21 10:37:46', '1', null, null, null, null, '$2y$10$0nYwbUlTWaVNkM19J1YQdeA/kQM76QIW8LoilwQ8LX.chaylo93LG');
INSERT INTO `user` VALUES ('userb44ae64b48dcb460494223d463a3a0baa8bd', '1', 'owZO84qh1j2CWfelbnOyX3IcZzzs', '其', 'https://wx.qlogo.cn/mmopen/vi_32/9vskr12GhfdODa906RkahDKFHFN1oibJCYnfbqfzyTkaaD6kTic8wJcZwmgpzbqBpREk6xC82MoUzaPAY6o3bRDg/0', '', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTcwMzYyNiwiZXhwIjoxNTIxOTE5NjI2LCJuYmYiOjE1MjE3MDM2MjYsImp0aSI6Ijk5NmMxMTY5OTdhNzA3ODgxOTZkYzdiZGEzYmFjNDdjIiwic3ViIjoidXNlcmI0NGFlNjRiNDhkY2I0NjA0OTQyMjNkNDYzYTNhMGJhYThiZCJ9.ezf87SUf4u72sR1UJYryFNfMd3EgDm5-nx1NSIJzGB4', '这个', '浙江省,杭州市,西湖区', '9945@qq.com', '1', '1', '18000000000', '猿创', 'web', '1~3年', '西湖翠苑', '', '2018-03-22 15:27:06', '3', '2018-03-20 19:13:39', '2018-03-20 19:03:53', '2018-03-22 15:27:06', '1', '好好赚钱', null, null, null, '$2y$10$2IAV/cbm2XN2jpt/mkjULeLtEe/3PIEnjxN06T8plks0noyPx3TmG');
INSERT INTO `user` VALUES ('userb77a2b6c24e9b24e312a70920e14cac15d03', '2', 'owZO84vGJXNhgC2klMH-aTWkYPN0', '三千里外＆暖', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJvxTghIxGiaZ0uV6bpgmXyIC4eXlWqicaPrjdjT4F8OkGlFHtDWZRskCtlpC0UcENIl23SGt3CAjxg/0', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL3BlcnNvbi9sb2dpbiIsImlhdCI6MTUyMTcwNDgzMiwiZXhwIjoxNTIxOTIwODMyLCJuYmYiOjE1MjE3MDQ4MzIsImp0aSI6IjQ1OTI4Mzk5NmZmYzgzZmU4MDI1MTBiZDAwZmNhZTRkIiwic3ViIjoidXNlcmI3N2EyYjZjMjRlOWIyNGUzMTJhNzA5MjBlMTRjYWMxNWQwMyJ9.FEAcunOhIulrE-XIQVVVfs22bzXjfTB_ZEhKALN2MjY', null, null, null, '1', '2', null, null, null, null, null, null, '2018-03-22 15:47:12', '1', null, '2018-03-20 17:09:04', '2018-03-22 15:47:12', '1', null, null, null, null, '$2y$10$jc.2r/xrcf5X4g9x3FYUaO2ud2ewA/OLWZsIS7GdT/K/WaAuyat1S');

-- ----------------------------
-- Table structure for `user_card`
-- ----------------------------
DROP TABLE IF EXISTS `user_card`;
CREATE TABLE `user_card` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `company` varchar(255) DEFAULT NULL COMMENT '公司',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `image_url` varchar(255) NOT NULL COMMENT '图像url',
  `desc` text COMMENT '简介',
  `user_id` varchar(255) DEFAULT NULL COMMENT '关联user表id',
  `financing_phase` varchar(255) DEFAULT NULL COMMENT '融资阶段',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在; 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人名片';

-- ----------------------------
-- Records of user_card
-- ----------------------------
INSERT INTO `user_card` VALUES ('usercard5afca6794948e4c27b4932f42bea04aad63f', 'asdfa', null, null, 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F093402wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.d51c8cb31decc94221561649beaff983.png', 'asdf', 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a', null, '2018-03-22 09:34:06', null, '2', null, 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a', null);
INSERT INTO `user_card` VALUES ('usercard5f6a9f024eed4478124066f46de55e00ca55', 'asdfaasdf', null, null, 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F093503wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.2ea0705e2bca5d6badda8e7117a0586c.png', '11111111111asddddsdfasfasdfasdfasdfasdfasdfasdfasfasfasfasfasfasdfasdfasdfasdfasfdadsfasdfasdfasdfasdfadsfasdfafadsfasdfasfasdasdfasdfasdfas', 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a', null, '2018-03-22 09:34:44', '2018-03-22 09:37:53', '2', null, 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a', 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a');
INSERT INTO `user_card` VALUES ('usercardbc2309ad829478547e8123386cbb138e671e', 'asdfasdfafasd', null, null, 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F095018wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.0bc1b2bac2238fbfbde836fd439726b1.png', 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadsfasfasdfasdffsafsdfasdfasdfsdfasdfasdfasfasfasfasdfasdfasfadsfasfasfadsfasfasdfasdfadsfasfasfasfasdfasfasdfasdfadsfasdfasdfadsfasfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadsfasfasfasdfasdfasdfasdfasdfasdfasdfasdfasdfadsfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfqawerqweqwefasfasdfasdfasdfasdfas', 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a', null, '2018-03-22 09:41:46', '2018-03-22 09:50:19', '2', null, 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a', 'user6f2e7e3e8c6dc8059585f6e8e64149a7e80a');

-- ----------------------------
-- Table structure for `user_vip`
-- ----------------------------
DROP TABLE IF EXISTS `user_vip`;
CREATE TABLE `user_vip` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '关联user表的id',
  `experience` text COMMENT '履历(工作经历) JSON格式',
  `education_back` text COMMENT '教育背景,JSON格式',
  `fund_scale` varchar(255) DEFAULT NULL COMMENT '管理基金规模',
  `has_resource` varchar(255) DEFAULT NULL COMMENT '已有资源背景(如产业资源，政府资源)',
  `lead_vest_project` varchar(255) DEFAULT NULL COMMENT '曾主导投资项目',
  `image_url` varchar(255) DEFAULT NULL COMMENT '正装照',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在; 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '人物简介',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者(审核投资者为会员的后台管理人员ID)',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '当时审核投资者为会员的后台管理人员姓名',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者(更新会员资料的后台管理人员ID)',
  `update_user_name` varchar(255) DEFAULT NULL COMMENT '当时更新会员资料的后台管理人员的姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of user_vip
-- ----------------------------

-- ----------------------------
-- Table structure for `yiji_account`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_account`;
CREATE TABLE `yiji_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `account` varchar(50) NOT NULL DEFAULT '' COMMENT '登录账号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码',
  `type` tinyint(1) NOT NULL DEFAULT '9' COMMENT '账户类型：9/后台用户 ',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `login_time` int(13) DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(25) DEFAULT NULL COMMENT '最近登录ip',
  `token` varchar(500) DEFAULT NULL COMMENT 'token',
  `create_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_name` int(5) unsigned DEFAULT NULL COMMENT '创建人',
  `update_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_name` int(5) unsigned DEFAULT NULL COMMENT '修改人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0/删除，1/正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登录账号';

-- ----------------------------
-- Records of yiji_account
-- ----------------------------
INSERT INTO `yiji_account` VALUES ('39', 'wangjian', '$2y$10$ciW.H5flv0c908lxWxVG8uMwVcZVyvv0K.4W.uSzjYFv5htWK50j6', '9', '22', '217', '1521706743', '120.26.120.234', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vdC5hcGkuZWppdmMueWNoY2FwaXRhbC5jb20vYXBpL0FkbWluL2xvZ2luIiwiaWF0IjoxNTIxNzA2NzQzLCJleHAiOjE1MjE5MjI3NDMsIm5iZiI6MTUyMTcwNjc0MywianRpIjoiNzY1ZDM4OGI5Zjc3NzIwMzM2NmM4N2NlYTE2YTFjMTciLCJzdWIiOjM5fQ.jYZvW9vnpytpf3TW-zR43gzB672tHoyL-wLynErNiwc', '1515656402', '0', '1521706743', '0', null, '1');

-- ----------------------------
-- Table structure for `yiji_auth_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_auth_permissions`;
CREATE TABLE `yiji_auth_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_unique` (`description`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='权限';

-- ----------------------------
-- Records of yiji_auth_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `yiji_auth_permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_auth_permission_role`;
CREATE TABLE `yiji_auth_permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `permission_role_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `yiji_auth_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `yiji_auth_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='权限角色关联';

-- ----------------------------
-- Records of yiji_auth_permission_role
-- ----------------------------

-- ----------------------------
-- Table structure for `yiji_auth_roles`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_auth_roles`;
CREATE TABLE `yiji_auth_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_unique` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色';

-- ----------------------------
-- Records of yiji_auth_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `yiji_auth_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_auth_role_user`;
CREATE TABLE `yiji_auth_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `role_user_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `yiji_auth_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `yiji_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关联';

-- ----------------------------
-- Records of yiji_auth_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `yiji_business_file`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_business_file`;
CREATE TABLE `yiji_business_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(11) unsigned NOT NULL COMMENT '附件id',
  `model` int(5) unsigned DEFAULT NULL COMMENT '模块：1/项目收集 ; 2/活动(活动展示) ; 3/自定义名片 4/广告',
  `model_id` varchar(255) DEFAULT NULL COMMENT '模块id',
  `model_type` tinyint(5) DEFAULT NULL COMMENT '业务附件的类别，备用',
  `url` varchar(2550) DEFAULT NULL COMMENT '附件url',
  `create_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_name` int(5) unsigned DEFAULT NULL COMMENT '创建人',
  `update_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_name` int(5) unsigned DEFAULT NULL COMMENT '修改人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0/删除，1/正常',
  PRIMARY KEY (`id`,`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务附件';

-- ----------------------------
-- Records of yiji_business_file
-- ----------------------------
INSERT INTO `yiji_business_file` VALUES ('81', '888888', '1', null, null, 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F103902tmp_a6210c8c4b4e1edb3a9fc53e36e9076e1829c191a1a99b66.jpg', '1521686419', '0', '1521686419', '0', null, '1');

-- ----------------------------
-- Table structure for `yiji_file`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_file`;
CREATE TABLE `yiji_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(100) DEFAULT NULL COMMENT '文件描述',
  `domain` varchar(255) DEFAULT NULL COMMENT '域名',
  `path` varchar(2550) DEFAULT NULL COMMENT '路径',
  `size` varchar(80) DEFAULT NULL COMMENT '文件大小',
  `suffix` varchar(80) DEFAULT NULL COMMENT '文件后缀',
  `create_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_name` int(5) unsigned DEFAULT NULL COMMENT '创建人',
  `update_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_name` int(5) unsigned DEFAULT NULL COMMENT '修改人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0/删除，1/正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=632 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件';

-- ----------------------------
-- Records of yiji_file
-- ----------------------------
INSERT INTO `yiji_file` VALUES ('526', 'wechat_miniprogram_qrcode1883251d3892a3f2f23009d301f6bc0e662f.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode1883251d3892a3f2f23009d301f6bc0e662f.jpg', '110478', 'jpg', '1521536896', '0', '1521536896', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('527', 'wechat_miniprogram_qrcode18dd8e215fd60554655c9445d558e9e06390.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode18dd8e215fd60554655c9445d558e9e06390.jpg', '98560', 'jpg', '1521538601', '0', '1521538601', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('528', 'wechat_miniprogram_qrcodede5e5ccf51f2856152543125a508ec758d3a.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodede5e5ccf51f2856152543125a508ec758d3a.jpg', '110463', 'jpg', '1521539622', '0', '1521539622', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('529', 'wechat_miniprogram_qrcode63a632731074315721123c51fcf478f89ddd.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode63a632731074315721123c51fcf478f89ddd.jpg', '110460', 'jpg', '1521539645', '0', '1521539645', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('530', 'wechat_miniprogram_qrcodebe7058a623fcd26faf26f06240590b0bc137.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodebe7058a623fcd26faf26f06240590b0bc137.jpg', '110490', 'jpg', '1521594963', '0', '1521594963', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('531', 'wechat_miniprogram_qrcoded934ffa1722497f70773b1979b3aba22a944.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcoded934ffa1722497f70773b1979b3aba22a944.jpg', '110459', 'jpg', '1521595543', '0', '1521595543', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('532', 'wechat_miniprogram_qrcodec58778c05b68c524625c2ab57a22737f257b.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodec58778c05b68c524625c2ab57a22737f257b.jpg', '111063', 'jpg', '1521596437', '0', '1521596437', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('533', 'wechat_miniprogram_qrcodef2440f2947d214370345d7c4ff595efa43f4.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodef2440f2947d214370345d7c4ff595efa43f4.jpg', '111038', 'jpg', '1521598737', '0', '1521598737', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('534', 'wechat_miniprogram_qrcode8d9f479033ca0373af3ae613f5b96347f37d.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode8d9f479033ca0373af3ae613f5b96347f37d.jpg', '111017', 'jpg', '1521598745', '0', '1521598745', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('535', 'wechat_miniprogram_qrcode09674ec34c2ba410644cda34ca3cd39d7f6b.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode09674ec34c2ba410644cda34ca3cd39d7f6b.jpg', '110998', 'jpg', '1521598750', '0', '1521598750', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('536', 'wechat_miniprogram_qrcodef82de7217d1fc76fae7054f7068048ce678c.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodef82de7217d1fc76fae7054f7068048ce678c.jpg', '111042', 'jpg', '1521598753', '0', '1521598753', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('537', 'wechat_miniprogram_qrcodebd6ee491246b62af2a24d23207ca428fe10e.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodebd6ee491246b62af2a24d23207ca428fe10e.jpg', '111015', 'jpg', '1521598755', '0', '1521598755', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('538', 'wechat_miniprogram_qrcodeed841dcc74d8f7611476ffd7489f9af9585d.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodeed841dcc74d8f7611476ffd7489f9af9585d.jpg', '111066', 'jpg', '1521598776', '0', '1521598776', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('539', 'wechat_miniprogram_qrcode921827eb48f28419e342e64406983cd966c9.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode921827eb48f28419e342e64406983cd966c9.jpg', '111042', 'jpg', '1521598839', '0', '1521598839', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('540', 'wechat_miniprogram_qrcode904848857661d7a860759b07371e6ba4eb43.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode904848857661d7a860759b07371e6ba4eb43.jpg', '111042', 'jpg', '1521598841', '0', '1521598841', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('541', 'wechat_miniprogram_qrcodec51fdffe603206ae43679da66ffc1c56fc5c.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodec51fdffe603206ae43679da66ffc1c56fc5c.jpg', '111042', 'jpg', '1521598852', '0', '1521598852', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('542', 'wechat_miniprogram_qrcodea24396ad22ea12b1682fd052df1ddf6fafc2.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodea24396ad22ea12b1682fd052df1ddf6fafc2.jpg', '111046', 'jpg', '1521599024', '0', '1521599024', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('543', 'wechat_miniprogram_qrcode38f119b315d741664711637155a30332d07e.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode38f119b315d741664711637155a30332d07e.jpg', '111022', 'jpg', '1521599027', '0', '1521599027', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('544', 'wechat_miniprogram_qrcodeb4a52b9b3937a387a3328e13e6bff62cb72b.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodeb4a52b9b3937a387a3328e13e6bff62cb72b.jpg', '111022', 'jpg', '1521599031', '0', '1521599031', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('545', 'wechat_miniprogram_qrcode66cc4654939a898431933cb9edef23a06ecf.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode66cc4654939a898431933cb9edef23a06ecf.jpg', '111011', 'jpg', '1521599329', '0', '1521599329', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('546', 'wechat_miniprogram_qrcodefd3a65172abe42ffd02c5b32305ca84a9f91', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodefd3a65172abe42ffd02c5b32305ca84a9f91', '109', 'jpg', '1521601217', '0', '1521601217', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('547', 'wechat_miniprogram_qrcodee34612e99cf409e82d9dc769750b1629b579', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodee34612e99cf409e82d9dc769750b1629b579', '109', 'jpg', '1521601234', '0', '1521601234', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('548', '1.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F21%2F1429131.jpg', '472105', 'jpeg', '1521613754', '0', '1521613754', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('549', 'wechat_miniprogram_qrcode301be1fd16d5814429142461a581337f6e0c.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode301be1fd16d5814429142461a581337f6e0c.jpg', '111920', 'jpg', '1521619232', '0', '1521619232', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('550', 'wechat_miniprogram_qrcode49ebd2c463cc2634096d0366607a547ab65b.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode49ebd2c463cc2634096d0366607a547ab65b.jpg', '108422', 'jpg', '1521619621', '0', '1521619621', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('551', 'wechat_miniprogram_qrcodef5d223079e5bf9269c9940c9d317e8156cf4.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodef5d223079e5bf9269c9940c9d317e8156cf4.jpg', '111903', 'jpg', '1521619734', '0', '1521619734', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('552', 'wechat_miniprogram_qrcode5335ca8270de7780457abaa7588f300d9f92.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode5335ca8270de7780457abaa7588f300d9f92.jpg', '108435', 'jpg', '1521619736', '0', '1521619736', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('553', 'wechat_miniprogram_qrcoded9474f295df1051f495618c5d6fe4297954e.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcoded9474f295df1051f495618c5d6fe4297954e.jpg', '108435', 'jpg', '1521619867', '0', '1521619867', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('554', 'wechat_miniprogram_qrcodecb6634224a3a8428844219a43a34ca4fc166.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodecb6634224a3a8428844219a43a34ca4fc166.jpg', '111019', 'jpg', '1521620201', '0', '1521620201', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('555', 'wechat_miniprogram_qrcode89819887678346422465ade668627225e64a.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode89819887678346422465ade668627225e64a.jpg', '111059', 'jpg', '1521620204', '0', '1521620204', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('556', 'wechat_miniprogram_qrcode0797e446286822a440226412555767f13a84.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode0797e446286822a440226412555767f13a84.jpg', '111019', 'jpg', '1521620208', '0', '1521620208', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('557', 'wechat_miniprogram_qrcode0f3618877aa837aae97a54770a78866e5216.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode0f3618877aa837aae97a54770a78866e5216.jpg', '111044', 'jpg', '1521620213', '0', '1521620213', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('558', 'wechat_miniprogram_qrcodec2d877f128f8023f992003b22784ed1a77ff.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodec2d877f128f8023f992003b22784ed1a77ff.jpg', '111035', 'jpg', '1521620215', '0', '1521620215', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('559', 'wechat_miniprogram_qrcodec2f181259e7de959769b1459c586094dcc73.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodec2f181259e7de959769b1459c586094dcc73.jpg', '111021', 'jpg', '1521620220', '0', '1521620220', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('560', 'wechat_miniprogram_qrcodec45e002e54e76583b55d7ce52bf5c9d65af2.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodec45e002e54e76583b55d7ce52bf5c9d65af2.jpg', '111036', 'jpg', '1521620224', '0', '1521620224', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('561', 'wechat_miniprogram_qrcodedf7703ce9df119fff29b1899479e77f2500a.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodedf7703ce9df119fff29b1899479e77f2500a.jpg', '111034', 'jpg', '1521620232', '0', '1521620232', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('562', 'wechat_miniprogram_qrcodee5b64f8e45e2e48941452424104e4e7c6a86.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodee5b64f8e45e2e48941452424104e4e7c6a86.jpg', '111014', 'jpg', '1521623725', '0', '1521623725', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('563', 'wechat_miniprogram_qrcode9256874b398a63be6132bba3c75570d8e616.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode9256874b398a63be6132bba3c75570d8e616.jpg', '111030', 'jpg', '1521623749', '0', '1521623749', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('564', 'wechat_miniprogram_qrcodee2ada63897869928bc92ef097e30672f7c9c.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodee2ada63897869928bc92ef097e30672f7c9c.jpg', '110988', 'jpg', '1521623889', '0', '1521623889', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('565', 'wechat_miniprogram_qrcode7baa634c36aa235c6333a9538fd2969e1cd2.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode7baa634c36aa235c6333a9538fd2969e1cd2.jpg', '111033', 'jpg', '1521623985', '0', '1521623985', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('566', 'wechat_miniprogram_qrcode19ee988c605c66a3a56f7886e1e0c1709895.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode19ee988c605c66a3a56f7886e1e0c1709895.jpg', '110829', 'jpg', '1521625785', '0', '1521625785', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('567', 'wechat_miniprogram_qrcodeb5965f1d5ccc65cf0d5cfc05e51c9949f34d.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodeb5965f1d5ccc65cf0d5cfc05e51c9949f34d.jpg', '109188', 'jpg', '1521625806', '0', '1521625806', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('568', 'wechat_miniprogram_qrcodea79507e91760a1a3c91e91613f592c71adf3.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodea79507e91760a1a3c91e91613f592c71adf3.jpg', '110832', 'jpg', '1521625913', '0', '1521625913', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('569', 'wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.19701ec42e152ecb45f759a2dd93c370.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F092935wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.19701ec42e152ecb45f759a2dd93c370.png', '71236', 'png', '1521682175', '0', '1521682175', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('570', 'wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.d51c8cb31decc94221561649beaff983.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F093402wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.d51c8cb31decc94221561649beaff983.png', '5169', 'png', '1521682442', '0', '1521682442', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('571', 'wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.d51c8cb31decc94221561649beaff983.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F093441wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.d51c8cb31decc94221561649beaff983.png', '5169', 'png', '1521682481', '0', '1521682481', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('572', 'wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.2ea0705e2bca5d6badda8e7117a0586c.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F093503wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.2ea0705e2bca5d6badda8e7117a0586c.png', '2013', 'png', '1521682504', '0', '1521682504', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('573', 'wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.d51c8cb31decc94221561649beaff983.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F094145wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.d51c8cb31decc94221561649beaff983.png', '5169', 'png', '1521682905', '0', '1521682905', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('574', 'wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.0bc1b2bac2238fbfbde836fd439726b1.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F095018wxfd857d22215ab3ec.o6zAJsySRK4hkU-N28VNjSIzZWJQ.0bc1b2bac2238fbfbde836fd439726b1.png', '3997', 'png', '1521683418', '0', '1521683418', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('575', 'tmp_12b1a138b1e847d6929cc351d1fba6e9acd9a5bd1e666c01.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F103432tmp_12b1a138b1e847d6929cc351d1fba6e9acd9a5bd1e666c01.jpg', '70727', null, '1521686072', '0', '1521686072', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('576', 'tmp_a6210c8c4b4e1edb3a9fc53e36e9076e1829c191a1a99b66.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F103902tmp_a6210c8c4b4e1edb3a9fc53e36e9076e1829c191a1a99b66.jpg', '70727', null, '1521686342', '0', '1521686342', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('577', '1.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F1054011.jpg', '472105', 'jpeg', '1521687241', '0', '1521687241', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('578', 'mark_loved.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F110106mark_loved.png', '3997', 'png', '1521687666', '0', '1521687666', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('579', '微信图片_20180119153557.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F111416%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20180119153557.png', '2013', 'png', '1521688456', '0', '1521688456', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('580', 'mark_lod.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F111719mark_lod.png', '4809', 'png', '1521688639', '0', '1521688639', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('581', 'mark_lod.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F111927mark_lod.png', '4809', 'png', '1521688767', '0', '1521688767', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('582', 'wechat_miniprogram_qrcodec4fc92593fe443c95e3f12036436ac031e65.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodec4fc92593fe443c95e3f12036436ac031e65.jpg', '110818', 'jpg', '1521690733', '0', '1521690733', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('583', 'wechat_miniprogram_qrcode175d01327e9db72aea7cd8e725b0c1477745.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode175d01327e9db72aea7cd8e725b0c1477745.jpg', '110791', 'jpg', '1521690733', '0', '1521690733', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('584', 'wechat_miniprogram_qrcode61afa36c7580f79d457df5f7584444bc5d84.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode61afa36c7580f79d457df5f7584444bc5d84.jpg', '110788', 'jpg', '1521690735', '0', '1521690735', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('585', 'wechat_miniprogram_qrcodea27672c5108b01411916dfc1c8044ecd5e7d.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodea27672c5108b01411916dfc1c8044ecd5e7d.jpg', '110777', 'jpg', '1521690739', '0', '1521690739', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('586', 'wechat_miniprogram_qrcoded079293d2d1f720bb5261002e74239cf1b85.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcoded079293d2d1f720bb5261002e74239cf1b85.jpg', '110824', 'jpg', '1521690766', '0', '1521690766', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('587', 'wechat_miniprogram_qrcodefc8242397678676ad477ea77385d24931a2a.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodefc8242397678676ad477ea77385d24931a2a.jpg', '110812', 'jpg', '1521690773', '0', '1521690773', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('588', 'wechat_miniprogram_qrcoded72ba5dc6a616690266bf37646c8284a705b.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcoded72ba5dc6a616690266bf37646c8284a705b.jpg', '110777', 'jpg', '1521690773', '0', '1521690773', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('589', 'wechat_miniprogram_qrcode52f429382147a2c1e22565021675753ff773.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode52f429382147a2c1e22565021675753ff773.jpg', '110783', 'jpg', '1521690794', '0', '1521690794', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('590', 'wechat_miniprogram_qrcode30a2c6841c4ec12e2a134c41a7cdc16b563b', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode30a2c6841c4ec12e2a134c41a7cdc16b563b', '109', 'jpg', '1521698438', '0', '1521698438', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('591', 'wechat_miniprogram_qrcode0ef0ef9f7b3dd7776b789717e8e373426a77', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode0ef0ef9f7b3dd7776b789717e8e373426a77', '109', 'jpg', '1521698450', '0', '1521698450', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('592', 'wechat_miniprogram_qrcode5e8cee98195da1afcd11d1f1bdbfbca2694f', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode5e8cee98195da1afcd11d1f1bdbfbca2694f', '109', 'jpg', '1521698455', '0', '1521698455', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('593', 'wechat_miniprogram_qrcode90ee5da229b92234bd219cc2337f0011405b', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode90ee5da229b92234bd219cc2337f0011405b', '109', 'jpg', '1521698458', '0', '1521698458', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('594', 'wechat_miniprogram_qrcode8dbcf1531837e1c4e31027f1d755fdae66c6', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode8dbcf1531837e1c4e31027f1d755fdae66c6', '109', 'jpg', '1521698476', '0', '1521698476', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('595', 'wechat_miniprogram_qrcodeab1c7499424b54b01142ee54c0e1815d0e33', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodeab1c7499424b54b01142ee54c0e1815d0e33', '109', 'jpg', '1521698480', '0', '1521698480', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('596', 'wechat_miniprogram_qrcodebbc79d2097f269eaca9309791f1bb59aeb54', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodebbc79d2097f269eaca9309791f1bb59aeb54', '109', 'jpg', '1521698487', '0', '1521698487', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('597', 'wechat_miniprogram_qrcodeb4b3ae31304713f4103a86b30481fc50e5ab', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodeb4b3ae31304713f4103a86b30481fc50e5ab', '109', 'jpg', '1521698491', '0', '1521698491', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('598', 'wechat_miniprogram_qrcodef23510ca9edf998676946979344a2935af55', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodef23510ca9edf998676946979344a2935af55', '109', 'jpg', '1521698496', '0', '1521698496', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('599', 'wechat_miniprogram_qrcodeac8d50061d7e914c4e16f351a5aed283449c', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodeac8d50061d7e914c4e16f351a5aed283449c', '109', 'jpg', '1521698501', '0', '1521698501', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('600', 'wechat_miniprogram_qrcode546379da6c05a6c33d69c8265bbce3194e53', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode546379da6c05a6c33d69c8265bbce3194e53', '109', 'jpg', '1521698507', '0', '1521698507', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('601', 'wechat_miniprogram_qrcode5764c2ff8ca4b874f88b43c818b8cca7f121', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode5764c2ff8ca4b874f88b43c818b8cca7f121', '109', 'jpg', '1521698512', '0', '1521698512', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('602', 'wechat_miniprogram_qrcode27ae637d750f07b5747b4ff72fa4c84110d6', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode27ae637d750f07b5747b4ff72fa4c84110d6', '104', 'jpg', '1521698518', '0', '1521698518', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('603', 'wechat_miniprogram_qrcode67a1889b3967e31ecf3b5023401f337d493f', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode67a1889b3967e31ecf3b5023401f337d493f', '109', 'jpg', '1521698522', '0', '1521698522', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('604', 'wechat_miniprogram_qrcode808c3d2e8999b8fe6b821088a85b19135340', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode808c3d2e8999b8fe6b821088a85b19135340', '109', 'jpg', '1521698525', '0', '1521698525', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('605', 'wechat_miniprogram_qrcode090e8170485364a3fd4ff824aaf159996fb4', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode090e8170485364a3fd4ff824aaf159996fb4', '109', 'jpg', '1521698528', '0', '1521698528', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('606', 'wechat_miniprogram_qrcodee0fa201869a00630eb6943f6cd30b19a821b', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodee0fa201869a00630eb6943f6cd30b19a821b', '109', 'jpg', '1521698530', '0', '1521698530', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('607', 'wechat_miniprogram_qrcode5ae77dd35622950d8959bc55eb0d46f82933', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode5ae77dd35622950d8959bc55eb0d46f82933', '109', 'jpg', '1521698540', '0', '1521698540', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('608', 'wechat_miniprogram_qrcodefa6bce5386c56840b68b6448a354c5fcd881', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodefa6bce5386c56840b68b6448a354c5fcd881', '109', 'jpg', '1521698544', '0', '1521698544', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('609', 'wechat_miniprogram_qrcode9fd21d023d5f43a6e4304f7349288196feec', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode9fd21d023d5f43a6e4304f7349288196feec', '109', 'jpg', '1521698549', '0', '1521698549', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('610', 'wechat_miniprogram_qrcode7af6d8157170672f04774d672a14bc4fd203', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode7af6d8157170672f04774d672a14bc4fd203', '105', 'jpg', '1521698556', '0', '1521698556', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('611', 'wechat_miniprogram_qrcode2d8e3b677704d71b2f794c772b9254e74a3b', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode2d8e3b677704d71b2f794c772b9254e74a3b', '109', 'jpg', '1521698573', '0', '1521698573', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('612', 'wechat_miniprogram_qrcode7ebb8afb198411eaba1cc0d13a6b17c21070', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode7ebb8afb198411eaba1cc0d13a6b17c21070', '107', 'jpg', '1521698581', '0', '1521698581', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('613', 'wechat_miniprogram_qrcodea35fe7171101319887120ea154ca1393f0a0', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodea35fe7171101319887120ea154ca1393f0a0', '109', 'jpg', '1521698584', '0', '1521698584', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('614', 'wechat_miniprogram_qrcode98c518c91d7d7152371b4d41df4e33a71417', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode98c518c91d7d7152371b4d41df4e33a71417', '109', 'jpg', '1521698589', '0', '1521698589', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('615', 'wechat_miniprogram_qrcode3032d80065393673ff61d20625c72790c49c', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode3032d80065393673ff61d20625c72790c49c', '109', 'jpg', '1521698589', '0', '1521698589', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('616', 'wechat_miniprogram_qrcode55fb2232122cd161dc1cfed1dccc94ccf664', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode55fb2232122cd161dc1cfed1dccc94ccf664', '109', 'jpg', '1521698604', '0', '1521698604', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('617', 'wechat_miniprogram_qrcode777c8b046ac88675d4672576547429f168b4', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode777c8b046ac88675d4672576547429f168b4', '109', 'jpg', '1521698635', '0', '1521698635', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('618', 'wechat_miniprogram_qrcode56c33cad2264822d1f23912244db24158b42', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode56c33cad2264822d1f23912244db24158b42', '109', 'jpg', '1521698916', '0', '1521698916', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('619', 'wechat_miniprogram_qrcode0dec7f4f688e1646016461f6e831455ff7e1', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode0dec7f4f688e1646016461f6e831455ff7e1', '109', 'jpg', '1521699244', '0', '1521699244', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('620', 'mark_loved.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F142741mark_loved.png', '3997', 'png', '1521700061', '0', '1521700061', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('621', 'mark_lod.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F142844mark_lod.png', '4809', 'png', '1521700124', '0', '1521700124', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('622', '1.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F1503281.jpg', '472105', 'jpeg', '1521702209', '0', '1521702209', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('623', '1.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F1503371.jpg', '472105', 'jpeg', '1521702217', '0', '1521702217', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('624', '1.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F1510071.jpg', '472105', 'jpeg', '1521702608', '0', '1521702608', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('625', '1.jpg', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F1510241.jpg', '472105', 'jpeg', '1521702625', '0', '1521702625', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('626', 'wechat_miniprogram_qrcode7978d0e82a523257b1246d8249483d6317c7', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode7978d0e82a523257b1246d8249483d6317c7', '109', 'jpg', '1521703068', '0', '1521703068', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('627', 'wechat_miniprogram_qrcodee87e15ec72bf27f8af70ca073fc9d0f3162a', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcodee87e15ec72bf27f8af70ca073fc9d0f3162a', '109', 'jpg', '1521703111', '0', '1521703111', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('628', 'wechat_miniprogram_qrcode0545e5417d2257050a7834875cedc0b20f2d', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode0545e5417d2257050a7834875cedc0b20f2d', '106', 'jpg', '1521703113', '0', '1521703113', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('629', 'wechat_miniprogram_qrcode10855d1b40c3a4346d4516e466a858667d6d', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode10855d1b40c3a4346d4516e466a858667d6d', '109', 'jpg', '1521703115', '0', '1521703115', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('630', 'wechat_miniprogram_qrcode216eac669466e91197931cf9891f2cd0a6a1', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/wechat_miniprogram_qrcode216eac669466e91197931cf9891f2cd0a6a1', '109', 'jpg', '1521703169', '0', '1521703169', '0', null, '1');
INSERT INTO `yiji_file` VALUES ('631', 'mark_loved.png', null, 'yj-file.oss-cn-hangzhou.aliyuncs.com', 'http://yj-file.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2018%2F03%2F22%2F153637mark_loved.png', '3997', 'png', '1521704197', '0', '1521704197', '0', null, '1');

-- ----------------------------
-- Table structure for `yiji_menu`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_menu`;
CREATE TABLE `yiji_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) unsigned DEFAULT NULL COMMENT '父菜单id',
  `club_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '俱乐部uid',
  `name` varchar(30) DEFAULT NULL COMMENT '菜单名',
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `create_time` int(13) DEFAULT NULL COMMENT '创建时间',
  `create_name` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` int(13) DEFAULT NULL COMMENT '修改时间',
  `update_name` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0/删除，1/正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of yiji_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `yiji_menu_permission`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_menu_permission`;
CREATE TABLE `yiji_menu_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) unsigned DEFAULT NULL COMMENT '菜单id',
  `permission_id` int(11) unsigned DEFAULT NULL COMMENT '权限id',
  `create_time` int(13) DEFAULT NULL COMMENT '创建时间',
  `create_name` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` int(13) DEFAULT NULL COMMENT '修改时间',
  `update_name` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0/删除，1/正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='菜单权限关联';

-- ----------------------------
-- Records of yiji_menu_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `yiji_users`
-- ----------------------------
DROP TABLE IF EXISTS `yiji_users`;
CREATE TABLE `yiji_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `type` tinyint(1) NOT NULL DEFAULT '9' COMMENT '用户类型：9/系统用户',
  `name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `mobile` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `head_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `create_time` int(13) DEFAULT NULL COMMENT '创建时间',
  `create_name` int(5) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` int(13) DEFAULT NULL COMMENT '修改时间',
  `update_name` int(5) NOT NULL DEFAULT '0' COMMENT '修改人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0/删除，1/正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of yiji_users
-- ----------------------------
INSERT INTO `yiji_users` VALUES ('22', '9', '汪见', 'CEO', '18657940454', null, 'jij@163.com', '1515656402', '0', null, '0', null, '1');
