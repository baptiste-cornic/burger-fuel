-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 oct. 2021 à 13:14
-- Version du serveur :  10.4.19-MariaDB-cll-lve
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `u225078163_burgerfuel`
--

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `total` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `total`) VALUES
(4, 13, '2021-01-14 12:40:34', '473.00'),
(5, 13, '2021-01-14 12:41:11', '315.00'),
(6, 13, '2021-01-14 12:49:30', '62.00'),
(7, 13, '2021-01-14 12:50:36', '62.00'),
(8, 13, '2021-01-14 12:51:04', '62.00'),
(9, 13, '2021-01-14 12:57:04', '570.00'),
(10, 13, '2021-01-14 12:57:48', '84.00'),
(11, 13, '2021-01-14 12:58:34', '108.00'),
(12, 13, '2021-01-14 12:58:36', '608.00'),
(13, 13, '2021-01-14 12:59:46', '108.00'),
(14, 13, '2021-01-14 14:00:31', '570.00'),
(15, 13, '2021-01-14 14:04:37', '570.00'),
(16, 13, '2021-01-14 14:04:57', '570.00'),
(17, 13, '2021-01-14 14:06:38', '38.00'),
(18, 13, '2021-01-14 14:08:20', '105.00'),
(19, 13, '2021-01-14 18:48:02', '95.00'),
(20, 13, '2021-01-14 18:49:20', '96.00'),
(21, 13, '2021-01-14 18:50:42', '19.00'),
(22, 13, '2021-01-14 18:53:15', '285.00'),
(23, 13, '2021-01-14 19:11:09', '19.00'),
(24, 13, '2021-01-14 19:53:21', '60.00'),
(25, 13, '2021-01-14 21:33:18', '38.00'),
(26, 13, '2021-01-14 21:44:17', '38.00'),
(27, 13, '2021-01-14 21:49:16', '38.00'),
(28, 13, '2021-01-18 12:09:25', '19.00'),
(29, 13, '2021-01-18 12:16:23', '42.00'),
(30, 13, '2021-01-21 13:30:03', '230.00'),
(31, 13, '2021-01-21 13:31:23', '332.00'),
(32, 13, '2021-01-21 13:31:27', '19.00'),
(33, 13, '2021-01-21 13:34:18', '19.00'),
(34, 13, '2021-01-21 14:41:31', '38.00'),
(35, 13, '2021-01-25 10:15:31', '48.00'),
(36, 13, '2021-01-25 12:26:34', '19.00'),
(37, 13, '2021-01-25 12:28:59', '63.00'),
(38, 13, '2021-01-28 14:34:15', '19.00'),
(39, 13, '2021-02-01 13:56:10', '42.00'),
(40, 13, '2021-03-17 14:54:50', '240.00'),
(41, 18, '2021-05-03 01:17:34', '19.00'),
(42, 18, '2021-05-03 01:18:10', '15984.00'),
(43, 13, '2021-05-06 17:47:15', '105.00'),
(44, 13, '2021-06-09 11:48:33', '95.00');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Bacon backfire', 'A lot of people get stuck on this burger, as in, it\'s packed full of so much om and nom, it\'s like the Cookie Monster after his first cookie... heck, his name just used to be \"Monster\". Many people have this burger and just feel no need to experiment or eat any other burger ever again, it\'s that good. So try some other guys first, give them a chance. This is the perfect combination of char-grilled chicken breast, bacon and the clincher... brie cheese. Brie is this stupidly addictive soft, creamy French style of cheese that melts in your burger, coating the inner sanctum with some sort of silky angel sauce. The same as camembert, you say? Camembert originates from Normandy, \"Brie\" cheese, however, originates from Champagne. Case closed, this is not a ninjas vs. pirates type situation, no further discussion is required, thank you very much. ', '19.00', 'bacon-backfire.png'),
(3, 'Thunderbird', 'If you’re a spice lover, you’ll drool over our Thunderbird burger. Prepare to attend the ultimate mouth party, featuring some real good times and a stellar guest list, including our free range chicken breast grilled to perfection, hot sliced jalapenos, our addictive free range BurgerFuel Chipotle Aioli and all the usual suspects like fresh hand cut salad, batch-brewed sweet tomato relish and our artisan wholemeal buns. When you bite down on a Thunderbird, you can rest be assured that there’ll be a spice in your life that is more than a loose concept of variety. It’s a tongue tingling, eye-watering, sweat inducing hot-fest for lovers of heat.', '21.00', 'thunderbird.png'),
(4, 'The bastard', 'Like a fine single malt whiskey, every now and then we have to put a “The” in front of it- and it takes certain qualities to take a guy like this down because if you’re not ready, it’s like a punch in the face with a fistful of flavour.\r\n\r\nThis is not a burger to take Holly-go-lightly and it’s certainly not for your faint-hearted, breakfast epiphanies (as inspirational as they may be). This is the real deal burger of the completely audacious variety and if you feel a little nervous; you’re not alone. The BurgerFuel Bastard contains 100% pure grass fed NZ beef goodness, ‘smashed juicy’ fresh to order, with juicy-juicy mango slivers, tasty bacon, raw grated beetroot with chia seeds, natural, melted cheddar, fresh free range BurgerFuel Aioli, smashed avocado, batch-made sweet tomato relish and handmade salad. ', '24.00', 'bastard.png'),
(5, 'Bio fuel', 'There\'s nothing more Kiwi than a burger with beetroot and egg in it, except for maybe a Kiwi owned burger company making a Kiwi style burger or a burger made out of Kiwis, perhaps.\r\nAnyways, what is this crazy root of beet, you ask? Well, it\'s deep red deliciousness from the family beta vulgaris and contains betanin red which altogether makes it sound like some b grade ninja vegetable from the ghetto with tourettes on a furious trail of vengeance. Turns out though, it\'s a pretty damn delicious and healthy root, full of nutrients which help your cardiovascular system. Try it, this is the quintessentially sensual Kiwi style burger, that doesn\'t actually contain any Kiwifruit or Kiwis in it, like a hamburger which doesn’t have any ham in it. Ok, just it eat it already.', '19.00', 'bio-fuel.png'),
(6, 'combustion tofu', 'The Combustion Tofu was inspired by the long hot summers we spent on the coast in our treasured 1974 VW Kombi. This was pre-BurgerFuel so life was easy, dreams were free and our pants were made of brown corduroy and smelled a little bit like weird incense. We met some travelling vegetarians and in between free love, yoga and braiding each other’s hair, they showed us the vege way of life. The Combustion Tofu doesn’t smell weird though – it’s a beautiful creation, served on a smaller bun packed with velvety organic tofu (made from soybeans grown to the sound of pre-recorded motivational quotes), teriyaki sauce, smashed avocado and a peanut sauce that will knock your socks off (because we know that our vege loving friends aren’t all hippies these days and you\'re probabably wearing shoes). What are we even trying to say? We’re not quite sure, but we reckon this protein packed vegetarian delight will impress even the most passionate carnivores.', '20.00', 'combustion tofu.png');

