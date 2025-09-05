fn main() {//no enunciado foram dadas essas notas, mas realmente é só fazer com elas? n precisa do input do usuario?? tipo, qual o sentido então? o resultado vai ser sempre o msm assim...
    let nota1 = 7.5;
    let nota2 = 8.0;
    let nota3 = 9.2;

    let media = calcular_media(nota1, nota2, nota3);

    println!("Média: {:.2}", media);//:.2 arredonda tipo %.2f em c

    if media >= 7.0 {
        println!("Aprovado");
    } else {
        println!("Reprovado");
    }
}

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let peso1 = 2.0;
    let peso2 = 3.0;
    let peso3 = 5.0;

    let soma_pesos = peso1 + peso2 + peso3;
    let soma_notas = (nota1 * peso1) + (nota2 * peso2) + (nota3 * peso3);

    soma_notas / soma_pesos
}