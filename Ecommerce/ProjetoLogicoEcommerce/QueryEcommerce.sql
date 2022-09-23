/* Recuperações simples com SELECT Statement  - Listar todos Clientes*/
SELECT * FROM `Cliente`;

/*Filtros com WHERE Statement - Listar todos Clientes com filtro de casa*/
SELECT * FROM `Cliente` WHERE `IdCliente Tipo`='1';

/*Crie expressões para gerar atributos derivados - Listar todos Clientes com endereço*/
SELECT * FROM Cliente, `Cliente Endereco` WHERE `IdCliente Endereco`=IdCliente;

/*Defina ordenações dos dados com ORDER BY - Listar todos Clientes com endereço e lista por order alfabetica*/
SELECT * FROM Cliente, `Cliente Endereco` WHERE `IdCliente Endereco`=IdCliente ORDER BY Nome DESC;

/*Filtros aos grupos – HAVING Statement - Listar o Total de clientes por tipo PF/PJ e listar o que tiver mais que 1*/
SELECT COUNT(*) AS total, `IdCliente Tipo` FROM `Cliente` GROUP BY `IdCliente Tipo` HAVING total > 1;

/*Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados - Listar Nome, Tipo PF/PJ, CEP, Nº, Tipo Endereço*/
SELECT a.Nome,c.Tipo,b.CEP,b.Numero,d.Tipo AS "Tipo Endereco" FROM Cliente AS a INNER JOIN `Cliente Endereco` AS b ON b.`IdCliente Endereco`=a.IdCliente 
INNER JOIN `Cliente Tipo` AS c ON c.`IdCliente Tipo`=a.`IdCliente Tipo` LEFT JOIN `Tipo Endereco` AS d ON d.`IdTipo Endereco`=b.`IdCliente Endereco`
ORDER BY a.Nome DESC;

