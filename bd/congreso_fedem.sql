-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: congreso_fedem
-- ------------------------------------------------------
-- Server version	5.7.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `congreso_id` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `dia` int(10) unsigned NOT NULL,
  `mes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actividad_congreso1_idx` (`congreso_id`),
  CONSTRAINT `fk_actividad_congreso1` FOREIGN KEY (`congreso_id`) REFERENCES `congreso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,1,'Crea tu presupuesto','En este taller se enseñará a crear tu propio presupuesto de mudanza de forma interactiva para todos aquellas personas interesadas en este mundo.','https://www.microtech.es/hubfs/Fotos%20blog/planificacion_presupuestos.jpg','11:00:00','12:00:00',1,5),(2,1,'Mentes creativas','Desarrollaremos la capacidad de crear y de trabajar en equipo realizando este taller de escritura de ideas para crear una empresa. Esperamos que nadie se lo pierda.','https://efectonaim.net/wp-content/uploads/2014/06/brain.jpg','12:30:00','13:00:00',1,5),(3,1,'Cata de vinos de Galicia','Realizaremos una cata de los mejores vinos de Galicia realizada por el dueño de las bodegas Marqués de Bizhoja. Al finalizar, habrá un espacio para hablar con él y preguntar.','https://img.grouponcdn.com/deal/i9WntQuoTM4bFNzdpg1E/Aq-2048x1229/v1/c870x524.webp','16:30:00','17:30:00',2,5),(4,1,'Visita al parque natural','Visita guiada al parque natural de las Fragas de Eume con audioguía, un espacio natural protegido español de la provincia de La Coruña. Fragas do Eume es uno de los bosques atlánticos de ribera mejor conservados de Europa.','https://upload.wikimedia.org/wikipedia/commons/6/6a/As_fragas_do_Eume_%284640047397%29.jpg','10:00:00','13:00:00',2,5),(6,1,'Subida al mirador de Cervantes','Os Ancares es una de las zonas de Galicia que mejor conserva su autenticidad, en la que destacan sus aldeas tradicionales enmarcadas por bellos paisajes de montaña a 2.000 metros de altitud.','https://media.quincemil.com/imagenes/2021/09/30220654/Foto-5.-Mirador-de-Cervantes-Turismo-de-Galicia-1024x686.jpg','10:00:00','13:00:00',3,5),(8,1,'Paseo por la playa','Merece ser visitada en cualquier momento del día, pero especialmente con marea alta, cuando el agua alcanza los acantilados, y al atardecer, cuando los rayos de sol juegan a colarse entre los huecos de las rocas.','https://porsolea.com/wp-content/uploads/2019/06/playa-de-las-catedrales-1.jpg','17:00:00','19:30:00',3,5);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajeno`
--

DROP TABLE IF EXISTS `ajeno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ajeno` (
  `id_ajeno` int(11) NOT NULL AUTO_INCREMENT,
  `asistente_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_ajeno`),
  KEY `fk_ajeno_asistente1_idx` (`asistente_id`),
  CONSTRAINT `fk_ajeno_asistente1` FOREIGN KEY (`asistente_id`) REFERENCES `asistente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajeno`
--

