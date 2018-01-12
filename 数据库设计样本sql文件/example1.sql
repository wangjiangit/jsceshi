/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : ejivc1

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-01-12 09:28:04
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
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
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
  `user_position` varchar(255) DEFAULT NULL COMMENT '冗余：职位',
  `user_company` varchar(255) DEFAULT NULL COMMENT '冗余:机构',
  `is_sign` tinyint(1) DEFAULT NULL COMMENT '是否签到：1\\签到 ；2\\未签到 (报名用户是否到现场扫码签到)',
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
INSERT INTO `activity_user` VALUES ('ddd', 'fff', 'dssdf', 'asdfsdaf', 'asdfsadf', 'asdfsadf', '2', '0000-00-00 00:00:00', null, '1', null, null, null);
INSERT INTO `activity_user` VALUES ('dsaf', 'ddd', 'ccccf', 'AAAA', 'cccc', 'fff', '1', '0000-00-00 00:00:00', '2018-01-05 14:11:07', '1', null, null, null);

-- ----------------------------
-- Table structure for `advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `image_url` varchar(255) DEFAULT NULL COMMENT '广告图片',
  `enabled` tinyint(4) NOT NULL COMMENT '1.启用  2.不启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
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
INSERT INTO `finance_phase_relation` VALUES ('asdfasdfff', 'ccc', '2', '2018-01-04 15:57:47', null, '1', null, null, null);
INSERT INTO `finance_phase_relation` VALUES ('asdfddd', 'ccc', '1', '2018-01-04 15:57:32', null, '1', null, null, null);
INSERT INTO `finance_phase_relation` VALUES ('dsdddd', 'ccc', '3', '2018-01-04 15:58:04', null, '1', null, null, null);

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
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of message
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息模板,仅针对系统消息';

-- ----------------------------
-- Records of message_template
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` varchar(255) NOT NULL COMMENT '表ID',
  `title` varchar(255) NOT NULL COMMENT '正标题',
  `desc` varchar(255) NOT NULL COMMENT '副标题',
  `test_content` text COMMENT '试读内容',
  `content` text NOT NULL COMMENT '新闻内容',
  `image_url` varchar(255) DEFAULT NULL COMMENT '新闻图标',
  `source` varchar(255) NOT NULL COMMENT '新闻来源',
  `views` bigint(20) DEFAULT NULL COMMENT '阅读数',
  `actual_views` bigint(20) DEFAULT NULL COMMENT '实际阅读数',
  `favorite_count` bigint(20) DEFAULT NULL COMMENT '收藏数',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型1:普通新闻;2:行研',
  `user_id` varchar(255) DEFAULT NULL COMMENT '投资人user_id,关联user',
  `collect_way` tinyint(255) DEFAULT NULL COMMENT '收集方式：1\\爬虫  2\\后台自己添加',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态:0\\待审核 \\1一审同意 ;\\2.发布 ;3.\\拒绝',
  `is_top` tinyint(4) DEFAULT NULL COMMENT '1置顶  2未置顶',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在;2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------

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
INSERT INTO `project` VALUES ('1', 'asdf', 'asdf', 'sadf', 'asdf', null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '0000-00-00 00:00:00', null, '1', null, null, null);
INSERT INTO `project` VALUES ('2', 'dddd', 'ddd', 'ddd', 'ddd', null, null, null, null, null, null, null, null, null, null, null, '2', null, null, null, null, '0000-00-00 00:00:00', null, '1', null, null, null);
INSERT INTO `project` VALUES ('3', 'ccc', 'ccc', 'ccc', 'cc', null, null, null, null, null, null, null, null, null, null, null, '2', null, null, null, null, '0000-00-00 00:00:00', null, '1', null, null, null);

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
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在; 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  `type` tinyint(1) DEFAULT NULL COMMENT '1:系统默认;2:项目活动模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='某位投资者创建的收集表模板';

