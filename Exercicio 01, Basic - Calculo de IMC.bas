10 REM calculo de imc altura em metro e peso em kg imc=(peso / (altura * altura)), até tentei colocar só duas casas decimais, mas n deu muito certo n...
20 PRINT "CALCULADORA DE IMC!"
30 INPUT "QUAL O SEU PESO EM KILOGRAMAS? "; PESO$
40 INPUT "QUAL A SUA ALTURA EM METROS? "; ALTURA$

50 LET KG = VAL(PESO$)
60 LET M = VAL(ALTURA$)

70 LET IMC = (KG / (M * M))

80 PRINT "SEU IMC É: " + IMC

100 END