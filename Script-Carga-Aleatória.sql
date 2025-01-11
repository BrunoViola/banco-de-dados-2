--------------------------------------------------
-- Tabela Seção
--------------------------------------------------
CREATE OR REPLACE PROCEDURE Carga_Secao(fator_escala IN NUMBER) AS
    v_inicio NUMBER; -- Valor inicial do loop
    v_fim NUMBER;    -- Valor final do loop
BEGIN
    -- Calcula o início e o fim do intervalo para evitar duplicidade
    SELECT NVL(MAX(ID), 0) + 1 INTO v_inicio FROM Secao;
    v_fim := v_inicio + (10 * fator_escala) - 1;

    -- Loop para inserir dados na tabela Secao
    FOR i IN v_inicio..v_fim LOOP
        INSERT INTO Secao (Nome)
        VALUES (
            'Secao_' || i -- Nome único gerado
        );
    END LOOP;

    -- Confirma as alterações
    COMMIT;
END;
/

BEGIN
    Carga_Secao(1); -- Fator 1
    Carga_Secao(2); -- Fator de escala 2
END;
/

--------------------------------------------------
-- Tabela Gênero
--------------------------------------------------
CREATE OR REPLACE PROCEDURE Carga_Genero(fator_escala IN NUMBER) AS
    v_max_id_secao INT; -- Variável para armazenar o ID máximo de Secao
    v_nome_genero VARCHAR2(100); -- Variável para armazenar o nome do gênero
BEGIN
    -- Obtém o maior ID da tabela Secao para limitar a referência na FK
    SELECT MAX(ID) INTO v_max_id_secao FROM Secao;

    IF v_max_id_secao IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não há registros na tabela Secao.');
    END IF;

    -- Gera dados para a tabela Genero
    FOR i IN 1..(10 * fator_escala) LOOP
        -- Gera um nome de gênero único baseado no índice
        v_nome_genero := 'Genero_' || TO_CHAR(i + (fator_escala - 1) * 10);

        INSERT INTO Genero (Nome, ID_Secao)
        VALUES (
            v_nome_genero, -- Nome único
            TRUNC(DBMS_RANDOM.VALUE(1, v_max_id_secao + 1)) -- ID_Secao aleatório válido
        );
    END LOOP;

    -- Confirma as alterações
    COMMIT;
END;
/

BEGIN
    Carga_Genero(1);
    Carga_Genero(2);
END;