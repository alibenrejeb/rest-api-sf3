-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 12 Décembre 2016 à 00:08
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `rest_api`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `auth_tokens`
--

INSERT INTO `auth_tokens` (`id`, `user_id`, `value`, `created_at`) VALUES
(11, 3, 'e2RPNUnSL+kdR0Bl5wpxOj5xQ+1aFPJ/FriJwrWO2nokY+hyuwVDQqud5ssmimZq/a0=', '2016-12-11 22:06:49'),
(12, 3, 'uwcA0wc+BCSgVEBZ3e5rS5TZharWPFoSznuVFib0GMD+IAGwEOhTc0GAJxYn8VZ/Jzw=', '2016-12-11 23:13:24'),
(13, 3, 'oXYxPXVD/8TaJWviGBgjVlwa15m84eYcs+vDP2Ft0dFqwG5aHH8lP3kj/XWTIiKHpPk=', '2016-12-11 23:59:40');

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `places`
--

INSERT INTO `places` (`id`, `name`, `address`) VALUES
(1, 'Tour Eiffel', '5 Avenue Anatole France, 75007 Paris'),
(2, 'Mont-Saint-Michel', '50170 Le Mont-Saint-Michel'),
(3, 'Château de Versailles', 'Place d''Armes, 78000 Versailles'),
(5, 'Disneyland Paris', 'Autre adresse Le Disneyland Paris'),
(7, 'Musée du Louvre', '799, rue de Rivoli, 75001 Paris');

-- --------------------------------------------------------

--
-- Structure de la table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `preferences`
--

INSERT INTO `preferences` (`id`, `user_id`, `name`, `value`) VALUES
(1, 1, 'history', 4),
(2, 1, 'art', 4),
(6, 1, 'sport', 3);

-- --------------------------------------------------------

--
-- Structure de la table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `place_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `prices`
--

INSERT INTO `prices` (`id`, `place_id`, `type`, `value`) VALUES
(1, 1, 'less_than_12', 5.75),
(2, 1, 'for_all', 10),
(3, 7, 'less_than_12', 6),
(4, 7, 'for_all', 15);

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `place_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `themes`
--

INSERT INTO `themes` (`id`, `place_id`, `name`, `value`) VALUES
(1, 1, 'architecture', 7),
(2, 1, 'history', 6),
(3, 2, 'history', 3),
(4, 2, 'art', 7);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'My', 'Bis', 'my.last@test.local', '$2y$12$DHDsfwBAH9a4bx42Cyt8D.u.1xECdlzckQcCVGHY5VxoLjqZIO1g2'),
(2, 'Ef', 'Ghi', 'ef.ghi@test.local', ''),
(3, 'test', 'Pass', 'test@pass.fr', '$2y$12$DHDsfwBAH9a4bx42Cyt8D.u.1xECdlzckQcCVGHY5VxoLjqZIO1g2'),
(4, 'ali', 'ben rejeb', 'ali.benrejeb@sfofrecom.com', '$2y$12$4mA7.KUbyIEE97AbMykXOeB0gdxMG7hJTfxeC1zbxge.jVnfDFYPK');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_tokens_value_unique` (`value`),
  ADD KEY `IDX_8AF9B66CA76ED395` (`user_id`);

--
-- Index pour la table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `places_name_unique` (`name`);

--
-- Index pour la table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `preferences_name_user_unique` (`name`,`user_id`),
  ADD KEY `IDX_E931A6F5A76ED395` (`user_id`);

--
-- Index pour la table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prices_type_place_unique` (`type`,`place_id`),
  ADD KEY `IDX_E4CB6D59DA6A219` (`place_id`);

--
-- Index pour la table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `themes_name_place_unique` (`name`,`place_id`),
  ADD KEY `IDX_154232DEDA6A219` (`place_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `FK_8AF9B66CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `FK_E931A6F5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `FK_E4CB6D59DA6A219` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`);

--
-- Contraintes pour la table `themes`
--
ALTER TABLE `themes`
  ADD CONSTRAINT `FK_154232DEDA6A219` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
