data Bebida = Bebida String String Double deriving Show
data StatusPedido = Aberto | Entregue | Cancelado deriving Show
data Pedido = Pedido [Bebida] StatusPedido deriving Show

precoBebida :: Bebida -> Double
precoBebida (Bebida _ _ preco) = preco

valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido _ Cancelado) = 0.0
valorTotalPedido (Pedido bebidas _) = (sum (map precoBebida bebidas)) + 5.0

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida no pedido"
primeiraBebida (Pedido (b:_) _) = 
    let (Bebida nome _ _) = b 
    in nome

main :: IO ()
main = do
    print "--- Cafe Leblanc ---"
    let cafe = Bebida "Cafe Expresso" "Cafe" 5.0
    let cha = Bebida "Cha Verde" "Cha" 7.0
    
    let pedido1 = Pedido [cafe, cha] Entregue
    let pedido2 = Pedido [cafe] Cancelado
    let pedido3 = Pedido [] Aberto

    print ("Valor Pedido 1 (Entregue): " ++ show (valorTotalPedido pedido1))
    print ("Valor Pedido 2 (Cancelado): " ++ show (valorTotalPedido pedido2))
    print ("Primeira bebida Pedido 1: " ++ show (primeiraBebida pedido1))
    print ("Primeira bebida Pedido 3: " ++ show (primeiraBebida pedido3))