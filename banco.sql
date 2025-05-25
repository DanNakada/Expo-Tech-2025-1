CREATE DATABASE  IF NOT EXISTS `projeto_financeiro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projeto_financeiro`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: projeto_financeiro
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Alimentação'),(2,'Transporte'),(3,'Moradia'),(4,'Lazer'),(5,'Educação'),(6,'Saúde'),(7,'Assinatura'),(9,'Investimento'),(10,'Outros'),(12,'Saúde'),(13,'Alimentação');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos` (
  `id_gasto` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_gasto` date NOT NULL,
  `descricao` varchar(250) NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `gastos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (1,1,1,350.65,'2025-04-15','Compra de supermercado'),(2,2,3,800.00,'2025-05-20','Aluguel da casa'),(3,3,2,120.30,'2025-06-01','Gasolina'),(4,4,4,85.00,'2025-04-09','Passeio no parque'),(5,5,3,120.50,'2025-04-10','Pagamento da conta de luz'),(6,1,2,50.00,'2025-05-03','Transporte público'),(7,2,4,240.99,'2025-06-02','Compra de roupas'),(8,3,6,550.00,'2025-03-15','Plano unimed'),(9,4,1,135.50,'2025-05-23','Compra de carne'),(10,5,5,75.89,'2025-02-15','Carderno'),(11,5,3,88.50,'2025-04-11','Pagamento da conta de água'),(12,11,12,350.99,'2025-04-13','Plano Odontológico'),(13,12,1,150.00,'2025-05-16','Compras no Supermercado');
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metas` (
  `id_meta` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `objetivo_meta` varchar(250) NOT NULL,
  `data_limite` date NOT NULL,
  `atingida` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_meta`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `metas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
INSERT INTO `metas` VALUES (1,1,'Juntar dinheiro para viagem','2025-05-20','Não'),(2,2,'Comprar um novo notebook','2025-04-15','Sim'),(3,3,'Montar reservar de emergência','2025-12-31','Em andamento'),(4,4,'Pagar o curso de programação','2015-07-20','Em andamento'),(5,5,'Comprar celular novo','2025-06-15','Sim'),(6,1,'Presentiar familiares','2025-11-23','Em andamento'),(7,2,'Quitar a divida da tv','2025-07-11','Em andamento'),(8,3,'Economizar para trocar de carro','2025-12-31','Em andamento'),(9,4,'Reformar a casa','2025-07-05','Sim'),(10,5,'Economizar para o meu aniversário','2025-06-10','Sim'),(11,11,'Comprar um novo Celular','2025-09-20','Em andamento'),(12,12,'Viajar no final do ano','2025-12-31','Em andamento');
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarios`
--

DROP TABLE IF EXISTS `salarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarios` (
  `id_salario` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `mes` int NOT NULL,
  `ano` int NOT NULL,
  `data_registro` date NOT NULL,
  PRIMARY KEY (`id_salario`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `salarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarios`
--

LOCK TABLES `salarios` WRITE;
/*!40000 ALTER TABLE `salarios` DISABLE KEYS */;
INSERT INTO `salarios` VALUES (1,1,3000.00,1,2025,'2025-01-13'),(2,2,4200.00,1,2025,'2025-01-15'),(3,3,3500.00,2,2025,'2025-02-10'),(4,4,2800.00,2,2025,'2025-02-18'),(5,5,5300.00,3,2025,'2025-03-05'),(6,6,3900.00,3,2025,'2025-03-15'),(7,7,4500.00,4,2025,'2025-04-10'),(8,8,3100.00,4,2025,'2025-04-13'),(9,9,3300.00,5,2025,'2025-05-18'),(10,10,2700.00,5,2025,'2025-05-20'),(11,11,3000.00,3,2025,'2025-03-20'),(12,11,3000.00,3,2025,'2025-03-20'),(13,12,4500.00,5,2025,'2025-05-16');
/*!40000 ALTER TABLE `salarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `recuperar_senha` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'João Silva','joao@email.com','lmn123',''),(2,'Maria Souza','maria_souza@email.com','timao09',''),(3,'Pedero Lima','pedro@email.com','105423',''),(4,'Ana Paula','ana@gmail.com','abc123',''),(5,'Carlos Mendes','carlos_me@email.com','planta10',''),(6,'Juliana Alves','juliana@gmail.com','verdao5',''),(7,'Rafael Costa','costa@email.com','d984301',''),(8,'Fernanda Dias','dias@gmail.com','san7935',''),(9,'Lucas Rocha','lucas@emai.com','lucas103',''),(10,'Patrícia Leal','pati_leal@gmail.com','pati538',''),(11,'Denilson Severino','deni@gmail.com','1590Timao',''),(12,'Guilherme','gui@gmail.com','131326','Peixe');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 23:39:58
