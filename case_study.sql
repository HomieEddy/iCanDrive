-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2015 at 07:20 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `case_study`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_answers`
--

CREATE TABLE `tbl_answers` (
  `answer_id` int(3) NOT NULL,
  `answer_content` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_availability`
--

CREATE TABLE `tbl_availability` (
  `avail_id` int(1) NOT NULL,
  `avail_desc` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `category_id` int(1) NOT NULL,
  `category_desc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_desc`) VALUES
(1, 'Student'),
(2, 'Teacher'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courses`
--

CREATE TABLE `tbl_courses` (
  `course_id` int(5) NOT NULL,
  `course_name` int(15) NOT NULL,
  `teacher_id` int(5) NOT NULL,
  `class_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enrollment`
--

CREATE TABLE `tbl_enrollment` (
  `enroll_id` int(5) NOT NULL,
  `course_id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `grade_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grades`
--

CREATE TABLE `tbl_grades` (
  `grade_id` int(1) NOT NULL,
  `grade_desc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_items`
--

CREATE TABLE `tbl_items` (
  `item_id` int(5) NOT NULL,
  `item_name` varchar(10) NOT NULL,
  `item_desc` varchar(15) NOT NULL,
  `qoh` int(3) NOT NULL,
  `retail_price` decimal(6,2) NOT NULL,
  `img_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manufacturers`
--

CREATE TABLE `tbl_manufacturers` (
  `manufacturer_id` int(3) NOT NULL,
  `manuf_name` varchar(25) NOT NULL,
  `manuf_desc` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages`
--

CREATE TABLE `tbl_messages` (
  `message_id` int(7) NOT NULL,
  `sender_id` int(5) NOT NULL,
  `receiver_id` int(5) NOT NULL,
  `message_title` varchar(25) NOT NULL,
  `message_content` varchar(255) NOT NULL,
  `date_sent` date NOT NULL,
  `receiver_viewed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_messages`
--

INSERT INTO `tbl_messages` (`message_id`, `sender_id`, `receiver_id`, `message_title`, `message_content`, `date_sent`, `receiver_viewed`) VALUES
(1, 2, 1, 'Welcome', 'Welcome to our website. Have Fun.', '2015-11-20', 'N'),
(2, 3, 1, 'Advices', 'We know you are new here. If you need anything. I will be glad to assist you. ', '2015-11-22', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(7) NOT NULL,
  `buyer_id` int(5) NOT NULL,
  `date_created` date NOT NULL,
  `ship_address` varchar(50) NOT NULL,
  `bill_address` varchar(50) NOT NULL,
  `paymethod_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_method`
--

CREATE TABLE `tbl_payment_method` (
  `paymethod_id` int(1) NOT NULL,
  `method_desc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questions`
--

CREATE TABLE `tbl_questions` (
  `question_id` int(3) NOT NULL,
  `question_content` varchar(255) NOT NULL,
  `hint` varchar(255) NOT NULL,
  `rightAnswer_id` int(3) NOT NULL,
  `choice_a` int(3) NOT NULL,
  `choice_b` int(3) NOT NULL,
  `choice_c` int(3) NOT NULL,
  `choice_d` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quiz_history`
--

CREATE TABLE `tbl_quiz_history` (
  `history_id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `date_taken` date NOT NULL,
  `grade` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rental`
--

CREATE TABLE `tbl_rental` (
  `rental_id` int(7) NOT NULL,
  `vehicule_id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `teacher_id` int(5) NOT NULL,
  `rental_date` date NOT NULL,
  `status_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shopping_cart`
--

CREATE TABLE `tbl_shopping_cart` (
  `cart_id` int(5) NOT NULL,
  `item_id` int(5) NOT NULL,
  `quantity` int(3) NOT NULL,
  `order_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `status_id` int(1) NOT NULL,
  `status_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(5) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `user_password` varchar(15) NOT NULL,
  `f_name` varchar(20) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `zip` varchar(8) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `city` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `country` varchar(20) NOT NULL,
  `category_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_name`, `user_password`, `f_name`, `l_name`, `gender`, `dob`, `address`, `zip`, `phone`, `city`, `province`, `country`, `category_id`) VALUES
(1, 'test', '1234', 'Mc Eddy', 'Jeune', 'M', '1995-07-08', '1-251, Henri Bourassa Est', 'H2B 1V3', '438-494-4963', 'Montreal', 'QC', 'Canada', 1),
(2, 'hello', '1111', 'Random', 'Guy', 'M', '2000-11-03', '1, Some Street', 'H2B 1Z8', '514-410-1010', 'Montreal', 'QC', 'Canada', 1),
(3, 'master', '0000', 'Funny', 'Dude', 'M', '1976-05-25', '98, Party Time', 'H4M 7U3', '514-897-3617', 'Montreal', 'QC', 'Canada', 2),
(4, 'admin', '2015', 'Master', 'Yoda', 'M', '1900-01-01', '1, Star Wars', '1A2 B3C', '514-410-1010', 'Montreal', 'QC', 'Canada', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicules`
--

CREATE TABLE `tbl_vehicules` (
  `vehicule_id` int(5) NOT NULL,
  `manufacturer_id` int(3) NOT NULL,
  `vehicule_model` varchar(15) NOT NULL,
  `license_plate` varchar(6) NOT NULL,
  `vehicule_desc` varchar(255) NOT NULL,
  `avail_id` int(1) NOT NULL,
  `class_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicule_classes`
--

CREATE TABLE `tbl_vehicule_classes` (
  `class_id` int(3) NOT NULL,
  `class_name` varchar(10) NOT NULL,
  `class_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_answers`
--
ALTER TABLE `tbl_answers`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `tbl_availability`
--
ALTER TABLE `tbl_availability`
  ADD PRIMARY KEY (`avail_id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_name` (`course_name`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `tbl_enrollment`
--
ALTER TABLE `tbl_enrollment`
  ADD PRIMARY KEY (`enroll_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `grade_id` (`grade_id`);

--
-- Indexes for table `tbl_grades`
--
ALTER TABLE `tbl_grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_name` (`item_name`);

--
-- Indexes for table `tbl_manufacturers`
--
ALTER TABLE `tbl_manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`),
  ADD UNIQUE KEY `manuf_name` (`manuf_name`);

--
-- Indexes for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `paymethod_id` (`paymethod_id`);

--
-- Indexes for table `tbl_payment_method`
--
ALTER TABLE `tbl_payment_method`
  ADD PRIMARY KEY (`paymethod_id`),
  ADD UNIQUE KEY `method_desc` (`method_desc`);

--
-- Indexes for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `rightAnswer_id` (`rightAnswer_id`),
  ADD KEY `choice_a` (`choice_a`),
  ADD KEY `choice_b` (`choice_b`),
  ADD KEY `choice_c` (`choice_c`),
  ADD KEY `choice_d` (`choice_d`);

--
-- Indexes for table `tbl_quiz_history`
--
ALTER TABLE `tbl_quiz_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `tbl_rental`
--
ALTER TABLE `tbl_rental`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `vehicule_id` (`vehicule_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tbl_vehicules`
--
ALTER TABLE `tbl_vehicules`
  ADD PRIMARY KEY (`vehicule_id`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD KEY `avail_id` (`avail_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`);

--
-- Indexes for table `tbl_vehicule_classes`
--
ALTER TABLE `tbl_vehicule_classes`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `class_name` (`class_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD CONSTRAINT `fk_course_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `fk_courses_class` FOREIGN KEY (`class_id`) REFERENCES `tbl_vehicule_classes` (`class_id`);

--
-- Constraints for table `tbl_enrollment`
--
ALTER TABLE `tbl_enrollment`
  ADD CONSTRAINT `fk_enroll_course` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`),
  ADD CONSTRAINT `fk_enroll_grade` FOREIGN KEY (`grade_id`) REFERENCES `tbl_grades` (`grade_id`),
  ADD CONSTRAINT `fk_enroll_student` FOREIGN KEY (`student_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD CONSTRAINT `fk_messages_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `fk_messages_sender` FOREIGN KEY (`sender_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `fk_orders_buyer` FOREIGN KEY (`buyer_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `fk_orders_payment` FOREIGN KEY (`paymethod_id`) REFERENCES `tbl_payment_method` (`paymethod_id`);

--
-- Constraints for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD CONSTRAINT `fk_questions_choice_a` FOREIGN KEY (`choice_a`) REFERENCES `tbl_answers` (`answer_id`),
  ADD CONSTRAINT `fk_questions_choice_b` FOREIGN KEY (`choice_b`) REFERENCES `tbl_answers` (`answer_id`),
  ADD CONSTRAINT `fk_questions_choice_c` FOREIGN KEY (`choice_c`) REFERENCES `tbl_answers` (`answer_id`),
  ADD CONSTRAINT `fk_questions_choice_d` FOREIGN KEY (`choice_d`) REFERENCES `tbl_answers` (`answer_id`),
  ADD CONSTRAINT `fk_questions_rightAnswer` FOREIGN KEY (`rightAnswer_id`) REFERENCES `tbl_answers` (`answer_id`);

--
-- Constraints for table `tbl_quiz_history`
--
ALTER TABLE `tbl_quiz_history`
  ADD CONSTRAINT `fk_quizHitsory_student` FOREIGN KEY (`student_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_rental`
--
ALTER TABLE `tbl_rental`
  ADD CONSTRAINT `fk_rental_car` FOREIGN KEY (`vehicule_id`) REFERENCES `tbl_vehicules` (`vehicule_id`),
  ADD CONSTRAINT `fk_rental_status` FOREIGN KEY (`status_id`) REFERENCES `tbl_status` (`status_id`),
  ADD CONSTRAINT `fk_rental_student` FOREIGN KEY (`student_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `fk_rental_teacher` FOREIGN KEY (`student_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
  ADD CONSTRAINT `fk_shopCart_item` FOREIGN KEY (`item_id`) REFERENCES `tbl_items` (`item_id`),
  ADD CONSTRAINT `fk_shopCart_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`order_id`);

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `fk_users_category` FOREIGN KEY (`category_id`) REFERENCES `tbl_categories` (`category_id`);

--
-- Constraints for table `tbl_vehicules`
--
ALTER TABLE `tbl_vehicules`
  ADD CONSTRAINT `fk_vehicules_avail` FOREIGN KEY (`avail_id`) REFERENCES `tbl_availability` (`avail_id`),
  ADD CONSTRAINT `fk_vehicules_class` FOREIGN KEY (`class_id`) REFERENCES `tbl_vehicule_classes` (`class_id`),
  ADD CONSTRAINT `fk_vehicules_manuf` FOREIGN KEY (`manufacturer_id`) REFERENCES `tbl_manufacturers` (`manufacturer_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