-- --------------------------------------------------------

--
-- Structure de la table `product_order`
--

CREATE TABLE `product_order` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product_order`
--

INSERT INTO `product_order` (`order_id`, `product_id`, `quantity`) VALUES
(4, 3, 15),
(4, 4, 5),
(4, 5, 2),
(5, 3, 15),
(8, 1, 2),
(8, 4, 1),
(9, 1, 30),
(10, 3, 4),
(11, 3, 4),
(11, 4, 1),
(12, 1, 30),
(12, 5, 2),
(13, 3, 4),
(13, 4, 1),
(14, 1, 30),
(15, 1, 30),
(16, 1, 30),
(17, 1, 2),
(18, 3, 5),
(19, 1, 5),
(20, 4, 4),
(21, 1, 1),
(22, 1, 15),
(23, 1, 1),
(24, 6, 3),
(25, 1, 2),
(26, 1, 2),
(27, 1, 2),
(28, 1, 1),
(29, 3, 2),
(30, 6, 2),
(30, 1, 10),
(31, 3, 2),
(31, 1, 10),
(31, 6, 5),
(32, 1, 1),
(33, 1, 1),
(34, 1, 2),
(35, 4, 2),
(36, 1, 1),
(37, 3, 3),
(38, 5, 1),
(39, 3, 2),
(40, 4, 10),
(41, 1, 1),
(42, 4, 666),
(43, 3, 5),
(44, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `post_code` varchar(5) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `date_of_birth`, `address`, `city`, `post_code`, `country`, `phone`, `email`, `password`) VALUES
(6, 'tom', 'tom', '2007-05-01', 'ici', 'la', '44444', 'france', '55445544', 'tom', '$2y$11$337e0adf59a9549c4189bOCOhxvHdFm2n47.Ndd83BZ169MOJxb6K'),
(7, 'zzz', 'zzzzz', '2021-02-11', 'retret', 'tertre', '12345', 'jtjt', 'jtyjt', 'dany.siriphol@gmail.com', '$2y$11$fca552d53fef760c8fc0cuwK7IQ3KXDhay8YkfyCQgjgVVmcKT8xW'),
(11, 'martin ', 'matin', '1984-12-25', 'ici', 'la', '74744', 'france', '45050236', 'martin', '$2y$11$97170be7c13402cd90fbbutZ2BzF2G5L96YTzaCAEUYU8Ri7zMW8G'),
(12, 'a', 'a', '2021-01-01', 'a', 'a', '12345', 'a', 'a', 'a@a.com', '$2y$11$68520c3f28b0a676a092cOUCpDBwKyn2NQnLryhgXfg2CwtZir/2G'),
(13, 'baptiste', 'cornic', '1992-11-10', '10 chemin blabla', 'noisy', '77000', 'france', '0607584541', 'baptiste@', '$2y$11$0e89a2e5492151d82f534erSt03ab949E1D1L1Q5eZb9NRvzNs3x.'),
(14, 'tanguy', 'cornic', '1996-02-14', '10 chemin lala', 'noisy', '77000', 'france', '0603020545', 'tanguy@', '$2y$11$00aef1556bdbc1927a78bOR.IDY1sOP/9gZKE4kcJ2P64ceWknsau'),
(17, 'Toto', 'Alain', '2000-01-01', '5 rue bonon', 'Paris', '75015', 'France', '16072/311', 'Toto.alain@gmail.com', '$2y$11$dec2d674be63e1c97910cugiZLj1peFdCXHbkvCinxfkm0b8CJ17i'),
(18, 'fake', 'person', '2021-01-01', '123 fake place', 'no wher', '54321', '091092109', '098120398', 'munandmurf@hotmail.com', '$2y$11$75a959520c18d06b75a5eu88v7zq3sWpQRCr/jbWBcF1Lxj7EiSHm');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_order`
--
ALTER TABLE `product_order`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
