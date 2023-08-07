-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 20 2023 г., 11:08
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sportswear_store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Одежда'),
(2, 'Кроссовки');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cart` text NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'В процессе',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `email`, `cart`, `status`, `order_date`) VALUES
(9, 'Антон', '891949829314', '131231@mail.ru', '[{\"productId\":\"25\",\"size\":\"S\",\"count\":1},{\"productId\":\"20\",\"size\":\"44\",\"count\":2}]', 'В процессе', '2023-05-18 16:25:25'),
(10, 'выфвы', 'вфцвцф', 'adwad@mail.ru', '[{\"productId\":\"33\",\"size\":\"36\",\"count\":1}]', 'В процессе', '2023-05-19 10:48:54'),
(11, 'Антон', '79820123412', 'example@mail.com', '[{\"productId\":\"46\",\"size\":\"36\",\"count\":1}]', 'В процессе', '2023-05-20 09:07:28');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(10) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image_url`, `category_id`, `product_type`) VALUES
(13, 'Air Force 1', 'Сияние продолжает жить в Nike Air Force 1 \'07, OG для бейсбола, которые привносят свежие нотки в то, что вы знаете лучше всего: прочные накладки, чистая отделка и идеальное количество вспышек, чтобы вы сияли.', 12000, 'img/af1.png', 2, NULL),
(18, 'Nike Dunk Low Retro', 'Созданные для игры на твердом покрытии, но перенесенные на улицы, баскетбольная икона возвращается с классическими деталями и броским стилем игры. ', 11500, 'img/dnk1.png', 2, NULL),
(19, 'Nike Dunk High Retro', 'Созданные для игры на твердом покрытии, но перенесенные на улицы, икона бейсбола 80-х годов возвращается с идеальными накладками и оригинальными университетскими цветами. Благодаря своему классическому дизайну Nike Dunk High Retro возвращает винтаж 80-х на улицы, а мягкий воротник на высокой подошве придает олдскульный вид, основанный на комфорте.', 12000, 'img/dnkh1.png', 2, NULL),
(20, 'Air Jordan 4 Thunder', 'Прямо из хранилища, желанная расцветка вернулась в прежнем виде. Здесь те же материалы и яркие акценты Tour Yellow, которые привлекли внимание любителей кроссовок в 2006 году, а также оригинальные элементы отделки, такие как смелый Jumpman на язычке и знаменитые \"крылья\", которые позволяют настроить шнуровку. Это не подделка. Успейте купить их, пока есть возможность.', 21000, 'img/jr4yelow.png', 2, NULL),
(21, 'Air Max 95 LX', '', 18000, 'img/air95.png', 2, NULL),
(22, 'Nike Sportswear Tech Fleece', '', 7900, 'img/odezhda1.png', 1, NULL),
(23, 'Nike Sportswear Tech Fleece', '', 5990, 'img/odezhda2.png', 1, NULL),
(24, 'Nike Skyring Skate Shorts', '', 3500, 'img/odezhda3.png', 1, NULL),
(25, 'Nike Dri-FIT NBA Swingman Jersey', '', 7800, 'img/odezhda4.png', 1, NULL),
(26, 'Nike College Shorts', '', 4500, 'img/odezhda5.png', 1, NULL),
(27, 'Nike College Long-Sleeve T-Shirt', '', 2500, 'img/odezhda6.png', 1, NULL),
(28, 'Nike Dri-FIT Primary Versatile Top', '', 2300, 'img/odezhda7.png', 1, NULL),
(29, 'Nike Therma-FIT Full-Zip Fitness Top', '', 5600, 'img/odezhda8.png', 1, NULL),
(31, 'Nike Sportswear Collection Jacket', '', 6890, 'img/odezhda10.png', 1, NULL),
(32, 'Nike Air Zoom G.T. Jump', 'Хотите бросить вызов гравитации? Познакомьтесь с одной из самых отзывчивых систем амортизации Nike Basketball, когда-либо разработанной для игровой обуви. Двойная амортизация Zoom Air работает в унисон с внешним прыжковым каркасом из PEBAX®, легким, пружинистым и прочным.', 12000, 'img/azoom.png', 2, NULL),
(33, 'Nike Blazer Mid \'77 Jumbo', 'Nike Blazer Mid \'77 Jumbo, которые многие хвалят за их неизменный внешний вид и ощущения, стали новым элементом гардероба. Теперь у них эластичная пятка с текстурой, напоминающей вельвет, и большие выступы для удобства надевания и снимания. Негабаритный дизайн Swoosh и шнурки jumbo добавляют забавный поворот.', 11500, 'img/blazer.png', 2, NULL),
(34, 'Air Jordan 3 Retro', 'Чистые и превосходные, AJ3 возвращаются со всем своим классическим стилем и изяществом. Качественная кожа верха с роскошной текстурой слоновьего принта сочетается с видимым Nike Air в подошве, создавая удобную повседневную икону.', 16000, 'img/jr3.png', 2, NULL),
(41, 'New Balance 2002r \"Protection Pack\"', '', 28000, 'img/nb2002r.jpg', 2, NULL),
(42, 'New Balance 2002r \"Blue Royal\"', '', 15000, 'img/nb2002rbl.jpg', 2, NULL),
(43, 'New Balance 550 \"Cream Black\"', '', 15000, 'img/nb550cb.jpg', 2, NULL),
(44, 'New Balance 550 \"Black White\"', '', 15000, 'img/nb550.jpg', 2, NULL),
(45, 'Adidas Niteball Orange', '', 12000, 'img/nite1.jpg', 2, NULL),
(46, 'Adidas Forum Low', '', 12000, 'img/forum1.jpg', 2, NULL),
(47, 'Adidas Adi2000', '', 10000, 'img/ad2000.jpg', 2, NULL),
(48, 'Nike SB Logo T-Shirt', '', 2500, 'img/odezhda9.png', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `is_admin`) VALUES
(1, 'admin', 'admin', 1),
(3, 'user', 'user', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
