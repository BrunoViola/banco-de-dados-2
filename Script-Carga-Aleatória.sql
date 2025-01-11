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

--------------------------------------------------
-- Tabela Editora
--------------------------------------------------
CREATE OR REPLACE PROCEDURE Carga_Editora(fator_escala IN NUMBER) AS
    v_inicio NUMBER; -- Valor inicial do loop
    v_fim NUMBER;    -- Valor final do loop
BEGIN
    -- Calcula o início e o fim do intervalo para evitar duplicidade
    SELECT NVL(MAX(ID), 0) + 1 INTO v_inicio FROM Editora;
    v_fim := v_inicio + (10 * fator_escala) - 1;

    -- Loop para inserir dados na tabela Secao
    FOR i IN v_inicio..v_fim LOOP
        INSERT INTO Editora (Nome)
        VALUES (
            'Editora' || i -- Nome único gerado
        );
    END LOOP;

    -- Confirma as alterações
    COMMIT;
END;
/


BEGIN
    Carga_Editora(1); -- Fator 1
    Carga_Editora(2); -- Fator de escala 2
END;
/

--------------------------------------------------
-- Tabela Livro
--------------------------------------------------
CREATE OR REPLACE PROCEDURE Carga_Livro(fator_escala IN NUMBER) AS
    v_max_isbn NUMBER(13,0); -- Variável para armazenar o maior ISBN existente
    v_max_id_editora INT; -- Variável para armazenar o ID máximo da tabela Editora
BEGIN
    -- Obtém o maior ISBN já existente na tabela Livro
    SELECT NVL(MAX(ISBN), 9780000000000) INTO v_max_isbn FROM Livro;

    -- Obtém o maior ID da tabela Editora para garantir que a FK seja válida
    SELECT MAX(ID) INTO v_max_id_editora FROM Editora;

    IF v_max_id_editora IS NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Não há registros na tabela Editora.');
    END IF;

    -- Gera dados para a tabela Livro
    FOR i IN 1..(10 * fator_escala) LOOP
        INSERT INTO Livro (
            ISBN,
            Titulo,
            Ano,
            Preco,
            Estoque,
            Descricao,
            ID_Editora
        ) VALUES (
            v_max_isbn + i, -- Gera um novo ISBN a partir do maior existente
            'Livro ' || (v_max_isbn + i), -- Título do livro
            TRUNC(DBMS_RANDOM.VALUE(1900, 2023)), -- Ano aleatório entre 1900 e 2023
            ROUND(DBMS_RANDOM.VALUE(10, 100), 2), -- Preço entre 10 e 500
            TRUNC(DBMS_RANDOM.VALUE(1, 100)), -- Estoque entre 1 e 100
            'Descrição do Livro ' || (v_max_isbn + i) || ' gerado automaticamente.', -- Descrição
            TRUNC(DBMS_RANDOM.VALUE(1, v_max_id_editora + 1)) -- ID_Editora aleatório válido
        );
    END LOOP;

    -- Confirma as alterações
    COMMIT;
END;
/

BEGIN
    Carga_Livro(1);
    Carga_Livro(2);
END;