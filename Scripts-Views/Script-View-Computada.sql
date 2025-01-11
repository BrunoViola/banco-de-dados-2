CREATE OR REPLACE VIEW VendasPorAutor AS SELECT (a.Pnome || ' ' || a.Snome) AS NomeAutor, 
      SUM(ps.quantidade) AS Quantidade
FROM Livro l
JOIN Possui ps ON ps.ISBN_Livro = l.ISBN
JOIN Escrito e ON e.ISBN_Livro = l.ISBN
JOIN Autor a ON e.ID_Autor = a.ID
JOIN Compra c ON ps.Num_Nota_Fiscal_Compra = c.Num_Nota_Fiscal
WHERE c.Data_Compra >= CURRENT_DATE - 7 AND c.Data_Compra <= CURRENT_DATE
GROUP BY (a.Pnome || ' ' || a.Snome)
ORDER BY Quantidade DESC;

----------------------------------------
-- Consulta
----------------------------------------
WITH TOP AS(
SELECT CONCAT('BestSeller: ', NomeAutor) AS Rank
FROM VendasPorAutor
WHERE Quantidade > 10
ORDER BY Quantidade DESC
FETCH FIRST 3 ROWS ONLY),
FLOP AS(SELECT CONCAT('Flop: ', NomeAutor) AS Rank
FROM(SELECT NomeAutor
        FROM VendasPorAutor
        ORDER BY Quantidade ASC
        FETCH FIRST 3 ROWS ONLY))
SELECT * FROM TOP
UNION
SELECT * FROM FLOP;