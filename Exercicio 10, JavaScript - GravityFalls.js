class Criatura {
    constructor(nome, perigosa) {
        this.nome = nome;
        this.perigosa = perigosa;
    }
}

class Diario {
    #autorSecreto;

    constructor(autor) {
        this.#autorSecreto = autor;
        this.enigmas = new Map();
        this.criaturasAvistadas = [];
    }

    getAutor() {
        return "O autor é um mistério...";
    }

    adicionarEnigma(num, enigma) {
        this.enigmas.set(num, enigma);
    }

    decodificar(chave, num) {
        if (chave === this.#autorSecreto) {
            return this.enigmas.get(num) || "Enigma não encontrado.";
        } else {
            return "ACESSO NEGADO: Autor incorreto.";
        }
    }
}

class Personagem {
    constructor(nome, idade) {
        this.nome = nome;
        this.idade = idade;
    }
}

class Protagonista extends Personagem {
    constructor(nome, idade, diario) {
        super(nome, idade);
        this.diario3 = diario;
    }
}

class CabanaMisterio {
    constructor() {
        this.visitantes = [];
        this.funcionarios = [];
    }

    contratar(personagem) {
        this.funcionarios.push(personagem);
    }

    listarFuncionarios() {
        // Retorna a coleção agregada
        console.log("--- Funcionários da Cabana ---");
        this.funcionarios.forEach(f => console.log(`- ${f.nome} (${f.idade} anos)`));
        return this.funcionarios;
    }
}

const diario3 = new Diario("Stanford");
diario3.adicionarEnigma(1, "Cuidado com o Bill!");

const dipper = new Protagonista("Dipper", 12, diario3);
console.log(dipper.diario3.decodificar("Stanford", 1));
console.log(dipper.diario3.decodificar("Gideon", 1));

const cabana = new CabanaMisterio();
cabana.contratar(new Personagem("Soos", 22));
cabana.contratar(new Personagem("Wendy", 15));
cabana.listarFuncionarios();