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

-- Inserindo Livros
INSERT ALL
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788532649966', 'Sociedade do cansaço', 2015, 40.2, 20, 1) --1
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786586551525', 'A fábrica de cretinos digitais: Os perigos das telas para nossas crianças', 2021, 59.00, 13, 2) --2
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786555603873', 'Império da dor: A ascensão e queda de uma das mais poderosas famílias americanas e seu criminoso império farmacêutico', 2023, 46.44, 15, 3) --3
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786555983012', 'Personalidades Perigosas', 2023, 72.00, 2, 4) --4
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786525033723', 'A Prateleira do Amor: Sobre Mulheres, Homens e Relações', 2022, 27.75, 1, 5) --5
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788562409028', '38 estratégias para vencer qualquer debate', 2014, 15.00, 51, 18) --6
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786584956193', 'O Príncipe - Edição de Luxo', 2023, 19.90, 29, 16) --7
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788550801483', 'Pai Rico, pai Pobre: Edição de 20 Anos Atualizada e Ampliada', 2017, 46.67, 25, 6) --8
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786588280799', 'Agulhas ativar: Crochetando roupas com Anne Galante', 2023, 92.25, 6, 7) --9
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786555606157', 'Outlive: A arte e a ciência de viver mais e melhor', 2023, 50.90, 34, 3) --10
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786555644562', 'Superintestino: Descubra como restaurar seu microbioma para fortalecer sua saúde, regular seu peso e melhorar seu humor', 2022, 44.43, 6, 8) --11
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786559791729', 'O Seminário, livro 14: A lógica do fantasma', 2024, 149.90, 9, 9) --12
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788563960085', 'Manual de Primeiros Socorros da Educação Física aos Esportes: o Papel do Educador Físico no Atendimento de Socorro', 2014, 56.23, 5, 10) --13
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786550970284', 'Noites brancas', 2019, 12.94, 23, 11) --14
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788501110121', 'Corte de asas e ruína (Vol. 3 Corte de espinhos e rosas)', 2017, 55.25, 27, 12) --15
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786556893204', 'Trilogia Cósmica: Volume Único', 2022, 91.17, 11, 13) --16
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788594318947', 'Noite na taverna', 2019, 13.09, 7, 11) --17
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786525918914', 'One Piece Vol. 107', 2024, 30.00, 11, 14) --18
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786585310352', 'O dragão do meu pai', 2024, 25.40, 2, 15) --19
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786555396881', 'Michaelis Dicionário Escolar Língua Portuguesa', 2023, 40.08, 5, 16) --20
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788543105291', 'As coisas que você só vê quando desacelera: Como manter a calma em um mundo frenético', 2017, 44.92, 13, 8) --21
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9786555646139', 'Nada pode me ferir', 2023, 47.42, 12, 8) --22
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788594318725', 'O mundo perdido', 2019, 19.90, 48, 11) --23
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788594318107', 'Sherlock Holmes - Um estudo em vermelho', 2019, 10.73, 49, 11) --24
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788594318169', 'Sherlock Holmes - O signo dos quatro', 2019, 22.40, 47, 11) --25
    INTO Livro (ISBN, Titulo, Ano, Preco, Estoque, ID_Editora) VALUES ('9788594318015', 'Sherlock Holmes - O cão dos Baskerville', 2019, 15.00, 40, 11) --26
SELECT * FROM DUAL;

SELECT * FROM Livro;

-- Inserindo Autores
INSERT ALL
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Byung-Chul', 'Han', 'Coreano') --1
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Michel', 'Desmurget', 'Francês') --2
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Patrick', 'Radden Keefe', 'Estadunidense') --3
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Joe', 'Navarro', 'Cubano') --4
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Toni', 'Sciarra Poynter', 'Estadunidense') --5
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Valeska', 'Zanello', 'Brasileiro') --6
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Arthur', 'Schopenhauer', 'Alemão') --7
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Nicolau', 'Maquiavel', 'Italiano') --8
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Robert', 'Kiyosaki', 'Estadunidense') --9
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Anne', 'Galante', 'Brasileiro') --10
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Peter', 'Attia', 'Canadense') --11
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Bill', 'Gifford', 'Estadunidense') --12
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('William', 'Davis', 'Estadunidense') --13
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Jacques', 'Lacan', 'Francês') --14
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Ednei', 'Fernando dos Santos', 'Brasileiro') --15
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Fiódor', 'Dostoiévski', 'Russo') --16
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Sarah', 'J. Maas', 'Estadunidense') --17
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Clive', 'Staples Lewis', 'Britânico') --18
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Álvares', 'de Azevedo', 'Brasileiro') --19
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Eiichiro', 'Oda', 'Japonês') --20
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Ruth', 'Stiles Gannett', 'Brasileiro') --21
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Equipe', 'Melhoramentos', 'Brasileiro') --22
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Haemin', 'Sunim', 'Coreano') --23
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('David', 'Goggins', 'Estadunidense') --24
    INTO Autor (Pnome, Snome, Nacionalidade) VALUES ('Arthur', 'Conan Doyle', 'Britânico') --25
SELECT * FROM DUAL;

SELECT * FROM Autor;
