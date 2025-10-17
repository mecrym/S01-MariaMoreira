class Heroi:
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    def usar_ultimate(self):
        raise NotImplementedError("A subclasse deve implementar este método!")

class Tanque(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} ({self.funcao}): Ativando habilidade defensiva.")

class Dano(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} ({self.funcao}): Ativando habilidade ofensiva.")

personagem_tanque = Tanque("Personagem Tanque")
personagem_dano = Dano("Personagem de Dano")

lista_de_personagens = [personagem_tanque, personagem_dano]

print("--- Executando a habilidade especial de cada personagem ---")
for personagem in lista_de_personagens:
    personagem.usar_habilidade_especial()