-- ----------------------------
-- Records of template
-- ----------------------------
INSERT INTO `template` VALUES ('template35355cde26d9d261c8258292459d7d0231e5', '0', '1', '[\r\n    {\r\n        \"title\": \"项目名称\",\r\n        \"field_key\": \"project_name\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 1\r\n    },\r\n    {\r\n        \"title\": \"所属行业领域\",\r\n        \"field_key\": \"project_domain\",\r\n        \"field_type\": \"select\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 2\r\n    },\r\n    {\r\n        \"title\": \"项目LOGO\",\r\n        \"field_key\": \"project_logo_url\",\r\n        \"field_type\": \"file\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 3\r\n    },\r\n    {\r\n        \"title\": \"项目BP\",\r\n        \"field_key\": \"project_bp_url\",\r\n        \"field_type\": \"file\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 4\r\n    },\r\n	 {\r\n        \"title\": \"项目描述\",\r\n        \"field_key\": \"project_desc\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 5\r\n    },\r\n    {\r\n        \"title\": \"项目定位\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 6\r\n    },\r\n    {\r\n        \"title\": \"项目所在地\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 7\r\n    },\r\n    {\r\n        \"title\": \"注册公司情况\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 8\r\n    },\r\n    {\r\n        \"title\": \"项目概况\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 9\r\n    },\r\n    {\r\n        \"title\": \"市场背景\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 10\r\n    },\r\n    {\r\n        \"title\": \"核心竞争力\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 11\r\n    },\r\n    {\r\n        \"title\": \"关键业务指标\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 12\r\n    },\r\n    {\r\n        \"title\": \"竞品分析\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 1,\r\n        \"field_group_location\": 13\r\n    },\r\n    {\r\n        \"title\": \"当前融资阶段\",\r\n        \"field_key\": \"financing_phase\",\r\n        \"field_type\": \"select\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 2,\r\n        \"field_group_location\": 1\r\n    },\r\n    {\r\n        \"title\": \"计划融资额\",\r\n        \"field_key\": \"financing_money\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 2,\r\n        \"field_group_location\": 2\r\n    },\r\n    {\r\n        \"title\": \"融资史\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 2,\r\n        \"field_group_location\": 3\r\n    },\r\n    {\r\n        \"title\": \"当前股权结构\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 2,\r\n        \"field_group_location\": 4\r\n    },\r\n    {\r\n        \"title\": \"已有意向机构\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 2,\r\n        \"field_group_location\": 5\r\n    },\r\n    {\r\n        \"title\": \"现有资金情况\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 2,\r\n        \"field_group_location\": 6\r\n    },\r\n    {\r\n        \"title\": \"资金使用计划\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 2,\r\n        \"field_group_location\": 7\r\n    },\r\n    {\r\n        \"title\": \"姓名\",\r\n        \"field_key\": \"create_name\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 3,\r\n        \"field_group_location\": 1\r\n    },\r\n    {\r\n        \"title\": \"联系方式\",\r\n        \"field_key\": \"create_phone\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 1,\r\n        \"field_group\": 3,\r\n        \"field_group_location\": 2\r\n    },\r\n    {\r\n        \"title\": \"职业经历\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 3,\r\n        \"field_group_location\": 3\r\n    },\r\n    {\r\n        \"title\": \"教育背景\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 3,\r\n        \"field_group_location\": 4\r\n    },\r\n    {\r\n        \"title\": \"当前团队人数\",\r\n        \"field_key\": \"\",\r\n        \"field_type\": \"text\",\r\n        \"field_is_must\": 0,\r\n        \"field_group\": 4,\r\n        \"field_group_location\": 1\r\n    }\r\n]', '系统模板标题', '2017-12-21 11:40:13', null, '1', null, null, null, '1');

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
  `name` varchar(255) DEFAULT NULL COMMENT '姓名(完善信息)',
  `city` varchar(255) DEFAULT NULL COMMENT '城市(完善信息)',
  `mailbox` varchar(255) DEFAULT NULL COMMENT '邮箱(完善信息)',
  `enabled` tinyint(4) DEFAULT NULL COMMENT '是否激活 1:激活;2:未激活',
  `is_vip` tinyint(4) DEFAULT NULL COMMENT '是否会员 1:是; 2:不是',
  `phone` char(11) DEFAULT NULL COMMENT '电话(完善信息)',
  `company` varchar(255) DEFAULT NULL COMMENT '公司(完善信息)',
  `position` varchar(255) DEFAULT NULL COMMENT '职位(完善信息)',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址(完善信息)',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在; 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '记录备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投资者和创业者表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('ccc', '1', 'dddddasdfasdf', 'nnnnnn', null, null, null, null, '1', '1', null, null, null, null, null, '0000-00-00 00:00:00', null, '1', null, null, null);
