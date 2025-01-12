CREATE OR REPLACE FUNCTION Hello(msg varchar2)
RETURN varchar2
AS
BEGIN
    return msg;
END Hello;

SELECT Hello('Banco de Dados') AS Mensagem FROM DUAL;