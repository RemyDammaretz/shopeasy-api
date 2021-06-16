-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 16 juin 2021 à 15:09
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
(3, 3, 2);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
