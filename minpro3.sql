-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Apr 2024 pada 07.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minpro3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Personal'),
(2, 'Programming'),
(4, 'Game'),
(5, 'Horror');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `excerpt`, `body`, `image`, `created_at`) VALUES
(25, 2, 12, 'apakah berhasil', 'poker walllllll ', '<div>poker walllllll</div>', '6607fc37c565f.jpg', '2024-03-30 19:40:50'),
(26, 2, 12, 'kedua', 'bismillah berhasil ', '<div>bismillah berhasil</div>', '6608d6b55eac3.jpg', '2024-03-31 11:21:25'),
(27, 1, 12, 'ketiga', 'ni game pisau ', '<div>ini game pisau</div>', '6608d6cc90852.jpg', '2024-03-31 11:21:48'),
(28, 1, 12, 'gak ada foto', 'gak ada foto ', '<div>gak ada foto</div>', '', '2024-03-31 11:30:35'),
(30, 5, 12, 'ini punya admin', 'ni punya admin ', '<div>ini punya admin</div>', '660d40668e617.png', '2024-04-03 19:41:26'),
(32, 1, 12, 'awd', 'awd ', '<div>awd</div>', '', '2024-04-03 20:08:35'),
(33, 5, 18, 'postingan bayu', 'hai nama saya bayu ', '<div>hai nama saya bayu</div>', '', '2024-04-03 20:17:57'),
(34, 2, 12, 'ini punya super admin', 'mencoba resize photo ', '<div>mencoba resize photo</div>', '660d49c64f23b.png', '2024-04-03 20:21:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `is_admin`) VALUES
(12, 'Novandra', 'Novandra77', 'awangarissaputra@gmail.com', '$2y$10$n07VwUiV5BwNCqjn6JATLe0kXq7EOIBW7D/xJZiwsd3ezgy1MOaka', 2),
(17, 'admin', 'admin', 'admin@gmail.com', '$2y$10$eFlZoBUaCB7c27TrO8gjAeglrplYYJ8qCj.10G9imMAUK0jsElLg6', 1),
(18, 'Bayu', 'bayuanjay', 'Bayuanjay@gmail.com', '$2y$10$iOGuU9QHsSIXqgxYp99f/uwoVc2puPtL2ut7FLJaZTI9Rufizk14m', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_categories` (`category_id`) USING BTREE,
  ADD KEY `FK_users` (`user_id`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
