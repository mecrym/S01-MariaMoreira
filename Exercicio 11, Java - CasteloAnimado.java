import java.util.ArrayList;

class Main {
    public static void main(String[] args) {
        Castelo castelo = new Castelo("Castelo Movel", new ArrayList<>());
        castelo.adicionarDivisao(new Divisao("Quarto"));
        
        Mago howl = new Mago("Howl", 27, "Fogo");
        System.out.println(howl.lancarFeitico());
    }
}

class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }
    public void setNome(String nome) { this.nome = nome; }
    public String getNome() { return nome; }
}

class Mago extends Personagem {
    private String magia;
    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }
    public String lancarFeitico() {
        return getNome() + " usou magia: " + magia;
    }
}

class Divisao {
    public String nome;
    public Divisao(String nome) { this.nome = nome; }
}

class Castelo {
    private ArrayList<Divisao> divisoes;
    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.divisoes = divisoes;
    }
    public void adicionarDivisao(Divisao divisao) {
        this.divisoes.add(divisao);
    }
}