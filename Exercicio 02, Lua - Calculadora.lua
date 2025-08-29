local num1;
local num2;
local operador;

function calculadora(num1, num2, operador)
	if operador == "+" then
		return num1 + num2;
	elseif operador == "-" then
		return num1 - num2;
	elseif operador == "*" then
		return num1 * num2;
	elseif operador == "/" then
		if num2 ~= 0 then
			return num1 / num2;
		else
			return "Não existe divisão por zero";
    	end
	else
		return "Erro! O operador utilizado não é válido";
	end
end

io.write("Digite o primeiro número: ");
num1 = tonumber(io.read());

io.write("Digite o segundo número: ");
num2 = tonumber(io.read());

io.write("Digite o seu operador: ");
operador = io.read();

local resultado = calculadora(num1, num2, operador);

print("Resultado: ", resultado);