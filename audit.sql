-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 23 2019 г., 20:45
-- Версия сервера: 10.4.10-MariaDB-1:10.4.10+maria~bionic
-- Версия PHP: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `audit`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog_etc_categories`
--

CREATE TABLE `blog_etc_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'user id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `blog_etc_categories`
--

INSERT INTO `blog_etc_categories` (`id`, `category_name`, `slug`, `category_description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'quasi', 'sit-autem-qui-ducimus-illum-voluptatem-sit-vel-dolores', 'quasi', 1, '2019-12-06 13:41:23', '2019-12-06 13:41:23'),
(2, 'et', 'voluptas-omnis-saepe-cumque-labore-quia-sint', 'et', 1, '2019-12-06 13:41:23', '2019-12-06 13:41:23'),
(3, 'inventore', 'deserunt-quas-sequi-iusto-molestias-et-accusamus', 'inventore', 1, '2019-12-06 13:41:23', '2019-12-06 13:41:23'),
(4, 'iste', 'expedita-nobis-saepe-laudantium-reiciendis-quia-optio-ipsa', 'iste', 1, '2019-12-06 13:41:23', '2019-12-06 13:41:23'),
(5, 'et', 'id-et-molestiae-unde', 'et', 1, '2019-12-06 13:41:23', '2019-12-06 13:41:23'),
(7, 'delectus', 'dolor-ut-quod-veritatis-dicta', 'delectus', 1, '2019-12-06 13:41:23', '2019-12-06 13:41:23');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_etc_comments`
--

CREATE TABLE `blog_etc_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_etc_post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'if user was logged in',
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if enabled in the config file',
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if not logged in',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the comment body',
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `blog_etc_comments`
--

INSERT INTO `blog_etc_comments` (`id`, `blog_etc_post_id`, `user_id`, `ip`, `author_name`, `comment`, `approved`, `created_at`, `updated_at`, `author_email`, `author_website`) VALUES
(1, 3, NULL, NULL, 'dasd as das', 'a s das das das d', 0, '2019-12-06 15:10:01', '2019-12-06 15:10:01', 'roli19850923@gmail.com', NULL),
(2, 11, NULL, NULL, 'Ro Li', 'nvbnvb nvg nv gnvn', 0, '2019-12-08 11:43:28', '2019-12-08 11:43:28', 'roli19850923@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_etc_posts`
--

CREATE TABLE `blog_etc_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'New blog post',
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `meta_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_body` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_view_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'should refer to a blade file in /views/',
  `posted_at` datetime DEFAULT NULL COMMENT 'Public posted at time, if this is in future then it wont appear yet',
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `image_large` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `blog_etc_posts`
--

INSERT INTO `blog_etc_posts` (`id`, `user_id`, `slug`, `title`, `subtitle`, `meta_desc`, `post_body`, `use_view_file`, `posted_at`, `is_published`, `image_large`, `image_medium`, `image_thumbnail`, `created_at`, `updated_at`, `short_description`, `seo_title`) VALUES
(1, 1, 'nkenken', 'нкенкен', NULL, NULL, '<p>кенкенкенкен</p>', NULL, '2019-12-06 15:45:14', 1, 'nkenken-1000x700.jpg', 'nkenken-600x400.jpg', 'nkenken-150x150.jpg', '2019-12-06 13:45:20', '2019-12-06 14:08:44', NULL, NULL),
(2, 1, 'perferendis-ut-quam-inventore-quo-quia', 'Mock Turtle had just.', '', 'Mock Turtle had just.', 'Rerum doloremque natus voluptatem dolor tempore libero quis. Quidem omnis dolor voluptates et eum. Distinctio sit ipsum amet. Facere officiis et accusantium fuga facere. Voluptas sit cum sequi. Dolorem culpa sapiente et doloribus. Et expedita quasi perspiciatis eveniet. Esse dolorum vel autem quaerat at aut error. Corporis deserunt voluptas saepe. Error nam voluptatem qui quis nemo est necessitatibus. Praesentium nobis est et sed dolor atque commodi id. Autem id assumenda enim numquam. Non id et nesciunt totam consequatur vitae earum. Id sequi qui neque dolor. Incidunt et enim aliquid beatae fugit. Sed adipisci atque quis vitae. Dolore qui autem eaque eos quo id. Nobis necessitatibus eos nulla et libero quia numquam delectus. Quaerat molestiae quia aut. Voluptas cumque repudiandae quo amet. Necessitatibus facilis commodi ipsa quam eius voluptas. Laborum est architecto sint voluptatum aperiam. Quis animi ducimus praesentium facilis illum architecto. Quaerat dolorem voluptatem rem eligendi. Consequuntur dolor architecto perferendis quia sed tempore. Iure ut velit ab aut. Est fuga vitae sunt tempore odit culpa. Ut nihil unde debitis aliquam aut. Est atque error sed molestiae rerum corporis. Dolorem voluptates enim perferendis et deleniti vel perferendis. Quia voluptas dolorem quidem quaerat. Repellat numquam laudantium reprehenderit cumque. Porro dolorem nesciunt repudiandae sapiente. Et rerum omnis illo. Eum doloremque omnis et a ut. Aliquid fuga deleniti cumque odio. Dolorum assumenda eos voluptas quia non numquam. Aliquid voluptatem non tenetur aliquam eaque. Consequuntur et et nobis accusantium est. Rerum facilis ut dolores in. Consequatur repellendus ratione non voluptatum quis suscipit. Iste sunt quisquam sapiente in ut dolores aut. Omnis omnis voluptatem iure odit ut aut.', NULL, '1973-05-25 00:55:25', 1, NULL, NULL, NULL, '2019-12-06 14:04:50', '2019-12-06 14:04:50', 'Sit enim et et quia ipsam aut alias provident.', 'Mock Turtle had just.'),
(3, 1, 'aliquid-nemo-natus-est', 'White Rabbit, who.', '', 'White Rabbit, who.', 'Nemo aut et aut dolores dolor et quibusdam. Nisi sunt quae ea delectus sit qui dolores. Libero ut sed possimus quae. Itaque doloribus voluptatum nihil tempora hic. Quod nobis delectus quibusdam at magnam. Vero qui fugit mollitia doloremque porro consequatur omnis. Ducimus vel sed eos dolorem quia quos sit. Earum eaque perferendis quod. Et perferendis necessitatibus corrupti tempore et accusamus deleniti. Praesentium odio veritatis et consectetur minus dolor et. Deserunt velit aliquam accusantium ipsa voluptatum ab. Maxime sequi molestias magnam et aspernatur. Facere dolores quae enim deleniti maiores omnis. Velit itaque cupiditate est reiciendis veniam perspiciatis. Omnis ex voluptatem rerum et molestias voluptas perferendis. Magnam in sapiente rem delectus. Tempore quam architecto et exercitationem. Modi in voluptate pariatur et esse sit. Odit unde qui ut est temporibus est id. Error eaque fuga ducimus neque qui placeat voluptates. Quasi nihil doloribus neque quis. Necessitatibus occaecati perferendis magnam molestiae quod. Temporibus cupiditate necessitatibus libero dolore quidem qui inventore. Quam voluptatem et voluptatem et ea nihil neque est. Nemo consequatur et occaecati non. Iure repellendus illo a reprehenderit dolore. Et enim et qui corrupti. Dolore reprehenderit officiis molestiae sit adipisci voluptas assumenda saepe. Iusto quam asperiores numquam corporis alias itaque omnis. Non quod dolorem in culpa hic rerum. Est et veritatis soluta eos doloremque est. Ad deleniti est harum temporibus.', NULL, '1985-03-11 14:05:48', 1, NULL, NULL, NULL, '2019-12-06 14:04:50', '2019-12-06 14:04:50', 'Autem veniam sed autem aut praesentium. Tempora adipisci quas hic a tempora consequatur id.', 'White Rabbit, who.'),
(4, 1, 'tempora-illo-tempora-dolore-sapiente-quia-cumque-mollitia', 'I wish you could only.', NULL, 'I wish you could only.', '<p>Veniam voluptate asperiores molestiae quaerat dicta officia. Debitis accusantium perferendis qui natus. Laboriosam ad ad perferendis voluptas ratione omnis. Rem quidem quae ea minima rerum corporis. Expedita numquam voluptas rerum magnam pariatur. Consectetur non et in voluptates. Sunt voluptatem nobis veniam. Praesentium voluptatem ut vitae non quisquam non debitis. Autem quidem ad quos dignissimos harum sequi. Nihil odio voluptates nostrum et nam sed. Mollitia eos cum delectus error eos. Doloribus dignissimos voluptatem possimus vero. Est itaque odit et consequuntur sit sed et. Fugit omnis reiciendis libero culpa harum. Pariatur commodi maxime voluptatibus ab voluptas nemo. Possimus quo quisquam odio delectus sunt neque voluptas. Voluptas harum ea aspernatur est nam et maxime. Distinctio exercitationem ut modi deleniti error recusandae. Aut aut modi quibusdam autem. Rerum perferendis amet ipsa nihil eum dolore nihil. Omnis nostrum id in consequuntur. Dolor eos et debitis architecto. Ex enim unde sunt id aperiam voluptatem veritatis. Quidem et est neque eum vel. Minus dolor alias omnis odit. Laudantium neque voluptatem animi sunt incidunt fugit. Ex aut et libero qui velit sit. Iste nam nesciunt laborum placeat corrupti soluta. Voluptatem sit libero nesciunt laboriosam provident. Minima corrupti suscipit alias vero. Voluptatem dignissimos magnam tempora est voluptatem sint commodi. Reiciendis qui sunt sed repudiandae ullam saepe. Autem dolor dolor atque sit eaque adipisci. Dolore consequatur quas beatae maiores accusantium quis. Et veniam aut nostrum excepturi consectetur officiis nobis. Nihil maiores aut laborum atque praesentium. Aliquid eos nisi veritatis sed at. Aut et incidunt ut necessitatibus nihil et similique.</p>', NULL, '1998-01-03 17:35:18', 1, 'i-wish-you-could-only-1000x700.jpg', 'i-wish-you-could-only-600x400.jpg', 'i-wish-you-could-only-150x150.jpg', '2019-12-06 14:04:50', '2019-12-06 14:11:08', 'Voluptate vero ex quasi deleniti fuga accusamus tenetur.', 'I wish you could only.'),
(5, 1, 'accusamus-nisi-iste-libero-alias', 'But said I could say if.', NULL, 'But said I could say if.', '<p>Odio saepe facere vel qui quo modi eligendi. Ea placeat voluptate excepturi sint impedit aut exercitationem. Fugit cumque autem ut nesciunt voluptatem. Occaecati quo quis aut non dolor. Molestiae nesciunt maiores nihil voluptas laborum. Ab temporibus sint aut omnis fuga placeat nesciunt. Sunt quod quod vitae amet dolor ea sint. Ad impedit itaque ipsum accusamus et et nemo. Qui eum facilis enim quo. Magni perspiciatis id non consequatur. Vel officia vel qui odio facilis. Est non quo cum voluptates beatae esse. Quidem unde quis dolores quis. Et porro dolores vel aut dolorem quia maiores tempora. Consequatur sit minus quia assumenda atque eaque itaque. Magni quae nesciunt quia asperiores quis ut. Omnis fugit ab rem exercitationem ducimus. Veritatis atque rerum velit at. Et itaque ut est dolor consequatur est. At ut unde distinctio porro. Quibusdam officiis itaque modi mollitia autem odit. Vel nostrum optio et et ad ducimus. Nam eaque illo quos amet et pariatur. Et tempora rerum pariatur. Magnam repellat aperiam optio autem est. Ut consequatur ut velit explicabo est. Beatae in qui voluptas adipisci dolore dolorem temporibus voluptas. Ea aliquam et molestias ullam autem rerum. Dolores quibusdam voluptas quibusdam eius neque autem. Voluptatem sed molestias et sed molestias velit minus voluptas. Quidem quia earum laborum accusantium. Sunt ducimus natus deleniti. Aut fugit minus delectus quis dolores porro. Quo id voluptates id a amet. Ut quisquam eos aperiam aperiam in velit. Quam sint earum aliquam consequatur. Dolorum quasi maxime tempore occaecati corrupti ut porro. Quia vel deserunt accusantium expedita aut voluptatem. Animi ea et veniam aut quidem. Ipsam et repellendus accusantium eaque. Deserunt aut hic consequatur perferendis commodi. Tenetur consequatur quia saepe. Quia at ex velit sed enim et doloribus.</p>', NULL, '2002-07-28 16:27:59', 1, 'but-said-i-could-say-if-1000x700.jpg', 'but-said-i-could-say-if-600x400.jpg', 'but-said-i-could-say-if-150x150.jpg', '2019-12-06 14:04:50', '2019-12-06 14:10:45', 'Dolor laborum voluptates est facilis sint voluptate possimus. Iste autem et eligendi quam quam.', 'But said I could say if.'),
(6, 1, 'omnis-itaque-cumque-consequatur-reprehenderit-veritatis', 'Queen, and Alice.', NULL, 'Queen, and Alice.', '<p>Molestiae qui ipsum dolorem occaecati consequatur. Exercitationem et consequatur molestiae dolorum laboriosam odit modi. Perspiciatis eos neque placeat nulla. Id perferendis inventore est qui qui id. Nisi nihil reiciendis maxime ea expedita labore dolor impedit. Sapiente cumque reiciendis adipisci natus esse quo. Qui in sed qui nostrum fuga enim vel. Illo dolores unde corporis placeat. Eos tenetur neque impedit quod quia. In ea quidem consequatur sed aut aut quia. Sunt ipsa molestiae et esse unde non et. Dolor voluptatem libero facere cum reiciendis est tenetur itaque. Velit consequatur aut aut commodi dicta nostrum vitae. Ullam voluptatem quis quo a architecto aut. Sed sed sunt omnis officia. Nisi doloribus hic totam accusamus expedita vel quod. Quasi sit corporis non eum quasi. Illo exercitationem exercitationem fugit exercitationem. Consequuntur odit laudantium voluptas ipsam. Voluptatem velit porro distinctio voluptatum quo veniam modi nesciunt. Facilis vel tempore consequatur asperiores provident tenetur consequatur. Quia qui omnis ad consequatur laborum. Ipsa eaque tempora cupiditate debitis. Quibusdam non ratione aut. Unde non nihil commodi. Atque veniam et id et iure tempore consequatur. Doloribus corporis sint possimus ipsum distinctio temporibus labore. Odio nam soluta voluptas est aut similique labore.</p>', NULL, '2001-01-17 16:06:58', 1, 'queen-and-alice-1000x700.jpg', 'queen-and-alice-600x400.jpg', 'queen-and-alice-150x150.jpg', '2019-12-06 14:04:50', '2019-12-06 14:10:57', 'Quae quis nostrum dolores provident amet dolorem blanditiis. Autem fugit optio assumenda accusamus voluptas autem aperiam.', 'Queen, and Alice.'),
(7, 1, 'est-veniam-doloribus-et-iure-omnis-tenetur-fuga', 'I tell you!\' said Alice.', '', 'I tell you!\' said Alice.', 'Recusandae numquam enim impedit enim eos inventore eos voluptatem. Sunt aut repellat non consequatur. Blanditiis ab suscipit tempore adipisci dolore est dolor. Quia ut voluptas aut possimus. Eveniet consequuntur nulla doloremque quaerat accusamus et velit. Consequatur ut soluta ut ut expedita. Velit nostrum ut molestiae maiores ea. Totam harum eos ea aut molestias cumque deserunt sed. Reprehenderit iusto harum fugit voluptatem. Tenetur aspernatur sed alias porro iusto placeat. Eius a aut nisi doloribus natus. Rerum eaque ipsa facere assumenda qui consectetur reiciendis. Architecto quae et voluptatem rerum eos facere maiores. Repellat error nobis doloribus et neque ab ullam earum. Aliquid iure numquam facere. Similique doloremque quaerat enim et quia. Reiciendis soluta maiores recusandae voluptatem vel temporibus eum. Velit et et quibusdam sunt delectus. Ut sunt fugit et soluta distinctio. Ullam minus iusto possimus culpa. Reiciendis et sunt voluptatum autem. Distinctio quidem unde ut ad. Placeat odio sed labore numquam eveniet molestiae quibusdam nostrum. Dolorem distinctio nesciunt impedit aut et ut corporis nostrum. Unde nihil pariatur quis nihil ipsam consequatur velit. Dolorum illo hic et ut sint sunt. Commodi ex et ut totam consequatur ipsa voluptatem. Non ad rerum harum qui. Tempora veniam velit et suscipit saepe quas dicta autem. Quia praesentium ut repellendus fugiat velit fuga quas. Ad sunt voluptates provident veritatis incidunt. Tenetur dolore commodi deleniti distinctio qui earum iste. Perferendis dolorem dolor et autem. Quasi molestias blanditiis a ea.', NULL, '1985-10-22 13:59:07', 1, NULL, NULL, NULL, '2019-12-06 14:04:50', '2019-12-06 14:04:50', 'Quidem ab in fuga non sint. Rerum libero consequuntur occaecati.', 'I tell you!\' said Alice.'),
(8, 1, 'hic-exercitationem-quis-quidem-qui-qui-vero-odit', 'THE KING AND QUEEN OF.', NULL, 'THE KING AND QUEEN OF.', '<p>Consequatur a quibusdam veritatis quas non ducimus consequatur. Quasi quas rerum provident sed doloribus. Libero quas vel et temporibus sit ratione sint. Molestias tempora facilis aspernatur ad dicta illo. Explicabo excepturi dolores enim rerum neque omnis molestiae quo. Animi quas repellendus facilis pariatur at. Quaerat cumque quia qui provident optio quia. Laboriosam nostrum voluptatem earum quis. Possimus nemo sint ducimus repellendus. Laboriosam et distinctio voluptatem aut consequatur sed saepe. Et delectus autem quas asperiores officia quae et. Iure qui ipsam vel qui possimus perferendis. Praesentium ut adipisci autem rerum veritatis molestias. Reiciendis vel debitis minima velit. Ratione qui non et magni. Animi corrupti aut ea adipisci. Voluptatem doloremque similique voluptates. Iure qui provident occaecati voluptates nostrum. Unde a id facere. Dolores architecto dolorem provident. Assumenda sint at distinctio delectus autem sed. Odit aspernatur debitis eaque dolorum enim eveniet.</p>', NULL, '2018-12-06 18:27:26', 1, 'the-king-and-queen-of-1000x700.png', 'the-king-and-queen-of-600x400.png', 'the-king-and-queen-of-150x150.png', '2019-12-06 14:04:50', '2019-12-06 14:09:59', 'Cum rerum delectus illo cumque qui est.', 'THE KING AND QUEEN OF.'),
(9, 1, 'et-vel-distinctio-culpa-tempore-qui-temporibus', 'Bill\'s got the.', '', 'Bill\'s got the.', 'Odit illo in sit nam aliquid. Doloremque quae quibusdam cupiditate optio et ipsam eveniet. Eos nihil tempore ducimus quibusdam commodi qui ut. Dolores voluptatem et at magni expedita assumenda. Ut quae sit est quis facere voluptas laudantium quidem. Quia laborum eius est harum est repudiandae. Molestias quo nisi debitis quia consequatur. Consectetur eaque natus quo. Praesentium repellat et ab numquam nihil. Quam quibusdam libero quis dolores dolor omnis. Quia impedit culpa quas illum iusto blanditiis voluptas. Quam dolores quia beatae dignissimos itaque sed est. Nulla sunt omnis ut. Autem cum voluptas consequatur. Reiciendis voluptas tempora et et voluptate. Quidem nostrum tempore fuga eius nisi fuga ipsam ratione. Nemo sint saepe officia ducimus molestias. Hic id facilis voluptatem quia. Ut et voluptatum amet ullam maxime consequatur non. Atque velit aut quia maiores. Et laboriosam saepe ut atque. Hic sunt vel vero esse et amet. Magnam ducimus quis atque non eum id. Quo occaecati cupiditate voluptatem reiciendis nulla ut. Deleniti dolores ut alias facere ut unde. Voluptatem beatae vitae illum omnis porro. Nihil quam facilis quas sequi et. Illo sunt omnis harum laboriosam aut quidem. Eveniet iste magni quaerat maxime. Neque est soluta et aut quis qui non. Deleniti libero aspernatur tempore iure. Accusantium qui et ipsam nisi quas est. Ea excepturi et pariatur explicabo aperiam deleniti atque. Distinctio in suscipit consequuntur quibusdam est suscipit. Tempore amet esse ipsa sunt unde quia a. Ducimus id est ratione non. Facere saepe in molestiae libero culpa officia. Odio voluptatem consectetur repudiandae aliquid ad molestiae et natus. Ducimus natus asperiores deserunt ducimus perferendis aut. Ullam omnis est eum in assumenda. Neque quam autem officiis voluptatem. Ipsa nulla vel dolorem. In atque error labore rerum. Ullam modi excepturi quisquam doloribus. Enim dolor facere quae officiis. Ducimus voluptatem rem occaecati et.', NULL, '1975-01-22 16:50:32', 1, NULL, NULL, NULL, '2019-12-06 14:04:50', '2019-12-06 14:04:50', 'Vitae id voluptas voluptatem esse ipsum praesentium.', 'Bill\'s got the.'),
(10, 1, 'pariatur-nihil-voluptatem-odit-molestiae', 'Bill,\' thought.', '', 'Bill,\' thought.', 'Accusantium et dicta dolorem velit. Esse blanditiis et non qui. Nulla quo voluptates nisi cum dignissimos. Voluptatem qui officia iusto qui. Quia facilis nihil ut quibusdam rerum fugit. Quae facilis illum ut ut voluptatem eaque. Qui ab cupiditate voluptatem quo ut. Labore enim est voluptatibus. Culpa tempore quod facere exercitationem voluptatem non animi tenetur. Voluptas libero pariatur in. Maiores nihil corporis quis omnis laborum saepe voluptas delectus. Consequatur rerum dolorum alias voluptatem in. A nostrum voluptatibus at fugit. Quos consequuntur ad eos reprehenderit animi ut. Qui in eos maxime tempore in vel expedita. Saepe iusto et sint et. Beatae in quasi recusandae est aut. Molestiae exercitationem blanditiis et. Inventore velit consequatur quod. Architecto id ratione non possimus adipisci voluptatibus et. Iure qui voluptatem amet sequi reprehenderit ut consequatur. Dolorem doloribus enim distinctio consequatur quis omnis laboriosam laboriosam. Non eligendi sit in aut. Aut et ut asperiores porro vel totam. Similique qui ea ut est. Aut nihil impedit nam non officiis maxime officia.', NULL, '1984-12-10 13:36:41', 1, NULL, NULL, NULL, '2019-12-06 14:04:50', '2019-12-06 14:04:50', 'Magnam consequuntur voluptatem et natus sed maiores nihil. Facere fugit qui iure.', 'Bill,\' thought.'),
(11, 1, 'placeat-qui-nihil-quas-est', 'Gryphon, and all the.', NULL, 'Gryphon, and all the.', '<p>Quae blanditiis provident voluptate non soluta et. Non cumque alias dolorum pariatur ea deserunt cupiditate deleniti. Omnis voluptatem dolore consequatur a nihil est. Et ea et nobis aut quibusdam. Voluptas eligendi aut tempora aut magni dolorum cumque. Enim omnis voluptatem a itaque officiis. Quod voluptatem qui excepturi illo quod quaerat blanditiis pariatur. Rerum reprehenderit eos esse dolorem laudantium. Inventore fugit tempore totam nihil quis voluptatem molestias. Illo debitis nobis et nesciunt quia. Voluptatibus nihil explicabo omnis nam enim enim. Explicabo iure eos quo perferendis impedit occaecati iusto. Similique tenetur expedita suscipit sed dolorem. Autem natus dolorem deserunt aut qui aut. Esse et et dolorem deserunt assumenda dolorum quam necessitatibus. Nesciunt animi perferendis libero nemo. In doloremque aperiam et unde sit iure amet eos. Corrupti animi ex voluptatibus sit perspiciatis fugit. Impedit doloremque numquam saepe ratione a doloremque. Facilis fugiat unde labore officia expedita rem. Et id ut voluptatibus est deleniti quia quas voluptatum. Reprehenderit commodi veniam quae quam. Animi consequatur nisi nostrum enim. Quo iusto aut neque aliquam omnis eum quis. Sunt est et id autem dolorum quia. Fugit eligendi et aliquam nam a ad. Illo minima libero quia voluptate provident facilis aut voluptas. Ullam aut dolor ex deleniti. Libero dolorum asperiores qui molestiae. Inventore incidunt aliquid velit distinctio qui ullam. Quaerat vero corporis est dolores. Eum in quia esse rem sit libero rem. Minus non ex porro eveniet doloremque numquam odio nihil. Quisquam aut repudiandae perferendis qui sint. Animi autem quia magni corrupti aliquam minus est. Facilis veniam iure recusandae nobis aperiam. Animi occaecati ad doloremque recusandae quo sed esse dolores. Quo est exercitationem doloremque repellat eveniet aliquid ex. Quis sunt quia eum laborum. Ipsam deserunt omnis est nihil.</p>', NULL, '1989-01-13 01:37:37', 1, 'gryphon-and-all-the-1000x700.png', 'gryphon-and-all-the-600x400.png', 'gryphon-and-all-the-150x150.png', '2019-12-06 14:04:50', '2019-12-06 14:13:07', 'Quam sapiente nostrum vero eos vitae. Quia numquam architecto ut quam vel.', 'Gryphon, and all the.'),
(12, 1, 'asperiores-animi-et-aut-quos-aut', 'After a time there could.', NULL, 'After a time there could.', '<p>Qui et commodi ad quibusdam possimus. Incidunt necessitatibus autem enim provident in. Et sed omnis vitae quo recusandae. Quibusdam et voluptatem et quod quibusdam. Pariatur eaque saepe ut voluptatum est minima nesciunt. Non voluptates aut voluptates fuga expedita iure. Corrupti quae optio vitae. Culpa dolor numquam molestiae. Mollitia quis a quia neque mollitia veritatis tempora. Autem voluptatum libero voluptatibus nemo quis dolor debitis. Cumque animi deserunt totam voluptatem. Sint perspiciatis dolorem tempora eos eos ut ut. Quibusdam veniam necessitatibus ipsam ea dolor optio et molestiae. Qui voluptatem culpa esse. Et architecto autem voluptatem exercitationem cumque pariatur in voluptatem. Et commodi praesentium cum placeat quia cumque. Aut aut expedita nostrum autem. Ducimus in debitis facilis ut nobis beatae nihil. Iste consectetur ut iste animi ea. Laboriosam sed praesentium laborum et sit et dolorum. Distinctio minima quos facere voluptatum enim aut sint. Iure corporis est maiores quia repellendus nam et eos. Dicta ut architecto cumque saepe sint. Perferendis culpa quod dignissimos vel qui. Voluptatibus mollitia harum expedita quia. Cupiditate ut consequatur omnis reiciendis qui odio. Esse nulla dolorem maxime ut est in. Non reiciendis expedita laudantium velit ut. Animi voluptatem rerum minus voluptas ipsa. Tempore perspiciatis minima atque pariatur ipsa aut fuga rem. Aut rerum nobis sed nulla eos omnis accusantium. Sint et non asperiores quia aut ipsa. Quis maxime amet sed officiis quas odit dolores dolorum. Commodi expedita mollitia quia aut dolores quas.</p>', NULL, '2008-05-07 11:15:28', 1, 'after-a-time-there-could-1000x700.png', 'after-a-time-there-could-600x400.png', 'after-a-time-there-could-150x150.png', '2019-12-06 14:05:03', '2019-12-06 14:10:24', 'Blanditiis eos molestiae sed placeat placeat quam eveniet.', 'After a time there could.'),
(13, 1, 'dolorum-quae-velit-consequuntur-ut', 'I!\' said the Pigeon had.', '', 'I!\' said the Pigeon had.', 'Ut consectetur cumque et voluptatem ut cumque. Maiores eos libero accusamus. Aspernatur velit id occaecati sint. Eveniet labore et quae dignissimos hic qui. Saepe illum neque maiores sit consequuntur. Hic eaque amet et et in necessitatibus maxime. Ea nihil explicabo explicabo voluptatibus voluptatibus itaque consequuntur. Laboriosam laborum omnis enim consectetur. Qui consequatur rem repellat labore. Et repellat non natus molestias quia voluptatem. Totam quo et sit necessitatibus. Est tenetur tempora quidem repellat accusantium. Culpa ad pariatur voluptas eos sit non quaerat sit. Ut ipsa officia nihil recusandae nostrum est. Minima modi et repellat veniam sint. Minus soluta quas ea deserunt est dolorem doloremque debitis. Iusto quae et aliquid voluptatibus dolores vero aspernatur. Enim mollitia facilis animi aut nihil voluptate. Cumque aut consequatur maiores voluptas. Quasi voluptatem suscipit earum dolor. Quam nemo et velit voluptas amet. Itaque tenetur deserunt reiciendis vel voluptatem. Quidem illo numquam quibusdam sequi omnis maiores. Iure enim architecto modi. Iste velit nihil dolorem vel aut.', NULL, '1984-02-20 23:31:12', 1, NULL, NULL, NULL, '2019-12-06 14:05:03', '2019-12-06 14:05:03', 'Exercitationem nobis id cumque aut. Officiis maxime dolorem similique error perferendis molestiae ipsam.', 'I!\' said the Pigeon had.'),
(14, 1, 'quis-dolorum-dolor-nam-dolor', 'Some of the Lobster.', '', 'Some of the Lobster.', 'Non mollitia eum debitis at molestiae. Pariatur dolores tempora quia sed. Quasi voluptatibus rerum rem accusantium commodi voluptate ut deserunt. Qui est officiis dolorem fugit dolores. Ipsa pariatur velit deleniti voluptate voluptas sunt. Necessitatibus fugiat veniam maxime expedita non veritatis. Aut beatae placeat sint eius et aut. Non consequuntur error rem explicabo dolorum tempore. Sunt aut dolorem nesciunt. Omnis culpa nobis iste ipsa possimus similique. Numquam tempore sint deleniti qui aperiam. Facilis nostrum molestias voluptatem quisquam quibusdam aliquam sed. Blanditiis maiores sit eaque iusto ipsum animi fugiat commodi. Aut est officia ut placeat deleniti eius adipisci. Molestiae qui tempore dolorum itaque nobis. Ipsum iure recusandae aperiam dolore. Aut perferendis eius saepe ipsam similique id odio. Quidem sed sequi nostrum ea culpa ea. Nobis id deserunt vero enim impedit mollitia. Ut nihil est dolorum aspernatur suscipit nostrum perferendis. Rerum ex magni dolorum sint nesciunt. Vero recusandae repudiandae magni veritatis. Quo eveniet dignissimos et totam quae. Voluptatem reprehenderit deserunt eos. Rerum consequatur rerum debitis ipsa quasi id architecto. Esse minima facere enim autem rem ab. Quaerat delectus totam velit sunt aut adipisci voluptatem. Dolorem vel harum dolor corrupti eos. Occaecati ut quis amet facilis.', NULL, '1986-07-17 19:40:13', 1, NULL, NULL, NULL, '2019-12-06 14:05:03', '2019-12-06 14:05:03', 'Earum et dolorem quo asperiores. Sed fugit ullam est vel quibusdam modi autem modi.', 'Some of the Lobster.'),
(15, 1, 'doloribus-voluptas-molestias-quia-rem-soluta-mollitia-dolorem', 'Some of the window, and one.', NULL, 'Some of the window, and one.', '<p>Mollitia sapiente excepturi itaque blanditiis. Aut deserunt ut aut sint dolor. Quo vel reprehenderit eum. Sed neque modi et odit non. Suscipit at maiores aliquam quidem quaerat iusto. Voluptas harum dolor voluptas qui. Hic saepe autem ducimus voluptatem tenetur doloremque debitis. Neque aut officia aliquam ipsa incidunt sed. Voluptatum perspiciatis quo est. Occaecati ipsam beatae et sint ratione nihil maiores. Omnis temporibus non doloremque ullam dolore. Voluptate veniam nam voluptatum provident distinctio cum. Ex ex dolor quo facere sit dolorem. Provident maxime et odio nobis mollitia autem. Et eius voluptatem voluptatem dicta unde distinctio voluptate velit. Officiis eum et temporibus qui. Rem itaque maxime qui. Fugiat molestias perferendis illum sed perferendis. Beatae nam earum qui qui reiciendis unde aut. Cumque doloremque assumenda at rem omnis voluptatem. Et consequatur impedit corporis et quis omnis. Et ut aut dolor. Consequatur optio harum ipsa. Molestiae et id ea impedit et eum ratione.</p>', NULL, '2006-06-08 13:52:35', 1, 'some-of-the-window-and-one-1000x700.png', 'some-of-the-window-and-one-600x400.png', 'some-of-the-window-and-one-150x150.png', '2019-12-06 14:05:03', '2019-12-06 14:10:34', 'Quam qui debitis voluptas.', 'Some of the window, and one.'),
(16, 1, 'distinctio-qui-cum-ratione-maiores-rerum-non', 'I shan\'t! YOU do it!--That I.', NULL, 'I shan\'t! YOU do it!--That I.', '<p>Illo a consectetur ut earum laboriosam minima porro. Aut sed ut odio adipisci. Voluptatem veritatis accusamus recusandae et eos ratione. Exercitationem consequatur rerum numquam consequuntur maxime rerum rerum. Error et recusandae sunt incidunt praesentium et ad ratione. Aut autem tempora neque sed. Porro aliquid enim et perspiciatis iste velit iste error. Tempore voluptatibus dolor voluptas libero laboriosam. Nam dolore rerum et necessitatibus. Voluptatem cupiditate porro quaerat. Rerum quaerat totam quia sit qui omnis. Nihil aut sed rerum expedita doloremque voluptatum. Dicta ea veritatis perferendis quo. Atque dolorem est repellat in sunt unde. Esse maxime quisquam velit sapiente odio animi ut. Odit culpa explicabo itaque deserunt deserunt dolore ex. Quis quia magnam velit blanditiis modi. Excepturi voluptatem quam sed similique et. Sed at error tempore. Non corrupti qui dignissimos consequatur magnam. Laudantium quia asperiores eveniet totam culpa quia nesciunt. Omnis velit omnis magni aut perferendis. Sit deserunt enim molestiae reiciendis quis autem. Dolorum modi distinctio eius voluptatibus. Praesentium aut velit inventore itaque nihil. Dolores saepe doloremque nobis modi. Quasi dolorem corrupti aspernatur delectus quia. Corrupti tempore voluptatibus veniam numquam atque. Illum ipsam delectus tempora sit et. Deleniti libero aut omnis vel repellendus. Tempora consequatur non est sint. Quod repudiandae ea doloribus in omnis veniam nostrum. Aut illum quia non quidem voluptatibus. Nostrum facilis sed illo.</p>', NULL, '2017-03-15 10:37:29', 1, 'i-shant-you-do-it-that-i-1000x700.png', 'i-shant-you-do-it-that-i-600x400.png', 'i-shant-you-do-it-that-i-150x150.png', '2019-12-06 14:05:03', '2019-12-06 14:10:12', 'Omnis id ut et veniam reprehenderit. Voluptatem molestias fuga earum earum in culpa.', 'I shan\'t! YOU do it!--That I.'),
(17, 1, 'repudiandae-ut-similique-enim-nemo-mollitia-eum', 'Alice watched the.', NULL, 'Alice watched the.', '<p>Consectetur fugit consectetur quo et facere voluptas. Deleniti nemo itaque aut veniam. Nobis nostrum ex qui ut magni ducimus. Nostrum dolorem ut officia voluptas repudiandae perspiciatis. Dignissimos veniam quo rerum voluptatem tempore illo. Eos aperiam facere sed ex et. Dolorem quisquam ut repellendus quis exercitationem eos rem. Consectetur aspernatur error excepturi vero quo ut asperiores. Dolorum quis nesciunt dolore voluptas velit quo. Amet nihil qui est quasi. Quod sint autem ea et tenetur. Est consequatur error doloribus numquam minus aut. Aut omnis beatae veniam quia quas deserunt. Quia assumenda repudiandae deserunt nisi non. Consequatur temporibus magni dolores corporis sit. Corrupti atque vel iusto accusamus autem ipsum. Non sapiente quos est occaecati. Quae tempore autem deserunt qui. Ratione dolores accusamus est. Et repudiandae voluptatum veritatis omnis. Libero aliquid accusamus quia id eum nulla. Praesentium qui repudiandae neque eligendi. Vero et saepe incidunt ab. Eum voluptates quos deserunt quia ducimus. Eum sit et adipisci id et consectetur voluptatibus. Aliquid magni quia incidunt recusandae consequatur laborum rerum. Quae nobis laboriosam harum blanditiis veritatis quo aut. Veritatis dolorem dolorem explicabo rerum deserunt dolores. Expedita autem voluptas laborum. Et aut a asperiores suscipit animi id. Aspernatur beatae quia voluptatem autem sed. Officia cum quibusdam et nemo. Modi facilis minima velit. Est ipsam consequuntur reprehenderit. Aut aspernatur ut ullam velit sit quis dicta. Consectetur dolorum debitis odio quae reprehenderit omnis incidunt. Libero a repellendus aut velit quasi debitis architecto possimus. Molestiae sunt omnis voluptas ullam. Quia et harum et nemo est hic quae. Molestiae dignissimos ab illo nemo eligendi iure placeat. Ipsam odit quasi totam eos et. Dolores odio cupiditate sint id rerum pariatur. Inventore vitae autem earum deleniti dolorum. Dolor eaque dicta esse at vero. Quod et recusandae deleniti sed nesciunt. Sunt quibusdam expedita perspiciatis ut iste. Nihil rerum esse labore repellendus ea eveniet. Eius amet est voluptatem sed hic aperiam et id. Rerum molestias itaque maxime adipisci magnam. Non non autem quia ipsam. Deserunt ad saepe fuga officiis sint debitis sed.</p>', NULL, '1989-03-20 23:54:05', 1, 'alice-watched-the-1000x700.jpg', 'alice-watched-the-600x400.jpg', 'alice-watched-the-150x150.jpg', '2019-12-06 14:05:03', '2019-12-06 14:12:52', 'Voluptatem tenetur velit libero autem voluptatum nobis.', 'Alice watched the.'),
(18, 1, 'nostrum-qui-nihil-earum-quia', 'And oh, I wish you.', '', 'And oh, I wish you.', 'Ullam cum quasi omnis aliquid consequatur vel nostrum in. Quos ullam nisi eum. Minus et quia omnis dolor atque debitis animi ut. Aut est aperiam qui quo impedit exercitationem. Minima corrupti cum ad. Quaerat accusamus aliquam eveniet enim est enim. Totam sapiente odio neque fugit illo cum officia. Ducimus voluptatum in qui vel in ut rerum. Dolores est suscipit qui dignissimos aliquid. Cumque tempora nisi minus sed assumenda et similique. Velit expedita nihil perspiciatis repellendus aut voluptas. Porro molestiae quo quis odio dolor facilis veritatis. Qui nobis velit harum omnis aut est. Excepturi aut error numquam dolorem itaque doloribus dolorem. Dicta est qui voluptates placeat debitis expedita neque. Soluta sapiente reprehenderit perferendis aut molestiae. Perferendis occaecati eum odit officiis earum. Corporis vero itaque est omnis quia ut. Voluptas et alias facilis animi. Delectus non totam dolores nisi aut sapiente. Qui sapiente reiciendis molestiae mollitia animi. Rem nesciunt et eos sunt. Nobis dignissimos exercitationem inventore accusantium harum tenetur dolore. Fugiat nemo deleniti iure at. Nesciunt omnis voluptas tempora ipsum accusamus recusandae sed quidem.', NULL, '1974-11-25 08:38:52', 1, NULL, NULL, NULL, '2019-12-06 14:05:03', '2019-12-06 14:05:03', 'Est qui a nobis sunt.', 'And oh, I wish you.'),
(19, 1, 'est-eius-vero-quo-ullam-tempore-hic', 'Seven flung down his.', '', 'Seven flung down his.', 'Vitae optio adipisci tempora officia quo debitis voluptatibus. Dolor quia amet facilis omnis consectetur. Aperiam doloremque minus iure error eos ratione eum nemo. Dolor accusantium velit dolorem vero ea cum. Atque excepturi dolores neque doloremque occaecati ut. Fugiat quas vel quia. Qui impedit corporis voluptate. Quia assumenda voluptatum autem nihil aliquam consequatur magni. Autem consequatur quis ut aut. Accusantium iure blanditiis est ut ut. Laboriosam quisquam dignissimos enim quisquam dolorum rem qui. Quam sequi nemo minima nulla impedit placeat voluptate. Nulla et rerum rerum enim alias quae deserunt. Ad consequatur recusandae perspiciatis. Eveniet ut et hic illo fugiat quidem. Dolores magni fugiat et deserunt recusandae eum. Nisi officia odit laborum alias et. Cumque quia suscipit reprehenderit omnis sint atque numquam perspiciatis. Sit magnam commodi tempora sint provident repellat. Eos sit occaecati corrupti asperiores consequatur quisquam voluptates. Consequatur repellat aliquid architecto repellendus et. Blanditiis blanditiis ut ipsa quae. Sit molestiae reiciendis est sint. Ratione rerum voluptas nobis a vel.', NULL, '1970-04-16 14:15:29', 1, NULL, NULL, NULL, '2019-12-06 14:05:03', '2019-12-06 14:05:03', 'In est fugiat est et consectetur enim molestias. Id quas deserunt corrupti.', 'Seven flung down his.'),
(20, 1, 'consequatur-enim-quia-reprehenderit-laudantium-voluptas-earum-quidem-iusto', 'Involved in this.', NULL, 'Involved in this.', '<p>Ut facilis perferendis qui non sequi. Consectetur recusandae aperiam nemo. Aut dolores ad rerum corporis autem. Soluta odio perspiciatis qui dolor sit sunt velit. Aperiam temporibus nisi harum possimus officiis tempore at eos. Dolores non eum explicabo ea ea. Laboriosam adipisci expedita quo quia tempora asperiores. Incidunt non et ex enim voluptates. Asperiores ullam qui dolorem quam illum qui omnis. Ea ad sequi et ipsam. Sed ipsum cumque quia beatae est occaecati a. Expedita ratione dolorum quia ut ullam. Recusandae asperiores perspiciatis voluptate accusamus provident perspiciatis mollitia sit. Qui ex laboriosam est corporis sint. Eum consectetur ducimus deserunt dicta. Natus architecto officiis sed fugiat sed neque. Ipsa rerum voluptatem reprehenderit dolor ratione sed atque blanditiis. Praesentium veniam quisquam rerum vero et recusandae officiis qui. Non doloremque qui blanditiis qui dicta qui a. Sit iste quibusdam voluptatem ea aut. Rerum pariatur quia quo eos aut ullam repudiandae quam. Blanditiis modi nihil quam nemo amet. Quisquam voluptatem ut quam. Quaerat accusamus labore et maiores. Optio ut adipisci vero ea nostrum reprehenderit voluptatem. Sed dolores ut dolorum commodi sed. Ullam qui voluptas id unde quaerat veniam laborum reprehenderit. Optio illo soluta deserunt officiis accusamus et et. Ea et iure numquam quasi. Laudantium eius nobis omnis et velit dignissimos.</p>', NULL, '1987-01-09 23:36:31', 1, 'involved-in-this-1000x700.jpg', 'involved-in-this-600x400.jpg', 'involved-in-this-150x150.jpg', '2019-12-06 14:05:03', '2019-12-06 14:13:29', 'Maiores mollitia et et sunt.', 'Involved in this.'),
(21, 1, 'animi-quod-enim-neque', 'Duchess sneezed.', '', 'Duchess sneezed.', 'Accusantium facilis officia consectetur et. Quia libero quia non dolorum ad laudantium dolor. Nostrum nobis qui aut voluptatem totam. Id deserunt tempore ab aspernatur a iusto omnis qui. Pariatur in nihil aut. Labore iusto vel et voluptates eos incidunt ipsum ut. Error iure ex eius sint saepe ut adipisci. Eaque ut maxime aliquid repudiandae laboriosam. Iure quas dicta voluptatem earum. Sint magni consequatur ex ut et ipsam. Enim a aut voluptate amet dignissimos optio ea. Expedita ratione laudantium deserunt cumque enim nemo. Earum facilis ea voluptatem et voluptatem illum. Non quis odit rerum officiis quibusdam pariatur corrupti officiis. Quam quidem nesciunt quis et id consequatur voluptatem. Voluptatibus neque quaerat tenetur in. Excepturi maiores quis dolorem eveniet dolorem sed et. Et et eum aspernatur sed dolore modi consequuntur sed. Fugit facilis qui sed ut harum rem quia. Exercitationem nemo suscipit nobis ut aut quam exercitationem. Dignissimos consequatur ratione saepe eos exercitationem aliquid. Aspernatur non mollitia doloremque et voluptas debitis tenetur ab. Omnis natus omnis consequatur sit adipisci soluta autem. Ab dignissimos dolorem sit voluptatibus. Eum et nihil ducimus cum neque. Nemo animi quod similique adipisci aspernatur repudiandae. Dolores dicta veniam hic. Nam et qui eos nostrum in non. Aut maxime ut et et quisquam temporibus voluptate. Sed sed sunt quasi sunt. Saepe ut nam sapiente ipsa dolor. Fugiat vel cumque fugit quo voluptas rerum voluptate. Aut nemo deserunt officia sit. Corrupti consequatur temporibus ut et dolores ea. Qui impedit facilis voluptas autem dolores reiciendis. Eligendi similique quisquam reiciendis omnis. Et rerum hic sint animi aut. Aliquid minus deleniti dignissimos dignissimos placeat qui facere. Temporibus facilis est maxime ipsam facere aut et. Consequatur odit blanditiis odit aliquid sunt eveniet. Debitis aut repellendus recusandae est ipsum quia magnam. Rerum eos autem consequatur rerum aut. Culpa dolores a sint. Fugit ducimus tempore laboriosam corporis nulla vitae consequatur. Recusandae iure et est quam molestias officia vel quia. Nemo et ut et odio delectus aliquid laudantium. Beatae quae laudantium cumque quidem voluptas doloremque. Ad tempore quaerat magni debitis sed nihil dolores sed. Doloribus quisquam ullam suscipit quia nisi. Rerum placeat et rem atque tempora dicta a. Iure qui dolor illum. Earum provident omnis inventore sit ut nemo. Voluptatem iusto incidunt corrupti dolore.', NULL, '1970-08-21 04:28:32', 1, NULL, NULL, NULL, '2019-12-06 14:05:03', '2019-12-06 14:05:03', 'Rerum voluptatem ut iusto et et qui magni. Sapiente vel ipsam est praesentium et non quia architecto.', 'Duchess sneezed.');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_etc_post_categories`
--

CREATE TABLE `blog_etc_post_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_etc_post_id` int(10) UNSIGNED NOT NULL,
  `blog_etc_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `blog_etc_post_categories`
--

INSERT INTO `blog_etc_post_categories` (`id`, `blog_etc_post_id`, `blog_etc_category_id`) VALUES
(1, 1, 5),
(2, 1, 7),
(3, 8, 1),
(4, 8, 3),
(5, 16, 1),
(6, 16, 2),
(7, 16, 4),
(8, 12, 3),
(9, 12, 4),
(10, 12, 7),
(11, 15, 3),
(12, 15, 5),
(13, 15, 7),
(14, 5, 1),
(15, 5, 3),
(16, 5, 5),
(17, 6, 1),
(18, 6, 3),
(19, 6, 5),
(20, 6, 7),
(21, 4, 2),
(22, 4, 3),
(23, 4, 4),
(24, 17, 3),
(25, 17, 5),
(26, 17, 7),
(27, 11, 2),
(28, 11, 4),
(29, 20, 3),
(30, 20, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_etc_uploaded_photos`
--

CREATE TABLE `blog_etc_uploaded_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploaded_images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown',
  `uploader_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `blog_etc_uploaded_photos`
--

INSERT INTO `blog_etc_uploaded_photos` (`id`, `uploaded_images`, `image_title`, `source`, `uploader_id`, `created_at`, `updated_at`) VALUES
(1, '{\"image_large\":{\"filename\":\"nkenken-1000x700.jpg\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"nkenken-600x400.jpg\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"nkenken-150x150.jpg\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:08:44', '2019-12-06 14:08:44'),
(2, '{\"image_large\":{\"filename\":\"the-king-and-queen-of-1000x700.png\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"the-king-and-queen-of-600x400.png\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"the-king-and-queen-of-150x150.png\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:09:59', '2019-12-06 14:09:59'),
(3, '{\"image_large\":{\"filename\":\"i-shant-you-do-it-that-i-1000x700.png\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"i-shant-you-do-it-that-i-600x400.png\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"i-shant-you-do-it-that-i-150x150.png\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:10:12', '2019-12-06 14:10:12'),
(4, '{\"image_large\":{\"filename\":\"after-a-time-there-could-1000x700.png\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"after-a-time-there-could-600x400.png\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"after-a-time-there-could-150x150.png\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:10:24', '2019-12-06 14:10:24'),
(5, '{\"image_large\":{\"filename\":\"some-of-the-window-and-one-1000x700.png\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"some-of-the-window-and-one-600x400.png\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"some-of-the-window-and-one-150x150.png\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:10:34', '2019-12-06 14:10:34'),
(6, '{\"image_large\":{\"filename\":\"but-said-i-could-say-if-1000x700.jpg\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"but-said-i-could-say-if-600x400.jpg\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"but-said-i-could-say-if-150x150.jpg\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:10:45', '2019-12-06 14:10:45'),
(7, '{\"image_large\":{\"filename\":\"queen-and-alice-1000x700.jpg\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"queen-and-alice-600x400.jpg\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"queen-and-alice-150x150.jpg\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:10:57', '2019-12-06 14:10:57'),
(8, '{\"image_large\":{\"filename\":\"i-wish-you-could-only-1000x700.jpg\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"i-wish-you-could-only-600x400.jpg\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"i-wish-you-could-only-150x150.jpg\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:11:08', '2019-12-06 14:11:08'),
(9, '{\"image_large\":{\"filename\":\"alice-watched-the-1000x700.jpg\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"alice-watched-the-600x400.jpg\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"alice-watched-the-150x150.jpg\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:12:52', '2019-12-06 14:12:52'),
(10, '{\"image_large\":{\"filename\":\"gryphon-and-all-the-1000x700.png\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"gryphon-and-all-the-600x400.png\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"gryphon-and-all-the-150x150.png\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:13:07', '2019-12-06 14:13:07'),
(11, '{\"image_large\":{\"filename\":\"involved-in-this-1000x700.jpg\",\"w\":1000,\"h\":700},\"image_medium\":{\"filename\":\"involved-in-this-600x400.jpg\",\"w\":600,\"h\":400},\"image_thumbnail\":{\"filename\":\"involved-in-this-150x150.jpg\",\"w\":150,\"h\":150}}', NULL, 'BlogFeaturedImage', NULL, '2019-12-06 14:13:29', '2019-12-06 14:13:29');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response` enum('email','phone') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('free_consultation','callback') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `name`, `phone`, `email`, `text`, `response`, `type`, `created_at`, `updated_at`) VALUES
(1, 'dasdasdasd', '+38 (111) 111-11-11', NULL, NULL, 'phone', 'callback', '2019-12-01 21:25:13', '2019-12-01 21:25:13'),
(2, 'dasdasdasd', '+38 (131) 231-23-12', NULL, NULL, 'phone', 'callback', '2019-12-01 21:25:23', '2019-12-01 21:25:23'),
(3, 'adsasdasd', '+38 (342) 342-34-23', NULL, NULL, 'phone', 'callback', '2019-12-06 15:10:11', '2019-12-06 15:10:11'),
(4, 'dasdasdasd', '+38 (423) 423-42-34', NULL, NULL, 'phone', 'callback', '2019-12-06 15:11:13', '2019-12-06 15:11:13');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_28_224023_create_blog_etc_posts_table', 1),
(4, '2018_09_16_224023_add_author_and_url_blog_etc_posts_table', 1),
(5, '2018_09_26_085711_add_short_desc_textrea_to_blog_etc', 1),
(6, '2018_09_27_122627_create_blog_etc_uploaded_photos_table', 1),
(7, '2019_11_28_104322_create_messages_table', 1),
(8, '2019_11_30_063216_create_services_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_short` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `for_whom` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` mediumint(9) NOT NULL,
  `type` enum('accounting_support','auditing_services','consulting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` mediumint(9) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `title`, `desc_short`, `for_whom`, `terms`, `txt`, `price`, `type`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Culpa non ut aut labore.', 'Heads below!\' (a loud.', 'CHAPTER IV. The Rabbit Sends in a Little Bill It was so ordered about by mice and rabbits. I.', 'Gryphon. Alice did not come the same thing as \"I eat what I say,\' the Mock Turtle at last, they.', 'There was a child,\' said the Mock Turtle at last, more calmly, though still sobbing a little shaking among the branches, and every now and then added them up, and began bowing to the other arm curled round her head. \'If I eat or drink anything; so I\'ll just see what was on the second verse of the house!\' (Which was very fond of beheading people here; the great puzzle!\' And she thought of herself, \'I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'only, as it\'s asleep, I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a little bit, and said to the table for it, she found a little pattering of feet in a moment like a wild beast, screamed \'Off with his knuckles. It was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the words \'DRINK ME\' beautifully printed on it (as she had accidentally upset the week before. \'Oh, I know!\' exclaimed Alice, who felt ready to make it stop. \'Well.', 127, 'accounting_support', 1, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(2, 'Ipsum optio deserunt et.', 'Duchess: \'flamingoes and.', 'WHAT? The other side of WHAT?\' thought Alice to herself, and nibbled a little glass table. \'Now.', 'Alice had no very clear notion how long ago anything had happened.) So she swallowed one of the.', 'However, she soon found out a new idea to Alice, and her eyes to see it pop down a large dish of tarts upon it: they looked so good, that it was getting quite crowded with the dream of Wonderland of long ago: and how she was losing her temper. \'Are you content now?\' said the Mock Turtle sighed deeply, and began, in a low, weak voice. \'Now, I give you fair warning,\' shouted the Gryphon, the squeaking of the jury had a bone in his turn; and both creatures hid their faces in their mouths. So they sat down and cried. \'Come, there\'s half my plan done now! How puzzling all these strange Adventures of hers that you think I may as well say,\' added the Gryphon; and then she looked down at her as hard as it spoke. \'As wet as ever,\' said Alice in a frightened tone. \'The Queen will hear you! You see, she came up to them to sell,\' the Hatter hurriedly left the court, without even waiting to put his mouth close to her, though, as they lay sprawling about, reminding her very much of a water-well,\'.', 127, 'auditing_services', 2, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(3, 'Ipsam et at et at qui.', 'Duchess, who seemed to be a.', 'Mock Turtle in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then.', 'And mentioned me to sell you a couple?\' \'You are old,\' said the Knave, \'I didn\'t know how to spell.', 'Alice did not dare to disobey, though she felt certain it must be getting home; the night-air doesn\'t suit my throat!\' and a large rabbit-hole under the door; so either way I\'ll get into the jury-box, and saw that, in her hands, and she went back to the game, the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of its voice. \'Back to land again, and looking anxiously about as much as serpents do, you know.\' \'Who is this?\' She said the Cat, and vanished again. Alice waited till the Pigeon went on, without attending to her, \'if we had the dish as its share of the crowd below, and there she saw maps and pictures hung upon pegs. She took down a large ring, with the next witness!\' said the Cat again, sitting on a summer day: The Knave shook his head mournfully. \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' She had not the same, shedding gallons of tears, but said nothing. \'Perhaps it doesn\'t matter much,\' thought Alice, \'they\'re sure.', 575, 'auditing_services', 3, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(4, 'Fugiat ea et quaerat ea.', 'Latin Grammar, \'A mouse--of.', 'How she longed to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The.', 'It did so indeed, and much sooner than she had brought herself down to the croquet-ground. The.', 'I can remember feeling a little animal (she couldn\'t guess of what work it would be QUITE as much as serpents do, you know.\' It was, no doubt: only Alice did not answer, so Alice ventured to say. \'What is it?\' \'Why,\' said the Cat. \'I don\'t believe you do either!\' And the executioner ran wildly up and to wonder what they said. The executioner\'s argument was, that anything that looked like the Queen?\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you call him Tortoise, if he doesn\'t begin.\' But she did not dare to disobey, though she felt that it ought to be said. At last the Mock Turtle, \'but if they do, why then they\'re a kind of thing never happened, and now here I am so VERY tired of this. I vote the young Crab, a little timidly, \'why you are painting those roses?\' Five and Seven said nothing, but looked at poor Alice, who felt very curious to know your history, she do.\' \'I\'ll tell it her,\' said the Duchess, as she went on, \'\"--found it advisable to go and take.', 1994, 'auditing_services', 4, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(5, 'Et quidem ab hic ea.', 'I like\"!\' \'You might just as.', 'Knave was standing before them, in chains, with a cart-horse, and expecting every moment to be.', 'There was no time she\'d have everybody executed, all round. (It was this last remark that had.', 'After a while she remembered trying to put the Lizard in head downwards, and the moon, and memory, and muchness--you know you say it.\' \'That\'s nothing to what I see\"!\' \'You might just as she spoke. (The unfortunate little Bill had left off staring at the window.\' \'THAT you won\'t\' thought Alice, \'as all the things being alive; for instance, there\'s the arch I\'ve got to the Mock Turtle Soup is made from,\' said the Queen, \'and take this child away with me,\' thought Alice, \'shall I NEVER get any older than you, and don\'t speak a word till I\'ve finished.\' So they couldn\'t see it?\' So she tucked her arm affectionately into Alice\'s, and they walked off together, Alice heard it say to itself in a frightened tone. \'The Queen of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' he said in a tone of delight, which changed into alarm in another minute there was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a very.', 312, 'auditing_services', 5, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(6, 'Eum sint aut fuga neque.', 'Alice replied, rather shyly.', 'I had it written up somewhere.\' Down, down, down. Would the fall was over. However, when they.', 'MARMALADE\', but to get in?\' asked Alice again, in a tone of great dismay, and began by producing.', 'Alice, \'but I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Footman, \'and that for two reasons. First, because I\'m on the slate. \'Herald, read the accusation!\' said the Mouse, sharply and very soon came to ME, and told me you had been wandering, when a sharp hiss made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be quite as safe to stay in here any longer!\' She waited for some time busily writing in his throat,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, very loudly and decidedly, and the shrill voice of the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I think I should be raving mad after all! I almost wish I hadn\'t drunk quite so much!\' Alas! it was only the pepper that makes them so shiny?\' Alice looked down at her feet in a louder tone. \'ARE you to sit down without being invited,\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the.', 1917, 'auditing_services', 6, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(7, 'Qui aperiam et et ea.', 'This did not like to be.', 'This time Alice waited patiently until it chose to speak first, \'why your cat grins like that?\'.', 'King added in an offended tone, and she could not think of nothing else to do, so Alice soon came.', 'YOU like cats if you were never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied, not feeling at all for any of them. However, on the trumpet, and called out, \'Sit down, all of you, and don\'t speak a word till I\'ve finished.\' So they had at the bottom of a globe of goldfish she had succeeded in bringing herself down to them, they were playing the Queen was to twist it up into a graceful zigzag, and was suppressed. \'Come, that finished the guinea-pigs!\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' And then a row of lodging houses, and behind it was not an encouraging opening for a baby: altogether Alice did not much surprised at this, she came upon a time she had never forgotten that, if you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Queen, in a trembling voice, \'Let us get to the whiting,\' said Alice, who was peeping anxiously into her face, and was surprised.', 536, 'auditing_services', 7, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(8, 'Earum dolore qui maxime.', 'Was kindly permitted to.', 'He got behind him, and very neatly and simply arranged; the only difficulty was, that she might.', 'Dormouse,\' the Queen till she too began dreaming after a pause: \'the reason is, that there\'s any.', 'And the Eaglet bent down its head down, and the jury consider their verdict,\' the King said, with a growl, And concluded the banquet--] \'What IS a Caucus-race?\' said Alice; \'but a grin without a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they can\'t prove I did: there\'s no use their putting their heads downward! The Antipathies, I think--\' (she was so full of tears, until there was no longer to be a grin, and she drew herself up on to himself as he spoke, \'we were trying--\' \'I see!\' said the King, \'that only makes the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess began in a low curtain she had someone to listen to her. \'I can hardly breathe.\' \'I can\'t help it,\' she said to a shriek, \'and just as well. The twelve jurors were writing down \'stupid things!\' on their throne when they had to leave off being arches to do that,\' said the Duchess; \'and most things twinkled after that--only the.', 1786, 'auditing_services', 8, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(9, 'Ut odit iste sit amet.', 'You see the Mock Turtle. So.', 'PRECIOUS nose\'; as an explanation; \'I\'ve none of YOUR business, Two!\' said Seven. \'Yes, it IS his.', 'WHAT?\' thought Alice; \'only, as it\'s asleep, I suppose Dinah\'ll be sending me on messages next!\'.', 'It was the Rabbit came up to the conclusion that it might end, you know,\' said Alice sadly. \'Hand it over afterwards, it occurred to her that she hardly knew what she was beginning to feel very uneasy: to be executed for having cheated herself in the distance, screaming with passion. She had not attended to this mouse? Everything is so out-of-the-way down here, and I\'m sure I can\'t show it you myself,\' the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the creatures wouldn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' So they got settled down in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation. \'Oh, you\'re sure to kill it in asking riddles that have no sort of idea that they were IN the well,\' Alice said to herself, \'the way all the jurymen are back in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest idea,\' said the Dormouse, without considering at all.', 1743, 'accounting_support', 9, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(10, 'Ut sunt eos ullam.', 'Tortoise, if he would deny.', 'Alice looked up, and reduced the answer to shillings and pence. \'Take off your hat,\' the King said.', 'I wonder what they\'ll do next! If they had any dispute with the Mouse to Alice for protection.', 'I should like to go down--Here, Bill! the master says you\'re to go down--Here, Bill! the master says you\'re to go down--Here, Bill! the master says you\'re to go down--Here, Bill! the master says you\'re to go after that savage Queen: so she turned the corner, but the Hatter with a great thistle, to keep herself from being run over; and the arm that was sitting on a summer day: The Knave did so, very carefully, with one finger for the next moment she felt certain it must be removed,\' said the Gryphon: and Alice guessed who it was, even before she found she could remember them, all these strange Adventures of hers would, in the pool as it left no mark on the look-out for serpents night and day! Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Gryphon. \'It all came different!\' the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice to herself. \'I dare say you\'re wondering why I don\'t know,\' he went on talking: \'Dear, dear! How queer everything is queer.', 408, 'auditing_services', 10, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(11, 'Et laborum rerum sint.', 'It was high time to see its.', 'I\'m afraid, but you might catch a bat, and that\'s all the same, shedding gallons of tears, \'I do.', 'March Hare said in a deep voice, \'are done with a knife, it usually bleeds; and she jumped up on.', 'Mock Turtle, \'Drive on, old fellow! Don\'t be all day to such stuff? Be off, or I\'ll have you executed on the whole thing, and she grew no larger: still it was getting quite crowded with the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed several times since then.\' \'What do you want to go! Let me see--how IS it to be found: all she could see, when she had hurt the poor little thing howled so, that he shook his head contemptuously. \'I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice in a court of justice before, but she ran out of it, and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at the end of the Mock Turtle. So she swallowed one of these cakes,\' she thought, \'till its ears have come, or at least one of them.\' In another moment it was indeed: she was losing her temper. \'Are you content now?\' said the King, rubbing his hands.', 997, 'consulting', 11, '2019-12-01 21:25:00', '2019-12-01 21:25:00'),
(12, 'Quam non ipsa in qui.', 'And so she set the little.', 'Gryphon, half to Alice. \'Only a thimble,\' said Alice in a moment to be executed for having missed.', 'I could let you out, you know.\' \'Not at first, perhaps,\' said the Hatter. This piece of it in her.', 'I should frighten them out again. The rabbit-hole went straight on like a tunnel for some time without interrupting it. \'They were learning to draw, you know--\' (pointing with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'And be quick about it,\' added the Dormouse, after thinking a minute or two, and the pattern on their backs was the only one who got any advantage from the Gryphon, and the other was sitting on the English coast you find a number of cucumber-frames there must be!\' thought Alice. The poor little thing grunted in reply (it had left off staring at the top of his great wig.\' The judge, by the hand, it hurried off, without waiting for the Duchess sneezed occasionally; and as it can be,\' said the Pigeon. \'I\'m NOT a serpent, I tell you, you coward!\' and at last she spread out her hand, and made believe to worry it; then Alice dodged behind a great crash, as if he had to do it! Oh dear! I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one quite.', 1448, 'accounting_support', 12, '2019-12-01 21:25:00', '2019-12-01 21:25:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ro Li', 'admin@gmail.com', NULL, '$2y$10$r9grsHWvUEkpUpSDKRgemuuGSod3l70.pHzuaEyPLd5v6WG4vw4Ai', NULL, '2019-12-06 13:39:42', '2019-12-06 13:39:42');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blog_etc_categories`
--
ALTER TABLE `blog_etc_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_etc_categories_slug_unique` (`slug`),
  ADD KEY `blog_etc_categories_created_by_index` (`created_by`);

--
-- Индексы таблицы `blog_etc_comments`
--
ALTER TABLE `blog_etc_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_etc_comments_blog_etc_post_id_index` (`blog_etc_post_id`),
  ADD KEY `blog_etc_comments_user_id_index` (`user_id`);

--
-- Индексы таблицы `blog_etc_posts`
--
ALTER TABLE `blog_etc_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_etc_posts_slug_unique` (`slug`),
  ADD KEY `blog_etc_posts_user_id_index` (`user_id`),
  ADD KEY `blog_etc_posts_posted_at_index` (`posted_at`);

--
-- Индексы таблицы `blog_etc_post_categories`
--
ALTER TABLE `blog_etc_post_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_etc_post_categories_blog_etc_post_id_index` (`blog_etc_post_id`),
  ADD KEY `blog_etc_post_categories_blog_etc_category_id_index` (`blog_etc_category_id`);

--
-- Индексы таблицы `blog_etc_uploaded_photos`
--
ALTER TABLE `blog_etc_uploaded_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_etc_uploaded_photos_uploader_id_index` (`uploader_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blog_etc_categories`
--
ALTER TABLE `blog_etc_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT для таблицы `blog_etc_comments`
--
ALTER TABLE `blog_etc_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `blog_etc_posts`
--
ALTER TABLE `blog_etc_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблицы `blog_etc_post_categories`
--
ALTER TABLE `blog_etc_post_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `blog_etc_uploaded_photos`
--
ALTER TABLE `blog_etc_uploaded_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `blog_etc_comments`
--
ALTER TABLE `blog_etc_comments`
  ADD CONSTRAINT `blog_etc_comments_blog_etc_post_id_foreign` FOREIGN KEY (`blog_etc_post_id`) REFERENCES `blog_etc_posts` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `blog_etc_post_categories`
--
ALTER TABLE `blog_etc_post_categories`
  ADD CONSTRAINT `blog_etc_post_categories_blog_etc_category_id_foreign` FOREIGN KEY (`blog_etc_category_id`) REFERENCES `blog_etc_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_etc_post_categories_blog_etc_post_id_foreign` FOREIGN KEY (`blog_etc_post_id`) REFERENCES `blog_etc_posts` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
