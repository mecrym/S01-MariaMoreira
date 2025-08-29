--maior valor em um vetor
--como no exercicio não fala o tamanho e nem a condição de parada, vou fazer usando -1

local tam = 0;
local num;
local numerosArray = {};

print("Digite os valores do vetor: ");

num = tonumber(io.read());

while num ~= -1 do
	tam = tam + 1;
	numerosArray[tam] = num; --pq em lua começa com 1 e não com 0, ai tam tem q vir primeiro
	num = tonumber(io.read());
end

local maior = -999;

for i = 1, tam, 1 do
	if maior < numerosArray[i] then
		maior = numerosArray[i];
	end
end

print("O maior valor é: ", maior);
