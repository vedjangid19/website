-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2020 at 03:09 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thecodingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first post', '376357864', 'this is first post add', '2020-07-04 16:34:08', 'firstpost@gmail.com'),
(2, 'iuljhef', '8764876', 'jkhsdjidshkljdsvhkljvdskljdsv', NULL, 'ukldvjh@gmail.com'),
(3, 'meraname', '5623763476', 'this is mera name post', '2020-07-04 18:15:03', 'meraemail@gmail.com'),
(4, 'ved', '9587657077', 'this is ved blog\r\nif you like this please hit like button', '2020-07-05 11:07:34', 'vedjangid@gmail.com'),
(5, 'shobhit', '543524', 'a blog by the sbhobhit mittala\r\ndo you luke tbnhr eblogs', '2020-07-05 11:52:35', 'sbhobhit@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tag_line` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tag_line`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Book Store', 'desktop application for storing details books', 'book-store', 'Bulk emails\r\n\r\nUsually in a web application you will be sending one or two emails per request. In certain situations you might want to be able to send perhaps dozens or hundreds of emails in a single batch - probably in an external process such as a command-line script or cronjob.\r\n\r\nIn that case you do things slightly differently:', 'about-bg.jpg', '2020-07-08 12:45:44'),
(2, 'Alarm Set Remainder', 'set alarm and notify...', 'alarm-set', '\r\nVelocity is defined as a vector measurement of the rate and direction of motion. Put simply, velocity is the speed at which something moves in one direction. The speed of a car traveling north on a major freeway and the speed a rocket launching into space can both be measured using velocity.\r\n\r\nAs you might have guessed, the scalar (absolute value) magnitude of the velocity vector is the speed of motion. In calculus terms, velocity is the first derivative of position with respect to time. You can calculate velocity by using a simple formula that includes rate, distance, and time.\r\n', 'about-bg.jpg', '2020-07-08 12:47:06'),
(3, 'Snake Game', 'basic  2D snake game ....', 'snake-game', 'Speed1, velocity1, and acceleration are all related to each other, though they represent different measurements. Be careful not to confuse these values with each other.\r\n\r\n    Speed, according to its technical definition, is a scalar quantity that indicates the rate of motion distance per time. Its units are length and time. Put another way, speed is a measure of distance traveled over a certain amount of time. Speed is often described simply as the distance traveled per unit of time. It is how fast an object is moving. \r\n    Velocity is a vector quantity that indicates displacement, time, and direction. Unlike speed, velocity measures displacement, a vector quantity indicating the difference between an object\'s final and initial positions. Speed measures distance, a scalar quantity that measures the total length of an object\'s path.\r\n    Acceleration is defined as a vector quantity that indicates the rate of change of velocity. It has dimensions of length and time over time. Acceleration is often referred to as \"speeding up\", but it really measures changes in velocity. Acceleration can be experienced every day in a vehicle. You step on the accelerator and the car speeds up, increasing its velocity.', 'about-bg.jpg', '2020-07-08 12:48:02'),
(4, 'Music Player And Internet Radio', 'music player and internet radio...', 'music-player', '\r\nTo understand velocity, take a look at a sample problem: a physics student drops an egg off an extremely tall building. What is the egg\'s velocity after 2.60 seconds?\r\n\r\nThe hardest part about solving for velocity in a physics problem such as this is selecting the right equation and plugging in the right variables. In this case, two equations should be used to solve the problem: one to find the height of the building or distance the egg travels and one to find final velocity.\r\n\r\nStart with the following equation for distance to find out how tall the building was:\r\n', 'about-bg.jpg', '2020-07-08 12:49:16'),
(5, 'Desktop AI Assitent', 'commanding by you voice', 'ai-assitent', 'Starting from a known point, the mariner with a compass could draw a line on the chart to represent a vessel’s course, then mark off the distance given by the log. The calculation of a new position was known as dead reckoning. In addition to errors in the compass and in the log, dead reckoning suffered from errors due to the drift of the water. When ocean currents were first marked on charts of the open sea and when tidal streams appeared on coastal charts, navigators could make allowance for drift. Fortunately, the currents were seldom fast and, on long voyages, often tended to cancel each other out.', 'about-bg.jpg', '2020-07-08 12:50:54'),
(6, 'House price Prediction', 'machine learning project', 'house-prediction', 'kjhdxklcvjnolkdjskljnvc\r\njkdvnhkljsvhjkv \r\njkhefwkojrgikr', 'post-bg.jpg', '2020-07-08 12:51:54'),
(7, 'Calculator', 'calculating opreations...', 'calcu-lator', 'gfdhjjghg', 'post-bg.jpg', '2020-07-08 12:53:00'),
(8, 'Super Market Data Analysis', 'supermarket data analysis using python...', 'super-market', 'analysis super market data', 'post-bg.jpg', '2020-07-08 12:55:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
