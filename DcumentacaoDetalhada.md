# Emotiquiz
**Documentação do jogo de terminal Emotiquiz**

O código possui 3 arquivos, sendo eles a `Main`, o `Funções` e o `Struct`.

### Analisando o arquivo `Main`:

No inicio do código estão as variáveis que serão utilizadas no decorrer do código:

```
var count: Int = 0
var respostaUsuario: [String] = [] //cria uma lista vazia que vai ter a resp do usuario
var caracteresGabarito: [Character] = [] //lista vazia que vai conter os caracteres filmes
var caracteresUsuario: [Character] = [] //lista vazia que vai conter os caracteres usuario
var totalmenteCerto: Bool=false
var usuarioAcertouAResposta: Bool=false
var contadorPontuação: Int = 3
var dicaAtual: Int = 0
var filmeSelecionadoPos: Int = 0
var filmeSelecionado = listaDeFilmes[filmeSelecionadoPos]
var emojisFilmes = filmeSelecionado.respostaCerta
var inicioUsuario: String
var continuarJogando: Bool = true
var querJogar: String
var filmesUsados: [Filme] = []
```

Em seguida se inicia um `repeat while`, no qual a dinâmina inteira do jogo vai rodar:
```
repeat {
    menu()
    selecionaFilme()
    confereResp()
}
while continuarJogando == true
        print ("O jogo acabou")
```

### Analisando o arquivo `Funções`:

#### `func menu()`:
 - Função que pede o imput do usuário para iniciar o jogo e que limpa as variáveis que se alteram ao longo das partidas para que elas sempre se inicie zerada:
```
func menu (){
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
#### `func selecionaFilme ()`:
- Função que zera a variável `dicaAtual` aqual vai servir para puxar uma lista aleatória no futuro, escolhe um filme aleatório da `listaDeFilmes` - uma lista pertencente a `struct` e chama a `func criaGabarito ()`.
```
func selecionaFilme() {
    dicaAtual = 0
    filmeSelecionadoPos = Int.random(in: 0..<listaDeFilmes.count)
    filmeSelecionado = listaDeFilmes[filmeSelecionadoPos]
    emojisFilmes = filmeSelecionado.respostaCerta
    criaGabarito()
}
```
#### `func criaGabarito ()`:
- Função que zera a variáveis que conta os caracteres do gabarito e transforma a escolha que foi aleatória que é uma **string** em uma lista de **caracteres**.
```
func criaGabarito() { 
    caracteresGabarito = []
    for char in emojisFilmes { //para cada caracter dessa resposta certa
        caracteresGabarito.append(char) //coloca os caracteres na array "caracteresGabarito"
    }
}
```
#### `func confereResp ()`:
- Função que limpa a resposta do usuario e que confere se o usuario digitou 5 caracteres - condição `if else` dentro de um `while`: se o jogador escrever 5 caracteres, o jogador é encaminhado a `func gabarito`, se não ele perde 1 ponto e essa condição se repete até entrar no `if`.
```
repeat { //existem 3 tipos de while, o repeat permite que o while retorne para sua origem até determinada `função`ser cumprida. (condição ser verdadeira)
        dicas()
        respostaUsuario = [] //Zera a lista
        caracteresUsuario = [] //Zera a lista
        pegaResposta()
        if caracteresUsuario.count == 5 {
            usuarioAcertouAResposta = gabarito() // Verifica se o usuário acertou a resposta
        } else {
            print ("Parece que algo está faltando! Digite exatamente 5 caracteres")
            contadorPontuação -= 1
            print ("Agora você está com \(contadorPontuação) ponto (s)")
        }
    } while !usuarioAcertouAResposta // tudo isso enquanto o usuário não acerta o nº de caracteres
}
```
