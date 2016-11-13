-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2016 at 07:17 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hlaptop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `user_id`, `count`, `date_added`) VALUES
(1, 1, 1, 2, '2016-10-26 01:55:30'),
(19, 2, 1, 1, '2016-10-26 01:49:44'),
(20, 9, 1, 1, '2016-10-26 01:49:53'),
(21, 2, 2, 1, '2016-10-26 01:55:49'),
(22, 6, 2, 1, '2016-10-26 01:55:53'),
(23, 12, 2, 1, '2016-10-26 01:55:58'),
(24, 10, 2, 1, '2016-10-26 01:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id_1` int(11) NOT NULL,
  `user_id_2` int(11) DEFAULT NULL,
  `product_id_1` int(11) DEFAULT NULL,
  `product_id_2` int(11) DEFAULT NULL,
  `new_data` varchar(200) DEFAULT NULL,
  `original_data` varchar(200) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `type_id`, `user_id_1`, `user_id_2`, `product_id_1`, `product_id_2`, `new_data`, `original_data`, `count`, `date_created`) VALUES
(18, 6, 6, 1, NULL, NULL, NULL, NULL, NULL, '2016-11-13 06:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `type`) VALUES
(1, 'follow'),
(2, 'edit_product'),
(3, 'add_product'),
(4, 'checkout'),
(5, 'delete_product'),
(6, 'unfollow');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `follower` int(11) NOT NULL,
  `followee` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `follower`, `followee`, `date_created`) VALUES
(1, 2, 1, '2016-11-05 23:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `firstName` varchar(400) NOT NULL,
  `lastName` varchar(400) NOT NULL,
  `address` varchar(600) NOT NULL,
  `city` varchar(500) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `creditcard` varchar(100) NOT NULL,
  `cvv` int(11) NOT NULL,
  `expiration` varchar(200) NOT NULL,
  `items` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `firstName`, `lastName`, `address`, `city`, `state`, `country`, `zipcode`, `phone`, `creditcard`, `cvv`, `expiration`, `items`) VALUES
(40, 'carter', 'tat', '123 virginia tech', 'blacksburg', 'virginia', 'usa', 23060, '804300184', '28319832197', 233, '10/28', 'Lenovo Yoga 900Lenovo Yoga 1');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `speed` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_range` varchar(100) NOT NULL,
  `hard_drive` varchar(100) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `basic_description` text NOT NULL,
  `secondary_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `user_id`, `title`, `brand`, `size`, `speed`, `weight`, `price`, `price_range`, `hard_drive`, `image_url`, `basic_description`, `secondary_desc`) VALUES
