*
* Totais de Caixa
*

RESTORE SCREEN FROM ENTRASCR
SET CURSOR OFF
MOLDURA(08,22,14,57,STDMOLD,.T.,"Total de Caixa",STDINVE)
@ 11,23 SAY ALIGN("Aguarde Impress�o...","C",34)
SELECT LANCAMEN
SET ORDER TO 1
SET DELETED OFF
GO  TOP
SUM ALL VALOR TO TOTALGERAL
SUM VALOR TO TOTALPAGO FOR DELETED()
LIN = 01
KPRINT(@LIN,00,CHR(14) + "Totais Caixa")
KPRINT(@LIN,00,"")
KPRINT(@LIN,00,"Total Geral:")
KPRINT(@LIN,00,"  "+TRANSFORM(TOTALGERAL,"999,999.99"))
KPRINT(@LIN,00,"Total Pago/Cancelado:")
KPRINT(@LIN,00,"  "+TRANSFORM(TOTALPAGO,"999,999.99"))
KPRINT(@LIN,00,"")
KRODAP(@LIN)
RESTORE SCREEN FROM ENTRASCR
SET DELETED ON
RETURN
