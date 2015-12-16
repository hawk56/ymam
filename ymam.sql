-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 16 2015 г., 22:32
-- Версия сервера: 10.1.8-MariaDB
-- Версия PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ymam`
--

-- --------------------------------------------------------

--
-- Структура таблицы `all_images`
--

CREATE TABLE `all_images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `all_images`
--

INSERT INTO `all_images` (`id`, `name`, `upload_time`) VALUES
(1, '804d185a521e1d6454e6de8270f0bf61.jpg', 1449514230),
(2, 'be63d1978afb38f83199336daccf9c5d.jpg', 1449514262),
(3, '46a6661572a8608d98d94f49a3f3ce76.jpg', 1449516324),
(4, 'bce5670e0a1aec367559073e89547960.jpg', 1449516337),
(5, 'e19780d017c58cf5e84468fdf5d8cc0a.jpg', 1449516387),
(6, '2e2310a43d50e46415d3eb24caeaf13b.jpg', 1449516423),
(7, 'a28edc6ca88f799292a29f9222fb0267.jpg', 1449516437),
(8, '647d01fe6a3eb51e0235140817a2eb41.jpg', 1449516528),
(9, 'cc004862343bbba9e1d844b215aaca83.jpg', 1449516597),
(10, 'de1705c7506a4cec986338004453cb27.jpg', 1449516650),
(11, 'a5f4ebf30503ac1b1c390a7b50699975.jpg', 1449516841),
(12, 'f92807cb0397c498d0dca90c9ee227ad.jpg', 1449516917),
(13, 'f6bc75d1fcba3087eb1acfb2d0bed1b2.jpg', 1449516933),
(14, '3806921ff39d1f862ef881b9d0acac3e.jpg', 1450203043),
(15, '2940c13f63ad69b9e4b1563cfb6abbc5.jpg', 1450205554),
(16, 'ff63bbfde01d114462f769fc86c5d1c7.jpg', 1450295983),
(17, 'b2134aaa6b991293f55892762283f7e2.jpg', 1450296163),
(18, '9a440c62db323511a268cab6dd4bf759.jpg', 1450296328),
(19, 'bce2394a55ed66a69ec24a617baecf3d.jpg', 1450296473);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1449348814),
('author', '2', 1449348814);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1449348814, 1449348814),
('author', 1, NULL, NULL, NULL, 1449348814, 1449348814),
('createComments', 2, 'Create Comments', NULL, NULL, 1449348814, 1449348814),
('createPost', 2, 'Create a post', NULL, NULL, 1449348813, 1449348813),
('updatePost', 2, 'Update post', NULL, NULL, 1449348814, 1449348814);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'author'),
('admin', 'createComments'),
('admin', 'updatePost'),
('author', 'createPost');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `status`) VALUES
(1, 'Test', 1),
(2, 'Категория 1', 1),
(3, 'Категория 2', 1),
(4, 'Категория 3', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` text,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `text`, `created_at`) VALUES
(1, 1, 'asdfasdfasdf', 123123123),
(2, 1, 'asdfasd asdfsadf asdfas', 12312),
(3, NULL, 'zxcxzc', NULL),
(4, NULL, '123123123123', NULL),
(5, NULL, 'sdfsdfsd', NULL),
(6, NULL, 'sdfsdfsd', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `model_class` int(11) UNSIGNED NOT NULL,
  `model_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status_id` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comments_models`
--

CREATE TABLE `comments_models` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(20) NOT NULL,
  `isMain` int(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `filePath`, `itemId`, `isMain`, `modelName`, `urlAlias`, `name`) VALUES
(2, 'Posts/Post2/87cc42.jpg', 2, 1, 'Post', '786ed2199d-1', ''),
(5, 'Posts/Post1/3713a2.jpg', 1, 1, 'Post', '8c7147eab4-1', ''),
(7, 'Posts/Post11/6d9342.jpg', 11, 1, 'Post', '39f16477f0-1', ''),
(8, 'Posts/Post12/ef7220.jpg', 12, 1, 'Post', 'e63296064c-1', ''),
(9, 'Posts/Post10/2203e2.jpg', 10, 1, 'Post', 'e043f6710e-1', ''),
(10, 'Posts/Post13/88f91b.jpg', 13, 1, 'Post', '34b43bf812-1', ''),
(11, 'Posts/Post14/8c03e7.jpg', 14, 1, 'Post', '6f91d92330-1', ''),
(12, 'Posts/Post15/69a8c7.jpg', 15, 1, 'Post', 'f750f0eaf1-1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1448554824),
('m130524_201442_init', 1448554828),
('m140506_102106_rbac_init', 1449344013),
('m140622_111540_create_image_table', 1449431741),
('m140622_111545_add_name_to_image_table', 1449431741),
('m151126_162208_create_post_table', 1448556456),
('m151126_165319_create_category_table', 1448556997),
('m151126_213710_add_field_img_to_post', 1448612559),
('m151127_080609_add_views_field_to_post', 1448612560),
('m151129_195452_add_comments_table', 1448827455),
('m151207_184005_add_all_images_table', 1449513745);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `img` varchar(255) DEFAULT NULL,
  `text` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_desc` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `poster_id` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `title`, `description`, `img`, `text`, `seo_title`, `seo_desc`, `seo_keywords`, `category`, `poster_id`, `views`, `created_at`, `published_at`, `updated_at`, `status`) VALUES
(10, 'Бизиборд — развивающая доска с замочками и кнопочками для малышей своими руками', 'Бизиборд — развивающая доска с замочками и кнопочками для малышей своими руками', '', '<p>Методика Монтессори</p>\r\n\r\n<p>Специально для того, чтобы решить подобную дилемму, итальянский педагог и учёный Мария Монтессори предложила в рамках своей методики обучать детей через познание сути вещей. Ведь совсем не обязательно подводить кроху к реальной двери, чтобы он понял принцип работы щеколды. Можно просто дать этот предмет в руки малышу и он сам разберётся с его функциональностью. Разграничение действий ребёнка и грозящей ему опасности выдвинуло теорию обучения дошкольников на новый уровень.</p>\r\n\r\n<p>Известный методист предложила перенести подручные бытовые приспособления на стенд для изучения. Таким образом дети смогут изучать функциональность каждой мелкой детальки, а родители перестанут опасаться за их жизнь. Двигая дверные цепочки, кольца от карниза или замок-молнию ребёнок разовьёт мелкую моторику пальцев и изучит заинтересовавшие его вещи. Нейронные сигналы от маленьких пальчиков передадутся в мозг и обогатят впечатлениями память малыша. Подобное стимулирование благоприятно влияет на интеллектуальное и физическое развитие крохи.</p>\r\n\r\n<p><img alt="" src="http://localhost/y-mam/frontend/web/upload/images/ff63bbfde01d114462f769fc86c5d1c7.jpg" style="max-width:780px; min-width:480px; width:100%" /></p>\r\n', 'sdgfsdfgsdf', 'sdfgsdfg', 'gsgsdfg', 1, 1, 20, 1450203709, 34234232, 1450296096, 1),
(11, 'Отпуск с ребенком – что положить в аптечку?', 'Время отпусков и каникул в самом разгаре. Один из любимых видов отдыха — на море всей семьей.', '', '<p>Время отпусков и&nbsp;каникул в&nbsp;самом разгаре. Один из&nbsp;любимых видов отдыха&nbsp;&mdash; на&nbsp;море всей семьей. Те, кто берет с&nbsp;собой малышей, особенно тщательно готовятся к&nbsp;путешествию. В&nbsp;обязательный список детских вещей входит, конечно&nbsp;же, детская аптечка. Важное место в&nbsp;ней занимают препараты от&nbsp;травм, ведь мелкие ранки, ссадины и&nbsp;порезы&nbsp;&mdash; явление для детей почти обыденное. Давайте выясним, чего нужно избегать при отдыхе на&nbsp;море и&nbsp;что необходимо иметь под рукой в&nbsp;разгар отпускного сезона.</p>\r\n\r\n<p><em><strong>Море&nbsp;&mdash; бережем ноги</strong></em></p>\r\n\r\n<p>Опасности подстерегают наших любознательных малышей повсюду. Купание в&nbsp;море не&nbsp;исключение. Морское дно может быть непредсказуемо. Самая распространенная травма в&nbsp;воде&nbsp;&mdash; это порез ступни. Острый камень, осколок стекла, деревяшка, острая ракушка в&nbsp;воде&nbsp;&mdash; всё это представляет нешуточную опасность. Особенности соленой воды таковы, что малыш может не&nbsp;сразу почувствовать боль от&nbsp;пореза и&nbsp;провести в&nbsp;воде с&nbsp;кровоточащей ранкой некоторое время. А&nbsp;наступая травмированной ногой на&nbsp;дно, он&nbsp;может легко занести в&nbsp;ранку грязь и&nbsp;инфекцию.</p>\r\n\r\n<p>Выяснить, на&nbsp;что наступил ребенок, удается не&nbsp;всегда, поэтому нужно с&nbsp;повышенным вниманием отнестись к&nbsp;обработке раны. Если малыш порезался, играя в&nbsp;воде, ранку обязательно нужно дезинфицировать, а&nbsp;затем нужно будет нанести на&nbsp;порез средство с&nbsp;противомикробным действием. Хорошо, если в&nbsp;вашей аптечке есть препарат, обладающий антисептическим и&nbsp;заживляющим действием одновременно. Как правило, дети очень переживают во&nbsp;время обработки ранок, поэтому препараты с&nbsp;комплексным действием&nbsp;&mdash; отличное решение.</p>\r\n\r\n<p>Даже если ранка, которую получил ребенок&nbsp;&mdash; всего лишь мелкая царапина, обработать ее&nbsp;нужно. Почему? Просто чтобы избежать воспаления, нагноения и&nbsp;инфицирования травмы, так как это может плохо сказаться на&nbsp;здоровье ребенка и&nbsp;испортить семейный отдых.<br />\r\nПомните, каким&nbsp;бы чистым и&nbsp;безопасным ни&nbsp;был пляж, течение может вынести на&nbsp;мелководье опасные предметы. Поэтому, даже если пляж частный, закрытый и&nbsp;ваш отель на&nbsp;первой линии моря, брать с&nbsp;собой аптечку со&nbsp;средствами первой помощи обязательно!</p>\r\n\r\n<p><em><strong>Пляжные &laquo;радости&raquo;</strong></em><br />\r\n<br />\r\nДети настолько подвижны и&nbsp;любознательны, что ссадины, царапины и&nbsp;ушибы преследуют их&nbsp;повсюду, в&nbsp;том числе и&nbsp;на&nbsp;пляже.</p>\r\n\r\n<p>Нет ничего проще, чем получить травму в&nbsp;пляжных играх с&nbsp;песком, травой, морской галькой. Если вы&nbsp;отдыхаете на&nbsp;каменистом пляже, позаботьтесь о&nbsp;специальной обуви для малыша. Резиновые тапочки для купания не&nbsp;позволят ребенку поскользнуться на&nbsp;мокрых камнях и&nbsp;защитят его нежные ступни.</p>\r\n\r\n<p><img alt="" src="http://localhost/y-mam/frontend/web/upload/images/2940c13f63ad69b9e4b1563cfb6abbc5.jpg" /></p>\r\n\r\n<p>Если&nbsp;всё-таки&nbsp;ребенок поцарапался или порезался, играя на&nbsp;пляже, нужно продезинфицировать ранку, и&nbsp;позаботится о&nbsp;том, чтобы она скорее зажила. Для этого можно воспользоваться специальным лекарственным средством&nbsp;&mdash; кремом&nbsp;<a href="http://argosulfan.ru/about/?utm_source=babyblog&amp;utm_medium=text&amp;utm_campaign=argosulfan_media_2014" style="margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-bottom-style: solid; border-bottom-color: rgb(188, 215, 235); font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-family: inherit; vertical-align: baseline; text-decoration: none; outline: 0px; color: rgb(34, 121, 190);" target="_blank">Аргосульфан</a>.<strong>&nbsp;</strong>В состав крема входят ионы серебра, поэтому он&nbsp;обладает одновременно антисептическим и&nbsp;заживляющим действием. Аргосульфан обеззараживает ранку и&nbsp;не&nbsp;оказывает раздражающего эффекта, тем самым помогает быстро её заживить без образования грубого рубца.<br />\r\nКрем Аргосульфан удобно и&nbsp;легко наносить на&nbsp;рану, он&nbsp;полностью закрывает место повреждения, при этом дольше остаётся на&nbsp;ране, не&nbsp;щиплет, так что его применение не&nbsp;доставит малышу никакого дискомфорта. Рекомендовано использовать 2&ndash;3 раза в&nbsp;день под повязку или открытым методом до&nbsp;полного заживления раны.</p>\r\n\r\n<p>Лекарственный препарат Аргосульфан можно применять при любых повреждениях кожи и&nbsp;ожогах. Аргосульфан разрешен к&nbsp;применению у&nbsp;детей с&nbsp;двух месяцев.</p>\r\n\r\n<p>Вдали от&nbsp;дома особенно важно быть подготовленными к&nbsp;любым неожиданностям. Подойдите к&nbsp;подбору средств первой помощи с&nbsp;особым вниманием&nbsp;&mdash; это сэкономит вам массу сил и&nbsp;нервов при неизбежных ссадинах, порезах и&nbsp;прочих мелких травмах.</p>\r\n\r\n<p>Дарить ребенку яркие впечатления&nbsp;&mdash; большая радость для родителей. Отдыхайте всей семьей с&nbsp;удовольствием, а&nbsp;о&nbsp;мелких травмах позаботится Аргосульфан.</p>\r\n', 'otpusk-s-rebenkomchto-polozhit-v-aptechku', 'otpusk-s-rebenkomchto-polozhit-v-aptechku', 'otpusk-s-rebenkomchto-polozhit-v-aptechku', 1, 1, 19, 1450205605, 123, 1450205622, 1),
(12, 'Как мы портим детям игру: 6 типичных ошибок', 'Давайте вспомним себя в детстве. Наши бабушки и дедушки, мамы и папы постоянно заставляли нас что-либо делать: то рисовать или лепить, то читать или писать, в то время, как нам хотелось играть с лучшим другом на улице в салочки. ', '', '<p>1. Покупаем технологичные игрушки для себя, а не для ребенка</p>\r\n\r\n<p>Большинство современных родителей очень заняты работой, а недостаток внимания детям стараются компенсировать с помощью модных и дорогих игрушек. Так называемые &laquo;развивающие&raquo; игрушки с множеством разноцветных элементов различной формы, звуковыми и световыми эффектами, поющие и рассказывающие сказки, становятся интересными нам, взрослым, но не малышу, которому такое количество функций еще непонятно. Выходит, что родители покупают игрушки и развивающие центры не для своего ребенка, а для себя. Выглядит это так, как будто мы пытаемся компенсировать недостаток игрушек в собственном детстве. Детям же намного интереснее играть с пластилином, мячиками, кубиками, ведерком и лопаткой, а также другими полезными вещами. Играя с этим всем, они как будто готовятся к взрослой жизни, развивая свое воображение и находя предметам новое применение.</p>\r\n', 'Как мы портим детям игру: 6 типичных ошибок', 'Как мы портим детям игру: 6 типичных ошибок', 'Как мы портим детям игру: 6 типичных ошибок', 1, 1, 4, 1450292673, 123, 1450292682, 1),
(13, 'Скорая помощь при прорезывании зубов у малыша: ТОП — 7 гелей для десен', 'Прорезывание зубов — один из самых болезненных моментов в жизни ребенка. Помочь ему можно с помощью “подручных” средств или специальных препаратов.', '', '<p>Скорая помощь при прорезывании зубов у малыша: ТОП &mdash; 7 гелей для десен</p>\r\n\r\n<p><em><strong>Прорезывание зубов &mdash; один из самых болезненных моментов в жизни ребенка. Помочь ему можно с помощью &ldquo;подручных&rdquo; средств или специальных препаратов.</strong></em></p>\r\n\r\n<p>Содержание статьи&nbsp;[<a href="http://razvitie-krohi.ru/zdorove-rebenka/lekarstva-dlya-novorozhdennyih/geli-pri-prorezyivanii-zubov.html#" style="margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-bottom-style: dashed; border-bottom-color: rgb(255, 193, 193); font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; text-decoration: none; color: rgb(51, 188, 242); transition: color 0.25s ease-in; text-shadow: none;">Показать содержание</a>]</p>\r\n\r\n<p><img alt="прорезывание-зубов" class="aligncenter size-full wp-image-10919" src="http://razvitie-krohi.ru/wp-content/uploads/2015/12/prorezyivanie-zubov.jpg" style="max-width:780; min-width:480px; width:100%" /></p>\r\n\r\n<p>В возрасте&nbsp;7&nbsp;&mdash; 9 месяцев у детей начинают прорезываться молочные зубы. В большинстве случаев этот процесс не остается незамеченным ни для малыша, ни для его родителей: ребенок испытывает дискомфорт, становится капризным, а взрослые, в свою очередь, задумываются о том, как помочь своей крохе, но при этом не навредить. Сегодня существует несколько способов облегчения прорезывания, одним из самых эффективных среди них считаются специальные гели для десен. Но всегда ли нужно их использовать и насколько они безопасны?</p>\r\n\r\n<p>Признаки прорезывания зубов</p>\r\n\r\n<p>В зависимости от индивидуальных особенностей ребенка, симптомы прорезывания зубов бывают совершенно разными, однако можно выделить ряд общих, наиболее частых признаков:</p>\r\n\r\n<p>Повышенное&nbsp;<a href="http://razvitie-krohi.ru/razvitie-rebenka-do-goda/pochemu-u-grudnogo-rebenka-tekut-slyuni-prichinyi-i-chto-delat.html" style="margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-bottom-style: dashed; border-bottom-color: rgb(255, 193, 193); font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; text-decoration: none; color: rgb(51, 188, 242); transition: color 0.25s ease-in;">слюноотделение</a>, припухлость и покраснение десен.</p>\r\n\r\n<p>Беспокойный сон, потеря аппетита, желание грызть все попадающиеся на глаза предметы.</p>\r\n\r\n<p>Появление белой полосы перед непосредственным появлением зуба.</p>\r\n\r\n<p>Общее ухудшение состояния.</p>\r\n\r\n<p>Повышение температуры тела, ринит (насморк), кашель (преимущественно&nbsp;<a href="http://razvitie-krohi.ru/zdorove-rebenka/mokryiy-kashel-u-grudnogo-rebenka-kak-i-chem-lechit.html" style="margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-bottom-style: dashed; border-bottom-color: rgb(255, 193, 193); font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; text-decoration: none; color: rgb(51, 188, 242); transition: color 0.25s ease-in;">влажный</a>), понос как возможные сопутствующие процесса прорезывания.</p>\r\n', 'df', 'asdf', 'asdf', 1, 1, 5, 1450296230, 1, 1450296239, 1),
(14, 'Как зачать двойню и попытаться повлиять на пол малышей. Естественные и искусственные способы', 'Природа время от времени радует нас двойняшками или близнецами, но не так часто, как хотелось бы некоторым мамам. Можно ли нам как-то повлиять на зачатие, чтобы родилось два ребенка, а не один? Оказывается, природа в какой-то мере нам подвластна. На помощь придут как естественные, так и искусственные методы, а также народные советы. Интересно, что и на пол будущих детей тоже можно повлиять.', '', '<p><em><strong>Природа время от времени радует нас двойняшками или близнецами, но не так часто, как хотелось бы некоторым мамам. Можно ли нам как-то повлиять на зачатие, чтобы родилось два ребенка, а не один? Оказывается, природа в какой-то мере нам подвластна. На помощь придут как естественные, так и искусственные методы, а также народные советы. Интересно, что и на пол будущих детей тоже можно повлиять.</strong></em></p>\r\n\r\n<p><img alt="" src="	 http://localhost/y-mam/frontend/web/upload/images/9a440c62db323511a268cab6dd4bf759.jpg" style="max-width:780px; min-width:480px; width:100%" /></p>\r\n\r\n<p>Несмотря на то, что &laquo;дар&raquo; рождения двойни обыкновенно является наследственным, использование специальных методов и советов приводит к тому, что родители все чаще дожидаются появления на свет двух малышей сразу.&nbsp;<strong>По статистике, родить двойню можно в одном случае из 80-ти.</strong>&nbsp;Мы расскажем вам о том, как можно увеличить шансы.</p>\r\n\r\n<p>Кто такие двойняшки</p>\r\n\r\n<p>Для того, чтобы это радостное событие произошло и у вас, необходимо, в первую очередь, понимать, что представляет собой двойня. В отличие от монозиготных близнецов, сформировавшихся из одной яйцеклетки при участии одного сперматозоида, в случае двойни участвуют&nbsp;<strong>по две клетки с обеих сторон</strong>.</p>\r\n\r\n<p><strong>Двойняшки</strong>&nbsp;&ndash;&nbsp;<em>это разнояйцевые дети. Такая беременность возникает при одновременном оплодотворении двух яйцеклеток разными сперматозоидами. Каждый плод формируется в отдельной плаценте.</em></p>\r\n\r\n<p>Появившиеся малыши могут иметь очень похожую внешность, однако могут и значительно отличаться друг от друга. Кроме того, в их паре необязательно будет представлен только один пол. Может оказаться и так, что родится мальчик и девочка. Хотя это явление встречается не столь уж и часто.</p>\r\n\r\n<p>Итак, чтобы получилась двойня, необходимо найти способ, в результате которого женский организм выбросит не одну, а&nbsp;<strong>несколько яйцеклеток</strong>. О сперматозоидах, как вы понимаете, заботиться не нужно &mdash; их и так всегда более чем достаточно.</p>\r\n\r\n<p>Существует два варианта зачатия &mdash; естественным и искусственным путем. В каждом случае нужна своя стратегия, и сейчас вы познакомитесь с основными из них.</p>\r\n', 'zcv', 'zxcv', 'xcv', 2, 1, 6, 1450296392, NULL, 1450296401, 1),
(15, 'Как выбрать подушку для беременных', 'Женщинам, ждущим малыша, следует позаботиться о качественном сне. Из-за растущего живота выбрать удобную позу бывает непросто. На помощь придут специальные подушки для беременных, о существовании которых вы даже не подозревали до того, как внутри вас зародилась новая жизнь. Мы расскажем вам о том, как выбрать такую подушку, подходящую именно вам.', '', '<p><em><strong>Женщинам, ждущим малыша, следует позаботиться о качественном сне. Из-за растущего живота выбрать удобную позу бывает непросто. На помощь придут специальные&nbsp;подушки для беременных, о существовании которых вы даже не подозревали до того, как внутри вас зародилась новая жизнь. Мы расскажем вам о том, как выбрать такую&nbsp;подушку, подходящую именно вам.</strong></em></p>\r\n\r\n<p><img alt="" src="http://localhost/y-mam/frontend/web/upload/images/bce2394a55ed66a69ec24a617baecf3d.jpg" style="height:513px; width:770px" /></p>\r\n\r\n<p>Зачем нужна особая подушка для беременных</p>\r\n\r\n<p><strong>Подушка для беременных &mdash; это не просто женский каприз. Специалисты убеждены, что во время беременности нужно использовать специально разработанную для будущих мам подушку. Вот ее основные преимущества:</strong></p>\r\n\r\n<p>позволяет беременной женщине найти удобную позу для сна, дневного отдыха, чтения, просмотра ТВ, принятия пищи;</p>\r\n\r\n<p>снижает нагрузку на организм будущей мамы, что особенно актуально со 2-го триместра, когда живот заметно округляется. Подушку можно использовать, как подпору для поясницы, округлившихся боков или уставших ног;</p>\r\n\r\n<p>вы сможете положить такую подушку под живот и не будете ощущать дискомфорта, как в случае с привычными моделями;</p>\r\n\r\n<p>ее использование позволит снизить нагрузку на позвоночник, так как она распределится равномерно;</p>\r\n\r\n<p>даже после того, как малыш появится на свет, она вам пригодится: вы сможете опираться на нее при кормлении или сделать из подушки своеобразный манеж для ребенка, чтобы тот не упал с кровати.</p>\r\n', 'qwe', 'qwe', 'qwe', 3, 1, 3, 1450296499, NULL, 1450296513, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Gry2zcItaSwxEZGAVnZklcfaBzNN7_Yj', '$2y$13$olbQcQT7W7dqTKBlTYyoaezpb0ZrdY2pH1XJTDjbl7cyUIBQLkn7C', NULL, 'admin@admin.ru', 10, 1448557315, 1448557315),
(2, 'test', 'n6Pt2WU1DAmuy24xcOgNjkC-l31OStSo', '$2y$13$yZZKB8QI.vqBSUbOJLpyaerCMRgi/OeXW29/b9prlU8EkCUCWUyHi', NULL, 'test@test.rt', 10, 1449344560, 1449344560);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `all_images`
--
ALTER TABLE `all_images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `FK_comment_parent` (`parent_id`);

--
-- Индексы таблицы `comments_models`
--
ALTER TABLE `comments_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poster link` (`poster_id`),
  ADD KEY `poster category` (`category`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `all_images`
--
ALTER TABLE `all_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_comment_parent` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `poster category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `poster link` FOREIGN KEY (`poster_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