LOCK TABLES `ajeno` WRITE;
/*!40000 ALTER TABLE `ajeno` DISABLE KEYS */;
INSERT INTO `ajeno` VALUES (1,1),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
/*!40000 ALTER TABLE `ajeno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajeno_asiste_actividad`
--

DROP TABLE IF EXISTS `ajeno_asiste_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ajeno_asiste_actividad` (
  `actividad_id` int(10) unsigned NOT NULL,
  `ajeno_id_ajeno` int(11) NOT NULL,
  PRIMARY KEY (`actividad_id`,`ajeno_id_ajeno`),
  KEY `fk_actividad_has_ajeno_ajeno1_idx` (`ajeno_id_ajeno`),
  KEY `fk_actividad_has_ajeno_actividad1_idx` (`actividad_id`),
  CONSTRAINT `fk_actividad_has_ajeno_actividad1` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividad_has_ajeno_ajeno1` FOREIGN KEY (`ajeno_id_ajeno`) REFERENCES `ajeno` (`id_ajeno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajeno_asiste_actividad`
--

LOCK TABLES `ajeno_asiste_actividad` WRITE;
/*!40000 ALTER TABLE `ajeno_asiste_actividad` DISABLE KEYS */;
INSERT INTO `ajeno_asiste_actividad` VALUES (2,1),(4,1),(2,3),(4,3),(1,4),(2,4),(2,5),(3,5),(6,5),(1,6),(2,6),(1,7),(2,9),(6,9),(6,10),(3,11),(6,11),(1,13),(4,14),(3,15),(4,15),(4,16),(6,17),(6,18),(4,19),(4,20),(1,21),(1,22),(8,23),(1,24),(6,24),(1,25),(1,27),(3,27),(4,27),(6,28),(8,29),(6,30),(4,31),(4,33),(8,33),(4,34),(2,35),(6,35),(8,36),(6,37),(2,38),(1,39),(1,40),(2,40),(8,42),(2,44),(2,45),(4,45),(6,45),(1,46),(3,46),(8,47),(1,48),(2,48),(3,49),(4,49),(4,50);
/*!40000 ALTER TABLE `ajeno_asiste_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistente`
--

DROP TABLE IF EXISTS `asistente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `contrasenya` varchar(45) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `genero` char(1) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `biografia` varchar(245) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistente`
--

LOCK TABLES `asistente` WRITE;
/*!40000 ALTER TABLE `asistente` DISABLE KEYS */;
INSERT INTO `asistente` VALUES (1,'ajeno','comun','ajeno','ajeno','46200','Valencia','B','https://cdn-icons-png.flaticon.com/128/560/560164.png','Usuario socio común para todos','user@gmail.com'),(2,'socio','comun','socio','socio','46200','Valencia','B','https://cdn-icons-png.flaticon.com/128/8306/8306708.png','Usuario socio común para todos','socio@gmail.com'),(3,'Alex','El Capo','Alexelcapo','pipo','07001','Mallorca','M','https://www.famousbirthdays.com/faces/alexelcapo-image.jpg','Videojugador en YouTube mega popular, conocido por sus videos de Minecraft Lets Play. Ha conseguido una audiencia de más de 1,7 millones de suscriptores desde la creación de su canal en el 2006.','alexelcapo@gmail.com'),(4,'SorryLag','Calvo','JujaLag','juji','27002','Ourense','M','https://img-static.ivoox.com/index.php?w=141&h=141&url=https://static-1.ivoox.com/audios/e/0/c/f/e0cff8440611ff241289afb55e34b3c4_XXL.jpg?ts=1633525282','Come kebabs y es portugués','jujalag@gmail.com'),(5,'Tiffie','Glavin','tglavin4','87Mfiy6EP','46200','Londres','F','https://cdn-icons-png.flaticon.com/128/2922/2922561.png','target end-to-end e-tailers','tglavin4@yale.edu'),(6,'Galina','Shory','gshory5','qvl3B7M','133 34','New York','F','https://cdn-icons-png.flaticon.com/128/1993/1993341.png','maximize intuitive markets','gshory5@wiley.com'),(7,'Whitby','Crenage','wcrenage6','2BXbyG3XcpE','46200','Paris','M','https://cdn-icons-png.flaticon.com/128/560/560277.png','target killer communities','wcrenage6@hp.com'),(8,'Rayna','Francioli','rfrancioli7','tZhf3bLXN','46200','Castellon','F','https://cdn-icons-png.flaticon.com/128/6986/6986588.png','integrate bleeding-edge communities','rfrancioli7@woothemes.com'),(9,'Miles','Duligal','mduligal8','r7o1iRgARE','2140-215','A Coruña','M','https://cdn-icons-png.flaticon.com/128/560/560199.png','morph sticky synergies','mduligal8@naver.com'),(10,'Farra','Ludye','fludye9','jq7I7WF4','46200','Tenerife','F','https://cdn-icons-png.flaticon.com/128/949/949635.pngg','extend value-added experiences','fludye9@newsvine.com'),(11,'Teri','Dunniom','tdunnioma','ITozZwZRwv','46200','Mallorca','F','https://cdn-icons-png.flaticon.com/128/3135/3135823.png','aggregate value-added applications','tdunnioma@mit.edu'),(12,'Haroun','Growy','hgrowyb','dmQMaW5nyV','4620-280','Lugo','M','https://cdn-icons-png.flaticon.com/128/4140/4140037.png','expedite web-enabled niches','hgrowyb@cocolog-nifty.com'),(13,'Boothe','Duncanson','bduncansonc','WJVolpr1','46200','Madrid','M','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','evolve scalable schemas','bduncansonc@yahoo.co.jp'),(14,'Yvette','Fritche','yfritched','NrJ9TpoE','4620-875','Zaragoza','F','https://cdn-icons-png.flaticon.com/128/8610/8610419.png','orchestrate web-enabled channels','yfritched@cyberchimps.com'),(15,'Maurita','Shenfisch','mshenfische','EESxnX','5409','Barcelona','F','https://cdn-icons-png.flaticon.com/128/3135/3135789.png','exploit frictionless convergence','mshenfische@blogs.com'),(16,'Dru','Hastie','dhastief','tg3NBm','623650','Gerona','M','https://cdn-icons-png.flaticon.com/128/4140/4140059.png','morph B2B deliverables','dhastief@google.it'),(17,'Bert','Trower','btrowerg','rC5UfvKvOgTy','520-2541','Cáceres','M','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','recontextualize sticky eyeballs','btrowerg@php.net'),(18,'Giselle','Flipek','gflipekh','fOdTo0y','46200','Pontevedra','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','brand value-added e-tailers','gflipekh@cocolog-nifty.com'),(19,'Ernie','Aitchinson','eaitchinsoni','M8orWRCdeHoh','46200','Bilbao','M','https://cdn-icons-png.flaticon.com/128/4537/4537055.png','implement strategic initiatives','eaitchinsoni@yellowbook.com'),(20,'Ruperta','Livett','rlivettj','AbNmI0NxQV','46200','Málaga','F','https://cdn-icons-png.flaticon.com/128/3220/3220315.png','iterate front-end action-items','rlivettj@usda.gov'),(21,'Emmett','Stuehmeyer','estuehmeyerk','KrRVcrCM','46200','Ávila','M','https://cdn-icons-png.flaticon.com/128/4202/4202831.png','harness sexy action-items','estuehmeyerk@ezinearticles.com'),(22,'Lionel','Clancey','lclanceyl','jsyJH2dAUt','46200','Londres','M','https://cdn-icons-png.flaticon.com/128/4526/4526437.png','evolve interactive convergence','lclanceyl@photobucket.com'),(23,'Florrie','Mawhinney','fmawhinneym','qqDjCXT','46200','Andorra','F','https://cdn-icons-png.flaticon.com/128/1993/1993338.png','enhance revolutionary e-markets','fmawhinneym@squidoo.com'),(24,'Lyn','Pawlata','lpawlatan','rOH6lqvo','1444','Paris','M','https://cdn-icons-png.flaticon.com/128/3011/3011270.png','reintermediate robust channels','lpawlatan@wikia.com'),(25,'Cirilo','Penton','cpentono','2e2M4zz9B7','J1X','Berlin','M','https://cdn-icons-png.flaticon.com/128/1864/1864509.png','embrace world-class methodologies','cpentono@icio.us'),(26,'Harlene','Leggs','hleggsp','F36vOvRM32','46200','Segovia','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','revolutionize sticky markets','hleggsp@edublogs.org'),(27,'Lorin','Asaaf','lasaafq','C7U8HA','664 05','Palencia','M','https://cdn-icons-png.flaticon.com/128/4086/4086679.png','optimize frictionless experiences','lasaafq@1688.com'),(28,'Dorena','McGinlay','dmcginlayr','fmZ19STk39c','5400-715','Menorca','F','https://cdn-icons-png.flaticon.com/128/1993/1993338.png','redefine killer interfaces','dmcginlayr@plala.or.jp'),(29,'Laure','Devonside','ldevonsides','CrY4MPQwzxnA','46200','Zakupne','F','https://cdn-icons-png.flaticon.com/128/2335/2335114.png','disintermediate cross-media platforms','ldevonsides@studiopress.com'),(30,'Pammie','Jodlowski','pjodlowskit','yvbzEmnPgtr','4311','Pasian','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','exploit 24/365 e-markets','pjodlowskit@nature.com'),(31,'Ally','Gouldsmith','agouldsmithu','fL7Dn2','4149','Concepción','F','https://cdn-icons-png.flaticon.com/128/4526/4526323.png','engineer proactive methodologies','agouldsmithu@cbslocal.com'),(32,'Fay','Esche','feschev','4tU9gfu','852 30','Sundsvall','F','https://cdn-icons-png.flaticon.com/128/921/921089.png','aggregate real-time communities','feschev@yahoo.co.jp'),(33,'Jaye','Hindmoor','jhindmoorw','i04Rri','655770','Bilbao','M','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','architect world-class networks','jhindmoorw@redcross.org'),(34,'Jodie','Reveley','jreveleyx','OdL6uOFYRcB','62767','Cuauhtemoc','M','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','streamline proactive vortals','jreveleyx@imdb.com'),(35,'Josefina','Dougliss','jdouglissy','o6KGr1R','46200','Purwodadi','F','https://cdn-icons-png.flaticon.com/128/8599/8599131.png','reinvent vertical convergence','jdouglissy@fotki.com'),(36,'Prudy','Taill','ptaillz','Lwz3Qw81piZ','46200','Bilbao','F','https://cdn-icons-png.flaticon.com/128/201/201634.png','embrace impactful platforms','ptaillz@pagesperso-orange.fr'),(37,'Ty','Vaisey','tvaisey10','b0xB9E3','46200','Longzhong','M','https://cdn-icons-png.flaticon.com/128/5556/5556512.png','whiteboard vertical ROI','tvaisey10@oaic.gov.au'),(38,'Britt','Brosoli','bbrosoli11','XJF4IfZH','5250','Villa Ojo de Agua','F','https://cdn-icons-png.flaticon.com/128/3079/3079697.png','reinvent turn-key solutions','bbrosoli11@multiply.com'),(39,'Annemarie','Brothers','abrothers12','FFHUwdr','9204','Madrid','F','https://cdn-icons-png.flaticon.com/128/4139/4139951.png','recontextualize mission-critical markets','abrothers12@mit.edu'),(40,'Dianemarie','Jenicek','djenicek13','kUwdtOcY','46200','Madrid','F','https://cdn-icons-png.flaticon.com/128/2922/2922656.png','aggregate dot-com paradigms','djenicek13@sciencedirect.com'),(41,'Dicky','Ivushkin','divushkin14','n9XI53sVCW','46200','Dzüünbulag','M','https://cdn-icons-png.flaticon.com/128/560/560207.png','exploit visionary communities','divushkin14@cargocollective.com'),(42,'Delinda','Vader','dvader15','rXaT6abS','46200','Tân Sơn','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','matrix revolutionary markets','dvader15@oaic.gov.au'),(43,'Lauretta','Lemary','llemary16','lbVLu26E','46200','Áno Merá','F','https://cdn-icons-png.flaticon.com/128/4113/4113022.png','repurpose proactive architectures','llemary16@cargocollective.com'),(44,'Elwood','Urch','eurch17','FzkD34z','46200','Hongshi','M','https://cdn-icons-png.flaticon.com/128/2922/2922532.png','whiteboard wireless niches','eurch17@barnesandnoble.com'),(45,'Donna','Galea','dgalea18','KJipmJ6uDvqd','46200','Bilbao','F','https://cdn-icons-png.flaticon.com/128/4140/4140051.png','engage proactive paradigms','dgalea18@eepurl.com'),(46,'Dunn','Wittrington','dwittrington19','o80vkrLZXBN','46200','Wonda','M','https://cdn-icons-png.flaticon.com/128/2566/2566158.png','target efficient platforms','dwittrington19@linkedin.com'),(47,'Wyatt','Claisse','wclaisse1a','dsvH4z4K','398 53','Chyšky','M','https://cdn-icons-png.flaticon.com/128/4128/4128176.png','implement innovative communities','wclaisse1a@joomla.org'),(48,'Ardys','Belverstone','abelverstone1b','FwTBPv2M0','46200','Ourense','F','https://cdn-icons-png.flaticon.com/128/5834/5834272.png','enable e-business infrastructures','abelverstone1b@smugmug.com'),(49,'Joete','Dulwich','jdulwich1c','qrm9xvgUaR','46200','Madrid','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','scale proactive technologies','jdulwich1c@163.com'),(50,'Melonie','Edgler','medgler1d','ATGxi3M4zxhv','3503','Dassun','F','https://cdn-icons-png.flaticon.com/128/2922/2922580.png','enhance magnetic methodologies','medgler1d@indiatimes.com'),(51,'Allianora','Boyd','aboyd1e','nGZIuV','601508','Bilbao','F','https://cdn-icons-png.flaticon.com/128/2922/2922624.png','enhance value-added systems','aboyd1e@columbia.edu'),(52,'Natalina','Hamner','nhamner1f','5Hh5qVGm55nk','44511','Ourense','F','https://cdn-icons-png.flaticon.com/128/2922/2922588.png','incentivize strategic convergence','nhamner1f@rambler.ru'),(53,'Kirsteni','Winterton','kwinterton1g','nIj5GCD8A','7216','Могила','F','https://cdn-icons-png.flaticon.com/128/560/560261.png','repurpose global deliverables','kwinterton1g@zimbio.com'),(54,'Tannie','Cradick','tcradick1h','kcF7VcOvn','46200','Bilbao','M','https://cdn-icons-png.flaticon.com/128/2922/2922686.png','integrate innovative e-commerce','tcradick1h@sbwire.com'),(55,'Anstice','Osgar','aosgar1i','XbRT7cA','46200','Puzi','F','https://cdn-icons-png.flaticon.com/128/3079/3079658.png','strategize robust platforms','aosgar1i@deliciousdays.com'),(56,'Devan','Bridgett','dbridgett1j','uLCRNN','46200','Ourense','F','https://cdn-icons-png.flaticon.com/128/560/560223.png','facilitate 24/7 e-commerce','dbridgett1j@disqus.com'),(57,'Hillery','Bewly','hbewly1k','TUmRcrxpDyyX','46200','Bilbao','M','https://cdn-icons-png.flaticon.com/128/4139/4139993.png','maximize viral portals','hbewly1k@nydailynews.com'),(58,'Sherry','Storah','sstorah1l','Pxkr2tMgwq','46200','Valencia','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','implement sticky deliverables','sstorah1l@1688.com'),(59,'Marlee','Norcott','mnorcott1m','sXPKd90','96370','Lugo','F','https://cdn-icons-png.flaticon.com/128/2922/2922650.png','maximize end-to-end interfaces','mnorcott1m@tiny.cc'),(60,'Katrinka','Willoughby','kwilloughby1n','dfIgPI','9201','Mapulo','F','https://cdn-icons-png.flaticon.com/128/921/921053.png','maximize dot-com supply-chains','kwilloughby1n@hubpages.com'),(61,'West','Iley','wiley1o','uPQ1azGxA3m','46200','Madrid','M','https://cdn-icons-png.flaticon.com/128/3849/3849119.png','redefine holistic interfaces','wiley1o@indiatimes.com'),(62,'Maryann','Cockett','mcockett1p','PlILn4Kv','SY4','Lugo','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','enable scalable supply-chains','mcockett1p@odnoklassniki.ru'),(63,'Phineas','Skacel','pskacel1q','SSn0a6','257 01','Lugo','M','https://cdn-icons-png.flaticon.com/128/3641/3641963.png','implement world-class systems','pskacel1q@unicef.org'),(64,'Grady','Barthelme','gbarthelme1r','qRa5Tp','46200','Lugo','M','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','scale innovative markets','gbarthelme1r@themeforest.net'),(65,'Rosita','de Clerc','rdeclerc1s','jvrAkM','46200','Bilbao','F','https://cdn-icons-png.flaticon.com/128/3227/3227372.png','integrate virtual partnerships','rdeclerc1s@yelp.com'),(66,'Sapphire','Castanares','scastanares1t','tfNtC0EuvsP','46200','Bilbao','F','https://cdn-icons-png.flaticon.com/128/999/999104.png','exploit scalable methodologies','scastanares1t@themeforest.net'),(67,'Den','Hurkett','dhurkett1u','QGVl7tut5eC','46200','Juwana','M','https://cdn-icons-png.flaticon.com/128/4140/4140061.png','visualize value-added architectures','dhurkett1u@is.gd'),(68,'Gus','Peller','gpeller1v','33q8BwfqJQa','46200','Bilbao','F','https://cdn-icons-png.flaticon.com/128/7419/7419937.png','e-enable integrated architectures','gpeller1v@zimbio.com'),(69,'Chrisy','Lopez','clopez1w','o4A70K6H','11140','Bang Yai','M','https://cdn-icons-png.flaticon.com/128/3449/3449611.png','recontextualize end-to-end eyeballs','clopez1w@fastcompany.com'),(70,'Clerc','Arrow','carrow1x','rUqdc7','933 82','Valencia','M','https://cdn-icons-png.flaticon.com/128/2922/2922527.png','whiteboard killer e-markets','carrow1x@paginegialle.it'),(71,'Tressa','Galton','tgalton1y','shw3vBiANeZ','46200','Bilbao','F','https://cdn-icons-png.flaticon.com/128/6705/6705543.png','aggregate enterprise platforms','tgalton1y@xrea.com'),(72,'Ursa','Shercliff','ushercliff1z','2AaFcKKM','301288','Rasskazovo','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','implement end-to-end technologies','ushercliff1z@biblegateway.com'),(73,'Lona','Knightsbridge','lknightsbridge20','u6NrIBkl','80130','Bilbao','F','https://cdn-icons-png.flaticon.com/128/560/560250.png','aggregate front-end e-markets','lknightsbridge20@cam.ac.uk'),(74,'Pattie','Jaggard','pjaggard21','OcSGcRYx','46200','Valencia','F','https://cdn-icons-png.flaticon.com/128/3611/3611388.png','engage intuitive solutions','pjaggard21@liveinternet.ru'),(75,'Davidson','Heigold','dheigold22','jAbGH0','32-447','Lugo','M','https://cdn-icons-png.flaticon.com/128/6267/6267935.png','aggregate mission-critical vortals','dheigold22@parallels.com'),(76,'Abbot','Ure','aure23','U5CiUVfcf5U','46200','Bilbao','M','https://cdn-icons-png.flaticon.com/128/4202/4202849.png','engineer B2B e-services','aure23@ucsd.edu'),(77,'Jonathon','Cremins','jcremins24','PZRr7e','8655','Valencia','M','https://cdn-icons-png.flaticon.com/128/7701/7701985.png','synergize dot-com systems','jcremins24@illinois.edu'),(78,'Friederike','Dalziel','fdalziel25','hfY6iaHc','46200','Lugo','F','https://cdn-icons-png.flaticon.com/128/3621/3621342.png','integrate end-to-end metrics','fdalziel25@wikimedia.org'),(79,'Marcos','Lillo','mlillo26','hc2yIy','46200','Ourense','M','https://cdn-icons-png.flaticon.com/128/6315/6315712.png','generate integrated ROI','mlillo26@businessweek.com'),(80,'Eryn','Wheatland','ewheatland27','XvUvm1JZsV1Y','46200','Madrid','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','streamline global schemas','ewheatland27@java.com'),(81,'Lincoln','Ginnally','lginnally28','MBwb7sTBOY','46200','Lugo','M','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','unleash interactive architectures','lginnally28@yale.edu'),(82,'Renato','Bury','rbury29','RMCwBziOySG1','46200','Lugo','M','https://cdn-icons-png.flaticon.com/128/4293/4293769.png','incubate vertical synergies','rbury29@nytimes.com'),(83,'Hulda','Fernehough','hfernehough2a','L7EJ4bhP','37600-000','Bilbao','F','https://cdn-icons-png.flaticon.com/128/4158/4158045.png','incubate one-to-one niches','hfernehough2a@macromedia.com'),(84,'Perl','Baggs','pbaggs2b','9QYpYi','121 32','Valencia','F','https://cdn-icons-png.flaticon.com/128/8599/8599130.png','monetize killer action-items','pbaggs2b@pbs.org'),(85,'Dallis','De Robertis','dderobertis2c','F63xfuReyyN','46200','Valencia','M','https://cdn-icons-png.flaticon.com/128/8526/8526393.png','empower user-centric portals','dderobertis2c@sitemeter.com'),(86,'Winna','Bywaters','wbywaters2d','8SqvNGwCxOlc','1746','Bilbao','F','https://cdn-icons-png.flaticon.com/128/7127/7127430.png','reintermediate enterprise communities','wbywaters2d@thetimes.co.uk'),(87,'Mira','Sprigg','msprigg2e','a7QBwLFN','46200','Valencia','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','engineer front-end action-items','msprigg2e@house.gov'),(88,'Ogdon','Pinke','opinke2f','hUGfWHt5sXcQ','46200','Valencia','M','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','architect viral paradigms','opinke2f@wired.com'),(89,'Christalle','Rubenovic','crubenovic2g','MT0CO8oK','33405','Ourense','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','drive end-to-end users','crubenovic2g@nationalgeographic.com'),(90,'Kingsley','Gumn','kgumn2h','gPfV8y','933 82','Valencia','M','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','harness virtual deliverables','kgumn2h@aol.com'),(91,'Marcile','Dorn','mdorn2i','I6QbNzgxJ9','46200','Lugo','F','https://cdn-icons-png.flaticon.com/128/2293/2293826.png','reintermediate seamless web-readiness','mdorn2i@cam.ac.uk'),(92,'Robyn','Southernwood','rsouthernwood2j','NdvrqNRDU','46200','Lugo','F','https://cdn-icons-png.flaticon.com/128/1785/1785896.png','maximize enterprise supply-chains','rsouthernwood2j@1688.com'),(93,'Dick','Budnk','dbudnk2k','ocygyn','520006','Lugo','M','https://cdn-icons-png.flaticon.com/128/163/163837.png','integrate sticky mindshare','dbudnk2k@ask.com'),(94,'Desdemona','Hackly','dhackly2l','wWu2d8eqb','4427','Bilbao','F','https://cdn-icons-png.flaticon.com/128/2922/2922554.png','benchmark frictionless ROI','dhackly2l@xrea.com'),(95,'Jud','Alstead','jalstead2m','LhBr5Tg','12559','Valencia','M','https://cdn-icons-png.flaticon.com/128/560/560260.png','incubate one-to-one interfaces','jalstead2m@nba.com'),(96,'Bennie','Cerie','bcerie2n','EtMfllLek','46200','Dvorovi','M','https://cdn-icons-png.flaticon.com/128/5834/5834376.png','revolutionize 24/7 content','bcerie2n@examiner.com'),(97,'Oliy','Farquhar','ofarquhar0','V6ckAZVNOf','10270','Valencia','F','https://cdn-icons-png.flaticon.com/128/7396/7396731.png','architect value-added niches','ofarquhar0@bloglines.com'),(98,'Berke','Abelovitz','babelovitz1','X6VnRl','46200','Baiyang','M','https://cdn-icons-png.flaticon.com/128/4113/4113040.png','cultivate intuitive methodologies','babelovitz1@fotki.com'),(99,'Odelle','Glanz','oglanz3','4ld5oSo','20430','Madrid','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','engineer B2B models','oglanz3@jiathis.com'),(100,'Oliy','Farquhar','ofarquhar0','V6ckAZVNOf','10270','Samut Prakan','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','architect value-added niches','ofarquhar0@bloglines.com'),(101,'Laetitia','Shute','lshute2','bj1r71','46200','Berlin','F','https://img2.freepng.es/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg','transform killer infrastructures','lshute2@slideshare.net');
/*!40000 ALTER TABLE `asistente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bono`
--

DROP TABLE IF EXISTS `bono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bono` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `puesto_comida_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bono_puesto_comida1_idx` (`puesto_comida_id`),
  CONSTRAINT `fk_bono_puesto_comida1` FOREIGN KEY (`puesto_comida_id`) REFERENCES `puesto_comida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bono`
--

LOCK TABLES `bono` WRITE;
/*!40000 ALTER TABLE `bono` DISABLE KEYS */;
INSERT INTO `bono` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `bono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bono_asistente`
--

