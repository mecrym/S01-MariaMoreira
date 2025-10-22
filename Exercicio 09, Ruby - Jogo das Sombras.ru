module Rastreavel
    def obter_localizacao(hora)
        puts "Localizado às #{hora}: #{@localizacao}"
    end
end

module Perigoso
    def calcular_risco; true; end
end

class Participante
    attr_accessor :nome, :localizacao
    def initialize(n); @nome = n; end
end

class Detetive < Participante
    include Rastreavel
end

class MestreDoCrime < Participante
    include Rastreavel
    include Perigoso
end

class Cenario
    def initialize; @participantes = []; end
    def adicionar(p); @participantes.push(p); end

    def identificar_ameacas
        ameacas = @participantes.select { |p| p.respond_to?(:calcular_risco) }
        ameacas.each { |p| puts "Ameaça: #{p.nome}" }
    end
end

london = Cenario.new
london.adicionar(Detetive.new("Sherlock"))
moriarty = MestreDoCrime.new("Moriarty")
london.adicionar(moriarty)

moriarty.localizacao = "Torre de Londres"
moriarty.obter_localizacao("Midnight")
london.identificar_ameacas