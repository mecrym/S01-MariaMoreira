#include <iostream>
#include <string>
using namespace std;

class Personagem {
private:
    string nome;
    int nivel;
    int dano;
    int vida;

public:
    Personagem(string n, int nv, int d, int v) {
        nome = n;
        nivel = nv;
        dano = d;
        vida = v;
    }

    void atacar(Personagem &alvo) {
        cout << nome << " atacou " << alvo.nome << " causando " << dano << " de dano!" << endl;
        alvo.vida -= dano;
        if (alvo.vida < 0) alvo.vida = 0;
    }

    void mostrarStatus() {
        cout << "Nome: " << nome << " | Nível: " << nivel << " | Dano: " << dano << " | Vida: " << vida << endl;
    }
};

int main() {
    Personagem p1("Aragorn", 10, 25, 100);
    Personagem p2("Goblin", 5, 10, 60);

    cout << "Status inicial dos personagens:" << endl;

    p1.mostrarStatus();
    p2.mostrarStatus();

    cout << endl;

    p1.atacar(p2);

    cout << "\nStatus após o ataque:" << endl;

    p1.mostrarStatus();
    p2.mostrarStatus();

    return 0;
}
