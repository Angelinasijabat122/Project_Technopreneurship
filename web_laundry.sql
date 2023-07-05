-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2023 pada 23.33
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_karyawan`
--

CREATE TABLE `tbl_karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_karyawan`
--

INSERT INTO `tbl_karyawan` (`id`, `nama`, `username`, `password`, `email`, `no_hp`, `alamat`, `catatan`, `image`, `role`) VALUES
(1, 'Angelina', 'admin', '$2y$10$MTm15IHxkcTNGTMoPMRcaeMyYqGIc5U6UPk4PymX/sggGNSyT4hMe', 'admin@laundryku.com', '+6285320356152', 'Jalah Haji Gara Cluster 7 Gondrong,Cipondoh,Tanggerang', 'Smart Think For Better Future', '718pic angel.png', 'Admin'),
(3, 'Angel', 'angel', '$2y$10$mp5Uet8mXWCTKY9OIU7LyOUHXoXZMXMmE1bAHxjhFYHz/FOOPY1t6', 'Angel@gmail.con', '08520357152', 'Jalan harapan bunda,cipondoh', 'Bekerja bersama hati kita ini insan bukan seekor sapi', '724foto angel almet.jpg', 'Karyawan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_paket`
--

CREATE TABLE `tbl_paket` (
  `id` varchar(10) NOT NULL,
  `paket` varchar(100) NOT NULL,
  `harga_kilo` int(11) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_paket`
--

INSERT INTO `tbl_paket` (`id`, `paket`, `harga_kilo`, `deskripsi`) VALUES
('PKT001', 'Murah Meriah', 5000, 'Selesai 3 hari = Cuci + Kering Setrika'),
('PKT002', 'Cuci Komplit', 8000, 'Selesai 1 hari = Cuci + Kering + Setrika'),
('PKT003', 'Cuci Kering', 5000, 'Selesai 1 hari'),
('PKT004', 'Cuci Basah', 3500, 'Selesai 1 hari'),
('PKT005', 'Setrika', 5000, 'Selesai 1 hari'),
('PKT006', 'Cuci Ekspres', 15000, 'Selesai 6 jam = Cuci + Kering + Setrika'),
('PKT007', 'Cuci Kilat', 25000, 'Selesai 3 jam = Komplit + Bonus Kaus Laundry Ku'),
('PKT008', 'VIP', 75000, 'Selesai 2 jam = Komplit + Bonus Kaus & Celana Laundry Ku + Antar langsung'),
('PKT009', 'VVIP', 120000, 'Selesai 1 jam = Komplit + Bonus Kaus & Celana Laundru Ku + Tas Khusus Laundry Ku + Antar langsung ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id`, `nama`, `alamat`, `no_hp`) VALUES
('PLG001', 'Rizky Ridho', 'Jlan Haji Mali', '081213141561'),
('PLG002', 'Rafi Nandyka', 'Jalan Albarokah', '081241521712'),
('PLG003', 'Alviansyah', 'Jalan Haji selong', '082132516281'),
('PLG004', 'Anissa Fadhillah', 'Kompleks Interkota', '085287652419'),
('PLG005', 'Muhammad Tegar', 'Jalan Haji Naim', '082251429185'),
('PLG006', 'Muhammad Ibnu Jailani', 'Taman Semanan Indah', '082132456787');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` varchar(10) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `id_pelanggan` varchar(10) NOT NULL,
  `kd_paket` varchar(10) NOT NULL,
  `qty` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `tanggal`, `id_pelanggan`, `kd_paket`, `qty`, `biaya`, `bayar`, `kembalian`) VALUES
('TRS001', '15 Juni 2023', 'PLG001', 'PKT001', 7, 35000, 50000, 15000),
('TRS002', '13 Juni 2023', 'PLG002', 'PKT001', 5, 25000, 50000, 25000),
('TRS003', '12 Juni 2023', 'PLG005', 'PKT002', 8, 64000, 50000, -14000),
('TRS004', '16 Jun 2023', 'PLG006', 'PKT003', 6, 30000, 20000, -10000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_karyawan`
--
ALTER TABLE `tbl_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_paket`
--
ALTER TABLE `tbl_paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `kd_paket` (`kd_paket`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_karyawan`
--
ALTER TABLE `tbl_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
