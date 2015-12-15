/*
Navicat MySQL Data Transfer

Source Server         : objectfinders
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : mysql

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2015-11-30 14:38:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `ID_CATEGORIA` int(11) NOT NULL,
  `NOMBRE_CATEGORIA` int(11) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoria
-- ----------------------------

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `ID_DANE_DEPARTAMENTO` int(11) NOT NULL,
  `NOMBRE_DEPARTAMENTO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DANE_DEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departamento
-- ----------------------------

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `ID_ESTADO` int(11) NOT NULL,
  `NOMBRE_ESTADO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_ESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estado
-- ----------------------------

-- ----------------------------
-- Table structure for genero
-- ----------------------------
DROP TABLE IF EXISTS `genero`;
CREATE TABLE `genero` (
  `ID_GENERO` int(11) NOT NULL,
  `NOMBRE_GENERO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_GENERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of genero
-- ----------------------------

-- ----------------------------
-- Table structure for localidad
-- ----------------------------
DROP TABLE IF EXISTS `localidad`;
CREATE TABLE `localidad` (
  `ID_LOCALIDAD` int(11) NOT NULL,
  `ID_DANE_MUNICIPIO` int(11) NOT NULL,
  `NOMBRE_LOCALIDAD` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_LOCALIDAD`),
  KEY `FK_ID_DANE_MUNICIPIO` (`ID_DANE_MUNICIPIO`),
  CONSTRAINT `FK_ID_DANE_MUNICIPIO` FOREIGN KEY (`ID_DANE_MUNICIPIO`) REFERENCES `municipio` (`ID_DANE_MUNICIPIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of localidad
-- ----------------------------

-- ----------------------------
-- Table structure for municipio
-- ----------------------------
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio` (
  `ID_DANE_MUNICIPIO` int(11) NOT NULL,
  `ID_DANE_DEPARTAMENTO` int(11) NOT NULL,
  `NOMBRE_MUNICPIO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_DANE_MUNICIPIO`),
  KEY `FK_ID_DANE_DEPARTAMENTO` (`ID_DANE_DEPARTAMENTO`),
  CONSTRAINT `FK_ID_DANE_DEPARTAMENTO` FOREIGN KEY (`ID_DANE_DEPARTAMENTO`) REFERENCES `departamento` (`ID_DANE_DEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of municipio
-- ----------------------------

-- ----------------------------
-- Table structure for objeto
-- ----------------------------
DROP TABLE IF EXISTS `objeto`;
CREATE TABLE `objeto` (
  `ID_OBJETO` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  `NOMBRE_OBJETO` varchar(255) NOT NULL,
  `ID_LOCALIDAD` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_OBJETO`),
  KEY `FK_ID_CATEGORIA` (`ID_CATEGORIA`),
  KEY `FK_ID_LOCALIDAD` (`ID_LOCALIDAD`),
  KEY `FK_ID_USUARIO2` (`ID_USUARIO`),
  CONSTRAINT `FK_ID_CATEGORIA` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`),
  CONSTRAINT `FK_ID_LOCALIDAD` FOREIGN KEY (`ID_LOCALIDAD`) REFERENCES `localidad` (`ID_LOCALIDAD`),
  CONSTRAINT `FK_ID_USUARIO2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of objeto
-- ----------------------------

-- ----------------------------
-- Table structure for per_usuario
-- ----------------------------
DROP TABLE IF EXISTS `per_usuario`;
CREATE TABLE `per_usuario` (
  `ID_PERFIL` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PERFIL`,`ID_USUARIO`),
  KEY `FK_ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `FK_ID_PERFIL` FOREIGN KEY (`ID_PERFIL`) REFERENCES `perfil` (`ID_PERFIL`),
  CONSTRAINT `FK_ID_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of per_usuario
-- ----------------------------

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `ID_PERFIL` int(11) NOT NULL,
  `NOMBRE_PERFIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of perfil
-- ----------------------------

-- ----------------------------
-- Table structure for registro
-- ----------------------------
DROP TABLE IF EXISTS `registro`;
CREATE TABLE `registro` (
  `ID_REGISTRO` int(11) NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL,
  `ID_OBJETO` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`ID_REGISTRO`),
  KEY `FK_ID_OBJETO` (`ID_OBJETO`),
  KEY `FK_ID_ESTADO` (`ID_ESTADO`),
  CONSTRAINT `FK_ID_ESTADO` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estado` (`ID_ESTADO`),
  CONSTRAINT `FK_ID_OBJETO` FOREIGN KEY (`ID_OBJETO`) REFERENCES `objeto` (`ID_OBJETO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of registro
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRE1` varchar(255) DEFAULT NULL,
  `NOMBRE2` varchar(255) DEFAULT NULL,
  `APELLIDO1` varchar(255) DEFAULT NULL,
  `APELLIDO2` varchar(255) DEFAULT NULL,
  `USER` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `FECHA_REGISTRO` datetime DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `CELULAR` varchar(255) DEFAULT NULL,
  `EMAL` varchar(255) DEFAULT NULL,
  `FECHA_NAC` date DEFAULT NULL,
  `ID_GENERO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `FK_ID_GENERO` (`ID_GENERO`),
  CONSTRAINT `FK_ID_GENERO` FOREIGN KEY (`ID_GENERO`) REFERENCES `genero` (`ID_GENERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
