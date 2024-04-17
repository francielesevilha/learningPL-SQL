DROP TABLE EMPRESA;

CREATE TABLE EMPRESA (
    ID NUMBER (4)  PRIMARY KEY,
    NOME VARCHAR2(120) NOT NULL,
    TELEFONE NUMBER (11) NULL,
    CAPITAL NUMBER (15,2) NOT NULL
);

CREATE SEQUENCE SEQ_EMPRESA
    START WITH 1
    MAXVALUE 999
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

--------------------------------------------------------------------

CREATE OR REPLACE
FUNCTION FUNC_INSEMPRESA (P_NOME IN EMPRESA.NOME%TYPE,
                          P_TELEFONE EMPRESA.TELEFONE%TYPE,
                          P_CAPITAL EMPRESA.CAPITAL%TYPE)

RETURN NUMBER


IS

V_TELEFONE NUMBER (1) := 0;
V_QDTE NUMBER (1);
V_SAIDA NUMBER(1);

BEGIN 
    IF P_CAPITAL >= 0 AND P_CAPITAL <=1000000 THEN
        IF P_TELEFONE >=0 AND P_TELEFONE <= 99999999999 THEN
            SELECT COUNT (*) INTO V_QDTE FROM EMPRESA
                WHERE TRANSLATE(UPPER(NOME),'ÃÁÀÂÄÇÈÉÊËÍÌÏÎÓÒÔÖÚÙÛÜ', 'AAAAAÇEEEEIIIIOOOOUUUU') = 
                   TRANSLATE(UPPER(P_NOME), 'ÃÁÀÂÄÇÈÉÊËÍÌÏÎÓÒÔÖÚÙÛÜ', 'AAAAAÇEEEEIIIIOOOOUUUU');
        
            IF V_QDTE = 0 THEN
                INSERT INTO EMPRESA (ID, NOME, TELEFONE, CAPITAL)
                 VALUES (SEQ_EMPRESA.NEXTVAL, P_NOME, P_TELEFONE, P_CAPITAL);
                 V_SAIDA:= 0;
             ELSE 
                V_SAIDA:= -1; ---RAZAO SOCIAL JA EXISTE OU É NULA
            END IF;
        ELSE
            V_SAIDA:= -3; --NUMERO DO TELEFONE FOR NULO OU MAIOR QUE 11 NOVES  
        END IF;
    ELSE 
    V_SAIDA:= -2; -- CAPITAL FOR NULO OU FORA DA FAIXA ENTRE ZERO E 1000000
    
    END IF;

    RETURN V_SAIDA;  
END;

------------------------------------------------------------------------------

DECLARE

    RETORNO NUMBER (3);

BEGIN
    RETORNO := FUNC_INSEMPRESA ('FENTY BEAUTY', 109876543, 10000);
    DBMS_OUTPUT.PUT_LINE('RETORNO FOI DE' || RETORNO);

END;