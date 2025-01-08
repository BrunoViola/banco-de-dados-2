-- Inserindo as Seções
INSERT ALL
    INTO Secao(Nome) VALUES('Administração e Economia') --1
    INTO Secao(Nome) VALUES('Autoajuda') --2
    INTO Secao(Nome) VALUES('Educação e Didáticos') --3
    INTO Secao(Nome) VALUES('Fantasia e Horror') --4
    INTO Secao(Nome) VALUES('HQS e Mangás') --5
    INTO Secao(Nome) VALUES('Infantil') --6
    INTO Secao(Nome) VALUES('Importados') --7
    INTO Secao(Nome) VALUES('Literatura e Ficção') --8
    INTO Secao(Nome) VALUES('Religião e Espiritualidade') --9
    INTO Secao(Nome) VALUES('Romance') --10
    INTO Secao(Nome) VALUES('Saúde e Família') --11
    INTO Secao(Nome) VALUES('Política e Filosofia') -- 12
SELECT * FROM DUAL;

SELECT * FROM secao;

-- Inserindo os Gêneros
INSERT ALL
    INTO Genero(Nome,ID_Secao) VALUES('Finanças', 1) --1
	INTO Genero(Nome,ID_Secao) VALUES('Economia', 1) --2
	INTO Genero(Nome,ID_Secao) VALUES('Gestão e Liderança', 1) --3
	INTO Genero(Nome,ID_Secao) VALUES('Autoestima', 2) --4
	INTO Genero(Nome,ID_Secao) VALUES('Dicionários', 3) --5
	INTO Genero(Nome,ID_Secao) VALUES('Ficção Científica', 4) --6
	INTO Genero(Nome,ID_Secao) VALUES('Fantasia', 4) --7
	INTO Genero(Nome,ID_Secao) VALUES('Mangá', 5) --8
	INTO Genero(Nome,ID_Secao) VALUES('Contos de Fadas, Contos Populares e Mitos', 6) --9
	INTO Genero(Nome,ID_Secao) VALUES('Biografias e Histórias Reais', 7) --10
	INTO Genero(Nome,ID_Secao) VALUES('Ficção', 8) --11
	INTO Genero(Nome,ID_Secao) VALUES('Ação e Aventura', 8) --12
	INTO Genero(Nome,ID_Secao) VALUES('Espiritualidade', 9) --13
	INTO Genero(Nome,ID_Secao) VALUES('Budismo', 9) --14
	INTO Genero(Nome,ID_Secao) VALUES('Paranormal', 10) --15
	INTO Genero(Nome,ID_Secao) VALUES('Ficção Científica', 10) --16
	INTO Genero(Nome,ID_Secao) VALUES('Fantasia', 10) --17
	INTO Genero(Nome,ID_Secao) VALUES('Ação e Aventura', 10) --18
	INTO Genero(Nome,ID_Secao) VALUES('Segurança e Primeiros Socorros', 11) --19
	INTO Genero(Nome,ID_Secao) VALUES('Saúde Mental', 11) --20
	INTO Genero(Nome,ID_Secao) VALUES('Relacionamentos', 11) --21
	INTO Genero(Nome,ID_Secao) VALUES('Psicologia e Aconselhamento', 11) --22
	INTO Genero(Nome,ID_Secao) VALUES('Nutrição', 11) --23
	INTO Genero(Nome,ID_Secao) VALUES('Exercícios e Fitness', 11) --24
	INTO Genero(Nome,ID_Secao) VALUES('Beleza e Moda', 11) --25
	INTO Genero(Nome,ID_Secao) VALUES('Governo e Política', 12) --26
	INTO Genero(Nome,ID_Secao) VALUES('Filosofia', 12) --27
	INTO Genero(Nome,ID_Secao) VALUES('Estudos Sobre a Mulher', 12) --28
	INTO Genero(Nome,ID_Secao) VALUES('Crimes', 12) --29
	INTO Genero(Nome,ID_Secao) VALUES('Ciências Sociais', 12) --30
    SELECT * FROM DUAL;

SELECT * FROM Genero;

-- Inserindo as Editoras
INSERT ALL
    INTO Editora(Nome) VALUES('Editora Vozes') --1
	INTO Editora(Nome) VALUES('Vestígio') --2
	INTO Editora(Nome) VALUES('Intrínseca') --3
	INTO Editora(Nome) VALUES('Darkside') --4
	INTO Editora(Nome) VALUES('Appris Editora') --5
	INTO Editora(Nome) VALUES('Alta Books') --6
	INTO Editora(Nome) VALUES('Olhares') --7
	INTO Editora(Nome) VALUES('Editora Sextante') --78
	INTO Editora(Nome) VALUES('Zahar') --9
	INTO Editora(Nome) VALUES('Galenus') --10
	INTO Editora(Nome) VALUES('Principis') --11
	INTO Editora(Nome) VALUES('Galera') --12
	INTO Editora(Nome) VALUES('Thomas Nelson Brasil') --13
	INTO Editora(Nome) VALUES('Panini') --14
	INTO Editora(Nome) VALUES('Texugo') --15
	INTO Editora(Nome) VALUES('Melhoramentos') --16
	INTO Editora(Nome) VALUES('Editora Garnier') --17
	INTO Editora(Nome) VALUES('Faro Editorial') --18
    SELECT * FROM DUAL;
SELECT * FROM Editora;