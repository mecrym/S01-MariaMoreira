class MicroondasUnidade
    def aquecer_por(segundos)
        puts "Microondas: Aquecendo por #{segundos}s..."
    end
end

class DMail
    attr_reader :conteudo, :hora_envio
    def initialize(conteudo, hora)
        @conteudo = conteudo
        @hora_envio = hora
    end
end

class TelefoneDeMicroondas
    def initialize
        @unidade = MicroondasUnidade.new
        @dmails = []
    end

    def enviar_dmail(conteudo, hora)
        @unidade.aquecer_por(10)
        @dmails.push(DMail.new(conteudo, hora))
        puts "D-Mail enviado!"
    end

    def listar_dmails(horario_corte)
        puts "Filtro após #{horario_corte}:"
        @dmails.select { |d| d.hora_envio > horario_corte }.each do |d|
            puts "[#{d.hora_envio}] #{d.conteudo}"
        end
    end
end

tel = TelefoneDeMicroondas.new
tel.enviar_dmail("Operação Skuld", "10:00")
tel.enviar_dmail("El Psy Kongroo", "12:00")
tel.listar_dmails("11:00")