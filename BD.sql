CREATE DATABASE  IF NOT EXISTS `posto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `posto`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: posto
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `bomba`
--

DROP TABLE IF EXISTS `bomba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bomba` (
  `idBomba` varchar(10) NOT NULL,
  `total_litros_vendido` float DEFAULT NULL,
  `idTanque` varchar(4) NOT NULL,
  PRIMARY KEY (`idBomba`),
  KEY `fk_idTanque_idx` (`idTanque`),
  CONSTRAINT `fk_idTanque` FOREIGN KEY (`idTanque`) REFERENCES `tanque` (`idtanque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bomba`
--

LOCK TABLES `bomba` WRITE;
/*!40000 ALTER TABLE `bomba` DISABLE KEYS */;
INSERT INTO `bomba` VALUES ('D1',0,'D001'),('D2',0,'D001'),('D3',0,'D002'),('G1',0,'G001'),('G2',0,'G002'),('G3',0,'G002');
/*!40000 ALTER TABLE `bomba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combustivel`
--

DROP TABLE IF EXISTS `combustivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `combustivel` (
  `nomeCombustivel` varchar(45) NOT NULL,
  `aliquota` decimal(3,2) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `volume_total` float DEFAULT NULL,
  `estoque_minimo` float DEFAULT NULL,
  `estoque_maximo` float DEFAULT NULL,
  PRIMARY KEY (`nomeCombustivel`),
  UNIQUE KEY `nomeCombustivel_UNIQUE` (`nomeCombustivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combustivel`
--

LOCK TABLES `combustivel` WRITE;
/*!40000 ALTER TABLE `combustivel` DISABLE KEYS */;
INSERT INTO `combustivel` VALUES ('Diesel',0.20,2,0,1000,3000),('Gasolina',0.20,5,0,500,600);
/*!40000 ALTER TABLE `combustivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `declaracao`
--

DROP TABLE IF EXISTS `declaracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `declaracao` (
  `idDeclaracao` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `data_declaracao` date NOT NULL,
  `nomeCombustivel` varchar(45) NOT NULL,
  `aliquota` decimal(3,2) NOT NULL,
  `valor_litro_combustivel` float NOT NULL,
  `valor_vendido_combustivel` float NOT NULL,
  PRIMARY KEY (`idDeclaracao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `declaracao`
--

LOCK TABLES `declaracao` WRITE;
/*!40000 ALTER TABLE `declaracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `declaracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicodiario`
--

DROP TABLE IF EXISTS `historicodiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `historicodiario` (
  `idHistoricoDiario` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade_litro` float NOT NULL,
  `nomeCombustivel` varchar(45) NOT NULL,
  `dataDiario` date NOT NULL,
  `valor_litro` float NOT NULL,
  `aliquota` float NOT NULL,
  `valorVenda` float NOT NULL,
  PRIMARY KEY (`idHistoricoDiario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicodiario`
--

LOCK TABLES `historicodiario` WRITE;
/*!40000 ALTER TABLE `historicodiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicodiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicomensal`
--

DROP TABLE IF EXISTS `historicomensal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `historicomensal` (
  `idHistoricoSemanal` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCombustivel` varchar(45) NOT NULL,
  `idTanque` varchar(45) NOT NULL,
  `qtd_litro_recebido` float NOT NULL,
  `data_recebimento` date NOT NULL,
  PRIMARY KEY (`idHistoricoSemanal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicomensal`
--

LOCK TABLES `historicomensal` WRITE;
/*!40000 ALTER TABLE `historicomensal` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicomensal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicosemanal`
--

DROP TABLE IF EXISTS `historicosemanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `historicosemanal` (
  `idHistoricoMensal` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade_litro` float NOT NULL,
  `nomeCombustivel` varchar(45) NOT NULL,
  `dataSemanal` date NOT NULL,
  `valorVenda` float NOT NULL,
  PRIMARY KEY (`idHistoricoMensal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicosemanal`
--

LOCK TABLES `historicosemanal` WRITE;
/*!40000 ALTER TABLE `historicosemanal` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicosemanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `data`,
 1 AS `nomeCombustivel`,
 1 AS `valorVenda`,
 1 AS `quantidade_litro`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `valor_litro` float DEFAULT NULL,
  `qtd_litro` float DEFAULT NULL,
  `valor_total` float DEFAULT NULL,
  `nomeCombustivel` varchar(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_nomeCombustivel_idx` (`nomeCombustivel`),
  CONSTRAINT `fk_pedido_nomeCombustivel` FOREIGN KEY (`nomeCombustivel`) REFERENCES `combustivel` (`nomecombustivel`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pedido_AFTER_INSERT` AFTER INSERT ON `pedido` FOR EACH ROW BEGIN
	declare done int default 0;
	declare v_idTanque varchar(4);
    declare v_volume_maximo float;
    declare v_volume_atual float;
    declare v_nomeCombustivel varchar(45);
    declare v_litro_pedido float;
    declare v_volume float;
	declare v_cursor cursor for 
    SELECT * FROM Tanque WHERE nomeCombustivel = new.nomeCombustivel;
    declare continue handler for not found set done = 1;
    
	SET v_litro_pedido = new.qtd_litro;
    #Separa os litros para encher os tanques correspondentes até sua capacidade máxima
    open v_cursor;
    repeat
		fetch v_cursor INTO v_idTanque, v_volume_maximo,
							v_volume_atual, v_nomeCombustivel;
        
        #volume que irá abastecer o tanque 
        SET v_volume = v_volume_maximo - v_volume_atual;
        
        #controle local para verificar se a quantidade de litros do pedido é suficiente
        #para abastecer os tanques
		SET v_litro_pedido = v_litro_pedido - v_volume;
        
        IF v_litro_pedido > 0 THEN
			CALL abastece_tanque(v_idTanque, v_volume);
		END IF;	
		
        until done
    end repeat;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `registrobomba`
--

DROP TABLE IF EXISTS `registrobomba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registrobomba` (
  `idRegistroBomba` int(11) NOT NULL AUTO_INCREMENT,
  `idBomba` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `quantidade_litro` float NOT NULL,
  `valor_total_venda` float NOT NULL,
  `idTanque` varchar(4) NOT NULL,
  PRIMARY KEY (`idRegistroBomba`),
  KEY `fk_rtbomba_idTanque_idx` (`idTanque`),
  KEY `fk_rtbomba_idBomba_idx` (`idBomba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrobomba`
--

LOCK TABLES `registrobomba` WRITE;
/*!40000 ALTER TABLE `registrobomba` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrobomba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrobombadiaria`
--

DROP TABLE IF EXISTS `registrobombadiaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registrobombadiaria` (
  `idRegistroBombaDiaria` int(11) NOT NULL,
  `data` date NOT NULL,
  `idBomba` varchar(45) NOT NULL,
  `valorVendido` float NOT NULL,
  PRIMARY KEY (`idRegistroBombaDiaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrobombadiaria`
--

LOCK TABLES `registrobombadiaria` WRITE;
/*!40000 ALTER TABLE `registrobombadiaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrobombadiaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrotanque`
--

DROP TABLE IF EXISTS `registrotanque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registrotanque` (
  `idRegistroTanque` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `quantidade_litro` float NOT NULL,
  `idTanque` varchar(4) NOT NULL,
  `nomeCombustivel` varchar(45) NOT NULL,
  PRIMARY KEY (`idRegistroTanque`),
  KEY `fk_registro_idTanque_idx` (`idTanque`),
  KEY `fk_registro_nomeCombustivel_idx` (`nomeCombustivel`),
  CONSTRAINT `fk_registro_idTanque` FOREIGN KEY (`idTanque`) REFERENCES `tanque` (`idtanque`),
  CONSTRAINT `fk_registro_nomeCombustivel` FOREIGN KEY (`nomeCombustivel`) REFERENCES `combustivel` (`nomecombustivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrotanque`
--

LOCK TABLES `registrotanque` WRITE;
/*!40000 ALTER TABLE `registrotanque` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrotanque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanque`
--

DROP TABLE IF EXISTS `tanque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tanque` (
  `idTanque` varchar(4) NOT NULL,
  `volume_maximo` float DEFAULT NULL,
  `volume_atual` float DEFAULT NULL,
  `nomeCombustivel` varchar(45) NOT NULL,
  PRIMARY KEY (`idTanque`),
  KEY `fk_nomeCombustivel_idx` (`nomeCombustivel`),
  CONSTRAINT `fk_nomeCombustivel` FOREIGN KEY (`nomeCombustivel`) REFERENCES `combustivel` (`nomecombustivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanque`
--

LOCK TABLES `tanque` WRITE;
/*!40000 ALTER TABLE `tanque` DISABLE KEYS */;
INSERT INTO `tanque` VALUES ('D001',1000,0,'Diesel'),('D002',2000,0,'Diesel'),('G001',100,0,'Gasolina'),('G002',200,0,'Gasolina'),('G003',300,0,'Gasolina');
/*!40000 ALTER TABLE `tanque` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tanque_AFTER_INSERT` AFTER INSERT ON `tanque` FOR EACH ROW BEGIN
    declare volume_combustivel float;
    declare estoque_max float;
    
    #Retorna o volume total disponivel e o estoque maximo por combustivel
    SELECT volume_total, estoque_maximo
    INTO volume_combustivel, estoque_max 
    FROM Combustivel
    WHERE nomeCombustivel = new.nomeCombustivel;
    
    #Atualiza o volume total e estoque máximo na tabela Combustivel
    UPDATE Combustivel 
    SET volume_total = volume_combustivel + new.volume_atual,
    estoque_maximo   = estoque_max + new.volume_maximo
    WHERE nomeCombustivel = new.nomeCombustivel;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tanque_AFTER_UPDATE` AFTER UPDATE ON `tanque` FOR EACH ROW BEGIN
    declare volume_combustivel float;
    declare estoque_max float;
    
    #Retorna o volume total disponivel e o estoque maximo por combustivel
    SELECT volume_total, estoque_maximo
    INTO volume_combustivel, estoque_max 
    FROM Combustivel
    WHERE nomeCombustivel = new.nomeCombustivel;
    
    #Atualiza o volume total e estoque máximo na tabela Combustivel
    UPDATE Combustivel 
    SET volume_total = volume_combustivel + new.volume_atual - old.volume_atual,
    estoque_maximo   = estoque_max + new.volume_maximo - old.volume_maximo
    WHERE nomeCombustivel = new.nomeCombustivel;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_hist_diario`
--

DROP TABLE IF EXISTS `view_hist_diario`;
/*!50001 DROP VIEW IF EXISTS `view_hist_diario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_hist_diario` AS SELECT 
 1 AS `data`,
 1 AS `nomeCombustivel`,
 1 AS `valor_litro`,
 1 AS `aliquota`,
 1 AS `Valor_Diario_Venda`,
 1 AS `Volume_Total_Diario`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'posto'
--

--
-- Dumping routines for database 'posto'
--
/*!50003 DROP PROCEDURE IF EXISTS `abastece_carro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `abastece_carro`(in p_quantidadeLitros float, in p_idBomba varchar(11))
BEGIN
DECLARE litros_vendidos float; #bomba
    DECLARE volumeTanque float; #volume tanque
    DECLARE v_idTanque varchar(4); #ID tanque
    DECLARE v_nomeCombustivel varchar(45);
    
    SELECT 
    b.total_litros_vendido, t.volume_atual, t.idTanque, c.nomeCombustivel
    INTO litros_vendidos, volumeTanque, v_idTanque, v_nomeCombustivel
    FROM Bomba b
    INNER JOIN
    Tanque t ON t.idTanque = b.idTanque
    INNER JOIN
    Combustivel c ON c.nomeCombustivel = t.nomeCombustivel
    WHERE
    b.idBomba = p_idBomba
    LIMIT 1;
                            
    #SELECT concat('myvar is ', litros_vendidos);

    IF  volumeTanque - p_quantidadeLitros >= 0 THEN
        #update volume atual no tanque
        UPDATE Tanque 
        SET volume_atual = volumeTanque - p_quantidadeLitros
        WHERE idTanque = v_idTanque;
        #update total de litros vendidos
        UPDATE Bomba 
        SET total_litros_vendido = litros_vendidos + p_quantidadeLitros
        WHERE idBomba = p_idBomba;
        #insert registroBomba
        INSERT INTO RegistroBomba(`data`, `quantidade_litro`, `valor_total_venda`, `idTanque`, `idBomba`)
        VALUES(curdate(), p_quantidadeLitros, 
                                        (SELECT (valor * aliquota) * p_quantidadeLitros
                                         FROM Combustivel 
                                         WHERE nomeCombustivel = v_nomeCombustivel),
                                         v_idTanque, p_idBomba);
    ELSE
         SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'A quantidade de litros retirada é menor que a de estoque no Tanque';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `abastece_tanque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `abastece_tanque`(in p_idTanque varchar(4), in p_quantidadeLitros float)
BEGIN
	DECLARE v_vol_atual float; 
    DECLARE v_vol_maximo float; 
    DECLARE v_nomeCombustivel varchar(45);
    
    SELECT volume_atual, volume_maximo, nomeCombustivel 
		INTO v_vol_atual, v_vol_maximo, v_nomeCombustivel
		FROM Tanque
		WHERE idTanque = p_idTanque;

	IF v_vol_atual + p_quantidadeLitros <= v_vol_maximo THEN 
		#Seta quantidade atual do volume do tanque
        UPDATE Tanque 
        SET volume_atual = v_vol_atual + p_quantidadeLitros
        WHERE idTanque = p_idTanque;
        #Cria Log de Registro do Tanque com data, hora e quantidade de litros abastecidos
        INSERT RegistroTanque(`data_hora`, `quantidade_litro`,
			    `idTanque`, `nomeCombustivel`) VALUES (CURDATE(), p_quantidadeLitros,
                p_idTanque, v_nomeCombustivel);
    ELSE
		 SIGNAL SQLSTATE '45000'
		 SET MESSAGE_TEXT = 'A quantidade de litros execede o máximo permitido para esse tanque';
     END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `declaracao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `declaracao`()
BEGIN
	
    Declare v_data_declaracao date;

	SELECT max(data_declaracao) INTO v_data_declaracao
    FROM Declaracao;
    
    SELECT concat('myvar is ', v_data_declaracao);
    
    If v_data_declaracao is not null then
		insert INTO Declaracao(data_declaracao, nomeCombustivel, aliquota, 
								valor_litro_combustivel, valor_vendido_combustivel) 
                    SELECT curdate(), 
                    nomeCombustivel,
                    aliquota, valor_litro, valorVenda FROM HistoricoDiario
                    WHERE dataDiario between v_data_declaracao and curdate();
    else
		insert INTO Declaracao(data_declaracao, 
					nomeCombustivel, aliquota, 
                    valor_litro_combustivel,
                    valor_vendido_combustivel) 
                    SELECT curdate(), 
                    nomeCombustivel,
                    aliquota, valor_litro, valorVenda 
			   FROM HistoricoDiario;
		
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_diario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_diario`()
BEGIN
	DECLARE c_data date;
    DECLARE c_nomeCombustivel varchar(45);
    DECLARE c_valor float;
    DECLARE c_volume float;
    DECLARE c_valor_litro float;
    DECLARE c_aliquota decimal(3,2);
    DECLARE i int;
    DECLARE registro cursor for
		select nomeCombustivel, Valor_Diario_Venda, 
			   Volume_Total_Diario, valor_litro, aliquota
        from view_hist_diario;
	OPEN registro;
    set i = (select count(*) from view_hist_diario);
    set c_data = current_date();
    REPEAT
		fetch registro into c_nomeCombustivel, c_valor, c_volume, c_valor_litro, c_aliquota;
		insert 	into HistoricoDiario(dataDiario, quantidade_litro, nomeCombustivel, valorVenda, valor_litro, aliquota) 
				values(c_data, c_volume, c_nomeCombustivel, c_valor, c_valor_litro, c_aliquota);
		set i = i - 1;
	until i = 0
    END REPEAT;
    select quantidade_litro, nomeCombustivel
    from HistoricoDiario
    where dataDiario = current_date()
    group by nomeCombustivel;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_mensal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_mensal`()
BEGIN
    
    INSERT INTO HistoricoMensal(nomeCombustivel, idTanque, qtd_litro_recebido, data_recebimento)
      SELECT nomeCombustivel, idTanque, SUM(quantidade_litro), data
      FROM RegistroTanque
      WHERE data BETWEEN (CURDATE() - INTERVAL 30 DAY) AND CURDATE(); 
    
    /*DECLARE v_idTanque varchar(4);
    DECLARE v_quantidade_litro float;
    DECLARE v_nomeCombustivel varchar(45);
    DECLARE v_data date;
    
    SELECT data, idTanque, SUM(quantidade_litro), nomeCombustivel
    INTO v_data, v_idTanque, v_quantidade_litro, v_nomeCombustivel
    FROM RegistroTanque
    WHERE data BETWEEN (CURDATE() - INTERVAL 30 DAY) AND CURDATE()
    Group by idTanque;
    
    INSERT INTO HistoricoMensal(nomeCombustivel, idTanque, qtd_litro_recebido, data_recebimento) 
    VALUES (v_nomeCombustivel, v_idTanque, v_quantidade_litro, v_data);*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_semana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_semana`()
BEGIN
	DECLARE c_data date;
    DECLARE c_nomeCombustivel varchar(45);
    DECLARE c_valor float;
    DECLARE c_volume float;
    DECLARE i int;
    DECLARE registro cursor for
		select quantidade_litro, nomeCombustivel, valorVenda from view_semanal;
	OPEN registro;
    set i = (select count(*) from view_semanal);
    set c_data = current_date();
    REPEAT
		fetch registro into c_volume, c_nomeCombustivel, c_valor;
		insert 	into HistoricoSemanal(dataSemanal, quantidade_litro, nomeCombustivel, valorVenda) 
				values(c_data, c_volume, c_nomeCombustivel, c_valor);
		set i = i - 1;
	until i = 0
    END REPEAT;
	select quantidade_litro, nomeCombustivel
    from HistoricoSemanal
    where dataSemanal = current_date()
    group by nomeCombustivel;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_vendaDiariaPorBomba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_vendaDiariaPorBomba`(in idBomba float)
BEGIN
	DECLARE v_idBomba float;
    DECLARE valorVenda float;
    DECLARE diaDaVenda date;
    
    
    select sum(valor_total_venda), idRegistroBomba, data 
    into valorVenda, v_idBomba, diaDaVenda
    from RegistroBomba 
    where data = curdate() and idBomba = idBomba
    group by idBomba;
    
    if valorVenda is not null and v_idBomba 
    is not null and diaDaVenda is not null then
    insert into RegistroBombaDiaria(idBomba, valorVendido, data) 
		   values(v_idBomba, valorVenda, diaDaVenda);
	end if;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verifica_estoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifica_estoque`()
BEGIN
declare done int default 0;
    declare v_nomeCombustivel varchar(45);
    declare v_volume_total float;
    declare v_estoque_minimo float;
    declare v_estoque_maximo float;
    declare v_valor_litro float;
    declare v_cursor cursor for 
    SELECT nomeCombustivel, volume_total, 
           estoque_minimo, estoque_maximo, valor
    FROM Combustivel;
    declare continue handler for not found set done = 1;
    
    open v_cursor;
    repeat
        fetch v_cursor INTO v_nomeCombustivel, v_volume_total,
                            v_estoque_minimo, v_estoque_maximo, v_valor_litro;
        IF (! done) THEN
                            
            IF v_volume_total < v_estoque_minimo THEN 
                INSERT INTO Pedido 
                            (`data`, `valor_litro`, `qtd_litro`, `valor_total`, `nomeCombustivel`)
                    VALUES  (curdate(), v_valor_litro, v_estoque_maximo - v_volume_total, 
                              v_valor_litro * (v_estoque_maximo - v_volume_total), v_nomeCombustivel);
            END IF;
        END IF;
        
        until done
    
    end repeat;
    
    close v_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select curdate() AS `data`,`c`.`nomeCombustivel` AS `nomeCombustivel`,sum(`rb`.`valor_total_venda`) AS `valorVenda`,sum(`rb`.`quantidade_litro`) AS `quantidade_litro` from ((`combustivel` `c` join `tanque` `t` on((`c`.`nomeCombustivel` = `t`.`nomeCombustivel`))) join `registrobomba` `rb` on((`rb`.`idTanque` = `t`.`idTanque`))) where (`rb`.`data` between (curdate() - interval 7 day) and curdate()) group by `c`.`nomeCombustivel` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_hist_diario`
--

/*!50001 DROP VIEW IF EXISTS `view_hist_diario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_hist_diario` AS select curdate() AS `data`,`c`.`nomeCombustivel` AS `nomeCombustivel`,`c`.`valor` AS `valor_litro`,`c`.`aliquota` AS `aliquota`,sum(`rb`.`valor_total_venda`) AS `Valor_Diario_Venda`,sum(`rb`.`quantidade_litro`) AS `Volume_Total_Diario` from ((`combustivel` `c` join `tanque` `t` on((`c`.`nomeCombustivel` = `t`.`nomeCombustivel`))) join `registrobomba` `rb` on((`rb`.`idTanque` = `t`.`idTanque`))) where (`rb`.`data` = curdate()) group by `c`.`nomeCombustivel` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-05 16:24:27
