/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : cerminjiwa

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 01/05/2020 11:37:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'User List', NULL, 'icon-qrcode', '0', b'0', b'0', 1, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (2, 'Post', 'post', 'icon-copy', '0', b'0', b'0', 2, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (3, 'Feedback User', NULL, 'icon-comments-alt', '0', b'0', b'0', 3, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (4, 'Setting', NULL, 'icon-cog', '0', b'0', b'0', 4, b'1', NULL, NULL, NULL);

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
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `APILink` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Thumb` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `VideoLink` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Reflection` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Liked` int(255) NOT NULL,
  `Shared` int(255) NOT NULL,
  `LastUpdatedBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LastUpdatedOn` datetime(0) NOT NULL,
  `active` int(1) NOT NULL,
  `Source` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5997454539001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_Delight-0-0.thumbnail.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Delight.mov', 'KESENANGAN', 'Seorang Koki Pastry bekerja keras untuk memberikan sentuhan akhir pada kue yang indah dan elegan, kemudian ia memberikannya kepada anaknya yang masih kecil dengan harapan anaknya tertarik untuk menikmatinya. Tetapi anaknya yang masih kecil itu justru menghancurkan dan menjadikan kue tersebut sebagai barang mainan baginya', '1. Bagaimanakah respons sang Koki Pastry saat anak gadisnya yang masih kecil itu menghancurkan kue tersebut dan menjadikan sebagai bahan mainan baginya?\r\n2. Dapatkah saudara membayangkan bahwa orang tua saudara begitu “senang dan bahagianya” saat saudara masih kecil? Menurut sadara seperti apakah itu?', 0, 0, 'admin', '2020-05-01 06:14:13', 1, 'CJ');
INSERT INTO `post` VALUES (2, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2940493342001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/50c42104-3876-49b1-abf0-9757f7b26bcb/dbd89cec-4349-4fc3-987d-737dc6b82f0b/120x68/match/image.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Flow_1387228504.mov', 'ALIRAN AIR', 'Sumber air bisa menjadi misteri bagi sebagian orang.', '1. Menurut saudara apa arti dari sumber-sumber air (air dari wastafel & air toilet) dalam film tersebut?\r\n2. Menurut saudara, mengapa pria tersebut menggunakan air toilet daripada air dari wastafel dapur?\r\n3. Secara metaforis, pernakah saudara melihat orang minum air toilet? Menurut saudara apa motivasi pilihan mereka untuk minum air toilet?\r\n4. Bagaimana saudara mendapatkan teman untuk melihat bahwa mereka minum air yang tidak sehat, ketika sumber air yang sehat tersedia?', 0, 0, 'admin', '2020-05-01 05:56:21', 1, 'CJ');
INSERT INTO `post` VALUES (3, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2923814892001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/2caaef2b-db98-40e9-b725-bab234c6d00a/021dabcf-e1b3-481d-8048-af1a2432d66c/120x68/match/image.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Doll-Face_1386775503.m4v', 'WAJAH BULAT', 'Sebuah sindiran singkat tentang konsep kecantikan, dimana seseorang yang tidak pernah puas dengan apa yang ada pada dirinya karena selalu memaksakan diri untuk mengikuti perkembangan “trend” yang pada akhirnya menghancurkan dirinya sendiri.', '1. Apa yang membuat seseorang merasa tidak puas?\r\n2. Apa dan siapa yang menekan saudara untuk dapat mengubah diri saudara? Mengapa?\r\n3. Apakah ada hal-hal yang memberi saudara kebebasan dari harapan hidup?\r\n4. Apa tujuan dan untuk siapakah saudara hidup di dunia ini?', 0, 0, 'admin', '2020-05-01 05:57:18', 1, 'CJ');
INSERT INTO `post` VALUES (4, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5007029795001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/38bfc112-887f-467c-b25c-f5f4dbd68053/f9d3192f-18fe-4a98-a8a5-6b710282f860/120x68/match/image.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Invisible_1467208510.mov', 'TERABAIKAN', 'Kisah seorang tunawisma yang mengalami penolakan untuk kebaikan yang dilakukannya.', '1. Apa yang anda pikirkan tentang film ini?\r\n2. Menurut saudara mengapa gadis kecil dalam film ini satu-satunya yang memperhatikan seorang tunawisma itu sementara yang lainnya mengabaikannya?\r\n3. Pernahkah saudara merasa telah berbuat baik tetapi tidak terlihat orang lain?', 0, 0, 'admin', '2020-05-01 05:58:31', 1, 'CJ');
INSERT INTO `post` VALUES (5, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/1932122741001', 'http://brightcove04.o.brightcove.com/1226740748001/1226740748001_4370919340001_2-0-La-Busqueda-The-Search-thumbnail.jpg?pubId=1226740748001&videoId=1932122741001', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-La_Busqueda_The_Search_1351531803.mp4', 'PENCARIAN', 'Dikisahkan ada seorang ayah yang selalu merindukan kehadiran putrinya, yang kini sudah beranjak dewasa dan tidak lagi bersama-sama dengannya. Teringat baginya, ketika dia bersama-sama putrinya bermain telpon-telponan dengan menggunakan kaleng-kaleng bekas, dan berbicara satu sama lain. Kini putri kecil itu telah bertumbuh dewasa dan oleh karena suatu persoalan, dia memutuskan untuk meninggalkan ayahnya dan menjalani kehidupannya sendiri Sang ayah ingin merajut kembali hubungan mereka yang telah rusak dan membut kaleng lagi, mengikatnya pada layang-layang berwarna merah yang indah, ia mengirimnya kepada anaknya dengan melayangkannya ke udara. Dan kaleng-kaleng tersebut mendarat di Apartemen putrinya dan mereka berusaha mencoba berkomunikasi satu sama lain. Tetapi sulit bagi mereka untuk mendengar dari kejauhan. Sampai ada akhirnya sang anak memutuskan untuk pulang dan berjumpa dengan ayahnya yang telah menunggunya dan menyambutnya dengan senyuman di halte bus, tetapi anaknya memutuskan untuk kembali lagi ke dalam bus dan meninggalkan ayahnya karena ada kaleng-kaleng lain ditempat kursinya.', '1. Apakah yang terjadi dengan sang gadis dalam film tersebut ketika ia memutuskan untuk keluar dari rumah dan meninggalkan ayahnya?\r\n2 Apakah yang diinginkan oleh sang gadis tersebut pada akhirnya? Munurut saudara apa yang mencegahnya turun dari bus dan menjumpai ayahnya?\r\n3. pernahkah saudara ingin berdamai dengan seseorang tetapi tidak bisa?\r\n4.Menurut saudara bagaimanakah caranya merajut kembali suatu hubungan yang telah rusak dengan orang-orang yang saudara kenal?', 0, 0, 'admin', '2020-05-01 05:59:21', 1, 'CJ');
INSERT INTO `post` VALUES (6, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2151777408001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/eacc4d74-13db-42d6-a3ac-d5c42223f9ea/72134176-6f14-47d1-9b20-a788b6eb78e8/120x68/match/image.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-La-Liberte_1360344304.mp4', 'DALAM KEBEBASAN', 'Seorang pria meringkuk di dalam sebuah kubus abu-abu yang tak berjendela dan berpintu. Tiba-tiba ia mendengar suara “Kebebasan!” dan sebuah tanda dimasukkan melalui sebuah celah di dinding, yang bertuliskan: Kebebasan.\r\nDalam kebingungannya, ada tangan menjulur dari sebuah slot, mengambil tanda dan memutarnya ke bawah lalu memberikan kembali kepada lelaki itu. Ia mengikuti tanda itu lalu menyingkirkan karpetnya lalu terbentanglah rumput yang segar. Dia merendahkan lampu dan menemukan cahaya suci yang menyinari selnya. Akhirnya, ia merobek beberapa kertas di dinding dan dan terciptalah sebuah pintu. Ia melangkah keluar dan bebas dari selnya yang hancur.\r\nDi suatu tempat yang jauh, seseorang berteriak, “Kebebasan!” Lalu sang pria berlari ke arahnya dan menemukan sebuah lapangan yang penuh dengan sel abu-abu. Ia tersenyum pada dirinya, lalu mengambil tandanya dan berlari ke arah yang terdekat untuk juga menolong mereka yang sedang terpenjara.', '1. Siapa yang memberi orang tersebut kebebasan?\r\n2. Mengapa dia dengan senang hati membantu orang lain mendapatkan kebebasan mereka?\r\n3. Apakah artinya benar-benar bebas?\r\n4. Sudahkah saudara mengalami kebebasan semacam ini dan bagaimana saudara dapat membantu orang lain menemukannya?', 0, 0, 'admin', '2020-05-01 06:00:32', 1, 'CJ');
INSERT INTO `post` VALUES (7, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5219412089001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/75de325d-9d7c-44de-a9be-3de3ec5514a8/369ad5fb-fe95-4f7f-b002-5828af89fc5a/120x90/match/image.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Jangled.mp4', 'KEJUTAN', 'Kisah seorang wanita yang mengambil dan sebuah gelang antik dalam pagelaran karya seni dan menyembunyikannya. Awalnya ia merasa senang dan bangga menggunakan gelang tersebut tetapi lambat laun menjadi malapetaka baginya karena gelang tersebut diluar kendalinya semakin hari semakin berlipatganda jumlahnya dan memenuhi hampir seluruh lengannya. Wanita itu merasa ketakutan dan bersalah atas perbuatannya menyembunyikan gelang hasil curian tersebut. Ia berusaha dengan segala cara untuk melepaskan dari tangannya namun tidak bisa. Beberapa hal dalam hidup ini terkadang terlalu sulit untuk disembunyikan. Semakin disembunyikan semakin banyak persoalan yang dihadapi.', '1. Apa pendapat saudara tentang film ini? Bagaimana perasaan anda?\r\n2. Apakah film berakhir seperti yang saudara harapkan? Mengapa atau mengapa tidak?\r\n3. Menurut saudara mengapa wanita tersebut berusaha menyembunyikan gelang tersebut dari orang lain?\r\n4. Pernahkah saudara merasa perlu menyembunyikan sesuatu dari orang lain?\r\n5. Apa yang mungkin mewakili gelang dalam hidup saudara? ', 0, 0, 'admin', '2020-05-01 06:01:43', 1, 'CJ');
INSERT INTO `post` VALUES (8, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5007029794001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/903ba4a3-73b9-4cc5-b5ae-7249ae1d0405/5c16aa06-4c77-4db0-81a9-7ee12ce0df31/160x90/match/image.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Marea_1467208509.mov', 'PENGORBANAN', 'Seorang ayah bersama anaknya berupaya menyelamatkan sekelompok pengungsi yang tenggelam tanpa memikirkan untung rugi atau harga yang harus dibayar, sekalipun nyawa yang menjadi taruhannya.', '1. Bercerita tentang apakah Film ini? \r\n2. Karakter apa yang paling saudara sukai dalam film ini? Mengapa?\r\n3. Apakah saudara akan mempertaruhkan hidup anda untuk keluarga, sahabat, atau seseorang yang anda tidak kenal?\r\n4. Apa arti pengorbanan bagi saudara ?', 0, 0, 'admin', '2020-05-01 06:02:31', 1, 'CJ');
INSERT INTO `post` VALUES (9, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2955277188001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/f53cc7be-8475-432a-b292-4dcffa956f94/b9d52318-badc-40d3-929f-90c27706a5bf/160x90/match/image.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Vinyl_1387551306.m4v', 'PEREKAM SUARA', '', '1. Apakah pendapat Anda akan cerita film ini ? Berikan satu kata yang muncul di benak Anda saat Anda ingat film ini ? 2. Mengapa ia begitu mementingkan rekor satu-satunya ?\r\n3. Mengapa kehilangan sesuatu atau kehilangan arah akan menimbulkan rasa panik ?\r\n4. Apakah Anda pernah kehilangan sesuatu dimana Anda akan mengadakan pesta jika Anda mendapatkannya kembali ?\r\n5. Jika Anda kehilangan arah, bagaimana rasanya jika seseorang mencari Anda dalam keadaan ini ?\r\n6. Pernahkah Anda merasa bahwa Allah sedang mencari Anda ? Mungkin sebagai contoh, ada hal yang Anda tahu tidak mungkin terjadi secara kebetulan. Seperti apakah rasanya ?', 0, 0, 'admin', '2020-05-01 06:03:18', 1, 'CJ');
INSERT INTO `post` VALUES (10, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2940597144001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/28a49951-bef8-4601-b859-7bf2dcbc631c/fccd421b-af59-4b98-a5c0-b885b28482f6/160x90/match/image.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Dying-Roads_1387232102.mp4', 'JALAN-JALAN YANG MATI', '', '1. Apa yang telah orang lakukan ketika mereka melihat lelaki di atas tanah ?\r\n2. Mengapa Anda berpendapat bahwa tidak seorang yang berhenti untuk menolong ? Menurut pendapat Anda apakah yang telah mereka pikirkan ?\r\n 3. Jikalau Anda pengusaha, akankah Anda berhenti untuk menolong lelaki yang terluka itu ?\r\n 4. Jikalau Anda lelaki yang menggunakan kursi roda, akankah Anda menolong lelaki yang terluka itu ?\r\n 5. Pernahkah Anda menolong seseorang dan hal itu membebankan Anda ? (waktu, pengorbanan, kenyamanan, uang dan lain-lain). Jikalau begitu, bagaimanakah rasanya bagi Anda ?', 0, 0, 'admin', '2020-05-01 06:04:04', 1, 'CJ');
INSERT INTO `post` VALUES (11, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6144992524001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_Breathe-0-0.thumbnail.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Breathe.mp4', 'BREATHE', 'Seorang wanita muda terbangun menderita karena serangan asma, dan dengan panik mencari obat saat dia perlahan kehabisan udara.', '1. Apakah pendapat saudara tentang kisah dalam video ini ? ?\r\n2. Apa yang saudara pikirkan tentang putus asa yang kita hadapi saat ini?\r\n3. Adakah situasi kehidupan yang menakutkan bagi saudara? Jika ya, mengapa?\r\n4. Pernahkah saudara melihat orang yang kehidupannya tampaknya di luar kendali? \r\n5. Apa arti penguasaan diri bagi saudara?\r\nApakah yang saudara sukai dari hidup? Bagaimana kehidupan saudara, apakah itu penting ?', 0, 0, 'admin', '2020-05-01 06:05:21', 1, 'CJ');
INSERT INTO `post` VALUES (12, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6005019427001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_0-Uninvited.thumbnail.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Uninvited.mp4', 'UNINVITES GUEST', 'Setiap orang memiliki sesuatu di masa lalu yang menghantui mereka. Masalah Phil adalah bahwa ia memiliki banyak hal itu, dan itu mengepungnya,  Kesalahan, pilihan bodoh, dan tragedi masa lalunya tidak akan membiarkannya lolos begitu saja. Film ini menunjukkan betapa sulitnya melupakan masa lalu dan meninggalkannya, hal itu mengingatkan kita akan kebutuhan sebuah pengampunan dan pemulihan – betapa pun buruknya masa lalu kita.', '1.Apa yang saudara sukai dari film ini?\r\n2. Apa yang tidak saudara sukai ?\r\nJika dua orang dari masa lalu saudara tiba-tiba muncul di sebuah ruangan bersama, \r\n3. siapa yang paling menarik?\r\nSiapa dari masa lalu saudara yang paling terkejut dengan kehidupan saudara sekarang?', 0, 0, 'admin', '2020-05-01 06:06:24', 1, 'CJ');
INSERT INTO `post` VALUES (13, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6059920385001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_BMe-0-0.thumbnail.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-BMe.mp4', 'B ME', 'Jika saudara secara ajaib dapat menjadi orang yang berbeda, maukah saudara? Dalam film pendek ini, Jane, seorang wanita muda yang merasa tidak mampu menghadapi tantangan hidup, menemukan “B Me,” sebuah aplikasi telepon yang dapat mengubah identitas agar sesuai dengan situasi apa pun. Tetapi ketika Jane semakin bergantung pada aplikasi untuk menavigasi jalan hidupnya, ia menemukan konsekuensi berbahaya dan mengerikan. Film pendek dari Broken Phonebooth Productions ini mengajukan pertanyaan, “Bagaimana kita mengetahui identitas diri kita?”', '1. Apa yang saudara sukai dari film ini? Apa yang tidak disukai?\r\n2. Jika saudara salah satu orang di aplikasi yang akan dipilih, saudara akan menjadi yang mana ?\r\n3. Bagaimana reaksi ayah yang pengasih ketika melihat putrinya melakukan semua upaya untuk diterima?', 0, 0, 'admin', '2020-05-01 06:07:27', 1, 'CJ');
INSERT INTO `post` VALUES (14, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5478943725001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_0-Portions.thumbnail.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Portions.mp4', 'PORTIONS', 'Seorang wanita dengan pilihan terbatas menemukan banyak yang dapat menjadi miliknya. Untuk informasi lebih lanjut tentang film ini, kunjungi: http://www.mideastwomen.org/portions/', '1. Karakter utama dihadapkan dengan pilihan pada akhirnya. Apa yang dikatakan film ini kepada saudara tentang “pilihan” yang dihadapi wanita?\r\n2. Apakah yang dilambangkan dalam adegan taman untuk saudara?\r\n3. Bagaimana film ini menantang saudara dalam memilih ?\r\nSebagai wanita, kita sering kurang puas. 4. Bagaimana saudara dapat bergerak menuju kehidupan yang berkelimpahan? Bagaimana saudara dapat meraih porsi yang lebih besar?', 0, 0, 'admin', '2020-05-01 06:08:57', 1, 'CJ');
INSERT INTO `post` VALUES (15, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6030345810001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_0-Legion.thumbnail.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Legion.mp4', 'LEGION', 'Disampaikan dengan kuasa, ini adalah kisah Alkitab yang terkenal tentang Yesus yang menyembuhkan seseorang dengan mengusir setan.', '1. Apa yang saudara pikirkan tentang ceritanya? \r\n2. Bagaimana perasaanmu?\r\nKeadaan apa yang menyebabkan orang merasa tertekan atau kewalahan oleh hal-hal di luar kendali mereka? \r\n3. Pernahkah saudara merasakan hal ini?\r\n4. Menurut Anda, apa pandangan Yesus tentang pria di gua?\r\n5. Bagaimana Yesus menyelamatkan orang ini dari kehidupan tanpa harapan? Dapatkah DIA melakukannya untukmu?', 0, 0, 'admin', '2020-05-01 06:10:34', 1, 'CJ');

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
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (14, 'admin', 'admin', 'a9bdd47d7321d4089b3b00561c9c621848bd6f6e2f745a53d54913d613789c23945b66de6ded1eb336a7d526f9349a9d964d6f6c3a40e2ac90b4b16c0121f7895Xg53McbkyQ/NmW60Sf4cu3wJsi/8cyZXxeXV7g6b04=', 'mnl', '0000-00-00 00:00:00', 1, '', b'1', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `users` VALUES (43, 'operator', 'Operator', 'a9bdd47d7321d4089b3b00561c9c621848bd6f6e2f745a53d54913d613789c23945b66de6ded1eb336a7d526f9349a9d964d6f6c3a40e2ac90b4b16c0121f7895Xg53McbkyQ/NmW60Sf4cu3wJsi/8cyZXxeXV7g6b04=', '', '2020-04-26 10:11:27', 0, '', b'0', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
