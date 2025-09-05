//ela aceita caracteres especiais, n sei se podia, mas não coloquei nenhuma verificaçaõ para isso
fn verificar_senha(senha: &str) -> bool {
    if senha.len() < 8 {//o pelo menos indica q pd ter mais, mas eu não sei qual o limite, por isso n vou verificar um maximo
        return false;
    }

    let mut tem_maiuscula = false;
    let mut tem_numero = false;

    for caractere in senha.chars() {//só pra constar, eu detestei esse for in
        if caractere.is_ascii_uppercase() {
            tem_maiuscula = true;
        }
        if caractere.is_ascii_digit() {
            tem_numero = true;
        }
    }

    return tem_maiuscula && tem_numero;
}

fn main() {
    loop {
        println!("Digite sua senha:");

        let mut senha = String::new();
        std::io::stdin()
            .read_line(&mut senha)
            .expect("Falha ao ler a linha");

        let senha = senha.trim();

        if verificar_senha(senha){
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida. Tente novamente.");
        }
    }
}
