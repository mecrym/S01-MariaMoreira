fn eh_par(numero: i32) -> bool {
    if numero % 2 == 0{
        return true;
    }else{
        return false;
    }
}

fn main() {
    println!("Jogador 1, você escolhe 'par' ou 'impar'?");
    let mut par_impar = String::new();
    std::io::stdin().read_line(&mut par_impar).expect("Erro ao ler escolha");
    let escolha = par_impar.trim().to_lowercase();

    println!("Jogador 1, digite seu número:");
    let mut numero_j1 = String::new();
    std::io::stdin().read_line(&mut numero_j1).expect("Erro ao ler número");
    let numero_j1: i32 = numero_j1.trim().parse().expect("Digite um número válido");

    println!("Jogador 2, digite seu número:");
    let mut numero_j2 = String::new();
    std::io::stdin().read_line(&mut numero_j2).expect("Erro ao ler número");
    let numero_j2: i32 = numero_j2.trim().parse().expect("Digite um número válido");

    let soma = numero_j1 + numero_j2;

    let verifica_soma = eh_par(soma);

    println!("A soma dos números é: {}", soma);
    
    if ((verifica_soma == true) && (escolha == "par")) || ((verifica_soma == false) && (escolha == "impar")) {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}