--
-- TABELLE DI CONFIGURAZIONE
--

--
-- Table structure for table `cfg_canale_pagamento`
--
DROP TABLE IF EXISTS `cfg_canale_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_canale_pagamento` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BUNDLE_KEY` varchar(6) COLLATE utf8_bin NOT NULL,
  `DESCRIZIONE` tinytext COLLATE utf8_bin NOT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDX_BKEY_CFG_CANALE_PAGAMENTO` (`BUNDLE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `cfg_documento_pagamento`
--

DROP TABLE IF EXISTS `cfg_documento_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_documento_pagamento` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BUNDLE_KEY` varchar(6) COLLATE utf8_bin NOT NULL,
  `DESCRIZIONE` tinytext COLLATE utf8_bin NOT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDX_BKEY_CFG_DOCUMENTO_PAGAMENTO` (`BUNDLE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cfg_fornitore_gateway`
--

DROP TABLE IF EXISTS `cfg_fornitore_gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_fornitore_gateway` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BUNDLE_KEY` varchar(6) COLLATE utf8_bin NOT NULL,
  `DESCRIZIONE` tinytext COLLATE utf8_bin NOT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDX_BKEY_CFG_FORNITORE_GATEWAY` (`BUNDLE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `cfg_modalita_pagamento`
--

DROP TABLE IF EXISTS `cfg_modalita_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_modalita_pagamento` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BUNDLE_KEY` varchar(6) COLLATE utf8_bin NOT NULL,
  `DESCRIZIONE` tinytext COLLATE utf8_bin NOT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `PAYMENT_METHOD` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDX_BKEY_CFG_MODALITA_PAGAMENTO` (`BUNDLE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cfg_strumento_pagamento`
--

DROP TABLE IF EXISTS `cfg_strumento_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_strumento_pagamento` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BUNDLE_KEY` varchar(6) COLLATE utf8_bin NOT NULL,
  `DESCRIZIONE` tinytext COLLATE utf8_bin NOT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDX_BKEY_CFG_STRUMENTO_PAGAMENTO` (`BUNDLE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cfg_tipo_commissione`
--

DROP TABLE IF EXISTS `cfg_tipo_commissione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_tipo_commissione` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BUNDLE_KEY` varchar(12) COLLATE utf8_bin NOT NULL,
  `DESCRIZIONE` text COLLATE utf8_bin NOT NULL,
  `FL_STATO` varchar(2) COLLATE utf8_bin NOT NULL,
  `ST_RIGA` varchar(2) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(80) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDX_BKEY_CFG_TIPO_COMMISSIONE` (`BUNDLE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `cfg_gateway_pagamento`
--

DROP TABLE IF EXISTS `cfg_gateway_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_gateway_pagamento` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BUNDLE_KEY` varchar(30) COLLATE utf8_bin NOT NULL,
  `ID_CFG_MODALITA_PAGAMENTO` int(10) unsigned DEFAULT NULL,
  `ID_CFG_STRUMENTO_PAGAMENTO` int(10) unsigned DEFAULT NULL,
  `ID_CFG_DOCUMENTO_PAGAMENTO` int(10) unsigned DEFAULT NULL,
  `ID_CFG_CANALE_PAGAMENTO` int(10) unsigned NOT NULL,
  `ID_CFG_FORNITORE_GATEWAY` int(10) unsigned NOT NULL,
  `DESCRIZIONE` text COLLATE utf8_bin NOT NULL,
  `DESC_GATEWAY` tinytext COLLATE utf8_bin NOT NULL,
  `STATO` varchar(30) COLLATE utf8_bin NOT NULL,
  `DATA_INIZIO_VALIDITA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DATA_FINE_VALIDITA` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SYSTEM_ID` varchar(35) COLLATE utf8_bin NOT NULL,
  `APPLICATION_ID` varchar(35) COLLATE utf8_bin NOT NULL,
  `APPLICATION_IP` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `MOLTEPLICITA` char(1) COLLATE utf8_bin DEFAULT NULL,
  `MAX_IMPORTO` decimal(15,2) DEFAULT NULL,
  `TIMEOUT` int(11) DEFAULT NULL,
  `TIMEOUT_AUP` int(11) DEFAULT NULL,
  `TIMEOUT_NP` int(11) DEFAULT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `DATA_PUBBLICAZIONE` datetime DEFAULT NULL,
  `SYSTEM_NAME` tinytext COLLATE utf8_bin,
  `SUBSYSTEM_ID` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITA` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `DISPONIBILITA_SERVIZIO` tinytext COLLATE utf8_bin,
  `OP_ANNULLAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_ANNULLAMENTO` datetime DEFAULT NULL,
  `FL_PAGABILE_IRIS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `URL_INFO_PSP` text COLLATE utf8_bin,
  `URL_INFO_CANALE` text COLLATE utf8_bin,
  `FLAG_MOD_RIVERSAMENTO` varchar(2) COLLATE utf8_bin,
  `ID_CONTOTECNICO`  int(10) unsigned,
  `FLAG_REND_RIVERSAMENTO` varchar(2) COLLATE utf8_bin,
  `MODELLO_VERSAMENTO` char(1) COLLATE utf8_bin,
  `FL_STORNO_GESTITO`  char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDX_BKEY_CFG_GATEWAY_PAGAMENTO` (`BUNDLE_KEY`),
  UNIQUE KEY `INDX_SYSAPP_CFG_GATEWAY_PAGAMENTO` (`SYSTEM_ID`,`APPLICATION_ID`),
  CONSTRAINT `FK_CFG_STRUMENTO_PAGAMENTO` FOREIGN KEY (`ID_CFG_STRUMENTO_PAGAMENTO`) REFERENCES `cfg_strumento_pagamento` (`ID`) ,  
  CONSTRAINT `FK_CFG_MODALITA_PAGAMENTO` FOREIGN KEY (`ID_CFG_MODALITA_PAGAMENTO`) REFERENCES `cfg_modalita_pagamento` (`ID`) ,
  CONSTRAINT `FK_CFG_FORNITORE_GATEWAY` FOREIGN KEY (`ID_CFG_FORNITORE_GATEWAY`) REFERENCES `cfg_fornitore_gateway` (`ID`) ,
  CONSTRAINT `FK_CFG_DOCUMENTO_PAGAMENTO` FOREIGN KEY (`ID_CFG_DOCUMENTO_PAGAMENTO`) REFERENCES `cfg_documento_pagamento` (`ID`) ,
  CONSTRAINT `FK_CFG_CANALE_PAGAMENTO` FOREIGN KEY (`ID_CFG_CANALE_PAGAMENTO`) REFERENCES `cfg_canale_pagamento` (`ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `cfg_commissione_pagamento`
--

DROP TABLE IF EXISTS `cfg_commissione_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_commissione_pagamento` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_CFG_GATEWAY_PAGAMENTO` int(10) unsigned DEFAULT NULL,
  `ID_CFG_TIPO_COMMISSIONE` int(10) unsigned NOT NULL,
  `IMPORTO_DA` decimal(15,2) DEFAULT NULL,
  `IMPORTO_A` decimal(15,2) DEFAULT NULL,
  `VALORE` decimal(15,2) NOT NULL,
  `DIVISA` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `ST_RIGA` char(2) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(80) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `DESCRIZIONE` tinytext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_CFG_TIPO_COMMISSIONE` FOREIGN KEY (`ID_CFG_TIPO_COMMISSIONE`) REFERENCES `cfg_tipo_commissione` (`ID`)  ,
  CONSTRAINT `FK_CFG_GATEWAY_PAGAMENTO_1` FOREIGN KEY (`ID_CFG_GATEWAY_PAGAMENTO`) REFERENCES `cfg_gateway_pagamento` (`ID`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- TABELLE DI PROFILAZIONE
--


--
-- Table structure for table   INDIRIZZI_POSTALI [ex `jlte036`]
--

DROP TABLE IF EXISTS `indirizzi_postali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indirizzi_postali` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CAP` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `CASELLAPOSTALE` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `CODICEFISCALE` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `COMUNE` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `FAX` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FLAGRESIDENTE` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `INDIRIZZO` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `NAZIONE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PARTITAIVA` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PROVINCIA` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `RECORDLOCK` smallint(6) DEFAULT NULL,
  `TELEFONO` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `TELEFONOCELLULARE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` tinytext COLLATE utf8_bin,
  `NUMEROCIVICO` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `PR_VERSIONE` int(11) DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_INSERIMENTO` datetime DEFAULT NULL,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table  INTESTATARI [ex `jlte037`]
--

DROP TABLE IF EXISTS `intestatari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intestatari` (
  `ABI` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `ABIACCENTRATORE` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `BOLLOVIRTUALE` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `CAB` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `CHIAVESSB` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `CODICEPOSTEL` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `CODICESOFTWARE` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `DENOMINAZIONE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `FUNZIONIABILITATE` text COLLATE utf8_bin,
  `GRUPPO` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ID_INDIRIZZIPOSTALI` int(10) unsigned DEFAULT NULL,
  `INTESTATARIO` varchar(20) COLLATE utf8_bin NOT NULL,
  `LAPL` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `RAGIONESOCIALE` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `RAPL` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `RCZ` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `RECORDLOCK` smallint(6) DEFAULT NULL,
  `SIA` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `STATO` int(11) DEFAULT NULL,
  `TIPOINTESTATARIO` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `TIPOSICUREZZA` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `UFFPOSTALE` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `AZIENDAMIGRATA` char(1) COLLATE utf8_bin DEFAULT NULL,
  `IMPORTOMAXFLUSSO` decimal(15,2) DEFAULT NULL,
  `NONRESIDENTE` char(1) COLLATE utf8_bin DEFAULT NULL,
  `TMB_PRIMA_ATT` datetime DEFAULT NULL,
  `TMB_ULTIMA_ATT` datetime DEFAULT NULL,
  `CODICECUC` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `ISSR` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORIA` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SOTTOCATEGORIA` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PR_VERSIONE` int(11) DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_INSERIMENTO` datetime DEFAULT NULL,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `FLAG_COMUNICAZIONI` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`INTESTATARIO`),
  CONSTRAINT `FK_INDIRIZZI_POSTALI` FOREIGN KEY (`ID_INDIRIZZIPOSTALI`) REFERENCES `indirizzi_postali` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iuv`
--

DROP TABLE IF EXISTS `iuv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iuv` (
  `ID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table  OPERATORI [ex `jlte065`]
--


DROP TABLE IF EXISTS `operatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operatori` (
  `OPERATORE` varchar(40) COLLATE utf8_bin NOT NULL,
  `INTESTATARIO` varchar(40) COLLATE utf8_bin NOT NULL,
  `CELLULARE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CODICEFIRMATARIO` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIZIONE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `NULL_COLL_FALL` int(11) DEFAULT NULL,
  `ULTIMOCOLLEGAMENTO` datetime DEFAULT NULL,
  `BLOCCATO` smallint(6) DEFAULT NULL,
  `FLAGABILITATO` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `NOME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `USERNAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `DATASCADENZA` date DEFAULT NULL,
  `DATA_COLL_FALL` datetime DEFAULT NULL,
  `DATABLOCCO` datetime DEFAULT NULL,
  `ABILRAPP` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORDDISPO` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `NUMCOLLFALLITIDISP` int(11) DEFAULT NULL,
  `BLOCCATODISP` smallint(6) DEFAULT NULL,
  `SCADPSWDISP` datetime DEFAULT NULL,
  `FUNZIONIABILITATE` varchar(7600) COLLATE utf8_bin DEFAULT NULL,
  `PROFILAZIONEESTESA` smallint(6) DEFAULT NULL,
  `CODICEFISCALE` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `COGNOME` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PR_VERSIONE` int(11) DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_INSERIMENTO` datetime DEFAULT NULL,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OPERATORE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table intestatari_operatori [Ex. `jlte060`]
--

DROP TABLE IF EXISTS `intestatari_operatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intestatari_operatori` (
  `INTESTATARIO` varchar(40) COLLATE utf8_bin NOT NULL,
  `OPERATORE` varchar(40) COLLATE utf8_bin NOT NULL,
  `TP_OPERATORE` varchar(2) COLLATE utf8_bin NOT NULL,
  `BLOCCATO` smallint(6) NOT NULL DEFAULT '0',
  `PR_VERSIONE` int(11) DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_INSERIMENTO` datetime DEFAULT NULL,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`INTESTATARIO`,`OPERATORE`,`TP_OPERATORE`),
  CONSTRAINT `FK_OPERATORI` FOREIGN KEY (`OPERATORE`) REFERENCES `operatori` (`OPERATORE`) ,
  CONSTRAINT `FK_INTESTATARI_0` FOREIGN KEY (`INTESTATARIO`) REFERENCES `intestatari` (`INTESTATARIO`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `iban`
--

DROP TABLE IF EXISTS `iban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iban` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_ENTE` varchar(50) NOT NULL,
  `CD_TRB_ENTE` varchar(50) NOT NULL,
  `ID_SYSTEM` varchar(35) NOT NULL,
  `IBAN` varchar(34) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table categorie_enti [e.g. `jltentp`]
--

DROP TABLE IF EXISTS `categorie_enti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie_enti` (
  `TP_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `DE_ENTE` tinytext COLLATE utf8_bin,
  `STATO` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TP_ENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table ENTI [Ex. `jltenti`]
--

DROP TABLE IF EXISTS `enti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enti` (
  `ID_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `CD_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `TP_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `INTESTATARIO` varchar(20) COLLATE utf8_bin NOT NULL,
  `DENOM` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `PROVINCIA` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `STATO` char(1) COLLATE utf8_bin NOT NULL,
  `MAX_NUM_TRIBUTI` int(11) NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_ENTE`),
  UNIQUE KEY `NDX_CDENTE_ENTI` (`CD_ENTE`),
  UNIQUE KEY `NDX_TENTI` (`INTESTATARIO`),
  KEY `JLTENTI_IDX1` (`ID_ENTE`,`INTESTATARIO`), 
  CONSTRAINT `FK_CATEGORIE_ENTI` FOREIGN KEY (`TP_ENTE`) REFERENCES `categorie_enti` (`TP_ENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `proprieta_connettori`
--
DROP TABLE IF EXISTS `proprieta_connettori`;

CREATE TABLE `proprieta_connettori` (
  `ID_CONNETTORE` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOME_PROPRIETA` varchar(50) NOT NULL,
  `VALORE_PROPRIETA` varchar(1000) DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_CONNETTORE`,`NOME_PROPRIETA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `intermediari`
--
DROP TABLE IF EXISTS `intermediari`;

CREATE TABLE `intermediari` (
  `ID_INTERMEDIARIO` varchar(35) COLLATE utf8_bin NOT NULL,
  `ID_CONNETTORE_PDD` int(10) unsigned DEFAULT NULL,
  `NOME_SOGGETTO_SPC` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_INTERMEDIARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `sil` [ex. `jltsil`]
--

DROP TABLE IF EXISTS `sil`;
CREATE TABLE `sil` (
  `ID_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_SYSTEM` varchar(35) COLLATE utf8_bin NOT NULL,
  `DE_SYSTEM` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `STATO` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `ID_CONNETTORE_NOTIFICA` int(10) unsigned DEFAULT NULL,
  `ID_CONNETTORE_PAGATTESA` int(10) unsigned DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_ENTE`,`ID_SYSTEM`),
  CONSTRAINT `FK_ENTI_SIL` FOREIGN KEY (`ID_ENTE`) REFERENCES `enti` (`ID_ENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Table structure for table `stazioni_intermediario`
--
DROP TABLE IF EXISTS `stazioni_intermediario`;

CREATE TABLE `stazioni_intermediario` (
  `ID_STAZIONE` varchar(35) COLLATE utf8_bin NOT NULL,
  `ID_INTERMEDIARIO` varchar(35) COLLATE utf8_bin NOT NULL,
  `ID_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_SYSTEM` varchar(35) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_STAZIONE`,`ID_INTERMEDIARIO`),
  CONSTRAINT `FK_INTRMD_STAZ` FOREIGN KEY (`ID_INTERMEDIARIO`) REFERENCES `intermediari` (`ID_INTERMEDIARIO`),
  CONSTRAINT `FK_INTRMD_SIL` FOREIGN KEY (`ID_ENTE`,`ID_SYSTEM`) REFERENCES `sil` (`ID_ENTE`,`ID_SYSTEM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `domini`
--
DROP TABLE IF EXISTS `domini`;

CREATE TABLE `domini` (
  `ID_DOMINIO` varchar(35) COLLATE utf8_bin NOT NULL,
  `ID_INTERMEDIARIO` varchar(35) COLLATE utf8_bin NOT NULL,
  `ID_ENTE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_DOMINIO`,`ID_INTERMEDIARIO`),
  CONSTRAINT `FK_INTRMD_DOM` FOREIGN KEY (`ID_INTERMEDIARIO`) REFERENCES `intermediari` (`ID_INTERMEDIARIO`),
  CONSTRAINT `FK_ENTI_DOM` FOREIGN KEY (`ID_ENTE`) REFERENCES `enti` (`ID_ENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table CATEGORIE_TRIBUTI [ex. `jlttrpa`]
--

DROP TABLE IF EXISTS `categorie_tributi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie_tributi` (
  `ID_TRIBUTO` varchar(50) COLLATE utf8_bin NOT NULL,
  `DE_TRB` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CD_ADE` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `TP_ENTRATA` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `FL_PREDETERM` char(1) COLLATE utf8_bin DEFAULT NULL,
  `FL_INIZIATIVA` char(1) COLLATE utf8_bin DEFAULT NULL,
  `SOGG_ESCLUSI` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CDPAGAMENTOSPONTANEO` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `STATO` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_TRIBUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table tributi_ente [ex.  `jltentr`]
--

DROP TABLE IF EXISTS `tributi_ente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tributi_ente` (
  `ID_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `CD_TRB_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_TRIBUTO` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_SYSTEM` varchar(35) COLLATE utf8_bin NOT NULL,
  `DE_TRB` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FL_INIZIATIVA` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `FL_PREDETERM` char(1) COLLATE utf8_bin DEFAULT NULL,
  `SOGG_ESCLUSI` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `IBAN` varchar(35) COLLATE utf8_bin NOT NULL,
  `STATO` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `FL_NOTIFICA_PAGAMENTO` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `INFO_TRIBUTO` text COLLATE utf8_bin,
  `URL_UPD_SERVICE` text COLLATE utf8_bin,
  `URL_INFO_SERVICE` text COLLATE utf8_bin,
  `FL_RICEVUTA_ANONIMO` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `FL_NASCOSTO_FE` char(1) COLLATE utf8_bin DEFAULT NULL,
  `ISTRUZIONI_PAGAMENTO` text COLLATE utf8_bin,
  `IBAN_CONTO_TECNICO` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_ENTE`,`CD_TRB_ENTE`),
  KEY `NDX_ENTR` (`ID_ENTE`,`ID_TRIBUTO`),
  CONSTRAINT `FK_SIL` FOREIGN KEY (`ID_ENTE`,`ID_SYSTEM`) REFERENCES `sil` (`ID_ENTE`,`ID_SYSTEM`),
  CONSTRAINT `FK_CATEGORIE_TRIBUTI_0` FOREIGN KEY (`ID_TRIBUTO`) REFERENCES `categorie_tributi` (`ID_TRIBUTO`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- TABELLE POSIZIONI
--

--
-- Table structure for table PENDENZE [ex `jltpend`]
--

DROP TABLE IF EXISTS `pendenze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendenze` (
  `ID_PENDENZA` varchar(20) COLLATE utf8_bin NOT NULL,
  `TS_DECORRENZA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `CD_TRB_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_TRIBUTO` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_PENDENZAENTE` varchar(35) COLLATE utf8_bin NOT NULL,
  `ID_SYSTEM` varchar(35) COLLATE utf8_bin NOT NULL,
  `TS_CREAZIONEENTE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TS_EMISSIONEENTE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TS_PRESCRIZIONE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TS_MODIFICAENTE` datetime DEFAULT NULL,
  `CO_RISCOSSORE` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `RIFERIMENTO` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `ANNO_RIFERIMENTO` int(11) NOT NULL,
  `NOTE` text COLLATE utf8_bin,
  `DV_RIFERIMENTO` varchar(3) COLLATE utf8_bin NOT NULL,
  `IM_TOTALE` decimal(15,2) NOT NULL,
  `CO_ABI` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `ID_MITTENTE` varchar(35) COLLATE utf8_bin NOT NULL,
  `DE_MITTENTE` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `DE_CAUSALE` tinytext COLLATE utf8_bin NOT NULL,
  `ST_PENDENZA` varchar(2) COLLATE utf8_bin NOT NULL,
  `FL_MOD_PAGAMENTO` char(1) COLLATE utf8_bin DEFAULT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `OP_ANNULLAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_ANNULLAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `ID_TRIBUTO_STRUTTURATO` int(11) DEFAULT NULL,
  `CARTELLA_PAGAMENTO` int(11) DEFAULT '0',
  `TS_ANNULLAMENTO_MILLIS` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_PENDENZA`),
  UNIQUE KEY `NDX_PEND` (`CD_TRB_ENTE`,`ID_ENTE`,`ID_PENDENZAENTE`, `TS_ANNULLAMENTO_MILLIS`),
  KEY `JLTPEND_IDX0` (`ST_RIGA`,`ID_TRIBUTO`),
  KEY `JLTPEND_IDX1` (`ID_PENDENZA`,`ID_ENTE`,`CD_TRB_ENTE`,`ID_TRIBUTO`),
  KEY `JLTPEND_IDX2` (`ID_PENDENZA`,`ST_RIGA`),
  KEY `JLTPEND_IDX3` (`ID_PENDENZA`,`ST_RIGA`,`ID_ENTE`,`TS_EMISSIONEENTE`,`CD_TRB_ENTE`),
  CONSTRAINT `FK_CATEGORIE_TRIBUTI_1` FOREIGN KEY (`ID_TRIBUTO`) REFERENCES `categorie_tributi` (`ID_TRIBUTO`) ,
  CONSTRAINT `FK_TRIBUTI_ENTE_0` FOREIGN KEY (`ID_ENTE`,`CD_TRB_ENTE`) REFERENCES `tributi_ente` (`ID_ENTE`,`CD_TRB_ENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table DESTINATARI [ex `jltdepd`]
--

DROP TABLE IF EXISTS `destinatari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinatari` (
  `ID_PENDENZA` varchar(20) COLLATE utf8_bin NOT NULL,
  `ID_DESTINATARIO` varchar(20) COLLATE utf8_bin NOT NULL,
  `TS_DECORRENZA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CO_DESTINATARIO` varchar(35) COLLATE utf8_bin NOT NULL,
  `DE_DESTINATARIO` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `TI_DESTINATARIO` varchar(2) COLLATE utf8_bin NOT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_DESTINATARIO`),
  KEY `JLTDEPD_IDX1` (`ID_PENDENZA`,`DE_DESTINATARIO`),
  KEY `JLTDEPD_IDX2` (`ID_PENDENZA`,`CO_DESTINATARIO`),
  CONSTRAINT `FK_PENDENZE_0` FOREIGN KEY (`ID_PENDENZA`) REFERENCES `pendenze` (`ID_PENDENZA`)   
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table CONDIZIONI [ex. `jltcopd`]
--

DROP TABLE IF EXISTS `condizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condizioni` (
  `ID_PENDENZA` varchar(20) COLLATE utf8_bin NOT NULL,
  `ID_CONDIZIONE` varchar(20) COLLATE utf8_bin NOT NULL,
  `TS_DECORRENZA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TI_PAGAMENTO` varchar(1) COLLATE utf8_bin NOT NULL,
  `ID_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `CD_TRB_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_PAGAMENTO` varchar(35) COLLATE utf8_bin NOT NULL,
  `TI_CIP` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CO_CIP` tinytext COLLATE utf8_bin,
  `DT_SCADENZA` date NOT NULL,
  `DT_INIZIOVALIDITA` date DEFAULT NULL,
  `DT_FINEVALIDITA` date NOT NULL,
  `IM_TOTALE` decimal(15,2) NOT NULL,
  `ST_PAGAMENTO` char(1) COLLATE utf8_bin NOT NULL,
  `DT_PAGAMENTO` datetime DEFAULT NULL,
  `DE_CANALEPAG` varchar(140) COLLATE utf8_bin DEFAULT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `OP_ANNULLAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_ANNULLAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `IBAN_BENEFICIARIO` varchar(27) COLLATE utf8_bin DEFAULT NULL,
  `RAGIONE_SOCIALE_BENEFICIARIO` varchar(90) COLLATE utf8_bin DEFAULT NULL,
  `CAUSALE_PAGAMENTO` tinytext COLLATE utf8_bin,
  `IM_PAGAMENTO` decimal(15,2) DEFAULT NULL,
  `DE_NOTEPAGAMENTO` tinytext COLLATE utf8_bin,
  `DE_MEZZOPAGAMENTO` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `TS_ANNULLAMENTO_MILLIS` bigint(20) not null default '0',
  PRIMARY KEY (`ID_CONDIZIONE`),
  UNIQUE KEY `NDX_IDPEND_COPD` (`ID_ENTE`,`ID_PAGAMENTO`,`TS_ANNULLAMENTO_MILLIS`),
  KEY `JLTCOPD_IDX0` (`DT_SCADENZA`,`ST_PAGAMENTO`),
  KEY `JLTCOPD_IDX1` (`ID_PENDENZA`,`ST_PAGAMENTO`),
  KEY `JLTCOPD_IDX2` (`ID_ENTE`,`CD_TRB_ENTE`,`ID_PAGAMENTO`),
  KEY `JLTCOPD_IDX3` (`ST_PAGAMENTO`),
  CONSTRAINT `FK_PENDENZE_1` FOREIGN KEY (`ID_PENDENZA`) REFERENCES `pendenze` (`ID_PENDENZA`)   
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table VOCI [ex.`jltvopd`]
--

DROP TABLE IF EXISTS `voci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voci` (
  `ID_PENDENZA` varchar(20) COLLATE utf8_bin NOT NULL,
  `ID_CONDIZIONE` varchar(20) COLLATE utf8_bin NOT NULL,
  `ID_VOCE` varchar(20) COLLATE utf8_bin NOT NULL,
  `TS_DECORRENZA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TI_VOCE` varchar(35) COLLATE utf8_bin NOT NULL,
  `CO_VOCE` varchar(35) COLLATE utf8_bin NOT NULL,
  `DE_VOCE` tinytext COLLATE utf8_bin NOT NULL,
  `IM_VOCE` decimal(15,2) NOT NULL,
  `CO_CAPBILANCIO` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `CO_ACCERTAMENTO` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_VOCE`),
  KEY `JLTVOPD_IDX1` (`ID_PENDENZA`,`ID_CONDIZIONE`),
  KEY `PK_JLTVOPD` (`ID_VOCE`),
  CONSTRAINT `FK_CONDIZIONI_0` FOREIGN KEY (`ID_CONDIZIONE`) REFERENCES `condizioni` (`ID_CONDIZIONE`),
  CONSTRAINT `FK_PENDENZE_2` FOREIGN KEY (`ID_PENDENZA`) REFERENCES `pendenze` (`ID_PENDENZA`)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table ALLEGATI [ex `jltalpe`]
--

DROP TABLE IF EXISTS `allegati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allegati` (
  `ID_PENDENZA` varchar(20) COLLATE utf8_bin NOT NULL,
  `ID_ALLEGATO` varchar(20) COLLATE utf8_bin NOT NULL,
  `TS_DECORRENZA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_CONDIZIONE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FL_CONTESTO` char(1) COLLATE utf8_bin NOT NULL,
  `TITOLO` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `TI_CODIFICA_BODY` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `DATI_BODY` mediumblob NOT NULL,
  `TI_ALLEGATO` varchar(10) COLLATE utf8_bin NOT NULL,
  `ID_ANTIFALSIFIC` text COLLATE utf8_bin,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `PR_VERSIONE` int(11) NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_ALLEGATO`),
  UNIQUE KEY `NDX_ALPE` (`ID_PENDENZA`,`ID_ALLEGATO`,`ID_CONDIZIONE`),
  CONSTRAINT `FK_CONDIZIONI_1` FOREIGN KEY (`ID_CONDIZIONE`) REFERENCES `condizioni` (`ID_CONDIZIONE`),
  CONSTRAINT `FK_PENDENZE_3` FOREIGN KEY (`ID_PENDENZA`) REFERENCES `pendenze` (`ID_PENDENZA`)   
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- TABELLE PAGAMENTI
--

--
-- Table structure for table `documenti_repository`
--

DROP TABLE IF EXISTS `documenti_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenti_repository` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOME_FILE` tinytext COLLATE utf8_bin,
  `DIMENSIONE` int(11) DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `DOCUMENTO` mediumblob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `distinte_pagamento`
--

DROP TABLE IF EXISTS `distinte_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distinte_pagamento` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATO` varchar(25) COLLATE utf8_bin NOT NULL,
  `IMPORTO` decimal(15,2) NOT NULL,
  `IMPORTO_COMMISSIONI` decimal(15,2) NOT NULL,
  `DATA_CREAZIONE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DATA_SPEDIZIONE` datetime DEFAULT NULL,
  `UTENTE_CREATORE` varchar(20) COLLATE utf8_bin NOT NULL,
  `NUMERO_DISPOSIZIONI` int(11) NOT NULL,
  `DIVISA` varchar(3) COLLATE utf8_bin NOT NULL,
  `COD_TRANSAZIONE` varchar(35) COLLATE utf8_bin NOT NULL,
  `ID_CFG_GATEWAY_PAGAMENTO` int(10) unsigned NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `DATA_PAGAMENTO` datetime DEFAULT NULL,
  `ID_DOCUMENTO_REPOSITORY` int(10) unsigned DEFAULT NULL,
  `COD_PAGAMENTO` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_VERSANTE` tinytext COLLATE utf8_bin NOT NULL,
  `COD_TRANSAZIONE_PSP` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `AUTENTICAZIONE_SOGGETTO` varchar(3) COLLATE utf8_bin, 
  `TIPO_FIRMA` varchar(10) COLLATE utf8_bin, 
  `IUV` varchar(35) COLLATE utf8_bin,
  `ID_FISCALE_CREDITORE`  varchar(16) COLLATE utf8_bin,
  `TS_ANNULLAMENTO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `ID_GRUPPO` varchar(35) COLLATE utf8_bin, 
  `IBAN_ADDEBITO` varchar(35) COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DISTINTE_PAGAMENTO_COD_TRANSAZIONE` (`COD_TRANSAZIONE`),
  UNIQUE KEY `DISTINTE_PAGAMENTO_IUV` (`IUV`,`ID_FISCALE_CREDITORE`,`COD_TRANSAZIONE_PSP`),
  CONSTRAINT `FK_CFG_GATEWAY_PAGAMENTO_0` FOREIGN KEY (`ID_CFG_GATEWAY_PAGAMENTO`) REFERENCES `cfg_gateway_pagamento` (`ID`) ,
  CONSTRAINT `FK_DOCUMENTI_REPOSITORY_0` FOREIGN KEY (`ID_DOCUMENTO_REPOSITORY`) REFERENCES `documenti_repository` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

  
--
-- Table structure for table `pagamenti`
--

DROP TABLE IF EXISTS `pagamenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamenti` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TS_DECORRENZA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_PENDENZA` char(20) COLLATE utf8_bin DEFAULT NULL,
  `ID_CONDIZIONE` varchar(20) COLLATE utf8_bin NOT NULL,
  `ID_TRIBUTO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ID_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `CD_TRB_ENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `ID_DISTINTE_PAGAMENTO` int(10) unsigned NOT NULL,
  `ID_PENDENZAENTE` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `CO_PAGANTE` varchar(20) COLLATE utf8_bin NOT NULL,
  `DT_SCADENZA` date NOT NULL,
  `TI_PAGAMENTO` char(1) COLLATE utf8_bin NOT NULL,
  `ST_PAGAMENTO` char(2) COLLATE utf8_bin NOT NULL,
  `STATO_NOTIFICA` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `IM_PAGATO` decimal(10,3) NOT NULL,
  `TIPOSPONTANEO` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `DISTINTA` varchar(20) COLLATE utf8_bin NOT NULL,
  `TS_ORDINE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TI_DEBITO` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `FLAG_INCASSO` char(1) COLLATE utf8_bin NOT NULL,
  `ST_RIGA` char(1) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT '0',
  `ID_DOCUMENTO_REPOSITORY` int(11) DEFAULT NULL,
  `NOTIFICA_ESEGUITO` datetime DEFAULT NULL,
  `NOTIFICA_REGOLATO` datetime DEFAULT NULL,
  `NOTIFICA_INCASSO` datetime DEFAULT NULL,
  `ID_RISCOSSIONE_PSP` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `NOTE_PAGAMENTO` tinytext COLLATE utf8_bin,
  `TS_STORNO` datetime DEFAULT NULL,
  `DATA_ACCREDITO_CONTOTECNICO` date DEFAULT NULL,
  `DATA_ACCREDITO_ENTE` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PAGAMENTI_3` (`ST_PAGAMENTO`,`FLAG_INCASSO`,`STATO_NOTIFICA`,`TS_AGGIORNAMENTO`),
  KEY `INDX_PAGAMENTI_ALERT` (`FLAG_INCASSO`,`TS_AGGIORNAMENTO`,`ID_CONDIZIONE`),
  KEY `INDX_PAGAMENTI_ST_PAGAMENTO` (`ST_PAGAMENTO`),
  CONSTRAINT `FK_TRIBUTI_ENTE_1` FOREIGN KEY (`ID_ENTE`,`CD_TRB_ENTE`) REFERENCES `tributi_ente` (`ID_ENTE`,`CD_TRB_ENTE`) ,
  CONSTRAINT `FK_DISTINTE_PAGAMENTO_0` FOREIGN KEY (`ID_DISTINTE_PAGAMENTO`) REFERENCES `distinte_pagamento` (`ID`) ,
  CONSTRAINT `FK_CONDIZIONI_2` FOREIGN KEY (`ID_CONDIZIONE`) REFERENCES `condizioni` (`ID_CONDIZIONE`),
  CONSTRAINT `FK_PENDENZE_4` FOREIGN KEY (`ID_PENDENZA`) REFERENCES `pendenze` (`ID_PENDENZA`)     
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `documenti_pagamento`
--

DROP TABLE IF EXISTS `documenti_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenti_pagamento` (
  `ID` varchar(41) COLLATE utf8_bin NOT NULL,
  `ID_CFG_GATEWAY_PAGAMENTO` int(10) unsigned NOT NULL,
  `TS_EMISSIONE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATO` char(1) COLLATE utf8_bin NOT NULL,
  `INTESTATARIO` varchar(20) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `OP_ANNULLAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_ANNULLAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `ID_DISTINTA_PAGAMENTO` int(10) unsigned DEFAULT NULL,
  `IMPORTO` decimal(15,2) DEFAULT NULL,
  `IMPORTO_COMMISSIONI` decimal(15,2) DEFAULT NULL,
  `ID_DOCUMENTO_REPOSITORY` int(10) unsigned DEFAULT NULL,
  `DT_SCADENZA_DOC` date DEFAULT NULL,
  `EMAIL_VERSANTE` tinytext COLLATE utf8_bin NOT NULL,
  `CO_PAGANTE` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_INTESTATARI_1` FOREIGN KEY (`INTESTATARIO`) REFERENCES `intestatari` (`INTESTATARIO`) ,
  CONSTRAINT `FK_CFG_GATEWAY_PAGAMENTO_2` FOREIGN KEY (`ID_CFG_GATEWAY_PAGAMENTO`) REFERENCES `cfg_gateway_pagamento` (`ID`) ,
  CONSTRAINT `FK_DISTINTE_PAGAMENTO_1` FOREIGN KEY (`ID_DISTINTA_PAGAMENTO`) REFERENCES `distinte_pagamento` (`ID`) ,
  CONSTRAINT `FK_DOCUMENTI_REPOSITORY_1` FOREIGN KEY (`ID_DOCUMENTO_REPOSITORY`) REFERENCES `documenti_repository` (`ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `condizioni_documento`
--

DROP TABLE IF EXISTS `condizioni_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condizioni_documento` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_CONDIZIONE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ID_DOCUMENTO` varchar(41) COLLATE utf8_bin DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `OP_ANNULLAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_ANNULLAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_DOCUMENTI_PAGAMENTO` FOREIGN KEY (`ID_DOCUMENTO`) REFERENCES `documenti_pagamento` (`ID`) ,
  CONSTRAINT `FK_CONDIZIONI_3` FOREIGN KEY (`ID_CONDIZIONE`) REFERENCES `condizioni`(`ID_CONDIZIONE`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagamenti_online`
--

DROP TABLE IF EXISTS `pagamenti_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamenti_online` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_DISTINTE_PAGAMENTO` int(10) unsigned DEFAULT NULL,
  `COD_AUTORIZZAZIONE` varchar(41) COLLATE utf8_bin DEFAULT NULL,
  `SESSION_ID_SISTEMA` varchar(5) COLLATE utf8_bin NOT NULL,
  `SESSION_ID_TERMINALE` varchar(20) COLLATE utf8_bin NOT NULL,
  `SESSION_ID_TOKEN` varchar(255) COLLATE utf8_bin NOT NULL,
  `SESSION_ID_TIMBRO` varchar(20) COLLATE utf8_bin NOT NULL,
  `TS_OPERAZIONE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TI_OPERAZIONE` varchar(30) COLLATE utf8_bin NOT NULL,
  `NUM_OPERAZIONE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `ID_OPERAZIONE` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `DE_OPERAZIONE` tinytext COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT '0',
  `APPLICATION_ID` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT 'THIS',
  `SYSTEM_ID` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT 'THIS',
  `ESITO` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'OK',
  `COD_ERRORE` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_DISTINTE_PAGAMENTO_2` FOREIGN KEY (`ID_DISTINTE_PAGAMENTO`) REFERENCES `distinte_pagamento` (`ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- TABELLE UTILITA' WEB
--

--
-- Table structure for table `prenotazioni`
--

DROP TABLE IF EXISTS `prenotazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prenotazioni` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `INTESTATARIO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `OPERATORE_RICH` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `COD_RICH` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `TIPOSERVIZIO` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `TIMESTAMP_BEGIN` datetime DEFAULT NULL,
  `TIMESTAMP_END` datetime DEFAULT NULL,
  `STATO` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL,
  `TIPO_ESPORTAZIONE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PRENOTAZIONI_INTESTATARIO` (`INTESTATARIO`),
  KEY `IDX_PRENOTAZIONI_TS_INSERIMENTO` (`TS_INSERIMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `esportazioni`
--

DROP TABLE IF EXISTS `esportazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esportazioni` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_PRENOTAZIONE` int(11) DEFAULT NULL,
  `NOME_FILE` tinytext COLLATE utf8_bin NOT NULL,
  `FORMATO` varchar(3) COLLATE utf8_bin NOT NULL,
  `COMPRESSIONE` char(1) COLLATE utf8_bin NOT NULL,
  `LEN_DATI` int(11) NOT NULL,
  `DATI` mediumblob NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- TABELLE GATEWAY GOVPAY
--

--
-- Table structure for table cfg_gateway_client [ex `cfg_iris_gateway_client` ]
--

DROP TABLE IF EXISTS `cfg_gateway_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_gateway_client` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `APPLICATION_ID` varchar(30) COLLATE utf8_bin NOT NULL,
  `SYSTEM_ID` varchar(5) COLLATE utf8_bin NOT NULL,
  `URL_OK` text COLLATE utf8_bin NOT NULL,
  `URL_KO` text COLLATE utf8_bin NOT NULL,
  `URL_ANNULLA` varchar(50) COLLATE utf8_bin NOT NULL,
  `AUTHENTICATED` smallint(6) NOT NULL DEFAULT '0',
  `DESCRIZIONE` tinytext COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDX_SYSAPP_CFG_GATEWAY_CLIENT` (`SYSTEM_ID`,`APPLICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table gateway_session [ex `iris_gateway_session`]
--

DROP TABLE IF EXISTS `gateway_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateway_session` (
  `TOKEN` varchar(32) COLLATE utf8_bin NOT NULL,
  `SESSION_ID` varchar(40) COLLATE utf8_bin NOT NULL,
  `GTW_CLIENT_ID` int(10) unsigned NOT NULL,
  `USATA` smallint(6) NOT NULL DEFAULT '0',
  `IM_TOTALE` decimal(15,2) NOT NULL DEFAULT '0.00',
  `OPERATORE` varchar(80) COLLATE utf8_bin NOT NULL,
  `INTESTATARIO` varchar(40) COLLATE utf8_bin NOT NULL,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL,
  `URL_BACK` text COLLATE utf8_bin,
  `URL_CANCEL` text COLLATE utf8_bin,
  `OFFLINE_PAYMENT_METHODS` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TOKEN`),
  CONSTRAINT `FK_CFG_GATEWAY_CLIENT` FOREIGN KEY (`GTW_CLIENT_ID`) REFERENCES `cfg_gateway_client` (`ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table gateway_shop_cart [ex. `iris_gateway_shop_cart`]
--

DROP TABLE IF EXISTS `gateway_shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateway_shop_cart` (
  `TOKEN` varchar(32) COLLATE utf8_bin NOT NULL,
  `ID_CONDIZIONE` varchar(20) COLLATE utf8_bin NOT NULL,
  `IM_TOTALE` decimal(15,2) NOT NULL DEFAULT '0.00',
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL,
  PRIMARY KEY (`TOKEN`,`ID_CONDIZIONE`),
  CONSTRAINT `FK_CONDIZIONI_4` FOREIGN KEY (`ID_CONDIZIONE`) REFERENCES `condizioni` (`ID_CONDIZIONE`),
  CONSTRAINT `FK_GATEWAY_SESSION` FOREIGN KEY (`TOKEN`) REFERENCES `gateway_session` (`TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table gde_infospcoop 
--

DROP TABLE IF EXISTS `gde_infospcoop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE gde_infospcoop
(
	id_egov VARCHAR(255) NOT NULL,
	tipo_soggetto_erogatore VARCHAR(255) NOT NULL,
	soggetto_erogatore VARCHAR(255) NOT NULL,
	tipo_soggetto_fruitore VARCHAR(255) NOT NULL,
	soggetto_fruitore VARCHAR(255) NOT NULL,
	tipo_servizio VARCHAR(255) NOT NULL,
	servizio VARCHAR(255) NOT NULL,
	azione VARCHAR(255) NOT NULL,
	-- fk/pk columns
	-- fk/pk keys constraints
	CONSTRAINT pk_gde_infospcoop PRIMARY KEY (id_egov)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Table structure for table gde_eventi 
--

DROP TABLE IF EXISTS `gde_eventi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE gde_eventi
(
	-- Precisione ai millisecondi supportata dalla versione 5.6.4, se si utilizza una versione precedente non usare il suffisso '(3)'
	dt_evento TIMESTAMP(3) NOT NULL DEFAULT 0,
	id_dominio VARCHAR(35) NOT NULL,
	id_univoco_versamento VARCHAR(35) NOT NULL,
	codice_contesto_pagamento VARCHAR(35) NOT NULL,
	id_prestatoreservizi_pagamento VARCHAR(35) NOT NULL,
	tipo_versamento VARCHAR(4) NOT NULL,
	componente VARCHAR(35) NOT NULL,
	categoria_evento VARCHAR(255) NOT NULL,
	tipo_evento VARCHAR(35) NOT NULL,
	sotto_tipo_evento VARCHAR(35) NOT NULL,
	id_fruitore VARCHAR(35) NOT NULL,
	id_erogatore VARCHAR(35) NOT NULL,
	id_stazione_intermediario_pa VARCHAR(35),
	canale_pagamento VARCHAR(35),
	param_specifici_interfaccia VARCHAR(255),
	esito VARCHAR(35),
	id_egov VARCHAR(255),
	-- fk/pk columns
	id BIGINT AUTO_INCREMENT,
	-- check constraints
	CONSTRAINT chk_gde_eventi_1 CHECK (categoria_evento IN ('INTERFACCIA','INTERNO')),
	-- fk/pk keys constraints
	CONSTRAINT fk_gde_eventi_1 FOREIGN KEY (id_egov) REFERENCES gde_infospcoop(id_egov) ON DELETE CASCADE,
	CONSTRAINT pk_gde_eventi PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;





--
-- Table structure for table gde_documenti_ndp 
--

DROP TABLE IF EXISTS `gde_documenti_ndp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE gde_documenti_ndp
(
    `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`ID_DOMINIO` VARCHAR(35) COLLATE utf8_bin NOT NULL,
	`ID_UNIVOCO_VERSAMENTO` VARCHAR(35) NOT NULL,
	`CODICE_CONTESTO_PAGAMENTO` VARCHAR(35) NOT NULL,
	`TENTATIVO` int(4) NOT NULL,
	`TIPO` char(2) COLLATE utf8_bin,
    `DIMENSIONE` int(11) DEFAULT NULL,	
    `DOCUMENTO` mediumblob NOT NULL,
    `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
    `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
    `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
    `VERSION` int(11) NOT NULL DEFAULT '0',
   PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table dati_versante 
--

DROP TABLE IF EXISTS `dati_anagrafici_versante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dati_anagrafici_versante` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_DISTINTE_PAGAMENTO` int(10) unsigned NOT NULL,
  `TIPO_SOGGETTO` char(1) COLLATE utf8_bin NOT NULL,
  `ANAGRAFICA` varchar(70) COLLATE utf8_bin,
  `INDIRIZZO` varchar(70) COLLATE utf8_bin,
  `NUMERO_CIVICO` varchar(16) COLLATE utf8_bin,
  `CAP` varchar(16) COLLATE utf8_bin,
  `LOCALITA` varchar(35) COLLATE utf8_bin,
  `PROVINCIA` varchar(35) COLLATE utf8_bin,
  `NAZIONE` char(2) COLLATE utf8_bin,
  `EMAIL` varchar(256) COLLATE utf8_bin,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_DISTINTE_PAGAMENTO_3` FOREIGN KEY (`ID_DISTINTE_PAGAMENTO`) REFERENCES `distinte_pagamento` (`ID`)   
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table dati_anagrafici_destinatario
--
DROP TABLE IF EXISTS `dati_anagrafici_destinatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dati_anagrafici_destinatario` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT, 
  `ID_DESTINATARIO` varchar(20) COLLATE utf8_bin NOT NULL,
  `TIPO_SOGGETTO` char(1) COLLATE utf8_bin NOT NULL,
  `ANAGRAFICA` varchar(70) COLLATE utf8_bin,
  `INDIRIZZO` varchar(70) COLLATE utf8_bin,
  `NUMERO_CIVICO` varchar(16) COLLATE utf8_bin,
  `CAP` varchar(16) COLLATE utf8_bin,
  `LOCALITA` varchar(35) COLLATE utf8_bin,
  `PROVINCIA` varchar(35) COLLATE utf8_bin,
  `NAZIONE` char(2) COLLATE utf8_bin,
  `EMAIL` varchar(256) COLLATE utf8_bin,
  `OP_INSERIMENTO` varchar(40) COLLATE utf8_bin NOT NULL,
  `TS_INSERIMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_AGGIORNAMENTO` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `TS_AGGIORNAMENTO` datetime DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_DESTINATARI` FOREIGN KEY (`ID_DESTINATARIO`) REFERENCES `destinatari` (`ID_DESTINATARIO`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Dump completed on 2014-09-19 12:54:48