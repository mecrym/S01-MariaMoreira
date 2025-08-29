--de novo vou usar -1 como condição de parada
local tabela = {};
local tabelaPares = {};
local num;
local tam = 0;

print("Digite os valores contidos na tabela: ");

num = tonumber(io.read());

while num ~= -1 do
	tam = tam + 1;
	tabela[tam] = num;
	num = tonumber(io.read());
end

for i = 1, tam, 1 do
	if tabela[i]%2 == 0 then
		table.insert(tabelaPares, tabela[i]);
	end
end

print("Os numeros pares contidos nessa tabela sao: ");
print(table.concat(tabelaPares, ", "));