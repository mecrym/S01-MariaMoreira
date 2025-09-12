package main

import "fmt"

func verificarLogin(usuario string, senha string) bool {
	if usuario == "senha" && senha == "admin" {
		return true
	} else {
		return false
	}
}

func main() {
	var usuario string
	var senha string

	for {
		fmt.Print("Digite o nome de usuário: ")
		fmt.Scan(&usuario)

		fmt.Print("Digite a senha: ")
		fmt.Scan(&senha)

		var loginCorreto bool = verificarLogin(usuario, senha)

		if loginCorreto {
			fmt.Println("Login bem-sucedido!")
			break
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}
