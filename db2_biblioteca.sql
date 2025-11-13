CREATE DATABASE  IF NOT EXISTS `biblioteca_municipal2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca_municipal2`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca_municipal2
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `nacionalidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Juan Rulfo','Mexico'),(2,'Mario Benedetti','Uruguai'),(3,'Mario Vargas Llosa','Peru'),(4,'Florbela Espanca','Portugal'),(5,'Ivan Gontcharov','Rússia');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `id_emprestimo` int NOT NULL AUTO_INCREMENT,
  `id_livro` int DEFAULT NULL,
  `id_membro` int DEFAULT NULL,
  `data_emprestimo` date DEFAULT NULL,
  `data_devolucao` date DEFAULT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `id_livro` (`id_livro`),
  KEY `id_membro` (`id_membro`),
  CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livro`),
  CONSTRAINT `emprestimos_ibfk_2` FOREIGN KEY (`id_membro`) REFERENCES `membros` (`id_membro`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--

LOCK TABLES `emprestimos` WRITE;
/*!40000 ALTER TABLE `emprestimos` DISABLE KEYS */;
INSERT INTO `emprestimos` VALUES (6,4,4,'2024-03-01',NULL),(7,1,4,'2024-04-02','2024-04-20'),(8,2,1,'2024-05-03',NULL),(9,3,2,'2024-06-04',NULL),(10,4,4,'2024-03-01',NULL),(11,1,4,'2024-04-02','2024-04-20'),(12,2,1,'2024-05-03',NULL),(13,3,2,'2024-06-04',NULL);
/*!40000 ALTER TABLE `emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `id_autor` int DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `ano_publicacao` year DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,1,'Pedro Páramo',1955),(2,1,'El llano en llamas',1953),(3,2,'A tregua',1960),(4,3,'Travessuras da menina má',2006),(5,4,'Livro de Mágoas',1927),(6,5,'Oblómov',1927),(7,4,'Livro de Soror saudade',1927),(8,4,'Charneca em flor',1931),(9,3,'La ciudad y los perros',1963),(10,3,'A casa verde',1966);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membros`
--

DROP TABLE IF EXISTS `membros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membros` (
  `id_membro` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id_membro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membros`
--

LOCK TABLES `membros` WRITE;
/*!40000 ALTER TABLE `membros` DISABLE KEYS */;
INSERT INTO `membros` VALUES (1,'Oblomov','Rua A, 123','123456789'),(2,'Maria','Rua B, 456','987654321'),(3,'Raskolnikov','Rua C, 789','111222333'),(4,'Caio Fernando Abreu','Rua D, 000','222111333'),(5,'Priscila Joana','Rua E, 111','444555666');
/*!40000 ALTER TABLE `membros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-13 19:15:02
