SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'Другое'),
(2, 'Ошибка на сайте'),
(3, 'Ошибка при оформлении покупки'),
(4, 'Ошибка при получении товара'),
(5, 'Ошибка при расчете заказа'),
(6, 'Качество товара'),
(7, 'Возврат товара');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Пользователь'),
(2, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `id` int UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`id`, `status`) VALUES
(1, 'В обработке'),
(2, 'Принята'),
(3, 'Отказано');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `fio` varchar(512) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `fio`, `email`, `tel`, `password`, `role_id`) VALUES
(1, 'Администратор', 'admin.pomoch@yandex.ru', '+7(123)222-18-92', 'admin11', 2),
(2, 'Ельчук Елена Олеговна', 'elchuk.eo@yandex.ru', '+7(899)368-20-02', '312341', 1),
(3, 'Дроздов Владимир Николаевич', 'drozd.vn@yandex.ru', '+7(000)000-00-00', '000000', 1),
(4, 'Кравцова Юлия Владимировна', 'kravcova.uv@yandex.ru', '+7(312)512-56-65', '366231', 1),
(5, 'Стрельцов Алексей Борисович', 'strelcov.ab@yandex.ru', '+7(716)512-25-88', '513241', 1),
(6, 'Кривцова Александра Владимировна', 'krivcova.av@yandex.ru', '+7(618)622-74-74', '354636', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `zayavki`
--

CREATE TABLE `zayavki` (
  `id` int UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `status_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Дамп данных таблицы `zayavki`
--

INSERT INTO `zayavki` (`id`, `description`, `category_id`, `user_id`, `status_id`) VALUES
(7, 'Заказ рассыпался при распаковке', 1, 2, 1),
(8, 'Заказ не был получен', 4, 3, 2),
(9, 'Заказ пришел порваным', 6, 4, 3),
(10, 'Сервис не дал положить более четырех покупок в корзину', 2, 5, 2),
(11, 'Случайно отменился и заказ полностью пропал из корзины', 3, 6, 1),
(12, 'За товар не вернулись деньги на счет', 7, 3, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Индексы таблицы `zayavki`
--
ALTER TABLE `zayavki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `zayavki`
--
ALTER TABLE `zayavki`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `zayavki`
--
ALTER TABLE `zayavki`
  ADD CONSTRAINT `zayavki_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zayavki_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zayavki_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
