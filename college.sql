-- College Management System

CREATE DATABASE IF NOT EXISTS `college_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `college_management`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

-- Drop tables if they exist
DROP TABLE IF EXISTS `department`;
DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `instructor`;
DROP TABLE IF EXISTS `student_course`;

-- Table 1: Department
CREATE TABLE `department` (
  `dept_id` INT AUTO_INCREMENT NOT NULL,
  `dept_name` VARCHAR(100) NOT NULL,
  `location` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
);

-- Table 2: Student
CREATE TABLE `student` (
  `student_id` INT AUTO_INCREMENT NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `dob` DATE DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `phone_number` VARCHAR(15) DEFAULT NULL,
  `enrollment_date` DATE DEFAULT CURRENT_DATE,
  `dept_id` INT DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE SET NULL
);

-- Table 3: Course
CREATE TABLE `course` (
  `course_id` INT AUTO_INCREMENT NOT NULL,
  `course_name` VARCHAR(100) NOT NULL,
  `credits` INT NOT NULL,
  `dept_id` INT DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE SET NULL
);

-- Table 4: Instructor
CREATE TABLE `instructor` (
  `instructor_id` INT AUTO_INCREMENT NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `phone_number` VARCHAR(15) DEFAULT NULL,
  `hire_date` DATE DEFAULT CURRENT_DATE,
  `dept_id` INT DEFAULT NULL,
  PRIMARY KEY (`instructor_id`),
  FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE SET NULL
);

-- Table 5: Student_Course (Many-to-Many relationship)
CREATE TABLE `student_course` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `grade` CHAR(2) DEFAULT NULL,
  PRIMARY KEY (`student_id`, `course_id`),
  FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
  FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
);
