fn main() {
    let numero = ler_numero("Digite o número da tabuada: ");
    let inicio = ler_numero("Digite o limite inferior: ");
    let fim = ler_numero("Digite o limite superior: ");

    imprimir_tabuada(numero, inicio, fim);
}

fn ler_numero(mensagem: &str) -> i32 {
    loop {
        println!("{}", mensagem);

        let mut input = String::new();
        std::io::stdin().read_line(&mut input).expect("Erro ao ler");

        let input = input.trim();

        let mut eh_numero = true;
        for c in input.chars() {
            if !c.is_digit(10) {
                eh_numero = false;
                break;
            }
        }

        if eh_numero && !input.is_empty() {
            let mut numero = 0;
            for c in input.chars() {
                numero = numero * 10 + (c as i32 - '0' as i32);
            }
            return numero;
        }

        println!("Digite um número válido!");
    }
}

fn imprimir_tabuada(numero: i32, inicio: i32, fim: i32) {
    println!("\nTabuada do {} de {} a {}:", numero, inicio, fim);

    for i in inicio..=fim {
        let resultado = numero * i;
        println!("{} x {} = {}", numero, i, resultado);
    }
}