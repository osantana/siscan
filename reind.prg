IF MAQUINA <> "PC1"
   RETURN
ENDIF

MESSAGE("Aguarde... Criando índices...")

SET DEFAULT TO &DIRET
IF FILE("C:\SISCAN\CONTROL.CLA")
   ERASE C:\SISCAN\CONTROL.CLA
ENDIF
IF FILE("C:\SISCAN\CONTROL.OPN")
   ERASE C:\SISCAN\CONTROL.OPN
ENDIF

MESSAGE("Bloquear no maximo em 5 segundos...")
COPY FILE C:\SISCAN\CLA.$$$ TO C:\SISCAN\CONTROL.CLA
INKEY(5)

CLOSE ALL
MESSAGE("Coloque o Disquete no Drive... Tecle Algo...")
INKEY(0)
COPY FILE ALUNO.DBF    TO A:ALUNO.DBF
COPY FILE LANCAMEN.DBF TO A:LANCAMEN.DBF
COPY FILE PRODUTO.DBF  TO A:PRODUTO.DBF
MESSAGE()
*SET EXCLUSIVE ON
*SET DEFAULT TO C:\SISCAN
SELECT 1
USE LANCAMEN
INDEX ON FLAG    TO LANC001
INDEX ON CODIGO  TO LANC002
SELECT 2
USE PRODUTO
INDEX ON CODPROD TO PROD001
SELECT 3
USE ALUNO
INDEX ON NOME  TO ALUN001
INDEX ON CONTA TO ALUN002
INDEX ON RG    TO ALUN003
CLOSE ALL
SET EXCLUSIVE OFF
DO BANCO

IF FILE("C:\SISCAN\CONTROL.CLA")
   ERASE C:\SISCAN\CONTROL.CLA
ENDIF

MESSAGE("Liberar no maximo em 5 segundos...")
COPY FILE C:\SISCAN\OPN.$$$ TO C:\SISCAN\CONTROL.OPN
INKEY(5)
MESSAGE()
RETURN
