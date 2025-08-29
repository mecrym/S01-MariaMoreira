local M;
local N;

local x = 0;
local y = 0;

print("Digite o numero que inicia o intervalo: ");
x = io.read();
print("Digite o numero que finaliza o intervalo: ");
y = io.read();

if x <= y then
	M = x;
	N = y;
elseif x > y then
	M = y;
	N = x;
	print("O intervalo foi invertido para: ", M, " ate ", N, ", já que o primeiro numero digitado é maior que o segundo.");
end

print("Digite o numero ao qual deseja ver os multiplos dentro do intervalo: (", M,",", N,"): ");
local num = io.read();
local multiplos = {};

for i = M, N, 1 do
	if i % num == 0 then
		table.insert(multiplos, i);
	end
end

print("Os multiplos de ", num, " dentro do intervalo ", M, " ate ", N, " sao: ");
print(table.concat(multiplos, ", ")); -- Esse jeito não é o comum, mas os outros estavam mais complicados, e esse aq já printa td de uma vez do jeito q eu quero