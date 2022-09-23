/*Listar Clientes com filtro de residencia*/
SELECT * FROM `Cliente` WHERE `IdClienteTipo`='1';

/*Expressões para gerar atributos e Listar todos Clientes com endereço*/
SELECT * FROM Cliente, `ClienteEndereco` WHERE `IdClienteEndereco`=IdCliente;

/* Recuperações simples Clientes*/
SELECT * FROM `Cliente`;

/*Ordenações dos dados com ORDER BY e Listar todos Clientes com endereço por ordem alfabetica*/
SELECT * FROM Cliente, `ClienteEndereco` WHERE `IdClienteEndereco`=IdCliente ORDER BY Nome DESC;

/*Listar o Total de clientes por tipo PF/PJ e listar o que tiver mais que 1*/
SELECT COUNT(*) AS total, `IdCliente Tipo` FROM `Cliente` GROUP BY `IdCliente Tipo` HAVING total > 1;

/*Junções entre tabelas e Listar Nome, Tipo PF/PJ, CEP, Nº, Tipo Endereço*/
SELECT a.Nome,c.Tipo,b.CEP,b.Numero,d.Tipo AS "Tipo Endereco" FROM Cliente AS a INNER JOIN `ClienteEndereco` AS b ON b.`IdClienteEndereco`=a.IdCliente 
INNER JOIN `ClienteTipo` AS c ON c.`IdClienteTipo`=a.`IdClienteTipo` LEFT JOIN `TipoEndereco` AS d ON d.`IdTipoEndereco`=b.`IdClienteEndereco`
ORDER BY a.Nome DESC;

