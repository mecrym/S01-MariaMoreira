import java.util.LinkedHashSet;
import java.util.HashMap;

class Main {
    public static void main(String[] args) {
        BossMagico b = new BossMagico("Malenia", "B1", "Fogo");
        b.adicionarAtaque(new PadraoAtaque("Corte", 100));
        
        Batalha batalha = new Batalha(new HashMap<>());
        batalha.adicionarBoss(b);
        batalha.iniciarBatalha("B1");
    }
}

class PadraoAtaque {
    public String nome;
    public int dano;
    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }
}

class Boss {
    public String nome;
    private String idBoss;
    private String PontoFraco;

    private LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String id, String fracoContra) {
        this.nome = nome;
        this.idBoss = id;
        this.PontoFraco = fracoContra;
        this.moveset = new LinkedHashSet<>();
    }

    public String getIdBoss() { return idBoss; }

    public void adicionarAtaque(PadraoAtaque ataque) {
        this.moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("Boss " + nome + " iniciou fase!");
        for(PadraoAtaque a : moveset) System.out.println(a.nome);
    }
}

class BossMagico extends Boss {
    public BossMagico(String nome, String id, String fraco) {
        super(nome, id, fraco);
    }
}

class Batalha {
    private HashMap<String, Boss> _arena;

    public Batalha(HashMap<String, Boss> arena) {
        this._arena = arena;
    }

    public void adicionarBoss(Boss boss) {
        this._arena.put(boss.getIdBoss(), boss);
    }

    public void iniciarBatalha(String idBoss) {
        if(_arena.containsKey(idBoss)) {
            _arena.get(idBoss).iniciarFase();
        }
    }
}