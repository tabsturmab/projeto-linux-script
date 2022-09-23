SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Tabela Cliente
DROP TABLE IF EXISTS `Cliente`;
CREATE TABLE `Cliente`  (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Identificacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IdCliente Tipo` int NOT NULL,
  PRIMARY KEY (`IdCliente`) USING BTREE,
  INDEX `Nome`(`Nome`) USING BTREE,
  INDEX `fk_Cliente_Cliente Tipo1_idx`(`IdCliente Tipo`) USING BTREE,
  CONSTRAINT `fk_Cliente_Cliente Tipo1` FOREIGN KEY (`IdCliente Tipo`) REFERENCES `Cliente Tipo` (`IdCliente Tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Cliente
INSERT INTO `Cliente` VALUES (1, 'Andre Silva', 'Teste 1', 1);
INSERT INTO `Cliente` VALUES (2, 'Mayara Souza', 'Teste 2', 1);
INSERT INTO `Cliente` VALUES (3, 'Felipe Oliveira', 'Teste 3', 2);

-- Tabela Categoria
DROP TABLE IF EXISTS `Categoria`;
CREATE TABLE `Categoria`  (
  `IdCategoria` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`IdCategoria`) USING BTREE,
  INDEX `Categoria`(`Categoria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Categoria
INSERT INTO `Categoria` VALUES (3, 'Informatica');
INSERT INTO `Categoria` VALUES (2, 'Livraria');
INSERT INTO `Categoria` VALUES (1, 'Moveis Escritorio');

-- Tabela Cartoes
DROP TABLE IF EXISTS `Cartoes`;
CREATE TABLE `Cartoes`  (
  `IdCartoes` int NOT NULL AUTO_INCREMENT,
  `Numero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Data Validade` date NOT NULL,
  `Nome do cartao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cliente_IdCliente` int NOT NULL,
  PRIMARY KEY (`IdCartoes`, `Cliente_IdCliente`) USING BTREE,
  INDEX `fk_Cartoes_Cliente1_idx`(`Cliente_IdCliente`) USING BTREE,
  CONSTRAINT `fk_Cartoes_Cliente1` FOREIGN KEY (`Cliente_IdCliente`) REFERENCES `Cliente` (`IdCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Cartoes
INSERT INTO `Cartoes` VALUES (2, '5444 5656 2325 0334', '2022-08-02', 'Andre Silva', 1);
INSERT INTO `Cartoes` VALUES (3, '6545 7845 7812 1011', '2022-09-12', 'Mayara Souza', 2);
INSERT INTO `Cartoes` VALUES (4, '2354 8956 3214 6542', '2022-11-20', 'Felipe Oliveira', 3);

-- Tabela ClienteEndereço
DROP TABLE IF EXISTS `ClienteEndereco`;
CREATE TABLE `ClienteEndereco`  (
  `IdClienteEndereco` int NOT NULL AUTO_INCREMENT,
  `CEP` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Numero` int NOT NULL,
  `Referencia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Complemento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IdTipo Endereco` int NOT NULL,
  PRIMARY KEY (`IdClienteEndereco`, `IdTipoEndereco`) USING BTREE,
  INDEX `fk_Cliente Endereco_Tipo Endereco1_idx`(`IdTipoEndereco`) USING BTREE,
  CONSTRAINT `fk_Cliente Endereco_Tipo Endereco1` FOREIGN KEY (`IdTipoEndereco`) REFERENCES `TipoEndereco` (`IdTipoEndereco`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert ClienteEndereco
-- ----------------------------
INSERT INTO `ClienteEndereco` VALUES (1, '09931-590', 81, 'Travessa', 'Casa 1', 1);
INSERT INTO `ClienteEndereco` VALUES (2, '04010-010', 140, 'Paraíso', 'Fundos', 1);
INSERT INTO `ClienteEndereco` VALUES (3, '05011-011', 245, 'Filial', 'Loja', 2);

-- ----------------------------
-- Tabela ClienteFisico
-- ----------------------------
DROP TABLE IF EXISTS `ClienteFisico`;
CREATE TABLE `ClienteFisico`  (
  `IdClienteFisico` int NOT NULL AUTO_INCREMENT,
  `CPF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cliente_IdCliente` int NOT NULL,
  PRIMARY KEY (`IdClienteFisico`, `Cliente_IdCliente`) USING BTREE,
  INDEX `fk_Cliente Fisico_Cliente1_idx`(`Cliente_IdCliente`) USING BTREE,
  CONSTRAINT `fk_Cliente Fisico_Cliente1` FOREIGN KEY (`Cliente_IdCliente`) REFERENCES `Cliente` (`IdCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert ClienteFisico
INSERT INTO `ClienteFisico` VALUES (2, '148.155.235-91', '19.485.475-1', 1);
INSERT INTO `ClienteFisico` VALUES (3, '287.417.895-78', '25.958.887-8', 2);

-- Tabela ClienteJuridico
DROP TABLE IF EXISTS `ClienteJuridico`;
CREATE TABLE `ClienteJuridico`  (
  `IdClienteJuridico` int NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cliente_IdCliente` int NOT NULL,
  PRIMARY KEY (`idCliente Juridico`, `Cliente_idCliente`) USING BTREE,
  INDEX `fk_Cliente Juridico_Cliente1_idx`(`Cliente_IdCliente`) USING BTREE,
  CONSTRAINT `fk_Cliente Juridico_Cliente1` FOREIGN KEY (`Cliente_IdCliente`) REFERENCES `Cliente` (`IdCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert ClienteJuridico
INSERT INTO `ClienteJuridico` VALUES (1, '57.478.378/0001-03', 3);

-- Tabela ClienteTipo
DROP TABLE IF EXISTS `ClienteTipo`;
CREATE TABLE `ClienteTipo`  (
  `IdClienteTipo` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`IdClienteTipo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert ClienteTipo
INSERT INTO `ClienteTipo` VALUES (1, 'PF');
INSERT INTO `ClienteTipo` VALUES (2, 'PJ');


-- Tabela Entrega
DROP TABLE IF EXISTS `Entrega`;
CREATE TABLE `Entrega`  (
  `IdEntrega` int NOT NULL AUTO_INCREMENT,
  `CodigoRastreio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IdStatus Entrega` int NOT NULL,
  PRIMARY KEY (`IdEntrega`) USING BTREE,
  INDEX `fk_Entrega_Status Entrega1_idx`(`IdStatusEntrega`) USING BTREE,
  CONSTRAINT `fk_Entrega_Status Entrega1` FOREIGN KEY (`idStatus Entrega`) REFERENCES `StatusEntrega` (`IdStatusEntrega`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Entrega
INSERT INTO `Entrega` VALUES (1, 'BR17878114525', 1);
INSERT INTO `Entrega` VALUES (2, 'BR66756222253', 2);
INSERT INTO `Entrega` VALUES (3, 'BR34523967089', 3);

-- Tabela Estoque
DROP TABLE IF EXISTS `Estoque`;
CREATE TABLE `Estoque`  (
  `IdEstoque` int NOT NULL AUTO_INCREMENT,
  `CEP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Numero` int NOT NULL,
  PRIMARY KEY (`idEstoque`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Estoque
INSERT INTO `Estoque` VALUES (1, '04012-002', 101);
INSERT INTO `Estoque` VALUES (2, '01020-001', 102);

-- Tabela Fornecedor
DROP TABLE IF EXISTS `Fornecedor`;
CREATE TABLE `Fornecedor`  (
  `IdFornecedor` int NOT NULL AUTO_INCREMENT,
  `RazaoSocial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CNPJ` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idFornecedor`) USING BTREE,
  INDEX `CNPJ`(`CNPJ`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Fornecedor
INSERT INTO `Fornecedor` VALUES (1, 'Fornecedor 1', '57.458.101/0001-01');
INSERT INTO `Fornecedor` VALUES (2, 'Fornecedor 2', '87.322.554/0001.02');

-- Tabela Pagamento
DROP TABLE IF EXISTS `Pagamento`;
CREATE TABLE `Pagamento`  (
  `IdPagamento` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'CARTAO\nPIX\nBOLETO\n',
  PRIMARY KEY (`IdPagamento`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Pagamento
INSERT INTO `Pagamento` VALUES (1, 'Cartão Credito');
INSERT INTO `Pagamento` VALUES (2, 'Cartão Debito');
INSERT INTO `Pagamento` VALUES (3, 'Pix');
INSERT INTO `Pagamento` VALUES (4, 'Boleto');

-- Tabela Pedido
DROP TABLE IF EXISTS `Pedido`;
CREATE TABLE `Pedido`  (
  `IdPedido` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Frete` float NOT NULL,
  `IdCliente` int NOT NULL,
  `IdPagamento` int NOT NULL,
  `IdEntrega` int NOT NULL,
  PRIMARY KEY (`idPedido`) USING BTREE,
  INDEX `fk_Pedido_Cliente_idx`(`IdCliente`) USING BTREE,
  INDEX `fk_Pedido_Pagamento1_idx`(`IdPagamento`) USING BTREE,
  INDEX `fk_Pedido_Entrega1_idx`(`IdEntrega`) USING BTREE,
  CONSTRAINT `fk_Pedido_Cliente` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Pedido_Entrega1` FOREIGN KEY (`IdEntrega`) REFERENCES `Entrega` (`IdEntrega`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Pedido_Pagamento1` FOREIGN KEY (`IdPagamento`) REFERENCES `Pagamento` (`IdPagamento`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert Pedido
INSERT INTO `Pedido` VALUES (1, 'Pedido 1', 1.5, 1, 1, 1);
INSERT INTO `Pedido` VALUES (2, 'Pedido 2 ', 2.5, 2, 2, 2);
INSERT INTO `Pedido` VALUES (3, 'Pedido 3 ', 3.5, 3, 3, 3);

-- Tabela Produto
DROP TABLE IF EXISTS `Produto`;
CREATE TABLE `Produto`  (
  `IdProduto` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Valor` float NOT NULL,
  PRIMARY KEY (`IdProduto`) USING BTREE,
  INDEX `Valor`(`Valor`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Records of Produto
INSERT INTO `Produto` VALUES (1, 'Teclado', 48.5);
INSERT INTO `Produto` VALUES (2, 'WebCam ', 119.90);
INSERT INTO `Produto` VALUES (3, 'PenDrive 64Gb', 62.9);

-- Tabela CategoriaProduto
DROP TABLE IF EXISTS `CategoriaProduto`;
CREATE TABLE `CategoriaProduto`  (
  `IdCategoria` int NOT NULL,
  `IdProduto` int NOT NULL,
  PRIMARY KEY (`IdCategoria`, `IdProduto`) USING BTREE,
  INDEX `fk_Categoria_has_Produto_Produto1_idx`(`IdProduto`) USING BTREE,
  INDEX `fk_Categoria_has_Produto_Categoria1_idx`(`IdCategoria`) USING BTREE,
  CONSTRAINT `fk_Categoria_has_Produto_Categoria1` FOREIGN KEY (`IdCategoria`) REFERENCES `Categoria` (`IdCategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Categoria_has_Produto_Produto1` FOREIGN KEY (`IdProduto`) REFERENCES `Produto` (`IdProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Tabela ClienteEndereco
DROP TABLE IF EXISTS `ClienteEndereco`;
CREATE TABLE `ClienteEndereco`  (
  `IdCliente` int NOT NULL,
  `IdCliente Endereco` int NOT NULL,
  PRIMARY KEY (`IdCliente`, `IdCliente Endereco`) USING BTREE,
  INDEX `fk_Cliente_has_Cliente Endereco_Cliente Endereco1_idx`(`IdCliente Endereco`) USING BTREE,
  INDEX `fk_Cliente_has_Cliente Endereco_Cliente1_idx`(`IdCliente`) USING BTREE,
  CONSTRAINT `fk_Cliente_has_Cliente Endereco_Cliente Endereco1` FOREIGN KEY (`IdClienteEndereco`) REFERENCES `ClienteEndereco` (`IdClienteEndereco`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Cliente_has_Cliente Endereco_Cliente1` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert ClienteEndereco
INSERT INTO `ClienteEndereco` VALUES (1, 1);
INSERT INTO `ClienteEndereco` VALUES (2, 2);
INSERT INTO `ClienteEndereco` VALUES (3, 3);

-- Tabela FornecedorProduto
DROP TABLE IF EXISTS `FornecedorProduto`;
CREATE TABLE `FornecedorProduto`  (
  `IdFornecedor` int NOT NULL,
  `IdProduto` int NOT NULL,
  PRIMARY KEY (`IdFornecedor`, `IdProduto`) USING BTREE,
  INDEX `fk_Fornecedor_has_Produto_Produto1_idx`(`IdProduto`) USING BTREE,
  INDEX `fk_Fornecedor_has_Produto_Fornecedor1_idx`(`IdFornecedor`) USING BTREE,
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor1` FOREIGN KEY (`IdFornecedor`) REFERENCES `Fornecedor` (`IdFornecedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`IdProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert FornecedorProduto
INSERT INTO `FornecedorProduto` VALUES (1, 1);
INSERT INTO `FornecedorProduto` VALUES (2, 2);

-- Tabela PedidoProduto
DROP TABLE IF EXISTS `PedidoProduto`;
CREATE TABLE `PedidoProduto`  (
  `IdPedido` int NOT NULL,
  `IdProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`IdPedido`, `IdProduto`) USING BTREE,
  INDEX `fk_Pedido_has_Produto_Produto1_idx`(`IdProduto`) USING BTREE,
  INDEX `fk_Pedido_has_Produto_Pedido1_idx`(`IdPedido`) USING BTREE,
  INDEX `Quantidade`(`Quantidade`) USING BTREE,
  CONSTRAINT `fk_Pedido_has_Produto_Pedido1` FOREIGN KEY (`IdPedido`) REFERENCES `Pedido` (`IdPedido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Pedido_has_Produto_Produto1` FOREIGN KEY (`IdProduto`) REFERENCES `Produto` (`IdProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert PedidoProduto
INSERT INTO `PedidoProduto` VALUES (1, 1, 1);
INSERT INTO `PedidoProduto` VALUES (2, 2, 2);
INSERT INTO `PedidoProduto` VALUES (3, 3, 3);

-- Tabela ProdutoEstoque
DROP TABLE IF EXISTS `ProdutoEstoque`;
CREATE TABLE `ProdutoEstoque`  (
  `IdProduto` int NOT NULL,
  `IdEstoque` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`IdProduto`, `IdEstoque`) USING BTREE,
  INDEX `fk_Produto_has_Estoque_Estoque1_idx`(`IdEstoque`) USING BTREE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx`(`IdProduto`) USING BTREE,
  INDEX `Quantidade`(`Quantidade`) USING BTREE,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1` FOREIGN KEY (`IdEstoque`) REFERENCES `Estoque` (`IdEstoque`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Produto_has_Estoque_Produto1` FOREIGN KEY (`IdProduto`) REFERENCES `Produto` (`IdProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert ProdutoEstoque
INSERT INTO `ProdutoEstoque` VALUES (1, 1, 10);
INSERT INTO `ProdutoEstoque` VALUES (2, 2, 20);

-- Tabela TerceiroVendedorProduto
DROP TABLE IF EXISTS `TerceiroVendedorProduto`;
CREATE TABLE `TerceiroVendedorProduto`  (
  `IdTerceiroVendedor` int NOT NULL,
  `IdProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`IdTerceiroVendedor`, `IdProduto`) USING BTREE,
  INDEX `fk_Terceiro_Vendedor_has_Produto_Produto1_idx`(`IdProduto`) USING BTREE,
  INDEX `fk_Terceiro_Vendedor_has_Produto_Terceiro_Vendedor1_idx`(`IdTerceiroVendedor`) USING BTREE,
  INDEX `Quantidade`(`Quantidade`) USING BTREE,
  CONSTRAINT `fk_Terceiro_Vendedor_has_Produto_Produto1` FOREIGN KEY (`IdProduto`) REFERENCES `Produto` (`IdProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Terceiro_Vendedor_has_Produto_Terceiro_Vendedor1` FOREIGN KEY (`IdTerceiroVendedor`) REFERENCES `TerceiroVendedor` (`IdTerceiroVendedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert TerceiroVendedorProduto
INSERT INTO `TerceiroVendedorProduto` VALUES (1, 3, 30);

-- Tabela StatusEntrega
DROP TABLE IF EXISTS `StatusEntrega`;
CREATE TABLE `Status Entrega`  (
  `IdStatusEntrega` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`IdStatusEntrega`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert StatusEntrega
INSERT INTO `StatusEntrega` VALUES (1, 'Preparando...');
INSERT INTO `StatusEntrega` VALUES (2, 'A caminho');
INSERT INTO `StatusEntrega` VALUES (3, 'Entregue');

-- Tabela TerceiroVendedor
DROP TABLE IF EXISTS `TerceiroVendedor`;
CREATE TABLE `TerceiroVendedor`  (
  `IdTerceiroVendedor` int NOT NULL AUTO_INCREMENT,
  `RazaoSocial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CEP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Numero` int NOT NULL,
  PRIMARY KEY (`IdTerceiroVendedor`) USING BTREE,
  INDEX `RazaoSocial`(`RazaoSocial`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- Insert TerceiroVendedor
INSERT INTO `TerceiroVendedor` VALUES (1, 'Fornecedor Principal', '33.333-33', 103);

-- tabela TipoEndereco
DROP TABLE IF EXISTS `TipoEndereco`;
CREATE TABLE `TipoEndereco`  (
  `IdTipo Endereco` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Casa/Serviço\n',
  PRIMARY KEY (`IdTipo Endereco`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

--  Tabela TipoEndereco
INSERT INTO `TipoEndereco` VALUES (1, 'Residencia');
INSERT INTO `TipoEndereco` VALUES (2, 'Trabalho');

SET FOREIGN_KEY_CHECKS = 1;
