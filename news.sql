-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2020 at 12:14 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kamus`
--

CREATE TABLE `tbl_kamus` (
  `id` int(11) NOT NULL,
  `isi` varchar(30) NOT NULL,
  `arti` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kamus`
--

INSERT INTO `tbl_kamus` (`id`, `isi`, `arti`) VALUES
(1, 'kucing', 'kucing');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id_news` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `content` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `date_news` varchar(50) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id_news`, `title`, `image`, `content`, `description`, `date_news`, `id_users`) VALUES
(3, 'apagitu', '10112020165835119852327_3800483406648090_3702054266424636417_o.jpg', 'konten', 'deskripsi', '2020-11-10 22:58:35', 2),
(4, '4 Hal Terkait Peringatan Hari Kesehatan Nasional 2', '13112020000005icebear.jpg', 'konten', '\"Tema ini merupakan seruan kepada seluruh tenaga k', '2020-11-13 06:00:05', 2),
(5, '7 Dampak Buruk Memakai Kaus Kaki Sempit untuk Kese', '13112020000157kaos.jpg', 'Liputan6.com, Jakarta Dampak buruk memakai kaus ka', 'kaos\n ', '2020-11-13 06:01:57', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id_users` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id_users`, `username`, `email`, `password`, `level`, `date`) VALUES
(1, '', '', 'd41d8cd98f00b204e9800998ecf8427e', 1, '2020-09-15'),
(2, 'ihsan', 'ihsan1@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1, '2020-09-27'),
(3, 'ihsan2', 'ihsan12@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1, '2020-09-27'),
(4, 'ihsan4', 'ihsan14@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1, '2020-09-27'),
(5, 'ihsan', 'kucing@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1, '2020-11-10'),
(6, 'ihsan', 'kucing5@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1, '2020-11-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_kamus`
--
ALTER TABLE `tbl_kamus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id_news`),
  ADD KEY `id_users` (`id_users`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_kamus`
--
ALTER TABLE `tbl_kamus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD CONSTRAINT `tbl_news_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id_users`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
