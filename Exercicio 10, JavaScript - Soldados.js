// Simulação de Interface
class IExplorador {
    explorarTerritorio() {
        throw new Error("O método explorarTerritorio() deve ser implementado.");
    }
}

class ODM_Gear {
    #gasRestante;

    constructor(modelo) {
        this.modelo = modelo;
        this.#gasRestante = 100;
    }

    usarGas(quantidade) {
        if (this.#gasRestante >= quantidade) {
            this.#gasRestante -= quantidade;
        } else {
            console.log("Gás insuficiente!");
        }
    }

    getGas() {
        return this.#gasRestante;
    }
}

class Soldado extends IExplorador {
    #gear;

    constructor(nome, modeloGear) {
        super();
        this.nome = nome;
        this.#gear = new ODM_Gear(modeloGear);
    }

    explorarTerritorio() {
        this.#gear.usarGas(10);
        return `${this.nome} voou com seu equipamento ${this.#gear.modelo}. Gás restante: ${this.#gear.getGas()}%`;
    }

    verificarEquipamento() {
        return `Gear: ${this.#gear.modelo} | Status: OK`;
    }
}

class Esquadrao {
    constructor(lider, membrosIniciais = []) {
        this.lider = lider;
        this.membros = membrosIniciais;
    }

    adicionarMembro(soldado) {
        this.membros.push(soldado);
    }

    explorarTerritorio() {
        return this.membros.map(m => m.explorarTerritorio());
    }

    relatarStatus() {
        return this.membros.map(m => `${m.nome}: ${m.verificarEquipamento()}`);
    }
}

const eren = new Soldado("Eren", "Mark IV");
const mikasa = new Soldado("Mikasa", "Ackerman Special");

const esquadraoLevi = new Esquadrao("Levi", [eren]);
esquadraoLevi.adicionarMembro(mikasa);

console.log(esquadraoLevi.explorarTerritorio());