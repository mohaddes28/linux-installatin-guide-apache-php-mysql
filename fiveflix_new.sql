/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : fiveflix_new

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 15/06/2026 10:30:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subject_id` bigint UNSIGNED NULL DEFAULT NULL,
  `event` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `causer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `causer_id` bigint UNSIGNED NULL DEFAULT NULL,
  `properties` json NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subject`(`subject_type` ASC, `subject_id` ASC) USING BTREE,
  INDEX `causer`(`causer_type` ASC, `causer_id` ASC) USING BTREE,
  INDEX `activity_log_log_name_index`(`log_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity_log
-- ----------------------------

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL DEFAULT 1,
  `longitude` double NOT NULL DEFAULT 1,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `addressable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressable_id` bigint UNSIGNED NOT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `addresses_addressable_type_addressable_id_index`(`addressable_type` ASC, `addressable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of addresses
-- ----------------------------

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ads
-- ----------------------------

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `poster_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `banner_for` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'home',
  `poster_tv_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `banners_status_deleted_at_index`(`status` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (5, NULL, 'seize_your_life.png', 'seize_your_life.png', 'video', '2', 'Seize Your Life - Powerful Motivational Speech', 1, 1, 1, NULL, '2025-04-22 10:54:11', '2025-04-22 10:54:11', NULL, 'video', 'seize_your_life.png');
INSERT INTO `banners` VALUES (6, NULL, 'the_power_of_words_this_story_will_change_your_life.png', 'the_power_of_words_this_story_will_change_your_life.png', 'video', '20', 'Life Changing Fitness Habits - Daily Healthy Tips', 1, 1, 1, NULL, '2025-04-22 10:54:25', '2025-04-22 10:57:41', NULL, 'video', 'the_power_of_words_this_story_will_change_your_life.png');
INSERT INTO `banners` VALUES (7, NULL, 'victory_vibes.png', 'victory_vibes.png', 'video', '7', 'Victory Vibes', 1, 1, 1, NULL, '2025-04-22 10:54:36', '2025-04-22 10:54:36', NULL, 'home', 'victory_vibes.png');

-- ----------------------------
-- Table structure for cast_crew
-- ----------------------------
DROP TABLE IF EXISTS `cast_crew`;
CREATE TABLE `cast_crew`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tmdb_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `place_of_birth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cast_crew_deleted_at_index`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 260 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cast_crew
-- ----------------------------
INSERT INTO `cast_crew` VALUES (1, 'Michael Johnson', 'michael_johnson.png', 'actor', NULL, 'Versatile actor known for his dynamic roles in action and drama films. 🎬', 'New York, USA', '1985-04-13', 'Main Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (2, 'James Williams', 'james_williams.png', 'actor', NULL, 'Acclaimed actor with a knack for bringing complex characters to life. 🎭', 'Los Angeles, USA', '1980-04-14', 'Main Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (3, 'Robert Brown', 'robert_brown.png', 'actor', NULL, 'Renowned actor famed for his powerful performances in thrillers. 🔪', 'Chicago, USA', '1990-02-07', 'Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (4, 'David Jones', 'david_jones.png', 'actor', NULL, 'Award-winning actor known for his captivating roles in historical dramas. 📜', 'London, UK', '1985-08-04', 'Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (5, 'John Miller', 'john_miller.png', 'actor', NULL, 'Charismatic actor celebrated for his comedic timing and charm. 😂', 'Toronto, Canada', '1982-12-09', 'Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (6, 'Daniel Anderson', 'daniel_anderson.png', 'actor', NULL, 'Talented actor known for his intense and compelling performances in horror films. 👻', 'Sydney, Australia', '1990-09-07', 'Voice Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (7, 'Matthew Clark', 'matthew_clark.png', 'actor', NULL, 'Dynamic actor recognized for his roles in inspirational and motivational films. 🌟', 'Dublin, Ireland', '1980-01-10', 'Voice Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (8, 'Andrew Martinez', 'andrew_martinez.png', 'actor', NULL, 'Acclaimed actor with a strong presence in romantic films. 💖', 'Madrid, Spain', '1986-01-23', 'Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (9, 'Joshua Rodriguez', 'joshua_rodriguez.png', 'actor', NULL, 'Renowned for his action-packed roles and high-energy performances. 💥', 'Mexico City, Mexico', '1985-07-19', 'Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (10, 'Christopher Lopez', 'christopher_lopez.png', 'actor', NULL, 'Versatile actor known for his roles in both comedy and drama. 🎭', 'Buenos Aires, Argentina', '1991-06-13', 'Main Actor', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (11, 'Emily Johnson', 'emily_johnson.png', 'actor', NULL, 'Talented actress known for her captivating performances in dramas. 🎬', 'New York, USA', '1993-01-05', 'Main Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (12, 'Laura Turner', 'laura_turner.png', 'actor', NULL, 'Renowned actress with a flair for bringing historical characters to life. 📜', 'Los Angeles, USA', '1990-08-18', 'Main Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (13, 'Olivia Martinez', 'olivia_martinez.png', 'actor', NULL, 'Acclaimed actress known for her dynamic roles in romantic films. 💖', 'Madrid, Spain', '1992-03-10', 'Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (14, 'Isabella Brown', 'isabella_brown.png', 'actor', NULL, 'Versatile actress with a talent for both comedy and drama. 😂', 'London, UK', '1995-06-08', 'Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (15, 'Lily Clark', 'lily_clark.png', 'actor', NULL, 'Celebrated actress known for her intense performances in thrillers. 🔪', 'Toronto, Canada', '1997-05-06', 'Voice Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (16, 'Charlotte Garcia', 'charlotte_garcia.png', 'actor', NULL, 'Acclaimed actress renowned for her roles in horror films. 👻', 'Sydney, Australia', '1991-02-05', 'Voice Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (17, 'Amelia Martinez', 'amelia_martinez.png', 'actor', NULL, 'Dynamic actress recognized for her roles in inspirational movies. 🌟', 'Mexico City, Mexico', '1994-07-21', 'Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (18, 'Jessica Adams', 'jessica_adams.png', 'actor', NULL, 'Talented actress known for her compelling performances in action films. 💥', 'Dublin, Ireland', '1992-08-15', 'Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (19, 'Megan Collins', 'megan_collins.png', 'actor', NULL, 'Versatile actress known for her roles in both romantic and drama films. 💖', 'Seoul, South Korea', '1988-03-08', 'Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (20, 'Grace Taylor', 'grace_taylor.png', 'actor', NULL, 'Acclaimed actress celebrated for her performances in historical dramas. 📜', 'Cape Town, South Africa', '1989-02-11', 'Actress', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (21, 'Thomas Smith', 'thomas_smith.png', 'director', NULL, 'Visionary director known for his innovative storytelling and cinematic techniques. 🎬', 'New York, USA', '1985-04-13', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (22, 'William Johnson', 'william_johnson.png', 'director', NULL, 'Acclaimed director with a flair for intense action sequences. 💥', 'Los Angeles, USA', '1980-04-14', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (23, 'Henry Taylor', 'henry_taylor.png', 'director', NULL, 'Renowned director known for his compelling historical dramas. 📜', 'Chicago, USA', '1990-02-07', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (24, 'Charles Wilson', 'charles_wilson.png', 'director', NULL, 'Award-winning director famous for his work in horror films. 👻', 'London, UK', '1985-08-04', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (25, 'George Harris', 'george_harris.png', 'director', NULL, 'Innovative director known for his unique approach to comedy. 😂', 'Toronto, Canada', '1982-12-09', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (26, 'Anthony Clark', 'anthony_clark.png', 'director', NULL, 'Talented director celebrated for his inspirational and motivational films. 🌟', 'Sydney, Australia', '1980-04-18', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (27, 'Edward Lewis', 'edward_lewis.png', 'director', NULL, 'Dynamic director recognized for his work in romantic films. 💖', 'Dublin, Ireland', '1982-01-11', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (28, 'Daniel Walker', 'daniel_walker.png', 'director', NULL, 'Acclaimed director known for his thrilling and suspenseful films. 🔪', 'Madrid, Spain', '1981-05-12', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (29, 'Matthew Collins', 'matthew_collins.png', 'director', NULL, 'Renowned for his action-packed films and high-energy direction. 🎥', 'Mexico City, Mexico', '1983-02-18', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00');
INSERT INTO `cast_crew` VALUES (30, 'Richard King', 'richard_king.png', 'director', NULL, 'Celebrated director known for his masterful storytelling in drama. 🎭', 'Buenos Aires, Argentina', '1987-03-27', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (31, 'Sophia Williams', 'sophia_williams.png', 'director', NULL, 'Acclaimed director known for her profound and emotional storytelling. 🎬', 'New York, USA', '1989-06-15', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (32, 'Emma Thompson', 'emma_thompson.png', 'director', NULL, 'Visionary director celebrated for her work in romantic films. 💖', 'Los Angeles, USA', '1990-08-16', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (33, 'Abigail Thompson', 'abigail_thompson.png', 'director', NULL, 'Renowned director known for her historical dramas and biopics. 📜', 'Madrid, Spain', '1992-06-21', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (34, 'Natalie Parker', 'natalie_parker.png', 'director', NULL, 'Award-winning director famous for her suspenseful thrillers. 🔪', 'London, UK', '1991-07-25', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (35, 'Mili Davis', 'mili_davis.png', 'director', NULL, 'Talented director known for her innovative approach to comedy. 😂', 'Toronto, Canada', '1988-08-10', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (36, 'Chloe Mitchell', 'chloe_mitchell.png', 'director', NULL, 'Dynamic director recognized for her powerful horror films. 👻', 'Sydney, Australia', '1989-12-25', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (37, 'Sarah Foster', 'sarah_foster.png', 'director', NULL, 'Acclaimed director known for her inspirational and motivational films. 🌟', 'Mexico City, Mexico', '1987-08-24', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (38, 'Victoria Evans', 'victoria_evans.png', 'director', NULL, 'Visionary director celebrated for her thrilling and suspenseful films. 🔪', 'London, UK', '1986-11-27', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (39, 'Ava Brown', 'ava_brown.png', 'director', NULL, 'Renowned for her action-packed and high-energy films. 💥', 'Toronto, Canada', '1988-09-06', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (40, 'Sophia Lee', 'sophia_lee.png', 'director', NULL, 'Celebrated director known for her compelling drama films. 🎭', 'Sydney, Australia', '1991-08-30', 'Director', NULL, NULL, NULL, NULL, '2025-08-24 11:20:01', '2025-08-24 11:20:01');
INSERT INTO `cast_crew` VALUES (41, 'New Actor', 'andrew_martinez.png', 'actor', NULL, 'actor', 'Dhaka', '2020-08-01', 'Lead Actor', 1, 1, NULL, NULL, '2025-08-25 10:20:44', '2025-08-25 10:20:44');
INSERT INTO `cast_crew` VALUES (42, 'New Director', 'amelia_martinez.png', 'director', NULL, 'Director', 'Dhaka', '2005-08-01', 'Director', 1, 1, NULL, NULL, '2025-08-25 10:21:48', '2025-08-25 10:21:48');
INSERT INTO `cast_crew` VALUES (43, 'Christian Bale', 'https://image.tmdb.org/t/p/original/7Pxez9J8fuPd2Mn9kex13YALrCQ.jpg', 'actor', 'tt0468569', 'Christian Charles Philip Bale (born 30 January 1974) is an English actor. Known for his versatility and physical transformations for his roles, he has been a leading man in films of several genres. He has received various accolades, including an Academy Award and two Golden Globe Awards. Forbes magazine ranked him as one of the highest-paid actors in 2014.\n\nBorn in Wales to English parents, Bale had his breakthrough role at age 13 in Steven Spielberg\'s 1987 war film Empire of the Sun. After more than a decade of performing in leading and supporting roles in films, he gained wider recognition for his portrayals of serial killer Patrick Bateman in the black comedy American Psycho (2000) and the titular role in the psychological thriller The Machinist (2004). In 2005, he played superhero Batman in Batman Begins and again in The Dark Knight (2008) and The Dark Knight Rises (2012), garnering acclaim for his performance in the trilogy, which is one of the highest-grossing film franchises.\n\nBale continued in starring roles in a range of films outside his work as Batman, including the period drama The Prestige (2006), the action film Terminator Salvation (2009), the crime drama Public Enemies (2009), the epic film Exodus: Gods and Kings (2014) and the superhero film Thor: Love and Thunder (2022). For his portrayal of boxer Dicky Eklund in the 2010 biographical film The Fighter, he won an Academy Award and a Golden Globe Award. Further Academy Award and Golden Globe Award nominations came for his work in the black comedy American Hustle (2013) and the biographical dramedies The Big Short (2015) and Vice (2018). His performances as politician Dick Cheney in Vice and race car driver Ken Miles in the sports drama Ford v Ferrari (2019) earned him a second win and a fifth nomination respectively at the Golden Globe Awards.', 'Haverfordwest, Pembrokeshire, Wales, UK', '1974-01-30', NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:41', '2025-09-20 10:54:36');
INSERT INTO `cast_crew` VALUES (44, 'Heath Ledger', 'https://image.tmdb.org/t/p/original/p2z2bURSg7nuMsN9P2s61e2RvNz.jpg', 'actor', 'tt0468569', 'Heath Andrew Ledger (April 4, 1979 – January 22, 2008) was an Australian actor and music video director. After playing roles in several Australian television and film productions during the 1990s, Ledger moved to the United States in 1998 to develop his film career further. His work consisted of twenty films, including 10 Things I Hate About You (1999), The Patriot (2000), A Knight\'s Tale (2001), Monster\'s Ball (2001), Lords of Dogtown (2005), Brokeback Mountain (2005), Candy (2006), I\'m Not There (2007), The Dark Knight (2008), and The Imaginarium of Doctor Parnassus (2009), the latter two being posthumous releases. He also produced and directed music videos and aspired to be a film director.\n\nFor his portrayal of Ennis Del Mar in Brokeback Mountain, Ledger won the New York Film Critics Circle Award for Best Actor and the Best International Actor Award from the Australian Film Institute; he was the first actor to win the latter award posthumously. He was nominated for the BAFTA Award, Screen Actors Guild Award, Golden Globe Award and the Academy Award for Best Actor, becoming the eighth-youngest nominee in the category at that time. Posthumously, he shared the 2007 Independent Spirit Robert Altman Award with the rest of the ensemble cast, the director, and the casting director for the film I\'m Not There, which was inspired by the life and songs of American singer-songwriter Bob Dylan. In the film, Ledger portrayed a fictional actor named Robbie Clark, one of six characters embodying aspects of Dylan\'s life and persona.\n\nLedger died on 22 January 2008 as a result of an accidental overdose of medications. A few months before his death, Ledger had finished filming his role as the Joker in The Dark Knight. At the time of his death, The Dark Knight was in post-production, and The Imaginarium of Doctor Parnassus, in which he was playing his last role as Tony, was in the midst of filming. His death affected the subsequent promotion of The Dark Knight. His performance as the Joker in The Dark Knight earned him universal acclaim and popularity from fans and critics alike. Ledger also received numerous posthumous awards for his work on The Dark Knight, including the Academy Award for Best Supporting Actor, a Best Actor International Award at the 2008 Australian Film Institute Awards, the 2008 Los Angeles Film Critics Association Award for Best Supporting Actor, the 2009 Golden Globe Award for Best Supporting Actor – Motion Picture, and the 2009 BAFTA Award for Best Supporting Actor.', 'Perth, Western Australia, Australia', '1979-04-04', NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:42', '2025-09-20 10:54:37');
INSERT INTO `cast_crew` VALUES (45, 'Aaron Eckhart', 'https://image.tmdb.org/t/p/original/u5JjnRMr9zKEVvOP7k3F6gdcwT6.jpg', 'actor', 'tt0468569', 'Aaron Edward Eckhart (born March 12, 1968) is an American actor. Born in Cupertino, California, Eckhart moved to the United Kingdom at early age, when his father relocated the family. Several years later, he began his acting career by performing in school plays, before moving to Australia for his high school senior year. He left high school without graduating, but earned a diploma through a professional education course, and graduated from Brigham Young University (BYU) in 1994 with a Bachelor of Fine Arts (BFA) degree in film. For much of the mid-1990s, he lived in New York City as a struggling, unemployed actor.\n\nAs an undergraduate at BYU, Eckhart met director and writer Neil LaBute, who cast him in several of his own original plays. Five years later Eckhart made a debut as an unctuous, sociopathic ladies\' man in LaBute\'s black comedy film In the Company of Men (1997). Under LaBute\'s guidance he worked in the director\'s films Your Friends & Neighbors (1998), Nurse Betty (2000), and Possession (2002).\n\nEckhart gained wide recognition as George in Steven Soderbergh\'s critically acclaimed film Erin Brockovich (2000), and, in 2006, he received a Golden Globe nomination for his portrayal of Nick Naylor in Thank You for Smoking. He gained further mainstream breakout in 2008 when he starred in the blockbuster Batman film The Dark Knight as District Attorney Harvey Dent / Two-Face. Eckhart\'s other key roles include The Pledge (2001), The Core (2003), Paycheck (2003), Rabbit Hole (2010), Battle: Los Angeles (2011), Olympus Has Fallen (2013) and its sequel London Has Fallen (2016), I, Frankenstein (2014), Sully (2016), Midway (2019) and Line Of Duty (2019).', 'Cupertino, California, USA', '1968-03-12', NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:42', '2025-09-20 10:54:37');
INSERT INTO `cast_crew` VALUES (46, 'Michael Caine', 'https://image.tmdb.org/t/p/original/bVZRMlpjTAO2pJK6v90buFgVbSW.jpg', 'actor', 'tt0468569', 'Sir Michael Caine CBE (born Maurice Joseph Micklewhite Jr.; 14 March 1933) is a retired English actor. Known for his distinctive South London accent, he has appeared in more than 160 films in a career spanning seven decades, and is considered a British film icon. As of February 2017, the films in which Caine has appeared have grossed over $7.8 billion worldwide.\n\nOften playing a Cockney, Caine made his breakthrough in the 1960s with starring roles in British films such as Zulu (1964), The Ipcress File (1965), Alfie (1966), The Italian Job (1969), and Battle of Britain (1969). He was nominated for an Academy Award for Alfie. His roles in the 1970s included Get Carter (1971), The Last Valley (1971), Sleuth (1972), The Man Who Would Be King (1975), The Eagle Has Landed (1976) and A Bridge Too Far (1977). He earned his second Academy Award nomination for Sleuth and achieved some of his greatest critical success in the 1980s, with Educating Rita (1983) earning him the BAFTA and Golden Globe Award for Best Actor and Woody Allen\'s Hannah and Her Sisters (1986) earning him his first Academy Award for Best Supporting Actor.\n\nCaine is also known for his performance as Ebenezer Scrooge in The Muppet Christmas Carol (1992), and for his comedic roles in Dirty Rotten Scoundrels (1988), Miss Congeniality (2000), Austin Powers in Goldmember (2002), and Secondhand Lions (2003). He received his second Golden Globe Award for Little Voice (1998). In 1999, he received his second Academy Award for Best Supporting Actor for his performance as a sympathetic doctor in The Cider House Rules. He portrayed a British journalist in Vietnam in The Quiet American (2002), earning his sixth Oscar nomination, and appeared in Alfonso Cuaron\'s dystopian drama film Children of Men (2006). Caine portrayed Alfred Pennyworth in Christopher Nolan\'s The Dark Knight Trilogy (2005–2012). He appeared in several other of Nolan\'s films including The Prestige (2006), Inception (2010), Interstellar (2014) and Tenet (2020). He also appeared in the heist thriller film Now You See Me (2013), the action comedy film Kingsman: The Secret Service (2014), the Italian drama Youth (2015) and the crime film King of Thieves (2018).\n\nCaine officially confirmed his retirement from acting on 13 October 2023.', 'Rotherhithe, London, England, UK', '1933-03-14', NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:43', '2025-09-20 10:54:38');
INSERT INTO `cast_crew` VALUES (47, 'Maggie Gyllenhaal', 'https://image.tmdb.org/t/p/original/vsfkWdYWmA9CpzMHTJzrFxlDnEZ.jpg', 'actor', 'tt0468569', 'Margalit \"Maggie\" Ruth Gyllenhaal (born November 16, 1977) is an American actress and filmmaker. Part of the Gyllenhaal family, she is the daughter of filmmakers Stephen Gyllenhaal and Naomi Achs, and the older sister of actor Jake Gyllenhaal.\n\nGyllenhaal began her career as a teenager with small roles in several of her father\'s films, and appeared with her brother in the cult favorite Donnie Darko (2001). She then appeared in Adaptation, Confessions of a Dangerous Mind (both 2002), and Mona Lisa Smile (2003). Gyllenhaal received critical acclaim for her leading performances in the erotic romantic comedy drama Secretary (2002) and the drama Sherrybaby (2006), each of which earned her a Golden Globe Award nomination. After several commercially successful films in 2006, including World Trade Center, she received wider recognition for playing Rachel Dawes in the superhero film The Dark Knight (2008).\n\nFor her performance as a single mother in Crazy Heart (2009), she received a nomination for Academy Award for Best Supporting Actress. She subsequently starred in the comedies and dramas: Nanny McPhee and the Big Bang (2010), Hysteria (2011), and Won\'t Back Down (2012). Her other roles include a Secret Service agent in the action-thriller White House Down (2013), a musician in Frank (2014), and the title role in the drama The Kindergarten Teacher (2018). In 2021, Gyllenhaal made her writing and directing debut with the psychological drama The Lost Daughter, for which she won the Venice International Film Festival\'s Best Screenplay Award and was nominated for the Academy Award for Best Adapted Screenplay.\n\nGyllenhaal has also appeared in five stage productions since 2000, including making her Broadway debut in a revival of The Real Thing. She has starred in several television series, including the BBC political-thriller miniseries The Honourable Woman. For her performance, she won a Golden Globe award for Best Actress, and was nominated for a Primetime Emmy Award. She also produced and starred in the HBO period drama series The Deuce (2017–19). Gyllenhaal has been married to actor Peter Sarsgaard since 2009 and they have two children together.', 'Lower East Side, New York City, New York, USA', '1977-11-16', NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:44', '2025-09-20 10:54:39');
INSERT INTO `cast_crew` VALUES (48, 'Christopher Nolan', 'https://image.tmdb.org/t/p/original/xuAIuYSmsUzKlUMBFGVZaWsY3DZ.jpg', 'director', '27205', 'Christopher Nolan (born 30 July 1970) is a British-American filmmaker whose concept-driven epics have reshaped the modern studio blockbuster. Renowned for structurally intricate storytelling, large-format cinematography, and practical effects, he is widely regarded as a defining director of the 21st century. His films have grossed over $6.6 billion worldwide and earned him two Academy Awards, two BAFTAs, and a Golden Globe. He was appointed CBE in 2019 and knighted in 2024 for services to film.\n\nRaised between London and Evanston, Illinois, Nolan began making Super 8 shorts as a child, later studying English literature at University College London, where he ran the Film Society and met his producer and future wife, Emma Thomas; together they founded Syncopy Inc. After shorts like Doodlebug, he self-financed his micro-budget debut Following (1998), then broke through with the reverse-told amnesia noir Memento (2000). Studio work followed with Insomnia (2002) and then Batman Begins (2005), which launched a grounded superhero trilogy completed by The Dark Knight (2008) and The Dark Knight Rises (2012). Between and after those, he mounted original tentpoles—The Prestige (2006), Inception (2010), Interstellar (2014), and the triptych survival drama Dunkirk (2017), which earned his first Best Director nomination.\n\nNolan’s films interrogate time, memory, identity, ethics, and knowledge—sneaking metaphysics into genre frames (noir, heist, war, biopic). Hallmarks include nonlinear or braided timelines, precision cross-cutting, mathematically inflected imagery, practical/in-camera spectacle augmented by visual effects, experimental soundscapes, and a steadfast preference for celluloid (65mm/IMAX) and theatrical exhibition. A frequent collaborator with Jonathan Nolan (co-writer), Emma Thomas (producer), and craftspeople such as Wally Pfister, Hoyte van Hoytema, Lee Smith, and Hans Zimmer, he also advocates globally for film preservation and exhibition, curating restorations and convening archivists to champion photochemical cinema.\n\nAfter the time-bending espionage of Tenet (2020), Nolan departed Warner Bros. and partnered with Universal on Oppenheimer (2023), a morally dense biopic that won him the Academy Awards for Best Director and Best Picture. He is re-teaming with Universal on The Odyssey (scheduled for 2026), an IMAX-shot adaptation of Homer’s epic. In 2025 he was elected President of the Directors Guild of America. Nolan lives in Los Angeles with Thomas and their four children, continuing to pair popular spectacle with intellectual ambition while championing the artistry—and communal ritual—of seeing movies on film, in cinemas.', 'Westminster, London, England, UK', '1970-07-30', NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:44', '2025-10-13 04:06:03');
INSERT INTO `cast_crew` VALUES (49, 'Steve Gehrke', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0468569', '', 'Los Angeles, California, USA', '1961-05-28', NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:46', '2025-09-20 10:54:40');
INSERT INTO `cast_crew` VALUES (50, 'Brandon Lambdin', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0468569', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:46', '2025-09-20 10:54:41');
INSERT INTO `cast_crew` VALUES (51, 'Geoff Dibben', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', '155', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-20 10:53:47', '2025-09-20 10:53:47');
INSERT INTO `cast_crew` VALUES (52, 'Nilo Otero', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0468569', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-20 10:54:41', '2025-09-20 10:54:41');
INSERT INTO `cast_crew` VALUES (53, 'Natsuki Hanae', 'https://image.tmdb.org/t/p/original/alTb0DlcPIbcwM08WSmxFai58sd.jpg', 'actor', 'tt32820897', 'Natsuki Hanae is a Japanese voice actor from Kanagawa Prefecture. He is affiliated with Across Entertainment. In 2015, he won an award at the 9th Seiyuu Awards as one of the best male newcomers. He also hosts the radio show ŌHana along with voice actor Ryōta Ōsaka. \"Hanae\" is actually a pseudonym; his real surname has not been disclosed by his agency.', 'Fujisawa, Kanagawa, Japan', '1991-06-26', NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:03', '2025-09-20 10:55:03');
INSERT INTO `cast_crew` VALUES (54, 'Hiro Shimono', 'https://image.tmdb.org/t/p/original/yrSDcgFefHtWkFmLnTrcw2t0MV.jpg', 'actor', 'tt32820897', 'Hiro Shimono is a Japanese voice actor and singer affiliated with I\'m Enterprise. His notable roles include Keima Katsuragi in The World God Only Knows, Connie Springer in Attack on Titan, Nai in Karneval, Ayato Kamina in RahXephon, Akihisa Yoshii in Baka and Test: Summon the Beasts, Norifumi Kawakami in Ace of Diamond, Kokichi Ōma in Danganronpa V3: Killing Harmony, and Dabi in My Hero Academia.', 'Tokyo, Japan', '1980-04-21', NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:04', '2025-09-20 10:55:04');
INSERT INTO `cast_crew` VALUES (55, 'Takahiro Sakurai', 'https://image.tmdb.org/t/p/original/8s8owcKmpRAuhzEGjSdRpztthUg.jpg', 'actor', 'tt32820897', 'Takahiro Sakurai is a Japanese voice actor who was born in Okazaki. He was a member of 81 Produce and has been attached to INTENTION since July 20 of 2014, the management company established by Kenichi Suzumura, one of his good friends.', 'Okazaki, Aichi, Japan', '1974-06-13', NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:05', '2025-09-20 10:55:05');
INSERT INTO `cast_crew` VALUES (56, 'Akira Ishida', 'https://image.tmdb.org/t/p/original/jnW2Gn2NlR2uwOCeyOuzypnTmkH.jpg', 'actor', 'tt32820897', 'Akira Ishida (石田 彰, Ishida Akira, November 2, 1967) is a Japanese voice actor and actor from Nisshin, Aichi. He is affiliated with Peerless Gerbera.\n\nVoted the most popular voice actor in the Animage Anime Grand Prix in 2004, and the Best Supporting Actor at the 1st Seiyū Awards in 2007.', 'Nisshin, Aichi, Japan', '1967-11-02', NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:05', '2025-09-20 10:55:05');
INSERT INTO `cast_crew` VALUES (57, 'Yoshitsugu Matsuoka', 'https://image.tmdb.org/t/p/original/ugDwdWEXnmv43jcbnfAi4XwiQ8C.jpg', 'actor', 'tt32820897', 'Yoshitsugu Matsuoka is a Japanese voice actor from Hokkaido. He is affiliated with I\'m Enterprise. He was honored at the 6th Seiyu Awards for Best New Actor in 2012 and the 10th Seiyu Awards for Best Lead Actor in 2016. He is best known for being the voice of Kirito from Sword Art Online, Sorata Kanda from The Pet Girl of Sakurasou, Sora from No Game No Life, Arata Kasuga/Astral Trinity from Trinity Seven, Sōma Yukihira from Food Wars!: Shokugeki no Soma, and Masamune Izumi from Eromanga Sensei. As of June 17, 2019, he is the current official Guinness World Record holder for the most unique sound bites provided by a voice actor at an exceeded 10,000 words in Danmachi - Memoria Freese.', 'Obihiro, Hokkaido, Japan', '1986-09-17', NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:06', '2025-09-20 10:55:06');
INSERT INTO `cast_crew` VALUES (58, 'Haruo Sotozaki', 'https://image.tmdb.org/t/p/original/ylaWAuJB1PyAzaefqENBDEAKTLI.jpg', 'director', 'tt32820897', 'Haruo Sotozaki is a Japanese anime and film director best known for his work on the Demon Slayer: Kimetsu no Yaiba series. He began his career in the animation industry in the mid-1990s, contributing as a key animator and storyboard artist on various projects. Sotozaki made his full directorial debut with the anime adaptation of Ninja Nonsense (2004). In 2019, he directed the critically acclaimed Demon Slayer: Kimetsu no Yaiba television series, followed by the record-breaking film Demon Slayer: Kimetsu no Yaiba – The Movie: Mugen Train (2020). His direction is noted for its dynamic action sequences and faithful adaptation of source material.', 'Muroran, Hokkaido, Japan', NULL, NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:07', '2025-09-20 10:55:07');
INSERT INTO `cast_crew` VALUES (59, 'Shinya Shimomura', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt32820897', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:08', '2025-09-20 10:55:08');
INSERT INTO `cast_crew` VALUES (60, 'Takuro Takahashi', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt32820897', 'Takuro Takahashi (高橋タクロヲ, Takahashi Takuro), also known under his pseudonym Junichi Minamino (南野純一, Minamino Junichi), is a Japanese director, storyboard artist, animation director and animator.\n\nSince a drunk-tweeting incident in 2017, he has been using the pseudonym Junichi Minamino for his appearances in various Ufotable works such as Demon Slayer and the Fate/stay night: Heaven\'s Feel trilogy.', 'Chiba, Japan', NULL, NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:09', '2025-09-20 10:55:09');
INSERT INTO `cast_crew` VALUES (61, 'Takashi Suhara', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt32820897', '', 'Osaka, Japan', NULL, NULL, 1, 1, NULL, NULL, '2025-09-20 10:55:09', '2025-09-20 10:55:09');
INSERT INTO `cast_crew` VALUES (62, 'Lily James', 'https://image.tmdb.org/t/p/original/7UN8GVsDzccK9UVYzMx3hooLyzZ.jpg', 'actor', 'tt31909270', 'Lily Chloe Ninette Thomson (born 5 April 1989), known professionally as Lily James, is an English actress. She studied acting at the Guildhall School of Music and Drama in London. She began her career in the British television series Just William (2010). Following a supporting role in the period drama series Downton Abbey (2012–2015), her breakthrough was the title role in the fantasy film Cinderella (2015).\n\nJames went on to portray Natasha Rostova in the television adaptation of War & Peace (2016). She starred in several films, including the action film Baby Driver (2017), the period dramas Darkest Hour (2017), The Guernsey Literary and Potato Peel Pie Society (2018) and The Dig (2021), the musicals Mamma Mia! Here We Go Again (2018) and Yesterday (2019), and the sports drama The Iron Claw (2023). Her portrayal of Pamela Anderson in the biographical series Pam & Tommy (2022) earned her nominations for a Golden Globe and a Primetime Emmy Award.\n\nDescription above from the Wikipedia article Lily James, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Esher, Surrey, England, UK', '1989-04-05', NULL, 1, 1, NULL, NULL, '2025-09-20 11:00:22', '2025-09-20 11:00:22');
INSERT INTO `cast_crew` VALUES (63, 'Ben Schnetzer', 'https://image.tmdb.org/t/p/original/drpFFDyWj2jeoX5I1D1WhUfcCCx.jpg', 'actor', 'tt31909270', 'Ben Schnetzer is an American actor. He is the son of actors Stephen Schnetzer and Nancy Snyder.  Schnetzer was born and raised in New York City. He is a graduate of the Guildhall School of Music and Drama in London. In 2010, Schnetzer appeared in an episode of Law & Order and co-starred on the series Happy Town. He played Max Vandenburg in the film adaptation of The Book Thief (2013).', 'New York City, New York, USA', '1990-02-08', NULL, 1, 1, NULL, NULL, '2025-09-20 11:00:22', '2025-09-20 11:00:22');
INSERT INTO `cast_crew` VALUES (64, 'Myha\'la', 'https://image.tmdb.org/t/p/original/2uI4x273szwjnuVbYInhbxgohdb.jpg', 'actor', 'tt31909270', 'Myha\'la Jael Herrold (/maɪˈhɑːlə/; born April, 6 1996) is an American actress, known mononymously as Myha\'la. She is known for her role as Harper Stern in the British television drama Industry and her role as Jordan in the comedic horror film Bodies Bodies Bodies. She acted primarily in theater roles before being cast in Industry, including on the Broadway production of The Book of Mormon.', 'California, USA', '1996-04-06', NULL, 1, 1, NULL, NULL, '2025-09-20 11:00:23', '2025-09-20 11:00:23');
INSERT INTO `cast_crew` VALUES (65, 'Jackson White', 'https://image.tmdb.org/t/p/original/dXTJFTkti0mpssgsYvMa00W59jB.jpg', 'actor', 'tt31909270', 'Jackson White was born on 1 March 1996. He is an actor and director, known for Mrs. Fletcher (2019), Ambulance (2022) and The Middle (2009).', NULL, '1996-03-01', NULL, 1, 1, NULL, NULL, '2025-09-20 11:00:24', '2025-09-20 11:00:24');
INSERT INTO `cast_crew` VALUES (66, 'Dan Stevens', 'https://image.tmdb.org/t/p/original/fFsgginZKH527o38ZfdDxuzx7Ew.jpg', 'actor', '823464', 'Daniel Jonathan Stevens (born 10 October 1982) is an English actor. He first drew international attention for his role as Matthew Crawley in the ITV period drama series Downton Abbey (2010–2012).\n\nHe also starred as David in the thriller film The Guest (2014), Sir Lancelot in the adventure film Night at the Museum: Secret of the Tomb (2014), The Beast/Prince in Disney\'s live-action adaptation of Beauty and the Beast (2017), Lorin Willis in the biographical legal drama Marshall (2017), Charles Dickens in the biographical drama The Man Who Invented Christmas (2017) and Russian Eurovision singer Alexander Lemtov in Eurovision Song Contest: The Story of Fire Saga (2020). From 2017 to 2019, he starred as David Haller in the FX series Legion. In 2018, he starred in the Netflix horror Apostle. Since 2023, he has starred as Korvo Opposites in the animated series Solar Opposites. In 2024, Stevens starred as Trapper in Godzilla x Kong: The New Empire.\n\nDescription above from the Wikipedia article Dan Stevens, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Croydon, London, England, UK', '1982-10-10', NULL, 1, 1, NULL, NULL, '2025-09-20 11:00:24', '2026-02-03 22:14:51');
INSERT INTO `cast_crew` VALUES (67, 'Rachel Lee Goldenberg', 'https://image.tmdb.org/t/p/original/mlje0mJnxkNBdLtk8INVHg6QBTM.jpg', 'director', 'tt31909270', 'Rachel Lee Goldenberg is an American film director and screenwriter.\n\nDescription above from the Wikipedia article Rachel Lee Goldenberg, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'United States', NULL, NULL, 1, 1, NULL, NULL, '2025-09-20 11:00:25', '2025-09-20 11:00:25');
INSERT INTO `cast_crew` VALUES (68, 'David Corenswet', 'https://image.tmdb.org/t/p/original/hVs0pXbOMeH9V97ga63S7m5iS6W.jpg', 'actor', '1061474', 'David Packard Corenswet (/ˈkɔːrənswɛt/CORE-in-SWET; born July 8, 1993) is an American actor. After graduating from Juilliard in 2016, he began guest-starring in television series, including House of Cards in 2018. He played lead roles in the Netflix series The Politician (2019–2020) and Hollywood (2020), both created by Ryan Murphy. In 2022, he starred in the films Look Both Ways and Pearl, as well as the HBO miniseries We Own This City. After supporting roles in the film Twisters and the miniseries Lady in the Lake (both 2024), he rose to prominence with his portrayal of the titular superhero in James Gunn\'s DC Universe film Superman (2025).\n\nDescription above from the Wikipedia article David Corenswet, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Philadelphia, Pennsylvania, USA', '1993-07-08', NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:31', '2026-02-03 21:14:10');
INSERT INTO `cast_crew` VALUES (69, 'Rachel Brosnahan', 'https://image.tmdb.org/t/p/original/7lhPUIOjPNKnStLX5XC0xiOEMh4.jpg', 'actor', '1061474', 'Rachel Brosnahan (born July 12, 1990) is an American actress. She is best known for portraying an aspiring stand-up comedian in the Amazon Prime Video period comedy series The Marvellous Mrs. Maisel (2017–2023), for which she won a Primetime Emmy Award in 2018 and two consecutive Golden Globe Awards in 2018 and 2019.On television, she was Emmy-nominated for the political thriller series House of Cards (2013–2015) and acted in the drama series Manhattan (2014–2015). Brosnahan made her film debut in the horror film The Unborn (2009) and has acted in Beautiful Creatures (2013), Louder Than Bombs (2015), The Finest Hours (2016), Patriots Day (2016), Spies in Disguise (2019), The Courier (2020), and I\'m Your Woman (2020).\n\nOn stage, she made her Broadway debut in the 2013 revival of the Clifford Odets play The Big Knife. She played Desdemona in the 2016 off-Broadway production of Othello and returned to Broadway in the 2023 revival of the Lorraine Hansberry play The Sign in Sidney Brustein\'s Window.\n\nDescription above from the Wikipedia article Rachel Brosnahan, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Milwaukee, Wisconsin, USA', '1990-07-12', NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:32', '2026-02-03 21:14:17');
INSERT INTO `cast_crew` VALUES (70, 'Nicholas Hoult', 'https://image.tmdb.org/t/p/original/nXm7XCaZm5qcEJq0cAQMVj315jv.jpg', 'actor', '1061474', 'Nicholas Caradoc Hoult (/hoʊlt/; born 7 December 1989) is an English actor. He has received several accolades, including nominations for a British Academy Film Award, two Golden Globes, and a Primetime Emmy Award.\n\nHis successful start in cinema came at the age of 11, when he portrayed Marcus in About a Boy (2002). Before that, he had appeared in minor television and film roles in British productions, having started acting at the age of three with his debut in Intimate Relations (1996). At 17, he played Tony Stonem in the British series Skins (2007–2008), a role that helped him transition from a child star to more complex, darker characters in the film industry, leading to success and critical recognition. It would not be until a decade later that he returned to television, portraying Emperor Peter III of Russia in The Great (2020–2023). His notable filmography includes A Single Man (2009), X-Men: First Class (2011), its sequels (2014–2019), Warm Bodies (2013), Jack the Giant Slayer (2013), Mad Max: Fury Road (2015), The Favourite (2018), The Menu (2022), Renfield (2023), The Order (2024), Juror No. 2 (2024), Nosferatu (2024), and Superman (2025). \n\nHoult has also made a name for himself as a voice actor, lending his voice to narrations, audiobooks, video games, and characters in animated films and series. His voice acting work includes narrating the audiobook Slam in 2007, portraying Elliot in the video game Fable III (2010), the voice of Ace in the animated film Underdogs (2013), his performance as Fiver in the British miniseries Watership Down (2018), and as Patrick in the adult stop-motion series Crossing Swords (2020–2021). Additionally, he voiced the character Jon Arbuckle in the animated film The Garfield Movie (2024). On stage, he starred in the play New Boy at the Trafalgar Theatre in London in 2009. He was included in the Forbes annual 30 Under 30 list in 2012. He is a member of the Academy of Motion Picture Arts and Sciences.\n\nDescription above from the Wikipedia article Nicholas Hoult, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Wokingham, England, UK', '1989-12-07', NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:32', '2026-02-03 21:14:18');
INSERT INTO `cast_crew` VALUES (71, 'Edi Gathegi', 'https://image.tmdb.org/t/p/original/dt8yMyycDlzxkjhmuuJJ4tXDbp4.jpg', 'actor', '1061474', 'Edi Mūe Gathegi (born March 10, 1979) is a Kenyan-American actor. He appeared as a recurring character, Dr. Jeffrey Cole (aka \"Big Love\"), in the television series House, as Cheese in the 2007 film Gone Baby Gone, as Laurent in the films Twilight and its sequel The Twilight Saga: New Moon, and as Darwin in X-Men: First Class. Gathegi also featured in the AMC series Into the Badlands as Baron Jacobee. He has also been a recurring character in the NBC television series The Blacklist as Matias Solomon, an operative for a covert organization. Gathegi reprised the role in the 2016–2017 season crime thriller, The Blacklist: Redemption. He has also played a leading role in Startup, a television drama series on Crackle. Since 2022, Gathegi has played engineer and entrepreneur Dev Ayesa in the Apple TV+ original science fiction space drama series For All Mankind. He is set to play the role of Mister Terrific in James Gunn\'s film Superman (2025).\n\nDescription above from the Wikipedia article Edi Gathegi, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Nairobi, Kenya', '1979-03-10', NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:33', '2026-02-03 21:14:20');
INSERT INTO `cast_crew` VALUES (72, 'Nathan Fillion', 'https://image.tmdb.org/t/p/original/q31mXXgnN5PsuIjEqaaAPvBDvHc.jpg', 'actor', '1061474', 'Nathan Fillion (born March 27, 1971) is a Canadian-American actor. He played the leading roles of Captain Malcolm \"Mal\" Reynolds on Firefly and its film continuation Serenity and Richard Castle on Castle. As of 2018, he stars as John Nolan on The Rookie and is an executive producer on the show as well as its spin-off series, The Rookie: Feds.\n\nFillion has acted in traditionally distributed films like Slither and Trucker, Internet-distributed films like Dr. Horrible\'s Sing-Along Blog, television soap operas, sitcoms, and theatre. His voice is featured in animation and video games, such as the Bungiegames Halo 3, Halo 3: ODST, Halo: Reach, Destiny, and Destiny 2, along with the 343 Industries game Halo 5: Guardians and the television series M.O.D.O.K. (2021).\n\nFillion first gained recognition for his work on One Life to Live in the contract role of Joey Buchanan, for which he was nominated for the Daytime Emmy Award for Outstanding Younger Actor in a Drama Series, as well as for his supporting role as Johnny Donnelly in the sitcom Two Guys and a Girl.\n\nDescription above from the Wikipedia article Nathan Fillion, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Edmonton, Alberta, Canada', '1971-03-27', NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:34', '2026-02-03 21:14:21');
INSERT INTO `cast_crew` VALUES (73, 'Kera Dacy', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '447365', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:34', '2026-02-04 11:45:32');
INSERT INTO `cast_crew` VALUES (74, 'Lars P. Winther', 'https://image.tmdb.org/t/p/original/JYh9xcd3YdmCYcJ5TuFoo40vOU.jpg', 'director', '447365', 'Lars P. Winther is a producer and assistant director. Winther is also the senior vice president of physical production at DC Studios.', 'Los Angeles, California, USA', '1969-08-30', NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:35', '2026-02-04 11:45:30');
INSERT INTO `cast_crew` VALUES (75, 'Cam Everson', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '1061474', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:36', '2026-02-03 21:14:33');
INSERT INTO `cast_crew` VALUES (76, 'James Edward Tilden', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '447365', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:36', '2026-02-04 11:45:31');
INSERT INTO `cast_crew` VALUES (77, 'Ryan J. Pezdirc', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '447365', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-22 09:25:37', '2026-02-04 11:45:30');
INSERT INTO `cast_crew` VALUES (78, 'Ranbir Kapoor', 'https://image.tmdb.org/t/p/original/ymYNHV9luwgyrw17NXHqbOWTQkg.jpg', 'actor', '781732', 'Ranbir Kapoor, born on September 28, 1982, in Mumbai, India, is a prominent actor in contemporary Hindi cinema. He hails from the illustrious Kapoor family, often regarded as Bollywood’s first family, which has shaped Indian cinema for generations. His grandfather Raj Kapoor was a legendary actor-director, and his father Rishi Kapoor was a celebrated actor, while his mother Neetu Singh is also a respected actress. This cinematic lineage gave Ranbir early exposure to the world of films and storytelling.\n\nRanbir was formally trained in acting at the Lee Strasberg Theatre & Film Institute in New York, which gave him a foundation in method acting. He made his Bollywood debut with “Saawariya” (2007), directed by Sanjay Leela Bhansali. Although the film didn’t perform well commercially, critics noticed his potential. He gained his first major commercial and critical success with “Wake Up Sid” (2009) and “Ajab Prem Ki Ghazab Kahani” (2009), showcasing his versatility in portraying both relatable and quirky characters.\n\nOver the years, Ranbir has built a reputation for choosing diverse roles. He has played everything from a troubled musician in “Rockstar” (2011) to a historical figure in “Besharam” (2013) and a gangster in “Barfi!” (2012), earning praise for his emotional depth and naturalistic style. His performances have won him multiple Filmfare Awards, India’s most prestigious film honours.\n\nApart from his acting, Ranbir is known for his charismatic personality and down-to-earth demeanour. Media and fans often highlight his humility despite fame. He has been linked romantically with high-profile actresses, most notably Deepika Padukone and is currently married to Alia Bhatt, another leading Bollywood star.\n\nRanbir Kapoor also carries a modern Bollywood image—blending artistic talent with commercial appeal, making him a favourite of both filmmakers and audiences. Outside the cinema, he supports charitable causes and is admired for his fashion sense, often setting trends in the Indian entertainment industry.\n\nIn essence, Ranbir Kapoor represents a blend of legacy, talent, and contemporary charm, making him one of the most influential actors of his generation in India. For anyone trying to understand modern Bollywood, Ranbir Kapoor is a name that defines both innovation and tradition in acting.', 'Mumbai, Maharashtra, India', '1982-09-28', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:00', '2025-12-05 14:10:21');
INSERT INTO `cast_crew` VALUES (79, 'Rashmika Mandanna', 'https://image.tmdb.org/t/p/original/c1wQq0OAzU9nFhGYn4iOoi7dmqD.jpg', 'actor', '781732', 'Rashmika Mandanna is an Indian actress who has quickly become one of the most prominent stars across Kannada, Telugu, Tamil and Hindi cinema. She made her debut with the hit Kirik Party (2016) in Kannada and soon became a leading name in Telugu films with Geetha Govindam (2018). Her performance as \"Srivalli\" in the pan Indian blockbuster Pushpa series brought her nationwide fame. Expanding into Bollywood, she starred in Animal (2023) and Chhaava (2025), further cementing her cross industry appeal.\n\nRashmika has received multiple awards, including the Filmfare Award.', 'Virajpet, Karnataka, India', '1996-04-05', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:01', '2025-09-23 10:30:01');
INSERT INTO `cast_crew` VALUES (80, 'Anil Kapoor', 'https://image.tmdb.org/t/p/original/6RcrXGFzO50Tazqc8tbDlzYKvTd.jpg', 'actor', '781732', 'Living in a Chawl in Tilak Nagar, Punjabi-speaking Anil was born in 1959 to Surinder and Nirmal aka Suchitra Kapoor. He has an elder brother, Boney, a sister, Reena, and a younger brother, Sanjay. His dad used to be Shammi Kapoor\'s Secretary.\n\nA loner, without many friends, he studied in the nearby O.L.P.S. (Our Lady of Perpetual Succor) School, and was an ardent fan of Bollywood flicks that were telecast during the Ganesh Maha Utsav every year. He was a fan of Raj Kapoor, and it was this that influenced his acting, and people saw him as a mimic of the legendary showman. He landed a role as a child artiste with Shashi Kapoor in the lead, but the movie (Tu Payal Main Geet) was never released.\n\nAfter school, he went to study in St. Xaviers College. He commuted by bus and train from Chembur to Bombay V.T., and the walked the rest of the way. It was here that he met Mazhar Khan. A distracted Anil was kicked out of College in the second year due to his lack of presence. His attempts to join the Pune Film Institute were in vain, as he failed in the written examination. He then decided to join Roshan Taneja\'s Acting school.\n\nHe first appeared on the silver screen in Hamhare Tumhare in a character role. His first lead role was in \'Woh 7 Din\' and from thence on there has been no looking back. He has acted in close to a 100 movies, and has 5 in production. He has produced two movies (Gandhi My Father & Badhaai Ho Badhaai), as well as been a Casting Director/Outdoor In charge for \'Hum Paanch\'.\n\nKapoor\'s first role in an international film was in Danny Boyle\'s 2008 Academy Award-winning film Slumdog Millionaire, for which he shared the Screen Actors Guild Award for Outstanding Performance by a Cast in a Motion Picture. His performance in the eighth season of the action series 24 generated rave reviews from the American press Globally, Anil Kapoor is one of the most recognized Indian actors.\n\nAnil met wealthy and chic model, Sindhi-speaking Sunita Bhambhani, and married her in 1984. Since then they have given birth to 3 children, kapoor has two daughters and a son Harshwardhan Kapoor.Kapoor\'s elder daughter is actress Sonam Kapoor. Rhea Kapoor attended school in New York and is now a producer in Mumbai.', 'Mumbai, Maharashtra, India', '1956-12-24', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:02', '2025-09-23 10:30:02');
INSERT INTO `cast_crew` VALUES (81, 'Bobby Deol', 'https://image.tmdb.org/t/p/original/2npVa3PduichY8e7qBiE54m9VVP.jpg', 'actor', '781732', 'Bobby Deol (born January 27, 1969) is an Indian film actor who works in Hindi films. In a career spanning more than two decades, he has appeared in over forty films and is the recipient of a Filmfare Award and a Filmfare Best Actor Award nomination. He is the son of Dharmendra and the brother of Sunny Deol, also a successful actor in the Indian Film Industry. He is particularly noted for acting in several thriller films, often playing antiheroic characters who are forced to commit crimes to avenge the deaths of loved ones and his films commonly involve themes of jealousy, deceit, revenge and romantic thrillers often involving him caught in love triangles.\n\nDeol briefly appeared as a child actor in the film Dharam Veer in 1977 and made his acting debut as an adult in Barsaat (1995) which garnered him the Filmfare Best Debut Award.  In addition to acting in films, Deol is involved with several humanitarian causes and has participated in concert tours and stage shows.', 'Mumbai, Maharashtra, India', '1969-01-27', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:03', '2025-09-23 10:30:03');
INSERT INTO `cast_crew` VALUES (82, 'Triptii Dimri', 'https://image.tmdb.org/t/p/original/bAwn2jF0X67qUzmO27X34THLJ4w.jpg', 'actor', '781732', 'Triptii Dimri is an Indian actress whose talent was discovered by Sajid Ali which gave her, her breakthrough role with the classic love story ‘Laila Majnu’ (2018) where she played the role of “Laila.” She was fascinated by the glamorous life since the start and thus, started her career as a model.', 'Rudraprayag, Uttarakhand, India', '1994-02-23', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:04', '2025-09-23 10:30:04');
INSERT INTO `cast_crew` VALUES (83, 'Sandeep Reddy Vanga', 'https://image.tmdb.org/t/p/original/z8r0OaemVOQCOP2h3DeWYdVkD8G.jpg', 'director', '781732', 'Sandeep Reddy Vanga is an Indian film director and screenwriter based in Telugu and Hindi cinema. He made his directorial debut with Arjun Reddy (2017), which he subsequently remade in Hindi as Kabir Singh. Both films were largely successful but controversial among critics, earning Vanga notoriety in the industry. He then went on to direct Animal (2023), which attracted increased controversy but became the highest-grossing A-rated Indian film of all time. Themes of masculinity and sexuality feature prominently in Vanga\'s work.', 'Warangal, Telangana, India', '1988-11-23', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:05', '2025-09-23 10:30:05');
INSERT INTO `cast_crew` VALUES (84, 'Anmol Raina', 'http://fiveflix.test/default-image/Default-Image.jpg', 'director', '781732', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:07', '2025-12-05 14:10:26');
INSERT INTO `cast_crew` VALUES (85, 'Mariya Doma', 'http://fiveflix.test/default-image/Default-Image.jpg', 'director', '781732', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:07', '2025-12-05 14:10:25');
INSERT INTO `cast_crew` VALUES (86, 'Imran Khan', 'https://image.tmdb.org/t/p/original/1LAZWVBxzB3L5vKfwAeTSYaqSox.jpg', 'actor', '40777', 'Imran Khan is an Indian American film actor. He is the nephew of actor Aamir Khan and producer-director Mansoor Khan. Khan gained popularity for his role in the 2008 film Jaane Tu... Ya Jaane Na.', 'Madison, Wisconsin, USA', '1983-01-13', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:19', '2025-09-23 10:30:19');
INSERT INTO `cast_crew` VALUES (87, 'Sonam Kapoor Ahuja', 'https://image.tmdb.org/t/p/original/p5A2rzbCs9ZlgxVgJ6zGtHNUzaq.jpg', 'actor', '40777', 'Sonam Kapoor is an Indian actress who appears in Bollywood films and daughter of actor Anil Kapoor. Kapoor studied theatre and arts at the United World College of South East Asia in Singapore. She was an assistant director to Sanjay Leela Bhansali on the 2005 film Black.\n\nKapoor made her acting debut in Bhansali\'s romantic drama Saawariya (2007), which earned her a nomination for the Filmfare Award for Best Female Debut. After a series of commercial failures, the sleeper hit Raanjhanaa (2013) marked a turning point in her career, earning her several Best Actress nominations.', 'Mumbai, Maharashtra, India', '1985-06-09', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:19', '2025-09-23 10:30:19');
INSERT INTO `cast_crew` VALUES (88, 'Sammir Dattani', 'https://image.tmdb.org/t/p/original/3FxU6Yhf1t2XFBIvUb56iL3FdPl.jpg', 'actor', '40777', 'From Wikipedia, the free encyclopedia.\n\nSammir Dattani (Gujarati) also known as Dhyan(in Kannada film industry) is an Indian film actor who acts in Bollywood and Kannada films.\n\nDescription above from the Wikipedia article Sammir Dattani, licensed under CC-BY-SA, full list of contributors on Wikipedia', 'Bombay, Maharashtra, India', '1982-01-27', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:22', '2025-09-23 10:30:22');
INSERT INTO `cast_crew` VALUES (89, 'Samir Soni', 'https://image.tmdb.org/t/p/original/dwQDVAzcjexg1HCDBeGEW0MoPth.jpg', 'actor', '40777', 'From Wikipedia, the free encyclopedia.\n\nSamir Soni (born 29 September 1968) is an Indian actor and a model who appears in Bollywood films.\n\nDescription above from the Wikipedia article Samir Soni, licensed under CC-BY-SA, full list of contributors on Wikipedia', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:23', '2025-09-23 10:30:23');
INSERT INTO `cast_crew` VALUES (90, 'Bruna Abdullah', 'https://image.tmdb.org/t/p/original/pwKRDCRK3cHQ2fxkxjNXvJfTsSB.jpg', 'actor', '40777', 'Bruna Abdullah is a Brazilian actress, working in Bollywood.\n\nAbdullah\'s first video was with Shekhar Suman in his debut album Mere Gham Ke Dayare Mein. She performed the item song \"Rehem Kare\" for Anubhav Sinha\'s Cash.  Abdullah played the role of \"Mary\" in the adult comedy film Grand Masti and Giselle in Punit Malhotra\'s I Hate Luv Storys (2010). She has also starred in the 2012 Tamil movie Billa II.\n\nBruna was born in Porto Alegre, Brazil. to a father of Lebanese descent and a mother of Italian-Portuguese ancestry, and is the first of two children. She came to India as a tourist and began working as an Actress. Changing her base to Mumbai from Brazil in order to set her career. She appeared in several advertising commercials for IndusInd Bank Reebok Fiama di Wills and many more.', 'Porto Alegre, Rio Grande do Sul, Brazil', '1986-10-24', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:24', '2025-09-23 10:30:24');
INSERT INTO `cast_crew` VALUES (91, 'Prabhas', 'https://image.tmdb.org/t/p/original/6naZ3oybdCtfggc5pTrcBDxOXrP.jpg', 'actor', '770906', 'Uppalapati Venkata Satyanarayana Prabhas Raju known mononymously as Prabhas, is an Indian actor who works predominantly in Telugu films. Prabhas made his screen debut with the 2002 Telugu action drama film Eeswar. He has garnered the state Nandi Award for Best Actor, for his role in Mirchi. Prabhas is the first south Indian actor to have his wax sculpture at Madame Tussaud\'s wax museum.', 'Chennai, Tamil Nadu, India', '1979-10-23', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:31', '2025-09-23 10:30:31');
INSERT INTO `cast_crew` VALUES (92, 'Prithviraj Sukumaran', 'https://image.tmdb.org/t/p/original/1xhG42QU8tMQRTDdP1Ed3y9GRvm.jpg', 'actor', '770906', 'Prithviraj Sukumaran (born October 16, 1982) is an acclaimed Malayalam actor, director, producer, and playback singer, known for seamlessly balancing stardom with critically acclaimed performances. Making his debut at 19 in Nandanam (2002), he quickly rose to prominence as one of the most versatile and daring actors of his generation.\n\nThrough the 2000s, Prithviraj delivered a string of memorable films such as Vellithira (2003), Swapnakoodu (2003), Vellinakshatram (2004), Ananthabhadram (2005), Classmates (2006,Highest grossing Malayalam movie at time of release), Vaasthavam (2006), Chocolate (2007), Thalappavu (2008), Thirakkatha (2008), Puthiya Mukham (2009,Catapulted Prithviraj to Superstardom) , Robin Hood (2009), Thanthonni (2010), Pokkiri Raja (2010) and Anwar (2010), showcasing his ability to shift between commercial and experimental cinema.\n\nHe later headlined some of Malayalam cinema’s biggest hits and acclaimed dramas: Urumi (2011), Indian Rupee (2011), Ayalum Njanum Thammil (2012), Mumbai Police (2013), Memories (2013), 7th Day (2014), Sapthamashree Thaskaraha (2014) , Ennu Ninte Moideen (2015), Amar Akbar Anthony (2015), Anarkali (2015), Paavada (2016), Ezra (2017), Koode (2018), Driving Licence (2019), Ayyappanum Koshiyum (2020), Jana Gana Mana (2022) and The Goat Life (2024), among others.\n\nOutside acting, Prithviraj has proven his mettle as a filmmaker with the hit Lucifer (2019), starring Mohanlal, which became one of Malayalam cinema’s biggest boxoffice successes. His third directorial L2: Empuraan (2025) is the current highest grossing Malayalam movie. He owns a production banner, Prithviraj Productions which continues to back ambitious projects.\n\nWith over two decades in cinema, a National award, multiple Kerala State Film Awards, and a filmography that bridges commercial blockbusters and auteur driven cinema, Prithviraj Sukumaran stands as one of the defining forces of contemporary Malayalam cinema.', 'Trivandrum, Kerala, India', '1982-10-16', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:31', '2025-09-23 10:30:31');
INSERT INTO `cast_crew` VALUES (93, 'Shruti Haasan', 'https://image.tmdb.org/t/p/original/1zYJuSccSA45VVBdgozpRcL99Rd.jpg', 'actor', '770906', 'Shruti Haasan is an Indian actress, singer and music composer who has worked in South Indian film industry and Bollywood. Her parents are noted actors, Kamal Haasan and Sarika. As a child artist, she sang in films and appeared in a guest role, before making her adult acting debut in the 2009 action drama, Luck. She later went on to win critical acclaim for her role in the Walt Disney fantasy film, Anaganaga O Dheerudu, Oh My Friend and 7aam Arivu. In 2012, she starred in Gabbar Singh, Telugu remake of Dabangg.  She has also continued her stint in music through work as a singer in Indian languages, a career in music direction beginning with her father\'s production Unnaipol Oruvan and her own music band and album', 'Chennai, Tamil Nadu, India', '1986-01-28', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:32', '2025-09-23 10:30:32');
INSERT INTO `cast_crew` VALUES (94, 'Easwari Rao', 'https://image.tmdb.org/t/p/original/fjyvQ45YZcovy2Egj2eux8UiuHU.jpg', 'actor', '770906', 'Easwari Rao is an Indian actress, who has worked in Tamil, Telugu, Kannada and Malayalam film industries, predominantly in the 1990s.\n\nEeswari is originally from Rajahmundry but she is settled in Chennai. She is married to director L.Raja. Easwari Rao\'s debut project was Kavithai Paadum Alaigal (1990) an obscure early 90\'s Tamil Film which never got released in theatres. She got her first major break in Raman Abdullah (1997), directed by Balu Mahendra. Offers poured in for the actress though she became selective and notably opted out of a project title Koottaali, as she felt the role was too glamorous. She went on to appear in Manoj Kumar\'s film, Guru Paarvai (1998) alongside Prakash Raj, Kushboo and Anju Aravind. Eeshwari also bagged a role in Bharathiraja\'s Siragugal Murivadhilai with Napoleon, although the film subsequently was shelved after pre-production. In Appu (2000) Tamil film she portrayed as Prasanth\'s Sister. Now she is into character artist roles in Telugu movies.Her role in 2018 Tamil film Kaala make her strong comeback to Tamil Cinema in which she played character called Selvi as Rajinikanth\'s wife.', 'East Godavari, Andhra Pradesh, India', '1973-06-13', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:33', '2025-09-23 10:30:33');
INSERT INTO `cast_crew` VALUES (95, 'Jagapati Babu', 'https://image.tmdb.org/t/p/original/bm72k6FmDxhxtZsl1xvxoz88Hkm.jpg', 'actor', '770906', 'Jagapati Babu is an Indian film actor known for his works in Telugu cinema, few Tamil films and in a Kannada film. He has received seven Andhra Pradesh state Nandi Awards.', 'Machilipatnam, Andhra Pradesh, India', '1962-02-12', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:34', '2025-09-23 10:30:34');
INSERT INTO `cast_crew` VALUES (96, 'Prashanth Neel', 'https://image.tmdb.org/t/p/original/oq6ydaurgC4NueXuo64R5QoFnfp.jpg', 'director', '770906', 'Prashanth Neel is an Indian film director who works in Kannada cinema. He made his debut with the 2014 film, Ugramm starring Sriimurali that emerged as a blockbuster and all-time box office hit, and followed it up with the Kannada magnum opus KGF, which he has written and directed.', 'Bengaluru, Karnataka, India', '1980-06-04', NULL, 1, 1, NULL, NULL, '2025-09-23 10:30:35', '2025-09-23 10:30:35');
INSERT INTO `cast_crew` VALUES (97, 'Leonardo DiCaprio', 'https://image.tmdb.org/t/p/original/wo2hJpn04vbtmh0B9utCFdsQhxM.jpg', 'actor', '27205', 'Leonardo Wilhelm DiCaprio (born November 11, 1974) is an American actor and film producer. Known for his work in biopics and period films, DiCaprio is the recipient of numerous accolades, including an Academy Award, a British Academy Film Award, and three Golden Globe Awards. As of 2019, his films have grossed over $7.2 billion worldwide, and he has been placed eight times in annual rankings of the world\'s highest-paid actors.\n\nBorn in Los Angeles, DiCaprio began his career in the late 1980s by appearing in television commercials. In the early 1990s, he had recurring roles in various television shows, such as the sitcom Parenthood, and had his first major film part as author Tobias Wolff in This Boy\'s Life (1993). At age 19, he received critical acclaim and his first Academy Award and Golden Globe Award nominations for his performance as a developmentally disabled boy in What\'s Eating Gilbert Grape (1993). He achieved international stardom with the star-crossed romances Romeo + Juliet (1996) and Titanic (1997).\n\nAfter the latter became the highest-grossing film at the time, he reduced his workload for a few years. In an attempt to shed his image of a romantic hero, DiCaprio sought roles in other genres, including crime drama in Catch Me If You Can (2002) and Gangs of New York (2002); the latter marked the first of his many successful collaborations with director Martin Scorsese. DiCaprio portrayed Howard Hughes in The Aviator (2004) and received acclaim for his performances in the political thriller Blood Diamond (2006), the crime drama The Departed (2006), and the romantic drama Revolutionary Road (2008).\n\nIn the following decade, DiCaprio starred in several high-profile directors\' projects, including the science fiction thriller Inception (2010), the western Django Unchained (2012), the biopic The Wolf of Wall Street (2013), the survival drama The Revenant (2015), for which he won an Academy Award and a BAFTA Award for Best Actor in a Leading Role, and the comedy-drama Once Upon a Time in Hollywood (2019), all of which were critical and commercial successes.\n\nDiCaprio is the founder of Appian Way Productions, a production company that has produced some of his films and the documentary series Greensburg (2008–2010), and the Leonardo DiCaprio Foundation, a nonprofit organization devoted to promoting environmental awareness. He regularly supports charitable causes and has produced several documentaries on the environment. In 2005, he was named a Commander of the Ordre des Arts et des Lettres for his contributions to the arts, and in 2016, he appeared in Time magazine\'s 100 most influential people in the world.', 'Los Angeles, California, USA', '1974-11-11', NULL, 1, 1, NULL, NULL, '2025-09-23 11:15:04', '2025-10-13 04:06:00');
INSERT INTO `cast_crew` VALUES (98, 'Joseph Gordon-Levitt', 'https://image.tmdb.org/t/p/original/z2FA8js799xqtfiFjBTicFYdfk.jpg', 'actor', '27205', 'Joseph Leonard Gordon-Levitt (born February 17, 1981) is an American actor and filmmaker. He has received various accolades, including nominations for the Golden Globe Award for Best Actor – Motion Picture Musical or Comedy for his leading performances in 500 Days of Summer (2009) and 50/50 (2011). He is the founder of the online media platform HitRecord whose projects such as HitRecord on TV (2014–15) and Create Together (2020) won him two Primetime Emmy Awards in the category of Outstanding Interactive Program.\n\nBorn in Los Angeles to a Jewish family, Gordon-Levitt began his acting career as a child, appearing in the films A River Runs Through It (1992), Holy Matrimony (1994), and Angels in the Outfield (1994), which earned him a Young Artist Award and a Saturn Award nomination. He played the role of Tommy Solomon in the TV series 3rd Rock from the Sun (1996–2001) for which he received three nominations at the Screen Actors Guild Awards. He had a supporting role in 10 Things I Hate About You (1999) and voiced Jim Hawkins in the Disney animated Treasure Planet (2002) before taking a break from acting to study at Columbia University, but dropped out in 2004 to resume his acting career.\n\nSince returning to acting, Gordon-Levitt has starred in Manic (2001), Mysterious Skin (2004), Brick (2005), The Lookout (2007), The Brothers Bloom (2008), Miracle at St. Anna (2008), G.I. Joe: The Rise of Cobra (2009), Inception (2010), Hesher (2010), Premium Rush (2012), The Dark Knight Rises (2012), Looper (2012), and Lincoln (2012). He portrayed Philippe Petit in the Robert Zemeckis-directed film The Walk (2015) and whistleblower Edward Snowden in the Oliver Stone film Snowden (2016). In 2020, he starred in the legal drama The Trial of the Chicago 7, for which he won the Critics\' Choice Movie Award for Best Acting Ensemble and the Screen Actors Guild Award for Outstanding Performance by a Cast in a Motion Picture.\n\nIn 2013, he wrote and directed Don Jon, a comedy-drama film that was released to critical acclaim, earning him an Independent Spirit Award nomination for Best First Screenplay. He previously directed and edited two short films, both of which were released in 2010: Morgan M. Morgansen\'s Date with Destiny and Morgan and Destiny\'s Eleventeenth Date: The Zeppelin Zoo. In 2021, he wrote, directed and starred in a comedy drama series Mr. Corman on Apple TV+.', 'Los Angeles, California, USA', '1981-02-17', NULL, 1, 1, NULL, NULL, '2025-09-23 11:15:05', '2025-12-05 14:42:33');
INSERT INTO `cast_crew` VALUES (99, 'Ken Watanabe', 'https://image.tmdb.org/t/p/original/w2t30L5Cmr34myAaUobLoSgsLfS.jpg', 'actor', '27205', 'Ken Watanabe (born October 21, 1959) is a Japanese stage, film, and television actor. To English-speaking audiences he is known for playing tragic hero characters, such as General Tadamichi Kuribayashi in Letters from Iwo Jima and Lord Katsumoto Moritsugu in The Last Samurai, for which he was nominated for the Academy Award for Best Supporting Actor. Among other awards, he has won the Japan Academy Prize for Best Actor twice, in 2007 for Memories of Tomorrow and in 2010 for Shizumanu Taiyō. He is also known for his roles in director Christopher Nolan\'s Hollywood blockbusters Batman Begins and Inception.', 'Uonuma, Niigata, Japan', '1959-10-21', NULL, 1, 1, NULL, NULL, '2025-09-23 11:15:06', '2025-10-13 04:06:01');
INSERT INTO `cast_crew` VALUES (100, 'Tom Hardy', 'https://image.tmdb.org/t/p/original/yQZKb2ED7muJJmwghlGzgDRAVVr.jpg', 'actor', '27205', 'Edward Thomas Hardy CBE (born 15 September 1977) is an English actor, producer, writer and former model. After studying acting at the Drama Centre London, he made his film debut in Ridley Scott\'s Black Hawk Down (2001). He has since been nominated for the Academy Award for Best Supporting Actor, two Critics\' Choice Movie Awards and two British Academy Film Awards, receiving the 2011 BAFTA Rising Star Award.\n\nHardy has also appeared in films such as Star Trek: Nemesis (2002), RocknRolla (2008), Bronson (2008), Warrior (2011), Tinker Tailor Soldier Spy (2011), Lawless (2012), This Means War (2012), Locke (2013), The Drop (2014), and The Revenant (2015), for which he received a nomination for an Academy Award. In 2015, he portrayed \"Mad\" Max Rockatansky in Mad Max: Fury Road and both Kray twins in Legend. He has appeared in three Christopher Nolan films: Inception (2010) as Eames, The Dark Knight Rises (2012) as Bane, and Dunkirk (2017) as an RAF fighter-pilot. He starred as both Eddie Brock and Venom in the 2018 anti-hero film Venom and its sequel Venom: Let There Be Carnage (2021).\n\nHardy\'s television roles include the HBO war drama mini-series Band of Brothers (2001), the BBC historical drama mini-series The Virgin Queen (2005), Bill Sikes in the BBC\'s mini-series Oliver Twist (2007), Heathcliff in ITV\'s Wuthering Heights (2009), the Sky 1 drama series The Take (2009), and as Alfie Solomons in the BBC historical crime drama series Peaky Blinders (2014–present). He created, co-produced, and took the lead in the eight-part historical fiction series Taboo (2017) on BBC One and FX. In 2020, he also contributed narration work to the Amazon docuseries All or Nothing: Tottenham Hotspur.\n\nHardy has performed on both British and American stages. He was nominated for the Laurence Olivier Award for Most Promising Newcomer for his role as Skank in the production of In Arabia We\'d All Be Kings (2003), and was awarded the 2003 Evening Standard Theatre Award for Outstanding Newcomer for his performances in both In Arabia We\'d All Be Kings and Blood, in which he played Luca. He starred in the production of The Man of Mode (2007) and received positive reviews for his role in the play The Long Red Road (2010). Hardy is active in charity work and is an ambassador for the Prince\'s Trust. He was appointed a CBE in the 2018 Birthday Honours for services to drama.\n\nDescription above from the Wikipedia article Tom Hardy, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Hammersmith, London, England, UK', '1977-09-15', NULL, 1, 1, NULL, NULL, '2025-09-23 11:15:06', '2025-12-05 14:42:34');
INSERT INTO `cast_crew` VALUES (101, 'Elliot Page', 'https://image.tmdb.org/t/p/original/eCeFgzS8dYHnMfWQT0oQitCrsSz.jpg', 'actor', '27205', 'Elliot Page (formerly  Ellen Page, born February 21, 1987) is a Canadian actor, producer, and activist.\n\nHe first became known for his role in the series Pit Pony (1997–2000), for which he won a Young Artist Award, and for his recurring roles in Trailer Park Boys (2002) and ReGenesis (2004). He then received recognition for his role in the film Hard Candy (2005) and won the Austin Film Critics Association\'s Award for Best Actress. Page had his breakthrough with the title role in Jason Reitman\'s film Juno (2007), earning nominations for an Academy Award, a BAFTA Award, a Critics\' Choice Awards, a Golden Globe Award, and a Screen Actors Guild Award. He also earned praise for his roles in The Tracey Fragments (2007), Whip It (2009), Super (2010), Inception (2010), and Tallulah (2016). He has also portrayed Kitty Pryde in two X-Men films (2006, 2014), and had voice roles in the films Window Horses (2016) and My Life as a Zucchini (2016). In 2017, Page was cast as Vanya Hargreeves in the Netflix series The Umbrella Academy (2019–2024). He provided the voice, motion capture, and likeness of Jodie Holmes in the video game Beyond: Two Souls (2013). He produced the film Freeheld (2015), in which he also starred, and made his directorial debut with the documentary There\'s Something in the Water (2019).\n\nOn December 1, 2020, Page came out as transgender on his social media accounts, specified his pronouns as he/him and they/them, and revealed his new name, Elliot Page.', 'Halifax, Nova Scotia, Canada', '1987-02-21', NULL, 1, 1, NULL, NULL, '2025-09-23 11:15:07', '2025-12-05 14:42:35');
INSERT INTO `cast_crew` VALUES (102, 'Lin Oeding', 'https://image.tmdb.org/t/p/original/hSSZhIHFAF0iaYrtAnLjjPkgkM2.jpg', 'director', '27205', 'After graduating high school, Lin attended The University of Texas at Austin where he received a BFA in Screenwriting and Film Directing.  As a result of his background in mixed martial arts and gymnastics, Lin simultaneously pursued a career in stunts to expand his on-set knowledge of filmmaking.\n\nWith credits on over 100 features and television shows such as \"Inception\", \"Dark Knight Rises\", \"Transformers\", \"Pirates of the Caribbean\", \"Fast & Furious\", “Star Trek” and “Collateral”, Lin\'s background in action has given him the opportunity to study under many of the best directors in the business.', 'Sacramento, California, USA', '1977-08-09', NULL, 1, 1, NULL, NULL, '2025-09-23 11:15:09', '2025-10-13 04:06:04');
INSERT INTO `cast_crew` VALUES (103, 'Kevin Frilet', 'http://fiveflix.test/default-image/Default-Image.jpg', 'director', '27205', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-23 11:15:10', '2025-12-05 14:42:37');
INSERT INTO `cast_crew` VALUES (104, 'Peres Owino', 'http://fiveflix.test/default-image/Default-Image.jpg', 'director', '27205', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-23 11:15:10', '2025-12-05 14:42:38');
INSERT INTO `cast_crew` VALUES (105, 'Keanu Reeves', 'https://image.tmdb.org/t/p/original/8RZLOyYGsoRe9p44q3xin9QkMHv.jpg', 'actor', '541671', 'Keanu Charles Reeves is a Canadian actor. Reeves is known for his roles in Bill & Ted\'s Excellent Adventure, Speed, Point Break, and The Matrix franchise as Neo.\n\nHe has collaborated with major directors such as Stephen Frears (in the 1988 period drama Dangerous Liaisons); Gus Van Sant (in the 1991 independent film My Own Private Idaho); and Bernardo Bertolucci (in the 1993 film Little Buddha). Referring to his 1991 film releases, The New York Times\' critic, Janet Maslin, praised Reeves\' versatility, saying that he \"displays considerable discipline and range. He moves easily between the buttoned-down demeanor that suits a police procedural story and the loose-jointed manner of his comic roles.\" A repeated theme in roles he has portrayed is that of saving the world, including the characters of Ted Logan, Buddha, Neo, Johnny Mnemonic, John Constantine and Klaatu.', 'Beirut, Lebanon', '1964-09-02', NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:00', '2026-02-04 11:35:26');
INSERT INTO `cast_crew` VALUES (106, 'Laurence Fishburne', 'https://image.tmdb.org/t/p/original/2GbXERENPpl5MmlqOLlPVaVtifD.jpg', 'actor', 'tt0133093', 'Laurence John Fishburne III (born July 30, 1961) is an American actor. He is a three-time Emmy Award and Tony Award winner known for his roles on stage and screen. He has frequently portrayed forceful, militant, and authoritative characters. Some of Fishburne\'s best-known roles are Morpheus in The Matrix series (1999–2003), Jason \"Furious\" Styles in the John Singleton drama film Boyz n the Hood (1991), Tyrone \"Mr. Clean\" Miller in Francis Ford Coppola\'s war film Apocalypse Now (1979), and \"The Bowery King\" in the John Wick film series (2017–present).\n\nFor his portrayal of Ike Turner in What\'s Love Got to Do with It (1993), Fishburne was nominated for an Academy Award for Best Actor. He won a Tony Award for Best Featured Actor in a Play for his performance in Two Trains Running (1992) and an Emmy Award for Outstanding Guest Actor in a Drama Series for his performance in TriBeCa (1993). Fishburne became the first African American to portray Othello on film when he appeared in Oliver Parker\'s 1995 film adaptation of the Shakespeare play. He has also received five Screen Actors Guild Award nominations. He received an Independent Spirit Award for Best Male Lead nomination for his performance in Deep Cover (1992).\n\nOther film credits of Fishburne include Steven Spielberg\'s The Color Purple (1985), Spike Lee\'s School Daze (1988), Abel Ferrara\'s King of New York (1990), Clint Eastwood\'s Mystic River (2003), Steven Soderbergh\'s Contagion (2011), and Richard Linklater\'s Last Flag Flying (2017). He has also gained a wider audience with the blockbuster films Man of Steel (2013), Batman v Superman: Dawn of Justice (2016), and Ant-Man and the Wasp (2018). On television, he starred as Dr. Raymond Langston on the CBS crime drama CSI: Crime Scene Investigation (2008–2011) and as Special Agent Jack Crawford in the NBC thriller series Hannibal (2013–2015), and had a recurring role as Earl \"Pops\" Johnson in the ABC sitcom Black-ish (2014–2022).', 'Augusta, Georgia, USA', '1961-07-30', NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:01', '2025-09-24 08:02:01');
INSERT INTO `cast_crew` VALUES (107, 'Carrie-Anne Moss', 'https://image.tmdb.org/t/p/original/gc7JwuLDD0kXHUlGx5vWzdlqSIT.jpg', 'actor', 'tt0133093', 'Carrie-Anne Moss (born August 21, 1967) is a Canadian actress. After early roles on television, she rose to international prominence for her role of Trinity in The Matrix franchise. She has starred in Memento (2000) for which she won the Independent Spirit Award for Best Supporting Female, Red Planet (2000), Chocolat (2000), Fido (2006), Snow Cake (2006) for which she won the Genie Award for Best Performance by an Actress in a Supporting Role, Disturbia (2007), Unthinkable (2010), Silent Hill: Revelation (2012), and Pompeii (2014). She also portrayed Jeri Hogarth in several television series produced by Marvel Television for Netflix, most notably Jessica Jones (2015–2019).', 'Burnaby, British Columbia, Canada', '1967-08-21', NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:03', '2025-09-24 08:02:03');
INSERT INTO `cast_crew` VALUES (108, 'Hugo Weaving', 'https://image.tmdb.org/t/p/original/t4ScpYIHlXVD41scEyiGdQDYflX.jpg', 'actor', 'tt0133093', 'Hugo Wallace Weaving AO (born 4 April 1960) is an English actor. Born in Colonial Nigeria to English parents, he has resided in Australia for the entirety of his career. He is the recipient of six Australian Academy of Cinema and Television Arts Awards (AACTA) and has also been recognised as an Honorary Officer of the Order of Australia.\n\nWeaving landed his first major role as English cricket captain Douglas Jardine on the Australian television series Bodyline (1984). Continuing to act in Australia, he rose to prominence with his appearances in the films Proof (1991) and The Adventures of Priscilla, Queen of the Desert (1994), winning his first AACTA Award for Best Actor in a Leading Role with the former. By the turn of the millennium, Weaving achieved international recognition through appearances in mainstream American productions. His most notable film roles include Agent Smith in the first three The Matrix films (1999–2003), Elrond in The Lord of the Rings (2001–2003) and The Hobbit (2012–2014) trilogies, the title character in V for Vendetta (2005), and Johann Schmidt / Red Skull in the Marvel Cinematic Universe (MCU) film Captain America: The First Avenger (2011).\n\nIn addition to his live action appearances, Weaving has had several voice over roles, including in the films Babe (1995), Happy Feet (2006) and Happy Feet Two (2011), and the Transformers series as Megatron (2007–2011). He also reprised his roles of Agent Smith and Elrond in Matrix and Lord of the Rings video game adaptations.', 'Ibadan, Nigeria', '1960-04-04', NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:04', '2025-09-24 08:02:04');
INSERT INTO `cast_crew` VALUES (109, 'Gloria Foster', 'https://image.tmdb.org/t/p/original/AriGXtC9fjBOia9Zr8CZjn4o3rx.jpg', 'actor', 'tt0133093', 'Gloria Foster (November 15, 1933 – September 29, 2001) was an American actress, most known for her stage performances both on and off Broadway, including her acclaimed roles in plays In White America and Having Our Say, winning three Obie Awards during her career.\n\nIn films, she was perhaps best known as the Oracle in The Matrix (1999) and The Matrix Reloaded (2003), the latter film being her last. Gloria Foster also played the role of the mother of Yusef Bell in the mini series The Atlanta Child Murders which aired in 1985.', 'Chicago, Illinois, USA', '1933-11-15', NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:04', '2025-09-24 08:02:04');
INSERT INTO `cast_crew` VALUES (110, 'Yuen Woo-Ping', 'https://image.tmdb.org/t/p/original/4NJRnQGrUxqbq9tcl7cpKmd17zh.jpg', 'director', 'tt0133093', 'Yuen Woo-ping (Chinese: 袁和平; pinyin: Yuán Hépíng; alias: Yuen Wo-ping; born 1945) is a Hong Kong martial arts choreographer and film director who worked in Hong Kong action cinema and later Hollywood films. He is one of the inductees on the Avenue of Stars in Hong Kong. Yuen is also a son of Yuen Siu-tien, a martial arts film actor.', 'Shenzhen, Guangdong, China', '1945-01-01', NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:05', '2025-09-24 08:02:05');
INSERT INTO `cast_crew` VALUES (111, 'Tom Read', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0133093', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:06', '2025-09-24 08:02:06');
INSERT INTO `cast_crew` VALUES (112, 'Noni Roy', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0133093', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:08', '2025-09-24 08:02:08');
INSERT INTO `cast_crew` VALUES (113, 'Paul Sullivan', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0133093', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:09', '2025-09-24 08:02:09');
INSERT INTO `cast_crew` VALUES (114, 'Toby Pease', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0133093', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 08:02:10', '2025-09-24 08:02:10');
INSERT INTO `cast_crew` VALUES (115, 'Edward Norton', 'https://image.tmdb.org/t/p/original/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg', 'actor', 'tt0137523', 'Edward Harrison Norton (born August 18, 1969) is an American actor, producer, director, and screenwriter. After graduating from Yale College in 1991 with a degree in history, he worked for a few months in Japan before moving to Manhattan to pursue an acting career. He gained recognition and critical acclaim for his debut in Primal Fear (1996), which earned him a Golden Globe for Best Supporting Actor and an Academy Award nomination in the same category. His role as a redeemed neo-Nazi in American History X (1998) earned him an Academy Award nomination for Best Actor. He also starred in Fight Club (1999), garring a cult following.\n\nNorton established the production company Class 5 Films in 2003. He was a director or producer of the films Keeping the Faith (2000), Down in the Valley (2005), and The Painted Veil (2006). He continued to receive praise for his acting roles in films such as The Score (2001), 25th Hour (2002), The Italian Job (2003), The Illusionist (2006), Moonrise Kingdom (2012), and The Grand Budapest Hotel (2014). His biggest commercial successes have been Red Dragon (2002), Kingdom of Heaven (2005), The Incredible Hulk (2008), and The Bourne Legacy (2012). For his roles as a haughty actor in Birdman (2014) and Pete Seeger in A Complete Unknown (2024), Norton earned further Academy Award nominations for Best Supporting Actor. He has also directed and acted in the crime film Motherless Brooklyn (2019) and starred in Glass Onion: A Knives Out Mystery (2022). \n\nNorton is an environmental activist and social entrepreneur. He is a trustee of Enterprise Community Partners. This non-profit organization advocates for affordable housing and serves as president of the American branch of the Maasai Wilderness Conservation Trust. He is also the UN Goodwill Ambassador for Biodiversity.', 'Boston, Massachusetts, USA', '1969-08-18', NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:11', '2025-09-24 11:31:11');
INSERT INTO `cast_crew` VALUES (116, 'Brad Pitt', 'https://image.tmdb.org/t/p/original/9OfnD7lxgIj3BNQpJFnwxnwl6w5.jpg', 'actor', 'tt0114369', 'William Bradley Pitt (born December 18, 1963) is an American actor and film producer. He has received various accolades, including two Academy Awards, two British Academy Film Awards, two Golden Globe Awards, and a Primetime Emmy Award. One of the most influential celebrities, Pitt appeared on Forbes\' annual Celebrity 100 list from 2006 to 2008 and the Time 100 list in 2007. His films as a leading actor have grossed over $6.9 billion worldwide.\n\nPitt first gained recognition as a cowboy hitchhiker in the Ridley Scott road film Thelma & Louise (1991). Pitt emerged as a star, taking on leading man roles in films such as the drama A River Runs Through It (1992), the western Legends of the Fall (1994), the horror film Interview with the Vampire (1994), the crime thriller Seven (1995), and the cult film Fight Club (1999). Pitt found greater commercial success starring in Steven Soderbergh\'s heist film Ocean\'s Eleven (2001) and reprised his role in its sequels. He cemented his leading man status by starring in blockbusters such as the historical epic Troy (2004), the romantic crime film Mr. & Mrs. Smith (2005), the horror film World War Z (2013), and the action film Bullet Train (2022).\n\nPitt won the Academy Award for Best Supporting Actor for playing a stunt performer in Quentin Tarantino\'s Once Upon a Time in Hollywood (2019). He was Oscar-nominated for his roles in the science fiction drama 12 Monkeys (1995), the fantasy romance The Curious Case of Benjamin Button (2008) and the sports drama Moneyball (2011). He also starred in acclaimed films such as Babel (2006), The Assassination of Jesse James by the Coward Robert Ford (2007), Burn After Reading (2008), Inglourious Basterds (2009), The Tree of Life (2011), and The Big Short (2015).\n\nIn 2001, Pitt co-founded the production company Plan B Entertainment. As a producer, he won the Academy Award for Best Picture for 12 Years a Slave (2013). He was nominated for Moneyball (2011) and The Big Short (2015). Pitt was named People\'s Sexiest Man Alive in 1995 and 2000. Pitt\'s relationships have also been subject to widespread media attention, particularly his marriages to actresses Jennifer Aniston and Angelina Jolie, the latter of whom he shares six children with.', 'Shawnee, Oklahoma, USA', '1963-12-18', NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:14', '2025-09-24 11:51:29');
INSERT INTO `cast_crew` VALUES (117, 'Helena Bonham Carter', 'https://image.tmdb.org/t/p/original/hJMbNSPJ2PCahsP3rNEU39C8GWU.jpg', 'actor', 'tt0137523', 'Helena Bonham Carter CBE (born May 26, 1966) is an English actress. Known for her roles in independent films and blockbusters, especially period dramas, she is the recipient of various accolades, including a British Academy Film Award and three Screen Actors Guild Awards, in addition to nominations for two Academy Awards, four British Academy Television Awards, nine Golden Globe Awards, and five Primetime Emmy Awards.\n\nBonham Carter rose to prominence by playing Lucy Honeychurch in A Room with a View (1985) and the title character in Lady Jane (1986). Her early period roles saw her typecast as a virginal \"English rose\", a label she was uncomfortable with. She is best known for her eccentric fashion, dark aesthetic, and for often playing quirky women. For her role as Kate Croy in The Wings of the Dove (1997), Bonham Carter received a nomination for the Academy Award for Best Actress, and for her portrayal of Queen Elizabeth The Queen Mother in The King\'s Speech (2010), she won the BAFTA Award for Best Actress in a Supporting Role, and was nominated for the Academy Award for Best Supporting Actress. Her other films include Hamlet (1990), Howards End (1992), Mary Shelley\'s Frankenstein (1994), Mighty Aphrodite (1995), Fight Club (1999), Wallace & Gromit: The Curse of the Were-Rabbit (2005), the Harry Potter series (2007–2011) as Bellatrix Lestrange, Great Expectations (2012) as Miss Havisham, Les Misérables (2012), Cinderella (2015), Ocean\'s 8 (2018), and Enola Holmes (2020). Her collaborations with director Tim Burton, her former domestic partner, include Big Fish (2003), Corpse Bride (2005), Charlie and the Chocolate Factory (2005), Sweeney Todd: The Demon Barber of Fleet Street (2007) as Mrs. Lovett, Alice in Wonderland (2010) as the Red Queen, and Dark Shadows (2012).\n\nFor her role as children\'s author Enid Blyton in the BBC Four biographical film Enid (2009), she won the 2010 International Emmy Award for Best Actress and was nominated for the British Academy Television Award for Best Actress. Her other television films include Fatal Deception: Mrs. Lee Harvey Oswald (1993), Live from Baghdad (2002), Toast (2010), and Burton & Taylor (2013). From 2019 to 2020, she portrayed Princess Margaret, Countess of Snowdon in seasons three and four of Netflix\'s The Crown.', 'Golders Green, London, England, UK', '1966-05-26', NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:16', '2025-09-24 11:31:16');
INSERT INTO `cast_crew` VALUES (118, 'Meat Loaf', 'https://image.tmdb.org/t/p/original/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg', 'actor', 'tt0137523', 'Michael Lee Aday (September 27, 1947 – January 20, 2022), better known as Meat Loaf, was an American singer and actor. He was noted for his powerful, wide-ranging voice and theatrical live shows. His Bat Out of Hell trilogy—Bat Out of Hell, Bat Out of Hell II: Back into Hell, and Bat Out of Hell III: The Monster Is Loose—has sold more than 65 million albums worldwide. More than four decades after its release, the first album still sells an estimated 200,000 copies annually and stayed on the charts for over nine years, making it one of the best-selling albums in history.\n\nAfter the commercial success of Bat Out of Hell and Bat Out of Hell II: Back Into Hell, and earning a Grammy Award for Best Solo Rock Vocal Performance for the song \"I\'d Do Anything for Love\", Meat Loaf nevertheless experienced some difficulty establishing a steady career within the United States. This did not stop him from becoming one of the best-selling music artists of all time, with worldwide sales of more than 80 million records. The key to this success was his retention of iconic status and popularity in Europe, especially the United Kingdom, where he received the 1994 Brit Award for best-selling album and single, appeared in the 1997 film Spice World, and ranks 23rd for the number of weeks spent on the UK charts, as of 2006. He ranks 96th on VH1\'s \"100 Greatest Artists of Hard Rock\".\n\nAday appeared in over 50 movies and television shows, sometimes as himself or as characters resembling his stage persona. His film roles include Eddie in The Rocky Horror Picture Show (1975), and Bob Paulson in Fight Club (1999). His early stage work included dual roles in the original Broadway cast of The Rocky Horror Show, and he also appeared in the musical Hair, both on- and off-Broadway.', 'Dallas, Texas, USA', '1947-09-27', NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:20', '2025-09-24 11:31:20');
INSERT INTO `cast_crew` VALUES (119, 'Jared Leto', 'https://image.tmdb.org/t/p/original/ca3x0OfIKbJppZh8S1Alx3GfUZO.jpg', 'actor', 'tt0137523', 'Jared Joseph Leto (/ˈlɛtoʊ/; born December 26, 1971) is an American actor and musician. After starting his career with television appearances in the early 1990s, he achieved recognition for his role as Jordan Catalano on the television series My So-Called Life (1994). He made his film debut in How to Make an American Quilt (1995) and received critical praise for his performance in Prefontaine (1997).\n\nAfter supporting roles in The Thin Red Line (1998), Fight Club (1999), Girl, Interrupted (1999) and American Psycho (2000), and the lead role in Urban Legend (1998), he earned critical acclaim for portraying heroin addict Harry Goldfarb in Requiem for a Dream (2000). He began focusing increasingly on music, then returned to acting with Panic Room (2002), Alexander (2004), Lord of War (2005), Lonely Hearts (2006), Chapter 27 (2007), and Mr. Nobody (2009). His performance as a transgender woman in Dallas Buyers Club (2013) earned him an Academy Award, a Golden Globe Award, and a Screen Actors Guild Award for Best Supporting Actor. He starred in Suicide Squad (2016), Blade Runner 2049 (2017), The Little Things (2021) and House of Gucci (2021), of which the latter two earned him nominations for a Golden Globe Award and Screen Actors Guild Award for Best Supporting Actor.\n\nLeto is the lead vocalist, multi-instrumentalist and main songwriter for Thirty Seconds to Mars, a band he formed with his older brother Shannon Leto. Their debut album, 30 Seconds to Mars (2002), released to positive reviews but limited commercial success. The band achieved worldwide fame with the release of their second album A Beautiful Lie (2005). Their following releases, This Is War (2009), and Love, Lust, Faith and Dreams (2013), received further critical success, and their fifth album, America (2018), marked new commercial success. As of September 2014, they have sold over 15 million albums worldwide.\n\nLeto is considered a method actor, known for his constant devotion to and research of his roles. He often remains completely in character for the duration of shooting schedules of his films, even to the point of adversely affecting his health. He is also known to be selective about his film roles.\n\nDescription above from the Wikipedia article Jared Leto, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Bossier City, Louisiana, USA', '1971-12-26', NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:26', '2025-09-24 11:31:26');
INSERT INTO `cast_crew` VALUES (120, 'Mike Topoozian', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0137523', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:28', '2025-09-24 11:31:28');
INSERT INTO `cast_crew` VALUES (121, 'David Fincher', 'https://image.tmdb.org/t/p/original/tpEczFclQZeKAiCeKZZ0adRvtfz.jpg', 'director', 'tt0114369', 'David Andrew Leo Fincher (born August 28, 1962) is an American film director. His films, mostly thrillers, have received 40 nominations at the Academy Awards, including three for him as Best Director.\n\nBorn in Denver, Colorado, Fincher was interested in filmmaking at an early age. He directed numerous music videos, most notably Madonna\'s \"Express Yourself\" in 1989 and \"Vogue\" in 1990, both of which won him the MTV Video Music Award for Best Direction. He made his feature film debut with Alien 3 (1992), which garnered mixed reviews, followed by the thriller Seven (1995), which was better received. Fincher found lukewarm success with The Game (1997) and Fight Club (1999), but the latter eventually became a cult classic. In 2002, he returned to prominence with the thriller Panic Room starring Jodie Foster.\n\nFincher also directed Zodiac (2007), The Social Network (2010), The Girl with the Dragon Tattoo (2011), and Mank (2020). For The Social Network, he won the Golden Globe Award for Best Director and BAFTA Award for Best Direction. His biggest commercial successes are The Curious Case of Benjamin Button (2008) and Gone Girl (2014), both of which grossed more than $300 million worldwide, with the former earning thirteen nominations at the Academy Awards, and eleven at the British Academy Film Awards.\n\nHe also served as an executive producer and director for the Netflix series House of Cards (2013–2018) and Mindhunter (2017–2019), winning the Primetime Emmy Award for Outstanding Directing for a Drama Series for the pilot episode of House of Cards. Fincher was the co-founder of Propaganda Films, a film, and music.', 'Denver, Colorado, USA', '1962-08-28', NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:29', '2025-09-24 11:51:44');
INSERT INTO `cast_crew` VALUES (122, 'Dina Waxman', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0137523', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:36', '2025-09-24 11:31:36');
INSERT INTO `cast_crew` VALUES (123, 'Carlos Saldanha', 'https://image.tmdb.org/t/p/original/oxUlCSgxKaoCRYFyS65PC2fZWrk.jpg', 'director', 'tt0137523', 'From Wikipedia, the free encyclopedia.\n\nCarlos Saldanha (born July 20, 1968) is a Brazilian director of animated films. He was the director of Ice Age: The Meltdown (2006) and Ice Age: Dawn of the Dinosaurs (2009), and the co-director of Ice Age (2002) and Robots (2005).\n\nSaldanha was born in Rio de Janeiro, Brazil. He left his hometown in 1991 to follow his artistic instinct and passion for animation. With a background in computer science and a natural artistic sensibility, he found New York City the perfect locale to merge these skills and become an animator. He attended the MFA program at New York\'s School of Visual Arts, where he graduated with honors in 1993, after completing two animated shorts, The Adventures of Korky, the Corkscrew (1992) and Time For Love (1993). The shorts have been screened at animation festivals around the world. At SVA, Saldanha met Chris Wedge, one of the cofounders of Blue Sky Studios, who invited him to join their growing team of artists.\n\nHe also worked as animator on Wedge\'s short film Bunny.\n\nDescription above from the Wikipedia article Carlos Saldanha, licensed under CC-BY-SA, full list of contributors on Wikipedia.​', 'Rio de Janeiro, Rio de Janeiro, Brazil', '1965-01-24', NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:39', '2025-09-24 11:31:39');
INSERT INTO `cast_crew` VALUES (124, 'David Leitch', 'https://image.tmdb.org/t/p/original/qykhwWkXTAteD9yvsmItXh9LxCq.jpg', 'director', '746036', 'David Leitch (/liːtʃ/; born November 16, 1975) is an American filmmaker, stunt performer, coordinator, and actor. He made his directorial debut in the action film John Wick (2014) with Chad Stahelski, though only Stahelski was credited. He later also directed the films Atomic Blonde (2017), Deadpool 2 (2018), Hobbs & Shaw (2019), Bullet Train (2022), and The Fall Guy (2024).\n\nDescription above from the Wikipedia article David Leitch, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Kohler, Wisconsin, USA', '1975-11-16', NULL, 1, 1, NULL, NULL, '2025-09-24 11:31:40', '2026-02-03 21:33:40');
INSERT INTO `cast_crew` VALUES (125, 'Morgan Freeman', 'https://image.tmdb.org/t/p/original/jPsLqiYGSofU4s6BjrxnefMfabb.jpg', 'actor', 'tt0114369', 'Morgan Freeman (born June 1, 1937) is an American actor, director, and narrator. Noted for his distinctive deep voice, Freeman is known for his various roles in a wide variety of film genres. Throughout his career spanning over five decades, he has received multiple accolades, including an Academy Award, a Screen Actors Guild Award, and a Golden Globe Award.\n\nBorn in Memphis, Tennessee, Freeman was raised in Mississippi where he began acting in school plays. He studied theatre arts in Los Angeles and appeared in stage productions in his early career. He rose to fame in the 1970s for his role in the children\'s television series The Electric Company. Freeman then appeared in the Shakespearean plays Coriolanus and Julius Caesar, the former of which earned him an Obie Award. His breakout role was in Street Smart (1987), playing a hustler, which earned him an Academy Award nomination for Best Supporting Actor. He achieved further stardom in Glory, the biographical drama Lean on Me, and comedy-drama Driving Miss Daisy (all 1989), the latter of which garnered him his first Academy Award nomination for Best Actor.\n\nIn 1992, Freeman starred alongside Clint Eastwood in the western revenge film Unforgiven; this would be the first of several collaborations with Eastwood. In 1994, he starred in the prison drama The Shawshank Redemption for which he received another Academy Award nomination. Freeman also starred in David Fincher\'s crime thriller Se7en (1995), and Steven Spielberg\'s historical drama Amistad (1997). Freeman won the Academy Award for Best Supporting Actor for his performance in Clint Eastwood\'s 2004 sports drama Million Dollar Baby. In 2009, he received his fifth Oscar nomination for playing former South African President Nelson Mandela in Eastwood\'s Invictus. Freeman is also known for his performance as Lucius Fox in Christopher Nolan\'s The Dark Knight Trilogy (2005–2012).\n\nIn addition to acting, Freeman has directed the drama Bopha! (1993). He also founded film production company Revelations Entertainment with business partner Lori McCreary. He is the recipient of the Kennedy Center Honor, the AFI Life Achievement Award, the Cecil B. DeMille Award, and the Screen Actors Guild Life Achievement Award. For his performances in theatrical productions, he has won three Obie Awards, one of the most prestigious honors for recognizing excellence in theatre.', 'Memphis, Tennessee, USA', '1937-06-01', NULL, 1, 1, NULL, NULL, '2025-09-24 11:51:28', '2025-09-24 11:51:28');
INSERT INTO `cast_crew` VALUES (126, 'Gwyneth Paltrow', 'https://image.tmdb.org/t/p/original/kvk2UXWO45pQWlbErtotK3npHNP.jpg', 'actor', 'tt0114369', 'Gwyneth Kate Paltrow (born September 27, 1972) is an American actress and businesswoman. The daughter of filmmaker Bruce Paltrow and actress Blythe Danner, she established herself as a leading lady, appearing in mainly mid-budget and period films during the 1990s and early 2000s, before transitioning to blockbusters and franchises. Her accolades include an Academy Award, a Golden Globe Award, and a Primetime Emmy Award.\n\nPaltrow gained notice for her early work in films such as Seven (1995), Emma (1996), Sliding Doors (1998), and A Perfect Murder (1998). She garnered wider acclaim for her role as Viola de Lesseps in the historical romance Shakespeare in Love (1998), which earned her the Academy Award for Best Actress. This was followed by roles in The Talented Mr. Ripley (1999), The Royal Tenenbaums (2001), and Shallow Hal (2001). She made her West End debut in the David Auburn play Proof (2003), earning a Laurence Olivier Award for Best Actress nomination, and reprised the role in the 2005 film of the same name.\n\nAfter becoming a parent in 2004, Paltrow reduced her acting workload by making intermittent appearances in films such as Two Lovers (2008), Country Strong (2010), and Contagion (2011). Paltrow\'s career revived through her portrayal of Pepper Potts in the Marvel Cinematic Universe from Iron Man (2008) to Avengers: Endgame (2019). On television, she had a recurring guest role as Holly Holliday on the Fox musical television series Glee (2010–2011), for which she received the Primetime Emmy Award for Outstanding Guest Actress in a Comedy Series. After starring in the Netflix series The Politician (2019–2020), she took a break from acting.\n\nIn 2005 Paltrow became a \"face\" of Estée Lauder Companies; she was previously the face of the American fashion brand Coach. She is the founder and CEO of the lifestyle company Goop, which has been criticised for promoting pseudoscience, and has written several cookbooks. She received a Grammy Award nomination for Best Spoken Word Album for Children for the Brown Bear and Friends (2009). She hosted the documentary series The Goop Lab for Netflix in 2020.', 'Los Angeles, California, USA', '1972-09-27', NULL, 1, 1, NULL, NULL, '2025-09-24 11:51:34', '2025-09-24 11:51:34');
INSERT INTO `cast_crew` VALUES (127, 'John Cassini', 'https://image.tmdb.org/t/p/original/kn2Rtn0I8ivCR7ydZTY74XUBh1K.jpg', 'actor', 'tt0114369', '​From Wikipedia, the free encyclopedia.  \n\nJohn Cassini (born at Toronto) is a Canadian actor who played the role of Officer Davis in the 1995 Brad Pitt film, Se7en. He also starred in the 2005 film Cool Money. Cassini starred as Ronnie Delmarco on the CBC series, Intelligence. On March 7, 2008, the CBC announced that Intelligence would be cancelled. Cassini appeared in and is listed as a producer of the film \"Guido Superstar: The Rise of Guido\", starring, produced, and directed by Silvio Pollio, including, Nicholas Lea, Terry Chen, and Michael Eklund. The film screened at the 2010 Vancouver International Film Festival Thursday, Oct. 7 at 9:45 p.m. and Friday, Oct. 8, at 10:45 a.m., both at the Empire Granville 7 in downtown Vancouver, BC.  Cassini is an Italian citizen\n\nDescription above from the Wikipedia article John Cassini,  licensed under CC-BY-SA, full list of contributors on Wikipedia.', ' Toronto, Ontario, Canada', NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 11:51:39', '2025-09-24 11:51:39');
INSERT INTO `cast_crew` VALUES (128, 'Peter Crombie', 'https://image.tmdb.org/t/p/original/pMvhE1wwQo3eTSp4vwq8Hb22CwN.jpg', 'actor', 'tt0114369', 'Peter B. Crombie (born June 26, 1952 - January 11, 2024) is an American film and television actor.', 'USA', '1952-06-26', NULL, 1, 1, NULL, NULL, '2025-09-24 11:51:41', '2025-09-24 11:51:41');
INSERT INTO `cast_crew` VALUES (129, 'Michael Alan Kahn', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0114369', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 11:51:45', '2025-09-24 11:51:45');
INSERT INTO `cast_crew` VALUES (130, 'Mark Levinson', 'https://image.tmdb.org/t/p/original/jkKJquVmYLnfoi4jt17YQS7jsVi.jpg', 'director', 'tt0114369', 'Mark Levinson is an American director, producer and writer who has also served as an ADR specialist. Prior to his film career, Levinson earned a doctoral degree in particle physics from the University of California, Berkley.', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 11:51:47', '2025-09-24 11:51:47');
INSERT INTO `cast_crew` VALUES (131, 'Cori Glazer', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0114369', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 11:51:48', '2025-09-24 11:51:48');
INSERT INTO `cast_crew` VALUES (132, 'Melodie McDaniel', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt0114369', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-24 11:51:49', '2025-09-24 11:51:49');
INSERT INTO `cast_crew` VALUES (133, 'Kalyani Priyadarshan', 'https://image.tmdb.org/t/p/original/8FXahoKdXzS3nCKvyRqbE2y5kSA.jpg', 'actor', 'tt33372494', 'Kalyani Priyadarshan (born April 5, 1993) is an Indian actress working in Malayalam, Tamil, and Telugu industries. She studied architecture at Parsons School of Design in New York and trained in acting at the Lee Strasberg Theatre & Film Institute, while also working as an assistant production designer on Krrish 3 (2013) and Iru Mugan (2016)\n\nShe made her acting debut with the Telugu film Hello (2017), which earned her the Filmfare Award for Best Female Debut – South. She went on to appear in Chitralahari (2019) and Ranarangam (2019), followed by her Tamil debut in Hero (2019). Her portrayal of Priya garnered widespread acclaim and earned her the Filmfare Award for Best Female Debut – South\n\nIn Malayalam cinema, she began with Varane Avashyamund (2020) and has since delivered notable performances in Hridayam (2022), Bro Daddy (2022), and Lokah Chapter 1: Chandra (2025)', 'Chennai, India', '1992-04-05', NULL, 1, 1, NULL, NULL, '2025-09-27 08:09:21', '2025-09-27 08:09:21');
INSERT INTO `cast_crew` VALUES (134, 'Naslen', 'https://image.tmdb.org/t/p/original/ajSWBSFkwdAa03W538WIZCXMoCL.jpg', 'actor', 'tt33372494', 'Naslen K. Gafoor (born June 11, 200) is an Indian actor who appears in Malayalam films. He is best known for his roles in the films Thanneer Mathan Dinangal, Kuruthi, Home, Super Sharanya, Neymar and Premalu, which went on to become one of the highest grossing Malayalam movies of all time, earning him fame across various states of India.', 'Kodungallur, Thrissur, Kerala', '2000-06-11', NULL, 1, 1, NULL, NULL, '2025-09-27 08:09:24', '2025-09-27 08:09:24');
INSERT INTO `cast_crew` VALUES (135, 'Chandu Salimkumar', 'https://image.tmdb.org/t/p/original/1FVTLZWJi7acmNYQYdnkWsld9nr.jpg', 'actor', 'tt33372494', '', 'North Paravur, Kerala, India', NULL, NULL, 1, 1, NULL, NULL, '2025-09-27 08:09:49', '2025-09-27 08:09:49');
INSERT INTO `cast_crew` VALUES (136, 'Arun Kurian', 'https://image.tmdb.org/t/p/original/7jFTigCmJV3xH0fKSkv1wbdbdKo.jpg', 'actor', 'tt33372494', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-27 08:09:49', '2025-09-27 08:09:49');
INSERT INTO `cast_crew` VALUES (137, 'Vijayaraghavan', 'https://image.tmdb.org/t/p/original/3AE7r02YPbSrEUIfP7gUN7lLNfI.jpg', 'actor', 'tt33372494', 'Vijayaraghavan is an Indian actor who mainly acts in Malayalam cinema. He is popular for his character roles. He is the son of popular drama and cinema artist N. N. Pillai.', 'Kuala Lumpur, Malaysia', '1951-12-20', NULL, 1, 1, NULL, NULL, '2025-09-27 08:09:51', '2025-09-27 08:09:51');
INSERT INTO `cast_crew` VALUES (138, 'Sujith Suresh', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt33372494', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-27 08:09:54', '2025-09-27 08:09:54');
INSERT INTO `cast_crew` VALUES (139, 'Sugheesh S. G.', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', 'tt33372494', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-09-27 08:09:57', '2025-09-27 08:09:57');
INSERT INTO `cast_crew` VALUES (140, 'Tetsuo Funabashi', 'http://127.0.0.1/fiveflix/default-image/Default-Image.jpg', 'director', '27205', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2025-10-14 02:41:50', '2025-10-14 02:41:50');
INSERT INTO `cast_crew` VALUES (141, 'Jodie Comer', 'https://image.tmdb.org/t/p/original/ye7rdpq4KY7c0OqfRqeWMUZaneb.jpg', 'actor', '1100988', 'Jodie Marie Comer (/ˈkoʊmər/ KOH-mər; born 11 March 1993) is an English actress of screen and stage. She began her career in an episode of The Royal Today in 2008. Comer gained recognition for appearing in the series My Mad Fat Diary (2013–2015) and Doctor Foster (2015–2017) and starred in the drama miniseries Thirteen (2016). From 2018 to 2022, Comer played sociopathic assassin Villanelle in the BBC America spy thriller television series Killing Eve, winning a BAFTA Television Award and a Primetime Emmy Award. For playing Sarah, a healthcare assistant, in the television film Help (2021), she won another BAFTA Television Award.\n\nComer expanded to films in 2021 with main roles in the action comedy film Free Guy and historical drama The Last Duel. In 2022, she made her West End theatre debut in Suzie Miller\'s one-woman play Prima Facie, which earned her an Evening Standard Theatre Award and a Laurence Olivier Award. Following its transfer to Broadway in 2023, she won a Tony Award.\n\nDescription above from the Wikipedia article Jodie Comer, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Liverpool, Merseyside, England, UK', '1993-03-11', NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:11', '2026-02-03 20:42:11');
INSERT INTO `cast_crew` VALUES (142, 'Alfie Williams', 'https://image.tmdb.org/t/p/original/wqfyAhZH6uCu5J4THsz2gJxsizB.jpg', 'actor', '1100988', 'Alfie Williams (born January 3, 2011) is an English actor. He is best known for his role as Spike in the horror film 28 Years Later (2025).', 'Newcastle upon Tyne, England, UK', '2011-01-03', NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:12', '2026-02-03 20:42:12');
INSERT INTO `cast_crew` VALUES (143, 'Aaron Taylor-Johnson', 'https://image.tmdb.org/t/p/original/pFtHhih2XEaFaD3qOFyQW6q83br.jpg', 'actor', '746036', 'Aaron Perry Taylor-Johnson (né Johnson; born 13 June 1990) is a British actor. His accolades include a Golden Globe Award, in addition to nominations for two British Academy Film Awards and a British Independent Film Award.\n\nAs a child actor, Taylor-Johnson performed in films including Shanghai Knights (2003), The Illusionist (2006), and Angus, Thongs and Perfect Snogging (2008). He had his breakthrough performance as John Lennon in the biopic Nowhere Boy (2009), directed by Sam Taylor-Wood, whom he married in 2012, adding her surname. He gained recognition for his portrayal of the title character in Kick-Ass (2010) and its sequel, Kick-Ass 2 (2013), as well as for performances in the crime thriller Savages (2012), the period drama Anna Karenina (2012), and the monster film Godzilla (2014).\n\nTaylor-Johnson next portrayed the Marvel Cinematic Universe character Pietro Maximoff in Avengers: Age of Ultron (2015). For playing a psychopathic drifter in the thriller film Nocturnal Animals (2016), he won the Golden Globe Award for Best Supporting Actor. He has since appeared in the action films Tenet (2020), Bullet Train (2022) and The Fall Guy (2024), as well as starring roles in the horror films Nosferatu (2024) and 28 Years Later (2025).\n\nDescription above from the Wikipedia article Aaron Taylor-Johnson, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'High Wycombe, Buckinghamshire, England, UK', '1990-06-13', NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:13', '2026-02-03 21:33:36');
INSERT INTO `cast_crew` VALUES (144, 'Ralph Fiennes', 'https://image.tmdb.org/t/p/original/u29BOqiV5GCQ8k8WUJM50i9xlBf.jpg', 'actor', '1100988', 'Ralph Nathaniel Twisleton-Wykeham-Fiennes (born 22 December 1962) is an English actor, film producer, and director. He has received various accolades, including a British Academy Film Award and a Tony Award, as well as nominations for three Academy Awards, seven Golden Globe Awards, and a Primetime Emmy Award.\n\nBorn in Ipswich, Suffolk, Fiennes was trained at and graduated from the Royal Academy of Dramatic Art in 1985. A Shakespeare interpreter, he excelled onstage at the Royal National Theatre before succeeding at the Royal Shakespeare Company. In 1995, Fiennes made his Broadway debut playing Prince Hamlet in the revival of the William Shakespeare play Hamlet, for which he won the Tony Award for Best Actor in a Play. He was later Tony-nominated for his role as a travelling faith healer in the Brian Friel play Faith Healer (2006).\n\nFiennes made his film debut playing Heathcliff in Emily Brontë\'s Wuthering Heights (1992). He has earned three Academy Award nominations for his performances in the films Schindler\'s List (1993), The English Patient (1996), and Conclave (2024). He has also acted in Quiz Show (1994), Maid in Manhattan (2002), The Constant Gardener (2005), In Bruges (2008), The Reader (2008), The Duchess (2008), The Hurt Locker (2009), The Grand Budapest Hotel (2014), A Bigger Splash (2015), Hail, Caesar! (2016), and The Menu (2022).\n\nFiennes gained wider recognition for playing Lord Voldemort in the Harry Potter film series (2005–2011) and Gareth Mallory / M in the James Bond films (2012–2021); and has voiced roles in the animated films The Prince of Egypt (1998), Wallace & Gromit: The Curse of the Were-Rabbit (2005), Kubo and the Two Strings (2016), and The Lego Batman Movie (2017). He directed and starred in the films Coriolanus (2011) and The Invisible Woman (2013). Aside from acting, Fiennes has been an ambassador for UNICEF UK since 1999.', 'Ipswich, Suffolk, England, UK', '1962-12-22', NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:15', '2026-02-03 20:42:15');
INSERT INTO `cast_crew` VALUES (145, 'Edvin Ryding', 'https://image.tmdb.org/t/p/original/95mT0rw94k1MhrPRzdnEkokVXHQ.jpg', 'actor', '1100988', 'Lars Edvin Folke Ryding is a Swedish actor. He debuted in the TV series \"Mannen under trappan\" in 2009. Since then Ryding has acted in several other productions like \"Fröken Frimans krig\", \"Kronjuvelerna\", \"The Stig-Helmer Story\", \"Gåsmamman\", and several of the films about Annika Bengtzon produced in 2011. He became known internationally with the leading role in the 2021 Netflix series \"Young Royals\", where he plays the character Prince Wilhelm. He had the leading voice role in the Danish children\'s animated film \"Resan till Fjäderkungens rike\".', 'Stockolm, Sweden', '2003-02-04', NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:16', '2026-02-03 20:42:16');
INSERT INTO `cast_crew` VALUES (146, 'Danny Boyle', 'https://image.tmdb.org/t/p/original/b5qQpFHmgNyvV1t81ou17Jt2fRj.jpg', 'director', '1100988', 'Daniel Francis Boyle (born 20 October 1956) is an English filmmaker and producer. He is best known for his work on films such as Trainspotting, 28 Days Later, Slumdog Millionaire, 127 Hours, and Steve Jobs. In 2009, Slumdog Millionaire won Boyle the Academy Award for Best Director, and the film won Best Picture. In 2012, Boyle was the artistic director for Isles of Wonder, the opening ceremony of the Summer Olympics in London, which was widely praised.', 'Manchester, England, UK', '1956-10-20', NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:17', '2026-02-03 20:42:17');
INSERT INTO `cast_crew` VALUES (147, 'Lucy Hatherley', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '1100988', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:22', '2026-02-03 20:42:22');
INSERT INTO `cast_crew` VALUES (148, 'Emily Perowne', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '1100988', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:27', '2026-02-03 20:42:27');
INSERT INTO `cast_crew` VALUES (149, 'Sarah Mulberge', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '1100988', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 20:42:39', '2026-02-03 20:42:39');
INSERT INTO `cast_crew` VALUES (150, 'Lupita Nyong\'o', 'https://image.tmdb.org/t/p/original/y40Wu1T742kynOqtwXASc5Qgm49.jpg', 'actor', '762441', 'Lupita Amondi Nyong\'o (born 1 March 1983) is a Kenyan-Mexican actress and author. She began her career in Hollywood as a production assistant. In 2008, she made her acting debut with the short film East River and subsequently returned to Kenya to star in the television series Shuga (2009–2012). In 2009, she wrote, produced and directed the documentary In My Genes. She then pursued a master\'s degree in acting from the Yale School of Drama.\n\nShe had her first feature film role as Patsey in 12 Years a Slave (2013), for which she received critical acclaim and won several awards, including the Academy Award for Best Supporting Actress. She became the first Kenyan and Mexican actress to win an Academy Award. She made her Broadway debut as a teenage orphan in the play Eclipsed (2015), for which she was nominated for a Tony Award for Best Actress in a Play. She went on to perform a motion capture role as Maz Kanata in the Star Wars sequel trilogy (2015–2019) and a lead voice role as Raksha in The Jungle Book (2016). Her career progressed with her role as Nakia in the Marvel Cinematic Universe superhero film Black Panther (2018) and her starring role in Jordan Peele\'s critically acclaimed horror film Us (2019).\n\nIn addition to acting, she supports historic preservation. She is vocal about preventing sexual harassment and working for women\'s and animal rights. In 2014, she was named the most beautiful woman by People. She has also written a children\'s book named Sulwe (2019), which became a number-one New York Times Best-Seller. Also in 2019, she narrated the Discovery Channel docu-series Serengeti, which earned her a Primetime Emmy Award nomination for Outstanding Narrator. She was named among Africa\'s \"50 Most Powerful Women\" by Forbes in 2020.\n\nDescription above is from the Wikipedia article Lupita Nyong\'o, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Mexico City, Mexico', '1983-03-01', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:01', '2026-02-03 21:00:01');
INSERT INTO `cast_crew` VALUES (151, 'Joseph Quinn', 'https://image.tmdb.org/t/p/original/zshhuioZaH8S5ZKdMcojzWi1ntl.jpg', 'actor', '762441', 'Joseph Quinn (born 26 January 1994) is an English actor. He is known for playing Eddie Munson in the fourth season of the Netflix series Stranger Things (2022). He has also appeared in the BBC One series Dickensian (2016), Howards End (2017), Les Misérables (2018), and the Sky Atlantic series Catherine the Great (2019). He starred in the science fiction horror film A Quiet Place: Day One and portrayed Geta in the historical action film Gladiator II, released in 2024.', 'London, England, UK', '1994-01-26', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:02', '2026-02-03 21:00:02');
INSERT INTO `cast_crew` VALUES (152, 'Alex Wolff', 'https://image.tmdb.org/t/p/original/hMhGWS5nB7ZGA3B1aefY39pizgm.jpg', 'actor', '762441', 'Alexander Draper Wolff (born November 1, 1997), known by his nickname and professionally as Alex Wolff, is an American actor, musician, and singer-songwriter. He first gained recognition for starring alongside his older brother, Nat, in the Nickelodeon musical comedy series The Naked Brothers Band (2007–2009), created by his mother, Polly Draper. Wolff\'s father, Michael Wolff, co-produced the series\' soundtrack albums The Naked Brothers Band (2007) and I Don\'t Want to Go to School (2008), which placed on the Billboard 200 charts.\n\nAfter the Nickelodeon series ended, Wolff and his brother formed a music duo called Nat & Alex Wolff. They released the albums Black Sheep (2011), Public Places (2016) and Table for Two(2023). He focused his career on film roles, portraying Dzhokhar Tsarnaev in Patriots Day (2016) and John \"Derf\" Backderf in My Friend Dahmer (2017). Wolff made his directorial debut with the drama film The Cat and the Moon (2019). His other acting roles include My Big Fat Greek Wedding 2 (2016), Jumanji: Welcome to the Jungle (2017), Hereditary (2018), Pig (2021), Old (2021), and A Quiet Place: Day One (2024).\n\nDescription above from the Wikipedia article Alex Wolff, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'New York City, New York, USA', '1997-11-01', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:03', '2026-02-03 21:00:03');
INSERT INTO `cast_crew` VALUES (153, 'Djimon Hounsou', 'https://image.tmdb.org/t/p/original/tpvtxxvCx2Mb5DV632hmuYlHoiY.jpg', 'actor', '762441', 'Djimon Gaston Hounsou (born April 24, 1964) is a Beninese-American actor and model. He began his career appearing in music videos, made his film debut in Without You I\'m Nothing and earned widespread recognition for his role as Cinqué in the Steven Spielberg film Amistad. As an actor, Hounsou has been nominated for two Academy Awards.\n\nHounsou became a naturalized American citizen in 2007. He was reluctant to renounce his Beninese citizenship and therefore opted to become a dual citizen of both Benin and the United States, effectively rendering him a Beninese-American.\n\nDjimon Hounsou was born in Cotonou, Benin, in 1964, to lbertine and Pierre Hounsou. He immigrated to Lyon in France at the age of thirteen with his brother, Edmond. In 1987, he became a model and established a career in Paris. He moved to the U.S. in 1990. One year before obtaining his college degree, he dropped out of school.\n\nIn 1989, he appeared in a music video of Straight Up by Paula Abdul. Hounsou\'s film debut was in the 1990 Sandra Bernhard film Without You I’m Nothing, and he has had television roles on Beverly Hills, 90210 and ER and a guest starring role on Alias, but received a larger role in the science fiction film Stargate. His first on-screen appearance was in the 1990 Janet Jackson video “Love Will Never Do (Without You).” He also starred in a 2002 Gap commercial directed by Peter Lindbergh, dancing to a rendition of John Lee Hooker\'s \"Boom Boom\" by Arrested Development\'s Baba Oje.\n\nHe received wide critical acclaim and a Golden Globe Award nomination for his role as Cinqué in the 1997 Steven Spielberg film Amistad. He gained further notice as Juba, in the 2000 film Gladiator. He was nominated for the Academy Award for Best Supporting Actor, for In America, in 2004, becoming the fourth African male to be nominated for an Oscar (along with Basil Rathbone, Cecil Kellaway and Omar Sharif). In 2006, he won the National Board of Review Award for Best Supporting Actor for his performance in Blood Diamond; he received Broadcast Film Critics Association, Screen Actors Guild Award, and Academy Award nominations for this performance.\n\nIn 2007, Hounsou began dating model/CEO of Baby Phat, Kimora Lee Simmons. In 2008 Hounsou and Simmons visited Hounsou\'s family and while there, the two participated in a traditional commitment ceremony. On May 30, 2009, Simmons gave birth to their son, Kenzo Lee Hounsou, reportedly named because Kenzo means 3 (Kimora\'s third child).', 'Cotonou, Dahomey [now Benin]', '1964-04-24', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:04', '2026-02-03 21:00:04');
INSERT INTO `cast_crew` VALUES (154, 'Eliane Umuhire', 'https://image.tmdb.org/t/p/original/u2q6nQtLsKGyTnWHtmKGyeYAyXq.jpg', 'actor', '762441', '', 'Kigali, Rwanda', '1986-01-01', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:05', '2026-02-03 21:00:05');
INSERT INTO `cast_crew` VALUES (155, 'Michael Bay', 'https://image.tmdb.org/t/p/original/rkC7lei20x5xlFH4SivAXXBh6uR.jpg', 'director', '762441', 'Michael Benjamin Bay (born February 17, 1965) is an American film director and producer. He is best known for making big-budget, high-concept action films with fast cutting, stylistic cinematography and visuals, and extensive use of special effects, including frequent depictions of explosions. The films he has directed include Bad Boys (1995) and its sequel Bad Boys II (2003), The Rock (1996), Armageddon (1998), Pearl Harbor (2001), the first five films in the Transformers film series, 13 Hours: The Secret Soldiers of Benghazi (2016), 6 Underground (2019), and Ambulance (2022). His films have grossed over US$7.8 billion worldwide, making him one of history\'s most commercially successful directors.\n\nHe is co-founder of the production house the Institute and co-owns Platinum Dunes, a production house that has remade horror films, including The Texas Chainsaw Massacre (2003), The Amityville Horror (2005), The Hitcher (2007), Friday the 13th (2009), and A Nightmare on Elm Street (2010).\n\nDescription above from the Wikipedia article Michael Bay, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Los Angeles, California, USA', '1965-02-17', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:07', '2026-02-03 21:00:07');
INSERT INTO `cast_crew` VALUES (156, 'Michael Sarnoski', 'https://image.tmdb.org/t/p/original/s2bl2Ct2BNLZjXqxHt7SpYgYzLD.jpg', 'director', '762441', 'Michael Sarnoski is an American filmmaker. He is best known for writing and directing the films Pig (2021) and A Quiet Place: Day One (2024).\n\nSarnoski grew up in Milwaukee, Wisconsin, and graduated from the University School of Milwaukee before attending Yale University. In 2015, Sarnoski executive produced and edited the documentary short film The Testimony directed by Vanessa Block.\n\nIn 2021, Sarnoski made his directorial debut with the drama film Pig, starring Nicolas Cage, Alex Wolff, and Adam Arkin. The film was released on July 16, 2021, by Neon. In January 2022, it was announced that Sarnoski was hired to write and direct A Quiet Place: Day One, a prequel and spin-off film to the A Quiet Place film series. It stars Lupita Nyong\'o, Joseph Quinn, Wolff, Djimon Hounsou and Denis O\'Hare. The film is set to be released on June 28, 2024, by Paramount Pictures.\n\nDescription above from the Wikipedia article Michael Sarnoski, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Milwaukee, Wisconsin, USA', NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:08', '2026-02-03 21:00:08');
INSERT INTO `cast_crew` VALUES (157, 'Guy Trevellyan', 'https://image.tmdb.org/t/p/original/weMZXmW8cGwmdEmSMrCu4oShZzo.jpg', 'director', '762441', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:12', '2026-02-03 21:00:12');
INSERT INTO `cast_crew` VALUES (158, 'Paul Rudd', 'https://image.tmdb.org/t/p/original/6jtwNOLKy0LdsRAKwZqgYMAfd5n.jpg', 'actor', '640146', 'Paul Stephen Rudd (born April 6, 1969) is an American actor. Rudd studied theatre at the University of Kansas and the American Academy of Dramatic Arts before making his acting debut in 1991. He was included on the Forbes Celebrity 100 list in 2019 and was named People magazine\'s \"Sexiest Man Alive\" in 2021. The accolades he has received include a Critics\' Choice Television Award, as well as nominations for a Golden Globe Award, two Primetime Emmy Awards, and two Screen Actors Guild Awards.\n\nRudd appeared in the films Clueless (1995), Halloween: The Curse of Michael Myers (1995), Romeo + Juliet (1996), Wet Hot American Summer (2001), Anchorman: The Legend of Ron Burgundy (2004), The 40-Year-Old Virgin (2005), Knocked Up (2007), I Love You, Man (2009), and This Is 40 (2012). He has played the superhero Scott Lang / Ant-Man in five Marvel Cinematic Universe (MCU) films, from Ant-Man (2015) to Ant-Man and the Wasp: Quantumania (2023). He played Gary Grooberson in the Ghostbusters films Afterlife (2021) and Frozen Empire (2024).\n\nRudd has also appeared in numerous television shows, including the sitcom Friends (2002–2004) as Mike Hannigan, and has featured as a guest host of Saturday Night Live multiple times. He had a dual role in the comedy series Living with Yourself (2019), which earned him a nomination for the Golden Globe Award for Best Actor – Television Series Musical or Comedy. He starred in the miniseries The Shrink Next Door (2021). He featured in the Hulu comedy series Only Murders in the Building (2023–2024), which earned him a nomination for the Primetime Emmy Award for Outstanding Supporting Actor in a Comedy Series.\n\nDescription above from the Wikipedia article Paul Rudd, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Passaic, New Jersey, USA', '1969-04-06', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:49', '2026-02-03 21:00:49');
INSERT INTO `cast_crew` VALUES (159, 'Evangeline Lilly', 'https://image.tmdb.org/t/p/original/pJHX2jd7ytre3NQbF9nlyWUqxH3.jpg', 'actor', '640146', 'Nicole Evangeline Lilly (born August 3, 1979) is a retired Canadian actress. She gained popularity for her first leading role as Kate Austen in the ABC drama series Lost (2004–2010), which garnered her six nominations for the Saturn Award for Best Actress on Television and a nomination for the Golden Globe Award for Best Actress in a Drama Series.\n\nLilly has also appeared in the war film The Hurt Locker (2008) and the sports drama Real Steel (2011) and has starred as Tauriel in Peter Jackson\'s The Hobbit film series, appearing in The Desolation of Smaug (2013) and The Battle of the Five Armies (2014). She has also portrayed Hope van Dyne/Wasp in the Marvel Cinematic Universe (MCU) from 2015 to 2023. Lilly is also the author of a children\'s book series, The Squickerwonkers.\n\nDescription above from the Wikipedia article Evangeline Lilly, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Fort Saskatchewan, Alberta, Canada', '1979-08-03', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:50', '2026-02-03 21:00:50');
INSERT INTO `cast_crew` VALUES (160, 'Michael Douglas', 'https://image.tmdb.org/t/p/original/kVYGPIZowzXLEQfAGUNOqKjAbBb.jpg', 'actor', '640146', 'Michael Kirk Douglas (born September 25, 1944) is a retired American actor and film producer. He has received numerous accolades, including two Academy Awards, five Golden Globe Awards, a Primetime Emmy Award, the Cecil B. DeMille Award, and the AFI Life Achievement Award.\n\nThe elder son of Kirk Douglas and Diana Dill, Douglas earned his Bachelor of Arts in drama from the University of California, Santa Barbara. His early acting roles included film, stage, and television productions. Douglas first achieved prominence for his performance in the ABC police procedural television series The Streets of San Francisco, for which he received three consecutive Emmy Award nominations. In 1975, Douglas produced One Flew Over the Cuckoo\'s Nest, having acquired the rights to the Ken Kesey novel from his father. The film received critical and popular acclaim and won the Academy Award for Best Picture, earning Douglas his first Oscar as one of the film\'s producers.\n\nDouglas went on to produce films including The China Syndrome (1979) and Romancing the Stone (1984), for which he received the Golden Globe Award for Best Motion Picture—Musical or Comedy, and The Jewel of the Nile (1985). Douglas received critical acclaim for his portrayal of Gordon Gekko in Oliver Stone\'s Wall Street (1987), for which he won the Academy Award for Best Actor (a role he reprised in the sequel Wall Street: Money Never Sleeps in 2010). Other notable roles include in Fatal Attraction (1987), The War of the Roses (1989), Basic Instinct (1992), Falling Down (1993), The American President (1995), The Game (1997), Traffic (2000), and Wonder Boys (2000).\n\nIn 2013, for his portrayal of Liberace in the HBO film Behind the Candelabra, he won the Primetime Emmy Award for Outstanding Lead Actor in a Miniseries or a Movie. Douglas starred as an ageing acting coach in the Netflix comedy series The Kominsky Method (2018–2021), for which he won a Golden Globe Award for Best ctor—television series  musical or omedy. He has portrayed Hank Pym in the Marvel Cinematic Universe, beginning with Ant-Man (2015).\n\nDouglas has received notice for his humanitarian and political activism. He sits on the board of the Nuclear Threat Initiative, is an honorary board member of the anti-war grant-making foundation Ploughshares Fund, and he was appointed as a United Nations Messenger of Peace in 1998. He has been married to actress Catherine Zeta-Jones since 2000.\n\nIn July 2025, Douglas said that he was largely retired from acting, saying \"I realized I had to stop [...] I did not want to be one of those people who dropped dead on the set\". He added that while he was attached to one additional project and did not fully rule out future projects \"if something special came up\", he had no plans to work regularly again.', 'New Brunswick, New Jersey, USA', '1944-09-25', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:51', '2026-02-03 21:00:51');
INSERT INTO `cast_crew` VALUES (161, 'Michelle Pfeiffer', 'https://image.tmdb.org/t/p/original/oGUmQBU87QXAsnaGleYaAjAXSlj.jpg', 'actor', '640146', 'Michelle Marie Pfeiffer (/ˈfaɪfər/ FY-fər; born April 29, 1958) is an American actress. One of Hollywood\'s most bankable stars during the 1980s and 1990s, her performances have earned her numerous accolades including a Golden Globe Award and a British Academy Film Award, as well as nominations for three Academy Awards and a Primetime Emmy Award.\n\nPfeiffer began her acting career with minor television and film appearances and secured her first lead role in Grease 2 (1982). Her breakthrough role as Elvira Hancock in Scarface (1983) propelled her into mainstream success, which continued with performances in The Witches of Eastwick (1987) and Tequila Sunrise (1988). Pfeiffer received her first of six consecutive Golden Globe Award nominations for Married to the Mob (1988). Her roles in Dangerous Liaisons (1988) and The Fabulous Baker Boys (1989) garnered her two consecutive Academy Award nominations, for Best Supporting Actress and Best Actress, respectively, and she won a Golden Globe Award for the latter.\n\nCemented as one of the highest-paid actresses of the 1990s, Pfeiffer starred in The Russia House (1990) and Frankie and Johnny (1991). In 1992, she played Catwoman in Batman Returns and received her third Academy Award nomination for Love Field, which she followed up with performances in The Age of Innocence (1993) and Wolf (1994). She also produced several of her own features through her company, Via Rosa Productions, including Dangerous Minds (1995). Reducing her workload to prioritise her family, Pfeiffer acted sporadically throughout the 2000s, starring in What Lies Beneath (2000), White Oleander (2002), Hairspray, and Stardust (both 2007).\n\nFollowing another hiatus, Pfeiffer returned to prominence in 2017 with performances in Where Is Kyra?, Mother!, and Murder on the Orient Express, and received her first Primetime Emmy Award nomination for playing Ruth Madoff in The Wizard of Lies. In 2020, she received her eighth Golden Globe Award nomination for French Exit. Pfeiffer has played Janet van Dyne in the Marvel Cinematic Universe since 2018, beginning with Ant-Man and the Wasp.\n\nDescription above from the Wikipedia article Michael Douglas, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Santa Ana, California, USA', '1958-04-29', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:52', '2026-02-03 21:00:52');
INSERT INTO `cast_crew` VALUES (162, 'Jonathan Majors', 'https://image.tmdb.org/t/p/original/mD5Ws5WTnuHrH8y9OXyjp9bhi62.jpg', 'actor', '640146', 'Jonathan Michael Majors (born September 7, 1989) is an American actor. A graduate of the Yale School of Drama, Majors rose to prominence for starring in the drama films The Last Black Man in San Francisco (2019) and Da 5 Bloods (2020) and the HBO horror series Lovecraft Country (2020), for which he received a nomination from the Primetime Emmy Awards.\n\nMajors has since portrayed Nat Love in the western The Harder They Fall (2021), Jesse L. Brown in the war film Devotion (2022), and antagonist Dame Anderson in the sports film Creed III (2023). In the Marvel Cinematic Universe (MCU), he portrayed Kang the Conqueror in the film Ant-Man and the Wasp: Quantumania (2023) while also appearing as other variants of the character in the Disney+ series Loki (2021–2023).\n\nIn March 2023, Majors was arrested for physically assaulting his ex-girlfriend, Grace Jabbari. That December, he was found guilty of two misdemeanour counts of assault and harassment. After the conviction, he was dropped from numerous upcoming projects, including any future involvement with the MCU. He is currently serving a 52-week in-person domestic violence intervention program.\n\nDescription above from the Wikipedia article Jonathan Majors, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Dallas, Texas, USA', '1989-09-07', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:53', '2026-02-03 21:00:53');
INSERT INTO `cast_crew` VALUES (163, 'Jamie Christopher', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '640146', 'Jamie Christopher (22 December 1971 – 29 August 2023) was a British assistant director and film producer. He worked on numerous films, including the Harry Potter series, Guardians of the Galaxy, Avengers: Age of Ultron, and Star Wars: The Last Jedi.\n\nDescription above from the Wikipedia article Jamie Christopher, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'London, England, UK', '1971-07-01', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:54', '2026-02-03 21:00:54');
INSERT INTO `cast_crew` VALUES (164, 'Mitch Gould', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '640146', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:55', '2026-02-03 21:00:55');
INSERT INTO `cast_crew` VALUES (165, 'Michael Stevenson', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '640146', 'Michael Stevenson is a film industry legend, with a career spanning 60 years as an assistant director on film\'s such as Lawrence of Arabia, The Shining, the Harry Potter series, and, recently, Doctor Strange in the Multiverse of Madness. In 2003, his friend Sir Michael Caine presented him and David Tomblin with the BAFTA for Outstanding Contribution to British Cinema.', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:58', '2026-02-03 21:00:58');
INSERT INTO `cast_crew` VALUES (166, 'Peyton Reed', 'https://image.tmdb.org/t/p/original/aucXNycAtFREMIKr6ikmHvd2Mmp.jpg', 'director', '640146', 'Peyton Tucker Reed (born July 3, 1964) is an American television and film director. He directed the comedy films Bring It On, Down with Love, The Break-Up, and Yes Man, as well as the superhero film Ant-Man and its sequels.\n\nReed was born in Raleigh, North Carolina, and attended the University of North Carolina at Chapel Hill, graduating in 1987 with a degree in English and Radio, Television & Motion Pictures. He was a DJ for WXYC, the UNC student radio station, while enrolled at the university. He worked as a van driver on the set of Bull Durham in 1987, which was partially filmed in Raleigh.\n\nReed\'s directorial debut, the motion picture Bring It On, was a number one box office hit. He also directed Down with Love and The Break-Up, all comedy films. He has also acted in small roles in some films, including his own, and has written a few original songs for his soundtracks. He has also produced a few music videos.\n\nPeyton Reed was originally set to direct the 20th Century Fox production Fantastic Four before departing the project and being replaced by director Tim Story.\n\nReed directed the 2008 film Yes Man, starring Jim Carrey. Yes Man is an adaptation of Danny Wallace\'s autobiography about his decision to say \"yes\" to whatever offer, invitation, challenge, or opportunity that is presented to him.\n\nReed replaced Edgar Wright as the director of Ant-Man. Prior to joining the production of Ant-Man, Reed was slated to direct a Brian Epstein biopic, based on the graphic novel The Fifth Beatle. However, his commitment to the superhero film required him to part ways with The Fifth Beatle. Reed then went on to direct Ant-Man and the Wasp, the sequel to Ant-Man. He also directed the third Ant-Man film, Ant-Man and the Wasp: Quantumania.\n\nReed directed two episodes from the second season of the Disney+ series The Mandalorian, part of the Star Wars franchise.\n\nReed lives in the Los Angeles area with his second wife, Sheila Naghshineh, and their two sons. He was previously married to Beth LaMure from 1998 to 2006.\n\nHe plays in the band Cardinal Family Singers with Norwood Cheek. The band has released three albums, and their instrumental song \"Tilting Scale\" is featured in Ant-Man and the Wasp.\n\nDescription above from the Wikipedia article Peyton Reed, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Raleigh, North Carolina, USA', '1964-07-03', NULL, 1, 1, NULL, NULL, '2026-02-03 21:00:59', '2026-02-03 21:00:59');
INSERT INTO `cast_crew` VALUES (167, 'Jo Beckett', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '640146', 'Jo Beckett is a British script supervisor in both film and television. Her credits include Marvel Studios blockbuster features such as Doctor Strange (2016), Spider‑Man: Far From Home (2019), Eternals (2021), Doctor Strange in the Multiverse of Madness (2022), and Ant‑Man and the Wasp: Quantumania (2023).\n\nHer involvement extends well beyond the Marvel Cinematic Universe. She supervised Morbius (2022), the Cinderella reimagining (2021), The Voyage of Doctor Dolittle (2020), Last Christmas (2019), Jurassic World: Fallen Kingdom (2018), The Nutcracker and the Four Realms (2018), The Mummy (2017), Maleficent (2014), and In the Heart of the Sea (2015), among many others.\n\nEarlier in her career, Beckett established herself in British television with credits on series such as Room at the Top, Ashes to Ashes, Holby Blue, The Street, Wire in the Blood, Trial & Retribution, Event Horizon, Family Affairs, Dream Team, Misfits, and the BAFTA-winning short film My Wrongs 8245‑8249 and 117 (2003). She also handled units on features like Moon (2009) and Breaking and Entering (2006).', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:01:00', '2026-02-03 21:01:00');
INSERT INTO `cast_crew` VALUES (168, 'Sam Worthington', 'https://image.tmdb.org/t/p/original/mflBcox36s9ZPbsZPVOuhf6axaJ.jpg', 'actor', '83533', 'Samuel Henry John Worthington (born 2 August 1976) is an Australian actor. He is known for playing Jake Sully in the Avatar franchise (2009–present), Marcus Wright in Terminator Salvation (2009), and Perseus in Clash of the Titans (2010) and its sequel Wrath of the Titans (2012).\n\nHe has taken other dramatic roles, appearing in The Debt (2010), Everest (2015), Hacksaw Ridge (2016), The Shack (2017), Manhunt (2017), and Fractured (2019). He has received Australia\'s highest film award three times for his leading roles in Bootmen (2000), Somersault (2004), and Avatar (2009).\n\nOn television, Worthington appeared in Australia as Howard in Love My Way and Phillip Schuler in the television drama mini-series Deadline Gallipoli, for which he was also an executive producer. He voiced the protagonist, Captain Alex Mason, in the video game Call of Duty: Black Ops (2010) and its sequels Call of Duty: Black Ops II (2012) and Call of Duty: Black Ops 4 (2018).\n\nDescription above from the Wikipedia article Sam Worthington, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Godalming, Surrey, England, UK', '1976-08-02', NULL, 1, 1, NULL, NULL, '2026-02-03 21:01:20', '2026-02-03 21:01:20');
INSERT INTO `cast_crew` VALUES (169, 'Zoe Saldaña', 'https://image.tmdb.org/t/p/original/vQBwmsSOAd0JDaEcZ5p43J9xzsY.jpg', 'actor', '447365', 'Zoë Yadira Saldaña-Perego (/sɑːlˈdænjə/ sahl-DAN-yə, Latin American Spanish: [ˈso.e salˈdaɲa]; née Saldaña Nazario; born June 19, 1978) is an American actress. Known primarily for her work in science fiction film franchises, she has starred in four of the seven highest-grossing films of all time, including the top three (Avatar, Avatar: The Way of Water, and Avengers: Endgame). Films she has appeared in have grossed more than $15 billion worldwide, and, as of 2024, she is the second highest-grossing lead actress and the highest-grossing actress overall.  Time magazine named her one of the 100 most influential people in the world in 2023.\n\nA trained dancer, Saldaña began her on-screen acting career in 1999 with a guest role in Law & Order. Her first film role was in Center Stage(2000), where she played a ballet dancer. She received early recognition for her work opposite Britney Spears in the road film Crossroads (2002). Beginning in 2009, Saldaña achieved a career breakthrough with her roles as Nyota Uhura in the Star Trek reboot film series and Neytiri in James Cameron\'s Avatar film series. She portrayed Gamora in five films in the Marvel Cinematic Universe, from Guardians of the Galaxy (2014) to Guardians of the Galaxy Vol. 3 (2023).\n\nIn addition to franchise work, Saldaña has starred in the science fiction film The Adam Project and the romantic drama miniseries From Scratch, both for Netflix in 2022. In 2023, she began playing the lead role of a CIA officer in the Paramount+ spy series Lioness. In 2024, Saldaña starred in the musical crime film Emilia Pérez, for which she received several accolades, including the Academy Award, BAFTA Award and Golden Globe Award for Best Supporting Actress.\n\nDescription above from the Wikipedia article Zoe Saldaña, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Passaic, New Jersey, USA', '1978-06-19', NULL, 1, 1, NULL, NULL, '2026-02-03 21:01:32', '2026-02-04 11:45:25');
INSERT INTO `cast_crew` VALUES (170, 'Sigourney Weaver', 'https://image.tmdb.org/t/p/original/wTSnfktNBLd6kwQxgvkqYw6vEon.jpg', 'actor', '83533', 'Susan Alexandra \"Sigourney\" Weaver (born October 8, 1949) is an American actress. Weaver is considered to be a pioneer of action heroines in science fiction films. She is known for her role as Ellen Ripley in the Alien franchise, which earned her an Academy Award nomination in 1986 and is often regarded as one of the most significant female protagonists in cinema history.\n\nA seven-time Golden Globe Award nominee, Weaver won both Best Actress in Drama and Best Supporting Actress in 1988 for her work in the films Gorillas in the Mist and Working Girl, becoming the first person to win two acting Golden Globes in the same year. She also received Academy Award nominations for both films. For her role in the film The Ice Storm (1997), she won the BAFTA Award for Best Actress ina Supporting Role. She also received a Tony Award nomination for her work in the 1984 Broadway play Hurlyburly.\n\nWeaver\'s other film roles include Ghostbusters (1984), Ghostbusters II (1989), Dave (1993), Galaxy Quest (1999), Holes (2003), WALL-E (2008), Avatar (2009), Prayers for Bobby (2009), Paul (2011), The Cabin in the Woods (2012), and A Monster Calls (2016); and the television miniseries Political Animals (2012) and The Defenders (2017).\n\nDescription above from the Wikipedia article Sigourney Weaver, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Manhattan, New York City, New York, USA', '1949-10-08', NULL, 1, 1, NULL, NULL, '2026-02-03 21:01:33', '2026-02-03 21:01:33');
INSERT INTO `cast_crew` VALUES (171, 'Stephen Lang', 'https://image.tmdb.org/t/p/original/gnO5VfkDgA2fsHweD0622LUY3Hu.jpg', 'actor', '83533', 'Stephen Lang (born July 11, 1952) is an American actor and playwright. He started in theatre on Broadway but is well known for his film portrayals of Stonewall Jackson in Gods and Generals (2003), George Pickett in Gettysburg (1993), and his 2009 roles as Colonel Miles Quaritch in Avatar and as Texan lawman Charles Winstead in Public Enemies. Lang was the co-artistic director (along with Carlin Glynn and Lee Grant) of the famed Actor\'s Studio at its headquarters in New York City from 2004 to 2006.\n\nDescription above from the Wikipedia article Stephen Lang (actor), licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'New York, New York, U.S', '1952-07-11', NULL, 1, 1, NULL, NULL, '2026-02-03 21:01:34', '2026-02-03 21:01:34');
INSERT INTO `cast_crew` VALUES (172, 'Oona Chaplin', 'https://image.tmdb.org/t/p/original/tT7QQOrumeGRquaLmWNZk2DyL3Z.jpg', 'actor', '83533', 'Oona Castilla Chaplin (born 4 June 1986) is a Spanish–Swiss actress. Her roles include Talisa Maegyr in the HBO TV series Game of Thrones, Kitty Trevelyan in the BBC drama The Crimson Field, and Zilpha Geary in the series Taboo.\n\nA member of the Chaplin family, she is the daughter of actress Geraldine Chaplin, granddaughter of English filmmaker and actor Charlie Chaplin, and great-granddaughter of Irish-American playwright Eugene O\'Neill. She was named after her maternal grandmother Oona O\'Neill, Charlie Chaplin’s fourth and final wife.', 'Madrid, Spain', '1986-06-04', NULL, 1, 1, NULL, NULL, '2026-02-03 21:01:35', '2026-02-03 21:01:35');
INSERT INTO `cast_crew` VALUES (173, 'James Cameron', 'https://image.tmdb.org/t/p/original/9NAZnTjBQ9WcXAQEzZpKy4vdQto.jpg', 'director', '83533', 'James Francis Cameron (born August 16, 1954) is a Canadian filmmaker. He is a major figure in the post-New Hollywood era and often uses novel technologies with a classical filmmaking style. Cameron first gained recognition for writing and directing The Terminator (1984), and found further success with Aliens (1986), The Abyss (1989), Terminator 2: Judgment Day (1991), and True Lies (1994), as well as Avatar (2009) and its sequels. He directed, wrote, co-produced, and co-edited Titanic (1997), winning Academy Awards for Best Picture, Best Director, and Best Film Editing. He is a recipient of various other industry accolades, and three of his films have been selected for preservation in the National Film Registry by the Library of Congress.\n\nCameron co-founded the production companies Lightstorm Entertainment, Digital Domain, and Earthship Productions. In addition to filmmaking, he is a National Geographic explorer-in-residence. He has produced many documentaries on deep-ocean exploration, including Ghosts of the Abyss (2003) and Aliens of the Deep (2005). Cameron has also contributed to underwater filming and remote vehicle technologies and helped create the digital 3D Fusion Camera System. In 2012, Cameron became the first person to solo descend the Mariana Trench, the deepest part of the Earth\'s ocean, in the Deepsea Challenger submersible.\n\nCameron\'s films have grossed over $8 billion worldwide, making him the second-highest-grossing film director. Three of Cameron\'s films are among the top four highest-grossing films of all time; Avatar (2009), Avatar: The Way of Water (2022) and Titanic (1997) are the highest, third-highest and fourth-highest-grossing films of all time, respectively. Cameron directed the first film to gross over $1 billion, the first two films to gross over $2 billion, and is the only director to have had three films grossing over $2 billion. In 2010, Time named Cameron one of the 100 most influential people in the world. Cameron is also an environmentalist and runs several sustainability businesses.\n\nDescription above from the Wikipedia article James Cameron, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Kapuskasing, Ontario, Canada', '1954-08-16', NULL, 1, 1, NULL, NULL, '2026-02-03 21:01:36', '2026-02-03 21:01:36');
INSERT INTO `cast_crew` VALUES (174, 'Maria Battle-Campbell', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '83533', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:01:38', '2026-02-03 21:01:38');
INSERT INTO `cast_crew` VALUES (175, 'Millie Bobby Brown', 'https://image.tmdb.org/t/p/original/tyV387sK2ix8UTjv4gihNkC7J9n.jpg', 'actor', '763215', 'Millie Bonnie Bongiovi (born 19 February 2004), a British actress, is professionally known as Millie Bobby Brown. She gained recognition for playing Eleven in the Netflix science fiction series Stranger Things (2016–2025), for which she received nominations for two Primetime Emmy Awards. Brown has starred in the monster film Godzilla: King of the Monsters (2019) and its sequel Godzilla vs. Kong (2021). She also starred in and produced the Netflix films Enola Holmes (2020), Enola Holmes 2 (2022), and Damsel (2024).\n\nIn 2018, Brown was featured in the Time 100 list of the world\'s most influential people and appointed a UNICEF Goodwill Ambassador, the youngest person ever selected for this position.', 'Marbella, Málaga, Andalusia, Spain', '2004-02-19', NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:24', '2026-02-03 21:06:24');
INSERT INTO `cast_crew` VALUES (176, 'Brooke Carter', 'https://image.tmdb.org/t/p/original/tdLdWvLc7hAt6spLaogFuEDnsBZ.jpg', 'actor', '763215', 'Brooke Carter is known for Damsel (2024), The Peripheral (2022) and The Alienist (2018).', 'Coventry, England, United Kingdom', '2010-05-31', NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:25', '2026-02-03 21:06:25');
INSERT INTO `cast_crew` VALUES (177, 'Nick Robinson', 'https://image.tmdb.org/t/p/original/mzYszYVPvTdirjkUueziWUHvye7.jpg', 'actor', '763215', 'Nicholas John \"Nick\" Robinson (born March 22, 1995) is an American actor. As a child, he appeared in stage productions of A Christmas Carol and Mame (both in 2008), following which he starred in the television sitcom Melissa & Joey (2010–2015). He went on play a supporting role in the highly successful science fiction film Jurassic World (2015) and took on lead roles in several teen dramas, including The Kings of Summer (2013), The 5th Wave (2016), and Everything, Everything (2017). In 2018, Robinson starred as the titular protagonist Simon Spier in the romantic comedy-drama film Love, Simon.', 'Seattle, Washington, USA', '1995-03-22', NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:26', '2026-02-03 21:06:26');
INSERT INTO `cast_crew` VALUES (178, 'Robin Wright', 'https://image.tmdb.org/t/p/original/d3rIv0y2p0jMsQ7ViR7O1606NZa.jpg', 'actor', '763215', 'Robin Gayle Wright (born April 8, 1966) is an American actress. She is best known for her roles as Jenny Curran in Forrest Gump, as Buttercup in The Princess Bride, and as Mary Surratt in The Conspirator. She has also been credited as Robin Wright Penn.', 'Dallas, Texas, USA', '1966-04-08', NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:27', '2026-02-03 21:06:27');
INSERT INTO `cast_crew` VALUES (179, 'Milo Twomey', 'https://image.tmdb.org/t/p/original/dOWhwnXKIWpumwHKnaV86V86XMS.jpg', 'actor', '763215', '', 'London, England, UK', '1969-01-01', NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:28', '2026-02-03 21:06:28');
INSERT INTO `cast_crew` VALUES (180, 'Chris Castaldi', 'https://image.tmdb.org/t/p/original/8wndmlAfA7R5JuGwxTK7S4TB64O.jpg', 'director', '763215', 'Chris Castaldi is a first assistant director and producer. Castaldi\'s notable credits include Avengers: Endgame (2019), Avengers: Infinity War (2018), Jurassic World (2015), Captain America: Civil War (2016), and The Gray Man (2022).\n\nIn addition to his work as a first assistant director, Castaldi has expanded his involvement in the film industry by taking on producing roles. He served as a producer on The Electric State, a science fiction film directed by the Russo brothers.', 'USA', NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:29', '2026-02-03 21:06:29');
INSERT INTO `cast_crew` VALUES (181, 'Phil Booth', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '763215', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:30', '2026-02-03 21:06:30');
INSERT INTO `cast_crew` VALUES (182, 'Juan Carlos Fresnadillo', 'https://image.tmdb.org/t/p/original/j0syLia3v2znuWhawJRkVsyJU8a.jpg', 'director', '763215', 'Juan Carlos Fresnadillo (born 5 December 1967) is a Spanish film director, script writer, and producer. He directed Intacto and 28 Weeks Later, the sequel to Danny Boyle\'s 28 Days Later. His film Esposados was nominated for the Academy Award for Best Live Action Short Film in 1996.', 'Tenerife, Canary Islands, Spain', '1967-12-05', NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:31', '2026-02-03 21:06:31');
INSERT INTO `cast_crew` VALUES (183, 'Megan Lynas', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '763215', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:06:32', '2026-02-03 21:06:32');
INSERT INTO `cast_crew` VALUES (184, 'Ryan Gosling', 'https://image.tmdb.org/t/p/original/asoKC7CLCqpZKZDL6iovNurQUdf.jpg', 'actor', '746036', 'Ryan Thomas Gosling (born November 12, 1980) is a Canadian actor. Prominent in independent film, he has also worked in blockbuster films of varying genres, and has accrued a worldwide box office gross of over 1.9 billion USD. He has received various accolades, including a Golden Globe Award, and nominations for two Academy Awards and a BAFTA Award.\n\nBorn and raised in Canada, he rose to prominence at age 13 for being a child star on the Disney Channel\'s The Mickey Mouse Club (1993–1995), and went on to appear in other family entertainment programs, including Are You Afraid of the Dark? (1995) and Goosebumps (1996). His first film role was as a Jewish neo-Nazi in The Believer (2001), and he went on to star in several independent films, including Murder by Numbers (2002), The Slaughter Rule (2002), and The United States of Leland (2003).\n\nGosling gained wider recognition and stardom for the 2004 romance film The Notebook. This was followed by starring roles in a string of critically acclaimed independent dramas including Half Nelson (2006), for which he was nominated for the Academy Award for Best Actor. Gosling co-starred in three mainstream films in 2011, the romantic comedy Crazy, Stupid, Love and the action drama Drive, all of which were critical and commercial successes. He then starred in the acclaimed financial satire The Big Short (2015) and the romantic musical La La Land (2016), the latter of which won him the Golden Globe Award for Best Actor and a second Academy Award nomination for Best Actor. Further acclaim followed with the science fiction thriller Blade Runner 2049 (2017) and the biopic First Man (2018). In addition to acting, he made his directorial debut in 2014\'s Lost River.', 'London, Ontario, Canada', '1980-11-12', NULL, 1, 1, NULL, NULL, '2026-02-03 21:33:34', '2026-02-03 21:33:34');
INSERT INTO `cast_crew` VALUES (185, 'Emily Blunt', 'https://image.tmdb.org/t/p/original/5nCSG5TL1bP1geD8aaBfaLnLLCD.jpg', 'actor', '746036', 'Emily Olivia Laura Blunt (born 23 February 1983) is a British actress. She has received several accolades, including a Golden Globe Award and two Screen Actors Guild Awards, in addition to nominations for an Academy Award and four British Academy Film Awards. Forbes ranked her as one of the highest-paid actresses in the world in 2020.\n\nBlunt made her acting debut in the 2001 drama production of The Royal Family and portrayed Catherine Howard in the television miniseries Henry VIII (2003). She made her feature film debut in the drama My Summer of Love (2004). Blunt\'s breakthrough came in 2006 with her starring roles in the television film Gideon\'s Daughter and the comedy-drama  The Devil Wears Prada. The former won her a Golden Globe Award for Best Supporting Actress. Her profile continued to grow with leading roles in the period film The Young Victoria (2009), the romantic comedy Salmon Fishing in the Yemen (2011), the science fiction films The Adjustment Bureau (2011), Looper(2012) and Edge of Tomorrow (2014), and the musical Into the Woods (2014).\n\nBlunt received critical acclaim for playing an idealistic FBI agent in the crime film Sicario (2015), an alcoholic in the psychological thriller The Girl on the Train (2016), and a survivalist mother in her husband John Krasinski\'s horror film A Quiet Place (2018), for which she won a SAG Award for Best Supporting Actress. She has since starred in the sequels Mary Poppins Returns (2018) and A Quiet Place Part II (2021), the fantasy adventure Jungle Cruise (2021), and the revisionist Western television miniseries The English (2022). Her portrayal of Katherine Oppenheimer in Christopher Nolan\'s biographical thriller film Oppenheimer (2023) earned her a nomination for the Academy Award for Best Supporting Actress.\n\nBlunt has been working with the American Institute for Stuttering since 2006 to help children overcome stuttering through educational resources and raise awareness of the realities of the condition. She is on the institute\'s board of directors and hosts a gala to raise funds for speech therapy scholarships for children and adults.\n\nDescription above from the Wikipedia article Emily Blunt, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Wandsworth, London, England, UK', '1983-02-23', NULL, 1, 1, NULL, NULL, '2026-02-03 21:33:35', '2026-02-03 21:33:35');
INSERT INTO `cast_crew` VALUES (186, 'Hannah Waddingham', 'https://image.tmdb.org/t/p/original/eHAICyhvjiRZCgzKyJCk9hWnnjr.jpg', 'actor', '746036', 'Hannah Waddingham (born 28 July 1974) is an English actress, singer and television presenter. She is known for playing businesswoman Rebecca Welton in Ted Lasso (2020–2023), for which she won a Primetime Emmy Award for Outstanding Supporting Actress in a Comedy Series in 2021 and the Critics\' Choice Television Award for Best Supporting Actress in a Comedy Series in both 2021 and 2022.\n\nShe has also appeared in several West End shows, including Spamalot, the 2010 Regent\'s Park revival of Into the Woods and The Wizard of Oz as the Wicked Witch of the West. She has received three Olivier Award nominations for her work.\n\nWaddingham\'s film work includes the film adaptation of Les Misérables (2012), the psychological thriller Winter Ridge (2018) and the action comedy The Fall Guy (2024). Other notable television roles include playing Tonya Dyke in Benidorm (2014), Septa Unella in the fifth season of the HBO series Game of Thrones(2015–2016), Jax-Ur in Krypton (2018–2019) and Sofia Marchetti in Sex Education (2019–2023). In 2023, she co-hosted the Eurovision Song Contest. Beginning in 2023, Waddingham began to expand into voice acting, portraying the snarky goddess Deliria in the animated series Krapopolis (2023-present) and earning a Primetime Emmy Award for Outstanding Character Voice-Over Performance nomination and Jinx in The Garfield Movie.\n\nDescription above from the Wikipedia article about Hannah Waddingham, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Wandsworth, London, England, UK', '1974-07-28', NULL, 1, 1, NULL, NULL, '2026-02-03 21:33:37', '2026-02-03 21:33:37');
INSERT INTO `cast_crew` VALUES (187, 'Teresa Palmer', 'https://image.tmdb.org/t/p/original/sjSiLSCp9LS1Z0nyGpmquTBuUyr.jpg', 'actor', '746036', 'Teresa Mary Palmer (born 26 February 1986) is an Australian actress. She began her career with roles in Bedtime Stories (2008), The Sorcerer\'s Apprentice (2010), Take Me Home Tonight (2011), and I Am Number Four (2011). She received further recognition for starring in the films Warm Bodies (2013), Lights Out (2016), Hacksaw Ridge (2016), and Berlin Syndrome (2017). She also starred in, co-wrote, and co-produced the drama film The Ever After (2014), with her husband Mark Webber. From 2018 to 2022, Palmer starred as Diana Bishop in the supernatural drama series A Discovery of Witches.', 'Adelaide, South Australia, Australia', '1986-02-26', NULL, 1, 1, NULL, NULL, '2026-02-03 21:33:38', '2026-02-03 21:33:38');
INSERT INTO `cast_crew` VALUES (188, 'Paul Barry', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '746036', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:33:41', '2026-02-03 21:33:41');
INSERT INTO `cast_crew` VALUES (189, 'Deborah Antoniou', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '746036', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:33:44', '2026-02-03 21:33:44');
INSERT INTO `cast_crew` VALUES (190, 'J. Houston Yang', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '746036', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 21:33:45', '2026-02-03 21:33:45');
INSERT INTO `cast_crew` VALUES (191, 'Rebecca Hall', 'https://image.tmdb.org/t/p/original/u1Q7HF01llNzx0yx0A8g2W0Xj9L.jpg', 'actor', '823464', 'Rebecca Maria Hall (born May 3, 1982) is an English actress and filmmaker. She made her first onscreen appearance at age 10 in the 1992 television adaptation of The Camomile Lawn, directed by her father, Sir Peter Hall. Her professional stage debut came in her father\'s 2002 production of Mrs. Warren\'s Profession, which earned her the Ian Charleson Award.\n\nIn 2006, following her film debut in Starter for 10, Hall got her breakthrough role in Christopher Nolan\'s thriller film The Prestige. In 2008, she starred as Vicky in Woody Allen\'s romantic comedy-drama Vicky Cristina Barcelona, for which she received a Golden Globe nomination for Best Actress. Hall then appeared in a wide array of films, including Ron Howard\'s historical drama Frost/Nixon (2008), Ben Affleck\'s crime drama The Town (2010), the horror thriller The Awakening (2011), the superhero film Iron Man 3 (2013), the science fiction film Transcendence (2014), the psychological thriller The Gift (2015), the live-action/CGI fantasy adventure film The BFG (2016), the biographical drama Professor Marston and the Wonder Women (2017) and the monster film Godzilla vs. Kong (2021). In 2016, Hall was praised by critics for her portrayal of news reporter Christine Chubbuck in the biographical drama Christine. She made her directorial debut with Passing (2021), receiving critical acclaim.\n\nHall has also made several notable appearances on British television. She won the British Academy Television Award for Best Supporting Actress for the 2009 Channel 4 miniseries Red Riding: 1974. In 2013, she was nominated for the British Academy Television Award for Best Actress for her performance in BBC Two\'s Parade\'s End.\n\nDescription above from the Wikipedia article Rebecca Hall, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'London, England, UK', '1982-05-03', NULL, 1, 1, NULL, NULL, '2026-02-03 22:14:49', '2026-02-03 22:14:49');
INSERT INTO `cast_crew` VALUES (192, 'Brian Tyree Henry', 'https://image.tmdb.org/t/p/original/1UgDnFt3OteCJQPiUelWzIR5bvT.jpg', 'actor', '823464', 'Brian Tyree Henry (born March 31, 1982) is an American actor. He rose to prominence for his role as rapper Alfred \"Paper Boi\" Miles in the FX comedy-drama series Atlanta (2016–2022), for which he received a nomination for the Primetime Emmy Award for Outstanding Supporting Actor in a Comedy Series.\n\nHenry had a guest role in This Is Us in 2017 and had his film breakthrough in 2018 with roles in Steve McQueen\'s heist film Widows and Barry Jenkins\' romantic drama If Beale Street Could Talk. He has since appeared in Child\'s Play (2019), Joker (2019), Godzilla vs. Kong (2021), Bullet Train (2022), and Godzilla x Kong: The New Empire (2024). He portrayed Phastos in the Marvel Cinematic Universe film Eternals (2021). He was nominated for the Academy Award for Best Supporting Actor for playing a grieving man in the drama film Causeway (2022). He also voiced Jefferson Davis in Spider-Man: Into the Spider-Verse (2018) and its sequel, Spider-Man: Across the Spider-Verse (2023) and Megatron in Transformers One (2024).\n\nHenry has also appeared on stage, making his debut performance in the Shakespeare in the Park production of Romeo and Juliet (2007) and acting in various plays at the Public Theatre before appearing in the original Broadway cast of The Book of Mormon (2011). In 2014, he appeared in the off-Broadway musical The Fortress of Solitude. For his performance in the 2018 Broadway revival of Kenneth Lonergan\'s play Lobby Hero, he received a nomination for the Tony Award for Best Featured Actor in a Play.\n\nDescription above from the Wikipedia article Brian Tyree Henry, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Fayetteville, North Carolina, USA', '1982-03-31', NULL, 1, 1, NULL, NULL, '2026-02-03 22:14:50', '2026-02-03 22:14:50');
INSERT INTO `cast_crew` VALUES (193, 'Kaylee Hottle', 'https://image.tmdb.org/t/p/original/xpQQZgptOUI6duMMBDyCiaJ4JUv.jpg', 'actor', '823464', 'Kaylee Hottle comes from an all-Deaf family, spanning four generations of Deaf relatives on her father\'s side. She made her debut in the 2021 MonsterVerse film, Godzilla vs. Kong.', 'Atlanta, Georgia, USA', '2008-05-01', NULL, 1, 1, NULL, NULL, '2026-02-03 22:14:52', '2026-02-03 22:14:52');
INSERT INTO `cast_crew` VALUES (194, 'Alex Ferns', 'https://image.tmdb.org/t/p/original/3V3L7MJGURXU6lVaqai80zFT4Wa.jpg', 'actor', '823464', 'Alex Ferns is a Scottish actor who is perhaps best known for playing abusive husband Trevor in BBC soap EastEnders. His film credits include Joyeux Noël, The Legend of Tarzan and the lead role in 2004\'s Man Dancin\'. In 2019, Ferns starred as mining crew leader Andrei Glukhov in HBO/Sky miniseries Chernobyl.', 'Lennoxtown, Scotland, UK', '1968-10-13', NULL, 1, 1, NULL, NULL, '2026-02-03 22:14:53', '2026-02-03 22:14:53');
INSERT INTO `cast_crew` VALUES (195, 'Adam Wingard', 'https://image.tmdb.org/t/p/original/csunrewJCACuvM3Ntd9kIi31twa.jpg', 'director', '823464', 'Adam Wingard (/ˈwɪŋɡɑːrd/ WING-gard; born December 3, 1982) is an American filmmaker. He has been a film director, producer, screenwriter, editor, cinematographer, actor, and composer in numerous American films.\n\nFollowing an early career as a member of the mumblecore movement, he became notable for his works in the horror and action genres, especially the films You\'re Next (2011) and The Gust (2014) and the bigger-budget franchise films Blair Witch (2016), Death Note (2017), and Godzilla vs. Kong (2021), and its sequel Godzilla x Kong: The New Empire (2024).\n\nDescription above from the Wikipedia article Adam Wingard, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Oak Ridge, Tennessee, USA', '1982-12-03', NULL, 1, 1, NULL, NULL, '2026-02-03 22:14:54', '2026-02-03 22:14:54');
INSERT INTO `cast_crew` VALUES (196, 'Pier Glionna', 'https://image.tmdb.org/t/p/original/11xPvx8UEvO17U0ZGPtQS9g5iKC.jpg', 'director', '823464', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 22:14:57', '2026-02-03 22:14:57');
INSERT INTO `cast_crew` VALUES (197, 'Brian Avery Galligan', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '823464', '', 'Chapel Hill, North Carolina, USA', NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 22:14:58', '2026-02-03 22:14:58');
INSERT INTO `cast_crew` VALUES (198, 'Joaquin Phoenix', 'https://image.tmdb.org/t/p/original/u38k3hQBDwNX0VA22aQceDp9Iyv.jpg', 'actor', '889737', 'Joaquin Rafael Phoenix (born October 28, 1974) is an American actor. Known for his roles as dark, unconventional and eccentric characters, particularly in period dramas, he has received various accolades, including an Academy Award, a British Academy Film Award, a Grammy Award, and two Golden Globe Awards. In 2020, The New York Times named him one of the greatest actors of the 21st century.\n\nPhoenix began his career by appearing in a television series in the early 1980s with his older brother River. His first major film roles were in SpaceCamp (1986) and Parenthood (1989). During this period, he was credited as Leaf Phoenix. He began being credited as Joaquin Phoenix in To Die For, his first adult role. He received critical acclaim for his supporting roles in the comedy-drama To Die For (1995) and the period film Quills (2000). Phoenix received further critical acclaim and a nomination for the Academy Award for Best Supporting Actor for his portrayal of Commodus in the historical drama Gladiator (2000). He had success with the horror films Signs (2002), The Village (2004) and the historical drama Hotel Rwanda (2004). He won a Grammy Award, a Golden Globe Award, and a nomination for the Academy Award for Best Actor for his portrayal of musician Johnny Cash in the biopic Walk the Line (2005).\n\nFollowing a brief sabbatical, Phoenix starred in the psychological drama The Master (2012), winning the Volpi Cup for Best Actor and earning his third Academy Award nomination. He gained praise for his roles in the romantic drama Her (2013) and the crime satire Inherent Vice (2014) and won the Cannes Film Festival Award for Best Actor for the psychological thriller You Were Never Really Here (2017). For his performance as the titular character of Joker (2019), Phoenix won the Academy Award for Best Actor. He has since starred in the independent films C\'mon C\'mon (2021), and Beau Is Afraid (2023) and portrayed the title role in the historical drama Napoleon (2023).\n\nOutside of acting, Phoenix is an animal rights activist. A vegan, he regularly supports charitable causes and has produced several documentaries on global meat consumption and its impact on the environment.', 'San Juan, Puerto Rico', '1974-10-28', NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:35', '2026-02-03 22:29:35');
INSERT INTO `cast_crew` VALUES (199, 'Lady Gaga', 'https://image.tmdb.org/t/p/original/9Y4Pz7AEXhB9qNar2tMsx5EVXML.jpg', 'actor', '889737', 'Stefani Joanne Angelina Germanotta (born March 28, 1986), known professionally as Lady Gaga, is an American singer, songwriter, and actress. Known for her image reinventions and versatility across the entertainment industry, she is an influential figure in popular music. With estimated sales of 124 million records, she is one of the best-selling music artists of all time. Publications such as Billboard and Rolling Stone have ranked her among the greatest artists in history.\n\nAfter signing with Interscope Records in 2007, Gaga achieved global recognition with her debut album, The Fame (2008), and its reissue, The Fame Monster (2009). The project yielded a string of successful singles, including \"Just Dance\", \"Poker Face\", and \"Bad Romance\", making her one of the few artists with at least 3 Diamond-certified songs in the US. Her second studio album, Born This Way (2011), explored electronic rock and techno-pop and sold 1.1 million copies in its first week in the US. Its title track became the fastest-selling song on the iTunes Store, with over one million downloads in less than a week. Following her electronic dance music-influenced third album, Artpop (2013), she pursued jazz on the album Cheek to Cheek (2014) with Tony Bennett. She delved into soft rock on the album Joanne (2016).\n\nGaga also ventured into acting, gaining praise for her leading roles in the miniseries American Horror Story: Hotel (2015–2016) and the films A Star Is Born (2018) and House of Gucci (2021). Her contributions to the A Star Is Born soundtrack, which spawned the chart-topping single \"Shallow\", made her the first person to win an Academy Award, a BAFTA, a Golden Globe, and a Grammy Award in one year. Gaga returned to her early sound with the pop-oriented albums Chromatica (2020) and Mayhem (2025), which respectively included the number-one singles \"Rain on Me\" and \"Die with a Smile\". She also continued to explore jazz with Love for Sale (2021), her second and final album with Bennett, and the soundtrack Harlequin (2024).\n\nGaga has seven number-one albums and six number-one songs on the US Billboard 200 and Hot 100 charts, respectively. She is the only female artist with four singles that each sold at least 10 million copies globally, and she holds the record for the most-attended concert by a woman. The highest-paid female musician in 2011, she has received 14 Grammy Awards, 22 MTV Video Music Awards, two Golden Globe Awards, a Sports Emmy Award, and recognition from the Songwriters Hall of Fame. Gaga\'s philanthropy and activism focus on mental health awareness and LGBTQ rights. Her business ventures include vegan cosmetics brand Haus Labs and the non-profit Born This Way Foundation, which supports the wellness of young people.\n\nDescription above from the Wikipedia article Lady Gaga, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'New York City, New York, USA', '1986-03-28', NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:36', '2026-02-03 22:29:36');
INSERT INTO `cast_crew` VALUES (200, 'Brendan Gleeson', 'https://image.tmdb.org/t/p/original/ctPPJu5ZYDZr1IPmzoNpezczrm0.jpg', 'actor', '889737', 'Brendan Gleeson (born 29 March 1955) is an Irish actor and film director. He is the recipient of three IFTA Awards, two BIFA\'s, and a Primetime Emmy Award and has been nominated twice for a BAFTA Award, five times for a Golden Globe Award and once for an Academy Award. In 2020, he was listed at number 18 on The Irish Times list of Ireland\'s greatest film actors. He is the father of actors Domhnall Gleeson and Brian Gleeson.\n\nHe is best known for his performance as Alastor Moody in the Harry Potter films (2005–2010). He is also known for his supporting roles in films such as Braveheart (1995), Michael Collins (1996), 28 Days Later (2002), Gangs of New York (2002), Cold Mountain (2003), Troy (2004), Suffragette (2015), Paddington 2 (2017), The Ballad of Buster Scruggs (2018), and The Tragedy of Macbeth (2021). He is also known for his leading roles in films such as The General (1998), In Bruges (2008), The Guard (2011), Calvary (2014), Frankie (2019), and The Banshees of Inisherin (2022). He received a nomination for the Academy Award for Best Supporting Actor for the lattermost film.\n\nHe won an Primetime Emmy Award in 2009 for his portrayal of Winston Churchill in the television film Into the Storm. He also received a Golden Globe Award nomination for his performance as Donald Trump in the Showtime series The Comey Rule (2020). From 2017 to 2019 he starred in the crime series Mr. Mercedes. He received an Emmy Award nomination for Stephen Frears\' Sundance TV series State of the Union (2022).', 'Dublin, Ireland', '1955-03-29', NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:37', '2026-02-03 22:29:37');
INSERT INTO `cast_crew` VALUES (201, 'Catherine Keener', 'https://image.tmdb.org/t/p/original/n4CTwGszs6cwS1wJRlDQ5Mlh7Ex.jpg', 'actor', '889737', 'Catherine Ann Keener (born March 26, 1959) is an American actress. Considered one of the independent film industry\'s most reliable performers, Keener is known for portraying disgruntled and melancholic yet sympathetic women in independent films, as well as supporting roles in studio films. She has been twice nominated for the Academy Award for Best Supporting Actress for Being John Malkovich (1999) and for her portrayal of author Harper Lee in Capote (2005).\n\nKeener also appeared in the films The 40-Year-Old Virgin (2005), Into the Wild (2007), Synecdoche, New York (2008), and Get Out (2017), which were all well received by critics. Keener is the muse of director Nicole Holofcener, having appeared in each of Holofcener\'s first five films. She also appeared in each of director Tom DiCillo\'s first four films, and three films directed by Spike Jonze. From 2018 to 2020, she starred in the Showtime dramedy series Kidding.', 'Miami, Florida, USA', '1959-03-26', NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:38', '2026-02-03 22:29:38');
INSERT INTO `cast_crew` VALUES (202, 'Zazie Beetz', 'https://image.tmdb.org/t/p/original/ijrT4pvALvxU0gphea4YxDnDh6e.jpg', 'actor', '889737', 'Zazie Olivia Beetz (/zəˈsiː ˈbeɪts/ zə-SEE BAYTS; German: [zaˈsiː ˈbeːts]; born June 1, 1991) is a German-American actress. She is known for her role in the FX comedy-drama series Atlanta (2016–2022), for which she received a nomination for the Primetime Emmy Award for Outstanding Supporting Actress in a Comedy Series. She starred in the Netflix anthology series Easy (2016–2019) and has voiced Amber Bennett in the adult animated superhero series Invincible since 2021.\n\nIn films, Beetz appeared in the disaster film Geostorm (2017) and portrayed the Marvel Comics character Domino in the superhero film Deadpool 2 (2018). She portrayed Arthur Fleck/Joker\'s neighbour, Sophie, in the psychological thriller Joker (2019) and its sequel Joker: Folie à Deux (2024).\n\nDescription above from the Wikipedia article Zazie Beetz, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Mitte, Berlin, Germany', '1991-06-01', NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:40', '2026-02-03 22:29:40');
INSERT INTO `cast_crew` VALUES (203, 'Todd Phillips', 'https://image.tmdb.org/t/p/original/A6FPht87DiqXzp456WjakLi2AtP.jpg', 'director', '889737', 'American screenwriter and film director Todd Phillips made his first while a junior at NYU and it went on to become one of the biggest grossing student films at the time, even getting a limited theatrical release.; the feature-length documentary “Hated: GG Allin and the Murder Junkies” He is best known for directing the comedy films Road Trip, Old School, The Hangover, and Due Date.\n\nPhillips directed and produced the highest grossing R-Rated Comedy of all time “The Hangover” (2009), Its worldwide gross currently stands at $480 million dollars. The film won the Golden Globe for Best Picture as well as Best Comedy at the 2009 Broadcast Film Critics’ Awards. ', 'Brooklyn, New York City, New York, USA', '1970-12-20', NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:41', '2026-02-03 22:29:41');
INSERT INTO `cast_crew` VALUES (204, 'Ryan Robert Howard', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '889737', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:42', '2026-02-03 22:29:42');
INSERT INTO `cast_crew` VALUES (205, 'David Webb', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '889737', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:43', '2026-02-03 22:29:43');
INSERT INTO `cast_crew` VALUES (206, 'Travis Rehwaldt', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '889737', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:44', '2026-02-03 22:29:44');
INSERT INTO `cast_crew` VALUES (207, 'Trevor Tavares', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '889737', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 22:29:45', '2026-02-03 22:29:45');
INSERT INTO `cast_crew` VALUES (208, 'Vin Diesel', 'https://image.tmdb.org/t/p/original/nZdVry7lnUkE24PnXakok9okvL4.jpg', 'actor', '385687', 'Mark Sinclair (born July 18, 1967), known professionally as Vin Diesel, is an American actor and film producer. One of the world\'s highest-grossing actors, he is best known for portraying Dominic \"Dom\" Toretto in the Fast & Furious franchise.\n\nBorn in California, Diesel attended Hunter College in New York City, where studies in creative writing led him to begin screenwriting. He wrote, directed, produced, and starred in the short drama film Multi-Facial (1995) and his debut feature, Strays (1997). He came to prominence in the late 1990s. First, he gained recognition for his appearance in Steven Spielberg\'s Saving Private Ryan in 1998. He followed up with commercially successful films such as Boiler Room (2000) and The Pacifier (2005). He gained stardom as a leading action star headlining numerous franchises, including Fast & Furious, XXX, and The Chronicles of Riddick.\n\nHis voice acting work includes The Iron Giant (1999), the video games The Chronicles of Riddick: Escape from Butcher Bay (2004) and The Chronicles of Riddick: Assault on Dark Athena (2009), and the voices of Groot I and Groot II in the Marvel Cinematic Universe (MCU); he portrayed the characters in six superhero films, beginning with Guardians of the Galaxy (2014). Diesel has reprised his role as Groot for the Disney+ animated shorts series I Am Groot (2022–2023), the television special The Guardians of the Galaxy Holiday Special (2022), and the animated film Ralph Breaks the Internet (2018).\n\nHe founded the production company One Race Films, where he has also served as a producer or executive producer for his star vehicles. Diesel also founded the record label Racetrack Records and video game developer Tigon Studios, providing his voice and motion capture for all of Tigon\'s releases.', 'Alameda County, California, USA', '1967-07-18', NULL, 1, 1, NULL, NULL, '2026-02-03 22:33:26', '2026-02-03 22:33:26');
INSERT INTO `cast_crew` VALUES (209, 'Michelle Rodriguez', 'https://image.tmdb.org/t/p/original/wVcbrae4eRqGMFZz8Eh52Dl1biP.jpg', 'actor', '385687', 'Mayte Michelle Rodríguez (born July 12, 1978) is an American actress. She began her career in 2000, playing a troubled boxer in the independent sports drama film Girlfight (2000), where she won the Independent Spirit Award and Gotham Award for Best Debut Performance. Rodriguez played Letty Ortiz in the Fast & Furious franchise and Rain Ocampo in the Resident Evil franchise. She has starred in the crime thriller S.W.A.T. (2003), James Cameron\'s science fiction epic Avatar (2009), and in the action film Battle: Los Angeles (2011).\n\nAfter playing Minerva Mirabal in the biopic Trópico de Sangre (2010), Rodriguez headlined the exploitation films Machete (2010) and Machete Kills (2013) and starred in the animated comedy films Turbo (2013) and Smurfs: The Lost Village(2017), while her performance in the heist film Widows (2018) was critically praised.\n\nOutside of film, Rodriguez played Ana Lucia Cortez in the drama television series Lost (2005–2006; 2009–2010) and voiced Liz Ricarro in the English-language translation of the anime Immortal Grand Prix (2005–2006). She reprised her roles in video game spin-offs of Avatar and Fast & Furious and also appeared in True Crime: Streets of LA (2003), Driver 3 (2004), Halo 2 (2004), and Call of Duty: Black Ops II (2012).\n\nDescription above from the Wikipedia article Michelle Rodriguez, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Bexar County, Texas, USA', '1978-07-12', NULL, 1, 1, NULL, NULL, '2026-02-03 22:33:28', '2026-02-03 22:33:28');
INSERT INTO `cast_crew` VALUES (210, 'Tyrese Gibson', 'https://image.tmdb.org/t/p/original/jxoy4fbXNKFQtBdK73cLXEz3ufS.jpg', 'actor', '385687', 'Tyrese Darnell Gibson (born December 30, 1978) is an American R&B singer and actor from Los Angeles, California. He signed with RCA Records in 1998 and released his debut single, \"Nobody Else\", in August of that year. It peaked within the top 40 of the Billboard Hot 100. It preceded his self-titled debut album (1998), which received platinum certification by the Recording Industry Association of America (RIAA) and spawned his second top 40 single, \"Sweet Lady\".\n\nHis second and third albums, 2000 Watts (2001) and I Wanna Go There (2002), received certifications from the RIAA. The latter was led by the single \"How You Gonna Act Like That\", which peaked at number seven on the Billboard Hot 100 and remains his highest-charting song. His fourth album, Alter Ego (2006), explored hip hop under the pseudonym Black Ty, while his fifth album, Open Invitation (2011), was nominated for Best R&B Album at the 55th Annual Grammy Awards. Gibson\'s sixth album, Black Rose (2015), debuted atop the Billboard 200.\n\nGibson has sold over 4 million singles and albums in the United States. Gibson had his first starring role in John Singleton\'s coming-of-age hood film Baby Boy (2001) and gained widespread recognition as Roman Pearce in the Fast & Furious franchise. Gibson reunited with Singleton for the action film Four Brothers (2005) and plays Robert Epps in the Transformers franchise. He appeared in the comedy film Ride Along 2 (2016) and the superhero film Morbius (2022).\n\nDescription above from the Wikipedia article Tyrese Gibson, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Los Angeles, California, USA', '1978-12-30', NULL, 1, 1, NULL, NULL, '2026-02-03 22:33:29', '2026-02-03 22:33:29');
INSERT INTO `cast_crew` VALUES (211, 'Ludacris', 'https://image.tmdb.org/t/p/original/erkJijujhe48vhJ8iCEtVpNEeVn.jpg', 'actor', '385687', 'Christopher Brian Bridges (born September 11, 1977), known professionally as Ludacris(/ˈluːdəkrɪs/), is an American rapper and actor. Born in Champaign, Illinois, Ludacris moved to Atlanta, Georgia, where he first began rapping. Starting with a brief stint as a DJ, he formed his own record label, Disturbing tha Peace, in the late 1990s to release his debut studio album, Incognegro (1999), independently. After its single, \"What\'s Your Fantasy\" (featuring Shawnna), became a top 40 hit on the Billboard Hot 100, the album was re-released by Def Jam Recordings as his major label debut, Back for the First Time (2000). The latter album peaked at number four on the Billboard 200 and spawned his second top 40 single, \"Southern Hospitality\" (featuring Pharrell).\n\nLudacris\' subsequent albums—Word of Mouf (2001), Chicken-n-Beer (2003) and The Red Light District (2004)—were each met with continued success, receiving multi-platinum certifications by the Recording Industry Association of America (RIAA). His fifth and sixth albums, Release Therapy (2006) and Theater of the Mind (2008), explored more serious subject matter than their predecessors. His seventh album, Battle of the Sexes (2010), featured a return to the more lighthearted tone of his earlier albums. Throughout his career, Ludacris has scored two number-one singles on the Billboard Hot 100 as a lead artist: \"Stand Up\" (featuring Shawnna) and \"Money Maker\" (featuring Pharrell), as well as three singles which did so as a guest performer: Usher\'s \"Yeah!\" in 2004, Fergie\'s \"Glamorous\" in 2007, and Taio Cruz\'s \"Break Your Heart\" in 2009. The following year, he guest featured on Justin Bieber\'s single \"Baby\", which remains one of the highest-certified singles of all time in the United States.\n\nLudacris is named among the first Dirty South rappers to achieve mainstream success in the early 2000s. He is the recipient of three Grammy Awards, a Screen Actors Guild Award, a Critics\' Choice Award and an MTV Video Music Award. Outside of music, he has portrayed the character Tej Parker in the Fast & Furious film series—first appearing in its second film, 2 Fast 2 Furious (2003). His other notable acting roles include Crash (2004), Gamer (2009), and New Year\'s Eve (2011). In 2021, he created and starred in the children\'s animated series Karma\'s World for Netflix. Ludacris is also a private pilot.\n\nDescription above from the Wikipedia article Ludacris, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Champaign, Illinois, USA', '1977-09-11', NULL, 1, 1, NULL, NULL, '2026-02-03 22:33:31', '2026-02-03 22:33:31');
INSERT INTO `cast_crew` VALUES (212, 'John Cena', 'https://image.tmdb.org/t/p/original/rgB2eIOt7WyQjdgJCOuESdDlrjg.jpg', 'actor', '385687', 'John Felix Anthony Cena, better known simply as John Cena, is a retired American professional wrestler and actor who was signed to World Wrestling Entertainment (WWE) from 2001 until his retirement. Over more than two decades, he became the defining star of WWE’s modern era, setting the company-recognized record with 17 world championship reigns. Cena wrestled his final match on December 13, 2025, at Saturday Night’s Main Event XLII, where he was defeated by Gunther, officially closing his in-ring career.\n\nCena moved to California in 1998 with the goal of pursuing bodybuilding before transitioning into professional wrestling the following year. He debuted in Ultimate Pro Wrestling (UPW) and signed with WWE in 2001, spending time in Ohio Valley Wrestling (OVW), where he won the OVW Heavyweight Championship and the Southern Tag Team Championship.\n\nAfter joining WWE’s main roster in 2002, Cena broke out with a trash-talking rapper persona before reinventing himself in 2005 as the company’s long-term top babyface. He went on to headline major events and accumulate 17 world championships, including 13 WWE Championship reigns and three World Heavyweight Championship reigns, along with multiple United States and tag team title reigns, two Royal Rumble victories, and a Money in the Bank win. He headlined WrestleMania six times and maintained the longest uninterrupted run as a top babyface in WWE history.\n\nOutside of wrestling, Cena built a successful acting career, beginning with The Marine and later earning praise for roles in Trainwreck, Blockers, and Bumblebee. He became a major franchise presence in the Fast & Furious series with F9 and Fast X, and gained widespread recognition portraying Peacemaker in James Gunn’s The Suicide Squad and its HBO spin-off series Peacemaker, based on DC Comics.\n\nCena also released the rap album You Can\'t See Me in 2005, which debuted in the top 20 on the Billboard 200. Beyond entertainment, he is known for his extensive charitable work, particularly with the Make-A-Wish Foundation, for which he has granted more wishes than any individual in the organization’s history.', 'West Newbury, Massachusetts, USA', '1977-04-23', NULL, 1, 1, NULL, NULL, '2026-02-03 22:33:32', '2026-02-03 22:33:32');
INSERT INTO `cast_crew` VALUES (213, 'Justin Lin', 'https://image.tmdb.org/t/p/original/w0ryazdt8iS3GBrjXfv0FIwvUGY.jpg', 'director', '385687', 'Justin Lin (traditional Chinese: 林詣彬; simplified Chinese: 林诣彬; pinyin: Lín Yìbīn; Pe̍h-ōe-jī: Lîm Gē-pin, born October 11, 1971) is a Taiwanese-American film and television director, producer, and screenwriter. His films have grossed over $3 billion USD worldwide as of March 2017. He is best known for his directorial work on Better Luck Tomorrow (2002), the Fast & Furious franchise from The Fast and the Furious: Tokyo Drift (2006) to Fast & Furious 6 (2013) and F9 (2021), and Star Trek Beyond (2016). He is also known for his work on television programs like Community and True Detective.\n\nDescription above from the Wikipedia article Justin Lin, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Taipei, Taiwan', '1971-10-11', NULL, 1, 1, NULL, NULL, '2026-02-03 22:33:33', '2026-02-03 22:33:33');
INSERT INTO `cast_crew` VALUES (214, 'Louis Leterrier', 'https://image.tmdb.org/t/p/original/bpqqRRyCLeoAup2OAv1Dtm5C8Tn.jpg', 'director', '385687', 'Louis Leterrier (French: [lwi lətɛʁje]; born 17 June 1973) is a French film and television director. Best known for his work in action films, he directed the first two Transporter films (2002–2005), The Incredible Hulk (2008), Clash of the Titans (2010), Now You See Me (2013), and the tenth and eleventh Fast & Furious instalment, Fast X (2023) and Fast XI (2026). He also directed the streaming television series The Dark Crystal: Age of Resistance (2019) and Lupin (2021).\n\nDescription above from the Wikipedia article Louis Leterrier, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Paris, France', '1973-06-17', NULL, 1, 1, NULL, NULL, '2026-02-03 22:33:35', '2026-02-03 22:33:35');
INSERT INTO `cast_crew` VALUES (215, 'Brunella De Cola', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '385687', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-03 22:33:39', '2026-02-03 22:33:39');
INSERT INTO `cast_crew` VALUES (216, 'Zendaya', 'https://image.tmdb.org/t/p/original/3WdOloHpjtjL96uVOhFRRCcYSwq.jpg', 'actor', '693134', 'Zendaya Maree Stoermer Coleman (born September 1, 1996) is an American actress and singer. She began her career as a child model and backup dancer. She rose to mainstream prominence for her role as Rocky Blue on the Disney Channel sitcom Shake It Up (2010–2013).\n\nIn 2013, Zendaya was a contestant on the 16th season of the dance competition series Dancing with the Stars. She produced and starred as the titular spy, K.C. Cooper, in the sitcom K.C. Undercover (2015–2018). Her film roles include the musical drama The Greatest Showman (2017), the superhero film Spider-Man: Homecoming (2017) and its sequels, the computer-animated musical comedy Smallfoot (2018), the romantic drama Malcolm & Marie (2021), the live-action/animation hybrid sports comedy Space Jam: A New Legacy (2021), and the science fiction epic Dune (2021).', 'Oakland, California, USA', '1996-09-01', NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:44', '2026-02-05 00:41:29');
INSERT INTO `cast_crew` VALUES (217, 'Mike Faist', 'https://image.tmdb.org/t/p/original/xRl1Pa8a80L3QUT7LrTtlTZv1l4.jpg', 'actor', '937287', 'Michael David Faist (born January 5, 1992) is an American actor, dancer, and singer. He is known for starring in the original Broadway productions of Newsies and Dear Evan Hansen, and in movies such as West Side Story (2021), Pinball: The Man Who Saved the Game (2022), and Challengers (2024).', 'Gahanna, Ohio, USA', '1992-01-05', NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:45', '2026-02-04 11:22:45');
INSERT INTO `cast_crew` VALUES (218, 'Josh O\'Connor', 'https://image.tmdb.org/t/p/original/iFGxCv7wMaComYR40Mt7fwbfY1k.jpg', 'actor', '937287', 'Joshua Mathias O\'Connor (born May 20, 1990) is a British actor. After training at the Bristol Old Vic Theatre School, he had supporting roles in television series such as Doctor Who in 2013 and Peaky Blinders in 2014. He had his breakthrough playing the lead role of a sheep farmer in Francis Lee\'s romantic drama God\'s Own Country (2017), for which he won a British Independent Film Award.\n\nFor portraying a young Charles III in the Netflix drama series The Crown (2019–2020), O\'Connor won a Primetime Emmy Award and a Golden Globe Award. He has since starred in the period dramas Emma (2020) and La Chimera (2023) as well as Luca Guadagnino\'s Challengers (2024) and Rian Johnson\'s Wake Up Dead Man (2025).', 'Southampton, Hampshire, England, UK', '1990-05-20', NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:46', '2026-02-04 11:22:46');
INSERT INTO `cast_crew` VALUES (219, 'Bryan Doo', 'https://image.tmdb.org/t/p/original/jQK9DYYqn0qUhAK0JPq4QLNCxWY.jpg', 'actor', '937287', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:48', '2026-02-04 11:22:48');
INSERT INTO `cast_crew` VALUES (220, 'Shane T Harris', 'https://image.tmdb.org/t/p/original/jRioqQxc9GPzPmV48ikmRItrH8N.jpg', 'actor', '937287', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:49', '2026-02-04 11:22:49');
INSERT INTO `cast_crew` VALUES (221, 'Luca Guadagnino', 'https://image.tmdb.org/t/p/original/lO2GD4s6fRloZLEhsZgBlhJQasE.jpg', 'director', '937287', 'Luca Guadagnino (Italian: [ˈluːka ɡwadaɲˈɲiːno]; born 10 August 1971) is an Italian film director and producer. His films are characterized by their emotional complexity, eroticism, and lavish visuals. Guadagnino has received numerous accolades, including a Silver Lion, alongside nominations for an Academy Award and three BAFTA Awards.\n\nBorn in Palermo, Guadagnino spent part of his childhood in Ethiopia. However, the family returned to Italy to escape the Ethiopian Civil War. Guadagnino began his career directing short films and documentaries. He made his feature-film debut with The Protagonists (1999), the first of his many collaborations with actress Tilda Swinton. His follow-up, Melissa P. (2005), was a commercial success in Italy but was met with mixed critical reception.\n\nGuadagnino gained further acclaim with his Desire trilogy, which consists of the films I Am Love (2009), A Bigger Splash (2015), and Call Me by Your Name (2017). The latter brought him international recognition. Suspiria (2018), a remake of the 1977 film, was Guadagnino\'s first foray into the horror genre. It was a box office failure and polarized critics. Guadagnino\'s following projects were We Are Who We Are (2020), a coming-of-age miniseries for HBO, the romantic horror film Bones and All (2022), the romantic sports film Challengers (2024), and the period romantic drama Queer (2024).\n\nGuadagnino directed several documentaries, including Bertolucci on Bertolucci (2013) and Salvatore: The Shoemaker of Dreams (2020). Aside from filmmaking, he has been involved in the fashion world, directing advertisements for brands like Fendi and Salvatore Ferragamo. In 2012, Guadagnino founded the production company Frenesy Film Company. He also produced Belluscone: A Sicilian Story (2014), The Truffle Hunters (2020), Salvatore: The Shoemaker of Dreams (2020), Holiday, and Enea (2023).\n\nDescription above from the Wikipedia article about Luca Guadagnino, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Palermo, Italy', '1971-08-10', NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:50', '2026-02-04 11:22:50');
INSERT INTO `cast_crew` VALUES (222, 'Kit Conners', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '937287', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:51', '2026-02-04 11:22:51');
INSERT INTO `cast_crew` VALUES (223, 'Kevin Collins', 'https://image.tmdb.org/t/p/original/4AosCAWl5aEeiRg33Wp8XHlhXNt.jpg', 'director', '937287', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:52', '2026-02-04 11:22:52');
INSERT INTO `cast_crew` VALUES (224, 'Valentina de Amicis', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '937287', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-04 11:22:52', '2026-02-04 11:22:52');
INSERT INTO `cast_crew` VALUES (225, 'Ryan Reynolds', 'https://image.tmdb.org/t/p/original/trzgptffGvAlAT6MEu01fz47cLW.jpg', 'actor', '533535', 'Ryan Rodney Reynolds (born October 23, 1976) is a Canadian and American actor, entrepreneur and film producer. Known for starring in comedicand superhero films, he was the world\'s second-highest-paid actor in 2020 and 2024. Reynolds has received numerous accolades, including two Primetime Emmy Awards, as well as nominations for two Grammy Awards and a Golden Globe Award. His films as a leading actor have grossed $6.6 billion worldwide.\n\nBorn and raised in Vancouver, Canada, Reynolds began acting at the age of thirteen, taking on small roles in various television series. He had his first lead role in the teen soap opera Hillside (1991–1993), then played the lead role in the sitcom Two Guys and a Girl (1998–2001). Reynolds later starred in a range of films, including the commercially successful romantic comedies National Lampoon\'s Van Wilder (2002), Waiting... (2005), and The Proposal (2009), the critically unsuccessful superhero films Blade: Trinity (2004), X-Men Origins: Wolverine (2009), and Green Lantern (2011), and the biographical drama Woman in Gold (2015).\n\nReynolds achieved his greatest commercial success as the titular character in the Deadpool franchise, starring in Deadpool (2016), Deadpool 2 (2018), and Deadpool & Wolverine (2024). His performance in the first received a Golden Globe nomination, while the latter emerged as his highest-grossing release. He has since appeared in the sci-fi horror Life (2017), and action films like 6 Underground (2019), Free Guy (2021), and The Adam Project (2022). Reynolds has also lent his voice to animated films, including The Croods franchise (2013–2020), Turbo (2013), and the animated character Pikachu in Detective Pikachu (2019).\n\nIn 2017, Time included Reynolds in its list of the 100 most influential people in the world. He was named People\'s Sexiest Man Alive in 2010 and was awarded a star on the Hollywood Walk of Fame in 2017. A businessman, he holds an ownership stake in Mint Mobile and is a co-owner of Welsh soccer club Wrexham; the latter is documented in the Emmy Award-winning television series Welcome to Wrexham (2022–present). Divorced from actress Scarlett Johansson, Reynolds has been married to Blake Lively since 2012; he has four children with the latter.\n\nDescription above from the Wikipedia article Ryan Reynolds, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Vancouver, British Columbia, Canada', '1976-10-23', NULL, 1, 1, NULL, NULL, '2026-02-04 11:26:09', '2026-02-04 11:26:09');
INSERT INTO `cast_crew` VALUES (226, 'Hugh Jackman', 'https://image.tmdb.org/t/p/original/4Xujtewxqt6aU0Y81tsS9gkjizk.jpg', 'actor', '533535', 'Hugh Michael Jackman (born 12 October 1968) is an Australian actor, singer, and producer. Beginning in theatre and television, Jackman landed his breakthrough role as Wolverine, playing it across the X-Men film franchise and in the Marvel Cinematic Universe from X-Men (2000) to Deadpool & Wolverine (2024). Prominent on both screen and stage, he has received various accolades, including a Primetime Emmy Award, a Grammy Award and two Tony Awards, along with nominations for an Academy Award and a British Academy Film Award. Jackman was appointed a Companion of the Order of Australia in 2019.\n\nJackman has headlined films in various genres, including the romantic comedy Kate & Leopold (2001), the action-horror Van Helsing (2004), the drama The Prestige (2006), the period romance Australia (2008), the science fiction Real Steel (2011), the musical Les Misérables (2012), the thriller Prisoners (2013), the musical The Greatest Showman (2017), the political drama The Front Runner (2018), and the crime drama Bad Education (2019). For his role as Jean Valjean in Les Misérables, he was nominated for the Academy Award for Best Actor and won a Golden Globe Award for Best Actor, and for The Greatest Showman soundtrack, Jackman received a Grammy Award for Best Compilation Soundtrack. He also provided voice roles in the animated films Flushed Away, Happy Feet (both 2006), Rise of the Guardians (2012) and Missing Link (2019).\n\nJackman is also known for his early theatre roles in the original Australian productions of Beauty and the Beast as Gaston in 1995 and Sunset Boulevard as Joe Gillis in 1996. He earned a Laurence Olivier Award nomination for his performance as Curly McLain in the West End revival of Oklahoma! in 1998. In 2002, he made his American stage debut in a concert of Carousel as Billy Bigelow at Carnegie Hall. On Broadway, he won the 2004 Tony Award and Drama Desk Award for Best Actor in a Musical for his role of Peter Allen in The Boy from Oz. From 2021 to 2023, Jackman starred as con man Harold Hill in the Broadway revival of the musical The Music Man, earning another Tony Award nomination. A four-time host of the Tony Awards, he won an Emmy Award for hosting the 2005 ceremony. He also hosted the 81st Academy Awards in 2009.\n\nDescription above from the Wikipedia article Hugh Jackman, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Sydney, New South Wales, Australia', '1968-10-12', NULL, 1, 1, NULL, NULL, '2026-02-04 11:26:10', '2026-02-04 11:26:10');
INSERT INTO `cast_crew` VALUES (227, 'Emma Corrin', 'https://image.tmdb.org/t/p/original/wqGOVOsHzZaHeHymIS40elGCnY0.jpg', 'actor', '533535', 'Emma-Louise Corrin (born December 13, 1995) is an English actor.\n\nThey portrayed Diana, Princess of Wales in the fourth season of the Netflix historical drama The Crown (2020), for which they won a Golden Globe and were nominated for a Primetime Emmy Award. They have since starred in the 2022 romantic drama films My Policeman and Lady Chatterley\'s Lover, and in the 2023 thriller miniseries A Murder at the End of the World. In 2024, they played Cassandra Nova in the superhero film Deadpool & Wolverine.', 'Royal Tunbridge Wells, Kent, England, UK', '1995-12-13', NULL, 1, 1, NULL, NULL, '2026-02-04 11:26:10', '2026-02-04 11:26:10');
INSERT INTO `cast_crew` VALUES (228, 'Matthew Macfadyen', 'https://image.tmdb.org/t/p/original/2IWtWZTpAGh8QFVBjry1IZMN7F3.jpg', 'actor', '533535', 'David Matthew Macfadyen (born 17 October 1974) is an English actor. Known for his performances on stage and screen, he gained prominence for his role as Mr. Darcy in Joe Wright\'s Pride & Prejudice (2005). He starred as Tom Wambsgans in the HBO drama series Succession (2018–2023), for which he has received two Primetime Emmy Awards, two BAFTA Awards, and a Screen Actors Guild Award.\n\nMacfadyen is also known for his roles in films such as Death at a Funeral (2007), Frost/Nixon (2008), Anna Karenina (2012), The Assistant (2019), and Operation Mincemeat (2021). He made his television debut in 1998 as Hareton Earnshaw in Wuthering Heights. He portrayed Tom Quinn in the BBC One spy series Spooks (2002–04, 2011), and Inspector Edmund Reid in the BBC mystery series Ripper Street (2012–2016). He also starred as Henry Wilcox in Kenneth Lonergan\'s miniseries Howards End and Charles Ingram in the Stephen Frears\' limited series Quiz (2020).', 'Great Yarmouth, Norfolk, England, UK', '1974-10-17', NULL, 1, 1, NULL, NULL, '2026-02-04 11:26:11', '2026-02-04 11:26:11');
INSERT INTO `cast_crew` VALUES (229, 'Dafne Keen', 'https://image.tmdb.org/t/p/original/g325OIjIHrFr0te8ewPfhKQ2SKj.jpg', 'actor', '533535', 'Dafne Keen Fernández (born 4 January 2005) is a Spanish and British actress. Keen made her child acting debut in the series The Refugees (2015). Her breakthrough role was as Laura in the X-Men superhero film Logan (2017), which she reprised for the Marvel Cinematic Universe (MCU) film Deadpool & Wolverine (2024). She also starred as Lyra Belacqua in the television series His Dark Materials (2019–2022) and Jecki Lon in the Star Wars series The Acolyte (2024).\n\nDescription above from the Wikipedia article Dafne Keen, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Fuenlabrada, Madrid, Spain', '2005-01-04', NULL, 1, 1, NULL, NULL, '2026-02-04 11:26:12', '2026-02-04 11:26:12');
INSERT INTO `cast_crew` VALUES (230, 'Shawn Levy', 'https://image.tmdb.org/t/p/original/uZ40wDFzxPmzROJl9KxPgEGv9ME.jpg', 'director', '533535', 'Shawn Adam Levy (/ˈliːvaɪ/; born July 23, 1968) is a Canadian filmmaker and actor. He is the founder of 21 Laps Entertainment. His work has spanned numerous genres, and his films as a director have grossed $3.5 billion worldwide.\n\nFollowing early work as a television director, Levy gained recognition in the 2000s for directing comedy films like Big Fat Liar (2002), Just Married (2003), Cheaper by the Dozen (2003) and The Pink Panther (2006). He then found further success as the director of the first three films in the Night at the Museum film franchise (2006–14). In the early 2010s, he directed films including Date Night (2010), Real Steel (2011), and The Internship (2013), and developed several comedy television pilots. Executive produced the ABC sitcom Last Man Standing. Levy produced the 2016 sci-fi film Arrival, earning him an Academy Award nomination for Best Picture.\n\nSince 2016, Levy has been an executive producer on the Netflix original series Stranger Things. He has directed the third and fourth episodes of each of the show\'s four seasons and the Netflix limited series All the Light We CanNot See (2023). Levy has recently collaborated with Ryan Reynolds by directing Free Guy (2021), The Adam Project (2022), and Deadpool & Wolverine (2024), with the latter emerging as his highest-grossing film and the highest-grossing R-rated film of all time.\n\nDescription above from the Wikipedia article Shawn Levy, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Montreal, Quebec, Canada', '1968-07-23', NULL, 1, 1, NULL, NULL, '2026-02-04 11:26:13', '2026-02-04 11:26:13');
INSERT INTO `cast_crew` VALUES (231, 'Josh McLaglen', 'https://image.tmdb.org/t/p/original/5PJWCWlKF3kJWOHSqs7l7M7nZK9.jpg', 'director', '533535', 'Josh McLaglen is an assistant director and producer known for Titanic (1997), X-Men: Days of the Future Past (2014), and Logan (2017). \n\nHe has often worked with filmmaker Shawn Levy, collaborating on Free Guy (2021), The Adam Project (2022), and Deadpool & Wolverine (2024).', 'Encino, California, USA', '1958-02-21', NULL, 1, 1, NULL, NULL, '2026-02-04 11:26:13', '2026-02-04 11:26:13');
INSERT INTO `cast_crew` VALUES (232, 'Ana de Armas', 'https://image.tmdb.org/t/p/original/5Qne374OM0ewMM7uSN9eq9jNrWq.jpg', 'actor', '541671', 'Ana Celia de Armas Caso (Spanish pronunciation:[ˈana ˈselja ðe ˈaɾmas ˈkaso]; born 30 April 1988) is a Cuban, American and Spanish actress. She began her career in Cuba with a leading role in the romantic drama Una rosa de Francia (2006). At 18, she moved to Madrid, Spain, and starred in the popular drama El Internado (2007–2010). After moving to Los Angeles, de Armas had English-speaking roles in the psychological thriller Knock Knock (2015) and the comedy-crime film War Dogs (2016).\n\nDe Armas rose to prominence for her roles as the holographic AI Joi in the science fiction film Blade Runner 2049 (2017) and nurse Marta Cabrera in the mystery film Knives Out (2019), receiving a  Golden Globe Award nomination for Best Actress – Motion Picture Comedy or Musical. She then played Bond girl Paloma in the James Bond film No Time to Die (2021) and actress Marilyn Monroe in the biographical drama Blonde (2022), for which she became the first Cuban nominated for the Academy Award for Best Actress. She then led the action thriller Ballerina (2025), a spin-off instalment in the John Wick franchise.\n\nDescription above from the Wikipedia article Ana de Armas, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Santa Cruz del Norte, Cuba', '1988-04-30', NULL, 1, 1, NULL, NULL, '2026-02-04 11:35:25', '2026-02-04 11:35:25');
INSERT INTO `cast_crew` VALUES (233, 'Ian McShane', 'https://image.tmdb.org/t/p/original/qh9RTLbnr128TZLdGuXwUH9mdBM.jpg', 'actor', '541671', 'Ian David McShane (born 29 September 1942) is a Scottish-English actor. His television performances include the title role in the BBC series Lovejoy (1986–1994), Al Swearengen in Deadwood (2004–2006) and its 2019 film continuation, and Mr. Wednesday in American Gods (2017–2021). For the original series of Deadwood, McShane won the Golden Globe Award for Best Actor – Television Series Drama and received a nomination for the Primetime Emmy Award for Outstanding Lead Actor in a Drama Series. As a producer of the film, he was nominated for the Primetime Emmy Award for Outstanding Television Movie.\n\nHis film roles include Harry Brown in The Wild and the Willing (1962), Charlie Cartwright in If It\'s Tuesday, This Must Be Belgium (1969), Wolfe Lissner in Villain (1971), Teddy Bass in Sexy Beast(2000), Frank Powell in Hot Rod (2007), Blackbeard in Pirates of the Caribbean: On Stranger Tides (2011), and Winston Scott in the John Wick franchise (2014–present).\n\nDescription above from the Wikipedia article Ian McShane, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Blackburn, Lancashire, England, UK', '1942-09-29', NULL, 1, 1, NULL, NULL, '2026-02-04 11:35:27', '2026-02-04 11:35:27');
INSERT INTO `cast_crew` VALUES (234, 'Anjelica Huston', 'https://image.tmdb.org/t/p/original/6hnYeHa7Rc1w1MmQ3JsLSIb7yCX.jpg', 'actor', '541671', 'Anjelica Huston (born July 8, 1951) is an American actress, director, producer, author, and former fashion model. She is the daughter of director John Huston and granddaughter of actor Walter Huston. After reluctantly making her big screen debut in her father\'s A Walk with Love and Death (1969), Huston moved from London to New York City, where she worked as a model throughout the 1970s. She decided to actively pursue acting in the early 1980s, and, subsequently, had her breakthrough with her performance in Prizzi\'s Honor (1985), also directed by her father, for which she became the third generation of her family to receive an Academy Award, when she won Best Supporting Actress, joining both John and Walter Huston in this recognition.\n\nHuston received Academy Award nominations for Enemies, A Love Story (1989) and The Grifters (1990), for Best Supporting Actress and Best Actress, respectively, BAFTA nominations for Best Supporting Actress for the Woody Allen films Crimes and Misdemeanors (1989) and Manhattan Murder Mystery (1993) and Golden Globe nominations for Best Actress – Motion Picture Comedy or Musical for starring as Morticia Addams in The Addams Family (1991) and its sequel Addams Family Values (1993). She also received acclaim for her portrayal of the Grand High Witch in Roald Dahl\'s film adaptation The Witches (1990). Huston has frequently worked with director Wes Anderson, starring in The Royal Tenenbaums (2001), The Life Aquatic with Steve Zissou (2004) and The Darjeeling Limited (2007). Her other notable credits include The Dead (1987), Ever After (1998), Buffalo \'66 (1998), Daddy Day Care (2003), 50/50 (2011) and John Wick: Chapter 3 – Parabellum (2019). She has lent her voice to several animated films, mainly the Tinker Bell franchise (2008–2015).\n\nOn television, Huston has had recurring roles on Huff (2006), Medium (2008–2009), and Transparent (2015–2016). She won a Gracie Award for her portrayal of Eileen Rand on Smash (2012–2013). Huston made her directorial debut with the film Bastard Out of Carolina (1996). This was followed by Agnes Browne (1999), in which she also starred. She has written the memoirs A Story Lately Told (2013) and Watch Me (2014).', 'Santa Monica, California, USA', '1951-07-08', NULL, 1, 1, NULL, NULL, '2026-02-04 11:35:28', '2026-02-04 11:35:28');
INSERT INTO `cast_crew` VALUES (235, 'Gabriel Byrne', 'https://image.tmdb.org/t/p/original/9r9oDGENg92VYYFMkV4C09IUlrb.jpg', 'actor', '541671', 'Gabriel James Byrne (born 12 May 1950) is an Irish actor. He has received a Golden Globe Award and nominations for a Grammy Award, two Primetime Emmy Awards and two Tony Awards. Byrne was awarded the Irish Film and Television Academy Lifetime Achievement Award in 2018 and was listed at number 17 on The Irish Times list of Ireland\'s greatest film actors in 2020. In 2009, The Guardian named him one of the best actors who never received an Academy Award nomination.\n\nByrne\'s acting career began at the Focus Theatre in Dublin before he joined London\'s Royal Court Theatre in 1974. His screen debut came in the Irish drama serial The Riordans and the spin-off show Bracken. He went on to star in such films as Defence of the Realm (1986), Lionheart (1987), Miller\'s Crossing (1990), Little Women (1994), Dead Man (1995), The Usual Suspects (1995), The Man in the Iron Mask (1998), Enemy of the State (1998), Vanity Fair (2004), The 33 (2015), and Hereditary (2018). He co-wrote The Last of the High Kings (1996) and produced In the Name of the Father (1993). \n\nFor his Broadway work, Byrne has received two nominations for the Tony Award for Best Actor in a Play for his roles in the Eugene O\'Neill plays A Moon for the Misbegotten (2000) and Long Day\'s Journey into Night (2016). For his television work, Byrne has received two nominations for the Primetime Emmy Award for Outstanding Lead Actor in a Drama Series for his role as Paul Weston in the HBO drama series In Treatment (2008–2010). He also received a Golden Globe Award. His other notable television roles include Vikings (2013), Maniac (2018), and War of the Worlds (2019–2022).\n\nDescription above from the Wikipedia article Gabriel Byrne, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Dublin, Ireland', '1950-05-12', NULL, 1, 1, NULL, NULL, '2026-02-04 11:35:29', '2026-02-04 11:35:29');
INSERT INTO `cast_crew` VALUES (236, 'John R. Saunders', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '541671', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-04 11:35:34', '2026-02-04 11:35:34');
INSERT INTO `cast_crew` VALUES (237, 'Chris Pratt', 'https://image.tmdb.org/t/p/original/cRH6HPAQ98PlOwwEvhYO4CM9lwu.jpg', 'actor', '447365', 'Christopher Michael Pratt (born 21 June 1979) is an American actor, known for starring in both television and action films. He rose to prominence for his television roles, particularly in the NBC sitcom Parks and Recreation (2009–2015), for which he received critical acclaim and was nominated for the Critics\' Choice Television Award for Best Supporting Actor in a Comedy Series in 2013. He also starred earlier in his career as Bright Abbott in The WB drama series Everwood (2002–2006) and had roles in Wanted (2008), Jennifer\'s Body (2009), Moneyball (2011), The Five-Year Engagement (2012), Zero Dark Thirty (2013), Delivery Man (2013), and Her (2013).\n\nPratt achieved leading man status in 2014, starring in two critically and commercially successful films: The Lego Movie as Emmet Brickowski, and Marvel Studios\' Guardians of the Galaxy as Star-Lord. He starred in Jurassic World (2015) and Jurassic World: Fallen Kingdom (2018), and he reprised his Marvel role in Guardians of the Galaxy Vol. 2 (2017), Avengers: Infinity War (2018), Avengers: Endgame (2019), and the planned Guardians of the Galaxy Vol. 3. Meanwhile, in 2016 he was part of an ensemble cast in The Magnificent Seven and the male lead in Passengers.\n\nDescription above is from the Wikipedia article Chris Pratt, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Virginia, Minnesota, USA', '1979-06-21', NULL, 1, 1, NULL, NULL, '2026-02-04 11:45:25', '2026-02-04 11:45:25');
INSERT INTO `cast_crew` VALUES (238, 'Dave Bautista', 'https://image.tmdb.org/t/p/original/snk6JiXOOoRjPtHU5VMoy6qbd32.jpg', 'actor', '447365', 'David Michael Bautista Jr. (born January 18, 1969) is an American actor and retired professional wrestler. Regarded as one of his generation\'s most prolific professional wrestlers, he rose to fame for his multiple stints in WWE between 2002 and 2019.\n\nBautista began his wrestling career in 1999 and signed with WWE (then WWF) in 2000. From 2002 to 2010, he gained fame under the ring name Batista, initially as a member of Evolution. He would go on to win the WWE Championship twice, the World Heavyweight Championship four times (with his first reign remaining the longest in history at 282 days), the World Tag Team Championship three times (twice with Ric Flair and once with John Cena), and the WWE Tag Team Championship once (with Rey Mysterio). He also won the 2005 and 2014 Royal Rumble matches and subsequently headlined WrestleMania 21 and WrestleMania XXX, with the former being one of the top five highest-grossing PPV events in wrestling history. Having largely stepped back from professional wrestling in 2020, he retired after WrestleMania 35 in 2019.\n\nAs an actor, Bautista is known for portraying Drax in the Marvel Cinematic Universe (2014–2023) and Rabban in Dune (2021) and its 2024 sequel. Bautista has additionally starred in Spectre (2015), Blade Runner 2049 (2017), Final Score, Master Z: Ip Man Legacy (both 2018), Army of the Dead (2021), Glass Onion: A Knives Out Mystery (2022), Knock at the Cabin, and Parachute (both 2023).\n\nDescription above from the Wikipedia article Dave Bautista, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Washington, D.C., USA', '1969-01-18', NULL, 1, 1, NULL, NULL, '2026-02-04 11:45:26', '2026-02-04 11:45:26');
INSERT INTO `cast_crew` VALUES (239, 'Karen Gillan', 'https://image.tmdb.org/t/p/original/kFLXcFdok3ShDxylr3WNreQphQm.jpg', 'actor', '447365', 'Karen Sheila Gillan (/ˈɡɪlən/; born 28 November 1987) is a Scottish actress and filmmaker. She gained recognition for her work in British film and television, particularly for playing Amy Pond, a primary companion to the Eleventh Doctor in the science fiction series Doctor Who (2010–2013). Her early film roles include the thriller Outcast (2010) and the romantic comedy Not Another Happy Ending (2013). She also worked on the stage in Britain, appearing in John Osborne\'s play Inadmissible Evidence (2011).\n\nGillan transitioned to Hollywood, starring in the horror film Oculus (2013) and playing the lead in the ABC sitcom Selfie (2014). She achieved stardom for portraying Nebula in several films of the Marvel Cinematic Universe(2014–2023), which are among the highest-grossing films of all time, and Ruby Roundhouse in the fantasy films Jumanji: Welcome to the Jungle (2017) and Jumanji: The Next Level (2019). She also wrote and directed the drama film The Party\'s Just Beginning (2018), which she starred in. She has starred in the comedy film Gunpowder Milkshake (2021), the thriller film Dual (2022), the coming-of-age film Late Bloomers (2023), and returned to British television with the series Douglas Is Cancelled (2024).\n\nDescription above from the Wikipedia article Karen Gillan, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Inverness, Scotland, UK', '1987-11-28', NULL, 1, 1, NULL, NULL, '2026-02-04 11:45:27', '2026-02-04 11:45:27');
INSERT INTO `cast_crew` VALUES (240, 'Pom Klementieff', 'https://image.tmdb.org/t/p/original/hfUKAI2kXTMMWjno0i4sLPJud5N.jpg', 'actor', '447365', 'Pom Alexandra Klementieff (French: [pɔmklemɑ̃tjɛf]; born 3 May 1986) is a French actress. She is best known for playing Mantis in the Marvel Cinematic Universe (MCU) since 2017 and an assassin in Mission: Impossible – Dead Reckoning Part One (2023).\n\nDescription above from the Wikipedia article Pom Klementieff, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Québec City, Québec, Canada', '1986-05-03', NULL, 1, 1, NULL, NULL, '2026-02-04 11:45:29', '2026-02-04 11:45:29');
INSERT INTO `cast_crew` VALUES (241, 'Rachel Zegler', 'https://image.tmdb.org/t/p/original/1HpUUQgDygOBVdxLRt9BEYJyivd.jpg', 'actor', '447273', 'Rachel Anne Zegler (born May 3, 2001) is an American actress and singer. She made her film debut as María in Steven Spielberg’s musical adaptation West Side Story (2021). She later starred as Anthea in Shazam! Fury of the Gods (2023), Lucy Gray Baird in The Hunger Games: The Ballad of Songbirds & Snakes (2023), and the titular character in Snow White (2025). In 2024, she made her Broadway theatre debut as Juliet in a revival of Romeo + Juliet.', 'Hackensack, New Jersey, USA', '2001-05-03', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:12', '2026-02-05 00:41:12');
INSERT INTO `cast_crew` VALUES (242, 'Emilia Faucher', 'https://image.tmdb.org/t/p/original/qBgjXq2a3g2xzzoCxBPYn7axq5v.jpg', 'actor', '447273', 'Emilia Faucher (born June 6, 2013) is an American actress.', 'Cambridge, Massachusetts, USA', '2013-06-06', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:13', '2026-02-05 00:41:13');
INSERT INTO `cast_crew` VALUES (243, 'Gal Gadot', 'https://image.tmdb.org/t/p/original/g55dgcZQkLMolkKqgP7OD2yfGXu.jpg', 'actor', '447273', 'Gal Gadot (born April 30, 1985) is an Israeli actress. She gained recognition for portraying Wonder Woman in the DC Extended Universe films (2016–2023). In 2018, Gadot was named one of Time\'s 100 most influential people and ranked by Forbes as the tenth-highest-paid actress, later rising to third in 2020. She became the first Israeli actor to receive a star on the Hollywood Walk of Fame in 2025.\n\nGadot grew up in Rosh HaAyin, and first gained attention locally after winning the Miss Israel 2004, followed by two years of service in the Israel Defense Forces as a combat trainer. During this time, she participated in a Maxim photo shoot that boosted her public profile. Gadot then began modeling and endorsing various brands. She made her television debut in the Israeli drama Bubot in 2008, followed by her film debut in a supporting role as Gisele Yashar in Fast & Furious (2009), reprising it in multiple sequels.\n\nGadot first portrayed Wonder Woman in Batman v Superman. The success of the film led to her starring in Wonder Woman (2017), which became a major box office hit. She also reprised the role in Justice League (2017) and Wonder Woman 1984 (2020), the latter of which she also co-produced. Since then, she has starred in Red Notice (2021), Death on the Nile (2022), Heart of Stone (2023), which she co-produced, and portrayed the Evil Queen in Snow White (2025).', 'Petah Tikva, Israel', '1985-04-30', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:13', '2026-02-05 00:41:13');
INSERT INTO `cast_crew` VALUES (244, 'Andrew Burnap', 'https://image.tmdb.org/t/p/original/SEFcP5hIIsmOE8G3SZxa2v8pyO.jpg', 'actor', '447273', 'Andrew Burnap (born March 5, 1991) is an American actor. Known for his performances on stage, he began his professional stage career in the Public Theatre\'s revivals of King Lear in 2014 and Troilus and Cressida in 2016. He gained prominence for his role as Toby Darling in the Matthew Lopez play The Inheritance, which premiered on the West End and transferred to Broadway. He earned the Tony Award for Best Actor in a Play. In 2023, he portrayed King Arthur in the Broadway revival of the Lerner and Loewe musical Camelot.\n\nBurnap is also known for his television roles, including Phil in the Apple TV+ series WeCrashed (2022) and Joseph Smith in the FX on Hulu limited series Under the Banner of Heaven (2022).', 'South Kingstown, Rhode Island, USA', '1991-03-05', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:14', '2026-02-05 00:41:14');
INSERT INTO `cast_crew` VALUES (245, 'Andrew Barth Feldman', 'https://image.tmdb.org/t/p/original/17rLE4Q4gKejJp1TsByGnzMpK00.jpg', 'actor', '447273', 'Andrew Barth Feldman is an American actor. He began his career in musical theater by participating in local productions as a child. After winning the award for best actor at the National High School Musical Theater Awards, he joined the cast of Dear Evan Hansen on Broadway in the title role.', 'Manhasset, New York, USA', '2002-05-07', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:15', '2026-02-05 00:41:15');
INSERT INTO `cast_crew` VALUES (246, 'Ben Howarth', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '447273', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:16', '2026-02-05 00:41:16');
INSERT INTO `cast_crew` VALUES (247, 'Marc Webb', 'https://image.tmdb.org/t/p/original/95FAAT150Mi6DB8VcJgEeOplOsU.jpg', 'director', '447273', 'Marc Preston Webb (born August 31, 1974) is an American filmmaker and music video director. Webb made his feature film directorial debut in 2009 with the romantic comedy “500 Days of Summer” and went on to direct “The Amazing Spider-Man” (2012) and “The Amazing Spider-Man 2” (2014), which were later dubbed the \"Webb-Verse\" by Marvel Studios in 2021. He also directed the drama films “Gifted” and “The Only Living Boy in New York” (both 2017) and the Disney remake of “Snow White” (2025).\n\nDescription above from the Wikipedia article Marc Webb, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Bloomington, Indiana, USA', '1974-08-31', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:16', '2026-02-05 00:41:16');
INSERT INTO `cast_crew` VALUES (248, 'Lisa Vick', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '447273', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:18', '2026-02-05 00:41:18');
INSERT INTO `cast_crew` VALUES (249, 'Terence Madden', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '447273', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:18', '2026-02-05 00:41:18');
INSERT INTO `cast_crew` VALUES (250, 'Timothée Chalamet', 'https://image.tmdb.org/t/p/original/dFxpwRpmzpVfP1zjluH68DeQhyj.jpg', 'actor', '693134', 'Timothée Hal Chalamet (born December 27, 1995) is an American actor. He began his career appearing in the drama series Homeland in 2012. Two years later, he made his film debut in the comedy-drama Men, Women & Children and appeared in Christopher Nolan\'s science fiction film Interstellar. He came into attention in Luca Guadagnino\'s coming-of-age film Call Me by Your Name (2017). Alongside supporting roles in Greta Gerwig\'s films Lady Bird (2017) and Little Women (2019), he took on starring roles in Beautiful Boy (2018) and Dune (2021).', 'Manhattan, New York City, New York, USA', '1995-12-27', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:28', '2026-02-05 00:41:28');
INSERT INTO `cast_crew` VALUES (251, 'Rebecca Ferguson', 'https://image.tmdb.org/t/p/original/lJloTOheuQSirSLXNA3JHsrMNfH.jpg', 'actor', '693134', 'Rebecca Louisa Ferguson Sundström (born 19 October 1983) is a Swedish actress. She is bilingual and has worked extensively in Sweden, Great Britain, and mainly in the United States. Ferguson began her television acting career in 1999 with the Swedish soap opera Nya Tider, and she made her motion picture debut in 2004 with the Swedish slasher film Drowning Ghost. She came to international prominence with her portrayal of Elizabeth Woodville in the British BBC drama The White Queen (2013), for which she was nominated for a Golden Globe for Best Actress in a Miniseries or Television Film.\n\nFerguson starred as MI6 agent Ilsa Faust, opposite Tom Cruise, in three of the Mission: Impossible films: Rogue Nation (2015), Fallout (2018), and Dead Reckoning Part One (2023). She played Jenny Lind in the musical film The Greatest Showman (2017), starred in the horror films Life (2017) and Doctor Sleep(2019), and had supporting parts in the comedy-drama Florence Foster Jenkins (2016), the thriller The Girl on the Train (2016), and the science fiction films Dune(2021) and Dune: Part Two (2024). In 2023, she began starring in the Apple TV+science fiction series Silo.\n\nDescription above from the Wikipedia article Rebecca Ferguson, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Stockholm, Sweden', '1983-10-19', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:30', '2026-02-05 00:41:30');
INSERT INTO `cast_crew` VALUES (252, 'Javier Bardem', 'https://image.tmdb.org/t/p/original/p5xjCovj1uzvA2SXrWLH78Nh1Jf.jpg', 'actor', '693134', 'Javier Ángel Encinas Bardem (born 1 March 1969) is a Spanish actor. In a career that has lasted over thirty years, he has received various accolades, including an Academy Award, seven Goya Awards, a BAFTA Award, and a Golden Globe Award.\n\nA son of actress Pilar Bardem, he first became known for such Spanish films as Jamón jamón(1992), Boca a boca (1995), Carne trémula(1997), Los lunes al sol (2002), and Mar adentro (2004). He received nominations for the Academy Award for Best Actor for playing Reinaldo Arenas in Before Night Falls (2000), a criminal with cancer in Biutiful (2010), and Desi Arnaz in Being the Ricardos (2021). His portrayal of assassin Anton Chigurh in the Coen brothers\' western film No Country for Old Men (2007) won him the Academy Award for Best Supporting Actor. \n\nBardem has also starred in auteur-driven films such as Woody Allen\'s romantic drama Vicky Cristina Barcelona (2008), Terrence Malick\'s drama To the Wonder (2013), Darren Aronofsky\'s horror film mother! (2017), and Asghar Farhadi\'s mystery drama Everybody Knows (2018). He also acted in blockbuster films such as the James Bond film Skyfall (2012), the swashbuckler film Pirates of the Caribbean: Dead Men Tell No Tales(2017), the science fiction epic films Dune (2021) and Dune: Part Two (2024), and Disney\'s live-action remake The Little Mermaid (2023). On television, he portrayed José Menendez in the Netflix crime anthology series Monsters: The Lyle and Erik Menendez Story (2024).\n\nBardem married actress Penélope Cruz in 2010, and they have two children together. In January 2018, Bardem became Greenpeace\'s ambassador for Antarctica\'s protection.\n\nDescription above from the Wikipedia article Javier Bardem, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Las Palmas de Gran Canaria, Gran Canaria, Canary Islands, Spain', '1969-03-01', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:31', '2026-02-05 00:41:31');
INSERT INTO `cast_crew` VALUES (253, 'Josh Brolin', 'https://image.tmdb.org/t/p/original/sX2etBbIkxRaCsATyw5ZpOVMPTD.jpg', 'actor', '693134', 'Josh James Brolin (born February 12, 1968) is an American actor. A son of actor James Brolin, he gained fame in his youth for his role in the adventure film The Goonies (1985). After years of decline, Brolin had a resurgence with his starring role in the crime film No Country for Old Men (2007). Brolin received a nomination for the Academy Award for Best Supporting Actor for portraying Dan White in the biopic Milk (2008).\n\nBrolin\'s career progressed with roles in W. (2008), True Grit (2010), Wall Street: Money Never Sleeps (2010), Men in Black 3 (2012), Oldboy (2013), Inherent Vice (2014), Everest (2015), and Hail, Caesar! (2016). He gained wider recognition for playing Thanos in the Marvel Cinematic Universe (MCU), including in the films Avengers: Infinity War (2018) and Avengers: Endgame (2019), as well as Cable in Deadpool 2 (2018). Brolin also collaborated with filmmaker Denis Villeneuve in the action thriller Sicario (2015) and in the science fiction films Dune (2021) and Dune: Part Two (2024), in which he played Gurney Halleck.', 'Santa Monica, Los Angeles, California, USA', '1968-02-12', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:31', '2026-02-05 00:41:31');
INSERT INTO `cast_crew` VALUES (254, 'Denis Villeneuve', 'https://image.tmdb.org/t/p/original/zdDx9Xs93UIrJFWYApYR28J8M6b.jpg', 'director', '693134', 'Denis Villeneuve (French: [dənivilnœv]; born October 3, 1967) is a Canadian filmmaker. He has received seven Canadian Screen Awards as well as nominations for three Academy Awards, five BAFTA Awards, and two Golden Globe Awards. Villeneuve\'s films have grossed more than $1.8 billion worldwide.\n\nVilleneuve began his career in his home country, directing four French-language dramas: August 32nd on Earth (1998); Maelström (2000); Polytechnique (2009), a dramatisation of the 1989 École Polytechnique massacre; and Incendies (2010). The last of these gained him international prominence and earned a nomination for the Academy Award for Best International Feature Film. He expanded to English-language films by directing the thrillers Prisoners (2013), Enemy (2013), and Sicario (2015).\n\nVilleneuve gained wider recognition for directing science fiction films. His work on Arrival (2016) earned him a nomination for the Academy Award for Best Director. This was followed by Blade Runner 2049 (2017), which was critically lauded but financially unsuccessful. His next projects were Dune (2021) and Dune: Part Two (2024), a two-part adaptation of Frank Herbert\'s novel of the same name. Both films were critically and commercially successful, with the former earning him Academy Award nominations for Best Adapted Screenplay and Best Picture.\n\nDescription above from the Wikipedia article Denis Villeneuve, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 'Gentilly, Québec, Canada', '1967-10-03', NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:32', '2026-02-05 00:41:32');
INSERT INTO `cast_crew` VALUES (255, 'Tamás \'Chipie\' Péter', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '693134', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:33', '2026-02-05 00:41:33');
INSERT INTO `cast_crew` VALUES (256, 'Louis Clark', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '693134', 'Louis Clark is known for Dune: Part Two (2024), Argylle (2024) and Tetris (2023).', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:34', '2026-02-05 00:41:34');
INSERT INTO `cast_crew` VALUES (257, 'Toby Hefferman', 'https://image.tmdb.org/t/p/original/ucqGTZSeoPURbyKN4SmBpp2MExm.jpg', 'director', '693134', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:34', '2026-02-05 00:41:34');
INSERT INTO `cast_crew` VALUES (258, 'Vera Janisch', 'https://fiveflix.test/default-image/Default-Image.jpg', 'director', '693134', '', NULL, NULL, NULL, 1, 1, NULL, NULL, '2026-02-05 00:41:35', '2026-02-05 00:41:35');
INSERT INTO `cast_crew` VALUES (259, 'Morgan Neville', 'https://image.tmdb.org/t/p/original/gi8kgpBsyEh7AFboSoL1AI5dOhE.jpg', 'director', '70177', 'Morgan Neville (born October 10, 1967) is an American documentary film producer, director, and writer. His acclaimed film 20 Feet from Stardom won the Academy Award for Best Documentary Feature in 2014 as well as a Grammy Award for Best Music Film. His documentary Best of Enemies, on the debates between Gore Vidal and William F. Buckley, was shortlisted for the 2016 Academy Award and won an Emmy Award. His 2018 film Won\'t You Be My Neighbor?, a documentary about Fred Rogers, received critical acclaim and became the highest-grossing biographical documentary of all time.\n\nNeville has been nominated for five additional Grammys for films including Respect Yourself: The Stax Records Story, Muddy Waters: Can’t Be Satisfied, Johnny Cash’s America, and The Music of Strangers: Yo-Yo Ma and the Silk Road Ensemble. Neville’s other films include The Cool School, Shotgun Freeway, Keith Richards: Under the Influence, and, as producer, Miss Americana, Beauty Is Embarrassing, and Crossfire Hurricane.\n\nFor television, Neville directed and executive produced the series Ugly Delicious, Abstract: The Art of Design, Chelsea Does, Shangri-La, and Song Exploder.', 'Los Angeles, California, USA', '1967-10-10', NULL, 1, 1, NULL, NULL, '2026-03-01 22:59:19', '2026-03-01 22:59:19');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `releted_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (5, 'Comidy', 'comidy', 'live_tv', '', '2025-09-04 17:43:15', '2025-09-04 17:43:15', '1', NULL);
INSERT INTO `categories` VALUES (6, 'Edicational', 'edicational', 'live_tv', 'Lovepik_com_401166533_education_learning_68b9d44e764c9.png', '2025-09-04 18:03:18', '2025-09-04 18:03:18', '1', NULL);
INSERT INTO `categories` VALUES (7, 'Entertainment', 'entertainment', 'live_tv', '2040660_68b9d44e74ca0.png', '2025-09-04 18:04:01', '2025-09-04 18:04:01', '1', NULL);
INSERT INTO `categories` VALUES (8, 'Documentry', 'documentry', 'live_tv', '6553221_68b9d44e6cb2e.png', '2025-09-04 18:04:49', '2025-09-04 18:04:49', '1', NULL);
INSERT INTO `categories` VALUES (9, 'Action', 'action', 'live_tv', '12355765_68b9d9187c43b.png', '2025-09-04 18:23:37', '2025-09-04 18:23:37', '1', NULL);
INSERT INTO `categories` VALUES (43, 'Game', 'game', 'other', 'action_genre.png', '2025-11-25 16:52:03', '2025-11-25 16:52:03', '1', NULL);
INSERT INTO `categories` VALUES (44, 'Software', 'software', 'other', '2bfb04ad814c4995f0c537c68db5cd0b_multicolor_swirls_circle_logo_6925e41da28ef.png', '2025-11-25 17:15:32', '2025-11-25 17:15:32', '1', NULL);
INSERT INTO `categories` VALUES (45, 'Tutorial', 'tutorial', 'other', '6347699_6925e7cbf2d32.png', '2025-11-25 17:31:10', '2025-11-25 17:31:10', '1', NULL);

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cities
-- ----------------------------

-- ----------------------------
-- Table structure for constants
-- ----------------------------
DROP TABLE IF EXISTS `constants`;
CREATE TABLE `constants`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int NOT NULL DEFAULT 0,
  `sub_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of constants
-- ----------------------------
INSERT INTO `constants` VALUES (1, 'x265', 'upload_type', 'x265', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:19:49', '2025-08-24 11:19:49', NULL);
INSERT INTO `constants` VALUES (2, 'Embedded', 'upload_type', 'Embedded', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:19:49', '2025-08-24 11:19:49', NULL);
INSERT INTO `constants` VALUES (3, 'x265', 'STREAM_TYPE', 'x265', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:19:49', '2025-08-24 11:19:49', NULL);
INSERT INTO `constants` VALUES (4, 'English', 'language', 'en', 1, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:19:59', '2025-08-24 11:19:59', NULL);
INSERT INTO `constants` VALUES (5, 'বাংলা', 'language', 'br', 2, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:19:59', '2025-08-24 11:19:59', NULL);
INSERT INTO `constants` VALUES (6, 'العربی', 'language', 'ar', 3, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:19:59', '2025-08-24 11:19:59', NULL);
INSERT INTO `constants` VALUES (7, 'Vietnamese', 'language', 'vi', 4, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:19:59', '2025-08-24 11:19:59', NULL);
INSERT INTO `constants` VALUES (8, 'Paid', 'PAYMENT_STATUS', '1', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:19:59', '2025-08-24 11:19:59', NULL);
INSERT INTO `constants` VALUES (9, 'Pending', 'PAYMENT_STATUS', '0', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (10, 'Pending', 'PAYMENT_STATUS', '0', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (11, 'Local', 'upload_type', 'Local', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (12, 'URL', 'upload_type', 'URL', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (13, 'YouTube', 'upload_type', 'YouTube', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (14, 'HLS', 'upload_type', 'HLS', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (15, 'Vimeo', 'upload_type', 'Vimeo', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (16, 'x265', 'upload_type', 'x265', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (17, 'English', 'movie_language', 'english', 0, NULL, 1, NULL, 1, NULL, '2025-08-24 11:20:00', '2025-09-20 10:53:47', NULL);
INSERT INTO `constants` VALUES (18, 'Hindi', 'movie_language', 'hindi', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (19, 'Tamil', 'movie_language', 'tamil', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (20, 'Telugu', 'movie_language', 'telugu', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (21, 'Malayalam', 'movie_language', 'malayalam', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (22, 'Spanish', 'movie_language', 'spanish', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (23, 'French', 'movie_language', 'french', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (24, 'Arabic', 'movie_language', 'arabic', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (25, 'German', 'movie_language', 'german', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (26, '480p', 'video_quality', '480p', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (27, '720p', 'video_quality', '720p', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (28, '1080p', 'video_quality', '1080p', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (29, '1440p', 'video_quality', '1440p', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (30, '2K', 'video_quality', '2K', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (31, '4K', 'video_quality', '4K', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (32, '8K', 'video_quality', '8K', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (33, 'URL', 'STREAM_TYPE', 'URL', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (34, 'YouTube', 'STREAM_TYPE', 'YouTube', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (35, 'HLS', 'STREAM_TYPE', 'HLS', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (36, 'Vimeo', 'STREAM_TYPE', 'Vimeo', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (37, 'Embedded', 'STREAM_TYPE', 'Embedded', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (38, 'x265', 'STREAM_TYPE', 'x265', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (39, 'English', 'subtitle_language', 'en', 1, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (40, 'French', 'subtitle_language', 'fr', 2, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (41, 'Arebic', 'subtitle_language', 'ar', 3, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (42, 'Vietnamese', 'subtitle_language', 'vi', 4, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (43, 'Spanish', 'subtitle_language', 'es', 5, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (44, 'Dutch', 'subtitle_language', 'nl', 7, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (45, 'Portuguese', 'subtitle_language', 'pt', 6, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `constants` VALUES (46, 'Chnage Password', 'notification_type', 'change_password', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (47, 'Forget Email/Password', 'notification_type', 'forget_email_password', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (48, 'ID', 'notification_param_button', 'id', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (49, 'User Name', 'notification_param_button', 'user_name', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (50, 'Description / Note', 'notification_param_button', 'description', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (51, 'Your Name', 'notification_param_button', 'logged_in_user_fullname', 0, NULL, 1, NULL, 1, NULL, '2025-08-24 11:20:32', '2025-08-25 04:38:37', NULL);
INSERT INTO `constants` VALUES (52, 'Your Position', 'notification_param_button', 'logged_in_user_role', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (53, 'User\' ID', 'notification_param_button', 'user_id', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (54, 'User Password', 'notification_param_button', 'user_password', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (55, 'Link', 'notification_param_button', 'link', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (56, 'Site URL', 'notification_param_button', 'site_url', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (57, 'User', 'notification_to', 'user', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (58, 'Admin', 'notification_to', 'admin', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (59, 'Demo Admin', 'notification_to', 'demo_admin', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (60, 'TV Show Add', 'notification_type', 'tv_show_add', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (61, 'Movie Add', 'notification_type', 'movie_add', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (62, 'Episode Add', 'notification_type', 'episode_add', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (63, 'Season Add', 'notification_type', 'season_add', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (64, 'New Subscription', 'notification_type', 'new_subscription', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (65, 'Purchase Video', 'notification_type', 'purchase_video', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (66, 'Rent Video', 'notification_type', 'rent_video', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (67, 'Rent Expiry Reminder', 'notification_type', 'rent_expiry_reminder', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (68, 'Purchase Expiry Reminder', 'notification_type', 'purchase_expiry_reminder', 0, NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `constants` VALUES (69, '日本語', 'movie_language', '日本語', 0, NULL, 1, 1, 1, NULL, '2025-09-20 10:55:09', '2025-09-20 10:55:09', NULL);
INSERT INTO `constants` VALUES (70, 'हिन्दी', 'movie_language', 'हिन्दी', 0, NULL, 1, 1, 1, NULL, '2025-09-23 10:30:07', '2025-09-23 10:30:07', NULL);
INSERT INTO `constants` VALUES (71, 'తెలుగు', 'movie_language', 'తెలుగు', 0, NULL, 1, 1, 1, NULL, '2025-09-23 10:30:35', '2025-09-23 10:30:35', NULL);

-- ----------------------------
-- Table structure for continue_watch
-- ----------------------------
DROP TABLE IF EXISTS `continue_watch`;
CREATE TABLE `continue_watch`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entertainment_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `profile_id` int NULL DEFAULT NULL,
  `entertainment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `watched_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_watched_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `episode_id` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `continue_watch_user_id_profile_id_deleted_at_index`(`user_id` ASC, `profile_id` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of continue_watch
-- ----------------------------

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dial_code` int NULL DEFAULT NULL,
  `currency_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES (1, 'AF', 'Afghanistan', 93, 'Afghan Afghani', '؋', 'AFN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (2, 'AL', 'Albania', 355, 'Albanian Lek', 'Lek', 'ALL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (3, 'DZ', 'Algeria', 213, 'Algerian Dinar', 'د.ج', 'DZD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (4, 'AS', 'American Samoa', 1684, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (5, 'AD', 'Andorra', 376, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (6, 'AO', 'Angola', 244, 'Angolan Kwanza', 'Kz', 'AOA', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (7, 'AI', 'Anguilla', 1264, 'East Caribbean Dollar', '$', 'XCD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (8, 'AQ', 'Antarctica', 0, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (9, 'AG', 'Antigua And Barbuda', 1268, 'East Caribbean Dollar', '$', 'XCD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (10, 'AR', 'Argentina', 54, 'Argentine Peso', '$', 'ARS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (11, 'AM', 'Armenia', 374, 'Armenian Dram', '֏', 'AMD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (12, 'AW', 'Aruba', 297, 'Aruban Florin', 'ƒ', 'AWG', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (13, 'AU', 'Australia', 61, 'Australian Dollar', '$', 'AUD', 1, NULL, 1, NULL, '2025-08-24 11:19:57', '2026-02-03 21:33:45', NULL);
INSERT INTO `countries` VALUES (14, 'AT', 'Austria', 43, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (15, 'AZ', 'Azerbaijan', 994, 'Azerbaijani Manat', '₼', 'AZN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (16, 'BS', 'Bahamas The', 1242, 'Bahamian Dollar', '$', 'BSD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (17, 'BH', 'Bahrain', 973, 'Bahraini Dinar', 'ب.د', 'BHD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (18, 'BD', 'Bangladesh', 880, 'Bangladeshi Taka', '৳', 'BDT', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (19, 'BB', 'Barbados', 1246, 'Barbadian Dollar', '$', 'BBD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (20, 'BY', 'Belarus', 375, 'Belarusian Ruble', 'Br', 'BYN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (21, 'BE', 'Belgium', 32, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (22, 'BZ', 'Belize', 501, 'Belize Dollar', '$', 'BZD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (23, 'BJ', 'Benin', 229, 'West African CFA franc', 'Fr', 'XOF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (24, 'BM', 'Bermuda', 1441, 'Bermudian Dollar', '$', 'BMD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (25, 'BT', 'Bhutan', 975, 'Bhutanese Ngultrum', 'Nu.', 'BTN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (26, 'BO', 'Bolivia', 591, 'Bolivian Boliviano', 'Bs.', 'BOB', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (27, 'BA', 'Bosnia and Herzegovina', 387, 'Bosnia and Herzegovina Convertible Mark', 'КМ', 'BAM', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (28, 'BW', 'Botswana', 267, 'Botswana Pula', 'P', 'BWP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (29, 'BV', 'Bouvet Island', 0, 'Norwegian Krone', 'kr', 'NOK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (30, 'BR', 'Brazil', 55, 'Brazilian Real', 'R$', 'BRL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (31, 'IO', 'British Indian Ocean Territory', 246, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (32, 'BN', 'Brunei', 673, 'Brunei Dollar', '$', 'BND', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (33, 'BG', 'Bulgaria', 359, 'Bulgarian Lev', 'лв.', 'BGN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (34, 'BF', 'Burkina Faso', 226, 'West African CFA franc', 'Fr', 'XOF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (35, 'BI', 'Burundi', 257, 'Burundian Franc', 'Fr', 'BIF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (36, 'KH', 'Cambodia', 855, 'Cambodian Riel', '៛', 'KHR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (37, 'CM', 'Cameroon', 237, 'Central African CFA franc', 'Fr', 'XAF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (38, 'CA', 'Canada', 1, 'Canadian Dollar', '$', 'CAD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (39, 'CV', 'Cape Verde', 238, 'Cape Verdean Escudo', '$', 'CVE', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (40, 'KY', 'Cayman Islands', 1345, 'Cayman Islands Dollar', '$', 'KYD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (41, 'CF', 'Central African Republic', 236, 'Central African CFA franc', 'Fr', 'XAF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (42, 'TD', 'Chad', 235, 'Central African CFA franc', 'Fr', 'XAF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (43, 'CL', 'Chile', 56, 'Chilean Peso', '$', 'CLP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (44, 'CN', 'China', 86, 'Chinese Yuan', '¥', 'CNY', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (45, 'CX', 'Christmas Island', 61, 'Australian Dollar', '$', 'AUD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (46, 'CC', 'Cocos (Keeling) Islands', 672, 'Australian Dollar', '$', 'AUD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (47, 'CO', 'Colombia', 57, 'Colombian Peso', '$', 'COP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (48, 'KM', 'Comoros', 269, 'Comorian Franc', 'Fr', 'KMF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (49, 'CG', 'Republic Of The Congo', 242, 'Central African CFA franc', 'Fr', 'XAF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (50, 'CD', 'Democratic Republic Of The Congo', 242, 'Congolese Franc', 'Fr', 'CDF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (51, 'CK', 'Cook Islands', 682, 'New Zealand Dollar', '$', 'NZD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (52, 'CR', 'Costa Rica', 506, 'Costa Rican Colon', '₡', 'CRC', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 225, 'West African CFA franc', 'Fr', 'XOF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (54, 'HR', 'Croatia (Hrvatska)', 385, 'Croatian Kuna', 'kn', 'HRK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (55, 'CU', 'Cuba', 53, 'Cuban Peso', '$', 'CUP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (56, 'CY', 'Cyprus', 357, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (57, 'CZ', 'Czech Republic', 420, 'Czech Koruna', 'Kč', 'CZK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (58, 'DK', 'Denmark', 45, 'Danish Krone', 'kr', 'DKK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (59, 'DJ', 'Djibouti', 253, 'Djiboutian Franc', 'Fr', 'DJF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (60, 'DM', 'Dominica', 1767, 'East Caribbean Dollar', '$', 'XCD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (61, 'DO', 'Dominican Republic', 1809, 'Dominican Peso', '$', 'DOP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (62, 'TP', 'East Timor', 670, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (63, 'EC', 'Ecuador', 593, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (64, 'EG', 'Egypt', 20, 'Egyptian Pound', 'E£', 'EGP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (65, 'SV', 'El Salvador', 503, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (66, 'GQ', 'Equatorial Guinea', 240, 'Central African CFA franc', 'Fr', 'XAF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (67, 'ER', 'Eritrea', 291, 'Eritrean Nakfa', 'Nfk', 'ERN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (68, 'EE', 'Estonia', 372, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (69, 'ET', 'Ethiopia', 251, 'Ethiopian Birr', 'Br', 'ETB', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (70, 'XA', 'External Territories of Australia', 61, 'Australian Dollar', '$', 'AUD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (71, 'FK', 'Falkland Islands', 500, 'Falkland Islands Pound', '£', 'FKP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (72, 'FO', 'Faroe Islands', 298, 'Danish Krone', 'kr', 'DKK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (73, 'FJ', 'Fiji Islands', 679, 'Fijian Dollar', '$', 'FJD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (74, 'FI', 'Finland', 358, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (75, 'FR', 'France', 33, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (76, 'GF', 'French Guiana', 594, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (77, 'PF', 'French Polynesia', 689, 'CFP Franc', 'Fr', 'XPF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (78, 'TF', 'French Southern Territories', 0, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (79, 'GA', 'Gabon', 241, 'Central African CFA franc', 'Fr', 'XAF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (80, 'GM', 'Gambia The', 220, 'Gambian Dalasi', 'D', 'GMD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (81, 'GE', 'Georgia', 995, 'Georgian Lari', 'ლ', 'GEL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (82, 'DE', 'Germany', 49, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (83, 'GH', 'Ghana', 233, 'Ghanaian Cedi', '₵', 'GHS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (84, 'GI', 'Gibraltar', 350, 'Gibraltar Pound', '£', 'GIP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (85, 'GR', 'Greece', 30, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (86, 'GL', 'Greenland', 299, 'Danish Krone', 'kr', 'DKK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (87, 'GD', 'Grenada', 1473, 'East Caribbean Dollar', '$', 'XCD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (88, 'GP', 'Guadeloupe', 590, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (89, 'GU', 'Guam', 1671, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (90, 'GT', 'Guatemala', 502, 'Guatemalan Quetzal', 'Q', 'GTQ', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (91, 'XU', 'Guernsey and Alderney', 44, 'Pound Sterling', '£', 'GBP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (92, 'GN', 'Guinea', 224, 'Guinean Franc', 'Fr', 'GNF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (93, 'GW', 'Guinea-Bissau', 245, 'West African CFA franc', 'Fr', 'XOF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (94, 'GY', 'Guyana', 592, 'Guyanaese Dollar', '$', 'GYD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (95, 'HT', 'Haiti', 509, 'Haitian Gourde', 'G', 'HTG', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (96, 'HM', 'Heard and McDonald Islands', 0, 'Australian Dollar', '$', 'AUD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (97, 'HN', 'Honduras', 504, 'Honduran Lempira', 'L', 'HNL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (98, 'HK', 'Hong Kong S.A.R.', 852, 'Hong Kong Dollar', '$', 'HKD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (99, 'HU', 'Hungary', 36, 'Hungarian Forint', 'Ft', 'HUF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (100, 'IS', 'Iceland', 354, 'Icelandic Krona', 'kr', 'ISK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (101, 'IN', 'India', 91, 'Indian Rupee', '₹', 'INR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (102, 'ID', 'Indonesia', 62, 'Indonesian Rupiah', 'Rp', 'IDR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (103, 'IR', 'Iran', 98, 'Iranian Rial', '﷼', 'IRR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (104, 'IQ', 'Iraq', 964, 'Iraqi Dinar', 'ع.د', 'IQD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (105, 'IE', 'Ireland', 353, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (106, 'IL', 'Israel', 972, 'Israeli New Shekel', '₪', 'ILS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (107, 'IT', 'Italy', 39, 'Euro', '€', 'EUR', 1, NULL, 1, NULL, '2025-08-24 11:19:57', '2026-02-04 11:22:52', NULL);
INSERT INTO `countries` VALUES (108, 'JM', 'Jamaica', 1876, 'Jamaican Dollar', '$', 'JMD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (109, 'JP', 'Japan', 81, 'Japanese Yen', '¥', 'JPY', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (110, 'XJ', 'Jersey', 44, 'Pound Sterling', '£', 'GBP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (111, 'JO', 'Jordan', 962, 'Jordanian Dinar', 'د.ا', 'JOD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (112, 'KZ', 'Kazakhstan', 7, 'Kazakhstani Tenge', '〒', 'KZT', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (113, 'KE', 'Kenya', 254, 'Kenyan Shilling', 'Sh', 'KES', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (114, 'KI', 'Kiribati', 686, 'Australian Dollar', '$', 'AUD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (115, 'KP', 'Korea North', 850, 'North Korean Won', '₩', 'KPW', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (116, 'KR', 'Korea South', 82, 'South Korean Won', '₩', 'KRW', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (117, 'KW', 'Kuwait', 965, 'Kuwaiti Dinar', 'د.ك', 'KWD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (118, 'KG', 'Kyrgyzstan', 996, 'Kyrgyzstani Som', 'с', 'KGS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (119, 'LA', 'Laos', 856, 'Lao Kip', '₭', 'LAK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (120, 'LV', 'Latvia', 371, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (121, 'LB', 'Lebanon', 961, 'Lebanese Pound', 'ل.ل', 'LBP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (122, 'LS', 'Lesotho', 266, 'Lesotho Loti', 'L', 'LSL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (123, 'LR', 'Liberia', 231, 'Liberian Dollar', '$', 'LRD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (124, 'LY', 'Libya', 218, 'Libyan Dinar', 'ل.د', 'LYD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (125, 'LI', 'Liechtenstein', 423, 'Swiss Franc', 'Fr', 'CHF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (126, 'LT', 'Lithuania', 370, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (127, 'LU', 'Luxembourg', 352, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (128, 'MO', 'Macau S.A.R.', 853, 'Macanese Pataca', 'MOP$', 'MOP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (129, 'MK', 'Macedonia', 389, 'Macedonian Denar', 'ден', 'MKD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (130, 'MG', 'Madagascar', 261, 'Malagasy Ariary', 'Ar', 'MGA', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (131, 'MW', 'Malawi', 265, 'Malawian Kwacha', 'MK', 'MWK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (132, 'MY', 'Malaysia', 60, 'Malaysian Ringgit', 'RM', 'MYR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (133, 'MV', 'Maldives', 960, 'Maldivian Rufiyaa', '.ރ', 'MVR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (134, 'ML', 'Mali', 223, 'West African CFA franc', 'Fr', 'XOF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (135, 'MT', 'Malta', 356, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (136, 'XM', 'Man (Isle of)', 44, 'Pound Sterling', '£', 'GBP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (137, 'MH', 'Marshall Islands', 692, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (138, 'MQ', 'Martinique', 596, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (139, 'MR', 'Mauritania', 222, 'Mauritanian Ouguiya', 'UM', 'MRU', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (140, 'MU', 'Mauritius', 230, 'Mauritian Rupee', '₨', 'MUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (141, 'YT', 'Mayotte', 269, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (142, 'MX', 'Mexico', 52, 'Mexican Peso', '$', 'MXN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (143, 'FM', 'Micronesia', 691, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (144, 'MD', 'Moldova', 373, 'Moldovan Leu', 'L', 'MDL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (145, 'MC', 'Monaco', 377, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (146, 'MN', 'Mongolia', 976, 'Mongolian Tugrik', '₮', 'MNT', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (147, 'MS', 'Montserrat', 1664, 'East Caribbean Dollar', '$', 'XCD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (148, 'MA', 'Morocco', 212, 'Moroccan Dirham', 'DH', 'MAD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (149, 'MZ', 'Mozambique', 258, 'Mozambican Metical', 'MT', 'MZN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (150, 'MM', 'Myanmar', 95, 'Myanmar Kyat', 'Ks', 'MMK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (151, 'NA', 'Namibia', 264, 'Namibian Dollar', '$', 'NAD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (152, 'NR', 'Nauru', 674, 'Australian Dollar', '$', 'AUD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (153, 'NP', 'Nepal', 977, 'Nepalese Rupee', '₨', 'NPR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (154, 'AN', 'Netherlands Antilles', 599, 'Netherlands Antillean Guilder', 'ƒ', 'ANG', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (155, 'NL', 'Netherlands The', 31, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (156, 'NC', 'New Caledonia', 687, 'CFP Franc', 'Fr', 'XPF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (157, 'NZ', 'New Zealand', 64, 'New Zealand Dollar', '$', 'NZD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (158, 'NI', 'Nicaragua', 505, 'Nicaraguan Cordoba', 'C$', 'NIO', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (159, 'NE', 'Niger', 227, 'West African CFA franc', 'Fr', 'XOF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (160, 'NG', 'Nigeria', 234, 'Nigerian Naira', '₦', 'NGN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (161, 'NU', 'Niue', 683, 'New Zealand Dollar', '$', 'NZD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (162, 'NF', 'Norfolk Island', 672, 'Australian Dollar', '$', 'AUD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (163, 'MP', 'Northern Mariana Islands', 1670, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (164, 'NO', 'Norway', 47, 'Norwegian Krone', 'kr', 'NOK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (165, 'OM', 'Oman', 968, 'Omani Rial', 'ر.ع.', 'OMR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (166, 'PK', 'Pakistan', 92, 'Pakistani Rupee', '₨', 'PKR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (167, 'PW', 'Palau', 680, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (168, 'PS', 'Palestinian Territory Occupied', 970, 'Israeli New Shekel', '₪', 'ILS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (169, 'PA', 'Panama', 507, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (170, 'PG', 'Papua new Guinea', 675, 'Papua New Guinean Kina', 'K', 'PGK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (171, 'PY', 'Paraguay', 595, 'Paraguayan Guarani', '₲', 'PYG', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (172, 'PE', 'Peru', 51, 'Peruvian Nuevo Sol', 'S/.', 'PEN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (173, 'PH', 'Philippines', 63, 'Philippine Peso', '₱', 'PHP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (174, 'PN', 'Pitcairn Island', 0, 'New Zealand Dollar', '$', 'NZD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (175, 'PL', 'Poland', 48, 'Polish Zloty', 'zł', 'PLN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (176, 'PT', 'Portugal', 351, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (177, 'PR', 'Puerto Rico', 1787, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (178, 'QA', 'Qatar', 974, 'Qatari Rial', 'ر.ق', 'QAR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (179, 'RE', 'Reunion', 262, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (180, 'RO', 'Romania', 40, 'Romanian Leu', 'lei', 'RON', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (181, 'RU', 'Russia', 7, 'Russian Ruble', '₽', 'RUB', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (182, 'RW', 'Rwanda', 250, 'Rwandan Franc', 'Fr', 'RWF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (183, 'SH', 'Saint Helena', 290, 'Saint Helena Pound', '£', 'SHP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (184, 'KN', 'Saint Kitts And Nevis', 1869, 'East Caribbean Dollar', '$', 'XCD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (185, 'LC', 'Saint Lucia', 1758, 'East Caribbean Dollar', '$', 'XCD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (186, 'PM', 'Saint Pierre and Miquelon', 508, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (187, 'VC', 'Saint Vincent And The Grenadines', 1784, 'East Caribbean Dollar', '$', 'XCD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (188, 'WS', 'Samoa', 684, 'Samoan Tala', 'T', 'WST', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (189, 'SM', 'San Marino', 378, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (190, 'ST', 'Sao Tome and Principe', 239, 'Sao Tome and Principe Dobra', 'Db', 'STN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (191, 'SA', 'Saudi Arabia', 966, 'Saudi Riyal', 'ر.س', 'SAR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (192, 'SN', 'Senegal', 221, 'West African CFA franc', 'Fr', 'XOF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (193, 'RS', 'Serbia', 381, 'Serbian Dinar', 'дин.', 'RSD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (194, 'SC', 'Seychelles', 248, 'Seychellois Rupee', '₨', 'SCR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (195, 'SL', 'Sierra Leone', 232, 'Sierra Leonean Leone', 'Le', 'SLL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (196, 'SG', 'Singapore', 65, 'Singapore Dollar', '$', 'SGD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (197, 'SK', 'Slovakia', 421, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (198, 'SI', 'Slovenia', 386, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (199, 'SB', 'Solomon Islands', 677, 'Solomon Islands Dollar', '$', 'SBD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (200, 'SO', 'Somalia', 252, 'Somali Shilling', 'Sh', 'SOS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (201, 'ZA', 'South Africa', 27, 'South African Rand', 'R', 'ZAR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (202, 'GS', 'South Georgia', 0, 'British Pound Sterling', '£', 'GBP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (203, 'SS', 'South Sudan', 211, 'South Sudanese Pound', '£', 'SSP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (204, 'ES', 'Spain', 34, 'Euro', '€', 'EUR', 1, NULL, 1, NULL, '2025-08-24 11:19:57', '2026-02-03 21:06:32', NULL);
INSERT INTO `countries` VALUES (205, 'LK', 'Sri Lanka', 94, 'Sri Lankan Rupee', '₨', 'LKR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (206, 'SD', 'Sudan', 249, 'Sudanese Pound', 'ج.س.', 'SDG', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (207, 'SR', 'Suriname', 597, 'Surinamese Dollar', '$', 'SRD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (208, 'SJ', 'Svalbard And Jan Mayen Islands', 47, 'Norwegian Krone', 'kr', 'NOK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (209, 'SZ', 'Swaziland', 268, 'Swazi Lilangeni', 'L', 'SZL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (210, 'SE', 'Sweden', 46, 'Swedish Krona', 'kr', 'SEK', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (211, 'CH', 'Switzerland', 41, 'Swiss Franc', 'Fr', 'CHF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (212, 'SY', 'Syria', 963, 'Syrian Pound', '£', 'SYP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (213, 'TW', 'Taiwan', 886, 'Taiwan Dollar', 'NT$', 'TWD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (214, 'TJ', 'Tajikistan', 992, 'Tajikistani Somoni', 'ЅМ', 'TJS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (215, 'TZ', 'Tanzania', 255, 'Tanzanian Shilling', 'Sh', 'TZS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (216, 'TH', 'Thailand', 66, 'Thai Baht', '฿', 'THB', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (217, 'TG', 'Togo', 228, 'West African CFA franc', 'Fr', 'XOF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (218, 'TK', 'Tokelau', 690, 'New Zealand Dollar', '$', 'NZD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (219, 'TO', 'Tonga', 676, 'Tongan Pa\'anga', 'T$', 'TOP', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (220, 'TT', 'Trinidad And Tobago', 1868, 'Trinidad and Tobago Dollar', '$', 'TTD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (221, 'TN', 'Tunisia', 216, 'Tunisian Dinar', 'د.ت', 'TND', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (222, 'TR', 'Turkey', 90, 'Turkish Lira', '₺', 'TRY', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (223, 'TM', 'Turkmenistan', 993, 'Turkmenistani Manat', 'm', 'TMT', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (224, 'TC', 'Turks And Caicos Islands', 1649, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (225, 'TV', 'Tuvalu', 688, 'Australian Dollar', '$', 'AUD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (226, 'UG', 'Uganda', 256, 'Ugandan Shilling', 'Sh', 'UGX', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (227, 'UA', 'Ukraine', 380, 'Ukrainian Hryvnia', '₴', 'UAH', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (228, 'AE', 'United Arab Emirates', 971, 'United Arab Emirates Dirham', 'د.إ', 'AED', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (229, 'GB', 'United Kingdom', 44, 'British Pound Sterling', '£', 'GBP', 1, NULL, 1, NULL, '2025-08-24 11:19:57', '2026-02-03 20:42:39', NULL);
INSERT INTO `countries` VALUES (230, 'US', 'United States', 1, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (231, 'UM', 'United States Minor Outlying Islands', 1, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (232, 'UY', 'Uruguay', 598, 'Uruguayan Peso', '$', 'UYU', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (233, 'UZ', 'Uzbekistan', 998, 'Uzbekistani Som', 'лв', 'UZS', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (234, 'VU', 'Vanuatu', 678, 'Vanuatu Vatu', 'VT', 'VUV', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (235, 'VA', 'Vatican City State (Holy See)', 39, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (236, 'VE', 'Venezuela', 58, 'Venezuelan Bolivar', 'Bs.', 'VES', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (237, 'VN', 'Vietnam', 84, 'Vietnamese Dong', '₫', 'VND', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (238, 'VG', 'Virgin Islands (British)', 1284, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (239, 'VI', 'Virgin Islands (US)', 1340, 'United States Dollar', '$', 'USD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (240, 'WF', 'Wallis And Futuna Islands', 681, 'CFP Franc', 'Fr', 'XPF', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (241, 'EH', 'Western Sahara', 212, 'Moroccan Dirham', 'DH', 'MAD', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (242, 'YE', 'Yemen', 967, 'Yemeni Rial', '﷼', 'YER', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (243, 'YU', 'Yugoslavia', 38, 'Yugoslavian Dinar', 'дин.', 'YUN', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (244, 'ZM', 'Zambia', 260, 'Zambian Kwacha', 'ZK', 'ZMW', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (245, 'ZW', 'Zimbabwe', 263, 'Zimbabwean Dollar', '$', 'ZWL', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (246, 'AX', 'Åland Islands', 358, 'Euro', '€', 'EUR', 1, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `countries` VALUES (247, NULL, 'United States of America', NULL, NULL, NULL, NULL, 1, 1, 1, NULL, '2026-02-03 20:42:39', '2026-02-03 20:42:39', NULL);

-- ----------------------------
-- Table structure for coupon_subscription_plan
-- ----------------------------
DROP TABLE IF EXISTS `coupon_subscription_plan`;
CREATE TABLE `coupon_subscription_plan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `subscription_plan_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `coupon_subscription_plan_coupon_id_foreign`(`coupon_id` ASC) USING BTREE,
  INDEX `coupon_subscription_plan_subscription_plan_id_foreign`(`subscription_plan_id` ASC) USING BTREE,
  CONSTRAINT `coupon_subscription_plan_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `coupon_subscription_plan_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `plan` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_subscription_plan
-- ----------------------------

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `start_date` date NULL DEFAULT NULL,
  `expire_date` date NULL DEFAULT NULL,
  `discount_type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(8, 2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupons_code_unique`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupons
-- ----------------------------

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `currency_position` enum('left','right','left_with_space','right_with_space') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `no_of_decimal` int UNSIGNED NOT NULL,
  `thousand_separator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `decimal_separator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'United States Dollar', '$', 'USD', 0, 'left', 2, ',', '.', 2, 1, NULL, '2024-07-30 07:18:52', '2025-08-26 05:29:11', NULL);
INSERT INTO `currencies` VALUES (2, 'Euro', '€', 'EUR', 0, 'left', 2, ',', '.', 2, 2, NULL, '2024-07-30 07:19:08', '2024-07-30 07:19:08', NULL);
INSERT INTO `currencies` VALUES (3, 'Indian Rupee', '₹', 'INR', 0, 'left', 2, ',', '.', 2, 2, NULL, '2024-07-30 07:19:52', '2024-07-30 07:19:52', NULL);
INSERT INTO `currencies` VALUES (4, 'Bangladeshi Taka', '৳', 'BDT', 1, 'left', 2, ',', '.', 1, 1, NULL, '2025-08-26 05:01:31', '2025-08-26 05:29:11', NULL);

-- ----------------------------
-- Table structure for custom_ads_setting
-- ----------------------------
DROP TABLE IF EXISTS `custom_ads_setting`;
CREATE TABLE `custom_ads_setting`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `placement` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `media` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `redirect_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `skip_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `skip_after` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `target_content_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `target_categories` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `max_views` int NULL DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_ads_setting
-- ----------------------------
INSERT INTO `custom_ads_setting` VALUES (1, 'BigSale', 'image', 'local', 'home_page', 'pexels-kyle-loftus-1280314238-32439172.jpg', NULL, NULL, 0, NULL, NULL, '[]', NULL, 0, 1, '2025-08-24', '2026-08-24', '2025-08-12 07:38:23', '2025-08-24 11:20:33', NULL);
INSERT INTO `custom_ads_setting` VALUES (2, 'MovieTicket', 'image', 'local', 'home_page', 'pexels-kyle-loftus-1280314238-32439172.jpg', NULL, NULL, 0, NULL, NULL, '[]', NULL, 0, 1, '2025-08-24', '2026-08-24', '2025-08-12 07:39:08', '2025-08-24 11:20:33', NULL);
INSERT INTO `custom_ads_setting` VALUES (3, 'EpisodePromo', 'image', 'local', 'home_page', 'pexels-minhle17vn-3062545.jpg', NULL, NULL, 0, NULL, NULL, '[]', NULL, 0, 1, '2025-08-24', '2026-08-24', '2025-08-12 07:40:35', '2025-08-24 11:20:33', NULL);
INSERT INTO `custom_ads_setting` VALUES (4, 'ServicePromo', 'image', 'local', 'home_page', 'pexels-ron-lach-9627162.jpg', NULL, NULL, 0, NULL, NULL, '[]', NULL, 0, 1, '2025-08-24', '2026-08-24', '2025-08-12 07:41:21', '2025-08-24 11:20:33', NULL);
INSERT INTO `custom_ads_setting` VALUES (6, 'FashionLine', 'image', 'local', 'player', 'pexels-minhle17vn-3062545.jpg', NULL, NULL, 0, NULL, 'video', '[7,8,9,11,31,32,33,34]', NULL, 0, 1, '2025-08-24', '2026-08-24', '2025-08-12 07:51:40', '2025-08-24 11:20:34', NULL);
INSERT INTO `custom_ads_setting` VALUES (8, 'StreamingSvc', 'image', 'local', 'banner', 'pexels-ron-lach-9627169.jpg', NULL, NULL, 0, NULL, 'video', '[12,15,16]', NULL, 0, 1, '2025-08-24', '2026-08-24', '2025-08-12 07:55:05', '2025-08-24 11:20:34', NULL);

-- ----------------------------
-- Table structure for devices
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `device_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `device_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active_profile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `platform` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of devices
-- ----------------------------
INSERT INTO `devices` VALUES (4, 3, '127.0.0.1', 'Firefox', '3', 'Windows', '2025-09-24 10:29:23', '2025-09-24 10:29:23', NULL);
INSERT INTO `devices` VALUES (5, 3, '::1', 'Chrome', '3', 'Windows', '2025-09-24 10:36:23', '2025-09-24 10:36:23', NULL);
INSERT INTO `devices` VALUES (11, 13, '::1', 'Chrome', '13', 'Windows', '2025-10-01 17:05:07', '2025-10-01 17:05:07', NULL);
INSERT INTO `devices` VALUES (22, 14, '::1', 'Opera', '14', 'Windows', '2025-12-07 16:03:22', '2025-12-07 16:08:15', NULL);

-- ----------------------------
-- Table structure for drive_setups
-- ----------------------------
DROP TABLE IF EXISTS `drive_setups`;
CREATE TABLE `drive_setups`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `drive_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `drive_setups_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drive_setups
-- ----------------------------
INSERT INTO `drive_setups` VALUES (1, 1, 'DIV 2', '2026-05-23 22:30:46', '2026-06-08 23:27:08');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for faqs
-- ----------------------------
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faqs
-- ----------------------------
INSERT INTO `faqs` VALUES (1, '1. What is Streamit Laravel?', 'Streamit Laravel is a cutting-edge streaming platform developed by Iqonic Design that allows users to watch movies, TV shows, and live content seamlessly. It provides a feature-rich experience with personalized recommendations, multiple subscription plans, and high-quality streaming.', 1, 2, 2, NULL, '2024-09-28 06:43:30', '2024-09-28 06:43:30', NULL);
INSERT INTO `faqs` VALUES (2, '2. How can I create an account on Streamit Laravel?', 'To create an account, simply click on the \"Sign Up\" button on the homepage, enter your details, and follow the on-screen instructions. Once registered, you can start exploring our extensive content library.', 1, 2, 2, NULL, '2024-09-28 06:44:16', '2024-09-28 06:44:16', NULL);
INSERT INTO `faqs` VALUES (3, '3. What subscription plans are available?', 'We offer multiple subscription plans tailored to your needs:\n- Basic Plan: Weekly subscription.\n- Premium Plan: Monthly subscription.\n- Ultimate Plan: Quarterly subscription.\n- Elite Plan: Yearly subscription.\nEach plan offers different features such as HD streaming, multi-device support, and download options. Visit our Subscription Plans page for more details.', 1, 2, 2, NULL, '2024-09-28 06:44:36', '2024-09-28 06:44:36', NULL);
INSERT INTO `faqs` VALUES (4, '4. What payment methods do you accept?', 'We accept a variety of payment gateways for your convenience:\n- Stripe\n- RazorPay\n- Paystack\n- PayPal\n- FlutterWave\nYou can choose your preferred method at checkout.', 1, 2, 2, NULL, '2024-09-28 06:44:57', '2024-09-28 06:44:57', NULL);
INSERT INTO `faqs` VALUES (5, '5. How can I manage my subscription?', 'To manage your subscription, log into your account, go to the \"Account Settings\" section, and select \"Subscription.\" From there, you can upgrade, downgrade, or cancel your plan at any time.', 1, 2, 2, NULL, '2024-09-28 06:45:14', '2024-09-28 06:45:14', NULL);
INSERT INTO `faqs` VALUES (6, '6. How can I add content to my watchlist?', 'While browsing movies or TV shows, simply click on the \"Add to Watchlist\" button. You can view your watchlist anytime under the \"My Watchlist\" section of your account dashboard.', 1, 2, 2, NULL, '2024-09-28 06:45:33', '2024-09-28 06:45:33', NULL);
INSERT INTO `faqs` VALUES (7, '7. Can I download content for offline viewing?', 'Yes, Streamit Laravel allows you to download selected content for offline viewing, depending on your subscription plan. This feature is available for both mobile and tablet devices.', 1, 2, 2, NULL, '2024-09-28 06:45:48', '2024-09-28 06:45:48', NULL);
INSERT INTO `faqs` VALUES (8, '8. Does Streamit Laravel support multiple devices?', 'Yes, you can stream on multiple devices based on your subscription plan. The higher the plan, the more devices you can use simultaneously.', 1, 2, 2, NULL, '2024-09-28 06:46:05', '2024-09-28 06:46:05', NULL);
INSERT INTO `faqs` VALUES (9, '9. How does the recommendation system work?', 'Our platform uses a smart recommendation engine that suggests content based on your viewing history and preferences. The more you watch, the better the recommendations get!', 1, 2, 2, NULL, '2024-09-28 06:46:21', '2024-09-28 06:46:21', NULL);
INSERT INTO `faqs` VALUES (10, '10. Is there a free trial available?', 'Yes, we offer a limited-time free trial for new users. During the trial, you can explore all the features of the platform and decide if you want to subscribe to a full plan.', 1, 2, 2, NULL, '2024-09-28 06:46:40', '2024-09-28 06:46:40', NULL);
INSERT INTO `faqs` VALUES (11, '11. How does the referral program work?', 'Our referral program rewards you for inviting friends to join Streamit Laravel. For each friend who subscribes using your referral link, you both receive a discount on your next billing cycle. Check the referral section in your account for more details!', 1, 2, 2, NULL, '2024-09-28 06:51:25', '2024-09-28 06:51:25', NULL);
INSERT INTO `faqs` VALUES (12, '12. What types of content are available on Streamit Laravel?', 'Streamit Laravel offers a diverse range of content, including movies, TV shows, documentaries, and live events across various genres. You\'ll find everything from action and comedy to horror and romance!', 1, 2, 2, NULL, '2024-09-28 06:51:47', '2024-09-28 06:51:47', NULL);
INSERT INTO `faqs` VALUES (13, '13. Can I change my subscription plan later?', 'Absolutely! You can change your subscription plan at any time through your account settings. Simply select a different plan, and your new billing will take effect at the end of your current billing cycle.', 1, 2, 2, NULL, '2024-09-28 06:52:05', '2024-09-28 06:52:05', NULL);
INSERT INTO `faqs` VALUES (14, '14. What should I do if I forget my password?', 'If you forget your password, click on the \"Forgot Password?\" link on the login page. Follow the instructions to reset your password via the email associated with your account.', 1, 2, 2, NULL, '2024-09-28 06:52:21', '2024-09-28 06:52:21', NULL);
INSERT INTO `faqs` VALUES (15, '15. Is there any age restriction for using Streamit Laravel?', 'Yes, users must be at least 13 years old to create an account. We recommend parental guidance for users under 18, as some content may not be suitable for younger viewers.', 1, 2, 2, NULL, '2024-09-28 06:52:38', '2024-09-28 06:52:38', NULL);
INSERT INTO `faqs` VALUES (16, '16. Can I share my account with family members?', 'Yes, depending on your subscription plan, you can share your account with family members. However, please note that simultaneous streaming may be limited based on your chosen plan.', 1, 2, 2, NULL, '2024-09-28 06:52:56', '2024-09-28 06:52:56', NULL);
INSERT INTO `faqs` VALUES (17, '17. How often is new content added to the platform?', 'We regularly update our library with new content! You can expect new movies, TV shows, and episodes added every week, so there\'s always something fresh to watch.', 1, 2, 2, NULL, '2024-09-28 06:53:14', '2024-09-28 06:53:14', NULL);
INSERT INTO `faqs` VALUES (18, '18. Does Streamit Laravel offer subtitles or closed captions?', 'Yes, many of our titles offer subtitles and closed captions in various languages. You can enable them through the video player settings while watching content.', 1, 2, 2, NULL, '2024-09-28 06:54:30', '2024-09-28 06:54:30', NULL);
INSERT INTO `faqs` VALUES (19, '19. What should I do if I encounter a streaming issue?', 'If you experience buffering or streaming issues, first check your internet connection. If the problem persists, try clearing your cache or refreshing the page. If you continue to have issues, please contact our support team for assistance.', 1, 2, 2, NULL, '2024-09-28 06:54:44', '2024-09-28 06:54:44', NULL);
INSERT INTO `faqs` VALUES (20, '20. How do I use the parental controls on Streamit?', 'To use parental controls on Streamit, navigate to your account settings. Here, you can set age restrictions for various content types and block specific shows or movies. Additionally, you can create custom profiles for family members with tailored controls. For added security, consider setting a PIN or password.', 1, 2, 2, NULL, '2024-09-28 06:58:39', '2024-09-28 06:58:39', NULL);
INSERT INTO `faqs` VALUES (21, '21. How do I enable subtitles or closed captions?', 'To enable subtitles or closed captions while watching content on Streamit, look for the \"Subtitles\" or \"CC\" icon on the video player. Click on it, and you can choose your preferred language for subtitles. This feature enhances your viewing experience and accessibility.', 1, 2, 2, NULL, '2024-09-28 06:59:10', '2024-09-28 06:59:10', NULL);
INSERT INTO `faqs` VALUES (22, '22. How do I customize my Streamit homepage?', 'To customize your Streamit homepage, log into your account and navigate to the \"Settings\" section. From there, you can personalize your homepage by selecting your favorite genres, organizing your watchlist, and adjusting display preferences to see content that interests you most.', 1, 2, 2, NULL, '2024-09-28 06:59:36', '2024-09-28 06:59:36', NULL);
INSERT INTO `faqs` VALUES (23, '23. How do I download videos for offline viewing?', 'To download videos for offline viewing on Streamit, find the desired movie or show and look for the download icon. Click it, and the content will be saved to your device for offline access. Note that the ability to download may depend on your subscription plan.', 1, 2, 2, NULL, '2024-09-28 07:00:06', '2024-09-28 07:00:06', NULL);
INSERT INTO `faqs` VALUES (24, '24. Can I delete my account?', 'Yes, you can delete your account at any time. To do this, log into your account, navigate to the \"Account Settings\" section, and select \"Delete Account.\" Please note that this action is irreversible, and all your data will be permanently removed.', 1, 2, 2, NULL, '2024-09-28 07:00:40', '2024-09-28 07:00:40', NULL);
INSERT INTO `faqs` VALUES (25, '25. How can I contact customer support?', 'If you need assistance, you can reach our customer support team via email at hello@iqonic.design. We\'re here to help!', 1, 2, 2, NULL, '2024-09-28 07:00:53', '2024-09-28 07:02:01', NULL);

-- ----------------------------
-- Table structure for filemanagers
-- ----------------------------
DROP TABLE IF EXISTS `filemanagers`;
CREATE TABLE `filemanagers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of filemanagers
-- ----------------------------
INSERT INTO `filemanagers` VALUES (4, 'temp/Matrix_mpw_102176_bb2f6cc5_4a16_4512_881b_f855ead3c8ec_500x7_68abfb547116e.jpg', 'Matrix_mpw_102176_bb2f6cc5_4a16_4512_881b_f855ead3c8ec_500x7_68abfb547116e.jpg', 1, 1, NULL, '2025-08-25 05:57:40', '2025-08-25 05:57:40', NULL);
INSERT INTO `filemanagers` VALUES (6, 'temp/2bfb04ad814c4995f0c537c68db5cd0b_multicolor_swirls_circle_logo_68b7b72cc04f3.png', '2bfb04ad814c4995f0c537c68db5cd0b_multicolor_swirls_circle_logo_68b7b72cc04f3.png', 1, 1, NULL, '2025-09-03 03:34:04', '2025-09-03 03:34:04', NULL);
INSERT INTO `filemanagers` VALUES (7, 'temp/6553221_68b9d44e6cb2e.png', '6553221_68b9d44e6cb2e.png', 1, 1, NULL, '2025-09-04 18:02:54', '2025-09-04 18:02:54', NULL);
INSERT INTO `filemanagers` VALUES (8, 'temp/2040660_68b9d44e74ca0.png', '2040660_68b9d44e74ca0.png', 1, 1, NULL, '2025-09-04 18:02:54', '2025-09-04 18:02:54', NULL);
INSERT INTO `filemanagers` VALUES (9, 'temp/Lovepik_com_401166533_education_learning_68b9d44e764c9.png', 'Lovepik_com_401166533_education_learning_68b9d44e764c9.png', 1, 1, NULL, '2025-09-04 18:02:54', '2025-09-04 18:02:54', NULL);
INSERT INTO `filemanagers` VALUES (10, 'temp/png_transparent_humour_comedy_comedian_happy_customers_photography_smiley_internet_radio_68b9d44e77c50.png', 'png_transparent_humour_comedy_comedian_happy_customers_photography_smiley_internet_radio_68b9d44e77c50.png', 1, 1, NULL, '2025-09-04 18:02:54', '2025-09-04 18:02:54', NULL);
INSERT INTO `filemanagers` VALUES (11, 'temp/12355765_68b9d9187c43b.png', '12355765_68b9d9187c43b.png', 1, 1, NULL, '2025-09-04 18:23:20', '2025-09-04 18:23:20', NULL);
INSERT INTO `filemanagers` VALUES (12, 'temp/png_transparent_humour_comedy_comedian_happy_customers_photography_smiley_internet_radio_68b9d97f3ce00.png', 'png_transparent_humour_comedy_comedian_happy_customers_photography_smiley_internet_radio_68b9d97f3ce00.png', 1, 1, NULL, '2025-09-04 18:25:03', '2025-09-04 18:25:03', NULL);
INSERT INTO `filemanagers` VALUES (13, 'temp/Generated_File_September_21,_2025___11_44PM_68d3d6fd3f337.mp4', 'Generated_File_September_21,_2025___11_44PM_68d3d6fd3f337.mp4', 1, 1, NULL, '2025-09-24 11:33:17', '2025-09-24 11:33:17', NULL);
INSERT INTO `filemanagers` VALUES (14, 'temp/2bfb04ad814c4995f0c537c68db5cd0b_multicolor_swirls_circle_logo_6925e41da28ef.png', '2bfb04ad814c4995f0c537c68db5cd0b_multicolor_swirls_circle_logo_6925e41da28ef.png', 1, 1, NULL, '2025-11-25 17:15:09', '2025-11-25 17:15:09', NULL);
INSERT INTO `filemanagers` VALUES (15, 'temp/6347699_6925e7cbf2d32.png', '6347699_6925e7cbf2d32.png', 1, 1, NULL, '2025-11-25 17:30:52', '2025-11-25 17:30:52', NULL);

-- ----------------------------
-- Table structure for genres
-- ----------------------------
DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `genres_id_deleted_at_index`(`id` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of genres
-- ----------------------------
INSERT INTO `genres` VALUES (1, 'Action', 'action', 'action_genre.png', 'Action movies are packed with high-energy sequences, intense battles, and thrilling adventures. These films deliver non-stop excitement and adrenaline-pumping scenes that captivate audiences. 💥🏃‍♂️', 1, NULL, 1, NULL, '2025-08-24 11:20:00', '2025-09-20 10:53:47', NULL);
INSERT INTO `genres` VALUES (2, 'Animation', 'animation', 'animation_genre.png', 'Captivating animated stories that bring imaginative worlds and characters to life. These films use creative visuals and storytelling to enchant audiences of all ages. 🎨✨', 1, NULL, 1, NULL, '2025-08-24 11:20:00', '2025-09-20 10:55:09', NULL);
INSERT INTO `genres` VALUES (3, 'Comedy', 'comedy', 'comedy_genre.png', 'Light-hearted films designed to entertain and amuse with humor and wit. These movies offer a delightful escape filled with laughter and joy. 😂🎬', 1, NULL, 1, NULL, '2025-08-24 11:20:00', '2025-09-23 10:30:24', NULL);
INSERT INTO `genres` VALUES (4, 'Historical', 'historical', 'historical_genre.png', 'Movies that delve into significant historical events, figures, and eras. They offer a glimpse into the past, bringing history to life with compelling narratives. 📜🏰', 1, NULL, 1, 1, '2025-08-24 11:20:00', '2025-09-04 15:35:00', '2025-09-04 15:35:00');
INSERT INTO `genres` VALUES (5, 'Horror', 'horror', 'horror_genre.png', 'Spine-chilling movies that evoke fear and suspense, often featuring supernatural elements. These films are designed to haunt and thrill viewers. 👻🕯️', 1, NULL, 1, NULL, '2025-08-24 11:20:00', '2026-02-03 20:42:39', NULL);
INSERT INTO `genres` VALUES (6, 'Inspirational', 'inspirational', 'inspirational_genre.png', 'Uplifting films that motivate and inspire with stories of courage, perseverance, and triumph. They often highlight the resilience of the human spirit. 🌟💪', 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `genres` VALUES (7, 'Romantic', 'romantic', 'romantic_genre.png', 'Heartwarming stories focusing on love, relationships, and the complexities of romance. These films explore the beauty and challenges of romantic connections. 💖🌹', 1, NULL, NULL, NULL, '2025-08-24 11:20:00', '2025-08-24 11:20:00', NULL);
INSERT INTO `genres` VALUES (8, 'Thriller', 'thriller', 'thriller_genre.png', 'High-stakes scenarios and intense suspense that keep you on the edge of your seat. Expect unexpected twists and heart-pounding moments. 🔪🎬', 1, NULL, 1, NULL, '2025-08-24 11:20:00', '2025-09-20 10:53:47', NULL);
INSERT INTO `genres` VALUES (9, 'New Action', 'new-action', 'Matrix_mpw_102176_bb2f6cc5_4a16_4512_881b_f855ead3c8ec_500x7_68abfb547116e.jpg', 'New Action', 1, 1, 1, NULL, '2025-08-25 07:18:53', '2025-08-25 07:18:53', NULL);
INSERT INTO `genres` VALUES (10, 'New Action', 'new-action', 'action_genre.png', 'Description', 1, 1, 1, NULL, '2025-09-04 15:59:50', '2025-09-04 15:59:50', NULL);
INSERT INTO `genres` VALUES (11, 'Drama', 'drama', NULL, NULL, 1, 1, 1, NULL, '2025-09-20 10:53:47', '2025-09-20 10:53:47', NULL);
INSERT INTO `genres` VALUES (12, 'Crime', 'crime', NULL, NULL, 1, 1, 1, NULL, '2025-09-20 10:53:47', '2025-09-20 10:53:47', NULL);
INSERT INTO `genres` VALUES (13, 'Fantasy', 'fantasy', NULL, NULL, 1, 1, 1, NULL, '2025-09-20 10:55:09', '2025-09-20 10:55:09', NULL);
INSERT INTO `genres` VALUES (14, 'Science Fiction', 'science-fiction', NULL, NULL, 1, 1, 1, NULL, '2025-09-22 09:25:37', '2025-09-22 09:25:37', NULL);
INSERT INTO `genres` VALUES (15, 'Adventure', 'adventure', NULL, NULL, 1, 1, 1, NULL, '2025-09-22 09:25:37', '2025-09-22 09:25:37', NULL);
INSERT INTO `genres` VALUES (16, 'Romance', 'romance', NULL, NULL, 1, 1, 1, NULL, '2025-09-23 10:30:24', '2025-09-23 10:30:24', NULL);
INSERT INTO `genres` VALUES (17, 'Mystery', 'mystery', NULL, NULL, 1, 1, 1, NULL, '2025-09-24 11:51:49', '2025-09-24 11:51:49', NULL);
INSERT INTO `genres` VALUES (18, 'Family', 'family', NULL, NULL, 1, 1, 1, NULL, '2026-02-05 00:41:19', '2026-02-05 00:41:19', NULL);
INSERT INTO `genres` VALUES (19, 'Documentary', NULL, NULL, NULL, 1, 1, 1, NULL, '2026-03-01 22:59:17', '2026-03-01 22:59:17', NULL);

-- ----------------------------
-- Table structure for installers
-- ----------------------------
DROP TABLE IF EXISTS `installers`;
CREATE TABLE `installers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of installers
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_batches
-- ----------------------------
INSERT INTO `job_batches` VALUES ('9fb765f2-6429-449f-99b7-12bb8434ddb2', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1756100382, 1756100382);
INSERT INTO `job_batches` VALUES ('9fb76661-6c4e-404b-8f05-088cabcb51bd', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1756100454, 1756100455);
INSERT INTO `job_batches` VALUES ('9fb76af2-fea7-4b39-b387-3beddc0c55eb', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1756101221, 1756101221);
INSERT INTO `job_batches` VALUES ('9fb76c5f-d036-4af5-bb41-e8b7428055f6', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1756101460, 1756101460);
INSERT INTO `job_batches` VALUES ('9fc5cedd-9db7-4811-a0c0-07e3cd83be25', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1756719280, 1756719280);
INSERT INTO `job_batches` VALUES ('9fc953e0-da17-4808-939f-17c73c7b830e', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1756870444, 1756870445);
INSERT INTO `job_batches` VALUES ('9fcc8d94-4ce3-4ffd-8012-0966f83e947d', '', 4, 0, 0, '[]', 'a:0:{}', NULL, 1757008974, 1757008974);
INSERT INTO `job_batches` VALUES ('9fcc94e3-1132-42ed-9ade-3e7c3e099678', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1757010200, 1757010200);
INSERT INTO `job_batches` VALUES ('9fcc957f-d51a-4e2d-b65b-79a3b2020983', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1757010303, 1757010303);
INSERT INTO `job_batches` VALUES ('9ff43dec-50d5-47a4-b6db-330c93a77ef3', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1758713597, 1758713597);
INSERT INTO `job_batches` VALUES ('a0717133-e886-4380-a194-24d915bf3ba1', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1764090909, 1764090910);
INSERT INTO `job_batches` VALUES ('a07176d1-b29b-4063-b7f9-66d40bb96dc7', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1764091852, 1764091852);

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of languages
-- ----------------------------

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entertainment_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `is_like` tinyint(1) NOT NULL DEFAULT 0,
  `profile_id` int NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (12, 99, 7, 1, 7, 'video', 7, 7, NULL, '2024-09-25 15:30:29', '2024-09-25 15:30:29', NULL);
INSERT INTO `likes` VALUES (13, 14, 7, 1, 7, 'video', 7, 7, NULL, '2024-09-25 15:30:46', '2024-09-25 15:30:46', NULL);
INSERT INTO `likes` VALUES (14, 10, 8, 1, 8, 'video', 7, 7, NULL, '2024-09-25 15:30:53', '2024-09-25 15:30:53', NULL);
INSERT INTO `likes` VALUES (15, 5, 9, 1, 9, 'video', 7, 7, NULL, '2024-09-25 15:31:02', '2024-09-25 15:31:02', NULL);

-- ----------------------------
-- Table structure for live_tv_category
-- ----------------------------
DROP TABLE IF EXISTS `live_tv_category`;
CREATE TABLE `live_tv_category`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of live_tv_category
-- ----------------------------
INSERT INTO `live_tv_category` VALUES (1, 'News & Current Affairs', 'news_current_affairs.png', 'Stay informed with the latest updates from around the world. This category brings you live news broadcasts, in-depth analysis, and breaking news coverage. From politics to finance, and global events to local happenings, never miss a moment of what\'s happening. 📰🌍🕒', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `live_tv_category` VALUES (2, 'Sports & Action', 'sports_action.png', 'Catch all the live sports action from your favorite games and tournaments. Whether it\'s football, basketball, tennis, or any other sport, this category covers live matches, expert commentary, and thrilling highlights. Cheer for your teams and witness unforgettable moments. 🏆⚽🏀', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `live_tv_category` VALUES (3, 'Entertainment & Variety', 'entertainment_variety.png', 'Enjoy a diverse range of live entertainment shows, from reality TV and talent competitions to talk shows and award ceremonies. This category offers something for everyone, featuring your favorite stars and hosts bringing you laughter, drama, and excitement. 🎤🎬🎉', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `live_tv_category` VALUES (4, 'Music & Concerts', 'music_concerts.png', 'Experience live music like never before with concerts, festivals, and exclusive performances from top artists. This category brings the stage to your screen, allowing you to enjoy your favorite genres and discover new talents from the comfort of your home. 🎸🎤🎶', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `live_tv_category` VALUES (5, 'Educational & Documentary', 'educational_documentary.png', 'Expand your knowledge with live educational programs and documentaries covering a wide range of topics. From science and history to nature and technology, this category provides informative content that enlightens and inspires. Ideal for curious minds of all ages. 📚🔬🌿', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);

-- ----------------------------
-- Table structure for live_tv_channel
-- ----------------------------
DROP TABLE IF EXISTS `live_tv_channel`;
CREATE TABLE `live_tv_channel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `poster_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `category_id` bigint UNSIGNED NULL DEFAULT NULL,
  `thumb_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `access` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `plan_id` bigint UNSIGNED NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `poster_tv_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of live_tv_channel
-- ----------------------------
INSERT INTO `live_tv_channel` VALUES (1, 'Aaj Kal LIVE TV', 'aaj_kal_live_tv.png', 1, NULL, 'free', NULL, 'Stay informed with live news broadcasts and in-depth analysis on Aaj Kal LIVE TV. Never miss a moment of the latest updates from around the world.', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:33', NULL, 'aaj_kal_live_tv.png');
INSERT INTO `live_tv_channel` VALUES (2, 'ABP Sports', 'abp_sports.png', 2, NULL, 'paid', 1, 'Catch all the live sports action on ABP Sports, covering your favorite games and tournaments with expert commentary and thrilling highlights.', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'abp_sports.png');
INSERT INTO `live_tv_channel` VALUES (3, 'DN TV', 'dn_tv.png', 3, NULL, 'paid', 2, 'Enjoy a variety of entertainment shows on DN TV, featuring reality TV, talent competitions, talk shows, and award ceremonies.', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'dn_tv.png');
INSERT INTO `live_tv_channel` VALUES (4, '9xm', '9xm.png', 4, NULL, 'paid', 3, 'Music & Concerts channel featuring live performances and more.', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, '9xm.png');
INSERT INTO `live_tv_channel` VALUES (5, 'BBP', 'bbp.png', 5, NULL, 'paid', 4, 'Educational & Documentary channel with a wide range of informative content.', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'bbp.png');
INSERT INTO `live_tv_channel` VALUES (6, 'M TV', 'm_tv.png', 4, NULL, 'free', NULL, 'Free Music & Concerts channel with live performances and more.', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'm_tv.png');
INSERT INTO `live_tv_channel` VALUES (7, 'ZNews 24/7', 'znews_247.png', 1, NULL, 'free', NULL, 'Round-the-clock coverage of global news and current events to keep you informed all day. 🌍🕓', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'znews_247.png');
INSERT INTO `live_tv_channel` VALUES (8, 'Sports Max', 'sports_max.png', 2, NULL, 'paid', 1, 'The ultimate channel for live sports events, from football to cricket, with non-stop action. 🏆📢', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'sports_max.png');
INSERT INTO `live_tv_channel` VALUES (9, 'Vibe TV', 'vibe_tv.png', 3, NULL, 'paid', 2, 'The hottest variety of live entertainment, from reality shows to talk shows and much more. 🎭🔥', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'vibe_tv.png');
INSERT INTO `live_tv_channel` VALUES (10, 'Beat Box', 'beat_box.png', 4, NULL, 'free', NULL, 'Feel the beat with live music performances, DJ sets, and non-stop tunes. 🎧🎵', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'beat_box.png');
INSERT INTO `live_tv_channel` VALUES (11, 'Brain TV', 'brain_tv.png', 5, NULL, 'paid', 4, 'Dive into a world of learning with live educational shows and insightful documentaries. 🧠📺', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'brain_tv.png');
INSERT INTO `live_tv_channel` VALUES (12, 'Khabar NOW', 'khabar_now.png', 1, NULL, 'paid', 2, 'Instant access to real-time news and headlines that matter most, bringing the world to your screen. 📰📢', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'khabar_now.png');
INSERT INTO `live_tv_channel` VALUES (13, 'Goal TV', 'goal_tv.png', 2, NULL, 'free', NULL, 'Your destination for all things football, with live coverage of matches, interviews, and goals. ⚽🎥', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'goal_tv.png');
INSERT INTO `live_tv_channel` VALUES (14, 'Star Bliss', 'star_bliss.png', 3, NULL, 'free', NULL, 'Bringing you a star-studded lineup of live entertainment, talk shows, and celebrity interviews. ⭐🎬', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'star_bliss.png');
INSERT INTO `live_tv_channel` VALUES (15, 'Groove LIVE', 'groove_live.png', 4, NULL, 'free', NULL, 'Get into the groove with live music shows, concerts, and your favorite artists. 🎼🎸', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'groove_live.png');
INSERT INTO `live_tv_channel` VALUES (16, 'Docu Vision', 'docu_vision.png', 5, NULL, 'paid', 4, 'Explore fascinating live documentaries on a range of topics, from history to science. 📚🎬', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'docu_vision.png');
INSERT INTO `live_tv_channel` VALUES (17, 'Vision TV', 'vision_tv.png', 1, NULL, 'free', NULL, 'Sharp and focused news, providing clear insights into the events shaping the world today. 🔍📺', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'vision_tv.png');
INSERT INTO `live_tv_channel` VALUES (18, 'Win Sports', 'win_sports.png', 2, NULL, 'paid', 1, 'Bringing the winning moments from the biggest sporting events, straight to your screen, live. 🎖️📺', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'win_sports.png');
INSERT INTO `live_tv_channel` VALUES (19, 'Buzz LIVE', 'buzz_live.png', 3, NULL, 'free', NULL, 'All the buzzworthy content in one place, from live interviews to fun, energetic shows. 🎤⚡', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'buzz_live.png');
INSERT INTO `live_tv_channel` VALUES (20, 'Tune IN', 'tune_in.png', 4, NULL, 'paid', 3, 'Stay tuned to the latest live music performances and the freshest beats from top artists. 🎙️📻', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'tune_in.png');
INSERT INTO `live_tv_channel` VALUES (21, 'DiscoverX', 'discoverx.png', 5, NULL, 'paid', 4, 'Uncover the unknown with live explorations and educational content from around the globe. 🌍🔎', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'discoverx.png');
INSERT INTO `live_tv_channel` VALUES (22, 'HeadlineX', 'headlinex.png', 1, NULL, 'free', NULL, 'Your go-to for breaking headlines and live updates, keeping you in the know. 🗞️🎯', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'headlinex.png');
INSERT INTO `live_tv_channel` VALUES (23, 'Xtreme Sports', 'xtreme_sports.png', 2, NULL, 'paid', 2, 'Tune in for adrenaline-pumping sports events, from extreme sports to intense competition. 🏄‍♂️🔥', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'xtreme_sports.png');
INSERT INTO `live_tv_channel` VALUES (24, 'Fun Box', 'fun_box.png', 3, NULL, 'free', NULL, 'A playful mix of live comedy, gameshows, and entertainment to keep you laughing. 🤣📺', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'fun_box.png');
INSERT INTO `live_tv_channel` VALUES (25, 'Sound Wave', 'sound_wave.png', 4, NULL, 'paid', 2, 'Feel the pulse of live music as you experience concerts and performances from the world’s best artists. 🎤🌊', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'sound_wave.png');
INSERT INTO `live_tv_channel` VALUES (26, 'Learn LIVE', 'learn_live.png', 5, NULL, 'paid', 4, 'Interactive educational programming, live lectures, and documentaries to spark your curiosity. 🎓📡', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'learn_live.png');
INSERT INTO `live_tv_channel` VALUES (27, 'Live Line', 'live_line.png', 1, NULL, 'free', NULL, 'Breaking news, live updates, and in-depth analysis at the speed of live broadcast. 📡⚡', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'live_line.png');
INSERT INTO `live_tv_channel` VALUES (28, 'Pro Play', 'pro_play.png', 2, NULL, 'paid', 3, 'Watch your favorite athletes and teams go head-to-head in thrilling live action. 🏅🎬', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'pro_play.png');
INSERT INTO `live_tv_channel` VALUES (29, 'Show MAX', 'show_max.png', 3, NULL, 'paid', 2, 'Maximize your entertainment with live shows, contests, and endless variety! 🎭💫', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'show_max.png');
INSERT INTO `live_tv_channel` VALUES (30, 'RhythmX', 'rhythmx.png', 4, NULL, 'free', NULL, 'Tune in for live performances, chart-topping hits, and music from around the world. 🎶🎧', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'rhythmx.png');
INSERT INTO `live_tv_channel` VALUES (31, 'Insight TV', 'insight_tv.png', 5, NULL, 'free', NULL, 'Dive deep into thought-provoking live content that educates and inspires, from documentaries to expert talks. 📘🔍', 1, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL, 'insight_tv.png');

-- ----------------------------
-- Table structure for live_tv_stream_content_mapping
-- ----------------------------
DROP TABLE IF EXISTS `live_tv_stream_content_mapping`;
CREATE TABLE `live_tv_stream_content_mapping`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tv_channel_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stream_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `embedded` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `server_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `server_url1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of live_tv_stream_content_mapping
-- ----------------------------
INSERT INTO `live_tv_stream_content_mapping` VALUES (1, 1, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (2, 2, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (3, 3, 't_url', 'URL', NULL, 'https://abplivetv.akamaized.net/hls/live/2043010/hindi/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (4, 4, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (5, 5, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (6, 6, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (7, 7, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (8, 8, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (9, 9, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (10, 10, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (11, 11, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (12, 12, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (13, 13, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (14, 14, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (15, 15, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (16, 16, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (17, 17, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (18, 18, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (19, 19, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (20, 20, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (21, 21, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (22, 22, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (23, 23, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (24, 24, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (25, 25, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (26, 26, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (27, 27, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (28, 28, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (29, 29, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (30, 30, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);
INSERT INTO `live_tv_stream_content_mapping` VALUES (31, 31, 't_url', 'URL', NULL, 'https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8', NULL, NULL, NULL, NULL, '2025-08-24 11:20:33', '2025-08-24 11:20:33', NULL);

-- ----------------------------
-- Table structure for livetvs
-- ----------------------------
DROP TABLE IF EXISTS `livetvs`;
CREATE TABLE `livetvs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of livetvs
-- ----------------------------

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `media_uuid_unique`(`uuid` ASC) USING BTREE,
  INDEX `media_model_type_model_id_index`(`model_type` ASC, `model_id` ASC) USING BTREE,
  INDEX `media_order_column_index`(`order_column` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (4, 'Modules\\Filemanager\\Models\\Filemanager', 4, 'a6eb3858-5697-4ef5-8282-e9d9e8e7aed0', 'filemanager', 'med1AD8', 'Matrix_mpw_102176_bb2f6cc5_4a16_4512_881b_f855ead3c8ec_500x7_68abfb547116e.jpg', 'image/jpeg', 'public', 'public', 125223, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-08-25 05:57:40', '2025-08-25 05:57:41');
INSERT INTO `media` VALUES (5, 'Modules\\Setting\\Models\\Setting', 69, 'd29025a9-04a8-4b9b-b412-39db1887e560', 'mini_logo', 'fiveflix-ico', 'LA5IZX27T1ObeAt3AVLPvc0sNWsF92Ad5Wui0Atl.png', 'image/png', 'public', 'public', 10846, '[]', '[]', '[]', '[]', 1, '2025-08-30 07:18:02', '2025-08-30 07:18:02');
INSERT INTO `media` VALUES (6, 'Modules\\Setting\\Models\\Setting', 70, '23a6962c-752e-4154-8cf3-32e1f3d62603', 'dark_logo', 'fiveFlix-logo', 'ehYuPvWNp9ihINCZ3RJ8kZXKhoZ0rCmCa5vf9l5G.png', 'image/png', 'public', 'public', 67883, '[]', '[]', '[]', '[]', 1, '2025-08-30 07:18:02', '2025-08-30 07:18:02');
INSERT INTO `media` VALUES (7, 'Modules\\Setting\\Models\\Setting', 71, '9089fd38-2ae4-4bdc-9def-d00b3f0e2c4b', 'favicon', 'fiveflix-ico', 'rghpVVxug9Srf5SoD5FNkpVMsYs6lj8gVNF7lRZY.png', 'image/png', 'public', 'public', 10846, '[]', '[]', '[]', '[]', 1, '2025-08-30 07:18:02', '2025-08-30 07:18:02');
INSERT INTO `media` VALUES (9, 'Modules\\Filemanager\\Models\\Filemanager', 6, '0146beef-adcb-4fbb-a805-f567f4d4a853', 'filemanager', 'med2DD5', '2bfb04ad814c4995f0c537c68db5cd0b_multicolor_swirls_circle_logo_68b7b72cc04f3.png', 'image/png', 'public', 'public', 15045, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-09-03 03:34:04', '2025-09-03 03:34:05');
INSERT INTO `media` VALUES (10, 'Modules\\Filemanager\\Models\\Filemanager', 7, 'b78bfc40-f75d-4fcf-be48-b3931fe85196', 'filemanager', 'med2C3F', '6553221_68b9d44e6cb2e.png', 'image/png', 'public', 'public', 24275, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-09-04 18:02:54', '2025-09-04 18:02:55');
INSERT INTO `media` VALUES (11, 'Modules\\Filemanager\\Models\\Filemanager', 8, '74b96d06-7f95-4a90-a45d-9416aa58caad', 'filemanager', 'med2CBD', '2040660_68b9d44e74ca0.png', 'image/png', 'public', 'public', 48826, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-09-04 18:02:54', '2025-09-04 18:02:55');
INSERT INTO `media` VALUES (12, 'Modules\\Filemanager\\Models\\Filemanager', 9, 'ddc232f9-3429-4f6a-90be-ad650bb3ec54', 'filemanager', 'med2CDE', 'Lovepik_com_401166533_education_learning_68b9d44e764c9.png', 'image/png', 'public', 'public', 60605, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-09-04 18:02:54', '2025-09-04 18:02:56');
INSERT INTO `media` VALUES (13, 'Modules\\Filemanager\\Models\\Filemanager', 10, '6b109fdf-7507-4b86-a34a-a7b6000a4365', 'filemanager', 'med2CEE', 'png_transparent_humour_comedy_comedian_happy_customers_photography_smiley_internet_radio_68b9d44e77c50.png', 'image/png', 'public', 'public', 34002, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-09-04 18:02:54', '2025-09-04 18:02:56');
INSERT INTO `media` VALUES (14, 'Modules\\Filemanager\\Models\\Filemanager', 11, '9f120fa8-2568-4fb6-862e-3515dbbe8346', 'filemanager', 'medE165', '12355765_68b9d9187c43b.png', 'image/png', 'public', 'public', 30947, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-09-04 18:23:20', '2025-09-04 18:23:21');
INSERT INTO `media` VALUES (15, 'Modules\\Filemanager\\Models\\Filemanager', 12, '4b24a73a-6faa-47d3-bebc-f69b662bd34b', 'filemanager', 'med72B6', 'png_transparent_humour_comedy_comedian_happy_customers_photography_smiley_internet_radio_68b9d97f3ce00.png', 'image/png', 'public', 'public', 34002, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-09-04 18:25:03', '2025-09-04 18:25:03');
INSERT INTO `media` VALUES (16, 'Modules\\Setting\\Models\\Setting', 69, '91981e0d-0174-4c70-8bc0-22c5811119e9', 'mini_logo', 'fiveflix-ico', 'TuyGlBEqaJLEkfKS0iCzhTsaOEWLhZoLUnJ1R7Tf.png', 'image/png', 'public', 'public', 10846, '[]', '[]', '[]', '[]', 2, '2025-09-22 09:53:56', '2025-09-22 09:53:56');
INSERT INTO `media` VALUES (17, 'Modules\\Setting\\Models\\Setting', 70, 'ecd9662c-969e-4e08-bead-1400057f864b', 'dark_logo', 'fiveFlix-logo', 'NF6l2qQT1rc6Io6BxpDO071CIbiv5VtsHpqpQHIG.png', 'image/png', 'public', 'public', 67883, '[]', '[]', '[]', '[]', 2, '2025-09-22 09:53:56', '2025-09-22 09:53:56');
INSERT INTO `media` VALUES (18, 'Modules\\Setting\\Models\\Setting', 71, '43f172c5-fc41-4129-82a2-70e7477e7e31', 'favicon', 'fiveflix-ico', 'rsMKsbrktbwnyK8ksuIFy0ZX75cWXf4uEEdzfbly.png', 'image/png', 'public', 'public', 10846, '[]', '[]', '[]', '[]', 2, '2025-09-22 09:53:56', '2025-09-22 09:53:56');
INSERT INTO `media` VALUES (19, 'Modules\\Filemanager\\Models\\Filemanager', 13, 'c8319791-6402-4223-9c58-7311fa76e7a3', 'filemanager', 'med8A62', 'Generated_File_September_21,_2025___11_44PM_68d3d6fd3f337.mp4', 'video/mp4', 'public', 'public', 3077121, '[]', '[]', '[]', '[]', 1, '2025-09-24 11:33:17', '2025-09-24 11:33:17');
INSERT INTO `media` VALUES (20, 'Modules\\Filemanager\\Models\\Filemanager', 14, '5712f69d-924b-4820-9c45-1daa451e272b', 'filemanager', 'med65D0', '2bfb04ad814c4995f0c537c68db5cd0b_multicolor_swirls_circle_logo_6925e41da28ef.png', 'image/png', 'public', 'public', 15045, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-11-25 17:15:09', '2025-11-25 17:15:10');
INSERT INTO `media` VALUES (21, 'Modules\\Filemanager\\Models\\Filemanager', 15, '6bad7bd2-67e6-4820-b24b-1aa5f110bbf8', 'filemanager', 'medC67A', '6347699_6925e7cbf2d32.png', 'image/png', 'public', 'public', 42071, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2025-11-25 17:30:52', '2025-11-25 17:30:52');
INSERT INTO `media` VALUES (23, 'App\\Models\\User', 15, '651987b6-4e42-468c-bd51-91f9745e3341', 'profile_image', 'artplayer_00_01', 'artplayer_00_01.png', 'image/png', 'public', 'public', 372290, '[]', '[]', '[]', '[]', 1, '2026-03-12 04:57:43', '2026-03-12 04:57:43');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (2, '2023_01_01_000010_create_users_table', 1);
INSERT INTO `migrations` VALUES (3, '2023_01_01_000012_create_user_providers_table', 1);
INSERT INTO `migrations` VALUES (4, '2023_01_01_000020_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_01_01_000021_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (6, '2023_01_01_000040_create_settings_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_01_01_000041_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_01_01_000200_create_media_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_01_01_000400_create_activity_log_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_01_01_000400_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (11, '2023_01_27_141241_create_service_providers_table', 1);
INSERT INTO `migrations` VALUES (12, '2023_01_27_190720_create_addresses_table', 1);
INSERT INTO `migrations` VALUES (13, '2023_04_11_120721_create_notificationtemplates_table', 1);
INSERT INTO `migrations` VALUES (14, '2023_04_11_140938_NotificationTemplateContentMapping', 1);
INSERT INTO `migrations` VALUES (15, '2023_04_27_113639_create_planlimitation_table', 1);
INSERT INTO `migrations` VALUES (16, '2023_05_02_111101_create_plan_table', 1);
INSERT INTO `migrations` VALUES (17, '2023_05_02_111622_create_planlimitation_mapping_table', 1);
INSERT INTO `migrations` VALUES (18, '2023_05_06_160755_create_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (19, '2023_05_06_160843_create_subscriptions_transactions_table', 1);
INSERT INTO `migrations` VALUES (20, '2023_06_17_075047_create_webhook_calls_table', 1);
INSERT INTO `migrations` VALUES (21, '2023_06_17_121725_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (22, '2023_06_21_170019_create_user_profiles_table', 1);
INSERT INTO `migrations` VALUES (23, '2023_06_24_050019_create_modules_table', 1);
INSERT INTO `migrations` VALUES (24, '2023_07_22_080045_create_languages_table', 1);
INSERT INTO `migrations` VALUES (25, '2023_08_07_132655_alter_module_table', 1);
INSERT INTO `migrations` VALUES (26, '2024_05_20_095807_create_countries_table', 1);
INSERT INTO `migrations` VALUES (27, '2024_05_20_095808_create_cities_table', 1);
INSERT INTO `migrations` VALUES (28, '2024_05_20_095809_create_states_table', 1);
INSERT INTO `migrations` VALUES (29, '2024_06_02_114414_create_genres_table', 1);
INSERT INTO `migrations` VALUES (30, '2024_06_03_074305_create_cast_crew_table', 1);
INSERT INTO `migrations` VALUES (31, '2024_06_06_073505_create_constants_table', 1);
INSERT INTO `migrations` VALUES (32, '2024_06_06_120151_create_taxes_table', 1);
INSERT INTO `migrations` VALUES (33, '2024_06_06_121650_create_devices_table', 1);
INSERT INTO `migrations` VALUES (34, '2024_06_06_121909_create_worlds_table', 1);
INSERT INTO `migrations` VALUES (35, '2024_06_07_085105_create_entertainments_table', 1);
INSERT INTO `migrations` VALUES (36, '2024_06_07_092336_create_currencies_table', 1);
INSERT INTO `migrations` VALUES (37, '2024_06_07_095208_create_livetvs_table', 1);
INSERT INTO `migrations` VALUES (38, '2024_06_07_095529_create_live_tv_category_table', 1);
INSERT INTO `migrations` VALUES (39, '2024_06_08_043704_create_watchlists_table', 1);
INSERT INTO `migrations` VALUES (40, '2024_06_08_054515_create_entertainment_gener_mapping_table', 1);
INSERT INTO `migrations` VALUES (41, '2024_06_08_054936_create_entertainment_talent_mapping_table', 1);
INSERT INTO `migrations` VALUES (42, '2024_06_08_055333_create_entertainment_stream_content_mapping_table', 1);
INSERT INTO `migrations` VALUES (43, '2024_06_08_065711_create_reviews_table', 1);
INSERT INTO `migrations` VALUES (44, '2024_06_08_091320_create_settings_table', 1);
INSERT INTO `migrations` VALUES (45, '2024_06_11_050857_create_seasons_table', 1);
INSERT INTO `migrations` VALUES (46, '2024_06_11_084656_create_episodes_table', 1);
INSERT INTO `migrations` VALUES (47, '2024_06_11_090807_create_episode_stream_content_mapping_table', 1);
INSERT INTO `migrations` VALUES (48, '2024_06_13_073417_create_continue_watch_table', 1);
INSERT INTO `migrations` VALUES (49, '2024_06_13_092807_create_likes_table', 1);
INSERT INTO `migrations` VALUES (50, '2024_06_13_120109_create_videos_table', 1);
INSERT INTO `migrations` VALUES (51, '2024_06_13_121428_create_video_stream_content_mapping_table', 1);
INSERT INTO `migrations` VALUES (52, '2024_06_14_044624_create_entertainment_downloads_table', 1);
INSERT INTO `migrations` VALUES (53, '2024_06_14_061737_create_live_tv_channel_table', 1);
INSERT INTO `migrations` VALUES (54, '2024_06_14_062751_create_live_tv_stream_content_mapping_table', 1);
INSERT INTO `migrations` VALUES (55, '2024_06_14_115456_create_filemanagers_table', 1);
INSERT INTO `migrations` VALUES (56, '2024_06_15_083524_create_entertainment_download_mapping_table', 1);
INSERT INTO `migrations` VALUES (57, '2024_06_18_041529_create_banners_table', 1);
INSERT INTO `migrations` VALUES (58, '2024_06_20_094819_create_job_batches_table', 1);
INSERT INTO `migrations` VALUES (59, '2024_06_21_070413_create_dashboard_settings_table', 1);
INSERT INTO `migrations` VALUES (60, '2024_06_25_051445_create_user_reminder_table', 1);
INSERT INTO `migrations` VALUES (61, '2024_06_26_054413_create_entertainment_views_table', 1);
INSERT INTO `migrations` VALUES (62, '2024_07_01_075814_create_episode_download_mapping_table', 1);
INSERT INTO `migrations` VALUES (63, '2024_07_03_122744_create_pages_table', 1);
INSERT INTO `migrations` VALUES (64, '2024_07_09_094304_create_video_download_mappings_table', 1);
INSERT INTO `migrations` VALUES (65, '2024_09_13_122239_create_faqs_table', 1);
INSERT INTO `migrations` VALUES (66, '2024_09_18_111806_create_user_multi_profiles_table', 1);
INSERT INTO `migrations` VALUES (67, '2024_09_19_072214_create_user_search_histories_table', 1);
INSERT INTO `migrations` VALUES (68, '2024_09_19_084000_create_user_watch_histories_table', 1);
INSERT INTO `migrations` VALUES (69, '2024_09_24_095445_create_entertainment_country_mapping_table', 1);
INSERT INTO `migrations` VALUES (70, '2024_09_24_111520_create_sessions_table', 1);
INSERT INTO `migrations` VALUES (71, '2024_11_06_121652_create_installers_table', 1);
INSERT INTO `migrations` VALUES (72, '2024_12_17_053218_create_alter_continue_watch_table', 1);
INSERT INTO `migrations` VALUES (73, '2025_01_22_113233_create_alter_review_table', 1);
INSERT INTO `migrations` VALUES (74, '2025_03_26_173650_alter_user_multi_profiles_table', 1);
INSERT INTO `migrations` VALUES (75, '2025_03_27_121756_alter_poster_tv_image_table', 1);
INSERT INTO `migrations` VALUES (76, '2025_03_29_065106_alter_users_table_add_pin_otp_column', 1);
INSERT INTO `migrations` VALUES (77, '2025_03_30_152325_index_for_profile_detail', 1);
INSERT INTO `migrations` VALUES (78, '2025_03_31_112851_create_alter_episode_poster_tv_image_table', 1);
INSERT INTO `migrations` VALUES (79, '2025_03_31_121344_create_alter_season_poster_tv_image_table', 1);
INSERT INTO `migrations` VALUES (80, '2025_04_01_045818_add_banner_for_to_banners_table', 1);
INSERT INTO `migrations` VALUES (81, '2025_04_01_162912_index_for_entertainments_table', 1);
INSERT INTO `migrations` VALUES (82, '2025_04_02_072249_create_video_poster_tv_image_table', 1);
INSERT INTO `migrations` VALUES (83, '2025_04_02_101553_create_tvchannel_poster_tv_image_table', 1);
INSERT INTO `migrations` VALUES (84, '2025_04_02_104434_create_banner_poster_tv_image_table', 1);
INSERT INTO `migrations` VALUES (85, '2025_04_04_161627_add_index_selected_table', 1);
INSERT INTO `migrations` VALUES (86, '2025_04_14_093857_Coupon', 1);
INSERT INTO `migrations` VALUES (87, '2025_04_15_071822_coupon_subscription_plan', 1);
INSERT INTO `migrations` VALUES (88, '2025_04_17_052158_UserCouponRedeem', 1);
INSERT INTO `migrations` VALUES (89, '2025_04_19_095303_add_parental_flag_users', 1);
INSERT INTO `migrations` VALUES (90, '2025_05_02_074312_add_pricing_fields_to_entertainments_table', 1);
INSERT INTO `migrations` VALUES (91, '2025_05_02_095730_add_pricing_fields_to_videos_table', 1);
INSERT INTO `migrations` VALUES (92, '2025_05_02_111741_add_pricing_fields_to_seasons_table', 1);
INSERT INTO `migrations` VALUES (93, '2025_05_02_115012_add_pricing_fields_to_episodes_table', 1);
INSERT INTO `migrations` VALUES (94, '2025_05_05_040137_alter_entertainment_subtitle_table', 1);
INSERT INTO `migrations` VALUES (95, '2025_05_06_094938_create_pay_per_views_table', 1);
INSERT INTO `migrations` VALUES (96, '2025_05_07_040757_create_payperviewstransactions_table', 1);
INSERT INTO `migrations` VALUES (97, '2025_05_09_091111_create_tv_login_sessions_table', 1);
INSERT INTO `migrations` VALUES (98, '2025_05_10_034958_alter_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (99, '2025_05_10_091146_add_coupon_discount_to_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (100, '2025_05_13_114620_add_column_to_entertainment_table', 1);
INSERT INTO `migrations` VALUES (101, '2025_05_16_103735_add_column_to_video_table', 1);
INSERT INTO `migrations` VALUES (102, '2025_05_16_104824_add_column_to_video_table_subtitle_file', 1);
INSERT INTO `migrations` VALUES (103, '2025_05_16_112032_add_column_to_episode_table_', 1);
INSERT INTO `migrations` VALUES (104, '2025_05_19_094309_create_subtitle_tabel', 1);
INSERT INTO `migrations` VALUES (105, '2025_05_22_055600_create_ads_table', 1);
INSERT INTO `migrations` VALUES (106, '2025_05_22_055800_create_vast_ads_setting', 1);
INSERT INTO `migrations` VALUES (107, '2025_05_22_083413_create_custom_ads_setting', 1);
INSERT INTO `migrations` VALUES (108, '2025_05_23_000000_add_dates_to_vast_ads_setting', 1);
INSERT INTO `migrations` VALUES (109, '2025_06_19_100923_add_start_end_date_to_custom_ads_setting_table', 1);
INSERT INTO `migrations` VALUES (110, '2025_07_08_100927_create_seo_table', 1);
INSERT INTO `migrations` VALUES (111, '2025_07_11_110337_add_columns_to_entertainments_table', 1);
INSERT INTO `migrations` VALUES (112, '2025_07_14_100351_add_seo_fields_to_seasons_table', 1);
INSERT INTO `migrations` VALUES (113, '2025_07_14_124514_add_seo_fields_to_epispdes_table', 1);
INSERT INTO `migrations` VALUES (114, '2025_07_15_103922_add_seo_fields_to_videos_table', 1);
INSERT INTO `migrations` VALUES (115, '2025_09_01_103920_create_categories_table', 2);
INSERT INTO `migrations` VALUES (116, '2025_09_06_041440_create_entertainment_category_mapping_table', 3);
INSERT INTO `migrations` VALUES (117, '2025_09_09_085911_create_servers_table', 4);
INSERT INTO `migrations` VALUES (119, '2025_10_05_152558_create_entertainment_requests_table', 6);
INSERT INTO `migrations` VALUES (120, '2025_09_13_065432_create_drive_setups_table', 7);

-- ----------------------------
-- Table structure for mobile_settings
-- ----------------------------
DROP TABLE IF EXISTS `mobile_settings`;
CREATE TABLE `mobile_settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position` int NULL DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mobile_settings_slug_deleted_at_index`(`slug` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mobile_settings
-- ----------------------------
INSERT INTO `mobile_settings` VALUES (1, 'Banner', 'banner', 1, '1', '2024-07-12 10:28:06', '2025-08-26 04:23:44', NULL);
INSERT INTO `mobile_settings` VALUES (2, 'Continue Watching', 'continue-watching', 2, '1', '2024-07-12 10:28:21', '2024-07-12 10:28:21', NULL);
INSERT INTO `mobile_settings` VALUES (3, 'Top 10', 'top-10', 3, '[\"22\",\"35\",\"49\",\"69\",\"76\",\"89\",\"94\",\"95\",\"99\",\"102\"]', '2024-07-12 10:28:33', '2025-08-26 04:23:53', NULL);
INSERT INTO `mobile_settings` VALUES (4, 'Advertisement', 'advertisement', 4, '1', '2024-07-12 10:28:47', '2024-07-12 10:28:47', NULL);
INSERT INTO `mobile_settings` VALUES (5, 'Latest Movies', 'latest-movies', 5, '[\"103\",\"97\",\"102\",\"95\",\"96\",\"100\",\"98\",\"94\"]', '2024-07-12 10:29:02', '2024-07-12 10:44:11', NULL);
INSERT INTO `mobile_settings` VALUES (6, 'Popular language', 'enjoy-in-your-native-tongue', 6, '[\"16\",\"17\",\"18\",\"19\",\"20\" ,\"21\",\"22\",\"23\"]', '2024-07-12 10:29:20', '2024-07-12 10:33:08', NULL);
INSERT INTO `mobile_settings` VALUES (7, 'Popular Movies', 'popular-movies', 7, '[\"22\",\"25\",\"26\",\"28\",\"29\",\"31\",\"34\",\"36\",\"37\",\"40\",\"38\"]', '2024-07-12 10:29:36', '2024-07-12 10:48:33', NULL);
INSERT INTO `mobile_settings` VALUES (8, 'Top Channels', 'top-channels', 8, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', '2024-07-12 10:30:54', '2024-07-12 10:30:54', NULL);
INSERT INTO `mobile_settings` VALUES (9, 'Popular Personalities', 'your-favorite-personality', 9, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', '2024-07-12 10:31:08', '2024-07-12 10:47:13', NULL);
INSERT INTO `mobile_settings` VALUES (10, 'Free Movies', '500-free-movies', 10, '[\"21\",\"23\",\"24\",\"25\",\"30\",\"31\",\"32\",\"34\",\"33\",\"35\"]', '2024-07-12 10:31:38', '2024-07-12 10:47:34', NULL);
INSERT INTO `mobile_settings` VALUES (11, 'Genres', 'genre', 11, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"]', '2024-07-12 10:31:52', '2024-07-12 10:49:42', NULL);
INSERT INTO `mobile_settings` VALUES (12, 'Rate our app', 'rate-our-app', 12, '1', '2024-07-12 10:32:08', '2024-07-12 10:32:08', NULL);
INSERT INTO `mobile_settings` VALUES (14, 'Popular Videos', 'popular-videos', 14, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"12\",\"14\",\"15\",\"17\",\"18\",\"19\",\"20\",\"25\",\"35\"]', '2024-07-12 10:29:36', '2024-07-12 10:48:33', NULL);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 3);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 4);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 5);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 6);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 7);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 8);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 9);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 10);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 11);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 12);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 13);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 14);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 15);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 16);

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `module_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `more_permission` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_custom_permission` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of modules
-- ----------------------------

-- ----------------------------
-- Table structure for notification_template_content_mapping
-- ----------------------------
DROP TABLE IF EXISTS `notification_template_content_mapping`;
CREATE TABLE `notification_template_content_mapping`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_id` bigint UNSIGNED NULL DEFAULT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `template_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notification_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notification_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notification_template_content_mapping
-- ----------------------------
INSERT INTO `notification_template_content_mapping` VALUES (1, 1, 'en', '<p>Subject: Password Change Confirmation</p>\r\n<p>Dear [[ user_name ]],</p>\r\n<p>&nbsp;</p>\r\n<h3>Password Changed !</h3>\r\n<p>We wanted to inform you that a recent password change has been made for your account. If you did not initiate this change, please take immediate action to secure your account.</p>\r\n<p>&nbsp;</p>\r\n<p>To regain control and secure your account:</p>\r\n<p>&nbsp;</p>\r\n<p>Visit [[ link ]].</p>\r\n<p>Follow the instructions to verify your identity.</p>\r\n<p>Create a strong and unique password.</p>\r\n<p>Update passwords for any other accounts using similar credentials.</p>\r\n<p>If you have any concerns or need assistance, please contact our customer support team.</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for your attention to this matter.</p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>[[ logged_in_user_fullname ]]<br />[[ logged_in_user_role ]]<br />[[ company_name ]]</p>\r\n<p>[[ company_contact_info ]]</p>', 'Change Password', 'Password Changed !', NULL, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-26 04:29:03', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (2, 2, 'en', '\n            <p>Subject: Password Reset Instructions</p>\n            <p>&nbsp;</p>\n            <p>Dear [[ user_name ]],</p>\n            <p>A password reset request has been initiated for your account. To reset your password:</p>\n            <p>&nbsp;</p>\n            <p>Visit [[ link ]].</p>\n            <p>Enter your email address.</p>\n            <p>Follow the instructions provided to complete the reset process.</p>\n            <p>If you did not request this reset or need assistance, please contact our support team.</p>\n            <p>&nbsp;</p>\n            <p>Thank you.</p>\n            <p>&nbsp;</p>\n            <p>Best regards,</p>\n            <p>[[ logged_in_user_fullname ]]<br />[[ logged_in_user_role ]]<br />[[ company_name ]]</p>\n            <p>[[ company_contact_info ]]</p>\n            <p>&nbsp;</p>\n          ', 'Forget Email/Password', '', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (3, 3, 'en', '<p>Thank you for choosing Us for your recent order. We are delighted to confirm that your order has been successfully placed.!</p>', 'TV Show Added!', 'Thank you for choosing Us for your recent order. We are delighted to confirm that your order has been successfully placed.!', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (4, 4, 'en', '<p>We\'re excited to let you know that your order is now being prepared and will soon be on its way to satisfy your taste buds!</p>', 'Movie Added!', 'We\'re excited to let you know that your order is now being prepared and will soon be on its way to satisfy your taste buds!', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (5, 5, 'en', '<p>We\'re delighted to inform you that your order has been successfully delivered to your doorstep.</p>', 'Episode Added!', 'We\'re delighted to inform you that your order has been successfully delivered to your doorstep.', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (6, 6, 'en', '<p>We regret to inform you that your recent order has been cancelled.</p>', 'Season Added!', 'We regret to inform you that your recent order has been cancelled.', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (7, 7, 'en', 'A new user has subscribed', 'New User is subscribe!', 'A new user has subscribed', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (8, 8, 'en', 'A user has cancle subscription', 'A User is cancle subscribe!', 'A user has cancle subscription', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (9, 9, 'en', '\n                <p>Dear [[ user_name ]],</p>\n                <p>Thank you for purchasing the [[ content_type ]] \"<strong>[[ name ]]</strong>\" on our platform.</p>\n                <p>You now have full access starting from <strong>[[ start_date ]] to [[ end_date ]]</strong>.</p>\n                <p>We hope you enjoy your viewing experience!</p>\n                <p>Best regards,</p>\n            ', 'You have successfully purchased!', 'You have successfully purchased [[ content_type ]]\"[[ name ]]\"', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (10, 10, 'en', '\n                <p>Dear [[ user_name ]],</p>\n                <p>Thank you for renting the [[ content_type ]] \"<strong>[[ name ]]</strong>\" from our platform.</p>\n                <p>Your rental starts on <strong>[[ start_date ]]</strong> and will be available until <strong>[[ end_date ]]</strong>.</p>\n                <p>Be sure to complete watching it before your rental expires!</p>\n               \n            ', 'You have successfully rent!', 'You have successfully rent [[ content_type ]]\"[[ name ]]\"', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (11, 11, 'en', '\n                <p>Hi [[ user_name ]],</p>\n                <p>This is a reminder that your rental access to the [[ content_type ]] \"<strong>[[ name ]]</strong>\" will expire in <strong>[[ end_date ]]</strong>.</p>\n                <p>If you haven’t finished watching it yet, please make sure to complete it before your rental period ends.</p>\n                <p>Enjoy your content,<br>\n            ', 'Rent Is Expire Soon!', 'Reminder: Your access to [[ content_type ]] \"[[ name ]]\" will expire in [[ end_date ]].', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_template_content_mapping` VALUES (12, 12, 'en', '\n                <p>Hello [[ user_name ]],</p>\n                <p>This is a reminder that your access to the purchased [[ type ]] \"<strong>[[ name ]]</strong>\" will expire in <strong>[[ end_date ]]</strong>.</p>\n                <p>Please ensure you complete watching it before your access period ends.</p>\n            ', 'Purchase Is Expire Soon!', 'Reminder: Your access to purchased [[ type ]] \"[[ name ]]\" will expire in [[ end_date ]].', '', 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);

-- ----------------------------
-- Table structure for notification_templates
-- ----------------------------
DROP TABLE IF EXISTS `notification_templates`;
CREATE TABLE `notification_templates`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `bcc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `channels` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notification_templates
-- ----------------------------
INSERT INTO `notification_templates` VALUES (1, 'change_password', 'Change Password', NULL, 'change_password', NULL, NULL, NULL, 1, '{\"IS_MAIL\":\"0\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, 1, NULL, '2025-08-24 11:20:32', '2025-08-26 04:29:36', NULL);
INSERT INTO `notification_templates` VALUES (2, 'forget_email_password', 'Forget Email/Password', NULL, 'forget_email_password', NULL, NULL, NULL, 1, '{\"IS_MAIL\":\"0\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (3, 'tv_show_add', 'TV Show Added', NULL, 'tv_show_add', '[\"user\",\"admin\",\"demo_admin\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"0\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (4, 'movie_add', 'Movie Added', NULL, 'movie_add', '[\"user\",\"admin\",\"demo_admin\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"0\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (5, 'episode_add', 'Episode Added', NULL, 'episode_add', '[\"user\",\"admin\",\"demo_admin\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"0\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (6, 'season_add', 'Season Added', NULL, 'season_add', '[\"user\",\"admin\",\"demo_admin\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"0\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (7, 'new_subscription', 'New User Subscribed', NULL, 'new_subscription', '[\"admin\",\"demo_admin\",\"user\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"0\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (8, 'cancle_subscription', 'User Cancel Subscription', NULL, 'cancle_subscription', '[\"admin\",\"demo_admin\",\"user\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"0\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (9, 'purchase_video', 'Purchase Video', NULL, 'purchase_video', '[\"user\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"1\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (10, 'rent_video', 'Rent Video', NULL, 'rent_video', '[\"user\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"1\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (11, 'rent_expiry_reminder', 'Rent Expiry Reminder', NULL, 'rent_expiry_reminder', '[\"user\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"1\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);
INSERT INTO `notification_templates` VALUES (12, 'purchase_expiry_reminder', 'Purchase Expiry Reminder', NULL, 'purchase_expiry_reminder', '[\"user\"]', NULL, NULL, 1, '{\"IS_MAIL\":\"1\",\"PUSH_NOTIFICATION\":\"1\",\"IS_CUSTOM_WEBHOOK\":\"0\"}', NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_notifiable_type_notifiable_id_index`(`notifiable_type` ASC, `notifiable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pages_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 'Privacy Policy', 'privacy-policy', NULL, '<p data-pm-slice=\"0 0 []\">Iqonic Design Streamit Laravel (&ldquo;we,&rdquo; &ldquo;our,&rdquo; or &ldquo;us&rdquo;) is committed to protecting your privacy. At Iqonic Design, we are committed to protecting your privacy and ensuring that your personal information is handled securely.</p>\n<p>This Privacy Policy applies to our website, and its associated subdomains (collectively, our &ldquo;Service&rdquo;) alongside our application, Iqonic Design Streamit Laravel. By accessing or using our Service, you signify that you have read, understood, and agree to our collection described in this Privacy Policy and our Terms of Service.</p>\n<p>This Privacy Policy outlines how we collect, use, and safeguard your data when you use Streamit Laravel.</p>\n<p><strong>1. Introduction </strong></p>\n<p>At Iqonic Design, we are dedicated to safeguarding your privacy and ensuring your personal data is handled securely. This Privacy Policy explains how we collect, use, and protect your information when you use our services through the Streamit Laravel platform, including our website and associated applications. By accessing or using our services, you acknowledge that you have read and understood this Privacy Policy and agree to its terms.</p>\n<p><strong>2. Information We Collect </strong></p>\n<p>We may collect several types of information when you use Streamit Laravel, including:</p>\n<p><strong>- Personal Information:</strong> Information you provide, such as your name, email address, payment information (e.g., credit card details), and any other personal information required for account creation and subscription services.</p>\n<p><strong>- Usage Data:</strong> Details about how you interact with the platform, such as your IP address, browser type, device details, pages you visit, and your streaming activity. This data helps us optimize your experience and improve our service.</p>\n<p><strong>- Cookies and Tracking Technologies:</strong> We use cookies and similar technologies to track user preferences, enhance your experience, and analyze traffic. You can manage your cookie settings through your browser.</p>\n<p><strong>3. How We Use Your Information </strong></p>\n<p>We collect and use your information to:</p>\n<p><strong>- Provide Streaming Services:</strong> To deliver content, manage user accounts, and personalize recommendations based on your viewing habits.</p>\n<p><strong>- Process Transactions:</strong> For managing subscriptions, handling payments securely, and maintaining transaction histories.</p>\n<p><strong>- Improve User Experience:</strong> Analyze how users interact with the platform to improve navigation, content suggestions, and overall performance.</p>\n<p><strong>- Communications:</strong> Send important notifications related to service updates, billing, and personalized marketing content based on your preferences (you can opt out of marketing communications).</p>\n<p><strong>- Security:</strong> Use collected information to ensure the security of the platform, prevent fraud, and monitor potential misuse.</p>\n<p><strong>4. Data Sharing and Disclosure </strong></p>\n<p>WWe value your privacy and do not sell, rent, or disclose your personal information to third parties except in the following circumstances:</p>\n<p><strong>- Service Providers:</strong> We may share your data with third-party service providers, such as payment processors or cloud storage providers, solely to help us deliver our services. These providers are bound by strict confidentiality agreements and are only authorized to use your information for the purpose of providing services to us.</p>\n<p><strong>- Legal Requirements:</strong> We will only disclose your personal information if required by law, such as to comply with a legal obligation, or in response to valid legal processes like subpoenas, court orders, or other government demands. This will only occur when we have a legal basis to do so.</p>\n<p>-<strong> Business Transfers (If Applicable):</strong> In the event that Iqonic Design undergoes a business transition such as a merger, acquisition, or sale of all or part of our assets, your information may be transferred as part of the transaction. If such a transfer occurs, we will notify you and ensure that the new entity adheres to this Privacy Policy or offers similar protections.</p>\n<p><strong>5. Your Rights </strong></p>\n<p>You have certain rights regarding your personal information, including:</p>\n<p><strong>- Streamit LaravelAccess and CorrectionStreamit Laravel:</strong> You may access, correct, or update your personal data through your account settings.</p>\n<p><strong>- Streamit LaravelDeletionStreamit Laravel:</strong> You may request the deletion of your account and associated data by contacting our support team.</p>\n<p><strong>- Streamit LaravelData PortabilityStreamit Laravel:</strong> You have the right to request your personal data in a structured, machine-readable format to transfer to another service provider.</p>\n<p><strong>- Streamit LaravelOpting Out of Marketing CommunicationsStreamit Laravel:</strong> You can opt out of receiving promotional emails or other communications at any time by adjusting your account settings or contacting us.</p>\n<p><strong>6. Data Security </strong></p>\n<p>We take the protection of your personal data very seriously and prioritize its security using a range of industry-standard security measures. These measures are designed to safeguard your information from unauthorized access, disclosure, or misuse. Our security practices include the use of encryption, secure data storage systems, firewalls, and regular security audits to detect vulnerabilities. In addition to these technical measures, we employ strict internal policies to control access to sensitive data, ensuring that only authorized personnel can handle it.</p>\n<p>Despite our efforts to implement strong security systems, it\'s important to recognize that no method of transmission over the internet or method of electronic storage is completely secure. As such, while we are committed to doing our utmost to protect your personal information, we cannot guarantee absolute security. If you suspect any breach or unauthorized access to your account, please notify us immediately so we can take appropriate action to secure your data.</p>\n<p><strong> 7. Children&rsquo;s Privacy </strong></p>\n<p>The Streamit Laravel platform is designed for use by individuals aged 13 and older. We are committed to protecting the privacy of children and do not knowingly collect personal information from individuals under the age of 13. In compliance with the Children&rsquo;s Online Privacy Protection Act (COPPA) and similar regulations, we take precautions to avoid collecting any data from minors.</p>\n<p>If you are a parent or guardian and become aware that your child has provided us with personal information without your consent, please contact us immediately. Upon receiving such a request, we will promptly review and remove the child\'s information from our system to ensure it is not used or stored. We take the privacy of minors seriously, and we will act quickly to address any concerns.</p>\n<p><strong>8. Changes to This Privacy Policy </strong></p>\n<p>Our privacy practices may evolve over time as we introduce new features, services, or update our operational procedures. To ensure transparency, we reserve the right to make changes to this Privacy Policy from time to time. Such updates may reflect changes in legal requirements, our business practices, or the introduction of new technologies.</p>\n<p>In the event of any significant modifications to the way we collect, use, or store your data, we will provide you with clear notification either via email or by placing a prominent notice on our platform. We encourage you to review this Privacy Policy periodically to stay informed of any updates or changes. Your continued use of our services after changes have been made constitutes your acceptance of the updated policy.</p>\n<p><strong>9. Contact Us </strong></p>\n<p>If you have any questions, concerns, or require further clarification regarding this Privacy Policy, our team is here to help. We value open communication with our users and are committed to addressing any concerns related to your personal data and privacy.</p>\n<p>You can contact us via the following email:</p>\n<p><strong>- Email:</strong> hello@iqonic.design</p>\n<p>We aim to respond to all queries in a timely manner and ensure that your privacy concerns are addressed effectively.</p>\n<p><strong>10. Data Deletion Request </strong></p>\n<p>We are committed to providing you with control over your personal information and ensuring that your data is handled in accordance with your preferences. If at any time you wish to request the deletion of your personal data from our servers, we offer a straightforward process to facilitate this.</p>\n<p>To request the deletion of your data, please send an email from your registered email address to our dedicated privacy inbox at hello@iqonic.design. Include the subject line \"Data Deletion Request\" and provide any necessary details regarding your account. Upon receiving your request, our team will thoroughly review the provided information, verify your identity, and proceed with the deletion of your data as required by our privacy policies and applicable legal obligations.</p>\n<p>Please note that certain legal requirements or regulatory obligations may require us to retain certain information for a specified period, even after a deletion request has been made. However, we will ensure that any retained data is handled securely and in compliance with relevant privacy laws.</p>\n<p>&nbsp;</p>\n<p><strong>This privacy policy helps ensure transparency and clarity about how Iqonic Design handles your data within Streamit Laravel. </strong></p>\n<p><strong>Thank you for using Streamit Laravel. Your privacy is important to us, and we are committed to safeguarding your personal information.&nbsp;&nbsp;</strong></p>', 1, NULL, 1, NULL, '2024-09-28 03:49:15', '2024-10-17 12:07:43', NULL);
INSERT INTO `pages` VALUES (2, 'Terms & Conditions', 'terms-conditions', NULL, '<p>Welcome to Streamit Laravel, a premier streaming platform developed by Iqonic Design. By accessing or using our services, you agree to comply with and be bound by these Terms and Conditions. These terms outline your rights and responsibilities when using our platform, and we encourage you to read them carefully. If you do not agree with these terms, please refrain from using the service.</p>\n<p><strong>1. Acceptance of Terms</strong></p>\n<p>By using Streamit Laravel, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. This agreement serves as a legally binding contract between you and Iqonic Design. If you do not agree to any of these terms, please refrain from using our services. We reserve the right to update these terms at any time, and it is your responsibility to review them periodically for changes.</p>\n<p><strong>2. Eligibility</strong></p>\n<p>To access and use Streamit Laravel, you must be at least 18 years old or the age of majority in your jurisdiction. If you are under 18, you may only use the service under the supervision of a parent or legal guardian who agrees to these Terms and Conditions. By using the service, you represent that you meet these eligibility requirements and that you are legally able to enter into this agreement. We reserve the right to terminate your account if you do not meet these criteria.</p>\n<p><strong>3. User Accounts</strong></p>\n<p>To access certain features of Streamit Laravel, you may be required to create a user account. When creating an account, you agree to provide accurate, complete, and up-to-date information, including your name, email address, and any other required details. You are responsible for maintaining the confidentiality of your account information, including your password. Any activity performed using your account is your responsibility, and you agree to notify us immediately of any unauthorized use of your account or any other breach of security. We are not liable for any loss or damage arising from your failure to comply with these requirements.</p>\n<p><strong>4. Subscription Plans</strong></p>\n<p>Streamit Laravel offers a variety of subscription plans, each with different features and benefits tailored to meet the needs of our diverse user base. By subscribing, you agree to pay the applicable fees associated with your chosen plan, which will be billed in advance on a recurring basis. Subscription fees are non-refundable, except as specified in our refund policy. The specific features of each subscription plan are detailed on our platform. We reserve the right to modify, enhance, or discontinue any plan at our discretion, ensuring that we continuously provide value to our users.</p>\n<p><strong>5. Payment and Billing</strong></p>\n<p>Payments for subscriptions are processed through secure third-party payment gateways, including Stripe, RazorPay, Paystack, PayPal, and FlutterWave. You are responsible for providing accurate and complete payment information. If the payment is not successfully processed due to insufficient funds, expired card information, or any other reason, we reserve the right to suspend or terminate your account. All fees are subject to applicable taxes, and you are responsible for paying any additional charges incurred in your region. By providing payment information, you authorize us to charge the payment method for the subscription fees and any other applicable charges.</p>\n<p><strong>6. Content Access and Usage</strong></p>\n<p>Upon subscribing, you are granted a limited, non-exclusive, non-transferable license to access and view the content available on Streamit Laravel for personal, non-commercial use. This license is intended solely for your enjoyment and personal viewing. You may not reproduce, distribute, modify, publicly display, publicly perform, republish, download, or store any content from the service without obtaining prior written consent from us. All content remains the property of Iqonic Design or its content providers, and unauthorized use of the content may result in legal action.</p>\n<p><strong>7. Intellectual Property</strong></p>\n<p>All content available on Streamit Laravel, including but not limited to movies, TV shows, graphics, logos, software, and any associated trademarks, is protected by copyright, trademark, and other intellectual property laws. You agree not to infringe, violate, or misuse any intellectual property rights belonging to Iqonic Design or third-party content providers. Unauthorized use of the content may lead to civil and criminal penalties. If you wish to use any content for commercial purposes, you must obtain prior written permission from the rightful owner.</p>\n<p><strong>8. Prohibited Activities</strong></p>\n<p>While using Streamit Laravel, you agree not to engage in any unlawful activities or conduct that violates these Terms and Conditions. This includes, but is not limited to:</p>\n<p>- Uploading or distributing malicious software, viruses, or any other harmful code.</p>\n<p>- Interfering with the security of the service or the experience of other users.</p>\n<p>- Attempting to bypass any content protection mechanisms or access restricted areas of the platform.</p>\n<p>- Sharing your login credentials with others or using another user\'s account without permission. Engaging in any of these prohibited activities may result in immediate termination of your account and potential legal action.</p>\n<p><strong>9. Third-Party Links</strong></p>\n<p>Streamit Laravel may contain links to third-party websites or services that are not owned or controlled by Iqonic Design. We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party sites. Your interactions with these third-party services are governed by their own terms and policies. We encourage you to read the terms and conditions of any third-party website you visit. Iqonic Design is not responsible for any damages or losses caused by your use of these third-party services.</p>\n<p><strong>10. Termination of Service</strong></p>\n<p>We reserve the right to suspend or terminate your access to Streamit Laravel at any time, with or without notice, if you breach these Terms and Conditions or engage in conduct that we deem harmful to the platform or other users. In the event of termination, your right to use the service will immediately cease, and you may lose access to any content associated with your account. We will not be liable to you or any third party for any termination of your access to the service. Upon termination, any provisions of these terms that, by their nature, should survive termination shall remain in effect.</p>\n<p><strong>11. Limitation of Liability</strong></p>\n<p>In no event shall Iqonic Design or its affiliates be liable for any indirect, incidental, special, or consequential damages arising from your use or inability to use the Streamit Laravel service. This includes, but is not limited to, damages for loss of profits, data, or other intangible losses, even if we have been advised of the possibility of such damages. Your sole remedy for dissatisfaction with the service is to stop using it. Our liability for any claims arising out of these Terms and Conditions shall not exceed the total amount paid by you for the service during the twelve (12) months preceding the claim.</p>\n<p><strong>12. Disclaimer of Warranties</strong></p>\n<p>The Streamit Laravel service is provided \"as is\" and \"as available.\" Iqonic Design makes no warranties or representations about the accuracy, reliability, or availability of the service. We disclaim all warranties, whether express or implied, including but not limited to implied warranties of merchantability, fitness for a particular purpose, and non-infringement. We do not guarantee that the service will be uninterrupted, secure, or error-free, and we are not responsible for any interruptions or errors in the service. Your use of the service is at your own risk.</p>\n<p><strong>13. Modifications to Terms</strong></p>\n<p>We reserve the right to modify these Terms and Conditions at any time. Any changes will be effective immediately upon posting on our platform. Your continued use of the service after the changes means you accept the new terms. We encourage you to review these Terms regularly to stay informed of any updates. If you do not agree with any changes, you should stop using the service. Continued access to Streamit Laravel after modifications indicates your acceptance of the updated terms.</p>\n<p><strong>14. Governing Law</strong></p>\n<p>These Terms and Conditions shall be governed by and construed in accordance with the laws of the jurisdiction in which Iqonic Design operates. Any legal actions arising from these terms must be filed in the appropriate courts of that jurisdiction. If any provision of these terms is found to be unenforceable, the remaining provisions will remain in full force and effect. By using Streamit Laravel, you consent to the exclusive jurisdiction of the courts located in that jurisdiction.</p>\n<p><strong>15. Contact Us</strong></p>\n<p>If you have any questions, concerns, or comments about these Terms and Conditions, please contact us at:</p>\n<p>- Email: hello@iqonic.design</p>\n<p><strong>We appreciate your cooperation and understanding of these Terms and Conditions. They are designed to protect both your rights and those of our users, ensuring a secure and enjoyable streaming experience on Streamit Laravel.</strong></p>\n<p>&nbsp;</p>', 1, NULL, 1, NULL, '2024-09-28 03:49:15', '2024-10-17 12:08:56', NULL);
INSERT INTO `pages` VALUES (3, 'Help and Support', 'help-and-support', NULL, '<p>Welcome to Streamit Laravel Help &amp; Support! At Iqonic Design, we strive to offer you the best streaming experience possible. Should you have any questions, concerns, or need assistance with Streamit Laravel, you&rsquo;ve come to the right place. Our dedicated support team is here to help you with technical issues, general queries, and everything in between. We are committed to ensuring a smooth and enjoyable streaming experience.</p>\n<p><strong>Frequently Asked Questions (FAQs)</strong></p>\n<p>Before contacting us, we highly recommend checking our [FAQ Page] for common issues and their solutions. We continuously update this page to address frequently asked user queries, offering you the quickest route to a solution.</p>\n<p><strong>Contact Support</strong></p>\n<p>If you need further assistance, feel free to contact our support team at:</p>\n<p>📧 <strong>Email: hello@iqonic.design</strong></p>\n<p>We aim to respond to all queries within 24 to 48 hours (Monday through Friday). Our priority is resolving your issue as swiftly as possible.</p>\n<p><strong>How Can We Assist You?</strong></p>\n<p>Our support services include:</p>\n<p><strong>1. Account &amp; Subscription Issues&nbsp;&nbsp;</strong></p>\n<p>&nbsp; &nbsp;- Experiencing issues with your account setup, subscription, or payments? We&rsquo;re available to assist with any difficulties you encounter during the process of managing your account or subscription plan.</p>\n<p><strong>2. App Navigation &amp; Features&nbsp;&nbsp;</strong></p>\n<p>&nbsp; &nbsp;- Whether you\'re a new user or need help with specific features, we can guide you. Streamit Laravel is designed with user-friendly features, and we are here to help you make the most out of them.</p>\n<p><strong>3. Technical Support&nbsp;&nbsp;</strong></p>\n<p>&nbsp; &nbsp;- Facing technical difficulties with the app? Our technical team is prepared to assist with any malfunctions, connectivity problems, or performance issues to ensure that your streaming experience is uninterrupted.</p>\n<p><strong>4. Content Inquiries&nbsp;</strong>&nbsp;</p>\n<p>&nbsp; &nbsp;- Do you have questions about our content? We&rsquo;re happy to clarify any concerns regarding the availability, features, or quality of the content in our library.</p>\n<p><strong>5. Feedback &amp; Suggestions&nbsp;&nbsp;</strong></p>\n<p>&nbsp; &nbsp;- We value your feedback! Your input helps us improve your experience, and we carefully consider all suggestions and reported issues.</p>\n<p><strong>Quick Assistance Steps</strong></p>\n<p><strong>For a faster response, follow these steps:</strong></p>\n<p>1. Check our FAQ page to see if your issue has already been addressed.</p>\n<p>2. Email us at hello@iqonic.design with your query.</p>\n<p>3. Include the following details for faster resolution:</p>\n<p>- Your device model and operating system (OS) version.</p>\n<p>- A brief description of the issue.</p>\n<p>- Screenshots or steps to replicate the problem (if applicable).</p>\n<p><strong>Help Us Help You</strong></p>\n<p>To help us serve you better, please provide the following information in your support request:</p>\n<p>- Your registered email address associated with Streamit Laravel.</p>\n<p>- A detailed description of the issue you\'re experiencing.</p>\n<p>- Any relevant steps to replicate the problem, including device and app information.</p>\n<p>&nbsp;</p>\n<p><strong>We are committed to ensuring your experience is smooth and enjoyable. Our team works diligently to resolve all queries and technical issues, helping you return to your seamless streaming experience as quickly as possible.</strong></p>\n<p><strong>Thank you for choosing Streamit Laravel! Your satisfaction is our top priority, and we&rsquo;re always here to assist you with any concerns or questions.</strong></p>', 1, NULL, 1, NULL, '2024-09-28 03:49:15', '2024-10-17 12:14:35', NULL);
INSERT INTO `pages` VALUES (4, 'Refund and Cancellation Policy', 'refund-and-cancellation-policy', NULL, '<p>At Iqonic Design, we strive to ensure our customers have a seamless experience with Streamit Laravel. Please read our Refund and Cancellation Policy carefully to understand your rights and obligations.</p>\n<p><strong>1. Subscription Cancellations</strong></p>\n<p>You may cancel your subscription to Streamit Laravel at any time. Upon cancellation:</p>\n<p><strong>- Continued Access:</strong> You will retain access to premium content and services until the end of your current billing cycle. There will be no disruption in service during this period.</p>\n<p><strong>- No Refund for Partial Periods:</strong> We do not provide refunds for unused portions of the subscription period. Your access will remain until the next billing date.</p>\n<p><strong>- How to Cancel:</strong> To cancel your subscription, visit your account settings in the app or contact our support team at hello@iqonic.design. Ensure that you follow the instructions clearly to avoid any confusion regarding cancellation timing.</p>\n<p><strong>2. Refund Eligibility</strong></p>\n<p><strong>Refunds may be granted under the following circumstances:</strong></p>\n<p><strong>- Accidental Billing:</strong> If you were incorrectly charged due to a technical error or duplicate billing, please contact us immediately to resolve the issue.</p>\n<p><strong>- Unauthorized Transactions:</strong> In the event your account was used without your permission, please notify us within 7 days of the transaction to be eligible for a refund.</p>\n<p><strong>Non-Refundable Cases:</strong></p>\n<p>Refunds will not be provided under the following circumstances:</p>\n<p><strong>- Change of Mind:</strong> If you decide you no longer want the subscription after purchase, we cannot provide a refund.</p>\n<p><strong>- Dissatisfaction with Content:</strong> Refunds will not be given solely based on dissatisfaction with the available content unless the service is defective or significantly misrepresented.</p>\n<p><strong>- Lack of Usage:</strong> If you do not use the service after subscribing, you will not be eligible for a refund.</p>\n<p><strong>3. Refund Process</strong></p>\n<p>If you qualify for a refund, the process will be as follows:</p>\n<p><strong>- Contact Support:</strong> Email us at hello@iqonic.design with the following details:</p>\n<p>&nbsp; * Your registered email address.</p>\n<p>&nbsp; * Subscription details (Plan name, Payment Date).</p>\n<p>&nbsp; * Reason for the refund request.</p>\n<p><strong>- Verification Process:</strong> We will review your request and confirm your eligibility for a refund. Additional information may be requested to complete this verification.</p>\n<p><strong>- Processing Time:</strong> Once approved, refunds will be processed within 7&ndash;10 business days. The refunded amount will be credited to the original payment method used during the transaction.</p>\n<p><strong>4. Free Trials</strong></p>\n<p>If you sign up for a free trial and choose not to continue with a paid subscription, you must cancel before the trial period ends to avoid being charged. No refunds will be provided if the subscription is not canceled before the trial expiration date. Ensure you monitor your trial period closely to avoid unwanted charges.</p>\n<p><strong>5. Changes to This Policy</strong></p>\n<p>Iqonic Design reserves the right to update or modify this Refund and Cancellation Policy at any time. We will notify users of any significant changes via email or in-app notifications. Continued use of Streamit Laravel after changes are made will signify your acceptance of the revised policy.</p>\n<p><strong>6. Contact Us</strong></p>\n<p>If you have any questions about this policy or need further assistance, please reach out to us at:</p>\n<p><strong>📧 Email: hello@iqonic.design&nbsp;&nbsp;</strong></p>\n<p><strong>We are always available to assist with any concerns you may have about refunds or cancellations. Your satisfaction is important to us, and we strive to address any issues promptly.</strong></p>\n<p><strong>Thank you for choosing Streamit Laravel and for being a valued customer of Iqonic Design!</strong></p>\n<p>Company:<strong>&nbsp;Iqonic Design&nbsp;&nbsp;</strong></p>\n<p>Product:<strong>&nbsp;Streamit Laravel&nbsp;&nbsp;</strong></p>\n<p>Support Contact:<strong>&nbsp;hello@iqonic.design</strong></p>', 1, NULL, 1, NULL, '2024-09-28 03:49:15', '2024-10-17 12:34:17', NULL);
INSERT INTO `pages` VALUES (5, 'Data Deletation Request', 'data-deletation-request', NULL, '<p>At Iqonic Design, we value the privacy of our users and are committed to ensuring your personal data is handled securely. If you wish to request the deletion of your data associated with Streamit Laravel, please review the following guidelines.</p>\n<p><strong>1. Right to Data Deletion</strong></p>\n<p>In accordance with global data protection laws, you have the right to request the deletion of your personal data stored within our systems. Once your request is verified, we will remove your data from our servers unless certain legal obligations require us to retain it.</p>\n<p><strong>2. Information We Delete</strong></p>\n<p>When submitting a data deletion request, the following data will be removed:</p>\n<p><strong>* Personal Information:</strong> Name, email address, phone number, and any other personally identifiable information.</p>\n<p><strong>* Account Details:</strong> Subscription history, payment details, and usage data.</p>\n<p><strong>* Watchlists and Preferences:</strong> Any watchlist, preferences, or custom content recommendations.</p>\n<p><strong>**Please note: After the data is deleted, you will no longer have access to your Streamit Laravel account, and the action is irreversible**</strong></p>\n<p><strong>3. How to Submit a Data Deletion Request</strong></p>\n<p>To request the deletion of your data:</p>\n<p><strong>* Email Request:</strong> Send an email to hello@iqonic.design with the subject line \"Data Deletion Request.\"</p>\n<p><strong>* Required Information:</strong> Include the following details in your email:</p>\n<p>&nbsp; &nbsp;- Your full name.</p>\n<p>&nbsp; &nbsp;- Your registered email address.</p>\n<p>&nbsp; &nbsp;- Reason for your data deletion request (optional).</p>\n<p><strong>* Verification:</strong> We may contact you to verify your identity before proceeding with the deletion.</p>\n<p><strong>4. Processing Time</strong></p>\n<p>Upon receiving and verifying your request, we will process the deletion within 30 days. You will be notified once your data has been successfully deleted.</p>\n<p><strong>5. Exceptions to Data Deletion</strong></p>\n<p>Certain data may not be eligible for deletion if:</p>\n<p>- Legal Obligations: We are required to retain your data for legal, regulatory, or contractual reasons.</p>\n<p>- Ongoing Transactions: If there are any unresolved issues such as pending transactions, your data may be retained until those issues are resolved.</p>\n<p><strong>6. Impact of Data Deletion</strong></p>\n<p>Once your data is deleted:</p>\n<p>- You will lose access to your Streamit Laravel account.</p>\n<p>- Any remaining subscription time will be forfeited, and no refunds will be issued.</p>\n<p>- You will need to create a new account if you wish to use our services again in the future.</p>\n<p><strong>7. Contact Us</strong></p>\n<p>If you have any questions about this policy or need assistance with your data deletion request, please reach out to us at:</p>\n<p>📧 Email: hello@iqonic.design&nbsp;&nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>Our team is here to help you with any concerns related to your personal data and privacy.</strong></p>\n<p><strong>Thank you for using Streamit Laravel, and for trusting Iqonic Design with your privacy.</strong></p>', 1, NULL, 1, NULL, '2024-09-28 03:49:15', '2024-10-17 12:34:36', NULL);
INSERT INTO `pages` VALUES (6, 'About Us', 'about-us', NULL, '<p><strong>About Streamit Laravel by Iqonic Design</strong></p>\n<p>Welcome to Streamit Laravel, a next-generation streaming platform proudly developed by Iqonic Design. We specialize in creating cutting-edge digital solutions, and Streamit Laravel is our latest breakthrough in the world of online entertainment. Whether you\'re a movie lover, a TV show binge-watcher, or enjoy live events, our platform is designed to deliver high-quality content directly to your device, ensuring a seamless, uninterrupted experience. Streamit Laravel combines advanced technology with a user-friendly interface to cater to audiences worldwide.</p>\n<p><strong>Our Mission</strong></p>\n<p>Our mission at Iqonic Design is to reshape how digital content is consumed by creating a streaming platform that prioritizes speed, reliability, and personalization. Streamit Laravel is built using the latest technologies to provide users with superior streaming quality, customized recommendations, and an easy-to-use content management system. We are committed to making entertainment accessible and enjoyable for all audiences, whether you\'re at home or on the go.</p>\n<p><strong>Why Choose Streamit Laravel?</strong></p>\n<p>- Top-Tier Streaming Experience: Dive into high-definition and 4K content with smooth playback, ensuring no buffering even during high-traffic periods.</p>\n<p>- Personalized Content Recommendations: Our AI-driven recommendation system curates content based on your viewing history, making it easy to discover your next favorite show or movie.</p>\n<p>- Multi-Device Compatibility: Enjoy Streamit Laravel on your mobile, tablet, smart TV, or desktop, with seamless syncing across all devices.</p>\n<p>- Exclusive Content &amp; Features: Gain access to exclusive shows, movies, and live events that are unavailable on other platforms, along with features like offline downloads and customizable viewing settings.</p>\n<p>- Scalable &amp; Customizable for Developers: Streamit Laravel offers a flexible architecture that developers can tailor to specific needs, with options for scalability and integrations with other platforms.</p>\n<p>- Comprehensive Content Management: Our platform is designed for content creators and streamers, allowing them to efficiently manage their movies, TV shows, episodes, and live TV in one easy-to-use dashboard.</p>\n<p>- Enhanced Security &amp; Privacy: We employ cutting-edge encryption and security protocols to safeguard your data and protect against unauthorized access or breaches.</p>\n<p><strong>Our Vision&nbsp;&nbsp;</strong></p>\n<p>We envision a world where entertainment is no longer bound by geographical or technological limitations. With Streamit Laravel, we aim to revolutionize digital content consumption, offering users the flexibility to watch anything, anywhere, at any time. Our vision extends beyond just entertainment&mdash;we seek to empower creators by providing a dynamic platform where they can showcase their content to a global audience while maintaining full control over their media. As technology evolves, so does Streamit Laravel, constantly improving to meet the demands of today&rsquo;s and tomorrow&rsquo;s viewers.</p>\n<p><strong>What Sets Us Apart?</strong></p>\n<p><strong>- Adaptive Streaming Technology:</strong> Our adaptive bitrate streaming automatically adjusts video quality based on your internet connection, ensuring uninterrupted playback at the highest quality your network supports.</p>\n<p><strong>- Collaborative Content Creation:</strong> Streamit Laravel allows content creators to collaborate, share, and co-produce projects, fostering a community of innovation and creativity.</p>\n<p><strong>- Immersive Viewing Experience:</strong> Our platform offers advanced features like multi-language subtitles, customizable captions, and interactive content for an enhanced viewing experience.</p>\n<p><strong>- Diverse Genre Library:</strong> Explore a wide range of genres, from action and thrillers to romance, horror, and documentaries. Whatever your preference, there&rsquo;s something for everyone on Streamit Laravel.</p>\n<p><strong>- Real-Time Notifications &amp; Updates:</strong> Stay updated with new releases, exclusive content, and upcoming live events with personalized notifications based on your preferences.</p>\n<p><strong>Connect with Us&nbsp;&nbsp;</strong></p>\n<p>We value our community and encourage feedback to help us improve. If you have any questions, suggestions, or require assistance, our support team is ready to help:</p>\n<p><strong>📧 Support Email: hello@iqonic.design</strong></p>\n<p>Join us in our journey to transform the entertainment landscape with Streamit Laravel&mdash;where technology and creativity come together to offer the ultimate streaming experience.</p>\n<p>Company:&nbsp;<strong>Iqonic Design&nbsp;&nbsp;</strong></p>\n<p>Product:&nbsp;<strong>Streamit Laravel&nbsp;&nbsp;</strong></p>\n<p>Support Contact:&nbsp;<strong>hello@iqonic.design</strong></p>', 1, NULL, 1, NULL, '2024-09-28 03:49:15', '2024-10-17 12:33:59', NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('john@example.com', '$2y$10$SlOLoHm2FkSkQJRgGrU18eA2vQ4hSeHqSqXO.9zGg/f.v7LqfblOW', '2026-02-22 21:56:03');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_fixed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'edit_settings', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (2, 'view_logs', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (3, 'view_blogs', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (4, 'add_blogs', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (5, 'edit_blogs', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (6, 'delete_blogs', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (7, 'restore_blogs', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (8, 'force_delete_blogs', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (9, 'view_genres', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (10, 'add_genres', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `permissions` VALUES (11, 'edit_genres', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (12, 'delete_genres', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (13, 'restore_genres', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (14, 'force_delete_genres', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (39, 'view_videos', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (40, 'add_videos', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (41, 'edit_videos', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (42, 'delete_videos', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (43, 'restore_videos', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (44, 'force_delete_videos', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (45, 'view_tvcategory', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (46, 'add_tvcategory', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (47, 'edit_tvcategory', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (48, 'delete_tvcategory', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (49, 'restore_tvcategory', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (50, 'force_delete_tvcategory', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (51, 'view_tvchannel', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (52, 'add_tvchannel', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (53, 'edit_tvchannel', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (54, 'delete_tvchannel', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (55, 'restore_tvchannel', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (56, 'force_delete_tvchannel', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (57, 'view_actor', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (58, 'add_actor', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (59, 'edit_actor', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (60, 'delete_actor', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (61, 'restore_actor', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (62, 'force_delete_actor', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (63, 'view_director', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (64, 'add_director', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (65, 'edit_director', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (66, 'delete_director', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (67, 'restore_director', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (68, 'force_delete_director', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (69, 'view_plans', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (70, 'add_plans', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (71, 'edit_plans', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (72, 'delete_plans', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (73, 'restore_plans', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (74, 'force_delete_plans', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (75, 'view_planlimitation', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (76, 'add_planlimitation', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (77, 'edit_planlimitation', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (78, 'delete_planlimitation', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (79, 'restore_planlimitation', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (80, 'force_delete_planlimitation', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (81, 'view_subscriptions', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (82, 'add_subscriptions', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (83, 'edit_subscriptions', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (84, 'delete_subscriptions', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (85, 'restore_subscriptions', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (86, 'force_delete_subscriptions', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (87, 'view_banners', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (88, 'add_banners', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (89, 'edit_banners', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (90, 'delete_banners', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (91, 'restore_banners', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (92, 'force_delete_banners', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (93, 'view_currency', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (94, 'add_currency', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (95, 'edit_currency', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (96, 'delete_currency', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (97, 'restore_currency', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (98, 'force_delete_currency', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (99, 'view_notification', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (100, 'add_notification', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (101, 'edit_notification', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (102, 'delete_notification', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (103, 'restore_notification', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (104, 'force_delete_notification', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (105, 'view_notification_template', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (106, 'add_notification_template', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (107, 'edit_notification_template', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (108, 'delete_notification_template', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (109, 'restore_notification_template', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (110, 'force_delete_notification_template', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (111, 'view_country', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (112, 'add_country', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (113, 'edit_country', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (114, 'delete_country', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (115, 'restore_country', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (116, 'force_delete_country', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (117, 'view_city', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (118, 'add_city', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (119, 'edit_city', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (120, 'delete_city', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (121, 'restore_city', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (122, 'force_delete_city', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (123, 'view_location', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (124, 'add_location', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (125, 'edit_location', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (126, 'delete_location', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (127, 'restore_location', 'web', 1, '2025-08-24 11:19:53', '2025-08-24 11:19:53');
INSERT INTO `permissions` VALUES (128, 'force_delete_location', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (129, 'view_state', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (130, 'add_state', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (131, 'edit_state', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (132, 'delete_state', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (133, 'restore_state', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (134, 'force_delete_state', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (135, 'view_constant', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (136, 'add_constant', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (137, 'edit_constant', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (138, 'delete_constant', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (139, 'restore_constant', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (140, 'force_delete_constant', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (141, 'view_world', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (142, 'add_world', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (143, 'edit_world', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (144, 'delete_world', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (145, 'restore_world', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (146, 'force_delete_world', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (147, 'view_subscription', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (148, 'add_subscription', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (149, 'edit_subscription', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (150, 'delete_subscription', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (151, 'restore_subscription', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (152, 'force_delete_subscription', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (153, 'view_castcrew', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (154, 'add_castcrew', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (155, 'edit_castcrew', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (156, 'delete_castcrew', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (157, 'restore_castcrew', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (158, 'force_delete_castcrew', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (159, 'view_livetv', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (160, 'add_livetv', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (161, 'edit_livetv', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (162, 'delete_livetv', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (163, 'restore_livetv', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (164, 'force_delete_livetv', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (165, 'view_video', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (166, 'add_video', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (167, 'edit_video', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (168, 'delete_video', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (169, 'restore_video', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (170, 'force_delete_video', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (171, 'view_media', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (172, 'add_media', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (173, 'edit_media', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (174, 'delete_media', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (175, 'restore_media', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (176, 'force_delete_media', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (183, 'view_taxes', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (184, 'add_taxes', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (185, 'edit_taxes', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (186, 'delete_taxes', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (187, 'restore_taxes', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (188, 'force_delete_taxes', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (189, 'view_page', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (190, 'add_page', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (191, 'edit_page', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (192, 'delete_page', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (193, 'restore_page', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (194, 'force_delete_page', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (195, 'view_dashboard_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (196, 'add_dashboard_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (197, 'edit_dashboard_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (198, 'delete_dashboard_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (199, 'restore_dashboard_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (200, 'force_delete_dashboard_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (201, 'view_app_config', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (202, 'add_app_config', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (203, 'edit_app_config', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (204, 'delete_app_config', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (205, 'restore_app_config', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (206, 'force_delete_app_config', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (207, 'view_constants', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (208, 'add_constants', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (209, 'edit_constants', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (210, 'delete_constants', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (211, 'restore_constants', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (212, 'force_delete_constants', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (213, 'view_coupon', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (214, 'add_coupon', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (215, 'edit_coupon', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (216, 'delete_coupon', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (217, 'restore_coupon', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (218, 'force_delete_coupon', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (219, 'view_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (220, 'add_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (221, 'edit_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (222, 'delete_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (223, 'restore_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (224, 'force_delete_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (225, 'setting_bussiness', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (226, 'setting_misc', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (227, 'setting_custom_code', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (228, 'setting_customization', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (229, 'setting_mail', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (230, 'setting_notification', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (231, 'setting_intigrations', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (232, 'setting_language', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (233, 'setting_invoice', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (234, 'setting_module', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (235, 'setting_app_setting', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (236, 'view_ads', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (237, 'add_ads', 'web', 1, '2025-08-24 11:19:54', '2025-08-24 11:19:54');
INSERT INTO `permissions` VALUES (238, 'edit_ads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (239, 'delete_ads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (240, 'restore_ads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (241, 'force_delete_ads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (242, 'view_vastads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (243, 'add_vastads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (244, 'edit_vastads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (245, 'delete_vastads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (246, 'restore_vastads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (247, 'force_delete_vastads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (248, 'view_customads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (249, 'add_customads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (250, 'edit_customads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (251, 'delete_customads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (252, 'restore_customads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');
INSERT INTO `permissions` VALUES (253, 'force_delete_customads', 'web', 1, '2025-08-24 11:19:55', '2025-08-24 11:19:55');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'Streamit', 'd540f42397d49df2bf111725b26669274edabe77cc67950a4844f2d3fcd11d55', '[\"*\"]', NULL, NULL, '2025-08-24 11:26:47', '2025-08-24 11:26:47');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'Streamit', 'c1297bd94786796298801a3a38d8b9f548e63100cc92f07032477f483b320edf', '[\"*\"]', NULL, NULL, '2025-08-24 11:27:04', '2025-08-24 11:27:04');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 3, 'Streamit', '4ba278f3929ef9875145c9eec6eaa30d1f26f4a44dcd11ab7302ead882cbab55', '[\"*\"]', NULL, NULL, '2025-09-01 04:45:01', '2025-09-01 04:45:01');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 3, 'Streamit', '03ea5c8f198e1a42029dd43b94e078bdf5b3342b1f392c578654fb1c86c13b22', '[\"*\"]', NULL, NULL, '2025-09-01 04:51:39', '2025-09-01 04:51:39');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 3, 'Streamit', '6f4cac129969ae639af9345eb3318a459853cb4f8c4e62e9208b2b2bb11034e1', '[\"*\"]', NULL, NULL, '2025-09-24 10:29:23', '2025-09-24 10:29:23');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 3, 'Streamit', '52c0a0f292986f488d26c931f5c6800552c9f64c2bb0c5a822d7cc1595160de8', '[\"*\"]', NULL, NULL, '2025-09-24 10:36:23', '2025-09-24 10:36:23');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\User', 14, 'Streamit', 'db94eec72934fdabc2bfa59e85787f3e5f1385da37be49b586d731b89424a111', '[\"*\"]', NULL, NULL, '2025-09-27 08:15:56', '2025-09-27 08:15:56');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\User', 14, 'Streamit', 'eb3ce5995a8df6f8fb0bdac4eb94412402cf40204ff4389c406d7fa86675c30e', '[\"*\"]', NULL, NULL, '2025-09-27 10:48:59', '2025-09-27 10:48:59');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\User', 14, 'Streamit', '3cb3480c5574c614a52978c4c49229fcc726df0c0732745dd4df2a598e988de2', '[\"*\"]', NULL, NULL, '2025-09-27 11:05:42', '2025-09-27 11:05:42');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', 14, 'Streamit', 'da938fd2115e5dbe27c34166caa18b825e5ebce271c2a5a19b39eaca1c11b0b1', '[\"*\"]', NULL, NULL, '2025-09-27 13:03:35', '2025-09-27 13:03:35');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', 14, 'Streamit', '29968e350c8b8d40213b4843beec96f3cd517be697720cea11596cffe313b705', '[\"*\"]', NULL, NULL, '2025-09-30 07:59:36', '2025-09-30 07:59:36');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', 14, 'Streamit', '85a8ebebbfc35719cbbfc483f326cc398abd4576d991db598b773428441ca8a5', '[\"*\"]', NULL, NULL, '2025-09-30 08:01:29', '2025-09-30 08:01:29');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', 13, 'Streamit', '3402dd42ef7da4890a131a22c5f5db8adea23894b225e38a6b0d6d88a61b4bf5', '[\"*\"]', NULL, NULL, '2025-10-01 17:05:07', '2025-10-01 17:05:07');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\User', 14, 'Streamit', '92f1b152931bf8f0b6018c6ef6d5f44d7bd65ed0d62b5244409483d4300a31c3', '[\"*\"]', NULL, NULL, '2025-10-04 04:14:58', '2025-10-04 04:14:58');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\User', 14, 'Streamit', 'b02f503dcbb8bf0d76e6ba8aa29315d706e4024360e80ba0a94c04cd31305a56', '[\"*\"]', NULL, NULL, '2025-10-05 11:43:22', '2025-10-05 11:43:22');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\User', 14, 'Streamit', '55f327f90cccf085759113034962b720db7d7be7343a417cd805cc3cb5a8e465', '[\"*\"]', NULL, NULL, '2025-10-05 16:34:08', '2025-10-05 16:34:08');
INSERT INTO `personal_access_tokens` VALUES (17, 'App\\Models\\User', 14, 'Streamit', '3cceda4d2d0d265b56ada3735f547cbaa3391870964e408e61dc7aa2138e535b', '[\"*\"]', NULL, NULL, '2025-10-06 12:39:01', '2025-10-06 12:39:01');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\User', 14, 'Streamit', '431d7d85465e601dc7dc33c1006cfa46bca84d10889cad4c06b891586bfb0710', '[\"*\"]', NULL, NULL, '2025-11-13 14:43:14', '2025-11-13 14:43:14');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\User', 14, 'Streamit', '7b010f6659f57c70389bb5ab57580d21b209e2b4fb34df3aba8d70688920c404', '[\"*\"]', NULL, NULL, '2025-11-14 16:03:21', '2025-11-14 16:03:21');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\User', 14, 'Streamit', 'fb240c7ec54f69412677dd43ee8a4e17d1ca44a115d61a8aa240369e7706a4ec', '[\"*\"]', NULL, NULL, '2025-11-20 15:12:19', '2025-11-20 15:12:19');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\User', 14, 'Streamit', '7296e7f60adff96d073efe16d34ad02da6cf797c7489b1d71256cc42b963561f', '[\"*\"]', NULL, NULL, '2025-11-25 14:39:59', '2025-11-25 14:39:59');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\User', 14, 'Streamit', '451dfe711b402ece7e97412653097953265eebe3ce2b1cf06f7ae98dd668f707', '[\"*\"]', NULL, NULL, '2025-11-25 18:55:20', '2025-11-25 18:55:20');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\Models\\User', 14, 'Streamit', '7d9f09b05701bcdef22f642bc23416cee09d6886fb5e7806cf70ea18bde6b6ee', '[\"*\"]', NULL, NULL, '2025-11-25 18:57:15', '2025-11-25 18:57:15');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\Models\\User', 14, 'Streamit', '2d963a9167f4d6e06be78bf10aa336d24b5239a7597a6f4eb3ff797846de2aca', '[\"*\"]', NULL, NULL, '2025-11-26 16:02:58', '2025-11-26 16:02:58');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\Models\\User', 14, 'Streamit', 'a0f0be3debe99be9879f47fd7fe105caa9467e5581cc94f2b09deac3964c7b6e', '[\"*\"]', NULL, NULL, '2025-11-26 16:09:05', '2025-11-26 16:09:05');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\Models\\User', 14, 'Streamit', '5dae3d65b118e3616b53582fce1676c8ae4b3aaa736534b364fc1493ba420d75', '[\"*\"]', NULL, NULL, '2025-11-26 16:10:24', '2025-11-26 16:10:24');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\Models\\User', 14, 'Streamit', '2462e7163f4b64eef8bc91bf5348404ec29f1097ee600095c6f1d733c70c128d', '[\"*\"]', NULL, NULL, '2025-11-27 03:47:43', '2025-11-27 03:47:43');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\Models\\User', 14, 'Streamit', '402099b844238665f1e3e520309e32e1c4fa3b55185b2beca75f17a0b7ba04ff', '[\"*\"]', NULL, NULL, '2025-12-01 13:35:16', '2025-12-01 13:35:16');
INSERT INTO `personal_access_tokens` VALUES (29, 'App\\Models\\User', 14, 'Streamit', '1d485e6749461c2538cb964c0424d6dc0ac050271f292af0898a126284a28259', '[\"*\"]', NULL, NULL, '2025-12-02 04:18:55', '2025-12-02 04:18:55');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\Models\\User', 14, 'Streamit', '02005e3b435f572e87281f22afcd676039f09a8f8dec540c620dfab54768f233', '[\"*\"]', NULL, NULL, '2025-12-03 19:49:55', '2025-12-03 19:49:55');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\Models\\User', 14, 'Streamit', '22ab0ec6ab72da308c6114db0d867bd0d0eda76f0a2c7f9389e1e2ef0dbb2853', '[\"*\"]', NULL, NULL, '2025-12-03 21:02:39', '2025-12-03 21:02:39');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\User', 14, 'Streamit', '0c85c921715a5d8c2a8f00d16ac017e801ecdb34d43c8339e0bb7ca1b608f08f', '[\"*\"]', NULL, NULL, '2025-12-07 16:03:22', '2025-12-07 16:03:22');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\User', 14, 'Streamit', '774ec7cc08c5e20b476d5eabc1da155ef7ca0632ebd31b1c563a1e99f98af41d', '[\"*\"]', NULL, NULL, '2025-12-07 16:08:15', '2025-12-07 16:08:15');
INSERT INTO `personal_access_tokens` VALUES (42, 'App\\Models\\User', 15, 'FiveFlix', '9a11f8fdabd2fe619789f3fa95a9f2f02c91018f1e574d69b5df49f085f999b4', '[\"*\"]', NULL, NULL, '2026-02-18 16:59:03', '2026-02-18 16:59:03');
INSERT INTO `personal_access_tokens` VALUES (43, 'App\\Models\\User', 15, 'FiveFlix', 'c242998ae07c7f497d1deac13a9491691f078e15422e634c1f922fe6b35c6bd2', '[\"*\"]', '2026-02-18 17:28:34', NULL, '2026-02-18 16:59:18', '2026-02-18 17:28:34');
INSERT INTO `personal_access_tokens` VALUES (44, 'App\\Models\\User', 16, 'FiveFlix', 'd9be82aa8c628e7243a3fcf1b324ef4138dcdf7cff8a584ed4d46091f72c1473', '[\"*\"]', NULL, NULL, '2026-03-12 03:47:50', '2026-03-12 03:47:50');
INSERT INTO `personal_access_tokens` VALUES (45, 'App\\Models\\User', 15, 'FiveFlix', '160f0b73c5e4889cf0e83bb15679f1f95b502fe780e1c99f1d38be603fae6c6e', '[\"*\"]', '2026-03-12 04:28:19', NULL, '2026-03-12 04:27:28', '2026-03-12 04:28:19');
INSERT INTO `personal_access_tokens` VALUES (46, 'App\\Models\\User', 15, 'FiveFlix', '69a4cafcae76d5fe6dcc5c7b86dab9b3bb6987ae5728acec3cb77e8564431ea0', '[\"*\"]', NULL, NULL, '2026-03-12 04:35:02', '2026-03-12 04:35:02');
INSERT INTO `personal_access_tokens` VALUES (47, 'App\\Models\\User', 15, 'FiveFlix', 'cc59236c8d2f86a5d20f1e2d861f3bdab7c02ae5fde34e63e6f6f780482c20d3', '[\"*\"]', '2026-03-12 04:35:48', NULL, '2026-03-12 04:35:29', '2026-03-12 04:35:48');
INSERT INTO `personal_access_tokens` VALUES (48, 'App\\Models\\User', 15, 'FiveFlix', '819701e28e56fe938b44472276b169f377df144d886e4dc4f8900f3bc80ccece', '[\"*\"]', '2026-03-12 04:57:43', NULL, '2026-03-12 04:57:02', '2026-03-12 04:57:43');
INSERT INTO `personal_access_tokens` VALUES (49, 'App\\Models\\User', 15, 'FiveFlix', '2a3d07e549ed938b08fbc47b89578a5502aa5492aed1c75c54afc99014ebc046', '[\"*\"]', '2026-03-13 13:29:51', NULL, '2026-03-13 13:27:35', '2026-03-13 13:29:51');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `android_identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `apple_identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_percentage` double NULL DEFAULT NULL,
  `total_price` double NULL DEFAULT NULL,
  `level` bigint NOT NULL DEFAULT 0,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `duration_value` bigint NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `plan_level_deleted_at_index`(`level` ASC, `deleted_at` ASC) USING BTREE,
  INDEX `plan_id_deleted_at_index`(`id` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (1, 'Basic', 'basic', NULL, NULL, 5, 0, NULL, 5, 1, 'week', 1, 1, 'The Basic Plan offers access to a limited selection of content on a weekly basis, perfect for casual viewers.', 2, 2, NULL, NULL, '2024-07-11 04:42:21', '2024-07-11 04:42:21');
INSERT INTO `plan` VALUES (2, 'Premium Plan', 'premium_plan', NULL, NULL, 20, 0, NULL, 20, 2, 'month', 1, 1, '<p>The Premium Plan provides monthly access to a wider range of content, including exclusive shows and features.</p>', 2, 2, NULL, NULL, '2024-07-11 04:43:13', '2024-10-08 09:28:11');
INSERT INTO `plan` VALUES (3, 'Ultimate Plan', 'ultimate_plan', NULL, NULL, 50, 0, NULL, 50, 3, 'month', 3, 1, 'The Ultimate Plan offers quarterly access with additional perks, such as early access to new releases and special content.', 2, 2, NULL, NULL, '2024-07-11 04:45:14', '2024-07-11 04:45:14');
INSERT INTO `plan` VALUES (4, 'Elite Plan', 'elite_plan', NULL, NULL, 80, 0, NULL, 80, 4, 'year', 1, 1, 'The Elite Plan grants yearly access to all content, including premium and exclusive features, perfect for avid viewers.', 2, 2, NULL, NULL, '2024-07-11 04:45:51', '2024-07-11 04:45:51');

-- ----------------------------
-- Table structure for planlimitation
-- ----------------------------
DROP TABLE IF EXISTS `planlimitation`;
CREATE TABLE `planlimitation`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of planlimitation
-- ----------------------------
INSERT INTO `planlimitation` VALUES (1, 'Video Cast', 'video-cast', 'Enhance your viewing experience with our Video Cast feature. Seamlessly stream your favorite shows and movies from your device to your TV or other compatible screens. Enjoy high-quality playback and easy controls for a truly immersive entertainment experience.', 1, 2, 2, NULL, '2024-07-10 11:13:04', '2024-07-10 11:13:04', NULL);
INSERT INTO `planlimitation` VALUES (2, 'Ads', 'ads', 'Discover a new way to enjoy content with minimal interruptions through our Ads feature. Our strategically placed advertisements are designed to provide relevant and engaging information without overwhelming your viewing experience.', 1, 2, 2, NULL, '2024-07-10 11:14:45', '2024-07-10 11:14:45', NULL);
INSERT INTO `planlimitation` VALUES (3, 'Device Limit', 'device-limit', 'Manage your device connections effortlessly with our Device Limit feature. Easily monitor and control the number of devices linked to your account, ensuring a secure and personalized streaming experience.', 1, 2, 2, NULL, '2024-07-10 11:16:10', '2024-07-10 11:16:10', NULL);
INSERT INTO `planlimitation` VALUES (4, 'Download Status', 'download-status', 'Keep track of your content downloads with our Download Status feature. View the progress of your current downloads, check completed files, and manage your storage efficiently. This feature provides real-time updates, allowing you to pause, resume, or cancel downloads as needed, ensuring you have access to your favorite content anytime, even offline.', 1, 2, 2, NULL, '2024-07-10 11:17:41', '2024-07-10 11:17:41', NULL);
INSERT INTO `planlimitation` VALUES (5, 'Supported Device Type', 'supported-device-type', 'Our platform supports a wide range of devices including smartphones, tablets, smart TVs, and gaming consoles. Enjoy seamless streaming on any device with optimized performance and high-quality playback.', 1, 2, 2, NULL, '2024-07-10 11:20:00', '2024-07-10 11:20:00', NULL);
INSERT INTO `planlimitation` VALUES (6, 'Profile Limit', 'profile-limit', 'Manage and customize your streaming experience with our Profile Limit feature. Set limits on the number of profiles that can be created under a single account, ensuring each user enjoys a personalized experience while keeping account usage within your preferred parameters.', 1, 2, 2, NULL, '2024-09-19 12:00:00', '2024-09-19 12:00:00', NULL);

-- ----------------------------
-- Table structure for planlimitation_mapping
-- ----------------------------
DROP TABLE IF EXISTS `planlimitation_mapping`;
CREATE TABLE `planlimitation_mapping`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_id` int NULL DEFAULT NULL,
  `planlimitation_id` int NULL DEFAULT NULL,
  `limitation_slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `limitation_value` int NULL DEFAULT NULL,
  `limit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `planlimitation_mapping_plan_id_deleted_at_index`(`plan_id` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of planlimitation_mapping
-- ----------------------------
INSERT INTO `planlimitation_mapping` VALUES (1, 1, 1, 'video-cast', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (2, 1, 2, 'ads', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (3, 1, 3, 'device-limit', 1, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (4, 1, 4, 'download-status', 1, '{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":0,\"2K\":0,\"4K\":0,\"8K\":0}', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (5, 2, 1, 'video-cast', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (6, 2, 2, 'ads', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (7, 2, 3, 'device-limit', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (8, 2, 4, 'download-status', 1, '{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":1,\"2K\":0,\"4K\":0,\"8K\":0}', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (9, 3, 1, 'video-cast', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (10, 3, 2, 'ads', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (11, 3, 3, 'device-limit', 1, '5', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (12, 3, 4, 'download-status', 1, '{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":1,\"2K\":1,\"4K\":0,\"8K\":0}', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (13, 4, 1, 'video-cast', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (14, 4, 2, 'ads', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (15, 4, 3, 'device-limit', 1, '8', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (16, 4, 4, 'download-status', 1, '{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":1,\"2K\":1,\"4K\":1,\"8K\":1}', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (17, 1, 5, 'supported-device-type', 1, '{\"tablet\":\"0\",\"laptop\":\"0\",\"mobile\":\"1\",\"tv\":\"0\"}', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (18, 1, 6, 'profile-limit', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (19, 2, 5, 'supported-device-type', 1, '{\"tablet\":\"1\",\"laptop\":\"0\",\"mobile\":\"1\",\"tv\":\"0\"}', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (20, 2, 6, 'profile-limit', 1, '3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (21, 3, 5, 'supported-device-type', 1, '{\"tablet\":\"0\",\"laptop\":\"1\",\"mobile\":\"1\",\"tv\":\"1\"}', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (22, 3, 6, 'profile-limit', 1, '3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (23, 4, 5, 'supported-device-type', 1, '{\"tablet\":\"1\",\"laptop\":\"1\",\"mobile\":\"1\",\"tv\":\"1\"}', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `planlimitation_mapping` VALUES (24, 4, 6, 'profile-limit', 1, '4', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for requests
-- ----------------------------
DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `entertainment_id` int UNSIGNED NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `requester_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rating` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of requests
-- ----------------------------
INSERT INTO `requests` VALUES (3, 14, NULL, '', 'Stella Green', '+913465756789', 'issue', NULL, NULL, NULL, NULL, 'accepted', '2025-12-02 04:28:55', '2025-12-02 04:28:55');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entertainment_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `rating` int NOT NULL DEFAULT 0,
  `review` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reviews
-- ----------------------------

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (39, 1);
INSERT INTO `role_has_permissions` VALUES (40, 1);
INSERT INTO `role_has_permissions` VALUES (41, 1);
INSERT INTO `role_has_permissions` VALUES (42, 1);
INSERT INTO `role_has_permissions` VALUES (43, 1);
INSERT INTO `role_has_permissions` VALUES (44, 1);
INSERT INTO `role_has_permissions` VALUES (45, 1);
INSERT INTO `role_has_permissions` VALUES (46, 1);
INSERT INTO `role_has_permissions` VALUES (47, 1);
INSERT INTO `role_has_permissions` VALUES (48, 1);
INSERT INTO `role_has_permissions` VALUES (49, 1);
INSERT INTO `role_has_permissions` VALUES (50, 1);
INSERT INTO `role_has_permissions` VALUES (51, 1);
INSERT INTO `role_has_permissions` VALUES (52, 1);
INSERT INTO `role_has_permissions` VALUES (53, 1);
INSERT INTO `role_has_permissions` VALUES (54, 1);
INSERT INTO `role_has_permissions` VALUES (55, 1);
INSERT INTO `role_has_permissions` VALUES (56, 1);
INSERT INTO `role_has_permissions` VALUES (57, 1);
INSERT INTO `role_has_permissions` VALUES (58, 1);
INSERT INTO `role_has_permissions` VALUES (59, 1);
INSERT INTO `role_has_permissions` VALUES (60, 1);
INSERT INTO `role_has_permissions` VALUES (61, 1);
INSERT INTO `role_has_permissions` VALUES (62, 1);
INSERT INTO `role_has_permissions` VALUES (63, 1);
INSERT INTO `role_has_permissions` VALUES (64, 1);
INSERT INTO `role_has_permissions` VALUES (65, 1);
INSERT INTO `role_has_permissions` VALUES (66, 1);
INSERT INTO `role_has_permissions` VALUES (67, 1);
INSERT INTO `role_has_permissions` VALUES (68, 1);
INSERT INTO `role_has_permissions` VALUES (69, 1);
INSERT INTO `role_has_permissions` VALUES (70, 1);
INSERT INTO `role_has_permissions` VALUES (71, 1);
INSERT INTO `role_has_permissions` VALUES (72, 1);
INSERT INTO `role_has_permissions` VALUES (73, 1);
INSERT INTO `role_has_permissions` VALUES (74, 1);
INSERT INTO `role_has_permissions` VALUES (75, 1);
INSERT INTO `role_has_permissions` VALUES (76, 1);
INSERT INTO `role_has_permissions` VALUES (77, 1);
INSERT INTO `role_has_permissions` VALUES (78, 1);
INSERT INTO `role_has_permissions` VALUES (79, 1);
INSERT INTO `role_has_permissions` VALUES (80, 1);
INSERT INTO `role_has_permissions` VALUES (81, 1);
INSERT INTO `role_has_permissions` VALUES (82, 1);
INSERT INTO `role_has_permissions` VALUES (83, 1);
INSERT INTO `role_has_permissions` VALUES (84, 1);
INSERT INTO `role_has_permissions` VALUES (85, 1);
INSERT INTO `role_has_permissions` VALUES (86, 1);
INSERT INTO `role_has_permissions` VALUES (87, 1);
INSERT INTO `role_has_permissions` VALUES (88, 1);
INSERT INTO `role_has_permissions` VALUES (89, 1);
INSERT INTO `role_has_permissions` VALUES (90, 1);
INSERT INTO `role_has_permissions` VALUES (91, 1);
INSERT INTO `role_has_permissions` VALUES (92, 1);
INSERT INTO `role_has_permissions` VALUES (93, 1);
INSERT INTO `role_has_permissions` VALUES (94, 1);
INSERT INTO `role_has_permissions` VALUES (95, 1);
INSERT INTO `role_has_permissions` VALUES (96, 1);
INSERT INTO `role_has_permissions` VALUES (97, 1);
INSERT INTO `role_has_permissions` VALUES (98, 1);
INSERT INTO `role_has_permissions` VALUES (99, 1);
INSERT INTO `role_has_permissions` VALUES (100, 1);
INSERT INTO `role_has_permissions` VALUES (101, 1);
INSERT INTO `role_has_permissions` VALUES (102, 1);
INSERT INTO `role_has_permissions` VALUES (103, 1);
INSERT INTO `role_has_permissions` VALUES (104, 1);
INSERT INTO `role_has_permissions` VALUES (105, 1);
INSERT INTO `role_has_permissions` VALUES (106, 1);
INSERT INTO `role_has_permissions` VALUES (107, 1);
INSERT INTO `role_has_permissions` VALUES (108, 1);
INSERT INTO `role_has_permissions` VALUES (109, 1);
INSERT INTO `role_has_permissions` VALUES (110, 1);
INSERT INTO `role_has_permissions` VALUES (111, 1);
INSERT INTO `role_has_permissions` VALUES (112, 1);
INSERT INTO `role_has_permissions` VALUES (113, 1);
INSERT INTO `role_has_permissions` VALUES (114, 1);
INSERT INTO `role_has_permissions` VALUES (115, 1);
INSERT INTO `role_has_permissions` VALUES (116, 1);
INSERT INTO `role_has_permissions` VALUES (117, 1);
INSERT INTO `role_has_permissions` VALUES (118, 1);
INSERT INTO `role_has_permissions` VALUES (119, 1);
INSERT INTO `role_has_permissions` VALUES (120, 1);
INSERT INTO `role_has_permissions` VALUES (121, 1);
INSERT INTO `role_has_permissions` VALUES (122, 1);
INSERT INTO `role_has_permissions` VALUES (123, 1);
INSERT INTO `role_has_permissions` VALUES (124, 1);
INSERT INTO `role_has_permissions` VALUES (125, 1);
INSERT INTO `role_has_permissions` VALUES (126, 1);
INSERT INTO `role_has_permissions` VALUES (127, 1);
INSERT INTO `role_has_permissions` VALUES (128, 1);
INSERT INTO `role_has_permissions` VALUES (129, 1);
INSERT INTO `role_has_permissions` VALUES (130, 1);
INSERT INTO `role_has_permissions` VALUES (131, 1);
INSERT INTO `role_has_permissions` VALUES (132, 1);
INSERT INTO `role_has_permissions` VALUES (133, 1);
INSERT INTO `role_has_permissions` VALUES (134, 1);
INSERT INTO `role_has_permissions` VALUES (135, 1);
INSERT INTO `role_has_permissions` VALUES (136, 1);
INSERT INTO `role_has_permissions` VALUES (137, 1);
INSERT INTO `role_has_permissions` VALUES (138, 1);
INSERT INTO `role_has_permissions` VALUES (139, 1);
INSERT INTO `role_has_permissions` VALUES (140, 1);
INSERT INTO `role_has_permissions` VALUES (141, 1);
INSERT INTO `role_has_permissions` VALUES (142, 1);
INSERT INTO `role_has_permissions` VALUES (143, 1);
INSERT INTO `role_has_permissions` VALUES (144, 1);
INSERT INTO `role_has_permissions` VALUES (145, 1);
INSERT INTO `role_has_permissions` VALUES (146, 1);
INSERT INTO `role_has_permissions` VALUES (147, 1);
INSERT INTO `role_has_permissions` VALUES (148, 1);
INSERT INTO `role_has_permissions` VALUES (149, 1);
INSERT INTO `role_has_permissions` VALUES (150, 1);
INSERT INTO `role_has_permissions` VALUES (151, 1);
INSERT INTO `role_has_permissions` VALUES (152, 1);
INSERT INTO `role_has_permissions` VALUES (153, 1);
INSERT INTO `role_has_permissions` VALUES (154, 1);
INSERT INTO `role_has_permissions` VALUES (155, 1);
INSERT INTO `role_has_permissions` VALUES (156, 1);
INSERT INTO `role_has_permissions` VALUES (157, 1);
INSERT INTO `role_has_permissions` VALUES (158, 1);
INSERT INTO `role_has_permissions` VALUES (159, 1);
INSERT INTO `role_has_permissions` VALUES (160, 1);
INSERT INTO `role_has_permissions` VALUES (161, 1);
INSERT INTO `role_has_permissions` VALUES (162, 1);
INSERT INTO `role_has_permissions` VALUES (163, 1);
INSERT INTO `role_has_permissions` VALUES (164, 1);
INSERT INTO `role_has_permissions` VALUES (165, 1);
INSERT INTO `role_has_permissions` VALUES (166, 1);
INSERT INTO `role_has_permissions` VALUES (167, 1);
INSERT INTO `role_has_permissions` VALUES (168, 1);
INSERT INTO `role_has_permissions` VALUES (169, 1);
INSERT INTO `role_has_permissions` VALUES (170, 1);
INSERT INTO `role_has_permissions` VALUES (171, 1);
INSERT INTO `role_has_permissions` VALUES (172, 1);
INSERT INTO `role_has_permissions` VALUES (173, 1);
INSERT INTO `role_has_permissions` VALUES (174, 1);
INSERT INTO `role_has_permissions` VALUES (175, 1);
INSERT INTO `role_has_permissions` VALUES (176, 1);
INSERT INTO `role_has_permissions` VALUES (183, 1);
INSERT INTO `role_has_permissions` VALUES (184, 1);
INSERT INTO `role_has_permissions` VALUES (185, 1);
INSERT INTO `role_has_permissions` VALUES (186, 1);
INSERT INTO `role_has_permissions` VALUES (187, 1);
INSERT INTO `role_has_permissions` VALUES (188, 1);
INSERT INTO `role_has_permissions` VALUES (189, 1);
INSERT INTO `role_has_permissions` VALUES (190, 1);
INSERT INTO `role_has_permissions` VALUES (191, 1);
INSERT INTO `role_has_permissions` VALUES (192, 1);
INSERT INTO `role_has_permissions` VALUES (193, 1);
INSERT INTO `role_has_permissions` VALUES (194, 1);
INSERT INTO `role_has_permissions` VALUES (195, 1);
INSERT INTO `role_has_permissions` VALUES (196, 1);
INSERT INTO `role_has_permissions` VALUES (197, 1);
INSERT INTO `role_has_permissions` VALUES (198, 1);
INSERT INTO `role_has_permissions` VALUES (199, 1);
INSERT INTO `role_has_permissions` VALUES (200, 1);
INSERT INTO `role_has_permissions` VALUES (201, 1);
INSERT INTO `role_has_permissions` VALUES (202, 1);
INSERT INTO `role_has_permissions` VALUES (203, 1);
INSERT INTO `role_has_permissions` VALUES (204, 1);
INSERT INTO `role_has_permissions` VALUES (205, 1);
INSERT INTO `role_has_permissions` VALUES (206, 1);
INSERT INTO `role_has_permissions` VALUES (207, 1);
INSERT INTO `role_has_permissions` VALUES (208, 1);
INSERT INTO `role_has_permissions` VALUES (209, 1);
INSERT INTO `role_has_permissions` VALUES (210, 1);
INSERT INTO `role_has_permissions` VALUES (211, 1);
INSERT INTO `role_has_permissions` VALUES (212, 1);
INSERT INTO `role_has_permissions` VALUES (213, 1);
INSERT INTO `role_has_permissions` VALUES (214, 1);
INSERT INTO `role_has_permissions` VALUES (215, 1);
INSERT INTO `role_has_permissions` VALUES (216, 1);
INSERT INTO `role_has_permissions` VALUES (217, 1);
INSERT INTO `role_has_permissions` VALUES (218, 1);
INSERT INTO `role_has_permissions` VALUES (219, 1);
INSERT INTO `role_has_permissions` VALUES (220, 1);
INSERT INTO `role_has_permissions` VALUES (221, 1);
INSERT INTO `role_has_permissions` VALUES (222, 1);
INSERT INTO `role_has_permissions` VALUES (223, 1);
INSERT INTO `role_has_permissions` VALUES (224, 1);
INSERT INTO `role_has_permissions` VALUES (225, 1);
INSERT INTO `role_has_permissions` VALUES (226, 1);
INSERT INTO `role_has_permissions` VALUES (227, 1);
INSERT INTO `role_has_permissions` VALUES (228, 1);
INSERT INTO `role_has_permissions` VALUES (229, 1);
INSERT INTO `role_has_permissions` VALUES (230, 1);
INSERT INTO `role_has_permissions` VALUES (231, 1);
INSERT INTO `role_has_permissions` VALUES (232, 1);
INSERT INTO `role_has_permissions` VALUES (233, 1);
INSERT INTO `role_has_permissions` VALUES (234, 1);
INSERT INTO `role_has_permissions` VALUES (235, 1);
INSERT INTO `role_has_permissions` VALUES (236, 1);
INSERT INTO `role_has_permissions` VALUES (237, 1);
INSERT INTO `role_has_permissions` VALUES (238, 1);
INSERT INTO `role_has_permissions` VALUES (239, 1);
INSERT INTO `role_has_permissions` VALUES (240, 1);
INSERT INTO `role_has_permissions` VALUES (241, 1);
INSERT INTO `role_has_permissions` VALUES (242, 1);
INSERT INTO `role_has_permissions` VALUES (243, 1);
INSERT INTO `role_has_permissions` VALUES (244, 1);
INSERT INTO `role_has_permissions` VALUES (245, 1);
INSERT INTO `role_has_permissions` VALUES (246, 1);
INSERT INTO `role_has_permissions` VALUES (247, 1);
INSERT INTO `role_has_permissions` VALUES (248, 1);
INSERT INTO `role_has_permissions` VALUES (249, 1);
INSERT INTO `role_has_permissions` VALUES (250, 1);
INSERT INTO `role_has_permissions` VALUES (251, 1);
INSERT INTO `role_has_permissions` VALUES (252, 1);
INSERT INTO `role_has_permissions` VALUES (253, 1);
INSERT INTO `role_has_permissions` VALUES (1, 2);
INSERT INTO `role_has_permissions` VALUES (2, 2);
INSERT INTO `role_has_permissions` VALUES (3, 2);
INSERT INTO `role_has_permissions` VALUES (4, 2);
INSERT INTO `role_has_permissions` VALUES (5, 2);
INSERT INTO `role_has_permissions` VALUES (6, 2);
INSERT INTO `role_has_permissions` VALUES (7, 2);
INSERT INTO `role_has_permissions` VALUES (8, 2);
INSERT INTO `role_has_permissions` VALUES (9, 2);
INSERT INTO `role_has_permissions` VALUES (10, 2);
INSERT INTO `role_has_permissions` VALUES (11, 2);
INSERT INTO `role_has_permissions` VALUES (12, 2);
INSERT INTO `role_has_permissions` VALUES (13, 2);
INSERT INTO `role_has_permissions` VALUES (14, 2);
INSERT INTO `role_has_permissions` VALUES (39, 2);
INSERT INTO `role_has_permissions` VALUES (40, 2);
INSERT INTO `role_has_permissions` VALUES (41, 2);
INSERT INTO `role_has_permissions` VALUES (42, 2);
INSERT INTO `role_has_permissions` VALUES (43, 2);
INSERT INTO `role_has_permissions` VALUES (44, 2);
INSERT INTO `role_has_permissions` VALUES (45, 2);
INSERT INTO `role_has_permissions` VALUES (46, 2);
INSERT INTO `role_has_permissions` VALUES (47, 2);
INSERT INTO `role_has_permissions` VALUES (48, 2);
INSERT INTO `role_has_permissions` VALUES (49, 2);
INSERT INTO `role_has_permissions` VALUES (50, 2);
INSERT INTO `role_has_permissions` VALUES (51, 2);
INSERT INTO `role_has_permissions` VALUES (52, 2);
INSERT INTO `role_has_permissions` VALUES (53, 2);
INSERT INTO `role_has_permissions` VALUES (54, 2);
INSERT INTO `role_has_permissions` VALUES (55, 2);
INSERT INTO `role_has_permissions` VALUES (56, 2);
INSERT INTO `role_has_permissions` VALUES (57, 2);
INSERT INTO `role_has_permissions` VALUES (58, 2);
INSERT INTO `role_has_permissions` VALUES (59, 2);
INSERT INTO `role_has_permissions` VALUES (60, 2);
INSERT INTO `role_has_permissions` VALUES (61, 2);
INSERT INTO `role_has_permissions` VALUES (62, 2);
INSERT INTO `role_has_permissions` VALUES (63, 2);
INSERT INTO `role_has_permissions` VALUES (64, 2);
INSERT INTO `role_has_permissions` VALUES (65, 2);
INSERT INTO `role_has_permissions` VALUES (66, 2);
INSERT INTO `role_has_permissions` VALUES (67, 2);
INSERT INTO `role_has_permissions` VALUES (68, 2);
INSERT INTO `role_has_permissions` VALUES (69, 2);
INSERT INTO `role_has_permissions` VALUES (70, 2);
INSERT INTO `role_has_permissions` VALUES (71, 2);
INSERT INTO `role_has_permissions` VALUES (72, 2);
INSERT INTO `role_has_permissions` VALUES (73, 2);
INSERT INTO `role_has_permissions` VALUES (74, 2);
INSERT INTO `role_has_permissions` VALUES (75, 2);
INSERT INTO `role_has_permissions` VALUES (76, 2);
INSERT INTO `role_has_permissions` VALUES (77, 2);
INSERT INTO `role_has_permissions` VALUES (78, 2);
INSERT INTO `role_has_permissions` VALUES (79, 2);
INSERT INTO `role_has_permissions` VALUES (80, 2);
INSERT INTO `role_has_permissions` VALUES (81, 2);
INSERT INTO `role_has_permissions` VALUES (82, 2);
INSERT INTO `role_has_permissions` VALUES (83, 2);
INSERT INTO `role_has_permissions` VALUES (84, 2);
INSERT INTO `role_has_permissions` VALUES (85, 2);
INSERT INTO `role_has_permissions` VALUES (86, 2);
INSERT INTO `role_has_permissions` VALUES (87, 2);
INSERT INTO `role_has_permissions` VALUES (88, 2);
INSERT INTO `role_has_permissions` VALUES (89, 2);
INSERT INTO `role_has_permissions` VALUES (90, 2);
INSERT INTO `role_has_permissions` VALUES (91, 2);
INSERT INTO `role_has_permissions` VALUES (92, 2);
INSERT INTO `role_has_permissions` VALUES (93, 2);
INSERT INTO `role_has_permissions` VALUES (94, 2);
INSERT INTO `role_has_permissions` VALUES (95, 2);
INSERT INTO `role_has_permissions` VALUES (96, 2);
INSERT INTO `role_has_permissions` VALUES (97, 2);
INSERT INTO `role_has_permissions` VALUES (98, 2);
INSERT INTO `role_has_permissions` VALUES (99, 2);
INSERT INTO `role_has_permissions` VALUES (100, 2);
INSERT INTO `role_has_permissions` VALUES (101, 2);
INSERT INTO `role_has_permissions` VALUES (102, 2);
INSERT INTO `role_has_permissions` VALUES (103, 2);
INSERT INTO `role_has_permissions` VALUES (104, 2);
INSERT INTO `role_has_permissions` VALUES (105, 2);
INSERT INTO `role_has_permissions` VALUES (106, 2);
INSERT INTO `role_has_permissions` VALUES (107, 2);
INSERT INTO `role_has_permissions` VALUES (108, 2);
INSERT INTO `role_has_permissions` VALUES (109, 2);
INSERT INTO `role_has_permissions` VALUES (110, 2);
INSERT INTO `role_has_permissions` VALUES (111, 2);
INSERT INTO `role_has_permissions` VALUES (112, 2);
INSERT INTO `role_has_permissions` VALUES (113, 2);
INSERT INTO `role_has_permissions` VALUES (114, 2);
INSERT INTO `role_has_permissions` VALUES (115, 2);
INSERT INTO `role_has_permissions` VALUES (116, 2);
INSERT INTO `role_has_permissions` VALUES (117, 2);
INSERT INTO `role_has_permissions` VALUES (118, 2);
INSERT INTO `role_has_permissions` VALUES (119, 2);
INSERT INTO `role_has_permissions` VALUES (120, 2);
INSERT INTO `role_has_permissions` VALUES (121, 2);
INSERT INTO `role_has_permissions` VALUES (122, 2);
INSERT INTO `role_has_permissions` VALUES (123, 2);
INSERT INTO `role_has_permissions` VALUES (124, 2);
INSERT INTO `role_has_permissions` VALUES (125, 2);
INSERT INTO `role_has_permissions` VALUES (126, 2);
INSERT INTO `role_has_permissions` VALUES (127, 2);
INSERT INTO `role_has_permissions` VALUES (128, 2);
INSERT INTO `role_has_permissions` VALUES (129, 2);
INSERT INTO `role_has_permissions` VALUES (130, 2);
INSERT INTO `role_has_permissions` VALUES (131, 2);
INSERT INTO `role_has_permissions` VALUES (132, 2);
INSERT INTO `role_has_permissions` VALUES (133, 2);
INSERT INTO `role_has_permissions` VALUES (134, 2);
INSERT INTO `role_has_permissions` VALUES (135, 2);
INSERT INTO `role_has_permissions` VALUES (136, 2);
INSERT INTO `role_has_permissions` VALUES (137, 2);
INSERT INTO `role_has_permissions` VALUES (138, 2);
INSERT INTO `role_has_permissions` VALUES (139, 2);
INSERT INTO `role_has_permissions` VALUES (140, 2);
INSERT INTO `role_has_permissions` VALUES (141, 2);
INSERT INTO `role_has_permissions` VALUES (142, 2);
INSERT INTO `role_has_permissions` VALUES (143, 2);
INSERT INTO `role_has_permissions` VALUES (144, 2);
INSERT INTO `role_has_permissions` VALUES (145, 2);
INSERT INTO `role_has_permissions` VALUES (146, 2);
INSERT INTO `role_has_permissions` VALUES (147, 2);
INSERT INTO `role_has_permissions` VALUES (148, 2);
INSERT INTO `role_has_permissions` VALUES (149, 2);
INSERT INTO `role_has_permissions` VALUES (150, 2);
INSERT INTO `role_has_permissions` VALUES (151, 2);
INSERT INTO `role_has_permissions` VALUES (152, 2);
INSERT INTO `role_has_permissions` VALUES (153, 2);
INSERT INTO `role_has_permissions` VALUES (154, 2);
INSERT INTO `role_has_permissions` VALUES (155, 2);
INSERT INTO `role_has_permissions` VALUES (156, 2);
INSERT INTO `role_has_permissions` VALUES (157, 2);
INSERT INTO `role_has_permissions` VALUES (158, 2);
INSERT INTO `role_has_permissions` VALUES (159, 2);
INSERT INTO `role_has_permissions` VALUES (160, 2);
INSERT INTO `role_has_permissions` VALUES (161, 2);
INSERT INTO `role_has_permissions` VALUES (162, 2);
INSERT INTO `role_has_permissions` VALUES (163, 2);
INSERT INTO `role_has_permissions` VALUES (164, 2);
INSERT INTO `role_has_permissions` VALUES (165, 2);
INSERT INTO `role_has_permissions` VALUES (166, 2);
INSERT INTO `role_has_permissions` VALUES (167, 2);
INSERT INTO `role_has_permissions` VALUES (168, 2);
INSERT INTO `role_has_permissions` VALUES (169, 2);
INSERT INTO `role_has_permissions` VALUES (170, 2);
INSERT INTO `role_has_permissions` VALUES (171, 2);
INSERT INTO `role_has_permissions` VALUES (172, 2);
INSERT INTO `role_has_permissions` VALUES (173, 2);
INSERT INTO `role_has_permissions` VALUES (174, 2);
INSERT INTO `role_has_permissions` VALUES (175, 2);
INSERT INTO `role_has_permissions` VALUES (176, 2);
INSERT INTO `role_has_permissions` VALUES (183, 2);
INSERT INTO `role_has_permissions` VALUES (184, 2);
INSERT INTO `role_has_permissions` VALUES (185, 2);
INSERT INTO `role_has_permissions` VALUES (186, 2);
INSERT INTO `role_has_permissions` VALUES (187, 2);
INSERT INTO `role_has_permissions` VALUES (188, 2);
INSERT INTO `role_has_permissions` VALUES (189, 2);
INSERT INTO `role_has_permissions` VALUES (190, 2);
INSERT INTO `role_has_permissions` VALUES (191, 2);
INSERT INTO `role_has_permissions` VALUES (192, 2);
INSERT INTO `role_has_permissions` VALUES (193, 2);
INSERT INTO `role_has_permissions` VALUES (194, 2);
INSERT INTO `role_has_permissions` VALUES (195, 2);
INSERT INTO `role_has_permissions` VALUES (196, 2);
INSERT INTO `role_has_permissions` VALUES (197, 2);
INSERT INTO `role_has_permissions` VALUES (198, 2);
INSERT INTO `role_has_permissions` VALUES (199, 2);
INSERT INTO `role_has_permissions` VALUES (200, 2);
INSERT INTO `role_has_permissions` VALUES (201, 2);
INSERT INTO `role_has_permissions` VALUES (202, 2);
INSERT INTO `role_has_permissions` VALUES (203, 2);
INSERT INTO `role_has_permissions` VALUES (204, 2);
INSERT INTO `role_has_permissions` VALUES (205, 2);
INSERT INTO `role_has_permissions` VALUES (206, 2);
INSERT INTO `role_has_permissions` VALUES (207, 2);
INSERT INTO `role_has_permissions` VALUES (208, 2);
INSERT INTO `role_has_permissions` VALUES (209, 2);
INSERT INTO `role_has_permissions` VALUES (210, 2);
INSERT INTO `role_has_permissions` VALUES (211, 2);
INSERT INTO `role_has_permissions` VALUES (212, 2);
INSERT INTO `role_has_permissions` VALUES (213, 2);
INSERT INTO `role_has_permissions` VALUES (214, 2);
INSERT INTO `role_has_permissions` VALUES (215, 2);
INSERT INTO `role_has_permissions` VALUES (216, 2);
INSERT INTO `role_has_permissions` VALUES (217, 2);
INSERT INTO `role_has_permissions` VALUES (218, 2);
INSERT INTO `role_has_permissions` VALUES (219, 2);
INSERT INTO `role_has_permissions` VALUES (220, 2);
INSERT INTO `role_has_permissions` VALUES (221, 2);
INSERT INTO `role_has_permissions` VALUES (222, 2);
INSERT INTO `role_has_permissions` VALUES (223, 2);
INSERT INTO `role_has_permissions` VALUES (224, 2);
INSERT INTO `role_has_permissions` VALUES (225, 2);
INSERT INTO `role_has_permissions` VALUES (226, 2);
INSERT INTO `role_has_permissions` VALUES (227, 2);
INSERT INTO `role_has_permissions` VALUES (228, 2);
INSERT INTO `role_has_permissions` VALUES (229, 2);
INSERT INTO `role_has_permissions` VALUES (230, 2);
INSERT INTO `role_has_permissions` VALUES (231, 2);
INSERT INTO `role_has_permissions` VALUES (232, 2);
INSERT INTO `role_has_permissions` VALUES (233, 2);
INSERT INTO `role_has_permissions` VALUES (234, 2);
INSERT INTO `role_has_permissions` VALUES (235, 2);
INSERT INTO `role_has_permissions` VALUES (236, 2);
INSERT INTO `role_has_permissions` VALUES (237, 2);
INSERT INTO `role_has_permissions` VALUES (238, 2);
INSERT INTO `role_has_permissions` VALUES (239, 2);
INSERT INTO `role_has_permissions` VALUES (240, 2);
INSERT INTO `role_has_permissions` VALUES (241, 2);
INSERT INTO `role_has_permissions` VALUES (242, 2);
INSERT INTO `role_has_permissions` VALUES (243, 2);
INSERT INTO `role_has_permissions` VALUES (244, 2);
INSERT INTO `role_has_permissions` VALUES (245, 2);
INSERT INTO `role_has_permissions` VALUES (246, 2);
INSERT INTO `role_has_permissions` VALUES (247, 2);
INSERT INTO `role_has_permissions` VALUES (248, 2);
INSERT INTO `role_has_permissions` VALUES (249, 2);
INSERT INTO `role_has_permissions` VALUES (250, 2);
INSERT INTO `role_has_permissions` VALUES (251, 2);
INSERT INTO `role_has_permissions` VALUES (252, 2);
INSERT INTO `role_has_permissions` VALUES (253, 2);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_fixed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Admin', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `roles` VALUES (2, 'demo_admin', 'Demo Admin', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');
INSERT INTO `roles` VALUES (3, 'user', 'user', 'web', 1, '2025-08-24 11:19:52', '2025-08-24 11:19:52');

-- ----------------------------
-- Table structure for seo
-- ----------------------------
DROP TABLE IF EXISTS `seo`;
CREATE TABLE `seo`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_keywords` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `seo_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_site_verification` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `canonical_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `seo_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seo
-- ----------------------------

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `servers_ip_unique`(`ip` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servers
-- ----------------------------
INSERT INTO `servers` VALUES (8, 'Server 2', 'https://fiveflix_sv2.test', 1, '2025-12-28 18:18:51', '2025-12-28 18:20:01');
INSERT INTO `servers` VALUES (9, 'Server 3', 'https://fiveflix_sv3.test', 1, '2025-12-28 18:19:24', '2025-12-28 18:19:24');

-- ----------------------------
-- Table structure for service_providers
-- ----------------------------
DROP TABLE IF EXISTS `service_providers`;
CREATE TABLE `service_providers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `manager_id` bigint UNSIGNED NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `contact_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of service_providers
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('1DIwDMksE7niMfB5qP6UK4jcEgRasTOc1Sjmz3TR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVUhLUHVLSGhQek5uWTZSOExCRW5nVWtGbXJSekZWeEMxbE1UWXZWZSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781025925);
INSERT INTO `sessions` VALUES ('1GsfV0aCxAbojsqQ8UYUDWKUtgS8awCVO8RUy8cG', NULL, '127.0.0.1', 'curl/8.19.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2JVNnpia0I1VDF4ZU04NnlidERuTTV1VW5pd2pEQnFqWHlZUTdPNCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781026101);
INSERT INTO `sessions` VALUES ('7sgZBvMRVfhyMRnbYcjFjAC5E89bMXzj2sFbvChe', NULL, '127.0.0.1', 'curl/8.19.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHBQOUxoNGNSd0NMQm1MYTA3TmlkWXhGcGs3allScmJaY0x0MkRuTSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781025843);
INSERT INTO `sessions` VALUES ('8CyjWDhsqEInyXQiqsQLzfAKGjHCsoGE4tgyFy7I', NULL, '127.0.0.1', 'Symfony', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRW0xamRsd2lOVUZnRldDaHFNOTJuQ29zTEt5RXdIRUZHSWlpTWkyQyI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc2OiJodHRwOi8vbG9jYWxob3N0L3N0cmVhbWluZ3NlcnZpY2Uvc3RyZWFtP2lkPTEzNSZxdWFsaXR5PW9yaWdpbmFsJnR5cGU9bW92aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781025208);
INSERT INTO `sessions` VALUES ('9Uco5lzTx74Vl6hriDTDcfcDAYkmS6AkCjJvasSO', NULL, '127.0.0.1', 'curl/8.19.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmNtNHF5M0ViNXFUMU5zTU5Wa2NtUVpnRzFIRjdQUnQ4UW9lcmlYbSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781026381);
INSERT INTO `sessions` VALUES ('Ac67IVmkzGKFRq6QSftBFm9cPdONIpDIQ8HeBgqN', NULL, '127.0.0.1', 'curl/8.19.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYmdZeDhqNnBnQm9yU1BBNm1Qejk3aWQ5V0dYT0ZOTHVESFpJU1NyWiI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781025707);
INSERT INTO `sessions` VALUES ('Ap5lmSoL1iGlqjBlxDX0unkNjAUDtQ3EnhJOTbiJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTkRCS1RhR0dVV2hpMWFFbFU4YkRldlQzcWtRY0RpQ3c1RkRtUTNKTCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc2OiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT0xNDRwJnR5cGU9bW92aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781027793);
INSERT INTO `sessions` VALUES ('apYpcA8EeHxC02ebu8smxjyigj6RZ0cGAfbEKDUR', NULL, '127.0.0.1', 'curl/8.19.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZEFSa1Q1R01xczhvOHRjUXppWEhhNlZTR0ZtTkNYem5rRFFxODhyMSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781027561);
INSERT INTO `sessions` VALUES ('CJqsl59xPs991DUsn7rR6c6sNE057J3j78yt4wOy', NULL, '127.0.0.1', 'Symfony', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiODV3VTExWHU4cnpTcXdETTJWN3ZhdERFdEJNUUJtTHZxdnpwQ1FlciI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc2OiJodHRwOi8vbG9jYWxob3N0L3N0cmVhbWluZ3NlcnZpY2Uvc3RyZWFtP2lkPTEzNSZxdWFsaXR5PW9yaWdpbmFsJnR5cGU9bW92aWVzIjt9fQ==', 1781026571);
INSERT INTO `sessions` VALUES ('emV78u2GNyvBJFzEIlZh6MYCIUoU4t6lQ4a6ZC1S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ1FzSk8ycG1lZ0txaGxISXRYY1d0VkdXMGZtbW9OZEJHMllqMGNweiI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781026837);
INSERT INTO `sessions` VALUES ('F1naHZZB0whxGYGsoVxJBxEeAgZu57xzhXUMcJ0x', NULL, '127.0.0.1', 'curl/8.19.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZUFHQTdVMnlYM0drNEdhdnM5Nk9pUHZEYW9FVEJhWU5HbGsyVFl5ciI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781026606);
INSERT INTO `sessions` VALUES ('g9mnV6m9v8k28nbffSTSWdEjyycNrEjcVgm5ov2O', NULL, '127.0.0.1', '', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMFVpY3laaW55Yk4yR1FKeVUwRUVLUWpza0JXYUJtZ2pVekNWaFNZNCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781027310);
INSERT INTO `sessions` VALUES ('ilB3vDLjb7KtxdcrZjtEUg2WuhbpaCUAOFgBMHHx', NULL, '127.0.0.1', '', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicTF0cDF3V09OYUR4UWp3RnlIb3hjRjNwUkw0ZGZkQVliN1dzYUVpNCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781027271);
INSERT INTO `sessions` VALUES ('irmDZb0SmLRDhJO196RmJYwXebazxgl25SehIXDM', NULL, '127.0.0.1', 'curl/8.19.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicUFjWndkcFFudWlxM1JwbUg1anlvanF3cDV5RzhxWkk2ZDlqR3BZcyI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781026462);
INSERT INTO `sessions` VALUES ('Mha24DjNgcqCabww27XkoZ5tjIGF5AyaV0efFToS', NULL, '127.0.0.1', 'Symfony', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoielpsVkFlSldtUGpVRHJ5NDhnOUNTbmZzcmx6TWRjRjZ6RjFsSUJQdSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc2OiJodHRwOi8vbG9jYWxob3N0L3N0cmVhbWluZ3NlcnZpY2Uvc3RyZWFtP2lkPTEzNSZxdWFsaXR5PW9yaWdpbmFsJnR5cGU9bW92aWVzIjt9fQ==', 1781026540);
INSERT INTO `sessions` VALUES ('ntdqFBzhosgTA6GsCfeTnZQo17kWGmtkKc7KvzRO', NULL, '127.0.0.1', '', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQXFVZ0VSQ0wwbFhkYjRqNkwycmxtMFR2VHg0Q1NYNVpieExhcGpPbSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781027184);
INSERT INTO `sessions` VALUES ('P03rgiV1d6MJ0cToMkmAheJbL2YwBWCChcrrF6KG', NULL, '127.0.0.1', 'curl/8.19.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRVZycDlDdjF0RHl1YjlEbnhsZ0FibE1qSzE5ZzlNYzFZOW51bTlEViI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781026382);
INSERT INTO `sessions` VALUES ('R8VT7w8cWf0ZX4ygugIqKiZC3SoF6EtUMDLpImp9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; Trident/7.0; rv:11.0) like Gecko', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibE1aVVNQZ2ZMSlVDa2E4TDFYY2hDVHJjVHFBZHNtZjI5V2xNWUlPTCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781026733);
INSERT INTO `sessions` VALUES ('tfzCeSKDu4vnR25XPZZn2nW5zWqoxqCwyc7qLFJ7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiU1drWnFkZjZMdmJMeXVuZGF4VEVKamJxM0ZSNFhsdVlUV3o1TmdZQiI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781024075);
INSERT INTO `sessions` VALUES ('wucaVEdFMp6iuPUVhawrqNnA3fNUheoaPM4NUQ1h', NULL, '127.0.0.1', '', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibm9QQXNzdm04TDcwUGFIN0ZLdFFabGh4UTBmRHBqUVNuUHpyaDVUWCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fX0=', 1781026719);
INSERT INTO `sessions` VALUES ('Xfc3pqhe2VFL8eE9ZmuXb1KroAXw15xbEVzLKLpW', NULL, '127.0.0.1', 'curl/8.19.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM2t2c1J0a3U3YzRYOUNxcHAyQXJyaUFrYUJWdHE5Sk11ZEdUZDZFTiI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgwOiJodHRwOi8vZml2ZWZsaXgudGVzdC9zdHJlYW1pbmdzZXJ2aWNlL3N0cmVhbT9pZD0xMzUmcXVhbGl0eT1vcmlnaW5hbCZ0eXBlPW1vdmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781025415);
INSERT INTO `sessions` VALUES ('xY5LUiaLfiB21Mi0DsXLpSKhgASD8pVzCpb5HoYC', NULL, '127.0.0.1', 'Symfony', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY2NPODJUZFkyZktCa21jQ3dldVR5dkN5dk5RWk1FR2p2UVVmVk5RRyI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc2OiJodHRwOi8vbG9jYWxob3N0L3N0cmVhbWluZ3NlcnZpY2Uvc3RyZWFtP2lkPTEzNSZxdWFsaXR5PW9yaWdpbmFsJnR5cGU9bW92aWVzIjt9fQ==', 1781026497);
INSERT INTO `sessions` VALUES ('ZZEsH2Xw6UoMiovKmA3UTQRdjEXAB1DJsfO5Zzpz', NULL, '127.0.0.1', 'Symfony', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia1dZQU40NFl1bDlVeFlrY3JJWXh1SGtGYVpIZ2Jvc3hpS1BFbW01eCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc2OiJodHRwOi8vbG9jYWxob3N0L3N0cmVhbWluZ3NlcnZpY2Uvc3RyZWFtP2lkPTEzNSZxdWFsaXR5PW9yaWdpbmFsJnR5cGU9bW92aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781025197);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `datatype` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (3, 'livetv', '1', 'module_settings', NULL, NULL, 1, NULL, '2024-08-08 05:27:31', '2025-09-20 10:49:59', NULL);
INSERT INTO `settings` VALUES (4, 'video', '0', 'module_settings', NULL, NULL, 1, NULL, '2024-08-08 05:27:31', '2025-09-20 10:49:59', NULL);
INSERT INTO `settings` VALUES (5, 'enable_tmdb_api', '1', 'module_settings', NULL, NULL, 1, NULL, '2024-08-08 05:27:31', '2025-09-20 10:49:59', NULL);
INSERT INTO `settings` VALUES (6, 'app_name', 'FiveFix: Your Ultimate Entertainment Hub', 'bussiness', NULL, NULL, 1, NULL, '2024-08-08 10:12:31', '2025-09-22 09:53:55', NULL);
INSERT INTO `settings` VALUES (7, 'user_app_name', 'FiveFix: Your Ultimate Entertainment Hub', 'bussiness', NULL, NULL, 1, NULL, '2024-08-08 10:12:31', '2025-09-22 09:53:55', NULL);
INSERT INTO `settings` VALUES (8, 'helpline_number', '+88015265897485', 'bussiness', NULL, NULL, 1, NULL, '2024-08-08 10:12:31', '2025-09-22 09:53:55', NULL);
INSERT INTO `settings` VALUES (9, 'inquriy_email', 'fivefix@iqonic.design', 'bussiness', NULL, NULL, 1, NULL, '2024-08-08 10:12:31', '2025-09-22 09:53:56', NULL);
INSERT INTO `settings` VALUES (10, 'short_description', 'FiveFix: Your Ultimate Destination for Unlimited Movies and Shows!', 'bussiness', NULL, NULL, 1, NULL, '2024-08-08 10:12:31', '2025-09-22 09:53:56', NULL);
INSERT INTO `settings` VALUES (11, 'google_analytics', 'Google Analytics', 'text', 'misc', NULL, NULL, NULL, '2024-08-08 10:31:01', '2024-08-08 10:31:01', NULL);
INSERT INTO `settings` VALUES (12, 'default_language', 'en', 'misc', 'misc', NULL, NULL, NULL, '2024-08-08 10:31:01', '2024-08-08 10:31:01', NULL);
INSERT INTO `settings` VALUES (13, 'default_time_zone', 'Asia/Kolkata', 'misc', 'misc', NULL, NULL, NULL, '2024-08-08 10:31:01', '2024-08-08 10:31:01', NULL);
INSERT INTO `settings` VALUES (14, 'disc_type', 'local', 'misc', 'misc', NULL, NULL, NULL, '2024-08-08 10:31:01', '2024-08-08 10:31:01', NULL);
INSERT INTO `settings` VALUES (15, 'cash_payment_method', '1', 'cashpayment', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (16, 'razor_payment_method', '0', 'razorpayPayment', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (17, 'razorpay_secretkey', '', 'razor_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (18, 'razorpay_publickey', '', 'razor_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (19, 'str_payment_method', '0', 'stripePayment', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (20, 'stripe_secretkey', '', 'str_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (21, 'stripe_publickey', '', 'str_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (22, 'paystack_payment_method', '0', 'paystackPayment', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (23, 'paystack_secretkey', '', 'paystack_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (24, 'paystack_publickey', '', 'paystack_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (25, 'paypal_payment_method', '0', 'paypalPayment', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (26, 'paypal_secretkey', '', 'paypal_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (27, 'paypal_clientid', '', 'paypal_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (28, 'flutterwave_payment_method', '0', 'flutterwavePayment', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (29, 'flutterwave_secretkey', '', 'flutterwave_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (30, 'flutterwave_publickey', '', 'flutterwave_payment_method', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (31, 'cinet_payment_method', '0', 'paymentcinet', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (32, 'sadad_payment_method', '0', 'paymentsadad', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (33, 'airtel_payment_method', '0', 'airtelpayment', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (34, 'phonepe_payment_method', '0', 'phonepepayment', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (35, 'midtrans_payment_method', '0', 'midtranspayment', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (36, 'local', '1', 'storage_settings', 'storageconfig', NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (37, 's3', '0', 'storage_settings', 'storageconfig', NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (38, 'aws_access_key', NULL, 'storage_settings', 'storageconfig', NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (39, 'aws_secret_key', NULL, 'storage_settings', 'storageconfig', NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (40, 'aws_region', NULL, 'storage_settings', 'storageconfig', NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (41, 'aws_bucket', NULL, 'storage_settings', 'storageconfig', NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (42, 'tmdb_api_key', 'e9759aae5787a25da66b9c0bf5b29b48', 'module_settings', NULL, NULL, 1, NULL, '2024-08-08 10:38:37', '2025-09-20 10:49:59', NULL);
INSERT INTO `settings` VALUES (43, 'is_social_login', '1', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (44, 'is_google_login', '1', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (45, 'is_otp_login', '1', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (46, 'is_apple_login', '1', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (47, 'is_firebase_notification', '1', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (48, 'firebase_key', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (49, 'is_user_push_notification', '1', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (50, 'is_application_link', '1', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (51, 'ios_url', 'https://apps.apple.com/bd/app/id389801252\r\n', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (52, 'android_url', 'https://play.google.com/store/apps/details?id=com.iqonic.streamitlaravel&pcampaignid=web_share', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (53, 'force_update', '0', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (54, 'app_version', NULL, 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (55, 'is_ChatGPT_integration', '1', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (56, 'ChatGPT_key', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (57, 'google_client_id', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (58, 'google_client_secret', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (59, 'google_redirect_uri', 'http://127.0.0.1:8000/auth/google/callback', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (60, 'apiKey', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (61, 'authDomain', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (62, 'databaseURL', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (63, 'projectId', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (64, 'storageBucket', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (65, 'messagingSenderId', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (66, 'appId', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (67, 'measurementId', '', 'appconfig', NULL, NULL, NULL, NULL, '2024-08-08 10:38:37', '2024-08-08 10:38:37', NULL);
INSERT INTO `settings` VALUES (68, 'iap_payment_method', '0', 'inapppurchase', NULL, 1, 1, NULL, '2025-08-26 05:00:23', '2025-08-26 05:00:23', NULL);
INSERT INTO `settings` VALUES (69, 'mini_logo', 'https://fiveflix.test/storage/16/TuyGlBEqaJLEkfKS0iCzhTsaOEWLhZoLUnJ1R7Tf.png', 'string', 'bussiness', 1, 1, NULL, '2025-08-30 07:18:02', '2025-09-22 09:53:56', NULL);
INSERT INTO `settings` VALUES (70, 'dark_logo', 'https://fiveflix.test/storage/17/NF6l2qQT1rc6Io6BxpDO071CIbiv5VtsHpqpQHIG.png', 'string', 'bussiness', 1, 1, NULL, '2025-08-30 07:18:02', '2025-09-22 09:53:56', NULL);
INSERT INTO `settings` VALUES (71, 'favicon', 'https://fiveflix.test/storage/18/rsMKsbrktbwnyK8ksuIFy0ZX75cWXf4uEEdzfbly.png', 'string', 'bussiness', 1, 1, NULL, '2025-08-30 07:18:02', '2025-09-22 09:53:56', NULL);

-- ----------------------------
-- Table structure for states
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of states
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_manual` tinyint(1) NOT NULL DEFAULT 0,
  `amount` double NULL DEFAULT NULL,
  `discount_percentage` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `coupon_discount` double NULL DEFAULT NULL,
  `total_amount` double NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `duration` int NULL DEFAULT NULL,
  `level` bigint NOT NULL DEFAULT 0,
  `plan_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payment_id` int NULL DEFAULT NULL,
  `device_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------
INSERT INTO `subscriptions` VALUES (1, 4, 1, '2025-07-30 00:00:00', '2029-08-30 00:00:00', 'active', 0, 20, NULL, 0, NULL, 20, 'Premium Plan', 'premium_plan', 'month', 1, 2, '[{\"id\":1,\"planlimitation_id\":1,\"limitation_title\":\"Video Cast\",\"limitation_value\":1,\"limit\":null,\"slug\":\"video-cast\",\"status\":1,\"message\":\"Cast videos to your TV with ease.\"},{\"id\":2,\"planlimitation_id\":2,\"limitation_title\":\"Ads\",\"limitation_value\":1,\"limit\":null,\"slug\":\"ads\",\"status\":1,\"message\":\"This plan includes ads.\"},{\"id\":3,\"planlimitation_id\":3,\"limitation_title\":\"Device Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"1\"},\"slug\":\"device-limit\",\"status\":1,\"message\":\"Stream on up to 1 devices simultaneously.\"},{\"id\":4,\"planlimitation_id\":4,\"limitation_title\":\"Download Status\",\"limitation_value\":1,\"limit\":{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":0,\"2K\":0,\"4K\":0,\"8K\":0},\"slug\":\"download-status\",\"status\":1,\"message\":\"Enjoy unlimited downloads with this plan.\"},{\"id\":17,\"planlimitation_id\":5,\"limitation_title\":\"Supported Device Type\",\"limitation_value\":1,\"limit\":{\"tablet\":\"0\",\"laptop\":\"0\",\"mobile\":\"1\"},\"slug\":\"supported-device-type\",\"status\":1,\"message\":null},{\"id\":18,\"planlimitation_id\":6,\"limitation_title\":\"Profile Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"2\"},\"slug\":\"profile-limit\",\"status\":1,\"message\":null}]', 8, '5', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `subscriptions` VALUES (2, 2, 5, '2025-05-30 00:00:00', '2025-06-30 00:00:00', 'inactive', 0, 20, NULL, 0, NULL, 20, 'Premium Plan', 'premium_plan', 'month', 1, 2, '[{\"id\":1,\"planlimitation_id\":1,\"limitation_title\":\"Video Cast\",\"limitation_value\":1,\"limit\":null,\"slug\":\"video-cast\",\"status\":1,\"message\":\"Cast videos to your TV with ease.\"},{\"id\":2,\"planlimitation_id\":2,\"limitation_title\":\"Ads\",\"limitation_value\":1,\"limit\":null,\"slug\":\"ads\",\"status\":1,\"message\":\"This plan includes ads.\"},{\"id\":3,\"planlimitation_id\":3,\"limitation_title\":\"Device Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"1\"},\"slug\":\"device-limit\",\"status\":1,\"message\":\"Stream on up to 1 devices simultaneously.\"},{\"id\":4,\"planlimitation_id\":4,\"limitation_title\":\"Download Status\",\"limitation_value\":1,\"limit\":{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":0,\"2K\":0,\"4K\":0,\"8K\":0},\"slug\":\"download-status\",\"status\":1,\"message\":\"Enjoy unlimited downloads with this plan.\"},{\"id\":17,\"planlimitation_id\":5,\"limitation_title\":\"Supported Device Type\",\"limitation_value\":1,\"limit\":{\"tablet\":\"0\",\"laptop\":\"0\",\"mobile\":\"1\"},\"slug\":\"supported-device-type\",\"status\":1,\"message\":null},{\"id\":18,\"planlimitation_id\":6,\"limitation_title\":\"Profile Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"2\"},\"slug\":\"profile-limit\",\"status\":1,\"message\":null}]', 3, '3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `subscriptions` VALUES (3, 3, 3, '2025-07-30 00:00:00', '2026-12-31 00:00:00', 'active', 1, 50, NULL, 0, NULL, 50, 'Ultimate Plan', 'ultimate_plan', 'month', 3, 3, '[{\"id\":9,\"planlimitation_id\":1,\"limitation_title\":\"Video Cast\",\"limitation_value\":1,\"limit\":null,\"slug\":\"video-cast\",\"status\":1,\"message\":\"Cast videos to your TV with ease.\"},{\"id\":10,\"planlimitation_id\":2,\"limitation_title\":\"Ads\",\"limitation_value\":0,\"limit\":null,\"slug\":\"ads\",\"status\":1,\"message\":\"Ad-free streaming with this plan.\"},{\"id\":11,\"planlimitation_id\":3,\"limitation_title\":\"Device Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"5\"},\"slug\":\"device-limit\",\"status\":1,\"message\":\"Stream on up to 5 devices simultaneously.\"},{\"id\":12,\"planlimitation_id\":4,\"limitation_title\":\"Download Status\",\"limitation_value\":1,\"limit\":{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":1,\"2K\":1,\"4K\":0,\"8K\":0},\"slug\":\"download-status\",\"status\":1,\"message\":\"Enjoy unlimited downloads with this plan.\"},{\"id\":21,\"planlimitation_id\":5,\"limitation_title\":\"Supported Device Type\",\"limitation_value\":1,\"limit\":{\"tablet\":\"0\",\"laptop\":\"1\",\"mobile\":\"1\"},\"slug\":\"supported-device-type\",\"status\":1,\"message\":null},{\"id\":22,\"planlimitation_id\":6,\"limitation_title\":\"Profile Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"3\"},\"slug\":\"profile-limit\",\"status\":1,\"message\":null}]', 1, 'test11', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `subscriptions` VALUES (4, 3, 6, '2025-04-28 00:00:00', '2025-07-28 00:00:00', 'inactive', 0, 50, NULL, 0, NULL, 50, 'Ultimate Plan', 'ultimate_plan', 'month', 3, 3, '[{\"id\":9,\"planlimitation_id\":1,\"limitation_title\":\"Video Cast\",\"limitation_value\":1,\"limit\":null,\"slug\":\"video-cast\",\"status\":1,\"message\":\"Cast videos to your TV with ease.\"},{\"id\":10,\"planlimitation_id\":2,\"limitation_title\":\"Ads\",\"limitation_value\":0,\"limit\":null,\"slug\":\"ads\",\"status\":1,\"message\":\"Ad-free streaming with this plan.\"},{\"id\":11,\"planlimitation_id\":3,\"limitation_title\":\"Device Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"5\"},\"slug\":\"device-limit\",\"status\":1,\"message\":\"Stream on up to 5 devices simultaneously.\"},{\"id\":12,\"planlimitation_id\":4,\"limitation_title\":\"Download Status\",\"limitation_value\":1,\"limit\":{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":1,\"2K\":1,\"4K\":0,\"8K\":0},\"slug\":\"download-status\",\"status\":1,\"message\":\"Enjoy unlimited downloads with this plan.\"},{\"id\":21,\"planlimitation_id\":5,\"limitation_title\":\"Supported Device Type\",\"limitation_value\":1,\"limit\":{\"tablet\":\"0\",\"laptop\":\"1\",\"mobile\":\"1\"},\"slug\":\"supported-device-type\",\"status\":1,\"message\":null},{\"id\":22,\"planlimitation_id\":6,\"limitation_title\":\"Profile Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"3\"},\"slug\":\"profile-limit\",\"status\":1,\"message\":null}]', 4, '3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `subscriptions` VALUES (5, 1, 4, '2025-09-12 00:00:00', '2025-09-19 00:00:00', 'active', 0, 5, NULL, 0, NULL, 5, 'Basic', 'basic', 'week', 1, 1, '[{\"id\":1,\"planlimitation_id\":1,\"limitation_title\":\"Video Cast\",\"limitation_value\":1,\"limit\":null,\"slug\":\"video-cast\",\"status\":1,\"message\":\"Cast videos to your TV with ease.\"},{\"id\":2,\"planlimitation_id\":2,\"limitation_title\":\"Ads\",\"limitation_value\":1,\"limit\":null,\"slug\":\"ads\",\"status\":1,\"message\":\"This plan includes ads.\"},{\"id\":3,\"planlimitation_id\":3,\"limitation_title\":\"Device Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"1\"},\"slug\":\"device-limit\",\"status\":1,\"message\":\"Stream on up to 1 devices simultaneously.\"},{\"id\":4,\"planlimitation_id\":4,\"limitation_title\":\"Download Status\",\"limitation_value\":1,\"limit\":{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":0,\"2K\":0,\"4K\":0,\"8K\":0},\"slug\":\"download-status\",\"status\":1,\"message\":\"Enjoy unlimited downloads with this plan.\"},{\"id\":17,\"planlimitation_id\":5,\"limitation_title\":\"Supported Device Type\",\"limitation_value\":1,\"limit\":{\"tablet\":\"0\",\"laptop\":\"0\",\"mobile\":\"1\"},\"slug\":\"supported-device-type\",\"status\":1,\"message\":null},{\"id\":18,\"planlimitation_id\":6,\"limitation_title\":\"Profile Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"2\"},\"slug\":\"profile-limit\",\"status\":1,\"message\":null}]', 2, 'test11', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `subscriptions` VALUES (6, 1, 10, '2025-07-25 00:00:00', '2025-08-01 00:00:00', 'inactive', 0, 5, NULL, 0, NULL, 5, 'Basic', 'basic', 'week', 1, 1, '[{\"id\":1,\"planlimitation_id\":1,\"limitation_title\":\"Video Cast\",\"limitation_value\":1,\"limit\":null,\"slug\":\"video-cast\",\"status\":1,\"message\":\"Cast videos to your TV with ease.\"},{\"id\":2,\"planlimitation_id\":2,\"limitation_title\":\"Ads\",\"limitation_value\":1,\"limit\":null,\"slug\":\"ads\",\"status\":1,\"message\":\"This plan includes ads.\"},{\"id\":3,\"planlimitation_id\":3,\"limitation_title\":\"Device Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"1\"},\"slug\":\"device-limit\",\"status\":1,\"message\":\"Stream on up to 1 devices simultaneously.\"},{\"id\":4,\"planlimitation_id\":4,\"limitation_title\":\"Download Status\",\"limitation_value\":1,\"limit\":{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":0,\"2K\":0,\"4K\":0,\"8K\":0},\"slug\":\"download-status\",\"status\":1,\"message\":\"Enjoy unlimited downloads with this plan.\"},{\"id\":17,\"planlimitation_id\":5,\"limitation_title\":\"Supported Device Type\",\"limitation_value\":1,\"limit\":{\"tablet\":\"0\",\"laptop\":\"0\",\"mobile\":\"1\"},\"slug\":\"supported-device-type\",\"status\":1,\"message\":null},{\"id\":18,\"planlimitation_id\":6,\"limitation_title\":\"Profile Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"2\"},\"slug\":\"profile-limit\",\"status\":1,\"message\":null}]', 7, '4', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `subscriptions` VALUES (7, 4, 8, '2024-08-30 00:00:00', '2025-08-30 00:00:00', 'active', 0, 80, NULL, 0, NULL, 80, 'Elite Plan', 'elite_plan', 'year', 1, 4, '[{\"id\":13,\"planlimitation_id\":1,\"limitation_title\":\"Video Cast\",\"limitation_value\":1,\"limit\":null,\"slug\":\"video-cast\",\"status\":1,\"message\":\"Cast videos to your TV with ease.\"},{\"id\":14,\"planlimitation_id\":2,\"limitation_title\":\"Ads\",\"limitation_value\":0,\"limit\":null,\"slug\":\"ads\",\"status\":1,\"message\":\"Ad-free streaming with this plan.\"},{\"id\":15,\"planlimitation_id\":3,\"limitation_title\":\"Device Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"8\"},\"slug\":\"device-limit\",\"status\":1,\"message\":\"Stream on up to 8 devices simultaneously.\"},{\"id\":16,\"planlimitation_id\":4,\"limitation_title\":\"Download Status\",\"limitation_value\":1,\"limit\":{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":1,\"2K\":1,\"4K\":1,\"8K\":1},\"slug\":\"download-status\",\"status\":1,\"message\":\"Enjoy unlimited downloads with this plan.\"},{\"id\":23,\"planlimitation_id\":5,\"limitation_title\":\"Supported Device Type\",\"limitation_value\":1,\"limit\":{\"tablet\":\"1\",\"laptop\":\"1\",\"mobile\":\"1\"},\"slug\":\"supported-device-type\",\"status\":1,\"message\":null},{\"id\":24,\"planlimitation_id\":6,\"limitation_title\":\"Profile Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"4\"},\"slug\":\"profile-limit\",\"status\":1,\"message\":null}]', 5, '4', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `subscriptions` VALUES (8, 4, 14, '2025-07-25 00:00:00', '2050-07-25 00:00:00', 'active', 0, 80, NULL, 0, NULL, 80, 'Elite Plan', 'elite_plan', 'year', 1, 4, '[{\"id\":13,\"planlimitation_id\":1,\"limitation_title\":\"Video Cast\",\"limitation_value\":1,\"limit\":null,\"slug\":\"video-cast\",\"status\":1,\"message\":\"Cast videos to your TV with ease.\"},{\"id\":14,\"planlimitation_id\":2,\"limitation_title\":\"Ads\",\"limitation_value\":0,\"limit\":null,\"slug\":\"ads\",\"status\":1,\"message\":\"Ad-free streaming with this plan.\"},{\"id\":15,\"planlimitation_id\":3,\"limitation_title\":\"Device Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"8\"},\"slug\":\"device-limit\",\"status\":1,\"message\":\"Stream on up to 8 devices simultaneously.\"},{\"id\":16,\"planlimitation_id\":4,\"limitation_title\":\"Download Status\",\"limitation_value\":1,\"limit\":{\"480p\":1,\"720p\":1,\"1080p\":1,\"1440p\":1,\"2K\":1,\"4K\":1,\"8K\":1},\"slug\":\"download-status\",\"status\":1,\"message\":\"Enjoy unlimited downloads with this plan.\"},{\"id\":23,\"planlimitation_id\":5,\"limitation_title\":\"Supported Device Type\",\"limitation_value\":1,\"limit\":{\"tablet\":\"1\",\"laptop\":\"1\",\"mobile\":\"1\"},\"slug\":\"supported-device-type\",\"status\":1,\"message\":null},{\"id\":24,\"planlimitation_id\":6,\"limitation_title\":\"Profile Limit\",\"limitation_value\":1,\"limit\":{\"value\":\"4\"},\"slug\":\"profile-limit\",\"status\":1,\"message\":null}]', 6, '4', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for subscriptions_transactions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions_transactions`;
CREATE TABLE `subscriptions_transactions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscriptions_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `amount` double NULL DEFAULT NULL,
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `other_transactions_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subscriptions_transactions
-- ----------------------------
INSERT INTO `subscriptions_transactions` VALUES (1, 1, 3, 50, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTz', NULL, NULL, 3, 3, NULL, NULL, '2024-07-15 09:33:46', '2024-07-15 09:33:46');
INSERT INTO `subscriptions_transactions` VALUES (2, 2, 4, 5, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTz', NULL, NULL, 4, 4, NULL, NULL, '2024-07-15 09:37:23', '2024-07-15 09:37:23');
INSERT INTO `subscriptions_transactions` VALUES (3, 3, 5, 20, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTz', NULL, NULL, 5, 5, NULL, NULL, '2024-07-15 09:39:02', '2024-07-15 09:39:02');
INSERT INTO `subscriptions_transactions` VALUES (4, 4, 6, 50, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTz', NULL, NULL, 6, 6, NULL, NULL, '2024-07-15 09:41:37', '2024-07-15 09:41:37');
INSERT INTO `subscriptions_transactions` VALUES (5, 5, 8, 80, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTz', NULL, NULL, 8, 8, NULL, NULL, '2024-07-15 09:44:11', '2024-07-15 09:44:11');
INSERT INTO `subscriptions_transactions` VALUES (6, 6, 9, 80, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTz', NULL, NULL, 9, 9, NULL, NULL, '2024-07-15 09:45:47', '2024-07-15 09:45:47');
INSERT INTO `subscriptions_transactions` VALUES (7, 7, 10, 5, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTz', NULL, NULL, 10, 10, NULL, NULL, '2024-07-15 09:46:34', '2024-07-15 09:46:34');
INSERT INTO `subscriptions_transactions` VALUES (8, 8, 14, 20, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTz', NULL, NULL, 14, 14, NULL, NULL, '2024-07-15 09:48:17', '2024-07-15 09:48:17');

-- ----------------------------
-- Table structure for taxes
-- ----------------------------
DROP TABLE IF EXISTS `taxes`;
CREATE TABLE `taxes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'percent' COMMENT 'fixed , percent',
  `value` double NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of taxes
-- ----------------------------
INSERT INTO `taxes` VALUES (1, 'GST', 'Percentage', 18, 1, 2, 2, NULL, '2024-10-09 12:30:27', '2024-10-09 12:30:27', NULL);
INSERT INTO `taxes` VALUES (2, 'CGST', 'Percentage', 9, 1, 2, 2, NULL, '2024-10-09 12:30:53', '2024-10-09 12:32:17', NULL);
INSERT INTO `taxes` VALUES (3, 'VAT', 'Percentage', 20, 1, 2, 2, NULL, '2024-10-09 12:34:57', '2024-10-09 12:34:57', NULL);

-- ----------------------------
-- Table structure for tv_login_sessions
-- ----------------------------
DROP TABLE IF EXISTS `tv_login_sessions`;
CREATE TABLE `tv_login_sessions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `session_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tv_login_sessions_session_id_unique`(`session_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tv_login_sessions
-- ----------------------------

-- ----------------------------
-- Table structure for user_coupon_redeem
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon_redeem`;
CREATE TABLE `user_coupon_redeem`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL,
  `user_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_coupon_redeem
-- ----------------------------

-- ----------------------------
-- Table structure for user_multi_profiles
-- ----------------------------
DROP TABLE IF EXISTS `user_multi_profiles`;
CREATE TABLE `user_multi_profiles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_child_profile` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_multi_profiles_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_multi_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_multi_profiles
-- ----------------------------
INSERT INTO `user_multi_profiles` VALUES (1, 1, 'Super Admin', 'http://fivefix.test/storage/avatars/d9knST52ld.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:56');
INSERT INTO `user_multi_profiles` VALUES (2, 2, 'Ivan Norris', 'http://fivefix.test/storage/avatars/JJ9rLkxZ7B.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:56');
INSERT INTO `user_multi_profiles` VALUES (3, 3, 'John Doe', 'http://fivefix.test/storage/avatars/4hhxDW0361.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:56');
INSERT INTO `user_multi_profiles` VALUES (4, 4, 'Tristan Erickson', 'http://fivefix.test/storage/avatars/ipkI8MsUG9.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:56');
INSERT INTO `user_multi_profiles` VALUES (5, 5, 'Felix Harris', 'http://fivefix.test/storage/avatars/CAnXQlgB3j.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:56');
INSERT INTO `user_multi_profiles` VALUES (6, 6, 'Harry Victoria', 'http://fivefix.test/storage/avatars/3mpt68T2lD.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:56');
INSERT INTO `user_multi_profiles` VALUES (7, 7, 'Jorge Perez', 'http://fivefix.test/storage/avatars/3sMvCrbbDI.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:56');
INSERT INTO `user_multi_profiles` VALUES (8, 8, 'Joy Hanry', 'http://fivefix.test/storage/avatars/SotWXvfale.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_multi_profiles` VALUES (9, 9, 'Deborah Thomas', 'http://fivefix.test/storage/avatars/NjOsGpBo68.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_multi_profiles` VALUES (10, 10, 'Katie Brown', 'http://fivefix.test/storage/avatars/aL7BnuGfwx.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_multi_profiles` VALUES (11, 11, 'Dorothy Erickson', 'http://fivefix.test/storage/avatars/awMvjVSVAt.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_multi_profiles` VALUES (12, 12, 'Lisa Lucas', 'http://fivefix.test/storage/avatars/hTCZI7thUc.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_multi_profiles` VALUES (13, 13, 'Tracy Jones', 'http://fivefix.test/storage/avatars/QUVEi8WliG.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_multi_profiles` VALUES (14, 14, 'Stella Green', 'http://fivefix.test/storage/avatars/dtyoBHieN7.png', 0, NULL, NULL, NULL, NULL, '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_multi_profiles` VALUES (15, 15, 'John', 'https://fiveflix.test/storage/avatars/Ivouuroixd.png', 0, NULL, NULL, NULL, NULL, '2026-02-18 16:34:24', '2026-02-18 16:34:24');
INSERT INTO `user_multi_profiles` VALUES (16, 16, 'John', 'https://fiveflix.test/storage/avatars/YYH4ZNLo9w.png', 0, NULL, NULL, NULL, NULL, '2026-03-12 03:47:50', '2026-03-12 03:47:50');

-- ----------------------------
-- Table structure for user_profiles
-- ----------------------------
DROP TABLE IF EXISTS `user_profiles`;
CREATE TABLE `user_profiles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `about_self` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expert` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `facebook_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `instagram_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `twitter_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dribbble_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_profiles
-- ----------------------------
INSERT INTO `user_profiles` VALUES (1, 'I am a passionate developer.', 'Web Development', 'https://facebook.com/user1', 'https://instagram.com/user1', 'https://twitter.com/user1', 'https://dribbble.com/user1', 1, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `user_profiles` VALUES (2, 'Love creating content and engaging with my audience.', 'Content Creation', 'https://facebook.com/user2', 'https://instagram.com/user2', 'https://twitter.com/user2', 'https://dribbble.com/user2', 2, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);
INSERT INTO `user_profiles` VALUES (3, 'Tech enthusiast and blogger.', 'Tech Blogging', 'https://facebook.com/user3', 'https://instagram.com/user3', 'https://twitter.com/user3', 'https://dribbble.com/user3', 3, '2025-08-24 11:19:57', '2025-08-24 11:19:57', NULL);

-- ----------------------------
-- Table structure for user_providers
-- ----------------------------
DROP TABLE IF EXISTS `user_providers`;
CREATE TABLE `user_providers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_providers
-- ----------------------------

-- ----------------------------
-- Table structure for user_reminder
-- ----------------------------
DROP TABLE IF EXISTS `user_reminder`;
CREATE TABLE `user_reminder`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entertainment_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `profile_id` int NULL DEFAULT NULL,
  `release_date` date NULL DEFAULT NULL,
  `is_remind` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_reminder
-- ----------------------------

-- ----------------------------
-- Table structure for user_search_histories
-- ----------------------------
DROP TABLE IF EXISTS `user_search_histories`;
CREATE TABLE `user_search_histories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `profile_id` bigint UNSIGNED NULL DEFAULT NULL,
  `search_query` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `search_id` bigint UNSIGNED NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_search_histories
-- ----------------------------
INSERT INTO `user_search_histories` VALUES (8, 3, 3, 'Echoes of Valor', 6, 'video', '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_search_histories` VALUES (9, 3, 3, 'Warrior\'s Dilemma', 11, 'video', '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_search_histories` VALUES (10, 3, 3, 'School Hacks & Fun DIY Crafts', 15, 'video', '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_search_histories` VALUES (11, 4, 4, 'Motel of Nightmares', 21, 'video', '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_search_histories` VALUES (12, 4, 4, 'Mango Mousse Delight', 24, 'video', '2025-08-24 11:19:57', '2025-08-24 11:19:57');
INSERT INTO `user_search_histories` VALUES (13, 1, 1, 'Richard King', 30, 'castcrew', '2025-09-07 01:10:32', '2025-09-07 01:10:32');

-- ----------------------------
-- Table structure for user_watch_histories
-- ----------------------------
DROP TABLE IF EXISTS `user_watch_histories`;
CREATE TABLE `user_watch_histories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entertainment_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `profile_id` int NULL DEFAULT NULL,
  `entertainment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_watch_histories
-- ----------------------------
INSERT INTO `user_watch_histories` VALUES (5, 15, 4, 4, 'video', 4, 4, NULL, NULL, NULL, NULL);
INSERT INTO `user_watch_histories` VALUES (6, 10, 4, 4, 'video', 4, 4, NULL, NULL, NULL, NULL);
INSERT INTO `user_watch_histories` VALUES (7, 5, 3, 3, 'video', 3, 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_watch_histories` VALUES (10, 8, 3, 3, 'video', 3, 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_watch_histories` VALUES (11, 18, 4, 4, 'video', 4, 4, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `login_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_banned` tinyint NOT NULL DEFAULT 0,
  `is_subscribe` tinyint NOT NULL DEFAULT 0,
  `status` tinyint NOT NULL DEFAULT 1,
  `last_notification_seen` timestamp NULL DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pin` smallint NULL DEFAULT NULL,
  `otp` smallint NULL DEFAULT NULL,
  `is_parental_lock_enable` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE,
  INDEX `users_deleted_at_index`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, NULL, 'Super', 'Admin', 'admin@streamit.com', '+12123567890', NULL, 'super_admin.png', 'female', '1991-04-13', '2025-08-24 11:19:55', '$2y$10$UINYRvl1xfWwDYOeEWNg3OiavxOUtTZa3mRQzuB1Zuo7ExgNo.Aai', 0, 0, 1, NULL, NULL, 'admin', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:56', NULL);
INSERT INTO `users` VALUES (2, NULL, 'Ivan', 'Norris', 'demo@streamit.com', '+12124567899', NULL, 'demo_admin.png', 'male', '2010-05-07', '2025-08-24 11:19:55', '$2y$10$i3v.e6fyVVcxka1QVXfHnOjXrxRcwwt.bCE0rXlC0s9I7.4Xzc.S.', 0, 0, 1, NULL, NULL, 'demo_admin', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:56', NULL);
INSERT INTO `users` VALUES (3, NULL, 'John', 'Doe', 'john@gmail.com', '+911234567890', 'otp', 'john.png', 'male', '1990-02-13', '2025-08-24 11:19:55', '$2y$10$vsa2AYzFDQKhgyBm1X9Pt.4dAmMETMRyBcFWCF54NmNc5yW7Bo5nu', 0, 1, 1, NULL, '101 Pine Lane Miami, FL 33101 United States', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:56', NULL);
INSERT INTO `users` VALUES (4, NULL, 'Tristan', 'Erickson', 'tristan@gmail.com', '+447911123456', 'otp', 'tristan.png', 'male', '1992-05-21', '2025-08-24 11:19:55', '$2y$10$ChQVAx0FC.2ujqziQ9PJyO0BMyTjV5zfU/ZazWgq/6OridCCuSjgS', 0, 1, 1, NULL, '46 Oxford Road London, W1D 1BS United Kingdom', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:56', NULL);
INSERT INTO `users` VALUES (5, NULL, 'Felix', 'Harris', 'felix@gmail.com', '+12124567890', 'otp', 'felix.png', 'male', '1996-02-02', '2025-08-24 11:19:55', '$2y$10$qyk4nb95KPuxxH/D4SiSou4r8b/ZFO61dyMjgZUyaNlq9N9j/Xi/W', 0, 1, 1, NULL, '3 Queen Street Sydney, NSW 2000 Australia', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:56', NULL);
INSERT INTO `users` VALUES (6, NULL, 'Harry', 'Victoria', 'harry@gmail.com', '+447911123456', 'otp', 'harry.png', 'male', '1987-07-08', '2025-08-24 11:19:55', '$2y$10$zfGsGMfI/yu/Yeah/60WgOc.sy/K/6aJGM1.QdSCSuWj8q1er0ge.', 0, 1, 1, NULL, '11 Rue de Rivoli Paris, 75001 France', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:56', NULL);
INSERT INTO `users` VALUES (7, NULL, 'Jorge', 'Perez', 'jorge@gmail.com', '+496912345678', 'otp', 'jorge.png', 'male', '1991-01-01', '2025-08-24 11:19:55', '$2y$10$CVSIlInbDiLtFW7M7Qrtfu8iA1tMLimsvRslMT3IXlRnWmFqWnxx2', 0, 0, 1, NULL, '20 Kurfürstendamm Berlin, 10719 Germany', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:56', NULL);
INSERT INTO `users` VALUES (8, NULL, 'Joy', 'Hanry', 'joy@gmail.com', '+81312345678', 'otp', 'joy.png', 'male', '1993-07-10', '2025-08-24 11:19:55', '$2y$10$oQYcolsZbHATEvrzolF0r.A7OXPJiH.LNEePS/Cz7M2Oc3Lux96CC', 0, 1, 1, NULL, '3 Shibuya Street Tokyo, 150-0002 Japan', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:57', NULL);
INSERT INTO `users` VALUES (9, NULL, 'Deborah', 'Thomas', 'deborah@gmail.com', '+81312355678', 'otp', 'deborah.png', 'female', '1992-03-26', '2025-08-24 11:19:55', '$2y$10$MCd3Jl8PlfC1lk78pl4cP.GAnHlo4urbXdR0APxxi2JSEi7UpekYu', 0, 1, 1, NULL, '7 Maple Avenue Toronto, ON M5H 2N2 Canada', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:57', NULL);
INSERT INTO `users` VALUES (10, NULL, 'Katie', 'Brown', 'katie@gmail.com', '+12124467890', 'otp', 'katie.png', 'female', '1994-08-16', '2025-08-24 11:19:55', '$2y$10$9rtQJNTamp.iijZ97xjFGu4s7z4yI6ph1Ju.JXyLM7qTLfBSj/VW.', 0, 1, 1, NULL, '14 Gran Vía Madrid, 28013 Spain', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:57', NULL);
INSERT INTO `users` VALUES (11, NULL, 'Dorothy', 'Erickson', 'dorothy@gmail.com', '+12124577890', 'otp', 'dorothy.png', 'female', '1989-10-10', '2025-08-24 11:19:55', '$2y$10$oFm5c3md/7JHMZtdhUsVA.YsGw7MtXdja2jyGUy37q0CIwQnYHmYO', 0, 0, 1, NULL, '50 Paulista Avenue São Paulo, SP 01310-100 Brazil', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:55', '2025-08-24 11:19:57', NULL);
INSERT INTO `users` VALUES (12, NULL, 'Lisa', 'Lucas', 'lisa@gmail.com', '+12124567790', 'otp', 'lisa.png', 'female', '1993-08-03', '2025-08-24 11:19:56', '$2y$10$GQiCZcMI7qh8mM6QXG7JOuhB0vD/FSTK6qvI8kE5.qoyOeu45eOxW', 0, 0, 1, NULL, '6 Sheikh Zayed Road Dubai, 00000 United Arab Emirates', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:57', NULL);
INSERT INTO `users` VALUES (13, NULL, 'Tracy', 'Jones', 'tracy@gmail.com', '+913465656789', 'otp', 'tracy.png', 'female', '1990-11-19', '2025-08-24 11:19:56', '$2y$10$tMwTAwf01ORZcho4Z35KWu/ewP7BqX/e0jOkYlKXW2p4xrgQWOHBS', 0, 0, 1, NULL, '71 Orchard Road Singapore, 238838 Singapore', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:56', '2025-08-24 11:19:57', NULL);
INSERT INTO `users` VALUES (14, NULL, 'Stella', 'Green', 'stella@gmail.com', '+913465756789', 'otp', 'stella.png', 'female', '1991-12-18', '2025-08-24 11:19:56', '$2y$10$xoPU9jto08YzU7ZVIcwOC.yEZTHymvUEytFYkzGH6UWpOrdpvfHKG', 0, 1, 1, NULL, '15 Redwood Way Phoenix, AZ 85001 United States', 'user', NULL, NULL, 0, NULL, '2025-08-24 11:19:56', '2025-12-07 16:08:32', NULL);
INSERT INTO `users` VALUES (15, 'johndoe', 'John', 'Smith', 'john@example.com', '01800000000', NULL, NULL, 'male', '1995-01-15', NULL, '$2y$10$ICzOK0Q7XhEr7LYeQ48gdOsyOaBKei/.3IvS8N9qjlj.YFgEbWD36', 0, 0, 1, NULL, 'Chittagong, Bangladesh', 'user', NULL, NULL, 0, NULL, '2026-02-18 16:34:22', '2026-03-12 04:28:00', NULL);
INSERT INTO `users` VALUES (16, 'johndoe', 'John', 'Doe', 'john2@example.com', '01700000000', NULL, NULL, NULL, '1995-01-15', NULL, '$2y$10$KV3S6jjMek0ojuFkWm2Y2eH.piQOfhQuaU053bBzRAbzqnw8GI3vm', 0, 0, 1, NULL, 'Dhaka, Bangladesh', 'user', NULL, NULL, 0, NULL, '2026-03-12 03:47:50', '2026-03-12 03:47:50', NULL);

-- ----------------------------
-- Table structure for vast_ads_setting
-- ----------------------------
DROP TABLE IF EXISTS `vast_ads_setting`;
CREATE TABLE `vast_ads_setting`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `target_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `target_selection` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `enable_skip` tinyint(1) NOT NULL DEFAULT 0,
  `skip_after` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `frequency` int NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vast_ads_setting_status_index`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vast_ads_setting
-- ----------------------------
INSERT INTO `vast_ads_setting` VALUES (5, 'BigSale', 'pre-roll', 'https://basil79.github.io/vast-sample-tags/pg/vast.xml', NULL, 'video', '[1,2,3,4,5,17,26]', 0, NULL, NULL, '2025-08-24', '2026-08-24', 0, 1, '2025-07-25 06:11:03', '2025-07-25 06:11:03', NULL);
INSERT INTO `vast_ads_setting` VALUES (6, 'MovieTicket', 'mid-roll', 'https://basil79.github.io/vast-sample-tags/pg/vast.xml', NULL, 'video', '[1,2,3,4,5,17,26]', 0, NULL, NULL, '2025-08-24', '2026-08-24', 0, 1, '2025-07-25 06:12:26', '2025-07-25 06:12:26', NULL);
INSERT INTO `vast_ads_setting` VALUES (7, 'EpisodePromo', 'post-roll', 'https://basil79.github.io/vast-sample-tags/pg/vast.xml', NULL, 'video', '[1,2,3,4,5,17,26]', 0, NULL, NULL, '2025-08-24', '2026-08-24', 0, 1, '2025-07-25 06:13:38', '2025-07-25 06:13:38', NULL);
INSERT INTO `vast_ads_setting` VALUES (8, 'ServicePromo', 'overlay', 'https://raw.githubusercontent.com/InteractiveAdvertisingBureau/VAST_Samples/master/VAST%203.0%20Samples/Inline_Non-Linear_Tag-test.xml', NULL, 'video', '[1,2,3,4,5,17,26]', 0, NULL, NULL, '2025-08-24', '2026-08-24', 0, 1, '2025-07-25 06:17:56', '2025-07-25 06:17:56', NULL);

-- ----------------------------
-- Table structure for video_download_mappings
-- ----------------------------
DROP TABLE IF EXISTS `video_download_mappings`;
CREATE TABLE `video_download_mappings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video_download_mappings
-- ----------------------------

-- ----------------------------
-- Table structure for video_stream_content_mapping
-- ----------------------------
DROP TABLE IF EXISTS `video_stream_content_mapping`;
CREATE TABLE `video_stream_content_mapping`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video_stream_content_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `poster_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `trailer_url_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trailer_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `access` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `plan_id` bigint UNSIGNED NULL DEFAULT NULL,
  `IMDb_rating` int NULL DEFAULT NULL,
  `content_rating` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `release_date` date NULL DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `short_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `enable_quality` tinyint(1) NOT NULL DEFAULT 0,
  `video_upload_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `video_url_input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `download_status` tinyint(1) NOT NULL DEFAULT 0,
  `download_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `download_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `enable_download_quality` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `poster_tv_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` decimal(8, 2) NULL DEFAULT NULL,
  `purchase_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `access_duration` int NULL DEFAULT NULL,
  `discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `available_for` int NULL DEFAULT NULL,
  `enable_subtitle` tinyint(1) NOT NULL DEFAULT 0,
  `subtitle_language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_default_subtitle` tinyint(1) NOT NULL DEFAULT 0,
  `subtitle_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_keywords` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `seo_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_site_verification` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `canonical_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `videos_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES (1, 'Tumse Pyar - Lofi Love Mix', 'tumse_pyar_lofi_love_mix.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, NULL, '2020-02-05', 0, 'Experience the serene and soulful melodies of \"Tumse Pyar - Lofi Love Mix,\" the latest love song perfect for moments of reflection and romance. 🎶❤️', 'Dive into the tranquil vibes of \"Tumse Pyar - Lofi Love Mix,\" a soothing and heartfelt love song that blends gentle rhythms with emotional depth. This latest release is crafted for those cherished moments of intimacy and reflection, offering a perfect backdrop for love and nostalgia. Whether you\'re unwinding after a long day or sharing a quiet evening with someone special, \"Tumse Pyar\" provides a harmonious escape into the world of lofi beats and tender lyrics. 🎶❤️', 0, 'YouTube', 'https://youtu.be/kXHiIxx2atA?si=BMzFthwqI5t7Ve8j', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:31', '2025-08-24 11:20:31', NULL, 'tumse_pyar_lofi_love_mix.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (2, 'Seize Your Life - Powerful Motivational Speech', 'seize_your_life.png', 'YouTube', NULL, 'paid', NULL, 1, NULL, NULL, NULL, '2021-06-21', 0, 'Seize Your Life is a compelling motivational speech that inspires you to take control and live your life to the fullest. 🚀🌟', 'In Seize Your Life - Powerful Motivational Speech, discover the keys to unlocking your potential and embracing every moment with purpose and passion. This uplifting speech is packed with powerful insights and practical advice that will motivate you to overcome obstacles, chase your dreams, and seize every opportunity that life presents. Whether you\'re looking for a boost in your personal or professional life, \"Seize Your Life\" provides the inspiration you need to take action and make the most of your journey. 🚀🌟', 0, 'YouTube', 'https://youtu.be/NGtv92rU0Hg?si=ZllzFTnemBDE73L8', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:31', '2025-08-24 11:20:31', NULL, 'seize_your_life.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (3, 'Serenity of Nature', 'serenity_of_nature.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, NULL, '2022-03-04', 0, 'Serenity of Nature is a breathtaking short video capturing the tranquil beauty of the natural world. 🌿🌅', 'Serenity of Nature offers a mesmerizing journey through some of the most beautiful and serene landscapes on Earth. This short video captures the essence of nature\'s tranquility, from cascading waterfalls and lush forests to serene sunsets and majestic mountains. With stunning visuals and soothing sounds, Serenity of Nature provides a peaceful escape, allowing viewers to connect with the beauty and calm of the natural world. Perfect for relaxation and mindfulness, this video is a visual treat for nature lovers and anyone seeking a moment of serenity. 🌿🌅🌊', 0, 'YouTube', 'https://youtu.be/668nUCeBHyY?si=SPQ7yT4NVQp0QoW-', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:31', '2025-08-24 11:20:31', NULL, 'serenity_of_nature.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (4, 'Run For Your Life', 'run_for_your_life.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, NULL, '2023-01-23', 0, 'A heart-pounding thriller where survival is the only option. 🏃‍♂️💥', 'Run For Your Life is a heart-pounding thriller that follows the protagonist as they navigate a relentless pursuit, where survival is the only option. With every twist and turn, the stakes get higher, and the chase becomes more intense. This gripping tale of endurance and courage will keep you on the edge of your seat from start to finish. 🏃‍♂️💥', 0, 'YouTube', 'https://youtu.be/79Sd4GtOXuI?si=kgtBwn0Riw_TcvdX', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:31', '2025-08-24 11:20:31', NULL, 'run_for_your_life.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (5, 'Cityscape Escapade', 'cityscape_escapade.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, NULL, '2024-04-18', 1, 'Embark on a thrilling journey through the urban jungle, filled with surprises and new encounters. 🏙️🌟', 'Cityscape Escapade takes viewers on an exhilarating adventure through the bustling urban landscape. Follow a spirited protagonist as they navigate crowded streets, discover hidden gems, and forge unexpected friendships along the way. This vibrant video captures the essence of exploration and discovery in the heart of the city, promising excitement and heartwarming moments for all who embark on this journey. 🏙️🌟', 0, 'YouTube', 'https://youtu.be/mYfJxlgR2jw?si=uQgarqR0VJvdfUd5', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:31', '2025-08-24 11:20:31', NULL, 'cityscape_escapade.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (6, 'Echoes of Valor', 'echoes_of_valor.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, '01:20', '2024-04-19', 0, 'Echoes of Valor depicts the intense and emotional journey of a sniper and his spotter during the Indo-Pak War, facing moral conflicts in their pursuit of the enemy. 🎬🏅', 'Echoes of Valor brings to life the harrowing experiences of two Indian Army soldiers—a sniper and his spotter—during the Indo-Pak War. The film captures their inner turmoil as they confront their foes and wrestle with the ethical implications of their mission. A powerful thriller with a stirring musical score, it offers a profound reflection on the nature of conflict and bravery. 🎖️🌟', 0, 'YouTube', 'https://youtu.be/JEKCMP3w9zs?si=psaIC0wKC3akDOqp', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:31', '2025-08-24 11:20:31', NULL, 'echoes_of_valor.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (7, 'Victory Vibes', 'victory_vibes.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '00:50', '2024-04-20', 0, 'Get inspired by quick, uplifting videos celebrating athletes\' perseverance, grit, and determination in overcoming challenges. 🌟🏅', 'Victory Vibes brings you bite-sized, motivational videos showcasing the incredible stories of athletes who triumph against the odds. Whether it’s the underdog story, the road to recovery, or pushing past limits, these short clips will inspire you to chase your dreams. Watch, feel the adrenaline, and fuel your passion for greatness! 💪🏆', 0, 'YouTube', 'https://youtu.be/seSCvuejudM?si=v7SdVilWIM1Niqid', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:31', '2025-08-24 11:20:32', NULL, 'victory_vibes.png', 10.00, 'rental', 5, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (8, 'Midnight Thrills', 'midnight_thrills.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '00:45', '2024-04-21', 0, 'Dive into spine-chilling suspense with brief, gripping thriller shorts that keep you on the edge of your seat. 🌙🔍', 'Midnight Thrills offers a collection of intense, suspenseful short films that will captivate and thrill you in just a few minutes. Each video is a meticulously crafted suspense thriller that delivers unexpected twists, dark mysteries, and nail-biting moments. Perfect for when you crave a quick dose of excitement and intrigue. Get ready for a thrilling experience under the cover of night! 🎬🕵️‍♂️', 0, 'YouTube', 'https://youtu.be/VHenrR4ledY?si=PCHvpjq4t9zpaJim', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'midnight_thrills.png', 10.00, 'rental', 5, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (9, 'Hearts Entwined', 'hearts_entwined.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '01:20', '2024-04-24', 0, 'Experience the magic of romance with heartwarming short videos that capture the essence of love and connection. 💖🎥', 'Hearts Entwined presents a series of romantic short films that delve into the many facets of love and relationships. Featuring captivating stories and touching moments, each video is designed to make you feel the joy, passion, and tenderness of romance. Whether it\'s a sweet love story or a heartfelt confession, these shorts will leave you inspired and in love with the idea of finding that special connection. Let each film whisk you away on a romantic journey! 🌹✨', 0, 'YouTube', 'https://youtu.be/22l6w8n9iCc?si=Gr7MTCfEs9xf6pvz', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'hearts_entwined.png', 40.00, 'onetime', NULL, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (10, 'Gnomeo\'s Love Stories', 'gnomeos_love_stories.png', 'YouTube', NULL, 'paid', NULL, 1, NULL, NULL, '00:50', '2024-04-26', 0, 'Explore charming, whimsical tales of love and adventure with garden gnomes in this delightful collection of short romantic videos. 🌹', 'Gnomeo\'s Love Stories brings you enchanting short videos featuring the adorable garden gnomes Gnomeo and Juliet. Follow their heartwarming adventures and romantic escapades as they navigate the ups and downs of love amidst whimsical lawn decorations, quirky neighbors, and playful antics. Each video is a perfect blend of romance and fun, capturing the essence of finding love in the most unexpected places. Immerse yourself in these miniature love stories and experience a world where love always wins, no matter the obstacles. 🌟❤️', 0, 'YouTube', 'https://youtu.be/9ucSt-naGZ0?si=fo-r7wQuJ6Exi1RX', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'gnomeos_love_stories.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (11, 'Warrior\'s Dilemma', 'warriors_dilemma.png', 'YouTube', NULL, 'paid', NULL, 1, NULL, NULL, '00:20', '2024-04-30', 0, 'A brave team of young warriors embarks on an epic quest to save their world from dark forces in this action-packed animated adventure. 💥🛡️🔥', '\"Warrior\'s Dilemma\" presents a compelling story of two soldiers in the Indo-Pak War—one a sniper, the other his spotter—who face profound moral challenges as they hunt their enemies. The film is a gripping blend of thriller and drama, enhanced by a powerful soundtrack that underscores the film\'s exploration of courage, morality, and the costs of war. 🎖️🎵', 0, 'YouTube', 'https://youtu.be/Q23gKyHWjjg?si=wK6AqYlE9P9-bdXS', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'warriors_dilemma.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (12, 'Everyday Comedy Gems', 'everyday_comedy_gems.png', 'YouTube', NULL, 'paid', NULL, 2, NULL, NULL, '00:50', '2024-05-01', 0, 'Dive into hilariously mundane moments transformed into remarkable comedy in these short videos. 😂🎬', '\"Everyday Comedy Gems\" presents a collection of short videos that turn the most ordinary situations into extraordinary laughs. Watch as everyday mishaps, small surprises, and routine moments become the heart of whimsical comedy. From unremarkable beginnings to uproarious endings, each video captures the essence of finding humor in the mundane. Enjoy a fresh take on life\'s little quirks and laugh along with characters who prove that comedy can be found in the most unexpected places. Get ready for a series of delightful, laugh-out-loud moments that bring a touch of magic to the ordinary. 🌟🤣🎉', 0, 'YouTube', 'https://youtu.be/sxCWB47ZCLQ?si=jCVwFRmmQ2lLyc1_', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'everyday_comedy_gems.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (13, 'Exorcism Trials', 'exorcism_trials.png', 'YouTube', NULL, 'paid', NULL, 2, NULL, NULL, '00:45', '2024-05-14', 0, 'Follow Sister Ann\'s journey as she battles demonic forces and uncovers dark secrets in these chilling short videos. 😈📽️', '\"Exorcism Trials\" delves into the spine-tingling world of spiritual warfare with a series of gripping short videos. Watch as Sister Ann, a pioneering female exorcist, faces the ultimate test of faith and courage. Trained in a newly reopened exorcism school, Ann confronts her own past demons and engages in intense battles with malevolent forces. Each video intensifies the suspense as she confronts the sinister entity tormenting a young girl and discovers a deeper, more personal connection to the evil she faces. Experience the tension, fear, and spiritual struggle in these hauntingly immersive clips. 🌌😱🕯️', 0, 'YouTube', 'https://youtu.be/zlpfcKffgDA?si=hABQwDuaOho53ayQ', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'exorcism_trials.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (14, 'Deep Sleep Music for Dogs', 'deep_sleep_music_for_dogs.png', 'YouTube', NULL, 'paid', NULL, 2, NULL, NULL, '01:20', '2024-05-25', 1, 'Relax your furry friend with calming music that helps them drift into deep sleep within minutes. 🐕💤', '\"Deep Sleep Music for Dogs\" is the ultimate sound therapy for your pets, designed to help them fall asleep in just 5 minutes! Whether it\'s a playful puppy who needs extra rest or an adult dog who enjoys a quiet nap, this soothing music will relax them instantly. Dogs naturally need plenty of sleep, with adult dogs sleeping 12–14 hours per day and puppies up to 18 hours or more. Turn on this calming track, watch how they respond, and ensure they get the peaceful rest they deserve. 🐶🎵💤', 0, 'YouTube', 'https://www.youtube.com/live/hD6DzC585bw?si=7XpEHjOV2fFNYFoX', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'deep_sleep_music_for_dogs.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (15, 'School Hacks & Fun DIY Crafts', 'school_hacks_fun_diy_crafts.png', 'YouTube', NULL, 'paid', NULL, 2, NULL, NULL, '00:50', '2024-06-08', 1, 'Discover amazing school hacks and easy DIY crafts that will make your school life easier and more fun! ✂️📚', '\"School Hacks & Fun DIY Crafts\" is the ultimate guide to transforming your school experience with creative tips and projects. Whether you need to stay organized, personalize your supplies, or just have fun with unique crafts, this video covers it all. From clever study tips to imaginative DIY projects, it’s designed to make your school days more enjoyable and efficient. Grab your supplies and get ready to craft your way to a better school experience! 🎒✏️📐', 0, 'YouTube', 'https://youtu.be/yG0W82PGAcQ?si=a2PSqhYHCP5ooUdI', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'school_hacks_fun_diy_crafts.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (16, 'Yoga for Beginners: Start Here', 'yoga_for_beginners_start_here.png', 'YouTube', NULL, 'paid', NULL, 3, NULL, NULL, '00:40', '2024-06-17', 0, 'Join this 30-minute beginner yoga session to improve flexibility, build strength, and calm your mind. Perfect for those new to yoga or wanting a mindful pace! 🧘‍♂️✨', '\"Yoga for Beginners: Start Here\" is the perfect introduction to a sustainable and enjoyable yoga practice. In this 30-minute session, we\'ll focus on breath control, foundational poses, and proper form to boost flexibility, build strength, and regulate your nervous system. Designed for beginners or those seeking a slower, mindful approach, this class helps you connect with your breath and body. Yoga is for everyone, and the hardest part is just showing up—repeat this session regularly and watch your body transform! 🌱🧘‍♂️💪', 0, 'YouTube', 'https://youtu.be/AB3Y-4a3ZrU?si=ATa2_GU_Xgesw50D', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'yoga_for_beginners_start_here.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (17, 'The Madness Within', 'the_madness_within.png', 'YouTube', NULL, 'paid', NULL, 3, NULL, NULL, '00:30', '2024-06-23', 0, 'Arthur Fleck, institutionalized at Arkham, faces inner turmoil while discovering love and music. 🎭🖤', '\"Joker: The Madness Within\" finds Arthur Fleck trapped in Arkham Asylum, struggling to reconcile his identity as Joker. Awaiting trial, Arthur’s mental chaos intertwines with moments of unexpected beauty—true love and music that awakens something deep inside him. This short film delves into the complexity of madness, love, and creativity within Gotham\'s most infamous villain. A haunting blend of emotion and turmoil awaits. 🎵🃏🎶', 0, 'YouTube', 'https://youtu.be/_OKAwz2MsJs?si=3MJoVxwaxLSLvBXT', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'the_madness_within.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (18, 'Big Style on a Small Budget', 'big_style_on_a_small_budget.png', 'YouTube', NULL, 'paid', NULL, 3, NULL, NULL, '00:20', '2024-06-25', 0, 'Transform your space with easy, affordable home makeover ideas that add character and style—perfect for renters! 🏡✨', 'Discover thoughtful and affordable room makeover tips that can completely transform your home, whether you\'re a renter or a homeowner. From small weekend projects to clever design ideas, these simple upgrades will make a big impact on the character and style of your living space. If you\'re feeling stuck, financially strained, or short on time for big DIY projects, this video offers creative solutions to elevate your home without breaking the bank. Get ready to be inspired and make your home feel thoughtfully designed! 🛋️🖼️💡', 0, 'YouTube', 'https://youtu.be/xOiXbP5QIrM?si=5re4hT1YH8n2fPv6', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'big_style_on_a_small_budget.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (19, 'Ultimate Kitchen Organization', 'ultimate_kitchen_organization.png', 'YouTube', NULL, 'paid', NULL, 4, NULL, NULL, '01:20', '2024-06-30', 0, 'Discover budget-friendly kitchen organization tips that will transform your space! Clean, restock, and organize for a more efficient and satisfying kitchen experience. 🧼🍲🛒', '\"Ultimate Kitchen Organization\" is your go-to guide for transforming your kitchen into a clean and efficient space on a budget. This video is packed with satisfying cleaning routines, restocking ideas, and clever organizing hacks that will help you declutter and streamline your kitchen. From pantry organization to refrigerator restocking, you\'ll learn practical tips that make your kitchen more functional without breaking the bank. Watch how these simple yet effective ideas can elevate your kitchen and make cooking an enjoyable, stress-free experience! 🍳🧺🌿', 0, 'YouTube', 'https://youtu.be/ZYmV65FYmYY?si=4-eWG9WbXQBmOhDk', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'ultimate_kitchen_organization.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (20, 'Life Changing Fitness Habits - Daily Healthy Tips', 'life_changing_fitness_habits_daily_healthy_tips.png', 'YouTube', NULL, 'paid', NULL, 4, NULL, NULL, '00:45', '2024-07-03', 0, 'Discover practical and achievable fitness tips to enhance your daily health routine! Start making well-being a priority and share these life-changing habits with friends! 🌿💪', '\"Life-Changing Fitness Habits\" is here to help you become the best version of yourself with simple, scientifically-backed tips that are easy to follow. Our goal is to promote good health and well-being, making the world a healthier place one habit at a time! From fitness hacks to daily healthy tips, these five powerful habits will revolutionize your approach to fitness and wellness. Whether you’ve heard them before or they surprise you, implementing these tips will help you live a balanced and healthier life. 🌟🏋️‍♀️🌿 Get ready to transform your routine and inspire those around you!', 0, 'YouTube', 'https://youtu.be/YNsuneGBsMY?si=AARfxbPatjTITtba', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'life_changing_fitness_habits_daily_healthy_tips.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (21, 'Motel of Nightmares', 'motel_of_nightmares.png', 'YouTube', NULL, 'paid', NULL, 4, NULL, NULL, '01:20', '2024-07-06', 0, 'Dive into a series of chilling short videos where a woman fights to escape a hellish motel haunted by a relentless monster. 🏚️😨', '\"Motel of Nightmares\" unfolds a terrifying tale through a collection of gripping short videos. Watch as an exhausted woman, trapped in a decrepit motel, battles her worst fears. Each video delves deeper into her nightmarish reality, where every creak and shadow hints at the monstrous terror stalking her. From eerie encounters and broken glass to a fateful confrontation in her car, these videos capture the essence of a horror that blurs the line between nightmare and reality. Experience the tension and dread as the woman faces a relentless, hellish monster in a race for survival. 🌌👻🔪', 0, 'YouTube', 'https://youtu.be/x2c39v5NMj4?si=B-j6ex_SNm3Y03g1', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'motel_of_nightmares.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (22, 'Flapping Origami Bat Fun', 'flapping_origami_bat_fun.png', 'YouTube', NULL, 'paid', NULL, 4, NULL, NULL, '00:50', '2024-07-10', 1, 'Create an origami bat that flaps its wings! Perfect for Halloween décor or playful scares. 🦇🎃', '\"Flapping Origami Bat Fun\" is your guide to making a spooky, flapping origami bat that’s easy to craft and perfect for Halloween. Learn how to create this fun paper toy that flaps its wings with a simple click. Ideal for Halloween decorations or playful pranks, these bats can also be used to make garlands or window dressings. Get crafty and add a touch of spooky fun to your home! 🦇🖤✂️', 0, 'YouTube', 'https://youtu.be/kBJGchWe6uU?si=TA0UtKGFhSqWY8lj', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'flapping_origami_bat_fun.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (23, 'Nordic Forest Calm: Music for Relaxation', 'nordic_forest_calm_music_for_relaxation.png', 'YouTube', NULL, 'paid', NULL, 4, NULL, NULL, '01:20', '2024-07-16', 1, 'Unwind with soothing Nordic forest ambience and relaxing music for stress relief, calm, and focus. 🌲🎶', '\"Nordic Forest Calm: Music for Relaxation\" combines calming nature sounds of rustling leaves and distant bird songs with tranquil music to help you relax, focus, and relieve stress. Perfect for studying, meditating, or unwinding after a long day, this video creates a peaceful ambience that transports you to a serene Nordic forest. Let the soothing sounds guide you to a state of calm and relaxation. 🌿🎧🍃', 0, 'YouTube', 'https://youtu.be/3eP0s8sg1n8?si=PuIU-x43XiR7XyzQ', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'nordic_forest_calm_music_for_relaxation.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (24, 'Mango Mousse Delight', 'mango_mousse_delight.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '00:50', '2024-07-27', 0, 'Indulge in the deliciousness of this 3-layer Mango Mousse Cake! Learn how to make this refreshing dessert and impress your taste buds. 😋🍰🥭', '\"Mango Mousse Delight\" is a step-by-step guide to making a scrumptious 3-layer Mango Mousse Cake. Learn how to prepare a soft sponge base, layer rich and creamy mousse, and create a dessert that’s as delightful as it is refreshing. This easy-to-follow recipe is perfect for bakers of all levels and is sure to impress your guests. Make your next occasion extra special with this delightful mango mousse cake! 🍰🥭✨😋', 0, 'YouTube', 'https://youtu.be/4TUgTat4lg8?si=fC1r5EVueVXYV9uq', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'mango_mousse_delight.png', 10.00, 'rental', 5, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (25, 'The Power of Words | This Story Will Change Your Life', 'the_power_of_words_this_story_will_change_your_life.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '00:20', '2024-08-01', 0, 'Discover the profound impact of words! This life-changing story will teach you how to use your words wisely and inspire positive change in yourself and others. 💬🌟', '\"The Power of Words\" is a transformative story that will open your eyes to the incredible influence words hold. 📖✨ Learn how to use your words wisely to inspire, uplift, and make a lasting difference in your life and the lives of those around you. Whether you\'re communicating with loved ones or strangers, this story reveals the importance of choosing your words carefully and positively. 💬🌟 Tune in, reflect, and embrace the change that wise communication can bring!', 0, 'YouTube', 'https://youtu.be/Sp503K6iPCg?si=VKSZrB7Bfam2fWeV', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'the_power_of_words_this_story_will_change_your_life.png', 40.00, 'onetime', NULL, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (26, 'Healthy Homemade Diet Plan | Effective Weight Loss at Home', 'healthy_homemade_diet_plan_effective_weight_loss_at_home.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '01:20', '2024-08-06', 0, 'Discover a healthy and effective diet plan with homemade foods! 🥗🍽️ Perfect for weight loss and maintaining wellness from the comfort of your home. 🏠💪', '\"Diet Plan with Homemade Foods\" offers a comprehensive guide to a nutritious and effective weight loss meal plan using ingredients you have at home. 🍎🥑 From breakfast ideas to dinner recipes, learn how to prepare balanced meals that support your weight loss goals while keeping your taste buds satisfied. 🌟💪 This video will provide you with practical tips, delicious recipes, and meal prep strategies to help you stay on track and achieve your health objectives. Cook up a healthier you with these easy and effective homemade food options!', 0, 'YouTube', 'https://youtu.be/_2tgrajiXG0?si=7XxWoBwTsBunnNx2', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'healthy_homemade_diet_plan_effective_weight_loss_at_home.png', 40.00, 'onetime', NULL, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (27, 'Beautiful Rangoli Designs', 'beautiful_rangoli_designs.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '00:45', '2024-08-09', 0, 'Immerse yourself in the art of Rangoli with this satisfying video showcasing stunning designs! 🎨🌼 Perfect for inspiration and relaxation. 🌟', '\"Satisfying Rangoli Designs\" features a collection of beautiful and intricate Rangoli patterns that are both visually stunning and satisfying to watch. 🌸✨ Discover creative designs and traditional techniques as we guide you through the process of creating vibrant and elegant Rangoli art. Whether you\'re a seasoned artist or a beginner looking for inspiration, this video will provide you with a soothing and artistic experience. 🖼️💫 Perfect for enhancing your festive decor or simply enjoying the beauty of this traditional craft. Get ready to be inspired and amazed by the beauty of Rangoli!', 0, 'YouTube', 'https://youtu.be/rZeu5iz_N7k?si=_ePcaoBZqLCGhGmC', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'beautiful_rangoli_designs.png', 10.00, 'rental', 5, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (28, 'Catcalls: The Haunting', 'catcalls_the_haunting.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '00:50', '2024-08-13', 0, 'Experience chilling short videos where street harassment takes a horrifying twist as predators become the prey in a night of terror. 👻🔪', '\"Catcalls: The Haunting\" brings a disturbing twist to street harassment through a series of gripping short videos. Follow a man cruising late at night who encounters two seemingly innocent girls. However, his attempt to get a thrill by flashing them turns into a nightmare when he discovers they are on their own hunt. This series explores the unsettling themes of harassment and power dynamics, shifting the predator-prey relationship in a spine-chilling narrative. The videos showcase a fictional horror where the tables are turned, revealing the true horror of becoming the hunted. Dive into a world where safety is an illusion and danger lurks in every corner.', 0, 'YouTube', 'https://youtu.be/4jytFeNxsdo?si=euMe_ms5UtU42fRM', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'catcalls_the_haunting.png', 10.00, 'rental', 5, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (29, 'Ultimate Kitchen Organization Hacks', 'ultimate_kitchen_organization_hacks.png', 'YouTube', NULL, 'pay-per-view', NULL, NULL, NULL, NULL, '00:45', '2024-08-18', 0, 'Maximize your small kitchen space with these 10 smart organization hacks for a clutter-free and efficient cooking area. 🍽️✨', '\"Ultimate Kitchen Organization Hacks\" provides practical and space-saving solutions to optimize even the smallest kitchens. From clever storage ideas to easy DIY fixes, these tips will help you create a clutter-free, efficient kitchen where everything has its place. Whether you\'re dealing with tight cabinets or limited counter space, these hacks will make your cooking area more functional and stylish. Perfect for anyone looking to simplify and enhance their kitchen setup!', 0, 'YouTube', 'https://youtu.be/ZYmV65FYmYY?si=EOk5cwoafiTxn1qA', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'ultimate_kitchen_organization_hacks.png', 40.00, 'onetime', NULL, '10', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (30, 'Morning Bliss Routine', 'morning_bliss_routine.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, '01:50', '2024-08-25', 0, 'A holiday morning routine designed to help you wake up early and start your day with positivity and calm. 🌅⛅️', '\"6 AM Morning Bliss Routine\" follows a former office worker in her 30s as she shares her peaceful and energizing holiday morning routine. This uplifting routine will inspire you to wake up early and create a pleasant start to your week. From gentle stretches to a refreshing breakfast, every step is designed to help you feel balanced, productive, and excited about your day. Perfect for anyone looking for an easy yet impactful morning routine!', 0, 'YouTube', 'https://youtu.be/otpa3LqonSs?si=DmohFhBQF8eClmdG', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'morning_bliss_routine.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (31, 'Genius Home Hacks for Effortless Living', 'genius_home_hacks_for_effortless_living.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, '01:20', '2024-09-04', 0, 'Transform your daily routine with these genius home hacks! From cleaning and organizing to cooking and DIY, life just got easier. 😎✨', '\"Genius Home Hacks for Effortless Living\" is your ultimate guide to making life easier at home! This video showcases a collection of mind-blowing tips and tricks that simplify everything from cleaning and organizing to cooking and DIY projects. Discover simple yet effective solutions that will save you time and energy, whether you’re tidying up your space or preparing a quick meal. Make everyday tasks a breeze with these creative hacks! Don’t forget to hit that like button, leave a comment with your favorite hack, and subscribe for more amazing content. 🎉🏡💡', 0, 'YouTube', 'https://youtu.be/Gfn_lik3eE8?si=k-2Cp3R_2dRxam95', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'genius_home_hacks_for_effortless_living.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (32, 'Become Your Best Self', 'become_your_best_self.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, '00:50', '2024-09-07', 0, 'Get inspired by powerful speeches! 🎯 Hear the words that will motivate you to focus on self-growth and becoming better than your previous self, not others. 💪✨', '\"Life-Changing Speeches You Need to Hear TODAY\" brings you the best motivational messages that will push you to strive for personal growth and self-improvement. 🌟 The goal is not to compete with others, but to surpass the person you were yesterday. 🌱 These speeches will ignite a spark in you to focus on inner strength, resilience, and the journey to becoming the best version of yourself. 🎤💪 Watch, reflect, and take the first step toward positive change today!', 0, 'YouTube', 'https://youtu.be/DfY7rRQXf3M?si=a3CDJaUDnfz1o1Rd', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'become_your_best_self.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (33, 'Potato Perfection', 'potato_perfection.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, '00:20', '2024-09-08', 0, 'Discover amazing potato recipes, from crispy French fries to savory potato sticks! Elevate your snack game with these easy and delicious ideas. 🍟🤩', '\"Potato Perfection\" is your ultimate guide to mastering all things potato! This video features a collection of mouth-watering recipes including French fries, crispy potato chips, and tasty potato sticks. Whether you’re craving a quick snack or looking to impress with creative cooking hacks, these potato dishes will surely satisfy. Learn step-by-step tips and tricks to make the perfect potato-based treats every time. Elevate your kitchen skills and enjoy the versatile world of potatoes! Don’t forget to like, share, and subscribe for more delicious recipes! 🥔🍴👩‍🍳', 0, 'YouTube', 'https://youtu.be/rbHIj9kMBYY?si=L1bbxumrVg1utbKF', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'potato_perfection.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (34, 'Creative 3D Pen Crafts', 'creative_3d_pen_crafts.png', 'YouTube', NULL, 'free', NULL, NULL, NULL, NULL, '00:45', '2024-09-10', 1, 'Discover cool DIY ideas, repair tips, and unique jewelry designs using a 3D pen! 🖊️✨', '\"Creative 3D Pen Crafts\" brings you innovative homemade ideas and practical repair tips using a 3D pen. From crafting intricate DIY jewelry to fixing everyday items, this video showcases versatile techniques and inspiring designs. Learn how to create stunning, personalized pieces and useful tools with just your 3D pen. Perfect for crafters of all skill levels, this guide offers step-by-step instructions and creative inspiration to take your 3D pen projects to the next level. Watch, learn, and get crafting with fun and functional 3D designs! 🖍️💡🎨', 0, 'YouTube', 'https://youtu.be/QVMOq6b7H6Y?si=tO3WX3zUIze96MTb', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'creative_3d_pen_crafts.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (35, 'Apartment 75: The Midnight Visitor', 'apartment_75_the_midnight_visitor.png', 'YouTube', NULL, 'paid', NULL, 3, NULL, NULL, '01:10', '2024-09-17', 0, 'In Apartment 75, one night becomes a nightmare when an unwelcome guest arrives, turning calm into terror. 🏚️👻', '\"Apartment 75: The Midnight Visitor\" presents a series of eerie short videos that unravel a night of horror within the confines of a seemingly ordinary apartment. When an unexpected guest arrives, the tranquility of the night is shattered, leading to spine-chilling encounters and escalating terror. Experience the growing sense of dread as the apartment transforms into a haunted realm where every creak and shadow signals impending doom. This collection of videos delves into the fear of the unknown, showcasing how one uninvited visitor can turn a peaceful night into a nightmare. 🕯️🔍😱', 0, 'YouTube', 'https://youtu.be/km3XTmIDeUA?si=ak3GXgPP7NX5D0p1', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'apartment_75_the_midnight_visitor.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `videos` VALUES (36, 'Food Prep Mastery', 'food_prep_mastery.png', 'YouTube', NULL, 'paid', NULL, 4, NULL, NULL, '00:45', '2024-09-22', 0, 'Master food preparation with smart tips on how to cut and store your ingredients like a pro! Maximize freshness and make meal prep a breeze. 🍎🍗🔪', '\"Food Prep Mastery\" is your ultimate guide to smart food preparation! Learn essential cutting techniques for fruits, vegetables, and meats, while discovering expert tips on how to store your ingredients to keep them fresh and flavorful for longer. Whether you\'re dicing onions, slicing meats, or storing leafy greens, this video will teach you how to streamline your meal prep and improve your kitchen skills. Perfect for both seasoned chefs and beginners, these tricks will help you take your culinary game to the next level. Don\'t miss out—watch, learn, and enjoy easier, fresher meals! 🥦🍅👨‍🍳', 0, 'YouTube', 'https://youtu.be/y1ZXkDDvhC4?si=MDRzE3VkpD9HJSKT', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-24 11:20:32', '2025-08-24 11:20:32', NULL, 'food_prep_mastery.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for watchlists
-- ----------------------------
DROP TABLE IF EXISTS `watchlists`;
CREATE TABLE `watchlists`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entertainment_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `profile_id` int NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `watchlists_id_deleted_at_index`(`id` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of watchlists
-- ----------------------------

-- ----------------------------
-- Table structure for webhook_calls
-- ----------------------------
DROP TABLE IF EXISTS `webhook_calls`;
CREATE TABLE `webhook_calls`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` json NULL,
  `payload` json NULL,
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of webhook_calls
-- ----------------------------

-- ----------------------------
-- Table structure for worlds
-- ----------------------------
DROP TABLE IF EXISTS `worlds`;
CREATE TABLE `worlds`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state_id` int NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `updated_by` int UNSIGNED NULL DEFAULT NULL,
  `deleted_by` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of worlds
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
