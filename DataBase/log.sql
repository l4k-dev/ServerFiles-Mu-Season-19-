/*
 Navicat MySQL Data Transfer

 Source Server         : MU
 Source Server Type    : MySQL
 Source Server Version : 50743 (5.7.43-log)
 Source Host           : localhost:3306
 Source Schema         : log

 Target Server Type    : MySQL
 Target Server Version : 50743 (5.7.43-log)
 File Encoding         : 65001

 Date: 26/09/2023 21:10:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for antihack
-- ----------------------------
DROP TABLE IF EXISTS `antihack`;
CREATE TABLE `antihack`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for item_bag_serial
-- ----------------------------
DROP TABLE IF EXISTS `item_bag_serial`;
CREATE TABLE `item_bag_serial`  (
  `serial` int(10) UNSIGNED NULL DEFAULT NULL,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint(6) NULL DEFAULT NULL,
  `world_y` smallint(6) NULL DEFAULT NULL,
  `instance` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_boss_kill
-- ----------------------------
DROP TABLE IF EXISTS `log_boss_kill`;
CREATE TABLE `log_boss_kill`  (
  `boss_index` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `boss_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `boss_id` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `character_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `character_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `damage` bigint(20) NULL DEFAULT NULL,
  `damage_reflect` bigint(20) NULL DEFAULT NULL,
  `damage_debuff` bigint(20) NULL DEFAULT NULL,
  `damage_elemental` bigint(20) NULL DEFAULT NULL,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `first_hit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_cash_shop
-- ----------------------------
DROP TABLE IF EXISTS `log_cash_shop`;
CREATE TABLE `log_cash_shop`  (
  `server_id` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dest_char` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `package_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `option_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price_type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `price` int(10) UNSIGNED NULL DEFAULT NULL,
  `gift` tinyint(3) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_duel_bet
-- ----------------------------
DROP TABLE IF EXISTS `log_duel_bet`;
CREATE TABLE `log_duel_bet`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `char_id_1` int(255) NOT NULL,
  `char_name_1` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `char_id_2` int(255) NOT NULL,
  `char_name_2` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bet_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bet_count` int(255) NOT NULL,
  `player_win` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `duel_start_time` datetime(6) NOT NULL,
  `duel_end_time` datetime(6) NULL DEFAULT NULL,
  `duel_status` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_errtel_pentagram
-- ----------------------------
DROP TABLE IF EXISTS `log_errtel_pentagram`;
CREATE TABLE `log_errtel_pentagram`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `blessing_spirit` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `result` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `pentagram_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `errtel_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_item_buy
-- ----------------------------
DROP TABLE IF EXISTS `log_item_buy`;
CREATE TABLE `log_item_buy`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_item_create
-- ----------------------------
DROP TABLE IF EXISTS `log_item_create`;
CREATE TABLE `log_item_create`  (
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interface_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint(6) NULL DEFAULT NULL,
  `world_y` smallint(6) NULL DEFAULT NULL,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `serial` int(10) UNSIGNED NULL DEFAULT NULL,
  `serial_shop` int(10) UNSIGNED NULL DEFAULT NULL,
  `item` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_item_drop
-- ----------------------------
DROP TABLE IF EXISTS `log_item_drop`;
CREATE TABLE `log_item_drop`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_item_loot
-- ----------------------------
DROP TABLE IF EXISTS `log_item_loot`;
CREATE TABLE `log_item_loot`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_item_sell
-- ----------------------------
DROP TABLE IF EXISTS `log_item_sell`;
CREATE TABLE `log_item_sell`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_jewel_drop
-- ----------------------------
DROP TABLE IF EXISTS `log_jewel_drop`;
CREATE TABLE `log_jewel_drop`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `jewel_type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `jewel_index` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `jewel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `x` smallint(6) NULL DEFAULT NULL,
  `y` smallint(6) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_jewel_mix
-- ----------------------------
DROP TABLE IF EXISTS `log_jewel_mix`;
CREATE TABLE `log_jewel_mix`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `mix_type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `mix_id` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `mix_level` tinyint(3) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_level_up
-- ----------------------------
DROP TABLE IF EXISTS `log_level_up`;
CREATE TABLE `log_level_up`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level_normal` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `level_master` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `level_majestic` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `world` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint(6) NULL DEFAULT NULL,
  `world_y` smallint(6) NULL DEFAULT NULL,
  `event_ground` tinyint(4) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_mix
-- ----------------------------
DROP TABLE IF EXISTS `log_mix`;
CREATE TABLE `log_mix`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mix_id` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `mix_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` int(11) NULL DEFAULT NULL,
  `cost` int(10) UNSIGNED NULL DEFAULT NULL,
  `result` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `item_data_before` varchar(15000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data_after` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_personal_store
-- ----------------------------
DROP TABLE IF EXISTS `log_personal_store`;
CREATE TABLE `log_personal_store`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id_01` int(10) UNSIGNED NULL DEFAULT NULL,
  `account_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_01` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id_02` int(10) UNSIGNED NULL DEFAULT NULL,
  `account_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_02` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `offstore` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_pvp
-- ----------------------------
DROP TABLE IF EXISTS `log_pvp`;
CREATE TABLE `log_pvp`  (
  `char_id_1` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_class_1` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `char_stat_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_set_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_2` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_class_2` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `char_stat_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_set_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skill` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `hp_damage` int(11) NULL DEFAULT NULL,
  `sd_damage` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_reset
-- ----------------------------
DROP TABLE IF EXISTS `log_reset`;
CREATE TABLE `log_reset`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `char_id` int(255) NOT NULL,
  `char_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `old_rs` int(255) NOT NULL,
  `new_rs` int(255) NOT NULL,
  `time_rs` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_trade
-- ----------------------------
DROP TABLE IF EXISTS `log_trade`;
CREATE TABLE `log_trade`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id_01` int(10) UNSIGNED NULL DEFAULT NULL,
  `account_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_01` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data_01` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id_02` int(10) UNSIGNED NULL DEFAULT NULL,
  `account_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_02` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data_02` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` int(10) UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(18000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mix_recovery
-- ----------------------------
DROP TABLE IF EXISTS `mix_recovery`;
CREATE TABLE `mix_recovery`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(9999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for reward_dungeon
-- ----------------------------
DROP TABLE IF EXISTS `reward_dungeon`;
CREATE TABLE `reward_dungeon`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for reward_labyrinth_of_dimensions
-- ----------------------------
DROP TABLE IF EXISTS `reward_labyrinth_of_dimensions`;
CREATE TABLE `reward_labyrinth_of_dimensions`  (
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `rank` int(11) NULL DEFAULT NULL,
  `item_data` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
