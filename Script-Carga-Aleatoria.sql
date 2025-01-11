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

--------------------------------------------------
-- Tabela Cliente
--------------------------------------------------
CREATE OR REPLACE PROCEDURE Carga_Cliente(fator_escala IN NUMBER) AS
    v_max_cpf NUMBER(11); -- Variável para armazenar o maior CPF existente
BEGIN
    -- Obtém o maior CPF já existente na tabela Cliente
    SELECT NVL(MAX(TO_NUMBER(CPF)), 10000000000) INTO v_max_cpf FROM Cliente;

    -- Gera dados para a tabela Cliente
    FOR i IN 1..(10 * fator_escala) LOOP
        INSERT INTO Cliente (
            CPF,
            Sexo,
            Data_nascimento,
            Email,
            Pnome,
            Snome,
            Cidade,
            Estado
        ) VALUES (
            TO_CHAR(v_max_cpf + i), -- Gera um novo CPF único
            CASE MOD(i, 2) WHEN 0 THEN 'M' ELSE 'F' END, -- Alterna entre 'M' e 'F'
            TO_DATE('1990-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE(0, 10000), -- Data aleatória
            'cliente' || (v_max_cpf + i) || '@email.com', -- Email único
            'Nome' || (v_max_cpf + i), -- Nome único
            'Sobrenome' || (v_max_cpf + i), -- Sobrenome único
            'Cidade' || MOD(i, 10), -- Cidade semi-aleatória
            CASE MOD(i, 4) WHEN 0 THEN 'SP' WHEN 1 THEN 'PR' WHEN 2 THEN 'MG' ELSE 'RJ' END -- Estado aleatório
        );
    END LOOP;

    -- Confirma as alterações
    COMMIT;
END;
/


BEGIN
    Carga_Cliente(1);
    Carga_Cliente(2);
END;

--------------------------------------------------
-- Tabela Autor
--------------------------------------------------
CREATE OR REPLACE PROCEDURE Carga_Autor(fator_escala IN NUMBER) AS
    v_inicio NUMBER; -- Valor inicial do loop
    v_fim NUMBER;    -- Valor final do loop
    pnome varchar(30);
    snome varchar(50);
    nacionalidade varchar(20);
    pnomes SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Márcia', 'Policarpo', 'Lima', 'Lívia', 'Bruna', 'Geovana', 'Arnold', 'Maurice', 'Artur'); -- Lista de nomes
    snomes SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Doyle', 'Conan', 'Leblanc', 'Lupin', 'Holmes', 'Machado', 'Assis', 'Borba', 'Quaresma'); -- Lista de sobrenomes
    nacionalidades SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Brasileiro', 'Canadense', 'Mexicano', 'Estadunidense', 'Venezuelano', 'Cubano', 'Argentino', 'Boliviano', 'Uruguaio'); -- Lista de nomes
BEGIN
    -- Calcula o início e o fim do intervalo para evitar duplicidade
    SELECT NVL(MAX(ID), 0) + 1 INTO v_inicio FROM Autor;
    v_fim := v_inicio + (10 * fator_escala) - 1;

    -- Loop para inserir dados na tabela Secao
    FOR i IN v_inicio..v_fim LOOP
        pnome := pnomes(TRUNC(DBMS_RANDOM.VALUE(1, pnomes.COUNT + 1)));
        snome := snomes(TRUNC(DBMS_RANDOM.VALUE(1, snomes.COUNT + 1)));
        nacionalidade := nacionalidades(TRUNC(DBMS_RANDOM.VALUE(1, nacionalidades.COUNT + 1)));
        INSERT INTO Autor (Pnome, Snome, Nacionalidade)
        VALUES (
            pnome,
            snome,
            nacionalidade
        );
    END LOOP;

    -- Confirma as alterações
    COMMIT;
END;
/


BEGIN
    Carga_Autor(1); -- Fator 1
    Carga_Autor(2); -- Fator de escala 2
END;
/

--------------------------------------------------
-- Tabela Compra
--------------------------------------------------
CREATE OR REPLACE PROCEDURE Carga_Compra(fator_escala IN NUMBER) AS
    v_max_nota NUMBER(19,0); -- Variável para armazenar o maior número de nota fiscal existente
    v_cpf_cliente CHAR(11); -- Variável para armazenar CPF de um cliente aleatório
    v_total NUMERIC(10,2); -- Variável para armazenar o total da compra
BEGIN
    -- Obtém o maior número de nota fiscal já existente na tabela Compra
    SELECT NVL(MAX(Num_Nota_Fiscal), 0) INTO v_max_nota FROM Compra;

    -- Loop para gerar as compras
    FOR i IN 1..(10 * fator_escala) LOOP
        -- Seleciona um CPF aleatório da tabela Cliente
        SELECT CPF INTO v_cpf_cliente
        FROM Cliente
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROWS ONLY;

        -- Gera um valor aleatório para o total da compra
        v_total := ROUND(DBMS_RANDOM.VALUE(10, 5000), 2); -- Valores entre 50 e 5000

        -- Insere uma nova compra
        INSERT INTO Compra (
            Num_Nota_Fiscal,
            Data_Compra,
            Total,
            CPF_Cliente
        ) VALUES (
            v_max_nota + i, -- Gera um número de nota fiscal único
            CURRENT_DATE - DBMS_RANDOM.VALUE(0, 365), -- Data aleatória no último ano
            v_total, -- Total gerado aleatoriamente
            v_cpf_cliente -- CPF selecionado aleatoriamente
        );
    END LOOP;

    -- Confirma as alterações
    COMMIT;
END;
/

BEGIN
    Carga_Compra(1);
    Carga_Compra(2);
END;

--------------------------------------------------
-- Tabela Escrito
--------------------------------------------------
