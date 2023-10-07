-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2023 at 04:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buah.in`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$u8C3v10MBbbzNA.zAOTLDuAMkm5SgRtz7TQwR.re8DsXJXAO8YHQW'),
(7, 'ramadhan.abelio', '$2y$10$tWN6f5UjoN3nF71dnAyPPOtV1zRY07SH9c04.OrITqMCokcdG6kee');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buah`
--

CREATE TABLE `tbl_buah` (
  `id` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(64) NOT NULL,
  `link_gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_buah`
--

INSERT INTO `tbl_buah` (`id`, `nama`, `deskripsi`, `gambar`, `link_gambar`) VALUES
(1, 'Apel', 'Apel merupakan jenis buah-buahan, atau buah yang dihasilkan dari pohon apel. Buah apel biasanya berwarna merah kulitnya jika masak dan, namun bisa juga kulitnya berwarna hijau atau kuning. Kulit buahnya agak lembek dan daging buahnya keras. Buah apel memiliki beberapa biji di dalamnya.', '647caa3de191a.png', 'https://www.canva.com/design/DAFkFqqxSmM/BOBcvCqc4lOkNiqfqQ9kPA/view?utm_content=DAFkFqqxSmM&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(2, 'Anggur', 'Anggur merupakan buah yang diolah dari telur buah berupa perdu merambat yang termasuk ke dalam keluarga Vitaceae. Buah ini biasanya digunakan untuk membuat jus anggur, jelly, minuman anggur, minyak biji anggur dan kismis, atau dimakan langsung.', '647caa57dd6cc.png', 'https://www.canva.com/design/DAFkFm3iMB0/Ak4-MJJvjNyOTsvQff-eAg/view?utm_content=DAFkFm3iMB0&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(3, 'Semangka', 'Semangka adalah tanaman merambat yang berasal dari daerah setengah gurun di Afrika bagian selatan. Tanaman ini masih sekerabat dengan labu-labuan, melon, dan ketimun. Semangka biasa dipanen buahnya untuk dimakan segar atau dibuat jus.', '647caa77a172e.png', 'https://www.canva.com/design/DAFkFqPqiCs/9VDWRlo9-LTWGAdXFV8wCw/view?utm_content=DAFkFqPqiCs&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(4, 'Jeruk', 'Citrus adalah genus pohon berbunga dan semak dalam keluarga rue, Rutaceae. Tumbuhan dalam genus menghasilkan buah jeruk, termasuk tanaman penting seperti jeruk, lemon, jeruk bali, pomelo, dan limau. Genus Citrus berasal dari Asia Selatan, Asia Timur, Asia Tenggara, Melanesia, dan Australia.', '647caabf373bd.png', 'https://www.canva.com/design/DAFkFlexEds/4ktMHW4QuJSaevFkqHjU4g/view?utm_content=DAFkFlexEds&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(5, 'Lemon', 'Sitrun, jeruk sitrun, atau limun, limau, atau lemon adalah sejenis jeruk yang buahnya biasa dipakai sebagai penyedap dan penyegar dalam banyak seni boga dunia. Pohon berukuran sedang ini dapat mencapai 6 m dan tumbuh di daerah beriklim tropis dan sub-tropis serta tidak tahan akan cuaca dingin.', '647caad65289a.png', 'https://www.canva.com/design/DAFkFk3a3gQ/NIpGNki26Z1dqbBJgf0oUg/view?utm_content=DAFkFk3a3gQ&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(6, 'Stroberi', 'Stroberi atau tepatnya stroberi kebun adalah sebuah varietas stroberi yang paling banyak dikenal di dunia. Seperti spesies lain dalam genus Fragaria, buah ini berada dalam keluarga Rosaceae.', '647cac39a75ee.png', 'https://www.canva.com/design/DAFkFkAY1KI/nDkKg4TDmzwHaK1WJkVzyw/view?utm_content=DAFkFkAY1KI&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(7, 'Pir', 'Pir adalah sebutan untuk pohon dari genus Pyrus dan buah yang dihasilkan. Beberapa spesies pohon pir menghasilkan buah yang enak dimakan karena mengandung banyak air, masir dan manis. Pear adalah nama dalam bahasa Inggris.', '647cac509d499.png', 'https://www.canva.com/design/DAFkFgbT3Fg/xu8z4tz2TD__GJUndIJQPw/view?utm_content=DAFkFgbT3Fg&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(8, 'Pisang', 'Pisang adalah nama umum yang diberikan pada tumbuhan terna berukuran besar dengan daun memanjang dan besar yang tumbuh langsung dari bagian tangkai. Batang pisang bersifat lunak karena terbentuk dari lapisan pelepah yang lunak dan panjang. Batang yang agak keras berada di bagian permukaan tanah.', '647cac6ac0afd.png', 'https://www.canva.com/design/DAFkFmUD7oI/vUU9a9S1uiEiBC5-zBBMhg/view?utm_content=DAFkFmUD7oI&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(9, 'Ceri', 'Ceri adalah buah dari banyak tanaman genus Prunus, dan merupakan buah berbiji berdaging. Ceri komersial diperoleh dari kultivar beberapa spesies, seperti Prunus avium yang manis dan Prunus cerasus yang asam.', '647cac806a3a9.png', 'https://www.canva.com/design/DAFkFth9nv4/n8pNPx1BI1hVoWX2EKd4Dw/view?utm_content=DAFkFth9nv4&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(10, 'Nanas', 'Nanas adalah tumbuhan tropis dengan buah yang dapat dimakan dan tumbuhan yang paling penting secara ekonomi dalam famili Bromeliaceae. Nanas adalah tumbuhan asli Amerika Selatan, dan telah dibudidayakan disana selama berabad-abad.', '647cac94b52aa.png', 'https://www.canva.com/design/DAFkFi8vkGY/o8b_9-XlJSCbpOxtlniHeA/view?utm_content=DAFkFi8vkGY&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(12, 'Bluberi', 'Bluberi atau beri biru adalah tanaman berbunga dalam genus Vaccinium, bagian Cyanococcus. Spesies ini tumbuh di Amerika Utara. Berupa semak yang ukurannya mulai 10 cm hingga 4 m; spesies terkecil dikenal sebagai &quot;bluberry semak rendah&quot;, dan spesies terbesar adalah &quot;bluberi semak tinggi&quot;.', '647cacc2ee5de.png', 'https://www.canva.com/design/DAFkFu9sLsU/4zDPQsTux0WArWVs1sgkIw/view?utm_content=DAFkFu9sLsU&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu'),
(24, 'Persik', 'Persik adalah tanaman berbuah dari famili Rosaceae. Buah ini disebut juga sebagai buah táo dalam bahasa Mandarin dan momo dalam bahasa Jepang. Buah persik, kadang disebut nektarina, memiliki daging berwarna kuning dengan aroma harum dan memiliki satu biji yang keras.', '648108531474c.png', 'https://www.canva.com/design/DAFkFpuvOzY/W3dcqOc1meSb9OlAGgOrnA/view?utm_content=DAFkFpuvOzY&amp;utm_campaign=designshare&amp;utm_medium=link&amp;utm_source=homepage_design_menu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_buah`
--
ALTER TABLE `tbl_buah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_buah`
--
ALTER TABLE `tbl_buah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
