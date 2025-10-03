#include <iostream>
#include <string>
using namespace std;

class Pessoa {
protected:
    string nome;
public:
    Pessoa(string n) : nome(n) {}
    virtual void apresentar() {
        cout << "Olá, meu nome é " << nome << " e eu sou uma pessoa." << endl;
    }
};

class Professor : public Pessoa {
    string disciplina;
public:
    Professor(string n, string d) : Pessoa(n), disciplina(d) {}
    void apresentar() override {
        cout << "Olá, meu nome é " << nome << " e eu sou um professor de " << disciplina << "." << endl;
    }
};

class Aluno : public Pessoa {
    string curso;
    string matricula;
public:
    Aluno(string n, string c, string m) : Pessoa(n), curso(c), matricula(m) {}
    void apresentar() override {
        cout << "Olá, meu nome é " << nome << " e eu sou um aluno de " << curso << endl;
    }
};

int main() {
    Pessoa* p1 = new Professor("Roberto", "C");
    Pessoa* p2 = new Aluno("Maria", "Engenharia de Software", "710");

    p1->apresentar();
    p2->apresentar();

    delete p1;
    delete p2;
    return 0;
}
