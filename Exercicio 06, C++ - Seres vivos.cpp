#include <iostream>
#include <string>
using namespace std;

class SerVivo {
protected:
    string nome;
public:
    SerVivo(string n) : nome(n) {}
    virtual void apresentar() {
        cout << "Eu sou um ser vivo chamado " << nome << "." << endl;
    }
};

class Humano : public SerVivo {
public:
    Humano(string n) : SerVivo(n) {}
    void apresentar() override {
        cout << "Olá, eu sou o humano " << nome << "." << endl;
    }
};

class Elfo : public SerVivo {
public:
    Elfo(string n) : SerVivo(n) {}
    void apresentar() override {
        cout << "Saudações, eu sou o elfo " << nome << "." << endl;
    }
};

class Fada : public SerVivo {
public:
    Fada(string n) : SerVivo(n) {}
    void apresentar() override {
        cout << "Encantada, eu sou a fada " << nome << "." << endl;
    }
};

int main() {
    SerVivo* lista[3];

    lista[0] = new Humano("Arthur");
    lista[1] = new Elfo("Legolas");
    lista[2] = new Fada("Tinker Bell");

    for (int i = 0; i < 3; i++) {
        lista[i]->apresentar();
    }
    for (int i = 0; i < 3; i++) {
        delete lista[i];
    }

    return 0;
}