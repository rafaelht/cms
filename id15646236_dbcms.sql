-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2020 at 09:08 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `titulo`) VALUES
(1, 'PHP'),
(2, 'JAVA'),
(3, 'ANGULAR'),
(4, 'JAVASCRIPT'),
(5, 'PHYTON'),
(17, 'ruby'),
(20, 'poo'),
(21, 'c');

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_entrada_comentario` int(11) NOT NULL,
  `comentario_autor` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `comentario_email` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `comentario_contenido` text COLLATE utf8_spanish2_ci NOT NULL,
  `comentario_status` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `comentario_fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_entrada_comentario`, `comentario_autor`, `comentario_email`, `comentario_contenido`, `comentario_status`, `comentario_fecha`) VALUES
(11, 1, 'carlos', 'carlos@gmail.com', 'excelente', 'aprobado', '2018-07-31');

-- --------------------------------------------------------

--
-- Table structure for table `entradas`
--

CREATE TABLE `entradas` (
  `id_entrada` int(11) NOT NULL,
  `id_categoria_entrada` int(11) NOT NULL,
  `entrada_titulo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `entrada_autor` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `entrada_fecha` date NOT NULL,
  `entrada_imagen` text COLLATE utf8_spanish2_ci NOT NULL,
  `entrada_contenido` text COLLATE utf8_spanish2_ci NOT NULL,
  `entrada_etiquetas` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `entrada_comment_count` int(11) NOT NULL,
  `entrada_status` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `entrada_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `entradas`
--

INSERT INTO `entradas` (`id_entrada`, `id_categoria_entrada`, `entrada_titulo`, `entrada_autor`, `entrada_fecha`, `entrada_imagen`, `entrada_contenido`, `entrada_etiquetas`, `entrada_comment_count`, `entrada_status`, `entrada_views_count`) VALUES
(1, 1, 'Video 1 - PHP', 'ucevito', '2018-07-26', 'php.png', '<h2><a href=\"https://google.com\">PARRAFO de PHP</a></h2><p>excelente curso de php excelente Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna. Mi enim taciti vehicula gravida habitasse curabitur, dictum elementum viverra congue dignissim ullamcorper, neque donec lacinia molestie morbi. Lobortis vestibulum habitant nisi vulputate leo consequat felis eu, rutrum vitae sed accumsan suscipit aliquam volutpat vehicula morbi, dictumst nascetur duis erat venenatis habitasse malesuada. Malesuada nullam nam per accumsan est eros purus, erat pellentesque magnis tincidunt placerat quisque.</p>', 'php', 2, 'publicado', 47),
(2, 1, 'Video 1 - Java', 'ucevito', '2018-07-16', 'java.jpg', 'buen curso de java.  Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna.      \r\n         ', 'java', 0, 'publicado', 1),
(10, 1, 'Video 3 - PHP', 'ucevito', '2018-07-16', 'userlaptop.png', ' excelente curso. Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna.  \r\n                   \r\n         ', 'php', 2, 'publicado', 0),
(12, 3, 'Video Angular', 'daniel', '2018-07-30', 'angular.jpg', '<p>excelente video de angular</p>', 'angular', 0, 'publicado', 0),
(16, 3, 'Video Angular', 'daniel', '2018-07-30', 'angular.jpg', '<p>excelente video de angular</p>', 'angular', 0, 'publicado', 0),
(17, 1, 'Video 3 - PHP', 'ucevito', '2018-07-16', 'userlaptop.png', ' excelente curso. Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna.  \r\n                   \r\n         ', 'php', 2, 'publicado', 0),
(18, 1, 'Video 3 - PHP', 'ucevito', '2018-07-16', 'userlaptop.png', ' excelente curso. Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna.  \r\n                   \r\n         ', 'php', 2, 'publicado', 0),
(19, 1, 'Video 1 - Java', 'ucevito', '2018-07-16', 'java.jpg', 'buen curso de java.  Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna.      \r\n         ', 'java', 0, 'publicado', 1),
(20, 1, 'Video 3 - PHP', 'ucevito', '2018-07-16', 'userlaptop.png', ' excelente curso. Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna.  \r\n                   \r\n         ', 'php', 2, 'publicado', 0),
(21, 1, 'Video 1 - Java', 'ucevito', '2018-07-16', 'java.jpg', 'buen curso de java.  Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna.      \r\n         ', 'java', 0, 'publicado', 0),
(22, 1, 'Video 1 - PHPfff', 'rafael', '2020-12-10', 'php.png', '<h2><a href=\"https://google.com\">PARRAFO de PHP</a></h2><p>excelente curso de php excelente Lorem ipsum dolor sit amet consectetur adipiscing elit, felis conubia magnis aliquet laoreet magna, natoque libero integer ligula donec quis. Donec curae placerat class mauris pharetra cursus inceptos scelerisque, feugiat maecenas morbi tortor vitae duis aliquet dapibus ligula, penatibus libero hendrerit dictumst ullamcorper taciti cras. Hac curae sagittis tincidunt pharetra pulvinar sapien mus nulla accumsan at, tempus interdum scelerisque suscipit laoreet nisl mattis semper quis, habitasse proin montes conubia ultricies imperdiet facilisis venenatis urna. Mi enim taciti vehicula gravida habitasse curabitur, dictum elementum viverra congue dignissim ullamcorper, neque donec lacinia molestie morbi. Lobortis vestibulum habitant nisi vulputate leo consequat felis eu, rutrum vitae sed accumsan suscipit aliquam volutpat vehicula morbi, dictumst nascetur duis erat venenatis habitasse malesuada. Malesuada nullam nam per accumsan est eros purus, erat pellentesque magnis tincidunt placerat quisque.</p>', 'php', 0, 'publicado', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish2_ci NOT NULL,
  `rol` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `token` text COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`, `nombre`, `apellido`, `correo`, `imagen`, `rol`, `token`) VALUES
