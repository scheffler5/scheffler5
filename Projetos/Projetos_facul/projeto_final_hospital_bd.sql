-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital_db
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `anestesista`
--

DROP TABLE IF EXISTS `anestesista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anestesista` (
  `CRM` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  `ID_Diretor_Tecnico` int NOT NULL,
  PRIMARY KEY (`CRM`),
  KEY `ID_Diretor_Tecnico` (`ID_Diretor_Tecnico`),
  CONSTRAINT `anestesista_ibfk_1` FOREIGN KEY (`ID_Diretor_Tecnico`) REFERENCES `diretor_tecnico` (`ID_Diretor_Tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anestesista`
--

LOCK TABLES `anestesista` WRITE;
/*!40000 ALTER TABLE `anestesista` DISABLE KEYS */;
INSERT INTO `anestesista` VALUES (23456,'Dr. Carlos Almeida','Anestesia Geral',1),(23457,'Dra. Sofia Martins','Anestesia Regional',1),(23458,'Dr. Fernando Souza','Anestesia Cardiovascular',2),(23459,'Dra. Juliana Lima','Anestesia Pediátrica',2),(23460,'Dr. Ricardo Costa','Anestesia Neurocirúrgica',3),(23461,'Dra. Beatriz Fernandes','Anestesia Obstétrica',3),(23462,'Dr. Gustavo Oliveira','Anestesia para Cirurgia Ambulatorial',4),(23463,'Dra. Renata Silva','Anestesia para Cirurgia Plástica',4),(23464,'Dr. Alexandre Rocha','Anestesia para Cirurgia Torácica',5),(23465,'Dra. Isabela Pereira','Anestesia para Endoscopia',5);
/*!40000 ALTER TABLE `anestesista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartamento`
--

DROP TABLE IF EXISTS `apartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartamento` (
  `ID_Apartamento` int NOT NULL AUTO_INCREMENT,
  `Numero` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Apartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento`
--

LOCK TABLES `apartamento` WRITE;
/*!40000 ALTER TABLE `apartamento` DISABLE KEYS */;
INSERT INTO `apartamento` VALUES (1,'Apartamento 101'),(2,'Apartamento 102');
/*!40000 ALTER TABLE `apartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendimento_cozinha`
--

DROP TABLE IF EXISTS `atendimento_cozinha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atendimento_cozinha` (
  `ID_Atendimento` int NOT NULL AUTO_INCREMENT,
  `ID_Nutricionista` int NOT NULL,
  `ID_Cozinha` int NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Descricao` text,
  PRIMARY KEY (`ID_Atendimento`),
  KEY `ID_Nutricionista` (`ID_Nutricionista`),
  KEY `ID_Cozinha` (`ID_Cozinha`),
  CONSTRAINT `atendimento_cozinha_ibfk_1` FOREIGN KEY (`ID_Nutricionista`) REFERENCES `nutricionista` (`CRN`),
  CONSTRAINT `atendimento_cozinha_ibfk_2` FOREIGN KEY (`ID_Cozinha`) REFERENCES `cozinha` (`ID_Cozinha`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimento_cozinha`
--

LOCK TABLES `atendimento_cozinha` WRITE;
/*!40000 ALTER TABLE `atendimento_cozinha` DISABLE KEYS */;
INSERT INTO `atendimento_cozinha` VALUES (1,201234,1,'2024-08-26 08:30:00','Revisão do cardápio para pacientes com restrições alimentares.'),(2,201235,1,'2024-08-26 09:45:00','Inspeção da qualidade dos alimentos e adequação dos preparos.'),(3,201236,1,'2024-08-26 11:00:00','Planejamento das refeições da semana e verificação dos estoques.'),(4,201237,1,'2024-08-26 13:15:00','Avaliação das necessidades nutricionais dos novos pacientes internados.'),(5,201234,1,'2024-08-26 15:30:00','Discussão sobre alterações no plano alimentar com base em feedback dos pacientes.');
/*!40000 ALTER TABLE `atendimento_cozinha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendimento_fisioterapia`
--

DROP TABLE IF EXISTS `atendimento_fisioterapia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atendimento_fisioterapia` (
  `ID_Atendimento` int NOT NULL AUTO_INCREMENT,
  `ID_Prontuario_Interno` int NOT NULL,
  `CREFITO_Fisioterapeuta` int NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Descricao` text,
  PRIMARY KEY (`ID_Atendimento`),
  KEY `ID_Prontuario_Interno` (`ID_Prontuario_Interno`),
  KEY `CREFITO_Fisioterapeuta` (`CREFITO_Fisioterapeuta`),
  CONSTRAINT `atendimento_fisioterapia_ibfk_1` FOREIGN KEY (`ID_Prontuario_Interno`) REFERENCES `prontuario_interno` (`ID_Prontuario_Interno`),
  CONSTRAINT `atendimento_fisioterapia_ibfk_2` FOREIGN KEY (`CREFITO_Fisioterapeuta`) REFERENCES `fisioterapeuta` (`CREFITO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimento_fisioterapia`
--

LOCK TABLES `atendimento_fisioterapia` WRITE;
/*!40000 ALTER TABLE `atendimento_fisioterapia` DISABLE KEYS */;
INSERT INTO `atendimento_fisioterapia` VALUES (6,6,101234,'2024-08-26 09:00:00','Sessão de fisioterapia para reabilitação ortopédica.'),(7,7,101235,'2024-08-26 10:15:00','Tratamento para recuperação neurológica após acidente vascular cerebral.'),(8,8,101236,'2024-08-26 11:30:00','Sessão de fisioterapia cardiorrespiratória para paciente com insuficiência cardíaca.'),(9,9,101237,'2024-08-26 14:00:00','Fisioterapia pediátrica para criança com problemas motores.'),(10,10,101238,'2024-08-26 15:15:00','Tratamento fisioterapêutico para idosos com problemas articulares.');
/*!40000 ALTER TABLE `atendimento_fisioterapia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendimento_nutricional`
--

DROP TABLE IF EXISTS `atendimento_nutricional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atendimento_nutricional` (
  `ID_Atendimento` int NOT NULL AUTO_INCREMENT,
  `ID_Prontuario_Interno` int NOT NULL,
  `CRN_Nutricionista` int NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Descricao` text,
  PRIMARY KEY (`ID_Atendimento`),
  KEY `ID_Prontuario_Interno` (`ID_Prontuario_Interno`),
  KEY `CRN_Nutricionista` (`CRN_Nutricionista`),
  CONSTRAINT `atendimento_nutricional_ibfk_1` FOREIGN KEY (`ID_Prontuario_Interno`) REFERENCES `prontuario_interno` (`ID_Prontuario_Interno`),
  CONSTRAINT `atendimento_nutricional_ibfk_2` FOREIGN KEY (`CRN_Nutricionista`) REFERENCES `nutricionista` (`CRN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimento_nutricional`
--

LOCK TABLES `atendimento_nutricional` WRITE;
/*!40000 ALTER TABLE `atendimento_nutricional` DISABLE KEYS */;
INSERT INTO `atendimento_nutricional` VALUES (1,6,201234,'2024-08-26 10:00:00','Avaliação nutricional geral e plano alimentar recomendado.'),(2,7,201235,'2024-08-26 11:30:00','Orientação sobre dieta esportiva e suplementação.'),(3,8,201236,'2024-08-26 13:00:00','Ajuste de dieta para necessidades pediátricas específicas.'),(4,9,201237,'2024-08-26 14:30:00','Consulta para nutrição funcional e controle de peso.'),(5,10,201238,'2024-08-26 16:00:00','Plano alimentar para suporte nutricional em tratamento oncológico.');
/*!40000 ALTER TABLE `atendimento_nutricional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendimento_sala`
--

DROP TABLE IF EXISTS `atendimento_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atendimento_sala` (
  `ID_Atendimento` int NOT NULL AUTO_INCREMENT,
  `ID_Prontuario` int NOT NULL,
  `ID_Sala` int NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Descricao` text,
  PRIMARY KEY (`ID_Atendimento`),
  KEY `ID_Prontuario` (`ID_Prontuario`),
  KEY `ID_Sala` (`ID_Sala`),
  CONSTRAINT `atendimento_sala_ibfk_1` FOREIGN KEY (`ID_Prontuario`) REFERENCES `prontuario_clinico` (`ID_Prontuario`),
  CONSTRAINT `atendimento_sala_ibfk_2` FOREIGN KEY (`ID_Sala`) REFERENCES `sala_ambulatorial` (`ID_Sala`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimento_sala`
--

LOCK TABLES `atendimento_sala` WRITE;
/*!40000 ALTER TABLE `atendimento_sala` DISABLE KEYS */;
INSERT INTO `atendimento_sala` VALUES (1,11,1,'2024-08-26 09:00:00','Paciente com febre alta e dor de cabeça recebeu soro intravenoso e medicação para controle da febre.'),(2,12,2,'2024-08-26 10:15:00','Paciente com dor abdominal intensa foi atendido para estabilização e preparo para cirurgia.'),(3,13,3,'2024-08-26 11:30:00','Paciente com tosse persistente recebeu tratamento com nebulização e acompanhamento médico.'),(4,14,4,'2024-08-26 12:45:00','Paciente com dor no peito foi atendido para monitoramento e suporte intensivo.'),(5,15,5,'2024-08-26 14:00:00','Paciente com náusea e vômito recebeu soro e medicação antiácida.'),(6,16,1,'2024-08-26 15:15:00','Paciente com erupções cutâneas foi atendido com aplicação de cremes tópicos e medicação anti-histamínica.'),(7,17,2,'2024-08-26 16:30:00','Paciente com dor nas costas foi tratado com fisioterapia e medicação analgésica.'),(8,18,3,'2024-08-26 17:45:00','Paciente com pressão alta foi monitorado e tratado com medicamento anti-hipertensivo.'),(9,19,4,'2024-08-26 19:00:00','Paciente com sintomas de gripe foi atendido com descongestionante e recomendação de repouso.'),(10,20,5,'2024-08-26 20:15:00','Paciente com dor e inchaço no tornozelo recebeu tratamento anti-inflamatório e recomendação de repouso.');
/*!40000 ALTER TABLE `atendimento_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cirurgiao`
--

DROP TABLE IF EXISTS `cirurgiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cirurgiao` (
  `CRM` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  `ID_Diretor_Tecnico` int NOT NULL,
  PRIMARY KEY (`CRM`),
  KEY `ID_Diretor_Tecnico` (`ID_Diretor_Tecnico`),
  CONSTRAINT `cirurgiao_ibfk_1` FOREIGN KEY (`ID_Diretor_Tecnico`) REFERENCES `diretor_tecnico` (`ID_Diretor_Tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cirurgiao`
--

LOCK TABLES `cirurgiao` WRITE;
/*!40000 ALTER TABLE `cirurgiao` DISABLE KEYS */;
INSERT INTO `cirurgiao` VALUES (12345,'Dr. João Silva','Cirurgia Geral',1),(12346,'Dra. Ana Oliveira','Ortopedia',1),(12347,'Dr. Pedro Santos','Neurocirurgia',2),(12348,'Dra. Maria Costa','Cardiologia',2),(12349,'Dr. Paulo Almeida','Ginecologia',3),(12350,'Dra. Carla Lima','Urologia',3),(12351,'Dr. Jorge Pereira','Cirurgia Plástica',4),(12352,'Dra. Laura Fernandes','Oftalmologia',4),(12353,'Dr. Marcos Silva','Cirurgia Torácica',5),(12354,'Dra. Patricia Oliveira','Otorrinolaringologia',5);
/*!40000 ALTER TABLE `cirurgiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao_amarelo`
--

DROP TABLE IF EXISTS `classificacao_amarelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificacao_amarelo` (
  `ID_Classificacao_Amarelo` int NOT NULL AUTO_INCREMENT,
  `ID_Triagem` int NOT NULL,
  `Detalhes` text,
  PRIMARY KEY (`ID_Classificacao_Amarelo`),
  KEY `ID_Triagem` (`ID_Triagem`),
  CONSTRAINT `classificacao_amarelo_ibfk_1` FOREIGN KEY (`ID_Triagem`) REFERENCES `triagem` (`ID_Triagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao_amarelo`
--

LOCK TABLES `classificacao_amarelo` WRITE;
/*!40000 ALTER TABLE `classificacao_amarelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificacao_amarelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao_azul`
--

DROP TABLE IF EXISTS `classificacao_azul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificacao_azul` (
  `ID_Classificacao_Azul` int NOT NULL AUTO_INCREMENT,
  `ID_Triagem` int NOT NULL,
  `Detalhes` text,
  PRIMARY KEY (`ID_Classificacao_Azul`),
  KEY `ID_Triagem` (`ID_Triagem`),
  CONSTRAINT `classificacao_azul_ibfk_1` FOREIGN KEY (`ID_Triagem`) REFERENCES `triagem` (`ID_Triagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao_azul`
--

LOCK TABLES `classificacao_azul` WRITE;
/*!40000 ALTER TABLE `classificacao_azul` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificacao_azul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao_verde`
--

DROP TABLE IF EXISTS `classificacao_verde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificacao_verde` (
  `ID_Classificacao_Verde` int NOT NULL AUTO_INCREMENT,
  `ID_Triagem` int NOT NULL,
  `Detalhes` text,
  PRIMARY KEY (`ID_Classificacao_Verde`),
  KEY `ID_Triagem` (`ID_Triagem`),
  CONSTRAINT `classificacao_verde_ibfk_1` FOREIGN KEY (`ID_Triagem`) REFERENCES `triagem` (`ID_Triagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao_verde`
--

LOCK TABLES `classificacao_verde` WRITE;
/*!40000 ALTER TABLE `classificacao_verde` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificacao_verde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao_vermelho`
--

DROP TABLE IF EXISTS `classificacao_vermelho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificacao_vermelho` (
  `ID_Classificacao_Vermelho` int NOT NULL AUTO_INCREMENT,
  `ID_Triagem` int NOT NULL,
  `Detalhes` text,
  PRIMARY KEY (`ID_Classificacao_Vermelho`),
  KEY `ID_Triagem` (`ID_Triagem`),
  CONSTRAINT `classificacao_vermelho_ibfk_1` FOREIGN KEY (`ID_Triagem`) REFERENCES `triagem` (`ID_Triagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao_vermelho`
--

LOCK TABLES `classificacao_vermelho` WRITE;
/*!40000 ALTER TABLE `classificacao_vermelho` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificacao_vermelho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinico_geral`
--

DROP TABLE IF EXISTS `clinico_geral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinico_geral` (
  `ID_Clinico` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  `ID_Diretor_Tecnico` int NOT NULL,
  PRIMARY KEY (`ID_Clinico`),
  KEY `ID_Diretor_Tecnico` (`ID_Diretor_Tecnico`),
  CONSTRAINT `clinico_geral_ibfk_1` FOREIGN KEY (`ID_Diretor_Tecnico`) REFERENCES `diretor_tecnico` (`ID_Diretor_Tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinico_geral`
--

LOCK TABLES `clinico_geral` WRITE;
/*!40000 ALTER TABLE `clinico_geral` DISABLE KEYS */;
INSERT INTO `clinico_geral` VALUES (1,'Dr. João Pereira','Medicina Interna',1),(2,'Dr. Lucas Andrade','Clínica Médica',1),(3,'Dra. Maria Silva','Medicina Geral',2),(4,'Dr. Pedro Santos','Clínica Geral',2),(5,'Dra. Fernanda Costa','Clínica Médica',3),(6,'Dr. Antônio Carvalho','Medicina Interna',3),(7,'Dra. Patrícia Oliveira','Medicina Geral',4),(8,'Dr. Carlos Mendes','Clínica Médica',4),(9,'Dra. Juliana Martins','Medicina Interna',5),(10,'Dr. Ricardo Fernandes','Clínica Geral',1);
/*!40000 ALTER TABLE `clinico_geral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `ID_Consultorio` int NOT NULL AUTO_INCREMENT,
  `ID_Paciente` varchar(11) NOT NULL,
  `ID_Medico` int NOT NULL,
  `Data_Consulta` date NOT NULL,
  `Registro` text NOT NULL,
  PRIMARY KEY (`ID_Consultorio`),
  KEY `ID_Paciente` (`ID_Paciente`),
  KEY `ID_Medico` (`ID_Medico`),
  CONSTRAINT `consultorio_ibfk_1` FOREIGN KEY (`ID_Paciente`) REFERENCES `pacientes` (`CPF`),
  CONSTRAINT `consultorio_ibfk_2` FOREIGN KEY (`ID_Medico`) REFERENCES `ginecologista` (`ID_Ginecologista`) ON DELETE CASCADE,
  CONSTRAINT `consultorio_ibfk_3` FOREIGN KEY (`ID_Medico`) REFERENCES `ortopedista` (`ID_Ortopedista`) ON DELETE CASCADE,
  CONSTRAINT `consultorio_ibfk_4` FOREIGN KEY (`ID_Medico`) REFERENCES `pediatra` (`ID_Pediatra`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,'78901234567',1,'2024-08-30','Paciente com queixa de dor abdominal. Exames indicam necessidade de avaliação ginecológica.'),(2,'56789012345',2,'2024-08-31','Paciente com histórico de irregularidades menstruais. Avaliação ginecológica necessária.'),(3,'34567890123',3,'2024-09-01','Paciente apresenta dor no joelho após acidente. Exame ortopédico necessário.'),(4,'16234567896',4,'2024-09-02','Paciente com fratura no braço. Necessário acompanhamento ortopédico.'),(7,'13243142343',2,'2024-09-03','Paciente infantil com sintomas de febre. Avaliação pediátrica recomendada.'),(8,'13247647822',3,'2024-09-04','Paciente infantil com tosse persistente. Consulta pediátrica para diagnóstico.');
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cozinha`
--

DROP TABLE IF EXISTS `cozinha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cozinha` (
  `ID_Cozinha` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Cozinha`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cozinha`
--

LOCK TABLES `cozinha` WRITE;
/*!40000 ALTER TABLE `cozinha` DISABLE KEYS */;
INSERT INTO `cozinha` VALUES (1,'Cozinha Central');
/*!40000 ALTER TABLE `cozinha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cozinheira`
--

DROP TABLE IF EXISTS `cozinheira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cozinheira` (
  `ID_Cozinheira` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  PRIMARY KEY (`ID_Cozinheira`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cozinheira`
--

LOCK TABLES `cozinheira` WRITE;
/*!40000 ALTER TABLE `cozinheira` DISABLE KEYS */;
INSERT INTO `cozinheira` VALUES (1,'Ana Souza','1985-02-15'),(2,'Beatriz Lima','1990-08-22'),(3,'Carla Oliveira','1982-11-30'),(4,'Daniela Costa','1979-05-14'),(5,'Eliane Martins','1992-01-19');
/*!40000 ALTER TABLE `cozinheira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diretor_administrativo`
--

DROP TABLE IF EXISTS `diretor_administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor_administrativo` (
  `ID_Diretor` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Diretor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor_administrativo`
--

LOCK TABLES `diretor_administrativo` WRITE;
/*!40000 ALTER TABLE `diretor_administrativo` DISABLE KEYS */;
INSERT INTO `diretor_administrativo` VALUES (1,'Carlos Silva','12345678901','1975-03-15','11987654321'),(2,'Ana Costa','23456789012','1980-07-22','11912345678'),(3,'Marcelo Oliveira','34567890123','1968-12-30','11923456789'),(4,'Fernanda Lima','45678901234','1985-05-14','11934567890'),(5,'Ricardo Santos','56789012345','1990-09-10','11945678901');
/*!40000 ALTER TABLE `diretor_administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diretor_tecnico`
--

DROP TABLE IF EXISTS `diretor_tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor_tecnico` (
  `ID_Diretor_Tecnico` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Diretor_Tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor_tecnico`
--

LOCK TABLES `diretor_tecnico` WRITE;
/*!40000 ALTER TABLE `diretor_tecnico` DISABLE KEYS */;
INSERT INTO `diretor_tecnico` VALUES (1,'Dr. Ricardo Almeida','12345678901','1970-04-12','(11) 91234-5678'),(2,'Dra. Fernanda Souza','23456789012','1975-06-23','(21) 98765-4321'),(3,'Dr. Carlos Oliveira','34567890123','1968-08-15','(31) 99876-5432'),(4,'Dra. Juliana Ribeiro','45678901234','1980-11-05','(41) 97654-3210'),(5,'Dr. Marcos Silva','56789012345','1973-03-19','(51) 96543-2109'),(6,'Dra. Ana Costa','67890123456','1982-07-22','(61) 95432-1098'),(7,'Dr. Paulo Mendes','78901234567','1971-02-27','(71) 94321-0987'),(8,'Dra. Camila Rocha','89012345678','1978-09-09','(81) 93210-9876'),(9,'Dr. Roberto Martins','90123456789','1969-12-01','(91) 92109-8765'),(10,'Dra. Renata Lima','01234567890','1985-05-30','(81) 90987-6543');
/*!40000 ALTER TABLE `diretor_tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeira_prontosocorro`
--

DROP TABLE IF EXISTS `enfermeira_prontosocorro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeira_prontosocorro` (
  `Coren` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`Coren`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeira_prontosocorro`
--

LOCK TABLES `enfermeira_prontosocorro` WRITE;
/*!40000 ALTER TABLE `enfermeira_prontosocorro` DISABLE KEYS */;
INSERT INTO `enfermeira_prontosocorro` VALUES (102791,'Raquel Silva','1985-06-25'),(135792,'Tatiana Neves','1981-04-15'),(246813,'Carlos Mendes','1986-10-21'),(357924,'Sofia Santos','1983-11-11'),(468135,'Leandro Borges','1990-02-17'),(579246,'Patrícia Ramos','1984-09-19'),(680357,'Thiago Moreira','1988-05-28'),(791468,'Luciana Barros','1982-12-01'),(802579,'Gabriela Lima','1991-03-30'),(913680,'André Vieira','1987-07-22');
/*!40000 ALTER TABLE `enfermeira_prontosocorro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro_bloco_cirurgico`
--

DROP TABLE IF EXISTS `enfermeiro_bloco_cirurgico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro_bloco_cirurgico` (
  `Coren` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`Coren`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro_bloco_cirurgico`
--

LOCK TABLES `enfermeiro_bloco_cirurgico` WRITE;
/*!40000 ALTER TABLE `enfermeiro_bloco_cirurgico` DISABLE KEYS */;
INSERT INTO `enfermeiro_bloco_cirurgico` VALUES (102357,'Rafael Azevedo','1978-07-07'),(135468,'Marcelo Sousa','1980-09-12'),(246579,'Isabela Rocha','1983-08-03'),(357680,'Felipe Cunha','1979-12-22'),(468791,'Bianca Oliveira','1985-04-05'),(579802,'Renato Costa','1988-11-15'),(680913,'Camila Duarte','1982-06-14'),(791024,'Vinícius Ribeiro','1990-10-19'),(802135,'Marcos Vieira','1987-01-24'),(913246,'Débora Melo','1992-03-08');
/*!40000 ALTER TABLE `enfermeiro_bloco_cirurgico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro_triagem`
--

DROP TABLE IF EXISTS `enfermeiro_triagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro_triagem` (
  `Coren` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`Coren`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro_triagem`
--

LOCK TABLES `enfermeiro_triagem` WRITE;
/*!40000 ALTER TABLE `enfermeiro_triagem` DISABLE KEYS */;
INSERT INTO `enfermeiro_triagem` VALUES (123456,'Carla Martins','1980-05-15'),(123789,'Lucas Almeida','1977-02-14'),(234567,'João Silva','1978-07-23'),(345678,'Ana Paula','1985-03-10'),(456789,'Rodrigo Soares','1990-01-12'),(567890,'Mariana Costa','1987-09-25'),(678901,'Pedro Lima','1982-11-07'),(789012,'Fernanda Oliveira','1991-06-18'),(890123,'Ricardo Pereira','1989-08-29'),(901234,'Juliana Fernandes','1983-12-04');
/*!40000 ALTER TABLE `enfermeiro_triagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exames`
--

DROP TABLE IF EXISTS `exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exames` (
  `ID_Exame` int NOT NULL AUTO_INCREMENT,
  `ID_Triagem` int NOT NULL,
  `ID_Tecnico` int NOT NULL,
  `ID_Prontuario` int NOT NULL,
  `Tipo_Exame` varchar(45) NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Resultado` text,
  PRIMARY KEY (`ID_Exame`),
  KEY `ID_Triagem` (`ID_Triagem`),
  KEY `ID_Tecnico` (`ID_Tecnico`),
  KEY `ID_Prontuario` (`ID_Prontuario`),
  CONSTRAINT `exames_ibfk_1` FOREIGN KEY (`ID_Triagem`) REFERENCES `triagem` (`ID_Triagem`),
  CONSTRAINT `exames_ibfk_2` FOREIGN KEY (`ID_Tecnico`) REFERENCES `tecnico_exames` (`ID_Tecnico`),
  CONSTRAINT `exames_ibfk_3` FOREIGN KEY (`ID_Prontuario`) REFERENCES `prontuario_clinico` (`ID_Prontuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames`
--

LOCK TABLES `exames` WRITE;
/*!40000 ALTER TABLE `exames` DISABLE KEYS */;
INSERT INTO `exames` VALUES (11,1,1,11,'Radiografia de Tórax','2024-08-26 09:30:00','Sem alterações patológicas observadas.'),(12,2,2,12,'Hemograma Completo','2024-08-26 10:00:00','Leucocitose leve, sem alterações significativas.'),(13,3,3,13,'Tomografia Computadorizada de Abdômen','2024-08-26 10:30:00','Apendicite aguda confirmada.'),(14,4,4,14,'Ultrassonografia Abdominal','2024-08-26 11:00:00','Presença de líquido livre na cavidade abdominal.'),(15,5,5,15,'Eletrocardiograma','2024-08-26 11:30:00','Sinusal, sem alterações patológicas.'),(16,6,6,16,'Ressonância Magnética do Joelho','2024-08-26 12:00:00','Ruptura do menisco medial confirmada.'),(17,7,7,17,'Exame de Sangue para Teste de Colesterol','2024-08-26 12:30:00','Níveis elevados de colesterol LDL.'),(18,8,8,18,'Exame de Imagem do Pulmão','2024-08-26 13:00:00','Pequenos nódulos pulmonares detectados.'),(19,9,9,19,'Ecocardiograma','2024-08-26 13:30:00','Função cardíaca preservada, sem evidência de insuficiência.'),(20,10,10,20,'Exame de Patologia','2024-08-26 14:00:00','Presença de células anormais, encaminhar para avaliação adicional.');
/*!40000 ALTER TABLE `exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmacia`
--

DROP TABLE IF EXISTS `farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmacia` (
  `ID_Medicamento` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Descricao` text,
  `Quantidade` int NOT NULL,
  `Preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmacia`
--

LOCK TABLES `farmacia` WRITE;
/*!40000 ALTER TABLE `farmacia` DISABLE KEYS */;
INSERT INTO `farmacia` VALUES (1,'Paracetamol','Analgesico e antipirético',100,15.50),(2,'Ibuprofeno','Anti-inflamatório e analgésico',150,20.75),(3,'Amoxicilina','Antibiótico de amplo espectro',200,30.00),(4,'Dipirona','Analgesico e antipirético',120,18.90),(5,'Metformina','Antidiabético',80,25.00),(6,'Atorvastatina','Redutor de colesterol',90,45.00),(7,'Losartana','Antihipertensivo',110,35.50),(8,'Omeprazol','Inibidor da bomba de prótons',130,28.00),(9,'Loratadina','Antihistamínico',140,22.60),(10,'Cetirizina','Antihistamínico',160,21.30),(11,'Cloridrato de Venlafaxina','Antidepressivo',75,50.00),(12,'Prednisona','Corticosteroide',65,60.00),(13,'Naproxeno','Anti-inflamatório e analgésico',95,24.40),(14,'Hydroclorotiazida','Diurético',85,27.00),(15,'Atenolol','Betabloqueador',70,32.10);
/*!40000 ALTER TABLE `farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturamento`
--

DROP TABLE IF EXISTS `faturamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faturamento` (
  `ID_Faturamento` int NOT NULL AUTO_INCREMENT,
  `ID_Historico` int NOT NULL,
  `Valor_Total` decimal(10,2) NOT NULL,
  `Data_Faturamento` date NOT NULL,
  `ID_Diretor` int NOT NULL,
  PRIMARY KEY (`ID_Faturamento`),
  KEY `ID_Historico` (`ID_Historico`),
  KEY `ID_Diretor` (`ID_Diretor`),
  CONSTRAINT `faturamento_ibfk_1` FOREIGN KEY (`ID_Historico`) REFERENCES `historico_compras` (`ID_Historico`),
  CONSTRAINT `faturamento_ibfk_2` FOREIGN KEY (`ID_Diretor`) REFERENCES `diretor_administrativo` (`ID_Diretor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento`
--

LOCK TABLES `faturamento` WRITE;
/*!40000 ALTER TABLE `faturamento` DISABLE KEYS */;
INSERT INTO `faturamento` VALUES (1,1,1500.00,'2024-08-01',1),(2,2,3000.00,'2024-08-05',2),(3,3,5000.00,'2024-08-10',3),(4,4,2500.00,'2024-08-15',4),(5,5,4200.00,'2024-08-20',5);
/*!40000 ALTER TABLE `faturamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechamentos`
--

DROP TABLE IF EXISTS `fechamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fechamentos` (
  `ID_Fechamento` int NOT NULL AUTO_INCREMENT,
  `ID_Mapa_Zeladoria` int DEFAULT NULL,
  `ID_Mapa_Farmacia` int DEFAULT NULL,
  `ID_Mapa_Manutencao` int DEFAULT NULL,
  `ID_Mapa_Cozinha` int DEFAULT NULL,
  `Data_Fechamento` date NOT NULL,
  PRIMARY KEY (`ID_Fechamento`),
  KEY `ID_Mapa_Zeladoria` (`ID_Mapa_Zeladoria`),
  KEY `ID_Mapa_Farmacia` (`ID_Mapa_Farmacia`),
  KEY `ID_Mapa_Manutencao` (`ID_Mapa_Manutencao`),
  KEY `ID_Mapa_Cozinha` (`ID_Mapa_Cozinha`),
  CONSTRAINT `fechamentos_ibfk_1` FOREIGN KEY (`ID_Mapa_Zeladoria`) REFERENCES `mapa_compras_zeladoria` (`ID_Mapa_Zeladoria`),
  CONSTRAINT `fechamentos_ibfk_2` FOREIGN KEY (`ID_Mapa_Farmacia`) REFERENCES `mapa_compras_farmacia` (`ID_Mapa_Farmacia`),
  CONSTRAINT `fechamentos_ibfk_3` FOREIGN KEY (`ID_Mapa_Manutencao`) REFERENCES `mapa_compras_manutencao` (`ID_Mapa_Manutencao`),
  CONSTRAINT `fechamentos_ibfk_4` FOREIGN KEY (`ID_Mapa_Cozinha`) REFERENCES `mapa_compras_cozinha` (`ID_Mapa_Cozinha`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechamentos`
--

LOCK TABLES `fechamentos` WRITE;
/*!40000 ALTER TABLE `fechamentos` DISABLE KEYS */;
INSERT INTO `fechamentos` VALUES (1,1,1,1,1,'2024-09-15'),(2,2,2,2,2,'2024-09-30'),(3,3,3,3,3,'2024-10-15'),(4,4,4,4,4,'2024-10-31'),(5,5,5,5,5,'2024-11-15');
/*!40000 ALTER TABLE `fechamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fisioterapeuta`
--

DROP TABLE IF EXISTS `fisioterapeuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fisioterapeuta` (
  `CREFITO` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CREFITO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fisioterapeuta`
--

LOCK TABLES `fisioterapeuta` WRITE;
/*!40000 ALTER TABLE `fisioterapeuta` DISABLE KEYS */;
INSERT INTO `fisioterapeuta` VALUES (101234,'Ana Souza','Reabilitação Ortopédica'),(101235,'Carlos Silva','Fisioterapia Neurológica'),(101236,'Mariana Costa','Fisioterapia Cardiorrespiratória'),(101237,'Lucas Almeida','Fisioterapia Pediátrica'),(101238,'Fernanda Lima','Fisioterapia Geriátrica');
/*!40000 ALTER TABLE `fisioterapeuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ginecologista`
--

DROP TABLE IF EXISTS `ginecologista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ginecologista` (
  `ID_Ginecologista` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `CRM` varchar(15) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Especialidade` varchar(100) NOT NULL,
  `ID_Diretor_Tecnico` int NOT NULL,
  PRIMARY KEY (`ID_Ginecologista`),
  KEY `ID_Diretor_Tecnico` (`ID_Diretor_Tecnico`),
  CONSTRAINT `ginecologista_ibfk_1` FOREIGN KEY (`ID_Diretor_Tecnico`) REFERENCES `diretor_tecnico` (`ID_Diretor_Tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ginecologista`
--

LOCK TABLES `ginecologista` WRITE;
/*!40000 ALTER TABLE `ginecologista` DISABLE KEYS */;
INSERT INTO `ginecologista` VALUES (1,'Dr. Ana Costa','CRM12345','111-222-3333','Ginecologia Geral',1),(2,'Dr. Carlos Silva','CRM12346','111-222-3334','Ginecologia Oncológica',2),(3,'Dra. Beatriz Lima','CRM12347','111-222-3335','Ginecologia Obstetrícia',3),(4,'Dr. Rafael Almeida','CRM12348','111-222-3336','Ginecologia Endócrina',4),(5,'Dra. Laura Martins','CRM12349','111-222-3337','Ginecologia Reprodutiva',5);
/*!40000 ALTER TABLE `ginecologista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_compras`
--

DROP TABLE IF EXISTS `historico_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_compras` (
  `ID_Historico` int NOT NULL AUTO_INCREMENT,
  `ID_Pedido` int NOT NULL,
  `ID_Pagamento` int NOT NULL,
  `Data_Compra` date NOT NULL,
  `Status_Compra` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Historico`),
  KEY `ID_Pedido` (`ID_Pedido`),
  KEY `ID_Pagamento` (`ID_Pagamento`),
  CONSTRAINT `historico_compras_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`),
  CONSTRAINT `historico_compras_ibfk_2` FOREIGN KEY (`ID_Pagamento`) REFERENCES `pagamento` (`ID_Pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_compras`
--

LOCK TABLES `historico_compras` WRITE;
/*!40000 ALTER TABLE `historico_compras` DISABLE KEYS */;
INSERT INTO `historico_compras` VALUES (1,1,1,'2024-08-26','Concluído'),(2,2,2,'2024-08-27','Concluído'),(3,3,3,'2024-08-28','Pendente'),(4,4,4,'2024-08-29','Concluído'),(5,5,5,'2024-08-30','Pendente');
/*!40000 ALTER TABLE `historico_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internacao`
--

DROP TABLE IF EXISTS `internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internacao` (
  `ID_Internacao` int NOT NULL AUTO_INCREMENT,
  `ID_Prontuario_Interno` int NOT NULL,
  `Data_Inicio` datetime NOT NULL,
  `Data_Fim` datetime DEFAULT NULL,
  `Tipo_Sala` enum('Pediatrica','Vermelha','Apartamento') NOT NULL,
  `ID_Sala` int DEFAULT NULL,
  PRIMARY KEY (`ID_Internacao`),
  KEY `ID_Prontuario_Interno` (`ID_Prontuario_Interno`),
  KEY `ID_Sala` (`ID_Sala`),
  CONSTRAINT `internacao_ibfk_1` FOREIGN KEY (`ID_Prontuario_Interno`) REFERENCES `prontuario_interno` (`ID_Prontuario_Interno`),
  CONSTRAINT `internacao_ibfk_2` FOREIGN KEY (`ID_Sala`) REFERENCES `sala_pediatrica` (`ID_Sala_Pediatrica`),
  CONSTRAINT `internacao_ibfk_3` FOREIGN KEY (`ID_Sala`) REFERENCES `sala_vermelha` (`ID_Sala_Vermelha`),
  CONSTRAINT `internacao_ibfk_4` FOREIGN KEY (`ID_Sala`) REFERENCES `apartamento` (`ID_Apartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao`
--

LOCK TABLES `internacao` WRITE;
/*!40000 ALTER TABLE `internacao` DISABLE KEYS */;
INSERT INTO `internacao` VALUES (1,6,'2024-08-26 10:00:00',NULL,'Pediatrica',1),(2,7,'2024-08-26 11:00:00',NULL,'Vermelha',1),(3,8,'2024-08-26 12:00:00',NULL,'Apartamento',1),(4,9,'2024-08-26 13:00:00',NULL,'Pediatrica',2),(5,10,'2024-08-26 14:00:00',NULL,'Vermelha',2);
/*!40000 ALTER TABLE `internacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cozinha`
--

DROP TABLE IF EXISTS `item_cozinha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_cozinha` (
  `ID_Item_Cozinha` int NOT NULL AUTO_INCREMENT,
  `Nome_Item` varchar(100) NOT NULL,
  `Descricao` text,
  `Quantidade` int NOT NULL,
  `Unidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Item_Cozinha`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cozinha`
--

LOCK TABLES `item_cozinha` WRITE;
/*!40000 ALTER TABLE `item_cozinha` DISABLE KEYS */;
INSERT INTO `item_cozinha` VALUES (1,'Arroz','Arroz branco tipo 1',500,'kg'),(2,'Feijão','Feijão preto',200,'kg'),(3,'Óleo de Soja','Óleo de soja refinado',100,'litros'),(4,'Açúcar','Açúcar cristal',150,'kg'),(5,'Sal','Sal refinado',50,'kg'),(6,'Leite','Leite integral',300,'litros'),(7,'Farinha de Trigo','Farinha de trigo tipo 1',250,'kg'),(8,'Macarrão','Macarrão espaguete',100,'kg'),(9,'Café','Café em pó',30,'kg'),(10,'Temperos Variados','Mistura de temperos secos',10,'kg'),(11,'Queijo','Queijo muçarela',80,'kg'),(12,'Presunto','Presunto fatiado',60,'kg'),(13,'Manteiga','Manteiga sem sal',40,'kg'),(14,'Tomate','Tomate fresco',100,'kg'),(15,'Batata','Batata inglesa',120,'kg');
/*!40000 ALTER TABLE `item_cozinha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_farmacia`
--

DROP TABLE IF EXISTS `item_farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_farmacia` (
  `ID_Item_Farmacia` int NOT NULL AUTO_INCREMENT,
  `Nome_Item` varchar(100) NOT NULL,
  `Descricao` text,
  `Quantidade` int NOT NULL,
  `Unidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Item_Farmacia`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_farmacia`
--

LOCK TABLES `item_farmacia` WRITE;
/*!40000 ALTER TABLE `item_farmacia` DISABLE KEYS */;
INSERT INTO `item_farmacia` VALUES (1,'Paracetamol','Analgesico e antipirético',100,'unidades'),(2,'Ibuprofeno','Anti-inflamatório e analgésico',150,'unidades'),(3,'Amoxicilina','Antibiótico de amplo espectro',200,'unidades'),(4,'Dipirona','Analgesico e antipirético',120,'unidades'),(5,'Metformina','Antidiabético',80,'unidades'),(6,'Atorvastatina','Redutor de colesterol',90,'unidades'),(7,'Losartana','Antihipertensivo',110,'unidades'),(8,'Omeprazol','Inibidor da bomba de prótons',130,'unidades'),(9,'Loratadina','Antihistamínico',140,'unidades'),(10,'Cetirizina','Antihistamínico',160,'unidades'),(11,'Cloridrato de Venlafaxina','Antidepressivo',75,'unidades'),(12,'Prednisona','Corticosteroide',65,'unidades'),(13,'Naproxeno','Anti-inflamatório e analgésico',95,'unidades'),(14,'Hydroclorotiazida','Diurético',85,'unidades'),(15,'Atenolol','Betabloqueador',70,'unidades');
/*!40000 ALTER TABLE `item_farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_manutencao`
--

DROP TABLE IF EXISTS `item_manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_manutencao` (
  `ID_Item_Manutencao` int NOT NULL AUTO_INCREMENT,
  `Nome_Item` varchar(100) NOT NULL,
  `Descricao` text,
  `Quantidade` int NOT NULL,
  `Unidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Item_Manutencao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_manutencao`
--

LOCK TABLES `item_manutencao` WRITE;
/*!40000 ALTER TABLE `item_manutencao` DISABLE KEYS */;
INSERT INTO `item_manutencao` VALUES (1,'Fita Isolante','Fita isolante elétrica',50,'unidades'),(2,'Chave de Fenda','Chave de fenda para manutenção geral',30,'unidades'),(3,'Martelo','Martelo de uso geral',20,'unidades'),(4,'Óleo Lubrificante','Óleo para lubrificação de máquinas',40,'litros'),(5,'Serra Elétrica','Serra elétrica para cortes diversos',15,'unidades');
/*!40000 ALTER TABLE `item_manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_zeladoria`
--

DROP TABLE IF EXISTS `item_zeladoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_zeladoria` (
  `ID_Item_Zeladoria` int NOT NULL AUTO_INCREMENT,
  `Nome_Item` varchar(100) NOT NULL,
  `Descricao` text,
  `Quantidade` int NOT NULL,
  `Unidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Item_Zeladoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_zeladoria`
--

LOCK TABLES `item_zeladoria` WRITE;
/*!40000 ALTER TABLE `item_zeladoria` DISABLE KEYS */;
INSERT INTO `item_zeladoria` VALUES (1,'Detergente Neutro','Detergente para limpeza de superfícies',50,'litros'),(2,'Desinfetante','Produto para desinfecção de ambientes',30,'litros'),(3,'Escovas de Limpeza','Escovas variadas para limpeza',100,'unidades'),(4,'Limpador Multiuso','Limpador para diversas superfícies',40,'litros'),(5,'Papel Toalha','Papel para uso em toalhas e limpeza',200,'unidades'),(6,'Detergente Neutro','Detergente para limpeza de superfícies',50,'litros'),(7,'Desinfetante','Produto para desinfecção de ambientes',30,'litros'),(8,'Escovas de Limpeza','Escovas variadas para limpeza',100,'unidades'),(9,'Limpador Multiuso','Limpador para diversas superfícies',40,'litros'),(10,'Papel Toalha','Papel para uso em toalhas e limpeza',200,'unidades');
/*!40000 ALTER TABLE `item_zeladoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencao`
--

DROP TABLE IF EXISTS `manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencao` (
  `ID_Manutencao` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  PRIMARY KEY (`ID_Manutencao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencao`
--

LOCK TABLES `manutencao` WRITE;
/*!40000 ALTER TABLE `manutencao` DISABLE KEYS */;
INSERT INTO `manutencao` VALUES (1,'André Oliveira','1982-02-14'),(2,'Juliana Costa','1987-06-23'),(3,'Lucas Almeida','1979-11-30'),(4,'Patrícia Martins','1990-08-19'),(5,'Vinícius Silva','1985-04-07');
/*!40000 ALTER TABLE `manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencao_internacao`
--

DROP TABLE IF EXISTS `manutencao_internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencao_internacao` (
  `ID_Manutencao_Internacao` int NOT NULL AUTO_INCREMENT,
  `ID_Manutencao` int NOT NULL,
  `ID_Internacao` int NOT NULL,
  `Data_Acesso` datetime NOT NULL,
  PRIMARY KEY (`ID_Manutencao_Internacao`),
  KEY `ID_Manutencao` (`ID_Manutencao`),
  KEY `ID_Internacao` (`ID_Internacao`),
  CONSTRAINT `manutencao_internacao_ibfk_1` FOREIGN KEY (`ID_Manutencao`) REFERENCES `manutencao` (`ID_Manutencao`),
  CONSTRAINT `manutencao_internacao_ibfk_2` FOREIGN KEY (`ID_Internacao`) REFERENCES `internacao` (`ID_Internacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencao_internacao`
--

LOCK TABLES `manutencao_internacao` WRITE;
/*!40000 ALTER TABLE `manutencao_internacao` DISABLE KEYS */;
INSERT INTO `manutencao_internacao` VALUES (1,1,1,'2024-08-26 09:00:00'),(2,2,2,'2024-08-26 10:30:00'),(3,3,3,'2024-08-26 12:00:00'),(4,4,4,'2024-08-26 14:30:00'),(5,5,5,'2024-08-26 16:00:00');
/*!40000 ALTER TABLE `manutencao_internacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapa_compras_cozinha`
--

DROP TABLE IF EXISTS `mapa_compras_cozinha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapa_compras_cozinha` (
  `ID_Mapa_Cozinha` int NOT NULL AUTO_INCREMENT,
  `ID_Item_Cozinha` int NOT NULL,
  `Data_Necessidade` date DEFAULT NULL,
  PRIMARY KEY (`ID_Mapa_Cozinha`),
  KEY `ID_Item_Cozinha` (`ID_Item_Cozinha`),
  CONSTRAINT `mapa_compras_cozinha_ibfk_1` FOREIGN KEY (`ID_Item_Cozinha`) REFERENCES `item_cozinha` (`ID_Item_Cozinha`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa_compras_cozinha`
--

LOCK TABLES `mapa_compras_cozinha` WRITE;
/*!40000 ALTER TABLE `mapa_compras_cozinha` DISABLE KEYS */;
INSERT INTO `mapa_compras_cozinha` VALUES (1,1,'2024-09-15'),(2,2,'2024-09-15'),(3,3,'2024-09-20'),(4,4,'2024-09-25'),(5,5,'2024-09-30'),(6,6,'2024-10-01'),(7,7,'2024-10-05'),(8,8,'2024-10-10'),(9,9,'2024-10-15'),(10,10,'2024-10-20'),(11,11,'2024-10-25'),(12,12,'2024-10-30'),(13,13,'2024-11-01'),(14,14,'2024-11-05'),(15,15,'2024-11-10');
/*!40000 ALTER TABLE `mapa_compras_cozinha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapa_compras_farmacia`
--

DROP TABLE IF EXISTS `mapa_compras_farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapa_compras_farmacia` (
  `ID_Mapa_Farmacia` int NOT NULL AUTO_INCREMENT,
  `ID_Item_Farmacia` int NOT NULL,
  `Data_Necessidade` date DEFAULT NULL,
  PRIMARY KEY (`ID_Mapa_Farmacia`),
  KEY `ID_Item_Farmacia` (`ID_Item_Farmacia`),
  CONSTRAINT `mapa_compras_farmacia_ibfk_1` FOREIGN KEY (`ID_Item_Farmacia`) REFERENCES `item_farmacia` (`ID_Item_Farmacia`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa_compras_farmacia`
--

LOCK TABLES `mapa_compras_farmacia` WRITE;
/*!40000 ALTER TABLE `mapa_compras_farmacia` DISABLE KEYS */;
INSERT INTO `mapa_compras_farmacia` VALUES (1,1,'2024-09-01'),(2,2,'2024-09-02'),(3,3,'2024-09-03'),(4,4,'2024-09-04'),(5,5,'2024-09-05'),(6,6,'2024-09-06'),(7,7,'2024-09-07'),(8,8,'2024-09-08'),(9,9,'2024-09-09'),(10,10,'2024-09-10'),(11,11,'2024-09-11'),(12,12,'2024-09-12'),(13,13,'2024-09-13'),(14,14,'2024-09-14'),(15,15,'2024-09-15');
/*!40000 ALTER TABLE `mapa_compras_farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapa_compras_manutencao`
--

DROP TABLE IF EXISTS `mapa_compras_manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapa_compras_manutencao` (
  `ID_Mapa_Manutencao` int NOT NULL AUTO_INCREMENT,
  `ID_Item_Manutencao` int NOT NULL,
  `Data_Necessidade` date DEFAULT NULL,
  PRIMARY KEY (`ID_Mapa_Manutencao`),
  KEY `ID_Item_Manutencao` (`ID_Item_Manutencao`),
  CONSTRAINT `mapa_compras_manutencao_ibfk_1` FOREIGN KEY (`ID_Item_Manutencao`) REFERENCES `item_manutencao` (`ID_Item_Manutencao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa_compras_manutencao`
--

LOCK TABLES `mapa_compras_manutencao` WRITE;
/*!40000 ALTER TABLE `mapa_compras_manutencao` DISABLE KEYS */;
INSERT INTO `mapa_compras_manutencao` VALUES (1,1,'2024-09-01'),(2,2,'2024-09-05'),(3,3,'2024-09-10'),(4,4,'2024-09-15'),(5,5,'2024-09-20');
/*!40000 ALTER TABLE `mapa_compras_manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapa_compras_zeladoria`
--

DROP TABLE IF EXISTS `mapa_compras_zeladoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapa_compras_zeladoria` (
  `ID_Mapa_Zeladoria` int NOT NULL AUTO_INCREMENT,
  `ID_Item_Zeladoria` int NOT NULL,
  `Data_Necessidade` date DEFAULT NULL,
  PRIMARY KEY (`ID_Mapa_Zeladoria`),
  KEY `ID_Item_Zeladoria` (`ID_Item_Zeladoria`),
  CONSTRAINT `mapa_compras_zeladoria_ibfk_1` FOREIGN KEY (`ID_Item_Zeladoria`) REFERENCES `item_zeladoria` (`ID_Item_Zeladoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa_compras_zeladoria`
--

LOCK TABLES `mapa_compras_zeladoria` WRITE;
/*!40000 ALTER TABLE `mapa_compras_zeladoria` DISABLE KEYS */;
INSERT INTO `mapa_compras_zeladoria` VALUES (1,1,'2024-08-30'),(2,2,'2024-08-30'),(3,3,'2024-08-31'),(4,4,'2024-09-01'),(5,5,'2024-09-02');
/*!40000 ALTER TABLE `mapa_compras_zeladoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutricionista`
--

DROP TABLE IF EXISTS `nutricionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutricionista` (
  `CRN` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutricionista`
--

LOCK TABLES `nutricionista` WRITE;
/*!40000 ALTER TABLE `nutricionista` DISABLE KEYS */;
INSERT INTO `nutricionista` VALUES (201234,'Ana Silva','Nutrição Clínica'),(201235,'Carlos Souza','Nutrição Esportiva'),(201236,'Fernanda Lima','Nutrição Pediátrica'),(201237,'Gabriel Costa','Nutrição Funcional'),(201238,'Juliana Martins','Nutrição em Oncologia');
/*!40000 ALTER TABLE `nutricionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observacoes_medicas`
--

DROP TABLE IF EXISTS `observacoes_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observacoes_medicas` (
  `ID_Observacao` int NOT NULL AUTO_INCREMENT,
  `ID_Prontuario` int NOT NULL,
  `Observacao` text NOT NULL,
  `Data_Hora` datetime NOT NULL,
  PRIMARY KEY (`ID_Observacao`),
  KEY `ID_Prontuario` (`ID_Prontuario`),
  CONSTRAINT `observacoes_medicas_ibfk_1` FOREIGN KEY (`ID_Prontuario`) REFERENCES `prontuario_clinico` (`ID_Prontuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observacoes_medicas`
--

LOCK TABLES `observacoes_medicas` WRITE;
/*!40000 ALTER TABLE `observacoes_medicas` DISABLE KEYS */;
INSERT INTO `observacoes_medicas` VALUES (1,11,'Paciente com febre alta e dor de cabeça. Diagnóstico: Febre Viral. Prescrito antitérmico e repouso.','2024-08-26 09:00:00'),(2,12,'Paciente com dor abdominal intensa. Diagnóstico: Apendicite Aguda. Encaminhado para cirurgia.','2024-08-26 10:15:00'),(3,13,'Paciente com tosse persistente e cansaço. Diagnóstico: Bronquite. Prescrito broncodilatador e expectorante.','2024-08-26 11:30:00'),(4,14,'Paciente com dor no peito e falta de ar. Diagnóstico: Infarto Agudo do Miocárdio. Encaminhado para UTI e administração de anticoagulantes.','2024-08-26 12:45:00'),(5,15,'Paciente com náusea e vômito. Diagnóstico: Gastrite. Prescrito antiácido e dieta leve.','2024-08-26 14:00:00'),(6,16,'Paciente com erupções cutâneas e coceira. Diagnóstico: Dermatite Alérgica. Prescrito antihistamínico e cremes tópicos.','2024-08-26 15:15:00'),(7,17,'Paciente com dor nas costas e dificuldade para movimentar. Diagnóstico: Hérnia de Disco. Encaminhado para fisioterapia e prescrição de analgésicos.','2024-08-26 16:30:00'),(8,18,'Paciente com pressão alta e dor de cabeça. Diagnóstico: Hipertensão Arterial. Prescrito medicamento anti-hipertensivo e controle da pressão.','2024-08-26 17:45:00'),(9,19,'Paciente com sintomas de gripe e congestão nasal. Diagnóstico: Gripe Viral. Prescrito descongestionante e analgésico.','2024-08-26 19:00:00'),(10,20,'Paciente com dor e inchaço no tornozelo. Diagnóstico: Entorse de Tornozelo. Prescrito anti-inflamatório e recomendação de repouso.','2024-08-26 20:15:00');
/*!40000 ALTER TABLE `observacoes_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ortopedista`
--

DROP TABLE IF EXISTS `ortopedista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ortopedista` (
  `ID_Ortopedista` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `CRM` varchar(15) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Especialidade` varchar(100) NOT NULL,
  `ID_Diretor_Tecnico` int NOT NULL,
  PRIMARY KEY (`ID_Ortopedista`),
  KEY `ID_Diretor_Tecnico` (`ID_Diretor_Tecnico`),
  CONSTRAINT `ortopedista_ibfk_1` FOREIGN KEY (`ID_Diretor_Tecnico`) REFERENCES `diretor_tecnico` (`ID_Diretor_Tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ortopedista`
--

LOCK TABLES `ortopedista` WRITE;
/*!40000 ALTER TABLE `ortopedista` DISABLE KEYS */;
INSERT INTO `ortopedista` VALUES (1,'Dr. João Pereira','CRM54321','222-333-4444','Ortopedia Geral',1),(2,'Dra. Clara Rodrigues','CRM54322','222-333-4445','Ortopedia Pediátrica',2),(3,'Dr. Miguel Santos','CRM54323','222-333-4446','Ortopedia Traumatológica',3),(4,'Dra. Vanessa Oliveira','CRM54324','222-333-4447','Ortopedia Esportiva',4),(5,'Dr. André Souza','CRM54325','222-333-4448','Ortopedia Reumatológica',5);
/*!40000 ALTER TABLE `ortopedista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Data_nascimento` date DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  `Genero` char(1) NOT NULL,
  `Cartao_SUS` varchar(15) NOT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES ('10234567890','Julia Mendes','Rua F, 246','1994-08-18','11987654330','F','987654321012346'),('11234567891','Ricardo Mota','Rua G, 357','1977-12-05','11987654331','M','876543210123457'),('12234567892','Mariana Azevedo','Rua H, 468','1986-11-25','11987654332','F','765432101234568'),('12345633301','Ana Silva','Rua das Flores, 123','1985-05-12','(11) 98765-4321','F','123456789012345'),('12345678901','Maria Silva','Rua das Flores, 123','1985-03-15','11987654321','F','987654321012345'),('13234567893','Gabriel Gomes','Av. Norte, 579','1993-01-10','11987654333','M','654321012345679'),('13243142343','Claudete Emerson','Joao Bortolini','1235-05-24','43996122514','F','142536762536546'),('13247647822','Jose Silva','Amadeu Slamanka','1999-09-02','43996142444','M','123456783312345'),('13247647877','Andoni Josias','Herrbert Bortolini','2004-02-12','4355667878','M','123422589012345'),('13247648992','Gustavo Mazur','Amadeu Bortolini','1899-12-01','43996142514','M','123456789012345'),('14234567894','Renata Ribeiro','Rua I, 680','1987-07-07','11987654334','F','543210123456780'),('15234567895','Felipe Barbosa','Rua J, 791','1991-03-03','11987654335','M','432101234567891'),('16234567896','Isabela Dias','Rua K, 902','1992-10-22','11987654336','F','321012345678902'),('23456449012','Carlos Santos','Avenida Brasil, 456','1978-11-23','(21) 99876-5432','M','234567890123456'),('23456789012','João Oliveira','Av. Paulista, 1000','1978-07-22','11987654322','M','876543210123456'),('34563890123','Maria Oliveira','Praça da República, 789','1990-08-30','(31) 97654-3210','F','345678901234567'),('34567890123','Ana Pereira','Rua A, 456','1990-11-30','11987654323','F','765432101234567'),('45678901234','Carlos Souza','Rua B, 789','1982-05-09','11987654324','M','654321012345678'),('56789012345','Paula Lima','Av. Central, 101','1995-09-25','11987654325','F','543210123456789'),('67890123456','Rodrigo Alves','Rua C, 321','1988-12-12','11987654326','M','432101234567890'),('78901234567','Fernanda Costa','Rua D, 654','1992-04-17','11987654327','F','321012345678901'),('89012345678','Pedro Ferreira','Av. Sul, 876','1981-02-23','11987654328','M','210123456789012'),('90123456789','Lucas Santos','Rua E, 135','1989-06-30','11987654329','M','101234567890123');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `ID_Pagamento` int NOT NULL AUTO_INCREMENT,
  `ID_Pedido` int NOT NULL,
  `Valor` decimal(10,2) NOT NULL,
  `Data_Pagamento` date NOT NULL,
  `Metodo_Pagamento` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Pagamento`),
  KEY `ID_Pedido` (`ID_Pedido`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,250.00,'2024-08-26','Cartão'),(2,2,175.50,'2024-08-27','Transferência'),(3,3,300.75,'2024-08-28','Boleto'),(4,4,120.00,'2024-08-29','Cartão'),(5,5,210.40,'2024-08-30','Transferência');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pediatra`
--

DROP TABLE IF EXISTS `pediatra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pediatra` (
  `ID_Pediatra` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `CRM` varchar(15) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Especialidade` varchar(100) NOT NULL,
  `ID_Diretor_Tecnico` int NOT NULL,
  PRIMARY KEY (`ID_Pediatra`),
  KEY `ID_Diretor_Tecnico` (`ID_Diretor_Tecnico`),
  CONSTRAINT `pediatra_ibfk_1` FOREIGN KEY (`ID_Diretor_Tecnico`) REFERENCES `diretor_tecnico` (`ID_Diretor_Tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pediatra`
--

LOCK TABLES `pediatra` WRITE;
/*!40000 ALTER TABLE `pediatra` DISABLE KEYS */;
INSERT INTO `pediatra` VALUES (1,'Dr. Carlos Almeida','CRM65432','333-444-5555','Pediatria Geral',1),(2,'Dra. Fernanda Costa','CRM65433','333-444-5556','Pediatria Cardiovascular',2),(3,'Dr. Renato Lima','CRM65434','333-444-5557','Pediatria Endocrinológica',3),(4,'Dra. Juliana Fernandes','CRM65435','333-444-5558','Pediatria Neurológica',4),(5,'Dr. Bruno Silva','CRM65436','333-444-5559','Pediatria Oncológica',5);
/*!40000 ALTER TABLE `pediatra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID_Pedido` int NOT NULL AUTO_INCREMENT,
  `ID_Fechamento` int NOT NULL,
  `Data_Pedido` date NOT NULL,
  `Status_Pedido` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Pedido`),
  KEY `ID_Fechamento` (`ID_Fechamento`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Fechamento`) REFERENCES `fechamentos` (`ID_Fechamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2024-08-25','Pendente'),(2,2,'2024-08-26','Em Processamento'),(3,3,'2024-08-27','Concluído'),(4,4,'2024-08-28','Cancelado'),(5,5,'2024-08-29','Pendente');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescricao`
--

DROP TABLE IF EXISTS `prescricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescricao` (
  `ID_Prescricao` int NOT NULL AUTO_INCREMENT,
  `ID_Prontuario` int NOT NULL,
  `ID_Prontuario_Interno` int DEFAULT NULL,
  `ID_Medicamento` int NOT NULL,
  `Quantidade` int NOT NULL,
  `Data_Prescricao` datetime NOT NULL,
  PRIMARY KEY (`ID_Prescricao`),
  KEY `ID_Prontuario` (`ID_Prontuario`),
  KEY `ID_Prontuario_Interno` (`ID_Prontuario_Interno`),
  KEY `ID_Medicamento` (`ID_Medicamento`),
  CONSTRAINT `prescricao_ibfk_1` FOREIGN KEY (`ID_Prontuario`) REFERENCES `prontuario_clinico` (`ID_Prontuario`),
  CONSTRAINT `prescricao_ibfk_2` FOREIGN KEY (`ID_Prontuario_Interno`) REFERENCES `prontuario_interno` (`ID_Prontuario_Interno`),
  CONSTRAINT `prescricao_ibfk_3` FOREIGN KEY (`ID_Medicamento`) REFERENCES `farmacia` (`ID_Medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescricao`
--

LOCK TABLES `prescricao` WRITE;
/*!40000 ALTER TABLE `prescricao` DISABLE KEYS */;
INSERT INTO `prescricao` VALUES (6,12,6,1,30,'2024-08-26 10:00:00'),(7,17,7,3,15,'2024-08-26 11:30:00'),(8,18,8,7,20,'2024-08-26 13:45:00'),(9,20,9,10,25,'2024-08-26 15:00:00'),(10,14,10,12,10,'2024-08-26 16:30:00');
/*!40000 ALTER TABLE `prescricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimento_cirurgico`
--

DROP TABLE IF EXISTS `procedimento_cirurgico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimento_cirurgico` (
  `ID_Procedimento` int NOT NULL AUTO_INCREMENT,
  `ID_Prontuario` int NOT NULL,
  `ID_Sala_Cirurgia` int NOT NULL,
  `CRM_Cirurgiao` int NOT NULL,
  `CRM_Anestesista` int NOT NULL,
  `Coren_Enfermeiro` int NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Descricao` text,
  PRIMARY KEY (`ID_Procedimento`),
  KEY `ID_Prontuario` (`ID_Prontuario`),
  KEY `ID_Sala_Cirurgia` (`ID_Sala_Cirurgia`),
  KEY `CRM_Cirurgiao` (`CRM_Cirurgiao`),
  KEY `CRM_Anestesista` (`CRM_Anestesista`),
  KEY `Coren_Enfermeiro` (`Coren_Enfermeiro`),
  CONSTRAINT `procedimento_cirurgico_ibfk_1` FOREIGN KEY (`ID_Prontuario`) REFERENCES `prontuario_clinico` (`ID_Prontuario`),
  CONSTRAINT `procedimento_cirurgico_ibfk_2` FOREIGN KEY (`ID_Sala_Cirurgia`) REFERENCES `sala_cirurgia` (`ID_Sala_Cirurgia`),
  CONSTRAINT `procedimento_cirurgico_ibfk_3` FOREIGN KEY (`CRM_Cirurgiao`) REFERENCES `cirurgiao` (`CRM`),
  CONSTRAINT `procedimento_cirurgico_ibfk_4` FOREIGN KEY (`CRM_Anestesista`) REFERENCES `anestesista` (`CRM`),
  CONSTRAINT `procedimento_cirurgico_ibfk_5` FOREIGN KEY (`Coren_Enfermeiro`) REFERENCES `enfermeiro_bloco_cirurgico` (`Coren`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimento_cirurgico`
--

LOCK TABLES `procedimento_cirurgico` WRITE;
/*!40000 ALTER TABLE `procedimento_cirurgico` DISABLE KEYS */;
INSERT INTO `procedimento_cirurgico` VALUES (21,11,1,12345,23456,102357,'2024-08-27 08:00:00','Cirurgia para remoção de apêndice.'),(22,12,1,12346,23457,135468,'2024-08-27 10:00:00','Cirurgia de reparo de hérnia.'),(23,13,2,12348,23458,468791,'2024-08-27 12:00:00','Cirurgia para tratamento de câncer.'),(24,14,2,12350,23459,680913,'2024-08-27 14:00:00','Cirurgia cardíaca de ponte de safena.'),(25,15,1,12352,23460,357680,'2024-08-27 16:00:00','Cirurgia para colocação de stent.'),(26,16,2,12353,23461,102357,'2024-08-28 09:00:00','Cirurgia para correção de deformidade óssea.'),(27,17,1,12345,23462,135468,'2024-08-28 11:00:00','Cirurgia de remoção de tumor cerebral.'),(28,18,2,12346,23463,468791,'2024-08-28 13:00:00','Cirurgia de reconstrução de ligamentos.'),(29,19,1,12348,23464,680913,'2024-08-28 15:00:00','Cirurgia de correção de hérnia discal.'),(30,20,2,12350,23465,357680,'2024-08-28 17:00:00','Cirurgia para tratamento de úlcera gástrica.');
/*!40000 ALTER TABLE `procedimento_cirurgico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prontuario_clinico`
--

DROP TABLE IF EXISTS `prontuario_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prontuario_clinico` (
  `ID_Prontuario` int NOT NULL AUTO_INCREMENT,
  `ID_Triagem` int NOT NULL,
  `ID_Clinico` int NOT NULL,
  `ID_Sala` int DEFAULT NULL,
  `Coren_Enfermeira` int DEFAULT NULL,
  `Data_Hora` datetime NOT NULL,
  `Descricao` text,
  `Diagnostico` text,
  `Tratamento` text,
  PRIMARY KEY (`ID_Prontuario`),
  KEY `ID_Triagem` (`ID_Triagem`),
  KEY `ID_Clinico` (`ID_Clinico`),
  KEY `ID_Sala` (`ID_Sala`),
  KEY `Coren_Enfermeira` (`Coren_Enfermeira`),
  CONSTRAINT `prontuario_clinico_ibfk_1` FOREIGN KEY (`ID_Triagem`) REFERENCES `triagem` (`ID_Triagem`),
  CONSTRAINT `prontuario_clinico_ibfk_2` FOREIGN KEY (`ID_Clinico`) REFERENCES `clinico_geral` (`ID_Clinico`),
  CONSTRAINT `prontuario_clinico_ibfk_3` FOREIGN KEY (`ID_Sala`) REFERENCES `sala_ambulatorial` (`ID_Sala`),
  CONSTRAINT `prontuario_clinico_ibfk_4` FOREIGN KEY (`Coren_Enfermeira`) REFERENCES `enfermeira_prontosocorro` (`Coren`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prontuario_clinico`
--

LOCK TABLES `prontuario_clinico` WRITE;
/*!40000 ALTER TABLE `prontuario_clinico` DISABLE KEYS */;
INSERT INTO `prontuario_clinico` VALUES (11,1,2,3,802579,'2024-08-26 09:00:00','Paciente com febre alta e dor de cabeça.','Febre Viral','Prescrito antitérmico e repouso.'),(12,2,3,4,468135,'2024-08-26 10:15:00','Paciente com dor abdominal intensa.','Apendicite Aguda','Encaminhado para cirurgia.'),(13,3,4,5,680357,'2024-08-26 11:30:00','Paciente com tosse persistente e cansaço.','Bronquite','Prescrito broncodilatador e expectorante.'),(14,4,1,2,579246,'2024-08-26 12:45:00','Paciente com dor no peito e falta de ar.','Infarto Agudo do Miocárdio','Encaminhado para UTI e administração de anticoagulantes.'),(15,5,2,3,135792,'2024-08-26 14:00:00','Paciente com náusea e vômito.','Gastrite','Prescrito antiácido e dieta leve.'),(16,6,3,4,802579,'2024-08-26 15:15:00','Paciente com erupções cutâneas e coceira.','Dermatite Alérgica','Prescrito antihistamínico e cremes tópicos.'),(17,7,4,5,468135,'2024-08-26 16:30:00','Paciente com dor nas costas e dificuldade para movimentar.','Hérnia de Disco','Encaminhado para fisioterapia e prescrição de analgésicos.'),(18,8,1,2,680357,'2024-08-26 17:45:00','Paciente com pressão alta e dor de cabeça.','Hipertensão Arterial','Prescrito medicamento anti-hipertensivo e controle da pressão.'),(19,9,2,3,579246,'2024-08-26 19:00:00','Paciente com sintomas de gripe e congestão nasal.','Gripe Viral','Prescrito descongestionante e analgésico.'),(20,10,3,4,135792,'2024-08-26 20:15:00','Paciente com dor e inchaço no tornozelo.','Entorse de Tornozelo','Prescrito anti-inflamatório e recomendação de repouso.');
/*!40000 ALTER TABLE `prontuario_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prontuario_interno`
--

DROP TABLE IF EXISTS `prontuario_interno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prontuario_interno` (
  `ID_Prontuario_Interno` int NOT NULL AUTO_INCREMENT,
  `ID_Prontuario` int NOT NULL,
  `ID_Recepcao` int NOT NULL,
  `Data_Internacao` datetime NOT NULL,
  `Data_Alta` datetime DEFAULT NULL,
  `Descricao` text,
  PRIMARY KEY (`ID_Prontuario_Interno`),
  KEY `ID_Prontuario` (`ID_Prontuario`),
  KEY `ID_Recepcao` (`ID_Recepcao`),
  CONSTRAINT `prontuario_interno_ibfk_1` FOREIGN KEY (`ID_Prontuario`) REFERENCES `prontuario_clinico` (`ID_Prontuario`),
  CONSTRAINT `prontuario_interno_ibfk_2` FOREIGN KEY (`ID_Recepcao`) REFERENCES `recepcao_interna` (`ID_Recepcao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prontuario_interno`
--

LOCK TABLES `prontuario_interno` WRITE;
/*!40000 ALTER TABLE `prontuario_interno` DISABLE KEYS */;
INSERT INTO `prontuario_interno` VALUES (6,12,1,'2024-08-26 10:00:00',NULL,'Paciente internado para tratamento de febre viral.'),(7,17,2,'2024-08-26 16:45:00',NULL,'Paciente internado com hérnia de disco para fisioterapia.'),(8,18,3,'2024-08-26 17:30:00',NULL,'Paciente internado para controle da hipertensão arterial.'),(9,20,4,'2024-08-26 20:00:00',NULL,'Paciente internado devido a entorse de tornozelo.'),(10,14,5,'2024-08-26 12:30:00',NULL,'Paciente internado com infarto agudo do miocárdio.');
/*!40000 ALTER TABLE `prontuario_interno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcao`
--

DROP TABLE IF EXISTS `recepcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcao` (
  `ID_Recepcao` int NOT NULL AUTO_INCREMENT,
  `CPF_Paciente` varchar(11) NOT NULL,
  `ID_Recepcionista` int NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Observacoes` text,
  PRIMARY KEY (`ID_Recepcao`),
  KEY `CPF_Paciente` (`CPF_Paciente`),
  KEY `ID_Recepcionista` (`ID_Recepcionista`),
  CONSTRAINT `recepcao_ibfk_1` FOREIGN KEY (`CPF_Paciente`) REFERENCES `pacientes` (`CPF`),
  CONSTRAINT `recepcao_ibfk_2` FOREIGN KEY (`ID_Recepcionista`) REFERENCES `recepcionista` (`ID_Recepcionista`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcao`
--

LOCK TABLES `recepcao` WRITE;
/*!40000 ALTER TABLE `recepcao` DISABLE KEYS */;
INSERT INTO `recepcao` VALUES (1,'10234567890',1,'2024-02-12 00:00:00','Horario da Manha'),(2,'12234567892',2,'2024-02-12 00:00:00','Horario da Tarde'),(3,'13243142343',3,'2024-05-27 00:00:00','Horario da Noite'),(4,'13247647822',4,'2024-06-20 00:00:00','Horario da Manha'),(5,'13247647877',5,'2024-06-10 00:00:00','Horario da Tarde'),(6,'13247648992',6,'2024-08-19 00:00:00','Horario da Manha'),(7,'14234567894',7,'2024-01-12 00:00:00','Horario da Noite'),(8,'15234567895',8,'2024-03-17 00:00:00','Horario da Noite'),(9,'16234567896',9,'2024-08-11 00:00:00','Horario da Manha'),(10,'67890123456',10,'2024-10-23 00:00:00','Horario da Manha');
/*!40000 ALTER TABLE `recepcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcao_interna`
--

DROP TABLE IF EXISTS `recepcao_interna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcao_interna` (
  `ID_Recepcao` int NOT NULL AUTO_INCREMENT,
  `Data_Hora` datetime NOT NULL,
  PRIMARY KEY (`ID_Recepcao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcao_interna`
--

LOCK TABLES `recepcao_interna` WRITE;
/*!40000 ALTER TABLE `recepcao_interna` DISABLE KEYS */;
INSERT INTO `recepcao_interna` VALUES (1,'2024-08-27 08:00:00'),(2,'2024-08-26 08:30:00'),(3,'2024-08-26 11:00:00'),(4,'2024-08-26 13:45:00'),(5,'2024-08-26 16:15:00');
/*!40000 ALTER TABLE `recepcao_interna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcionista`
--

DROP TABLE IF EXISTS `recepcionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcionista` (
  `ID_Recepcionista` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Recepcionista`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionista`
--

LOCK TABLES `recepcionista` WRITE;
/*!40000 ALTER TABLE `recepcionista` DISABLE KEYS */;
INSERT INTO `recepcionista` VALUES (1,'Claudineia','Cargo dois'),(2,'Evandro','Recepcionista Principal'),(3,'Frankling','Cargo 2'),(4,'Maria Silva','CLT'),(5,'João Pereira','Cordenador'),(6,'Ricardo Souza','Cargo 3'),(7,'Tatiana Mendes','Cargo 5'),(8,'Leonardo Lima','Cargo 7'),(9,'Juliana Ribeiro','Cargo 8'),(10,'Rafael Cardoso','Cargo 9');
/*!40000 ALTER TABLE `recepcionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala_ambulatorial`
--

DROP TABLE IF EXISTS `sala_ambulatorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala_ambulatorial` (
  `ID_Sala` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Sala`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala_ambulatorial`
--

LOCK TABLES `sala_ambulatorial` WRITE;
/*!40000 ALTER TABLE `sala_ambulatorial` DISABLE KEYS */;
INSERT INTO `sala_ambulatorial` VALUES (1,'Sala 1','Soro Intravenoso'),(2,'Sala 2','Curativo'),(3,'Sala 3','Aplicação de Medicamentos'),(4,'Sala 4','Observação'),(5,'Sala 5','Atendimento de Emergência');
/*!40000 ALTER TABLE `sala_ambulatorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala_cirurgia`
--

DROP TABLE IF EXISTS `sala_cirurgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala_cirurgia` (
  `ID_Sala_Cirurgia` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Equipamentos` text,
  PRIMARY KEY (`ID_Sala_Cirurgia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala_cirurgia`
--

LOCK TABLES `sala_cirurgia` WRITE;
/*!40000 ALTER TABLE `sala_cirurgia` DISABLE KEYS */;
INSERT INTO `sala_cirurgia` VALUES (1,'Sala Cirúrgica 1','Mesas cirúrgicas, equipamentos de monitoramento, luzes cirúrgicas, ventiladores, equipamentos de anestesia.'),(2,'Sala Cirúrgica 2','Mesas cirúrgicas, equipamentos de monitoramento, luzes cirúrgicas, equipamentos de endoscopia, equipamentos de anestesia.');
/*!40000 ALTER TABLE `sala_cirurgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala_pediatrica`
--

DROP TABLE IF EXISTS `sala_pediatrica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala_pediatrica` (
  `ID_Sala_Pediatrica` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Sala_Pediatrica`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala_pediatrica`
--

LOCK TABLES `sala_pediatrica` WRITE;
/*!40000 ALTER TABLE `sala_pediatrica` DISABLE KEYS */;
INSERT INTO `sala_pediatrica` VALUES (1,'Sala Pediátrica 1'),(2,'Sala Pediátrica 2');
/*!40000 ALTER TABLE `sala_pediatrica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala_vermelha`
--

DROP TABLE IF EXISTS `sala_vermelha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala_vermelha` (
  `ID_Sala_Vermelha` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Sala_Vermelha`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala_vermelha`
--

LOCK TABLES `sala_vermelha` WRITE;
/*!40000 ALTER TABLE `sala_vermelha` DISABLE KEYS */;
INSERT INTO `sala_vermelha` VALUES (1,'Sala Vermelha 1'),(2,'Sala Vermelha 2');
/*!40000 ALTER TABLE `sala_vermelha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_exames`
--

DROP TABLE IF EXISTS `tecnico_exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico_exames` (
  `ID_Tecnico` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_exames`
--

LOCK TABLES `tecnico_exames` WRITE;
/*!40000 ALTER TABLE `tecnico_exames` DISABLE KEYS */;
INSERT INTO `tecnico_exames` VALUES (1,'Lucas Oliveira','Radiologia'),(2,'Ana Souza','Laboratório Clínico'),(3,'Carlos Silva','Tomografia Computadorizada'),(4,'Mariana Costa','Ultrassonografia'),(5,'Fernanda Almeida','Eletrocardiograma'),(6,'Júlio Santos','Ressonância Magnética'),(7,'Patrícia Pereira','Exames Hematológicos'),(8,'Roberto Lima','Exames de Imagem'),(9,'Juliana Martins','Ecocardiograma'),(10,'Andréa Ferreira','Exames de Patologia');
/*!40000 ALTER TABLE `tecnico_exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triagem`
--

DROP TABLE IF EXISTS `triagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `triagem` (
  `ID_Triagem` int NOT NULL AUTO_INCREMENT,
  `CPF_Paciente` varchar(11) NOT NULL,
  `ID_Recepcao` int NOT NULL,
  `Coren` int NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Tipo_Classificacao` enum('Vermelho','Amarelo','Verde','Azul') NOT NULL,
  PRIMARY KEY (`ID_Triagem`),
  KEY `CPF_Paciente` (`CPF_Paciente`),
  KEY `ID_Recepcao` (`ID_Recepcao`),
  KEY `Coren` (`Coren`),
  CONSTRAINT `triagem_ibfk_1` FOREIGN KEY (`CPF_Paciente`) REFERENCES `pacientes` (`CPF`),
  CONSTRAINT `triagem_ibfk_2` FOREIGN KEY (`ID_Recepcao`) REFERENCES `recepcao` (`ID_Recepcao`),
  CONSTRAINT `triagem_ibfk_3` FOREIGN KEY (`Coren`) REFERENCES `enfermeiro_triagem` (`Coren`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triagem`
--

LOCK TABLES `triagem` WRITE;
/*!40000 ALTER TABLE `triagem` DISABLE KEYS */;
INSERT INTO `triagem` VALUES (1,'10234567890',1,123456,'2024-08-25 08:30:00','Vermelho'),(2,'12234567892',2,234567,'2024-08-25 09:00:00','Amarelo'),(3,'13243142343',3,345678,'2024-08-25 09:30:00','Verde'),(4,'13247647822',4,456789,'2024-08-25 10:00:00','Azul'),(5,'13247647877',5,567890,'2024-08-25 10:30:00','Vermelho'),(6,'13247648992',6,678901,'2024-08-25 11:00:00','Amarelo'),(7,'14234567894',7,789012,'2024-08-25 11:30:00','Verde'),(8,'15234567895',8,890123,'2024-08-25 12:00:00','Azul'),(9,'16234567896',9,901234,'2024-08-25 12:30:00','Vermelho'),(10,'67890123456',10,123789,'2024-08-25 13:00:00','Amarelo');
/*!40000 ALTER TABLE `triagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zeladoria`
--

DROP TABLE IF EXISTS `zeladoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zeladoria` (
  `ID_Zelador` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  PRIMARY KEY (`ID_Zelador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zeladoria`
--

LOCK TABLES `zeladoria` WRITE;
/*!40000 ALTER TABLE `zeladoria` DISABLE KEYS */;
INSERT INTO `zeladoria` VALUES (1,'Carlos Pereira','1980-07-12'),(2,'Fernanda Silva','1986-03-29'),(3,'José Santos','1975-09-04'),(4,'Mariana Souza','1991-12-15'),(5,'Roberto Lima','1983-05-21');
/*!40000 ALTER TABLE `zeladoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zeladoria_internacao`
--

DROP TABLE IF EXISTS `zeladoria_internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zeladoria_internacao` (
  `ID_Zeladoria_Internacao` int NOT NULL AUTO_INCREMENT,
  `ID_Zelador` int NOT NULL,
  `ID_Internacao` int NOT NULL,
  `Data_Acesso` datetime NOT NULL,
  PRIMARY KEY (`ID_Zeladoria_Internacao`),
  KEY `ID_Zelador` (`ID_Zelador`),
  KEY `ID_Internacao` (`ID_Internacao`),
  CONSTRAINT `zeladoria_internacao_ibfk_1` FOREIGN KEY (`ID_Zelador`) REFERENCES `zeladoria` (`ID_Zelador`),
  CONSTRAINT `zeladoria_internacao_ibfk_2` FOREIGN KEY (`ID_Internacao`) REFERENCES `internacao` (`ID_Internacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zeladoria_internacao`
--

LOCK TABLES `zeladoria_internacao` WRITE;
/*!40000 ALTER TABLE `zeladoria_internacao` DISABLE KEYS */;
INSERT INTO `zeladoria_internacao` VALUES (1,1,1,'2024-08-26 08:00:00'),(2,2,2,'2024-08-26 09:30:00'),(3,3,3,'2024-08-26 11:00:00'),(4,4,4,'2024-08-26 13:00:00'),(5,5,5,'2024-08-26 15:00:00');
/*!40000 ALTER TABLE `zeladoria_internacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hospital_db'
--

--
-- Dumping routines for database 'hospital_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-26 18:14:33
