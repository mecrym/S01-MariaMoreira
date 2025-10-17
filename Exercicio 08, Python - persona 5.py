from abc import ABC, abstractmethod
class ArmaCorpoACorpo:
    def __init__(self):
        self.nome = "Faca"

    def __str__(self):
        return self.nome

class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"Membro: {self.nome}, Arma: {self.arma}"

class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        self.nome = "Joker"

        self.arma_pessoal = ArmaCorpoACorpo()

        self.equipe = equipe

    def mostrar_equipe(self):
        print(f"# Relatório da Equipe #")
        print(f"Líder: {self.nome} (Arma Pessoal: {self.arma_pessoal})")
        print("Membros:")
        if not self.equipe:
            print("  (Nenhum membro na equipe ainda)")
        else:
            for membro in self.equipe:
                print(f"  - {membro}")

membro1 = PhantomThieves("Morgana", "Cimitarra") #pq cimitarra sempre é a mlr >>>>>>
membro2 = PhantomThieves("Ryuji", "Cano de Ferro")
membro3 = PhantomThieves("Ann", "Chicote")

phantom_thieves_equipe = [membro1, membro2, membro3]

joker = Joker(phantom_thieves_equipe)

joker.mostrar_equipe()