(3, 'ucevito', '$2y$10$Fi289Y1RtubTT8yV2ajRgOXS5ujpQE4Y5lck4BlL7hl1laytMpZ8e', 'eyter', 'higuera', 'eyter@gmail.com', 'imagen', 'administrador', ''),
(6, 'daniel', '$2y$10$kgTr1TgZe4O94WFYorYe6O5cs8ckGv6NY5bla3CwS8sS1xBgIpAXa', 'daniel', 'lopez', 'daniel@gmail.com', 'imagen', 'suscriptor', ''),
(11, 'luis', '$2y$10$kqo4CkG2UEf6OPBLeZNf3urcH9Q9t33Npna3FEZfGmjRfDZcFGeme', 'luis', 'lopez', 'luis@gmail.com', 'imagen', 'suscriptor', ''),
(12, 'rafael', '$2y$10$4MYGJRKEumsXJQC2izkld.9cjhlhIV0d5gY/hnleDBsauO7YJWM/a', 'Rafael', 'Torres', 'rafaelhilariotorres@gmail.com', 'imagen', 'administrador', '0'),
(13, 'angel', '$2y$10$TI7rh9Q7dHiP1qSrREFI6uJAnC9lXtbXoyXfgVSWM4JkimOZhG54.', 'Angel', 'Cordero', 'angel@gmail.com', 'imagen', 'suscriptor', 'c155353d01a9ad330751e5ccf9c45a7b4fa3bd0fb9bd677a36b11e0253c4d0ce871ff5684d0bce9f09c931d522a71ef74fa7ae86cde8b7d265285bc8'),
(14, 'rafaelhilario', '$2y$10$r6Pq1GWpf2BbLD5l7H3D3.CXPi1yp9.y8fASPHi4BTxf/7u9Kczze', 'Rafael', 'Torres', 'rafaelhilario@gmail.com', 'imagen', 'suscriptor', '0');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_online`
--

CREATE TABLE `usuarios_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `usuarios_online`
--

INSERT INTO `usuarios_online` (`id`, `session`, `time`) VALUES
(277, '1kcj7iqispdmh1vc2gqs2c8uv8', 1533159707),
(278, 'e7ccdfcd2d9bd9a71dd4aeec53d86a5a', 1607632740),
(279, '4fe418db44e4af7a77012c199619d9a0', 1607631209);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Indexes for table `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id_entrada`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `usuarios_online`
--
ALTER TABLE `usuarios_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `usuarios_online`
--
ALTER TABLE `usuarios_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
