CREATE TABLE LogAtualizacoes (
    ID_Log INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CPF_Cliente CHAR(11),
    Campo_Alterado VARCHAR(50),
    Valor_Antigo VARCHAR(100),
    Valor_Novo VARCHAR(100),
    Data_Atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE TRIGGER trg_LogAtualizacoes
AFTER UPDATE OF Email, Cidade, Estado ON Cliente
FOR EACH ROW
BEGIN
    IF :OLD.Email != :NEW.Email THEN
        INSERT INTO LogAtualizacoes (CPF_Cliente, Campo_Alterado, Valor_Antigo, Valor_Novo)
        VALUES (:NEW.CPF, 'Email', :OLD.Email, :NEW.Email);
    END IF;

    IF :OLD.Cidade != :NEW.Cidade THEN
        INSERT INTO LogAtualizacoes (CPF_Cliente, Campo_Alterado, Valor_Antigo, Valor_Novo)
        VALUES (:NEW.CPF, 'Cidade', :OLD.Cidade, :NEW.Cidade);
    END IF;

    IF :OLD.Estado != :NEW.Estado THEN
        INSERT INTO LogAtualizacoes (CPF_Cliente, Campo_Alterado, Valor_Antigo, Valor_Novo)
        VALUES (:NEW.CPF, 'Estado', :OLD.Estado, :NEW.Estado);
    END IF;
END;
/

UPDATE Cliente
SET Email = 'email_teste_bd2025@example.com', Cidade = 'Nova Cidade'
WHERE CPF = '71583320991';

SELECT * FROM LogAtualizacoes;