INSERT INTO `user` VALUES ('ddd', '1', 'dddddasdfasdfdddd', 'vvvssdd', null, null, null, null, '1', '1', null, null, null, null, null, '0000-00-00 00:00:00', null, '1', null, null, null);

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

-- ----------------------------
-- Table structure for `user_vip`
-- ----------------------------
DROP TABLE IF EXISTS `user_vip`;
CREATE TABLE `user_vip` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '关联user表的id',
  `experience` text COMMENT '履历(工作经历)',
  `education_back` text COMMENT '教育背景',
  `image_url` varchar(255) DEFAULT NULL COMMENT '正装照',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '1:存在; 2:不存在(逻辑中的软删除)',
  `remark` varchar(255) DEFAULT NULL COMMENT '人物简介',
  `create_user` varchar(255) DEFAULT NULL COMMENT '记录创建者',
  `update_user` varchar(255) DEFAULT NULL COMMENT '记录更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of user_vip
-- ----------------------------
INSERT INTO `user_vip` VALUES ('dddss', 'ccc', '经历1', '教育背景', '图像', '2017-12-27 15:01:28', null, null, null, null, null);
INSERT INTO `user_vip` VALUES ('wewrsdf', 'ddd', '经历2', '教育背景2', '图像搜索', '2017-12-28 15:03:25', null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登录账号';

-- ----------------------------
-- Records of yiji_account
-- ----------------------------
INSERT INTO `yiji_account` VALUES ('39', 'wangjian', '$2y$10$ciW.H5flv0c908lxWxVG8uMwVcZVyvv0K.4W.uSzjYFv5htWK50j6', '9', '22', '9', '1515666660', '127.0.0.1', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vd3d3LnlpamkudHBsL2FwaS9BZG1pbi9sb2dpbiIsImlhdCI6MTUxNTY2NjY2MCwiZXhwIjoxNTE1ODgyNjYwLCJuYmYiOjE1MTU2NjY2NjAsImp0aSI6IjIzYzc0NTA2MmU4MjU4OTRmOThmYmNhMTFlN2M0NzRhIiwic3ViIjozOX0.7rt4jeenwfk3zT7LYj_SN7alAsYomSjSCp0B9xXZEs8', '1515656402', '0', '1515666660', '0', null, '1');

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
  `model` int(5) unsigned DEFAULT NULL COMMENT '模块：1/项目收集 ; 2/活动 ; 3/自定义名片',
  `model_id` int(5) unsigned DEFAULT NULL COMMENT '模块id',
  `model_type` tinyint(5) DEFAULT NULL COMMENT '业务附件的类别，备用',
  `url` varchar(2550) DEFAULT NULL COMMENT '附件url',
  `create_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_name` int(5) unsigned DEFAULT NULL COMMENT '创建人',
  `update_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_name` int(5) unsigned DEFAULT NULL COMMENT '修改人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0/删除，1/正常',
  PRIMARY KEY (`id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务附件';

-- ----------------------------
-- Records of yiji_business_file
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件';

-- ----------------------------
-- Records of yiji_file
-- ----------------------------
INSERT INTO `yiji_file` VALUES ('1', 'wechat.jpg', null, 'zmall.oss-cn-hangzhou.aliyuncs.com', 'http://zmall.oss-cn-hangzhou.aliyuncs.com/ejivc_file%2F2017%2F12%2F22%2F112208wechat.jpg', '24963', 'jpeg', '1513912929', '0', '1513912929', '0', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of yiji_users
-- ----------------------------
INSERT INTO `yiji_users` VALUES ('22', '9', '汪见', 'CEO', '18657940454', null, 'jij@163.com', '1515656402', '0', null, '0', null, '1');
