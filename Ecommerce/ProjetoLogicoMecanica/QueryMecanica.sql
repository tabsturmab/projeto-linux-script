/*Listar todos Clientes com filtro de residencia*/
SELECT * FROM `Cliente` WHERE Nome LIKE '%Silva';

/*Listar todos Clientes e Veiculos*/
SELECT Nome,Telefone,Modelo,Placa FROM Cliente AS v, Veiculo As vr WHERE v.`IdCliente`=cr.IdCliente;

/*Listar todos Clientes*/
SELECT * FROM `Cliente`;

/*Listar todos Clientes, Veiculos por order alfabetica*/
SELECT Nome,Telefone,Modelo,Placa FROM Cliente AS v, Veiculo As vr WHERE v.`IdCliente`=vr.IdCliente ORDER BY Nome ASC ;

/*Total de veiculos por Modelo e listar o que tiver mais que 1*/
SELECT COUNT(*) AS total,Modelo FROM Cliente AS v, Veiculo As vr WHERE v.IdCliente=vr.IdCliente GROUP BY Modelo HAVING total > 1;

/*Listar Nome, Telefone, Modelo, Placa, Status OS*/
SELECT Nome,Telefone,Modelo,Placa,Status FROM Cliente AS c INNER JOIN Veiculo AS b ON b.IdCliente=c.IdCliente INNER JOIN OrdemServico AS v ON v.IdEquipe=b.IdEquipe
INNER JOIN Autorizacao AS d ON d.IdAutorizacao=v.IdAutorizacao ORDER BY Nome ASC ;

