-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Pát 24. led 2014, 10:53
-- Verze MySQL: 5.5.29
-- Verze PHP: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `c1budkutilcz`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `bk_hodnoty`
--

CREATE TABLE `bk_hodnoty` (
  `hodnota_id` int(11) NOT NULL AUTO_INCREMENT,
  `parametr_id` int(11) DEFAULT NULL,
  `hodnota_nazev` varchar(250) COLLATE utf8_czech_ci DEFAULT NULL,
  `parametr_img` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `parametr_ip` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `parametr_time` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`hodnota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `bk_parametry`
--

CREATE TABLE `bk_parametry` (
  `parametr_id` int(11) NOT NULL AUTO_INCREMENT,
  `parametr_nazev` varchar(250) COLLATE utf8_czech_ci DEFAULT NULL,
  `neaktivni_v` varchar(250) COLLATE utf8_czech_ci DEFAULT NULL,
  `parametr_ip` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `parametr_time` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `parametr_poznamka` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`parametr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `bk_parametry`
--

INSERT INTO `bk_parametry` (`parametr_id`, `parametr_nazev`, `neaktivni_v`, `parametr_ip`, `parametr_time`, `parametr_poznamka`) VALUES
(1, 'Barva', '', '::1', '1389171598', ''),
(2, 'Materiál', '', '::1', '1389171813', ''),
(3, 'Velikost papíru', '', '::1', '1389171891', '');

-- --------------------------------------------------------

--
-- Struktura tabulky `bk_provize`
--

CREATE TABLE `bk_provize` (
  `provize_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provize_datum` int(11) NOT NULL,
  `provize_vyse` float DEFAULT NULL,
  `provize_ip` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `poznamka` varchar(250) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`provize_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `bk_provize`
--

INSERT INTO `bk_provize` (`provize_id`, `user_id`, `provize_datum`, `provize_vyse`, `provize_ip`, `poznamka`) VALUES
(2, 31, 1389171108, 90, '::1', 'Někdo cizí, ma velkou provizi? \r\n'),
(3, 1, 1389171228, 10, '::1', '');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_activity`
--

CREATE TABLE `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` varchar(255) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`),
  KEY `is_spam` (`is_spam`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Vypisuji data pro tabulku `wp_bp_activity`
--

INSERT INTO `wp_bp_activity` (`id`, `user_id`, `component`, `type`, `action`, `content`, `primary_link`, `item_id`, `secondary_item_id`, `date_recorded`, `hide_sitewide`, `mptt_left`, `mptt_right`, `is_spam`) VALUES
(1, 1, 'activity', 'activity_update', '<a href="http://localhost:8888/kutilove/administrator/" title="David">David</a> posted an update', 'Tak jdem na to.\n', 'http://localhost:8888/kutilove/administrator/', 0, 0, '2013-05-02 10:46:51', 0, 1, 8, 0),
(5, 4, 'activity', 'activity_update', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> posted an update', 'Huste, tak jsem tady už taky.', 'http://localhost:8888/kutilove/mysak/', 0, 0, '2013-05-02 11:22:58', 0, 0, 0, 0),
(4, 4, 'xprofile', 'new_member', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> se stal registrovaným členem', '', 'http://localhost:8888/kutilove/administrator/', 0, 0, '2013-05-02 11:16:57', 0, 0, 0, 0),
(6, 4, 'activity', 'activity_comment', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> posted a new activity comment', 'Jak se ti tu libi ?', 'http://localhost:8888/kutilove/mysak/', 1, 1, '2013-05-02 11:23:08', 0, 2, 7, 0),
(7, 4, 'activity', 'activity_update', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> posted an update', '<a href=''http://localhost:8888/kutilove/administrator/'' rel=''nofollow''>@administrator</a>  Maš moc pěkné jméno.', 'http://localhost:8888/kutilove/mysak/', 0, 0, '2013-05-02 11:23:46', 0, 0, 0, 0),
(8, 4, 'profile', 'new_avatar', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> změnil/-a svůj profilový obrázek', '', 'http://localhost:8888/kutilove/mysak/', 0, 0, '2013-05-02 11:27:47', 0, 0, 0, 0),
(9, 4, 'friends', 'friendship_created', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> a <a href="http://localhost:8888/kutilove/administrator/" title="David">David</a> jsou nyní přátelé', '', 'http://localhost:8888/kutilove/administrator/', 1, 1, '2013-05-02 11:53:04', 0, 0, 0, 0),
(10, 1, 'friends', 'friendship_created', '<a href="http://localhost:8888/kutilove/administrator/" title="David">David</a> a <a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> jsou nyní přátelé', '', 'http://localhost:8888/kutilove/administrator/', 1, 4, '2013-05-02 11:53:04', 1, 0, 0, 0),
(11, 1, 'groups', 'created_group', '<a href="http://localhost:8888/kutilove/administrator/" title="David">David</a> vytvořil skupinu <a href="http://localhost:8888/kutilove-sobe/svadlenky/">Švadlenky</a>', '', 'http://localhost:8888/kutilove/administrator/', 1, 0, '2013-05-02 12:11:46', 0, 0, 0, 0),
(19, 4, 'groups', 'joined_group', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> sa přidal/-a ke skupině <a href="http://localhost:8888/skupiny/svadlenky/">Švadlenky</a>', '', 'http://localhost:8888/kutilove/mysak/', 1, 0, '2013-05-02 16:46:15', 0, 0, 0, 0),
(13, 1, 'friends', 'friendship_created', '<a href="http://localhost:8888/kutilove/administrator/" title="David Šuška">David Šuška</a> a <a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> jsou nyní přátelé', '', 'http://localhost:8888/kutilove/mysak/', 4, 4, '2013-05-02 16:19:47', 0, 0, 0, 0),
(14, 4, 'friends', 'friendship_created', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> a <a href="http://localhost:8888/kutilove/administrator/" title="David Šuška">David Šuška</a> jsou nyní přátelé', '', 'http://localhost:8888/kutilove/mysak/', 4, 1, '2013-05-02 16:19:47', 1, 0, 0, 0),
(18, 1, 'groups', 'created_group', '<a href="http://localhost:8888/kutilove/administrator/" title="David Šuška">David Šuška</a> vytvořil skupinu <a href="http://localhost:8888/skupiny/kozedelnici/">Kožedělníci</a>', '', 'http://localhost:8888/kutilove/administrator/', 2, 0, '2013-05-02 16:45:49', 0, 0, 0, 0),
(20, 4, 'groups', 'joined_group', '<a href="http://localhost:8888/kutilove/mysak/" title="David Myšakof myšák">David Myšakof myšák</a> sa přidal/-a ke skupině <a href="http://localhost:8888/skupiny/kozedelnici/">Kožedělníci</a>', '', 'http://localhost:8888/kutilove/mysak/', 2, 0, '2013-05-02 16:46:21', 0, 0, 0, 0),
(25, 1, 'activity', 'activity_update', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> posted an update', 'Ptaci se skrývají v oblacích, ryby se skrývají v hlubinách.', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2013-05-03 09:07:20', 0, 0, 0, 0),
(26, 1, 'activity', 'activity_update', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> posted an update', ' Ptaci se skrývají v oblacích, ryby se skrývají v hlubinách. A my.', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2013-05-03 09:07:52', 0, 0, 0, 0),
(27, 1, 'profile', 'new_avatar', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> changed their profile picture', '', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2013-05-03 10:37:33', 0, 0, 0, 0),
(28, 1, 'profile', 'new_avatar', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> changed their profile picture', '', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2013-05-03 10:41:03', 0, 0, 0, 0),
(29, 1, 'profile', 'new_avatar', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> changed their profile picture', '', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2013-05-03 10:48:26', 0, 0, 0, 0),
(30, 1, 'activity', 'activity_comment', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> posted a new activity comment', 'asdfawefawef', 'http://localhost:8888/seznam-kutilu/administrator/', 1, 6, '2013-05-03 12:41:19', 0, 3, 6, 0),
(31, 1, 'activity', 'activity_comment', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> posted a new activity comment', 'a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu a;lsdkfj aew faowefu aweofu ', 'http://localhost:8888/seznam-kutilu/administrator/', 1, 30, '2013-05-03 12:41:32', 0, 4, 5, 0),
(34, 30, 'xprofile', 'new_member', '<a href="http://localhost:8888/seznam-kutilu/wyrden/" title="simon mazanec">simon mazanec</a> je nyní registrovaný člen', '', '', 0, 0, '2013-07-07 11:11:39', 0, 0, 0, 0),
(35, 31, 'xprofile', 'new_member', '<a href="http://localhost:8888/seznam-kutilu/toritor/" title="tomas  prichystal">tomas  prichystal</a> je nyní registrovaný člen', '', '', 0, 0, '2013-07-22 11:19:56', 0, 0, 0, 0),
(36, 33, 'xprofile', 'new_member', '<a href="http://localhost:8888/seznam-kutilu/zbojnik/" title="Michal Jánošík">Michal Jánošík</a> je nyní registrovaný člen', '', '', 0, 0, '2013-09-08 20:08:48', 0, 0, 0, 0),
(37, 1, 'profile', 'new_avatar', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> změnil(a) avatar', '', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2013-11-01 07:49:33', 0, 0, 0, 0),
(38, 1, 'shop', 'new_shop_review', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> wrote a review about <a href="http://localhost:8888/produkt/testovaci-produkt/">Testovací produkt</a>', '', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2013-11-01 07:51:27', 0, 0, 0, 0),
(39, 1, 'shop', 'new_shop_review', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> wrote a review about <a href="http://localhost:8888/produkt/vepr-test/">Vepř test</a>', '', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2014-01-20 12:24:21', 0, 0, 0, 0),
(40, 1, 'shop', 'new_shop_review', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> wrote a review about <a href="http://localhost:8888/produkt/vepr-test/">Vepř test</a>', '', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2014-01-20 12:24:27', 0, 0, 0, 0),
(41, 1, 'shop', 'new_shop_review', '<a href="http://localhost:8888/seznam-kutilu/administrator/" title="David Šuška">David Šuška</a> wrote a review about <a href="http://localhost:8888/produkt/vepr-test/">Vepř test</a>', '', 'http://localhost:8888/seznam-kutilu/administrator/', 0, 0, '2014-01-20 12:24:31', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_activity_meta`
--

CREATE TABLE `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `wp_bp_activity_meta`
--

INSERT INTO `wp_bp_activity_meta` (`id`, `activity_id`, `meta_key`, `meta_value`) VALUES
(2, 19, 'favorite_count', '1'),
(3, 31, 'favorite_count', '1');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_friends`
--

CREATE TABLE `wp_bp_friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator_user_id` bigint(20) NOT NULL,
  `friend_user_id` bigint(20) NOT NULL,
  `is_confirmed` tinyint(1) DEFAULT '0',
  `is_limited` tinyint(1) DEFAULT '0',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `friend_user_id` (`friend_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `wp_bp_friends`
--

INSERT INTO `wp_bp_friends` (`id`, `initiator_user_id`, `friend_user_id`, `is_confirmed`, `is_limited`, `date_created`) VALUES
(4, 1, 4, 1, 0, '2013-05-02 16:19:47');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_groups`
--

CREATE TABLE `wp_bp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'public',
  `enable_forum` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_id` (`creator_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `wp_bp_groups`
--

INSERT INTO `wp_bp_groups` (`id`, `creator_id`, `name`, `slug`, `description`, `status`, `enable_forum`, `date_created`) VALUES
(1, 1, 'Švadlenky', 'svadlenky', 'Šikovné ručičky našich holek!', 'public', 0, '2013-05-02 12:10:21'),
(2, 1, 'Kožedělníci', 'kozedelnici', 'kožeělníci sobě :)', 'public', 0, '2013-05-02 16:45:05');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_groups_groupmeta`
--

CREATE TABLE `wp_bp_groups_groupmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `wp_bp_groups_groupmeta`
--

INSERT INTO `wp_bp_groups_groupmeta` (`id`, `group_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'last_activity', '2013-05-02 16:46:15'),
(2, 1, 'total_member_count', '2'),
(3, 1, 'invite_status', 'members'),
(4, 2, 'last_activity', '2013-05-02 16:46:21'),
(5, 2, 'total_member_count', '2'),
(6, 2, 'invite_status', 'members');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_groups_members`
--

CREATE TABLE `wp_bp_groups_members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `inviter_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_mod` tinyint(1) NOT NULL DEFAULT '0',
  `user_title` varchar(100) NOT NULL,
  `date_modified` datetime NOT NULL,
  `comments` longtext NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `invite_sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `is_admin` (`is_admin`),
  KEY `is_mod` (`is_mod`),
  KEY `user_id` (`user_id`),
  KEY `inviter_id` (`inviter_id`),
  KEY `is_confirmed` (`is_confirmed`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Vypisuji data pro tabulku `wp_bp_groups_members`
--

INSERT INTO `wp_bp_groups_members` (`id`, `group_id`, `user_id`, `inviter_id`, `is_admin`, `is_mod`, `user_title`, `date_modified`, `comments`, `is_confirmed`, `is_banned`, `invite_sent`) VALUES
(1, 1, 1, 0, 1, 0, 'Administrátor skupiny', '2013-05-02 12:10:21', '', 1, 0, 0),
(6, 1, 4, 0, 0, 0, '', '2013-05-02 16:46:15', '', 1, 0, 1),
(7, 2, 1, 0, 1, 0, 'Administrátor skupiny', '2013-05-02 16:45:05', '', 1, 0, 0),
(8, 2, 4, 0, 0, 0, '', '2013-05-02 16:46:21', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_messages_messages`
--

CREATE TABLE `wp_bp_messages_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thread_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `wp_bp_messages_messages`
--

INSERT INTO `wp_bp_messages_messages` (`id`, `thread_id`, `sender_id`, `subject`, `message`, `date_sent`) VALUES
(1, 1, 4, 'Posílám ti soukromou zprávu', '\r\n                    Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic, jen zelenkavá tráva, jasně modrá obloha a tři křiklavě barevné pouťové balónky, které se téměř nepozorovatelně pohupují ani ne moc vysoko, ani moc nízko nad zemí. Kdyby pod balónky nebyla sytě zelenkavá tráva, ale třeba suchá silnice či beton, možná by bylo vidět jejich barevné stíny - to jak přes poloprůsvitné barevné balónky prochází ostré sluneční paprsky.\r\nJenže kvůli všudy přítomné trávě jsou stíny balónků sotva vidět, natož aby šlo rozeznat, jakou barvu tyto stíny mají. Uvidět tak balónky náhodný kolemjdoucí, jistě by si pomyslel, že už tu takhle poletují snad tisíc let. Stále si víceméně drží výšku a ani do stran se příliš nepohybují. Proti slunci to vypadá, že se slunce pohybuje k západu rychleji než balónky, a možná to tak skutečně je. Nejeden filozof by mohl tvrdit, že balónky se sluncem závodí, ale fyzikové by to jistě vyvrátili. Z fyzikálního pohledu totiž balónky působí zcela nezajímavě.\r\n                ', '2013-05-02 11:43:18'),
(2, 1, 1, 'Re: Posílám ti soukromou zprávu', 'Díky za zprávu, tady je má odpověď !!', '2013-05-02 11:45:03'),
(3, 2, 4, 'Test jestli přide David sprava', 'zasdůkfmasdůlf asdf asf adf asf awefa ewf', '2013-05-02 11:47:37'),
(4, 3, 4, 'afwea', 'sdfwefawef', '2013-05-02 15:02:40');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_messages_notices`
--

CREATE TABLE `wp_bp_messages_notices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_messages_recipients`
--

CREATE TABLE `wp_bp_messages_recipients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `unread_count` int(10) NOT NULL DEFAULT '0',
  `sender_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sender_only` (`sender_only`),
  KEY `unread_count` (`unread_count`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `wp_bp_messages_recipients`
--

INSERT INTO `wp_bp_messages_recipients` (`id`, `user_id`, `thread_id`, `unread_count`, `sender_only`, `is_deleted`) VALUES
(1, 1, 1, 0, 0, 0),
(2, 4, 1, 0, 0, 0),
(3, 1, 2, 0, 0, 0),
(4, 4, 2, 0, 1, 0),
(5, 1, 3, 0, 0, 0),
(6, 4, 3, 0, 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_notifications`
--

CREATE TABLE `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_user_blogs`
--

CREATE TABLE `wp_bp_user_blogs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `wp_bp_user_blogs`
--

INSERT INTO `wp_bp_user_blogs` (`id`, `user_id`, `blog_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_user_blogs_blogmeta`
--

CREATE TABLE `wp_bp_user_blogs_blogmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `wp_bp_user_blogs_blogmeta`
--

INSERT INTO `wp_bp_user_blogs_blogmeta` (`id`, `blog_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'name', 'BUĎ KUTIL'),
(2, 1, 'description', 'Kutilské obrabění kůže, dřeva a dalších přírodních materiálů'),
(3, 1, 'last_activity', '2013-05-02 11:40:16');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_xprofile_data`
--

CREATE TABLE `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Vypisuji data pro tabulku `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 1, 'David Šuška', '2014-01-08 11:06:52'),
(6, 1, 4, 'David Myšakof myšák', '2013-11-03 08:21:44'),
(7, 2, 4, 'dělam z kuže a dřeva', '2013-05-02 11:14:08'),
(52, 1, 29, 'Pavel Drbálek', '2013-06-30 11:10:59'),
(53, 1, 30, 'simon mazanec', '2013-07-07 11:10:46'),
(54, 1, 31, 'tomas  prichystal', '2013-07-22 11:18:30'),
(55, 1, 32, 'mart dall', '2013-07-23 21:19:01'),
(56, 1, 33, 'Michal Jánošík', '2013-09-08 20:07:09'),
(57, 1, 34, 'asdf asdf', '2013-11-18 09:19:55'),
(58, 2, 1, 'rterwt ergt sdfgdfg', '2014-01-08 11:06:52'),
(59, 516, 1, 'a:3:{i:0;s:8:"Špatně";i:1;s:17:"Může být lépe";i:2;s:17:"Může být hůř";}', '2014-01-08 11:06:52'),
(60, 521, 1, '2033-04-03 00:00:00', '2014-01-08 11:06:52');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_xprofile_fields`
--

CREATE TABLE `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=522 ;

--
-- Vypisuji data pro tabulku `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Jméno i příjmení', '', 1, 0, 0, 0, '', 0),
(2, 1, 0, 'textarea', 'Tvoje zaměření?', 'Rozepiš se. Co děláš? Co umíš? Co kutiš?', 0, 0, 1, 0, '', 1),
(3, 2, 0, 'textbox', 'Ulice', '', 0, 0, 1, 0, '', 1),
(4, 2, 0, 'textbox', 'PSČ', '', 0, 0, 2, 0, '', 1),
(5, 2, 0, 'textbox', 'Město', '', 0, 0, 3, 0, '', 1),
(6, 3, 0, 'textbox', 'Číslo účtu a kód banky', '', 0, 0, 1, 0, '', 1),
(7, 4, 0, 'textbox', 'First Name', '', 1, 0, 1, 0, '', 1),
(8, 4, 0, 'textbox', 'Last Name', '', 1, 0, 2, 0, '', 1),
(9, 4, 0, 'textbox', 'Company', '', 0, 0, 3, 0, '', 1),
(10, 4, 0, 'textbox', 'Address 1', '', 1, 0, 4, 0, '', 1),
(11, 4, 0, 'textbox', 'Address 2', '', 0, 0, 5, 0, '', 1),
(12, 4, 0, 'textbox', 'City', '', 1, 0, 6, 0, '', 1),
(13, 4, 0, 'textbox', 'Postcode', '', 1, 0, 7, 0, '', 1),
(14, 4, 0, 'selectbox', 'Country', '', 1, 0, 8, 0, 'asc', 1),
(15, 4, 14, 'option', '&#197;land Islands', '', 0, 0, 0, 1, '', 1),
(16, 4, 14, 'option', 'Afghanistán', '', 0, 0, 0, 2, '', 1),
(17, 4, 14, 'option', 'Albánie', '', 0, 0, 0, 3, '', 1),
(18, 4, 14, 'option', 'Alžírsko', '', 0, 0, 0, 4, '', 1),
(19, 4, 14, 'option', 'Andorra', '', 0, 0, 0, 5, '', 1),
(20, 4, 14, 'option', 'Angola', '', 0, 0, 0, 6, '', 1),
(21, 4, 14, 'option', 'Anguilla', '', 0, 0, 0, 7, '', 1),
(22, 4, 14, 'option', 'Antarktida', '', 0, 0, 0, 8, '', 1),
(23, 4, 14, 'option', 'Antigua a Barbuda', '', 0, 0, 0, 9, '', 1),
(24, 4, 14, 'option', 'Argentina', '', 0, 0, 0, 10, '', 1),
(25, 4, 14, 'option', 'Arménie', '', 0, 0, 0, 11, '', 1),
(26, 4, 14, 'option', 'Aruba', '', 0, 0, 0, 12, '', 1),
(27, 4, 14, 'option', 'Austrálie', '', 0, 0, 0, 13, '', 1),
(28, 4, 14, 'option', 'Azerbaidžán', '', 0, 0, 0, 14, '', 1),
(29, 4, 14, 'option', 'Bahamy', '', 0, 0, 0, 15, '', 1),
(30, 4, 14, 'option', 'Bahrain', '', 0, 0, 0, 16, '', 1),
(31, 4, 14, 'option', 'Bangladéš', '', 0, 0, 0, 17, '', 1),
(32, 4, 14, 'option', 'Barbados', '', 0, 0, 0, 18, '', 1),
(33, 4, 14, 'option', 'Belau', '', 0, 0, 0, 19, '', 1),
(34, 4, 14, 'option', 'Belgie', '', 0, 0, 0, 20, '', 1),
(35, 4, 14, 'option', 'Belize', '', 0, 0, 0, 21, '', 1),
(36, 4, 14, 'option', 'Benin', '', 0, 0, 0, 22, '', 1),
(37, 4, 14, 'option', 'Bermudy', '', 0, 0, 0, 23, '', 1),
(38, 4, 14, 'option', 'Bolívie', '', 0, 0, 0, 24, '', 1),
(39, 4, 14, 'option', 'Bonaire, Saint Eustatius a Saba', '', 0, 0, 0, 25, '', 1),
(40, 4, 14, 'option', 'Bosna a Herzegovina', '', 0, 0, 0, 26, '', 1),
(41, 4, 14, 'option', 'Botswana', '', 0, 0, 0, 27, '', 1),
(42, 4, 14, 'option', 'Bouvet Island', '', 0, 0, 0, 28, '', 1),
(43, 4, 14, 'option', 'Brazílie', '', 0, 0, 0, 29, '', 1),
(44, 4, 14, 'option', 'British Indian Ocean Territory', '', 0, 0, 0, 30, '', 1),
(45, 4, 14, 'option', 'Britské Panenské ostrovy', '', 0, 0, 0, 31, '', 1),
(46, 4, 14, 'option', 'Brunej', '', 0, 0, 0, 32, '', 1),
(47, 4, 14, 'option', 'Bulharsko', '', 0, 0, 0, 33, '', 1),
(48, 4, 14, 'option', 'Burkina Faso', '', 0, 0, 0, 34, '', 1),
(49, 4, 14, 'option', 'Burundi', '', 0, 0, 0, 35, '', 1),
(50, 4, 14, 'option', 'Bútán', '', 0, 0, 0, 36, '', 1),
(51, 4, 14, 'option', 'Bělorusko', '', 0, 0, 0, 37, '', 1),
(52, 4, 14, 'option', 'Cambodia', '', 0, 0, 0, 38, '', 1),
(53, 4, 14, 'option', 'Camerun', '', 0, 0, 0, 39, '', 1),
(54, 4, 14, 'option', 'Cape Verde', '', 0, 0, 0, 40, '', 1),
(55, 4, 14, 'option', 'Cayman Islands', '', 0, 0, 0, 41, '', 1),
(56, 4, 14, 'option', 'Chile', '', 0, 0, 0, 42, '', 1),
(57, 4, 14, 'option', 'Comoros', '', 0, 0, 0, 43, '', 1),
(58, 4, 14, 'option', 'Cookovy ostrovy', '', 0, 0, 0, 44, '', 1),
(59, 4, 14, 'option', 'Costa Rica', '', 0, 0, 0, 45, '', 1),
(60, 4, 14, 'option', 'Croatia', '', 0, 0, 0, 46, '', 1),
(61, 4, 14, 'option', 'Cura&Ccedil;ao', '', 0, 0, 0, 47, '', 1),
(62, 4, 14, 'option', 'Djibouti', '', 0, 0, 0, 48, '', 1),
(63, 4, 14, 'option', 'Dominica', '', 0, 0, 0, 49, '', 1),
(64, 4, 14, 'option', 'Dominikánská Republika', '', 0, 0, 0, 50, '', 1),
(65, 4, 14, 'option', 'Dánsko', '', 0, 0, 0, 51, '', 1),
(66, 4, 14, 'option', 'Egypt', '', 0, 0, 0, 52, '', 1),
(67, 4, 14, 'option', 'Ekvádor', '', 0, 0, 0, 53, '', 1),
(68, 4, 14, 'option', 'Equatorial Guinea', '', 0, 0, 0, 54, '', 1),
(69, 4, 14, 'option', 'Eritrea', '', 0, 0, 0, 55, '', 1),
(70, 4, 14, 'option', 'Estonsko', '', 0, 0, 0, 56, '', 1),
(71, 4, 14, 'option', 'Etiopie', '', 0, 0, 0, 57, '', 1),
(72, 4, 14, 'option', 'Falklandské ostrovy', '', 0, 0, 0, 58, '', 1),
(73, 4, 14, 'option', 'Faroe Islands', '', 0, 0, 0, 59, '', 1),
(74, 4, 14, 'option', 'Fiji', '', 0, 0, 0, 60, '', 1),
(75, 4, 14, 'option', 'Filipíny', '', 0, 0, 0, 61, '', 1),
(76, 4, 14, 'option', 'Finsko', '', 0, 0, 0, 62, '', 1),
(77, 4, 14, 'option', 'France', '', 0, 0, 0, 63, '', 1),
(78, 4, 14, 'option', 'Francouzské Jižní Teritorium', '', 0, 0, 0, 64, '', 1),
(79, 4, 14, 'option', 'French Guiana', '', 0, 0, 0, 65, '', 1),
(80, 4, 14, 'option', 'French Polynesia', '', 0, 0, 0, 66, '', 1),
(81, 4, 14, 'option', 'Gabon', '', 0, 0, 0, 67, '', 1),
(82, 4, 14, 'option', 'Gambia', '', 0, 0, 0, 68, '', 1),
(83, 4, 14, 'option', 'Georgia', '', 0, 0, 0, 69, '', 1),
(84, 4, 14, 'option', 'Ghana', '', 0, 0, 0, 70, '', 1),
(85, 4, 14, 'option', 'Gibraltar', '', 0, 0, 0, 71, '', 1),
(86, 4, 14, 'option', 'Greece', '', 0, 0, 0, 72, '', 1),
(87, 4, 14, 'option', 'Greenland', '', 0, 0, 0, 73, '', 1),
(88, 4, 14, 'option', 'Grenada', '', 0, 0, 0, 74, '', 1),
(89, 4, 14, 'option', 'Guadeloupe', '', 0, 0, 0, 75, '', 1),
(90, 4, 14, 'option', 'Guatemala', '', 0, 0, 0, 76, '', 1),
(91, 4, 14, 'option', 'Guernsey', '', 0, 0, 0, 77, '', 1),
(92, 4, 14, 'option', 'Guinea', '', 0, 0, 0, 78, '', 1),
(93, 4, 14, 'option', 'Guinea-Bissau', '', 0, 0, 0, 79, '', 1),
(94, 4, 14, 'option', 'Guyana', '', 0, 0, 0, 80, '', 1),
(95, 4, 14, 'option', 'Haiti', '', 0, 0, 0, 81, '', 1),
(96, 4, 14, 'option', 'Heard Island and McDonald Islands', '', 0, 0, 0, 82, '', 1),
(97, 4, 14, 'option', 'Holandské ostrovy', '', 0, 0, 0, 83, '', 1),
(98, 4, 14, 'option', 'Honduras', '', 0, 0, 0, 84, '', 1),
(99, 4, 14, 'option', 'Hong Kong', '', 0, 0, 0, 85, '', 1),
(100, 4, 14, 'option', 'Hungary', '', 0, 0, 0, 86, '', 1),
(101, 4, 14, 'option', 'Iceland', '', 0, 0, 0, 87, '', 1),
(102, 4, 14, 'option', 'India', '', 0, 0, 0, 88, '', 1),
(103, 4, 14, 'option', 'Indonesia', '', 0, 0, 0, 89, '', 1),
(104, 4, 14, 'option', 'Iran', '', 0, 0, 0, 90, '', 1),
(105, 4, 14, 'option', 'Iraq', '', 0, 0, 0, 91, '', 1),
(106, 4, 14, 'option', 'Isle of Man', '', 0, 0, 0, 92, '', 1),
(107, 4, 14, 'option', 'Israel', '', 0, 0, 0, 93, '', 1),
(108, 4, 14, 'option', 'Italy', '', 0, 0, 0, 94, '', 1),
(109, 4, 14, 'option', 'Jamaica', '', 0, 0, 0, 95, '', 1),
(110, 4, 14, 'option', 'Japan', '', 0, 0, 0, 96, '', 1),
(111, 4, 14, 'option', 'Jemen', '', 0, 0, 0, 97, '', 1),
(112, 4, 14, 'option', 'Jersey', '', 0, 0, 0, 98, '', 1),
(113, 4, 14, 'option', 'Jižní Afrika', '', 0, 0, 0, 99, '', 1),
(114, 4, 14, 'option', 'Jižní Súdán', '', 0, 0, 0, 100, '', 1),
(115, 4, 14, 'option', 'Jordan', '', 0, 0, 0, 101, '', 1),
(116, 4, 14, 'option', 'Kanada', '', 0, 0, 0, 102, '', 1),
(117, 4, 14, 'option', 'Katar', '', 0, 0, 0, 103, '', 1),
(118, 4, 14, 'option', 'Kazakhstan', '', 0, 0, 0, 104, '', 1),
(119, 4, 14, 'option', 'Kenya', '', 0, 0, 0, 105, '', 1),
(120, 4, 14, 'option', 'Kiribati', '', 0, 0, 0, 106, '', 1),
(121, 4, 14, 'option', 'Kokosové ostrovy', '', 0, 0, 0, 107, '', 1),
(122, 4, 14, 'option', 'Kolumbie', '', 0, 0, 0, 108, '', 1),
(123, 4, 14, 'option', 'Kongo (Brazzaville)', '', 0, 0, 0, 109, '', 1),
(124, 4, 14, 'option', 'Kongo (Kinšasa)', '', 0, 0, 0, 110, '', 1),
(125, 4, 14, 'option', 'Kuba', '', 0, 0, 0, 111, '', 1),
(126, 4, 14, 'option', 'Kuwait', '', 0, 0, 0, 112, '', 1),
(127, 4, 14, 'option', 'Kypr', '', 0, 0, 0, 113, '', 1),
(128, 4, 14, 'option', 'Kyrgyzstan', '', 0, 0, 0, 114, '', 1),
(129, 4, 14, 'option', 'Laos', '', 0, 0, 0, 115, '', 1),
(130, 4, 14, 'option', 'Latvia', '', 0, 0, 0, 116, '', 1),
(131, 4, 14, 'option', 'Lebanon', '', 0, 0, 0, 117, '', 1),
(132, 4, 14, 'option', 'Lesotho', '', 0, 0, 0, 118, '', 1),
(133, 4, 14, 'option', 'Liberia', '', 0, 0, 0, 119, '', 1),
(134, 4, 14, 'option', 'Libya', '', 0, 0, 0, 120, '', 1),
(135, 4, 14, 'option', 'Liechtenstein', '', 0, 0, 0, 121, '', 1),
(136, 4, 14, 'option', 'Lithuania', '', 0, 0, 0, 122, '', 1),
(137, 4, 14, 'option', 'Luxembourg', '', 0, 0, 0, 123, '', 1),
(138, 4, 14, 'option', 'Macao S.A.R., China', '', 0, 0, 0, 124, '', 1),
(139, 4, 14, 'option', 'Macedonia', '', 0, 0, 0, 125, '', 1),
(140, 4, 14, 'option', 'Madagascar', '', 0, 0, 0, 126, '', 1),
(141, 4, 14, 'option', 'Malawi', '', 0, 0, 0, 127, '', 1),
(142, 4, 14, 'option', 'Malaysia', '', 0, 0, 0, 128, '', 1),
(143, 4, 14, 'option', 'Maldives', '', 0, 0, 0, 129, '', 1),
(144, 4, 14, 'option', 'Mali', '', 0, 0, 0, 130, '', 1),
(145, 4, 14, 'option', 'Malta', '', 0, 0, 0, 131, '', 1),
(146, 4, 14, 'option', 'Marshall Islands', '', 0, 0, 0, 132, '', 1),
(147, 4, 14, 'option', 'Martinique', '', 0, 0, 0, 133, '', 1),
(148, 4, 14, 'option', 'Mauritania', '', 0, 0, 0, 134, '', 1),
(149, 4, 14, 'option', 'Mauritius', '', 0, 0, 0, 135, '', 1),
(150, 4, 14, 'option', 'Mayotte', '', 0, 0, 0, 136, '', 1),
(151, 4, 14, 'option', 'Mexico', '', 0, 0, 0, 137, '', 1),
(152, 4, 14, 'option', 'Micronesia', '', 0, 0, 0, 138, '', 1),
(153, 4, 14, 'option', 'Moldova', '', 0, 0, 0, 139, '', 1),
(154, 4, 14, 'option', 'Monaco', '', 0, 0, 0, 140, '', 1),
(155, 4, 14, 'option', 'Mongolia', '', 0, 0, 0, 141, '', 1),
(156, 4, 14, 'option', 'Montenegro', '', 0, 0, 0, 142, '', 1),
(157, 4, 14, 'option', 'Montserrat', '', 0, 0, 0, 143, '', 1),
(158, 4, 14, 'option', 'Morocco', '', 0, 0, 0, 144, '', 1),
(159, 4, 14, 'option', 'Mozambique', '', 0, 0, 0, 145, '', 1),
(160, 4, 14, 'option', 'Myanmar', '', 0, 0, 0, 146, '', 1),
(161, 4, 14, 'option', 'Namibia', '', 0, 0, 0, 147, '', 1),
(162, 4, 14, 'option', 'Nauru', '', 0, 0, 0, 148, '', 1),
(163, 4, 14, 'option', 'Nepal', '', 0, 0, 0, 149, '', 1),
(164, 4, 14, 'option', 'Netherlands', '', 0, 0, 0, 150, '', 1),
(165, 4, 14, 'option', 'New Caledonia', '', 0, 0, 0, 151, '', 1),
(166, 4, 14, 'option', 'New Zealand', '', 0, 0, 0, 152, '', 1),
(167, 4, 14, 'option', 'Nicaragua', '', 0, 0, 0, 153, '', 1),
(168, 4, 14, 'option', 'Niger', '', 0, 0, 0, 154, '', 1),
(169, 4, 14, 'option', 'Nigeria', '', 0, 0, 0, 155, '', 1),
(170, 4, 14, 'option', 'Niue', '', 0, 0, 0, 156, '', 1),
(171, 4, 14, 'option', 'Norfolk Island', '', 0, 0, 0, 157, '', 1),
(172, 4, 14, 'option', 'North Korea', '', 0, 0, 0, 158, '', 1),
(173, 4, 14, 'option', 'Norway', '', 0, 0, 0, 159, '', 1),
(174, 4, 14, 'option', 'Německo', '', 0, 0, 0, 160, '', 1),
(175, 4, 14, 'option', 'Oman', '', 0, 0, 0, 161, '', 1),
(176, 4, 14, 'option', 'Palestinské Teritorium', '', 0, 0, 0, 162, '', 1),
(177, 4, 14, 'option', 'Panama', '', 0, 0, 0, 163, '', 1),
(178, 4, 14, 'option', 'Papua Nová Guinea', '', 0, 0, 0, 164, '', 1),
(179, 4, 14, 'option', 'Paraguay', '', 0, 0, 0, 165, '', 1),
(180, 4, 14, 'option', 'Peru', '', 0, 0, 0, 166, '', 1),
(181, 4, 14, 'option', 'Pitcairn', '', 0, 0, 0, 167, '', 1),
(182, 4, 14, 'option', 'Pobřeží slonoviny', '', 0, 0, 0, 168, '', 1),
(183, 4, 14, 'option', 'Polsko', '', 0, 0, 0, 169, '', 1),
(184, 4, 14, 'option', 'Portugalsko', '', 0, 0, 0, 170, '', 1),
(185, 4, 14, 'option', 'Pákistán', '', 0, 0, 0, 171, '', 1),
(186, 4, 14, 'option', 'Rakousko', '', 0, 0, 0, 172, '', 1),
(187, 4, 14, 'option', 'Republic of Ireland', '', 0, 0, 0, 173, '', 1),
(188, 4, 14, 'option', 'Reunion', '', 0, 0, 0, 174, '', 1),
(189, 4, 14, 'option', 'Rumunsko', '', 0, 0, 0, 175, '', 1),
(190, 4, 14, 'option', 'Rusko', '', 0, 0, 0, 176, '', 1),
(191, 4, 14, 'option', 'Rwanda', '', 0, 0, 0, 177, '', 1),
(192, 4, 14, 'option', 'S&atilde;o Tom&eacute; and Pr&iacute;ncipe', '', 0, 0, 0, 178, '', 1),
(193, 4, 14, 'option', 'Saint Barth&eacute;lemy', '', 0, 0, 0, 179, '', 1),
(194, 4, 14, 'option', 'Saint Kitts and Nevis', '', 0, 0, 0, 180, '', 1),
(195, 4, 14, 'option', 'Saint Lucia', '', 0, 0, 0, 181, '', 1),
(196, 4, 14, 'option', 'Saint Martin (Dutch part)', '', 0, 0, 0, 182, '', 1),
(197, 4, 14, 'option', 'Saint Martin (French part)', '', 0, 0, 0, 183, '', 1),
(198, 4, 14, 'option', 'Saint Pierre a Miquelon', '', 0, 0, 0, 184, '', 1),
(199, 4, 14, 'option', 'Salvador', '', 0, 0, 0, 185, '', 1),
(200, 4, 14, 'option', 'San Marino', '', 0, 0, 0, 186, '', 1),
(201, 4, 14, 'option', 'Saudská Arábie', '', 0, 0, 0, 187, '', 1),
(202, 4, 14, 'option', 'Senegal', '', 0, 0, 0, 188, '', 1),
(203, 4, 14, 'option', 'Seyšely', '', 0, 0, 0, 189, '', 1),
(204, 4, 14, 'option', 'Sierra Leone', '', 0, 0, 0, 190, '', 1),
(205, 4, 14, 'option', 'Singapur', '', 0, 0, 0, 191, '', 1),
(206, 4, 14, 'option', 'Slovenská republika', '', 0, 0, 0, 192, '', 1),
(207, 4, 14, 'option', 'Slovinsko', '', 0, 0, 0, 193, '', 1),
(208, 4, 14, 'option', 'Somálsko', '', 0, 0, 0, 194, '', 1),
(209, 4, 14, 'option', 'South Georgia/Sandwich Islands', '', 0, 0, 0, 195, '', 1),
(210, 4, 14, 'option', 'South Korea', '', 0, 0, 0, 196, '', 1),
(211, 4, 14, 'option', 'Spojené Arabské Emiráty', '', 0, 0, 0, 197, '', 1),
(212, 4, 14, 'option', 'Spojené státy', '', 0, 0, 0, 198, '', 1),
(213, 4, 14, 'option', 'Srbsko', '', 0, 0, 0, 199, '', 1),
(214, 4, 14, 'option', 'Sri Lanka', '', 0, 0, 0, 200, '', 1),
(215, 4, 14, 'option', 'Střední Africká republika', '', 0, 0, 0, 201, '', 1),
(216, 4, 14, 'option', 'Surinam', '', 0, 0, 0, 202, '', 1),
(217, 4, 14, 'option', 'Svalbard a Jan Mayen', '', 0, 0, 0, 203, '', 1),
(218, 4, 14, 'option', 'Svatá Helena', '', 0, 0, 0, 204, '', 1),
(219, 4, 14, 'option', 'Svatý Vincent a Grenadiny', '', 0, 0, 0, 205, '', 1),
(220, 4, 14, 'option', 'Svazijsko', '', 0, 0, 0, 206, '', 1),
(221, 4, 14, 'option', 'Súdán', '', 0, 0, 0, 207, '', 1),
(222, 4, 14, 'option', 'Sýrie', '', 0, 0, 0, 208, '', 1),
(223, 4, 14, 'option', 'Taiwan', '', 0, 0, 0, 209, '', 1),
(224, 4, 14, 'option', 'Tajikistan', '', 0, 0, 0, 210, '', 1),
(225, 4, 14, 'option', 'Tanzanie', '', 0, 0, 0, 211, '', 1),
(226, 4, 14, 'option', 'Thajsko', '', 0, 0, 0, 212, '', 1),
(227, 4, 14, 'option', 'Timor-Leste', '', 0, 0, 0, 213, '', 1),
(228, 4, 14, 'option', 'Togo', '', 0, 0, 0, 214, '', 1),
(229, 4, 14, 'option', 'Tokelau', '', 0, 0, 0, 215, '', 1),
(230, 4, 14, 'option', 'Tonga', '', 0, 0, 0, 216, '', 1),
(231, 4, 14, 'option', 'Trinidad and Tobago', '', 0, 0, 0, 217, '', 1),
(232, 4, 14, 'option', 'Tunisko', '', 0, 0, 0, 218, '', 1),
(233, 4, 14, 'option', 'Turecko', '', 0, 0, 0, 219, '', 1),
(234, 4, 14, 'option', 'Turkmenistan', '', 0, 0, 0, 220, '', 1),
(235, 4, 14, 'option', 'Turks a Caicos', '', 0, 0, 0, 221, '', 1),
(236, 4, 14, 'option', 'Tuvalu', '', 0, 0, 0, 222, '', 1),
(237, 4, 14, 'option', 'Uganda', '', 0, 0, 0, 223, '', 1),
(238, 4, 14, 'option', 'Ukraina', '', 0, 0, 0, 224, '', 1),
(239, 4, 14, 'option', 'United Kingdom', '', 0, 1, 0, 225, '', 1),
(240, 4, 14, 'option', 'Uruguay', '', 0, 0, 0, 226, '', 1),
(241, 4, 14, 'option', 'Uzbekistan', '', 0, 0, 0, 227, '', 1),
(242, 4, 14, 'option', 'Vanuatu', '', 0, 0, 0, 228, '', 1),
(243, 4, 14, 'option', 'Vatikán', '', 0, 0, 0, 229, '', 1),
(244, 4, 14, 'option', 'Venezuela', '', 0, 0, 0, 230, '', 1),
(245, 4, 14, 'option', 'Vietnam', '', 0, 0, 0, 231, '', 1),
(246, 4, 14, 'option', 'Vánoční ostrovy', '', 0, 0, 0, 232, '', 1),
(247, 4, 14, 'option', 'Wallis a Futuna', '', 0, 0, 0, 233, '', 1),
(248, 4, 14, 'option', 'Western Samoa', '', 0, 0, 0, 234, '', 1),
(249, 4, 14, 'option', 'Zambie', '', 0, 0, 0, 235, '', 1),
(250, 4, 14, 'option', 'Zimbabwe', '', 0, 0, 0, 236, '', 1),
(251, 4, 14, 'option', 'Západní Sahara', '', 0, 0, 0, 237, '', 1),
(252, 4, 14, 'option', 'Čad', '', 0, 0, 0, 238, '', 1),
(253, 4, 14, 'option', 'Česká republika', '', 0, 0, 0, 239, '', 1),
(254, 4, 14, 'option', 'Čína', '', 0, 0, 0, 240, '', 1),
(255, 4, 14, 'option', 'Šalamounovy ostrovy', '', 0, 0, 0, 241, '', 1),
(256, 4, 14, 'option', 'Španělsko', '', 0, 0, 0, 242, '', 1),
(257, 4, 14, 'option', 'Švédsko', '', 0, 0, 0, 243, '', 1),
(258, 4, 14, 'option', 'Švýcarsko', '', 0, 0, 0, 244, '', 1),
(259, 4, 0, 'textbox', 'State', '', 1, 0, 9, 0, '', 1),
(260, 4, 0, 'textbox', 'Email Address', '', 1, 0, 10, 0, '', 1),
(261, 4, 0, 'textbox', 'Phone', '', 1, 0, 11, 0, '', 1),
(262, 4, 0, 'textbox', 'Fax', '', 0, 0, 12, 0, '', 1),
(263, 5, 0, 'textbox', 'First Name', '', 1, 0, 1, 0, '', 1),
(264, 5, 0, 'textbox', 'Last Name', '', 1, 0, 2, 0, '', 1),
(265, 5, 0, 'textbox', 'Company', '', 0, 0, 3, 0, '', 1),
(266, 5, 0, 'textbox', 'Address 1', '', 1, 0, 4, 0, '', 1),
(267, 5, 0, 'textbox', 'Address 2', '', 0, 0, 5, 0, '', 1),
(268, 5, 0, 'textbox', 'City', '', 1, 0, 6, 0, '', 1),
(269, 5, 0, 'textbox', 'Postcode', '', 1, 0, 7, 0, '', 1),
(270, 5, 0, 'selectbox', 'Country', '', 1, 0, 8, 0, 'asc', 1),
(271, 5, 270, 'option', '&#197;land Islands', '', 0, 0, 0, 1, '', 1),
(272, 5, 270, 'option', 'Afghanistán', '', 0, 0, 0, 2, '', 1),
(273, 5, 270, 'option', 'Albánie', '', 0, 0, 0, 3, '', 1),
(274, 5, 270, 'option', 'Alžírsko', '', 0, 0, 0, 4, '', 1),
(275, 5, 270, 'option', 'Andorra', '', 0, 0, 0, 5, '', 1),
(276, 5, 270, 'option', 'Angola', '', 0, 0, 0, 6, '', 1),
(277, 5, 270, 'option', 'Anguilla', '', 0, 0, 0, 7, '', 1),
(278, 5, 270, 'option', 'Antarktida', '', 0, 0, 0, 8, '', 1),
(279, 5, 270, 'option', 'Antigua a Barbuda', '', 0, 0, 0, 9, '', 1),
(280, 5, 270, 'option', 'Argentina', '', 0, 0, 0, 10, '', 1),
(281, 5, 270, 'option', 'Arménie', '', 0, 0, 0, 11, '', 1),
(282, 5, 270, 'option', 'Aruba', '', 0, 0, 0, 12, '', 1),
(283, 5, 270, 'option', 'Austrálie', '', 0, 0, 0, 13, '', 1),
(284, 5, 270, 'option', 'Azerbaidžán', '', 0, 0, 0, 14, '', 1),
(285, 5, 270, 'option', 'Bahamy', '', 0, 0, 0, 15, '', 1),
(286, 5, 270, 'option', 'Bahrain', '', 0, 0, 0, 16, '', 1),
(287, 5, 270, 'option', 'Bangladéš', '', 0, 0, 0, 17, '', 1),
(288, 5, 270, 'option', 'Barbados', '', 0, 0, 0, 18, '', 1),
(289, 5, 270, 'option', 'Belau', '', 0, 0, 0, 19, '', 1),
(290, 5, 270, 'option', 'Belgie', '', 0, 0, 0, 20, '', 1),
(291, 5, 270, 'option', 'Belize', '', 0, 0, 0, 21, '', 1),
(292, 5, 270, 'option', 'Benin', '', 0, 0, 0, 22, '', 1),
(293, 5, 270, 'option', 'Bermudy', '', 0, 0, 0, 23, '', 1),
(294, 5, 270, 'option', 'Bolívie', '', 0, 0, 0, 24, '', 1),
(295, 5, 270, 'option', 'Bonaire, Saint Eustatius a Saba', '', 0, 0, 0, 25, '', 1),
(296, 5, 270, 'option', 'Bosna a Herzegovina', '', 0, 0, 0, 26, '', 1),
(297, 5, 270, 'option', 'Botswana', '', 0, 0, 0, 27, '', 1),
(298, 5, 270, 'option', 'Bouvet Island', '', 0, 0, 0, 28, '', 1),
(299, 5, 270, 'option', 'Brazílie', '', 0, 0, 0, 29, '', 1),
(300, 5, 270, 'option', 'British Indian Ocean Territory', '', 0, 0, 0, 30, '', 1),
(301, 5, 270, 'option', 'Britské Panenské ostrovy', '', 0, 0, 0, 31, '', 1),
(302, 5, 270, 'option', 'Brunej', '', 0, 0, 0, 32, '', 1),
(303, 5, 270, 'option', 'Bulharsko', '', 0, 0, 0, 33, '', 1),
(304, 5, 270, 'option', 'Burkina Faso', '', 0, 0, 0, 34, '', 1),
(305, 5, 270, 'option', 'Burundi', '', 0, 0, 0, 35, '', 1),
(306, 5, 270, 'option', 'Bútán', '', 0, 0, 0, 36, '', 1),
(307, 5, 270, 'option', 'Bělorusko', '', 0, 0, 0, 37, '', 1),
(308, 5, 270, 'option', 'Cambodia', '', 0, 0, 0, 38, '', 1),
(309, 5, 270, 'option', 'Camerun', '', 0, 0, 0, 39, '', 1),
(310, 5, 270, 'option', 'Cape Verde', '', 0, 0, 0, 40, '', 1),
(311, 5, 270, 'option', 'Cayman Islands', '', 0, 0, 0, 41, '', 1),
(312, 5, 270, 'option', 'Chile', '', 0, 0, 0, 42, '', 1),
(313, 5, 270, 'option', 'Comoros', '', 0, 0, 0, 43, '', 1),
(314, 5, 270, 'option', 'Cookovy ostrovy', '', 0, 0, 0, 44, '', 1),
(315, 5, 270, 'option', 'Costa Rica', '', 0, 0, 0, 45, '', 1),
(316, 5, 270, 'option', 'Croatia', '', 0, 0, 0, 46, '', 1),
(317, 5, 270, 'option', 'Cura&Ccedil;ao', '', 0, 0, 0, 47, '', 1),
(318, 5, 270, 'option', 'Djibouti', '', 0, 0, 0, 48, '', 1),
(319, 5, 270, 'option', 'Dominica', '', 0, 0, 0, 49, '', 1),
(320, 5, 270, 'option', 'Dominikánská Republika', '', 0, 0, 0, 50, '', 1),
(321, 5, 270, 'option', 'Dánsko', '', 0, 0, 0, 51, '', 1),
(322, 5, 270, 'option', 'Egypt', '', 0, 0, 0, 52, '', 1),
(323, 5, 270, 'option', 'Ekvádor', '', 0, 0, 0, 53, '', 1),
(324, 5, 270, 'option', 'Equatorial Guinea', '', 0, 0, 0, 54, '', 1),
(325, 5, 270, 'option', 'Eritrea', '', 0, 0, 0, 55, '', 1),
(326, 5, 270, 'option', 'Estonsko', '', 0, 0, 0, 56, '', 1),
(327, 5, 270, 'option', 'Etiopie', '', 0, 0, 0, 57, '', 1),
(328, 5, 270, 'option', 'Falklandské ostrovy', '', 0, 0, 0, 58, '', 1),
(329, 5, 270, 'option', 'Faroe Islands', '', 0, 0, 0, 59, '', 1),
(330, 5, 270, 'option', 'Fiji', '', 0, 0, 0, 60, '', 1),
(331, 5, 270, 'option', 'Filipíny', '', 0, 0, 0, 61, '', 1),
(332, 5, 270, 'option', 'Finsko', '', 0, 0, 0, 62, '', 1),
(333, 5, 270, 'option', 'France', '', 0, 0, 0, 63, '', 1),
(334, 5, 270, 'option', 'Francouzské Jižní Teritorium', '', 0, 0, 0, 64, '', 1),
(335, 5, 270, 'option', 'French Guiana', '', 0, 0, 0, 65, '', 1),
(336, 5, 270, 'option', 'French Polynesia', '', 0, 0, 0, 66, '', 1),
(337, 5, 270, 'option', 'Gabon', '', 0, 0, 0, 67, '', 1),
(338, 5, 270, 'option', 'Gambia', '', 0, 0, 0, 68, '', 1),
(339, 5, 270, 'option', 'Georgia', '', 0, 0, 0, 69, '', 1),
(340, 5, 270, 'option', 'Ghana', '', 0, 0, 0, 70, '', 1),
(341, 5, 270, 'option', 'Gibraltar', '', 0, 0, 0, 71, '', 1),
(342, 5, 270, 'option', 'Greece', '', 0, 0, 0, 72, '', 1),
(343, 5, 270, 'option', 'Greenland', '', 0, 0, 0, 73, '', 1),
(344, 5, 270, 'option', 'Grenada', '', 0, 0, 0, 74, '', 1),
(345, 5, 270, 'option', 'Guadeloupe', '', 0, 0, 0, 75, '', 1),
(346, 5, 270, 'option', 'Guatemala', '', 0, 0, 0, 76, '', 1),
(347, 5, 270, 'option', 'Guernsey', '', 0, 0, 0, 77, '', 1),
(348, 5, 270, 'option', 'Guinea', '', 0, 0, 0, 78, '', 1),
(349, 5, 270, 'option', 'Guinea-Bissau', '', 0, 0, 0, 79, '', 1),
(350, 5, 270, 'option', 'Guyana', '', 0, 0, 0, 80, '', 1),
(351, 5, 270, 'option', 'Haiti', '', 0, 0, 0, 81, '', 1),
(352, 5, 270, 'option', 'Heard Island and McDonald Islands', '', 0, 0, 0, 82, '', 1),
(353, 5, 270, 'option', 'Holandské ostrovy', '', 0, 0, 0, 83, '', 1),
(354, 5, 270, 'option', 'Honduras', '', 0, 0, 0, 84, '', 1),
(355, 5, 270, 'option', 'Hong Kong', '', 0, 0, 0, 85, '', 1),
(356, 5, 270, 'option', 'Hungary', '', 0, 0, 0, 86, '', 1),
(357, 5, 270, 'option', 'Iceland', '', 0, 0, 0, 87, '', 1),
(358, 5, 270, 'option', 'India', '', 0, 0, 0, 88, '', 1),
(359, 5, 270, 'option', 'Indonesia', '', 0, 0, 0, 89, '', 1),
(360, 5, 270, 'option', 'Iran', '', 0, 0, 0, 90, '', 1),
(361, 5, 270, 'option', 'Iraq', '', 0, 0, 0, 91, '', 1),
(362, 5, 270, 'option', 'Isle of Man', '', 0, 0, 0, 92, '', 1),
(363, 5, 270, 'option', 'Israel', '', 0, 0, 0, 93, '', 1),
(364, 5, 270, 'option', 'Italy', '', 0, 0, 0, 94, '', 1),
(365, 5, 270, 'option', 'Jamaica', '', 0, 0, 0, 95, '', 1),
(366, 5, 270, 'option', 'Japan', '', 0, 0, 0, 96, '', 1),
(367, 5, 270, 'option', 'Jemen', '', 0, 0, 0, 97, '', 1),
(368, 5, 270, 'option', 'Jersey', '', 0, 0, 0, 98, '', 1),
(369, 5, 270, 'option', 'Jižní Afrika', '', 0, 0, 0, 99, '', 1),
(370, 5, 270, 'option', 'Jižní Súdán', '', 0, 0, 0, 100, '', 1),
(371, 5, 270, 'option', 'Jordan', '', 0, 0, 0, 101, '', 1),
(372, 5, 270, 'option', 'Kanada', '', 0, 0, 0, 102, '', 1),
(373, 5, 270, 'option', 'Katar', '', 0, 0, 0, 103, '', 1),
(374, 5, 270, 'option', 'Kazakhstan', '', 0, 0, 0, 104, '', 1),
(375, 5, 270, 'option', 'Kenya', '', 0, 0, 0, 105, '', 1),
(376, 5, 270, 'option', 'Kiribati', '', 0, 0, 0, 106, '', 1),
(377, 5, 270, 'option', 'Kokosové ostrovy', '', 0, 0, 0, 107, '', 1),
(378, 5, 270, 'option', 'Kolumbie', '', 0, 0, 0, 108, '', 1),
(379, 5, 270, 'option', 'Kongo (Brazzaville)', '', 0, 0, 0, 109, '', 1),
(380, 5, 270, 'option', 'Kongo (Kinšasa)', '', 0, 0, 0, 110, '', 1),
(381, 5, 270, 'option', 'Kuba', '', 0, 0, 0, 111, '', 1),
(382, 5, 270, 'option', 'Kuwait', '', 0, 0, 0, 112, '', 1),
(383, 5, 270, 'option', 'Kypr', '', 0, 0, 0, 113, '', 1),
(384, 5, 270, 'option', 'Kyrgyzstan', '', 0, 0, 0, 114, '', 1),
(385, 5, 270, 'option', 'Laos', '', 0, 0, 0, 115, '', 1),
(386, 5, 270, 'option', 'Latvia', '', 0, 0, 0, 116, '', 1),
(387, 5, 270, 'option', 'Lebanon', '', 0, 0, 0, 117, '', 1),
(388, 5, 270, 'option', 'Lesotho', '', 0, 0, 0, 118, '', 1),
(389, 5, 270, 'option', 'Liberia', '', 0, 0, 0, 119, '', 1),
(390, 5, 270, 'option', 'Libya', '', 0, 0, 0, 120, '', 1),
(391, 5, 270, 'option', 'Liechtenstein', '', 0, 0, 0, 121, '', 1),
(392, 5, 270, 'option', 'Lithuania', '', 0, 0, 0, 122, '', 1),
(393, 5, 270, 'option', 'Luxembourg', '', 0, 0, 0, 123, '', 1),
(394, 5, 270, 'option', 'Macao S.A.R., China', '', 0, 0, 0, 124, '', 1),
(395, 5, 270, 'option', 'Macedonia', '', 0, 0, 0, 125, '', 1),
(396, 5, 270, 'option', 'Madagascar', '', 0, 0, 0, 126, '', 1),
(397, 5, 270, 'option', 'Malawi', '', 0, 0, 0, 127, '', 1),
(398, 5, 270, 'option', 'Malaysia', '', 0, 0, 0, 128, '', 1),
(399, 5, 270, 'option', 'Maldives', '', 0, 0, 0, 129, '', 1),
(400, 5, 270, 'option', 'Mali', '', 0, 0, 0, 130, '', 1),
(401, 5, 270, 'option', 'Malta', '', 0, 0, 0, 131, '', 1),
(402, 5, 270, 'option', 'Marshall Islands', '', 0, 0, 0, 132, '', 1),
(403, 5, 270, 'option', 'Martinique', '', 0, 0, 0, 133, '', 1),
(404, 5, 270, 'option', 'Mauritania', '', 0, 0, 0, 134, '', 1),
(405, 5, 270, 'option', 'Mauritius', '', 0, 0, 0, 135, '', 1),
(406, 5, 270, 'option', 'Mayotte', '', 0, 0, 0, 136, '', 1),
(407, 5, 270, 'option', 'Mexico', '', 0, 0, 0, 137, '', 1),
(408, 5, 270, 'option', 'Micronesia', '', 0, 0, 0, 138, '', 1),
(409, 5, 270, 'option', 'Moldova', '', 0, 0, 0, 139, '', 1),
(410, 5, 270, 'option', 'Monaco', '', 0, 0, 0, 140, '', 1),
(411, 5, 270, 'option', 'Mongolia', '', 0, 0, 0, 141, '', 1),
(412, 5, 270, 'option', 'Montenegro', '', 0, 0, 0, 142, '', 1),
(413, 5, 270, 'option', 'Montserrat', '', 0, 0, 0, 143, '', 1),
(414, 5, 270, 'option', 'Morocco', '', 0, 0, 0, 144, '', 1),
(415, 5, 270, 'option', 'Mozambique', '', 0, 0, 0, 145, '', 1),
(416, 5, 270, 'option', 'Myanmar', '', 0, 0, 0, 146, '', 1),
(417, 5, 270, 'option', 'Namibia', '', 0, 0, 0, 147, '', 1),
(418, 5, 270, 'option', 'Nauru', '', 0, 0, 0, 148, '', 1),
(419, 5, 270, 'option', 'Nepal', '', 0, 0, 0, 149, '', 1),
(420, 5, 270, 'option', 'Netherlands', '', 0, 0, 0, 150, '', 1),
(421, 5, 270, 'option', 'New Caledonia', '', 0, 0, 0, 151, '', 1),
(422, 5, 270, 'option', 'New Zealand', '', 0, 0, 0, 152, '', 1),
(423, 5, 270, 'option', 'Nicaragua', '', 0, 0, 0, 153, '', 1),
(424, 5, 270, 'option', 'Niger', '', 0, 0, 0, 154, '', 1),
(425, 5, 270, 'option', 'Nigeria', '', 0, 0, 0, 155, '', 1),
(426, 5, 270, 'option', 'Niue', '', 0, 0, 0, 156, '', 1),
(427, 5, 270, 'option', 'Norfolk Island', '', 0, 0, 0, 157, '', 1),
(428, 5, 270, 'option', 'North Korea', '', 0, 0, 0, 158, '', 1),
(429, 5, 270, 'option', 'Norway', '', 0, 0, 0, 159, '', 1),
(430, 5, 270, 'option', 'Německo', '', 0, 0, 0, 160, '', 1),
(431, 5, 270, 'option', 'Oman', '', 0, 0, 0, 161, '', 1),
(432, 5, 270, 'option', 'Palestinské Teritorium', '', 0, 0, 0, 162, '', 1),
(433, 5, 270, 'option', 'Panama', '', 0, 0, 0, 163, '', 1),
(434, 5, 270, 'option', 'Papua Nová Guinea', '', 0, 0, 0, 164, '', 1),
(435, 5, 270, 'option', 'Paraguay', '', 0, 0, 0, 165, '', 1),
(436, 5, 270, 'option', 'Peru', '', 0, 0, 0, 166, '', 1),
(437, 5, 270, 'option', 'Pitcairn', '', 0, 0, 0, 167, '', 1),
(438, 5, 270, 'option', 'Pobřeží slonoviny', '', 0, 0, 0, 168, '', 1),
(439, 5, 270, 'option', 'Polsko', '', 0, 0, 0, 169, '', 1),
(440, 5, 270, 'option', 'Portugalsko', '', 0, 0, 0, 170, '', 1),
(441, 5, 270, 'option', 'Pákistán', '', 0, 0, 0, 171, '', 1),
(442, 5, 270, 'option', 'Rakousko', '', 0, 0, 0, 172, '', 1),
(443, 5, 270, 'option', 'Republic of Ireland', '', 0, 0, 0, 173, '', 1),
(444, 5, 270, 'option', 'Reunion', '', 0, 0, 0, 174, '', 1),
(445, 5, 270, 'option', 'Rumunsko', '', 0, 0, 0, 175, '', 1),
(446, 5, 270, 'option', 'Rusko', '', 0, 0, 0, 176, '', 1),
(447, 5, 270, 'option', 'Rwanda', '', 0, 0, 0, 177, '', 1),
(448, 5, 270, 'option', 'S&atilde;o Tom&eacute; and Pr&iacute;ncipe', '', 0, 0, 0, 178, '', 1),
(449, 5, 270, 'option', 'Saint Barth&eacute;lemy', '', 0, 0, 0, 179, '', 1),
(450, 5, 270, 'option', 'Saint Kitts and Nevis', '', 0, 0, 0, 180, '', 1),
(451, 5, 270, 'option', 'Saint Lucia', '', 0, 0, 0, 181, '', 1),
(452, 5, 270, 'option', 'Saint Martin (Dutch part)', '', 0, 0, 0, 182, '', 1),
(453, 5, 270, 'option', 'Saint Martin (French part)', '', 0, 0, 0, 183, '', 1),
(454, 5, 270, 'option', 'Saint Pierre a Miquelon', '', 0, 0, 0, 184, '', 1),
(455, 5, 270, 'option', 'Salvador', '', 0, 0, 0, 185, '', 1),
(456, 5, 270, 'option', 'San Marino', '', 0, 0, 0, 186, '', 1),
(457, 5, 270, 'option', 'Saudská Arábie', '', 0, 0, 0, 187, '', 1),
(458, 5, 270, 'option', 'Senegal', '', 0, 0, 0, 188, '', 1),
(459, 5, 270, 'option', 'Seyšely', '', 0, 0, 0, 189, '', 1),
(460, 5, 270, 'option', 'Sierra Leone', '', 0, 0, 0, 190, '', 1),
(461, 5, 270, 'option', 'Singapur', '', 0, 0, 0, 191, '', 1),
(462, 5, 270, 'option', 'Slovenská republika', '', 0, 0, 0, 192, '', 1),
(463, 5, 270, 'option', 'Slovinsko', '', 0, 0, 0, 193, '', 1),
(464, 5, 270, 'option', 'Somálsko', '', 0, 0, 0, 194, '', 1),
(465, 5, 270, 'option', 'South Georgia/Sandwich Islands', '', 0, 0, 0, 195, '', 1),
(466, 5, 270, 'option', 'South Korea', '', 0, 0, 0, 196, '', 1),
(467, 5, 270, 'option', 'Spojené Arabské Emiráty', '', 0, 0, 0, 197, '', 1),
(468, 5, 270, 'option', 'Spojené státy', '', 0, 0, 0, 198, '', 1),
(469, 5, 270, 'option', 'Srbsko', '', 0, 0, 0, 199, '', 1),
(470, 5, 270, 'option', 'Sri Lanka', '', 0, 0, 0, 200, '', 1),
(471, 5, 270, 'option', 'Střední Africká republika', '', 0, 0, 0, 201, '', 1),
(472, 5, 270, 'option', 'Surinam', '', 0, 0, 0, 202, '', 1),
(473, 5, 270, 'option', 'Svalbard a Jan Mayen', '', 0, 0, 0, 203, '', 1),
(474, 5, 270, 'option', 'Svatá Helena', '', 0, 0, 0, 204, '', 1),
(475, 5, 270, 'option', 'Svatý Vincent a Grenadiny', '', 0, 0, 0, 205, '', 1),
(476, 5, 270, 'option', 'Svazijsko', '', 0, 0, 0, 206, '', 1),
(477, 5, 270, 'option', 'Súdán', '', 0, 0, 0, 207, '', 1),
(478, 5, 270, 'option', 'Sýrie', '', 0, 0, 0, 208, '', 1),
(479, 5, 270, 'option', 'Taiwan', '', 0, 0, 0, 209, '', 1),
(480, 5, 270, 'option', 'Tajikistan', '', 0, 0, 0, 210, '', 1),
(481, 5, 270, 'option', 'Tanzanie', '', 0, 0, 0, 211, '', 1),
(482, 5, 270, 'option', 'Thajsko', '', 0, 0, 0, 212, '', 1),
(483, 5, 270, 'option', 'Timor-Leste', '', 0, 0, 0, 213, '', 1),
(484, 5, 270, 'option', 'Togo', '', 0, 0, 0, 214, '', 1),
(485, 5, 270, 'option', 'Tokelau', '', 0, 0, 0, 215, '', 1),
(486, 5, 270, 'option', 'Tonga', '', 0, 0, 0, 216, '', 1),
(487, 5, 270, 'option', 'Trinidad and Tobago', '', 0, 0, 0, 217, '', 1),
(488, 5, 270, 'option', 'Tunisko', '', 0, 0, 0, 218, '', 1),
(489, 5, 270, 'option', 'Turecko', '', 0, 0, 0, 219, '', 1),
(490, 5, 270, 'option', 'Turkmenistan', '', 0, 0, 0, 220, '', 1),
(491, 5, 270, 'option', 'Turks a Caicos', '', 0, 0, 0, 221, '', 1),
(492, 5, 270, 'option', 'Tuvalu', '', 0, 0, 0, 222, '', 1),
(493, 5, 270, 'option', 'Uganda', '', 0, 0, 0, 223, '', 1),
(494, 5, 270, 'option', 'Ukraina', '', 0, 0, 0, 224, '', 1),
(495, 5, 270, 'option', 'United Kingdom', '', 0, 1, 0, 225, '', 1),
(496, 5, 270, 'option', 'Uruguay', '', 0, 0, 0, 226, '', 1),
(497, 5, 270, 'option', 'Uzbekistan', '', 0, 0, 0, 227, '', 1),
(498, 5, 270, 'option', 'Vanuatu', '', 0, 0, 0, 228, '', 1),
(499, 5, 270, 'option', 'Vatikán', '', 0, 0, 0, 229, '', 1),
(500, 5, 270, 'option', 'Venezuela', '', 0, 0, 0, 230, '', 1),
(501, 5, 270, 'option', 'Vietnam', '', 0, 0, 0, 231, '', 1),
(502, 5, 270, 'option', 'Vánoční ostrovy', '', 0, 0, 0, 232, '', 1),
(503, 5, 270, 'option', 'Wallis a Futuna', '', 0, 0, 0, 233, '', 1),
(504, 5, 270, 'option', 'Western Samoa', '', 0, 0, 0, 234, '', 1),
(505, 5, 270, 'option', 'Zambie', '', 0, 0, 0, 235, '', 1),
(506, 5, 270, 'option', 'Zimbabwe', '', 0, 0, 0, 236, '', 1),
(507, 5, 270, 'option', 'Západní Sahara', '', 0, 0, 0, 237, '', 1),
(508, 5, 270, 'option', 'Čad', '', 0, 0, 0, 238, '', 1),
(509, 5, 270, 'option', 'Česká republika', '', 0, 0, 0, 239, '', 1),
(510, 5, 270, 'option', 'Čína', '', 0, 0, 0, 240, '', 1),
(511, 5, 270, 'option', 'Šalamounovy ostrovy', '', 0, 0, 0, 241, '', 1),
(512, 5, 270, 'option', 'Španělsko', '', 0, 0, 0, 242, '', 1),
(513, 5, 270, 'option', 'Švédsko', '', 0, 0, 0, 243, '', 1),
(514, 5, 270, 'option', 'Švýcarsko', '', 0, 0, 0, 244, '', 1),
(515, 5, 0, 'textbox', 'State', '', 1, 0, 9, 0, '', 1),
(516, 1, 0, 'multiselectbox', 'Jakou máš náladu dnes ?', '', 0, 0, 2, 0, 'custom', 1),
(517, 1, 516, 'option', 'Dobře', '', 0, 1, 0, 1, '', 1),
(518, 1, 516, 'option', 'Špatně', '', 0, 0, 0, 2, '', 1),
(519, 1, 516, 'option', 'Může být lépe', '', 0, 0, 0, 3, '', 1),
(520, 1, 516, 'option', 'Může být hůř', '', 0, 0, 0, 4, '', 1),
(521, 1, 0, 'datebox', 'Test po dlouhou cestu', '', 1, 0, 3, 0, '', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_xprofile_groups`
--

CREATE TABLE `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Vypisuji data pro tabulku `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Tvoje základní údaje', '', 0, 0),
(2, 'Kontaktní údaje', '', 0, 1),
(3, 'Fakturační a platební údaje', '', 0, 1),
(4, 'Billing Address', '', 0, 1),
(5, 'Shipping Address', '', 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_bp_xprofile_meta`
--

CREATE TABLE `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Vypisuji data pro tabulku `wp_bp_xprofile_meta`
--

INSERT INTO `wp_bp_xprofile_meta` (`id`, `object_id`, `object_type`, `meta_key`, `meta_value`) VALUES
(1, 2, 'field', 'default_visibility', 'public'),
(2, 2, 'field', 'allow_custom_visibility', 'disabled'),
(3, 3, 'field', 'default_visibility', 'loggedin'),
(4, 3, 'field', 'allow_custom_visibility', 'disabled'),
(5, 4, 'field', 'default_visibility', 'loggedin'),
(6, 4, 'field', 'allow_custom_visibility', 'allowed'),
(7, 5, 'field', 'default_visibility', 'loggedin'),
(8, 5, 'field', 'allow_custom_visibility', 'allowed'),
(9, 6, 'field', 'default_visibility', 'loggedin'),
(10, 6, 'field', 'allow_custom_visibility', 'disabled'),
(11, 516, 'field', 'default_visibility', 'public'),
(12, 516, 'field', 'allow_custom_visibility', 'allowed'),
(13, 521, 'field', 'default_visibility', 'public'),
(14, 521, 'field', 'allow_custom_visibility', 'disabled');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Vypisuji data pro tabulku `wp_commentmeta`
--

INSERT INTO `wp_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(61, 54, 'rating', '4');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Vypisuji data pro tabulku `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(54, 195, 'David Šuška', 'me@webni.cz', '', '::1', '2013-11-01 07:51:27', '2013-11-01 07:51:27', 'Hustej prodakt.', 0, '1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:24.0) Gecko/20100101 Firefox/24.0', '', 0, 1),
(55, 207, 'David Šuška', 'me@webni.cz', '', '127.0.0.1', '2014-01-20 12:24:21', '2014-01-20 12:24:21', 'První recenze. Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic', 0, '1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0', '', 0, 1),
(56, 207, 'David Šuška', 'me@webni.cz', '', '127.0.0.1', '2014-01-20 12:24:27', '2014-01-20 12:24:27', 'Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nicVítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nicVítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic', 0, '1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0', '', 0, 1),
(57, 207, 'David Šuška', 'me@webni.cz', '', '127.0.0.1', '2014-01-20 12:24:31', '2014-01-20 12:24:31', 'Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic', 0, '1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0', '', 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3070 ;

--
-- Vypisuji data pro tabulku `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8888', 'yes'),
(2, 'blogname', 'BUĎ KUTIL', 'yes'),
(3, 'blogdescription', 'Kutilské obrabění kůže, dřeva a dalších přírodních materiálů', 'yes'),
(4, 'users_can_register', '1', 'yes'),
(5, 'admin_email', 'me@webni.cz', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'j.n.Y', 'yes'),
(23, 'time_format', 'G.i', 'yes'),
(24, 'links_updated_date_format', 'j.n.Y, G:i', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '0', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '/%postname%/', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:8:{i:0;s:24:"buddypress/bp-loader.php";i:1;s:21:"budkutil/budkutil.php";i:2;s:47:"regenerate-thumbnails/regenerate-thumbnails.php";i:3;s:37:"tinymce-advanced/tinymce-advanced.php";i:4;s:41:"wc4bp-basic-integration/bpshop-loader.php";i:5;s:27:"woocommerce/woocommerce.php";i:6;s:33:"wp-breadcrumbs/wp_breadcrumbs.php";i:7;s:32:"xml-sitemap-feed/xml-sitemap.php";}', 'yes'),
(36, 'home', 'http://localhost:8888', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '0', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', '', 'no'),
(44, 'template', 'twentytwelve', 'yes'),
(45, 'stylesheet', 'twentytwelve', 'yes'),
(46, 'comment_whitelist', '1', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '0', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '26691', 'yes'),
(53, 'uploads_use_yearmonth_folders', '0', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'page', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '0', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '1', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '0', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:0:{}', 'yes'),
(84, 'widget_rss', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(85, 'uninstall_plugins', 'a:1:{s:41:"wc4bp-basic-integration/bpshop-loader.php";s:24:"BPSHOP_Loader::uninstall";}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '192', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '22441', 'yes'),
(92, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:115:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:92:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:6:{s:19:"wp_inactive_widgets";a:2:{i:0;s:28:"bp_core_whos_online_widget-2";i:1;s:32:"bp_core_recently_active_widget-2";}s:9:"sidebar-1";a:1:{i:0;s:10:"nav_menu-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:4:"shop";a:1:{i:0;s:20:"product_categories-2";}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:7:{i:1390563488;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1390563493;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1390564352;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1390592640;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1390594816;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1390608000;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(2753, 'woocommerce_default_shipping_method', '', 'yes'),
(2754, 'woocommerce_shipping_method_order', 'a:5:{s:9:"flat_rate";i:0;s:13:"free_shipping";i:1;s:22:"international_delivery";i:2;s:14:"local_delivery";i:3;s:12:"local_pickup";i:4;}', 'yes'),
(924, 'bp-active-components', 'a:8:{s:8:"xprofile";s:1:"1";s:8:"settings";s:1:"1";s:7:"friends";s:1:"1";s:8:"messages";s:1:"1";s:8:"activity";s:1:"1";s:6:"groups";s:1:"1";s:7:"members";s:1:"1";s:13:"notifications";i:1;}', 'yes'),
(925, 'bp-pages', 'a:5:{s:8:"activity";i:136;s:7:"members";i:137;s:8:"register";i:138;s:8:"activate";i:140;s:6:"groups";i:149;}', 'yes'),
(108, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:21:"http://localhost:8888";s:4:"link";s:97:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost:8888/";s:3:"url";s:130:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost:8888/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:27:"Web vývojářů WordPressu";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:52:"Další užitečné novinky a informace o WordPressu";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(2736, 'slurp_page_installed', '1', 'yes'),
(2716, '_transient_timeout_feed_mod_f835fcade4ab539e67a73a2a477cbac6', '1389214137', 'no'),
(2717, '_transient_feed_mod_f835fcade4ab539e67a73a2a477cbac6', '1389170937', 'no'),
(2718, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1389214137', 'no'),
(2719, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<ul>\n	<li><strong>jacob</strong> odkazuje na tento web a <a href="http://comptia521.blogspot.com/2014/01/pass4test-provides-to-avaya-64011-test.html">píše</a>: "C. 8888. D. 8990. Answer: C Avaya original questio &hellip;"</li>\n	<li><strong>Fay Cathy</strong> odkazuje na tento web a <a href="http://dumpsres.blogspot.com/2013/12/microsoft-70-503-csharp-dumps.html">píše</a>: "Which code fragment should you use? A. [ServiceCon &hellip;"</li>\n	<li><strong>Fay Cathy</strong> odkazuje na tento web a <a href="http://exinexam.blogspot.com/2013/12/microsoft-070-503-csharp-exam-fragen.html">píše</a>: "You also create a service endpoint at http://local &hellip;"</li>\n	<li><strong>Latest 000-124 study materials</strong> odkazuje na tento web a <a href="http://jn0-360examit.blogspot.com/2013/12/dumpleader-provides-information-on_31.html">píše</a>: "You also create a service endpoint at http://local &hellip;"</li>\n	<li><strong>david</strong> odkazuje na tento web a <a href="http://oracle521.blogspot.com/2013/12/pass4test-emc-e20-885-exam-practice.html">píše</a>: "A. 8888, 8887, 5081. B. 80, 443, 8080. C. 5057, 44 &hellip;"</li>\n	<li><strong>70-489 exam dumps</strong> odkazuje na tento web a <a href="http://jn0730exam1.blogspot.com/2013/12/70-503-csharp-questions-and-answers.html">píše</a>: "B. String baseAddress=&quot;http: //localhost:8000 &hellip;"</li>\n	<li><strong>The Best IBM 000-274 Exam Training materials</strong> odkazuje na tento web a <a href="http://c-tscm62-65exam.blogspot.com/2013/12/070-503-csharp-questions-and-answers.html">píše</a>: "You also create a service endpoint at http://local &hellip;"</li>\n	<li><strong>刘云兮</strong> odkazuje na tento web a <a href="http://networkit123.blogspot.com/2013/12/1z0-880-questions-and-answers.html">píše</a>: "default sys-gw UG 1 0 127.0.0.1 127.0.0.1 UH 2 6 l &hellip;"</li>\n	<li><strong>Quaid Uintrell</strong> odkazuje na tento web a <a href="http://misstests.blogspot.com/2013/12/microsoft-certification-70-503-csharp.html">píše</a>: "B. String baseAddress=&quot;http: //localhost:8000 &hellip;"</li>\n	<li><strong>Chri Christia</strong> odkazuje na tento web a <a href="http://testbets.blogspot.com/2013/12/microsoft-70-503-csharp.html">píše</a>: "Which code fragment should you use? A. [ServiceCon &hellip;"</li>\n</ul>\n', 'no'),
(3013, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1390421251', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(3014, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:51:"\n	\n	\n	\n	\n	\n	\n		\n		\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:25:"http://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Dec 2013 08:24:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/?v=3.9-alpha";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"WordPress 3.8 “Parker”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"http://wordpress.org/news/2013/12/parker/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2013/12/parker/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Dec 2013 17:00:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2765";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:354:"Version 3.8 of WordPress, named “Parker” in honor of Charlie Parker, bebop innovator, is available for download or update in your WordPress dashboard. We hope you&#8217;ll think this is the most beautiful update yet. Introducing a modern new design WordPress has gotten a facelift. 3.8 brings a fresh new look to the entire admin dashboard. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:18197:"<p>Version 3.8 of WordPress, named “Parker” in honor of <a href="http://en.wikipedia.org/wiki/Charlie_Parker">Charlie Parker</a>, bebop innovator, is available <a href="http://wordpress.org/download/">for download</a> or update in your WordPress dashboard. We hope you&#8217;ll think this is the most beautiful update yet.</p>\n<div id="v-6wORgoGb-1" class="video-player"><embed id="v-6wORgoGb-1-video" src="http://s0.videopress.com/player.swf?v=1.03&amp;guid=6wORgoGb&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="692" height="388" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>\n<h2 class="aligncenter">Introducing a modern new design</h2>\n<p><img class="wp-image-2951 aligncenter" alt="overview" src="http://i0.wp.com/wpdotorg.files.wordpress.com/2013/12/overview.jpg?resize=623%2C193" data-recalc-dims="1" /></p>\n<p>WordPress has gotten a facelift. 3.8 brings a fresh new look to the entire admin dashboard. Gone are overbearing gradients and dozens of shades of grey — bring on a bigger, bolder, more colorful design!</p>\n<p><img class="aligncenter  wp-image-2856" style="margin-left: 0;margin-right: 0" alt="about-modern-wordpress" src="http://i2.wp.com/wpdotorg.files.wordpress.com/2013/12/design.png?resize=623%2C151" data-recalc-dims="1" /></p>\n<h3>Modern aesthetic</h3>\n<p>The new WordPress dashboard has a fresh, uncluttered design that embraces clarity and simplicity.</p>\n<h3>Clean typography</h3>\n<p>The Open Sans typeface provides simple, friendly text that is optimized for both desktop and mobile viewing. It’s even open source, just like WordPress.</p>\n<h3>Refined contrast</h3>\n<p>We think beautiful design should never sacrifice legibility. With superior contrast and large, comfortable type, the new design is easy to read and a pleasure to navigate.</p>\n<hr />\n<h2 class="aligncenter">WordPress on every device</h2>\n<p><img class="alignright  wp-image-2984" alt="responsive" src="http://i2.wp.com/wpdotorg.files.wordpress.com/2013/12/responsive.jpg?resize=255%2C255" data-recalc-dims="1" />We all access the internet in different ways. Smartphone, tablet, notebook, desktop — no matter what you use, WordPress will adapt and you’ll feel right at home.</p>\n<h3>High definition at high speed</h3>\n<p>WordPress is sharper than ever with new vector-based icons that scale to your screen. By ditching pixels, pages load significantly faster, too.</p>\n<hr />\n<h2 class="aligncenter">Admin color schemes to match your personality</h2>\n<p><img class="aligncenter  wp-image-2954" alt="colors" src="http://i0.wp.com/wpdotorg.files.wordpress.com/2013/12/colors.jpg?resize=623%2C339" data-recalc-dims="1" /></p>\n<p>WordPress just got a colorful new update. We’ve included eight new admin color schemes so you can pick the one that suits you best.</p>\n<p>Color schemes can be previewed and changed from your Profile page.</p>\n<hr />\n<h2 class="aligncenter">Refined theme management</h2>\n<p><img class="alignright  wp-image-2967" alt="themes" src="http://i0.wp.com/wpdotorg.files.wordpress.com/2013/12/themes.jpg?resize=360%2C344" data-recalc-dims="1" />The new themes screen lets you survey your themes at a glance. Or want more information? Click to discover more. Then sit back and use your keyboard’s navigation arrows to flip through every theme you’ve got.</p>\n<h3>Smoother widget experience</h3>\n<p>Drag-drag-drag. Scroll-scroll-scroll. Widget management can be complicated. With the new design, we’ve worked to streamline the widgets screen.</p>\n<p>Have a large monitor? Multiple widget areas stack side-by-side to use the available space. Using a tablet? Just tap a widget to add it.</p>\n<hr />\n<h2 class="aligncenter">Twenty Fourteen, a sleek new magazine theme</h2>\n<p><img class="aligncenter size-large wp-image-2789" alt="The new Twenty Fourteen theme displayed on a laptop. tablet and phone" src="http://i0.wp.com/wpdotorg.files.wordpress.com/2013/12/twentyfourteen.jpg?resize=692%2C275" data-recalc-dims="1" /></p>\n<h3>Turn your blog into a magazine</h3>\n<p>Create a beautiful magazine-style site with WordPress and Twenty Fourteen. Choose a grid or a slider to display featured content on your homepage. Customize your site with three widget areas or change your layout with two page templates.</p>\n<p>With a striking design that does not compromise our trademark simplicity, Twenty Fourteen is our most intrepid default theme yet.</p>\n<hr />\n<h2>Beginning of a new era</h2>\n<p>This release was led by Matt Mullenweg. This is our second release using the new plugin-first development process, with a much shorter timeframe than in the past. We think it’s been going great. You can check out the features currently in production on the <a title="Make WordPress Core" href="http://make.wordpress.org/core/" target="_blank">make/core blog</a>.</p>\n<p>There are 188 contributors with props in this release:</p>\n<p><a href="http://profiles.wordpress.org/aaronholbrook">Aaron Holbrook</a>, <a href="http://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="http://profiles.wordpress.org/adamsilverstein">adamsilverstein</a>, <a href="http://profiles.wordpress.org/admiralthrawn">admiralthrawn</a>, <a href="http://profiles.wordpress.org/ahoereth">Alexander Hoereth</a>, <a href="http://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="http://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="http://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="http://profiles.wordpress.org/aralbald">Andrey Kabakchiev</a>, <a href="http://profiles.wordpress.org/apeatling">Andy Peatling</a>, <a href="http://profiles.wordpress.org/ankitgadertcampcom">Ankit Gade</a>, <a href="http://profiles.wordpress.org/atimmer">Anton Timmermans</a>, <a href="http://profiles.wordpress.org/fliespl">Arkadiusz Rzadkowolski</a>, <a href="http://profiles.wordpress.org/aubreypwd">Aubrey Portwood</a>, <a href="http://profiles.wordpress.org/bassgang">bassgang</a>, <a href="http://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="http://profiles.wordpress.org/bananastalktome">Billy (bananastalktome)</a>, <a href="http://profiles.wordpress.org/binarymoon">binarymoon</a>, <a href="http://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="http://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="http://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="http://profiles.wordpress.org/bpetty">Bryan Petty</a>, <a href="http://profiles.wordpress.org/calin">Calin Don</a>, <a href="http://profiles.wordpress.org/carldanley">Carl Danley</a>, <a href="http://profiles.wordpress.org/sixhours">Caroline Moore</a>, <a href="http://profiles.wordpress.org/caspie">Caspie</a>, <a href="http://profiles.wordpress.org/chrisbliss18">Chris Jean</a>, <a href="http://profiles.wordpress.org/iblamefish">Clinton Montague</a>, <a href="http://profiles.wordpress.org/corphi">Corphi</a>, <a href="http://profiles.wordpress.org/dbernar1">Dan Bernardic</a>, <a href="http://profiles.wordpress.org/danieldudzic">Daniel Dudzic</a>, <a href="http://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="http://profiles.wordpress.org/datafeedrcom">datafeedr</a>, <a href="http://profiles.wordpress.org/lessbloat">Dave Martin</a>, <a href="http://profiles.wordpress.org/drw158">Dave Whitley</a>, <a href="http://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="http://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="http://profiles.wordpress.org/dougwollison">Doug Wollison</a>, <a href="http://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="http://profiles.wordpress.org/dziudek">dziudek</a>, <a href="http://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="http://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="http://profiles.wordpress.org/ethitter">Erick Hitter</a>, <a href="http://profiles.wordpress.org/evansolomon">Evan Solomon</a>, <a href="http://profiles.wordpress.org/faison">Faison</a>, <a href="http://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="http://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="http://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="http://profiles.wordpress.org/soulseekah">Gennady Kovshenin</a>, <a href="http://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="http://profiles.wordpress.org/gnarf37">gnarf37</a>, <a href="http://profiles.wordpress.org/tivnet">Gregory Karpinsky</a>, <a href="http://profiles.wordpress.org/hanni">hanni</a>, <a href="http://profiles.wordpress.org/helen">Helen Hou-Sandi</a>, <a href="http://profiles.wordpress.org/iandunn">Ian Dunn</a>, <a href="http://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="http://profiles.wordpress.org/isaackeyet">Isaac Keyet</a>, <a href="http://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="http://profiles.wordpress.org/jacklenox">Jack Lenox</a>, <a href="http://profiles.wordpress.org/janhenckens">janhenckens</a>, <a href="http://profiles.wordpress.org/jblz">Jeff Bowen</a>, <a href="http://profiles.wordpress.org/jeffr0">Jeff Chandler</a>, <a href="http://profiles.wordpress.org/jenmylo">Jen Mylo</a>, <a href="http://profiles.wordpress.org/buffler">Jeremy Buller</a>, <a href="http://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="http://profiles.wordpress.org/jeherve">Jeremy Herve</a>, <a href="http://profiles.wordpress.org/jpry">Jeremy Pry</a>, <a href="http://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="http://profiles.wordpress.org/jhned">jhned</a>, <a href="http://profiles.wordpress.org/jim912">jim912</a>, <a href="http://profiles.wordpress.org/jartes">Joan Artes</a>, <a href="http://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="http://profiles.wordpress.org/joen">Joen Asmussen</a>, <a href="http://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="http://profiles.wordpress.org/johnafish">John Fish</a>, <a href="http://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="http://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="http://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="http://profiles.wordpress.org/joshuaabenazer">Joshua Abenazer</a>, <a href="http://profiles.wordpress.org/nukaga">Junko Nukaga</a>, <a href="http://profiles.wordpress.org/devesine">Justin de Vesine</a>, <a href="http://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="http://profiles.wordpress.org/kadamwhite">K. Adam White</a>, <a href="http://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="http://profiles.wordpress.org/codebykat">Kat Hagan</a>, <a href="http://profiles.wordpress.org/littlethingsstudio">Kate Whitley</a>, <a href="http://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="http://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="http://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="http://profiles.wordpress.org/koki4a">Konstantin Dankov</a>, <a href="http://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="http://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="http://profiles.wordpress.org/drozdz">Krzysiek Drozdz</a>, <a href="http://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="http://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="http://profiles.wordpress.org/lite3">lite3</a>, <a href="http://profiles.wordpress.org/lucp">Luc Princen</a>, <a href="http://profiles.wordpress.org/latz">Lutz Schroer</a>, <a href="http://profiles.wordpress.org/mako09">Mako</a>, <a href="http://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="http://profiles.wordpress.org/markmcwilliams">Mark McWilliams</a>, <a href="http://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="http://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="http://profiles.wordpress.org/iammattthomas">Matt Thomas</a>, <a href="http://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="http://profiles.wordpress.org/mdbitz">Matthew Denton</a>, <a href="http://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="http://profiles.wordpress.org/matveb">Matías Ventura</a>, <a href="http://profiles.wordpress.org/megane9988">megane9988</a>, <a href="http://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="http://profiles.wordpress.org/micahwave">micahwave</a>, <a href="http://profiles.wordpress.org/cainm">Michael Cain</a>, <a href="http://profiles.wordpress.org/mitchoyoshitaka">Michael Erlewine</a>, <a href="http://profiles.wordpress.org/michelwppi">Michel - xiligroup dev</a>, <a href="http://profiles.wordpress.org/chellycat">Michelle Langston</a>, <a href="http://profiles.wordpress.org/gradyetc">Mike Burns</a>, <a href="http://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="http://profiles.wordpress.org/mikelittle">Mike Little</a>, <a href="http://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="http://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="http://profiles.wordpress.org/batmoo">Mohammad Jangda</a>, <a href="http://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="http://profiles.wordpress.org/mt8biz">moto hachi</a>, <a href="http://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="http://profiles.wordpress.org/neil_pie">Neil Pie</a>, <a href="http://profiles.wordpress.org/nickdaugherty">Nick Daugherty</a>, <a href="http://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="http://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="http://profiles.wordpress.org/ninio">ninio</a>, <a href="http://profiles.wordpress.org/ninnypants">ninnypants</a>, <a href="http://profiles.wordpress.org/nofearinc">nofearinc</a>, <a href="http://profiles.wordpress.org/nvwd">Nowell VanHoesen</a>, <a href="http://profiles.wordpress.org/odysseygate">odyssey</a>, <a href="http://profiles.wordpress.org/originalexe">OriginalEXE</a>, <a href="http://profiles.wordpress.org/swissspidy">Pascal Birchler</a>, <a href="http://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="http://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="http://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="http://profiles.wordpress.org/senlin">Piet</a>, <a href="http://profiles.wordpress.org/ptahdunbar">Ptah Dunbar</a>, <a href="http://profiles.wordpress.org/raamdev">Raam Dev</a>, <a href="http://profiles.wordpress.org/bamadesigner">Rachel Carden</a>, <a href="http://profiles.wordpress.org/rachelbaker">rachelbaker</a>, <a href="http://profiles.wordpress.org/radices">Radices</a>, <a href="http://profiles.wordpress.org/mauryaratan">Ram Ratan Maurya</a>, <a href="http://profiles.wordpress.org/defries">Remkus de Vries</a>, <a href="http://profiles.wordpress.org/ounziw">Rescuework Support</a>, <a href="http://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="http://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="http://profiles.wordpress.org/wet">Robert Wetzlmayr, PHP-Programmierer</a>, <a href="http://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="http://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="http://profiles.wordpress.org/otto42">Samuel Wood</a>, <a href="http://profiles.wordpress.org/sanchothefat">sanchothefat</a>, <a href="http://profiles.wordpress.org/sboisvert">sboisvert</a>, <a href="http://profiles.wordpress.org/scottbasgaard">Scott Basgaard</a>, <a href="http://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="http://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="http://profiles.wordpress.org/scribu">scribu</a>, <a href="http://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="http://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="http://profiles.wordpress.org/shaunandrews">Shaun Andrews</a>, <a href="http://profiles.wordpress.org/designsimply">Sheri Bigelow (designsimply)</a>, <a href="http://profiles.wordpress.org/shinichin">ShinichiN</a>, <a href="http://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="http://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="http://profiles.wordpress.org/siobhyb">Siobhan Bamber (siobhyb)</a>, <a href="http://profiles.wordpress.org/sirbrillig">sirbrillig</a>, <a href="http://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="http://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="http://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="http://profiles.wordpress.org/stevenkword">Steven Word</a>, <a href="http://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="http://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="http://profiles.wordpress.org/tmtoy">Takuma Morikawa</a>, <a href="http://profiles.wordpress.org/thomasguillot">Thomas Guillot</a>, <a href="http://profiles.wordpress.org/tierra">tierra</a>, <a href="http://profiles.wordpress.org/tillkruess">Till Krüss</a>, <a href="http://profiles.wordpress.org/tlamedia">TLA Media</a>, <a href="http://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="http://profiles.wordpress.org/tommcfarlin">tommcfarlin</a>, <a href="http://profiles.wordpress.org/zodiac1978">Torsten Landsiedel</a>, <a href="http://profiles.wordpress.org/taupecat">Tracy Rotton</a>, <a href="http://profiles.wordpress.org/trishasalas">trishasalas</a>, <a href="http://profiles.wordpress.org/mbmufffin">Tyler Smith</a>, <a href="http://profiles.wordpress.org/grapplerulrich">Ulrich</a>, <a href="http://profiles.wordpress.org/l10n">Vladimir</a>, <a href="http://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="http://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="http://profiles.wordpress.org/yonasy">yonasy</a>, and <a href="http://profiles.wordpress.org/tollmanz">Zack Tollman</a>. Also thanks to <a href="http://benmorrison.org/">Ben Morrison</a> and <a href="http://christineswebb.com/">Christine Webb</a> for help with the video.</p>\n<p>Thanks for choosing WordPress. See you soon for version 3.9!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:46:"http://wordpress.org/news/2013/12/parker/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"3.8 RC2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"http://wordpress.org/news/2013/12/3-8-rc2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:51:"http://wordpress.org/news/2013/12/3-8-rc2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Dec 2013 01:08:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2805";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:343:"Release candidate 2 of WordPress 3.8 is now available for download. This is the last pre-release, and we expect it to be effectively identical to what&#8217;s officially released to the public on Thursday. This means if you are a plugin or theme developer, start your engines! (If they&#8217;re not going already.) Lots of admin code [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1180:"<p>Release candidate 2 of WordPress 3.8 is <a href="http://wordpress.org/wordpress-3.8-RC2.zip">now available for download</a>. This is the last pre-release, and we expect it to be effectively identical to what&#8217;s officially released to the public on Thursday.</p>\n<p>This means if you are a plugin or theme developer, start your engines! (If they&#8217;re not going already.) Lots of admin code has changed so it&#8217;s especially important to see if your plugin works well within the new admin design and layout, and update <a href="http://wordpress.org/plugins/about/readme.txt">the &#8220;Tested up to:&#8221; part of your plugin readme.txt</a>.</p>\n<p>If there is something in your plugin that you&#8217;re unable to fix, or if you think you&#8217;ve found a bug, join us <a href="http://codex.wordpress.org/IRC">in #wordpress-dev in IRC</a>, especially if you&#8217;re able to join during the dev chat on Wednesday, or post in the <a href="http://wordpress.org/support/forum/alphabeta">alpha/beta forum</a>. The developers and designers who worked on this release are happy to help anyone update their code before the 3.8 release.</p>\n<p>Happy hacking, everybody!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:47:"http://wordpress.org/news/2013/12/3-8-rc2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:17:"WordPress 3.8 RC1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/news/2013/12/3-8-almost/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/news/2013/12/3-8-almost/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Dec 2013 09:54:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2760";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"We&#8217;re entering the quiet but busy part of a release, whittling down issues to bring you all of the new features you&#8217;re excited about with the stability you expect from WordPress. There are just a few days from the &#8220;code freeze&#8221; for our 3.8 release, which includes a number of exciting enhancements, so the focus [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1873:"<p>We&#8217;re entering the quiet but busy part of a release, whittling down issues to bring you all of the new features you&#8217;re excited about with the stability you expect from WordPress. There are just a few days from the &#8220;code freeze&#8221; for our 3.8 release, <a href="http://wordpress.org/news/2013/11/wordpress-3-8-beta-1/">which includes a number of exciting enhancements</a>, so the focus is on identifying any major issues and resolving them as soon as possible.</p>\n<p>If you&#8217;ve ever wondered about how to contribute to WordPress, here&#8217;s a time you can: download this release candidate and use it in as many ways as you can imagine. Try to break it, and if you do, let us know how you did it so we can make sure it never happens again. If you work for a web host, this is the release you should test as much as possible and start getting your automatic upgrade systems and 1-click installers ready.</p>\n<p><a href="http://wordpress.org/wordpress-3.8-RC1.zip">Download WordPress 3.8 RC1</a> (zip) or use the <a href="http://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;).</p>\n<p>If you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a reproducible bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.8">everything we’ve fixed</a> so far.</p>\n<p><em>We&#8217;re so close to the</em><br />\n<em>finish line, jump in and help</em><br />\n<em>good karma is yours.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2013/12/3-8-almost/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.8 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/11/wordpress-3-8-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2013/11/wordpress-3-8-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 21 Nov 2013 05:21:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2754";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:307:"The first beta of the 3.8 is now available, and the next dates to watch out for are code freeze on December 5th and a final release on December 12th. 3.8 brings together several of the features as plugins projects and while this isn&#8217;t our first rodeo, expect this to be more beta than usual. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2236:"<p>The first beta of the 3.8 is now available, and the next dates to watch out for are code freeze on December 5th and a final release on December 12th.</p>\n<p>3.8 brings together <a href="http://make.wordpress.org/core/features-as-plugins/">several of the features as plugins projects</a> and while this isn&#8217;t our first rodeo, expect this to be more beta than usual. The headline things to test out in this release are:</p>\n<ul>\n<li>The new admin design, especially the responsive aspect of it. Try it out on different devices and browsers, see how it goes, especially the more complex pages like widgets or seldom-looked-at-places like Press This. Color schemes, which you can change on your profile, have also been spruced up.</li>\n<li>The dashboard homepage has been refreshed, poke and prod it.</li>\n<li>Choosing themes under Appearance is completely different, try to break it however possible.</li>\n<li>There&#8217;s a new default theme, Twenty Fourteen.</li>\n<li>Over 250 issues closed already.</li>\n</ul>\n<p>Given how many things in the admin have changed it&#8217;s extra super duper important to test as many plugins and themes with admin pages against the new stuff. Also if you&#8217;re a developer consider how you can make your admin interface fit the MP6 aesthetic better.</p>\n<p>As always, if you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a reproducible bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.8">everything we’ve fixed</a> so far.</p>\n<p><a href="http://wordpress.org/wordpress-3.8-beta-1.zip">Download WordPress 3.8 Beta 1</a> (zip) or use the <a href="http://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;).</p>\n<p><em>Alphabet soup of</em><br />\n<em>Plugins as features galore</em><br />\n<em>The future is here</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2013/11/wordpress-3-8-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 3.7.1 Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2013/10/wordpress-3-7-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/news/2013/10/wordpress-3-7-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 29 Oct 2013 21:04:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2745";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:371:"WordPress 3.7.1 is now available! This maintenance release addresses 11 bugs in WordPress 3.7, including: Images with captions no longer appear broken in the visual editor. Allow some sites running on old or poorly configured servers to continue to check for updates from WordPress.org. Avoid fatal errors with certain plugins that were incorrectly calling some [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1594:"<p>WordPress 3.7.1 is now available! This maintenance release addresses 11 bugs in WordPress 3.7, including:</p>\n<ul>\n<li>Images with captions no longer appear broken in the visual editor.</li>\n<li>Allow some sites running on old or poorly configured servers to continue to check for updates from WordPress.org.</li>\n<li>Avoid fatal errors with certain plugins that were incorrectly calling some WordPress functions too early.</li>\n<li>Fix hierarchical sorting in get_pages(), exclusions in wp_list_categories(), and in_category() when called with empty values.</li>\n<li>Fix a warning that may occur in certain setups while performing a search, and a few other notices.</li>\n</ul>\n<p>For a full list of changes, consult the <a href="http://core.trac.wordpress.org/query?milestone=3.7.1">list of tickets</a> and <a href="http://core.trac.wordpress.org/log/branches/3.7?stop_rev=25914&amp;rev=25986">the changelog</a>.</p>\n<p>If you are one of the <a href="http://wordpress.org/download/counter/">nearly two million</a> already running WordPress 3.7, we will start rolling out the all-new <a href="http://wordpress.org/news/2013/10/basie/">automatic background updates</a> for WordPress 3.7.1 in the next few hours. For sites <a href="http://wordpress.org/plugins/background-update-tester/">that support them</a>, of course.</p>\n<p><a href="http://wordpress.org/download/">Download WordPress 3.7.1</a> or venture over to <strong>Dashboard → Updates</strong> and simply click &#8220;Update Now.&#8221;</p>\n<p><em>Just a few fixes<br />\nYour new update attitude:<br />\nZero clicks given</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/10/wordpress-3-7-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 3.7 “Basie”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://wordpress.org/news/2013/10/basie/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:49:"http://wordpress.org/news/2013/10/basie/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 24 Oct 2013 22:35:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2736";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:357:"Version 3.7 of WordPress, named &#8220;Basie&#8221; in honor of Count Basie, is available for download or update in your WordPress dashboard. This release features some of the most important architectural updates we&#8217;ve made to date. Here are the big ones: Updates while you sleep: With WordPress 3.7, you don&#8217;t have to lift a finger to [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:17229:"<p>Version 3.7 of WordPress, named &#8220;Basie&#8221; in honor of <a href="http://en.wikipedia.org/wiki/Count_basie">Count Basie</a>, is available <a href="http://wordpress.org/download/">for download</a> or update in your WordPress dashboard. This release features some of the most important architectural updates we&#8217;ve made to date. Here are the big ones:</p>\n<ul>\n<li><strong>Updates while you sleep</strong>: With WordPress 3.7, you don&#8217;t have to lift a finger to apply maintenance and security updates. Most sites are now able to automatically apply these updates in the background. The update process also has been made even more reliable and secure, with dozens of new checks and safeguards.</li>\n<li><strong>Stronger password recommendations</strong>: Your password is your site&#8217;s first line of defense. It&#8217;s best to create passwords that are complex, long, and unique. To that end, our password meter has been updated in WordPress 3.7 to recognize common mistakes that can weaken your password: dates, names, keyboard patterns (123456789), and even pop culture references.</li>\n<li><strong>Better global support</strong>: Localized versions of WordPress will receive faster and more complete translations. WordPress 3.7 adds support for automatically installing the right language files and keeping them up to date, a boon for the many millions who use WordPress in a language other than English.</li>\n</ul>\n<p>For developers there are lots of options around how to control the new updates feature, including allowing it to handle major upgrades as well as minor ones, more sophisticated date query support, and multisite improvements. As always, if you&#8217;re hungry for more <a href="http://codex.wordpress.org/Version_3.7">dive into the Codex</a> or browse the <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=resolution&amp;milestone=3.7">over 400 closed tickets on Trac</a>.</p>\n<h3>A New Wave</h3>\n<p>This release was led by Andrew Nacin, backed up by Dion Hulse and Jon Cave. This is our first release using the new plugin-first development process, with a much shorter timeframe than in the past. (3.6 was released in August.) The 3.8 release, due in December, will continue this plugin-led development cycle that gives much more autonomy to plugin leads and allows us to decouple feature development from a release. You can follow this grand experiment, and what we&#8217;re learning from it, <a href="http://make.wordpress.org/core/">on the make/core blog</a>. There are 211 contributors with props in this release:</p>\n<p><a href="http://profiles.wordpress.org/technosailor">Aaron Brazell</a>, <a href="http://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="http://profiles.wordpress.org/aaronholbrook">Aaron Holbrook</a>, <a href="http://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="http://profiles.wordpress.org/adamsilverstein">adamsilverstein</a>, <a href="http://profiles.wordpress.org/ahoereth">Alexander Hoereth</a>, <a href="http://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="http://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="http://profiles.wordpress.org/andg">andg</a>, <a href="http://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="http://profiles.wordpress.org/norcross">Andrew Norcross</a>, <a href="http://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="http://profiles.wordpress.org/andrewspittle">Andrew Spittle</a>, <a href="http://profiles.wordpress.org/askapache">askapache</a>, <a href="http://profiles.wordpress.org/atimmer">atimmer</a>, <a href="http://profiles.wordpress.org/barry">Barry</a>, <a href="http://profiles.wordpress.org/beaulebens">Beau Lebens</a>, <a href="http://profiles.wordpress.org/benmoody">ben.moody</a>, <a href="http://profiles.wordpress.org/bhengh">Ben Miller</a>, <a href="http://profiles.wordpress.org/neoxx">Bernhard Riedl</a>, <a href="http://profiles.wordpress.org/bftrick">BFTrick</a>, <a href="http://profiles.wordpress.org/bananastalktome">Billy (bananastalktome)</a>, <a href="http://profiles.wordpress.org/bmb">bmb</a>, <a href="http://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="http://profiles.wordpress.org/brianhogg">brianhogg</a>, <a href="http://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="http://profiles.wordpress.org/bpetty">Bryan Petty</a>, <a href="http://profiles.wordpress.org/carldanley">Carl Danley</a>, <a href="http://profiles.wordpress.org/charlesclarkson">CharlesClarkson</a>, <a href="http://profiles.wordpress.org/chipbennett">Chip Bennett</a>, <a href="http://profiles.wordpress.org/chouby">Chouby</a>, <a href="http://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="http://profiles.wordpress.org/chrisrudzki">Chris Rudzki</a>, <a href="http://profiles.wordpress.org/aeg0125">coderaaron</a>, <a href="http://profiles.wordpress.org/coenjacobs">Coen Jacobs</a>, <a href="http://profiles.wordpress.org/crrobi01">Colin Robinson</a>, <a href="http://profiles.wordpress.org/andreasnrb">cyonite</a>, <a href="http://profiles.wordpress.org/daankortenbach">Daan Kortenbach</a>, <a href="http://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="http://profiles.wordpress.org/convissor">Daniel Convissor</a>, <a href="http://profiles.wordpress.org/dartiss">dartiss</a>, <a href="http://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="http://profiles.wordpress.org/csixty4">Dave Ross</a>, <a href="http://profiles.wordpress.org/davidjlaietta">David Laietta</a>, <a href="http://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="http://profiles.wordpress.org/dllh">dllh</a>, <a href="http://profiles.wordpress.org/ocean90">Dominik Schilling (ocean90)</a>, <a href="http://profiles.wordpress.org/dpash">dpash</a>, <a href="http://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="http://profiles.wordpress.org/drprotocols">DrProtocols</a>, <a href="http://profiles.wordpress.org/dustyf">Dustin Filippini</a>, <a href="http://profiles.wordpress.org/dzver">dzver</a>, <a href="http://profiles.wordpress.org/cais">Edward Caissie</a>, <a href="http://profiles.wordpress.org/enej">enej</a>, <a href="http://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="http://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="http://profiles.wordpress.org/evansolomon">Evan Solomon</a>, <a href="http://profiles.wordpress.org/faishal">faishal</a>, <a href="http://profiles.wordpress.org/faison">Faison</a>, <a href="http://profiles.wordpress.org/foofy">Foofy</a>, <a href="http://profiles.wordpress.org/fjarrett">Frankie Jarrett</a>, <a href="http://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="http://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="http://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="http://profiles.wordpress.org/gayadesign">Gaya Kessler</a>, <a href="http://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="http://profiles.wordpress.org/gizburdt">Gizburdt</a>, <a href="http://profiles.wordpress.org/goldenapples">goldenapples</a>, <a href="http://profiles.wordpress.org/gradyetc">gradyetc</a>, <a href="http://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="http://profiles.wordpress.org/webord">Gustavo Bordoni</a>, <a href="http://profiles.wordpress.org/hakre">hakre</a>, <a href="http://profiles.wordpress.org/helen">Helen Hou-Sandi</a>, <a href="http://profiles.wordpress.org/iandunn">Ian Dunn</a>, <a href="http://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="http://profiles.wordpress.org/creativeinfusion">itinerant</a>, <a href="http://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="http://profiles.wordpress.org/jakubtyrcha">jakub.tyrcha</a>, <a href="http://profiles.wordpress.org/jamescollins">James Collins</a>, <a href="http://profiles.wordpress.org/jenmylo">Jen Mylo</a>, <a href="http://profiles.wordpress.org/buffler">Jeremy Buller</a>, <a href="http://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="http://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="http://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="http://profiles.wordpress.org/jkudish">Joey Kudish</a>, <a href="http://profiles.wordpress.org/johnnyb">John Beales</a>, <a href="http://profiles.wordpress.org/johnbillion">John Blackbourn (johnbillion)</a>, <a href="http://profiles.wordpress.org/johnafish">John Fish</a>, <a href="http://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="http://profiles.wordpress.org/johnpbloch">John P. Bloch</a>, <a href="http://profiles.wordpress.org/jond3r">Jonas Bolinder (jond3r)</a>, <a href="http://profiles.wordpress.org/jchristopher">Jonathan Christopher</a>, <a href="http://profiles.wordpress.org/desrosj">Jonathan Desrosiers</a>, <a href="http://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="http://profiles.wordpress.org/jonlynch">Jon Lynch</a>, <a href="http://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="http://profiles.wordpress.org/josephscott">Joseph Scott</a>, <a href="http://profiles.wordpress.org/betzster">Josh Betz</a>, <a href="http://profiles.wordpress.org/devesine">Justin de Vesine</a>, <a href="http://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="http://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="http://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="http://profiles.wordpress.org/ketwaroo">Ketwaroo</a>, <a href="http://profiles.wordpress.org/kevinb">kevinB</a>, <a href="http://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="http://profiles.wordpress.org/kitchin">kitchin</a>, <a href="http://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="http://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="http://profiles.wordpress.org/koopersmith">koopersmith</a>, <a href="http://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="http://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="http://profiles.wordpress.org/leewillis77">Lee Willis (leewillis77)</a>, <a href="http://profiles.wordpress.org/lessbloat">lessbloat</a>, <a href="http://profiles.wordpress.org/layotte">Lew Ayotte</a>, <a href="http://profiles.wordpress.org/lgedeon">Luke Gedeon</a>, <a href="http://profiles.wordpress.org/iworks">Marcin Pietrzak</a>, <a href="http://profiles.wordpress.org/cimmo">Marco Cimmino</a>, <a href="http://profiles.wordpress.org/marco_teethgrinder">Marco Galasso</a>, <a href="http://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="http://profiles.wordpress.org/markmcwilliams">Mark McWilliams</a>, <a href="http://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="http://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="http://profiles.wordpress.org/tw2113">Michael Beckwith</a>, <a href="http://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="http://profiles.wordpress.org/mikeschinkel">Mike Schinkel</a>, <a href="http://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="http://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="http://profiles.wordpress.org/mitchoyoshitaka">mitcho (Michael Yoshitaka Erlewine)</a>, <a href="http://profiles.wordpress.org/usermrpapa">Mr Papa</a>, <a href="http://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="http://profiles.wordpress.org/naomicbush">Naomi</a>, <a href="http://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="http://profiles.wordpress.org/natejacobs">NateJacobs</a>, <a href="http://profiles.wordpress.org/nathanrice">nathanrice</a>, <a href="http://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="http://profiles.wordpress.org/nickdaugherty">Nick Daugherty</a>, <a href="http://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="http://profiles.wordpress.org/nickmomrik">Nick Momrik</a>, <a href="http://profiles.wordpress.org/nikv">Nikhil Vimal (NikV)</a>, <a href="http://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="http://profiles.wordpress.org/noahsilverstein">noahsilverstein</a>, <a href="http://profiles.wordpress.org/nofearinc">nofearinc</a>, <a href="http://profiles.wordpress.org/nukaga">nukaga</a>, <a href="http://profiles.wordpress.org/nullvariable">nullvariable</a>, <a href="http://profiles.wordpress.org/butuzov">Oleg Butuzov</a>, <a href="http://profiles.wordpress.org/paolal">Paolo Belcastro</a>, <a href="http://profiles.wordpress.org/xparham">Parham</a>, <a href="http://profiles.wordpress.org/pbiron">Paul Biron</a>, <a href="http://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="http://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="http://profiles.wordpress.org/peterjaap">peterjaap</a>, <a href="http://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="http://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="http://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="http://profiles.wordpress.org/plocha">plocha</a>, <a href="http://profiles.wordpress.org/pollett">Pollett</a>, <a href="http://profiles.wordpress.org/ptahdunbar">Ptah Dunbar</a>, <a href="http://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="http://profiles.wordpress.org/rasheed">Rasheed Bydousi</a>, <a href="http://profiles.wordpress.org/raybernard">RayBernard</a>, <a href="http://profiles.wordpress.org/rboren">rboren</a>, <a href="http://profiles.wordpress.org/greuben">Reuben Gunday</a>, <a href="http://profiles.wordpress.org/rfair404">rfair404</a>, <a href="http://profiles.wordpress.org/iamfriendly">Richard Tape</a>, <a href="http://profiles.wordpress.org/r3df">Rick Radko</a>, <a href="http://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="http://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="http://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="http://profiles.wordpress.org/wpmuguru">Ron Rennick</a>, <a href="http://profiles.wordpress.org/rpattillo">rpattillo</a>, <a href="http://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="http://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="http://profiles.wordpress.org/hotchkissconsulting">Sam Hotchkiss</a>, <a href="http://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="http://profiles.wordpress.org/scottsweb">scottsweb</a>, <a href="http://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="http://profiles.wordpress.org/scribu">scribu</a>, <a href="http://profiles.wordpress.org/scruffian">scruffian</a>, <a href="http://profiles.wordpress.org/tenpura">Seisuke Kuraishi (tenpura)</a>, <a href="http://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="http://profiles.wordpress.org/shinichin">ShinichiN</a>, <a href="http://profiles.wordpress.org/pross">Simon Prosser</a>, <a href="http://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="http://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="http://profiles.wordpress.org/siobhyb">Siobhan Bamber (siobhyb)</a>, <a href="http://profiles.wordpress.org/sirzooro">sirzooro</a>, <a href="http://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="http://profiles.wordpress.org/sillybean">Stephanie Leary</a>, <a href="http://profiles.wordpress.org/netweb">Stephen Edgar (@netweb)</a>, <a href="http://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="http://profiles.wordpress.org/strangerstudios">strangerstudios</a>, <a href="http://profiles.wordpress.org/sweetie089">sweetie089</a>, <a href="http://profiles.wordpress.org/swissspidy">swissspidy</a>, <a href="http://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="http://profiles.wordpress.org/tmtoy">Takuma Morikawa</a>, <a href="http://profiles.wordpress.org/tlovett1">Taylor Lovett</a>, <a href="http://profiles.wordpress.org/tivnet">tivnet</a>, <a href="http://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="http://profiles.wordpress.org/tomauger">Tom Auger</a>, <a href="http://profiles.wordpress.org/toscho">toscho</a>, <a href="http://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="http://profiles.wordpress.org/sorich87">Ulrich Sossou</a>, <a href="http://profiles.wordpress.org/vericgar">vericgar</a>, <a href="http://profiles.wordpress.org/vinod-dalvi">Vinod Dalvi</a>, <a href="http://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="http://profiles.wordpress.org/wikicms">wikicms</a>, <a href="http://profiles.wordpress.org/willnorris">Will Norris</a>, <a href="http://profiles.wordpress.org/wojtekszkutnik">Wojtek Szkutnik</a>, <a href="http://profiles.wordpress.org/wycks">wycks</a>, <a href="http://profiles.wordpress.org/yoavf">Yoav Farhi</a>, and <a href="http://profiles.wordpress.org/yurivictor">Yuri Victor</a>.</p>\n<p>Enjoy what may be one of your last few manual updates. See you soon for version 3.8!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/news/2013/10/basie/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress 3.7 Release Candidate 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 23 Oct 2013 00:05:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2729";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:417:"The second release candidate of WordPress 3.7 is now available for testing! Those of you already testing WordPress 3.7 will be updated automatically to RC2. (Nice.) If you&#8217;d like to start testing, there&#8217;s no time like the present! Try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”) or download the release candidate here (zip). Please post to the Alpha/Beta [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1183:"<p>The second release candidate of WordPress 3.7 is now available for testing!</p>\n<p>Those of you already testing WordPress 3.7 will be updated automatically to RC2. (<em>Nice.</em>) If you&#8217;d like to start testing, there&#8217;s no time like the present! Try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”) or <a href="http://wordpress.org/wordpress-3.7-RC2.zip">download the release candidate here</a> (zip). Please post to the <a href="http://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a> if you think you&#8217;ve found a bug, and if any known issues are raised, you’ll be able to <a href="http://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>Developers, please test your plugins and themes against WordPress 3.7. If there is a compatibility issue, let us know as soon as possible so we can deal with it before the final release.</p>\n<p>For more on WordPress 3.7, check out the <a href="http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate/">announcement post for Release Candidate 1</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Upcoming WordCamps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/10/upcoming-wordcamps-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2013/10/upcoming-wordcamps-4/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 22 Oct 2013 19:25:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:9:"Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"WordCamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2723";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:368:"WordCamps are casual, locally-organized conferences that celebrate everything related to WordPress, and are a great opportunity to meet other WordPress users and professionals in your community. This has been a great year for WordCamps &#8212; there have been 56 so far in more than 20 countries, and there another 15 on the calendar before the year&#8217;s [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"Jen Mylo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3584:"<p><a href="http://central.wordcamp.org/">WordCamps</a> are casual, locally-organized conferences that celebrate everything related to WordPress, and are a great opportunity to meet other WordPress users and professionals in your community. This has been a great year for WordCamps &#8212; there have been 56 so far in more than 20 countries, and there another 15 on the calendar before the year&#8217;s over. If there&#8217;s one near you, check it out! In addition to getting to know your local WordPress community, most WordCamps attract some traveling visitors a well, giving you the chance to meet contributors to the WordPress open source project and <a href="http://make.wordpress.org/">get involved</a> yourself.</p>\n<p>Here are the WordCamps on the schedule for the rest of this year.</p>\n<p>October 25-27: <strong><a href="http://2013.boston.wordcamp.org/">WordCamp Boston</a></strong>, Boston, MA, USA<br />\nOctober 25-26: <strong><a href="http://2013.malaga.wordcamp.org/">WordCamp Malaga</a></strong>, Spain<br />\nOctober 26: <strong><a href="http://2013.nepal.wordcamp.org/">WordCamp Nepal</a></strong>, Kathmandu, Nepal<br />\nOctober 26: <strong><a href="http://2013.sofia.wordcamp.org/">WordCamp Sofia</a></strong>, Bulgaria<br />\nNovember 7: <strong><a href="http://2013.capetown.wordcamp.org/">WordCamp Cape Town</a></strong>, South Africa<br />\nNovember 9: <strong><a href="http://2013.porto.wordcamp.org/">WordCamp Porto</a></strong>, Portugal<br />\nNovember 9-10: <strong><a href="http://2013.kenya.wordcamp.org/">WordCamp Kenya</a></strong>, Nairobi, Kenya<br />\nNovember 15: <strong><a href="http://2013.edmonton.wordcamp.org/">WordCamp Edmonton</a></strong>, AB, Canada<br />\nNovember 16-17: <strong><a href="http://2013.orlando.wordcamp.org/">WordCamp Orlando</a></strong>, FL, USA<br />\nNovember 16: <strong><a href="http://2013.denver.wordcamp.org/">WordCamp Denver</a></strong>, CO, USA<br />\nNovember 23-24: <strong><a href="http://2013.london.wordcamp.org/">WordCamp London</a></strong>, UK<br />\nNovember 23-24: <strong><a href="http://2013.raleigh.wordcamp.org/">WordCamp Raleigh</a></strong>, NC, USA<br />\nNovember 23: <strong><a href="http://2013.saopaulo.wordcamp.org/">WordCamp São Paulo</a></strong>, Brazil<br />\nDecember 14: <strong><a href="http://2013.vegas.wordcamp.org/">WordCamp Las Vegas</a></strong>, NV, USA<br />\nDecember 14-15: <strong><a href="http://2013.sevilla.wordcamp.org/">WordCamp Sevilla</a></strong>, Spain</p>\n<p>No WordCamps on this list in your area? Not to worry! There are thriving <a href="http://wordpress.meetup.com/">WordPress meetups</a> all over the world where you can meet like-minded people, and we maintain a library of <a href="http://wordpress.tv/category/wordcamptv/">WordCamp videos</a> at <a href="http://wordpress.tv/">WordPress.tv</a>.</p>\n<h3>Get Involved</h3>\n<ul>\n<li>If you&#8217;re interested in organizing a WordCamp in your area, check out our <a href="http://plan.wordcamp.org/">WordCamp planning</a> site.</li>\n<li>If you&#8217;re interested in <a href="http://make.wordpress.org/community/meetup-interest-form/">starting a WordPress meetup</a> in your area, let us know and we can set up a group on meetup.com for you.</li>\n<li>And speaking of WordCamp videos, we&#8217;ve recently enabled volunteer-generated subtitles/closed captioning of the videos on WordPress.tv to make them more accessible. Interested in helping? Check out the <a href="http://wordpress.tv/using-amara-org-to-caption-or-subtitle-a-wordpress-tv-video/">WordPress.tv subtitling instructions</a>.</li>\n</ul>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2013/10/upcoming-wordcamps-4/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 3.7 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 18 Oct 2013 19:52:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2718";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:331:"The first release candidate for WordPress 3.7 is now available! In RC 1, we&#8217;ve made some adjustments to the update process to make it more reliable than ever. We hope to ship WordPress 3.7 next week, but we need your help to get there. If you haven’t tested 3.7 yet, there’s no time like the present. (Please, [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2274:"<p>The first release candidate for WordPress 3.7 is now available!</p>\n<p>In RC 1, we&#8217;ve made some adjustments to the update process to make it more reliable than ever. We hope to ship WordPress 3.7 <em>next week</em>, but we need your help to get there. If you haven’t tested 3.7 yet, there’s no time like the present. (Please, not on a production site, unless you’re adventurous.)</p>\n<p>WordPress 3.7 introduces <strong>automatic background updates</strong> for security and minor releases (like updating from 3.7 to 3.7.1). These are really easy to test  — RC 1 will update every 12 hours or so to the latest development version, and then email you the results. (You may get two emails: one for debugging, and one all users of 3.7 will receive.) If something went wrong, you can report it.</p>\n<p><strong>Think you’ve found a bug? </strong>Please post to the <a href="http://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>. If any known issues come up, you’ll be able to <a href="http://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 3.7 RC1, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="http://wordpress.org/wordpress-3.7-RC1.zip">download the release candidate here</a> (zip). If you’d like to learn more about what&#8217;s new in WordPress 3.7, visit the awesome About screen in your dashboard (<strong><img alt="" src="http://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png?w=692" data-recalc-dims="1" /> → About</strong> in the toolbar). There, you can also see if your install is eligible for background updates. WordPress won’t automatically update, for example, if you’re using version control like Subversion or Git.</p>\n<p><strong>Developers,</strong> please test your plugins and themes against WordPress 3.7, so that if there is a compatibility issue, we can figure it out before the final release. Make sure you post any issues to the support forums.</p>\n<p><em>WordPress three seven</em><br />\n<em>A self-updating engine</em><br />\n<em>Lies beneath the hood</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.7 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/10/wordpress-3-7-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2013/10/wordpress-3-7-beta-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Oct 2013 21:28:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2706";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:357:"WordPress 3.7 Beta 2 is now available for download and testing. This is software still in development, so we don&#8217;t recommend that you run it on a production site. This has been a quiet beta period. We&#8217;re hoping to get some more testers for automatic background updates, which will occur for security and minor releases (like updating [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2108:"<p>WordPress 3.7 Beta 2 is now available for download and testing. This is software still in development, so we don&#8217;t recommend that you run it on a production site.</p>\n<p>This has been a quiet beta period. We&#8217;re hoping to get some more testers for <strong>automatic background updates</strong>, which will occur for security and minor releases (like updating from 3.7 to 3.7.1). It&#8217;s really easy to test this, as Beta 2 will update each day to the latest development version and then email you the results. If something goes wrong, you can report it — it&#8217;s that simple. To get the beta, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="http://wordpress.org/wordpress-3.7-beta2.zip">download the beta here</a> (zip). Check out <strong>Dashboard → Updates</strong> to see if your install is eligible for background updates. WordPress won&#8217;t update if, for example, you&#8217;re using version control like SVN or Git.</p>\n<p>For more of what&#8217;s new in version 3.7, <a title="WordPress 3.7 Beta 1" href="http://wordpress.org/news/2013/09/wordpress-3-7-beta-1/">check out the Beta 1 blog post</a>. In Beta 2, we further increased the stability of background updates and also added about 50 bug fixes, including a fix for Internet Explorer 11 in the visual editor.</p>\n<p>If you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.7">everything we’ve fixed</a>.</p>\n<p>Happy testing!</p>\n<p><em>Beta 2 released<br />\nDotting i&#8217;s and crossing t&#8217;s</em><br />\n<em>Expect RC next</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2013/10/wordpress-3-7-beta-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:31:"http://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Wed, 22 Jan 2014 08:07:24 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:10:"x-pingback";s:36:"http://wordpress.org/news/xmlrpc.php";s:13:"last-modified";s:29:"Fri, 20 Dec 2013 08:24:58 GMT";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20140108103321";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(2720, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1389214138', 'no'),
(2721, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 08 Jan 2014 08:43:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"753@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your Wordpress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2141@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"8321@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using the WordPress SEO plugin by Yoast.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"http://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"23862@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:104:"Supercharge your WordPress site with powerful features previously only available to WordPress.com users.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"132@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"Arnee";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"15@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"18101@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"Facebook";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"http://wordpress.org/plugins/facebook/#post-37351";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 May 2012 19:36:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"37351@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Add Facebook social plugins and the ability to publish new posts to a Facebook Timeline or Facebook Page. Official Facebook plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:18:"Samuel Wood (Otto)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"1169@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:122:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 7.5 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"25254@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Fully customise WordPress edit screens with powerful fields. Boasting a professional interface and a powerfull API, it’s a must have for any web dev";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"29860@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2082@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"5468@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:63:"Create a slick mobile WordPress website with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2572@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Breadcrumb NavXT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/plugins/breadcrumb-navxt/#post-2634";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 01 Dec 2007 00:15:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2634@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:85:"Adds breadcrumb navigation showing the visitor&#039;s path to their current location.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"mtekk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:45:"http://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Wed, 08 Jan 2014 08:48:58 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:7:"expires";s:29:"Wed, 08 Jan 2014 09:18:31 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Wed, 08 Jan 2014 08:43:31 +0000";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20131009162855";}', 'no'),
(2911, 'product_cat_children', 'a:1:{i:81;a:5:{i:0;i:82;i:1;i:83;i:2;i:103;i:3;i:104;i:4;i:105;}}', 'yes'),
(2427, 'widget_product_categories', 'a:2:{i:2;a:6:{s:5:"title";s:0:"";s:7:"orderby";s:4:"name";s:5:"count";i:0;s:12:"hierarchical";b:1;s:8:"dropdown";i:0;s:18:"show_children_only";i:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(2726, '_transient_timeout_feed_mod_77fa140e07ce53fe8c87136636f83d72', '1389214138', 'no'),
(2727, '_transient_feed_mod_77fa140e07ce53fe8c87136636f83d72', '1389170938', 'no'),
(2731, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1389214138', 'no'),
(2732, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '<h4>Nejoblíbenější</h4>\n<h5><a href=''http://wordpress.org/plugins/wordpress-importer/''>WordPress Importer</a></h5>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=wordpress-importer&amp;_wpnonce=4f88eded1b&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''WordPress Importer''>Instalovat</a>)</span>\n<p>Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.</p>\n<h4>Nejnovější</h4>\n<h5><a href=''http://wordpress.org/plugins/opaque-teaser/''>Opaque Teaser</a></h5>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=opaque-teaser&amp;_wpnonce=a9d344ac59&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Opaque Teaser''>Instalovat</a>)</span>\n<p>Use your template styling to create a semi-transparent teaser overlay.</p>\n', 'no'),
(2380, 'provize', '10', 'no'),
(2722, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1389214138', 'no'),
(2723, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1389170938', 'no'),
(2446, 'woocommerce_errors', '', 'yes'),
(2453, 'product_shipping_class_children', 'a:0:{}', 'yes'),
(2632, 'den_vyuctovani', '10', 'no'),
(3023, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(3026, '_transient_wc_uf_pid_1bb5be2783a07a8e7191770eefe9975b', 'a:4:{i:0;s:3:"207";i:1;s:3:"205";i:2;s:3:"196";i:3;s:3:"195";}', 'yes'),
(3027, '_transient_wc_rating_count_205', '0', 'yes'),
(3028, '_transient_wc_average_rating_205', '', 'yes'),
(3029, '_transient_wc_rating_count_196', '0', 'yes'),
(3030, '_transient_wc_average_rating_196', '', 'yes'),
(2855, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:41:"https://wordpress.org/wordpress-3.8.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:41:"https://wordpress.org/wordpress-3.8.1.zip";s:10:"no_content";s:52:"https://wordpress.org/wordpress-3.8.1-no-content.zip";s:11:"new_bundled";s:53:"https://wordpress.org/wordpress-3.8.1-new-bundled.zip";s:7:"partial";s:51:"https://wordpress.org/wordpress-3.8.1-partial-0.zip";s:8:"rollback";b:0;}s:7:"current";s:5:"3.8.1";s:7:"version";s:5:"3.8.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:3:"3.8";}i:1;O:8:"stdClass":10:{s:8:"response";s:10:"autoupdate";s:8:"download";s:41:"https://wordpress.org/wordpress-3.8.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:41:"https://wordpress.org/wordpress-3.8.1.zip";s:10:"no_content";s:52:"https://wordpress.org/wordpress-3.8.1-no-content.zip";s:11:"new_bundled";s:53:"https://wordpress.org/wordpress-3.8.1-new-bundled.zip";s:7:"partial";s:51:"https://wordpress.org/wordpress-3.8.1-partial-0.zip";s:8:"rollback";s:52:"https://wordpress.org/wordpress-3.8.1-rollback-0.zip";}s:7:"current";s:5:"3.8.1";s:7:"version";s:5:"3.8.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:3:"3.8";}}s:12:"last_checked";i:1390557177;s:15:"version_checked";s:3:"3.8";s:12:"translations";a:0:{}}', 'yes'),
(3035, '_transient_wc_uf_pid_28818073587886195320369982f03efe', 'a:1:{i:0;s:3:"207";}', 'yes'),
(3036, '_transient_wc_uf_pid_9c49287860b76614ea6c1c60a799fb3e', 'a:1:{i:0;s:3:"207";}', 'yes'),
(3037, '_transient_wc_uf_pid_e6c465df665552fe8ecd65a4bb674453', 'a:1:{i:0;s:3:"207";}', 'yes'),
(528, '_transient_plugins_delete_result_1', '1', 'yes'),
(532, 'xmlsf_sitemaps', 'a:2:{s:7:"sitemap";s:11:"sitemap.xml";s:12:"sitemap-news";s:16:"sitemap-news.xml";}', 'yes'),
(533, 'xmlsf_post_types', 'a:5:{s:4:"post";a:6:{s:4:"name";s:4:"post";s:6:"active";s:1:"1";s:7:"archive";s:0:"";s:8:"priority";s:3:"0.7";s:16:"dynamic_priority";s:1:"1";s:4:"tags";a:1:{s:5:"image";s:8:"featured";}}s:4:"page";a:4:{s:4:"name";s:4:"page";s:6:"active";s:1:"1";s:8:"priority";s:3:"0.3";s:4:"tags";a:1:{s:5:"image";s:8:"featured";}}s:7:"product";a:2:{s:4:"name";s:7:"product";s:8:"priority";s:3:"0.5";}s:17:"product_variation";a:2:{s:4:"name";s:17:"product_variation";s:8:"priority";s:3:"0.5";}s:11:"shop_coupon";a:2:{s:4:"name";s:11:"shop_coupon";s:8:"priority";s:3:"0.5";}}', 'yes'),
(535, 'xmlsf_taxonomies', 'a:2:{s:8:"category";s:8:"category";s:8:"post_tag";s:8:"post_tag";}', 'yes'),
(536, 'xmlsf_ping', 'a:2:{s:6:"google";a:2:{s:3:"uri";s:52:"http://www.google.com/webmasters/tools/ping?sitemap=";s:6:"active";s:1:"1";}s:4:"bing";a:2:{s:3:"uri";s:33:"http://www.bing.com/ping?sitemap=";s:6:"active";s:1:"1";}}', 'yes'),
(537, 'xmlsf_robots', 'Disallow: /xmlrpc.php\r\nDisallow: /wp-\r\nDisallow: /trackback/\r\nDisallow: ?wptheme=\r\nDisallow: ?comments=\r\nDisallow: ?replytocom\r\nDisallow: /comment-page-\r\nDisallow: /?s=\r\nDisallow: /wp-content/\r\nAllow: /wp-content/uploads/', 'yes'),
(547, 'ffref', '84099', 'yes'),
(548, 'fflink', 'Website By Wordpress', 'yes'),
(549, 'current_theme', 'Twenty Twelve', 'yes'),
(550, 'theme_mods_Xanadu', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:3;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1364294966;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:12:"categories-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}}}}', 'yes'),
(598, 'theme_mods_hum', 'a:10:{i:0;b:0;s:16:"header_textcolor";s:3:"000";s:16:"background_color";s:6:"e2e2e2";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:18:"nav_menu_locations";a:1:{s:7:"primary";i:3;}s:12:"header_image";s:13:"remove-header";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1367491495;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:12:"categories-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;s:9:"sidebar-4";N;s:9:"sidebar-5";N;}}}', 'yes'),
(551, 'theme_switched', '', 'yes'),
(1455, 'db_upgraded', '', 'yes'),
(2728, '_transient_timeout_plugin_slugs', '1390307287', 'no'),
(2729, '_transient_plugin_slugs', 'a:9:{i:0;s:24:"buddypress/bp-loader.php";i:1;s:21:"budkutil/budkutil.php";i:2;s:47:"regenerate-thumbnails/regenerate-thumbnails.php";i:3;s:37:"tinymce-advanced/tinymce-advanced.php";i:4;s:27:"woocommerce/woocommerce.php";i:5;s:41:"wc4bp-basic-integration/bpshop-loader.php";i:6;s:45:"wp-admin-bar-removal/wp-admin-bar-removal.php";i:7;s:33:"wp-breadcrumbs/wp_breadcrumbs.php";i:8;s:32:"xml-sitemap-feed/xml-sitemap.php";}', 'no'),
(145, '_transient_random_seed', '7e9782a21077e06a4d522081b54f9ab4', 'yes'),
(530, 'xmlsf_version', '4.3.2', 'yes'),
(366, 'category_children', 'a:0:{}', 'yes'),
(154, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(153, 'theme_mods_twentytwelve', 'a:1:{s:18:"nav_menu_locations";a:1:{s:7:"primary";i:3;}}', 'yes'),
(956, 'illegal_names', 'a:20:{i:0;s:3:"www";i:1;s:3:"web";i:2;s:4:"root";i:3;s:5:"admin";i:4;s:4:"main";i:5;s:6:"invite";i:6;s:13:"administrator";i:7;s:6:"groups";i:8;s:7:"members";i:9;s:6:"forums";i:10;s:5:"blogs";i:11;s:8:"activity";i:12;s:7:"profile";i:13;s:7:"friends";i:14;s:6:"search";i:15;s:8:"settings";i:16;s:8:"register";i:17;s:8:"activate";i:18;s:10:"registrace";i:19;s:13:"aktivace-uctu";}', 'yes'),
(212, 'recently_activated', 'a:0:{}', 'yes'),
(213, 'tadv_version', '3420', 'yes'),
(214, 'tadv_plugins', 'a:5:{i:0;s:8:"emotions";i:1;s:5:"table";i:2;s:5:"print";i:3;s:10:"xhtmlxtras";i:4;s:8:"advimage";}', 'yes'),
(215, 'tadv_options', 'a:7:{s:8:"advlink1";i:0;s:8:"advimage";i:1;s:11:"editorstyle";i:0;s:11:"hideclasses";i:0;s:11:"contextmenu";i:0;s:8:"no_autop";i:0;s:7:"advlist";i:0;}', 'yes'),
(216, 'tadv_toolbars', 'a:4:{s:9:"toolbar_1";a:21:{i:0;s:4:"bold";i:1;s:6:"italic";i:2;s:13:"strikethrough";i:3;s:9:"underline";i:4;s:10:"separator1";i:5;s:7:"bullist";i:6;s:7:"numlist";i:7;s:7:"outdent";i:8;s:6:"indent";i:9;s:10:"separator2";i:10;s:11:"justifyleft";i:11;s:13:"justifycenter";i:12;s:12:"justifyright";i:13;s:10:"separator3";i:14;s:4:"link";i:15;s:6:"unlink";i:16;s:10:"separator4";i:17;s:5:"image";i:18;s:10:"separator6";i:19;s:13:"tablecontrols";i:20;s:10:"fullscreen";}s:9:"toolbar_2";a:21:{i:0;s:14:"fontsizeselect";i:1;s:12:"formatselect";i:2;s:9:"pastetext";i:3;s:9:"pasteword";i:4;s:12:"removeformat";i:5;s:10:"separator8";i:6;s:7:"charmap";i:7;s:5:"print";i:8;s:10:"separator9";i:9;s:9:"forecolor";i:10;s:9:"backcolor";i:11;s:8:"emotions";i:12;s:11:"separator10";i:13;s:3:"sup";i:14;s:3:"sub";i:15;s:5:"media";i:16;s:11:"separator11";i:17;s:4:"undo";i:18;s:4:"redo";i:19;s:7:"attribs";i:20;s:7:"wp_help";}s:9:"toolbar_3";a:0:{}s:9:"toolbar_4";a:0:{}}', 'no'),
(217, 'tadv_btns1', 'a:22:{i:0;s:4:"bold";i:1;s:6:"italic";i:2;s:13:"strikethrough";i:3;s:9:"underline";i:4;s:9:"separator";i:5;s:7:"bullist";i:6;s:7:"numlist";i:7;s:7:"outdent";i:8;s:6:"indent";i:9;s:9:"separator";i:10;s:11:"justifyleft";i:11;s:13:"justifycenter";i:12;s:12:"justifyright";i:13;s:9:"separator";i:14;s:4:"link";i:15;s:6:"unlink";i:16;s:9:"separator";i:17;s:5:"image";i:18;s:9:"separator";i:19;s:13:"tablecontrols";i:20;s:13:"delete_table,";i:21;s:10:"fullscreen";}', 'no'),
(218, 'tadv_btns2', 'a:21:{i:0;s:14:"fontsizeselect";i:1;s:12:"formatselect";i:2;s:9:"pastetext";i:3;s:9:"pasteword";i:4;s:12:"removeformat";i:5;s:9:"separator";i:6;s:7:"charmap";i:7;s:5:"print";i:8;s:9:"separator";i:9;s:9:"forecolor";i:10;s:9:"backcolor";i:11;s:8:"emotions";i:12;s:9:"separator";i:13;s:3:"sup";i:14;s:3:"sub";i:15;s:5:"media";i:16;s:9:"separator";i:17;s:4:"undo";i:18;s:4:"redo";i:19;s:7:"attribs";i:20;s:7:"wp_help";}', 'no'),
(219, 'tadv_btns3', 'a:0:{}', 'no'),
(220, 'tadv_btns4', 'a:0:{}', 'no'),
(221, 'tadv_allbtns', 'a:66:{i:0;s:2:"hr";i:1;s:6:"wp_adv";i:2;s:10:"blockquote";i:3;s:4:"bold";i:4;s:6:"italic";i:5;s:13:"strikethrough";i:6;s:9:"underline";i:7;s:7:"bullist";i:8;s:7:"numlist";i:9;s:7:"outdent";i:10;s:6:"indent";i:11;s:11:"justifyleft";i:12;s:13:"justifycenter";i:13;s:12:"justifyright";i:14;s:11:"justifyfull";i:15;s:3:"cut";i:16;s:4:"copy";i:17;s:5:"paste";i:18;s:4:"link";i:19;s:6:"unlink";i:20;s:5:"image";i:21;s:7:"wp_more";i:22;s:7:"wp_page";i:23;s:6:"search";i:24;s:7:"replace";i:25;s:10:"fontselect";i:26;s:14:"fontsizeselect";i:27;s:7:"wp_help";i:28;s:10:"fullscreen";i:29;s:11:"styleselect";i:30;s:12:"formatselect";i:31;s:9:"forecolor";i:32;s:9:"backcolor";i:33;s:9:"pastetext";i:34;s:9:"pasteword";i:35;s:12:"removeformat";i:36;s:7:"cleanup";i:37;s:12:"spellchecker";i:38;s:7:"charmap";i:39;s:5:"print";i:40;s:4:"undo";i:41;s:4:"redo";i:42;s:13:"tablecontrols";i:43;s:4:"cite";i:44;s:3:"ins";i:45;s:3:"del";i:46;s:4:"abbr";i:47;s:7:"acronym";i:48;s:7:"attribs";i:49;s:5:"layer";i:50;s:5:"advhr";i:51;s:4:"code";i:52;s:11:"visualchars";i:53;s:11:"nonbreaking";i:54;s:3:"sub";i:55;s:3:"sup";i:56;s:9:"visualaid";i:57;s:10:"insertdate";i:58;s:10:"inserttime";i:59;s:6:"anchor";i:60;s:10:"styleprops";i:61;s:8:"emotions";i:62;s:5:"media";i:63;s:7:"iespell";i:64;s:9:"separator";i:65;s:1:"|";}', 'no'),
(952, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1390557179;s:7:"checked";a:2:{s:14:"twentyfourteen";s:3:"1.0";s:12:"twentytwelve";s:0:"";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(599, 'twentyeleven_theme_options', 'a:3:{s:12:"color_scheme";s:5:"light";s:10:"link_color";s:7:"#914d00";s:12:"theme_layout";s:15:"content-sidebar";}', 'yes'),
(601, 'xmlsf_pings', 'a:2:{s:6:"google";a:2:{s:11:"sitemap.xml";s:19:"2013-03-26 14:45:33";s:16:"sitemap-news.xml";s:19:"2013-03-26 14:45:33";}s:4:"bing";a:2:{s:11:"sitemap.xml";s:19:"2013-03-26 14:45:34";s:16:"sitemap-news.xml";s:19:"2013-03-26 14:45:34";}}', 'yes'),
(949, 'widget_bp_core_whos_online_widget', 'a:2:{i:2;a:2:{s:5:"title";s:13:"Kdo je online";s:11:"max_members";s:2:"15";}s:12:"_multiwidget";i:1;}', 'yes'),
(2179, 'woocommerce_price_decimal_sep', '.', 'yes'),
(2180, 'woocommerce_price_num_decimals', '2', 'yes'),
(2181, 'woocommerce_price_trim_zeros', 'yes', 'yes'),
(2182, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:1;}', 'yes'),
(926, '_bp_db_version', '7553', 'yes'),
(3067, '_site_transient_timeout_theme_roots', '1390558978', 'yes'),
(3068, '_site_transient_theme_roots', 'a:2:{s:14:"twentyfourteen";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(916, 'bp-deactivated-components', 'a:0:{}', 'yes'),
(917, 'bb-config-location', '/mnt/data/accounts/p/pointfrost/data/www/BUD-KUTIL-CZ/bb-config.php', 'yes'),
(918, 'bp-xprofile-base-group-name', 'Tvoje základní údaje', 'yes'),
(919, 'bp-xprofile-fullname-field-name', 'Jméno i příjmení', 'yes'),
(920, 'bp-disable-blogforum-comments', '0', 'yes'),
(921, '_bp_theme_package_id', 'legacy', 'yes'),
(922, '_bp_enable_akismet', '1', 'yes'),
(923, 'registration', '0', 'yes'),
(957, 'widget_nav_menu', 'a:2:{i:2;a:2:{s:5:"title";s:12:"Menu sidebar";s:8:"nav_menu";i:3;}s:12:"_multiwidget";i:1;}', 'yes'),
(928, 'hide-loggedout-adminbar', '1', 'yes'),
(929, 'bp-disable-account-deletion', '0', 'yes'),
(930, 'bp-disable-avatar-uploads', '0', 'yes'),
(931, 'bp-disable-profile-sync', '0', 'yes'),
(932, 'bp_disable_blogforum_comments', '1', 'yes'),
(933, 'bp_restrict_group_creation', '1', 'yes'),
(940, 'template_root', '/themes', 'yes'),
(941, 'stylesheet_root', '/themes', 'yes'),
(942, 'theme_mods_bp-default', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1367492321;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:12:"categories-2";i:1;s:32:"bp_core_recently_active_widget-2";i:2;s:28:"bp_core_whos_online_widget-2";}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";a:0:{}s:24:"third-footer-widget-area";a:0:{}s:25:"fourth-footer-widget-area";a:0:{}}}}', 'yes'),
(950, 'widget_bp_core_recently_active_widget', 'a:2:{i:2;a:2:{s:5:"title";s:23:"Recently Active Members";s:11:"max_members";s:2:"15";}s:12:"_multiwidget";i:1;}', 'yes'),
(953, 'wplb_options', 'a:7:{s:7:"wplogin";b:1;s:8:"register";b:1;s:6:"forgot";b:1;s:7:"profile";b:1;s:6:"logout";b:1;s:5:"style";s:5:"light";s:5:"float";s:5:"right";}', 'yes'),
(958, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(959, 'widget_bp_core_members_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(976, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(963, 'widget_wp_sidebarlogin', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(2075, 'xmlsf_pong', 'a:2:{s:6:"google";a:2:{s:11:"sitemap.xml";s:19:"2013-03-26 14:45:33";s:16:"sitemap-news.xml";s:19:"2013-03-26 14:45:33";}s:4:"bing";a:2:{s:11:"sitemap.xml";s:19:"2014-01-22 10:57:42";s:16:"sitemap-news.xml";s:19:"2014-01-22 10:57:43";}}', 'yes'),
(2802, 'can_compress_scripts', '1', 'yes'),
(3025, '_transient_wc_term_counts', 'a:14:{i:100;s:1:"1";i:90;s:1:"1";i:82;s:1:"2";i:92;s:1:"1";i:81;s:1:"4";i:103;s:1:"1";i:104;s:1:"1";i:83;s:1:"3";i:88;s:1:"1";i:87;s:1:"1";i:105;s:1:"1";i:89;s:1:"1";i:91;s:1:"1";i:86;s:1:"2";}', 'yes'),
(2177, 'woocommerce_currency_pos', 'left', 'yes'),
(2178, 'woocommerce_price_thousand_sep', ',', 'yes'),
(2954, '_transient_woocommerce_cache_excluded_uris', 'a:6:{i:0;s:6:"/kosik";i:1;s:9:"/pokladna";i:2;s:9:"/muj-ucet";i:3;s:5:"p=180";i:4;s:5:"p=181";i:5;s:5:"p=182";}', 'yes'),
(2224, 'bpshop_installed', '1', 'yes'),
(2225, 'bpshop_shipping_address_ids', 'a:10:{s:8:"group_id";i:5;s:10:"first_name";i:263;s:9:"last_name";i:264;s:7:"company";i:265;s:7:"address";i:266;s:9:"address-2";i:267;s:4:"city";i:268;s:8:"postcode";i:269;s:7:"country";i:270;s:5:"state";i:515;}', 'yes'),
(2128, 'woocommerce_default_country', 'CZ', 'yes'),
(2129, 'woocommerce_currency', 'CZK', 'yes'),
(2130, 'woocommerce_allowed_countries', 'specific', 'yes'),
(2131, 'woocommerce_specific_allowed_countries', 'a:2:{i:0;s:2:"SK";i:1;s:2:"CZ";}', 'yes'),
(2132, 'woocommerce_demo_store', 'no', 'yes'),
(2133, 'woocommerce_demo_store_notice', 'This is a demo store for testing purposes — no orders shall be fulfilled.', 'yes'),
(2134, 'woocommerce_enable_coupons', 'no', 'yes'),
(2135, 'woocommerce_enable_guest_checkout', 'no', 'yes'),
(2136, 'woocommerce_enable_order_comments', 'yes', 'yes'),
(2137, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(2138, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(2139, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'yes'),
(2140, 'woocommerce_enable_myaccount_registration', 'yes', 'yes'),
(2141, 'woocommerce_registration_email_for_username', 'no', 'yes'),
(2142, 'woocommerce_lock_down_admin', 'yes', 'yes'),
(2143, 'woocommerce_clear_cart_on_logout', 'no', 'yes'),
(2144, 'woocommerce_allow_customers_to_reorder', 'no', 'yes'),
(2145, 'woocommerce_frontend_css', 'no', 'yes'),
(2146, 'woocommerce_enable_lightbox', 'yes', 'yes'),
(2147, 'woocommerce_enable_chosen', 'yes', 'yes'),
(2148, 'woocommerce_file_download_method', 'force', 'yes'),
(2149, 'woocommerce_downloads_require_login', 'no', 'yes'),
(2150, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'yes'),
(2151, 'woocommerce_shop_page_id', '179', 'yes'),
(2152, 'woocommerce_terms_page_id', '151', 'yes'),
(2153, 'woocommerce_cart_page_id', '180', 'yes'),
(2154, 'woocommerce_checkout_page_id', '181', 'yes'),
(2155, 'woocommerce_pay_page_id', '188', 'yes'),
(2156, 'woocommerce_thanks_page_id', '189', 'yes'),
(2157, 'woocommerce_myaccount_page_id', '182', 'yes'),
(2158, 'woocommerce_edit_address_page_id', '184', 'yes'),
(2159, 'woocommerce_view_order_page_id', '185', 'yes'),
(2160, 'woocommerce_change_password_page_id', '186', 'yes'),
(2161, 'woocommerce_logout_page_id', '187', 'yes'),
(2162, 'woocommerce_lost_password_page_id', '183', 'yes'),
(2163, 'woocommerce_default_catalog_orderby', 'menu_order', 'yes'),
(2164, 'woocommerce_shop_page_display', 'both', 'yes'),
(2165, 'woocommerce_category_archive_display', 'both', 'yes'),
(2166, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(2167, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(2168, 'woocommerce_enable_sku', 'yes', 'yes'),
(2169, 'woocommerce_enable_weight', 'yes', 'yes'),
(2170, 'woocommerce_enable_dimensions', 'no', 'yes'),
(2171, 'woocommerce_enable_dimension_product_attributes', 'no', 'yes'),
(2172, 'woocommerce_weight_unit', 'kg', 'yes'),
(2173, 'woocommerce_dimension_unit', 'cm', 'yes'),
(2174, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(2175, 'woocommerce_review_rating_required', 'no', 'yes'),
(2176, 'woocommerce_review_rating_verification_label', 'yes', 'yes'),
(2183, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"600";s:6:"height";s:3:"600";s:4:"crop";i:1;}', 'yes'),
(2184, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:2:"90";s:6:"height";s:2:"90";s:4:"crop";i:1;}', 'yes'),
(2185, 'woocommerce_manage_stock', 'yes', 'yes'),
(2186, 'woocommerce_hold_stock_minutes', '', 'yes'),
(2187, 'woocommerce_notify_low_stock', 'no', 'yes'),
(2188, 'woocommerce_notify_no_stock', 'no', 'yes'),
(2189, 'woocommerce_stock_email_recipient', 'me@webni.cz', 'yes'),
(2190, 'woocommerce_notify_low_stock_amount', '2', 'yes'),
(2191, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(2192, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(2193, 'woocommerce_stock_format', '', 'yes'),
(2194, 'woocommerce_calc_shipping', 'yes', 'yes'),
(2195, 'woocommerce_enable_shipping_calc', 'yes', 'yes'),
(2196, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(2197, 'woocommerce_shipping_method_format', '', 'yes'),
(2198, 'woocommerce_ship_to_billing_address_only', 'yes', 'yes'),
(2199, 'woocommerce_ship_to_same_address', 'yes', 'yes'),
(2200, 'woocommerce_require_shipping_address', 'no', 'yes'),
(2201, 'woocommerce_calc_taxes', 'no', 'yes'),
(2202, 'woocommerce_prices_include_tax', 'yes', 'yes'),
(2203, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(2204, 'woocommerce_default_customer_address', 'base', 'yes'),
(2205, 'woocommerce_shipping_tax_class', '', 'yes'),
(2206, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(2207, 'woocommerce_tax_classes', '', 'yes'),
(2208, 'woocommerce_tax_display_cart', 'incl', 'yes'),
(2209, 'woocommerce_email_from_name', 'BUĎ KUTIL', 'yes'),
(2210, 'woocommerce_email_from_address', 'me@webni.cz', 'yes'),
(2211, 'woocommerce_email_header_image', '', 'yes'),
(2212, 'woocommerce_email_footer_text', 'BUĎ KUTIL - Powered by WooCommerce', 'yes'),
(2213, 'woocommerce_email_base_color', '#557da1', 'yes'),
(2214, 'woocommerce_email_background_color', '#f5f5f5', 'yes'),
(2215, 'woocommerce_email_body_background_color', '#fdfdfd', 'yes'),
(2216, 'woocommerce_email_text_color', '#505050', 'yes'),
(2219, 'woocommerce_db_version', '2.0.20', 'yes'),
(2218, '_transient_woocommerce_processing_order_count', '0', 'yes'),
(2220, 'woocommerce_version', '2.0.20', 'yes'),
(2226, 'bpshop_billing_address_ids', 'a:13:{s:8:"group_id";i:4;s:10:"first_name";i:7;s:9:"last_name";i:8;s:7:"company";i:9;s:7:"address";i:10;s:9:"address-2";i:11;s:4:"city";i:12;s:8:"postcode";i:13;s:7:"country";i:14;s:5:"state";i:259;s:5:"email";i:260;s:5:"phone";i:261;s:3:"fax";i:262;}', 'yes'),
(2440, 'xmlsf_urls', '', 'yes'),
(2441, 'xmlsf_domains', '', 'yes'),
(2442, 'xmlsf_news_tags', 'a:6:{s:4:"name";s:0:"";s:5:"image";s:8:"featured";s:6:"access";a:2:{s:7:"default";s:0:"";s:8:"password";s:12:"Subscription";}s:6:"genres";a:2:{s:6:"active";s:1:"1";s:7:"default";s:0:"";}s:8:"keywords";a:1:{s:4:"from";s:8:"category";}s:9:"locations";a:2:{s:6:"active";s:1:"1";s:7:"default";s:0:"";}}', 'yes'),
(2471, 'ucet_provize', '123456789/0123', 'no'),
(3015, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1390421251', 'no'),
(3016, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1390378051', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(3019, 'rewrite_rules', 'a:138:{s:13:"sitemap\\.xml$";s:22:"index.php?feed=sitemap";s:19:"sitemap\\-news\\.xml$";s:27:"index.php?feed=sitemap-news";s:18:"sitemap-home\\.xml$";s:27:"index.php?feed=sitemap-home";s:39:"sitemap-posttype-post\\.([0-9]+)?\\.?xml$";s:50:"index.php?feed=sitemap-posttype-post&m=$matches[1]";s:39:"sitemap-posttype-page\\.([0-9]+)?\\.?xml$";s:50:"index.php?feed=sitemap-posttype-page&m=$matches[1]";s:31:"sitemap-taxonomy-category\\.xml$";s:40:"index.php?feed=sitemap-taxonomy-category";s:31:"sitemap-taxonomy-post_tag\\.xml$";s:40:"index.php?feed=sitemap-taxonomy-post_tag";s:12:"vyrobky-2/?$";s:27:"index.php?post_type=product";s:42:"vyrobky-2/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:37:"vyrobky-2/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:29:"vyrobky-2/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:57:"kategorie-produktu/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:52:"kategorie-produktu/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:45:"kategorie-produktu/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:27:"kategorie-produktu/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:56:"stitek-produktu/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:51:"stitek-produktu/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:44:"stitek-produktu/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:26:"stitek-produktu/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:35:"produkt/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"produkt/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"produkt/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"produkt/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"produkt/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:28:"produkt/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:48:"produkt/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:43:"produkt/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:36:"produkt/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:43:"produkt/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:33:"produkt/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:39:"produkt/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"produkt/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:28:"produkt/([^/]+)(/[0-9]+)?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:24:"produkt/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"produkt/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"produkt/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"produkt/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"produkt/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:49:"gn-genre/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:61:"index.php?taxonomy=gn-genre&term=$matches[1]&feed=$matches[2]";s:44:"gn-genre/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:61:"index.php?taxonomy=gn-genre&term=$matches[1]&feed=$matches[2]";s:37:"gn-genre/([^/]+)/page/?([0-9]{1,})/?$";s:62:"index.php?taxonomy=gn-genre&term=$matches[1]&paged=$matches[2]";s:19:"gn-genre/([^/]+)/?$";s:44:"index.php?taxonomy=gn-genre&term=$matches[1]";s:54:"gn-location-3/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:66:"index.php?taxonomy=gn-location-3&term=$matches[1]&feed=$matches[2]";s:49:"gn-location-3/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:66:"index.php?taxonomy=gn-location-3&term=$matches[1]&feed=$matches[2]";s:42:"gn-location-3/([^/]+)/page/?([0-9]{1,})/?$";s:67:"index.php?taxonomy=gn-location-3&term=$matches[1]&paged=$matches[2]";s:24:"gn-location-3/([^/]+)/?$";s:49:"index.php?taxonomy=gn-location-3&term=$matches[1]";s:54:"gn-location-2/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:66:"index.php?taxonomy=gn-location-2&term=$matches[1]&feed=$matches[2]";s:49:"gn-location-2/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:66:"index.php?taxonomy=gn-location-2&term=$matches[1]&feed=$matches[2]";s:42:"gn-location-2/([^/]+)/page/?([0-9]{1,})/?$";s:67:"index.php?taxonomy=gn-location-2&term=$matches[1]&paged=$matches[2]";s:24:"gn-location-2/([^/]+)/?$";s:49:"index.php?taxonomy=gn-location-2&term=$matches[1]";s:54:"gn-location-1/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:66:"index.php?taxonomy=gn-location-1&term=$matches[1]&feed=$matches[2]";s:49:"gn-location-1/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:66:"index.php?taxonomy=gn-location-1&term=$matches[1]&feed=$matches[2]";s:42:"gn-location-1/([^/]+)/page/?([0-9]{1,})/?$";s:67:"index.php?taxonomy=gn-location-1&term=$matches[1]&paged=$matches[2]";s:24:"gn-location-1/([^/]+)/?$";s:49:"index.php?taxonomy=gn-location-1&term=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:40:"index.php?&page_id=192&cpage=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:25:"([^/]+)/wc-api(/(.*))?/?$";s:45:"index.php?name=$matches[1]&wc-api=$matches[3]";s:31:"[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(2714, '_transient_timeout_feed_f835fcade4ab539e67a73a2a477cbac6', '1389214137', 'no'),
(2715, '_transient_feed_f835fcade4ab539e67a73a2a477cbac6', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:4:"\n  \n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:83:"\n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:4:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"link:http://localhost:8888/ - Google Blog Search";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://www.google.com/search?ie=utf-8&q=link:http://localhost:8888/&tbm=blg&tbs=sbd:1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:19:"About 4,550 results";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:83:"Pass4Test provides to Avaya 6401.1 test materials | With the &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"http://comptia521.blogspot.com/2014/01/pass4test-provides-to-avaya-64011-test.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:573:"C. <em>8888</em>. D. 8990. Answer: C Avaya original questions 6401.1 original questions 6401.1 answers real questions 6401.1 dumps torrent. NO.12 What information do you need from a customer to be able to reproduce a call park problem? (Choose three.) A. accurate description <b>...</b> Article <em>Link</em>: <em>http</em>://www.pass4test.com/6401.1.html. 由jacob于 Yesterday 发布 <b>.....</b> B. The function will not execute, as &#39;joe&#39;@&#39;<em>localhost</em>&#39; does not have access to the financials table. C. The function will not execute&nbsp;<b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:97:"With the development of IT industry, Pass4test comptia certification become more and more popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"jacob";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Fri, 03 Jan 2014 07:17:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:86:"EXIN Zertifizierungsprüfung Simulation testet die effektivsten &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://exinexam.blogspot.com/2013/12/microsoft-070-503-csharp-exam-fragen.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:344:"You also create a service endpoint at <em>http</em>://<em>localhost</em>:8080/service. You add an <b>...</b> Uri baseAddress=new Uri(&quot;<em>http</em>: //<em>localhost</em>:<em>8888</em>/MortgageService&quot;); ServiceHost <b>.....</b> Artikel <em>Link</em>: <em>http</em>://www.pass4test.de/070-503-Csharp.html. 发帖者 Fay&nbsp;<b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:72:"EXIN Zertifizierungsprüfung Simulation testet die effektivsten Übungen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Fay Cathy";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 01 Jan 2014 04:20:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:85:"Die echten und originalen Prüfungsfragen und Antworten zu 1z0 &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://dumpsres.blogspot.com/2013/12/microsoft-70-503-csharp-dumps.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:271:"Which code fragment should you use? A. [ServiceContract] public interface IMortgageService { public class MortgageService : IMortgageService { Uri baseAddress=new Uri(&quot;<em>http</em>: //<em>localhost</em>:<em>8888</em>/MortgageService&quot;); ServiceHost serviceHost=";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:66:"Die echten und originalen Prüfungsfragen und Antworten zu 1z0-822";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Fay Cathy";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 01 Jan 2014 04:20:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:85:"DumpLeader provides training on Juniper JN0-360 exam materials &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"http://jn0-360examit.blogspot.com/2013/12/dumpleader-provides-information-on_31.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:322:"You also create a service endpoint at <em>http</em>://<em>localhost</em>:8080/service. You add an <b>.....</b> Uri baseAddress=new Uri(&quot;<em>http</em>: //<em>localhost</em>:<em>8888</em>/MortgageService&quot;); ServiceHost <b>....</b> Article <em>Link</em>: <em>http</em>://www.dumpleader.com/070-503-Csharp_exam.html.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:62:"dumpleader provides training on Juniper JN0-360 exam materials";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:30:"Latest 000-124 study materials";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 31 Dec 2013 10:05:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:80:"Pass4Test EMC E20-885 exam practice questions and answers &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://oracle521.blogspot.com/2013/12/pass4test-emc-e20-885-exam-practice.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:539:"A. <em>8888</em>, 8887, 5081. B. 80, 443, 8080. C. 5057, 445, 5087. D. 23, 25, 22. Answer: A EMC practice test E20-885 E20-885 dumps torrent E20-885 E20-885. NO.13 A customer has an Oracle ASM database on an EMC VNX with FAST Suite enabled. They observe intermittent performance degradation <b>....</b> Article <em>Link</em>: <em>http</em>://www.pass4test.com/E20-885.html. 由david于 2 days ago 发布 <b>......</b> D. They need to be assigned with <em>127.0.0.1</em> as their IP address. Answer: B. Symantec exam ASC-093&nbsp;<b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:96:"With the development of IT industry, Pass4test Oracle certification become more and more popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"david";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 31 Dec 2013 08:41:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:85:"ITCertKing Juniper JN0-730 exam practice questions and answers &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"http://jn0730exam1.blogspot.com/2013/12/70-503-csharp-questions-and-answers.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:335:"B. String baseAddress=&quot;<em>http</em>: //<em>localhost</em>:8000/ExamService/service&quot;; BasicHttpBinding <b>.....</b> Uri baseAddress=new Uri(&quot;<em>http</em>: //<em>localhost</em>:<em>8888</em>/MortgageService&quot;); ServiceHost <b>...</b> Article <em>Link</em>: <em>http</em>://www.itcertking.com/70-503-Csharp_exam.html.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:62:"itcertking Juniper JN0-730 exam practice questions and answers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"70-489 exam dumps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 31 Dec 2013 06:43:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:80:"The advent of SAP certification C-TSCM62-65 exam practice &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://c-tscm62-65exam.blogspot.com/2013/12/070-503-csharp-questions-and-answers.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:330:"You also create a service endpoint at <em>http</em>://<em>localhost</em>:8080/service. You add an instance <b>...</b> Uri baseAddress=new Uri(&quot;<em>http</em>: //<em>localhost</em>:<em>8888</em>/MortgageService&quot;); ServiceHost <b>.....</b> Article <em>Link</em>: <em>http</em>://www.itcertking.com/070-503-Csharp_exam.html.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:79:"The advent of SAP certification C-TSCM62-65 exam practice questions and answers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:44:"The Best IBM 000-274 Exam Training materials";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 31 Dec 2013 02:25:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:72:"1Z0-880 questions and answers | Network Appliance &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://networkit123.blogspot.com/2013/12/1z0-880-questions-and-answers.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:554:"default sys-gw UG 1 0 <em>127.0.0.1 127.0.0.1</em> UH 2 6 lo0 <b>....</b> NO.21 A host&#39;s IPv6 <em>link</em>-local unicast address is based on the host&#39;s Ethernet address. <b>....</b> Article <em>Link</em>: <em>http</em>://www.pass4test.com/1Z0-880.html <b>......</b> A. 8080. B. 8000. C. <em>8888</em>. D. 8990. Answer: C. Avaya 6401.1 6401.1 6401.1. NO.12 A customer has two IP Office systems connected using Small Community Networking with centralized. voicemail. When calling from one system to another, calls intermittently get one-way audio.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:41:"Network Appliance certificationspass4test";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"刘云兮";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 30 Dec 2013 18:21:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"Microsoft certification 70-503-Csharp exam free exercises updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"http://misstests.blogspot.com/2013/12/microsoft-certification-70-503-csharp.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:330:"B. String baseAddress=&quot;<em>http</em>: //<em>localhost</em>:8000/ExamService/service&quot;; BasicHttpBinding <b>...</b> Uri baseAddress=new Uri(&quot;<em>http</em>: //<em>localhost</em>:<em>8888</em>/MortgageService&quot;); ServiceHost <b>...</b> Article <em>Link</em>: <em>http</em>://www.itcertmaster.com/70-503-Csharp.html.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:101:"Régulièrement mises à jour du matériel de formation Microsoft et des informations d''apprentissage";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Quaid Uintrell";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 30 Dec 2013 06:47:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:86:"CompTIA-Zertifizierungsprüfung wirklichen Fragen und Antworten &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://testbets.blogspot.com/2013/12/microsoft-70-503-csharp.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:271:"Which code fragment should you use? A. [ServiceContract] public interface IMortgageService { public class MortgageService : IMortgageService { Uri baseAddress=new Uri(&quot;<em>http</em>: //<em>localhost</em>:<em>8888</em>/MortgageService&quot;); ServiceHost serviceHost=";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:63:"comptia-Zertifizierungsprüfung wirklichen Fragen und Antworten";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Chri Christia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 30 Dec 2013 04:35:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:36:"http://a9.com/-/spec/opensearch/1.1/";a:3:{s:12:"totalResults";a:1:{i:0;a:5:{s:4:"data";s:4:"4550";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:10:"startIndex";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:12:"itemsPerPage";a:1:{i:0;a:5:{s:4:"data";s:2:"10";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:12:"content-type";s:28:"text/xml; charset=ISO-8859-1";s:4:"date";s:29:"Wed, 08 Jan 2014 08:48:57 GMT";s:7:"expires";s:2:"-1";s:13:"cache-control";s:18:"private, max-age=0";s:10:"set-cookie";a:2:{i:0;s:143:"PREF=ID=3d5b5928e359260e:FF=0:TM=1389170937:LM=1389170937:S=JnqU7S-MUrTliLpJ; expires=Fri, 08-Jan-2016 08:48:57 GMT; path=/; domain=.google.com";i:1;s:212:"NID=67=eqkaPWrbVl8nT26YEXnC2Mf7UGfQKQA-XsAS1rz-mev6LkfAlyFZzOVw5beygm4ucU8v7TRl1MZjZrNEvgrun2xQiIzcLYMr4N-fW9KK--j-QfZpVCkahwyNUOK1CRbW; expires=Thu, 10-Jul-2014 08:48:57 GMT; path=/; domain=.google.com; HttpOnly";}s:3:"p3p";s:122:"CP="This is not a P3P policy! See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657 for more info."";s:6:"server";s:3:"gws";s:16:"x-xss-protection";s:13:"1; mode=block";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:18:"alternate-protocol";s:7:"80:quic";}s:5:"build";s:14:"20131009162855";}', 'no'),
(2724, '_transient_timeout_feed_77fa140e07ce53fe8c87136636f83d72', '1389214138', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(2725, '_transient_feed_77fa140e07ce53fe8c87136636f83d72', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress Plugins » View: Newest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://wordpress.org/plugins/browse/new/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress Plugins » View: Newest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 08 Jan 2014 08:42:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Rename Users";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://wordpress.org/plugins/rename-users/#post-62526";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 07 Jan 2014 19:57:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62526@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:65:"This plugins allows administrators to rename wordpress usernames.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"quan_flo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Get Json Api";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://wordpress.org/plugins/get-json-api/#post-62480";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 06 Jan 2014 12:00:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62480@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Retrieve the results of the API of a site that uses the plugin JSON API";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"digitalissimo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"wp-parsidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://wordpress.org/plugins/wp-parsidate/#post-62154";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 28 Dec 2013 09:28:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62154@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Persian package builder for WordPress, Full RTL and Shamsi(Jalali) date";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:18:"Morteza Geransayeh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Powie&#039;s WHOIS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://wordpress.org/plugins/powies-whois/#post-62511";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 07 Jan 2014 10:41:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62511@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"Check Domain WHOIS Lookup for avalability. Simple insert the [pwhois] shortcode on a page or post";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"PowieT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"CW World News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/plugins/feedzilla-news/#post-62549";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 08 Jan 2014 03:41:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62549@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:102:"A Feedzilla (<a href="http://feedzilla.com" rel="nofollow">http://feedzilla.com</a>) news feed client.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"wzedi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Opaque Teaser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/plugins/opaque-teaser/#post-62505";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 07 Jan 2014 01:48:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62505@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:70:"Use your template styling to create a semi-transparent teaser overlay.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"mikeselander";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"Kento Ajax Contact Form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/plugins/kento-ajax-contact-form/#post-62477";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 06 Jan 2014 10:00:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62477@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:40:"A simple contact form plugin using AJAX.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"KentoThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"Shortcode Magic";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/plugins/shortcode-magic/#post-62409";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 04 Jan 2014 05:13:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62409@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"A nice and simple plugin of shortcodes.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Friscopolice";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"Facebook Popup Like Box";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/plugins/facebook-popup-box/#post-62493";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 06 Jan 2014 17:15:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62493@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:79:"Shows a facebook like box in a lightbox when a user visits your WordPress site!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"vikas.programmer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"Gravity Forms: Notification Attachments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://wordpress.org/plugins/gravity-forms-notification-attachments/#post-62516";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 07 Jan 2014 12:55:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62516@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:78:"A WordPress addon for Gravity Forms to add attachments to notification emails.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Timothy Wood";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:17:"Content Slideshow";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wordpress.org/plugins/content-slideshow/#post-62473";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 06 Jan 2014 06:30:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62473@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Creates an automatic web-based slideshow that randomly cycles through all of your site&#039;s image content. Includes a slideshow page and a widget an";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Nick Halsey";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Adv Stopwatch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/plugins/adv-stopwatch/#post-62459";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 05 Jan 2014 23:34:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62459@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:35:"An advanced stopwatch for Wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mads Phikamphon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP LocalScroll";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/plugins/wp-localscroll/#post-62468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 06 Jan 2014 04:41:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62468@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:84:"This plugin will animate a regular anchor navigation with a smooth scrolling effect.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"philiprabbett";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"Admin IP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"http://wordpress.org/plugins/admin-ip/#post-62489";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 06 Jan 2014 15:14:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"62489@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"Admin IP - Simply displays your IP Address (and hostname) on the WordPress dashboard admin panel.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"VPN Dock";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:3:"SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.org/plugins/seo-rotator-for-images/#post-61886";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Dec 2013 20:47:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"61886@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:116:"Improve your Website SEO: Write better content and have a fully optimized WordPress site using the Super SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"rajeshseoexpert";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:41:"http://wordpress.org/plugins/rss/view/new";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:7:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Wed, 08 Jan 2014 08:48:58 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Tue, 07 Jan 2014 19:57:59 GMT";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20131009162855";}', 'no'),
(2945, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1390231663', 'yes'),
(2946, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"3898";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"2456";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"2344";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"1930";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"1856";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1583";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1329";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1325";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1310";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1260";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1225";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1121";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1000";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:3:"982";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:3:"974";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:3:"950";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:3:"844";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:3:"821";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:3:"780";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"722";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"686";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"681";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"678";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"623";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"615";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"595";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"572";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"570";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"541";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"539";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"530";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"522";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"506";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"505";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"471";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"458";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"453";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"452";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"436";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"432";}}', 'yes'),
(2846, '_site_transient_timeout_browser_7a17c8e9493739cee7ef87b61cbec035', '1390815017', 'yes'),
(2847, '_site_transient_browser_7a17c8e9493739cee7ef87b61cbec035', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"26.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(3049, '_transient_wc_uf_pid_ef2f9a0a21d40dc3a45fc73eb0188204', 'a:1:{i:0;s:3:"207";}', 'yes'),
(3038, '_transient_wc_uf_pid_6cdbd9b4c60bfbed8d064e16c2bcef47', 'a:1:{i:0;s:3:"207";}', 'yes'),
(3033, '_transient_wc_rating_count_207', '0', 'yes'),
(3034, '_transient_wc_average_rating_207', '', 'yes'),
(3031, '_transient_wc_rating_count_195', '1', 'yes'),
(3032, '_transient_wc_average_rating_195', '4.00', 'yes'),
(3048, '_transient_is_multi_author', '0', 'yes'),
(3039, '_transient_wc_uf_pid_0afc3f2d60dd24de7fee36035289dcc5', 'a:3:{i:0;s:3:"207";i:1;s:3:"205";i:2;s:3:"196";}', 'yes'),
(3020, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1390557179;s:7:"checked";a:9:{s:24:"buddypress/bp-loader.php";s:5:"1.9.1";s:21:"budkutil/budkutil.php";s:3:"0.2";s:47:"regenerate-thumbnails/regenerate-thumbnails.php";s:5:"2.2.4";s:37:"tinymce-advanced/tinymce-advanced.php";s:7:"3.5.9.1";s:27:"woocommerce/woocommerce.php";s:6:"2.0.20";s:41:"wc4bp-basic-integration/bpshop-loader.php";s:5:"1.2.1";s:45:"wp-admin-bar-removal/wp-admin-bar-removal.php";s:14:"2013.0624.0361";s:33:"wp-breadcrumbs/wp_breadcrumbs.php";s:3:"1.0";s:32:"xml-sitemap-feed/xml-sitemap.php";s:5:"4.3.2";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=536 ;

--
-- Vypisuji data pro tabulku `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(9, 8, '_edit_last', '1'),
(10, 8, '_edit_lock', '1361281076:1'),
(332, 155, '_menu_item_object', 'page'),
(331, 155, '_menu_item_object_id', '152'),
(330, 155, '_menu_item_menu_item_parent', '0'),
(329, 155, '_menu_item_type', 'post_type'),
(328, 152, '_wp_page_template', 'default'),
(31, 13, '_edit_last', '1'),
(373, 195, '_downloadable', 'no'),
(372, 195, 'total_sales', '0'),
(371, 195, '_stock_status', 'instock'),
(370, 195, '_visibility', 'visible'),
(369, 195, '_edit_lock', '1390304060:1'),
(368, 195, '_edit_last', '1'),
(32, 13, '_edit_lock', '1361282820:1'),
(33, 14, '_wp_attached_file', 'IMG_20130206_121951.jpg'),
(34, 14, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2592;s:6:"height";i:1944;s:4:"file";s:23:"IMG_20130206_121951.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"IMG_20130206_121951-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:31:"IMG_20130206_121951-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:32:"IMG_20130206_121951-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:31:"IMG_20130206_121951-624x468.jpg";s:5:"width";i:624;s:6:"height";i:468;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"IMG_20130206_121951-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"IMG_20130206_121951-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"IMG_20130206_121951-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:2.75;s:6:"credit";s:0:"";s:6:"camera";s:12:"Galaxy Nexus";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1360153191;s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"3.43";s:3:"iso";s:3:"100";s:13:"shutter_speed";s:8:"0.029997";s:5:"title";s:0:"";}}'),
(99, 8, '_thumbnail_id', '37'),
(104, 40, '_wp_attached_file', 'nastroje.jpg'),
(89, 33, '_edit_lock', '1361279990:1'),
(90, 33, '_edit_last', '1'),
(97, 37, '_wp_attached_file', 'siti-kuze1.jpg'),
(98, 37, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1600;s:6:"height";i:615;s:4:"file";s:14:"siti-kuze1.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"siti-kuze1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"siti-kuze1-300x115.jpg";s:5:"width";i:300;s:6:"height";i:115;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"siti-kuze1-1024x393.jpg";s:5:"width";i:1024;s:6:"height";i:393;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:22:"siti-kuze1-624x239.jpg";s:5:"width";i:624;s:6:"height";i:239;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"siti-kuze1-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:22:"siti-kuze1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:22:"siti-kuze1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(91, 33, '_wp_attachment_backup_sizes', 'a:5:{s:9:"full-orig";a:3:{s:5:"width";i:1600;s:6:"height";i:1067;s:4:"file";s:13:"siti-kuze.jpg";}s:14:"thumbnail-orig";a:4:{s:4:"file";s:21:"siti-kuze-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:11:"medium-orig";a:4:{s:4:"file";s:21:"siti-kuze-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:10:"large-orig";a:4:{s:4:"file";s:22:"siti-kuze-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:19:"post-thumbnail-orig";a:4:{s:4:"file";s:21:"siti-kuze-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}'),
(85, 33, '_wp_attached_file', 'siti-kuze-e1361279987284.jpg'),
(86, 33, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1600;s:6:"height";i:576;s:4:"file";s:28:"siti-kuze-e1361279987284.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:36:"siti-kuze-e1361279987284-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:36:"siti-kuze-e1361279987284-300x108.jpg";s:5:"width";i:300;s:6:"height";i:108;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:37:"siti-kuze-e1361279987284-1024x368.jpg";s:5:"width";i:1024;s:6:"height";i:368;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"siti-kuze-e1361279987284-624x224.jpg";s:5:"width";i:624;s:6:"height";i:224;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:34:"siti-kuze-e1361279987284-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:36:"siti-kuze-e1361279987284-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:36:"siti-kuze-e1361279987284-600x576.jpg";s:5:"width";i:600;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(105, 40, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2000;s:6:"height";i:803;s:4:"file";s:12:"nastroje.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"nastroje-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"nastroje-300x120.jpg";s:5:"width";i:300;s:6:"height";i:120;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:21:"nastroje-1024x411.jpg";s:5:"width";i:1024;s:6:"height";i:411;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:20:"nastroje-624x250.jpg";s:5:"width";i:624;s:6:"height";i:250;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:18:"nastroje-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"nastroje-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"nastroje-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(106, 13, '_thumbnail_id', '40'),
(110, 42, '_edit_lock', '1364309029:1'),
(109, 42, '_edit_last', '1'),
(111, 43, '_wp_attached_file', 'IMG_20130206_115707.jpg'),
(112, 43, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2592;s:6:"height";i:1944;s:4:"file";s:23:"IMG_20130206_115707.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"IMG_20130206_115707-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:31:"IMG_20130206_115707-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:32:"IMG_20130206_115707-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:31:"IMG_20130206_115707-624x468.jpg";s:5:"width";i:624;s:6:"height";i:468;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"IMG_20130206_115707-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"IMG_20130206_115707-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"IMG_20130206_115707-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:2.75;s:6:"credit";s:0:"";s:6:"camera";s:12:"Galaxy Nexus";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1360151827;s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"3.43";s:3:"iso";s:2:"64";s:13:"shutter_speed";s:8:"0.019998";s:5:"title";s:0:"";}}'),
(113, 44, '_wp_attached_file', 'IMG_20130206_115717.jpg'),
(114, 44, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2592;s:6:"height";i:1944;s:4:"file";s:23:"IMG_20130206_115717.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"IMG_20130206_115717-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:31:"IMG_20130206_115717-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:32:"IMG_20130206_115717-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:31:"IMG_20130206_115717-624x468.jpg";s:5:"width";i:624;s:6:"height";i:468;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"IMG_20130206_115717-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"IMG_20130206_115717-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"IMG_20130206_115717-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:2.75;s:6:"credit";s:0:"";s:6:"camera";s:12:"Galaxy Nexus";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1360151837;s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"3.43";s:3:"iso";s:2:"80";s:13:"shutter_speed";s:8:"0.009999";s:5:"title";s:0:"";}}'),
(117, 46, '_wp_attached_file', 'kozeluzna.jpg'),
(118, 46, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2054;s:6:"height";i:612;s:4:"file";s:13:"kozeluzna.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"kozeluzna-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"kozeluzna-300x89.jpg";s:5:"width";i:300;s:6:"height";i:89;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:22:"kozeluzna-1024x305.jpg";s:5:"width";i:1024;s:6:"height";i:305;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:21:"kozeluzna-624x185.jpg";s:5:"width";i:624;s:6:"height";i:185;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:19:"kozeluzna-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:21:"kozeluzna-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:21:"kozeluzna-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(119, 42, '_thumbnail_id', '46'),
(123, 49, '_edit_lock', '1361285109:1'),
(122, 49, '_edit_last', '1'),
(124, 50, '_wp_attached_file', 'kladivko-s-klestemi.jpg'),
(125, 51, '_wp_attached_file', 'kladivko-s-klestemi1.jpg'),
(126, 51, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:1024;s:4:"file";s:24:"kladivko-s-klestemi1.jpg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:32:"kladivko-s-klestemi1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:32:"kladivko-s-klestemi1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:32:"kladivko-s-klestemi1-624x624.jpg";s:5:"width";i:624;s:6:"height";i:624;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:30:"kladivko-s-klestemi1-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:32:"kladivko-s-klestemi1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:32:"kladivko-s-klestemi1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(127, 52, '_wp_attached_file', 'kleste-kopyto.jpg'),
(128, 52, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1300;s:6:"height";i:300;s:4:"file";s:17:"kleste-kopyto.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"kleste-kopyto-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"kleste-kopyto-300x69.jpg";s:5:"width";i:300;s:6:"height";i:69;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:26:"kleste-kopyto-1024x236.jpg";s:5:"width";i:1024;s:6:"height";i:236;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:25:"kleste-kopyto-624x144.jpg";s:5:"width";i:624;s:6:"height";i:144;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:23:"kleste-kopyto-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:25:"kleste-kopyto-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:25:"kleste-kopyto-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(132, 55, '_wp_attached_file', 'kopyto3.jpg'),
(133, 55, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1067;s:6:"height";i:300;s:4:"file";s:11:"kopyto3.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"kopyto3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"kopyto3-300x84.jpg";s:5:"width";i:300;s:6:"height";i:84;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"kopyto3-1024x287.jpg";s:5:"width";i:1024;s:6:"height";i:287;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"kopyto3-624x175.jpg";s:5:"width";i:624;s:6:"height";i:175;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"kopyto3-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"kopyto3-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"kopyto3-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(134, 49, '_thumbnail_id', '55'),
(143, 60, '_edit_last', '1'),
(144, 60, '_edit_lock', '1361354573:1'),
(145, 61, '_wp_attached_file', 'oliver-rabbath.jpg'),
(146, 61, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1200;s:6:"height";i:300;s:4:"file";s:18:"oliver-rabbath.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"oliver-rabbath-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"oliver-rabbath-300x75.jpg";s:5:"width";i:300;s:6:"height";i:75;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:27:"oliver-rabbath-1024x256.jpg";s:5:"width";i:1024;s:6:"height";i:256;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:26:"oliver-rabbath-624x156.jpg";s:5:"width";i:624;s:6:"height";i:156;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:24:"oliver-rabbath-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:26:"oliver-rabbath-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:26:"oliver-rabbath-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(147, 60, '_thumbnail_id', '61'),
(151, 64, '_edit_lock', '1361287405:1'),
(150, 64, '_edit_last', '1'),
(152, 65, '_wp_attached_file', 'Snímek-obrazovky-2013-02-19-v 16.28.30.png'),
(153, 65, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1061;s:6:"height";i:348;s:4:"file";s:45:"Snímek-obrazovky-2013-02-19-v 16.28.30.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.28.30-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:52:"Snímek-obrazovky-2013-02-19-v 16.28.30-300x98.png";s:5:"width";i:300;s:6:"height";i:98;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:54:"Snímek-obrazovky-2013-02-19-v 16.28.30-1024x335.png";s:5:"width";i:1024;s:6:"height";i:335;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.28.30-624x204.png";s:5:"width";i:624;s:6:"height";i:204;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:51:"Snímek-obrazovky-2013-02-19-v 16.28.30-90x90.png";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.28.30-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.28.30-600x348.png";s:5:"width";i:600;s:6:"height";i:348;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(154, 64, '_thumbnail_id', '65'),
(159, 68, '_wp_attached_file', 'jak-usit-goticke-boty.pdf'),
(167, 72, '_edit_lock', '1364308964:1'),
(166, 72, '_edit_last', '1'),
(168, 73, '_wp_attached_file', 'Snímek-obrazovky-2013-02-19-v 16.27.45.png'),
(169, 73, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:394;s:6:"height";i:540;s:4:"file";s:45:"Snímek-obrazovky-2013-02-19-v 16.27.45.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.27.45-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.27.45-218x300.png";s:5:"width";i:218;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:51:"Snímek-obrazovky-2013-02-19-v 16.27.45-90x90.png";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.27.45-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(170, 74, '_wp_attached_file', 'Snímek-obrazovky-2013-02-19-v 16.27.38.png'),
(171, 74, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:397;s:6:"height";i:634;s:4:"file";s:45:"Snímek-obrazovky-2013-02-19-v 16.27.38.png";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.27.38-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.27.38-187x300.png";s:5:"width";i:187;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:51:"Snímek-obrazovky-2013-02-19-v 16.27.38-90x90.png";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.27.38-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.27.38-397x600.png";s:5:"width";i:397;s:6:"height";i:600;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(172, 75, '_wp_attached_file', 'nakresybot1.jpg'),
(173, 75, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:325;s:6:"height";i:698;s:4:"file";s:15:"nakresybot1.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"nakresybot1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"nakresybot1-139x300.jpg";s:5:"width";i:139;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:21:"nakresybot1-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:23:"nakresybot1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:23:"nakresybot1-325x600.jpg";s:5:"width";i:325;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(174, 76, '_wp_attached_file', 'nakresybot2.jpg'),
(175, 76, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:491;s:6:"height";i:489;s:4:"file";s:15:"nakresybot2.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"nakresybot2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"nakresybot2-300x298.jpg";s:5:"width";i:300;s:6:"height";i:298;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:21:"nakresybot2-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:23:"nakresybot2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(176, 77, '_wp_attached_file', 'nakresybot3.jpg'),
(177, 77, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:586;s:6:"height";i:800;s:4:"file";s:15:"nakresybot3.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"nakresybot3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"nakresybot3-219x300.jpg";s:5:"width";i:219;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:21:"nakresybot3-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:23:"nakresybot3-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:23:"nakresybot3-586x600.jpg";s:5:"width";i:586;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(178, 78, '_wp_attached_file', 'nakresybot4.jpg'),
(179, 78, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1168;s:6:"height";i:1081;s:4:"file";s:15:"nakresybot4.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"nakresybot4-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"nakresybot4-300x277.jpg";s:5:"width";i:300;s:6:"height";i:277;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:24:"nakresybot4-1024x947.jpg";s:5:"width";i:1024;s:6:"height";i:947;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:23:"nakresybot4-624x577.jpg";s:5:"width";i:624;s:6:"height";i:577;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:21:"nakresybot4-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:23:"nakresybot4-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:23:"nakresybot4-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(184, 81, '_wp_attached_file', 'Snímek-obrazovky-2013-02-19-v 16.54.05.png'),
(185, 81, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1030;s:6:"height";i:324;s:4:"file";s:45:"Snímek-obrazovky-2013-02-19-v 16.54.05.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.54.05-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:52:"Snímek-obrazovky-2013-02-19-v 16.54.05-300x94.png";s:5:"width";i:300;s:6:"height";i:94;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:54:"Snímek-obrazovky-2013-02-19-v 16.54.05-1024x322.png";s:5:"width";i:1024;s:6:"height";i:322;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.54.05-624x196.png";s:5:"width";i:624;s:6:"height";i:196;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:51:"Snímek-obrazovky-2013-02-19-v 16.54.05-90x90.png";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.54.05-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-19-v 16.54.05-600x324.png";s:5:"width";i:600;s:6:"height";i:324;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(186, 72, '_thumbnail_id', '81'),
(192, 84, '_edit_lock', '1361351705:1'),
(191, 84, '_edit_last', '1'),
(206, 93, '_wp_attached_file', 'Snímek-obrazovky-2013-02-20-v 9.29.43.png'),
(201, 89, '_edit_lock', '1361348241:1'),
(200, 89, '_edit_last', '1'),
(207, 93, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1238;s:6:"height";i:401;s:4:"file";s:44:"Snímek-obrazovky-2013-02-20-v 9.29.43.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:52:"Snímek-obrazovky-2013-02-20-v 9.29.43-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:51:"Snímek-obrazovky-2013-02-20-v 9.29.43-300x97.png";s:5:"width";i:300;s:6:"height";i:97;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-02-20-v 9.29.43-1024x331.png";s:5:"width";i:1024;s:6:"height";i:331;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:52:"Snímek-obrazovky-2013-02-20-v 9.29.43-624x202.png";s:5:"width";i:624;s:6:"height";i:202;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:50:"Snímek-obrazovky-2013-02-20-v 9.29.43-90x90.png";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:52:"Snímek-obrazovky-2013-02-20-v 9.29.43-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:52:"Snímek-obrazovky-2013-02-20-v 9.29.43-600x401.png";s:5:"width";i:600;s:6:"height";i:401;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(208, 84, '_thumbnail_id', '93'),
(235, 108, '_edit_last', '1'),
(236, 108, '_edit_lock', '1364308864:1'),
(237, 109, '_wp_attached_file', 'Snímek-obrazovky-2013-03-06-v 11.10.50.png'),
(238, 109, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1249;s:6:"height";i:525;s:4:"file";s:45:"Snímek-obrazovky-2013-03-06-v 11.10.50.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.10.50-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.10.50-300x126.png";s:5:"width";i:300;s:6:"height";i:126;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:54:"Snímek-obrazovky-2013-03-06-v 11.10.50-1024x430.png";s:5:"width";i:1024;s:6:"height";i:430;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.10.50-624x262.png";s:5:"width";i:624;s:6:"height";i:262;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:51:"Snímek-obrazovky-2013-03-06-v 11.10.50-90x90.png";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.10.50-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.10.50-600x525.png";s:5:"width";i:600;s:6:"height";i:525;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(239, 108, '_thumbnail_id', '109'),
(248, 115, '_edit_last', '1'),
(249, 115, '_edit_lock', '1362564473:1'),
(252, 117, '_wp_attached_file', 'Snímek-obrazovky-2013-03-06-v 11.18.35.png'),
(253, 117, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1440;s:6:"height";i:601;s:4:"file";s:45:"Snímek-obrazovky-2013-03-06-v 11.18.35.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.18.35-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.18.35-300x125.png";s:5:"width";i:300;s:6:"height";i:125;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:54:"Snímek-obrazovky-2013-03-06-v 11.18.35-1024x427.png";s:5:"width";i:1024;s:6:"height";i:427;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.18.35-624x260.png";s:5:"width";i:624;s:6:"height";i:260;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:51:"Snímek-obrazovky-2013-03-06-v 11.18.35-90x90.png";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.18.35-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.18.35-600x600.png";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(254, 115, '_thumbnail_id', '117'),
(319, 149, '_edit_lock', '1367513142:1'),
(318, 149, '_wp_page_template', 'default'),
(317, 149, '_edit_last', '1'),
(316, 145, '_wp_page_template', 'page-templates/full-width.php'),
(315, 145, '_edit_lock', '1390216987:1'),
(314, 145, '_edit_last', '1'),
(266, 120, '_edit_last', '1'),
(267, 120, '_edit_lock', '1364308864:1'),
(270, 123, '_wp_attached_file', 'Snímek-obrazovky-2013-03-06-v 11.25.36.png'),
(271, 123, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1195;s:6:"height";i:475;s:4:"file";s:45:"Snímek-obrazovky-2013-03-06-v 11.25.36.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.25.36-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.25.36-300x119.png";s:5:"width";i:300;s:6:"height";i:119;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:54:"Snímek-obrazovky-2013-03-06-v 11.25.36-1024x407.png";s:5:"width";i:1024;s:6:"height";i:407;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.25.36-624x248.png";s:5:"width";i:624;s:6:"height";i:248;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:51:"Snímek-obrazovky-2013-03-06-v 11.25.36-90x90.png";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.25.36-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:53:"Snímek-obrazovky-2013-03-06-v 11.25.36-600x475.png";s:5:"width";i:600;s:6:"height";i:475;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(272, 120, '_thumbnail_id', '123'),
(286, 120, '_wp_old_slug', 'kreativne-tvorit-muzeme-z-vsech-kousku-dreva'),
(281, 108, '_wp_old_slug', 'mysakovy-dobroty-muj-obchudek-na-fler-cz'),
(293, 138, '_edit_last', '1'),
(294, 138, '_edit_lock', '1368609522:1'),
(295, 138, '_wp_page_template', 'page-templates/full-width.php'),
(296, 140, '_edit_last', '1'),
(297, 140, '_wp_page_template', 'default'),
(298, 140, '_edit_lock', '1368609500:1'),
(299, 136, '_edit_lock', '1367491260:1'),
(300, 136, '_edit_last', '1'),
(301, 136, '_wp_page_template', 'default'),
(302, 137, '_edit_lock', '1368609526:1'),
(303, 137, '_edit_last', '1'),
(304, 137, '_wp_page_template', 'default'),
(327, 153, '_edit_lock', '1368609513:1'),
(326, 153, '_wp_page_template', 'default'),
(325, 153, '_edit_last', '1'),
(324, 152, '_edit_lock', '1368609508:1'),
(323, 152, '_edit_last', '1'),
(322, 151, '_edit_lock', '1368609517:1'),
(320, 151, '_edit_last', '1'),
(321, 151, '_wp_page_template', 'default'),
(333, 155, '_menu_item_target', ''),
(334, 155, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(335, 155, '_menu_item_xfn', ''),
(336, 155, '_menu_item_url', ''),
(338, 156, '_menu_item_type', 'post_type'),
(339, 156, '_menu_item_menu_item_parent', '0'),
(340, 156, '_menu_item_object_id', '153'),
(341, 156, '_menu_item_object', 'page'),
(342, 156, '_menu_item_target', ''),
(343, 156, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(344, 156, '_menu_item_xfn', ''),
(345, 156, '_menu_item_url', ''),
(347, 157, '_menu_item_type', 'post_type'),
(348, 157, '_menu_item_menu_item_parent', '0'),
(349, 157, '_menu_item_object_id', '151'),
(350, 157, '_menu_item_object', 'page'),
(351, 157, '_menu_item_target', ''),
(352, 157, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(353, 157, '_menu_item_xfn', ''),
(354, 157, '_menu_item_url', ''),
(356, 192, '_edit_lock', '1390217008:1'),
(357, 192, '_edit_last', '1'),
(358, 192, '_wp_page_template', 'page-templates/products.php'),
(359, 194, '_menu_item_type', 'post_type'),
(360, 194, '_menu_item_menu_item_parent', '0'),
(361, 194, '_menu_item_object_id', '192'),
(362, 194, '_menu_item_object', 'page'),
(363, 194, '_menu_item_target', ''),
(364, 194, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(365, 194, '_menu_item_xfn', ''),
(366, 194, '_menu_item_url', ''),
(374, 195, '_virtual', 'no'),
(375, 195, '_product_image_gallery', '93,123,117'),
(376, 195, '_regular_price', ''),
(377, 195, '_sale_price', ''),
(378, 195, '_purchase_note', ''),
(379, 195, '_featured', 'no'),
(380, 195, '_weight', ''),
(381, 195, '_length', ''),
(382, 195, '_width', ''),
(383, 195, '_height', ''),
(384, 195, '_sku', ''),
(385, 195, '_product_attributes', 'a:0:{}'),
(386, 195, '_sale_price_dates_from', ''),
(387, 195, '_sale_price_dates_to', ''),
(388, 195, '_price', ''),
(389, 195, '_sold_individually', ''),
(390, 195, '_stock', ''),
(391, 195, '_backorders', 'no'),
(392, 195, '_manage_stock', 'no'),
(393, 196, '_edit_last', '1'),
(394, 196, '_edit_lock', '1390304060:1'),
(519, 196, '_thumbnail_id', '216'),
(396, 196, '_visibility', 'visible'),
(397, 196, '_stock_status', 'instock'),
(398, 196, 'total_sales', '0'),
(399, 196, '_downloadable', 'no'),
(400, 196, '_virtual', 'no'),
(401, 196, '_product_image_gallery', '77,81,78'),
(402, 196, '_regular_price', ''),
(403, 196, '_sale_price', ''),
(404, 196, '_purchase_note', ''),
(405, 196, '_featured', 'no'),
(406, 196, '_weight', ''),
(407, 196, '_length', ''),
(408, 196, '_width', ''),
(409, 196, '_height', ''),
(410, 196, '_sku', ''),
(411, 196, '_product_attributes', 'a:0:{}'),
(412, 196, '_sale_price_dates_from', ''),
(413, 196, '_sale_price_dates_to', ''),
(414, 196, '_price', ''),
(415, 196, '_sold_individually', ''),
(416, 196, '_stock', ''),
(417, 196, '_backorders', 'no'),
(418, 196, '_manage_stock', 'no'),
(520, 195, '_thumbnail_id', '214'),
(420, 202, '_edit_lock', '1390478836:1'),
(421, 202, '_edit_last', '1'),
(422, 202, '_wp_page_template', 'page-templates/new-product.php'),
(493, 145, '_wp_trash_meta_status', 'publish'),
(492, 201, '_wp_trash_meta_time', '1390217050'),
(491, 201, '_wp_trash_meta_status', 'private'),
(490, 201, '_edit_lock', '1390217045:1'),
(489, 179, '_edit_lock', '1390217212:1'),
(432, 205, '_product_image_gallery', '109,93'),
(433, 205, '_regular_price', '300'),
(434, 205, '_stock', '1'),
(435, 205, '_manage_stock', 'yes'),
(436, 205, '_stock_status', 'instock'),
(521, 205, '_thumbnail_id', '219'),
(438, 205, '_edit_lock', '1390304061:1'),
(439, 205, '_edit_last', '1'),
(440, 205, '_visibility', 'visible'),
(441, 205, 'total_sales', '0'),
(442, 205, '_downloadable', 'no'),
(443, 205, '_virtual', 'no'),
(444, 205, '_sale_price', ''),
(445, 205, '_purchase_note', ''),
(446, 205, '_featured', 'no'),
(447, 205, '_weight', ''),
(448, 205, '_length', ''),
(449, 205, '_width', ''),
(450, 205, '_height', ''),
(451, 205, '_sku', ''),
(452, 205, '_product_attributes', 'a:0:{}'),
(453, 205, '_sale_price_dates_from', ''),
(454, 205, '_sale_price_dates_to', ''),
(455, 205, '_price', '300'),
(456, 205, '_sold_individually', ''),
(457, 205, '_backorders', 'no'),
(458, 206, '_product_image_gallery', ''),
(459, 206, '_regular_price', ''),
(460, 206, '_stock', '1'),
(461, 206, '_manage_stock', 'yes'),
(462, 206, '_stock_status', 'instock'),
(463, 207, '_product_image_gallery', '212,213,214,215,216,217,218,219,220'),
(464, 207, '_regular_price', '54498'),
(465, 207, '_stock', '3'),
(466, 207, '_manage_stock', 'yes'),
(467, 207, '_stock_status', 'instock'),
(468, 207, '_thumbnail_id', '221'),
(469, 207, '_edit_lock', '1390304060:1'),
(470, 207, '_edit_last', '1'),
(471, 207, '_visibility', 'visible'),
(472, 207, 'total_sales', '0'),
(473, 207, '_downloadable', 'no'),
(474, 207, '_virtual', 'no'),
(475, 207, '_sale_price', ''),
(476, 207, '_purchase_note', ''),
(477, 207, '_featured', 'no'),
(478, 207, '_weight', ''),
(479, 207, '_length', ''),
(480, 207, '_width', ''),
(481, 207, '_height', ''),
(482, 207, '_sku', 'KATČ1234'),
(483, 207, '_product_attributes', 'a:3:{s:15:"vlastnost-prvni";a:6:{s:4:"name";s:16:"Vlastnost první";s:5:"value";s:14:"Hodnota první";s:8:"position";s:1:"0";s:10:"is_visible";i:1;s:12:"is_variation";i:0;s:11:"is_taxonomy";i:0;}s:15:"vlastnost-druha";a:6:{s:4:"name";s:16:"Vlastnost druhá";s:5:"value";s:20:"hodnota vlastnosti 2";s:8:"position";s:1:"1";s:10:"is_visible";i:1;s:12:"is_variation";i:0;s:11:"is_taxonomy";i:0;}s:17:"vlastnost-cislo-3";a:6:{s:4:"name";s:19:"Vlastnost číslo 3";s:5:"value";s:13:"HOdnota 3-tí";s:8:"position";s:1:"2";s:10:"is_visible";i:0;s:12:"is_variation";i:0;s:11:"is_taxonomy";i:0;}}'),
(484, 207, '_sale_price_dates_from', ''),
(485, 207, '_sale_price_dates_to', ''),
(486, 207, '_price', '54498'),
(487, 207, '_sold_individually', ''),
(488, 207, '_backorders', 'no'),
(494, 145, '_wp_trash_meta_time', '1390217106'),
(495, 179, '_edit_last', '1'),
(496, 212, '_wp_attached_file', 'MG_9836.jpg'),
(497, 212, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1498;s:6:"height";i:2246;s:4:"file";s:11:"MG_9836.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9836-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9836-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9836-682x1024.jpg";s:5:"width";i:682;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9836-624x935.jpg";s:5:"width";i:624;s:6:"height";i:935;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9836-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9836-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9836-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:2.79999999999999982236431605997495353221893310546875;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383730165;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:0:"";}}'),
(498, 213, '_wp_attached_file', 'MG_9846.jpg'),
(499, 213, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1498;s:6:"height";i:2246;s:4:"file";s:11:"MG_9846.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9846-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9846-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9846-682x1024.jpg";s:5:"width";i:682;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9846-624x935.jpg";s:5:"width";i:624;s:6:"height";i:935;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9846-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9846-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9846-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:6.29999999999999982236431605997495353221893310546875;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383730254;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:4:"0.01";s:5:"title";s:0:"";}}'),
(500, 214, '_wp_attached_file', 'MG_9849.jpg'),
(501, 214, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1123;s:6:"height";i:749;s:4:"file";s:11:"MG_9849.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9849-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9849-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9849-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9849-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9849-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9849-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9849-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:5;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383730296;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:4:"0.01";s:5:"title";s:0:"";}}'),
(502, 215, '_wp_attached_file', 'MG_9851.jpg'),
(503, 215, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2246;s:6:"height";i:1498;s:4:"file";s:11:"MG_9851.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9851-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9851-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9851-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9851-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9851-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9851-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9851-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:5;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383730348;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:4:"0.01";s:5:"title";s:0:"";}}'),
(504, 216, '_wp_attached_file', 'MG_9858.jpg'),
(505, 216, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2246;s:6:"height";i:1498;s:4:"file";s:11:"MG_9858.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9858-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9858-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9858-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9858-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9858-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9858-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9858-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:5;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383730483;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:0:"";}}'),
(506, 217, '_wp_attached_file', 'MG_9873.jpg');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(507, 217, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2246;s:6:"height";i:1498;s:4:"file";s:11:"MG_9873.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9873-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9873-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9873-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9873-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9873-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9873-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9873-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:4.5;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383730698;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:0:"";}}'),
(508, 218, '_wp_attached_file', 'MG_9915.jpg'),
(509, 218, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2246;s:6:"height";i:1498;s:4:"file";s:11:"MG_9915.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9915-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9915-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9915-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9915-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9915-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9915-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9915-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:4;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383731179;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:6:"0.0125";s:5:"title";s:0:"";}}'),
(510, 219, '_wp_attached_file', 'MG_9934.jpg'),
(511, 219, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2246;s:6:"height";i:1498;s:4:"file";s:11:"MG_9934.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9934-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9934-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9934-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9934-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9934-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9934-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9934-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:7.0999999999999996447286321199499070644378662109375;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383731399;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:0:"";}}'),
(512, 220, '_wp_attached_file', 'MG_9936.jpg'),
(513, 220, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2246;s:6:"height";i:1498;s:4:"file";s:11:"MG_9936.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"MG_9936-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"MG_9936-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"MG_9936-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"MG_9936-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"MG_9936-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"MG_9936-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"MG_9936-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:7.0999999999999996447286321199499070644378662109375;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1383731412;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:0:"";}}'),
(514, 221, '_wp_attached_file', 'MG_5956a.jpg'),
(515, 221, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1280;s:6:"height";i:853;s:4:"file";s:12:"MG_5956a.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"MG_5956a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"MG_5956a-300x199.jpg";s:5:"width";i:300;s:6:"height";i:199;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:21:"MG_5956a-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:20:"MG_5956a-624x415.jpg";s:5:"width";i:624;s:6:"height";i:415;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:18:"MG_5956a-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"MG_5956a-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"MG_5956a-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:3.5;s:6:"credit";s:13:"Richard Frydl";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1385904354;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"85";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:0:"";}}'),
(516, 50, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:1024;s:4:"file";s:23:"kladivko-s-klestemi.jpg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"kladivko-s-klestemi-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:31:"kladivko-s-klestemi-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:31:"kladivko-s-klestemi-624x624.jpg";s:5:"width";i:624;s:6:"height";i:624;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"kladivko-s-klestemi-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"kladivko-s-klestemi-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"kladivko-s-klestemi-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(517, 206, '_wp_trash_meta_status', 'draft'),
(518, 206, '_wp_trash_meta_time', '1390221501'),
(522, 227, '_wp_attached_file', '1390388138__DSC2637.JPG'),
(523, 227, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4256;s:6:"height";i:2832;s:4:"file";s:23:"1390388138__DSC2637.JPG";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"1390388138__DSC2637-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:31:"1390388138__DSC2637-300x199.jpg";s:5:"width";i:300;s:6:"height";i:199;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:32:"1390388138__DSC2637-1024x681.jpg";s:5:"width";i:1024;s:6:"height";i:681;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:31:"1390388138__DSC2637-624x415.jpg";s:5:"width";i:624;s:6:"height";i:415;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"1390388138__DSC2637-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"1390388138__DSC2637-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"1390388138__DSC2637-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:14;s:6:"credit";s:0:"";s:6:"camera";s:10:"NIKON D700";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1214189589;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"50";s:3:"iso";s:3:"320";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:0:"";}}'),
(524, 228, '_wp_attached_file', '1390388138_IMG_20140106_151138.jpg'),
(525, 228, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1944;s:6:"height";i:2592;s:4:"file";s:34:"1390388138_IMG_20140106_151138.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:42:"1390388138_IMG_20140106_151138-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:42:"1390388138_IMG_20140106_151138-225x300.jpg";s:5:"width";i:225;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:43:"1390388138_IMG_20140106_151138-768x1024.jpg";s:5:"width";i:768;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:42:"1390388138_IMG_20140106_151138-624x832.jpg";s:5:"width";i:624;s:6:"height";i:832;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:40:"1390388138_IMG_20140106_151138-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:42:"1390388138_IMG_20140106_151138-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:42:"1390388138_IMG_20140106_151138-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:2.75;s:6:"credit";s:0:"";s:6:"camera";s:12:"Galaxy Nexus";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1389021098;s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"3.43";s:3:"iso";s:3:"100";s:13:"shutter_speed";s:8:"0.029997";s:5:"title";s:0:"";}}'),
(526, 229, '_wp_attached_file', '1390388138_pasek-16cm.jpg'),
(527, 229, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:518;s:6:"height";i:389;s:4:"file";s:25:"1390388138_pasek-16cm.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"1390388138_pasek-16cm-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:33:"1390388138_pasek-16cm-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:31:"1390388138_pasek-16cm-90x90.jpg";s:5:"width";i:90;s:6:"height";i:90;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:33:"1390388138_pasek-16cm-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:2.75;s:6:"credit";s:0:"";s:6:"camera";s:12:"Galaxy Nexus";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1386255914;s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"3.43";s:3:"iso";s:2:"80";s:13:"shutter_speed";s:16:"0.00999900009999";s:5:"title";s:0:"";}}'),
(528, 226, '_product_image_gallery', '227,228,229'),
(529, 226, '_regular_price', '234'),
(530, 226, '_stock', '2'),
(531, 226, '_manage_stock', 'yes'),
(532, 226, '_stock_status', 'instock'),
(533, 226, '_thumbnail_id', '229'),
(534, 230, '_wp_attached_file', '1390479432_modra.png'),
(535, 230, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:50;s:6:"height";i:50;s:4:"file";s:20:"1390479432_modra.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=231 ;

--
-- Vypisuji data pro tabulku `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(8, 1, '2013-02-19 11:58:58', '2013-02-19 11:58:58', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'publish', 'open', 'open', '', 'siti-kuze', '', '', '2013-02-19 13:35:43', '2013-02-19 13:35:43', '', 0, 'http://localhost:8888/?p=8', 0, 'post', '', 0),
(9, 1, '2013-02-19 11:58:34', '2013-02-19 11:58:34', '<h2>Šití kůže rovným stehem</h2>\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\n\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\n\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\nhttp://www.youtube.com/watch?v=olkoTw7izgA\n<h2>Šití kůže baseball stehem (do kříže)</h2>\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision', '', '', '2013-02-19 11:58:34', '2013-02-19 11:58:34', '', 8, 'http://localhost:8888/8-revision/', 0, 'revision', '', 0),
(10, 1, '2013-02-19 13:23:44', '2013-02-19 13:23:44', '<h2>Šití kůže rovným stehem</h2>\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\n\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\n\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\n\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\n<h2>Šití kůže baseball stehem (do kříže)</h2>\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-autosave', '', '', '2013-02-19 13:23:44', '2013-02-19 13:23:44', '', 8, 'http://localhost:8888/8-autosave/', 0, 'revision', '', 0),
(146, 1, '2013-05-02 11:29:56', '2013-05-02 11:29:56', '', 'Úvodní stránka', '', 'inherit', 'open', 'open', '', '145-revision-v1', '', '', '2013-05-02 11:29:56', '2013-05-02 11:29:56', '', 145, 'http://localhost:8888/145-revision/', 0, 'revision', '', 0),
(195, 1, '2013-10-22 13:37:11', '2013-10-22 13:37:11', '', 'Testovací produkt', '', 'publish', 'open', 'closed', '', 'testovaci-produkt', '', '', '2014-01-20 12:38:58', '2014-01-20 12:38:58', '', 0, 'http://localhost:8888/?post_type=product&#038;p=195', 0, 'product', '', 1),
(13, 1, '2013-02-19 12:10:39', '2013-02-19 12:10:39', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>\r\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'publish', 'open', 'open', '', 'potreby-pro-siti-kuze', '', '', '2013-02-19 13:58:06', '2013-02-19 13:58:06', '', 0, 'http://localhost:8888/?p=13', 0, 'post', '', 0),
(14, 1, '2013-02-19 12:09:54', '2013-02-19 12:09:54', '', 'Obrábění kůže', 'Vybavení mojí dílny', 'inherit', 'open', 'open', '', 'img_20130206_121951', '', '', '2013-02-19 12:09:54', '2013-02-19 12:09:54', '', 13, 'http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg', 0, 'attachment', 'image/jpeg', 0),
(15, 1, '2013-02-19 12:09:21', '2013-02-19 12:09:21', '<h2>Kompletní vybavení dílny</h2>\nKompletní vybavení dílny, vysvětlení anglicky.\n\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\n<h2>Vybavení dílny na obrábění kůže</h2>\nCo jsem v českých internetových obchodech našel a nakoupil:\n\n&nbsp;\n\n&nbsp;', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision', '', '', '2013-02-19 12:09:21', '2013-02-19 12:09:21', '', 13, 'http://localhost:8888/13-revision/', 0, 'revision', '', 0),
(17, 1, '2013-02-19 12:11:16', '2013-02-19 12:11:16', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-3', '', '', '2013-02-19 12:11:16', '2013-02-19 12:11:16', '', 13, 'http://localhost:8888/13-revision-3/', 0, 'revision', '', 0),
(16, 1, '2013-02-19 12:10:39', '2013-02-19 12:10:39', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n[caption id="attachment_14" align="alignnone" width="300"]<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a> Vybavení mojí dílny[/caption]\r\n\r\n&nbsp;\r\n\r\n&nbsp;', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-2', '', '', '2013-02-19 12:10:39', '2013-02-19 12:10:39', '', 13, 'http://localhost:8888/13-revision-2/', 0, 'revision', '', 0),
(18, 1, '2013-02-19 11:58:58', '2013-02-19 11:58:58', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision-2', '', '', '2013-02-19 11:58:58', '2013-02-19 11:58:58', '', 8, 'http://localhost:8888/8-revision-2/', 0, 'revision', '', 0),
(19, 1, '2013-02-19 13:59:09', '2013-02-19 13:59:09', '<h2>Kompletní vybavení dílny</h2>\nKompletní vybavení dílny, vysvětlení anglicky.\n\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\n<h2>Vybavení dílny na obrábění kůže</h2>\nCo jsem v českých internetových obchodech našel a nakoupil:\n\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\n\nCo vidíte, je základ na kůži i na boty:\n<ul>\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\n	<li>kost na opravy a zalamování i hlazení kůže</li>\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\n	<li>nožík</li>\n	<li>jehly</li>\n	<li>kladívko na natahování kůže na botářské kopyto</li>\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\n	<li>šidlo pro vytvoření děr pro šití</li>\n</ul>\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-autosave', '', '', '2013-02-19 13:59:09', '2013-02-19 13:59:09', '', 13, 'http://localhost:8888/13-autosave/', 0, 'revision', '', 0),
(20, 1, '2013-02-19 12:12:09', '2013-02-19 12:12:09', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-4', '', '', '2013-02-19 12:12:09', '2013-02-19 12:12:09', '', 13, 'http://localhost:8888/13-revision-4/', 0, 'revision', '', 0),
(21, 1, '2013-02-19 12:20:52', '2013-02-19 12:20:52', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-5', '', '', '2013-02-19 12:20:52', '2013-02-19 12:20:52', '', 13, 'http://localhost:8888/13-revision-5/', 0, 'revision', '', 0),
(29, 1, '2013-02-19 13:09:45', '2013-02-19 13:09:45', '<h2><a href="http://localhost:8888/wp-content/uploads/sewing-e1361279182131.jpg"><img class="alignnone size-medium wp-image-22" alt="sewing" src="http://localhost:8888/wp-content/uploads/sewing-e1361279182131-300x116.jpg" width="300" height="116" /></a></h2>\r\n<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>\r\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-11', '', '', '2013-02-19 13:09:45', '2013-02-19 13:09:45', '', 13, 'http://localhost:8888/13-revision-11/', 0, 'revision', '', 0),
(23, 1, '2013-02-19 12:21:38', '2013-02-19 12:21:38', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>\r\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-6', '', '', '2013-02-19 12:21:38', '2013-02-19 12:21:38', '', 13, 'http://localhost:8888/13-revision-6/', 0, 'revision', '', 0),
(24, 1, '2013-02-19 13:06:41', '2013-02-19 13:06:41', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>\r\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-7', '', '', '2013-02-19 13:06:41', '2013-02-19 13:06:41', '', 13, 'http://localhost:8888/13-revision-7/', 0, 'revision', '', 0),
(25, 1, '2013-02-19 13:07:00', '2013-02-19 13:07:00', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>\r\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-8', '', '', '2013-02-19 13:07:00', '2013-02-19 13:07:00', '', 13, 'http://localhost:8888/13-revision-8/', 0, 'revision', '', 0),
(26, 1, '2013-02-19 13:07:14', '2013-02-19 13:07:14', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>\r\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-9', '', '', '2013-02-19 13:07:14', '2013-02-19 13:07:14', '', 13, 'http://localhost:8888/13-revision-9/', 0, 'revision', '', 0),
(27, 1, '2013-02-19 13:07:30', '2013-02-19 13:07:30', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>\r\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-10', '', '', '2013-02-19 13:07:30', '2013-02-19 13:07:30', '', 13, 'http://localhost:8888/13-revision-10/', 0, 'revision', '', 0),
(31, 1, '2013-02-19 12:12:42', '2013-02-19 12:12:42', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision-3', '', '', '2013-02-19 12:12:42', '2013-02-19 12:12:42', '', 8, 'http://localhost:8888/8-revision-3/', 0, 'revision', '', 0),
(33, 1, '2013-02-19 13:18:58', '2013-02-19 13:18:58', '', 'siti-kuze', '', 'inherit', 'open', 'open', '', 'siti-kuze-nahled', '', '', '2013-02-19 13:18:58', '2013-02-19 13:18:58', '', 8, 'http://localhost:8888/wp-content/uploads/siti-kuze.jpg', 0, 'attachment', 'image/jpeg', 0),
(32, 1, '2013-02-19 13:17:33', '2013-02-19 13:17:33', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision-4', '', '', '2013-02-19 13:17:33', '2013-02-19 13:17:33', '', 8, 'http://localhost:8888/8-revision-4/', 0, 'revision', '', 0),
(34, 1, '2013-02-19 13:17:52', '2013-02-19 13:17:52', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision-5', '', '', '2013-02-19 13:17:52', '2013-02-19 13:17:52', '', 8, 'http://localhost:8888/8-revision-5/', 0, 'revision', '', 0),
(35, 1, '2013-02-19 13:19:05', '2013-02-19 13:19:05', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision-6', '', '', '2013-02-19 13:19:05', '2013-02-19 13:19:05', '', 8, 'http://localhost:8888/8-revision-6/', 0, 'revision', '', 0),
(36, 1, '2013-02-19 13:20:13', '2013-02-19 13:20:13', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision-7', '', '', '2013-02-19 13:20:13', '2013-02-19 13:20:13', '', 8, 'http://localhost:8888/8-revision-7/', 0, 'revision', '', 0),
(37, 1, '2013-02-19 13:22:35', '2013-02-19 13:22:35', '', 'siti-kuze', '', 'inherit', 'open', 'open', '', 'siti-kuze-2', '', '', '2013-02-19 13:22:35', '2013-02-19 13:22:35', '', 8, 'http://localhost:8888/wp-content/uploads/siti-kuze1.jpg', 0, 'attachment', 'image/jpeg', 0),
(38, 1, '2013-02-19 13:21:00', '2013-02-19 13:21:00', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision-8', '', '', '2013-02-19 13:21:00', '2013-02-19 13:21:00', '', 8, 'http://localhost:8888/8-revision-8/', 0, 'revision', '', 0),
(39, 1, '2013-02-19 13:22:41', '2013-02-19 13:22:41', '<h2>Šití kůže rovným stehem</h2>\r\nPavděpodobně budete tento steh používat nejčastěji. Takové ty dvě línie vedle sebe s tímto švem klasicky spojují části botou a dalších výrobků. Pokud děláte vše dobře, může být kontrastní zvolení barev kůže a dratví (nití) i příjemnou okrasou.\r\n\r\n<iframe src="http://www.youtube.com/embed/4c8_8wD_mnc?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>\r\n\r\nDalší ukázka rovného stehu. Zde navíc jde vidět, jak je dobré při okraích fixovat - pojistit steh a jeho pevnost cestou tam a zpět.\r\n\r\n<a href="http://www.youtube.com/watch?v=olkoTw7izgA">http://www.youtube.com/watch?v=olkoTw7izgA</a>\r\n<h2>Šití kůže baseball stehem (do kříže)</h2>\r\n<iframe src="http://www.youtube.com/embed/ja-BWvLlKh4?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', 'Šití kůže', '', 'inherit', 'open', 'open', '', '8-revision-9', '', '', '2013-02-19 13:22:41', '2013-02-19 13:22:41', '', 8, 'http://localhost:8888/8-revision-9/', 0, 'revision', '', 0),
(40, 1, '2013-02-19 13:58:01', '2013-02-19 13:58:01', '', 'nastroje', '', 'inherit', 'open', 'open', '', 'nastroje', '', '', '2013-02-19 13:58:01', '2013-02-19 13:58:01', '', 13, 'http://localhost:8888/wp-content/uploads/nastroje.jpg', 0, 'attachment', 'image/jpeg', 0),
(41, 1, '2013-02-19 13:12:08', '2013-02-19 13:12:08', '<h2>Kompletní vybavení dílny</h2>\r\nKompletní vybavení dílny, vysvětlení anglicky.\r\n\r\n<a href="http://youtu.be/16fcs81ScZE">http://youtu.be/16fcs81ScZE</a>\r\n<h2>Vybavení dílny na obrábění kůže</h2>\r\nCo jsem v českých internetových obchodech našel a nakoupil:\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_121951.jpg"><img class="size-medium wp-image-14" alt="Vybavení mojí dílny" src="http://localhost:8888/wp-content/uploads/IMG_20130206_121951-300x225.jpg" width="300" height="225" /></a>\r\n\r\nCo vidíte, je základ na kůži i na boty:\r\n<ul>\r\n	<li>leštící kolečko - hrany kůže šoupete kolečkem, mírně se zahladí a zapálí</li>\r\n	<li>kost na opravy a zalamování i hlazení kůže</li>\r\n	<li>hnědá a bílá dratve (nit) voskovaná, tak aby řádně utahovala</li>\r\n	<li>nožík</li>\r\n	<li>jehly</li>\r\n	<li>kladívko na natahování kůže na botářské kopyto</li>\r\n	<li>značkovač stehů - kolečko s ostny, které vám udělá tečky v určitých vzdálenostech a víte kde šidlem udělat díry pro sešití kůže. <a title="Značkovač stehů pro šití kůže" href="http://www.jatagan.eu/stroje-a-naradi/znackovac-stehu" target="_blank" rel="nofollow">Nejlevnější značkovací kolečko co jsem našel, konstrukce perfektní, používám už nějakou dobu a plně spokojen.</a></li>\r\n	<li>šidlo pro vytvoření děr pro šití</li>\r\n</ul>\r\nŘezat kůži na určité tvary a kusy můžete jednoduše lámacím nožem z OBI nebo odkud-koliv.', 'Potřeby pro šití kůže', '', 'inherit', 'open', 'open', '', '13-revision-12', '', '', '2013-02-19 13:12:08', '2013-02-19 13:12:08', '', 13, 'http://localhost:8888/13-revision-12/', 0, 'revision', '', 0),
(42, 1, '2013-02-19 14:08:26', '2013-02-19 14:08:26', '<h2>Cena kůže?</h2>\r\nPrvní velký poznatek. Na eshopech jsem našel cenu štípenky za decimetr čtvereční (dm2) okolo 6 – 9 Kč s dph.\r\n\r\nNačež jsem sehnal ceník z <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">koželužny</a>. Cena za decimetr čtvereční (dm2) stoprocentní bezkazové za 3 Kč s dph. Potom to jde samozřejmě dolů pokud jsou tam nějaké kazy. Podle procent použitelné plochy se zmenšuje i cena. 80% použitelné kůže (tedy 20% vad) = sleva 20% z těch 3Kč za 1 dm2.\r\n\r\nMusím pochválit <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">KUMO s.r.o. koželužnu</a> za velmi příjemný přístup. Vše pěkně popsáno a vysvětleno. <strong>Objednávám hned zítra.</strong>\r\n\r\nCena kůže v této koželužně o silnějších vrstvách a horních vrstvách – na podrážky atd. je 400 Kč za 1 Kg. Koželužna krájí pouze 1/4 části kruponu. Tato 1/4 kruponu má rozměry 30 na 120 cm a váží od 1,5 do 2 kg – tudíž odhadem 800 Kč. <em>Na internetu jsem našel ceny až okolo 1500 Kč za tento kus.</em>\r\n\r\nKoželužna mi také nabídla valchování štípenky – pro její změkčení. Dokonce mi byl posán proces valchování. Opravdu jsem byl mile překvapen tímto hezkým přístupem, kor v dnešní době.\r\n<h2>KŮŽE PŘIŠLA !</h2>\r\nKůže mě stála 2500 Kč s DPH.\r\n\r\nJe jí neskutečné množství. Je velká, pevná a bez jakýchkoliv vad !! Děkuji <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">KUMO s.r.o.</a>\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_115707.jpg"><img class="size-medium wp-image-43 alignnone" alt="IMG_20130206_115707" src="http://localhost:8888/wp-content/uploads/IMG_20130206_115707-300x225.jpg" width="253" height="192" /></a> <a href="http://localhost:8888/wp-content/uploads/IMG_20130206_115717.jpg"><img class="size-medium wp-image-44 alignnone" alt="IMG_20130206_115717" src="http://localhost:8888/wp-content/uploads/IMG_20130206_115717-300x225.jpg" width="256" height="195" /></a>', 'Kůže - kde získat materiál ?', '', 'publish', 'open', 'open', '', 'kuze-kde-ziskat-material', '', '', '2013-03-26 14:45:32', '2013-03-26 14:45:32', '', 0, 'http://localhost:8888/?p=42', 0, 'post', '', 0),
(43, 1, '2013-02-19 14:03:23', '2013-02-19 14:03:23', '', 'IMG_20130206_115707', '', 'inherit', 'open', 'open', '', 'img_20130206_115707', '', '', '2013-02-19 14:03:23', '2013-02-19 14:03:23', '', 42, 'http://localhost:8888/wp-content/uploads/IMG_20130206_115707.jpg', 0, 'attachment', 'image/jpeg', 0),
(44, 1, '2013-02-19 14:03:40', '2013-02-19 14:03:40', '', 'IMG_20130206_115717', '', 'inherit', 'open', 'open', '', 'img_20130206_115717', '', '', '2013-02-19 14:03:40', '2013-02-19 14:03:40', '', 42, 'http://localhost:8888/wp-content/uploads/IMG_20130206_115717.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2013-02-19 14:08:22', '2013-02-19 14:08:22', '', 'kozeluzna', '', 'inherit', 'open', 'open', '', 'kozeluzna', '', '', '2013-02-19 14:08:22', '2013-02-19 14:08:22', '', 42, 'http://localhost:8888/wp-content/uploads/kozeluzna.jpg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2013-02-19 14:04:23', '2013-02-19 14:04:23', '<h2>Cena kůže?</h2>\nPrvní velký poznatek. Na eshopech jsem našel cenu štípenky za decimetr čtvereční (dm2) okolo 6 – 9 Kč s dph.\n\nNačež jsem sehnal ceník z <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">koželužny</a>. Cena za decimetr čtvereční (dm2) stoprocentní bezkazové za 3 Kč s dph. Potom to jde samozřejmě dolů pokud jsou tam nějaké kazy. Podle procent použitelné plochy se zmenšuje i cena. 80% použitelné kůže (tedy 20% vad) = sleva 20% z těch 3Kč za 1 dm2.\n\nMusím pochválit <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">KUMO s.r.o. koželužnu</a> za velmi příjemný přístup. Vše pěkně popsáno a vysvětleno. <strong>Objednávám hned zítra.</strong>\n\nCena kůže v této koželužně o silnějších vrstvách a horních vrstvách – na podrážky atd. je 400 Kč za 1 Kg. Koželužna krájí pouze 1/4 části kruponu. Tato 1/4 kruponu má rozměry 30 na 120 cm a váží od 1,5 do 2 kg – tudíž odhadem 800 Kč. <em>Na internetu jsem našel ceny až okolo 1500 Kč za tento kus.</em>\n\nKoželužna mi také nabídla valchování štípenky – pro její změkčení. Dokonce mi byl posán proces valchování. Opravdu jsem byl mile překvapen tímto hezkým přístupem, kor v dnešní době.\n<h2>KŮŽE PŘIŠLA !</h2>\nKůže mě stála 2500 Kč s DPH.\n\nJe jí neskutečné množství. Je velká, pevná a bez jakýchkoliv vad !! Děkuji <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">KUMO s.r.o.</a>\n\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_115707.jpg"><img class="alignnone size-medium wp-image-43" alt="IMG_20130206_115707" src="http://localhost:8888/wp-content/uploads/IMG_20130206_115707-300x225.jpg" width="300" height="225" /></a> <a href="http://localhost:8888/wp-content/uploads/IMG_20130206_115717.jpg"><img class="alignnone size-medium wp-image-44" alt="IMG_20130206_115717" src="http://localhost:8888/wp-content/uploads/IMG_20130206_115717-300x225.jpg" width="300" height="225" /></a>', 'Kůže - kde získat materiál ?', '', 'inherit', 'open', 'open', '', '42-revision', '', '', '2013-02-19 14:04:23', '2013-02-19 14:04:23', '', 42, 'http://localhost:8888/42-revision/', 0, 'revision', '', 0),
(48, 1, '2013-02-19 14:09:30', '2013-02-19 14:09:30', '<h2>Cena kůže?</h2>\nPrvní velký poznatek. Na eshopech jsem našel cenu štípenky za decimetr čtvereční (dm2) okolo 6 – 9 Kč s dph.\n\nNačež jsem sehnal ceník z <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">koželužny</a>. Cena za decimetr čtvereční (dm2) stoprocentní bezkazové za 3 Kč s dph. Potom to jde samozřejmě dolů pokud jsou tam nějaké kazy. Podle procent použitelné plochy se zmenšuje i cena. 80% použitelné kůže (tedy 20% vad) = sleva 20% z těch 3Kč za 1 dm2.\n\nMusím pochválit <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">KUMO s.r.o. koželužnu</a> za velmi příjemný přístup. Vše pěkně popsáno a vysvětleno. <strong>Objednávám hned zítra.</strong>\n\nCena kůže v této koželužně o silnějších vrstvách a horních vrstvách – na podrážky atd. je 400 Kč za 1 Kg. Koželužna krájí pouze 1/4 části kruponu. Tato 1/4 kruponu má rozměry 30 na 120 cm a váží od 1,5 do 2 kg – tudíž odhadem 800 Kč. <em>Na internetu jsem našel ceny až okolo 1500 Kč za tento kus.</em>\n\nKoželužna mi také nabídla valchování štípenky – pro její změkčení. Dokonce mi byl posán proces valchování. Opravdu jsem byl mile překvapen tímto hezkým přístupem, kor v dnešní době.\n<h2>KŮŽE PŘIŠLA !</h2>\nKůže mě stála 2500 Kč s DPH.\n\nJe jí neskutečné množství. Je velká, pevná a bez jakýchkoliv vad !! Děkuji <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">KUMO s.r.o.</a>\n\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_115707.jpg"><img class="alignnone size-medium wp-image-43" alt="IMG_20130206_115707" src="http://localhost:8888/wp-content/uploads/IMG_20130206_115707-300x225.jpg" width="300" height="225" /></a> <a href="http://localhost:8888/wp-content/uploads/IMG_20130206_115717.jpg"><img class="alignnone size-medium wp-image-44" alt="IMG_20130206_115717" src="http://localhost:8888/wp-content/uploads/IMG_20130206_115717-300x225.jpg" width="300" height="225" /></a>', 'Kůže - kde získat materiál ?', '', 'inherit', 'open', 'open', '', '42-autosave', '', '', '2013-02-19 14:09:30', '2013-02-19 14:09:30', '', 42, 'http://localhost:8888/42-autosave/', 0, 'revision', '', 0),
(49, 1, '2013-02-19 14:29:43', '2013-02-19 14:29:43', 'Měl jsem celkem problém získat někde v České republice natahovací kleště s kladívkem.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1.jpg"><img class="alignnone size-medium wp-image-51" alt="kladivko-s-klestemi" src="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1-300x300.jpg" width="300" height="300" /></a>\r\n\r\nAni na eBay a dalších aukcích jsem nenašel. Pouze pár historických kousků. Nakonec jsem našel v internetovém obchodě, který ještě není v provozu z obchodu firmy <strong>Komet s.r.o. MORAVA</strong>.\r\n\r\nDoporučuji si zvolat na MORAVSKOU pobočku. Zde je velmi ochotný člověk. Nedoporučuji volat na majitele nebo na Pražskou pobočku. Potkáte někoho, komu na obchodu značně nezáleží.', 'Ruční výroba obuvi - natahovací kleště', '', 'publish', 'open', 'open', '', 'rucni-vyroba-obuvi-natahovaci-kleste', '', '', '2013-02-19 14:46:21', '2013-02-19 14:46:21', '', 0, 'http://localhost:8888/?p=49', 0, 'post', '', 0),
(50, 1, '2013-02-19 14:11:09', '2013-02-19 14:11:09', '', 'kladivko-s-klestemi', '', 'inherit', 'open', 'open', '', 'kladivko-s-klestemi', '', '', '2013-02-19 14:11:09', '2013-02-19 14:11:09', '', 49, 'http://localhost:8888/wp-content/uploads/kladivko-s-klestemi.jpg', 0, 'attachment', 'image/jpeg', 0),
(51, 1, '2013-02-19 14:14:04', '2013-02-19 14:14:04', '', 'kladivko-s-klestemi', '', 'inherit', 'open', 'open', '', 'kladivko-s-klestemi-2', '', '', '2013-02-19 14:14:04', '2013-02-19 14:14:04', '', 49, 'http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1.jpg', 0, 'attachment', 'image/jpeg', 0),
(52, 1, '2013-02-19 14:29:38', '2013-02-19 14:29:38', '', 'kleste-kopyto', '', 'inherit', 'open', 'open', '', 'kleste-kopyto', '', '', '2013-02-19 14:29:38', '2013-02-19 14:29:38', '', 49, 'http://localhost:8888/wp-content/uploads/kleste-kopyto.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2013-02-19 14:14:58', '2013-02-19 14:14:58', 'Měl jsem celkem problém získat někde v České republice natahovací kleště s kladívkem.\n\n<a href="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1.jpg"><img class="alignnone size-medium wp-image-51" alt="kladivko-s-klestemi" src="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1-300x300.jpg" width="300" height="300" /></a>\n\nAni na eBay a dalších aukcích jsem nenašel. Pouze pár historických kousků. Nakonec jsem našel v internetovém obchodě, který ještě není v provozu z obchodu firmy Komet s.r.o.\n\nDoporučuji si zvolat na MORAVSKOU pobočku. Zde je velmi ochotný člověk. Nedoporučuji volat na majitele nebo na Pražskou pobočku. Potkáte někoho, komu na obchodu značně nezáleží.', 'Ruční výroba obuvi - natahovací kleště', '', 'inherit', 'open', 'open', '', '49-revision', '', '', '2013-02-19 14:14:58', '2013-02-19 14:14:58', '', 49, 'http://localhost:8888/49-revision/', 0, 'revision', '', 0),
(54, 1, '2013-02-19 14:39:19', '2013-02-19 14:39:19', 'Měl jsem celkem problém získat někde v České republice natahovací kleště s kladívkem.\n\n<a href="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1.jpg"><img class="alignnone size-medium wp-image-51" alt="kladivko-s-klestemi" src="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1-300x300.jpg" width="300" height="300" /></a>\n\nAni na eBay a dalších aukcích jsem nenašel. Pouze pár historických kousků. Nakonec jsem našel v internetovém obchodě, který ještě není v provozu z obchodu firmy Komet s.r.o.\n\nDoporučuji si zvolat na MORAVSKOU pobočku. Zde je velmi ochotný člověk. Nedoporučuji volat na majitele nebo na Pražskou pobočku. Potkáte někoho, komu na obchodu značně nezáleží.', 'Ruční výroba obuvi - natahovací kleště', '', 'inherit', 'open', 'open', '', '49-autosave', '', '', '2013-02-19 14:39:19', '2013-02-19 14:39:19', '', 49, 'http://localhost:8888/49-autosave/', 0, 'revision', '', 0),
(55, 1, '2013-02-19 14:38:13', '2013-02-19 14:38:13', '', 'kopyto3', '', 'inherit', 'open', 'open', '', 'kopyto3', '', '', '2013-02-19 14:38:13', '2013-02-19 14:38:13', '', 49, 'http://localhost:8888/wp-content/uploads/kopyto3.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2013-02-19 14:29:43', '2013-02-19 14:29:43', 'Měl jsem celkem problém získat někde v České republice natahovací kleště s kladívkem.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1.jpg"><img class="alignnone size-medium wp-image-51" alt="kladivko-s-klestemi" src="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1-300x300.jpg" width="300" height="300" /></a>\r\n\r\nAni na eBay a dalších aukcích jsem nenašel. Pouze pár historických kousků. Nakonec jsem našel v internetovém obchodě, který ještě není v provozu z obchodu firmy Komet s.r.o.\r\n\r\nDoporučuji si zvolat na MORAVSKOU pobočku. Zde je velmi ochotný člověk. Nedoporučuji volat na majitele nebo na Pražskou pobočku. Potkáte někoho, komu na obchodu značně nezáleží.', 'Ruční výroba obuvi - natahovací kleště', '', 'inherit', 'open', 'open', '', '49-revision-2', '', '', '2013-02-19 14:29:43', '2013-02-19 14:29:43', '', 49, 'http://localhost:8888/49-revision-2/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(57, 1, '2013-02-19 14:38:16', '2013-02-19 14:38:16', 'Měl jsem celkem problém získat někde v České republice natahovací kleště s kladívkem.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1.jpg"><img class="alignnone size-medium wp-image-51" alt="kladivko-s-klestemi" src="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1-300x300.jpg" width="300" height="300" /></a>\r\n\r\nAni na eBay a dalších aukcích jsem nenašel. Pouze pár historických kousků. Nakonec jsem našel v internetovém obchodě, který ještě není v provozu z obchodu firmy Komet s.r.o.\r\n\r\nDoporučuji si zvolat na MORAVSKOU pobočku. Zde je velmi ochotný člověk. Nedoporučuji volat na majitele nebo na Pražskou pobočku. Potkáte někoho, komu na obchodu značně nezáleží.', 'Ruční výroba obuvi - natahovací kleště', '', 'inherit', 'open', 'open', '', '49-revision-3', '', '', '2013-02-19 14:38:16', '2013-02-19 14:38:16', '', 49, 'http://localhost:8888/49-revision-3/', 0, 'revision', '', 0),
(58, 1, '2013-02-19 14:42:02', '2013-02-19 14:42:02', 'Měl jsem celkem problém získat někde v České republice natahovací kleště s kladívkem.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1.jpg"><img class="alignnone size-medium wp-image-51" alt="kladivko-s-klestemi" src="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1-300x300.jpg" width="300" height="300" /></a>\r\n\r\nAni na eBay a dalších aukcích jsem nenašel. Pouze pár historických kousků. Nakonec jsem našel v internetovém obchodě, který ještě není v provozu z obchodu firmy Komet s.r.o.\r\n\r\nDoporučuji si zvolat na MORAVSKOU pobočku. Zde je velmi ochotný člověk. Nedoporučuji volat na majitele nebo na Pražskou pobočku. Potkáte někoho, komu na obchodu značně nezáleží.', 'Ruční výroba obuvi - natahovací kleště', '', 'inherit', 'open', 'open', '', '49-revision-4', '', '', '2013-02-19 14:42:02', '2013-02-19 14:42:02', '', 49, 'http://localhost:8888/49-revision-4/', 0, 'revision', '', 0),
(59, 1, '2013-02-19 14:45:22', '2013-02-19 14:45:22', 'Měl jsem celkem problém získat někde v České republice natahovací kleště s kladívkem.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1.jpg"><img class="alignnone size-medium wp-image-51" alt="kladivko-s-klestemi" src="http://localhost:8888/wp-content/uploads/kladivko-s-klestemi1-300x300.jpg" width="300" height="300" /></a>\r\n\r\nAni na eBay a dalších aukcích jsem nenašel. Pouze pár historických kousků. Nakonec jsem našel v internetovém obchodě, který ještě není v provozu z obchodu firmy <strong>Komet s.r.o. MORAVA</strong>.\r\n\r\nDoporučuji si zvolat na MORAVSKOU pobočku. Zde je velmi ochotný člověk. Nedoporučuji volat na majitele nebo na Pražskou pobočku. Potkáte někoho, komu na obchodu značně nezáleží.', 'Ruční výroba obuvi - natahovací kleště', '', 'inherit', 'open', 'open', '', '49-revision-5', '', '', '2013-02-19 14:45:22', '2013-02-19 14:45:22', '', 49, 'http://localhost:8888/49-revision-5/', 0, 'revision', '', 0),
(60, 1, '2013-02-19 14:57:43', '2013-02-19 14:57:43', 'Jsem velmi překvapen, neskutečně podařeným projektem "Jak si udělat boty z vlastní garáže". Oliver Rabbath, umělec z Francie, se přestěhoval do USA, založil obchod, který se stal jeho životem. V obchodě s velkými výlohami vyrábí a učí dnes a denně další nadané. V obchodě i spí, stal se jeho životem.\r\n\r\nWWW: <a href="http://howtomakebootsfromyourgarage.com/">How to make boots from your garage!</a>\r\n\r\nKromě videí na internetu, které si můžete otevřít zde, můžete taktéž zakoupit jeho knihu s veškerými návody. Dává velmi velký důraz na použití jednoduchých nástrojů a postupů a tím dosahuje možnosti opravdu si své boty vytvořit v vlastní dílně.\r\n\r\n<iframe src="http://www.youtube.com/embed/On3A_9b1YYs?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', '"How to make boots from your garage" Oliver Rabbath', '', 'publish', 'open', 'open', '', 'how-to-make-boots-from-your-garage-oliver-rabbath', '', '', '2013-02-20 09:54:05', '2013-02-20 09:54:05', '', 0, 'http://localhost:8888/?p=60', 0, 'post', '', 0),
(61, 1, '2013-02-19 14:57:34', '2013-02-19 14:57:34', '', 'oliver-rabbath', '', 'inherit', 'open', 'open', '', 'oliver-rabbath', '', '', '2013-02-19 14:57:34', '2013-02-19 14:57:34', '', 60, 'http://localhost:8888/wp-content/uploads/oliver-rabbath.jpg', 0, 'attachment', 'image/jpeg', 0),
(62, 1, '2013-02-19 14:53:22', '2013-02-19 14:53:22', 'Jsem velmi překvapen, neskutečně podařeným projektem "Jak si udělat boty z vlastní garáže". Oliver Rabbath, umělec z Francie, se přestěhoval do USA, založil obchod, který se stal jeho životem. V obchodě s velkými výlohami vyrábí a učí dnes a denně další nadané. V obchodě i spí, stal se jeho životem.\n\nWWW: <a href="http://howtomakebootsfromyourgarage.com/">How to make boots from your garage!</a>\n\nKromě videí na internetu, které si můžete otevřít zde, můžete taktéž zakoupit jeho knihu s veškerými návody. Dává velmi velký důraz na použití jednoduchých nástrojů a postupů a tím dosahuje možnosti opravdu si své boty vytvořit v vlastní dílně.\n\n<iframe src="http://www.youtube.com/embed/On3A_9b1YYs?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', '"How to make boots from your garage" Oliver Rabbath', '', 'inherit', 'open', 'open', '', '60-revision', '', '', '2013-02-19 14:53:22', '2013-02-19 14:53:22', '', 60, 'http://localhost:8888/60-revision/', 0, 'revision', '', 0),
(63, 1, '2013-02-20 09:55:08', '2013-02-20 09:55:08', 'Jsem velmi překvapen, neskutečně podařeným projektem "Jak si udělat boty z vlastní garáže". Oliver Rabbath, umělec z Francie, se přestěhoval do USA, založil obchod, který se stal jeho životem. V obchodě s velkými výlohami vyrábí a učí dnes a denně další nadané. V obchodě i spí, stal se jeho životem.\n\nWWW: <a href="http://howtomakebootsfromyourgarage.com/">How to make boots from your garage!</a>\n\nKromě videí na internetu, které si můžete otevřít zde, můžete taktéž zakoupit jeho knihu s veškerými návody. Dává velmi velký důraz na použití jednoduchých nástrojů a postupů a tím dosahuje možnosti opravdu si své boty vytvořit v vlastní dílně.\n\n<iframe src="http://www.youtube.com/embed/On3A_9b1YYs?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', '"How to make boots from your garage" Oliver Rabbath', '', 'inherit', 'open', 'open', '', '60-autosave', '', '', '2013-02-20 09:55:08', '2013-02-20 09:55:08', '', 60, 'http://localhost:8888/60-autosave/', 0, 'revision', '', 0),
(64, 1, '2013-02-19 15:21:17', '2013-02-19 15:21:17', '<a href="http://localhost:8888/wp-content/uploads/jak-usit-goticke-boty.pdf">PDF K STAŽENÍ STAHUJTE ZDE: JAK SI UŠÍT GOTICKÉ BOTY</a>\r\n\r\n... je stále hlad po středověkých botách a mnohým Danarům chybí k dokonalosti jejich dobového oděvu, rozhodl jsem se připravit stručný návod na to, jak si takové boty vyrobit. Zavzpomínám- li na své dětství, vyrobil jsem si takové podobné botičky, když mi bylo 12 let, akorát šlo o indiánské mokasíny, které se níže uvedeným botám velice podobají. Pokud jsem to zvládnul já, bude to pro vás s Vašimi zkušenostmi získanými na Danaru o to větší hračka. Získáte tak svoje vlastní boty, přímo na vaši nohu, takže skvělé do terénu a hlavně si s nimi budet moci dělat, co chcete. Odpadne vám dlouhodobé šetření a můžete si za uspořené denáry koupit něco jiného do výbavy, nebo je prohrát po vzoru pana Galdrina v kostkách. Navíc vás bude hřát útěcha, že jste dokázali něco, co většina Danarů před vámi nedokázala, jelikož jsem jim boty šil já a to strojově. Takže s chutí do díla.\r\n<ol>\r\n	<li>Zapomeňte na boty, které nosíme. Šili jsme je v době počátečních znalostí historie – tudíž nejsou dobové. Vy si uděláte lepší a dobovější.</li>\r\n	<li>Než začnete řezat drahou kůži, je lepší udělat prototyp z obyčejnějšího materiálu jako koženky nebo plátna. Zjistíte tak možné chyby a střih můžete patřičně upravit. Když vše sedí, botu rozpáráte a získáte konečný střih pro použití kůže.</li>\r\n</ol>\r\n\r\n<h3>Materiál</h3>\r\nZde bych připomněl jedno oblíbené rčení, které se týká ostatně celé výroby bot – Kdo nechce, hledá důvod, kdo chce, hledá způsob. Za mých mladých let, tedy v mých 12-ti, žádné obchody stylu „kutil“ neexistovaly, takže se hledalo, až se našlo – stará kožená taška ...\r\n<h3>Střih a šití</h3>\r\nStřihů je celá řada. Důležité k výrobě střihu jsou míry vaší nohy. Pro názornost jsem vybral jednu botu pouze ze tří kusů (podešev není na obrázku), aby ...', 'Jak si ušít gotické boty - PDF', '', 'publish', 'open', 'open', '', 'jak-si-usit-goticke-boty-pdf', '', '', '2013-02-19 15:23:57', '2013-02-19 15:23:57', '', 0, 'http://localhost:8888/?p=64', 0, 'post', '', 0),
(71, 1, '2013-02-19 15:23:07', '2013-02-19 15:23:07', '<a href="http://localhost:8888/wp-content/uploads/jak-usit-goticke-boty.pdf">PDF K STAŽENÍ STAHUJTE ZDE: JAK SI UŠÍT GOTICKÉ BOTY</a>\r\n\r\n... je stále hlad po středověkých botách a mnohým Danarům chybí k dokonalosti jejich dobového oděvu, rozhodl jsem se připravit stručný návod na to, jak si takové boty vyrobit. Zavzpomínám- li na své dětství, vyrobil jsem si takové podobné botičky, když mi bylo 12 let, akorát šlo o indiánské mokasíny, které se níže uvedeným botám velice podobají. Pokud jsem to zvládnul já, bude to pro vás s Vašimi zkušenostmi získanými na Danaru o to větší hračka. Získáte tak svoje vlastní boty, přímo na vaši nohu, takže skvělé do terénu a hlavně si s nimi budet moci dělat, co chcete. Odpadne vám dlouhodobé šetření a můžete si za uspořené denáry koupit něco jiného do výbavy, nebo je prohrát po vzoru pana Galdrina v kostkách. Navíc vás bude hřát útěcha, že jste dokázali něco, co většina Danarů před vámi nedokázala, jelikož jsem jim boty šil já a to strojově. Takže s chutí do díla.\r\n<ol>\r\n	<li>Zapomeňte na boty, které nosíme. Šili jsme je v době počátečních znalostí historie – tudíž nejsou dobové. Vy si uděláte lepší a dobovější.</li>\r\n	<li>Než začnete řezat drahou kůži, je lepší udělat prototyp z obyčejnějšího materiálu jako koženky nebo plátna. Zjistíte tak možné chyby a střih můžete patřičně upravit. Když vše sedí, botu rozpáráte a získáte konečný střih pro použití kůže.</li>\r\n</ol>\r\n\r\n<h3>Materiál</h3>\r\nZde bych připomněl jedno oblíbené rčení, které se týká ostatně celé výroby bot – Kdo nechce, hledá důvod, kdo chce, hledá způsob. Za mých mladých let, tedy v mých 12-ti, žádné obchody stylu „kutil“ neexistovaly, takže se hledalo, až se našlo – stará kožená taška ...\r\n<h3>Střih a šití</h3>\r\nStřihů je celá řada. Důležité k výrobě střihu jsou míry vaší nohy. Pro názornost jsem vybral jednu botu pouze ze tří kusů (podešev není na obrázku), aby ...', 'Jak si ušít gotické boty - PDF', '', 'inherit', 'open', 'open', '', '64-revision-5', '', '', '2013-02-19 15:23:07', '2013-02-19 15:23:07', '', 64, 'http://localhost:8888/64-revision-5/', 0, 'revision', '', 0),
(70, 1, '2013-02-19 15:22:40', '2013-02-19 15:22:40', '<a href="http://localhost:8888/wp-content/uploads/jak-usit-goticke-boty.pdf">PDF K STAŽENÍ STAHUJTE ZDE: JAK SI UŠÍT GOTICKÉ BOTY</a>\r\n\r\n... je stále hlad po středověkých botách a mnohým Danarům chybí k dokonalosti jejich dobového oděvu, rozhodl jsem se připravit stručný návod na to, jak si takové boty vyrobit. Zavzpomínám- li na své dětství, vyrobil jsem si takové podobné botičky, když mi bylo 12 let, akorát šlo o indiánské mokasíny, které se níže uvedeným botám velice podobají. Pokud jsem to zvládnul já, bude to pro vás s Vašimi zkušenostmi získanými na Danaru o to větší hračka. Získáte tak svoje vlastní boty, přímo na vaši nohu, takže skvělé do terénu a hlavně si s nimi budet moci dělat, co chcete. Odpadne vám dlouhodobé šetření a můžete si za uspořené denáry koupit něco jiného do výbavy, nebo je prohrát po vzoru pana Galdrina v kostkách. Navíc vás bude hřát útěcha, že jste dokázali něco, co většina Danarů před vámi nedokázala, jelikož jsem jim boty šil já a to strojově. Takže s chutí do díla.\r\n<ol>\r\n	<li>Zapomeňte na boty, které nosíme. Šili jsme je v době počátečních znalostí historie – tudíž nejsou dobové. Vy si uděláte lepší a dobovější.</li>\r\n	<li>Než začnete řezat drahou kůži, je lepší udělat prototyp z obyčejnějšího materiálu jako koženky nebo plátna. Zjistíte tak možné chyby a střih můžete patřičně upravit. Když vše sedí, botu rozpáráte a získáte konečný střih pro použití kůže.</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div>\r\n<div>\r\n<div>\r\n<h3>Materiál</h3>\r\nZde bych připomněl jedno oblíbené rčení, které se týká ostatně celé výroby bot – Kdo nechce, hledá důvod, kdo chce, hledá způsob. Za mých mladých let, tedy v mých 12-ti, žádné obchody stylu „kutil“ neexistovaly, takže se hledalo, až se našlo – stará kožená taška ...\r\n<h3>Střih a šití</h3>\r\nStřihů je celá řada. Důležité k výrobě střihu jsou míry vaší nohy. Pro názornost jsem vybral jednu botu pouze ze tří kusů (podešev není na obrázku), aby ...\r\n\r\n</div>\r\n</div>\r\n</div>', 'Jak si ušít gotické boty - PDF', '', 'inherit', 'open', 'open', '', '64-revision-4', '', '', '2013-02-19 15:22:40', '2013-02-19 15:22:40', '', 64, 'http://localhost:8888/64-revision-4/', 0, 'revision', '', 0),
(67, 1, '2013-02-19 15:21:17', '2013-02-19 15:21:17', '<div>\r\n<div>\r\n<div>\r\n\r\n<a href="http://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=6&amp;ved=0CFUQFjAF&amp;url=http%3A%2F%2Ffiles.melaos.webnode.cz%2F200000695-06f0707e9e%2Fhttp___www.email.pdf&amp;ei=xtgIUe29B8TptQaxkIGACQ&amp;usg=AFQjCNF5BX9kH8-pVbpohtAEPTE_aERZOw&amp;bvm=bv.41642243,d.Yms&amp;cad=rja">PDF K STAŽENÍ STAHUJTE ZDE: JAK SI UŠÍT GOTICKÉ BOTY</a>\r\n\r\n... je stále hlad po středověkých botách a mnohým Danarům chybí k dokonalosti jejich dobového oděvu, rozhodl jsem se připravit stručný návod na to, jak si takové boty vyrobit. Zavzpomínám- li na své dětství, vyrobil jsem si takové podobné botičky, když mi bylo 12 let, akorát šlo o indiánské mokasíny, které se níže uvedeným botám velice podobají. Pokud jsem to zvládnul já, bude to pro vás s Vašimi zkušenostmi získanými na Danaru o to větší hračka. Získáte tak svoje vlastní boty, přímo na vaši nohu, takže skvělé do terénu a hlavně si s nimi budet moci dělat, co chcete. Odpadne vám dlouhodobé šetření a můžete si za uspořené denáry koupit něco jiného do výbavy, nebo je prohrát po vzoru pana Galdrina v kostkách. Navíc vás bude hřát útěcha, že jste dokázali něco, co většina Danarů před vámi nedokázala, jelikož jsem jim boty šil já a to strojově. Takže s chutí do díla.\r\n<ol>\r\n	<li>Zapomeňte na boty, které nosíme. Šili jsme je v době počátečních znalostí historie – tudíž nejsou dobové. Vy si uděláte lepší a dobovější.</li>\r\n	<li>Než začnete řezat drahou kůži, je lepší udělat prototyp z obyčejnějšího materiálu jako koženky nebo plátna. Zjistíte tak možné chyby a střih můžete patřičně upravit. Když vše sedí, botu rozpáráte a získáte konečný střih pro použití kůže.</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div>\r\n<div>\r\n<div>\r\n<h3>Materiál</h3>\r\nZde bych připomněl jedno oblíbené rčení, které se týká ostatně celé výroby bot – Kdo nechce, hledá důvod, kdo chce, hledá způsob. Za mých mladých let, tedy v mých 12-ti, žádné obchody stylu „kutil“ neexistovaly, takže se hledalo, až se našlo – stará kožená taška ...\r\n<h3>Střih a šití</h3>\r\nStřihů je celá řada. Důležité k výrobě střihu jsou míry vaší nohy. Pro názornost jsem vybral jednu botu pouze ze tří kusů (podešev není na obrázku), aby ...\r\n\r\n</div>\r\n</div>\r\n</div>', 'Jak si ušít gotické boty - PDF', '', 'inherit', 'open', 'open', '', '64-revision-2', '', '', '2013-02-19 15:21:17', '2013-02-19 15:21:17', '', 64, 'http://localhost:8888/64-revision-2/', 0, 'revision', '', 0),
(65, 1, '2013-02-19 15:20:23', '2013-02-19 15:20:23', '', 'Snímek obrazovky 2013-02-19 v 16.28.30', '', 'inherit', 'open', 'open', '', 'snimek-obrazovky-2013-02-19-v-16-28-30', '', '', '2013-02-19 15:20:23', '2013-02-19 15:20:23', '', 64, 'http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.28.30.png', 0, 'attachment', 'image/png', 0),
(66, 1, '2013-02-19 15:18:33', '2013-02-19 15:18:33', '<div>\n<div>\n<div>\n\n<a href="http://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=6&amp;ved=0CFUQFjAF&amp;url=http%3A%2F%2Ffiles.melaos.webnode.cz%2F200000695-06f0707e9e%2Fhttp___www.email.pdf&amp;ei=xtgIUe29B8TptQaxkIGACQ&amp;usg=AFQjCNF5BX9kH8-pVbpohtAEPTE_aERZOw&amp;bvm=bv.41642243,d.Yms&amp;cad=rja">PDF K STAŽENÍ STAHUJTE ZDE: JAK SI UŠÍT GOTICKÉ BOTY</a>\n\n... je stále hlad po středověkých botách a mnohým Danarům chybí k dokonalosti jejich dobového oděvu, rozhodl jsem se připravit stručný návod na to, jak si takové boty vyrobit. Zavzpomínám- li na své dětství, vyrobil jsem si takové podobné botičky, když mi bylo 12 let, akorát šlo o indiánské mokasíny, které se níže uvedeným botám velice podobají. Pokud jsem to zvládnul já, bude to pro vás s Vašimi zkušenostmi získanými na Danaru o to větší hračka. Získáte tak svoje vlastní boty, přímo na vaši nohu, takže skvělé do terénu a hlavně si s nimi budet moci dělat, co chcete. Odpadne vám dlouhodobé šetření a můžete si za uspořené denáry koupit něco jiného do výbavy, nebo je prohrát po vzoru pana Galdrina v kostkách. Navíc vás bude hřát útěcha, že jste dokázali něco, co většina Danarů před vámi nedokázala, jelikož jsem jim boty šil já a to strojově. Takže s chutí do díla.\n<ol>\n	<li>Zapomeňte na boty, které nosíme. Šili jsme je v době počátečních znalostí historie – tudíž nejsou dobové. Vy si uděláte lepší a dobovější.</li>\n	<li>Než začnete řezat drahou kůži, je lepší udělat prototyp z obyčejnějšího materiálu jako koženky nebo plátna. Zjistíte tak možné chyby a střih můžete patřičně upravit. Když vše sedí, botu rozpáráte a získáte konečný střih pro použití kůže.</li>\n</ol>\n</div>\n</div>\n</div>\n<div>\n<div>\n<div>\n<h3>Materiál</h3>\nZde bych připomněl jedno oblíbené rčení, které se týká ostatně celé výroby bot – Kdo nechce, hledá důvod, kdo chce, hledá způsob. Za mých mladých let, tedy v mých 12-ti, žádné obchody stylu „kutil“ neexistovaly, takže se hledalo, až se našlo – stará kožená taška, kus žíněnky, starý kožený kabát a pod. Máte tuto možnost, nebo tu snadnější – uprosit rodiče a zajít do kutila nebo do řemeslných potřeb. Pak je tu také druhá excelentní vymoženost, která z nás dělá líné špekouny, za mého mládí nebyla – internet. Než se pustíte do díla, nebo objednávky, doporučuji konzultaci, případně přivézt vzorek kůže na Danar, abychom posoudili její vhodnost. Ne každá to totiž vydrží. Šijeme pochopitelně navoskovanou sedlářskou dratví.\n<h3>Střih a šití</h3>\nStřihů je celá řada. Důležité k výrobě střihu jsou míry vaší nohy. Pro názornost jsem vybral jednu botu pouze ze tří kusů (podešev není na obrázku), aby jste snáze pochopili získání rozměrů.\n\nAž budete prototyp boty zkoušet na noze, pamatujte, že se originál z kůže bude namáčet a vytahovat podle chodidla. Prototyp by měl tedy být těsný.\n\n</div>\n</div>\n</div>', 'Jak si ušít gotické boty - PDF', '', 'inherit', 'open', 'open', '', '64-revision', '', '', '2013-02-19 15:18:33', '2013-02-19 15:18:33', '', 64, 'http://localhost:8888/64-revision/', 0, 'revision', '', 0),
(68, 1, '2013-02-19 15:22:16', '2013-02-19 15:22:16', '', 'jak-usit-goticke-boty', '', 'inherit', 'open', 'open', '', 'jak-usit-goticke-boty', '', '', '2013-02-19 15:22:16', '2013-02-19 15:22:16', '', 64, 'http://localhost:8888/wp-content/uploads/jak-usit-goticke-boty.pdf', 0, 'attachment', 'application/pdf', 0),
(69, 1, '2013-02-19 15:21:56', '2013-02-19 15:21:56', '<div>\r\n<div>\r\n<div>\r\n\r\n<a href="http://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=6&amp;ved=0CFUQFjAF&amp;url=http%3A%2F%2Ffiles.melaos.webnode.cz%2F200000695-06f0707e9e%2Fhttp___www.email.pdf&amp;ei=xtgIUe29B8TptQaxkIGACQ&amp;usg=AFQjCNF5BX9kH8-pVbpohtAEPTE_aERZOw&amp;bvm=bv.41642243,d.Yms&amp;cad=rja">PDF K STAŽENÍ STAHUJTE ZDE: JAK SI UŠÍT GOTICKÉ BOTY</a>\r\n\r\n... je stále hlad po středověkých botách a mnohým Danarům chybí k dokonalosti jejich dobového oděvu, rozhodl jsem se připravit stručný návod na to, jak si takové boty vyrobit. Zavzpomínám- li na své dětství, vyrobil jsem si takové podobné botičky, když mi bylo 12 let, akorát šlo o indiánské mokasíny, které se níže uvedeným botám velice podobají. Pokud jsem to zvládnul já, bude to pro vás s Vašimi zkušenostmi získanými na Danaru o to větší hračka. Získáte tak svoje vlastní boty, přímo na vaši nohu, takže skvělé do terénu a hlavně si s nimi budet moci dělat, co chcete. Odpadne vám dlouhodobé šetření a můžete si za uspořené denáry koupit něco jiného do výbavy, nebo je prohrát po vzoru pana Galdrina v kostkách. Navíc vás bude hřát útěcha, že jste dokázali něco, co většina Danarů před vámi nedokázala, jelikož jsem jim boty šil já a to strojově. Takže s chutí do díla.\r\n<ol>\r\n	<li>Zapomeňte na boty, které nosíme. Šili jsme je v době počátečních znalostí historie – tudíž nejsou dobové. Vy si uděláte lepší a dobovější.</li>\r\n	<li>Než začnete řezat drahou kůži, je lepší udělat prototyp z obyčejnějšího materiálu jako koženky nebo plátna. Zjistíte tak možné chyby a střih můžete patřičně upravit. Když vše sedí, botu rozpáráte a získáte konečný střih pro použití kůže.</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div>\r\n<div>\r\n<div>\r\n<h3>Materiál</h3>\r\nZde bych připomněl jedno oblíbené rčení, které se týká ostatně celé výroby bot – Kdo nechce, hledá důvod, kdo chce, hledá způsob. Za mých mladých let, tedy v mých 12-ti, žádné obchody stylu „kutil“ neexistovaly, takže se hledalo, až se našlo – stará kožená taška ...\r\n<h3>Střih a šití</h3>\r\nStřihů je celá řada. Důležité k výrobě střihu jsou míry vaší nohy. Pro názornost jsem vybral jednu botu pouze ze tří kusů (podešev není na obrázku), aby ...\r\n\r\n</div>\r\n</div>\r\n</div>', 'Jak si ušít gotické boty - PDF', '', 'inherit', 'open', 'open', '', '64-revision-3', '', '', '2013-02-19 15:21:56', '2013-02-19 15:21:56', '', 64, 'http://localhost:8888/64-revision-3/', 0, 'revision', '', 0),
(72, 1, '2013-02-19 15:43:14', '2013-02-19 15:43:14', 'Na internetu naleznete několik pěkných ukázek jak sestřihnout šablony a střihy pro výrobu kožených bot. Určitě nejdřív doporučuji vytvořit šablonu na nějaký levný materiál - plátno, látku. Vyzkoušet na nohu a poté vytvořit šablonu na tvrdý papír podle kterého budete později vyřezávat z kůže (eliminujete pro to špatné řezy a spotřebu kůže).\r\n<h2>Historické kožené boty</h2>\r\nTyto nákresy naleznete v předchozím článku v PDF dokumentu k stažení.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45.png"><img class="size-medium wp-image-73 alignleft" alt="Snímek obrazovky 2013-02-19 v 16.27.45" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45-218x300.png" width="218" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38.png"><img class="size-medium wp-image-74 alignleft" alt="Snímek obrazovky 2013-02-19 v 16.27.38" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38-187x300.png" width="187" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot1.jpg"><img class="size-medium wp-image-75 alignleft" alt="nakresybot1" src="http://localhost:8888/wp-content/uploads/nakresybot1-139x300.jpg" width="139" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot2.jpg"><img class="size-medium wp-image-76 alignleft" alt="nakresybot2" src="http://localhost:8888/wp-content/uploads/nakresybot2-300x298.jpg" width="322" height="319" /></a>\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot4.jpg"><img class="size-medium wp-image-78 alignleft" alt="nakresybot4" src="http://localhost:8888/wp-content/uploads/nakresybot4-300x277.jpg" width="196" height="181" /></a><a href="http://localhost:8888/wp-content/uploads/nakresybot3.jpg"><img class="size-medium wp-image-77 alignleft" alt="nakresybot3" src="http://localhost:8888/wp-content/uploads/nakresybot3-219x300.jpg" width="151" height="203" /></a>', 'Ruční výroba kožených bot - Nákresy a střihy', '', 'publish', 'open', 'open', '', 'rucni-vyroba-koznych-bot-nakresy-a-strihy', '', '', '2013-03-26 14:44:19', '2013-03-26 14:44:19', '', 0, 'http://localhost:8888/?p=72', 0, 'post', '', 0),
(73, 1, '2013-02-19 15:28:03', '2013-02-19 15:28:03', '', 'Snímek obrazovky 2013-02-19 v 16.27.45', '', 'inherit', 'open', 'open', '', 'snimek-obrazovky-2013-02-19-v-16-27-45', '', '', '2013-02-19 15:28:03', '2013-02-19 15:28:03', '', 72, 'http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45.png', 0, 'attachment', 'image/png', 0),
(74, 1, '2013-02-19 15:28:04', '2013-02-19 15:28:04', '', 'Snímek obrazovky 2013-02-19 v 16.27.38', '', 'inherit', 'open', 'open', '', 'snimek-obrazovky-2013-02-19-v-16-27-38', '', '', '2013-02-19 15:28:04', '2013-02-19 15:28:04', '', 72, 'http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38.png', 0, 'attachment', 'image/png', 0),
(75, 1, '2013-02-19 15:42:39', '2013-02-19 15:42:39', '', 'nakresybot1', '', 'inherit', 'open', 'open', '', 'nakresybot1', '', '', '2013-02-19 15:42:39', '2013-02-19 15:42:39', '', 72, 'http://localhost:8888/wp-content/uploads/nakresybot1.jpg', 0, 'attachment', 'image/jpeg', 0),
(76, 1, '2013-02-19 15:42:40', '2013-02-19 15:42:40', '', 'nakresybot2', '', 'inherit', 'open', 'open', '', 'nakresybot2', '', '', '2013-02-19 15:42:40', '2013-02-19 15:42:40', '', 72, 'http://localhost:8888/wp-content/uploads/nakresybot2.jpg', 0, 'attachment', 'image/jpeg', 0),
(77, 1, '2013-02-19 15:42:40', '2013-02-19 15:42:40', '', 'nakresybot3', '', 'inherit', 'open', 'open', '', 'nakresybot3', '', '', '2013-02-19 15:42:40', '2013-02-19 15:42:40', '', 72, 'http://localhost:8888/wp-content/uploads/nakresybot3.jpg', 0, 'attachment', 'image/jpeg', 0),
(78, 1, '2013-02-19 15:42:41', '2013-02-19 15:42:41', '', 'nakresybot4', '', 'inherit', 'open', 'open', '', 'nakresybot4', '', '', '2013-02-19 15:42:41', '2013-02-19 15:42:41', '', 72, 'http://localhost:8888/wp-content/uploads/nakresybot4.jpg', 0, 'attachment', 'image/jpeg', 0),
(79, 1, '2013-02-19 15:42:22', '2013-02-19 15:42:22', 'Na internetu naleznete několik pěkných ukázek jak sestřihnout šablony a střihy pro výrobu kožených bot. Určitě nejdřív doporučuji vytvořit šablonu na nějaký levný materiál - plátno, látku. Vyzkoušet na nohu a poté vytvořit šablonu na tvrdý papír podle kterého budete později vyřezávat z kůže (eliminujete pro to špatné řezy a spotřebu kůže).\n<h2>Historické kožené boty</h2>\nTyto nákresy naleznete v předchozím článku v PDF dokumentu k stažení.\n\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45.png"><img class="alignnone size-medium wp-image-73" alt="Snímek obrazovky 2013-02-19 v 16.27.45" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45-218x300.png" width="218" height="300" /></a>\n\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38.png"><img class="alignnone size-medium wp-image-74" alt="Snímek obrazovky 2013-02-19 v 16.27.38" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38-187x300.png" width="187" height="300" /></a>', 'Ruční výroba kožných bot - Nákresy a střihy', '', 'inherit', 'open', 'open', '', '72-revision', '', '', '2013-02-19 15:42:22', '2013-02-19 15:42:22', '', 72, 'http://localhost:8888/72-revision/', 0, 'revision', '', 0),
(80, 1, '2013-02-19 15:43:14', '2013-02-19 15:43:14', 'Na internetu naleznete několik pěkných ukázek jak sestřihnout šablony a střihy pro výrobu kožených bot. Určitě nejdřív doporučuji vytvořit šablonu na nějaký levný materiál - plátno, látku. Vyzkoušet na nohu a poté vytvořit šablonu na tvrdý papír podle kterého budete později vyřezávat z kůže (eliminujete pro to špatné řezy a spotřebu kůže).\r\n<h2>Historické kožené boty</h2>\r\nTyto nákresy naleznete v předchozím článku v PDF dokumentu k stažení.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45.png"><img class="alignnone size-medium wp-image-73" alt="Snímek obrazovky 2013-02-19 v 16.27.45" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45-218x300.png" width="218" height="300" /></a>\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38.png"><img class="alignnone size-medium wp-image-74" alt="Snímek obrazovky 2013-02-19 v 16.27.38" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38-187x300.png" width="187" height="300" /></a>\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot1.jpg"><img class="alignnone size-medium wp-image-75" alt="nakresybot1" src="http://localhost:8888/wp-content/uploads/nakresybot1-139x300.jpg" width="139" height="300" /></a> <a href="http://localhost:8888/wp-content/uploads/nakresybot2.jpg"><img class="alignnone size-medium wp-image-76" alt="nakresybot2" src="http://localhost:8888/wp-content/uploads/nakresybot2-300x298.jpg" width="300" height="298" /></a> <a href="http://localhost:8888/wp-content/uploads/nakresybot3.jpg"><img class="alignnone size-medium wp-image-77" alt="nakresybot3" src="http://localhost:8888/wp-content/uploads/nakresybot3-219x300.jpg" width="219" height="300" /></a> <a href="http://localhost:8888/wp-content/uploads/nakresybot4.jpg"><img class="alignnone size-medium wp-image-78" alt="nakresybot4" src="http://localhost:8888/wp-content/uploads/nakresybot4-300x277.jpg" width="300" height="277" /></a>', 'Ruční výroba kožných bot - Nákresy a střihy', '', 'inherit', 'open', 'open', '', '72-revision-2', '', '', '2013-02-19 15:43:14', '2013-02-19 15:43:14', '', 72, 'http://localhost:8888/72-revision-2/', 0, 'revision', '', 0),
(81, 1, '2013-02-19 15:45:43', '2013-02-19 15:45:43', '', 'Snímek obrazovky 2013-02-19 v 16.54.05', '', 'inherit', 'open', 'open', '', 'snimek-obrazovky-2013-02-19-v-16-54-05', '', '', '2013-02-19 15:45:43', '2013-02-19 15:45:43', '', 72, 'http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.54.05.png', 0, 'attachment', 'image/png', 0),
(82, 1, '2013-02-19 15:43:57', '2013-02-19 15:43:57', 'Na internetu naleznete několik pěkných ukázek jak sestřihnout šablony a střihy pro výrobu kožených bot. Určitě nejdřív doporučuji vytvořit šablonu na nějaký levný materiál - plátno, látku. Vyzkoušet na nohu a poté vytvořit šablonu na tvrdý papír podle kterého budete později vyřezávat z kůže (eliminujete pro to špatné řezy a spotřebu kůže).\r\n<h2>Historické kožené boty</h2>\r\nTyto nákresy naleznete v předchozím článku v PDF dokumentu k stažení.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45.png"><img class="alignnone size-medium wp-image-73" alt="Snímek obrazovky 2013-02-19 v 16.27.45" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45-218x300.png" width="218" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38.png"><img class="alignnone size-medium wp-image-74" alt="Snímek obrazovky 2013-02-19 v 16.27.38" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38-187x300.png" width="187" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot1.jpg"><img class="alignnone size-medium wp-image-75" alt="nakresybot1" src="http://localhost:8888/wp-content/uploads/nakresybot1-139x300.jpg" width="139" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot2.jpg"><img class="alignnone size-medium wp-image-76" alt="nakresybot2" src="http://localhost:8888/wp-content/uploads/nakresybot2-300x298.jpg" width="300" height="298" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot3.jpg"><img class="alignnone size-medium wp-image-77" alt="nakresybot3" src="http://localhost:8888/wp-content/uploads/nakresybot3-219x300.jpg" width="219" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot4.jpg"><img class="alignnone size-medium wp-image-78" alt="nakresybot4" src="http://localhost:8888/wp-content/uploads/nakresybot4-300x277.jpg" width="300" height="277" /></a>', 'Ruční výroba kožných bot - Nákresy a střihy', '', 'inherit', 'open', 'open', '', '72-revision-3', '', '', '2013-02-19 15:43:57', '2013-02-19 15:43:57', '', 72, 'http://localhost:8888/72-revision-3/', 0, 'revision', '', 0),
(83, 1, '2013-02-19 15:45:47', '2013-02-19 15:45:47', 'Na internetu naleznete několik pěkných ukázek jak sestřihnout šablony a střihy pro výrobu kožených bot. Určitě nejdřív doporučuji vytvořit šablonu na nějaký levný materiál - plátno, látku. Vyzkoušet na nohu a poté vytvořit šablonu na tvrdý papír podle kterého budete později vyřezávat z kůže (eliminujete pro to špatné řezy a spotřebu kůže).\r\n<h2>Historické kožené boty</h2>\r\nTyto nákresy naleznete v předchozím článku v PDF dokumentu k stažení.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45.png"><img class="alignnone size-medium wp-image-73" alt="Snímek obrazovky 2013-02-19 v 16.27.45" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45-218x300.png" width="218" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38.png"><img class="alignnone size-medium wp-image-74" alt="Snímek obrazovky 2013-02-19 v 16.27.38" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38-187x300.png" width="187" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot1.jpg"><img class="alignnone size-medium wp-image-75" alt="nakresybot1" src="http://localhost:8888/wp-content/uploads/nakresybot1-139x300.jpg" width="139" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot2.jpg"><img class="alignnone size-medium wp-image-76" alt="nakresybot2" src="http://localhost:8888/wp-content/uploads/nakresybot2-300x298.jpg" width="300" height="298" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot3.jpg"><img class="alignnone size-medium wp-image-77" alt="nakresybot3" src="http://localhost:8888/wp-content/uploads/nakresybot3-219x300.jpg" width="219" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot4.jpg"><img class="alignnone size-medium wp-image-78" alt="nakresybot4" src="http://localhost:8888/wp-content/uploads/nakresybot4-300x277.jpg" width="300" height="277" /></a>', 'Ruční výroba kožných bot - Nákresy a střihy', '', 'inherit', 'open', 'open', '', '72-revision-4', '', '', '2013-02-19 15:45:47', '2013-02-19 15:45:47', '', 72, 'http://localhost:8888/72-revision-4/', 0, 'revision', '', 0),
(84, 1, '2013-02-19 15:53:54', '2013-02-19 15:53:54', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\r\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\n<div>\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" /></td>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" width="326" height="252" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'publish', 'open', 'open', '', 'vyroba-prevracenych-bot', '', '', '2013-02-20 08:34:01', '2013-02-20 08:34:01', '', 0, 'http://localhost:8888/?p=84', 0, 'post', '', 0),
(92, 1, '2013-02-20 08:19:55', '2013-02-20 08:19:55', '<div>\r\n<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.</strong>\r\n\r\nAutor: Petr Šrámek, http://curiavitkov.cz/clanek18.html</blockquote>\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk</a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-5', '', '', '2013-02-20 08:19:55', '2013-02-20 08:19:55', '', 84, 'http://localhost:8888/84-revision-5/', 0, 'revision', '', 0),
(93, 1, '2013-02-20 08:21:27', '2013-02-20 08:21:27', '', 'Snímek obrazovky 2013-02-20 v 9.29.43', '', 'inherit', 'open', 'open', '', 'snimek-obrazovky-2013-02-20-v-9-29-43', '', '', '2013-02-20 08:21:27', '2013-02-20 08:21:27', '', 84, 'http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-20-v 9.29.43.png', 0, 'attachment', 'image/png', 0),
(94, 1, '2013-02-20 08:20:36', '2013-02-20 08:20:36', '&nbsp;\r\n<div>\r\n<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.</strong>\r\n\r\nAutor: Petr Šrámek, <a rel="nofollow" href="http://curiavitkov.cz/clanek18.html">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk</a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-6', '', '', '2013-02-20 08:20:36', '2013-02-20 08:20:36', '', 84, 'http://localhost:8888/84-revision-6/', 0, 'revision', '', 0),
(95, 1, '2013-02-20 08:21:32', '2013-02-20 08:21:32', '&nbsp;\r\n<div>\r\n<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.</strong>\r\n\r\nAutor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk</a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-7', '', '', '2013-02-20 08:21:32', '2013-02-20 08:21:32', '', 84, 'http://localhost:8888/84-revision-7/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(85, 1, '2013-02-19 15:53:24', '2013-02-19 15:53:24', '<div>\n\nVkrásný návod na výrobu převrácených historických bot.\n\nPetr Šrámek, http://curiavitkov.cz/clanek18.html\n\n<img alt="bota" src="http://curiavitkov.cz/images/zivot/boty3.jpg" width="454" height="265" />\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\n\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\n\nBoty mohou vypadat třeba takto (nálezy z Yorku):\n\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\n\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\n\nNebo takto (nálezy z Yorku):\n\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\n\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\n\n&nbsp;\n\nJak tedy podobnou botu, která bude zdobit nohu, bude historicky odpovídající a nebude nás stát mnoho peněz vyrobíte? Nejdříve zahoďte kanady obalené králičí kožkou, vysmějte se pověrám, že kožené podešvě kloužou více než guma mechovka a vyčleňte si několik hodin času. Pokračujte tím, že si seženete následující materiál:\n<ul>\n	<li><strong>Kůži o síle cca 2 mm na svršek </strong>. Použijte usni činěnou rostlinnými tříslovinami, ne odpornou šedivou chromovanou kůži. Barvu volíme hnědou, spíše světlejší. Ne černou, ne zelenou, ne červenou či jinou umělou barvu.</li>\n	<li><strong>Kůži o síle 4-6 mm na podešve </strong>. Pokud možno ne lisovanou, špatně se do ní dělají šídlem díry a trhá se.</li>\n	<li><strong>Dvě silnější jehly </strong>, pokud možno s ouškem v síle jehly. Jelikož jehly rády praskají či se ohýbají, doporučuji pořídít si jich více.</li>\n	<li><strong>Lněnou sedlářskou dratev </strong>.</li>\n	<li><strong>Šídlo </strong>. V případě, že neplánujete šít více párů, či s kůží pracovat pravidelně, může šídlo nahradit silná jehla zaražená do korkové zátky nebo podobného držáku. Pracuje se s ní ale výrazně hůře. Pokud kupujete šídlo, doporučuji hrot s kosočtvererčným průřezem. Lépe kůži řeže.</li>\n	<li><strong>Ševcovský pop, nebo včelí vosk </strong>. Dratev je v průběhu práce nutno bohatě voskovat kvůli impregnaci a zvýšení trvanlivosti. Více vosku či popu je lepší než méně!</li>\n	<li><strong>Velké nůžky nebo knejp či ostrý nůž </strong> na řezání kůže. Nůžky lépe kontrolujete, ale s knejpem jsou okraje hezčí a lépe se s nimi pracuje. Zvláště podešev je lepší vyříznout.</li>\n	<li>Pro ulehčení práce byste ještě mohli potřebovat <strong>kleště kombinačky , náprstek a větší vařečku </strong>.</li>\n	<li>Pro výrobu "modelu" <strong>silnější čtvertku nebo lepenku, lepicí pásku, sešívačku, fix, kus silnější látky, nůžky </strong>.</li>\n</ul>\n&nbsp;\n\n<strong>1. Výběr vzoru </strong>\nVzor si vyberte podle dostupné literatury. Hezké příklady jsou na <a href="http://www.personal.utulsa.edu/%7Emarc-carlson/shoe/SHOEHOME.HTM">stránce Marca Carlsona </a>, inspirovat se můžete i fotografiemi výše. Když víte, jak by měla bota vypadat, pustíte se do Výroby modelu, podle kterého pak budete stříhat kůži. Několik pravidel, které platí po celou dobu práce:\n<ul>\n	<li><strong>Dvakrát měr, jednou stříhej! </strong></li>\n	<li><strong>Každá minuta práce při přípravě mi ušetří pět minut při samotné práci</strong></li>\n	<li><strong>Nikdy neříkám "To stačí", vždy vše dotáhnu do dokonalosti </strong></li>\n	<li><strong>Neexistuje nešikovný člověk, jsou jen lidé, kteří to nezkoušeli dostatečně dlouho. </strong></li>\n	<li><strong>Co jednou ustřihnu, už nepřilepím. Proto stříhám pomalu, opatrně a po kouscích. </strong></li>\n</ul>\n&nbsp;\n\n<strong>2. Výroba modelu </strong>\nModel je bota z papíru a látky, podle které pak nastříháte kůži. Při jejím vytváření pracujte pečlivě, když botu ušijete podle špatného vzoru, nebude vám sedět.\nZačněte obkreslením chodidla na papír. Je důležité uvědomit si, jak budete botu nosit - na boso nebo jen s ponožkou, nebou budete používat onuce a vycpávání bot proti zimě? Podle toho si chodidlo obkreslete buď tužkou kolmo k papíru, nebo objedete linii dotyku zatíženého chodidla s podložkou. Modrá linie je tužkou kolmo k podložce, červená linie dotyku s podložkou.\n<img alt="nákres" src="http://curiavitkov.cz/images/clanky/1.JPG" width="465" height="270" />\nPřidejte minimálně centimetr u prstů, dokreslete tvar podrážky dle libosti (jsou dokázány jak mírně zašpičatělé, tak zakulacené špičky) a vystřihněte ji z tvrdého papíru.\n<img alt="model" src="http://curiavitkov.cz/images/clanky/2.JPG" width="433" height="311" />\nPodrážka nahoře je historičtější a patří na boty, které budou vycpány vlnou či senem, nebo do nich budete nosit onuce. Spodní podrážka je mladší, objevuje se na botách z vrcholného středověku, bota s touto podrážkou výrazně lépe sedí na noze bosé či s tenkou ponožkou.\nZískáme ji tak, že kromě rozšíření i prstů odstříháme všechny části, které vyčnívají mezi zatíženou nohou a podložkou (tip: postavte se na podložku a požádejte někoho, ať jede prstem kolem nohy. Kde ucítí vyčnívající podrážku, udělá značku, tu část poté odstříhnete). Výsledná podrážka má extrémně úzkou patu. Tak to má být! Viz (Mark Carlson)\n<img alt="bota - Marc Carlson" src="http://www.personal.utulsa.edu/%7Emarc-carlson/shoe2/proj2.jpg" />\nPřevzato z: http://www.personal.utulsa.edu/~marc-carlson\nPostavte se na výslednou podrážku a omotejte látku kolem přední částí nohy:\n<img alt="model" src="http://curiavitkov.cz/images/clanky/3.jpg" width="407" height="299" />\nLinii styku látky s podrážkou označte fixem, zvýrazněte místo, kde máte palec:\n<img alt="model" src="http://curiavitkov.cz/images/clanky/4.jpg" width="336" height="381" />\nZískali jste střih přední části svršku. Nezapomeňte si jej popsat, později můžete snadno ztratit předhled, která část to je!\n<img alt="model" src="http://curiavitkov.cz/images/clanky/5.jpg" width="422" height="307" />\nVystřizenou část svršku pomocí lepicí pásky přichytněte k podrážce. Doporučuji přicvaknout svršek sešívačkou na místě, kde je palec. Z tohoto místa pak budete vždy vycházet při stříhání i šití. Vznikne nám tak hezký pantofel:\n<img alt="model" src="http://curiavitkov.cz/images/clanky/6.jpg" width="453" height="303" />\nJak je vidět, po zasunutí nohy tak, jak bude v botě, vznikly na svršku faldy. Ty je nutno odstranit úpravami svršku. Stejně tak můžeme upravit podrážku, pokud je příliš široká či úzká, nebo vytváří "kachní nohu". Konečný výsledek musí být hezky rovný:\n<img alt="model" src="http://curiavitkov.cz/images/clanky/7.jpg" width="468" height="323" />\nDalším krokem je dotvoření celého svršku tak, jak má vypadat, včetně případného zapínání, slepení dohromady pomocí pásky a případně sešívačky:\n<img alt="model" src="http://curiavitkov.cz/images/clanky/8.jpg" width="473" height="279" />\nNa místech, kde je třeba úpravy svršku, si potřebné označte fixem. Poprovedení úprav a opětovném vyzkoušení botu sundejte a oddělte svršek od podrážky.\n<img alt="model" src="http://curiavitkov.cz/images/clanky/9.jpg" width="347" height="411" />\nSvršek býval většinou z jednoho kusu, spojující šev na vnější straně chodidla. Postupujeme v souladu s tím. Výsledek je následující:\n<img alt="model" src="http://curiavitkov.cz/images/clanky/10.jpg" width="487" height="285" />\nJak je vidět, tento tvar byste z jednoho kusu kůže nevystříhli. Proto jej upravte, v tomto případě mírný zastříhnutím přední části svršku a změnou úhlu pásku zapínání. Takhle už by to šlo.\n<img alt="model" src="http://curiavitkov.cz/images/clanky/12.jpg" width="476" height="264" />\nMusíte ale znovu vyzkoušet, jestli bota sedne na nohu i v novém tvaru. Pokud si věříte, stačí zkusit jen svršek, ideálně ale znovu slepte celý model včetně podrážky. Pomocí lepicí pásky můžete dodat chybějící části svršku tam, kde jste stříhali příliš horlivě:\n<img alt="model" src="http://curiavitkov.cz/images/clanky/13.JPG" width="440" height="287" />\nJe to v pořádku, máte tedy střih. Nahoře je nově vytvořený střih, dole střih na stejnou velikost nohy, ale jiný typ obuvi.\n<img alt="model" src="http://curiavitkov.cz/images/clanky/14.JPG" width="399" height="364" />\nMůžete se tedy dát do stříhání kůže.\n\n<strong>3. Stříhání </strong>\nZačněte podrážkou.\n<img alt="model" src="http://curiavitkov.cz/images/clanky/15.JPG" width="459" height="246" />\nNa kus silné kůže si obkreslíte z obou stran střih podrážky. Doporučuji označit si obkreslenou stranu a pak dělat druhou.\n<img alt="model" src="http://curiavitkov.cz/images/clanky/16.JPG" width="429" height="321" />\nS úspěšně získanými dvěma podrážkami se pustíte do svršku.\nJedna rada hned na začátek: pokud jsou na svršku nástřihy či ostré úhly, dělejte je vzdy tak, že vyrazíte do kůže dírku a stříháte k ní.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/17.JPG" width="382" height="266" />\nZabráníte tím tomu, aby se kůže při namáhání trhala.\nNa konci svršku nechejte vždy o cca 5 cm kůže více, pro případ, že by šití nevyšlo zcela přesně.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/18.jpg" width="452" height="309" />\nDalším krokem je naděrování podrážky pro šití. Nejpraktičtější je vytlačit se rýhu asi 0,5 cm od okraje\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/19.jpg" width="402" height="323" />\npak na ní udělat po opět cca 0,5 cm čárky\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/20.jpg" width="434" height="275" />\nMůžete použít i propisku, vevnitř boty to většinou nebude vidět.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/21.jpg" width="476" height="265" />\nNásledně podrážku kolem dokola naděrujeme, a to tak, aby díra šla od značky do přibližně středu okraje kůže.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/22.jpg" width="492" height="239" />\nPak už můžeme začít našívat svršek.\n\n<strong>4. Šití </strong>\nZačněte od značky u palce, kde slícujete svršek a podrážku. Doporučuji jedincům se slabšími prsty postupovat následovně:\nUdělejte šídlem skrze podrážku díru do svršku (siláci mohou vynechat a rvát tam rovnou jehlu).\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/23.jpg" width="457" height="384" />\nProtáhněte první nit. Nit neustále silně voskujte, pokud to dělat nebudete, rozpadne se vám za nepříjemně krátkou chvíli.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/24.jpg" width="450" height="359" />\nProtáhněte druhou nit.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/25.jpg" width="461" height="383" />\nA řádně utáhneme.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/26.jpg" width="450" height="354" />\nPokračujte, dokud nemáte hotový celý šev. Pozor na místo, kde se svršek spojuje. Jen konec nastřihněte, neoddělujte jej celý!\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/27.jpg" width="480" height="356" />\nHotový šev vypadá následovně:\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/28.jpg" width="493" height="308" />\nJak je ale vidět, podrážka je nerovná a okraje svršu přečnívají.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/29.jpg" width="445" height="333" />\nJelikož tato část boty bude ve styku s chodidlem, je třeba udělat ji co nejhladší. Proto přečnívající okraje kůže ořežte (pozor na švy!) a nerovnosti zahlaďte poklepáním paličkou s hladkým čelem, nebo zatlačením lžící.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/30.jpg" width="451" height="310" />\nCelá boty je teď naruby a téměř hotová.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/31.jpg" width="513" height="322" />\nBotu tedy obraťte. Není to složité. Začněte špičkou, kterou ale obracíte od otvoru boty směrem ke špici. Pokud obrátit nejde, namočte ji do vody, popřípadě použijte varečku a protlačení vzpurných částí.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/32.jpg" width="460" height="348" />\nPoté si botu vyzkoušejte a případně upravte. Hlavně si ověřte, že dovnitř snadno dostanete nohu. Poslední krokem v šití hrubého boty je spojení svršku. Použijte skrytý šev, který není vidětz ani z jedné strany boty a díky tomu je chráněn před předřením.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/33.jpg" width="450" height="359" />\n\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/34.jpg" width="452" height="378" />\n\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/35.jpg" width="435" height="340" />\n\n<strong>5. Dokončení </strong>\nOkraje boty můžete následně olemovat. Vypadá to lépe a také zabraňuje vytahování kůže při nošení. Používal se kožený řemínek nebo obšití.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/36.jpg" width="459" height="322" />\nJe možné použít různé dekorativní oplety a švy, například tzv. přikrývkový.\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/37.jpg" width="431" height="367" />\nZcela obšité botě chybí už jen zapínání.\n<img alt="obšívání" src="http://curiavitkov.cz/images/clanky/38.jpg" width="486" height="313" />\nNezapoměňte, že knoflíky není možno regulovat, a proto, když si do boty vezmete v zimě dvoje onuce, nemusíte ji zapnout. U těchto bot jsem proto zvolil vázání.\n<img alt="obšívání" src="http://curiavitkov.cz/images/clanky/39.jpg" width="450" height="315" />\n\n<img alt="zapínání" src="http://curiavitkov.cz/images/clanky/40.jpg" width="442" height="291" />\nBota je hotová, směle do druhé a pak vzhůru do lesů či boje!\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/41.jpg" width="420" height="296" /><img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/42.jpg" width="280" height="348" />\n\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/43.jpg" width="457" height="340" />\n\n&nbsp;\n\n&nbsp;\n\n<a href="http://curiavitkov.cz/clanky2.html"><img title="Články" alt="články" src="http://curiavitkov.cz/images/sipka3.jpg" width="70" height="61" border="0" /></a>\n\n</div>\n<div>\n\nHlavní navigace: <a href="http://curiavitkov.cz/clanky2.html">Články</a> <a href="http://curiavitkov.cz/index.html">Úvodní stránka</a>\n\n</div>\n<a href="http://www.toplist.cz/" target="_top"><img alt="TOPlist" src="http://toplist.cz/count.asp?id=967950" width="1px" height="1px" border="0" /></a>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision', '', '', '2013-02-19 15:53:24', '2013-02-19 15:53:24', '', 84, 'http://localhost:8888/84-revision/', 0, 'revision', '', 0),
(88, 1, '2013-02-19 15:57:49', '2013-02-19 15:57:49', '<div>\r\n\r\n<strong>Pěkný návod na výrobu převrácených historických bot.</strong>\r\n\r\nAutor: Petr Šrámek, http://curiavitkov.cz/clanek18.html\r\n\r\n<img alt="bota" src="http://curiavitkov.cz/images/zivot/boty3.jpg" width="454" height="265" />\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk  </a>\r\n\r\nJak tedy podobnou botu, která bude zdobit nohu, bude historicky odpovídající a nebude nás stát mnoho peněz vyrobíte? Nejdříve zahoďte kanady obalené králičí kožkou, vysmějte se pověrám, že kožené podešvě kloužou více než guma mechovka a vyčleňte si několik hodin času. Pokračujte tím, že si seženete následující materiál:\r\n<ul>\r\n	<li><strong>Kůži o síle cca 2 mm na svršek </strong>. Použijte usni činěnou rostlinnými tříslovinami, ne odpornou šedivou chromovanou kůži. Barvu volíme hnědou, spíše světlejší. Ne černou, ne zelenou, ne červenou či jinou umělou barvu.</li>\r\n	<li><strong>Kůži o síle 4-6 mm na podešve </strong>. Pokud možno ne lisovanou, špatně se do ní dělají šídlem díry a trhá se.</li>\r\n	<li><strong>Dvě silnější jehly </strong>, pokud možno s ouškem v síle jehly. Jelikož jehly rády praskají či se ohýbají, doporučuji pořídít si jich více.</li>\r\n	<li><strong>Lněnou sedlářskou dratev </strong>.</li>\r\n	<li><strong>Šídlo </strong>. V případě, že neplánujete šít více párů, či s kůží pracovat pravidelně, může šídlo nahradit silná jehla zaražená do korkové zátky nebo podobného držáku. Pracuje se s ní ale výrazně hůře. Pokud kupujete šídlo, doporučuji hrot s kosočtvererčným průřezem. Lépe kůži řeže.</li>\r\n	<li><strong>Ševcovský pop, nebo včelí vosk </strong>. Dratev je v průběhu práce nutno bohatě voskovat kvůli impregnaci a zvýšení trvanlivosti. Více vosku či popu je lepší než méně!</li>\r\n	<li><strong>Velké nůžky nebo knejp či ostrý nůž </strong> na řezání kůže. Nůžky lépe kontrolujete, ale s knejpem jsou okraje hezčí a lépe se s nimi pracuje. Zvláště podešev je lepší vyříznout.</li>\r\n	<li>Pro ulehčení práce byste ještě mohli potřebovat <strong>kleště kombinačky , náprstek a větší vařečku </strong></li>\r\n	<li>Pro výrobu "modelu" <strong>silnější čtvertku nebo lepenku, lepicí pásku, sešívačku, fix, kus silnější látky, nůžky</strong></li>\r\n</ul>\r\n<strong>1. Výběr vzoru </strong>\r\nVzor si vyberte podle dostupné literatury. Hezké příklady jsou na <a href="http://www.personal.utulsa.edu/%7Emarc-carlson/shoe/SHOEHOME.HTM">stránce Marca Carlsona </a>, inspirovat se můžete i fotografiemi výše. Když víte, jak by měla bota vypadat, pustíte se do Výroby modelu, podle kterého pak budete stříhat kůži. Několik pravidel, které platí po celou dobu práce:\r\n<ul>\r\n	<li><strong>Dvakrát měr, jednou stříhej! </strong></li>\r\n	<li><strong>Každá minuta práce při přípravě mi ušetří pět minut při samotné práci</strong></li>\r\n	<li><strong>Nikdy neříkám "To stačí", vždy vše dotáhnu do dokonalosti </strong></li>\r\n	<li><strong>Neexistuje nešikovný člověk, jsou jen lidé, kteří to nezkoušeli dostatečně dlouho. </strong></li>\r\n	<li><strong>Co jednou ustřihnu, už nepřilepím. Proto stříhám pomalu, opatrně a po kouscích. </strong></li>\r\n</ul>\r\n<strong>2. Výroba modelu </strong>\r\nModel je bota z papíru a látky, podle které pak nastříháte kůži. Při jejím vytváření pracujte pečlivě, když botu ušijete podle špatného vzoru, nebude vám sedět.\r\nZačněte obkreslením chodidla na papír. Je důležité uvědomit si, jak budete botu nosit - na boso nebo jen s ponožkou, nebou budete používat onuce a vycpávání bot proti zimě? Podle toho si chodidlo obkreslete buď tužkou kolmo k papíru, nebo objedete linii dotyku zatíženého chodidla s podložkou. Modrá linie je tužkou kolmo k podložce, červená linie dotyku s podložkou.\r\n<img alt="nákres" src="http://curiavitkov.cz/images/clanky/1.JPG" width="465" height="270" />\r\nPřidejte minimálně centimetr u prstů, dokreslete tvar podrážky dle libosti (jsou dokázány jak mírně zašpičatělé, tak zakulacené špičky) a vystřihněte ji z tvrdého papíru.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/2.JPG" width="433" height="311" />\r\nPodrážka nahoře je historičtější a patří na boty, které budou vycpány vlnou či senem, nebo do nich budete nosit onuce. Spodní podrážka je mladší, objevuje se na botách z vrcholného středověku, bota s touto podrážkou výrazně lépe sedí na noze bosé či s tenkou ponožkou.\r\nZískáme ji tak, že kromě rozšíření i prstů odstříháme všechny části, které vyčnívají mezi zatíženou nohou a podložkou (tip: postavte se na podložku a požádejte někoho, ať jede prstem kolem nohy. Kde ucítí vyčnívající podrážku, udělá značku, tu část poté odstříhnete). Výsledná podrážka má extrémně úzkou patu. Tak to má být! Viz (Mark Carlson)\r\n<img alt="bota - Marc Carlson" src="http://www.personal.utulsa.edu/%7Emarc-carlson/shoe2/proj2.jpg" />\r\nPřevzato z: http://www.personal.utulsa.edu/~marc-carlson\r\nPostavte se na výslednou podrážku a omotejte látku kolem přední částí nohy:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/3.jpg" width="407" height="299" />\r\nLinii styku látky s podrážkou označte fixem, zvýrazněte místo, kde máte palec:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/4.jpg" width="336" height="381" />\r\n\r\nZískali jste střih přední části svršku. Nezapomeňte si jej popsat, později můžete snadno ztratit předhled, která část to je!\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/5.jpg" width="422" height="307" />\r\n\r\nVystřizenou část svršku pomocí lepicí pásky přichytněte k podrážce. Doporučuji přicvaknout svršek sešívačkou na místě, kde je palec. Z tohoto místa pak budete vždy vycházet při stříhání i šití. Vznikne nám tak hezký pantofel:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/6.jpg" width="453" height="303" />\r\n\r\nJak je vidět, po zasunutí nohy tak, jak bude v botě, vznikly na svršku faldy. Ty je nutno odstranit úpravami svršku. Stejně tak můžeme upravit podrážku, pokud je příliš široká či úzká, nebo vytváří "kachní nohu". Konečný výsledek musí být hezky rovný:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/7.jpg" width="468" height="323" />\r\n\r\nDalším krokem je dotvoření celého svršku tak, jak má vypadat, včetně případného zapínání, slepení dohromady pomocí pásky a případně sešívačky:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/8.jpg" width="473" height="279" />\r\n\r\nNa místech, kde je třeba úpravy svršku, si potřebné označte fixem. Poprovedení úprav a opětovném vyzkoušení botu sundejte a oddělte svršek od podrážky.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/9.jpg" width="347" height="411" />\r\n\r\nSvršek býval většinou z jednoho kusu, spojující šev na vnější straně chodidla. Postupujeme v souladu s tím. Výsledek je následující:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/10.jpg" width="487" height="285" />\r\n\r\nJak je vidět, tento tvar byste z jednoho kusu kůže nevystříhli. Proto jej upravte, v tomto případě mírný zastříhnutím přední části svršku a změnou úhlu pásku zapínání. Takhle už by to šlo.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/12.jpg" width="476" height="264" />\r\n\r\nMusíte ale znovu vyzkoušet, jestli bota sedne na nohu i v novém tvaru. Pokud si věříte, stačí zkusit jen svršek, ideálně ale znovu slepte celý model včetně podrážky. Pomocí lepicí pásky můžete dodat chybějící části svršku tam, kde jste stříhali příliš horlivě:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/13.JPG" width="440" height="287" />\r\n\r\nJe to v pořádku, máte tedy střih. Nahoře je nově vytvořený střih, dole střih na stejnou velikost nohy, ale jiný typ obuvi.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/14.JPG" width="399" height="364" />\r\n\r\nMůžete se tedy dát do stříhání kůže.\r\n\r\n<strong>3. Stříhání </strong>\r\nZačněte podrážkou.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/15.JPG" width="459" height="246" />\r\n\r\nNa kus silné kůže si obkreslíte z obou stran střih podrážky. Doporučuji označit si obkreslenou stranu a pak dělat druhou.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/16.JPG" width="429" height="321" />\r\n\r\nS úspěšně získanými dvěma podrážkami se pustíte do svršku.\r\nJedna rada hned na začátek: pokud jsou na svršku nástřihy či ostré úhly, dělejte je vzdy tak, že vyrazíte do kůže dírku a stříháte k ní.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/17.JPG" width="382" height="266" />\r\n\r\nZabráníte tím tomu, aby se kůže při namáhání trhala.\r\nNa konci svršku nechejte vždy o cca 5 cm kůže více, pro případ, že by šití nevyšlo zcela přesně.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/18.jpg" width="452" height="309" />\r\n\r\nDalším krokem je naděrování podrážky pro šití. Nejpraktičtější je vytlačit se rýhu asi 0,5 cm od okraje\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/19.jpg" width="402" height="323" />\r\n\r\npak na ní udělat po opět cca 0,5 cm čárky\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/20.jpg" width="434" height="275" />\r\n\r\nMůžete použít i propisku, vevnitř boty to většinou nebude vidět.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/21.jpg" width="476" height="265" />\r\n\r\nNásledně podrážku kolem dokola naděrujeme, a to tak, aby díra šla od značky do přibližně středu okraje kůže.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/22.jpg" width="492" height="239" />\r\n\r\nPak už můžeme začít našívat svršek.\r\n\r\n<strong>4. Šití </strong>\r\nZačněte od značky u palce, kde slícujete svršek a podrážku. Doporučuji jedincům se slabšími prsty postupovat následovně:\r\nUdělejte šídlem skrze podrážku díru do svršku (siláci mohou vynechat a rvát tam rovnou jehlu).\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/23.jpg" width="457" height="384" />\r\n\r\nProtáhněte první nit. Nit neustále silně voskujte, pokud to dělat nebudete, rozpadne se vám za nepříjemně krátkou chvíli.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/24.jpg" width="450" height="359" />\r\n\r\nProtáhněte druhou nit.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/25.jpg" width="461" height="383" />\r\n\r\nA řádně utáhneme.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/26.jpg" width="450" height="354" />\r\n\r\nPokračujte, dokud nemáte hotový celý šev. Pozor na místo, kde se svršek spojuje. Jen konec nastřihněte, neoddělujte jej celý!\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/27.jpg" width="480" height="356" />\r\n\r\nHotový šev vypadá následovně:\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/28.jpg" width="493" height="308" />\r\n\r\nJak je ale vidět, podrážka je nerovná a okraje svršu přečnívají.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/29.jpg" width="445" height="333" />\r\n\r\nJelikož tato část boty bude ve styku s chodidlem, je třeba udělat ji co nejhladší. Proto přečnívající okraje kůže ořežte (pozor na švy!) a nerovnosti zahlaďte poklepáním paličkou s hladkým čelem, nebo zatlačením lžící.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/30.jpg" width="451" height="310" />\r\n\r\nCelá boty je teď naruby a téměř hotová.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/31.jpg" width="513" height="322" />\r\n\r\nBotu tedy obraťte. Není to složité. Začněte špičkou, kterou ale obracíte od otvoru boty směrem ke špici. Pokud obrátit nejde, namočte ji do vody, popřípadě použijte varečku a protlačení vzpurných částí.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/32.jpg" width="460" height="348" />\r\n\r\nPoté si botu vyzkoušejte a případně upravte. Hlavně si ověřte, že dovnitř snadno dostanete nohu. Poslední krokem v šití hrubého boty je spojení svršku. Použijte skrytý šev, který není vidětz ani z jedné strany boty a díky tomu je chráněn před předřením.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/33.jpg" width="450" height="359" />\r\n\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/34.jpg" width="452" height="378" />\r\n\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/35.jpg" width="435" height="340" />\r\n\r\n<strong>5. Dokončení </strong>\r\nOkraje boty můžete následně olemovat. Vypadá to lépe a také zabraňuje vytahování kůže při nošení. Používal se kožený řemínek nebo obšití.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/36.jpg" width="459" height="322" />\r\n\r\nJe možné použít různé dekorativní oplety a švy, například tzv. přikrývkový.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/37.jpg" width="431" height="367" />\r\n\r\nZcela obšité botě chybí už jen zapínání.\r\n<img alt="obšívání" src="http://curiavitkov.cz/images/clanky/38.jpg" width="486" height="313" />\r\n\r\nNezapoměňte, že knoflíky není možno regulovat, a proto, když si do boty vezmete v zimě dvoje onuce, nemusíte ji zapnout. U těchto bot jsem proto zvolil vázání.\r\n<img alt="obšívání" src="http://curiavitkov.cz/images/clanky/39.jpg" width="450" height="315" />\r\n\r\n<img alt="zapínání" src="http://curiavitkov.cz/images/clanky/40.jpg" width="442" height="291" />\r\n\r\nBota je hotová, směle do druhé a pak vzhůru do lesů či boje!\r\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/41.jpg" width="420" height="296" />\r\n\r\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/42.jpg" width="280" height="348" />\r\n\r\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/43.jpg" width="457" height="340" />\r\n\r\n</div>\r\n<a href="http://www.toplist.cz/" target="_top"><img alt="TOPlist" src="http://toplist.cz/count.asp?id=967950" width="1px" height="1px" border="0" /></a>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-3', '', '', '2013-02-19 15:57:49', '2013-02-19 15:57:49', '', 84, 'http://localhost:8888/84-revision-3/', 0, 'revision', '', 0),
(86, 1, '2013-02-20 08:35:04', '2013-02-20 08:35:04', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\n<div>\n\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\n\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\n\nBoty mohou vypadat třeba takto (nálezy z Yorku):\n<table border="0">\n<tbody>\n<tr>\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" /></td>\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" width="326" height="252" /></td>\n</tr>\n</tbody>\n</table>\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\n\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-autosave', '', '', '2013-02-20 08:35:04', '2013-02-20 08:35:04', '', 84, 'http://localhost:8888/84-autosave/', 0, 'revision', '', 0),
(96, 1, '2013-02-20 08:22:26', '2013-02-20 08:22:26', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\r\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\n<div>\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk</a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-8', '', '', '2013-02-20 08:22:26', '2013-02-20 08:22:26', '', 84, 'http://localhost:8888/84-revision-8/', 0, 'revision', '', 0),
(97, 1, '2013-02-20 08:25:13', '2013-02-20 08:25:13', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\n<div>\n\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\n\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\n\nBoty mohou vypadat třeba takto (nálezy z Yorku):\n\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\n\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\n\nNebo takto (nálezy z Yorku):\n\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\n\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk</a>\n\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-9', '', '', '2013-02-20 08:25:13', '2013-02-20 08:25:13', '', 84, 'http://localhost:8888/84-revision-9/', 0, 'revision', '', 0),
(100, 1, '2013-02-20 08:28:30', '2013-02-20 08:28:30', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\r\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\n<div>\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" /></td>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" width="326" height="252" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-12', '', '', '2013-02-20 08:28:30', '2013-02-20 08:28:30', '', 84, 'http://localhost:8888/84-revision-12/', 0, 'revision', '', 0),
(98, 1, '2013-02-20 08:26:25', '2013-02-20 08:26:25', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\r\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\n<div>\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n\r\n&nbsp;\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk</a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-10', '', '', '2013-02-20 08:26:25', '2013-02-20 08:26:25', '', 84, 'http://localhost:8888/84-revision-10/', 0, 'revision', '', 0),
(99, 1, '2013-02-20 08:27:49', '2013-02-20 08:27:49', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\r\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\n<div>\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\n&nbsp;</td>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk</a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-11', '', '', '2013-02-20 08:27:49', '2013-02-20 08:27:49', '', 84, 'http://localhost:8888/84-revision-11/', 0, 'revision', '', 0),
(101, 1, '2013-02-20 08:29:56', '2013-02-20 08:29:56', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\r\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\n<div>\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" /></td>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" width="326" height="252" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-13', '', '', '2013-02-20 08:29:56', '2013-02-20 08:29:56', '', 84, 'http://localhost:8888/84-revision-13/', 0, 'revision', '', 0),
(102, 1, '2013-02-20 08:30:35', '2013-02-20 08:30:35', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\r\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\n<div>\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" /></td>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" width="326" height="252" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-14', '', '', '2013-02-20 08:30:35', '2013-02-20 08:30:35', '', 84, 'http://localhost:8888/84-revision-14/', 0, 'revision', '', 0),
(103, 1, '2013-02-20 08:32:11', '2013-02-20 08:32:11', '<blockquote><strong>Pěkný návod na výrobu převrácených historických bot.\r\n</strong>Autor: Petr Šrámek, <a href="http://curiavitkov.cz/clanek18.html" rel="nofollow">http://curiavitkov.cz/clanek18.html</a></blockquote>\r\n<div>\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" /></td>\r\n<td><img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" width="326" height="252" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\n</div>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-15', '', '', '2013-02-20 08:32:11', '2013-02-20 08:32:11', '', 84, 'http://localhost:8888/84-revision-15/', 0, 'revision', '', 0),
(104, 1, '2013-02-19 14:57:43', '2013-02-19 14:57:43', 'Jsem velmi překvapen, neskutečně podařeným projektem "Jak si udělat boty z vlastní garáže". Oliver Rabbath, umělec z Francie, se přestěhoval do USA, založil obchod, který se stal jeho životem. V obchodě s velkými výlohami vyrábí a učí dnes a denně další nadané. V obchodě i spí, stal se jeho životem.\r\n\r\nWWW: <a href="http://howtomakebootsfromyourgarage.com/">How to make boots from your garage!</a>\r\n\r\nKromě videí na internetu, které si můžete otevřít zde, můžete taktéž zakoupit jeho knihu s veškerými návody. Dává velmi velký důraz na použití jednoduchých nástrojů a postupů a tím dosahuje možnosti opravdu si své boty vytvořit v vlastní dílně.\r\n\r\n<iframe src="http://www.youtube.com/embed/On3A_9b1YYs?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', '"How to make boots from your garage" Oliver Rabbath', '', 'inherit', 'open', 'open', '', '60-revision-2', '', '', '2013-02-19 14:57:43', '2013-02-19 14:57:43', '', 60, 'http://localhost:8888/60-revision-2/', 0, 'revision', '', 0),
(105, 1, '2013-02-20 09:53:00', '2013-02-20 09:53:00', 'Jsem velmi překvapen, neskutečně podařeným projektem "Jak si udělat boty z vlastní garáže". Oliver Rabbath, umělec z Francie, se přestěhoval do USA, založil obchod, který se stal jeho životem. V obchodě s velkými výlohami vyrábí a učí dnes a denně další nadané. V obchodě i spí, stal se jeho životem.\n\nWWW: <a href="http://howtomakebootsfromyourgarage.com/">How to make boots from your garage!</a>\n\nKromě videí na internetu, které si můžete otevřít zde, můžete taktéž zakoupit jeho knihu s veškerými návody. Dává velmi velký důraz na použití jednoduchých nástrojů a postupů a tím dosahuje možnosti opravdu si své boty vytvořit v vlastní dílně.\n\n<iframe src="http://www.youtube.com/embed/On3A_9b1YYs?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', '"How to make boots from your garage" Oliver Rabbath', '', 'inherit', 'open', 'open', '', '60-revision-3', '', '', '2013-02-20 09:53:00', '2013-02-20 09:53:00', '', 60, 'http://localhost:8888/60-revision-3/', 0, 'revision', '', 0),
(106, 1, '2013-02-20 09:53:35', '2013-02-20 09:53:35', 'Jsem velmi překvapen, neskutečně podařeným projektem "Jak si udělat boty z vlastní garáže". Oliver Rabbath, umělec z Francie, se přestěhoval do USA, založil obchod, který se stal jeho životem. V obchodě s velkými výlohami vyrábí a učí dnes a denně další nadané. V obchodě i spí, stal se jeho životem.\r\n\r\nWWW: <a href="http://howtomakebootsfromyourgarage.com/">How to make boots from your garage!</a>\r\n\r\nKromě videí na internetu, které si můžete otevřít zde, můžete taktéž zakoupit jeho knihu s veškerými návody. Dává velmi velký důraz na použití jednoduchých nástrojů a postupů a tím dosahuje možnosti opravdu si své boty vytvořit v vlastní dílně.\r\n\r\n<iframe src="http://www.youtube.com/embed/On3A_9b1YYs?rel=0" height="360" width="480" allowfullscreen="" frameborder="0"></iframe>', '"How to make boots from your garage" Oliver Rabbath', '', 'inherit', 'open', 'open', '', '60-revision-4', '', '', '2013-02-20 09:53:35', '2013-02-20 09:53:35', '', 60, 'http://localhost:8888/60-revision-4/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(87, 1, '2013-02-19 15:53:54', '2013-02-19 15:53:54', '<div>\r\n\r\n<strong>Vkrásný návod na výrobu převrácených historických bot.</strong>\r\n\r\nAutor: Petr Šrámek, http://curiavitkov.cz/clanek18.html\r\n\r\n<img alt="bota" src="http://curiavitkov.cz/images/zivot/boty3.jpg" width="454" height="265" />\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\n&nbsp;\r\n\r\nJak tedy podobnou botu, která bude zdobit nohu, bude historicky odpovídající a nebude nás stát mnoho peněz vyrobíte? Nejdříve zahoďte kanady obalené králičí kožkou, vysmějte se pověrám, že kožené podešvě kloužou více než guma mechovka a vyčleňte si několik hodin času. Pokračujte tím, že si seženete následující materiál:\r\n<ul>\r\n	<li><strong>Kůži o síle cca 2 mm na svršek </strong>. Použijte usni činěnou rostlinnými tříslovinami, ne odpornou šedivou chromovanou kůži. Barvu volíme hnědou, spíše světlejší. Ne černou, ne zelenou, ne červenou či jinou umělou barvu.</li>\r\n	<li><strong>Kůži o síle 4-6 mm na podešve </strong>. Pokud možno ne lisovanou, špatně se do ní dělají šídlem díry a trhá se.</li>\r\n	<li><strong>Dvě silnější jehly </strong>, pokud možno s ouškem v síle jehly. Jelikož jehly rády praskají či se ohýbají, doporučuji pořídít si jich více.</li>\r\n	<li><strong>Lněnou sedlářskou dratev </strong>.</li>\r\n	<li><strong>Šídlo </strong>. V případě, že neplánujete šít více párů, či s kůží pracovat pravidelně, může šídlo nahradit silná jehla zaražená do korkové zátky nebo podobného držáku. Pracuje se s ní ale výrazně hůře. Pokud kupujete šídlo, doporučuji hrot s kosočtvererčným průřezem. Lépe kůži řeže.</li>\r\n	<li><strong>Ševcovský pop, nebo včelí vosk </strong>. Dratev je v průběhu práce nutno bohatě voskovat kvůli impregnaci a zvýšení trvanlivosti. Více vosku či popu je lepší než méně!</li>\r\n	<li><strong>Velké nůžky nebo knejp či ostrý nůž </strong> na řezání kůže. Nůžky lépe kontrolujete, ale s knejpem jsou okraje hezčí a lépe se s nimi pracuje. Zvláště podešev je lepší vyříznout.</li>\r\n	<li>Pro ulehčení práce byste ještě mohli potřebovat <strong>kleště kombinačky , náprstek a větší vařečku </strong>.</li>\r\n	<li>Pro výrobu "modelu" <strong>silnější čtvertku nebo lepenku, lepicí pásku, sešívačku, fix, kus silnější látky, nůžky </strong>.</li>\r\n</ul>\r\n&nbsp;\r\n\r\n<strong>1. Výběr vzoru </strong>\r\nVzor si vyberte podle dostupné literatury. Hezké příklady jsou na <a href="http://www.personal.utulsa.edu/%7Emarc-carlson/shoe/SHOEHOME.HTM">stránce Marca Carlsona </a>, inspirovat se můžete i fotografiemi výše. Když víte, jak by měla bota vypadat, pustíte se do Výroby modelu, podle kterého pak budete stříhat kůži. Několik pravidel, které platí po celou dobu práce:\r\n<ul>\r\n	<li><strong>Dvakrát měr, jednou stříhej! </strong></li>\r\n	<li><strong>Každá minuta práce při přípravě mi ušetří pět minut při samotné práci</strong></li>\r\n	<li><strong>Nikdy neříkám "To stačí", vždy vše dotáhnu do dokonalosti </strong></li>\r\n	<li><strong>Neexistuje nešikovný člověk, jsou jen lidé, kteří to nezkoušeli dostatečně dlouho. </strong></li>\r\n	<li><strong>Co jednou ustřihnu, už nepřilepím. Proto stříhám pomalu, opatrně a po kouscích. </strong></li>\r\n</ul>\r\n&nbsp;\r\n\r\n<strong>2. Výroba modelu </strong>\r\nModel je bota z papíru a látky, podle které pak nastříháte kůži. Při jejím vytváření pracujte pečlivě, když botu ušijete podle špatného vzoru, nebude vám sedět.\r\nZačněte obkreslením chodidla na papír. Je důležité uvědomit si, jak budete botu nosit - na boso nebo jen s ponožkou, nebou budete používat onuce a vycpávání bot proti zimě? Podle toho si chodidlo obkreslete buď tužkou kolmo k papíru, nebo objedete linii dotyku zatíženého chodidla s podložkou. Modrá linie je tužkou kolmo k podložce, červená linie dotyku s podložkou.\r\n<img alt="nákres" src="http://curiavitkov.cz/images/clanky/1.JPG" width="465" height="270" />\r\nPřidejte minimálně centimetr u prstů, dokreslete tvar podrážky dle libosti (jsou dokázány jak mírně zašpičatělé, tak zakulacené špičky) a vystřihněte ji z tvrdého papíru.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/2.JPG" width="433" height="311" />\r\nPodrážka nahoře je historičtější a patří na boty, které budou vycpány vlnou či senem, nebo do nich budete nosit onuce. Spodní podrážka je mladší, objevuje se na botách z vrcholného středověku, bota s touto podrážkou výrazně lépe sedí na noze bosé či s tenkou ponožkou.\r\nZískáme ji tak, že kromě rozšíření i prstů odstříháme všechny části, které vyčnívají mezi zatíženou nohou a podložkou (tip: postavte se na podložku a požádejte někoho, ať jede prstem kolem nohy. Kde ucítí vyčnívající podrážku, udělá značku, tu část poté odstříhnete). Výsledná podrážka má extrémně úzkou patu. Tak to má být! Viz (Mark Carlson)\r\n<img alt="bota - Marc Carlson" src="http://www.personal.utulsa.edu/%7Emarc-carlson/shoe2/proj2.jpg" />\r\nPřevzato z: http://www.personal.utulsa.edu/~marc-carlson\r\nPostavte se na výslednou podrážku a omotejte látku kolem přední částí nohy:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/3.jpg" width="407" height="299" />\r\nLinii styku látky s podrážkou označte fixem, zvýrazněte místo, kde máte palec:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/4.jpg" width="336" height="381" />\r\nZískali jste střih přední části svršku. Nezapomeňte si jej popsat, později můžete snadno ztratit předhled, která část to je!\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/5.jpg" width="422" height="307" />\r\nVystřizenou část svršku pomocí lepicí pásky přichytněte k podrážce. Doporučuji přicvaknout svršek sešívačkou na místě, kde je palec. Z tohoto místa pak budete vždy vycházet při stříhání i šití. Vznikne nám tak hezký pantofel:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/6.jpg" width="453" height="303" />\r\nJak je vidět, po zasunutí nohy tak, jak bude v botě, vznikly na svršku faldy. Ty je nutno odstranit úpravami svršku. Stejně tak můžeme upravit podrážku, pokud je příliš široká či úzká, nebo vytváří "kachní nohu". Konečný výsledek musí být hezky rovný:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/7.jpg" width="468" height="323" />\r\nDalším krokem je dotvoření celého svršku tak, jak má vypadat, včetně případného zapínání, slepení dohromady pomocí pásky a případně sešívačky:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/8.jpg" width="473" height="279" />\r\nNa místech, kde je třeba úpravy svršku, si potřebné označte fixem. Poprovedení úprav a opětovném vyzkoušení botu sundejte a oddělte svršek od podrážky.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/9.jpg" width="347" height="411" />\r\nSvršek býval většinou z jednoho kusu, spojující šev na vnější straně chodidla. Postupujeme v souladu s tím. Výsledek je následující:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/10.jpg" width="487" height="285" />\r\nJak je vidět, tento tvar byste z jednoho kusu kůže nevystříhli. Proto jej upravte, v tomto případě mírný zastříhnutím přední části svršku a změnou úhlu pásku zapínání. Takhle už by to šlo.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/12.jpg" width="476" height="264" />\r\nMusíte ale znovu vyzkoušet, jestli bota sedne na nohu i v novém tvaru. Pokud si věříte, stačí zkusit jen svršek, ideálně ale znovu slepte celý model včetně podrážky. Pomocí lepicí pásky můžete dodat chybějící části svršku tam, kde jste stříhali příliš horlivě:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/13.JPG" width="440" height="287" />\r\nJe to v pořádku, máte tedy střih. Nahoře je nově vytvořený střih, dole střih na stejnou velikost nohy, ale jiný typ obuvi.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/14.JPG" width="399" height="364" />\r\nMůžete se tedy dát do stříhání kůže.\r\n\r\n<strong>3. Stříhání </strong>\r\nZačněte podrážkou.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/15.JPG" width="459" height="246" />\r\nNa kus silné kůže si obkreslíte z obou stran střih podrážky. Doporučuji označit si obkreslenou stranu a pak dělat druhou.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/16.JPG" width="429" height="321" />\r\nS úspěšně získanými dvěma podrážkami se pustíte do svršku.\r\nJedna rada hned na začátek: pokud jsou na svršku nástřihy či ostré úhly, dělejte je vzdy tak, že vyrazíte do kůže dírku a stříháte k ní.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/17.JPG" width="382" height="266" />\r\nZabráníte tím tomu, aby se kůže při namáhání trhala.\r\nNa konci svršku nechejte vždy o cca 5 cm kůže více, pro případ, že by šití nevyšlo zcela přesně.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/18.jpg" width="452" height="309" />\r\nDalším krokem je naděrování podrážky pro šití. Nejpraktičtější je vytlačit se rýhu asi 0,5 cm od okraje\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/19.jpg" width="402" height="323" />\r\npak na ní udělat po opět cca 0,5 cm čárky\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/20.jpg" width="434" height="275" />\r\nMůžete použít i propisku, vevnitř boty to většinou nebude vidět.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/21.jpg" width="476" height="265" />\r\nNásledně podrážku kolem dokola naděrujeme, a to tak, aby díra šla od značky do přibližně středu okraje kůže.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/22.jpg" width="492" height="239" />\r\nPak už můžeme začít našívat svršek.\r\n\r\n<strong>4. Šití </strong>\r\nZačněte od značky u palce, kde slícujete svršek a podrážku. Doporučuji jedincům se slabšími prsty postupovat následovně:\r\nUdělejte šídlem skrze podrážku díru do svršku (siláci mohou vynechat a rvát tam rovnou jehlu).\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/23.jpg" width="457" height="384" />\r\nProtáhněte první nit. Nit neustále silně voskujte, pokud to dělat nebudete, rozpadne se vám za nepříjemně krátkou chvíli.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/24.jpg" width="450" height="359" />\r\nProtáhněte druhou nit.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/25.jpg" width="461" height="383" />\r\nA řádně utáhneme.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/26.jpg" width="450" height="354" />\r\nPokračujte, dokud nemáte hotový celý šev. Pozor na místo, kde se svršek spojuje. Jen konec nastřihněte, neoddělujte jej celý!\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/27.jpg" width="480" height="356" />\r\nHotový šev vypadá následovně:\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/28.jpg" width="493" height="308" />\r\nJak je ale vidět, podrážka je nerovná a okraje svršu přečnívají.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/29.jpg" width="445" height="333" />\r\nJelikož tato část boty bude ve styku s chodidlem, je třeba udělat ji co nejhladší. Proto přečnívající okraje kůže ořežte (pozor na švy!) a nerovnosti zahlaďte poklepáním paličkou s hladkým čelem, nebo zatlačením lžící.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/30.jpg" width="451" height="310" />\r\nCelá boty je teď naruby a téměř hotová.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/31.jpg" width="513" height="322" />\r\nBotu tedy obraťte. Není to složité. Začněte špičkou, kterou ale obracíte od otvoru boty směrem ke špici. Pokud obrátit nejde, namočte ji do vody, popřípadě použijte varečku a protlačení vzpurných částí.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/32.jpg" width="460" height="348" />\r\nPoté si botu vyzkoušejte a případně upravte. Hlavně si ověřte, že dovnitř snadno dostanete nohu. Poslední krokem v šití hrubého boty je spojení svršku. Použijte skrytý šev, který není vidětz ani z jedné strany boty a díky tomu je chráněn před předřením.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/33.jpg" width="450" height="359" />\r\n\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/34.jpg" width="452" height="378" />\r\n\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/35.jpg" width="435" height="340" />\r\n\r\n<strong>5. Dokončení </strong>\r\nOkraje boty můžete následně olemovat. Vypadá to lépe a také zabraňuje vytahování kůže při nošení. Používal se kožený řemínek nebo obšití.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/36.jpg" width="459" height="322" />\r\nJe možné použít různé dekorativní oplety a švy, například tzv. přikrývkový.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/37.jpg" width="431" height="367" />\r\nZcela obšité botě chybí už jen zapínání.\r\n<img alt="obšívání" src="http://curiavitkov.cz/images/clanky/38.jpg" width="486" height="313" />\r\nNezapoměňte, že knoflíky není možno regulovat, a proto, když si do boty vezmete v zimě dvoje onuce, nemusíte ji zapnout. U těchto bot jsem proto zvolil vázání.\r\n<img alt="obšívání" src="http://curiavitkov.cz/images/clanky/39.jpg" width="450" height="315" />\r\n\r\n<img alt="zapínání" src="http://curiavitkov.cz/images/clanky/40.jpg" width="442" height="291" />\r\nBota je hotová, směle do druhé a pak vzhůru do lesů či boje!\r\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/41.jpg" width="420" height="296" /><img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/42.jpg" width="280" height="348" />\r\n\r\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/43.jpg" width="457" height="340" />\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n<a href="http://curiavitkov.cz/clanky2.html"><img title="Články" alt="články" src="http://curiavitkov.cz/images/sipka3.jpg" width="70" height="61" border="0" /></a>\r\n\r\n</div>\r\n<div>\r\n\r\nHlavní navigace: <a href="http://curiavitkov.cz/clanky2.html">Články</a> <a href="http://curiavitkov.cz/index.html">Úvodní stránka</a>\r\n\r\n</div>\r\n<a href="http://www.toplist.cz/" target="_top"><img alt="TOPlist" src="http://toplist.cz/count.asp?id=967950" width="1px" height="1px" border="0" /></a>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-2', '', '', '2013-02-19 15:53:54', '2013-02-19 15:53:54', '', 84, 'http://localhost:8888/84-revision-2/', 0, 'revision', '', 0),
(89, 1, '2013-02-19 16:27:11', '0000-00-00 00:00:00', 'Jak jsem vyráběl boty já. Po dlohém zkoumání na internetu, youtube a dalším, po vybavení dílny a koupi kůže (vše popsáno v předchozích článcích) jsem se dal do vlastní výroby.\n\n&nbsp;', 'Ruční výroba kožených bot', '', 'draft', 'open', 'open', '', '', '', '', '2013-02-19 16:27:11', '2013-02-19 16:27:11', '', 0, 'http://localhost:8888/?p=89', 0, 'post', '', 0),
(90, 1, '2013-02-19 15:59:48', '2013-02-19 15:59:48', '', 'Ruční výroba kožených bot', '', 'inherit', 'open', 'open', '', '89-revision', '', '', '2013-02-19 15:59:48', '2013-02-19 15:59:48', '', 89, 'http://localhost:8888/89-revision/', 0, 'revision', '', 0),
(91, 1, '2013-02-19 15:58:56', '2013-02-19 15:58:56', '<div>\r\n\r\n<strong>Pěkný návod na výrobu převrácených historických bot.</strong>\r\n\r\nAutor: Petr Šrámek, http://curiavitkov.cz/clanek18.html\r\n\r\n<img alt="bota" src="http://curiavitkov.cz/images/zivot/boty3.jpg" width="454" height="265" />\r\n\r\nPo celý raný středověk převládal typ obuvi, který byl šit z rubové strany a po dokončení převrácen - proto převracená bota (v angličtině turned shoe). Tyto boty jsou výrobně velmi jednoduché, je na nich minimum švů a dobře sedí na noze.\r\n\r\nJednotlivých vzorů těchto bot je nepřeberné množství. Většina jich je k noze jištěna vázáním, jsou ale i typy na knoflíky. Zapínání na přezky je dokázáno až u bot vrcholného středověku, proto jej nedoporučujeme.\r\n\r\nBoty mohou vypadat třeba takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=3370&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk </a>\r\n\r\nNebo takto (nálezy z Yorku):\r\n\r\n<img alt="bota - York" src="http://www.yorkarchaeology.co.uk/piclib/photos_showphoto.php?PID=2247&amp;Size=1" />\r\n\r\nPřevzato z <a href="http://www.yorkarchaeology.co.uk">www.yorkarchaeology.co.uk  </a>\r\n\r\nJak tedy podobnou botu, která bude zdobit nohu, bude historicky odpovídající a nebude nás stát mnoho peněz vyrobíte? Nejdříve zahoďte kanady obalené králičí kožkou, vysmějte se pověrám, že kožené podešvě kloužou více než guma mechovka a vyčleňte si několik hodin času. Pokračujte tím, že si seženete následující materiál:\r\n<ul>\r\n	<li><strong>Kůži o síle cca 2 mm na svršek </strong>. Použijte usni činěnou rostlinnými tříslovinami, ne odpornou šedivou chromovanou kůži. Barvu volíme hnědou, spíše světlejší. Ne černou, ne zelenou, ne červenou či jinou umělou barvu.</li>\r\n	<li><strong>Kůži o síle 4-6 mm na podešve </strong>. Pokud možno ne lisovanou, špatně se do ní dělají šídlem díry a trhá se.</li>\r\n	<li><strong>Dvě silnější jehly </strong>, pokud možno s ouškem v síle jehly. Jelikož jehly rády praskají či se ohýbají, doporučuji pořídít si jich více.</li>\r\n	<li><strong>Lněnou sedlářskou dratev </strong>.</li>\r\n	<li><strong>Šídlo </strong>. V případě, že neplánujete šít více párů, či s kůží pracovat pravidelně, může šídlo nahradit silná jehla zaražená do korkové zátky nebo podobného držáku. Pracuje se s ní ale výrazně hůře. Pokud kupujete šídlo, doporučuji hrot s kosočtvererčným průřezem. Lépe kůži řeže.</li>\r\n	<li><strong>Ševcovský pop, nebo včelí vosk </strong>. Dratev je v průběhu práce nutno bohatě voskovat kvůli impregnaci a zvýšení trvanlivosti. Více vosku či popu je lepší než méně!</li>\r\n	<li><strong>Velké nůžky nebo knejp či ostrý nůž </strong> na řezání kůže. Nůžky lépe kontrolujete, ale s knejpem jsou okraje hezčí a lépe se s nimi pracuje. Zvláště podešev je lepší vyříznout.</li>\r\n	<li>Pro ulehčení práce byste ještě mohli potřebovat <strong>kleště kombinačky , náprstek a větší vařečku </strong></li>\r\n	<li>Pro výrobu "modelu" <strong>silnější čtvertku nebo lepenku, lepicí pásku, sešívačku, fix, kus silnější látky, nůžky</strong></li>\r\n</ul>\r\n<strong>1. Výběr vzoru </strong>\r\nVzor si vyberte podle dostupné literatury. Hezké příklady jsou na <a href="http://www.personal.utulsa.edu/%7Emarc-carlson/shoe/SHOEHOME.HTM">stránce Marca Carlsona </a>, inspirovat se můžete i fotografiemi výše. Když víte, jak by měla bota vypadat, pustíte se do Výroby modelu, podle kterého pak budete stříhat kůži. Několik pravidel, které platí po celou dobu práce:\r\n<ul>\r\n	<li><strong>Dvakrát měr, jednou stříhej! </strong></li>\r\n	<li><strong>Každá minuta práce při přípravě mi ušetří pět minut při samotné práci</strong></li>\r\n	<li><strong>Nikdy neříkám "To stačí", vždy vše dotáhnu do dokonalosti </strong></li>\r\n	<li><strong>Neexistuje nešikovný člověk, jsou jen lidé, kteří to nezkoušeli dostatečně dlouho. </strong></li>\r\n	<li><strong>Co jednou ustřihnu, už nepřilepím. Proto stříhám pomalu, opatrně a po kouscích. </strong></li>\r\n</ul>\r\n<strong>2. Výroba modelu </strong>\r\nModel je bota z papíru a látky, podle které pak nastříháte kůži. Při jejím vytváření pracujte pečlivě, když botu ušijete podle špatného vzoru, nebude vám sedět.\r\nZačněte obkreslením chodidla na papír. Je důležité uvědomit si, jak budete botu nosit - na boso nebo jen s ponožkou, nebou budete používat onuce a vycpávání bot proti zimě? Podle toho si chodidlo obkreslete buď tužkou kolmo k papíru, nebo objedete linii dotyku zatíženého chodidla s podložkou. Modrá linie je tužkou kolmo k podložce, červená linie dotyku s podložkou.\r\n<img alt="nákres" src="http://curiavitkov.cz/images/clanky/1.JPG" width="465" height="270" />\r\nPřidejte minimálně centimetr u prstů, dokreslete tvar podrážky dle libosti (jsou dokázány jak mírně zašpičatělé, tak zakulacené špičky) a vystřihněte ji z tvrdého papíru.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/2.JPG" width="433" height="311" />\r\nPodrážka nahoře je historičtější a patří na boty, které budou vycpány vlnou či senem, nebo do nich budete nosit onuce. Spodní podrážka je mladší, objevuje se na botách z vrcholného středověku, bota s touto podrážkou výrazně lépe sedí na noze bosé či s tenkou ponožkou.\r\nZískáme ji tak, že kromě rozšíření i prstů odstříháme všechny části, které vyčnívají mezi zatíženou nohou a podložkou (tip: postavte se na podložku a požádejte někoho, ať jede prstem kolem nohy. Kde ucítí vyčnívající podrážku, udělá značku, tu část poté odstříhnete). Výsledná podrážka má extrémně úzkou patu. Tak to má být! Viz (Mark Carlson)\r\n<img alt="bota - Marc Carlson" src="http://www.personal.utulsa.edu/%7Emarc-carlson/shoe2/proj2.jpg" />\r\nPřevzato z: http://www.personal.utulsa.edu/~marc-carlson\r\nPostavte se na výslednou podrážku a omotejte látku kolem přední částí nohy:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/3.jpg" width="407" height="299" />\r\nLinii styku látky s podrážkou označte fixem, zvýrazněte místo, kde máte palec:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/4.jpg" width="336" height="381" />\r\n\r\nZískali jste střih přední části svršku. Nezapomeňte si jej popsat, později můžete snadno ztratit předhled, která část to je!\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/5.jpg" width="422" height="307" />\r\n\r\nVystřizenou část svršku pomocí lepicí pásky přichytněte k podrážce. Doporučuji přicvaknout svršek sešívačkou na místě, kde je palec. Z tohoto místa pak budete vždy vycházet při stříhání i šití. Vznikne nám tak hezký pantofel:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/6.jpg" width="453" height="303" />\r\n\r\nJak je vidět, po zasunutí nohy tak, jak bude v botě, vznikly na svršku faldy. Ty je nutno odstranit úpravami svršku. Stejně tak můžeme upravit podrážku, pokud je příliš široká či úzká, nebo vytváří "kachní nohu". Konečný výsledek musí být hezky rovný:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/7.jpg" width="468" height="323" />\r\n\r\nDalším krokem je dotvoření celého svršku tak, jak má vypadat, včetně případného zapínání, slepení dohromady pomocí pásky a případně sešívačky:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/8.jpg" width="473" height="279" />\r\n\r\nNa místech, kde je třeba úpravy svršku, si potřebné označte fixem. Poprovedení úprav a opětovném vyzkoušení botu sundejte a oddělte svršek od podrážky.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/9.jpg" width="347" height="411" />\r\n\r\nSvršek býval většinou z jednoho kusu, spojující šev na vnější straně chodidla. Postupujeme v souladu s tím. Výsledek je následující:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/10.jpg" width="487" height="285" />\r\n\r\nJak je vidět, tento tvar byste z jednoho kusu kůže nevystříhli. Proto jej upravte, v tomto případě mírný zastříhnutím přední části svršku a změnou úhlu pásku zapínání. Takhle už by to šlo.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/12.jpg" width="476" height="264" />\r\n\r\nMusíte ale znovu vyzkoušet, jestli bota sedne na nohu i v novém tvaru. Pokud si věříte, stačí zkusit jen svršek, ideálně ale znovu slepte celý model včetně podrážky. Pomocí lepicí pásky můžete dodat chybějící části svršku tam, kde jste stříhali příliš horlivě:\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/13.JPG" width="440" height="287" />\r\n\r\nJe to v pořádku, máte tedy střih. Nahoře je nově vytvořený střih, dole střih na stejnou velikost nohy, ale jiný typ obuvi.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/14.JPG" width="399" height="364" />\r\n\r\nMůžete se tedy dát do stříhání kůže.\r\n\r\n<strong>3. Stříhání </strong>\r\nZačněte podrážkou.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/15.JPG" width="459" height="246" />\r\n\r\nNa kus silné kůže si obkreslíte z obou stran střih podrážky. Doporučuji označit si obkreslenou stranu a pak dělat druhou.\r\n<img alt="model" src="http://curiavitkov.cz/images/clanky/16.JPG" width="429" height="321" />\r\n\r\nS úspěšně získanými dvěma podrážkami se pustíte do svršku.\r\nJedna rada hned na začátek: pokud jsou na svršku nástřihy či ostré úhly, dělejte je vzdy tak, že vyrazíte do kůže dírku a stříháte k ní.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/17.JPG" width="382" height="266" />\r\n\r\nZabráníte tím tomu, aby se kůže při namáhání trhala.\r\nNa konci svršku nechejte vždy o cca 5 cm kůže více, pro případ, že by šití nevyšlo zcela přesně.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/18.jpg" width="452" height="309" />\r\n\r\nDalším krokem je naděrování podrážky pro šití. Nejpraktičtější je vytlačit se rýhu asi 0,5 cm od okraje\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/19.jpg" width="402" height="323" />\r\n\r\npak na ní udělat po opět cca 0,5 cm čárky\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/20.jpg" width="434" height="275" />\r\n\r\nMůžete použít i propisku, vevnitř boty to většinou nebude vidět.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/21.jpg" width="476" height="265" />\r\n\r\nNásledně podrážku kolem dokola naděrujeme, a to tak, aby díra šla od značky do přibližně středu okraje kůže.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/22.jpg" width="492" height="239" />\r\n\r\nPak už můžeme začít našívat svršek.\r\n\r\n<strong>4. Šití </strong>\r\nZačněte od značky u palce, kde slícujete svršek a podrážku. Doporučuji jedincům se slabšími prsty postupovat následovně:\r\nUdělejte šídlem skrze podrážku díru do svršku (siláci mohou vynechat a rvát tam rovnou jehlu).\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/23.jpg" width="457" height="384" />\r\n\r\nProtáhněte první nit. Nit neustále silně voskujte, pokud to dělat nebudete, rozpadne se vám za nepříjemně krátkou chvíli.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/24.jpg" width="450" height="359" />\r\n\r\nProtáhněte druhou nit.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/25.jpg" width="461" height="383" />\r\n\r\nA řádně utáhneme.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/26.jpg" width="450" height="354" />\r\n\r\nPokračujte, dokud nemáte hotový celý šev. Pozor na místo, kde se svršek spojuje. Jen konec nastřihněte, neoddělujte jej celý!\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/27.jpg" width="480" height="356" />\r\n\r\nHotový šev vypadá následovně:\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/28.jpg" width="493" height="308" />\r\n\r\nJak je ale vidět, podrážka je nerovná a okraje svršu přečnívají.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/29.jpg" width="445" height="333" />\r\n\r\nJelikož tato část boty bude ve styku s chodidlem, je třeba udělat ji co nejhladší. Proto přečnívající okraje kůže ořežte (pozor na švy!) a nerovnosti zahlaďte poklepáním paličkou s hladkým čelem, nebo zatlačením lžící.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/30.jpg" width="451" height="310" />\r\n\r\nCelá boty je teď naruby a téměř hotová.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/31.jpg" width="513" height="322" />\r\n\r\nBotu tedy obraťte. Není to složité. Začněte špičkou, kterou ale obracíte od otvoru boty směrem ke špici. Pokud obrátit nejde, namočte ji do vody, popřípadě použijte varečku a protlačení vzpurných částí.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/32.jpg" width="460" height="348" />\r\n\r\nPoté si botu vyzkoušejte a případně upravte. Hlavně si ověřte, že dovnitř snadno dostanete nohu. Poslední krokem v šití hrubého boty je spojení svršku. Použijte skrytý šev, který není vidětz ani z jedné strany boty a díky tomu je chráněn před předřením.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/33.jpg" width="450" height="359" />\r\n\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/34.jpg" width="452" height="378" />\r\n\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/35.jpg" width="435" height="340" />\r\n\r\n<strong>5. Dokončení </strong>\r\nOkraje boty můžete následně olemovat. Vypadá to lépe a také zabraňuje vytahování kůže při nošení. Používal se kožený řemínek nebo obšití.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/36.jpg" width="459" height="322" />\r\n\r\nJe možné použít různé dekorativní oplety a švy, například tzv. přikrývkový.\r\n<img alt="šití" src="http://curiavitkov.cz/images/clanky/37.jpg" width="431" height="367" />\r\n\r\nZcela obšité botě chybí už jen zapínání.\r\n<img alt="obšívání" src="http://curiavitkov.cz/images/clanky/38.jpg" width="486" height="313" />\r\n\r\nNezapoměňte, že knoflíky není možno regulovat, a proto, když si do boty vezmete v zimě dvoje onuce, nemusíte ji zapnout. U těchto bot jsem proto zvolil vázání.\r\n<img alt="obšívání" src="http://curiavitkov.cz/images/clanky/39.jpg" width="450" height="315" />\r\n\r\n<img alt="zapínání" src="http://curiavitkov.cz/images/clanky/40.jpg" width="442" height="291" />\r\n\r\nBota je hotová, směle do druhé a pak vzhůru do lesů či boje!\r\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/41.jpg" width="420" height="296" />\r\n\r\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/42.jpg" width="280" height="348" />\r\n\r\n<img alt="hotová bota" src="http://curiavitkov.cz/images/clanky/43.jpg" width="457" height="340" />\r\n\r\n</div>\r\n<a href="http://www.toplist.cz/" target="_top"><img alt="TOPlist" src="http://toplist.cz/count.asp?id=967950" width="1px" height="1px" border="0" /></a>', 'Výroba ''''převracených'''' bot', '', 'inherit', 'open', 'open', '', '84-revision-4', '', '', '2013-02-19 15:58:56', '2013-02-19 15:58:56', '', 84, 'http://localhost:8888/84-revision-4/', 0, 'revision', '', 0),
(108, 1, '2013-03-06 10:03:20', '2013-03-06 10:03:20', '<strong>Myšákovy dobroty\r\n</strong>\r\n\r\nMyšákovy dobroty | Prodávající\r\nMěsto: Velká Polom\r\nRegistrován dne: 8.12.2012\r\n\r\n<a title="Myšákovy dobroty" href="http://www.fler.cz/shop/mysakovy-dobroty" target="_blank">http://www.fler.cz/shop/mysakovy-dobroty</a>\r\n\r\nRád bych tímto způsobem uveřejnil mou snahu a moji kultilskou tvorbu. Jako první a jediný server na zveřejnění mých výrobků jsem použil Fler.cz. Můžete na mém profilu na fleru vidět pár kutilských výrobků. Prozatím jen kůže ale přibude i dřevo.\r\n\r\nHlavní informace kterou bych ovšem rád předal, je ta, že bych rád vytvářel pro vás všechny výrobky na zkázku. Tedy bych rád poprosil o zaslání inspirace, nebo se prostě zeptat a ukázat co by se Vám líbilo, co by jste potřebovali vyrobit aj.\r\n\r\nV plánu mám kožené sandály na svatbu, venkovní posezení z masivního dřeva a další ...', 'Kutím na Flér.cz - Myšákovy dobroty', '', 'publish', 'open', 'open', '', 'kutim-na-fler-cz-mysakovy-dobroty', '', '', '2013-03-26 14:41:51', '2013-03-26 14:41:51', '', 0, 'http://localhost:8888/?p=108', 0, 'post', '', 0),
(130, 1, '2013-03-06 10:18:01', '2013-03-06 10:18:01', '<iframe src="http://www.youtube.com/embed/Siygqs-IGPw?rel=0" height="480" width="640" allowfullscreen="" frameborder="0"></iframe>', 'Kreativně tvořit můžeme z všech kousků dřeva!', '', 'inherit', 'open', 'open', '', '120-revision-3', '', '', '2013-03-06 10:18:01', '2013-03-06 10:18:01', '', 120, 'http://localhost:8888/120-revision-3/', 0, 'revision', '', 0),
(109, 1, '2013-03-06 10:02:57', '2013-03-06 10:02:57', '', 'Snímek obrazovky 2013-03-06 v 11.10.50', '', 'inherit', 'open', 'open', '', 'snimek-obrazovky-2013-03-06-v-11-10-50', '', '', '2013-03-06 10:02:57', '2013-03-06 10:02:57', '', 108, 'http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-03-06-v 11.10.50.png', 0, 'attachment', 'image/png', 0),
(110, 1, '2013-03-06 10:02:18', '2013-03-06 10:02:18', '', 'Myšákovy dobroty - můj obchůdek na Fler.cz', '', 'inherit', 'open', 'open', '', '108-revision', '', '', '2013-03-06 10:02:18', '2013-03-06 10:02:18', '', 108, 'http://localhost:8888/108-revision/', 0, 'revision', '', 0),
(113, 1, '2013-03-06 10:04:42', '2013-03-06 10:04:42', '<strong>Profil uživatele</strong>\r\n\r\nMyšákovy dobroty | Prodávající\r\nMěsto: Velká Polom\r\nRegistrován dne: 8.12.2012\r\n\r\n<strong>Profil</strong>\r\n\r\nMám rád soulad s přírodou. Rád se zaměřuji na středověk, fantasy a ethno.\r\nJsem minimalistický designer webových stránek a aplikací. Vždy bylo mou obživou i koníčkem.\r\nHlavní mou radostí je ruční práce a výroba z kůže a dřeva.\r\nNyní se kromě výroby zaměřuji na stavbu slaměných domů v kterých chci do roka a do dne žít.\r\nZjistil jsem, že pro mě není problém vytvořit cokoliv hlavně z dřeva a kůže. Jestli potřebujete, můžu pro vás vyrábět části a spolupracovat na celkovém díle společně.\r\n\r\n<strong>Způsob dopravy</strong>\r\n\r\nZasílám balíky Českou poštou. Balím do kartonových krabiček.', 'Myšákovy dobroty - můj obchůdek na Fler.cz', '', 'inherit', 'open', 'open', '', '108-revision-3', '', '', '2013-03-06 10:04:42', '2013-03-06 10:04:42', '', 108, 'http://localhost:8888/108-revision-3/', 0, 'revision', '', 0),
(111, 1, '2013-03-26 14:42:57', '2013-03-26 14:42:57', '<strong>Myšákovy dobroty\n</strong>\n\nMyšákovy dobroty | Prodávající\nMěsto: Velká Polom\nRegistrován dne: 8.12.2012\n\n<a title="Myšákovy dobroty" href="http://www.fler.cz/shop/mysakovy-dobroty" target="_blank">http://www.fler.cz/shop/mysakovy-dobroty</a>\n\nRád bych tímto způsobem uveřejnil mou snahu a moji kultilskou tvorbu. Jako první a jediný server na zveřejnění mých výrobků jsem použil Fler.cz. Můžete na mém profilu na fleru vidět pár kutilských výrobků. Prozatím jen kůže ale přibude i dřevo.\n\nHlavní informace kterou bych ovšem rád předal, je ta, že bych rád vytvářel pro vás všechny výrobky na zkázku. Tedy bych rád poprosil o zaslání inspirace, nebo se prostě zeptat a ukázat co by se Vám líbilo, co by jste potřebovali vyrobit aj.\n\nV plánu mám kožené sandály na svatbu, venkovní posezení z masivního dřeva a další ...', 'Kutím na Flér.cz - Myšákovy dobroty', '', 'inherit', 'open', 'open', '', '108-autosave', '', '', '2013-03-26 14:42:57', '2013-03-26 14:42:57', '', 108, 'http://localhost:8888/108-autosave/', 0, 'revision', '', 0),
(112, 1, '2013-03-06 10:03:20', '2013-03-06 10:03:20', '<div>Profil uživatele</div>\r\n<div></div>\r\n<div><img id="currentAvatarPreview" alt="" src="http://img.fler.cz/usr/avatar/1/9/199656/120_efe378998a.jpg" align="right" />\r\n<div>Myšákovy dobroty | Prodávající</div>\r\nMěsto: Velká Polom <img title="Česká republika" alt="" src="http://img.fler.cz/ui/img/flags/em16/cz.gif" />\r\nRegistrován dne: 8.12.2012\r\n\r\n\r\n</div>\r\n<div>Profil</div>\r\n<div id="profil">\r\n\r\nMám rád soulad s přírodou. Rád se zaměřuji na středověk, fantasy a ethno.\r\n\r\nJsem minimalistický designer webových stránek a aplikací. Vždy bylo mou obživou i koníčkem.\r\n\r\nHlavní mou radostí je <strong>ruční práce</strong> a <strong>výroba</strong> z <strong>kůže</strong> a <strong>dřeva</strong>.\r\n\r\nNyní se kromě výroby zaměřuji na stavbu <strong>slaměných domů </strong>v kterých chci do roka a do dne žít.\r\n\r\n&nbsp;\r\n\r\nZjistil jsem, že pro mě není problém <strong>vytvořit cokoliv</strong> hlavně z <strong>dřeva</strong> a <strong>kůže</strong>. Jestli potřebujete, můžu pro vás vyrábět části a <strong>spolupracovat</strong> na celkovém díle společně.\r\n\r\n</div>\r\n&nbsp;\r\n<div>Způsob dopravy</div>\r\n<div id="doprava">Zasílám balíky Českou poštou. Balím do kartonových krabiček.</div>', 'Myšákovy dobroty - můj obchůdek na Fler.cz', '', 'inherit', 'open', 'open', '', '108-revision-2', '', '', '2013-03-06 10:03:20', '2013-03-06 10:03:20', '', 108, 'http://localhost:8888/108-revision-2/', 0, 'revision', '', 0),
(114, 1, '2013-03-06 10:05:08', '2013-03-06 10:05:08', '<strong>Profil uživatele</strong>\r\n\r\nMyšákovy dobroty | Prodávající\r\nMěsto: Velká Polom\r\nRegistrován dne: 8.12.2012\r\n\r\n<strong>Profil</strong>\r\n\r\nMám rád soulad s přírodou. Rád se zaměřuji na středověk, fantasy a ethno.\r\nJsem minimalistický designer webových stránek a aplikací. Vždy bylo mou obživou i koníčkem.\r\nHlavní mou radostí je ruční práce a výroba z kůže a dřeva.\r\nNyní se kromě výroby zaměřuji na stavbu slaměných domů v kterých chci do roka a do dne žít.\r\nZjistil jsem, že pro mě není problém vytvořit cokoliv hlavně z dřeva a kůže. Jestli potřebujete, můžu pro vás vyrábět části a spolupracovat na celkovém díle společně.\r\n\r\n<strong>Způsob dopravy</strong>\r\n\r\nZasílám balíky Českou poštou. Balím do kartonových krabiček.', 'Myšákovy dobroty - můj obchůdek na Fler.cz', '', 'inherit', 'open', 'open', '', '108-revision-4', '', '', '2013-03-06 10:05:08', '2013-03-06 10:05:08', '', 108, 'http://localhost:8888/108-revision-4/', 0, 'revision', '', 0),
(115, 1, '2013-03-06 09:06:01', '2013-03-06 09:06:01', 'Tento kutil má perfektní návody na Youtube. Pouze pro anglicky mluvící.\r\n\r\n<iframe src="http://www.youtube.com/embed/IY-H9EPiY7Y?rel=0" height="360" width="640" allowfullscreen="" frameborder="0"></iframe>', 'Jak vytvořit Shishi-odoshi - strašáka na zvěř', '', 'publish', 'open', 'open', '', 'jak-vytvorit-shishi-odoshi-strasaka-na-zver', '', '', '2013-03-06 10:09:36', '2013-03-06 10:09:36', '', 0, 'http://localhost:8888/?p=115', 0, 'post', '', 0),
(116, 1, '2013-03-06 10:08:04', '2013-03-06 10:08:04', 'Tento kutil má perfektní návody na Youtube. Pouze pro anglicky mluvící.\n\n<iframe src="http://www.youtube.com/embed/IY-H9EPiY7Y?rel=0" height="360" width="640" allowfullscreen="" frameborder="0"></iframe>', 'Jak vytvořit Shishi-odoshi - strašáka na zvěř', '', 'inherit', 'open', 'open', '', '115-revision', '', '', '2013-03-06 10:08:04', '2013-03-06 10:08:04', '', 115, 'http://localhost:8888/115-revision/', 0, 'revision', '', 0),
(117, 1, '2013-03-06 10:09:30', '2013-03-06 10:09:30', '', 'Snímek obrazovky 2013-03-06 v 11.18.35', '', 'inherit', 'open', 'open', '', 'snimek-obrazovky-2013-03-06-v-11-18-35', '', '', '2013-03-06 10:09:30', '2013-03-06 10:09:30', '', 115, 'http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-03-06-v 11.18.35.png', 0, 'attachment', 'image/png', 0),
(118, 1, '2013-03-06 10:08:38', '2013-03-06 10:08:38', 'Tento kutil má perfektní návody na Youtube. Pouze pro anglicky mluvící.\r\n\r\n<iframe src="http://www.youtube.com/embed/IY-H9EPiY7Y?rel=0" height="360" width="640" allowfullscreen="" frameborder="0"></iframe>', 'Jak vytvořit Shishi-odoshi - strašáka na zvěř', '', 'inherit', 'open', 'open', '', '115-revision-2', '', '', '2013-03-06 10:08:38', '2013-03-06 10:08:38', '', 115, 'http://localhost:8888/115-revision-2/', 0, 'revision', '', 0),
(145, 1, '2013-05-02 11:30:19', '2013-05-02 11:30:19', '<h2>Top produkty</h2>\r\n&nbsp;\r\n<h2>Novinky</h2>\r\n&nbsp;\r\n<h2>Aktivity stream</h2>', 'Úvodní stránka', '', 'trash', 'closed', 'closed', '', 'uvodni-stranka', '', '', '2014-01-20 11:25:06', '2014-01-20 11:25:06', '', 0, 'http://localhost:8888/?page_id=145', 0, 'page', '', 0),
(120, 1, '2013-03-06 09:13:30', '2013-03-06 09:13:30', '<iframe src="http://www.youtube.com/embed/Siygqs-IGPw?rel=0" height="480" width="640" allowfullscreen="" frameborder="0"></iframe>', 'Buď kutil a vytvoř něco z ničeho!', '', 'publish', 'open', 'open', '', 'bud-kutil-a-vytvor-neco-z-niceho', '', '', '2013-03-26 14:42:36', '2013-03-26 14:42:36', '', 0, 'http://localhost:8888/?p=120', 0, 'post', '', 0),
(121, 1, '2013-03-06 10:14:07', '2013-03-06 10:14:07', '<iframe src="http://www.youtube.com/embed/Siygqs-IGPw?rel=0" height="480" width="640" allowfullscreen="" frameborder="0"></iframe>', 'Kreativně tvořit můžeme z všech kousků dřeva!', '', 'inherit', 'open', 'open', '', '120-revision', '', '', '2013-03-06 10:14:07', '2013-03-06 10:14:07', '', 120, 'http://localhost:8888/120-revision/', 0, 'revision', '', 0),
(122, 1, '2013-03-06 10:19:04', '2013-03-06 10:19:04', '<iframe src="http://www.youtube.com/embed/Siygqs-IGPw?rel=0" height="480" width="640" allowfullscreen="" frameborder="0"></iframe>', 'Kreativně tvořit můžeme z všech kousků dřeva!', '', 'inherit', 'open', 'open', '', '120-autosave', '', '', '2013-03-06 10:19:04', '2013-03-06 10:19:04', '', 120, 'http://localhost:8888/120-autosave/', 0, 'revision', '', 0),
(123, 1, '2013-03-06 10:17:56', '2013-03-06 10:17:56', '', 'Snímek obrazovky 2013-03-06 v 11.25.36', '', 'inherit', 'open', 'open', '', 'snimek-obrazovky-2013-03-06-v-11-25-36', '', '', '2013-03-06 10:17:56', '2013-03-06 10:17:56', '', 120, 'http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-03-06-v 11.25.36.png', 0, 'attachment', 'image/png', 0),
(124, 1, '2013-03-06 10:14:40', '2013-03-06 10:14:40', '<iframe src="http://www.youtube.com/embed/Siygqs-IGPw?rel=0" height="480" width="640" allowfullscreen="" frameborder="0"></iframe>', 'Kreativně tvořit můžeme z všech kousků dřeva!', '', 'inherit', 'open', 'open', '', '120-revision-2', '', '', '2013-03-06 10:14:40', '2013-03-06 10:14:40', '', 120, 'http://localhost:8888/120-revision-2/', 0, 'revision', '', 0),
(126, 1, '2013-03-06 10:05:47', '2013-03-06 10:05:47', '<strong>Profil uživatele</strong>\r\n\r\nMyšákovy dobroty | Prodávající\r\nMěsto: Velká Polom\r\nRegistrován dne: 8.12.2012\r\n\r\n<strong>Profil</strong>\r\n\r\nMám rád soulad s přírodou. Rád se zaměřuji na středověk, fantasy a ethno.\r\nJsem minimalistický designer webových stránek a aplikací. Vždy bylo mou obživou i koníčkem.\r\nHlavní mou radostí je ruční práce a výroba z kůže a dřeva.\r\nNyní se kromě výroby zaměřuji na stavbu slaměných domů v kterých chci do roka a do dne žít.\r\nZjistil jsem, že pro mě není problém vytvořit cokoliv hlavně z dřeva a kůže. Jestli potřebujete, můžu pro vás vyrábět části a spolupracovat na celkovém díle společně.\r\n\r\n<strong>Způsob dopravy</strong>\r\n\r\nZasílám balíky Českou poštou. Balím do kartonových krabiček.', 'Myšákovy dobroty - můj obchůdek na Fler.cz', '', 'inherit', 'open', 'open', '', '108-revision-5', '', '', '2013-03-06 10:05:47', '2013-03-06 10:05:47', '', 108, 'http://localhost:8888/108-revision-5/', 0, 'revision', '', 0),
(127, 1, '2013-03-24 20:28:00', '2013-03-24 20:28:00', '<strong>Profil uživatele</strong>\r\n\r\nMyšákovy dobroty | Prodávající\r\nMěsto: Velká Polom\r\nRegistrován dne: 8.12.2012\r\n\r\n<a title="Myšákovy dobroty" href="http://www.fler.cz/shop/mysakovy-dobroty" target="_blank">http://www.fler.cz/shop/mysakovy-dobroty</a>\r\n\r\n<strong>Profil</strong>\r\n\r\nMám rád soulad s přírodou. Rád se zaměřuji na středověk, fantasy a ethno.\r\nJsem minimalistický designer webových stránek a aplikací. Vždy bylo mou obživou i koníčkem.\r\nHlavní mou radostí je ruční práce a výroba z kůže a dřeva.\r\nNyní se kromě výroby zaměřuji na stavbu slaměných domů v kterých chci do roka a do dne žít.\r\nZjistil jsem, že pro mě není problém vytvořit cokoliv hlavně z dřeva a kůže. Jestli potřebujete, můžu pro vás vyrábět části a spolupracovat na celkovém díle společně.\r\n\r\n<strong>Způsob dopravy</strong>\r\n\r\nZasílám balíky Českou poštou. Balím do kartonových krabiček.', 'Myšákovy dobroty - můj obchůdek na Fler.cz', '', 'inherit', 'open', 'open', '', '108-revision-6', '', '', '2013-03-24 20:28:00', '2013-03-24 20:28:00', '', 108, 'http://localhost:8888/108-revision-6/', 0, 'revision', '', 0),
(129, 1, '2013-03-26 14:39:11', '2013-03-26 14:39:11', '<strong>Myšákovy dobroty\r\n</strong>\r\n\r\nMyšákovy dobroty | Prodávající\r\nMěsto: Velká Polom\r\nRegistrován dne: 8.12.2012\r\n\r\n<a title="Myšákovy dobroty" href="http://www.fler.cz/shop/mysakovy-dobroty" target="_blank">http://www.fler.cz/shop/mysakovy-dobroty</a>\r\n\r\n<strong>Profil</strong>\r\n\r\nMám rád soulad s přírodou. Rád se zaměřuji na středověk, fantasy a ethno.\r\nJsem minimalistický designer webových stránek a aplikací. Vždy bylo mou obživou i koníčkem.\r\nHlavní mou radostí je ruční práce a výroba z kůže a dřeva.\r\nNyní se kromě výroby zaměřuji na stavbu slaměných domů v kterých chci do roka a do dne žít.\r\nZjistil jsem, že pro mě není problém vytvořit cokoliv hlavně z dřeva a kůže. Jestli potřebujete, můžu pro vás vyrábět části a spolupracovat na celkovém díle společně.\r\n\r\n<strong>Způsob dopravy</strong>\r\n\r\nZasílám balíky Českou poštou. Balím do kartonových krabiček.', 'Kutím na Flér.cz - Myšákovy dobroty', '', 'inherit', 'open', 'open', '', '108-revision-8', '', '', '2013-03-26 14:39:11', '2013-03-26 14:39:11', '', 108, 'http://localhost:8888/108-revision-8/', 0, 'revision', '', 0),
(128, 1, '2013-03-26 10:51:49', '2013-03-26 10:51:49', '<strong>Profil uživatele</strong>\r\n\r\nMyšákovy dobroty | Prodávající\r\nMěsto: Velká Polom\r\nRegistrován dne: 8.12.2012\r\n\r\n<a title="Myšákovy dobroty" href="http://www.fler.cz/shop/mysakovy-dobroty" target="_blank">http://www.fler.cz/shop/mysakovy-dobroty</a>\r\n\r\n<strong>Profil</strong>\r\n\r\nMám rád soulad s přírodou. Rád se zaměřuji na středověk, fantasy a ethno.\r\nJsem minimalistický designer webových stránek a aplikací. Vždy bylo mou obživou i koníčkem.\r\nHlavní mou radostí je ruční práce a výroba z kůže a dřeva.\r\nNyní se kromě výroby zaměřuji na stavbu slaměných domů v kterých chci do roka a do dne žít.\r\nZjistil jsem, že pro mě není problém vytvořit cokoliv hlavně z dřeva a kůže. Jestli potřebujete, můžu pro vás vyrábět části a spolupracovat na celkovém díle společně.\r\n\r\n<strong>Způsob dopravy</strong>\r\n\r\nZasílám balíky Českou poštou. Balím do kartonových krabiček.', 'Myšákovy dobroty - můj obchůdek na Fler.cz', '', 'inherit', 'open', 'open', '', '108-revision-7', '', '', '2013-03-26 10:51:49', '2013-03-26 10:51:49', '', 108, 'http://localhost:8888/108-revision-7/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(131, 1, '2013-02-19 15:46:14', '2013-02-19 15:46:14', 'Na internetu naleznete několik pěkných ukázek jak sestřihnout šablony a střihy pro výrobu kožených bot. Určitě nejdřív doporučuji vytvořit šablonu na nějaký levný materiál - plátno, látku. Vyzkoušet na nohu a poté vytvořit šablonu na tvrdý papír podle kterého budete později vyřezávat z kůže (eliminujete pro to špatné řezy a spotřebu kůže).\r\n<h2>Historické kožené boty</h2>\r\nTyto nákresy naleznete v předchozím článku v PDF dokumentu k stažení.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45.png"><img class="alignnone size-medium wp-image-73" alt="Snímek obrazovky 2013-02-19 v 16.27.45" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45-218x300.png" width="218" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38.png"><img class="alignnone size-medium wp-image-74" alt="Snímek obrazovky 2013-02-19 v 16.27.38" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38-187x300.png" width="187" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot1.jpg"><img class="alignnone size-medium wp-image-75" alt="nakresybot1" src="http://localhost:8888/wp-content/uploads/nakresybot1-139x300.jpg" width="139" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot2.jpg"><img class="alignnone size-medium wp-image-76" alt="nakresybot2" src="http://localhost:8888/wp-content/uploads/nakresybot2-300x298.jpg" width="300" height="298" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot3.jpg"><img class="alignnone size-medium wp-image-77" alt="nakresybot3" src="http://localhost:8888/wp-content/uploads/nakresybot3-219x300.jpg" width="219" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot4.jpg"><img class="alignnone size-medium wp-image-78" alt="nakresybot4" src="http://localhost:8888/wp-content/uploads/nakresybot4-300x277.jpg" width="300" height="277" /></a>', 'Ruční výroba kožených bot - Nákresy a střihy', '', 'inherit', 'open', 'open', '', '72-revision-5', '', '', '2013-02-19 15:46:14', '2013-02-19 15:46:14', '', 72, 'http://localhost:8888/72-revision-5/', 0, 'revision', '', 0),
(132, 1, '2013-03-26 14:43:45', '2013-03-26 14:43:45', 'Na internetu naleznete několik pěkných ukázek jak sestřihnout šablony a střihy pro výrobu kožených bot. Určitě nejdřív doporučuji vytvořit šablonu na nějaký levný materiál - plátno, látku. Vyzkoušet na nohu a poté vytvořit šablonu na tvrdý papír podle kterého budete později vyřezávat z kůže (eliminujete pro to špatné řezy a spotřebu kůže).\r\n<h2>Historické kožené boty</h2>\r\nTyto nákresy naleznete v předchozím článku v PDF dokumentu k stažení.\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45.png"><img class="size-medium wp-image-73 alignleft" alt="Snímek obrazovky 2013-02-19 v 16.27.45" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.45-218x300.png" width="218" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38.png"><img class="size-medium wp-image-74 alignleft" alt="Snímek obrazovky 2013-02-19 v 16.27.38" src="http://localhost:8888/wp-content/uploads/Snímek-obrazovky-2013-02-19-v 16.27.38-187x300.png" width="187" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot1.jpg"><img class="size-medium wp-image-75 alignleft" alt="nakresybot1" src="http://localhost:8888/wp-content/uploads/nakresybot1-139x300.jpg" width="139" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot2.jpg"><img class="size-medium wp-image-76 alignleft" alt="nakresybot2" src="http://localhost:8888/wp-content/uploads/nakresybot2-300x298.jpg" width="300" height="298" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot3.jpg"><img class="size-medium wp-image-77 alignleft" alt="nakresybot3" src="http://localhost:8888/wp-content/uploads/nakresybot3-219x300.jpg" width="219" height="300" /></a>\r\n<a href="http://localhost:8888/wp-content/uploads/nakresybot4.jpg"><img class="size-medium wp-image-78 alignleft" alt="nakresybot4" src="http://localhost:8888/wp-content/uploads/nakresybot4-300x277.jpg" width="300" height="277" /></a>', 'Ruční výroba kožených bot - Nákresy a střihy', '', 'inherit', 'open', 'open', '', '72-revision-6', '', '', '2013-03-26 14:43:45', '2013-03-26 14:43:45', '', 72, 'http://localhost:8888/72-revision-6/', 0, 'revision', '', 0),
(133, 1, '2013-02-19 14:08:26', '2013-02-19 14:08:26', '<h2>Cena kůže?</h2>\r\nPrvní velký poznatek. Na eshopech jsem našel cenu štípenky za decimetr čtvereční (dm2) okolo 6 – 9 Kč s dph.\r\n\r\nNačež jsem sehnal ceník z <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">koželužny</a>. Cena za decimetr čtvereční (dm2) stoprocentní bezkazové za 3 Kč s dph. Potom to jde samozřejmě dolů pokud jsou tam nějaké kazy. Podle procent použitelné plochy se zmenšuje i cena. 80% použitelné kůže (tedy 20% vad) = sleva 20% z těch 3Kč za 1 dm2.\r\n\r\nMusím pochválit <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">KUMO s.r.o. koželužnu</a> za velmi příjemný přístup. Vše pěkně popsáno a vysvětleno. <strong>Objednávám hned zítra.</strong>\r\n\r\nCena kůže v této koželužně o silnějších vrstvách a horních vrstvách – na podrážky atd. je 400 Kč za 1 Kg. Koželužna krájí pouze 1/4 části kruponu. Tato 1/4 kruponu má rozměry 30 na 120 cm a váží od 1,5 do 2 kg – tudíž odhadem 800 Kč. <em>Na internetu jsem našel ceny až okolo 1500 Kč za tento kus.</em>\r\n\r\nKoželužna mi také nabídla valchování štípenky – pro její změkčení. Dokonce mi byl posán proces valchování. Opravdu jsem byl mile překvapen tímto hezkým přístupem, kor v dnešní době.\r\n<h2>KŮŽE PŘIŠLA !</h2>\r\nKůže mě stála 2500 Kč s DPH.\r\n\r\nJe jí neskutečné množství. Je velká, pevná a bez jakýchkoliv vad !! Děkuji <a href="http://www.kumo-kozeluzna.cz/Site/Domu.html">KUMO s.r.o.</a>\r\n\r\n<a href="http://localhost:8888/wp-content/uploads/IMG_20130206_115707.jpg"><img class="alignnone size-medium wp-image-43" alt="IMG_20130206_115707" src="http://localhost:8888/wp-content/uploads/IMG_20130206_115707-300x225.jpg" width="300" height="225" /></a> <a href="http://localhost:8888/wp-content/uploads/IMG_20130206_115717.jpg"><img class="alignnone size-medium wp-image-44" alt="IMG_20130206_115717" src="http://localhost:8888/wp-content/uploads/IMG_20130206_115717-300x225.jpg" width="300" height="225" /></a>', 'Kůže - kde získat materiál ?', '', 'inherit', 'open', 'open', '', '42-revision-2', '', '', '2013-02-19 14:08:26', '2013-02-19 14:08:26', '', 42, 'http://localhost:8888/42-revision-2/', 0, 'revision', '', 0),
(136, 1, '2013-05-02 09:34:17', '2013-05-02 09:34:17', '', 'Co se děje v tvém okolí?', '', 'publish', 'closed', 'closed', '', 'activity', '', '', '2013-05-02 10:42:49', '2013-05-02 10:42:49', '', 0, 'http://localhost:8888/activity/', 0, 'page', '', 0),
(137, 1, '2013-05-02 09:34:17', '2013-05-02 09:34:17', '', 'Seznam kutilů', '', 'publish', 'closed', 'closed', '', 'seznam-kutilu', '', '', '2013-05-15 09:18:46', '2013-05-15 09:18:46', '', 0, 'http://localhost:8888/members/', 0, 'page', '', 0),
(138, 1, '2013-05-02 09:37:19', '2013-05-02 09:37:19', '', 'Registrace', '', 'publish', 'closed', 'closed', '', 'registrace', '', '', '2013-05-15 09:18:42', '2013-05-15 09:18:42', '', 0, 'http://localhost:8888/?page_id=138', 0, 'page', '', 0),
(139, 1, '2013-05-02 09:37:14', '2013-05-02 09:37:14', '', 'Registrace', '', 'inherit', 'open', 'open', '', '138-revision', '', '', '2013-05-02 09:37:14', '2013-05-02 09:37:14', '', 138, 'http://localhost:8888/138-revision/', 0, 'revision', '', 0),
(140, 1, '2013-05-02 09:38:21', '2013-05-02 09:38:21', '', 'Aktivace účtu', '', 'publish', 'closed', 'closed', '', 'aktivace-uctu', '', '', '2013-05-15 09:18:20', '2013-05-15 09:18:20', '', 0, 'http://localhost:8888/?page_id=140', 0, 'page', '', 0),
(141, 1, '2013-05-02 09:34:17', '2013-05-02 09:34:17', '', 'Activity', '', 'inherit', 'open', 'open', '', '136-revision', '', '', '2013-05-02 09:34:17', '2013-05-02 09:34:17', '', 136, 'http://localhost:8888/136-revision/', 0, 'revision', '', 0),
(142, 1, '2013-05-02 09:34:17', '2013-05-02 09:34:17', '', 'Members', '', 'inherit', 'open', 'open', '', '137-revision', '', '', '2013-05-02 09:34:17', '2013-05-02 09:34:17', '', 137, 'http://localhost:8888/137-revision/', 0, 'revision', '', 0),
(151, 1, '2013-05-02 13:51:23', '2013-05-02 13:51:23', '', 'Pravidla', '', 'publish', 'closed', 'closed', '', 'pravidla', '', '', '2013-05-15 09:18:37', '2013-05-15 09:18:37', '', 0, 'http://localhost:8888/?page_id=151', 0, 'page', '', 0),
(147, 1, '2013-05-02 11:30:19', '2013-05-02 11:30:19', '<h2>Top produkty</h2>\r\n&nbsp;\r\n<h2>Novinky</h2>\r\n&nbsp;\r\n<h2>Aktivity stream</h2>', 'Úvodní stránka', '', 'inherit', 'open', 'open', '', '145-revision-v1', '', '', '2013-05-02 11:30:19', '2013-05-02 11:30:19', '', 145, 'http://localhost:8888/145-revision-2/', 0, 'revision', '', 0),
(192, 1, '2013-10-22 13:24:57', '2013-10-22 13:24:57', '', 'Uvodni stranka', '', 'publish', 'open', 'open', '', 'vyrobky', '', '', '2014-01-20 11:23:25', '2014-01-20 11:23:25', '', 0, 'http://localhost:8888/?page_id=192', 0, 'page', '', 0),
(193, 1, '2013-10-22 13:24:57', '2013-10-22 13:24:57', '', 'Výrobky', '', 'inherit', 'open', 'open', '', '192-revision-v1', '', '', '2013-10-22 13:24:57', '2013-10-22 13:24:57', '', 192, 'http://localhost:8888/192-revision-v1/', 0, 'revision', '', 0),
(149, 1, '2013-05-02 12:07:58', '2013-05-02 12:07:58', '', 'Skupiny', '', 'publish', 'closed', 'closed', '', 'skupiny', '', '', '2013-05-02 16:42:39', '2013-05-02 16:42:39', '', 0, 'http://localhost:8888/groups/', 0, 'page', '', 0),
(150, 1, '2013-05-02 12:07:58', '2013-05-02 12:07:58', '', 'Groups', '', 'inherit', 'open', 'open', '', '149-revision', '', '', '2013-05-02 12:07:58', '2013-05-02 12:07:58', '', 149, 'http://localhost:8888/149-revision/', 0, 'revision', '', 0),
(159, 1, '2013-05-02 10:43:23', '2013-05-02 10:43:23', '', 'Kutilové', '', 'inherit', 'open', 'open', '', '137-revision-2', '', '', '2013-05-02 10:43:23', '2013-05-02 10:43:23', '', 137, 'http://localhost:8888/137-revision-2/', 0, 'revision', '', 0),
(152, 1, '2013-05-02 13:52:02', '2013-05-02 13:52:02', '', 'FAQ', '', 'publish', 'closed', 'closed', '', 'faq', '', '', '2013-05-15 09:18:28', '2013-05-15 09:18:28', '', 0, 'http://localhost:8888/?page_id=152', 0, 'page', '', 0),
(153, 1, '2013-05-02 13:51:52', '2013-05-02 13:51:52', '', 'Kontakt', '', 'publish', 'closed', 'closed', '', 'kontakt', '', '', '2013-05-15 09:18:33', '2013-05-15 09:18:33', '', 0, 'http://localhost:8888/?page_id=153', 0, 'page', '', 0),
(154, 1, '2013-05-02 13:51:36', '2013-05-02 13:51:36', '', 'FAQ', '', 'inherit', 'open', 'open', '', '152-revision', '', '', '2013-05-02 13:51:36', '2013-05-02 13:51:36', '', 152, 'http://localhost:8888/152-revision/', 0, 'revision', '', 0),
(155, 1, '2013-05-02 13:52:32', '2013-05-02 13:52:32', ' ', '', '', 'publish', 'open', 'open', '', '155', '', '', '2014-01-20 11:14:52', '2014-01-20 11:14:52', '', 0, 'http://localhost:8888/?p=155', 3, 'nav_menu_item', '', 0),
(156, 1, '2013-05-02 13:52:32', '2013-05-02 13:52:32', ' ', '', '', 'publish', 'open', 'open', '', '156', '', '', '2014-01-20 11:14:52', '2014-01-20 11:14:52', '', 0, 'http://localhost:8888/?p=156', 4, 'nav_menu_item', '', 0),
(157, 1, '2013-05-02 13:52:32', '2013-05-02 13:52:32', ' ', '', '', 'publish', 'open', 'open', '', '157', '', '', '2014-01-20 11:14:52', '2014-01-20 11:14:52', '', 0, 'http://localhost:8888/?p=157', 2, 'nav_menu_item', '', 0),
(158, 1, '2013-05-02 12:09:18', '2013-05-02 12:09:18', '', 'Kutilové sobě', '', 'inherit', 'open', 'open', '', '149-revision-2', '', '', '2013-05-02 12:09:18', '2013-05-02 12:09:18', '', 149, 'http://localhost:8888/149-revision-2/', 0, 'revision', '', 0),
(160, 1, '2013-05-02 09:37:19', '2013-05-02 09:37:19', '', 'Registrace', '', 'inherit', 'open', 'open', '', '138-revision-2', '', '', '2013-05-02 09:37:19', '2013-05-02 09:37:19', '', 138, 'http://localhost:8888/138-revision-2/', 0, 'revision', '', 0),
(161, 1, '2013-05-02 11:31:06', '2013-05-02 11:31:06', '<h2>Top produkty</h2>\r\n&nbsp;\r\n<h2>Novinky</h2>\r\n&nbsp;\r\n<h2>Aktivity stream</h2>', 'Úvodní stránka', '', 'inherit', 'open', 'open', '', '145-revision-v1', '', '', '2013-05-02 11:31:06', '2013-05-02 11:31:06', '', 145, 'http://localhost:8888/145-revision-3/', 0, 'revision', '', 0),
(162, 1, '2013-05-02 17:04:05', '2013-05-02 17:04:05', '', 'Registrace', '', 'inherit', 'open', 'open', '', '138-revision-3', '', '', '2013-05-02 17:04:05', '2013-05-02 17:04:05', '', 138, 'http://localhost:8888/138-revision-3/', 0, 'revision', '', 0),
(163, 1, '2013-05-02 16:49:28', '2013-05-02 16:49:28', '', 'Kutilové', '', 'inherit', 'open', 'open', '', '137-revision-3', '', '', '2013-05-02 16:49:28', '2013-05-02 16:49:28', '', 137, 'http://localhost:8888/137-revision-3/', 0, 'revision', '', 0),
(164, 1, '2013-05-03 07:50:28', '2013-05-03 07:50:28', '', 'Členové', '', 'inherit', 'open', 'open', '', '137-revision-4', '', '', '2013-05-03 07:50:28', '2013-05-03 07:50:28', '', 137, 'http://localhost:8888/137-revision-4/', 0, 'revision', '', 0),
(165, 1, '2013-05-03 07:51:58', '2013-05-03 07:51:58', '', 'Seznam kutilů', '', 'inherit', 'open', 'open', '', '137-revision-5', '', '', '2013-05-03 07:51:58', '2013-05-03 07:51:58', '', 137, 'http://localhost:8888/137-revision-5/', 0, 'revision', '', 0),
(166, 1, '2013-05-03 08:09:08', '2013-05-03 08:09:08', '', 'Seznam kutilů', '', 'inherit', 'open', 'open', '', '137-revision-6', '', '', '2013-05-03 08:09:08', '2013-05-03 08:09:08', '', 137, 'http://localhost:8888/137-revision-6/', 0, 'revision', '', 0),
(167, 1, '2013-05-03 08:14:36', '2013-05-03 08:14:36', '', 'Seznam kutilů', '', 'inherit', 'open', 'open', '', '137-revision-7', '', '', '2013-05-03 08:14:36', '2013-05-03 08:14:36', '', 137, 'http://localhost:8888/137-revision-7/', 0, 'revision', '', 0),
(169, 1, '2013-05-02 09:38:21', '2013-05-02 09:38:21', '', 'Aktivace účtu', '', 'inherit', 'open', 'open', '', '140-revision', '', '', '2013-05-02 09:38:21', '2013-05-02 09:38:21', '', 140, 'http://localhost:8888/140-revision/', 0, 'revision', '', 0),
(170, 1, '2013-05-02 13:52:02', '2013-05-02 13:52:02', '', 'FAQ', '', 'inherit', 'open', 'open', '', '152-revision-2', '', '', '2013-05-02 13:52:02', '2013-05-02 13:52:02', '', 152, 'http://localhost:8888/152-revision-2/', 0, 'revision', '', 0),
(171, 1, '2013-05-02 13:51:52', '2013-05-02 13:51:52', '', 'Kontakt', '', 'inherit', 'open', 'open', '', '153-revision', '', '', '2013-05-02 13:51:52', '2013-05-02 13:51:52', '', 153, 'http://localhost:8888/153-revision/', 0, 'revision', '', 0),
(172, 1, '2013-05-02 13:51:23', '2013-05-02 13:51:23', '', 'Pravidla', '', 'inherit', 'open', 'open', '', '151-revision', '', '', '2013-05-02 13:51:23', '2013-05-02 13:51:23', '', 151, 'http://localhost:8888/151-revision/', 0, 'revision', '', 0),
(173, 1, '2013-05-03 07:44:34', '2013-05-03 07:44:34', '', 'Registrace', '', 'inherit', 'open', 'open', '', '138-revision-4', '', '', '2013-05-03 07:44:34', '2013-05-03 07:44:34', '', 138, 'http://localhost:8888/138-revision-4/', 0, 'revision', '', 0),
(174, 1, '2013-05-03 08:22:16', '2013-05-03 08:22:16', '', 'Seznam kutilů', '', 'inherit', 'open', 'open', '', '137-revision-8', '', '', '2013-05-03 08:22:16', '2013-05-03 08:22:16', '', 137, 'http://localhost:8888/137-revision-8/', 0, 'revision', '', 0),
(201, 1, '2014-01-08 09:08:11', '2014-01-08 09:08:11', '<h1>Checkout</h1>\n\n{{mj-checkout-form}}', 'Mijireh Secure Checkout', '', 'trash', 'closed', 'closed', '', 'mijireh-secure-checkout', '', '', '2014-01-20 11:24:10', '2014-01-20 11:24:10', '', 0, 'http://localhost:8888/mijireh-secure-checkout/', 0, 'page', '', 0),
(179, 1, '2013-10-09 16:29:55', '2013-10-09 16:29:55', '', 'Výrobky', '', 'publish', 'closed', 'closed', '', 'vyrobky-2', '', '', '2014-01-20 11:26:52', '2014-01-20 11:26:52', '', 0, 'http://localhost:8888/obchod/', 0, 'page', '', 0),
(180, 1, '2013-10-09 16:29:57', '2013-10-09 16:29:57', '[woocommerce_cart]', 'Košík', '', 'publish', 'closed', 'open', '', 'kosik', '', '', '2013-10-09 16:29:57', '2013-10-09 16:29:57', '', 0, 'http://localhost:8888/kosik/', 0, 'page', '', 0),
(181, 1, '2013-10-09 16:29:58', '2013-10-09 16:29:58', '[woocommerce_checkout]', 'Pokladna', '', 'publish', 'closed', 'open', '', 'pokladna', '', '', '2013-10-09 16:29:58', '2013-10-09 16:29:58', '', 0, 'http://localhost:8888/pokladna/', 0, 'page', '', 0),
(182, 1, '2013-10-09 16:30:00', '2013-10-09 16:30:00', '[woocommerce_my_account]', 'Můj účet', '', 'publish', 'closed', 'open', '', 'muj-ucet', '', '', '2013-10-09 16:30:00', '2013-10-09 16:30:00', '', 0, 'http://localhost:8888/muj-ucet/', 0, 'page', '', 0),
(183, 1, '2013-10-09 16:30:01', '2013-10-09 16:30:01', '[woocommerce_lost_password]', 'Lost Password', '', 'publish', 'closed', 'open', '', 'lost-password', '', '', '2013-10-09 16:30:01', '2013-10-09 16:30:01', '', 182, 'http://localhost:8888/muj-ucet/lost-password/', 0, 'page', '', 0),
(184, 1, '2013-10-09 16:30:02', '2013-10-09 16:30:02', '[woocommerce_edit_address]', 'Upravit moji adresu', '', 'publish', 'closed', 'open', '', 'upravit-adresu', '', '', '2013-10-09 16:30:02', '2013-10-09 16:30:02', '', 182, 'http://localhost:8888/muj-ucet/upravit-adresu/', 0, 'page', '', 0),
(185, 1, '2013-10-09 16:30:03', '2013-10-09 16:30:03', '[woocommerce_view_order]', 'Zobrazit objednávku', '', 'publish', 'closed', 'open', '', 'zobrazit-objednavku', '', '', '2013-10-09 16:30:03', '2013-10-09 16:30:03', '', 182, 'http://localhost:8888/muj-ucet/zobrazit-objednavku/', 0, 'page', '', 0),
(186, 1, '2013-10-09 16:30:04', '2013-10-09 16:30:04', '[woocommerce_change_password]', 'Změna hesla', '', 'publish', 'closed', 'open', '', 'zmena-hesla', '', '', '2013-10-09 16:30:04', '2013-10-09 16:30:04', '', 182, 'http://localhost:8888/muj-ucet/zmena-hesla/', 0, 'page', '', 0),
(187, 1, '2013-10-09 16:30:05', '2013-10-09 16:30:05', '', 'Odhlášení', '', 'publish', 'closed', 'open', '', 'odhlasit', '', '', '2013-10-09 16:30:05', '2013-10-09 16:30:05', '', 182, 'http://localhost:8888/muj-ucet/odhlasit/', 0, 'page', '', 0),
(188, 1, '2013-10-09 16:30:07', '2013-10-09 16:30:07', '[woocommerce_pay]', 'K pokladně &rarr; zaplatit', '', 'publish', 'closed', 'open', '', 'zaplatit', '', '', '2013-10-09 16:30:07', '2013-10-09 16:30:07', '', 181, 'http://localhost:8888/pokladna/zaplatit/', 0, 'page', '', 0),
(189, 1, '2013-10-09 16:30:08', '2013-10-09 16:30:08', '[woocommerce_thankyou]', 'Přijaté objednávky', '', 'publish', 'closed', 'open', '', 'prijate-objednavky', '', '', '2013-10-09 16:30:08', '2013-10-09 16:30:08', '', 181, 'http://localhost:8888/pokladna/prijate-objednavky/', 0, 'page', '', 0),
(208, 1, '2014-01-20 09:30:17', '0000-00-00 00:00:00', '', 'Automaticky vytvořený koncept', '', 'auto-draft', 'open', 'open', '', '', '', '', '2014-01-20 09:30:17', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/?p=208', 0, 'post', '', 0),
(194, 1, '2013-10-22 13:31:54', '2013-10-22 13:31:54', ' ', '', '', 'publish', 'open', 'open', '', '194', '', '', '2014-01-20 11:14:52', '2014-01-20 11:14:52', '', 0, 'http://localhost:8888/?p=194', 1, 'nav_menu_item', '', 0),
(196, 1, '2013-10-22 13:41:50', '2013-10-22 13:41:50', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ipsum mauris, eleifend pretium tincidunt quis, facilisis a lacus. Nulla bibendum et tellus eget dapibus. Curabitur lobortis, massa ut rutrum hendrerit, ligula urna volutpat mi, a gravida nisi ligula ut libero. Duis a magna mi. Praesent venenatis eros at risus porttitor aliquet. Proin lobortis pretium urna sed faucibus. Nunc et odio erat. Proin porttitor posuere scelerisque. Sed pellentesque turpis porta risus ullamcorper, sit amet auctor dolor adipiscing. Fusce pretium, urna id egestas dictum, nisi elit vestibulum magna, ac malesuada nulla massa quis magna. Donec blandit pellentesque elementum. Integer dapibus justo et quam viverra, at pretium nulla venenatis. Mauris cursus volutpat tempor. Nunc nulla massa, tristique vitae ante eu, mattis fermentum nunc. Nulla eget imperdiet urna. Nam tellus orci, sagittis a risus in, rutrum eleifend felis.', 'Testovací opasek', '', 'publish', 'open', 'closed', '', 'testovaci-opasek', '', '', '2014-01-20 12:38:40', '2014-01-20 12:38:40', '', 0, 'http://localhost:8888/?post_type=product&#038;p=196', 0, 'product', '', 0),
(202, 1, '2014-01-08 09:22:43', '2014-01-08 09:22:43', '[pridat_produkt]', 'Založit nový výrobek', '', 'publish', 'closed', 'closed', '', 'zalozit-novy-vyrobek', '', '', '2014-01-22 13:25:36', '2014-01-22 13:25:36', '', 0, 'http://localhost:8888/?page_id=202', 0, 'page', '', 0),
(203, 1, '2014-01-08 09:22:43', '2014-01-08 09:22:43', '[pridat_produkt]', 'Založit nový výrobek', '', 'inherit', 'open', 'open', '', '202-revision-v1', '', '', '2014-01-08 09:22:43', '2014-01-08 09:22:43', '', 202, 'http://localhost:8888/202-revision-v1/', 0, 'revision', '', 0),
(209, 1, '2014-01-20 11:23:25', '2014-01-20 11:23:25', '', 'Uvodni stranka', '', 'inherit', 'open', 'open', '', '192-revision-v1', '', '', '2014-01-20 11:23:25', '2014-01-20 11:23:25', '', 192, 'http://localhost:8888/192-revision-v1/', 0, 'revision', '', 0),
(205, 1, '2014-01-08 09:43:59', '2014-01-08 09:43:59', 'Toto je můj krásný výrobek, je vyrobený z vyrobených výrobků.', 'Můj výrobek za kteýrm si stojím', '', 'publish', 'open', 'closed', '', 'muj-vyrobek-za-kteyrm-si-stojim', '', '', '2014-01-20 12:39:17', '2014-01-20 12:39:17', '', 0, 'http://localhost:8888/?post_type=product&#038;p=205', 0, 'product', '', 0),
(206, 1, '2014-01-08 10:30:19', '2014-01-08 10:30:19', 'TEAT ASDF ASDFDASF ASDFASDF ASDF', 'test', '', 'trash', 'open', 'open', '', 'test', '', '', '2014-01-20 12:38:21', '2014-01-20 12:38:21', '', 0, 'http://localhost:8888/?post_type=product&#038;p=206', 0, 'product', '', 0),
(207, 1, '2014-01-08 11:53:07', '2014-01-08 11:53:07', '<div id="ajaxInsert">\r\n\r\nVítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic, jen zelenkavá tráva, jasně modrá obloha a tři křiklavě barevné pouťové balónky, které se téměř nepozorovatelně pohupují ani ne moc vysoko, ani moc nízko nad zemí. Kdyby pod balónky nebyla sytě zelenkavá tráva, ale třeba suchá silnice či beton, možná by bylo vidět jejich barevné stíny - to jak přes poloprůsvitné barevné balónky prochází ostré sluneční paprsky.\r\n\r\nJenže kvůli všudy přítomné trávě jsou stíny balónků sotva vidět, natož aby šlo rozeznat, jakou barvu tyto stíny mají. Uvidět tak balónky náhodný kolemjdoucí, jistě by si pomyslel, že už tu takhle poletují snad tisíc let. Stále si víceméně drží výšku a ani do stran se příliš nepohybují. Proti slunci to vypadá, že se slunce pohybuje k západu rychleji než balónky, a možná to tak skutečně je. Nejeden filozof by mohl tvrdit, že balónky se sluncem závodí, ale fyzikové by to jistě vyvrátili. Z fyzikálního pohledu totiž balónky působí zcela nezajímavě.\r\n\r\n</div>', 'Vepř test', 'Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic.', 'publish', 'open', 'closed', '', 'vepr-test', '', '', '2014-01-20 12:26:43', '2014-01-20 12:26:43', '', 0, 'http://localhost:8888/?post_type=product&#038;p=207', 0, 'product', '', 3),
(210, 1, '2014-01-20 11:24:10', '2014-01-20 11:24:10', '<h1>Checkout</h1>\n\n{{mj-checkout-form}}', 'Mijireh Secure Checkout', '', 'inherit', 'open', 'open', '', '201-revision-v1', '', '', '2014-01-20 11:24:10', '2014-01-20 11:24:10', '', 201, 'http://localhost:8888/201-revision-v1/', 0, 'revision', '', 0),
(211, 1, '2014-01-20 11:26:45', '2014-01-20 11:26:45', '', 'Výrobky', '', 'inherit', 'open', 'open', '', '179-revision-v1', '', '', '2014-01-20 11:26:45', '2014-01-20 11:26:45', '', 179, 'http://localhost:8888/179-revision-v1/', 0, 'revision', '', 0),
(212, 1, '2014-01-20 12:15:47', '2014-01-20 12:15:47', '', '_MG_9836', '', 'inherit', 'open', 'open', '', '_mg_9836', '', '', '2014-01-20 12:15:47', '2014-01-20 12:15:47', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9836.jpg', 0, 'attachment', 'image/jpeg', 0),
(213, 1, '2014-01-20 12:15:50', '2014-01-20 12:15:50', '', '_MG_9846', '', 'inherit', 'open', 'open', '', '_mg_9846', '', '', '2014-01-20 12:15:50', '2014-01-20 12:15:50', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9846.jpg', 0, 'attachment', 'image/jpeg', 0),
(214, 1, '2014-01-20 12:15:52', '2014-01-20 12:15:52', '', '_MG_9849', '', 'inherit', 'open', 'open', '', '_mg_9849', '', '', '2014-01-20 12:15:52', '2014-01-20 12:15:52', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9849.jpg', 0, 'attachment', 'image/jpeg', 0),
(215, 1, '2014-01-20 12:15:53', '2014-01-20 12:15:53', '', '_MG_9851', '', 'inherit', 'open', 'open', '', '_mg_9851', '', '', '2014-01-20 12:15:53', '2014-01-20 12:15:53', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9851.jpg', 0, 'attachment', 'image/jpeg', 0),
(216, 1, '2014-01-20 12:15:56', '2014-01-20 12:15:56', '', '_MG_9858', '', 'inherit', 'open', 'open', '', '_mg_9858', '', '', '2014-01-20 12:15:56', '2014-01-20 12:15:56', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9858.jpg', 0, 'attachment', 'image/jpeg', 0),
(217, 1, '2014-01-20 12:15:58', '2014-01-20 12:15:58', '', '_MG_9873', '', 'inherit', 'open', 'open', '', '_mg_9873', '', '', '2014-01-20 12:15:58', '2014-01-20 12:15:58', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9873.jpg', 0, 'attachment', 'image/jpeg', 0),
(218, 1, '2014-01-20 12:16:00', '2014-01-20 12:16:00', '', '_MG_9915', '', 'inherit', 'open', 'open', '', '_mg_9915', '', '', '2014-01-20 12:16:00', '2014-01-20 12:16:00', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9915.jpg', 0, 'attachment', 'image/jpeg', 0),
(219, 1, '2014-01-20 12:16:02', '2014-01-20 12:16:02', '', '_MG_9934', '', 'inherit', 'open', 'open', '', '_mg_9934', '', '', '2014-01-20 12:16:02', '2014-01-20 12:16:02', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9934.jpg', 0, 'attachment', 'image/jpeg', 0),
(220, 1, '2014-01-20 12:16:04', '2014-01-20 12:16:04', '', '_MG_9936', '', 'inherit', 'open', 'open', '', '_mg_9936', '', '', '2014-01-20 12:16:04', '2014-01-20 12:16:04', '', 207, 'http://localhost:8888/wp-content/uploads/MG_9936.jpg', 0, 'attachment', 'image/jpeg', 0),
(221, 1, '2014-01-20 12:16:38', '2014-01-20 12:16:38', '', '_MG_5956a', '', 'inherit', 'open', 'open', '', '_mg_5956a', '', '', '2014-01-20 12:16:38', '2014-01-20 12:16:38', '', 207, 'http://localhost:8888/wp-content/uploads/MG_5956a.jpg', 0, 'attachment', 'image/jpeg', 0),
(225, 1, '2014-01-20 13:35:20', '2014-01-20 13:35:20', '<div id="ajaxInsert">\n\nVítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic, jen zelenkavá tráva, jasně modrá obloha a tři křiklavě barevné pouťové balónky, které se téměř nepozorovatelně pohupují ani ne moc vysoko, ani moc nízko nad zemí. Kdyby pod balónky nebyla sytě zelenkavá tráva, ale třeba suchá silnice či beton, možná by bylo vidět jejich barevné stíny - to jak přes poloprůsvitné barevné balónky prochází ostré sluneční paprsky.\n\nJenže kvůli všudy přítomné trávě jsou stíny balónků sotva vidět, natož aby šlo rozeznat, jakou barvu tyto stíny mají. Uvidět tak balónky náhodný kolemjdoucí, jistě by si pomyslel, že už tu takhle poletují snad tisíc let. Stále si víceméně drží výšku a ani do stran se příliš nepohybují. Proti slunci to vypadá, že se slunce pohybuje k západu rychleji než balónky, a možná to tak skutečně je. Nejeden filozof by mohl tvrdit, že balónky se sluncem závodí, ale fyzikové by to jistě vyvrátili. Z fyzikálního pohledu totiž balónky působí zcela nezajímavě.\n\n</div>', 'Vepř test', 'Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic.', 'inherit', 'open', 'open', '', '207-autosave-v1', '', '', '2014-01-20 13:35:20', '2014-01-20 13:35:20', '', 207, 'http://localhost:8888/207-autosave-v1/', 0, 'revision', '', 0),
(224, 1, '2014-01-20 13:17:04', '2014-01-20 13:17:04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ipsum mauris, eleifend pretium tincidunt quis, facilisis a lacus. Nulla bibendum et tellus eget dapibus. Curabitur lobortis, massa ut rutrum hendrerit, ligula urna volutpat mi, a gravida nisi ligula ut libero. Duis a magna mi. Praesent venenatis eros at risus porttitor aliquet. Proin lobortis pretium urna sed faucibus. Nunc et odio erat. Proin porttitor posuere scelerisque. Sed pellentesque turpis porta risus ullamcorper, sit amet auctor dolor adipiscing. Fusce pretium, urna id egestas dictum, nisi elit vestibulum magna, ac malesuada nulla massa quis magna. Donec blandit pellentesque elementum. Integer dapibus justo et quam viverra, at pretium nulla venenatis. Mauris cursus volutpat tempor. Nunc nulla massa, tristique vitae ante eu, mattis fermentum nunc. Nulla eget imperdiet urna. Nam tellus orci, sagittis a risus in, rutrum eleifend felis.', 'Testovací opasek', '', 'inherit', 'open', 'open', '', '196-autosave-v1', '', '', '2014-01-20 13:17:04', '2014-01-20 13:17:04', '', 196, 'http://localhost:8888/196-autosave-v1/', 0, 'revision', '', 0),
(226, 1, '2014-01-22 10:57:42', '2014-01-22 10:57:42', 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum', 'Testing ehm testing, All right gordon', '', 'publish', 'open', 'open', '', 'testing-ehm-testing-all-right-gordon', '', '', '2014-01-22 10:57:42', '2014-01-22 10:57:42', '', 0, 'http://localhost:8888/?post_type=product&#038;p=226', 0, 'product', '', 0),
(227, 1, '2014-01-22 10:57:28', '2014-01-22 10:57:28', '', '1390388138__DSC2637', '', 'inherit', 'open', 'open', '', '1390388138__dsc2637', '', '', '2014-01-22 10:57:28', '2014-01-22 10:57:28', '', 226, '/Users/Administrator/GIT/CREATO.CZ/wp-content/uploads/1390388138__DSC2637.JPG', 0, 'attachment', 'image/jpeg', 0),
(228, 1, '2014-01-22 10:57:32', '2014-01-22 10:57:32', '', '1390388138_IMG_20140106_151138', '', 'inherit', 'open', 'open', '', '1390388138_img_20140106_151138', '', '', '2014-01-22 10:57:32', '2014-01-22 10:57:32', '', 226, '/Users/Administrator/GIT/CREATO.CZ/wp-content/uploads/1390388138_IMG_20140106_151138.jpg', 0, 'attachment', 'image/jpeg', 0),
(229, 1, '2014-01-22 10:57:34', '2014-01-22 10:57:34', '', '1390388138_pasek-16cm', '', 'inherit', 'open', 'open', '', '1390388138_pasek-16cm', '', '', '2014-01-22 10:57:34', '2014-01-22 10:57:34', '', 226, '/Users/Administrator/GIT/CREATO.CZ/wp-content/uploads/1390388138_pasek-16cm.jpg', 0, 'attachment', 'image/jpeg', 0),
(230, 1, '2014-01-23 12:18:46', '2014-01-23 12:18:46', '', '1390479432_modra', '', 'inherit', 'open', 'open', '', '1390479432_modra', '', '', '2014-01-23 12:18:46', '2014-01-23 12:18:46', '', 0, '/Users/Administrator/GIT/CREATO.CZ/wp-content/uploads/1390479432_modra.png', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `datetime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=109 ;

--
-- Vypisuji data pro tabulku `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`, `active`, `user_id`, `datetime`) VALUES
(1, 'Nezařazené', 'nezarazene', 0, 1, 0, 0),
(2, 'Práce s kůží', 'prace-s-kuzi', 0, 1, 0, 0),
(3, 'Hlavní menu', 'hlavni-menu', 0, 1, 0, 0),
(4, 'kůže', 'kuze', 0, 1, 0, 0),
(5, 'vybavení', 'vybaveni', 0, 1, 0, 0),
(6, 'nářadí', 'naradi', 0, 1, 0, 0),
(7, 'dílna', 'dilna', 0, 1, 0, 0),
(8, 'boty', 'boty', 0, 1, 0, 0),
(9, 'výroba bot', 'vyroba-bot', 0, 1, 0, 0),
(10, 'koženářství', 'kozenarstvi', 0, 1, 0, 0),
(11, 'šití kůže', 'siti-kuze', 0, 1, 0, 0),
(12, 'švy', 'svy', 0, 1, 0, 0),
(13, 'jehly', 'jehly', 0, 1, 0, 0),
(14, 'výroba', 'vyroba', 0, 1, 0, 0),
(15, 'materiál', 'material', 0, 1, 0, 0),
(16, 'kde vzít', 'kde-vzit', 0, 1, 0, 0),
(17, 'koupit', 'koupit', 0, 1, 0, 0),
(18, 'koupit kůži', 'koupit-kuzi', 0, 1, 0, 0),
(19, 'koželužna', 'kozeluzna', 0, 1, 0, 0),
(20, 'koželužny', 'kozeluzny', 0, 1, 0, 0),
(21, 'sklad kůže', 'sklad-kuze', 0, 1, 0, 0),
(22, 'kleště', 'kleste', 0, 1, 0, 0),
(23, 'kopyto', 'kopyto', 0, 1, 0, 0),
(24, 'natahovací kleště', 'natahovaci-kleste', 0, 1, 0, 0),
(25, 'kleště s kladivem', 'kleste-s-kladivem', 0, 1, 0, 0),
(26, 'kleště s kladívkem', 'kleste-s-kladivkem', 0, 1, 0, 0),
(27, 'gotické', 'goticke', 0, 1, 0, 0),
(28, 'gotycké', 'gotycke', 0, 1, 0, 0),
(29, 'historické', 'historicke', 0, 1, 0, 0),
(30, 'historické boty', 'historicke-boty', 0, 1, 0, 0),
(31, 'historical boots', 'historical-boots', 0, 1, 0, 0),
(32, 'shoes', 'shoes', 0, 1, 0, 0),
(33, 'kožené boty', 'kozene-boty', 0, 1, 0, 0),
(34, 'obuv', 'obuv', 0, 1, 0, 0),
(35, 'střih', 'strih', 0, 1, 0, 0),
(36, 'předloha', 'predloha', 0, 1, 0, 0),
(37, 'šablona', 'sablona', 0, 1, 0, 0),
(38, 'převrácené boty', 'prevracene-boty', 0, 1, 0, 0),
(39, 'york archeology', 'york-archeology', 0, 1, 0, 0),
(40, 'archeology', 'archeology', 0, 1, 0, 0),
(41, 'historie', 'historie', 0, 1, 0, 0),
(42, 'oliver', 'oliver', 0, 1, 0, 0),
(43, 'rabbath', 'rabbath', 0, 1, 0, 0),
(44, 'oliver rabath', 'oliver-rabath', 0, 1, 0, 0),
(45, 'art', 'art', 0, 1, 0, 0),
(46, 'umělec', 'umelec', 0, 1, 0, 0),
(47, 'francie', 'francie', 0, 1, 0, 0),
(48, 'how to make boots from your garage', 'how-to-make-boots-from-your-garage', 0, 1, 0, 0),
(49, 'jak udělat boty v vlastní garáži', 'jak-udelat-boty-v-vlastni-garazi', 0, 1, 0, 0),
(50, 'projekt', 'projekt', 0, 1, 0, 0),
(51, 'ruční výroba', 'rucni-vyroba', 0, 1, 0, 0),
(52, 'ruční ští kůže', 'rucni-sti-kuze', 0, 1, 0, 0),
(53, 'Práce s dřevem', 'prace-s-drevem', 0, 1, 0, 0),
(54, 'prace s kuži', 'prace-s-kuzi-2', 0, 1, 0, 0),
(55, 'ruční práce', 'rucni-prace', 0, 1, 0, 0),
(56, 'flér', 'fler', 0, 1, 0, 0),
(57, 'fler.cz', 'fler-cz', 0, 1, 0, 0),
(58, 'myšákovy dobroty', 'mysakovy-dobroty', 0, 1, 0, 0),
(59, 'opasek', 'opasek', 0, 1, 0, 0),
(60, 'pásek', 'pasek', 0, 1, 0, 0),
(61, 'kožené', 'kozene', 0, 1, 0, 0),
(62, 'práce s dřevem', 'prace-s-drevem-2', 0, 1, 0, 0),
(63, 'dřevo', 'drevo', 0, 1, 0, 0),
(64, 'shishi-odoshi', 'shishi-odoshi', 0, 1, 0, 0),
(65, 'shishi', 'shishi', 0, 1, 0, 0),
(66, 'odoshi', 'odoshi', 0, 1, 0, 0),
(67, 'kutil', 'kutil', 0, 1, 0, 0),
(68, 'kulatina', 'kulatina', 0, 1, 0, 0),
(69, 'jabloň', 'jablon', 0, 1, 0, 0),
(70, 'simple', 'simple', 0, 1, 0, 0),
(71, 'grouped', 'grouped', 0, 1, 0, 0),
(72, 'variable', 'variable', 0, 1, 0, 0),
(73, 'external', 'external', 0, 1, 0, 0),
(74, 'pending', 'pending', 0, 1, 0, 0),
(75, 'failed', 'failed', 0, 1, 0, 0),
(76, 'on-hold', 'on-hold', 0, 1, 0, 0),
(77, 'processing', 'processing', 0, 1, 0, 0),
(78, 'completed', 'completed', 0, 1, 0, 0),
(79, 'refunded', 'refunded', 0, 1, 0, 0),
(80, 'cancelled', 'cancelled', 0, 1, 0, 0),
(81, 'Módní doplňky', 'modni-doplnky', 0, 1, 1, 1383466524),
(82, 'Kabelky', 'kabelky', 0, 1, 1, 1383466538),
(83, 'Opasky', 'opasky', 0, 1, 1, 1383466543),
(84, '81', '81', 0, 1, 0, 0),
(85, '83', '83', 0, 1, 0, 0),
(86, 'Zdraví a krása', 'zdravi-krasa', 0, 1, 1, 1389176086),
(87, 'Šperky a self-dekorace', 'sperky-self-dekorace', 0, 1, 1, 1389176626),
(88, 'Recyklované', 'recyklovane', 0, 1, 1, 1389176646),
(89, 'Umění', 'umeni', 0, 1, 1, 1389176664),
(90, 'Erotika', 'erotika', 0, 1, 1, 1389176669),
(91, 'Vintage', 'vintage', 0, 1, 1, 1389176676),
(92, 'Keramika', 'keramika', 0, 1, 1, 1389176686),
(93, '86', '86', 0, 1, 0, 0),
(94, '87', '87', 0, 1, 0, 0),
(95, '88', '88', 0, 1, 0, 0),
(96, '89', '89', 0, 1, 0, 0),
(97, '90', '90', 0, 1, 0, 0),
(98, '91', '91', 0, 1, 0, 0),
(99, '92', '92', 0, 1, 0, 0),
(100, 'Domov', 'domov', 0, 1, 1, 1389181764),
(101, '82', '82', 0, 1, 0, 0),
(102, '100', '100', 0, 1, 0, 0),
(103, 'Náhrdelníky', 'nahrdelniky', 0, 1, 1, 1389182153),
(104, 'Naušnice', 'nausnice', 0, 1, 1, 1389182162),
(105, 'Spodky', 'spodky', 0, 1, 1, 1389182175),
(106, '103', '103', 0, 1, 0, 0),
(107, '104', '104', 0, 1, 0, 0),
(108, '105', '105', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(8, 2, 0),
(195, 81, 0),
(156, 3, 0),
(13, 4, 0),
(13, 2, 0),
(13, 5, 0),
(13, 6, 0),
(13, 7, 0),
(13, 8, 0),
(13, 9, 0),
(13, 10, 0),
(8, 4, 0),
(8, 11, 0),
(8, 12, 0),
(8, 13, 0),
(8, 14, 0),
(42, 4, 0),
(42, 2, 0),
(42, 15, 0),
(42, 16, 0),
(42, 17, 0),
(42, 18, 0),
(42, 19, 0),
(42, 20, 0),
(42, 21, 0),
(49, 22, 0),
(49, 2, 0),
(49, 23, 0),
(49, 24, 0),
(49, 25, 0),
(49, 26, 0),
(64, 27, 0),
(60, 2, 0),
(64, 2, 0),
(64, 28, 0),
(64, 29, 0),
(64, 8, 0),
(64, 30, 0),
(64, 31, 0),
(64, 32, 0),
(64, 33, 0),
(64, 4, 0),
(72, 34, 0),
(72, 2, 0),
(72, 33, 0),
(72, 8, 0),
(72, 35, 0),
(72, 36, 0),
(72, 37, 0),
(84, 2, 0),
(89, 2, 0),
(84, 38, 0),
(84, 39, 0),
(84, 40, 0),
(84, 41, 0),
(84, 29, 0),
(60, 42, 0),
(60, 43, 0),
(60, 44, 0),
(60, 45, 0),
(60, 46, 0),
(60, 47, 0),
(60, 48, 0),
(60, 49, 0),
(60, 50, 0),
(60, 51, 0),
(60, 14, 0),
(60, 4, 0),
(60, 52, 0),
(108, 54, 0),
(108, 2, 0),
(108, 55, 0),
(108, 51, 0),
(108, 56, 0),
(108, 57, 0),
(108, 58, 0),
(108, 59, 0),
(108, 60, 0),
(108, 61, 0),
(108, 4, 0),
(115, 62, 0),
(115, 53, 0),
(115, 63, 0),
(115, 64, 0),
(115, 65, 0),
(115, 66, 0),
(155, 3, 0),
(120, 53, 0),
(120, 63, 0),
(120, 62, 0),
(120, 67, 0),
(120, 68, 0),
(120, 69, 0),
(157, 3, 0),
(194, 3, 0),
(195, 82, 0),
(195, 70, 0),
(196, 81, 0),
(196, 83, 0),
(196, 70, 0),
(226, 84, 0),
(205, 84, 0),
(205, 85, 0),
(205, 83, 0),
(205, 86, 0),
(205, 70, 0),
(206, 93, 0),
(206, 94, 0),
(206, 95, 0),
(206, 96, 0),
(206, 97, 0),
(206, 98, 0),
(206, 99, 0),
(207, 84, 0),
(207, 101, 0),
(207, 85, 0),
(207, 93, 0),
(207, 94, 0),
(207, 95, 0),
(207, 96, 0),
(207, 97, 0),
(207, 98, 0),
(207, 99, 0),
(207, 102, 0),
(207, 100, 0),
(207, 90, 0),
(207, 92, 0),
(207, 81, 0),
(207, 82, 0),
(207, 83, 0),
(207, 88, 0),
(207, 87, 0),
(207, 89, 0),
(207, 91, 0),
(207, 86, 0),
(207, 70, 0),
(207, 103, 0),
(207, 104, 0),
(207, 105, 0),
(226, 101, 0),
(226, 85, 0),
(226, 106, 0),
(226, 107, 0),
(226, 108, 0),
(226, 93, 0),
(226, 94, 0),
(226, 95, 0),
(226, 96, 0),
(226, 97, 0),
(226, 98, 0),
(226, 99, 0),
(226, 102, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=109 ;

--
-- Vypisuji data pro tabulku `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 9),
(3, 3, 'nav_menu', '', 0, 4),
(4, 4, 'post_tag', '', 0, 6),
(5, 5, 'post_tag', '', 0, 1),
(6, 6, 'post_tag', '', 0, 1),
(7, 7, 'post_tag', '', 0, 1),
(8, 8, 'post_tag', '', 0, 3),
(9, 9, 'post_tag', '', 0, 1),
(10, 10, 'post_tag', '', 0, 1),
(11, 11, 'post_tag', '', 0, 1),
(12, 12, 'post_tag', '', 0, 1),
(13, 13, 'post_tag', '', 0, 1),
(14, 14, 'post_tag', '', 0, 2),
(15, 15, 'post_tag', '', 0, 1),
(16, 16, 'post_tag', '', 0, 1),
(17, 17, 'post_tag', '', 0, 1),
(18, 18, 'post_tag', '', 0, 1),
(19, 19, 'post_tag', '', 0, 1),
(20, 20, 'post_tag', '', 0, 1),
(21, 21, 'post_tag', '', 0, 1),
(22, 22, 'post_tag', '', 0, 1),
(23, 23, 'post_tag', '', 0, 1),
(24, 24, 'post_tag', '', 0, 1),
(25, 25, 'post_tag', '', 0, 1),
(26, 26, 'post_tag', '', 0, 1),
(27, 27, 'post_tag', '', 0, 1),
(28, 28, 'post_tag', '', 0, 1),
(29, 29, 'post_tag', '', 0, 2),
(30, 30, 'post_tag', '', 0, 1),
(31, 31, 'post_tag', '', 0, 1),
(32, 32, 'post_tag', '', 0, 1),
(33, 33, 'post_tag', '', 0, 2),
(34, 34, 'post_tag', '', 0, 1),
(35, 35, 'post_tag', '', 0, 1),
(36, 36, 'post_tag', '', 0, 1),
(37, 37, 'post_tag', '', 0, 1),
(38, 38, 'post_tag', '', 0, 1),
(39, 39, 'post_tag', '', 0, 1),
(40, 40, 'post_tag', '', 0, 1),
(41, 41, 'post_tag', '', 0, 1),
(42, 42, 'post_tag', '', 0, 1),
(43, 43, 'post_tag', '', 0, 1),
(44, 44, 'post_tag', '', 0, 1),
(45, 45, 'post_tag', '', 0, 1),
(46, 46, 'post_tag', '', 0, 1),
(47, 47, 'post_tag', '', 0, 1),
(48, 48, 'post_tag', '', 0, 1),
(49, 49, 'post_tag', '', 0, 1),
(50, 50, 'post_tag', '', 0, 1),
(51, 51, 'post_tag', '', 0, 2),
(52, 52, 'post_tag', '', 0, 1),
(53, 53, 'category', '', 0, 2),
(54, 54, 'post_tag', '', 0, 1),
(55, 55, 'post_tag', '', 0, 1),
(56, 56, 'post_tag', '', 0, 1),
(57, 57, 'post_tag', '', 0, 1),
(58, 58, 'post_tag', '', 0, 1),
(59, 59, 'post_tag', '', 0, 1),
(60, 60, 'post_tag', '', 0, 1),
(61, 61, 'post_tag', '', 0, 1),
(62, 62, 'post_tag', '', 0, 2),
(63, 63, 'post_tag', '', 0, 2),
(64, 64, 'post_tag', '', 0, 1),
(65, 65, 'post_tag', '', 0, 1),
(66, 66, 'post_tag', '', 0, 1),
(67, 67, 'post_tag', '', 0, 1),
(68, 68, 'post_tag', '', 0, 1),
(69, 69, 'post_tag', '', 0, 1),
(70, 70, 'product_type', '', 0, 4),
(71, 71, 'product_type', '', 0, 0),
(72, 72, 'product_type', '', 0, 0),
(73, 73, 'product_type', '', 0, 0),
(74, 74, 'shop_order_status', '', 0, 0),
(75, 75, 'shop_order_status', '', 0, 0),
(76, 76, 'shop_order_status', '', 0, 0),
(77, 77, 'shop_order_status', '', 0, 0),
(78, 78, 'shop_order_status', '', 0, 0),
(79, 79, 'shop_order_status', '', 0, 0),
(80, 80, 'shop_order_status', '', 0, 0),
(81, 81, 'product_cat', 'Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu. Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně, balónky působí jako jakási fata morgána uprostřed pouště. Zkrátka široko daleko nikde nic, jen zelenkavá tráva, jasně modrá obloha a tři křiklavě barevné pouťové balónky, které se téměř nepozorovatelně pohupují ani ne moc vysoko, ani moc nízko nad zemí. Kdyby pod balónky nebyla sytě zelenkavá tráva, ale třeba suchá silnice či beton, možná by bylo vidět jejich barevné stíny - to jak přes poloprůsvitné barevné balónky prochází ostré sluneční paprsky.', 0, 3),
(82, 82, 'product_cat', '', 81, 2),
(83, 83, 'product_cat', '', 81, 3),
(84, 84, 'post_tag', '', 0, 0),
(85, 85, 'post_tag', '', 0, 0),
(86, 86, 'product_cat', 'zdraví a krása je důležitá :)', 0, 2),
(87, 87, 'product_cat', '', 0, 1),
(88, 88, 'product_cat', '', 0, 1),
(89, 89, 'product_cat', '', 0, 1),
(90, 90, 'product_cat', '', 0, 1),
(91, 91, 'product_cat', '', 0, 1),
(92, 92, 'product_cat', '', 0, 1),
(93, 93, 'post_tag', '', 0, 0),
(94, 94, 'post_tag', '', 0, 0),
(95, 95, 'post_tag', '', 0, 0),
(96, 96, 'post_tag', '', 0, 0),
(97, 97, 'post_tag', '', 0, 0),
(98, 98, 'post_tag', '', 0, 0),
(99, 99, 'post_tag', '', 0, 0),
(100, 100, 'product_cat', '', 0, 1),
(101, 101, 'post_tag', '', 0, 0),
(102, 102, 'post_tag', '', 0, 0),
(103, 103, 'product_cat', '', 81, 1),
(104, 104, 'product_cat', '', 81, 1),
(105, 105, 'product_cat', '', 81, 1),
(106, 106, 'post_tag', '', 0, 0),
(107, 107, 'post_tag', '', 0, 0),
(108, 108, 'post_tag', '', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=588 ;

--
-- Vypisuji data pro tabulku `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', 'David'),
(2, 1, 'last_name', 'Šuška'),
(3, 1, 'nickname', 'David Šuška'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'false'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '208'),
(15, 1, 'wp_user-settings', 'hidetb=1&editor=tinymce&libraryContent=browse&ed_size=708'),
(16, 1, 'wp_user-settings-time', '1382449027'),
(17, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(18, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(19, 1, 'nav_menu_recently_edited', '3'),
(20, 1, 'aim', ''),
(21, 1, 'yim', ''),
(22, 1, 'jabber', 'info@webni.cz'),
(23, 1, 'last_activity', '2014-01-24 09:52:56'),
(24, 1, 'bp_latest_update', 'a:2:{s:2:"id";i:26;s:7:"content";s:72:" Ptaci se skrývají v oblacích, ryby se skrývají v hlubinách. A my.";}'),
(68, 4, 'aim', ''),
(69, 4, 'yim', ''),
(66, 4, 'bp_xprofile_visibility_levels', 'a:2:{i:1;s:6:"public";i:2;s:6:"public";}'),
(65, 4, 'wp_user_level', '0'),
(64, 4, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(63, 4, 'show_admin_bar_front', 'false'),
(62, 4, 'use_ssl', '0'),
(61, 4, 'admin_color', 'fresh'),
(60, 4, 'comment_shortcuts', 'false'),
(59, 4, 'rich_editing', 'true'),
(70, 4, 'jabber', ''),
(55, 4, 'first_name', 'David'),
(56, 4, 'last_name', 'Myšakof myšák'),
(57, 4, 'nickname', 'David Myšakof myšák'),
(58, 4, 'description', ''),
(78, 1, 'total_friend_count', '1'),
(77, 4, 'total_friend_count', '1'),
(76, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(146, 1, 'bp_favorite_activities', 'a:2:{i:0;s:2:"19";i:1;s:2:"31";}'),
(75, 1, 'closedpostboxes_dashboard', 'a:1:{i:0;s:6:"widget";}'),
(71, 4, 'last_activity', '2013-05-03 10:43:52'),
(72, 4, 'bp_latest_update', 'a:2:{s:2:"id";i:7;s:7:"content";s:40:"@administrator  Maš moc pěkné jméno.";}'),
(79, 4, 'bp_favorite_activities', 'a:1:{i:0;s:2:"12";}'),
(80, 1, 'bp_xprofile_visibility_levels', 'a:4:{i:1;s:6:"public";i:2;s:6:"public";i:516;s:6:"public";i:521;s:6:"public";}'),
(81, 4, 'total_group_count', '-1'),
(414, 29, 'first_name', 'Pavel'),
(415, 29, 'last_name', 'Drbálek'),
(416, 29, 'nickname', 'pavel.drbalek'),
(417, 29, 'description', ''),
(418, 29, 'rich_editing', 'true'),
(419, 29, 'comment_shortcuts', 'false'),
(420, 29, 'admin_color', 'fresh'),
(421, 29, 'use_ssl', '0'),
(422, 29, 'show_admin_bar_front', 'true'),
(423, 29, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(424, 29, 'wp_user_level', '10'),
(425, 29, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media'),
(426, 29, 'wp_dashboard_quick_press_last_post_id', '176'),
(427, 30, 'first_name', 'simon'),
(428, 30, 'last_name', 'mazanec'),
(429, 30, 'nickname', 'simon mazanec'),
(430, 30, 'description', ''),
(431, 30, 'rich_editing', 'true'),
(432, 30, 'comment_shortcuts', 'false'),
(433, 30, 'admin_color', 'fresh'),
(434, 30, 'use_ssl', '0'),
(435, 30, 'show_admin_bar_front', 'true'),
(436, 30, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(437, 30, 'wp_user_level', '0'),
(438, 30, 'bp_xprofile_visibility_levels', 'a:1:{i:1;s:6:"public";}'),
(440, 30, 'aim', ''),
(441, 30, 'yim', ''),
(442, 30, 'jabber', ''),
(443, 30, 'last_activity', '2013-07-07 11:22:36'),
(444, 30, 'dismissed_wp_pointers', 'wp330_toolbar'),
(445, 31, 'first_name', 'tomas'),
(446, 31, 'last_name', 'prichystal'),
(447, 31, 'nickname', 'tomas  prichystal'),
(448, 31, 'description', ''),
(449, 31, 'rich_editing', 'true'),
(450, 31, 'comment_shortcuts', 'false'),
(451, 31, 'admin_color', 'fresh'),
(452, 31, 'use_ssl', '0'),
(453, 31, 'show_admin_bar_front', 'true'),
(454, 31, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(455, 31, 'wp_user_level', '0'),
(456, 31, 'bp_xprofile_visibility_levels', 'a:1:{i:1;s:6:"public";}'),
(458, 31, 'aim', ''),
(459, 31, 'yim', ''),
(460, 31, 'jabber', ''),
(461, 31, 'last_activity', '2013-07-22 11:20:34'),
(462, 32, 'first_name', 'mart'),
(463, 32, 'last_name', 'dall'),
(464, 32, 'nickname', 'mart dall'),
(465, 32, 'description', ''),
(466, 32, 'rich_editing', 'true'),
(467, 32, 'comment_shortcuts', 'false'),
(468, 32, 'admin_color', 'fresh'),
(469, 32, 'use_ssl', '0'),
(470, 32, 'show_admin_bar_front', 'true'),
(471, 32, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(472, 32, 'wp_user_level', '0'),
(473, 32, 'bp_xprofile_visibility_levels', 'a:1:{i:1;s:6:"public";}'),
(474, 32, 'activation_key', 'f28b2ba32543dd0ebbb158ee13fcd49d'),
(475, 33, 'first_name', 'Michal'),
(476, 33, 'last_name', 'Jánošík'),
(477, 33, 'nickname', 'Michal Jánošík'),
(478, 33, 'description', ''),
(479, 33, 'rich_editing', 'true'),
(480, 33, 'comment_shortcuts', 'false'),
(481, 33, 'admin_color', 'fresh'),
(482, 33, 'use_ssl', '0'),
(483, 33, 'show_admin_bar_front', 'true'),
(484, 33, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(485, 33, 'wp_user_level', '0'),
(486, 33, 'bp_xprofile_visibility_levels', 'a:1:{i:1;s:6:"public";}'),
(488, 33, 'aim', ''),
(489, 33, 'yim', ''),
(490, 33, 'jabber', ''),
(491, 33, 'last_activity', '2013-09-08 20:19:53'),
(492, 33, 'dismissed_wp_pointers', 'wp330_toolbar'),
(493, 1, '_woocommerce_persistent_cart', 'a:1:{s:4:"cart";a:0:{}}'),
(494, 1, '_order_count', '0'),
(495, 32, '_order_count', '0'),
(496, 4, '_order_count', '0'),
(497, 29, '_order_count', '0'),
(498, 31, '_order_count', '0'),
(499, 30, '_order_count', '0'),
(500, 33, '_order_count', '0'),
(501, 4, 'billing_first_name', ''),
(502, 4, 'billing_last_name', ''),
(503, 4, 'billing_company', ''),
(504, 4, 'billing_address_1', ''),
(505, 4, 'billing_address_2', ''),
(506, 4, 'billing_city', ''),
(507, 4, 'billing_postcode', ''),
(508, 4, 'billing_state', ''),
(509, 4, 'billing_country', ''),
(510, 4, 'billing_phone', ''),
(511, 4, 'billing_email', ''),
(512, 4, 'shipping_first_name', ''),
(513, 4, 'shipping_last_name', ''),
(514, 4, 'shipping_company', ''),
(515, 4, 'shipping_address_1', ''),
(516, 4, 'shipping_address_2', ''),
(517, 4, 'shipping_city', ''),
(518, 4, 'shipping_postcode', ''),
(519, 4, 'shipping_state', ''),
(520, 4, 'shipping_country', ''),
(521, 34, 'first_name', 'asdf'),
(522, 34, 'last_name', 'asdf'),
(523, 34, 'nickname', 'asdfasdfawefe'),
(524, 34, 'description', ''),
(525, 34, 'rich_editing', 'true'),
(526, 34, 'comment_shortcuts', 'false'),
(527, 34, 'admin_color', 'fresh'),
(528, 34, 'use_ssl', '0'),
(529, 34, 'show_admin_bar_front', 'true'),
(530, 34, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(531, 34, 'wp_user_level', '0'),
(532, 34, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(533, 34, '_order_count', '0'),
(534, 34, 'bp_meta_14', 'none'),
(535, 34, 'bp_meta_270', 'none'),
(536, 34, 'bp_meta_516', '2;3;4'),
(537, 34, 'billing_first_name', ''),
(538, 34, 'billing_last_name', ''),
(539, 34, 'billing_company', ''),
(540, 34, 'billing_address_1', ''),
(541, 34, 'billing_address_2', ''),
(542, 34, 'billing_city', ''),
(543, 34, 'billing_postcode', ''),
(544, 34, 'billing_state', ''),
(545, 34, 'billing_country', ''),
(546, 34, 'billing_phone', ''),
(547, 34, 'billing_email', ''),
(548, 34, 'shipping_first_name', ''),
(549, 34, 'shipping_last_name', ''),
(550, 34, 'shipping_company', ''),
(551, 34, 'shipping_address_1', ''),
(552, 34, 'shipping_address_2', ''),
(553, 34, 'shipping_city', ''),
(554, 34, 'shipping_postcode', ''),
(555, 34, 'shipping_state', ''),
(556, 34, 'shipping_country', ''),
(557, 34, 'aim', ''),
(558, 34, 'yim', ''),
(559, 34, 'jabber', ''),
(560, 34, 'bp_meta_1', 'AFSWEEF'),
(561, 34, 'bp_meta_3', 'ADF'),
(562, 34, 'bp_meta_4', 'WEF'),
(563, 34, 'bp_meta_5', 'WEewwef'),
(564, 1, 'billing_first_name', ''),
(565, 1, 'billing_last_name', ''),
(566, 1, 'billing_company', ''),
(567, 1, 'billing_address_1', ''),
(568, 1, 'billing_address_2', ''),
(569, 1, 'billing_city', ''),
(570, 1, 'billing_postcode', ''),
(571, 1, 'billing_state', ''),
(572, 1, 'billing_country', ''),
(573, 1, 'billing_phone', ''),
(574, 1, 'billing_email', ''),
(575, 1, 'shipping_first_name', ''),
(576, 1, 'shipping_last_name', ''),
(577, 1, 'shipping_company', ''),
(578, 1, 'shipping_address_1', ''),
(579, 1, 'shipping_address_2', ''),
(580, 1, 'shipping_city', ''),
(581, 1, 'shipping_postcode', ''),
(582, 1, 'shipping_state', ''),
(583, 1, 'shipping_country', ''),
(584, 1, 'closedpostboxes_page', 'a:0:{}'),
(585, 1, 'metaboxhidden_page', 'a:3:{i:0;s:10:"postcustom";i:1;s:7:"slugdiv";i:2;s:9:"authordiv";}'),
(586, 1, 'closedpostboxes_product', 'a:1:{i:0;s:10:"postcustom";}'),
(587, 1, 'metaboxhidden_product', 'a:1:{i:0;s:7:"slugdiv";}');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Vypisuji data pro tabulku `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'administrator', '$P$BoqvOOZDY//8p4VJ0wgpIznfIP28mk1', 'administrator', 'me@webni.cz', '', '2013-02-19 11:38:05', '', 0, 'David Šuška'),
(4, 'mysak', '$P$BfUNPIHjVPdbPpgo3DUsJCR4K3IEBq/', 'mysak', 'info@webni.cz', '', '2013-05-02 11:14:08', '', 0, 'David Myšakof myšák'),
(29, 'pavel.drbalek', '$P$BmTo3T4wDut.MzqXzVaNnEQI1Ff58h1', 'pavel-drbalek', 'pavel.drbalek@gmail.com', '', '2013-06-30 11:10:59', '', 0, 'Pavel Drbálek'),
(30, 'wyrden', '$P$Bx1K2n4WOk0Al3WHnsZ21tfrg2JhTQ/', 'wyrden', 'simsa23@email.cz', '', '2013-07-07 11:10:46', '', 0, 'simon mazanec'),
(31, 'toritor', '$P$BoZTt9OkXp3p8jyjP0X.QI12UJzOXO/', 'toritor', 'tom.prichystal@gmail.com', '', '2013-07-22 11:18:30', '', 0, 'tomas  prichystal'),
(32, 'martdall', '$P$Bc8MFAqeja3wWpFd/lLzN2GVa5v/x.0', 'martdall', 'martdall@seznam.cz', '', '2013-07-23 21:19:01', '', 2, 'mart dall'),
(33, 'zbojnik', '$P$BIqId5cjxKAFE5RdRYH/sWD764zBvd/', 'zbojnik', 'janosik.misa@seznam.cz', '', '2013-09-08 20:07:09', '', 0, 'Michal Jánošík'),
(34, 'asdfasdfawefe', '$P$BJwBd5nwAqi3BysTUj4naAYK3wVEU/0', 'asdfasdfawefe', 'asdfawefawef@webni.cz', '', '2013-11-18 09:19:19', '', 0, 'asdf asdf');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) NOT NULL,
  `attribute_label` longtext,
  `attribute_type` varchar(200) NOT NULL,
  `attribute_orderby` varchar(200) NOT NULL,
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `download_id` varchar(32) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `order_key` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`order_id`,`order_key`,`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext NOT NULL,
  `order_item_type` varchar(200) NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_woocommerce_tax_rates`
--

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) NOT NULL DEFAULT '',
  `tax_rate` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`),
  KEY `tax_rate_class` (`tax_rate_class`),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `wp_woocommerce_tax_rates`
--

INSERT INTO `wp_woocommerce_tax_rates` (`tax_rate_id`, `tax_rate_country`, `tax_rate_state`, `tax_rate`, `tax_rate_name`, `tax_rate_priority`, `tax_rate_compound`, `tax_rate_shipping`, `tax_rate_order`, `tax_rate_class`) VALUES
(1, '', '', '21.0000', 'DPH', 1, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(255) NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `wp_woocommerce_termmeta`
--

CREATE TABLE `wp_woocommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `woocommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `woocommerce_term_id` (`woocommerce_term_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Vypisuji data pro tabulku `wp_woocommerce_termmeta`
--

INSERT INTO `wp_woocommerce_termmeta` (`meta_id`, `woocommerce_term_id`, `meta_key`, `meta_value`) VALUES
(1, 81, 'order', '0'),
(2, 81, 'display_type', 'products'),
(3, 81, 'thumbnail_id', '37'),
(4, 82, 'order', '0'),
(5, 82, 'display_type', 'subcategories'),
(6, 82, 'thumbnail_id', '0'),
(7, 83, 'order', '0'),
(8, 83, 'display_type', 'subcategories'),
(9, 83, 'thumbnail_id', '0'),
(10, 81, 'product_count_product_cat', '4'),
(11, 82, 'product_count_product_cat', '2'),
(12, 83, 'product_count_product_cat', '3'),
(13, 86, 'order', '0'),
(14, 86, 'display_type', ''),
(15, 86, 'thumbnail_id', '0'),
(16, 86, 'product_count_product_cat', '2'),
(17, 87, 'order', '0'),
(18, 87, 'display_type', ''),
(19, 87, 'thumbnail_id', '0'),
(20, 88, 'order', '0'),
(21, 88, 'display_type', ''),
(22, 88, 'thumbnail_id', '0'),
(23, 89, 'order', '0'),
(24, 89, 'display_type', ''),
(25, 89, 'thumbnail_id', '0'),
(26, 90, 'order', '0'),
(27, 90, 'display_type', ''),
(28, 90, 'thumbnail_id', '0'),
(29, 91, 'order', '0'),
(30, 91, 'display_type', ''),
(31, 91, 'thumbnail_id', '0'),
(32, 92, 'order', '0'),
(33, 92, 'display_type', ''),
(34, 92, 'thumbnail_id', '0'),
(35, 100, 'order', '0'),
(36, 100, 'display_type', ''),
(37, 100, 'thumbnail_id', '0'),
(38, 100, 'product_count_product_cat', '1'),
(39, 90, 'product_count_product_cat', '1'),
(40, 92, 'product_count_product_cat', '1'),
(41, 88, 'product_count_product_cat', '1'),
(42, 87, 'product_count_product_cat', '1'),
(43, 89, 'product_count_product_cat', '1'),
(44, 91, 'product_count_product_cat', '1'),
(45, 103, 'order', '0'),
(46, 103, 'display_type', 'subcategories'),
(47, 103, 'thumbnail_id', '0'),
(48, 104, 'order', '0'),
(49, 104, 'display_type', 'subcategories'),
(50, 104, 'thumbnail_id', '0'),
(51, 105, 'order', '0'),
(52, 105, 'display_type', 'subcategories'),
(53, 105, 'thumbnail_id', '0'),
(54, 103, 'product_count_product_cat', '1'),
(55, 104, 'product_count_product_cat', '1'),
(56, 105, 'product_count_product_cat', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
