-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.11-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para fxserver
CREATE DATABASE IF NOT EXISTS `fxserver` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fxserver`;

-- Copiando estrutura para tabela fxserver.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela fxserver.phone_app_chat: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela fxserver.phone_calls: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela fxserver.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela fxserver.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela fxserver.twitter_accounts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela fxserver.twitter_likes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela fxserver.twitter_tweets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_business
CREATE TABLE IF NOT EXISTS `vrp_business` (
  `user_id` int(11) NOT NULL,
  `capital` int(11) DEFAULT NULL,
  `laundered` int(11) DEFAULT NULL,
  `reset_timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_business_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_business: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_business` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_estoque
CREATE TABLE IF NOT EXISTS `vrp_estoque` (
  `vehicle` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_estoque: ~333 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_estoque` DISABLE KEYS */;
INSERT INTO `vrp_estoque` (`vehicle`, `quantidade`, `user_id`) VALUES
	('blista', 0, 0),
	('brioso', 0, 0),
	('emperor', 0, 0),
	('emperor2', 0, 0),
	('dilettante', 0, 0),
	('issi2', 0, 0),
	('panto', 0, 0),
	('prairie', 0, 0),
	('rhapsody', 0, 0),
	('cogcabrio', 0, 0),
	('exemplar', 0, 0),
	('f620', 0, 0),
	('felon', 0, 0),
	('ingot', 0, 0),
	('jackal', 0, 0),
	('oracle', 0, 0),
	('oracle2', 0, 0),
	('sentinel', 0, 0),
	('sentinel2', 0, 0),
	('windsor', 0, 0),
	('windsor2', 0, 0),
	('zion', 0, 0),
	('zion2', 0, 0),
	('blade', 0, 0),
	('buccaneer', 0, 0),
	('buccaneer2', 0, 0),
	('primo', 0, 0),
	('chino', 0, 0),
	('coquette3', 0, 0),
	('dukes', 0, 0),
	('faction', 0, 0),
	('faction3', 0, 0),
	('gauntlet', 0, 0),
	('gauntlet2', 0, 0),
	('hermes', 0, 0),
	('hotknife', 0, 0),
	('moonbeam', 0, 0),
	('moonbeam2', 0, 0),
	('nightshade', 0, 0),
	('picador', 0, 0),
	('ruiner', 0, 0),
	('sabregt', 0, 0),
	('sabregt2', 0, 0),
	('slamvan', 0, 0),
	('slamvan3', 0, 0),
	('stalion', 0, 0),
	('stalion2', 0, 0),
	('tampa', 0, 0),
	('vigero', 0, 0),
	('virgo2', 0, 0),
	('virgo', 0, 0),
	('virgo3', 0, 0),
	('voodoo', 0, 0),
	('voodoo2', 0, 0),
	('yosemite', 0, 0),
	('bfinjection', 0, 0),
	('bifta', 0, 0),
	('bodhi2', 0, 0),
	('brawler', 0, 0),
	('trophytruck', 0, 0),
	('trophytruck2', 0, 0),
	('dubsta3', 0, 0),
	('mesa3', 0, 0),
	('rancherxl', 0, 0),
	('rebel2', 0, 0),
	('riata', 0, 0),
	('dloader', 0, 0),
	('sandking', 0, 0),
	('sandking2', 0, 0),
	('baller', 0, 0),
	('baller2', 0, 0),
	('baller3', 0, 0),
	('baller4', 0, 0),
	('baller5', 0, 0),
	('baller6', 0, 0),
	('bjxl', 0, 0),
	('cavalcade', 0, 0),
	('cavalcade2', 0, 0),
	('contender', 0, 0),
	('dubsta', 0, 0),
	('dubsta2', 0, 0),
	('fq2', 0, 0),
	('granger', 0, 0),
	('gresley', 0, 0),
	('habanero', 0, 0),
	('seminole', 0, 0),
	('serrano', 0, 0),
	('xls', 0, 0),
	('xls2', 0, 0),
	('asea', 0, 0),
	('asterope', 0, 0),
	('cog552', 0, 0),
	('cognoscenti', 0, 0),
	('cognoscenti2', 0, 0),
	('stanier', 0, 0),
	('stratum', 0, 0),
	('surge', 0, 0),
	('tailgater', 0, 0),
	('warrener', 0, 0),
	('washington', 0, 0),
	('alpha', 0, 0),
	('banshee', 0, 0),
	('bestiagts', 0, 0),
	('blista2', 0, 0),
	('blista3', 0, 0),
	('buffalo2', 0, 0),
	('buffalo', 0, 0),
	('buffalo3', 0, 0),
	('carbonizzare', 0, 0),
	('comet2', 0, 0),
	('comet3', 0, 0),
	('comet5', 0, 0),
	('coquette', 0, 0),
	('elegy', 0, 0),
	('elegy2', 0, 0),
	('feltzer2', 0, 0),
	('furoregt', 0, 0),
	('fusilade', 0, 0),
	('futo', 0, 0),
	('jester', 0, 0),
	('khamelion', 0, 0),
	('kuruma', 0, 0),
	('massacro2', 0, 0),
	('massacro', 0, 0),
	('ninef', 0, 0),
	('ninef2', 0, 0),
	('omnis', 0, 0),
	('pariah', 0, 0),
	('penumbra', 0, 0),
	('raiden', 0, 0),
	('rapidgt', 0, 0),
	('rapidgt2', 0, 0),
	('ruston', 0, 0),
	('schafter4', 0, 0),
	('schafter3', 0, 0),
	('schafter5', 0, 0),
	('schwarzer', 0, 0),
	('sentinel3', 0, 0),
	('seven70', 0, 0),
	('specter', 0, 0),
	('specter2', 0, 0),
	('streiter', 0, 0),
	('sultan', 0, 0),
	('surano', 0, 0),
	('tampa2', 0, 0),
	('tropos', 0, 0),
	('verlierer2', 0, 0),
	('btype2', 0, 0),
	('btype3', 0, 0),
	('casco', 0, 0),
	('cheetah', 0, 0),
	('coquette2', 0, 0),
	('feltzer3', 0, 0),
	('gt500', 0, 0),
	('infernus2', 0, 0),
	('jb700', 0, 0),
	('mamba', 0, 0),
	('manana', 0, 0),
	('monroe', 0, 0),
	('peyote', 0, 0),
	('pigalle', 0, 0),
	('rapidgt3', 0, 0),
	('retinue', 0, 0),
	('stinger', 0, 0),
	('stingergt', 0, 0),
	('torero', 0, 0),
	('tornado', 0, 0),
	('tornado2', 0, 0),
	('tornado6', 0, 0),
	('turismo2', 0, 0),
	('ztype', 0, 0),
	('adder', 0, 0),
	('autarch', 0, 0),
	('banshee2', 0, 0),
	('bullet', 0, 0),
	('cheetah2', 0, 0),
	('entityxf', 0, 0),
	('fmj', 0, 0),
	('gp1', 0, 0),
	('infernus', 0, 0),
	('nero', 0, 0),
	('nero2', 0, 0),
	('osiris', 0, 0),
	('penetrator', 0, 0),
	('pfister811', 0, 0),
	('reaper', 0, 0),
	('sc1', 0, 0),
	('sultanrs', 0, 0),
	('t20', 0, 0),
	('tempesta', 0, 0),
	('turismor', 0, 0),
	('tyrus', 0, 0),
	('vacca', 0, 0),
	('visione', 0, 0),
	('voltic', 0, 0),
	('zentorno', 0, 0),
	('sadler', 0, 0),
	('bison', 0, 0),
	('bison2', 0, 0),
	('bobcatxl', 0, 0),
	('burrito2', 0, 0),
	('burrito', 0, 0),
	('burrito3', 0, 0),
	('burrito4', 0, 0),
	('mule4', 0, 0),
	('rallytruck', 0, 0),
	('minivan2', 0, 0),
	('minivan', 0, 0),
	('paradise', 0, 0),
	('pony', 0, 0),
	('pony2', 0, 0),
	('rumpo', 0, 0),
	('rumpo2', 0, 0),
	('rumpo3', 0, 0),
	('surfer', 0, 0),
	('youga', 0, 0),
	('huntley', 0, 0),
	('landstalker', 0, 0),
	('mesa', 0, 0),
	('patriot', 0, 0),
	('radi', 0, 0),
	('rocoto', 0, 0),
	('tyrant', 0, 0),
	('entity2', 0, 0),
	('cheburek', 0, 0),
	('hotring', 0, 0),
	('jester3', 0, 0),
	('flashgt', 0, 0),
	('ellie', 0, 0),
	('michelli', 0, 0),
	('fagaloa', 0, 0),
	('dominator', 0, 0),
	('dominator2', 0, 0),
	('dominator3', 0, 0),
	('issi3', 0, 0),
	('taipan', 0, 0),
	('gb200', 0, 0),
	('stretch', 0, 0),
	('guardian', 0, 0),
	('kamacho', 0, 0),
	('neon', 0, 0),
	('cyclone', 0, 0),
	('italigtb', 0, 0),
	('italigtb2', 0, 0),
	('vagner', 0, 0),
	('xa21', 0, 0),
	('tezeract', 0, 0),
	('prototipo', 0, 0),
	('patriot2', 0, 0),
	('swinger', 0, 0),
	('clique', 0, 0),
	('deveste', 0, 0),
	('deviant', 0, 0),
	('impaler', 0, 0),
	('italigto', 0, 0),
	('schlagen', 0, 0),
	('toros', 0, 0),
	('tulip', 0, 0),
	('vamos', 0, 0),
	('freecrawler', 0, 0),
	('fugitive', 0, 0),
	('glendale', 0, 0),
	('intruder', 0, 0),
	('le7b', 0, 0),
	('lurcher', 0, 0),
	('lynx', 0, 0),
	('phoenix', 0, 0),
	('premier', 0, 0),
	('raptor', 0, 0),
	('sheava', 0, 0),
	('z190', 0, 0),
	('akuma', 0, 0),
	('avarus', 0, 0),
	('bagger', 0, 0),
	('bati', 0, 0),
	('bati2', 0, 0),
	('bf400', 0, 0),
	('carbonrs', 0, 0),
	('chimera', 0, 0),
	('cliffhanger', 0, 0),
	('daemon2', 0, 0),
	('defiler', 0, 0),
	('diablous', 0, 0),
	('diablous2', 0, 0),
	('double', 0, 0),
	('enduro', 0, 0),
	('esskey', 0, 0),
	('faggio', 0, 0),
	('faggio2', 0, 0),
	('faggio3', 0, 0),
	('fcr', 0, 0),
	('fcr2', 0, 0),
	('gargoyle', 0, 0),
	('hakuchou', 0, 0),
	('hakuchou2', 0, 0),
	('hexer', 0, 0),
	('innovation', 0, 0),
	('lectro', 0, 0),
	('manchez', 0, 0),
	('nemesis', 0, 0),
	('nightblade', 0, 0),
	('pcj', 0, 0),
	('ruffian', 0, 0),
	('sanchez', 0, 0),
	('sanchez2', 0, 0),
	('sovereign', 0, 0),
	('thrust', 0, 0),
	('vader', 0, 0),
	('vindicator', 0, 0),
	('vortex', 0, 0),
	('wolfsbane', 0, 0),
	('zombiea', 0, 0),
	('zombieb', 0, 0),
	('shotaro', 0, 0),
	('ratbike', 0, 0),
	('blazer', 0, 0),
	('blazer4', 0, 0),
	('dodgechargersrt', 0, 0),
	('audirs6', 0, 0),
	('bmwm3f80', 0, 0),
	('fordmustang', 0, 0),
	('lancerevolution9', 0, 0),
	('lancerevolutionx', 0, 0),
	('focusrs', 0, 0),
	('mercedesa45', 0, 0),
	('audirs7', 0, 0),
	('hondafk8', 0, 0),
	('mustangmach1', 0, 0),
	('porsche930', 0, 0),
	('teslaprior', 0, 0),
	('type263', 0, 0),
	('beetle74', 0, 0),
	('fe86', 0, 0);
