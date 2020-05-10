/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : cerminjiwa

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 10/05/2020 15:11:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inbox
-- ----------------------------
DROP TABLE IF EXISTS `inbox`;
CREATE TABLE `inbox`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DeviceID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MessageDate` datetime(0) NOT NULL,
  `Message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Read` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inbox
-- ----------------------------
INSERT INTO `inbox` VALUES (1, 'adji142', 'ecc4a28f60e61b76', '2020-05-10 09:05:58', ' saya mau bertanya', b'0');
INSERT INTO `inbox` VALUES (2, 'adji142', 'ecc4a28f60e61b76', '2020-05-10 09:06:45', 'saya bertanya lagi', b'0');
INSERT INTO `inbox` VALUES (3, 'adji142', 'ecc4a28f60e61b76', '2020-05-10 10:08:59', 'Saya Membalas', b'0');

-- ----------------------------
-- Table structure for outbox
-- ----------------------------
DROP TABLE IF EXISTS `outbox`;
CREATE TABLE `outbox`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DeviceID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MessageDate` datetime(0) NOT NULL,
  `Message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Read` bit(1) NOT NULL,
  `ReplyBy` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of outbox
-- ----------------------------
INSERT INTO `outbox` VALUES (1, 'adji142', '123', '2020-05-10 09:08:06', 'Saya balas', b'0', 'Tampan');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ico` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menusubmenu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `multilevel` bit(1) NULL DEFAULT NULL,
  `separator` bit(1) NULL DEFAULT NULL,
  `order` int(255) NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `AllowMobile` bit(1) NULL DEFAULT NULL,
  `MobileRoute` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `MobileLogo` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'User List', NULL, 'icon-qrcode', '0', b'0', b'0', 1, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (2, 'Post', 'post', 'icon-copy', '0', b'0', b'0', 2, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (3, 'Feedback User', NULL, 'icon-comments-alt', '0', b'0', b'0', 3, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (4, 'Setting', 'about', 'icon-cog', '0', b'0', b'0', 4, b'1', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for permissionrole
-- ----------------------------
DROP TABLE IF EXISTS `permissionrole`;
CREATE TABLE `permissionrole`  (
  `roleid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permissionrole
-- ----------------------------
INSERT INTO `permissionrole` VALUES (1, 1);
INSERT INTO `permissionrole` VALUES (1, 2);
INSERT INTO `permissionrole` VALUES (1, 3);
INSERT INTO `permissionrole` VALUES (1, 4);
INSERT INTO `permissionrole` VALUES (1, 5);
INSERT INTO `permissionrole` VALUES (1, 6);
INSERT INTO `permissionrole` VALUES (1, 7);
INSERT INTO `permissionrole` VALUES (1, 8);
INSERT INTO `permissionrole` VALUES (1, 9);
INSERT INTO `permissionrole` VALUES (1, 10);
INSERT INTO `permissionrole` VALUES (1, 11);
INSERT INTO `permissionrole` VALUES (1, 12);
INSERT INTO `permissionrole` VALUES (1, 13);
INSERT INTO `permissionrole` VALUES (1, 14);
INSERT INTO `permissionrole` VALUES (1, 15);
INSERT INTO `permissionrole` VALUES (1, 16);
INSERT INTO `permissionrole` VALUES (1, 17);
INSERT INTO `permissionrole` VALUES (1, 18);
INSERT INTO `permissionrole` VALUES (1, 19);
INSERT INTO `permissionrole` VALUES (1, 20);
INSERT INTO `permissionrole` VALUES (1, 21);
INSERT INTO `permissionrole` VALUES (1, 22);
INSERT INTO `permissionrole` VALUES (1, 23);
INSERT INTO `permissionrole` VALUES (1, 24);
INSERT INTO `permissionrole` VALUES (1, 25);
INSERT INTO `permissionrole` VALUES (1, 26);
INSERT INTO `permissionrole` VALUES (1, 27);
INSERT INTO `permissionrole` VALUES (1, 28);
INSERT INTO `permissionrole` VALUES (1, 29);
INSERT INTO `permissionrole` VALUES (1, 30);
INSERT INTO `permissionrole` VALUES (1, 31);
INSERT INTO `permissionrole` VALUES (1, 32);
INSERT INTO `permissionrole` VALUES (1, 33);
INSERT INTO `permissionrole` VALUES (1, 34);
INSERT INTO `permissionrole` VALUES (1, 35);

