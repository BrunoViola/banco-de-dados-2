CREATE MATERIALIZED VIEW VendasPorSexo AS SELECT cl.Sexo, TRUNC(AVG(cp.Total),2) AS Total_Vendas
FROM Cliente cl
JOIN Compra cp ON cp.CPF_Cliente = cl.CPF
GROUP BY cl.Sexo;

-----------------------------------
-- Refresh
-----------------------------------
BEGIN
    DBMS_SNAPSHOT.REFRESH('VendasPorSexo');
END;

-----------------------------------
-- Consulta
-----------------------------------
SELECT 
    Sexo, ROUND((Total_Vendas / SUM(Total_Vendas) OVER()) * 100, 2) AS Percentual
FROM VendasPorSexo;