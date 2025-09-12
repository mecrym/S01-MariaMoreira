package main

import "fmt"

func fibonacci(n int) {
	var anterior int = 0
	var atual int = 1
	var i int

	for i = 0; i < n; i++ {
		fmt.Print(anterior, " ")
		var proximo int = anterior + atual
		anterior = atual
		atual = proximo
	}
	fmt.Println() // pula linha no final
}

func main() {
	var quantidade int

	fmt.Print("Digite quantos números da sequência de Fibonacci você quer: ")
	fmt.Scan(&quantidade)

	fibonacci(quantidade)
}
