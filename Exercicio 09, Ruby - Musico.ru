class Musico
    attr_accessor :nome, :instrumento

    def initialize(nome, instrumento)
        @nome = nome
        @instrumento = instrumento
    end

    def tocar_partitura(peca)
        raise NotImplementedError, "Implementar na filha"
    end
end

class Pianista < Musico
    def initialize(nome)
        super(nome, "Piano")
    end

    def tocar_partitura(peca)
        puts "#{@nome} toca '#{peca}' no piano."
    end
end

class Violinista < Musico
    def initialize(nome)
        super(nome, "Violino")
    end

    def tocar_partitura(peca)
        puts "#{@nome} toca '#{peca}' no violino."
    end
end

class Maestro
    def initialize(musicos)
        @musicos = musicos
    end

    def iniciar_ensaio(peca)
        @musicos.each { |m| m.tocar_partitura(peca) }
    end

    def mudar_foco(estado)
        @musicos.map { |m| "#{m.nome} agora está #{estado}!" }
    end
end

banda = [Pianista.new("Arima"), Violinista.new("Kaori")]
m = Maestro.new(banda)
m.iniciar_ensaio("Sonata")
puts m.mudar_foco("Inspirado")