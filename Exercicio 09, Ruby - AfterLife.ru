class Drink
    attr_reader :nome

    def initialize(nome, preco_base)
        @_nome = nome
        self.preco_base = preco_base
    end

    def preco_base
        @_preco_base
    end

    def preco_base=(valor)
        if valor > 0
            @_preco_base = valor
        else
            @_preco_base = 0.0
        end
    end

    def to_s
        "Drink: #{@_nome} | Base: R$#{@_preco_base}"
    end
end

class DrinkLenda < Drink
    def initialize(nome, preco_base, anos)
        super(nome, preco_base)
        @anos_desde_criacao = anos
    end

    def preco_final
        preco_base + (@anos_desde_criacao * 5)
    end

    def to_s
        "Lenda: #{@_nome} | Final: R$#{preco_final}"
    end
end

# Execução
d = DrinkLenda.new("Elixir da Vida", 50.0, 100)
puts d.to_s