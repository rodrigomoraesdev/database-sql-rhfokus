--Solicitação 01
SELECT * FROM HistoricoEmprego 
where datatermino ISNULL
ORDER by salario desc LIMIT 5;

--Solicitação 02
SELECT * FROM Treinamento
WHERE curso like 'O poder%';

--Solicitação 03
sELECT * FROM HistoricoEmprego
WHERE (cargo in('Oftalmologista', 'Dermatologista', 'Professor') AND  datatermino NOTNULL);

--Solicitação 04
SELECT * FROM Treinamento
WHERE (curso LIKE 'O direito%' and instituicao = 'da Rocha')
or (curso like 'O conforto%' and instituicao = 'das Neves');

--Solicitação 05
SELECT mes, MAX(faturamento_bruto) AS MaiorFaturamento FROM faturamento;
SELECT mes, MIN(faturamento_bruto) AS MenorFaturamento FROM faturamento;

--Solicitação 06
SELECT SUM(numero_novos_clientes) AS 'Novos Clientes 2023' from faturamento
WHERE mes LIKE '%2023';

--Solicitação 07
SELECT ROUND(AVG(despesas),2) AS MediaDespesas from faturamento;
sELECT ROUND(AVG(lucro_liquido),2) AS MediaLucroLiquido from faturamento;

--Solicitação08
SELECT COUNT(*) as QtdProfissionaisDesempregadas FROM HistoricoEmprego
WHERE datatermino NOTNULL;

SELECT COUNT(*) as QtdProfissionaisFérias FROM Licencas
WHERE tipolicenca = 'férias';

--Solicitação09
SELECT parentesco, COUNT(*) AS 'QtdTipoParentesco' FROM Dependentes
GROUP BY parentesco;

--Solicitação10
SELECT instituicao, COUNT(curso) AS QtdCurso from Treinamento
GROUP by instituicao HAVING COUNT(curso) > 2;

--Solicitação11
SELECT cargo, COUNT(*) as 'QtdCargo' FROM HistoricoEmprego
GROUP by cargo HAVING QtdCargo >= 2;

--Solicitação12
SELECT count(*), LENGTH(cpf) AS 'QtdDigitos' FROM Colaboradores;

--Solicitação13
SELECT UPPER('A pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte Endereço:  ' || endereco) AS TextoMaior from Colaboradores;
SELECT LOWER('A pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte Endereço:  ' || endereco) AS TextoMenor from Colaboradores;

--Solicitação14
SELECT id_colaborador, STRFTIME('%Y/%m', datainicio) AS 'MêsAno' from Licencas;

--Solicitação15
SELECT id_colaborador, JULIANDAY(datatermino) - JULIANDAY (datacontratacao) AS IntervaloDias FROM HistoricoEmprego
WHERE datatermino NOTNULL;

--Solicitação16
SELECT ('O Faturamento Bruto Médio foi ' || CAST(ROUND(AVG(faturamento_bruto),2) AS TEXT)) AS MédiaFatBruto FROM faturamento;

--Solicitação17
SELECT id_colaborador, cargo, salario,
CASE 
WHEN salario < 3000 then 'Baixo'
WHEN salario BETWEEN 3000 and 6000 then 'Médio'
ELSE 'Alto'
end as categoria_salario
from HistoricoEmprego;

--Solicitação18
ALTER table HistoricoEmprego RENAME to CargosColaboradores;