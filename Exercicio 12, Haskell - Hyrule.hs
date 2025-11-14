-- Definição dos Tipos
data Item = Item String String Double deriving Show
-- CompraZelda guarda uma lista de Itens
data CompraZelda = CompraZelda [Item] deriving Show

-- Função auxiliar para pegar preço do item
precoItem :: Item -> Double
precoItem (Item _ _ valor) = valor

-- Calcula soma total de uma lista de itens
somaItens :: [Item] -> Double
somaItens lista = sum (map precoItem lista)

calculaDesconto :: [Item] -> Double
calculaDesconto lista = 
    if (somaItens lista) > 200 
    then (somaItens lista) * 0.10 -- 10%
    else 0.0

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda itens)
    | total > 200  = total - (calculaDesconto itens)
    | total <= 200 = total + 15.0                   
    where total = somaItens itens

main :: IO ()
main = do
    print "--- Loja de Hyrule ---"
    let espada = Item "Master Sword" "Arma" 150.0
    let escudo = Item "Hylian Shield" "Equipamento" 100.0
    let pocao = Item "Red Potion" "Pocao" 20.0

    let compra1 = CompraZelda [espada, escudo]
    let compra2 = CompraZelda [pocao]

    print ("Compra 1 (Itens): " ++ show compra1)
    print ("Valor Final Compra 1: " ++ show (valorFinal compra1))
    
    print ("Compra 2 (Itens): " ++ show compra2)
    print ("Valor Final Compra 2: " ++ show (valorFinal compra2))