CREATE OR REPLACE TRIGGER trg_RestricaoQuantidadeLivros
BEFORE INSERT OR UPDATE ON Possui
FOR EACH ROW
DECLARE
    v_Quantidade_Total INT;
BEGIN
    -- Calcula a quantidade total de livros na compra atual
    SELECT SUM(Quantidade)
    INTO v_Quantidade_Total
    FROM Possui
    WHERE Num_Nota_Fiscal_Compra = :NEW.Num_Nota_Fiscal_Compra;

    -- Considera também a nova quantidade que está sendo inserida ou atualizada
    v_Quantidade_Total := NVL(v_Quantidade_Total, 0) + :NEW.Quantidade;

    -- Verifica se a quantidade total ultrapassa o limite
    IF v_Quantidade_Total > 20 THEN
        RAISE_APPLICATION_ERROR(-20002, 'A quantidade total de livros em uma compra não pode exceder 20.');
    END IF;
END;
/

-- Válido
INSERT INTO Possui (Num_Nota_Fiscal_Compra, ISBN_Livro, Quantidade, Preco)
VALUES (100, 9780000000011, 10, 385.4);

INSERT INTO Possui (Num_Nota_Fiscal_Compra, ISBN_Livro, Quantidade, Preco)
VALUES (100, 9780000000017, 8, 194.32);

-- Inválido
INSERT INTO Possui (Num_Nota_Fiscal_Compra, ISBN_Livro, Quantidade, Preco)
VALUES (100, 9780000000020, 5, 66.45);