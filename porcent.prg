*
* Taxa de Juro
*

SAVE SCREEN TO TMP
MOLDURA(13,10,16,27,STDMOLD,.T.,"Taxa de Juros",STDINVE)
@ 15,14 SAY "Taxa:" GET D_JUROS PICTURE "9.99"
SET CURSOR ON
READ
SET CURSOR OFF
SAVE TO DATAS.MEM ALL LIKE D_*
RESTORE SCREEN FROM TMP
RETURN
