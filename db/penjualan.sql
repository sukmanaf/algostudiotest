/*
SQLyog Professional v10.42 
MySQL - 5.6.16 : Database - penjualan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`penjualan` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `penjualan`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `KodeBarang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NamaBarang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HargaJual` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HargaBeli` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Stok` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `barang` */

insert  into `barang`(`id`,`KodeBarang`,`NamaBarang`,`HargaJual`,`HargaBeli`,`Stok`,`Kategori`,`created_at`,`updated_at`) values (13,'B0','Mouse wired rexus','2000','1000','12','K1','2022-01-25 13:21:53','2022-01-25 13:21:53'),(14,'B1','Mouse wired gigabyte','2100','1100','14','K1','2022-01-25 13:21:53','2022-01-25 13:21:53'),(15,'B2','Mouse wired asus','2200','1200','23','K1','2022-01-25 13:21:53','2022-01-25 13:21:53'),(16,'B3','Mouse wired time elite','2300','1300','45','K1','2022-01-25 13:21:53','2022-01-25 13:21:53'),(17,'B4','Mouse wireless rexus','2400','1400','67','K2','2022-01-25 13:21:53','2022-01-25 13:21:53'),(18,'B5','Mouse wireless asus','2500','1500','56','K2','2022-01-25 13:21:53','2022-01-25 13:21:53'),(19,'B6','Mouse wireless armagedon','2600','1600','78','K2','2022-01-25 13:21:53','2022-01-25 13:21:53'),(20,'B7','Mouse wireless robot','2700','1700','66','K2','2022-01-25 13:21:53','2022-01-25 13:21:53'),(21,'B8','Mouse wireless logitech','2800','1800','55','K3','2022-01-25 13:21:53','2022-01-25 13:21:53'),(22,'B9','Mouse wireless logitect silent','2900','1900','44','K3','2022-01-25 13:21:53','2022-01-25 13:21:53'),(23,'B10','Mouse wired asus v2','21000','11000','3','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(24,'B11','Mouse wired vgen','21100','11100','1','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(25,'B12','Mouse wired apacer','21200','11200','56','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(26,'B13','Mouse wired wd','21300','11300','44','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(27,'B14','Mouse wired seagate','21400','11400','33','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(28,'B15','Mouse wellcome','21500','11500','2','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(29,'B16','Mouse robot','21600','11600','5','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(30,'B17','Mouse ugreen','21700','11700','77','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(31,'B18','Mouse anker','21800','11800','96','K1','2022-01-25 16:08:02','2022-01-25 16:08:02'),(32,'B19','Mouse aukey','21900','11900','5','K1','2022-01-25 16:08:02','2022-01-25 16:08:02');

/*Table structure for table `detail_penjualan` */

DROP TABLE IF EXISTS `detail_penjualan`;

CREATE TABLE `detail_penjualan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `IdPenjualan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KodeBarang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jumlah` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HargaSatuan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HargaTotal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `detail_penjualan` */

insert  into `detail_penjualan`(`id`,`IdPenjualan`,`KodeBarang`,`Jumlah`,`HargaSatuan`,`HargaTotal`,`created_at`,`updated_at`) values (31,'P0','B0','1','2000','2000','2022-01-25 14:36:26','2022-01-25 14:36:26'),(32,'P1','B1','1','2100','2100','2022-01-25 14:37:26','2022-01-25 14:36:26'),(33,'P2','B2','1','2200','2200','2022-01-25 14:38:26','2022-01-25 14:36:26'),(34,'P3','B3','1','2300','2300','2022-01-25 14:39:26','2022-01-25 14:36:26'),(35,'P4','B4','1','2400','2400','2022-01-25 14:41:26','2022-01-25 14:36:26'),(36,'P5','B5','1','2500','2500','2022-01-25 14:42:26','2022-01-25 14:36:26'),(37,'P6','B6','1','2600','2600','2022-01-25 14:43:26','2022-01-25 14:36:26'),(38,'P7','B7','1','2700','2700','2022-01-25 14:44:26','2022-01-25 14:36:26'),(39,'P8','B8','1','2800','2800','2022-01-25 14:45:26','2022-01-25 14:36:26'),(40,'P9','B9','1','2900','2900','2022-01-25 14:36:26','2022-01-25 14:36:26'),(41,'P0','B1','1','2100','2100','2022-01-25 14:36:26','2022-01-25 14:40:00'),(42,'P1','B2','1','2200','2200','2022-01-25 14:37:26','2022-01-25 14:40:00'),(43,'P2','B3','1','2300','2300','2022-01-25 14:38:26','2022-01-25 14:40:00'),(44,'P3','B4','1','2400','2400','2022-01-25 14:41:26','2022-01-25 14:40:00'),(45,'P4','B5','1','2500','2500','2022-01-25 14:42:26','2022-01-25 14:40:00'),(46,'P5','B6','1','2600','2600','2022-01-25 14:43:26','2022-01-25 14:40:00'),(47,'P6','B7','1','2700','2700','2022-01-25 14:44:26','2022-01-25 14:40:00'),(48,'P7','B8','1','2800','2800','2022-01-25 14:45:26','2022-01-25 14:40:00'),(49,'P8','B9','1','2900','2900','2022-01-25 14:36:26','2022-01-25 14:40:00'),(50,'P9','B10','1','21000','21000','2022-01-25 14:36:26','2022-01-25 14:40:00'),(51,'P10','B11','1','21100','21100','2022-01-24 15:33:47','2022-01-25 15:33:47'),(52,'P11','B12','1','21200','21200','2022-01-24 15:33:47','2022-01-25 15:33:47'),(53,'P12','B13','1','21300','21300','2022-01-24 15:33:47','2022-01-25 15:33:47'),(54,'P13','B14','1','21400','21400','2022-01-24 15:33:47','2022-01-25 15:33:47'),(55,'P14','B15','1','21500','21500','2022-01-24 15:33:47','2022-01-25 15:33:47'),(56,'P15','B16','1','21600','21600','2022-01-24 15:33:47','2022-01-25 15:33:47'),(57,'P16','B17','1','21700','21700','2022-01-24 15:33:47','2022-01-25 15:33:47'),(58,'P17','B18','1','21800','21800','2022-01-24 15:33:47','2022-01-25 15:33:47'),(59,'P18','B19','1','21900','21900','2022-01-24 15:33:47','2022-01-25 15:33:47'),(60,'P19','B20','1','22000','22000','2022-01-24 15:33:47','2022-01-25 15:33:47');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `IdKategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kategori` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `kategori` */

insert  into `kategori`(`id`,`IdKategori`,`Kategori`,`created_at`,`updated_at`) values (11,'K0','Mouse Kabel Murah','2022-01-25 13:25:49','2022-01-25 13:25:49'),(12,'K1','Mouse kabel Bagus','2022-01-25 13:25:49','2022-01-25 13:25:49'),(13,'K2','Mouse WIreless Murah','2022-01-25 13:25:49','2022-01-25 13:25:49'),(14,'K3','Mouse Wireless Bagus','2022-01-25 13:25:49','2022-01-25 13:25:49');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2019_08_19_000000_create_failed_jobs_table',1),(3,'2022_01_25_045334_create_barang',1),(4,'2022_01_25_050336_create_penjualan',2),(5,'2022_01_25_050612_create_detail_penjualan',2),(6,'2022_01_25_050847_create_kategori',2);

/*Table structure for table `penjualan` */

DROP TABLE IF EXISTS `penjualan`;

CREATE TABLE `penjualan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TglPenjualan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NamaKonsumen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Alamat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdPenjualan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `penjualan` */

insert  into `penjualan`(`id`,`TglPenjualan`,`NamaKonsumen`,`Alamat`,`IdPenjualan`,`created_at`,`updated_at`) values (1,'2022-01-25 00:00:00','Nama0','Malang  kota gang 0','P0','2022-01-25 14:13:50','2022-01-25 14:13:50'),(2,'2022-01-25 14:55:18','Nama0','Malang  kota gang 0','P1','2022-01-25 14:13:50','2022-01-25 14:13:50'),(3,'2022-01-25 00:02:00','Nama2','Malang  kota gang 2','P2','2022-01-25 14:13:50','2022-01-25 14:13:50'),(4,'2022-01-25 00:03:00','Nama3','Malang  kota gang 3','P3','2022-01-25 14:13:50','2022-01-25 14:13:50'),(5,'2022-01-25 00:04:00','Nama4','Malang  kota gang 4','P4','2022-01-25 14:13:50','2022-01-25 14:13:50'),(6,'2022-01-25 00:05:00','Nama5','Malang  kota gang 5','P5','2022-01-25 14:13:50','2022-01-25 14:13:50'),(7,'2022-01-25 00:06:00','Nama6','Malang  kota gang 6','P6','2022-01-25 14:13:50','2022-01-25 14:13:50'),(8,'2022-01-25 00:07:00','Nama7','Malang  kota gang 7','P7','2022-01-25 14:13:50','2022-01-25 14:13:50'),(9,'2022-01-25 00:08:00','Nama8','Malang  kota gang 8','P8','2022-01-25 14:13:50','2022-01-25 14:13:50'),(10,'2022-01-25 00:09:00','Nama9','Malang  kota gang 9','P9','2022-01-25 14:13:50','2022-01-25 14:13:50'),(11,'2022-01-25 14:58:42','Nama10','Malang  kota gang 10','P10','2022-01-24 14:58:26','2022-01-25 14:58:26'),(12,'2022-01-25 14:58:45','Nama11','Malang  kota gang 11','P11','2022-01-24 14:58:26','2022-01-25 14:58:26'),(13,'2022-01-25 14:58:49','Nama12','Malang  kota gang 12','P12','2022-01-24 14:58:26','2022-01-25 14:58:26'),(14,'2022-01-25 14:58:51','Nama13','Malang  kota gang 13','P13','2022-01-24 14:58:26','2022-01-25 14:58:26'),(15,'2022-01-25 14:58:54','Nama14','Malang  kota gang 14','P14','2022-01-24 14:58:26','2022-01-25 14:58:26'),(16,'2022-01-25 00:00:00','Nama15','Malang  kota gang 15','P15','2022-01-25 14:58:26','2022-01-25 14:58:26'),(17,'2022-01-25 00:00:00','Nama16','Malang  kota gang 16','P16','2022-01-25 14:58:26','2022-01-25 14:58:26'),(18,'2022-01-25 00:00:00','Nama17','Malang  kota gang 17','P17','2022-01-25 14:58:26','2022-01-25 14:58:26'),(19,'2022-01-25 14:58:57','Nama18','Malang  kota gang 18','P18','2022-01-24 14:58:26','2022-01-25 14:58:26'),(20,'2022-01-25 00:00:00','Nama19','Malang  kota gang 19','P19','2022-01-25 14:58:26','2022-01-25 14:58:26');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