(1, 7, 'Lenovo Yoga 900', 'lenovo', '12inches', 'speed2', '3Pounds', '1049.99', 'Above1000', 'SSD Hybrid', 'home.jpg', 'Life moves fast and so do you. Do more, faster with the latest Intel Core i processors. Boot up and access your applications more quickly with PCIe solid-state drives that provide faster data access and increased data stability compared to traditional hard drives. They also give you better battery life with up to 8 hours of video playback.', 'Multitasking is no problem with the Yoga 900. It can support up to 16GB of memory to make sure all your applications keep up with you. Build images, edit video, or run other graphic intensive programs with the optional Intel Iris graphics card. It renders graphics more efficiently-separately from the CPU- giving you a more visually remarkable, more fluid and more enjoyable experience.'),
(2, 1, 'Dell T300', 'dell', '12inches', 'Speed2', '5Pounds', '699.99', '500to800', 'Mechanical', 'ideapad300.jpg', 'If you love streaming music or binge watching videos online but don''t want to spend money on features you don''t need, the Ideapad 310 is the laptop for you. Fast, responsive processing, enhanced audio, and integrated graphics make this a great multimedia PC for casual use.', 'Lenovo Photo Master 2.0 is a modern photo library with powerful, easy-to-use navigation and editing tools. With features such as Auto Face Swap and Smart Event Sort, you can now organize and optimize photos on your Ideapad 310 to perfection.'),
(3, 1, 'Lenovo E420', 'lenovo', '12inches', 'speed1 speed2', '4Pounds', '480.50', 'Under500', 'Mechanical', 'e420.jpg', 'With the 14-inch ThinkPad Edge E420, Lenovo hits all the sweet spots for a small business notebook -- portability, security and ease of use -- while keeping the price as low as possible. The Edge E420 ($539 as configured) boasts many of the features that make the svelter E420s great (rubberized palm rests, comfy keyboard and TrackPoint pointing stick) while eliminating some of the pricier amenities such as a glossy infinity glass display, polished metal accents and a thin chassis. With a plethora of inexpensive business notebooks currently on the market, does the ThinkPad Edge E420 really make waves?', 'The Lenovo ThinkPad Edge E420 shares many of the same aesthetic features as its thinner cousin, the Edge E420s. The classic ThinkPad design elements - the ThinkPad logo, red TrackPoint pointing stick, dual sets of mouse buttons, slightly rubberized lid and palm rests - are all here. You''ll also find some neat flourishes from the Edge E420s such as the "i" in the ThinkPad logo that blinks red when the computer is in standyby mode and chrome trim around the edge of the lid.'),
(4, 1, 'Lenovo Flex 2', 'lenovo', '16inches', 'Speed3 Speed4', '3Pounds', '1080.00', 'Above1000', 'Mechanical SSD Hybrid', 'flex2.jpg', 'When you''re relying heavily on the keyboard - drafting documents or working on a spreadsheet, for example - keep your Flex 2 in the classic laptop mode for maximum productivity. But when you''re focusing on touch applications, web chatting, or enjoying a film or video, flip the screen 300 degrees to enter stand mode. The Flex 2''s unique design means it adapts to whatever you choose to Do.', 'With up to 6 hours'' battery life between charges, the Flex 2 is an ideal companion for users on the go. Lenovo Energy Management protects the long-term durability of the battery and uses advanced energy-saving technology to increase time spent between charges.'),
(5, 1, 'Lenovo Z70', 'lenovo', '12inches', 'Speed2 Speed3', '6Pounds', '660.00', '500to800', 'Mechanical SSD', 'z70.jpg', 'The affordable Lenovo Z70 laptop is just the ticket for those that enjoy big entertainment. Equipped with a jaw-dropping Full HD, 17.3-inch display, powerful cutting-edge Intel processing, NVIDIA discrete graphics and state-of-the-art JBL designed speakers with superior sound provided by Dolby audio, it''s the ideal entertainment PC.', 'Enjoy an increased level of audio clarity and maximized volume output without distortion. The immersive surround sound experience over dual JBL-designed stereo speakers with the latest Dolby audio enhancement is clear and crisp.  Plus, with NVIDIA GeForce 840M graphics, the Z70 is perfect for streaming HD videos, surfing the web, and enjoying 3D gaming.'),
(6, 1, 'Lenovo IdeaPad 100', 'lenovo', '14inches', 'Speed3', '3Pounds', '890.88', '800to1000', 'SSD', 'ideapad100.jpg', 'The Ideapad 110 has a number of features to maximize your productivity and comfort. The improved hinge design is more robust and allows for smooth 180-degree action to a flat position. The frameless keyboard allows your fingers to move freely without bumping, and the textured palm rest resists fingerprints and helps keep your hands in place without slipping - perfect for speedy touch-typing.', 'There''s no need to purchase an external optical drive with the Ideapad 110. It comes standard with an integrated DVD/CD-RW drive so you can load programs, listen to CDs, or watch movies offline.'),
(7, 1, 'Lenovo 2016 NEW', 'lenovo', '12inches 14inches', 'Speed4', '6Pounds', '990.50', '800to1000', 'SSD', 'new2016.jpg', 'Ultrathin. Ultralight. Ultratough. For the average Ultrabook these attributes may sound like a contradiction. But the new X1 Carbon is far above average. It features a carbon-fiber reinforced chassis and passes durability tests in extreme environments. Plus, it delivers more than all-day battery life, includes faster, more powerful storage performance, and has innovative docking options available, including wireless.', 'Constructed with satellite-grade carbon fiber, the new X1 Carbon is the toughest ThinkPad ever made. In fact, we perform nearly a dozen separate military-grade specification tests-all under extreme conditions with dust, vibration, heat, cold, altitude, humidity, solar radiation, and fungus.  The military specification tests are not intended to be a guarantee of performance under these environmental conditions. But you can surely rely on ThinkPad despite what life throws your way.'),
(8, 1, 'Lenovo Preium High', 'lenovo', '12inches', 'Speed1 Speed2', '5Pounds', '549.00', '500to800', 'Mechanical', 'prehigh.jpg', 'The new standard for highly mobile Ultrabooks. Thinner and lighter than previous generations, it also has added features for robust business productivity. The T460 features customizable storage options, immersive audio, and all-day battery life.', 'Starting at a mere 3.8 lbs and just .83 thick, this laptop is ultraportable. Fits neatly in your backpack, briefcase or tote it perfect for productivity on the go. With up to 18 hours of battery life, you can go all day without recharging. What''s more, Power Bridge Technology combines an internal battery with an external hot-swappable battery. This provides flexibility, allowing you to swap batteries without powering down, maximizing time between charges.'),
(9, 6, 'Lenovo Y700', 'lenovo', '16inches 14inches', 'Speed1 Speed2 Speed3 Speed4', '7Pounds', '1400.98', 'Above1000', 'Mechanical SSD Hybrid', 'y700.jpg', 'Experience intense, immersive gaming - the IdeaPad Y700 gives you quad-core power, discrete graphics and a complete multimedia experience with hi-def display, surround sound and subwoofer. When the competition heats up, don''t worry, because the Y700 has thermal cooling for serious gaming.', 'As the action intensifies on screen, thermal fans keep things nice and cool under the hood. With serious firepower, awesome graphics, and performance-boosting options, it gives you the ammunition to succeed every step of the way.'),
(10, 6, 'Lenovo U31', 'lenovo', '14inches', 'Speed2 Speed4', '2Pounds', '1077.00', 'Above1000', 'SSD Hybrid', 'u31.jpg', 'Premium performance, powerful possibilities. With stunning visuals and performance, the new 5th Gen Intel Core processor delivers processing power that takes your computing to the next level so that you can work smarter and play harder. Enjoy amazing battery life that keeps you productive on the go so that you don''t have to worry about recharging. That''s serious processing. Only with Intel Inside.', 'Increased audio clarity and maximized volume output without distortion - enjoy a crisp, clear immersive surround sound experience over dual speakers with this Dolby audio enhancement.'),
(11, 6, 'Lenovo Yoga 2', 'lenovo', '16inches', 'Speed1 Speed3', '2Pounds', '989.98', '800to1000', 'Mechanical SSD', 'yoga2.jpg', 'A PC when you need it, a tablet when you want it, and more. Easily change between four modes - Laptop, Stand, Tablet, and Tent - while Lenovo Transition automatically switches system settings and locks the keyboard in place. The secret: The Yoga 2 Pro''s unique design and touchscreen display allows the screen to flip around 360 degrees, which means you can select the mode you use based on what you choose to Do.', 'Yoga 2 Pro now comes loaded with custom software that helps you get the best of every mode. Our exclusive Lenovo Recommends software recognizes when you switch modes and recommends apps that work best. Preloaded apps like Phone Companion, Camera Man, Photo Touch, and Chef give you the best experience of each mode and let you have fun while you''re at it.'),
(12, 6, 'Lenovo Yoga 1', 'lenovo', '11inches', 'speed1 speed2 speed3', '4Pounds', '880.00', '500to800', 'SSD', 'yoga.jpg', 'The world''s first multi-mode mobile workstation, featuring Yoga''s famous 360-degree hinge, is built to last with carbon fiber and magnesium alloys. Digital artists, engineers or architects will enjoy the Wacom Active ES pen technology for drawing and sketching.', 'PC performance has never been faster. Intel 6th Gen Core i processors with built-in security are designed to take your productivity, creativity, and 3D gaming to the next level. Intel vPro Technology makes enterprise-level manageability even more convenient and efficient. And with Windows 10 Pro you can empower yourself and your business to do great things across many devices securely anywhere, with anyone, and at any time. Fitting a variety of budgets, it''s also very easy to use. So you can get more done right from the start.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `perm` enum('1','2') NOT NULL DEFAULT '2',
  `gender` enum('F','M','NS') NOT NULL DEFAULT 'NS',
  `email` varchar(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `perm`, `gender`, `email`, `username`, `password`) VALUES
(1, 'Jue', 'Hou', '2', 'NS', 'hjue@vt.edu', 'hjue1', '123456'),
(2, 'Jue', 'Hou', '2', 'NS', 'hjue@vt.edu', 'hjue2', '123456'),
(6, 'carter', 'Tat', '2', 'NS', 'carter@gmail.com', 'carter', 'password'),
(7, 'stephen', 'riblet', '1', 'NS', 's', 'sriblet', 'pass');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`) USING BTREE,
  ADD KEY `user_id_1` (`user_id_1`) USING BTREE,
  ADD KEY `user_id_2` (`user_id_2`) USING BTREE,
  ADD KEY `product_id_1` (`product_id_1`) USING BTREE,
  ADD KEY `product_id_2` (`product_id_2`) USING BTREE;

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower` (`follower`) USING BTREE,
  ADD KEY `followee` (`followee`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_pid_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_uid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `pid_1_fk` FOREIGN KEY (`product_id_1`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `pid_2_fk` FOREIGN KEY (`product_id_2`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `type_idfk` FOREIGN KEY (`type_id`) REFERENCES `event_type` (`id`),
  ADD CONSTRAINT `uid_1_fk` FOREIGN KEY (`user_id_1`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `uid_2_fk` FOREIGN KEY (`user_id_2`) REFERENCES `user` (`id`);

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `followee_fk` FOREIGN KEY (`followee`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `follower_fk` FOREIGN KEY (`follower`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
