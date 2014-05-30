
-- ----------------------------
--  Table structure for `hashtag`
-- ----------------------------
DROP TABLE IF EXISTS `hashtag`;
CREATE TABLE `hashtag` (
  `hashtag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` varchar(20) NOT NULL,
  `text` varchar(145) NOT NULL,
  `index_start` tinyint(3) unsigned NOT NULL,
  `index_end` tinyint(3) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hashtag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146665559 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


-- ----------------------------
--  Table structure for `oauth`
-- ----------------------------
DROP TABLE IF EXISTS `oauth`;
CREATE TABLE `oauth` (
  `oauth_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `consumer_key` varchar(255) NOT NULL,
  `consumer_secret` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `access_token_secret` varchar(255) NOT NULL,
  PRIMARY KEY (`oauth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2511 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `head` int(10) DEFAULT NULL,
  `since_id_str` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `query` text NOT NULL,
  `description` varchar(255) DEFAULT 'Too lazy for a description?',
  `last_count` int(10) unsigned zerofill DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `oauth_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2511 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `mention`
-- ----------------------------
DROP TABLE IF EXISTS `mention`;
CREATE TABLE `mention` (
  `mention_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` varchar(20) NOT NULL,
  `screen_name` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `id_str` varchar(45) NOT NULL,
  `index_start` tinyint(3) unsigned NOT NULL,
  `index_end` tinyint(3) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mention_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102043292 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `tweet`
-- ----------------------------
DROP TABLE IF EXISTS `tweet`;
CREATE TABLE `tweet` (
  `tweet_id_str` varchar(20) NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `text` varchar(255) NOT NULL,
  `retweet` bit NOT NULL,
  `word_count` INT NOT NULL,
  `from_user` varchar(45) NOT NULL,
  `from_user_id_str` varchar(20) NOT NULL,
  `from_user_name` varchar(45) NOT NULL,
  `from_user_fullname` varchar(45) NOT NULL,
  `from_user_followers` int NOT NULL,
  `from_user_following` int NOT NULL,
  `from_user_favorites` int NOT NULL,
  `from_user_tweets` int NOT NULL,
  `from_user_timezone` varchar(45),
  `to_user` varchar(45) DEFAULT NULL,
  `to_user_id_str` varchar(20) DEFAULT NULL,
  `to_user_name` varchar(45) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `location_geo_0` decimal(14,10) DEFAULT NULL,
  `location_geo_1` decimal(14,10) DEFAULT NULL,
  `iso_language` varchar(3) NOT NULL,
  PRIMARY KEY (`tweet_id_str`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `update_status`
-- ----------------------------
DROP TABLE IF EXISTS `update_status`;
CREATE TABLE `update_status` (
  `run_time` datetime DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `url`
-- ----------------------------
DROP TABLE IF EXISTS `url`;
CREATE TABLE `url` (
  `url_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `expanded_url` varchar(400) NOT NULL,
  `display_url` varchar(255) NOT NULL,
  `index_start` tinyint(3) unsigned NOT NULL,
  `index_end` tinyint(3) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39936178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL,
  `oauth_id` int(10) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  `status` varchar(7) NOT NULL,
  `total_results` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39936178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



-- -----------------------------------------------------
--  Table structure for `followers of people of interest
-- -----------------------------------------------------
CREATE TABLE `twit` (
  `user_id` varchar(11) NOT NULL DEFAULT '',
  `follower_id` varchar(11) NOT NULL DEFAULT '',
  `follower_name` varchar(45) NOT NULL,
  `follower_screenname` varchar(45) NOT NULL,
  `followers_count` int(11) NOT NULL,
  `friend_count` int(11) DEFAULT NULL,
  `statuses_count` int(11) DEFAULT NULL,
  `favorites_count` int(11) DEFAULT NULL,
  `location` varchar(70) DEFAULT NULL,
  `time_zone` varchar(45) DEFAULT NULL,
  `geo_enabled` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  UNIQUE KEY `idx_name` (`follower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



-- ----------------------------
--  Table structure for `tweet`
-- ----------------------------
DROP TABLE IF EXISTS `user_timeline`;
CREATE TABLE `user_timeline` (
  `tweet_id_str` varchar(20) NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `text` varchar(255) NOT NULL,
  `tweet_favourite_count` INT,
  `tweet_retweet_count` INT,
  `from_user` varchar(45) NOT NULL,
  `from_user_id_str` varchar(20) NOT NULL,
  `from_user_name` varchar(45) NOT NULL,
  `from_user_fullname` varchar(45) NOT NULL,
  `from_user_followers` int NOT NULL,
  `from_user_following` int NOT NULL,
  `from_user_favorites` int NOT NULL,
  `from_user_tweets` int NOT NULL,
  `from_user_timezone` varchar(45),
  `to_user` varchar(45) DEFAULT NULL,
  `to_user_id_str` varchar(20) DEFAULT NULL,
  `to_user_name` varchar(45) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `iso_language` varchar(3) NOT NULL,
  PRIMARY KEY (`tweet_id_str`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;