DROP TABLE IF EXISTS `bono_asistente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bono_asistente` (
  `bono_id` int(10) unsigned NOT NULL,
  `asistente_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bono_id`,`asistente_id`),
  KEY `fk_bono_has_asistente_asistente1_idx` (`asistente_id`),
  KEY `fk_bono_has_asistente_bono1_idx` (`bono_id`),
  CONSTRAINT `fk_bono_has_asistente_asistente1` FOREIGN KEY (`asistente_id`) REFERENCES `asistente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bono_has_asistente_bono1` FOREIGN KEY (`bono_id`) REFERENCES `bono` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bono_asistente`
--

LOCK TABLES `bono_asistente` WRITE;
/*!40000 ALTER TABLE `bono_asistente` DISABLE KEYS */;
INSERT INTO `bono_asistente` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9);
/*!40000 ALTER TABLE `bono_asistente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congreso`
--

DROP TABLE IF EXISTS `congreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `congreso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(245) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `aforo` int(11) NOT NULL,
  `localizacion` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congreso`
--

LOCK TABLES `congreso` WRITE;
/*!40000 ALTER TABLE `congreso` DISABLE KEYS */;
INSERT INTO `congreso` VALUES (1,'Congreso Fedem 2024','La Federación Española de Empresas de Mudanzas (FEDEM) es la asociación que aglutina a las empresas de mudanzas en el ámbito nacional. En la actualidad, es la principal organización de empresas de Mudanzas, guardamuebles y trasteros de España.','2024-05-01 00:00:00','2024-05-04 00:00:00',250,'A Coruña','https://sirelo.es/wp-content/uploads/2017/11/FEDEM.png');
/*!40000 ALTER TABLE `congreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congreso_tiene_patrocinador`
--

DROP TABLE IF EXISTS `congreso_tiene_patrocinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `congreso_tiene_patrocinador` (
  `congreso_id` int(10) unsigned NOT NULL,
  `patrocinador_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`congreso_id`,`patrocinador_id`),
  KEY `fk_congreso_has_patrocinador_patrocinador1_idx` (`patrocinador_id`),
  KEY `fk_congreso_has_patrocinador_congreso1_idx` (`congreso_id`),
  CONSTRAINT `fk_congreso_has_patrocinador_congreso1` FOREIGN KEY (`congreso_id`) REFERENCES `congreso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_congreso_has_patrocinador_patrocinador1` FOREIGN KEY (`patrocinador_id`) REFERENCES `patrocinador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congreso_tiene_patrocinador`
--

LOCK TABLES `congreso_tiene_patrocinador` WRITE;
/*!40000 ALTER TABLE `congreso_tiene_patrocinador` DISABLE KEYS */;
INSERT INTO `congreso_tiene_patrocinador` VALUES (1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,13),(1,14),(1,15);
/*!40000 ALTER TABLE `congreso_tiene_patrocinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230111185945','2023-01-11 19:01:49',1274),('DoctrineMigrations\\Version20230114120829','2023-01-14 12:09:29',2066),('DoctrineMigrations\\Version20230115100407','2023-01-15 10:04:57',2054),('DoctrineMigrations\\Version20230115101133','2023-01-15 10:13:12',1098),('DoctrineMigrations\\Version20230115171626','2023-01-15 17:19:22',2054);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `cif` varchar(255) NOT NULL,
  `enlace` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_id_idx` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Reddit','Calle Amador de los rios, 1 - PISO 1 Madrid 28010 madrid','https://www.redditinc.com/assets/images/site/reddit-logo.png','B87526372','https://www.reddit.com/'),(2,'Amazon','CALLE RAMIREZ DE PRADO, 5','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/480px-Amazon_logo.svg.png','B84570936','https://www.amazon.es/'),(3,'Mudanzas Hercules','Pol. Ind. La Grela, Calle de, Rúa Severo Ochoa, 35, 15008 A Coruña','https://www.xn--mudanzasherculescorua-vbc.es/images/logo-mudanzas-hercules.svg','B15046337','https://www.mudanzasherculescoruña.es/'),(4,'Mudanzas Mudinmar','55937 Muir Way','https://fedem.es/wp-content/uploads/2017/02/transportes-internacionales-mudinmar-logo-principal.jpg','B46438917','https://www.mudinmar.com/es/?gclid=Cj0KCQiAlKmeBhCkARIsAHy7WVupCTNnBF4b56v_8dEBHmAjoBWG1uBakovOBfLZ1kH8XQYikNzUGYgaAn61EALw_wcB'),(5,'Mudanzas Sevilla','7 Starling Street','https://fedem.es/wp-content/uploads/2017/02/mudanzas-fedem-logo-empresa-mudanzas-sevilla-madrid.jpg','B78589587','https://mudanzas-y-portes-luna-sevilla.negocio.site/?gclid=CjwKCAiAwomeBhBWEiwAM43YIAbFB-xXRsD1Bu1DcZYMe_G7pKwgpGzWOnmSw6dG1EQH_XA1-Fl32xoCZtQQAvD_BwE'),(6,'Megatrans','7610 Reindahl Center','http://extranet.megatrans.com.ar/megaIntranet/images/logo2.png','B58961533','https://megatransmudanzas.es/'),(7,'Mudanzas Feltrero','124 Northland Street','https://fedem.es/wp-content/uploads/2017/01/mudanzas-fedem-logo-empresa-feltrero-arte.jpg','B37281250','https://www.mudanzasfeltrero.com/'),(8,'Global Mudanzas','4 Victoria Point','https://image.skycdn.net/300x109/73a218b2-ceae-4102-a806-b24b4d3b268c_Global_Mudanzas.png_72364244458b92a79ea23e.png','B65821340','https://www.facebook.com/GlobalMudanzas/'),(9,'Mudanzas Plus Madrid','7 Miller Park','https://movanza.plusservices.es/wp-content/uploads/2019/04/movanza-grupo-plus-services-logo.png','B88223300','https://mudanzasplusmadrid.ueniweb.com/'),(10,'Mudanzas Suñer','9781 Longview Pass','https://multimedia.paginasamarillas.es/adsContentSrv/157311440-3-0/22b83307-9710-4473-987c-e7e745d998db/MudanzasSuner.jpg','B57011413','https://www.mudanzassuner.com/'),(11,'Mudanzas Iger','874 Fuller Drive','https://mudanzascarlos.com/wp-content/uploads/2020/12/logo-web-ancho-retina.jpg','B59959965','http://www.carlostransport.com/'),(12,'Transportes Antonio','307 Clemons Circle','https://www.tapsl.info/uploads/KMJYnyVM/260x0_404x0/logo-transportes-antonio-pascual_661.jpg','B19513134','https://www.tapsl.info/'),(13,'Mudanzas Preciado','00393 Northport Point','https://srl.ams3.cdn.digitaloceanspaces.com/logos/mudanzas-preciado-san-sebastian.jpg','B10327278','https://www.lamudanza.es/empresa/mudanzas-preciado-donostia-san-sebastian-4147827/'),(14,'Mudanzas La Famosa','0605 Arrowood Trail','https://image.skycdn.net/300x109/8277ca69-b12f-42d3-ac63-8f0be0c09943_Screenshot_20180511-130104.png','B78590783','https://www.mudanzasonline.es/mudanzas-la-famosa.html'),(15,'InfoJobs','66116 Gerald Parkway','https://brand.infojobs.net/images/logo-base.png','A62134309','https://www.infojobs.net/'),(16,'Consum','16786 Montana Terrace','http://www.joseluis-lozano.com/wp-content/uploads/2019/09/logo-vector-consum-450x229.jpg','F46078986','https://www.consum.es/'),(17,'Grupo Amygo','634 Lunder Road','https://www.grupoamygo.com/wp-content/themes/understrap-child/images/grupo_amygo.png','A81970568','https://www.grupoamygo.com/'),(18,'Cepsa','17 Charing Cross Avenue','https://www.conmarca.com/archivos/espectacles_foto_gran/170510052256_cepsa_gr.jpg','A28003119','https://www.cepsa.es/es/particular'),(19,'IContainers','949 5th Park','http://fjme.org/wp-content/uploads/2014/06/logos-cuadrado-icontainers.png','B64625775','https://www.icontainers.com/es/'),(20,'B+Safe','6 Burning Wood Junction','https://dypdvfcjkqkg2.cloudfront.net/large/3080984-1132.png','B86479078','https://b-safe.es/'),(21,'ByLogic','2602 Hudson Avenue','https://2016.youngmovers.eu/wp-content/uploads/sites/5/2014/11/Logo-Bylogic-2-768x303.jpg','B90226200','https://www.bylogic.es/es/'),(22,'DsSmith','25784 Hauk Road','https://www.bmbpages.biz/storage/uploads/companies/general/logo-pictures//212-Logo-Thumb.jpeg','B81907701','https://www.dssmith.com/es'),(23,'JFN Seguros','001 Sunfield Crossing','https://jfnmejoratuseguro.com/wp-content/uploads/2022/01/jfn-correduria-seguros.png','B40598310','https://jfnmejoratuseguro.com/'),(25,'Rivera Group','89 Algoma Plaza','https://riveragroup.es/wp-content/uploads/2022/03/Logotipo-Rivera-group-2022-blanco-03.png','B35284082','https://riveragroup.es/'),(26,'JM Cañadas','1 Debs Place','https://anaip.es/ocs/wp-content/uploads/2021/09/TRANSP.-LIQUIDOS-CAA%E2%80%98ADAS.png','B17712043','https://jmcanadas.com/es/inicio/'),(27,'Textiles Manuel Gil','57 Melby Alley','https://www.manuelgil.com/headers/header_20210422.jpg','J26031948','https://www.mundomudanzas.com/empresas/textil-manuel-gil'),(29,'Isuzu','065 Pepper Wood Road','https://1000marcas.net/wp-content/uploads/2020/03/logo-Isuzu-640x360.png','B84071844','https://isuzualmenar.com/?gclid=CjwKCAiAwomeBhBWEiwAM43YINtUyYjdXyjOIPy4BB9l8jNFgXBXrU5MBC19azt9rEXrfPSOdkbwgRoCUfQQAvD_BwE'),(30,'Brisa Motor','539 Northland Lane','http://www.icamp.es/wp-content/uploads/2017/03/grupoari_laspalmas_icamp_marca.gif','B35491794','https://red.nissan.es/brisamotor'),(31,'Cem Elevadores','63 Maywood Plaza','https://www.cemladderlift.com/wp-content/themes/cemladderlift-multi/images/cem-logo.svg','B40602518','https://www.cemelevadores.es/'),(32,'TriGlobal','9 Carioca Way','https://uploads.magnetme-images.com/8922e674086e63ae260222dcd104db74?auto=compress,format&fit=crop&h=750&w=2000','B02741197','https://www.triglobal.org/');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `congreso_id` int(10) unsigned NOT NULL,
  `asistente_id` int(10) unsigned NOT NULL,
  `codigo_qr` varchar(255) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrada_congreso1_idx` (`congreso_id`),
  KEY `fk_entrada_asistente1_idx` (`asistente_id`),
  CONSTRAINT `fk_entrada_asistente1` FOREIGN KEY (`asistente_id`) REFERENCES `asistente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,1,1,'12345','2023-01-14 14:50:04','estandar'),(2,1,2,'2864','2022-03-12 19:12:28','estandar'),(3,1,3,'3401','2023-02-04 21:49:55','estandar'),(4,1,4,'2437','2023-10-26 22:42:04','estandar'),(5,1,5,'3739','2023-06-09 02:54:08','estandar'),(6,1,6,'3634','2022-09-20 06:07:44','estandar'),(7,1,7,'1777','2022-05-31 09:04:00','estandar'),(8,1,8,'4633','2023-04-23 22:39:10','estandar'),(9,1,9,'1927','2023-01-06 03:35:51','estandar'),(10,1,10,'2229','2023-08-19 16:23:57','estandar'),(11,1,11,'1821','2023-08-23 17:25:14','estandar'),(12,1,12,'2756','2023-08-14 04:19:14','estandar'),(13,1,13,'1901','2023-12-26 10:13:36','estandar'),(14,1,14,'1027','2023-08-28 16:52:46','estandar'),(15,1,15,'4997','2023-05-27 01:00:56','estandar'),(16,1,16,'4564','2022-03-01 08:45:25','estandar'),(17,1,17,'3319','2022-05-04 02:17:12','estandar'),(18,1,18,'2893','2023-02-10 07:11:41','estandar'),(19,1,19,'3693','2023-08-15 16:59:09','estandar'),(20,1,20,'1293','2023-02-06 20:27:03','estandar'),(21,1,21,'1445','2022-01-24 09:06:03','estandar'),(22,1,22,'1108','2023-06-20 17:15:45','estandar'),(23,1,23,'2124','2023-02-05 02:53:33','estandar'),(24,1,24,'3437','2023-12-11 09:35:18','estandar'),(25,1,25,'3400','2023-07-13 02:29:25','estandar'),(26,1,26,'3862','2023-09-07 06:28:34','estandar'),(27,1,27,'1102','2023-10-13 05:52:30','estandar'),(28,1,28,'1695','2023-07-01 17:46:32','estandar'),(29,1,29,'1434','2022-01-17 12:53:53','estandar'),(30,1,30,'1459','2022-06-02 04:28:46','estandar'),(31,1,31,'4011','2023-10-18 15:13:42','estandar'),(32,1,32,'4529','2023-04-24 07:27:18','estandar'),(33,1,33,'2510','2022-01-20 23:55:21','estandar'),(34,1,34,'4627','2022-07-21 08:24:14','estandar'),(35,1,35,'1689','2022-02-07 02:14:48','estandar'),(36,1,36,'4647','2022-10-09 02:30:11','estandar'),(37,1,37,'3446','2022-12-05 16:40:28','estandar'),(38,1,38,'2598','2023-06-08 00:58:11','estandar'),(39,1,39,'4512','2023-09-03 15:19:24','estandar'),(40,1,40,'4050','2022-12-31 11:49:12','estandar'),(41,1,41,'3175','2023-12-12 16:10:30','estandar'),(42,1,42,'1477','2022-01-20 15:28:32','estandar'),(43,1,43,'1088','2022-04-27 11:08:05','estandar'),(44,1,44,'4317','2022-12-19 20:35:16','estandar'),(45,1,45,'2304','2022-09-12 07:16:15','estandar'),(46,1,46,'2858','2023-06-10 06:16:57','estandar'),(47,1,47,'4717','2022-06-14 23:47:49','estandar'),(48,1,48,'4316','2022-09-27 15:46:00','estandar'),(49,1,49,'2590','2023-05-27 13:37:24','estandar'),(50,1,50,'3342','2022-03-31 03:28:54','estandar'),(51,1,51,'1125','2023-07-18 18:27:25','estandar'),(52,1,52,'2830','2023-11-12 13:18:38','estandar'),(53,1,53,'2485','2023-08-20 08:35:33','estandar'),(54,1,54,'4152','2022-12-14 00:32:12','estandar'),(55,1,55,'2239','2022-12-11 17:19:00','estandar'),(56,1,56,'1347','2022-01-27 20:26:49','estandar'),(57,1,57,'2843','2023-06-23 10:16:46','estandar'),(58,1,58,'2544','2023-12-11 11:33:28','estandar'),(59,1,59,'3001','2022-12-25 22:04:34','estandar'),(60,1,60,'2253','2022-05-30 02:44:49','estandar'),(61,1,61,'3218','2023-05-28 08:28:33','estandar'),(62,1,62,'2274','2022-12-30 11:32:34','estandar'),(63,1,63,'2243','2023-08-07 07:51:53','estandar'),(64,1,64,'4059','2022-11-24 05:02:48','estandar'),(65,1,65,'2427','2023-12-08 15:27:41','estandar'),(66,1,66,'4089','2022-12-06 09:58:40','estandar'),(67,1,67,'1906','2022-04-08 04:49:31','estandar'),(68,1,68,'1073','2022-02-26 09:31:13','estandar'),(69,1,69,'3556','2022-05-07 21:35:18','estandar'),(70,1,70,'1382','2023-08-21 20:42:41','estandar'),(71,1,71,'1056','2022-05-23 09:51:39','estandar'),(72,1,72,'1552','2022-03-10 13:22:08','estandar'),(73,1,73,'4045','2022-05-20 06:40:28','estandar'),(74,1,74,'4055','2022-12-03 19:52:08','estandar'),(75,1,75,'4258','2023-01-21 03:37:32','estandar'),(76,1,76,'4554','2023-08-10 06:29:04','estandar'),(77,1,77,'1179','2023-09-06 06:31:10','estandar'),(78,1,78,'4228','2023-09-29 00:47:46','estandar'),(79,1,79,'4929','2023-03-10 09:13:34','estandar'),(80,1,80,'1104','2023-05-30 15:31:13','estandar'),(81,1,81,'1077','2023-03-31 00:16:41','estandar'),(82,1,82,'4145','2022-09-04 18:33:53','estandar'),(83,1,83,'2405','2023-09-10 18:14:47','estandar'),(84,1,84,'2309','2023-08-13 18:36:48','estandar'),(85,1,85,'3039','2022-03-11 08:25:12','estandar'),(86,1,86,'3300','2023-06-13 17:15:58','estandar'),(87,1,87,'1985','2022-07-23 05:51:52','estandar'),(88,1,88,'1401','2023-11-15 17:12:13','estandar'),(89,1,89,'4928','2023-10-28 23:49:07','estandar'),(90,1,90,'3513','2022-02-13 13:06:08','estandar'),(91,1,91,'2282','2022-03-26 22:40:01','estandar'),(92,1,92,'4855','2022-04-23 02:55:21','estandar'),(93,1,93,'3564','2022-10-27 01:34:49','estandar'),(94,1,94,'3118','2023-09-28 16:15:04','estandar'),(95,1,95,'2053','2022-10-17 06:46:21','estandar'),(96,1,96,'1976','2023-10-15 21:45:31','estandar'),(97,1,97,'3972','2023-11-09 01:22:29','estandar'),(98,1,98,'4541','2022-10-21 03:13:09','estandar'),(99,1,99,'3885','2023-11-07 05:00:41','estandar'),(100,1,100,'3227','2023-08-14 04:04:36','estandar'),(101,1,101,'4285','2023-11-01 04:26:58','estandar');
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `congreso_id` int(10) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(245) NOT NULL,
  `lugar` varchar(45) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `dia` int(10) unsigned NOT NULL,
  `mes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_evento_congreso1_idx` (`congreso_id`),
  CONSTRAINT `fk_evento_congreso1` FOREIGN KEY (`congreso_id`) REFERENCES `congreso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,1,'Materiales para la mudanza','Daremos una amplia explicación sobre los distintos tipos de materiales y la importancia que tienen para su uso. Enseñaremos sus diferencias y pondremos en común los tipos de materiales utilizados por las empresas que figuran en el congreso.','Zona A','10:30:00','11:30:00','https://www.upmoving.com/site/views/data/noticias/NOT-1.png',1,5),(2,1,'Cómo presupuestar una mudanza','En esta ponencia se aprenderán conceptos básicos sobre finanzas y sobre presupuestación con el objetivo de mantener un presupuesto estable y una economía estable en los proyectos.','Zona B','12:00:00','13:00:00','https://www.amsegoviana.com/uploads/cuanto-cuesta-una-mudanza-en-madrid.jpg',1,5),(3,1,'Los beneficios del transporte','Se tratarán una serie de método de transporte, sus beneficios y viabilidad. Además, se llevará a cabo un video colaborativo con los asistentes para explicar los métodos de transporte.','Zona A','16:30:00','17:00:00','https://www.apollosuniverse.com/wp-content/uploads/2021/06/evento-junio-980x451.jpg',3,5),(4,1,'La logística y su organización','La logística siempre es la parte más complicada de una mudanza. LLevar la organización de la empresa no es fácil, y por ello realizaremos esta ponencia para desarrollar ideas básicas de los problemas  que pueden surgir.','Zona A','19:00:00','19:30:00','https://api-static.eventsip.com/portals/files/63159/63159.jpg',1,5),(5,1,'Concentración y percepción','Llevar una empresa de mudanzas puede parecer complicado. En esta ponencia trataremos la concentración de los empresarios y cómo llevar la empresa de manera positiva.','Zona B','19:30:00','20:30:00','https://educacion2.com/wp-content/uploads/2019/06/consejos-para-estudiar-768x512.jpg',1,5),(6,1,'Camiones y transporte','Evaluaremos todos los medios de transporte de las mudanzas y haremos un pequeño taller en el que veremos cuáles son los mejores transportes para cada tipo de mudanza.','Zona C','10:00:00','11:00:00','https://empresas.infoempleo.com/hrtrends/media/2017/07/Claves-para-la-organizaci%C3%B3n-de-eventos-de-%C3%A9xito-2.jpg',2,5),(7,1,'Riesgos laborales','Trataremos los distintos riesgos laborales que se pueden encontrar en el trabajo y explicaremos las medidas a adoptar con el fin de prevenirlos.','Zona C','11:30:00','12:00:00','https://www.ceupe.com/images/easyblog_articles/1409/b2ap3_large_trabajador-con-medidas-prl.jpg',2,5),(8,1,'Zona de bajas emisiones','Hablaremos de las zonas y los diferentes peligros que pueden tener. Desarrollaremos una descripción de con qué vehículos se puede entrar a qué zona y las limitaciones que pueden tener.','Zona C','12:30:00','13:00:00','https://www.kunak.es/wp-content/uploads/2021/06/zona-bajas-emisiones.jpg',2,5),(9,1,'Renovaciones de flota','Hablaremos sobre vehículos híbridos, eléctricos y opciones de mercado disponibles actualmente que tienen como objetivo mejorar la calidad de vida, comodidad de los conductores y ser aptos para el plan de la Agenda 2030.','Zona B','16:30:00','17:30:00','https://www.buffettulipas.com.br/wp-content/uploads/2020/03/Evento_corporativo.jpg',3,5),(10,1,'Marketing online','Cómo promocionarse en las redes online hoy en día. Os proporcionaremos una serie de pautas para captar la atención de los clientes y las marcas.','Zona B','18:30:00','18:30:00','https://static.wixstatic.com/media/7ba241_91dffd9c960d4078b0746669c8903294~mv2.png/v1/fill/w_672,h_378,al_c,lg_1,q_85,enc_auto/7ba241_91dffd9c960d4078b0746669c8903294~mv2.png',2,5),(11,1,'Mesa redonda de ideas','Cómo Fedem puede crecer tanto a nivel vertical como horizontal. Los que ya están dentro cada vez se vayan haciendo más grandes y que poco a poco vayan teniendo más miembros.','Zona A','11:30:00','12:30:00','https://blog.visitacostadelsol.com/hubfs/CDS%20-%20blogpost%20123%20a.jpg',3,5);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_ponente`
--

DROP TABLE IF EXISTS `evento_ponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_ponente` (
  `evento_id` int(10) unsigned NOT NULL,
  `ponente_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`evento_id`,`ponente_id`),
  KEY `fk_evento_has_ponente_ponente1_idx` (`ponente_id`),
  KEY `fk_evento_has_ponente_evento1_idx` (`evento_id`),
  CONSTRAINT `fk_evento_has_ponente_evento1` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_has_ponente_ponente1` FOREIGN KEY (`ponente_id`) REFERENCES `ponente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_ponente`
--

LOCK TABLES `evento_ponente` WRITE;
/*!40000 ALTER TABLE `evento_ponente` DISABLE KEYS */;
INSERT INTO `evento_ponente` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(11,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(1,12),(2,13),(3,14),(4,15),(5,16),(6,17),(7,18),(8,19),(9,20),(10,21);
/*!40000 ALTER TABLE `evento_ponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1),(2);
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `total` double unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `entrada_id` int(10) unsigned NOT NULL,
  `metodo_pago_id` int(10) unsigned NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_pago_metodo_pago1_idx` (`metodo_pago_id`),
  KEY `fk_entrada_id_idx` (`entrada_id`),
  CONSTRAINT `fk_entrada_id` FOREIGN KEY (`entrada_id`) REFERENCES `entrada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pago_metodo_pago1` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1144,'2023-12-02 10:11:34',1,1,1),(2044,'2022-03-24 12:42:05',3,2,3),(967,'2023-03-04 08:14:01',4,1,4),(2788,'2022-03-23 09:40:11',5,2,5),(1460,'2022-10-27 22:52:04',6,1,6),(2110,'2022-03-25 12:10:08',7,1,7),(1668,'2022-08-13 07:54:59',8,1,8),(1966,'2023-08-10 06:24:37',9,2,9),(2768,'2022-02-08 11:01:45',10,2,10),(547,'2023-10-07 04:03:30',11,1,11),(1182,'2022-05-29 02:05:57',12,2,12),(2895,'2023-03-26 07:30:46',13,1,13),(1319,'2023-07-15 12:27:20',14,2,14),(818,'2022-01-16 12:36:27',15,2,15),(1257,'2023-09-10 02:00:23',16,1,16),(517,'2023-05-01 08:23:38',17,2,17),(1447,'2023-01-08 10:44:55',18,2,18),(2133,'2023-03-22 01:51:39',19,1,19),(2094,'2022-06-29 05:38:04',20,1,20),(2693,'2023-05-16 07:36:06',21,2,21),(2921,'2023-11-15 11:47:14',22,2,22),(1410,'2022-06-13 09:35:35',23,2,23),(1445,'2022-07-20 01:27:47',24,1,24),(619,'2023-05-06 12:27:08',25,1,25),(1350,'2022-02-09 03:50:07',26,2,26),(961,'2022-11-06 04:52:26',27,1,27),(2578,'2022-09-04 21:19:08',28,1,28),(2047,'2023-09-15 17:08:28',29,2,29),(1276,'2023-07-28 02:42:04',30,2,30),(2350,'2022-06-11 16:31:05',31,1,31),(2408,'2022-03-19 14:35:33',32,1,32),(2385,'2023-07-10 01:23:52',33,1,33),(2849,'2022-12-18 16:12:38',34,2,34),(1594,'2023-12-22 10:47:58',35,1,35),(835,'2023-12-14 10:58:07',36,2,36),(1787,'2022-07-23 10:05:09',37,2,37),(1026,'2023-04-15 15:42:45',38,2,38),(1719,'2022-01-15 11:27:31',39,2,39),(1242,'2022-01-17 00:24:37',40,2,40),(1370,'2023-10-22 19:27:26',41,1,41),(2530,'2022-07-07 07:17:07',42,1,42),(2980,'2022-09-22 09:47:29',43,1,43),(2925,'2022-04-07 07:37:27',44,1,44),(1218,'2022-11-12 18:49:57',45,2,45),(2396,'2023-10-20 07:10:20',46,2,46),(1125,'2023-11-30 17:00:20',47,1,47),(751,'2022-06-24 18:34:49',48,2,48),(753,'2022-12-31 01:39:01',49,2,49),(2110,'2023-07-11 06:27:52',50,2,50),(1809,'2023-03-26 10:38:33',51,1,51),(1516,'2023-08-29 03:36:47',52,1,52),(765,'2022-09-03 10:59:26',53,1,53),(515,'2023-12-14 01:34:57',54,1,54),(2619,'2023-06-17 03:55:47',55,1,55),(2002,'2023-06-15 19:56:30',56,1,56),(667,'2023-09-20 16:47:11',57,2,57),(2218,'2022-09-01 23:51:28',58,2,58),(1091,'2023-01-15 02:19:20',59,1,59),(2547,'2023-03-25 10:10:16',60,2,60),(2312,'2022-04-05 18:12:59',61,1,61),(2902,'2022-04-09 10:51:27',62,1,62),(792,'2023-06-19 11:58:33',63,2,63),(2194,'2023-09-03 03:35:55',64,1,64),(2352,'2022-05-28 23:24:49',65,1,65),(890,'2023-09-11 09:25:23',66,2,66),(1762,'2023-06-08 03:26:35',67,1,67),(1577,'2022-09-29 11:38:19',68,2,68),(2494,'2022-07-13 23:41:36',69,1,69),(2002,'2023-07-31 05:54:21',70,2,70),(2081,'2023-04-02 15:32:21',71,1,71),(2595,'2023-03-18 18:32:16',72,2,72),(519,'2023-04-24 16:21:56',73,1,73),(2687,'2022-05-12 01:34:18',74,1,74),(1886,'2022-03-12 02:50:31',75,2,75),(2457,'2022-11-01 13:57:09',76,1,76),(2546,'2022-03-13 00:44:38',77,1,77),(1739,'2022-04-27 09:01:58',78,2,78),(715,'2022-07-19 11:28:57',79,2,79),(1500,'2022-03-30 23:22:40',80,2,80),(2931,'2022-09-01 05:55:15',81,1,81),(1937,'2022-10-03 09:30:17',82,2,82),(1761,'2022-12-09 10:51:29',83,1,83),(811,'2022-01-25 06:20:31',84,2,84),(545,'2022-12-08 01:51:57',85,1,85),(2250,'2023-10-01 23:33:31',86,2,86),(731,'2023-06-02 11:20:34',87,1,87),(2036,'2023-08-22 19:41:45',88,1,88),(2171,'2022-01-20 14:51:52',89,2,89),(2444,'2023-08-30 07:47:06',90,2,90),(2462,'2023-11-19 07:45:31',91,2,91),(1912,'2023-08-20 23:02:01',92,1,92),(2948,'2023-07-03 20:51:20',93,2,93),(2101,'2023-08-17 07:34:58',94,1,94),(1907,'2022-05-17 10:25:07',95,1,95),(1354,'2023-09-05 12:34:50',96,2,96),(2695,'2022-10-02 02:37:01',97,1,97),(1389,'2022-12-10 01:20:25',98,1,98),(1331,'2022-11-18 06:17:12',99,2,99),(2752,'2023-05-01 01:52:05',100,1,100),(2868,'2023-03-09 10:49:36',101,1,101);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,'Oro','5000'),(2,'Plata','3000'),(3,'Bronce','1500');
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrocinador`
--

DROP TABLE IF EXISTS `patrocinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrocinador` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paquete_id` int(10) unsigned NOT NULL,
  `empresa_cif` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patrocinador_paquete1_idx` (`paquete_id`),
  KEY `fk_patrocinador_empresa1_idx` (`empresa_cif`),
  CONSTRAINT `fk_patrocinador_empresa1` FOREIGN KEY (`empresa_cif`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patrocinador_paquete1` FOREIGN KEY (`paquete_id`) REFERENCES `paquete` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrocinador`
--

LOCK TABLES `patrocinador` WRITE;
/*!40000 ALTER TABLE `patrocinador` DISABLE KEYS */;
INSERT INTO `patrocinador` VALUES (2,1,4),(3,1,5),(4,1,15),(5,2,16),(6,3,18),(7,1,19),(8,3,20),(9,1,21),(10,3,22),(13,3,26),(14,2,30),(15,2,32);
/*!40000 ALTER TABLE `patrocinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal` (
  `username_paypal` varchar(255) NOT NULL,
  `metodo_pago_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`metodo_pago_id`),
  UNIQUE KEY `username_paypal_UNIQUE` (`username_paypal`),
  KEY `fk_paypal_metodo_pago1_idx` (`metodo_pago_id`),
  CONSTRAINT `fk_paypal_metodo_pago1` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
INSERT INTO `paypal` VALUES ('1',1);
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponente`
--

DROP TABLE IF EXISTS `ponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `socio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ponente_socio1_idx` (`socio_id`),
  CONSTRAINT `fk_ponente_socio1` FOREIGN KEY (`socio_id`) REFERENCES `socio` (`id_socio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponente`
--

LOCK TABLES `ponente` WRITE;
/*!40000 ALTER TABLE `ponente` DISABLE KEYS */;
INSERT INTO `ponente` VALUES (1,3),(2,4),(3,5),(4,15),(5,16),(6,18),(7,19),(8,20),(9,21),(12,22),(15,23),(13,24),(17,26),(18,26),(19,27),(20,30),(21,32),(10,37),(14,38),(11,39),(16,41);
/*!40000 ALTER TABLE `ponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto_comida`
--

DROP TABLE IF EXISTS `puesto_comida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto_comida` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `congreso_id` int(10) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipo_comida` varchar(45) NOT NULL,
  `lugar` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_puesto_comida_congreso_idx` (`congreso_id`),
  CONSTRAINT `fk_puesto_comida_congreso` FOREIGN KEY (`congreso_id`) REFERENCES `congreso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto_comida`
--

LOCK TABLES `puesto_comida` WRITE;
/*!40000 ALTER TABLE `puesto_comida` DISABLE KEYS */;
INSERT INTO `puesto_comida` VALUES (1,1,'Taco Bell','Mexicana','Pabellón A','Taco Bell es una cadena de restaurantes de comida rápida, especializada en cocina Tex-Mex.','https://gastrofranchising.com/wp-content/uploads/2018/02/taco-bell-firme.jpg'),(2,1,'TGB','Americana','Pabellón B','En The Good Burger (TGB), en medio de su atmósfera neoyorkina y cosmopolita, preparan unas hamburguesas gourmet utilizando materias primas de la más alta calidad y pan de elaboración propia. ','https://media-cdn.tripadvisor.com/media/photo-s/08/01/50/3b/tgb-the-good-burger.jpg'),(3,1,'El Kiosko','Tapería','Pasillo central','Una gran opción para comer, pudiendo disfrutar de cerveza, tapas y una amplia carta. Si estás buscando un restaurante diferente, no dudes en acercarte.','https://elkiosko.es/wp-content/uploads/2022/06/Local-WEB-_0003s_0007_Local_Valencia-11.jpg'),(4,1,'Bao Van','Asiática','Pasillo central','Nuestros baos son 100% caseros, con una receta única que elaboramos a diario en nuestro obrador ','https://diariodesign.com/wp-content/uploads/2022/06/baovan-restaurante-baos-valencia-portada-942x531.jpg'),(5,1,'Lamburguesa','Hamburguesería','Pasillo central','En Lamburguesa somos pioneros en burgers gourmet. Llevamos desde 2015 perfeccionando el arte de cocinar hamburguesas aptas para todos los paladares.','https://valenciaplaza.com/public/Image/2018/8/Capturadepantalla2018-08-01alas11.54.17.png_NoticiaAmpliada.jpg'),(6,1,'Ingrafanti','Italiana','Pasillo central','Puesto italiano auténtico en el mercado central. Platos preparados caseros.','https://media-cdn.tripadvisor.com/media/photo-s/10/d7/8c/7b/infraganti-mercado-central.jpg'),(7,1,'Restaurante de Ana','Arrocería','Pabellón B','Paella, fideuá y platos de carne y pescado a la parrilla en un restaurante sofisticado con mesas y barra para sentarse.','https://res.cloudinary.com/tf-lab/image/upload/restaurant/0eb28e5d-cfa6-44ee-ad61-ba14c93710db/f3c8fb2b-d2ba-40af-b9be-6342f70b156d.jpg'),(8,1,'La Paraeta','Cafetería','Pabellón A','Si buscas un bar de tapas más normal, este es tu sitio. La bebida barata y la comida buena.','https://media-cdn.tripadvisor.com/media/photo-s/10/62/04/eb/getlstd-property-photo.jpg'),(9,1,'Pizza Lab','Pizzería','Pabellón A','Ven a pasar una velada estupenda con rica comida. Te ofrecemos platos recién hechos en un clima único.','https://florim-cdn.thron.com/delivery/public/image/florim/ec2a8f7e-b117-4482-9bee-59a47d918e58/gggcrc/std/1440x0/whitemonkey_006_full.jpg/?quality=80&format=webp&scalemode=centered&dpr=100'),(10,1,'Coffee Jeff','Cafetería','Pabellón B','Un café para llevar que se adapta al estilo de vida del consumidor actual, ágil y con un gran sabor.','https://t5t4v4p3.rocketcdn.me/wp-content/uploads/2022/11/Coffee-Jeff.jpg');
/*!40000 ALTER TABLE `puesto_comida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `id_socio` int(11) NOT NULL AUTO_INCREMENT,
  `asistente_id` int(10) unsigned NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_socio`),
  KEY `fk_socio_asistente1_idx` (`asistente_id`),
  KEY `fk_socio_empresa1_idx` (`empresa_id`),
  CONSTRAINT `fk_socio_asistente1` FOREIGN KEY (`asistente_id`) REFERENCES `asistente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_socio_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (1,2,'Desarrollador Sénior',15),(2,52,'Systems Administrator ',2),(3,53,'Therapy Assistant',3),(4,54,'VP Quality Control',4),(5,55,'Analog Design manager',5),(6,56,'Research Associate',6),(7,57,'VP Accounting',7),(8,58,'Office Assistant',8),(9,59,'Quality Engineer',9),(10,60,'Associate Professor',10),(11,61,'Nuclear Power Engineer',11),(12,62,'Nurse',12),(13,63,'Web Developer',13),(14,64,'Director of Sales',14),(15,65,'Legal Assistant',15),(16,66,'Senior Developer',16),(17,67,'Design manager',17),(18,68,'Recruiter',18),(19,69,'Associate Professor',19),(20,70,'Associate Professor',20),(21,71,'VP Sales',21),(22,72,'Senior Quality Engineer',22),(23,73,'Marketing Assistant',23),(24,74,'Human Resources',4),(25,75,'Actuary',25),(26,76,'Operator',26),(27,77,'Sales Representative',27),(28,78,'Software Engineer',8),(29,79,'Product Engineer',29),(30,80,'Design manager',30),(31,81,'Financial Advisor',31),(32,82,'Systems Administrator',32),(33,83,'Biostatistician',1),(34,84,'Recruiter',1),(35,85,'Geological Engineer',2),(36,86,'Financial Advisor',2),(37,87,'Nuclear Power Engineer',3),(38,88,'Accounting Assistant',4),(39,89,'Accounting Analyst',3),(40,90,'Speech Pathologist',2),(41,91,'Media Manager',5),(42,92,'Electrical Engineer',6),(43,93,'Payment Coordinator',7),(44,94,'Analysis Engineer',8),(45,95,'Chief Design Engineer',9),(46,96,'VP Marketing',9),(47,97,'Nurse Practicioner',7),(48,98,'Research Assistant',8),(49,99,'Cost Accountant',10),(50,100,'Statistician',10),(51,101,'Compensation Analyst',11),(52,51,'Financial Analyst',1);
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `numero_tarjeta` int(10) unsigned NOT NULL,
  `metodo_pago_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`metodo_pago_id`),
  UNIQUE KEY `numero_UNIQUE` (`numero_tarjeta`),
  KEY `fk_tarjeta_metodo_pago1_idx` (`metodo_pago_id`),
  CONSTRAINT `fk_tarjeta_metodo_pago1` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoracion` (
  `asistente_id` int(10) unsigned DEFAULT NULL,
  `evento_id` int(10) unsigned DEFAULT NULL,
  `valoracion` int(11) NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `IDX_6D3DE0F411FECD4E` (`asistente_id`),
  KEY `IDX_6D3DE0F487A5F842` (`evento_id`),
  CONSTRAINT `fk_valoracion_asistente1` FOREIGN KEY (`asistente_id`) REFERENCES `asistente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_valoracion_evento1` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoracion`
--

LOCK TABLES `valoracion` WRITE;
/*!40000 ALTER TABLE `valoracion` DISABLE KEYS */;
INSERT INTO `valoracion` VALUES (4,11,3,38),(25,7,5,1),(42,7,0,2),(24,1,2,3),(74,10,3,4),(99,10,5,5),(67,10,4,6),(39,1,1,7),(32,3,5,8),(83,5,2,9),(37,10,5,10),(97,1,1,11),(65,9,0,12),(72,6,4,13),(60,8,3,14),(13,8,2,15),(77,7,1,17),(44,10,1,18),(99,6,5,19),(53,9,5,20),(90,1,1,21),(14,8,0,22),(4,1,5,23),(19,4,4,24),(82,9,3,25),(69,9,2,26),(44,7,4,27),(81,9,2,28),(11,4,5,29),(9,10,5,31),(69,10,4,32),(54,4,1,33),(58,5,2,34),(10,4,3,35),(84,4,4,36),(88,2,2,37);
/*!40000 ALTER TABLE `valoracion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-24 17:23:01
