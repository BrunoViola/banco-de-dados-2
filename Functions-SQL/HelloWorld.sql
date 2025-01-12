CREATE OR REPLACE FUNCTION Hello
RETURN varchar2
AS
    msg varchar2(15) := 'Olá, mundo!';
BEGIN
    return msg;
END Hello;

SELECT Hello FROM DUAL;
