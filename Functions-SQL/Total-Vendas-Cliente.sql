CREATE OR REPLACE FUNCTION CalcularTotalVendasCliente(CPF_Cliente CHAR)
RETURN NUMBER IS
    total_vendas NUMBER(10, 2);
BEGIN
    SELECT NVL(SUM(cp.Total), 0) INTO total_vendas
    FROM Compra cp
    WHERE cp.CPF_Cliente = CPF_Cliente;

    RETURN total_vendas;
END;
/

-------------------------------------
-- Consulta
-------------------------------------

SELECT 
    c.Pnome || ' ' || c.Snome AS NomeCliente,
    CalcularTotalVendasCliente(c.CPF) AS TotalVendas
FROM Cliente c
WHERE c.CPF = '71583320990';