-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testedelphi
-- ------------------------------------------------------
-- Server version	5.7.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'João Silva','São Paulo','SP'),(2,'Maria Oliveira','Rio de Janeiro','RJ'),(3,'Carlos Pereira','Belo Horizonte','MG'),(4,'Ana Souza','Curitiba','PR'),(5,'Marcos Lima','Fortaleza','CE'),(6,'Beatriz Mendes','Recife','PE'),(7,'José Santos','Salvador','BA'),(8,'Fernanda Costa','Porto Alegre','RS'),(9,'Pedro Rocha','Brasília','DF'),(10,'Lucas Albuquerque','Manaus','AM'),(11,'Paula Fernandes','Belém','PA'),(12,'Vinicius Gomes','Florianópolis','SC'),(13,'Camila Teixeira','Goiânia','GO'),(14,'André Alves','Natal','RN'),(15,'Letícia Moura','Maceió','AL'),(16,'Ricardo Ramos','São Luís','MA'),(17,'Larissa Lopes','Campo Grande','MS'),(18,'Juliana Duarte','Vitória','ES'),(19,'Bruno Souza','João Pessoa','PB'),(20,'Tatiane Nunes','Aracaju','SE');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidodadosgerais`
--

DROP TABLE IF EXISTS `pedidodadosgerais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidodadosgerais` (
  `NumeroPedido` int(11) NOT NULL AUTO_INCREMENT,
  `DataEmissao` date NOT NULL,
  `CodigoCliente` int(11) DEFAULT NULL,
  `ValorTotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`NumeroPedido`),
  KEY `CodigoCliente` (`CodigoCliente`),
  CONSTRAINT `pedidodadosgerais_ibfk_1` FOREIGN KEY (`CodigoCliente`) REFERENCES `cliente` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidodadosgerais`
--

LOCK TABLES `pedidodadosgerais` WRITE;
/*!40000 ALTER TABLE `pedidodadosgerais` DISABLE KEYS */;
INSERT INTO `pedidodadosgerais` VALUES (1,'2024-11-01',1,15.90),(5,'2024-11-01',1,79.50),(6,'2024-11-01',1,31.80),(7,'2024-11-01',1,449.50),(8,'2024-11-01',8,75.00),(9,'2024-11-01',4,1015.00),(10,'2024-11-01',1,31.80),(11,'2024-11-01',1,29.00),(12,'2024-11-01',6,25.00),(13,'2024-11-01',9,0.00),(14,'2024-11-01',4,85.50),(15,'2024-11-01',1,15.90),(16,'2024-11-01',2,300.00);
/*!40000 ALTER TABLE `pedidodadosgerais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) NOT NULL,
  `PrecoVenda` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Caderno A4',15.90),(2,'Lápis de Cor',12.50),(3,'Caneta Esferográfica',2.00),(4,'Borracha Escolar',1.50),(5,'Mochila Escolar',89.90),(6,'Livro Didático',59.90),(7,'Calculadora Científica',120.00),(8,'Regua 30cm',4.50),(9,'Apontador',1.20),(10,'Giz de Cera',5.80),(11,'Estojo Escolar',18.00),(12,'Agenda 2024',25.00),(13,'Cola Branca',3.30),(14,'Papel Sulfite A4 - 500 folhas',25.90),(15,'Tinta Guache',6.50),(16,'Marcador de Texto',3.50),(17,'Lápis Preto',1.00),(18,'Corretivo Líquido',3.90),(19,'Pasta Sanfonada',9.80),(20,'Canetinha Hidrográfica',14.20);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtosdopedido`
--

DROP TABLE IF EXISTS `produtosdopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtosdopedido` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroPedido` int(11) DEFAULT NULL,
  `CodigoProduto` int(11) DEFAULT NULL,
  `Quantidade` int(11) NOT NULL,
  `PrecoVendaUnitario` decimal(10,2) NOT NULL,
  `ValorTotal` decimal(10,2) GENERATED ALWAYS AS ((`Quantidade` * `PrecoVendaUnitario`)) STORED,
  PRIMARY KEY (`ID`),
  KEY `NumeroPedido` (`NumeroPedido`),
  KEY `CodigoProduto` (`CodigoProduto`),
  CONSTRAINT `produtosdopedido_ibfk_1` FOREIGN KEY (`NumeroPedido`) REFERENCES `pedidodadosgerais` (`NumeroPedido`),
  CONSTRAINT `produtosdopedido_ibfk_2` FOREIGN KEY (`CodigoProduto`) REFERENCES `produto` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtosdopedido`
--

LOCK TABLES `produtosdopedido` WRITE;
/*!40000 ALTER TABLE `produtosdopedido` DISABLE KEYS */;
INSERT INTO `produtosdopedido` VALUES (2,1,1,1,1.00,1.00),(3,5,1,1,15.90,15.90),(4,5,1,1,15.90,15.90),(5,5,1,1,15.90,15.90),(6,5,1,1,15.90,15.90),(7,5,1,1,15.90,15.90),(8,6,1,1,15.90,15.90),(9,6,1,1,15.90,15.90),(10,7,5,5,89.90,449.50),(11,8,2,2,12.50,25.00),(12,8,2,2,12.50,25.00),(13,8,2,8,12.50,100.00),(14,9,5,5,89.90,449.50),(15,9,5,5,89.90,449.50),(16,9,10,10,5.80,58.00),(17,9,10,10,5.80,58.00),(18,10,1,1,15.90,15.90),(19,10,1,1,15.90,15.90),(20,11,10,5,5.80,29.00),(21,12,2,2,12.50,25.00),(22,14,4,4,1.50,6.00),(23,14,1,4,15.90,63.60),(24,14,1,1,15.90,15.90),(25,15,1,1,15.90,15.90),(26,16,12,12,25.00,300.00);
/*!40000 ALTER TABLE `produtosdopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'testedelphi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 17:47:30
