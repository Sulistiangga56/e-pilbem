-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2023 at 04:33 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u-choice`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `status_akun` enum('Y','N') NOT NULL,
  `foto` varchar(200) NOT NULL,
  `level` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `jenis_kelamin`, `username`, `password`, `status_akun`, `foto`, `level`) VALUES
(2, 'Admin BEM', 'Laki-Laki', 'adminbem2023@gmail.com', 'adminbem2023', 'Y', '', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `akses_menu`
--

CREATE TABLE `akses_menu` (
  `id` int(11) NOT NULL,
  `manajemen_akun` enum('Y','N') DEFAULT 'N',
  `data_kelas` enum('Y','N') NOT NULL DEFAULT 'N',
  `data_siswa` enum('Y','N') NOT NULL DEFAULT 'N',
  `data_gtk` enum('Y','N') NOT NULL DEFAULT 'N',
  `data_kandidat` enum('Y','N') NOT NULL DEFAULT 'N',
  `rekap_data` enum('Y','N') NOT NULL,
  `reset_peserta` enum('Y','N') NOT NULL,
  `reset_all` enum('Y','N') NOT NULL,
  `username` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akses_menu`
--

INSERT INTO `akses_menu` (`id`, `manajemen_akun`, `data_kelas`, `data_siswa`, `data_gtk`, `data_kandidat`, `rekap_data`, `reset_peserta`, `reset_all`, `username`) VALUES
(2, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'adminbem2023@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kepegawaian` enum('Tendik','Dosen') NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `kehadiran` enum('Hadir','Tidak Hadir') NOT NULL DEFAULT 'Tidak Hadir',
  `status_memilih` enum('Sudah','Belum') NOT NULL DEFAULT 'Belum',
  `status_akun` enum('Y','N') NOT NULL,
  `level` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identitas_kampus`
--

CREATE TABLE `identitas_kampus` (
  `id` int(11) NOT NULL,
  `nama_kampus` varchar(300) NOT NULL,
  `nama_ketua` varchar(300) NOT NULL,
  `nip` varchar(300) NOT NULL,
  `alamat_kampus` varchar(5000) NOT NULL,
  `kelurahan` varchar(300) NOT NULL,
  `kecamatan` varchar(300) NOT NULL,
  `kab_kota` varchar(300) NOT NULL,
  `kode_pt` varchar(300) NOT NULL,
  `akreditasi` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `identitas_kampus`
--

INSERT INTO `identitas_kampus` (`id`, `nama_kampus`, `nama_ketua`, `nip`, `alamat_kampus`, `kelurahan`, `kecamatan`, `kab_kota`, `kode_pt`, `akreditasi`, `logo`) VALUES
(1, 'Politeknik Negeri Jakarta', 'Dr. Sc. H. Zainal Nur Arifin, Dipl-Ing. HTL., M.T.', '196308091992011001', 'Universitas Indonesia, Jl. Prof. DR. G.A. Siwabessy, Kukusan, Kecamatan Beji, Kota Depok, Jawa Barat 16425', 'Kukusan', 'Beji', 'Kota Depok', '005002', 'B', '1284728955_logo pnj.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas` varchar(200) NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `kehadiran` enum('Hadir','Tidak Hadir') NOT NULL DEFAULT 'Tidak Hadir',
  `status_memilih` enum('Sudah','Belum') NOT NULL DEFAULT 'Belum',
  `status_akun` enum('Y','N') NOT NULL,
  `level` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nama`, `jenis_kelamin`, `kelas`, `username`, `password`, `kehadiran`, `status_memilih`, `status_akun`, `level`) VALUES
(1, 'PESERTA TEST', 'L', 'TESTER 1', '11111', '11111', 'Hadir', 'Sudah', 'Y', 'Mahasiswa'),
(2, 'Jake', 'L', 'TI6A', '1234567', '12345', 'Tidak Hadir', 'Belum', 'Y', 'Mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `tb_informasi`
--

CREATE TABLE `tb_informasi` (
  `id` int(11) NOT NULL,
  `tahun_ajaran` varchar(300) NOT NULL,
  `tanggal_pelaksanaan` date NOT NULL,
  `sampai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_informasi`
--

INSERT INTO `tb_informasi` (`id`, `tahun_ajaran`, `tanggal_pelaksanaan`, `sampai`) VALUES
(1, '2022/2023', '2023-08-09', '2023-09-19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kandidat`
--

CREATE TABLE `tb_kandidat` (
  `id` int(11) NOT NULL,
  `nomor_kandidat` char(5) NOT NULL,
  `nama_ketua` varchar(300) NOT NULL,
  `nama_wakil` varchar(300) NOT NULL,
  `visi` text NOT NULL,
  `misi` text NOT NULL,
  `foto_kandidat` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kandidat`
--

INSERT INTO `tb_kandidat` (`id`, `nomor_kandidat`, `nama_ketua`, `nama_wakil`, `visi`, `misi`, `foto_kandidat`) VALUES
(1, '1', 'Bisma Kharim', 'Tere Jane', '<p style=\"margin:0cm\"><span style=\"font-family:\" arial\",sans-serif\"=\"\">Terwujudnya\r\nBEM yang bersinergi serta senantiasa hadir sebagai ruang kolaborasi\r\nanggota dalam melaksanakan fungsi pergerakan dan pelayanan demi\r\nmemberikan kebermanfaatan bagi mahasiswa dan Indonesia.<o:p></o:p></span></p>\r\n\r\n<section class=\"elementor-section elementor-top-section elementor-element elementor-element-bad6382 elementor-section-boxed elementor-section-height-default elementor-section-height-default\" data-id=\"bad6382\" data-element_type=\"section\" style=\"--flex-direction: initial; --flex-wrap: initial; --justify-content: initial; --align-items: initial; --align-content: initial; --gap: initial; --flex-basis: initial; --flex-grow: initial; --flex-shrink: initial; --order: initial; --align-self: initial; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: var(--flex-direction); flex-wrap: var(--flex-wrap); -webkit-box-pack: var(--justify-content); justify-content: var(--justify-content); -webkit-box-align: var(--align-items); align-items: var(--align-items); align-content: var(--align-content); gap: var(--gap); flex-basis: var(--flex-basis); -webkit-box-flex: var(--flex-grow); flex-grow: var(--flex-grow); flex-shrink: var(--flex-shrink); -webkit-box-ordinal-group: var(--order); order: var(--order); align-self: var(--align-self); position: relative; --widgets-spacing: 20px; margin-top: 2em; margin-bottom: 2em; color: rgb(33, 37, 41); font-family: system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" \"liberation=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" background-color:=\"\" rgb(240,=\"\" 237,=\"\" 218);\"=\"\"></section>', '<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\r\n\" arial\",sans-serif\"=\"\">Menyikap, mengawal, dan mengadvokasikan isu-isu sosial\r\npolitik secara strategis dan inklusif dengan melibatkan anggota dalam\r\nrangka melakukan pengabdian kepada masyarakat.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\r\n\" arial\",sans-serif\"=\"\">Memenuhi kebutuhan akademik dan keprofesian serta melakukan\r\npengawalan dan advokasi hak-hak anggota secara aktif dan aspiratif\r\nuntuk meningkatkan kualitas dan kesejahteraan anggota.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\r\n\" arial\",sans-serif\"=\"\">Mengakomodasi, mengembangkan, dan mengapresiasi minat dan\r\nbakat anggota dalam bidang olahraga, seni dan budaya, keilmuan,\r\npelayanan keagamaan, dan peminatan bakat lainnya di lingkup kampus</span></p><p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\r\n\" arial\",sans-serif\"=\"\">.<o:p></o:p></span></p>', '1283047479_3.jpg'),
(2, '2', 'Jane syala', 'Jeno', '<p><strong style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: bold; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: \"Open Sans\", Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(37, 37, 37);\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">BEM Cerah </em></strong><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: \"Open Sans\", Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(37, 37, 37);\">(Cerdas,Religius</em><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: \"Open Sans\", Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(37, 37, 37);\">, Aktif</em><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: \"Open Sans\", Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(37, 37, 37);\"> dan Harmonis)</em><br></p>', '<ol style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 24px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; font-size: 13px; line-height: inherit; font-family: \"Open Sans\", Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(37, 37, 37);\"><li style=\"margin: 0px 0px 12px 1.3em; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; position: relative;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">Terlaksananya pelatihan</em></strong><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">–</em></strong><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">pelatiahan yang meningkatkan kualiatas Sumber Daya Mahasiswa.</em></strong></li><li style=\"margin: 0px 0px 12px 1.3em; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; position: relative;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">Terciptanya solidaritas mahasisiwa yang advokatif da</em></strong><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">n Berkesinambungan.</em></strong></li><li style=\"margin: 0px 0px 12px 1.3em; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; position: relative;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">Meningkatnya produktifitas dan kreatifitas Mahasiswa</em></strong></li><li style=\"margin: 0px 0px 12px 1.3em; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; position: relative;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">Ter</em></strong><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">wujudnya</em></strong><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"> BEM yang </em></strong><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">Harmonis</em></strong><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><em style=\"margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"> dan aspiratif</em></strong></li></ol>', '969969221_5.jpg'),
(3, '3', 'Izhar syafi', 'Jollie Muda', '<p><span style=\"font-family: \" libre=\"\" franklin\",=\"\" \"helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Bekerja sama dan sama-sama bekerja untuk membangun Mahasiswa dengan inspirasi dan kreatifitas.</span><br></p>', '<ol style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; padding: 0px; list-style-position: initial; list-style-image: initial; font-family: \" libre=\"\" franklin\",=\"\" \"helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"box-sizing: inherit;\">Membangun hubungan yang sinergis dengan pihak Institut untuk memenuhi kebutuhan setiap mahasiswa.</li><li style=\"box-sizing: inherit;\">Membangun budaya berdiskusi dan berbahasa guna meningkatkan karakter mahasiswa baik di lingkungan kampus maupun di masyarakat.</li><li style=\"box-sizing: inherit;\">Menjadi wadah untuk memperjuangkan hak-hak mahasiswa dan menyalurkan aspirasi mahasiwa</li><li style=\"box-sizing: inherit;\">Bersama membangun sinergis dan mengembangkan potensi minat dan bakat mahasiswa</li><li style=\"box-sizing: inherit;\">Meningkatkan partisipasi aktif mahasiswa IPM dalam mewujudkan manfaat nyata dalam masyarakat.</li><li style=\"box-sizing: inherit;\">Aktif, dan responsif terhadap isu internal maupun eksternal</li><li style=\"box-sizing: inherit;\">Menumbuh kembangkan rasa persaudaraan dan kekeluargaan diantara mahasiswa.</li></ol>', '1909884575_4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id` int(11) NOT NULL,
  `nama_kelas` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kelas`
--

INSERT INTO `tb_kelas` (`id`, `nama_kelas`) VALUES
(1, 'TESTER 1'),
(2, 'TI6A');

-- --------------------------------------------------------

--
-- Table structure for table `view_pemilihan`
--

CREATE TABLE `view_pemilihan` (
  `id` int(11) NOT NULL,
  `no_kandidat` varchar(300) NOT NULL,
  `nama_kandidat` varchar(300) NOT NULL,
  `username` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `view_pemilihan`
--

INSERT INTO `view_pemilihan` (`id`, `no_kandidat`, `nama_kandidat`, `username`) VALUES
(2, '2', 'Angga Dan Sulis', '11111'),
(3, '2', 'Angga Dan Sulis', '2007411010');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akses_menu`
--
ALTER TABLE `akses_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identitas_kampus`
--
ALTER TABLE `identitas_kampus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_informasi`
--
ALTER TABLE `tb_informasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kandidat`
--
ALTER TABLE `tb_kandidat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `view_pemilihan`
--
ALTER TABLE `view_pemilihan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `akses_menu`
--
ALTER TABLE `akses_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `identitas_kampus`
--
ALTER TABLE `identitas_kampus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_informasi`
--
ALTER TABLE `tb_informasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_kandidat`
--
ALTER TABLE `tb_kandidat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `view_pemilihan`
--
ALTER TABLE `view_pemilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akses_menu`
--
ALTER TABLE `akses_menu`
  ADD CONSTRAINT `fk_iduser_aksesmenu` FOREIGN KEY (`id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
