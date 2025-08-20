10 REM tem q ler uma temp em celsius e converter para kelvin e fahrenheit K = C + 273.15 e F = (C * 9 / 5) + 32, printar as 3, de novo tive o msm problema da soma, que concatena no lugar de somar... vou seguir usadno val como padão...

20 INPUT "Digite uma temperatura em celsius: "; C$

30 LET CE = VAL(C$)

40 LET K = (CE + 273.15)
50 LET F = (CE * 9 / 5) + 32

60 PRINT "CELSIUS: " + CE + " °C"
70 PRINT "KELVIN: " + K + " K"
80 PRINT "FAHRENHEIT: " + F + " °F"

100 END