-- ----------------------------
-- Table structure for playlist
-- ----------------------------
DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DeviceID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `UserID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PostID` int(6) NOT NULL,
  `LineNumb` int(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist
-- ----------------------------

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `APILink` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Thumb` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `VideoLink` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Reflection` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Liked` int(255) NOT NULL,
  `Shared` int(255) NOT NULL,
  `LastUpdatedBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LastUpdatedOn` datetime(0) NOT NULL,
  `active` int(1) NOT NULL,
  `Source` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `AltVideo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5997454539001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_Delight-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Delight.mov', 'KESENANGAN', 'Seorang Koki Pastry bekerja keras untuk memberikan sentuhan akhir pada kue yang indah dan elegan, kemudian ia memberikannya kepada anaknya yang masih kecil dengan harapan anaknya tertarik untuk menikmatinya. Tetapi anaknya yang masih kecil itu justru menghancurkan dan menjadikan kue tersebut sebagai barang mainan baginya', '1. Bagaimanakah respons sang Koki Pastry saat anak gadisnya yang masih kecil itu menghancurkan kue tersebut dan menjadikan sebagai bahan mainan baginya?\r\n2. Dapatkah saudara membayangkan bahwa orang tua saudara begitu “senang dan bahagianya” saat saudara masih kecil? Menurut sadara seperti apakah itu?', 0, 0, 'admin', '2020-05-10 02:35:20', 1, 'CJ', 'https://www.youtube.com/watch?v=DMVKFl5rcUg');
INSERT INTO `post` VALUES (2, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2940493342001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/50c42104-3876-49b1-abf0-9757f7b26bcb/c9ad1e16-ba25-41d1-92da-6ad8d0993f14/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/50c42104-3876-49b1-abf0-9757f7b26bcb/8cd1e96b-8a40-4b53-b8cb-c33a6dcd97c0/main.mp4?fastly_token=NWVhZDdjMTlfMDY1OGY1YWIxYTdhNmQyODFmMTYzNzdlOTQxYWJjYTkxZTQxMTdjOTVhNzcxNDNhMzE4MzExMDFhYTBkZWM2OF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS81MGM0MjEwNC0zODc2LTQ5YjEtYWJmMC05NzU3ZjdiMjZiY2IvOGNkMWU5NmItOGE0MC00YjUzLWI4Y2ItYzMzYTZkY2Q5N2MwL21haW4ubXA0', 'ALIRAN AIR', 'Sumber air bisa menjadi misteri bagi sebagian orang.', '1. Menurut saudara apa arti dari sumber-sumber air (air dari wastafel & air toilet) dalam film tersebut?\r\n2. Menurut saudara, mengapa pria tersebut menggunakan air toilet daripada air dari wastafel dapur?\r\n3. Secara metaforis, pernakah saudara melihat orang minum air toilet? Menurut saudara apa motivasi pilihan mereka untuk minum air toilet?\r\n4. Bagaimana saudara mendapatkan teman untuk melihat bahwa mereka minum air yang tidak sehat, ketika sumber air yang sehat tersedia?', 0, 0, 'admin', '2020-05-10 02:35:34', 1, 'CJ', 'https://www.youtube.com/watch?v=5WtxPlko1Sk');
INSERT INTO `post` VALUES (3, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2923814892001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/2caaef2b-db98-40e9-b725-bab234c6d00a/b60f0391-e781-4743-aadb-39a916d705b3/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/2caaef2b-db98-40e9-b725-bab234c6d00a/3fb1ffcc-20b7-4454-a2f5-5c99bf75d6c4/main.mp4?fastly_token=NWVhZDgwMzZfN2QxMmU2NDNmODJiNWEzZGM1MTQ5ZTZlMTJkM2Y3MDg1OTU0NGExZDQzYjVhZGRjZTg1OWQ0MTJkNTBiNjAwM18vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS8yY2FhZWYyYi1kYjk4LTQwZTktYjcyNS1iYWIyMzRjNmQwMGEvM2ZiMWZmY2MtMjBiNy00NDU0LWEyZjUtNWM5OWJmNzVkNmM0L21haW4ubXA0', 'WAJAH BULAT', 'Sebuah sindiran singkat tentang konsep kecantikan, dimana seseorang yang tidak pernah puas dengan apa yang ada pada dirinya karena selalu memaksakan diri untuk mengikuti perkembangan “trend” yang pada akhirnya menghancurkan dirinya sendiri.', '1. Apa yang membuat seseorang merasa tidak puas?\r\n2. Apa dan siapa yang menekan saudara untuk dapat mengubah diri saudara? Mengapa?\r\n3. Apakah ada hal-hal yang memberi saudara kebebasan dari harapan hidup?\r\n4. Apa tujuan dan untuk siapakah saudara hidup di dunia ini?', 0, 0, 'admin', '2020-05-01 05:57:18', 1, 'CJ', 'https://www.youtube.com/watch?v=6Yh3XB-ifPA');
INSERT INTO `post` VALUES (4, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5007029795001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/38bfc112-887f-467c-b25c-f5f4dbd68053/e7a3f439-a6c4-4e64-aefa-b2b9bde93a29/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/38bfc112-887f-467c-b25c-f5f4dbd68053/383de554-ca82-4b50-8bd3-f4d805afaa87/main.mp4?fastly_token=NWVhZDgwM2RfOTVjY2I1MDdhZTcwMjZlZmVmNTIxZjkyOGEwNzE3NWJhOWVjMDljYmQ5ZDNkNjI4NjZiZmMzYzZlZTE0YzJiMF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS8zOGJmYzExMi04ODdmLTQ2N2MtYjI1Yy1mNWY0ZGJkNjgwNTMvMzgzZGU1NTQtY2E4Mi00YjUwLThiZDMtZjRkODA1YWZhYTg3L21haW4ubXA0', 'TERABAIKAN', 'Kisah seorang tunawisma yang mengalami penolakan untuk kebaikan yang dilakukannya.', '1. Apa yang anda pikirkan tentang film ini?\r\n2. Menurut saudara mengapa gadis kecil dalam film ini satu-satunya yang memperhatikan seorang tunawisma itu sementara yang lainnya mengabaikannya?\r\n3. Pernahkah saudara merasa telah berbuat baik tetapi tidak terlihat orang lain?', 0, 0, 'admin', '2020-05-10 02:36:00', 1, 'CJ', 'https://www.youtube.com/watch?v=5eLvHtIWKBE');
INSERT INTO `post` VALUES (5, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/1932122741001', 'http://brightcove04.o.brightcove.com/1226740748001/1226740748001_4370919339001_2-0-La-Busqueda-The-Search-videoStill.jpg?pubId=1226740748001&videoId=1932122741001', 'http://f1.media.brightcove.com/12/1226740748001/1226740748001_5709674570001_1932122741001.mp4?pubId=1226740748001&videoId=1932122741001', 'PENCARIAN', 'Dikisahkan ada seorang ayah yang selalu merindukan kehadiran putrinya, yang kini sudah beranjak dewasa dan tidak lagi bersama-sama dengannya. Teringat baginya, ketika dia bersama-sama putrinya bermain telpon-telponan dengan menggunakan kaleng-kaleng bekas, dan berbicara satu sama lain. Kini putri kecil itu telah bertumbuh dewasa dan oleh karena suatu persoalan, dia memutuskan untuk meninggalkan ayahnya dan menjalani kehidupannya sendiri Sang ayah ingin merajut kembali hubungan mereka yang telah rusak dan membut kaleng lagi, mengikatnya pada layang-layang berwarna merah yang indah, ia mengirimnya kepada anaknya dengan melayangkannya ke udara. Dan kaleng-kaleng tersebut mendarat di Apartemen putrinya dan mereka berusaha mencoba berkomunikasi satu sama lain. Tetapi sulit bagi mereka untuk mendengar dari kejauhan. Sampai ada akhirnya sang anak memutuskan untuk pulang dan berjumpa dengan ayahnya yang telah menunggunya dan menyambutnya dengan senyuman di halte bus, tetapi anaknya memutuskan untuk kembali lagi ke dalam bus dan meninggalkan ayahnya karena ada kaleng-kaleng lain ditempat kursinya.', '1. Apakah yang terjadi dengan sang gadis dalam film tersebut ketika ia memutuskan untuk keluar dari rumah dan meninggalkan ayahnya?\r\n2 Apakah yang diinginkan oleh sang gadis tersebut pada akhirnya? Munurut saudara apa yang mencegahnya turun dari bus dan menjumpai ayahnya?\r\n3. pernahkah saudara ingin berdamai dengan seseorang tetapi tidak bisa?\r\n4.Menurut saudara bagaimanakah caranya merajut kembali suatu hubungan yang telah rusak dengan orang-orang yang saudara kenal?', 0, 0, 'admin', '2020-05-10 02:37:06', 1, 'CJ', 'https://www.youtube.com/watch?v=n11Ss40odWE');
INSERT INTO `post` VALUES (6, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2151777408001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/eacc4d74-13db-42d6-a3ac-d5c42223f9ea/b27b806b-bf5c-46f4-8354-dca8f1f46330/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/eacc4d74-13db-42d6-a3ac-d5c42223f9ea/c1755936-0d98-4253-bcb9-a031283c5a6e/main.mp4?fastly_token=NWVhZDdlNGNfZTBhMjg0YWFiMTk1Yjc1NzljNzZmNzk3NmExYTQ4NDc0YmIyOWJiZTQxYWRmN2JhODcwYzMyZDk5ZTA4YTAwNF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS9lYWNjNGQ3NC0xM2RiLTQyZDYtYTNhYy1kNWM0MjIyM2Y5ZWEvYzE3NTU5MzYtMGQ5OC00MjUzLWJjYjktYTAzMTI4M2M1YTZlL21haW4ubXA0', 'DALAM KEBEBASAN', 'Seorang pria meringkuk di dalam sebuah kubus abu-abu yang tak berjendela dan berpintu. Tiba-tiba ia mendengar suara “Kebebasan!” dan sebuah tanda dimasukkan melalui sebuah celah di dinding, yang bertuliskan: Kebebasan.\r\nDalam kebingungannya, ada tangan menjulur dari sebuah slot, mengambil tanda dan memutarnya ke bawah lalu memberikan kembali kepada lelaki itu. Ia mengikuti tanda itu lalu menyingkirkan karpetnya lalu terbentanglah rumput yang segar. Dia merendahkan lampu dan menemukan cahaya suci yang menyinari selnya. Akhirnya, ia merobek beberapa kertas di dinding dan dan terciptalah sebuah pintu. Ia melangkah keluar dan bebas dari selnya yang hancur.\r\nDi suatu tempat yang jauh, seseorang berteriak, “Kebebasan!” Lalu sang pria berlari ke arahnya dan menemukan sebuah lapangan yang penuh dengan sel abu-abu. Ia tersenyum pada dirinya, lalu mengambil tandanya dan berlari ke arah yang terdekat untuk juga menolong mereka yang sedang terpenjara.', '1. Siapa yang memberi orang tersebut kebebasan?\r\n2. Mengapa dia dengan senang hati membantu orang lain mendapatkan kebebasan mereka?\r\n3. Apakah artinya benar-benar bebas?\r\n4. Sudahkah saudara mengalami kebebasan semacam ini dan bagaimana saudara dapat membantu orang lain menemukannya?', 0, 0, 'admin', '2020-05-10 02:36:35', 1, 'CJ', 'https://www.youtube.com/watch?v=zJDDNSJJCAA');
INSERT INTO `post` VALUES (7, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5219412089001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/75de325d-9d7c-44de-a9be-3de3ec5514a8/7007f0e9-289c-4e67-ae1d-b7fc937eb7c3/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/75de325d-9d7c-44de-a9be-3de3ec5514a8/3f28e9e7-ba91-4afe-adb1-3189875dcbc0/main.mp4?fastly_token=NWVhZDgxNzFfZmFiNzNiNWU2MDViOGNhNmI2NDE2NzEyOTdlZDVmZDc0YzE1MjQwMDU2NTQ0MzA2NDhhOTdlZGJiYTUzNzRlMl8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS83NWRlMzI1ZC05ZDdjLTQ0ZGUtYTliZS0zZGUzZWM1NTE0YTgvM2YyOGU5ZTctYmE5MS00YWZlLWFkYjEtMzE4OTg3NWRjYmMwL21haW4ubXA0', 'KEJUTAN', 'Kisah seorang wanita yang mengambil dan sebuah gelang antik dalam pagelaran karya seni dan menyembunyikannya. Awalnya ia merasa senang dan bangga menggunakan gelang tersebut tetapi lambat laun menjadi malapetaka baginya karena gelang tersebut diluar kendalinya semakin hari semakin berlipatganda jumlahnya dan memenuhi hampir seluruh lengannya. Wanita itu merasa ketakutan dan bersalah atas perbuatannya menyembunyikan gelang hasil curian tersebut. Ia berusaha dengan segala cara untuk melepaskan dari tangannya namun tidak bisa. Beberapa hal dalam hidup ini terkadang terlalu sulit untuk disembunyikan. Semakin disembunyikan semakin banyak persoalan yang dihadapi.', '1. Apa pendapat saudara tentang film ini? Bagaimana perasaan anda?\r\n2. Apakah film berakhir seperti yang saudara harapkan? Mengapa atau mengapa tidak?\r\n3. Menurut saudara mengapa wanita tersebut berusaha menyembunyikan gelang tersebut dari orang lain?\r\n4. Pernahkah saudara merasa perlu menyembunyikan sesuatu dari orang lain?\r\n5. Apa yang mungkin mewakili gelang dalam hidup saudara? ', 0, 0, 'admin', '2020-05-10 02:37:23', 1, 'CJ', 'https://www.youtube.com/watch?v=zJDDNSJJCAA');
INSERT INTO `post` VALUES (8, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5007029794001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/903ba4a3-73b9-4cc5-b5ae-7249ae1d0405/193c3277-dea8-4b97-bb36-24612c79d446/1280x720/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/903ba4a3-73b9-4cc5-b5ae-7249ae1d0405/074b7723-3ff7-4fc3-8a5d-7c7a5b0e1c37/main.mp4?fastly_token=NWVhZDgwODlfYTQzMWY4ZmQwYzIxYjc3OGY1M2QyNDE2OWJmNTg1ZDgyN2ViYWFlNDlkZmI2OTliMGI0YjQ3NzQ0MjMyYjZjN18vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS85MDNiYTRhMy03M2I5LTRjYzUtYjVhZS03MjQ5YWUxZDA0MDUvMDc0Yjc3MjMtM2ZmNy00ZmMzLThhNWQtN2M3YTViMGUxYzM3L21haW4ubXA0', 'PENGORBANAN', 'Seorang ayah bersama anaknya berupaya menyelamatkan sekelompok pengungsi yang tenggelam tanpa memikirkan untung rugi atau harga yang harus dibayar, sekalipun nyawa yang menjadi taruhannya.', '1. Bercerita tentang apakah Film ini? \r\n2. Karakter apa yang paling saudara sukai dalam film ini? Mengapa?\r\n3. Apakah saudara akan mempertaruhkan hidup anda untuk keluarga, sahabat, atau seseorang yang anda tidak kenal?\r\n4. Apa arti pengorbanan bagi saudara ?', 0, 0, 'admin', '2020-05-10 02:39:37', 1, 'CJ', 'https://www.youtube.com/watch?v=Ifj94qAtORo');
INSERT INTO `post` VALUES (9, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2955277188001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/f53cc7be-8475-432a-b292-4dcffa956f94/13352e2c-d4ca-4271-a9bd-ab2e85909f40/1280x720/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/f53cc7be-8475-432a-b292-4dcffa956f94/ab9086c7-417a-470c-8e4f-748727890e27/main.mp4?fastly_token=NWVhZDgxM2NfMWMwYTU4MjU2OGU1MTQzZDczNTdiZmEyN2EyNjZiMjcxNWZjMjljMjM5NGZmMjlhODIyZjQxNDllMDE2N2UwOF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS9mNTNjYzdiZS04NDc1LTQzMmEtYjI5Mi00ZGNmZmE5NTZmOTQvYWI5MDg2YzctNDE3YS00NzBjLThlNGYtNzQ4NzI3ODkwZTI3L21haW4ubXA0', 'PEREKAM SUARA', '', '1. Apakah pendapat Anda akan cerita film ini ? Berikan satu kata yang muncul di benak Anda saat Anda ingat film ini ? 2. Mengapa ia begitu mementingkan rekor satu-satunya ?\r\n3. Mengapa kehilangan sesuatu atau kehilangan arah akan menimbulkan rasa panik ?\r\n4. Apakah Anda pernah kehilangan sesuatu dimana Anda akan mengadakan pesta jika Anda mendapatkannya kembali ?\r\n5. Jika Anda kehilangan arah, bagaimana rasanya jika seseorang mencari Anda dalam keadaan ini ?\r\n6. Pernahkah Anda merasa bahwa Allah sedang mencari Anda ? Mungkin sebagai contoh, ada hal yang Anda tahu tidak mungkin terjadi secara kebetulan. Seperti apakah rasanya ?', 0, 0, 'admin', '2020-05-10 02:39:49', 1, 'CJ', 'https://www.youtube.com/watch?v=hS2LeBkxK5s');
INSERT INTO `post` VALUES (10, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2940597144001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/28a49951-bef8-4601-b859-7bf2dcbc631c/58380bde-03ca-46ee-932f-45e8658e3dd9/1280x720/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/28a49951-bef8-4601-b859-7bf2dcbc631c/5210ffee-5f4b-404d-bac7-2f4b03341f7a/main.mp4?fastly_token=NWVhZDgyMjNfZDEwODk4YWFlY2YxMWU5MTU3OTllMTU2NzYyMjUzOTQ2N2RhZGEyYTYxNTg5NTlhNmY0ZTU5M2ExMDM4Y2UyMF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS8yOGE0OTk1MS1iZWY4LTQ2MDEtYjg1OS03YmYyZGNiYzYzMWMvNTIxMGZmZWUtNWY0Yi00MDRkLWJhYzctMmY0YjAzMzQxZjdhL21haW4ubXA0', 'JALAN-JALAN YANG MATI', '', '1. Apa yang telah orang lakukan ketika mereka melihat lelaki di atas tanah ?\r\n2. Mengapa Anda berpendapat bahwa tidak seorang yang berhenti untuk menolong ? Menurut pendapat Anda apakah yang telah mereka pikirkan ?\r\n 3. Jikalau Anda pengusaha, akankah Anda berhenti untuk menolong lelaki yang terluka itu ?\r\n 4. Jikalau Anda lelaki yang menggunakan kursi roda, akankah Anda menolong lelaki yang terluka itu ?\r\n 5. Pernahkah Anda menolong seseorang dan hal itu membebankan Anda ? (waktu, pengorbanan, kenyamanan, uang dan lain-lain). Jikalau begitu, bagaimanakah rasanya bagi Anda ?', 0, 0, 'admin', '2020-05-10 02:40:03', 1, 'CJ', 'https://www.youtube.com/watch?v=8zT6W8f42ak');
INSERT INTO `post` VALUES (11, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6144992524001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_Breathe-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Breathe.mp4', 'BREATHE', 'Seorang wanita muda terbangun menderita karena serangan asma, dan dengan panik mencari obat saat dia perlahan kehabisan udara.', '1. Apakah pendapat saudara tentang kisah dalam video ini ? ?\r\n2. Apa yang saudara pikirkan tentang putus asa yang kita hadapi saat ini?\r\n3. Adakah situasi kehidupan yang menakutkan bagi saudara? Jika ya, mengapa?\r\n4. Pernahkah saudara melihat orang yang kehidupannya tampaknya di luar kendali? \r\n5. Apa arti penguasaan diri bagi saudara?\r\nApakah yang saudara sukai dari hidup? Bagaimana kehidupan saudara, apakah itu penting ?', 0, 0, 'admin', '2020-05-10 02:40:48', 1, 'CJ', 'https://www.youtube.com/watch?v=_T7P2YhnXnM');
INSERT INTO `post` VALUES (12, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6005019427001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_0-Uninvited.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Uninvited.mp4', 'UNINVITES GUEST', 'Setiap orang memiliki sesuatu di masa lalu yang menghantui mereka. Masalah Phil adalah bahwa ia memiliki banyak hal itu, dan itu mengepungnya,  Kesalahan, pilihan bodoh, dan tragedi masa lalunya tidak akan membiarkannya lolos begitu saja. Film ini menunjukkan betapa sulitnya melupakan masa lalu dan meninggalkannya, hal itu mengingatkan kita akan kebutuhan sebuah pengampunan dan pemulihan – betapa pun buruknya masa lalu kita.', '1.Apa yang saudara sukai dari film ini?\r\n2. Apa yang tidak saudara sukai ?\r\nJika dua orang dari masa lalu saudara tiba-tiba muncul di sebuah ruangan bersama, \r\n3. siapa yang paling menarik?\r\nSiapa dari masa lalu saudara yang paling terkejut dengan kehidupan saudara sekarang?', 0, 0, 'admin', '2020-05-10 02:41:02', 1, 'CJ', 'https://www.youtube.com/watch?v=esrfI310JC8');
INSERT INTO `post` VALUES (13, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6059920385001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_BMe-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-BMe.mp4', 'B ME', 'Jika saudara secara ajaib dapat menjadi orang yang berbeda, maukah saudara? Dalam film pendek ini, Jane, seorang wanita muda yang merasa tidak mampu menghadapi tantangan hidup, menemukan “B Me,” sebuah aplikasi telepon yang dapat mengubah identitas agar sesuai dengan situasi apa pun. Tetapi ketika Jane semakin bergantung pada aplikasi untuk menavigasi jalan hidupnya, ia menemukan konsekuensi berbahaya dan mengerikan. Film pendek dari Broken Phonebooth Productions ini mengajukan pertanyaan, “Bagaimana kita mengetahui identitas diri kita?”', '1. Apa yang saudara sukai dari film ini? Apa yang tidak disukai?\r\n2. Jika saudara salah satu orang di aplikasi yang akan dipilih, saudara akan menjadi yang mana ?\r\n3. Bagaimana reaksi ayah yang pengasih ketika melihat putrinya melakukan semua upaya untuk diterima?', 0, 0, 'admin', '2020-05-10 02:41:16', 1, 'CJ', 'https://www.youtube.com/watch?v=Qa3d8P8F2BU');
INSERT INTO `post` VALUES (14, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5478943725001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_0-Portions.videoStill.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Portions.mp4', 'PORTIONS', 'Seorang wanita dengan pilihan terbatas menemukan banyak yang dapat menjadi miliknya. Untuk informasi lebih lanjut tentang film ini, kunjungi: http://www.mideastwomen.org/portions/', '1. Karakter utama dihadapkan dengan pilihan pada akhirnya. Apa yang dikatakan film ini kepada saudara tentang “pilihan” yang dihadapi wanita?\r\n2. Apakah yang dilambangkan dalam adegan taman untuk saudara?\r\n3. Bagaimana film ini menantang saudara dalam memilih ?\r\nSebagai wanita, kita sering kurang puas. 4. Bagaimana saudara dapat bergerak menuju kehidupan yang berkelimpahan? Bagaimana saudara dapat meraih porsi yang lebih besar?', 0, 0, 'admin', '2020-05-10 02:41:29', 1, 'CJ', 'https://www.youtube.com/watch?v=2-TslgzLf18');
INSERT INTO `post` VALUES (15, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6030345810001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_0-Legion.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Legion.mp4', 'LEGION', 'Disampaikan dengan kuasa, ini adalah kisah Alkitab yang terkenal tentang Yesus yang menyembuhkan seseorang dengan mengusir setan.', '1. Apa yang saudara pikirkan tentang ceritanya? \r\n2. Bagaimana perasaanmu?\r\nKeadaan apa yang menyebabkan orang merasa tertekan atau kewalahan oleh hal-hal di luar kendali mereka? \r\n3. Pernahkah saudara merasakan hal ini?\r\n4. Menurut Anda, apa pandangan Yesus tentang pria di gua?\r\n5. Bagaimana Yesus menyelamatkan orang ini dari kehidupan tanpa harapan? Dapatkah DIA melakukannya untukmu?', 0, 0, 'admin', '2020-05-01 06:10:34', 1, 'CJ', 'https://www.youtube.com/watch?v=XtVIy48t3J0');
INSERT INTO `post` VALUES (24, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/1982348445001', 'http://brightcove04.o.brightcove.com/1226740748001/1226740748001_1758122312001_1-jf6120-0-0-videoStill-4356347965001.jpg?pubId=1226740748001&videoId=1982348445001', 'http://f1.media.brightcove.com/12/1226740748001/1226740748001_5710920757001_1982348445001.mp4?pubId=1226740748001&videoId=1982348445001', 'Healing of the Demoniac', 'Jesus and His disciples  continue to sail and arrive at Gerasa. A wild man on the shore growls at their approach. The boat lands on the shore. The man picks up a stone and continues growling. Jesus hurries toward him, ahead of His disciples.', 'Jesus and His disciples  continue to sail and arrive at Gerasa. A wild man on the shore growls at their approach. The boat lands on the shore. The man picks up a stone and continues growling. Jesus hurries toward him, ahead of His disciples.&#13;&#13;The man threatens Jesus with the rock. But Jesus just continues to stare at him. The man calls Jesus by name and declares Him to be the Son of God. He asks what Jesus would want with him and falls to his knees. He starts to beg Jesus not to punish him. Jesus asks him his name. At first the man won’t say. But Jesus holds out a hand to him. He confesses. His name is Legion. He begs not to be sent back to the abyss. Instead, he wants to go into a nearby herd of pigs. Jesus puts a hand out to the pigs. They go crazy and run away. The man now sits, free from demons. The men who watched the pigs accuse Jesus of being a magician and yell for Him to leave. But the man vows to follow Jesus wherever He might go. Jesus says that the man should go home and tell everyone what God has done for him.&#13;&#13;How does Jesus respond to the demoniac?&#13;&#13;How does everyone react to Jesus sending the demons into the herd of pigs?&#13;&#13;What are some words that come to mind about what Jesus did?', 0, 0, 'admin', '2020-05-02 12:14:16', 1, 'SI', 'https://www.youtube.com/watch?v=5-YZf-LtWnY');
INSERT INTO `post` VALUES (25, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5396260665001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/1_wl604427-0-0.videoStill.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/184566/WESS_184566-wl604427-0-0.mp4', 'Healing on the Sabbath', 'Jesus is in the synagogue on the Sabbath where He heals a woman who has been crippled for 18 years.', 'Jesus is in the synagogue on the Sabbath where He heals a woman who has been crippled for 18 years.', 0, 0, 'admin', '2020-05-02 12:14:28', 1, 'SI', 'https://www.youtube.com/watch?v=r2MQJlIakmw');
INSERT INTO `post` VALUES (26, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5783206532001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/1_jf6159-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/184566/WESS_184566-jf6159-0-0.mp4', 'Resurrected Jesus Appears', 'John and others return to the room where Jesus\' followers have gathered. They come in saying that Jesus has indeed risen! John says that Jesus appeared to Simon on the road. Simon talks about how they did not recognize Jesus at first.', 'John and others return to the room where Jesus\'s followers have gathered. They come in saying that Jesus has indeed risen. John says Jesus appeared to Simon on the road. Simon talks about how they didn\'t recognize Jesus at first.&#13;&#13;But when they sat down to dinner and Jesus broke the bread, they knew who He was.&#13;&#13;Jesus stands in the room with them. He asks why they\'re troubled and doubtful. He holds out His hands for them to see. He encourages them to touch Him to prove to them that He\'s flesh and blood. They reach out and touch His hands.', 0, 0, 'admin', '2020-05-02 12:14:39', 1, 'SI', 'https://www.youtube.com/watch?v=AiV28870kjE');
INSERT INTO `post` VALUES (27, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5783296452001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/1_jf6132-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/184566/WESS_184566-jf6132-0-0.mp4', 'Healing of Bartimaeus', 'Jesus and His disciples wade through a stream into a gathering of people. A man asks what\'s going on. He follows after Jesus, calling out to Him.', 'Jesus and His disciples wade through a stream into a gathering of people. A man asks what\'s going on. He follows after Jesus, calling out to Him.&#13;&#13;John comes back for the man and helps him back to Jesus. The blind man calls Jesus the Son of David and begs for mercy. Jesus asks what the man wants Him to do. And the man answers that he would like to see again.', 0, 0, 'admin', '2020-05-02 12:14:51', 1, 'SI', 'https://www.youtube.com/watch?v=AiV28870kjE');
INSERT INTO `post` VALUES (28, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5783215655001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/1_jf6121-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/184566/WESS_184566-jf6121-0-0.mp4', 'Jesus Feeds 5,000', 'Jesus and the disciples continue to walk the countryside. And a great crowd follows them. Peter comes and asks Jesus to send the people away.', 'Jesus and the disciples continue to walk the countryside. And a great crowd follows them. Peter comes and asks Jesus to send the people away.&#13;&#13;He wants them to find food and a place to stay with local farmers and villagers. Jesus looks back out over the crowd of people. They want to hear from Jesus and have sacrificed to be there. Jesus considers this and tells the disciples to feed the people.&#13;&#13;Mary Magdalene points out that they only have a few loaves of bread and two fish. Jesus takes the baskets and proclaims to the heavens and the people, \"Blessed is the Lord God, King of the Universe who brings forth bread from the earth.\"', 0, 0, 'admin', '2020-05-02 12:15:02', 1, 'SI', 'https://www.youtube.com/watch?v=pEeWr4_NUJo');
INSERT INTO `post` VALUES (29, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5783213325001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/1_jf6124-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/184566/WESS_184566-jf6124-0-0.mp4', 'Jesus Heals Boy from Evil Spirit', 'The crowds continue to gather. They wait on Jesus. Finally, Jesus comes down the hill with Peter, James and John. One man approaches Jesus and begs that Jesus would heal his son.', 'The crowds continue to gather. They wait on Jesus. Finally, Jesus comes down the hill with Peter, James and John. One man approaches Jesus and begs that Jesus would heal his son.&#13;&#13;The boy writhes on the ground. The man goes on to say that the boy is his only son. He asked the disciples to cast out the demon. But they couldn\'t. Jesus gently tells the man to bring his son closer.&#13;&#13;Two men carry the boy to Jesus. But he falls again into another fit. Jesus comes to stand over him. The boy looks up. And slowly, he gets up. Now, where there were cuts and bruises on his face, there are none.', 0, 0, 'admin', '2020-05-02 12:15:13', 1, 'SI', 'https://www.youtube.com/watch?v=ZjsdHeydr9c');
INSERT INTO `post` VALUES (30, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5783224872001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/1_jf6119-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/184566/WESS_184566-jf6119-0-0.mp4', 'Jesus Calms the Storm', 'Jesus gets into a boat and tells His disciples they should all go to the other side of the lake. Along the way, Jesus falls asleep. A storm starts to rage. Waves stretch high over the bow. And the boat starts to take on water.', 'Jesus gets into a boat and tells His disciples they should all go to the other side of the lake. Along the way, Jesus falls asleep. A storm starts to rage. Waves stretch high over the bow. And the boat starts to take on water.&#13;&#13;The whole time, Jesus stays asleep. The disciples hold on tight. They try to keep the boat afloat. Finally, Peter cries out to the still sleeping Jesus. He tells Jesus that the boat is taking on water and that they\'ll all be drowned.&#13;&#13;Jesus stands and puts a hand out toward the storm. The storm clears. And the seas immediately calm.', 0, 0, 'admin', '2020-05-02 12:15:23', 1, 'SI', 'https://www.youtube.com/watch?v=PYTJzZTidzU');
INSERT INTO `post` VALUES (31, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5783224859001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/1_jf6108-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/184566/WESS_184566-jf6108-0-0.mp4', 'Miraculous Catch of Fish', 'Jesus tells the fisherman who owns it to push out farther and let down their nets. The fisherman grumbles that he and the others have already been out all night long. They didn\'t catch anything.', 'Jesus tells the fisherman who owns it to push out farther and let down their nets. The fisherman grumbles that he and the others have already been out all night long. They didn\'t catch anything.&#13;&#13;The fisherman agrees to go out and calls to his partners. Jesus sits in the boat with the fisherman. He waits expectantly. Then gathers the nets, slowly bringing something to the surface.&#13;&#13;He laughs with joy when he sees the nets are full of flopping fish. &#13;&#13;When they\'re done, the fisherman sits in a boat full of fish. He looks up to Jesus. The fisherman frowns and says, \"Go away from me, Lord. I am a sinful man.\" Jesus tells him not to be afraid, that from then on, he would be a fisher of men.', 0, 0, 'admin', '2020-05-02 12:15:33', 1, 'SI', 'https://www.youtube.com/watch?v=WbSW9rYFPGs');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin');
INSERT INTO `roles` VALUES (2, 'Operator');
INSERT INTO `roles` VALUES (3, 'User');

-- ----------------------------
-- Table structure for tabout
-- ----------------------------
DROP TABLE IF EXISTS `tabout`;
CREATE TABLE `tabout`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `About` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Youtube` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Instagram` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Twitter` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Facebook` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Likedin` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Thumbler` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tabout
-- ----------------------------
INSERT INTO `tabout` VALUES (1, 'CERMINJIWA adalah situs web yang berisikan kumpulan video-video pendek yang mencerminkan kehidupan manusia sehari hari. Share bagikan respon dan bagikan pengalamanmu disetiap topik pertanyaan diskusi video tersebut.', 'https://www.youtube.com/channel/UCfUABd3mfKf4-bsGZBnJHzA', 'https://www.instagram.com/cerminj/', 'https://twitter.com/CerminjiwaC', 'https://web.facebook.com/cermin.jiwa.3194', 'https://www.linkedin.com/in/cerminj-jiwa-8951b6192/', 'https://cerminjiwalove.tumblr.com/');
INSERT INTO `tabout` VALUES (2, 'CERMINJIWA adalah situs web yang berisikan kumpulan video-video pendek yang mencerminkan kehidupan manusia sehari hari. Share bagikan respon dan bagikan pengalamanmu disetiap topik pertanyaan diskusi video tersebut. 2', 'https://www.youtube.com/channel/UCfUABd3mfKf4-bsGZBnJHzA', 'https://www.instagram.com/cerminj/', 'https://twitter.com/CerminjiwaC', 'https://web.facebook.com/cermin.jiwa.3194', 'https://www.linkedin.com/in/cerminj-jiwa-8951b6192/', 'https://cerminjiwalove.tumblr.com/');
INSERT INTO `tabout` VALUES (3, 'CERMINJIWA adalah situs web yang berisikan kumpulan video-video pendek yang mencerminkan kehidupan manusia sehari hari. Share bagikan respon dan bagikan pengalamanmu disetiap topik pertanyaan diskusi video tersebut. 2', 'https://www.youtube.com/channel/UCfUABd3mfKf4-bsGZBnJHzA', 'https://www.instagram.com/cerminj/', 'https://twitter.com/CerminjiwaC', 'https://web.facebook.com/cermin.jiwa.3194', 'https://www.linkedin.com/in/cerminj-jiwa-8951b6192/', 'https://cerminjiwalove.tumblr.com/');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (14, 1);
INSERT INTO `userrole` VALUES (43, 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `createdby` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `createdon` datetime(0) NOT NULL,
  `HakAkses` int(255) NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `verified` bit(1) NOT NULL,
  `ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `browser` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `RecordOwnerID` int(11) NOT NULL,
  `CompanyName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CompanyAddress` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CompanyPhone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IPPublic` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nations` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Provinsi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Kota` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Kelurahan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Kecamatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `KodePOS` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Location` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HardwareID` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (14, 'admin', 'admin', 'a9bdd47d7321d4089b3b00561c9c621848bd6f6e2f745a53d54913d613789c23945b66de6ded1eb336a7d526f9349a9d964d6f6c3a40e2ac90b4b16c0121f7895Xg53McbkyQ/NmW60Sf4cu3wJsi/8cyZXxeXV7g6b04=', 'mnl', '0000-00-00 00:00:00', 1, '', b'1', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `users` VALUES (43, 'operator', 'Operator', 'a9bdd47d7321d4089b3b00561c9c621848bd6f6e2f745a53d54913d613789c23945b66de6ded1eb336a7d526f9349a9d964d6f6c3a40e2ac90b4b16c0121f7895Xg53McbkyQ/NmW60Sf4cu3wJsi/8cyZXxeXV7g6b04=', '', '2020-04-26 10:11:27', 0, '', b'0', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `users` VALUES (44, 'adji142', '', '5656df09915ba835d4d25f0193cc9e8a9ace367520c35d82eebceb854086efcfbd6307b92995e9a6d44763b6aa88f9e1424a8aa21cb01a9fd96402d088607acaW0jIgtsFRgCWcGQFlfVujYGpLj647vPy9gFWM+LfKUw=', '', '2020-05-07 10:07:59', 0, '', b'0', '', '', 'prasetyoajiw@gmail.com', '081325058258', 0, '', '', '', '', '', '', '', '', '', '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
