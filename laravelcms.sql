-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 11/05/2021 às 05:49
-- Versão do servidor: 10.4.18-MariaDB
-- Versão do PHP: 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `laravelcms`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `body`) VALUES
(1, 'Teste 2', 'teste-2', '<p>Este &eacute; um teste 2...</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://127.0.0.1:8000/media/images/1620682686.jpg\" alt=\"\" width=\"256\" height=\"256\" /></p>'),
(3, 'Sobre Mim', 'sobre-mim', 'Alguma coisa sobre mim.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `name`, `content`) VALUES
(1, 'title', 'Pizza Interessante'),
(2, 'subtitle', 'Site Muito Legal'),
(3, 'email', 'contato@site.com'),
(4, 'bgcolor', '#ff0000'),
(5, 'textcolor', '#000000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `admin`) VALUES
(1, 'Fabio', 'fabio@gmail.com', '$2y$10$Hn62DuPTAbFU1omXHbkyquQ1HHzZwkQVlkQYA9Frw1OP/TfQx4a8S', NULL, 1),
(2, 'Paulo', 'paulo@gmail.com', '$2y$10$7NrHp/7dsBV/M6428SciBu4ngwE4VFtynM6hdqvapU/0AJpejL1Q.', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `date_access` datetime DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `visitors`
--

INSERT INTO `visitors` (`id`, `ip`, `date_access`, `page`) VALUES
(1, '1', '2020-12-11 11:11:11', '/'),
(2, '2', '2020-12-11 12:00:00', '/'),
(3, '3', '2020-12-11 13:00:00', '/teste');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
