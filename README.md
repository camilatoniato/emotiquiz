# Emotiquiz
Este é o repositóorio do Jogo

[Main](./main.md) - Aqui fica a documentação da função `Main`


```
func menu (){ // função que pede o imput do usuário para iniciar a partida, que zera as variaveis para iniciar o jogo limpo e que escolhe o filme da partida
    print ("Pressione 'return' para começar!" )
    inicioUsuario = readLine()!
    if inicioUsuario == ""{
        dicaAtual = 0
        count = 0
        usuarioAcertouAResposta = false
        totalmenteCerto = false
        respostaUsuario = []
        caracteresUsuario = []
        caracteresGabarito = []
    }
}

```


