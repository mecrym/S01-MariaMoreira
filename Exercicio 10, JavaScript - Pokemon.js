class Pokemon {
    #vida;

    constructor(nome, tipo, vidaInicial) {
        this.nome = nome;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    getVida() {
        return this.#vida;
    }

    receberDano(dano) {
        this.#vida -= dano;
        if (this.#vida < 0) this.#vida = 0;
        console.log(`${this.nome} recebeu ${dano} de dano. Vida restante: ${this.#vida}`);
    }

    atacar(alvo) {
        console.log(`${this.nome} fez um ataque genérico em ${alvo.nome}!`);
        alvo.receberDano(10);
    }
}

class PokemonFogo extends Pokemon {
    constructor(nome, vidaInicial, bonusAtaque) {
        super(nome, "Fogo", vidaInicial);
        this.bonusAtaque = bonusAtaque;
    }

    atacar(alvo) {
        const danoTotal = 15 + this.bonusAtaque;
        console.log(`${this.nome} lançou Chamas em ${alvo.nome}! (Dano: ${danoTotal})`);
        alvo.receberDano(danoTotal);
    }
}

class PokemonAgua extends Pokemon {
    #curaBase;

    constructor(nome, vidaInicial, curaBase) {
        super(nome, "Água", vidaInicial);
        this.#curaBase = curaBase;
    }

    atacar(alvo) {
        const dano = 12;
        console.log(`${this.nome} lançou Jato d'Água em ${alvo.nome}!`);
        alvo.receberDano(dano);
        console.log(`${this.nome} curou-se um pouco com a umidade.`);
    }
}

// --- Teste ---
const charizard = new PokemonFogo("Charizard", 100, 5);
const blastoise = new PokemonAgua("Blastoise", 120, 10);

console.log(`Vida inicial Charizard: ${charizard.getVida()}`);
blastoise.atacar(charizard);
charizard.atacar(blastoise);