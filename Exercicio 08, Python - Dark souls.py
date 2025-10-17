#Olá monitor! Não foi pedido no enunciado para deixar o "jogo" interativo, ou seja, com input e afins... porém já perdi ponto por ter feito oq foi pedido e não ter o bendito input, MAS como não foi pedido e eu não sei se realmente tem q ter (se vou ser penalisada por ter ou n), vou deixar sem e seguir estritamente oq está no enunciado
from abc import ABC, abstractmethod

class Personagem:
    def __init__(self, vida, resistencia):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, novo_valor):
        if novo_valor < 0:
            self._vida = 0
        else:
            self._vida = novo_valor

    def __str__(self):
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência."

class Cavaleiro(Personagem):
    def __init__(self, vida, resistencia, armadura_pesada):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        status_armadura = "Sim" if self.armadura_pesada else "Não"
        return f"Cavaleiro com {self._vida} de vida, {self._resistencia} de resistência e Armadura Pesada: {status_armadura}."


personagem_comum = Personagem(100, 50)
cavaleiro_tarkus = Cavaleiro(150, 80, True)

print(personagem_comum)
print(cavaleiro_tarkus)

cavaleiro_tarkus.vida = 90
print(f"\nVida do Cavaleiro após tomar dano: {cavaleiro_tarkus.vida}")