10 REM Aqui tive que ler como string porque por alguma razão, não estava somando e sim concatenando mesmo sem o  
20 INPUT "PRIMEIRA NOTA: "; A$  
30 INPUT "SEGUNDA NOTA: "; B$
40 REM Por causa da leitura como string, uso o VAL() para converte-la em número, ai sim deu certo para somar, mas aconteceu a mesma coisa com o codigo que copiei da video aula
50 LET NOTA1 = VAL(A$) 
60 LET NOTA2 = VAL(B$)

70 LET SOMA = (NOTA1 + NOTA2)
80 LET MEDIA = (SOMA/2)

90 IF MEDIA > 60 THEN PRINT "APROVADO DIRETO! SUA NOTA: "+ MEDIA
100 IF MEDIA > 60 THEN GOTO 210
110 IF MEDIA < 30 THEN PRINT "REPROVADO DIRETO! SUA NOTA: "+MEDIA
120 IF MEDIA > 60 THEN GOTO 210
130 IF MEDIA >= 30 AND MEDIA <= 60 THEN INPUT "SUA NOTA FOI INSUFICIENTE (" + MEDIA + ") . DIGITE UMA NOVA NOTA: "; C$

140 LET NOVANOTA = VAL(C$)

150 LET NOVASOMA = (MEDIA + NOVANOTA)
160 LET NOVAMEDIA = NOVASOMA/2

170 IF NOVAMEDIA > 50 THEN PRINT "APROVADO PELA NP3! SUA NOTA: "+ NOVAMEDIA ELSE PRINT "REPROVADO PELA NP3! SUA NOTA: "+ NOVAMEDIA

210 END