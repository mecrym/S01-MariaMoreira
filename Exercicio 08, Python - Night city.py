from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return f"{self.funcao} (Custo: {self.custo} Eurodólares)"

class NetRunner(Cibernetico):
    def __init__(self, nome, funcao_implante):
        self.nome = nome
        custo_implante = 5000 
        self.implante_neural = Implante(custo_implante, funcao_implante)
    
    def realizar_hack(self):
        print(f"NetRunner '{self.nome}' usa seu implante '{self.implante_neural.funcao}' para invadir o sistema. ")

class Faccao:
    def __init__(self, nome, membros: list[Cibernetico]):
        self.nome = nome
        self.membros = membros
    
    def executar_hack_em_massa(self):
        print(f"\nA facção '{self.nome}' está iniciando uma operação coordenada!")
        for membro in self.membros:
            membro.realizar_hack()

if __name__ == "__main__":
    netrunner1 = NetRunner("T-Bug", "Infiltração Rápida")
    netrunner2 = NetRunner("Nix", "Quebra-gelo de Senha")
    netrunner3 = NetRunner("8ug8ear", "Desativar Câmeras")

    equipe_de_hackers = [netrunner1, netrunner2, netrunner3]

    faccao_voodoo_boys = Faccao("Voodoo Boys", equipe_de_hackers)
    faccao_voodoo_boys.executar_hack_em_massa()