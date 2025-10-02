//olá monitor! Esse exercício aparece como o 2 mas tem no texto falando q é na realidade o 3, irei seguir a ordem dos slides e não a do exercicio em si.
/* o enunciado:
    Exercício 3: Classes de Personagens
    Cenário: Em Persona, cada personagem, seja o protagonista ou um aliado, tem características pessoais
    que devem ser protegidas e alteradas de forma controlada.
    Tarefa:
    1.Crie uma classe base chamada Pessoa.
    2.Adicione os atributos nome (string) e idade(int) como privados.
    3.Crie uma classe Protagonista e outra Personagem, ambas herdeiras de Pessoa. Protagonista deve
    ter um atributo de nível(int) e Personagem deve ter um atributo de rank(int) (obs: o rank dos
    Personagens/social link varia de 0 a 10). Ambos devem ser privados.
    4.Na main, crie um objeto da classe Protagonista e atribua um nome e nível. Faça o mesmo para um
    objeto da classe Personagem. Imprima os valores e demonstre que os atributos estão sendo
    acessados através de um método e não diretamente. */

#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string n, int i) {
        nome = n;
        idade = i;
    }
    string getNome() {
        return nome;
    }

    int getIdade() {
        return idade;
    }

    void setNome(string n) {
        nome = n;
    }

    void setIdade(int i) {
        idade = i;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int nv) : Pessoa(n, i) {
        nivel = nv;
    }

    int getNivel() {
        return nivel;
    }

    void setNivel(int nv) {
        nivel = nv;
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i) {
        if (r >= 0 && r <= 10)
            rank = r;
        else
            rank = 0;
    }

    int getRank() {
        return rank;
    }

    void setRank(int r) {
        if (r >= 0 && r <= 10)
            rank = r;
    }
};

int main() {
    Protagonista hero("Ren Amamiya", 17, 5);

    Personagem ally("Ryuji Sakamoto", 16, 3);

    cout << "=== Protagonista ===" << endl;
    cout << "Nome: " << hero.getNome() << endl;
    cout << "Idade: " << hero.getIdade() << endl;
    cout << "Nivel: " << hero.getNivel() << endl;

    cout << "\n=== Aliado ===" << endl;
    cout << "Nome: " << ally.getNome() << endl;
    cout << "Idade: " << ally.getIdade() << endl;
    cout << "Rank: " << ally.getRank() << endl;

    return 0;
}
