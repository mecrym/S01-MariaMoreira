data Banda = Banda String String Double deriving Show
data StatusEvento = Ativo | Encerrado | CanceladoEvento deriving Show
data Evento = Evento [Banda] StatusEvento deriving Show

cacheBanda :: Banda -> Double
cacheBanda (Banda _ _ valor) = valor

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ CanceladoEvento) = 0.0
custoTotalEvento (Evento bandas _) = (sum (map cacheBanda bandas)) * 1.20

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda"
bandaAbertura (Evento (b:_) _) = 
    let (Banda nome _ _) = b 
    in nome

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda"
bandaEncerramento (Evento bandas _) = 
    let (Banda nome _ _) = last bandas 
    in nome

main :: IO ()
main = do
    print "--- Casa de Shows ---"
    let b1 = Banda "Os Metaleiros" "Rock" 1000.0
    let b2 = Banda "Os Pagodeiros" "Pagode" 2000.0
    
    let eventoAtivo = Evento [b1, b2] Ativo
    let eventoEncerrado = Evento [b1] Encerrado
    let eventoCancelado = Evento [b1, b2] CanceladoEvento

    print ("Custo Evento Ativo (3000 + 20%): " ++ show (custoTotalEvento eventoAtivo))
    print ("Custo Evento Encerrado (1000 + 20%): " ++ show (custoTotalEvento eventoEncerrado))
    print ("Custo Evento Cancelado: " ++ show (custoTotalEvento eventoCancelado))
    
    print ("Abertura do Ativo: " ++ bandaAbertura eventoAtivo)
    print ("Encerramento do Ativo: " ++ bandaEncerramento eventoAtivo)