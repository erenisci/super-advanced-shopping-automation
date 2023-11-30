-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 30 Kas 2023, 11:50:09
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `alisveris.urunler.json`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `urunAd` varchar(255) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `resimUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `urunAd`, `stok`, `resimUrl`) VALUES
(1, 'Ayakkabi', 100, ''),
(2, 'Boya', 100, ''),
(3, 'Cila', 100, ''),
(4, 'Çilek', 100, ''),
(5, 'Dizlik', 100, ''),
(6, 'Erik', 100, ''),
(7, 'Fanus', 100, ''),
(8, 'Gözlük', 100, ''),
(9, 'Halı', 100, ''),
(10, 'Izgara', 100, ''),
(11, 'İp', 100, ''),
(12, 'Jilet', 100, ''),
(13, 'Kitap', 100, ''),
(14, 'Lale', 100, ''),
(15, 'Makas', 100, ''),
(16, 'Nevresim', 100, ''),
(17, 'Oklava', 100, ''),
(18, 'Örtü', 100, ''),
(19, 'Portakal', 100, ''),
(20, 'Radyo', 100, ''),
(21, 'Sehpa', 100, ''),
(22, 'Şemsiye', 100, ''),
(23, 'Turp', 100, ''),
(24, 'Ustura', 100, ''),
(25, 'Ütü', 100, ''),
(26, 'Valiz', 100, ''),
(27, 'Yastık', 100, ''),
(28, 'Zımba', 100, '');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
