-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:1500
-- Время создания: Июл 26 2022 г., 14:57
-- Версия сервера: 10.4.12-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `products`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id_category`, `id_product`) VALUES
(1, 1),
(2, 5),
(3, 2),
(4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `category_product`
--

CREATE TABLE `category_product` (
  `id_category` int(11) NOT NULL,
  `title` varchar(75) NOT NULL,
  `discription` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_product`
--

INSERT INTO `category_product` (`id_category`, `title`, `discription`) VALUES
(1, 'Одежда', 'Женская и Мужская одежда'),
(2, 'Обувь', 'Мужская И Женская обувь'),
(3, 'Аксессуары', 'Головные уборы и украшения'),
(4, 'Распродажа', 'Товары со скидкой');

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id_image` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id_image`, `id_product`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `image_product`
--

CREATE TABLE `image_product` (
  `id_image` int(11) NOT NULL,
  `url` text NOT NULL,
  `alt` varchar(300) CHARACTER SET ucs2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image_product`
--

INSERT INTO `image_product` (`id_image`, `url`, `alt`) VALUES
(1, 'https://images.wbstatic.net/big/new/53300000/53300164-1.jpg', 'Куртка GUESS'),
(2, 'https://static.rendez-vous.ru/files/catalog_models/2939810_shapka_guess_aw8728wol01_belyy_viskoza.JPG', 'Шапка GUESS'),
(3, 'https://chia.ua/product/263978/x_263978_1.jpg', 'Женское платье Gucci'),
(4, 'https://www.kupi-sarafan.ru/files/Panda/22780-1.jpg', 'Женское платье Panda'),
(5, 'https://ae04.alicdn.com/kf/H4a85f1456a5047be92d3e0fa67847530P.jpg', 'Мужская обувь Дерби'),
(6, 'https://outmaxshop.ru/components/com_jshopping/files/img_products/11350/gucci-ace-embroidered-11350-1.jpg', 'Кроссовки GUCCI ACE EMBROIDERED'),
(7, 'https://outmaxshop.ru/components/com_jshopping/files/img_products/21698/nike-air-force-1-21698-1.jpg', 'Кроссовки NIKE AIR FORCE 1'),
(8, 'https://outmaxshop.ru/components/com_jshopping/files/img_products/23341/nike-air-force-1-low-23341-1.jpg', 'Кроссовки NIKE AIR FORCE 1 LOW');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `title` varchar(75) NOT NULL,
  `price` int(11) UNSIGNED NOT NULL,
  `price_without_discount` int(11) UNSIGNED DEFAULT NULL,
  `price_with_promocode` int(11) UNSIGNED DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `count_products` tinyint(4) NOT NULL DEFAULT 1,
  `image` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id_product`, `title`, `price`, `price_without_discount`, `price_with_promocode`, `description`, `count_products`, `image`, `category`) VALUES
(1, 'Куртка GUESS', 11700, 12500, 7800, 'Женская куртка GUESS.\r\nСостав: 100% Полиэстер.', 2, 1, 1),
(2, 'Шапка GUESS', 2700, 3500, 1500, 'Женская шапка.\r\nСостав: 80% Шерсть, 20% Хлопок.', 5, 2, 3),
(3, 'Женское платье Gucci', 9800, 11500, 8900, 'Женское платье Gucci. \r\nСостав: 70% Хлопок, 20% Эластан, 10% Лайкра.', 1, 3, 1),
(4, 'Женское платье Panda', 4700, 5900, 2400, 'Женское платье Panda.\r\nСостав: 50% Эластан, 50% Полиэстер.', 4, 4, 4),
(5, 'Мужская обувь Дерби', 6800, 7900, 5400, 'Мужская обувь Дерби.\r\nСостав: 100% Настоящая кожа.', 7, 5, 2),
(6, 'Кроссовки GUCCI ACE EMBROIDERED', 8800, 11000, 7500, 'Кроссовки GUCCI ACE EMBROIDERED.\r\nСостав: 100% Настоящая кожа.', 2, 6, 2),
(7, 'Кроссовки NIKE AIR FORCE 1', 10500, 11400, 7499, 'Кроссовки NIKE AIR FORCE 1.\r\nСостав: 100% Натуральная кожа.', 2, 7, 4),
(8, 'Кроссовки NIKE AIR FORCE 1 LOW', 9800, 9900, 8400, 'Кроссовки NIKE AIR FORCE 1 LOW.\r\nСостав: 100% Натуральная кожа.', 7, 8, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_product`,`id_image`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_image` (`id_image`);

--
-- Индексы таблицы `image_product`
--
ALTER TABLE `image_product`
  ADD PRIMARY KEY (`id_image`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `picture` (`image`,`category`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `image_product`
--
ALTER TABLE `image_product`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category_product` (`id_category`);

--
-- Ограничения внешнего ключа таблицы `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `image_ibfk_2` FOREIGN KEY (`id_image`) REFERENCES `image_product` (`id_image`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category_product` (`id_category`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`image`) REFERENCES `image_product` (`id_image`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
