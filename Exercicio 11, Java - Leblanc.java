import java.util.ArrayList;

class Main {
    public static void main(String[] args) {
        Menu menu = new Menu(new ArrayList<>());
        CafeLeblanc leblanc = new CafeLeblanc(menu);

        Cafe c = new Cafe("Preto", 5.0);
        CafeGourmet g = new CafeGourmet("Mocha", 10.0, 2.5);

        leblanc.getMenu().adicionarItem(c);
        leblanc.getMenu().adicionarItem(g);
        leblanc.receberPedido(g);
    }
}

class Cafe {
    public String nome;
    public double precoBase;
    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }
    public double calcularPrecoFinal() { return precoBase; }
}

class CafeGourmet extends Cafe {
    public double bonusAroma;
    public CafeGourmet(String nome, double preco, double bonus) {
        super(nome, preco);
        this.bonusAroma = bonus;
    }
    @Override
    public double calcularPrecoFinal() { return precoBase + bonusAroma; }
}

class Menu {
    private ArrayList<Cafe> itens;
    public Menu(ArrayList<Cafe> itens) { this.itens = itens; }

    public void adicionarItem(Cafe cafe) { this.itens.add(cafe); }
}

class CafeLeblanc {
    private Menu _menu;
    public CafeLeblanc(Menu menu) { this._menu = menu; }
    
    public Menu getMenu() { return _menu; }

    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido: " + cafe.nome + " | R$" + cafe.calcularPrecoFinal());
    }
}