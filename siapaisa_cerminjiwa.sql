/*
 Navicat Premium Data Transfer

 Source Server         : siapaisa.com
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : siapaisa.com:3306
 Source Schema         : siapaisa_cerminjiwa

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 04/06/2020 12:31:54
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inbox
-- ----------------------------
INSERT INTO `inbox` VALUES (1, 'adji142', 'ecc4a28f60e61b76', '2020-05-10 11:45:07', 'hai saya bertanya yaa', b'1');
INSERT INTO `inbox` VALUES (2, 'adji142', 'ecc4a28f60e61b76', '2020-05-10 11:46:16', 'trimakasih', b'1');
INSERT INTO `inbox` VALUES (3, 'adji142', 'ecc4a28f60e61b76', '2020-05-10 11:46:21', 'saya spam yaa', b'1');
INSERT INTO `inbox` VALUES (4, 'adji142', 'ecc4a28f60e61b76', '2020-05-10 11:46:24', 'gapapa kan ?', b'1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of outbox
-- ----------------------------
INSERT INTO `outbox` VALUES (1, 'adji142', 'XX', '2020-05-10 11:45:33', 'iyaa saya akan jawab', b'1', 'admin');
INSERT INTO `outbox` VALUES (2, 'adji142', 'XX', '2020-05-10 11:46:42', 'ohh iya silahkan', b'1', 'admin');
INSERT INTO `outbox` VALUES (3, 'adji142', 'XX', '2020-05-10 11:46:47', 'saya juga spam', b'1', 'admin');
INSERT INTO `outbox` VALUES (4, 'adji142', 'XX', '2020-05-10 11:47:15', 'tambah 1 fungsi clear', b'1', 'admin');
INSERT INTO `outbox` VALUES (5, 'adji142', 'XX', '2020-05-10 11:47:21', 'okee work', b'1', 'admin');

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
INSERT INTO `permission` VALUES (1, 'User List', 'users', 'icon-qrcode', '0', b'0', b'0', 1, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (2, 'Post', 'post', 'icon-copy', '0', b'0', b'0', 2, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (3, 'Feedback User', 'chat', 'icon-comments-alt', '0', b'0', b'0', 3, b'1', NULL, NULL, NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of playlist
-- ----------------------------

-- ----------------------------
-- Table structure for playlistdetail
-- ----------------------------
DROP TABLE IF EXISTS `playlistdetail`;
CREATE TABLE `playlistdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headerID` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `lineNum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of playlistdetail
-- ----------------------------
INSERT INTO `playlistdetail` VALUES (2, 1, 2, 0);
INSERT INTO `playlistdetail` VALUES (3, 2, 2, 0);
INSERT INTO `playlistdetail` VALUES (4, 2, 1, 0);
INSERT INTO `playlistdetail` VALUES (6, 3, 3, 0);
INSERT INTO `playlistdetail` VALUES (7, 3, 5, 0);
INSERT INTO `playlistdetail` VALUES (10, 1, 3, 0);
INSERT INTO `playlistdetail` VALUES (11, 4, 1, 0);
INSERT INTO `playlistdetail` VALUES (12, 5, 2, 0);
INSERT INTO `playlistdetail` VALUES (13, 5, 1, 0);

-- ----------------------------
-- Table structure for playlistheader
-- ----------------------------
DROP TABLE IF EXISTS `playlistheader`;
CREATE TABLE `playlistheader`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PlaylistName` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CreatedDate` datetime(0) NOT NULL,
  `KodeUser` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DeviceID` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TotalPost` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of playlistheader
-- ----------------------------
INSERT INTO `playlistheader` VALUES (1, 'playlist 1', '2020-06-02 04:02:29', 'adji142', '2fc40edab67abf76', 2);
INSERT INTO `playlistheader` VALUES (2, 'contoh', '2020-06-02 05:10:59', 'bayu04', '85967317a6d7ee0d', 2);
INSERT INTO `playlistheader` VALUES (3, 'coba1', '2020-06-02 05:22:14', 'bayu04', '85967317a6d7ee0d', 2);
INSERT INTO `playlistheader` VALUES (4, 'pl 1', '2020-06-02 08:43:47', '', '2fc40edab67abf76', 1);
INSERT INTO `playlistheader` VALUES (5, 'coba', '2020-06-02 09:13:49', '', '85967317a6d7ee0d', 2);

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
  `PostLink` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Folder` int(5) NULL DEFAULT NULL COMMENT '1 : Mujizat Isa\r\n2: Pengajaran Isa\r\n3: Kehidupan Isa',
  `OflineVideo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `OfflineTokenid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5997454539001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_Delight-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Delight.mov', 'KESENANGAN', '<span>Seorang Koki Pastry bekerja keras untuk memberikan sentuhan akhir pada kue yang indah dan elegan, kemudian ia memberikannya kepada anaknya yang masih kecil dengan harapan anaknya tertarik untuk menikmatinya. Tetapi anaknya yang masih kecil itu justru menghancurkan dan menjadikan kue tersebut sebagai barang mainan baginya</span>', '<ol><li>Bagaimanakah response sang koki Pastry saat anak gadisnya yang masih kecil itu menghancurkan kue tersebut dan menjadikan sebagai bahan mainan baginya ?</li><br><li>dapatkah saudara membayangkan bahwa orang tua saudara begitu senang dan bahagianya saat saudara masih kecil ? menurut saudara seperti apakah itu ?</li><br></ol>', 0, 0, 'admin', '2020-06-03 07:29:34', 1, 'CJ', 'https://www.youtube.com/watch?v=DMVKFl5rcUg', 'https://www.cerminjiwa.com/portfolio-item/kesenangan/', NULL, 'http://apps.siapaisa.com/localVideo/KESENANGAN.mp4', NULL);
INSERT INTO `post` VALUES (2, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2940493342001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/50c42104-3876-49b1-abf0-9757f7b26bcb/c9ad1e16-ba25-41d1-92da-6ad8d0993f14/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/50c42104-3876-49b1-abf0-9757f7b26bcb/8cd1e96b-8a40-4b53-b8cb-c33a6dcd97c0/main.mp4?fastly_token=NWVhZDdjMTlfMDY1OGY1YWIxYTdhNmQyODFmMTYzNzdlOTQxYWJjYTkxZTQxMTdjOTVhNzcxNDNhMzE4MzExMDFhYTBkZWM2OF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS81MGM0MjEwNC0zODc2LTQ5YjEtYWJmMC05NzU3ZjdiMjZiY2IvOGNkMWU5NmItOGE0MC00YjUzLWI4Y2ItYzMzYTZkY2Q5N2MwL21haW4ubXA0', 'ALIRAN AIR', 'Sumber air bisa menjadi misteri bagi sebagian orang.', '<ol><li>Menurut saudara apa arti dari sumber-sumber air (air dari wastafel &amp; air toilet) dalam film tersebut?</li><br><li><span>Menurut saudara, mengapa pria tersebut menggunakan air toilet daripada air dari wastafel dapur?</span></li><br><li><span>Secara metaforis, pernakah saudara melihat orang minum air toilet? Menurut saudara apa motivasi pilihan mereka untuk minum air toilet?</span></li><br><li><span>Bagaimana saudara mendapatkan teman untuk melihat bahwa mereka minum air yang tidak sehat, ketika sumber air yang sehat tersedia?</span></li><br></ol>', 0, 0, 'admin', '2020-06-03 07:37:30', 1, 'CJ', 'https://www.youtube.com/watch?v=5WtxPlko1Sk', 'https://www.cerminjiwa.com/portfolio-item/aliran-air/', NULL, 'http://apps.siapaisa.com/localVideo/ALIRAN AIR.mp4', NULL);
INSERT INTO `post` VALUES (3, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2923814892001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/2caaef2b-db98-40e9-b725-bab234c6d00a/b60f0391-e781-4743-aadb-39a916d705b3/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/2caaef2b-db98-40e9-b725-bab234c6d00a/3fb1ffcc-20b7-4454-a2f5-5c99bf75d6c4/main.mp4?fastly_token=NWVhZDgwMzZfN2QxMmU2NDNmODJiNWEzZGM1MTQ5ZTZlMTJkM2Y3MDg1OTU0NGExZDQzYjVhZGRjZTg1OWQ0MTJkNTBiNjAwM18vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS8yY2FhZWYyYi1kYjk4LTQwZTktYjcyNS1iYWIyMzRjNmQwMGEvM2ZiMWZmY2MtMjBiNy00NDU0LWEyZjUtNWM5OWJmNzVkNmM0L21haW4ubXA0', 'WAJAH BULAT', 'Sebuah sindiran singkat tentang konsep kecantikan, dimana seseorang yang tidak pernah puas dengan apa yang ada pada dirinya karena selalu memaksakan diri untuk mengikuti perkembangan “trend” yang pada akhirnya menghancurkan dirinya sendiri.', '<ol><li>Apa yang membuat seseorang merasa tidak puas?</li><br><li><span>Apa dan siapa yang menekan saudara untuk dapat mengubah diri saudara? Mengapa?</span></li><br><li><span>Apakah ada hal-hal yang memberi saudara kebebasan dari harapan hidup?</span></li><br><li><span>Apa tujuan dan untuk siapakah saudara hidup di dunia ini?</span></li><br></ol>', 0, 0, 'admin', '2020-06-03 07:37:37', 1, 'CJ', 'https://www.youtube.com/watch?v=6Yh3XB-ifPA', 'https://www.cerminjiwa.com/portfolio-item/wajah-bulat/', NULL, 'http://apps.siapaisa.com/localVideo/WAJAH BULAT.mp4', NULL);
INSERT INTO `post` VALUES (4, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5007029795001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/38bfc112-887f-467c-b25c-f5f4dbd68053/e7a3f439-a6c4-4e64-aefa-b2b9bde93a29/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/38bfc112-887f-467c-b25c-f5f4dbd68053/383de554-ca82-4b50-8bd3-f4d805afaa87/main.mp4?fastly_token=NWVhZDgwM2RfOTVjY2I1MDdhZTcwMjZlZmVmNTIxZjkyOGEwNzE3NWJhOWVjMDljYmQ5ZDNkNjI4NjZiZmMzYzZlZTE0YzJiMF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS8zOGJmYzExMi04ODdmLTQ2N2MtYjI1Yy1mNWY0ZGJkNjgwNTMvMzgzZGU1NTQtY2E4Mi00YjUwLThiZDMtZjRkODA1YWZhYTg3L21haW4ubXA0', 'TERABAIKAN', 'Kisah seorang tunawisma yang mengalami penolakan untuk kebaikan yang dilakukannya.', '<ol><li>Apa yang anda pikirkan tentang film ini?</li><br><li><span>Menurut saudara mengapa gadis kecil dalam film ini satu-satunya yang memperhatikan seorang tunawisma itu sementara yang lainnya mengabaikannya?</span></li><br><li><span>Pernahkah saudara merasa telah berbuat baik tetapi tidak terlihat orang lain?</span></li><br></ol>', 0, 0, 'admin', '2020-06-03 07:37:44', 1, 'CJ', 'https://www.youtube.com/watch?v=5eLvHtIWKBE', 'https://www.cerminjiwa.com/portfolio-item/terabaikan/', NULL, 'http://apps.siapaisa.com/localVideo/TERABAIKAN.mp4', NULL);
INSERT INTO `post` VALUES (5, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/1932122741001', 'http://brightcove04.o.brightcove.com/1226740748001/1226740748001_4370919339001_2-0-La-Busqueda-The-Search-videoStill.jpg?pubId=1226740748001&videoId=1932122741001', 'http://f1.media.brightcove.com/12/1226740748001/1226740748001_5709674570001_1932122741001.mp4?pubId=1226740748001&videoId=1932122741001', 'PENCARIAN', 'Dikisahkan ada seorang ayah yang selalu merindukan kehadiran putrinya, yang kini sudah beranjak dewasa dan tidak lagi bersama-sama dengannya. Teringat baginya, ketika dia bersama-sama putrinya bermain telpon-telponan dengan menggunakan kaleng-kaleng bekas, dan berbicara satu sama lain. Kini putri kecil itu telah bertumbuh dewasa dan oleh karena suatu persoalan, dia memutuskan untuk meninggalkan ayahnya dan menjalani kehidupannya sendiri Sang ayah ingin merajut kembali hubungan mereka yang telah rusak dan membut kaleng lagi, mengikatnya pada layang-layang berwarna merah yang indah, ia mengirimnya kepada anaknya dengan melayangkannya ke udara. Dan kaleng-kaleng tersebut mendarat di Apartemen putrinya dan mereka berusaha mencoba berkomunikasi satu sama lain. Tetapi sulit bagi mereka untuk mendengar dari kejauhan. Sampai ada akhirnya sang anak memutuskan untuk pulang dan berjumpa dengan ayahnya yang telah menunggunya dan menyambutnya dengan senyuman di halte bus, tetapi anaknya memutuskan untuk kembali lagi ke dalam bus dan meninggalkan ayahnya karena ada kaleng-kaleng lain ditempat kursinya.', '<span><ol><li>Apakah yang terjadi dengan sang gadis dalam film tersebut ketika ia memutuskan untuk keluar dari rumah dan meninggalkan ayahnya?</li><br><li><span>Apakah yang diinginkan oleh sang gadis tersebut pada akhirnya? Munurut saudara apa yang mencegahnya turun dari bus dan menjumpai ayahnya?</span></li><br><li><span>Pernahkah saudara ingin berdamai dengan seseorang tetapi tidak bisa?</span></li><br><li><span>Menurut saudara bagaimanakah caranya merajut kembali suatu hubungan yang telah rusak dengan orang-orang yang saudara kenal?</span></li><br></ol></span>', 0, 0, 'admin', '2020-06-03 07:15:33', 1, 'CJ', 'https://www.youtube.com/watch?v=n11Ss40odWE', 'https://www.cerminjiwa.com/portfolio-item/pencarian/', NULL, 'http://apps.siapaisa.com/localVideo/PENCARIAN.mp4', NULL);
INSERT INTO `post` VALUES (6, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2151777408001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/eacc4d74-13db-42d6-a3ac-d5c42223f9ea/b27b806b-bf5c-46f4-8354-dca8f1f46330/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/eacc4d74-13db-42d6-a3ac-d5c42223f9ea/c1755936-0d98-4253-bcb9-a031283c5a6e/main.mp4?fastly_token=NWVhZDdlNGNfZTBhMjg0YWFiMTk1Yjc1NzljNzZmNzk3NmExYTQ4NDc0YmIyOWJiZTQxYWRmN2JhODcwYzMyZDk5ZTA4YTAwNF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS9lYWNjNGQ3NC0xM2RiLTQyZDYtYTNhYy1kNWM0MjIyM2Y5ZWEvYzE3NTU5MzYtMGQ5OC00MjUzLWJjYjktYTAzMTI4M2M1YTZlL21haW4ubXA0', 'DALAM KEBEBASAN', 'Seorang pria meringkuk di dalam sebuah kubus abu-abu yang tak berjendela dan berpintu. Tiba-tiba ia mendengar suara “Kebebasan!” dan sebuah tanda dimasukkan melalui sebuah celah di dinding, yang bertuliskan: Kebebasan.\r\nDalam kebingungannya, ada tangan menjulur dari sebuah slot, mengambil tanda dan memutarnya ke bawah lalu memberikan kembali kepada lelaki itu. Ia mengikuti tanda itu lalu menyingkirkan karpetnya lalu terbentanglah rumput yang segar. Dia merendahkan lampu dan menemukan cahaya suci yang menyinari selnya. Akhirnya, ia merobek beberapa kertas di dinding dan dan terciptalah sebuah pintu. Ia melangkah keluar dan bebas dari selnya yang hancur.\r\nDi suatu tempat yang jauh, seseorang berteriak, “Kebebasan!” Lalu sang pria berlari ke arahnya dan menemukan sebuah lapangan yang penuh dengan sel abu-abu. Ia tersenyum pada dirinya, lalu mengambil tandanya dan berlari ke arah yang terdekat untuk juga menolong mereka yang sedang terpenjara.', '<ol><li>Siapa yang memberi orang tersebut kebebasan?</li><br><li><span>Mengapa dia dengan senang hati membantu orang lain mendapatkan kebebasan mereka?</span></li><br><li><span>Apakah artinya benar-benar bebas?</span></li><br><li><span>Sudahkah saudara mengalami kebebasan semacam ini dan bagaimana saudara dapat membantu orang lain menemukannya?</span></li><br></ol>', 0, 0, 'admin', '2020-05-13 11:57:58', 1, 'CJ', 'https://www.youtube.com/watch?v=zJDDNSJJCAA', 'https://www.cerminjiwa.com/portfolio-item/dalam-kebebasan/', NULL, 'http://apps.siapaisa.com/localVideo/dalamkebebasan.mp4', NULL);
INSERT INTO `post` VALUES (7, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5219412089001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/75de325d-9d7c-44de-a9be-3de3ec5514a8/7007f0e9-289c-4e67-ae1d-b7fc937eb7c3/480x270/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/75de325d-9d7c-44de-a9be-3de3ec5514a8/3f28e9e7-ba91-4afe-adb1-3189875dcbc0/main.mp4?fastly_token=NWVhZDgxNzFfZmFiNzNiNWU2MDViOGNhNmI2NDE2NzEyOTdlZDVmZDc0YzE1MjQwMDU2NTQ0MzA2NDhhOTdlZGJiYTUzNzRlMl8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS83NWRlMzI1ZC05ZDdjLTQ0ZGUtYTliZS0zZGUzZWM1NTE0YTgvM2YyOGU5ZTctYmE5MS00YWZlLWFkYjEtMzE4OTg3NWRjYmMwL21haW4ubXA0', 'KEJUTAN', 'Kisah seorang wanita yang mengambil dan sebuah gelang antik dalam pagelaran karya seni dan menyembunyikannya. Awalnya ia merasa senang dan bangga menggunakan gelang tersebut tetapi lambat laun menjadi malapetaka baginya karena gelang tersebut diluar kendalinya semakin hari semakin berlipatganda jumlahnya dan memenuhi hampir seluruh lengannya. Wanita itu merasa ketakutan dan bersalah atas perbuatannya menyembunyikan gelang hasil curian tersebut. Ia berusaha dengan segala cara untuk melepaskan dari tangannya namun tidak bisa. Beberapa hal dalam hidup ini terkadang terlalu sulit untuk disembunyikan. Semakin disembunyikan semakin banyak persoalan yang dihadapi.', '<ol><li>Apa pendapat saudara tentang film ini?&nbsp;Bagaimana perasaan anda?</li><br><li><span>Apakah film berakhir seperti yang saudara harapkan?&nbsp;Mengapa atau mengapa tidak?</span></li><br><li><span>Menurut saudara mengapa wanita tersebut berusaha menyembunyikan gelang tersebut dari orang lain?</span></li><br><li><span>Pernahkah saudara merasa perlu menyembunyikan sesuatu dari orang lain?</span></li><br><li><span>Apa yang mungkin mewakili gelang dalam hidup saudara?&nbsp;</span></li><br></ol>', 0, 0, 'admin', '2020-05-13 11:59:09', 1, 'CJ', 'https://www.youtube.com/watch?v=zJDDNSJJCAA', 'https://www.cerminjiwa.com/portfolio-item/kejutan/', NULL, 'http://apps.siapaisa.com/localVideo/kejutan.mp4', NULL);
INSERT INTO `post` VALUES (8, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5007029794001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/903ba4a3-73b9-4cc5-b5ae-7249ae1d0405/193c3277-dea8-4b97-bb36-24612c79d446/1280x720/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/903ba4a3-73b9-4cc5-b5ae-7249ae1d0405/074b7723-3ff7-4fc3-8a5d-7c7a5b0e1c37/main.mp4?fastly_token=NWVhZDgwODlfYTQzMWY4ZmQwYzIxYjc3OGY1M2QyNDE2OWJmNTg1ZDgyN2ViYWFlNDlkZmI2OTliMGI0YjQ3NzQ0MjMyYjZjN18vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS85MDNiYTRhMy03M2I5LTRjYzUtYjVhZS03MjQ5YWUxZDA0MDUvMDc0Yjc3MjMtM2ZmNy00ZmMzLThhNWQtN2M3YTViMGUxYzM3L21haW4ubXA0', 'PENGORBANAN', 'Seorang ayah bersama anaknya berupaya menyelamatkan sekelompok pengungsi yang tenggelam tanpa memikirkan untung rugi atau harga yang harus dibayar, sekalipun nyawa yang menjadi taruhannya.', '<ol><li>Bercerita tentang apakah Film ini?</li><br><li>Karakter apa yang paling saudara sukai dalam film ini? Mengapa?</li><br><li>Apakah saudara akan mempertaruhkan hidup anda untuk keluarga, sahabat, atau seseorang yang anda tidak kenal?</li><br><li>Apa arti pengorbanan bagi saudara ?</li><br></ol>', 0, 0, 'admin', '2020-05-13 12:00:00', 1, 'CJ', 'https://www.youtube.com/watch?v=Ifj94qAtORo', 'https://www.cerminjiwa.com/portfolio-item/pengorbanan/', NULL, 'http://apps.siapaisa.com/localVideo/pengorbanan.mp4', NULL);
INSERT INTO `post` VALUES (9, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2955277188001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/f53cc7be-8475-432a-b292-4dcffa956f94/13352e2c-d4ca-4271-a9bd-ab2e85909f40/1280x720/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/f53cc7be-8475-432a-b292-4dcffa956f94/ab9086c7-417a-470c-8e4f-748727890e27/main.mp4?fastly_token=NWVhZDgxM2NfMWMwYTU4MjU2OGU1MTQzZDczNTdiZmEyN2EyNjZiMjcxNWZjMjljMjM5NGZmMjlhODIyZjQxNDllMDE2N2UwOF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS9mNTNjYzdiZS04NDc1LTQzMmEtYjI5Mi00ZGNmZmE5NTZmOTQvYWI5MDg2YzctNDE3YS00NzBjLThlNGYtNzQ4NzI3ODkwZTI3L21haW4ubXA0', 'PEREKAM SUARA', '', '<ol><li>Apakah pendapat Anda akan cerita film ini ? Berikan satu kata yang muncul di benak Anda saat Anda ingat film ini ?</li><br><li>Mengapa ia begitu mementingkan rekor satu-satunya ?</li><br><li>Mengapa kehilangan sesuatu atau kehilangan arah akan menimbulkan rasa panik ?</li><br><li>Apakah Anda pernah kehilangan sesuatu dimana Anda akan mengadakan pesta jika Anda mendapatkannya kembali ?</li><br><li>Jika Anda kehilangan arah, bagaimana rasanya jika seseorang mencari Anda dalam keadaan ini ?</li><br><li>Pernahkah Anda merasa bahwa Allah sedang mencari Anda ? Mungkin sebagai contoh, ada hal yang Anda tahu tidak mungkin terjadi secara kebetulan. Seperti apakah rasanya ?</li><br></ol>', 0, 0, 'admin', '2020-05-13 12:00:41', 1, 'CJ', 'https://www.youtube.com/watch?v=hS2LeBkxK5s', 'https://www.cerminjiwa.com/portfolio-item/perekam-suara/', NULL, 'http://apps.siapaisa.com/localVideo/perekamsuara.mp4', NULL);
INSERT INTO `post` VALUES (10, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/2940597144001', 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/1226740748001/28a49951-bef8-4601-b859-7bf2dcbc631c/58380bde-03ca-46ee-932f-45e8658e3dd9/1280x720/match/image.jpg', 'http://house-fastly-signed-us-east-1-prod.brightcovecdn.com/media/v1/pmp4/static/clear/1226740748001/28a49951-bef8-4601-b859-7bf2dcbc631c/5210ffee-5f4b-404d-bac7-2f4b03341f7a/main.mp4?fastly_token=NWVhZDgyMjNfZDEwODk4YWFlY2YxMWU5MTU3OTllMTU2NzYyMjUzOTQ2N2RhZGEyYTYxNTg5NTlhNmY0ZTU5M2ExMDM4Y2UyMF8vL2hvdXNlLWZhc3RseS1zaWduZWQtdXMtZWFzdC0xLXByb2QuYnJpZ2h0Y292ZWNkbi5jb20vbWVkaWEvdjEvcG1wNC9zdGF0aWMvY2xlYXIvMTIyNjc0MDc0ODAwMS8yOGE0OTk1MS1iZWY4LTQ2MDEtYjg1OS03YmYyZGNiYzYzMWMvNTIxMGZmZWUtNWY0Yi00MDRkLWJhYzctMmY0YjAzMzQxZjdhL21haW4ubXA0', 'JALAN-JALAN YANG MATI', '', '<ol><li>Apa yang telah orang lakukan ketika mereka melihat lelaki di atas tanah ?</li><br><li>Mengapa Anda berpendapat bahwa tidak seorang yang berhenti untuk menolong ? Menurut pendapat Anda apakah yang telah mereka pikirkan ?</li><br><li>Jikalau Anda pengusaha, akankah Anda berhenti untuk menolong lelaki yang terluka itu ?</li><br><li>\r\n&nbsp;Jikalau Anda lelaki yang menggunakan kursi roda, akankah Anda menolong lelaki yang terluka itu ?</li><br><li>\r\n&nbsp;Pernahkah Anda menolong seseorang dan hal itu membebankan Anda ? (waktu, pengorbanan, kenyamanan, uang dan lain-lain). Jikalau begitu, bagaimanakah rasanya bagi Anda ?</li><br></ol>', 0, 0, 'admin', '2020-05-13 12:01:19', 1, 'CJ', 'https://www.youtube.com/watch?v=8zT6W8f42ak', 'https://www.cerminjiwa.com/portfolio-item/jalan-jalan-yang-mati/', NULL, 'http://apps.siapaisa.com/localVideo/jalan-jalanyangmati.mp4', NULL);
INSERT INTO `post` VALUES (11, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6144992524001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_Breathe-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Breathe.mp4', 'BREATHE', 'Seorang wanita muda terbangun menderita karena serangan asma, dan dengan panik mencari obat saat dia perlahan kehabisan udara.', '<ol><li>Apakah pendapat saudara tentang kisah dalam video ini ? ?</li><br><li>Apa yang saudara pikirkan tentang putus asa yang kita hadapi saat ini?</li><br><li>Adakah situasi kehidupan yang menakutkan bagi saudara? Jika ya, mengapa?</li><br><li>Pernahkah saudara melihat orang yang kehidupannya tampaknya di luar kendali?</li><br><li> &nbsp;Apa arti penguasaan diri bagi saudara?\r\nApakah yang saudara sukai dari hidup? Bagaimana kehidupan saudara, apakah itu penting ?</li><br></ol>', 0, 0, 'admin', '2020-05-13 12:01:52', 1, 'CJ', 'https://www.youtube.com/watch?v=_T7P2YhnXnM', 'https://www.cerminjiwa.com/portfolio-item/breathe/', NULL, 'http://apps.siapaisa.com/localVideo/breathe.mp4', NULL);
INSERT INTO `post` VALUES (12, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6005019427001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_0-Uninvited.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-Uninvited.mp4', 'UNINVITES GUEST', 'Setiap orang memiliki sesuatu di masa lalu yang menghantui mereka. Masalah Phil adalah bahwa ia memiliki banyak hal itu, dan itu mengepungnya,  Kesalahan, pilihan bodoh, dan tragedi masa lalunya tidak akan membiarkannya lolos begitu saja. Film ini menunjukkan betapa sulitnya melupakan masa lalu dan meninggalkannya, hal itu mengingatkan kita akan kebutuhan sebuah pengampunan dan pemulihan – betapa pun buruknya masa lalu kita.', '<ol><li>Apa yang saudara sukai dari film ini?&nbsp;</li><br><li>Apa yang tidak saudara sukai ?\r\nJika dua orang dari masa lalu saudara tiba-tiba muncul di sebuah ruangan bersama,&nbsp;</li><br><li>siapa yang paling menarik?\r\nSiapa dari masa lalu saudara yang paling terkejut dengan kehidupan saudara sekarang?</li><br></ol>', 0, 0, 'admin', '2020-05-13 12:02:15', 1, 'CJ', 'https://www.youtube.com/watch?v=esrfI310JC8', 'https://www.cerminjiwa.com/portfolio-item/uninvites-guest/', NULL, 'http://apps.siapaisa.com/localVideo/uninvitesguest.mp4', NULL);
INSERT INTO `post` VALUES (13, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/6059920385001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_BMe-0-0.videoStill.jpg', 'https://arclight-media-prod.s3.amazonaws.com/input/529/GSFN_529-0-BMe.mp4', 'B ME', 'Jika saudara secara ajaib dapat menjadi orang yang berbeda, maukah saudara? Dalam film pendek ini, Jane, seorang wanita muda yang merasa tidak mampu menghadapi tantangan hidup, menemukan “B Me,” sebuah aplikasi telepon yang dapat mengubah identitas agar sesuai dengan situasi apa pun. Tetapi ketika Jane semakin bergantung pada aplikasi untuk menavigasi jalan hidupnya, ia menemukan konsekuensi berbahaya dan mengerikan. Film pendek dari Broken Phonebooth Productions ini mengajukan pertanyaan, “Bagaimana kita mengetahui identitas diri kita?”', '<ol><li>Apa yang saudara sukai dari film ini? Apa yang tidak disukai?</li><br><li>Jika saudara salah satu orang di aplikasi yang akan dipilih, saudara akan menjadi yang mana ?</li><br><li>Bagaimana reaksi ayah yang pengasih ketika melihat putrinya melakukan semua upaya untuk diterima?</li><br></ol>', 0, 0, 'admin', '2020-05-13 12:02:47', 1, 'CJ', 'https://www.youtube.com/watch?v=Qa3d8P8F2BU', 'https://www.cerminjiwa.com/portfolio-item/b-me/', NULL, 'http://apps.siapaisa.com/localVideo/bme.mp4', NULL);
INSERT INTO `post` VALUES (14, 'https://edge.api.brightcove.com/playback/v1/accounts/1226740748001/videos/5478943725001', 'https://d1wl257kev7hsz.cloudfront.net/cinematics/2_0-Portions.videoStill.jpg', 'https://s3.amazonaws.com/arclight-media-prod/input/529/GSFN_529-0-Portions.mp4', 'PORTIONS', 'Seorang wanita dengan pilihan terbatas menemukan banyak yang dapat menjadi miliknya. Untuk informasi lebih lanjut tentang film ini, kunjungi: http://www.mideastwomen.org/portions/', '<ol><li>Karakter utama dihadapkan dengan pilihan pada akhirnya. Apa yang dikatakan film ini kepada saudara tentang “pilihan” yang dihadapi wanita?</li><br><li>Apakah yang dilambangkan dalam adegan taman untuk saudara?</li><br><li>Bagaimana film ini menantang saudara dalam memilih ?\r\nSebagai wanita, kita sering kurang puas.</li><br><li>Bagaimana saudara dapat bergerak menuju kehidupan yang berkelimpahan? Bagaimana saudara dapat meraih porsi yang lebih besar?</li><br></ol>', 0, 0, 'admin', '2020-05-13 12:03:12', 1, 'CJ', 'https://www.youtube.com/watch?v=2-TslgzLf18', 'https://www.cerminjiwa.com/portfolio-item/portions/', NULL, 'http://apps.siapaisa.com/localVideo/portions.mp4', NULL);
INSERT INTO `post` VALUES (32, '-', 'https://i.ytimg.com/vi/A47TpZAiA3A/hqdefault.jpg', '-', 'Isa Menyembuhkan pada hari sabat', '<span>Pada hari sabat, Saat Isa mengajar orang di rumah ibadat \r\nIsa menyembuhkan seorang wanita yang telah lumpuh selama 18 tahun.</span>', '', 0, 0, 'admin', '2020-06-03 07:50:32', 1, 'SI', 'https://www.youtube.com/watch?v=A47TpZAiA3A', 'https://siapaisa.com/mujizat', 1, 'http://apps.siapaisa.com/localVideo/IsaMenyembuhkanpadaharisabat.mp4', NULL);
INSERT INTO `post` VALUES (33, '-', 'https://i.ytimg.com/vi/UVkzyN8MVEY/hqdefault.jpg', '-', 'Isa Menyembuhkan Orang Buta', '<span>Ketika Isa berjalan bersama murid2 nya didalam kerumunan orang yang sedang beraktifitas,\r\nada seorang pria buta yang memanggil nama Isa, pria tersebut berkata, Isa anak Daud Kasihanilah saya</span>', '', 0, 0, 'admin', '2020-06-03 07:50:02', 1, 'SI', 'https://www.youtube.com/watch?v=UVkzyN8MVEY', 'https://siapaisa.com/mujizat', 1, 'http://apps.siapaisa.com/localVideo/IsaMenyembuhkanOrangButa.mp4', NULL);
INSERT INTO `post` VALUES (34, '-', 'https://i.ytimg.com/vi/fnEDDyEr0_Q/hqdefault.jpg', '-', 'Isa Memberi Makan 5000 Orang', '<span>Ketika Isa dan murid2 nya berjalan di Pedesaan, banyak sekali kerumuman orang yang mengikuti mereka\r\ndan menjelang malam Petrus berkata kepada Isa agar menyuruh kerumuman orang tersebut\r\npulang, supaya kerumunan orang tersebut bisa pergi ke desa-desa untuk mencari makanan dan penginapan\r\n\r\n\r\nkemudian Isa berkata kepada Petrus, bahwa Petrus lah yang harus memberi kerumunan orang tersebut makan\r\ntapi hanya ada 1 keranjang yang berisi 5 Roti dan 2 ikan\r\n\r\nIsa pun mengambil keranjang berisi 5 roti dan 2 ikan tersebut, dan melipatkan gandakan 5 Roti dan 2 ikan tersebut\r\ndan semua kerumunan orang tersebut bisa makan.</span>', '', 0, 0, 'admin', '2020-06-03 07:53:03', 1, 'SI', 'https://www.youtube.com/watch?v=fnEDDyEr0_Q', 'https://siapaisa.com/mujizat', 1, 'http://apps.siapaisa.com/localVideo/IsaMemberiMakan5000Orang.mp4', NULL);
INSERT INTO `post` VALUES (35, '-', 'https://i.ytimg.com/vi/Ogt1sWKshZ0/hqdefault.jpg', '-', 'Isa menenangkan Badai', '<span>Suatu hari, Isa naik perahu bersama murid2 nya, untuk pergi keseberang danau,\r\nsementara berlayar Isa Tertidur, lalu datanglah badai Besar,\r\nIsa dan murid2 nya begitu Ketakutan, lalu Murid-muridnya membangunkan Isa, dan Isa pun langsung bangun\r\ndan menghentikan Badai Tersebut, setelah badai tersebut berhenti, \r\nIsa berkata kepada murid-muridnya, dimanakah Imanmu ?</span>', '', 0, 0, 'admin', '2020-06-03 07:56:33', 1, 'SI', 'https://www.youtube.com/watch?v=Ogt1sWKshZ0', 'https://siapaisa.com/mujizat', 1, 'http://apps.siapaisa.com/localVideo/IsamenenangkanBadai.mp4', NULL);
INSERT INTO `post` VALUES (36, '-', 'https://i.ytimg.com/vi/FIr_yRtqEmE/hqdefault.jpg', '-', 'Penangkapan Ikan yang ajaib', '<span>Isa berkata kepada Petrus agar bertolak keseberang dan menebarkan jalanya\r\nuntuk menangkapan Ikan, Petrus pun taat kepada Perkataan Isa, lalu mengajak Yakub dan Yahya untuk pergi keseberang.\r\n\r\nsetelah tiba di seberang, mereka menebarkan Jala, lalu Jala tersebut pun terisi banyak sekali Ikan.</span>', '', 0, 0, 'admin', '2020-06-03 07:58:06', 1, 'SI', 'https://www.youtube.com/watch?v=FIr_yRtqEmE', 'https://siapaisa.com/mujizat', 1, 'http://apps.siapaisa.com/localVideo/PenangkapanIkanyangajaib.mp4', NULL);
INSERT INTO `post` VALUES (37, '-', 'https://i.ytimg.com/vi/2jncy_-dR9Y/hqdefault.jpg', '-', 'Celakalah mereka yang menyebabkan orang lain berbuat dosa', '<span>sambil berjalan, Isa berkata kepada murid-muridnya, tidak mungkin tidak ada penyesatan tapi celakalah yang mengadakannya.</span>', '', 0, 0, 'admin', '2020-06-03 08:01:34', 1, 'SI', 'https://www.youtube.com/watch?v=2jncy_-dR9Y', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/Celakalahmerekayangmenyebabkanoranglainberbuatdosa.mp4', NULL);
INSERT INTO `post` VALUES (38, '-', 'https://i.ytimg.com/vi/fzBDu7LZcIY/hqdefault.jpg', '-', 'Persembahan Janda', '<span>Makin banyak Ahli taurat dan orang farisi yang munafik yang dikecam oleh Isa, sehingga makin banyak bani israil yang menjadi pengikutnya, dan makin besar juga tantangan dari orang-orang yang dikecamnya.\r\n\r\nlalu di bait Allah, Isa melihat seorang janda miskin memberi persembahan 2 peser, lalu ada orang yang berkata, aku bisa memberi lebih, kemudian Isapun berkata dengan suara yang keras, bahwa Janda miskin tersebut memberi lebih banyak persembahan daripada yang lain, sebab yang lain telah memberi lebih dari kelimpahan mereka, akan tetapi janda tersebut memberikan semua yang ia miliki.</span>', '', 0, 0, 'admin', '2020-06-03 08:05:22', 1, 'SI', 'https://www.youtube.com/watch?v=fzBDu7LZcIY', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/PersembahanJanda.mp4', NULL);
INSERT INTO `post` VALUES (39, '-', 'https://i.ytimg.com/vi/I34R_8-v6Vk/hqdefault.jpg', '-', 'Pengajaran Kamar Atas', '<span>didalam Kamar, Isa mengajar Murid-muridnya.</span>', '', 0, 0, 'admin', '2020-06-03 08:08:11', 1, 'SI', 'https://www.youtube.com/watch?v=I34R_8-v6Vk', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/PengajaranKamarAtas.mp4', NULL);
INSERT INTO `post` VALUES (40, '-', 'https://i.ytimg.com/vi/rjgM9l5w98s/hqdefault.jpg', '-', 'Doa Bapa Kami', '<span>Isa mengajarkan Doa Bapa Kami kepada murid-muridnya.</span>', '', 0, 0, 'admin', '2020-06-03 08:09:55', 1, 'SI', 'https://www.youtube.com/watch?v=rjgM9l5w98s', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/DoaBapaKami.mp4', NULL);
INSERT INTO `post` VALUES (41, '-', 'https://i.ytimg.com/vi/bwwFGkAfR0o/hqdefault.jpg', '-', 'Kerajaan Tuhan sebagai Biji Sesawi', '<span>Isa mengajarkan Kerajaan Allah dengan Perumpamaan biji Sesawi.</span>', '', 0, 0, 'admin', '2020-06-03 08:11:12', 1, 'SI', 'https://www.youtube.com/watch?v=bwwFGkAfR0o', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/KerajaanTuhansebagaiBijiSesawi.mp4', NULL);
INSERT INTO `post` VALUES (42, '-', 'https://i.ytimg.com/vi/DxuoqI9eHZo/hqdefault.jpg', '-', 'Mengajar Tentang Doa dan Iman', '<span>Isa mengajar tentang Doa dan Iman.</span>', '', 0, 0, 'admin', '2020-06-03 08:13:12', 1, 'SI', 'https://www.youtube.com/watch?v=DxuoqI9eHZo', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/MengajarTentangDoadanIman.mp4', NULL);
INSERT INTO `post` VALUES (43, '-', 'https://i.ytimg.com/vi/nTz5M6IpRpw/hqdefault.jpg', '-', 'Khotbah di Bukit', '<span>Isa menegur dan mengingatkan orang-orang diatas bukit tentang harta dan kasih.</span>', '', 0, 0, 'admin', '2020-06-03 08:15:02', 1, 'SI', 'https://www.youtube.com/watch?v=nTz5M6IpRpw', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/KhotbahdiBukit.mp4', NULL);
INSERT INTO `post` VALUES (44, '-', 'https://i.ytimg.com/vi/RbpRmvYU6hI/hqdefault.jpg', '-', 'Membayar Pajak kepada Kaisar', '<span>Isa mengajarkan tentang Hukum membayar Pajak.</span>', '', 0, 0, 'admin', '2020-06-03 08:16:14', 1, 'SI', 'https://www.youtube.com/watch?v=RbpRmvYU6hI', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/MembayarPajakkepadaKaisar.mp4', NULL);
INSERT INTO `post` VALUES (45, '-', 'https://i.ytimg.com/vi/D8x4_oAFYW8/hqdefault.jpg', '-', 'Perumpamaan tentang Kebun Anggur dan Penyewa', '<span>Isa mengajar orang-orang dengan perumpamaan Kebun Anggur dan Penyewa.</span>', '', 0, 0, 'admin', '2020-06-03 08:17:34', 1, 'SI', 'https://www.youtube.com/watch?v=D8x4_oAFYW8', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/PerumpamaantentangKebunAnggurdanPenyewa.mp4', NULL);
INSERT INTO `post` VALUES (46, '-', 'https://i.ytimg.com/vi/VrFKhhV34sg/hqdefault.jpg', '-', 'Perumpamaan tentang Penabur dan Benih', '', '', 0, 0, 'admin', '2020-06-03 08:18:46', 1, 'SI', 'https://www.youtube.com/watch?v=VrFKhhV34sg', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/PerumpamaantentangPenaburdanBenih.mp4', NULL);
INSERT INTO `post` VALUES (47, '-', 'https://i.ytimg.com/vi/6yedW7Ll7zw/hqdefault.jpg', '-', 'Perumpamaan tentang Orang Farisi dan Pemungut Pajak', '', '', 0, 0, 'admin', '2020-06-03 08:20:23', 1, 'SI', 'https://www.youtube.com/watch?v=6yedW7Ll7zw', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/PerumpamaantentangOrangFarisidanPemungutPajak.mp4', NULL);
INSERT INTO `post` VALUES (48, '-', 'https://i.ytimg.com/vi/q80YXLhftWs/hqdefault.jpg', '-', 'Perumpamaan tentang Orang Samaria yang Baik Hati', '<span>Isa mengajar orang-orang dengan perumpamaan orang samaria yang baik hati.</span>', '', 0, 0, 'admin', '2020-06-03 08:21:41', 1, 'SI', 'https://www.youtube.com/watch?v=q80YXLhftWs', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/PerumpamaantentangOrangSamariayangBaikHati.mp4', NULL);
INSERT INTO `post` VALUES (49, '-', 'https://i.ytimg.com/vi/raTVQOKLpeg/hqdefault.jpg', '-', 'Undangan untuk Mengenal ISA secara Pribadi', '<span>dalam kitab suci, Allah menyatakan bahwa Almasih akan datang untuk menjadi penyelamat dunia, kehidupan Isa membuktikan bahwa memang dialah yang telah di ramalkan oleh para Nabi,\r\nkita telah melihat berbagai macam hal Ajaib yang telah dilakukannya, dan Isa menjanjikan suatu tempat didalam kerajaan Allah yang kekal.</span>', '', 0, 0, 'admin', '2020-06-03 08:23:18', 1, 'SI', 'https://www.youtube.com/watch?v=raTVQOKLpeg', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/UndanganuntukMengenalISAsecaraPribadi.mp4', NULL);
INSERT INTO `post` VALUES (50, '-', 'https://i.ytimg.com/vi/WSr5PMLsjcE/hqdefault.jpg', '-', 'Diberkatilah mereka yang mendengar dan taat', '<span>Lebih berbahagia orang yang mendengarkan firman dan melakukannya.</span>', '', 0, 0, 'admin', '2020-06-03 08:24:27', 1, 'SI', 'https://www.youtube.com/watch?v=WSr5PMLsjcE', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/Diberkatilahmerekayangmendengardantaat.mp4', NULL);
INSERT INTO `post` VALUES (51, '-', 'https://i.ytimg.com/vi/etrxWVpQ7ZE/hqdefault.jpg', '-', 'Ucapan bahagia', '<span>berbahagialah orang yang menjadi umat Allah, karena yang lapar akan di kenyangkan, yang menangis akan tertawa, berbahagialah jika di benci, ditolak dan di fitnah karena anak manusia, bersukaria dan bergembiralah, karena pahalamu besar disurga.</span>', '', 0, 0, 'admin', '2020-06-03 08:25:43', 1, 'SI', 'https://www.youtube.com/watch?v=etrxWVpQ7ZE', 'https://siapaisa.com/video_isa', 2, 'http://apps.siapaisa.com/localVideo/Ucapanbahagia.mp4', NULL);
INSERT INTO `post` VALUES (52, '-', 'https://i.ytimg.com/vi/4AbzfinCeBo/hqdefault.jpg', '-', 'Transfigurasi', '<span>Isa membawa Yakub Petrus dan Yahya ke atas bukit untuk berdoa, lalu ada 2 orang datang menghampiri Isa, yaitu Nabi Musa dan Nabi Ilyas.</span>', '', 0, 0, 'admin', '2020-06-03 08:43:40', 1, 'SI', 'https://www.youtube.com/watch?v=4AbzfinCeBo', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/Transfigurasi.mp4', NULL);
INSERT INTO `post` VALUES (53, '-', 'https://i.ytimg.com/vi/u1okLoyWVYY/hqdefault.jpg', '-', 'Perjamuan Terakhir', '<span>Isa mengadakan perjamuan terakhir bersama murid-muridnya.</span>', '', 0, 0, 'admin', '2020-06-03 08:44:56', 1, 'SI', 'https://www.youtube.com/watch?v=u1okLoyWVYY', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/PerjamuanTerakhir.mp4', NULL);
INSERT INTO `post` VALUES (54, '-', 'https://i.ytimg.com/vi/ipOr9oc3F3Q/hqdefault.jpg', '-', 'Makam itu Kosong', '<span>para wanita memberi kesaksian di hadapan murid Isa, bahwa saat mereka mengujungi kuburan Isa, mereka tidak menemukan mayat Isa di dalam kubur.</span>', '', 0, 0, 'admin', '2020-06-03 08:46:11', 1, 'SI', 'https://www.youtube.com/watch?v=ipOr9oc3F3Q', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/MakamituKosong.mp4', NULL);
INSERT INTO `post` VALUES (55, '-', 'https://i.ytimg.com/vi/XbSNwioFI9k/hqdefault.jpg', '-', 'Iblis menggoda Isa-Almasih', '<span>Roh Allah membawa Isa ke padang gurun, Iblis mencobai Isa selama 40 hari 40 malam, dan selama itu, Isa tidak makan dan tidak minum.</span>', '', 0, 0, 'admin', '2020-06-03 08:47:52', 1, 'SI', 'https://www.youtube.com/watch?v=XbSNwioFI9k', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/IblismenggodaIsa-Almasih.mp4', NULL);
INSERT INTO `post` VALUES (56, '-', 'https://i.ytimg.com/vi/FC0yXI6EUiI/hqdefault.jpg', '-', 'Awal mula', '<span>Allah menciptakan langit dan bumi, dan ia juga membentuk manusia dari debu tanah dan menghebuskan nafas hidup kedalam hidungnya, di bumi Allah menciptakan Laki-laki dan perempuan menurut citranya.</span>', '', 0, 0, 'admin', '2020-06-03 08:49:23', 1, 'SI', 'https://www.youtube.com/watch?v=FC0yXI6EUiI', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/Awalmula.mp4', NULL);
INSERT INTO `post` VALUES (57, '-', 'https://i.ytimg.com/vi/Ao0rYZ2ob_U/hqdefault.jpg', '-', 'Prajurit Berjudi untuk Pakaian Yesus', '<span>Para prajurit mengundi jubah Isa disaat Isa di salibkan di antara 2 penjahat.</span>', '', 0, 0, 'admin', '2020-06-03 08:50:32', 1, 'SI', 'https://www.youtube.com/watch?v=Ao0rYZ2ob_U', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/PrajuritBerjudiuntukPakaianYesus.mp4', NULL);
INSERT INTO `post` VALUES (58, '-', 'https://i.ytimg.com/vi/TdWCgMP-Ct0/hqdefault.jpg', '-', 'Wanita Berdosa Diampuni', '<span>orang Farisi mengundang Isa makan di rumahnya dan Isa pun datang untuk makan di rumah orang Farisi tersebut, dan ketika Isa makan, ada seorang wanita berdosa masuk ke ruang makan dan langsung membasuh kaki Isa untuk meminta agar dosanya di ampuni.</span>', '', 0, 0, 'admin', '2020-06-03 08:51:51', 1, 'SI', 'https://www.youtube.com/watch?v=TdWCgMP-Ct0', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/WanitaBerdosaDiampuni.mp4', NULL);
INSERT INTO `post` VALUES (59, '-', 'https://i.ytimg.com/vi/bRF4yA8IbWA/hqdefault.jpg', '-', 'Masuk Salib', '<span>saat Isa disalibkan, di atas kepala Isa di tempel sebuah papan yang bertuliskan inilah Raja Bani Israil.</span>', '', 0, 0, 'admin', '2020-06-03 08:53:14', 1, 'SI', 'https://www.youtube.com/watch?v=bRF4yA8IbWA', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/MasukSalib.mp4', NULL);
INSERT INTO `post` VALUES (60, '-', 'https://i.ytimg.com/vi/GxjvDYf134U/hqdefault.jpg', '-', 'Petrus Mengingkari Isa', '<span>Petrus menyangkal dan mengatakan kepada orang-orang bahwa ia bukan murid Isa, tepat seperti yang Isa katakan kepada Petrus sebelum Isa di tangkap.</span>', '', 0, 0, 'admin', '2020-06-03 08:55:03', 1, 'SI', 'https://www.youtube.com/watch?v=GxjvDYf134U', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/PetrusMengingkariIsa.mp4', NULL);
INSERT INTO `post` VALUES (61, '-', 'https://i.ytimg.com/vi/uOTgnT4MNoE/hqdefault.jpg', '-', 'Petrus Menyatakan Isa adalah Almasih dari Allah', '<span>Isa bertanya kepada Petrus, siapakan Isa, lalu Petrus menjawab, bahwa Isa adalah Almasih dari Allah.</span>', '', 0, 0, 'admin', '2020-06-03 08:56:20', 1, 'SI', 'https://www.youtube.com/watch?v=uOTgnT4MNoE', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/PetrusMenyatakanIsaadalahAlmasihdariAllah.mp4', NULL);
INSERT INTO `post` VALUES (62, '-', 'https://i.ytimg.com/vi/D80Ak_XK33k/hqdefault.jpg', '-', 'Nabi Yahya di Penjara', '<span>Herodes memenjarakan nabi Yahya, karena ia menegur pernikahan Herodes dengan istri saudaranya.</span>', '', 0, 0, 'admin', '2020-06-03 08:58:33', 1, 'SI', 'https://www.youtube.com/watch?v=D80Ak_XK33k', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/NabiYahyadiPenjara.mp4', NULL);
INSERT INTO `post` VALUES (63, '-', 'https://i.ytimg.com/vi/P4GvgUur63U/hqdefault.jpg', '-', 'Isa Menangis Atas Yerusalem', '<span>Ketika Isa melihat dan mendekati kota Yerusalem, Ia menangisinya.</span>', '', 0, 0, 'admin', '2020-06-03 09:01:05', 1, 'SI', 'https://www.youtube.com/watch?v=P4GvgUur63U', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/IsaMenangisAtasYerusalem.mp4', NULL);
INSERT INTO `post` VALUES (64, '-', 'https://i.ytimg.com/vi/xpGWBuPxjMs/hqdefault.jpg', '-', 'ISA Menghabiskan Waktu dengan Orang Berdosa', '<span>Isa berkumpul, untuk makan dan minum dan juga menghabiskan waktu dengan orang yang berdosa.</span>', '', 0, 0, 'admin', '2020-06-03 09:02:22', 1, 'SI', 'https://www.youtube.com/watch?v=xpGWBuPxjMs', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/ISAMenghabiskanWaktudenganOrangBerdosa.mp4', NULL);
INSERT INTO `post` VALUES (65, '-', 'https://i.ytimg.com/vi/kEx7nWRZOB4/hqdefault.jpg', '-', 'ISA Menyatakan Pemenuhan Tulisan Suci', '<span>Isa kembali ke Nazaret tempat ia dibesarkan, dan pada hari sabat seperti biasa Isa pergi ke tempat Ibadah, dan Isa di minta untuk membacakan bagian dari Surat Nabi Yesaya.</span>', '', 0, 0, 'admin', '2020-06-03 09:03:54', 1, 'SI', 'https://www.youtube.com/watch?v=kEx7nWRZOB4', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/ISAMenyatakanPemenuhanTulisanSuci.mp4', NULL);
INSERT INTO `post` VALUES (66, '-', 'https://i.ytimg.com/vi/dtZjfXMIx18/hqdefault.jpg', '-', 'ISA Memprediksi Kematian dan Kebangkitan-Nya', '<span>Saat berkumpul bersama murid-muridnya, Isa menjelaskan Kematian dan Kebangkitan dirinya kepada murid-muridnya.</span>', '', 0, 0, 'admin', '2020-06-03 09:05:21', 1, 'SI', 'https://www.youtube.com/watch?v=dtZjfXMIx18', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/ISAMemprediksiKematiandanKebangkitan-Nya.mp4', NULL);
INSERT INTO `post` VALUES (67, '-', 'https://i.ytimg.com/vi/_m9wQq4Cxy0/hqdefault.jpg', '-', 'ISA Dihukum', '<span>Ini adalah Proses saat Isa di beri Hukuman Cambuk, dan di saksikan oleh banyak orang.</span>', '', 0, 0, 'admin', '2020-06-03 09:07:24', 1, 'SI', 'https://www.youtube.com/watch?v=_m9wQq4Cxy0', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/ISADihukum.mp4', NULL);
INSERT INTO `post` VALUES (68, '-', 'https://i.ytimg.com/vi/rT6x0_AQ4Ts/hqdefault.jpg', '-', 'ISA Disalibkan', '<span>disini di perlihatkan proses penyaliban Isa, dan Isa disalibkan bersama 2 orang penjahat.</span>', '', 0, 0, 'admin', '2020-06-03 09:08:29', 1, 'SI', 'https://www.youtube.com/watch?v=rT6x0_AQ4Ts', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/ISADisalibkan.mp4', NULL);
INSERT INTO `post` VALUES (69, '-', 'https://i.ytimg.com/vi/IKTXXFWqCIk/hqdefault.jpg', '-', 'ISA Dibawa Kepada Pilatus', '<span>setelah Isa di tangkap, isa pun di bawa ke hadapan Pontius Pilatus gubernur yang kejam yang telah menyalibkan ribuan orang, akan tetapi pontius pilatus tidak memiki alasan untuk menghukum Isa.</span>', '', 0, 0, 'admin', '2020-06-03 09:10:08', 1, 'SI', 'https://www.youtube.com/watch?v=IKTXXFWqCIk', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/ISADibawaKepadaPilatus.mp4', NULL);
INSERT INTO `post` VALUES (70, '-', 'https://i.ytimg.com/vi/ojy31J0Ss5M/hqdefault.jpg', '-', 'ISA Dibawa ke Herodes', '<span>setelah Isa di tangkap, Isa dibawa kehadapan Herodes, ketika Isa sudah sampai di hadapan Herodes, Herodes pun menanyakan berbagai macam hal kepada Isa.</span>', '', 0, 0, 'admin', '2020-06-03 09:11:37', 1, 'SI', 'https://www.youtube.com/watch?v=ojy31J0Ss5M', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/ISADibawakeHerodes.mp4', NULL);
INSERT INTO `post` VALUES (71, '-', 'https://i.ytimg.com/vi/yZkrfJO9Jf0/hqdefault.jpg', '-', 'ISA Dikhianati dan Ditangkap', '<span>Salah satu dari ke 12 murid Yesus Yaitu Yudas Iskariot pergi kepada imam-imam kepala untuk menyerahkan Isa.</span>', '', 0, 0, 'admin', '2020-06-03 09:12:55', 1, 'SI', 'https://www.youtube.com/watch?v=yZkrfJO9Jf0', 'https://siapaisa.com/kehidupan', 3, 'http://apps.siapaisa.com/localVideo/ISADikhianatidanDitangkap.mp4', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tabout
-- ----------------------------
INSERT INTO `tabout` VALUES (1, 'CERMINJIWA adalah situs web yang berisikan kumpulan video-video pendek yang mencerminkan kehidupan manusia sehari hari. Share bagikan respon dan bagikan pengalamanmu disetiap topik pertanyaan diskusi video tersebut.', 'https://www.youtube.com/channel/UCfUABd3mfKf4-bsGZBnJHzA', 'https://www.instagram.com/cerminj/', 'https://twitter.com/CerminjiwaC', 'https://web.facebook.com/cermin.jiwa.3194', 'https://www.linkedin.com/in/cerminj-jiwa-8951b6192/', 'https://cerminjiwalove.tumblr.com/');
INSERT INTO `tabout` VALUES (2, 'CERMINJIWA adalah situs web yang berisikan kumpulan video-video pendek yang mencerminkan kehidupan manusia sehari hari. Share bagikan respon dan bagikan pengalamanmu disetiap topik pertanyaan diskusi video tersebut. 2', 'https://www.youtube.com/channel/UCfUABd3mfKf4-bsGZBnJHzA', 'https://www.instagram.com/cerminj/', 'https://twitter.com/CerminjiwaC', 'https://web.facebook.com/cermin.jiwa.3194', 'https://www.linkedin.com/in/cerminj-jiwa-8951b6192/', 'https://cerminjiwalove.tumblr.com/');
INSERT INTO `tabout` VALUES (3, 'CERMINJIWA adalah situs web yang berisikan kumpulan video-video pendek yang mencerminkan kehidupan manusia sehari hari. Share bagikan respon dan bagikan pengalamanmu disetiap topik pertanyaan diskusi video tersebut. 2', 'https://www.youtube.com/channel/UCfUABd3mfKf4-bsGZBnJHzA', 'https://www.instagram.com/cerminj/', 'https://twitter.com/CerminjiwaC', 'https://web.facebook.com/cermin.jiwa.3194', 'https://www.linkedin.com/in/cerminj-jiwa-8951b6192/', 'https://cerminjiwalove.tumblr.com/');

-- ----------------------------
-- Table structure for tempshare
-- ----------------------------
DROP TABLE IF EXISTS `tempshare`;
CREATE TABLE `tempshare`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `viewDate` datetime(0) NOT NULL,
  `PostID` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tempshare
-- ----------------------------
INSERT INTO `tempshare` VALUES (1, 'ecc4a28f60e61b76', '2020-05-10 05:17:12', 1);
INSERT INTO `tempshare` VALUES (2, 'ecc4a28f60e61b76', '2020-05-18 03:26:46', 1);
INSERT INTO `tempshare` VALUES (3, 'ecc4a28f60e61b76', '2020-05-18 03:26:50', 1);
INSERT INTO `tempshare` VALUES (4, 'ecc4a28f60e61b76', '2020-05-21 01:36:09', 1);
INSERT INTO `tempshare` VALUES (5, '85967317a6d7ee0d', '2020-06-03 03:06:48', 1);
INSERT INTO `tempshare` VALUES (6, '2fc40edab67abf76', '2020-06-03 04:26:20', 12);
INSERT INTO `tempshare` VALUES (7, '2fc40edab67abf76', '2020-06-03 04:26:21', 12);

-- ----------------------------
-- Table structure for tempview
-- ----------------------------
DROP TABLE IF EXISTS `tempview`;
CREATE TABLE `tempview`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `viewDate` datetime(0) NOT NULL,
  `PostID` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tempview
-- ----------------------------
INSERT INTO `tempview` VALUES (1, '', '2020-05-10 05:13:15', 1);
INSERT INTO `tempview` VALUES (2, 'ecc4a28f60e61b76', '2020-05-10 05:13:33', 1);
INSERT INTO `tempview` VALUES (3, 'ecc4a28f60e61b76', '2020-05-10 05:13:40', 6);
INSERT INTO `tempview` VALUES (4, 'ecc4a28f60e61b76', '2020-05-10 05:13:46', 24);
INSERT INTO `tempview` VALUES (5, 'ecc4a28f60e61b76', '2020-05-10 05:17:05', 1);
INSERT INTO `tempview` VALUES (6, 'ecc4a28f60e61b76', '2020-05-10 05:24:47', 1);
INSERT INTO `tempview` VALUES (7, 'ecc4a28f60e61b76', '2020-05-10 05:25:11', 1);
INSERT INTO `tempview` VALUES (8, 'b3b2c82fe83f3fb8', '2020-05-11 05:52:17', 1);
INSERT INTO `tempview` VALUES (9, '', '2020-05-12 10:44:03', 1);
INSERT INTO `tempview` VALUES (10, 'b3b2c82fe83f3fb8', '2020-05-12 10:44:47', 1);
INSERT INTO `tempview` VALUES (11, 'b3b2c82fe83f3fb8', '2020-05-12 10:45:06', 2);
INSERT INTO `tempview` VALUES (12, 'b3b2c82fe83f3fb8', '2020-05-12 10:45:26', 1);
INSERT INTO `tempview` VALUES (13, 'b3b2c82fe83f3fb8', '2020-05-12 10:45:44', 1);
INSERT INTO `tempview` VALUES (14, 'b3b2c82fe83f3fb8', '2020-05-12 10:45:57', 2);
INSERT INTO `tempview` VALUES (15, 'b3b2c82fe83f3fb8', '2020-05-12 10:46:27', 1);
INSERT INTO `tempview` VALUES (16, 'b3b2c82fe83f3fb8', '2020-05-12 02:04:24', 1);
INSERT INTO `tempview` VALUES (17, 'b3b2c82fe83f3fb8', '2020-05-12 02:05:02', 1);
INSERT INTO `tempview` VALUES (18, 'b3b2c82fe83f3fb8', '2020-05-12 02:09:37', 1);
INSERT INTO `tempview` VALUES (19, 'b3b2c82fe83f3fb8', '2020-05-12 02:10:27', 1);
INSERT INTO `tempview` VALUES (20, 'b3b2c82fe83f3fb8', '2020-05-12 02:11:04', 1);
INSERT INTO `tempview` VALUES (21, 'b3b2c82fe83f3fb8', '2020-05-12 02:11:43', 1);
INSERT INTO `tempview` VALUES (22, 'b3b2c82fe83f3fb8', '2020-05-12 02:12:12', 1);
INSERT INTO `tempview` VALUES (23, 'b3b2c82fe83f3fb8', '2020-05-12 02:12:29', 1);
INSERT INTO `tempview` VALUES (24, 'b3b2c82fe83f3fb8', '2020-05-12 02:12:36', 1);
INSERT INTO `tempview` VALUES (25, 'b3b2c82fe83f3fb8', '2020-05-12 02:14:53', 1);
INSERT INTO `tempview` VALUES (26, 'b3b2c82fe83f3fb8', '2020-05-12 02:15:43', 1);
INSERT INTO `tempview` VALUES (27, 'b3b2c82fe83f3fb8', '2020-05-12 02:19:43', 1);
INSERT INTO `tempview` VALUES (28, 'b3b2c82fe83f3fb8', '2020-05-12 02:20:16', 1);
INSERT INTO `tempview` VALUES (29, 'b3b2c82fe83f3fb8', '2020-05-12 02:20:54', 1);
INSERT INTO `tempview` VALUES (30, 'b3b2c82fe83f3fb8', '2020-05-12 02:52:50', 1);
INSERT INTO `tempview` VALUES (31, '648ac42adf533c0c', '2020-05-12 03:03:06', 1);
INSERT INTO `tempview` VALUES (32, 'ecc4a28f60e61b76', '2020-05-13 10:01:16', 1);
INSERT INTO `tempview` VALUES (33, 'ecc4a28f60e61b76', '2020-05-13 11:48:53', 1);
INSERT INTO `tempview` VALUES (34, 'ecc4a28f60e61b76', '2020-05-13 11:49:30', 1);
INSERT INTO `tempview` VALUES (35, 'ecc4a28f60e61b76', '2020-05-13 11:49:55', 1);
INSERT INTO `tempview` VALUES (36, 'ecc4a28f60e61b76', '2020-05-13 11:51:12', 1);
INSERT INTO `tempview` VALUES (37, 'ecc4a28f60e61b76', '2020-05-13 11:52:05', 1);
INSERT INTO `tempview` VALUES (38, 'ecc4a28f60e61b76', '2020-05-13 11:53:20', 1);
INSERT INTO `tempview` VALUES (39, 'ecc4a28f60e61b76', '2020-05-13 11:53:54', 2);
INSERT INTO `tempview` VALUES (40, 'ecc4a28f60e61b76', '2020-05-13 12:03:54', 12);
INSERT INTO `tempview` VALUES (41, 'ecc4a28f60e61b76', '2020-05-13 02:12:23', 1);
INSERT INTO `tempview` VALUES (42, 'ecc4a28f60e61b76', '2020-05-13 03:26:35', 2);
INSERT INTO `tempview` VALUES (43, 'ecc4a28f60e61b76', '2020-05-13 03:27:39', 1);
INSERT INTO `tempview` VALUES (44, 'ecc4a28f60e61b76', '2020-05-14 11:13:25', 1);
INSERT INTO `tempview` VALUES (45, 'ecc4a28f60e61b76', '2020-05-15 10:16:32', 1);
INSERT INTO `tempview` VALUES (46, 'ecc4a28f60e61b76', '2020-05-15 01:11:19', 1);
INSERT INTO `tempview` VALUES (47, 'ecc4a28f60e61b76', '2020-05-15 01:31:32', 1);
INSERT INTO `tempview` VALUES (48, 'ecc4a28f60e61b76', '2020-05-15 01:55:57', 1);
INSERT INTO `tempview` VALUES (49, 'ecc4a28f60e61b76', '2020-05-15 02:40:28', 1);
INSERT INTO `tempview` VALUES (50, 'ecc4a28f60e61b76', '2020-05-15 02:46:43', 1);
INSERT INTO `tempview` VALUES (51, 'ecc4a28f60e61b76', '2020-05-15 02:54:36', 1);
INSERT INTO `tempview` VALUES (52, 'ecc4a28f60e61b76', '2020-05-15 03:35:46', 1);
INSERT INTO `tempview` VALUES (53, 'ecc4a28f60e61b76', '2020-05-15 03:45:11', 2);
INSERT INTO `tempview` VALUES (54, 'ecc4a28f60e61b76', '2020-05-15 03:46:26', 1);
INSERT INTO `tempview` VALUES (55, 'ecc4a28f60e61b76', '2020-05-15 03:46:29', 2);
INSERT INTO `tempview` VALUES (56, 'ecc4a28f60e61b76', '2020-05-15 03:48:44', 24);
INSERT INTO `tempview` VALUES (57, 'ecc4a28f60e61b76', '2020-05-15 03:48:54', 24);
INSERT INTO `tempview` VALUES (58, 'ecc4a28f60e61b76', '2020-05-15 03:49:04', 25);
INSERT INTO `tempview` VALUES (59, 'ecc4a28f60e61b76', '2020-05-15 03:49:13', 2);
INSERT INTO `tempview` VALUES (60, 'ecc4a28f60e61b76', '2020-05-15 03:49:18', 26);
INSERT INTO `tempview` VALUES (61, 'ecc4a28f60e61b76', '2020-05-15 03:49:41', 1);
INSERT INTO `tempview` VALUES (62, 'ecc4a28f60e61b76', '2020-05-15 03:50:19', 1);
INSERT INTO `tempview` VALUES (63, 'ecc4a28f60e61b76', '2020-05-15 03:50:35', 2);
INSERT INTO `tempview` VALUES (64, 'ecc4a28f60e61b76', '2020-05-15 03:52:03', 1);
INSERT INTO `tempview` VALUES (65, 'ecc4a28f60e61b76', '2020-05-15 03:53:23', 1);
INSERT INTO `tempview` VALUES (66, 'ecc4a28f60e61b76', '2020-05-15 03:54:10', 1);
INSERT INTO `tempview` VALUES (67, 'ecc4a28f60e61b76', '2020-05-15 03:54:38', 1);
INSERT INTO `tempview` VALUES (68, 'ecc4a28f60e61b76', '2020-05-16 10:06:38', 1);
INSERT INTO `tempview` VALUES (69, 'ecc4a28f60e61b76', '2020-05-16 10:09:28', 1);
INSERT INTO `tempview` VALUES (70, 'ecc4a28f60e61b76', '2020-05-16 10:13:29', 1);
INSERT INTO `tempview` VALUES (71, 'ecc4a28f60e61b76', '2020-05-16 10:14:18', 24);
INSERT INTO `tempview` VALUES (72, 'ecc4a28f60e61b76', '2020-05-16 10:14:48', 29);
INSERT INTO `tempview` VALUES (73, 'ecc4a28f60e61b76', '2020-05-16 11:47:18', 2);
INSERT INTO `tempview` VALUES (74, 'ecc4a28f60e61b76', '2020-05-16 11:47:29', 1);
INSERT INTO `tempview` VALUES (75, 'ecc4a28f60e61b76', '2020-05-18 02:11:23', 4);
INSERT INTO `tempview` VALUES (76, 'ecc4a28f60e61b76', '2020-05-18 03:26:44', 1);
INSERT INTO `tempview` VALUES (77, 'ecc4a28f60e61b76', '2020-05-21 01:35:25', 1);
INSERT INTO `tempview` VALUES (78, 'ecc4a28f60e61b76', '2020-05-21 01:36:27', 2);
INSERT INTO `tempview` VALUES (79, 'ecc4a28f60e61b76', '2020-05-21 01:37:43', 1);
INSERT INTO `tempview` VALUES (80, 'ecc4a28f60e61b76', '2020-05-21 01:37:47', 1);
INSERT INTO `tempview` VALUES (81, '2fc40edab67abf76', '2020-05-27 07:55:55', 14);
INSERT INTO `tempview` VALUES (82, 'ecc4a28f60e61b76', '2020-05-29 03:28:50', 1);
INSERT INTO `tempview` VALUES (83, 'ecc4a28f60e61b76', '2020-05-29 03:37:32', 1);
INSERT INTO `tempview` VALUES (84, 'ecc4a28f60e61b76', '2020-05-29 03:49:41', 1);
INSERT INTO `tempview` VALUES (85, '', '2020-06-01 12:12:56', 1);
INSERT INTO `tempview` VALUES (86, 'ecc4a28f60e61b76', '2020-06-01 12:16:17', 1);
INSERT INTO `tempview` VALUES (87, '', '2020-06-01 12:22:24', 1);
INSERT INTO `tempview` VALUES (88, '', '2020-06-01 12:24:33', 1);
INSERT INTO `tempview` VALUES (89, 'ecc4a28f60e61b76', '2020-06-01 12:24:56', 1);
INSERT INTO `tempview` VALUES (90, '', '2020-06-01 12:28:53', 1);
INSERT INTO `tempview` VALUES (91, 'ecc4a28f60e61b76', '2020-06-01 12:30:07', 1);
INSERT INTO `tempview` VALUES (92, 'ecc4a28f60e61b76', '2020-06-01 12:31:35', 1);
INSERT INTO `tempview` VALUES (93, 'ecc4a28f60e61b76', '2020-06-01 12:32:19', 1);
INSERT INTO `tempview` VALUES (94, 'ecc4a28f60e61b76', '2020-06-01 12:39:47', 1);
INSERT INTO `tempview` VALUES (95, 'ecc4a28f60e61b76', '2020-06-01 12:40:42', 1);
INSERT INTO `tempview` VALUES (96, 'ecc4a28f60e61b76', '2020-06-01 12:41:25', 1);
INSERT INTO `tempview` VALUES (97, 'ecc4a28f60e61b76', '2020-06-01 12:49:18', 1);
INSERT INTO `tempview` VALUES (98, 'ecc4a28f60e61b76', '2020-06-01 12:49:37', 1);
INSERT INTO `tempview` VALUES (99, 'ecc4a28f60e61b76', '2020-06-01 12:50:37', 1);
INSERT INTO `tempview` VALUES (100, 'ecc4a28f60e61b76', '2020-06-01 09:53:51', 1);
INSERT INTO `tempview` VALUES (101, 'ecc4a28f60e61b76', '2020-06-01 09:54:06', 2);
INSERT INTO `tempview` VALUES (102, 'ecc4a28f60e61b76', '2020-06-01 09:54:13', 5);
INSERT INTO `tempview` VALUES (103, 'ecc4a28f60e61b76', '2020-06-01 09:54:55', 2);
INSERT INTO `tempview` VALUES (104, 'ecc4a28f60e61b76', '2020-06-01 09:55:21', 2);
INSERT INTO `tempview` VALUES (105, 'ecc4a28f60e61b76', '2020-06-01 10:04:10', 2);
INSERT INTO `tempview` VALUES (106, 'ecc4a28f60e61b76', '2020-06-01 10:05:47', 2);
INSERT INTO `tempview` VALUES (107, 'ecc4a28f60e61b76', '2020-06-01 10:06:06', 1);
INSERT INTO `tempview` VALUES (108, 'ecc4a28f60e61b76', '2020-06-01 10:06:43', 2);
INSERT INTO `tempview` VALUES (109, 'ecc4a28f60e61b76', '2020-06-01 10:07:01', 10);
INSERT INTO `tempview` VALUES (110, 'ecc4a28f60e61b76', '2020-06-01 10:07:48', 10);
INSERT INTO `tempview` VALUES (111, 'ecc4a28f60e61b76', '2020-06-01 10:09:43', 5);
INSERT INTO `tempview` VALUES (112, 'ecc4a28f60e61b76', '2020-06-01 10:11:21', 4);
INSERT INTO `tempview` VALUES (113, 'ecc4a28f60e61b76', '2020-06-02 02:21:38', 2);
INSERT INTO `tempview` VALUES (114, 'ecc4a28f60e61b76', '2020-06-02 02:23:33', 2);
INSERT INTO `tempview` VALUES (115, 'ecc4a28f60e61b76', '2020-06-02 02:23:57', 2);
INSERT INTO `tempview` VALUES (116, 'ecc4a28f60e61b76', '2020-06-02 02:24:19', 2);
INSERT INTO `tempview` VALUES (117, 'ecc4a28f60e61b76', '2020-06-02 02:24:39', 1);
INSERT INTO `tempview` VALUES (118, 'ecc4a28f60e61b76', '2020-06-02 02:24:53', 2);
INSERT INTO `tempview` VALUES (119, 'ecc4a28f60e61b76', '2020-06-02 02:25:09', 9);
INSERT INTO `tempview` VALUES (120, 'ecc4a28f60e61b76', '2020-06-02 02:28:23', 1);
INSERT INTO `tempview` VALUES (121, 'ecc4a28f60e61b76', '2020-06-02 02:30:08', 2);
INSERT INTO `tempview` VALUES (122, 'ecc4a28f60e61b76', '2020-06-02 02:33:21', 2);
INSERT INTO `tempview` VALUES (123, 'ecc4a28f60e61b76', '2020-06-02 02:33:38', 2);
INSERT INTO `tempview` VALUES (124, 'ecc4a28f60e61b76', '2020-06-02 02:33:53', 2);
INSERT INTO `tempview` VALUES (125, 'ecc4a28f60e61b76', '2020-06-02 02:34:49', 2);
INSERT INTO `tempview` VALUES (126, 'ecc4a28f60e61b76', '2020-06-02 02:35:09', 2);
INSERT INTO `tempview` VALUES (127, 'ecc4a28f60e61b76', '2020-06-02 02:36:50', 4);
INSERT INTO `tempview` VALUES (128, 'ecc4a28f60e61b76', '2020-06-02 03:06:48', 2);
INSERT INTO `tempview` VALUES (129, 'ecc4a28f60e61b76', '2020-06-02 03:10:48', 2);
INSERT INTO `tempview` VALUES (130, 'ecc4a28f60e61b76', '2020-06-02 03:11:08', 2);
INSERT INTO `tempview` VALUES (131, 'ecc4a28f60e61b76', '2020-06-02 03:12:10', 2);
INSERT INTO `tempview` VALUES (132, 'ecc4a28f60e61b76', '2020-06-02 03:12:20', 2);
INSERT INTO `tempview` VALUES (133, 'ecc4a28f60e61b76', '2020-06-02 03:14:06', 2);
INSERT INTO `tempview` VALUES (134, 'ecc4a28f60e61b76', '2020-06-02 03:20:18', 2);
INSERT INTO `tempview` VALUES (135, 'ecc4a28f60e61b76', '2020-06-02 03:27:34', 2);
INSERT INTO `tempview` VALUES (136, 'ecc4a28f60e61b76', '2020-06-02 03:33:46', 2);
INSERT INTO `tempview` VALUES (137, 'ecc4a28f60e61b76', '2020-06-02 03:39:52', 2);
INSERT INTO `tempview` VALUES (138, 'ecc4a28f60e61b76', '2020-06-02 03:41:11', 2);
INSERT INTO `tempview` VALUES (139, 'ecc4a28f60e61b76', '2020-06-02 03:42:46', 2);
INSERT INTO `tempview` VALUES (140, 'ecc4a28f60e61b76', '2020-06-02 03:44:55', 2);
INSERT INTO `tempview` VALUES (141, 'ecc4a28f60e61b76', '2020-06-02 03:46:44', 1);
INSERT INTO `tempview` VALUES (142, '2fc40edab67abf76', '2020-06-02 04:02:08', 1);
INSERT INTO `tempview` VALUES (143, '2fc40edab67abf76', '2020-06-02 04:02:35', 2);
INSERT INTO `tempview` VALUES (144, '2fc40edab67abf76', '2020-06-02 04:02:47', 1);
INSERT INTO `tempview` VALUES (145, '2fc40edab67abf76', '2020-06-02 04:03:05', 1);
INSERT INTO `tempview` VALUES (146, '', '2020-06-02 04:17:10', 1);
INSERT INTO `tempview` VALUES (147, '85967317a6d7ee0d', '2020-06-02 05:06:01', 1);
INSERT INTO `tempview` VALUES (148, '85967317a6d7ee0d', '2020-06-02 05:10:34', 1);
INSERT INTO `tempview` VALUES (149, '85967317a6d7ee0d', '2020-06-02 05:10:46', 2);
INSERT INTO `tempview` VALUES (150, '85967317a6d7ee0d', '2020-06-02 05:11:33', 1);
INSERT INTO `tempview` VALUES (151, '2fc40edab67abf76', '2020-06-02 05:18:33', 4);
INSERT INTO `tempview` VALUES (152, '85967317a6d7ee0d', '2020-06-02 05:22:01', 3);
INSERT INTO `tempview` VALUES (153, '85967317a6d7ee0d', '2020-06-02 05:22:18', 5);
INSERT INTO `tempview` VALUES (154, '85967317a6d7ee0d', '2020-06-02 05:23:01', 1);
INSERT INTO `tempview` VALUES (155, '85967317a6d7ee0d', '2020-06-02 05:24:57', 13);
INSERT INTO `tempview` VALUES (156, '85967317a6d7ee0d', '2020-06-02 05:29:07', 2);
INSERT INTO `tempview` VALUES (157, '85967317a6d7ee0d', '2020-06-02 05:29:38', 2);
INSERT INTO `tempview` VALUES (158, '85967317a6d7ee0d', '2020-06-02 05:29:55', 1);
INSERT INTO `tempview` VALUES (159, 'ecc4a28f60e61b76', '2020-06-02 08:17:11', 7);
INSERT INTO `tempview` VALUES (160, 'ecc4a28f60e61b76', '2020-06-02 08:21:55', 2);
INSERT INTO `tempview` VALUES (161, 'ecc4a28f60e61b76', '2020-06-02 08:23:15', 3);
INSERT INTO `tempview` VALUES (162, 'ecc4a28f60e61b76', '2020-06-02 08:23:25', 3);
INSERT INTO `tempview` VALUES (163, '2fc40edab67abf76', '2020-06-02 08:43:30', 1);
INSERT INTO `tempview` VALUES (164, '2fc40edab67abf76', '2020-06-02 08:43:56', 1);
INSERT INTO `tempview` VALUES (165, '85967317a6d7ee0d', '2020-06-02 09:13:18', 1);
INSERT INTO `tempview` VALUES (166, '85967317a6d7ee0d', '2020-06-02 09:13:34', 2);
INSERT INTO `tempview` VALUES (167, '85967317a6d7ee0d', '2020-06-02 09:14:14', 2);
INSERT INTO `tempview` VALUES (168, '85967317a6d7ee0d', '2020-06-02 09:14:26', 1);
INSERT INTO `tempview` VALUES (169, '85967317a6d7ee0d', '2020-06-02 09:14:40', 2);
INSERT INTO `tempview` VALUES (170, '85967317a6d7ee0d', '2020-06-02 09:14:44', 1);
INSERT INTO `tempview` VALUES (171, '85967317a6d7ee0d', '2020-06-02 09:21:20', 5);
INSERT INTO `tempview` VALUES (172, '2fc40edab67abf76', '2020-06-02 09:36:03', 5);
INSERT INTO `tempview` VALUES (173, '85967317a6d7ee0d', '2020-06-02 09:51:05', 1);
INSERT INTO `tempview` VALUES (174, '85967317a6d7ee0d', '2020-06-02 09:51:18', 5);
INSERT INTO `tempview` VALUES (175, '85967317a6d7ee0d', '2020-06-02 03:38:32', 14);
INSERT INTO `tempview` VALUES (176, '85967317a6d7ee0d', '2020-06-03 03:06:38', 5);
INSERT INTO `tempview` VALUES (177, '85967317a6d7ee0d', '2020-06-03 03:06:44', 1);
INSERT INTO `tempview` VALUES (178, '85967317a6d7ee0d', '2020-06-03 03:07:24', 2);
INSERT INTO `tempview` VALUES (179, 'ecc4a28f60e61b76', '2020-06-03 06:50:38', 5);
INSERT INTO `tempview` VALUES (180, 'ecc4a28f60e61b76', '2020-06-03 06:54:23', 5);
INSERT INTO `tempview` VALUES (181, 'ecc4a28f60e61b76', '2020-06-03 07:02:05', 1);
INSERT INTO `tempview` VALUES (182, 'ecc4a28f60e61b76', '2020-06-03 07:02:15', 1);
INSERT INTO `tempview` VALUES (183, '', '2020-06-03 07:14:48', 1);
INSERT INTO `tempview` VALUES (184, '2fc40edab67abf76', '2020-06-03 07:15:41', 5);
INSERT INTO `tempview` VALUES (185, '2fc40edab67abf76', '2020-06-03 07:17:03', 2);
INSERT INTO `tempview` VALUES (186, '2fc40edab67abf76', '2020-06-03 07:18:26', 2);
INSERT INTO `tempview` VALUES (187, '', '2020-06-03 07:30:23', 1);
INSERT INTO `tempview` VALUES (188, '2fc40edab67abf76', '2020-06-03 07:30:42', 1);
INSERT INTO `tempview` VALUES (189, '2fc40edab67abf76', '2020-06-03 07:32:06', 2);
INSERT INTO `tempview` VALUES (190, 'ecc4a28f60e61b76', '2020-06-03 07:34:52', 1);
INSERT INTO `tempview` VALUES (191, 'ecc4a28f60e61b76', '2020-06-03 07:35:29', 1);
INSERT INTO `tempview` VALUES (192, 'ecc4a28f60e61b76', '2020-06-03 07:36:44', 1);
INSERT INTO `tempview` VALUES (193, 'ecc4a28f60e61b76', '2020-06-03 07:38:07', 2);
INSERT INTO `tempview` VALUES (194, 'ecc4a28f60e61b76', '2020-06-03 07:38:50', 1);
INSERT INTO `tempview` VALUES (195, 'ecc4a28f60e61b76', '2020-06-03 07:38:53', 2);
INSERT INTO `tempview` VALUES (196, 'ecc4a28f60e61b76', '2020-06-03 07:39:57', 1);
INSERT INTO `tempview` VALUES (197, 'ecc4a28f60e61b76', '2020-06-03 07:40:05', 5);
INSERT INTO `tempview` VALUES (198, '2fc40edab67abf76', '2020-06-03 07:40:24', 5);
INSERT INTO `tempview` VALUES (199, '2fc40edab67abf76', '2020-06-03 07:40:36', 14);
INSERT INTO `tempview` VALUES (200, '2fc40edab67abf76', '2020-06-03 04:26:13', 12);
INSERT INTO `tempview` VALUES (201, '2fc40edab67abf76', '2020-06-03 11:47:04', 2);
INSERT INTO `tempview` VALUES (202, '85967317a6d7ee0d', '2020-06-04 03:00:48', 2);
INSERT INTO `tempview` VALUES (203, '85967317a6d7ee0d', '2020-06-04 03:08:59', 14);
INSERT INTO `tempview` VALUES (204, '2fc40edab67abf76', '2020-06-04 04:23:21', 4);

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
  `ImageProfile` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (14, 'admin', 'admin', '216a8e9520609ef5d94daf2f606bd425ff68ba564f9340e3ced8216c114825998bca4566e0e26d21553848b0641d5f954932cf105c8b253c7f7260a53610e6b4AMc30ZoMECNLImxck8z7ONNigRNBdVWsWU+/Bv03HLY=', 'mnl', '0000-00-00 00:00:00', 1, '', b'1', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `users` VALUES (43, 'operator', 'Operator', '216a8e9520609ef5d94daf2f606bd425ff68ba564f9340e3ced8216c114825998bca4566e0e26d21553848b0641d5f954932cf105c8b253c7f7260a53610e6b4AMc30ZoMECNLImxck8z7ONNigRNBdVWsWU+/Bv03HLY=', '', '2020-04-26 10:11:27', 0, '', b'0', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `users` VALUES (44, 'adji142', '', '1691476a18aa7f470a9f8fc3eeb677c45b548b4b9d0cac12bc2d77c3ea6c8f4190f0a3cff8fc6b96dbd8e50dfaab57e7dd2a6806832bd1488b4cf5438d49fa92oi0g8vZcx31EfvWDBAe/7O6sGYV95W2jxbnwsDzFCzc=', '', '2020-05-07 10:07:59', 0, '', b'0', '', '', 'prasetyoajiw@gmail.com', '081325058258', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'http://apps.siapaisa.com/storeimage/scaled_e43d864a-1024-4066-9ec8-d2c952a9f4fe5452118784484563293.jpg');
INSERT INTO `users` VALUES (45, 'bayu04', '', 'b8508f774492123c1401169515544a1affabb249b4b327bbf519c3db50e3026a3af97609b35b2df909e9ba6483706c1148d0eefc7634662eed220f83b43a207doXTp1Fc6pK7+SQEh703yCVjFfhJIdIlhM69Ug55EXw0=', '', '2020-06-02 05:08:44', 0, '', b'0', '', '', 'bayuchris@yahoo.com', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', NULL);

SET FOREIGN_KEY_CHECKS = 1;
