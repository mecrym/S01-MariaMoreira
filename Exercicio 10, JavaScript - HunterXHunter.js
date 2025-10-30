class IRastreavel {
    rastrearLocal(lat, long) {
        throw new Error("Método obrigatório");
    }
}

class Hunter extends IRastreavel {
    constructor(nome, local, idade) {
        super();
        this.nome = nome;
        this.localizacao = local;
        this.idade = idade;
    }
}

class Especialista extends Hunter {
    constructor(nome, local, idade, habilidade) {
        super(nome, local, idade);
        this.habilidadeNen = habilidade;
    }

    rastrearLocal(lat, long) {
        return `[ESPECIALISTA] ${this.nome} usou ${this.habilidadeNen} em (${lat}, ${long}).`;
    }
}

class Manipulador extends Hunter {
    constructor(nome, local, idade) {
        super(nome, local, idade);
        this.alvoAtual = null;
    }

    rastrearLocal(lat, long) {
        return `[MANIPULADOR] ${this.nome} enviou marionetes para (${lat}, ${long}).`;
    }
}

class Batalhao {
    constructor() {
        this.hunters = new Set();
    }

    adicionarHunter(novoHunter) {
        let duplicado = false;
        this.hunters.forEach(h => {
            if (h.nome === novoHunter.nome) duplicado = true;
        });

        if (!duplicado) {
            this.hunters.add(novoHunter);
            console.log(`${novoHunter.nome} adicionado ao batalhão.`);
        } else {
            console.log(`Erro: ${novoHunter.nome} já está no batalhão.`);
        }
    }

    getNumHunters() {
        return this.hunters.size;
    }

    iniciarRastreamento(lat, long) {
        console.log("--- Iniciando Rastreamento ---");
        const relatorios = [];
        this.hunters.forEach(hunter => {

            const resultado = hunter.rastrearLocal(lat, long);
            console.log(resultado);
            relatorios.push(resultado);
        });
        return relatorios;
    }
}

const kurapika = new Especialista("Kurapika", "Yorkshin", 19, "Correntes");
const illumi = new Manipulador("Illumi", "Desconhecido", 24);
const kurapikaClone = new Especialista("Kurapika", "Fake", 0, "Fake");

const batalhao = new Batalhao();
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(illumi);
batalhao.adicionarHunter(kurapikaClone);

batalhao.iniciarRastreamento("35.68", "139.76");