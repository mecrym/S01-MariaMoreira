data Servico = Servico String String Double deriving Show
data StatusAtend = EmAndamento | Finalizado | CanceladoAtend deriving Show
data Atendimento = Atendimento [Servico] StatusAtend deriving Show

precoServico :: Servico -> Double
precoServico (Servico _ _ p) = p

bonusEspiritual :: [Servico] -> Double
bonusEspiritual lista
    | temBonusQtd && temDescontoValor = (soma * 1.25) * 0.90
    | temBonusQtd  = soma * 1.25
    | temDescontoValor = soma * 0.90
    | otherwise = soma
    where 
        soma = sum (map precoServico lista)
        qtd = length lista
        temBonusQtd = qtd > 3
        temDescontoValor = soma > 500 

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento _ CanceladoAtend) = 0.0
valorFinalAtendimento (Atendimento servicos _) = bonusEspiritual servicos

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Sem servicos"
descricaoPrimeiroServico (Atendimento (s:_) _) = 
    let (Servico nome tipo _) = s
    in nome ++ " (" ++ tipo ++ ")"

main :: IO ()
main = do
    let s1 = Servico "Banho de Ervas" "Banho" 100.0
    let s2 = Servico "Massagem" "Massagem" 200.0
    let s3 = Servico "Banquete" "Comida" 300.0
    let s4 = Servico "Agua Termal" "Banho" 50.0

    let at1 = Atendimento [s1, s2, s3] Finalizado

    let at2 = Atendimento [s1, s2, s3, s4] EmAndamento

    let at3 = Atendimento [s1] CanceladoAtend

    print ("Valor Final 1 (>500, <=3 itens): " ++ show (valorFinalAtendimento at1))
    print ("Valor Final 2 (>500, >3 itens): " ++ show (valorFinalAtendimento at2))
    print ("Valor Final 3 (Cancelado): " ++ show (valorFinalAtendimento at3))
    print ("Descricao Primeiro Servico 1: " ++ descricaoPrimeiroServico at1)