/*!40000 ALTER TABLE `vrp_estoque` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_homes_permissions
CREATE TABLE IF NOT EXISTS `vrp_homes_permissions` (
  `owner` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `garage` int(11) NOT NULL,
  `home` varchar(100) NOT NULL DEFAULT '',
  `tax` varchar(24) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_homes_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_homes_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_homes_permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_srv_data
CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_srv_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_srv_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_srv_data` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_users
CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_login` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `whitelisted` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_users` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_user_data
CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dkey`),
  CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_user_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_data` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_user_homes
CREATE TABLE IF NOT EXISTS `vrp_user_homes` (
  `user_id` int(11) NOT NULL,
  `home` varchar(255) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`home`),
  CONSTRAINT `fk_user_homes_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_user_homes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_homes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_homes` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_user_identities
CREATE TABLE IF NOT EXISTS `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `registration` (`registration`),
  KEY `phone` (`phone`),
  CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_user_identities: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_identities` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_user_ids
CREATE TABLE IF NOT EXISTS `vrp_user_ids` (
  `identifier` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `fk_user_ids_users` (`user_id`),
  CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_user_ids: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_ids` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_user_moneys
CREATE TABLE IF NOT EXISTS `vrp_user_moneys` (
  `user_id` int(11) NOT NULL,
  `wallet` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando estrutura para tabela fxserver.vrp_user_moneys
CREATE TABLE IF NOT EXISTS `vrp_kda` (
  `user_id` int(11) NOT NULL,
  `kills` int(11) DEFAULT NULL,
  `deaths` int(11) DEFAULT NULL,
  `coins` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_kills_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_user_moneys: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_moneys` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_moneys` ENABLE KEYS */;

-- Copiando estrutura para tabela fxserver.vrp_user_vehicles
CREATE TABLE IF NOT EXISTS `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `detido` int(1) NOT NULL DEFAULT 0,
  `time` varchar(24) NOT NULL DEFAULT '0',
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `ipva` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`vehicle`),
  CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fxserver.vrp_user_vehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_vehicles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
