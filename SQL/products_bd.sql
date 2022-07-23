
--
-- База данных: `products_bd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `picture`
--

CREATE TABLE `picture` (
  `id_picture` int(11) NOT NULL,
  `url_picture` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `picture`
--

INSERT INTO `picture` (`id_picture`, `url_picture`, `name`) VALUES
(1, 'https://catfox.ru/upload/iblock/f04/f042891ba1341ebdc33c9f156a9925c2.jpg', 'Футболка'),
(2, 'https://illan-gifts.ru/api/images/futbolka-detskaia-t-bolka-kids-oranzhevaia-105549.jpeg', 'Оранжевая футболка'),
(3, 'https://images-eu.ssl-images-amazon.com/images/I/31rYfVce1AL._UL1000_.jpg', 'Платье черное'),
(4, 'https://parus-sochi.ru/d/cml1007606c149359941978617800.jpg', 'Брюки черные');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id_price` int(11) NOT NULL,
  `id_section` int(11) NOT NULL,
  `articul` int(11) NOT NULL,
  `id_section_list` int(11) NOT NULL,
  `id_picture` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id_price`, `id_section`, `articul`, `id_section_list`, `id_picture`, `id_product`) VALUES
(1, 1, 1145, 1, 1, 1),
(2, 2, 4757, 2, 2, 2),
(3, 3, 4878, 3, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `product_item`
--

CREATE TABLE `product_item` (
  `id_product` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `count_products` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_item`
--

INSERT INTO `product_item` (`id_product`, `name`, `description`, `count_products`) VALUES
(1, 'Футболка', 'Футболка женская', 10),
(2, 'Футболка ', 'Футболка мужская', 20),
(3, 'Платье', 'Цвет черный', 2),
(4, 'Брюки', 'Женские брюки\r\nЦвет черный', 25);

-- --------------------------------------------------------

--
-- Структура таблицы `product_price`
--

CREATE TABLE `product_price` (
  `id_price` int(11) NOT NULL,
  `price` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_without_discount` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promocode_price` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_price`
--

INSERT INTO `product_price` (`id_price`, `price`, `price_without_discount`, `promocode_price`) VALUES
(1, '2400', '2890', '2150'),
(2, '4700', '5200', '3500'),
(3, '1400', '1800', '1200'),
(4, '1800', '2500', '1500');

-- --------------------------------------------------------

--
-- Структура таблицы `section`
--

CREATE TABLE `section` (
  `id_section` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`id_section`, `name`, `description`) VALUES
(1, 'Женская одежда', 'Одежда для женщин'),
(2, 'Мужская одежда', 'Одежда для мужчин'),
(3, 'Верхняя одежда', 'Весенняя одежда');

-- --------------------------------------------------------

--
-- Структура таблицы `section_list`
--

CREATE TABLE `section_list` (
  `id_section_list` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `articul` int(11) NOT NULL,
  `id_section` int(11) NOT NULL,
  `id_picture` int(11) NOT NULL,
  `count_products` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `section_list`
--

INSERT INTO `section_list` (`id_section_list`, `id_product`, `articul`, `id_section`, `id_picture`, `count_products`) VALUES
(1, 1, 1145, 1, 1, 10),
(2, 2, 4878, 2, 2, 20),
(3, 4, 4757, 2, 4, 25);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id_picture`),
  ADD UNIQUE KEY `url_picture` (`url_picture`) USING HASH;

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD UNIQUE KEY `id_price` (`id_price`),
  ADD UNIQUE KEY `id_section` (`id_section`),
  ADD UNIQUE KEY `article` (`articul`),
  ADD KEY `id_section_list` (`id_section_list`),
  ADD KEY `id_picture` (`id_picture`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `product_item`
--
ALTER TABLE `product_item`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `count_products` (`count_products`);

--
-- Индексы таблицы `product_price`
--
ALTER TABLE `product_price`
  ADD PRIMARY KEY (`id_price`);

--
-- Индексы таблицы `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id_section`);

--
-- Индексы таблицы `section_list`
--
ALTER TABLE `section_list`
  ADD PRIMARY KEY (`id_section_list`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `articul` (`articul`),
  ADD KEY `id_section` (`id_section`),
  ADD KEY `id_picture` (`id_picture`),
  ADD KEY `count_products` (`count_products`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `picture`
--
ALTER TABLE `picture`
  MODIFY `id_picture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `product_item`
--
ALTER TABLE `product_item`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `product_price`
--
ALTER TABLE `product_price`
  MODIFY `id_price` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `section`
--
ALTER TABLE `section`
  MODIFY `id_section` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `section_list`
--
ALTER TABLE `section_list`
  MODIFY `id_section_list` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_price`) REFERENCES `product_price` (`id_price`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`id_picture`) REFERENCES `picture` (`id_picture`),
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`id_section`) REFERENCES `section` (`id_section`),
  ADD CONSTRAINT `product_ibfk_5` FOREIGN KEY (`id_product`) REFERENCES `product_item` (`id_product`),
  ADD CONSTRAINT `product_ibfk_6` FOREIGN KEY (`id_section_list`) REFERENCES `section_list` (`id_section_list`);

--
-- Ограничения внешнего ключа таблицы `section_list`
--
ALTER TABLE `section_list`
  ADD CONSTRAINT `section_list_ibfk_3` FOREIGN KEY (`id_picture`) REFERENCES `picture` (`id_picture`),
  ADD CONSTRAINT `section_list_ibfk_5` FOREIGN KEY (`id_section`) REFERENCES `section` (`id_section`),
  ADD CONSTRAINT `section_list_ibfk_7` FOREIGN KEY (`id_product`) REFERENCES `product_item` (`id_product`),
  ADD CONSTRAINT `section_list_ibfk_8` FOREIGN KEY (`count_products`) REFERENCES `product_item` (`count_products`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
