import java.util.HashMap;

class Main {
    public static void main(String[] args) {
        Registros reg = new Registros("Setor 7");
        Alien alien = new Alien("ET", "Terra", "Cura", "Marte");
        reg.registrarAvistamento(alien, "ET");
        System.out.println(alien.obterCoordenadas());
    }
}

interface IRastreavel {
    String obterCoordenadas();
}

class Poder {
    public String nome;
    public Poder(String nome) { this.nome = nome; }
}

abstract class Entidade implements IRastreavel {
    public String nome;
    public String localizacao;
    protected Poder _poder;

    public Entidade(String nome, String local, String poder) {
        this.nome = nome;
        this.localizacao = local;
        this._poder = new Poder(poder);
    }
}

class Alien extends Entidade {
    public String planetaOrigem;
    public String Ovni;
    
    public Alien(String nome, String planeta, String ovni, String pOrigem) {
        super(nome, "Local", "Poder");
        this.planetaOrigem = pOrigem;
        this.Ovni = ovni;
    }
    public String obterCoordenadas() { return "Alien em " + planetaOrigem; }
}

class Youkai extends Entidade {
    public Youkai(String nome, String local, String poder) {
        super(nome, local, poder);
    }
    public String obterCoordenadas() { return "Youkai em " + localizacao; }
}

class Registros {
    public String nomeEquipe;
    private HashMap<String, Entidade> _avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this._avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidade entidade, String nome) {
        if (_avistamentos.containsKey(nome)) return false;
        _avistamentos.put(nome, entidade);
        return true;
    }
}