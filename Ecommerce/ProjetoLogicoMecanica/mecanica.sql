SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Tabela Autorização
DROP TABLE IF EXISTS `AutorizacaoServico`;
CREATE TABLE `Autorizacao`  (
  `IdAutorizacao` int NOT NULL AUTO_INCREMENT,
  `StatusServico` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Autorizado\nNão autorizado',
  PRIMARY KEY (`IdAutorização`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert AutorizaServico
INSERT INTO `AutorizacaoServico` VALUES (1, 'Autorizado');
INSERT INTO `AutorizacaoServico` VALUES (2, 'Não Autorizado');

-- Tabela Veiculo
DROP TABLE IF EXISTS `Veiculo`;
CREATE TABLE `Veiculo`  (
  `IdVeiculo` int NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Placa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IdCliente` int NOT NULL,
  `IdStatusServico` int NOT NULL,
  `IdEquipe` int NOT NULL,
  PRIMARY KEY (`IdVeiculo`) USING BTREE,
  INDEX `fk_Veiculo_Cliente_idx`(`IdCliente`) USING BTREE,
  INDEX `fk_Veiculo_Tipo Serviço1_idx`(`IdStatusServico`) USING BTREE,
  INDEX `fk_Veiculo_Equipe1_idx`(`IdEquipe`) USING BTREE,
  CONSTRAINT `fk_Veiculo_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`IdCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Veiculo_Equipe1` FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`IdEquipe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Veiculo_TipoServiço1` FOREIGN KEY (`IdStatusServico`) REFERENCES `TipoServico` (`IdStatusServico`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Veiculo
INSERT INTO `Veiculo` VALUES (1, 'Pálio, 'A3DR234', 1, 1, 1);
INSERT INTO `Veiculo` VALUES (2, 'Eco', 'B3PO34', 2, 1, 2);
INSERT INTO `Veiculo` VALUES (3, 'Fit', 'CSD1845', 3, 2, 3);

-- Tabela Cliente
DROP TABLE IF EXISTS `Cliente`;
CREATE TABLE `Cliente`  (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Telefone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`IdCliente`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Cliente
INSERT INTO `Cliente` VALUES (1, 'Andre Silva', '(11) 91455-1785');
INSERT INTO `Cliente` VALUES (2, 'Mayara Souza', '(11) 933246-2852');
INSERT INTO `Cliente` VALUES (3, 'Felipe Jesus', '(11) 94453-3398');

-- Tabela Equipe
DROP TABLE IF EXISTS `Equipe`;
CREATE TABLE `Equipe`  (
  `IdEquipe` int NOT NULL AUTO_INCREMENT,
  `NomeEquipe` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`IdEquipe`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Equipe
INSERT INTO `Equipe` VALUES (1, 'Equipe Marco');
INSERT INTO `Equipe` VALUES (2, 'Equipe Floriano');
INSERT INTO `Equipe` VALUES (3, 'Equipe Souza');

-- Tabela Especialidades
DROP TABLE IF EXISTS `Especialidades`;
CREATE TABLE `Especialidades`  (
  `IdEspecialidades` int NOT NULL AUTO_INCREMENT,
  `Especialidade` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IdMecanicos` int NOT NULL,
  PRIMARY KEY (`IdEspecialidades`) USING BTREE,
  INDEX `fk_Especialidades_Mecanicos1_idx`(`idMecanicos`) USING BTREE,
  CONSTRAINT `fk_Especialidades_Mecanicos1` FOREIGN KEY (`IdMecanicos`) REFERENCES `Mecanicos` (`IdMecanicos`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Especialidades
INSERT INTO `Especialidades` VALUES (1, 'Mecanica', 1);
INSERT INTO `Especialidades` VALUES (2, 'Funilaria', 2);
INSERT INTO `Especialidades` VALUES (3, 'Motor', 3);
INSERT INTO `Especialidades` VALUES (4, 'Acabamento', 4);
INSERT INTO `Especialidades` VALUES (5, 'Eletricista', 5);

-- Tabela Mecanicos
DROP TABLE IF EXISTS `Mecanicos`;
CREATE TABLE `Mecanicos`  (
  `IdMecanicos` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Endereco` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IdEquipe` int NOT NULL,
  PRIMARY KEY (`IdMecanicos`) USING BTREE,
  INDEX `fk_Mecanicos_Equipe1_idx`(`IdEquipe`) USING BTREE,
  CONSTRAINT `fk_Mecanicos_Equipe1` FOREIGN KEY (`IdEquipe`) REFERENCES `Equipe` (`IdEquipe`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Mecanicos
INSERT INTO `Mecanicos` VALUES (1, 'Felipe', 'Rua Tangara, Nº 122', 1);
INSERT INTO `Mecanicos` VALUES (2, 'Marco', 'Rua Cubatão, Nº 650', 1);
INSERT INTO `Mecanicos` VALUES (3, 'Antonio', 'Rua Piraporinha, Nº 1850', 2);
INSERT INTO `Mecanicos` VALUES (4, 'Pedro', 'Rua Brasilia, Nº 478', 2);
INSERT INTO `Mecanicos` VALUES (5, 'Rodrigo', 'Rua Cristiano, Nº 155', 3);

-- Tabela OrdemServico
DROP TABLE IF EXISTS `OrdemServico`;
CREATE TABLE `OrdemServico`  (
  `IdOrdemServico` int NOT NULL AUTO_INCREMENT,
  `DataInicio` date NOT NULL,
  `DataTermino` date NULL DEFAULT NULL,
  `ValorPecas` float NULL DEFAULT NULL,
  `IdStatusOrdemSservico` int NOT NULL,
  `IdEquipe` int NOT NULL,
  `IdAutorização` int NOT NULL,
  PRIMARY KEY (`IdOrdemServico`) USING BTREE,
  INDEX `fk_OrdemServico_StatusOrdemServico_idx`(`IdStatusOrdemServico`) USING BTREE,
  INDEX `fk_OrdemServico_Equipe1_idx`(`idEquipe`) USING BTREE,
  INDEX `fk_OrdemServico_Autorizacao1_idx`(`IdAutorização`) USING BTREE,
  CONSTRAINT `fk_OrdemServico_Autorizacao1` FOREIGN KEY (`IdAutorização`) REFERENCES `Autorizacao` (`IdAutorizacao`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_OrdemServico_Equipe1` FOREIGN KEY (`IdEquipe`) REFERENCES `Equipe` (`IdEquipe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_OrdemServico_StatusOrdemServico` FOREIGN KEY (`IdStatusOrdemServico`) REFERENCES `Status OS` (`IdStatusOrdemServico`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert OrdemServico
INSERT INTO `OrdemServico` VALUES (1, '2022-09-10', '2022-10-01', 60, 1, 1, 1);
INSERT INTO `OrdemServico` VALUES (2, '2022-09-06', '2022-09-29', 120.9, 1, 2, 2);
INSERT INTO `OrdemServico` VALUES (3, '2022-09-12', '2022-09-25', 99.9, 2, 3, 1);

-- Tabela Servicos
DROP TABLE IF EXISTS `Servicos`;
CREATE TABLE `Servicos`  (
  `IdServicos` int NOT NULL AUTO_INCREMENT,
  `servico` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `valor` float NOT NULL,
  `IdOrdemServico` int NOT NULL,
  PRIMARY KEY (`IdServicos`) USING BTREE,
  INDEX `fk_Servicos_OrdemServico1_idx`(`IdOrdemServico`) USING BTREE,
  CONSTRAINT `fk_Serviços_OrdemServico1` FOREIGN KEY (`IdOrdemServico`) REFERENCES `OrdemServico` (`IdOrdemServico`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Servicos
INSERT INTO `Servicos` VALUES (1, 'Mecanica', 155.4, 1);
INSERT INTO `Servicos` VALUES (2, 'Funilaria', 985.5, 2);
INSERT INTO `Servicos` VALUES (3, 'Eletrico', 120, 3);

-- Tabela StatusOrdemServico
DROP TABLE IF EXISTS `StatusOrdemServico`;
CREATE TABLE `StatusOrdemServico`  (
  `IdStatusOrdemServico` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`IdStatusOrdemServico`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert StatusOrdemServico
INSERT INTO `StatusOrdemServico` VALUES (1, 'Andamento');
INSERT INTO `StatusOrdemServico` VALUES (2, 'Finalizada');

-- Tabela TipoServico
DROP TABLE IF EXISTS `TipoServico`;
CREATE TABLE `TipoServico`  (
  `IdTipo` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Tipos: conserto ou revisão',
  PRIMARY KEY (`IdTipo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert TipoServico
INSERT INTO `TipoServico` VALUES (1, 'Conserto');
INSERT INTO `TipoServico` VALUES (2, 'Revisão');

SET FOREIGN_KEY_CHECKS = 1;
