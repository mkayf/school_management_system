/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : school_management_system

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 07/08/2025 17:59:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for classrooms
-- ----------------------------
DROP TABLE IF EXISTS `classrooms`;
CREATE TABLE `classrooms`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classrooms
-- ----------------------------
INSERT INTO `classrooms` VALUES (1, 'Class 6', 'A', '2025-08-07 17:36:45', '2025-08-07 17:36:45');
INSERT INTO `classrooms` VALUES (2, 'Class 6', 'B', '2025-08-07 17:36:45', '2025-08-07 17:36:45');
INSERT INTO `classrooms` VALUES (3, 'Class 7', 'A', '2025-08-07 17:36:45', '2025-08-07 17:36:45');
INSERT INTO `classrooms` VALUES (4, 'Class 7', 'B', '2025-08-07 17:36:45', '2025-08-07 17:36:45');
INSERT INTO `classrooms` VALUES (5, 'Class 8', 'A', '2025-08-07 17:36:45', '2025-08-07 17:36:45');
INSERT INTO `classrooms` VALUES (6, 'Class 9', 'A', '2025-08-07 17:36:45', '2025-08-07 17:36:45');
INSERT INTO `classrooms` VALUES (7, 'Class 9', 'Commerce', '2025-08-07 17:36:45', '2025-08-07 17:36:45');
INSERT INTO `classrooms` VALUES (8, 'Class 10', 'A', '2025-08-07 17:36:45', '2025-08-07 17:36:45');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int(11) NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2025_08_07_111905_create_classrooms_table', 2);
INSERT INTO `migrations` VALUES (5, '2025_08_07_112312_create_students_table', 3);
INSERT INTO `migrations` VALUES (6, '2025_08_07_113216_create_profiles_table', 4);
INSERT INTO `migrations` VALUES (7, '2025_08_07_113858_create_subjects_table', 5);
INSERT INTO `migrations` VALUES (8, '2025_08_07_114249_create_student_subject_table', 6);
INSERT INTO `migrations` VALUES (9, '2025_08_07_120500_create_personal_access_tokens_table', 7);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE,
  INDEX `personal_access_tokens_expires_at_index`(`expires_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `profiles_student_id_foreign`(`student_id`) USING BTREE,
  CONSTRAINT `profiles_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profiles
-- ----------------------------
INSERT INTO `profiles` VALUES (1, 1, 'Lahore', '2009-01-15', '03001234501', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (2, 2, 'Karachi', '2009-03-22', '03001234502', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (3, 3, 'Islamabad', '2009-05-10', '03001234503', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (4, 4, 'Faisalabad', '2009-07-08', '03001234504', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (5, 5, 'Rawalpindi', '2008-09-18', '03001234505', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (6, 6, 'Multan', '2008-11-01', '03001234506', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (7, 7, 'Hyderabad', '2008-12-12', '03001234507', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (8, 8, 'Peshawar', '2008-02-05', '03001234508', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (9, 9, 'Sialkot', '2007-06-21', '03001234509', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (10, 10, 'Gujranwala', '2007-08-30', '03001234510', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (11, 11, 'Quetta', '2006-04-11', '03001234511', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (12, 12, 'Bahawalpur', '2006-07-19', '03001234512', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (13, 13, 'Abbottabad', '2006-10-01', '03001234513', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (14, 14, 'Sargodha', '2006-12-25', '03001234514', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (15, 15, 'Okara', '2005-05-05', '03001234515', '2025-08-07 17:57:16', '2025-08-07 17:57:16');
INSERT INTO `profiles` VALUES (16, 16, 'Jhelum', '2005-09-09', '03001234516', '2025-08-07 17:57:16', '2025-08-07 17:57:16');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for student_subject
-- ----------------------------
DROP TABLE IF EXISTS `student_subject`;
CREATE TABLE `student_subject`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_subject_student_id_foreign`(`student_id`) USING BTREE,
  INDEX `student_subject_subject_id_foreign`(`subject_id`) USING BTREE,
  CONSTRAINT `student_subject_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_subject
-- ----------------------------

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `students_classroom_id_foreign`(`classroom_id`) USING BTREE,
  CONSTRAINT `students_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, 'Ali Raza', 'ali6a@example.com', 1, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (2, 'Sara Khan', 'sara6a@example.com', 1, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (3, 'Bilal Ahmed', 'bilal6b@example.com', 2, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (4, 'Hina Sheikh', 'hina6b@example.com', 2, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (5, 'Usman Tariq', 'usman7a@example.com', 3, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (6, 'Nimra Malik', 'nimra7a@example.com', 3, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (7, 'Junaid Akram', 'junaid7b@example.com', 4, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (8, 'Ayesha Iqbal', 'ayesha7b@example.com', 4, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (9, 'Farhan Qureshi', 'farhan8a@example.com', 5, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (10, 'Mehwish Ali', 'mehwish8a@example.com', 5, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (11, 'Sami Ullah', 'sami9sci@example.com', 6, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (12, 'Fariha Zain', 'fariha9sci@example.com', 6, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (13, 'Hassan Raza', 'hassan9com@example.com', 7, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (14, 'Laiba Asif', 'laiba9com@example.com', 7, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (15, 'Zaid Khan', 'zaid10a@example.com', 8, '2025-08-07 17:41:32', '2025-08-07 17:41:32');
INSERT INTO `students` VALUES (16, 'Rida Fatima', 'rida10a@example.com', 8, '2025-08-07 17:41:32', '2025-08-07 17:41:32');

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subjects
-- ----------------------------
INSERT INTO `subjects` VALUES (1, 'Mathematics', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (2, 'English', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (3, 'Physics', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (4, 'Chemistry', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (5, 'Biology', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (6, 'Computer Science', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (7, 'Urdu', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (8, 'Islamiat', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (9, 'Pakistan Studies', '2025-08-07 17:58:50', '2025-08-07 17:58:50');
INSERT INTO `subjects` VALUES (10, 'General Science', '2025-08-07 17:58:50', '2025-08-07 17:58:50');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
