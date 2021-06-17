-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 17 juin 2021 à 10:09
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shopeasy`
--

-- --------------------------------------------------------

--
-- Structure de la table `product-categories`
--

DROP TABLE IF EXISTS `product-categories`;
CREATE TABLE IF NOT EXISTS `product-categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `urlImg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product-categories`
--

INSERT INTO `product-categories` (`id`, `name`, `urlImg`) VALUES
(1, 'animaux', 'images_categories/animaux.jpg'),
(2, 'bébé', 'images_categories/bebe.jpg'),
(3, 'bio', 'images_categories/bio.jpg'),
(4, 'boissons', 'images_categories/boissons.jpg'),
(5, 'entretient et nettoyage', 'images_categories/entretient_nettoyage.jpg'),
(6, 'épicerie salée', 'images_categories/epicerie_salee.jpg'),
(7, 'épicerie sucrée', 'images_categories/epicerie_sucree.jpg'),
(8, 'fruits et légumes', 'images_categories/fruits_et_legumes.jpg'),
(9, 'hygiène et beauté', 'images_categories/hygiene_beaute.jpg'),
(10, 'loisirs et high-tech', 'images_categories/loisirs_high_tech.jpg'),
(11, 'maison et jardin', 'images_categories/maison_jardin.jpg'),
(12, 'parapharmacie', 'images_categories/parapharmacie.jpg'),
(13, 'produits laitiers', 'images_categories/produits_laitiers.jpg'),
(14, 'surgelés', 'images_categories/surgeles.jpg'),
(15, 'traiteur', 'images_categories/traiteur.jpg'),
(16, 'viandes et poissons', 'images_categories/viandes_poissons.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `productCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `productCategoryId`) VALUES
(1, 'croquettes 200g chiens', 1),
(2, 'croquettes 1 kg chiens', 1),
(3, 'croquettes 3 kg chiens', 1),
(4, 'croquettes 200g chats', 1),
(5, 'croquettes 1 kg chats', 1),
(6, 'croquettes 3 kg chats', 1),
(7, 'jouet pour chien', 1),
(8, 'os en plastique', 1),
(9, 'pâtée pour chien', 1),
(10, 'pâtée pour chat', 1),
(11, 'lait en poudre', 2),
(12, 'compotes pour bébés', 2),
(13, 'poussette', 2),
(14, 'chaise pour bébé', 2),
(15, 'sucette', 2),
(16, 'pot de chambre bleu', 2),
(17, 'pot de chambre rose', 2),
(18, 'hochet', 2),
(19, 'grand hochet', 2),
(20, 'legumes bledina', 2),
(21, 'carottes bios', 3),
(22, 'amandes bios', 3),
(23, 'lait bios', 3),
(24, 'cookies bio sans glutent', 3),
(25, 'céréales bios', 3),
(26, 'oignons bios', 3),
(27, 'pdt bios', 3),
(28, 'huile d olive bio', 3),
(29, 'farine bio', 3),
(30, 'jus de pommes bio', 3),
(31, 'eau minérale', 4),
(32, 'eau gazeuse perrier', 4),
(33, 'eau gazeuse badoit', 4),
(34, 'bière blonde', 4),
(35, 'bière blanche', 4),
(36, 'vin blanc', 4),
(37, 'coca cola zéro', 4),
(38, 'coca cola', 4),
(38, 'ice tea', 4),
(40, 'vin rouge', 4),
(41, 'javel 1L', 5),
(42, 'produit vaiselle', 5),
(43, 'serpière', 5),
(44, 'balai', 5),
(45, 'sac poubelle', 5),
(46, 'liquie nettoyant vitres', 5),
(47, 'sacs d aspirateur', 5),
(48, 'éponge', 5),
(49, 'chiffons', 5),
(50, 'bicarbonate de soude', 5),
(51, 'pâtes spaghetti', 6),
(52, 'farfale', 6),
(53, 'riz', 6),
(54, 'chips', 6),
(55, 'chips saveur petits oignons', 6),
(56, 'sauce tomate', 6),
(57, 'cornichons', 6),
(58, 'olives', 6),
(59, 'biscuits salés', 6),
(60, 'pesto', 6),
(61, 'bonbons coca', 7),
(62, 'réglisse', 7),
(63, 'compote de pomme', 7),
(64, 'bn vanille', 7),
(65, 'tresor de kellogs', 7),
(66, 'carotte', 8),
(67, 'tomate', 8),
(68, 'oignons', 8),
(69, 'avocats', 8),
(70, 'pommes', 8),
(71, 'poires', 8),
(72, 'bananes', 8),
(73, 'fraises', 8),
(74, 'rasoir', 9),
(75, 'mousse à raser', 9),
(76, 'cire épilatoire', 9),
(77, 'savon', 9),
(78, 'shampoing cheveux secs', 9),
(79, 'shampoing cheveux gras', 9),
(80, 'pince à épiler', 9),
(81, 'brosse à dents', 9),
(82, 'livre policier', 10),
(83, 'dictionnaire', 10),
(84, 'smartphone samsung', 10),
(85, 'tablette tactile', 10),
(86, 'BD', 10),
(87, 'couteau', 11),
(88, 'fourchette', 11),
(89, 'assiettes', 11),
(90, 'set de table', 11),
(91, 'carafe', 11),
(92, 'tondeuse electrique', 11),
(93, 'angrais', 11),
(94, 'desherbant', 11),
(95, 'doliprane', 12),
(96, 'crème arnica', 12),
(97, 'baume du tigre', 12),
(98, 'lait entier', 13),
(99, 'lait demi-écrémé', 13),
(100, 'lait écrémé', 13),
(101, 'yaourt nature', 13),
(102, 'yaourt fruits', 13),
(103, 'fromage blanc', 13),
(104, 'danette vanille', 13),
(105, 'beurre', 13),
(106, 'brocolis', 14),
(107, 'glaces vanille', 14),
(108, 'pommes duchesses', 14),
(109, 'pizza', 14),
(110, 'petits pois', 14),
(111, 'filet mignons aux carottes', 15),
(112, 'gratin dauphinois', 15),
(113, 'sushis', 15),
(114, 'viande hachée', 16),
(115, 'blanc de poulet', 16),
(116, 'filet mignon', 16),
(117, 'entrecôte', 16);

-- --------------------------------------------------------

--
-- Structure de la table `products-in-sections`
--

DROP TABLE IF EXISTS `products-in-sections`;
CREATE TABLE IF NOT EXISTS `products-in-sections` (
  `id` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idSection` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products-in-sections`
--

INSERT INTO `products-in-sections` (`id`, `idProduct`, `idSection`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 2),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 2),
(16, 16, 2),
(17, 17, 2),
(18, 18, 2),
(20, 20, 2),
(21, 21, 2),
(22, 22, 3),
(23, 23, 3),
(24, 24, 3),
(25, 25, 3),
(26, 26, 3),
(27, 27, 3),
(28, 28, 3),
(29, 29, 3),
(30, 30, 3),
(31, 31, 4),
(32, 32, 4),
(33, 33, 4),
(34, 34, 4),
(35, 35, 4),
(36, 36, 4),
(37, 37, 4),
(38, 38, 4),
(39, 39, 4),
(40, 40, 4),
(41, 41, 5),
(42, 42, 5),
(43, 43, 5),
(44, 44, 5),
(45, 45, 5),
(46, 46, 5),
(47, 47, 5),
(48, 48, 5),
(49, 49, 5),
(50, 50, 5),
(51, 51, 6),
(52, 52, 6),
(53, 53, 6),
(54, 54, 6),
(55, 55, 6),
(56, 56, 6),
(57, 57, 6),
(58, 58, 6),
(59, 59, 6),
(60, 60, 6),
(61, 61, 7),
(62, 62, 7),
(63, 63, 7),
(64, 64, 7),
(65, 65, 7),
(66, 66, 8),
(67, 67, 8),
(68, 68, 8),
(69, 69, 8),
(70, 70, 8),
(71, 71, 8),
(72, 72, 8),
(73, 73, 8),
(74, 74, 9),
(75, 75, 9),
(76, 76, 9),
(77, 77, 9),
(78, 78, 9),
(79, 79, 9),
(80, 80, 9),
(81, 81, 9),
(82, 82, 10),
(83, 83, 10),
(84, 84, 10),
(85, 85, 10),
(86, 86, 10),
(87, 87, 11),
(88, 88, 11),
(89, 89, 11),
(90, 90, 11),
(91, 91, 11),
(92, 92, 11),
(93, 93, 11),
(94, 94, 11),
(95, 95, 12),
(96, 96, 12),
(97, 97, 12),
(98, 98, 13),
(99, 99, 13),
(100, 100, 13),
(101, 101, 13),
(102, 102, 13),
(103, 103, 13),
(104, 104, 13),
(105, 105, 13),
(106, 106, 14),
(107, 107, 14),
(108, 108, 14),
(109, 109, 14),
(110, 110, 15),
(111, 111, 15),
(112, 112, 15),
(113, 113, 16),
(114, 114, 16),
(115, 115, 16),
(116, 116, 16),
(117, 117, 16);

-- --------------------------------------------------------

--
-- Structure de la table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(11) NOT NULL,
  `idShop` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sections`
--

INSERT INTO `sections` (`id`, `idShop`, `name`, `x`, `y`) VALUES
(1, 1, 'Animaux', 57, 100),
(2, 1, 'Bébés', 109, 100),
(3, 1, 'Bio', 139, 100),
(4, 1, 'Boissons', 191, 100),
(5, 1, 'entretien et nettoyage', 227, 100),
(6, 1, 'épicerie salée', 279, 100),
(7, 1, 'épicerie sucrée', 309, 100),
(8, 1, 'fruits et légumes', 361, 100),
(9, 1, 'hygiène et beauté', 397, 100),
(10, 1, 'loisirs et high-tech', 449, 100),
(11, 1, 'maison et jardin', 479, 100),
(12, 1, 'parapharmacie', 531, 100),
(13, 1, 'produits laitiers', 567, 100),
(14, 1, 'surgelés', 619, 100),
(15, 1, 'traiteur', 649, 100),
(16, 1, 'viandes et poissons', 701, 100);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
