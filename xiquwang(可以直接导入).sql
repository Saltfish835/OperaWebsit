-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: xiquwang
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) DEFAULT NULL,
  `admin_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES (1,'hehe','123');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_collection`
--

DROP TABLE IF EXISTS `t_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_time` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `opera_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_collection`
--

LOCK TABLES `t_collection` WRITE;
/*!40000 ALTER TABLE `t_collection` DISABLE KEYS */;
INSERT INTO `t_collection` VALUES (1,'2020-02-21 22:28',8,77),(2,'2020-02-21 22:35',8,28),(3,'2020-02-21 22:36',8,27),(4,'2020-02-21 22:40',8,91),(5,'2020-02-22 15:05',9,75),(6,'2020-02-22 15:26',9,28);
/*!40000 ALTER TABLE `t_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_message`
--

DROP TABLE IF EXISTS `t_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `message_time` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message`
--

LOCK TABLES `t_message` WRITE;
/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` VALUES (1,'大半夜的发帖测试功能！！！！','2020-02-21 20:46',8),(2,'可以发帖嘛？','2020-02-21 20:49',8);
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_message_comment`
--

DROP TABLE IF EXISTS `t_message_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_message_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `comment_time` varchar(100) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message_comment`
--

LOCK TABLES `t_message_comment` WRITE;
/*!40000 ALTER TABLE `t_message_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_message_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_notice`
--

DROP TABLE IF EXISTS `t_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `publication_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notice`
--

LOCK TABLES `t_notice` WRITE;
/*!40000 ALTER TABLE `t_notice` DISABLE KEYS */;
INSERT INTO `t_notice` VALUES (1,'明天下午五点去美国看戏','2020-02-21 16:34');
/*!40000 ALTER TABLE `t_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_opera`
--

DROP TABLE IF EXISTS `t_opera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_opera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opera_name` varchar(50) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `publication_time` varchar(100) DEFAULT NULL,
  `watch_number` int(11) DEFAULT NULL,
  `collection_number` int(11) DEFAULT NULL,
  `opera_status` varchar(10) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_opera`
--

LOCK TABLES `t_opera` WRITE;
/*!40000 ALTER TABLE `t_opera` DISABLE KEYS */;
INSERT INTO `t_opera` VALUES (27,'学术英语写作','本视频介绍什么是学术英语写作以及其特点','2020-02-19',46,1,'审核通过','video\\7409d5fe640544a3b6e3fb516939f010.mp4',1,8),(28,'学术英语写作2','本视频介绍学术英语写作的一些注意事项和写作技巧','2020-02-19',18,2,'审核通过','video\\b0bb5a3e673c45dba13fe9fb7991a6ab.mp4',1,8),(29,'成名在望','五月天成名在望的MV','2020-02-19',5,0,'审核通过','video\\93cb62f2a62b482ba502d3001df2249b.mp4',2,8),(30,'学术英语写作3','本视频讲解学术英语写作中的模糊词','2020-02-19',3,0,'审核通过','video\\8a4e6a810740466a82b2bb63baa81b7a.mp4',1,8),(31,'成名在望2','成名在望的MV标清版','2020-02-19',1,0,'审核通过','video\\d50ef46458d746ff87120d82811b2a4e.mp4',2,8),(32,'孙尚香祭江','这个皮影戏非常好看','2020-02-19',0,0,'审核通过','video\\9ca4c176397e49fb98ea3b3fb1597afc.mp4',8,8),(33,'花木兰','唧唧复唧唧、木兰当户织','2020-02-19',0,0,'审核未通过','video\\2aeffcae37e6406a98700fff07d80ddb.mp4',5,8),(34,'火焰驹 1-5','着火的马？','2020-02-19',3,0,'审核通过','video\\becf420642e24b4099320be98fa0e528.mp4',3,8),(35,'火焰驹3-5','又是马着火了','2020-02-19',1,0,'审核通过','video\\112d13ba54ed4cb1a5e138cfab21923d.mp4',3,8),(36,'火焰驹 5-5','又是着火马','2020-02-19',1,0,'审核通过','video\\eb844a1fd132434483ac72deea20d151.mp4',5,8),(37,'白蛇传 1-4','法海不懂爱？','2020-02-19',0,0,'审核通过','video\\f0e33c4233d34ea4b9ca8e5c0dd8ecfe.mp4',3,8),(38,'鸳鸯谱 1-4(标清)','这是一个讲鸳鸯的戏曲！','2020-02-20',0,0,'审核通过','video\\e416ead21c5e400481d276a0a9ac653a.mp4',3,9),(39,'柳荫记 送行(标清)','杨柳岸晓风残月，便纵有千种风情，更与何人说','2020-02-20',0,0,'审核通过','video\\29ec4a3273804f27b1500d3623cccc16.mp4',3,9),(40,'下游庵(标清)','没看过这个戏','2020-02-20',0,0,'审核通过','video\\a922052fa5b348d3bf54ffc55462476e.mp4',3,8),(41,'杏花红','一枝红杏出墙来','2020-02-20',0,0,'审核通过','video\\276fae06315f4e9b9c951c06c48b8d64.mp4',1,8),(42,'铡美案 1-5','包公在世','2020-02-20',1,0,'审核通过','video\\7d9ef58a032f4876822cedbd62045af5.mp4',4,8),(43,'家在东北','双击老铁666','2020-02-20',7,0,'审核通过','video\\a394bb50fd444c3c8bc9bb2c4b508b65.mp4',1,8),(44,'亲家母你坐下','亲家母应该就是岳母了','2020-02-20',1,0,'审核通过','video\\4f9fa6be21fa4cfda97a061b9066c22e.mp4',5,8),(45,'三滴血 2-3','这个怕是史泰龙演的吧？','2020-02-20',0,0,'审核通过','video\\e96e53ba9ebd4b15b09525caa4bf7ca2.mp4',4,8),(46,'离开登封小县','其实这个也不是昆曲','2020-02-20',0,0,'审核通过','video\\2523bf02cb9e4cf1ab780f4450542fff.mp4',5,8),(47,'断桥','这个就是许嵩表演的','2020-02-20',0,0,'审核通过','video\\ede9c91ffdc443f9ac977b5af72b1760.mp4',8,8),(48,'孔雀哥哥助阵杨云阁','不晓得该么儿形容','2020-02-20',2,0,'审核通过','video\\41e9953ef715436f86ce2a5b9b82b8d6.mp4',1,8),(49,'生死牌 1-3','我怎么想到了罗生门？','2020-02-20',0,0,'审核通过','video\\551ec4a723aa460cb6b90b4dcf2b3863.mp4',4,9),(50,'龙三姐拜寿(标清)','不认识龙三姐','2020-02-20',0,0,'审核通过','video\\d8534263846341d8a4daade6f2cf8002.mp4',8,9),(51,'十劝世人','背社会主义核心价值观！','2020-02-20',0,0,'审核通过','video\\494a640e535c41eaa1463d582db65028.mp4',1,9),(52,'迎亲(标清)','谁结婚？','2020-02-20',1,0,'审核通过','video\\3a0a0981db1f49d2b2aa8a95a5fb99df.mp4',8,9),(53,'夫妻观灯','应该是秉烛夜游','2020-02-20',2,0,'审核通过','video\\5a604a9cd6b44120967bef159cbd830e.mp4',6,9),(54,'海滩别','上海滩？发哥嘞？','2020-02-20',0,0,'审核通过','video\\2b35cc0da6b74d0d9c57049fa313f85d.mp4',6,9),(55,'黄莺树上声声唱','一个黄鹂鸣翠柳','2020-02-20',0,0,'审核通过','video\\0790616471c34abda223668f9e1a9a22.mp4',6,9),(56,'十五的月亮为谁圆','谁在妖王，月亮之上','2020-02-20',0,0,'审核通过','video\\99d3ce7d46fc47eb9e991f0bcbf3613c.mp4',6,9),(57,'树上的鸟儿成双对','不记得下一句是什么了','2020-02-20',1,0,'审核通过','video\\183e634e677242c2a4339ea96a013643.mp4',1,9),(58,'被冤 (Live)','这肯定是窦娥吧？','2020-02-20',0,0,'审核通过','video\\c68c288da94848148cc17c629a57b2be.mp4',4,9),(59,'五典坡 ','不明所以的名字','2020-02-20',1,0,'审核通过','video\\2a8fd8862e334fe3a1280b62b9f89e80.mp4',4,9),(60,'五典坡 第四场 赶坡','这个坡真陡啊','2020-02-20',0,0,'审核通过','video\\6c552974730444c998542a32b4ad34f7.mp4',4,9),(61,'出五关 1-3','关云长呀！','2020-02-20',0,0,'审核通过','video\\0960080e9e4a43e892ad5e3f9f4b2d8a.mp4',8,9),(62,'天仙配','主人翁是有一个人叫董永吧？','2020-02-20',0,0,'审核通过','video\\90cc530894854b6a939fc6a69266512d.mp4',1,9),(63,'十劝世人(标清)','又来劝人了','2020-02-20',0,0,'审核通过','video\\2cb58cade677476490530f67df96cb1a.mp4',8,9),(64,'玉堂春 2-3(标清)','不晓得么意思','2020-02-20',0,0,'审核通过','video\\32b2dd019384444eb8e7682042a1c330.mp4',4,9),(65,'天女散花','老虎机里面好像有这个','2020-02-20',0,0,'审核通过','video\\999a6788f6ff4028b61e9fc24f024c04.mp4',6,9),(66,'刘墉下南京(标清)','刘罗锅是你吗？','2020-02-20',0,0,'审核通过','video\\64d5e9364ac14502b4bd6944a56ed4a5.mp4',5,9),(67,'放饭(标清)','表演者的名字...','2020-02-20',0,0,'审核通过','video\\7a91a9f5bee340a980b27e8319204698.mp4',8,9),(68,'秦雪梅吊孝(标清)','踏雪寻梅','2020-02-20',0,0,'审核通过','video\\760bc73ef3b64c4e8396134cb967de8f.mp4',8,9),(69,'十八女拜寿(标清)','女儿真多','2020-02-20',0,0,'审核通过','video\\3498bc2bc6db4da3a1372afff4dd1370.mp4',8,9),(70,'谁料皇榜中状元','就你得瑟','2020-02-20',0,0,'审核通过','video\\ca6bc2be1ecc4af9b99cba37c1f42ef0.mp4',6,9),(71,'裁衣(标清)','量体裁衣，分点作答','2020-02-20',0,0,'审核通过','video\\797d8428cc9640a285a0e6daa229eae2.mp4',3,9),(72,'游河南(标清)','你肯定想偷JG','2020-02-20',0,0,'审核通过','video\\0fddcdce44c14f618d888e88e80ba4f6.mp4',8,9),(73,'孟姜女调','长城要跨了！','2020-02-20',0,0,'审核通过','video\\411a1fde8e114bd88fb51ac08eda597c.mp4',6,9),(74,'民女名叫冯素珍 ','我管你叫什么','2020-02-20',0,0,'审核通过','video\\8d4358ccb1564a4e9eed6367fa51029b.mp4',6,9),(75,'成名在望 (梦想小屋版)','帅呀','2020-02-20',1,1,'审核通过','video\\70692e50b7a1442da12fc590f68d465a.mp4',2,8),(76,'成名在望 (梦想小屋版)(超清)','这个更帅！','2020-02-20',2,0,'审核通过','video\\2cba8580278c480ea10d6d36033a1c4e.mp4',2,8),(77,'梁祝 - 第六场 （山伯临终）','要变蝴蝶了','2020-02-20',6,1,'审核通过','video\\a02de725184a4aec83e55644c83d734e.mp4',2,8),(78,'变脸 1-4(标清)','川剧扛把子','2020-02-20',0,0,'审核中','video\\819b20d0280c4e878ebc7b85d71bb2bc.mp4',3,8),(79,'女驸马','驸马不是男的嘛？','2020-02-20',0,0,'审核通过','video\\2aeb99ec4d804ebf961f288e0e85bb68.mp4',6,8),(80,'放风筝','你是提莫嘛','2020-02-20',1,0,'审核通过','video\\a5f9d453dcfb4440af028d911c50176a.mp4',7,8),(81,'大西厢','哈哈哈哈','2020-02-20',1,0,'审核通过','video\\2bd208349c7f4fcc832bcfb9ad2b39b6.mp4',7,8),(82,'赵氏孤儿','李连杰！','2020-02-20',0,0,'审核中','video\\0bad7101198f4b6e98e47d6dc36c8016.mp4',1,8),(83,'龙凤呈祥','凤舞九天','2020-02-20',0,0,'审核中','video\\c899b86fadc5403ab351b8fd4acee5a0.mp4',1,8),(84,'空城计','诸葛亮人呢？','2020-02-20',0,0,'审核通过','video\\e0bf070259654a2b9d201ede9764bd2f.mp4',1,8),(85,'王宝钏','林黛玉','2020-02-20',0,0,'审核通过','video\\98c7db6568834b0ba25db28467fa7af5.mp4',1,8),(86,'武家坡','不知道是哪里的坡','2020-02-20',0,0,'审核通过','video\\47669248aa2f46e293232562d70e08b7.mp4',1,8),(87,'遇皇后·打龙袍','这皇后好大胆子','2020-02-20',0,0,'审核通过','video\\1d502a993dfe4a57a5de3c27fd7c4309.mp4',1,8),(88,'贵妃醉酒选段','爱恨就在一瞬间','2020-02-20',0,0,'审核通过','video\\ac5f5941c4d64ab4a76106534386c032.mp4',1,8),(89,'红娘 1-2','那河畔的金柳，似夕阳中的新娘','2020-02-20',0,0,'审核通过','video\\125236bdb8ae46f18ee3bfc4b3b7f7cd.mp4',5,8),(90,'失街亭','诸葛亮要杀人了','2020-02-20',0,0,'审核通过','video\\eb27186fe856475fb9f946fcbbaadb65.mp4',5,8),(91,'长生殿','很诡异的感觉','2020-02-20',3,1,'审核通过','video\\0f5cb57b966147a1aa6988fc87f678c2.mp4',7,8),(92,'牡丹亭','花开富贵','2020-02-20',1,0,'审核通过','video\\620a4d13027f472fbd2567a4f93bd937.mp4',7,8),(93,'牡丹亭 2-2','花又开了','2020-02-20',1,0,'审核通过','video\\5d161d54a517434f85f382ec45463a1b.mp4',7,8),(94,'梁子玉','不认识这个人','2020-02-20',0,0,'审核通过','video\\1c45dd1d359942da83162f9b18b14b2d.mp4',2,8),(95,'赵氏孤儿','原来是一部戏曲呀','2020-02-20',0,0,'审核通过','video\\34ae88f20a1a48028240e147c387de6c.mp4',4,8),(96,'赵氏孤儿 3-4','孤儿还挺多','2020-02-20',0,0,'审核通过','video\\8c87c786b6e44768a9860aa45fb89c55.mp4',4,8),(97,'周仁回府','管你回哪儿','2020-02-20',0,0,'审核通过','video\\01a8d1059e3345ae905c9a8cf2aec69d.mp4',4,8),(98,'打金枝','为什么要打金色的树枝呢？','2020-02-20',0,0,'审核通过','video\\6e20630ba04844e2963b1d8debe5bed8.mp4',7,8),(99,'穆桂英挂帅','杨家将很厉害','2020-02-20',0,0,'审核通过','video\\28c979b16f5843c38adb341dde5aac13.mp4',3,8),(100,'七品芝麻官','比周新驰的还少两粒芝麻','2020-02-20',0,0,'审核通过','video\\7dffa096cee746fa92123c140ad7bd99.mp4',1,8),(101,'三打金枝','又要打金色的树枝！','2020-02-20',0,0,'审核通过','video\\25d2b94edce549a195ba35ef50abf296.mp4',7,8);
/*!40000 ALTER TABLE `t_opera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_opera_comment`
--

DROP TABLE IF EXISTS `t_opera_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_opera_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `comment_status` varchar(10) DEFAULT NULL,
  `comment_time` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `opera_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_opera_comment`
--

LOCK TABLES `t_opera_comment` WRITE;
/*!40000 ALTER TABLE `t_opera_comment` DISABLE KEYS */;
INSERT INTO `t_opera_comment` VALUES (1,'good good study day day up','1','2020-02-20 23:08',8,27),(2,'学英语、动起来！','0','2020-02-20 23:19',8,27),(3,'我要发表评论','1','2020-02-20 23:23',9,27),(4,'这个没有人评论嘛？','0','2020-02-21 14:11',8,28),(5,'hahahahahahaha','1','2020-02-21 17:09',8,28),(6,'wawawawawawawahahaha','1','2020-02-21 17:09',8,28),(7,'yayayayayaya','0','2020-02-21 17:10',8,28);
/*!40000 ALTER TABLE `t_opera_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_type`
--

LOCK TABLES `t_type` WRITE;
/*!40000 ALTER TABLE `t_type` DISABLE KEYS */;
INSERT INTO `t_type` VALUES (1,'京剧'),(2,'越剧'),(3,'川剧'),(4,'秦腔'),(5,'昆曲'),(6,'黄梅戏'),(7,'二人转'),(8,'皮影戏');
/*!40000 ALTER TABLE `t_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (8,'yuhetest','123','yuhe@hbut.edu.cn'),(9,'haha','123','iamasaltfish@gmail.com');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'xiquwang'
--

--
-- Dumping routines for database 'xiquwang'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-22 16:47:20
