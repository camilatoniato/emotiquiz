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
#### `func dicas()`:
- Função que utiliza a variável int `dicaAtual` para colocar uma condição se o jogo deve continuar ou não: cada vez que o usuário receber uma dica se soma 1 a essa variável, e caso `dicaAtual` seja maior ou igual a 3, o código seguirá para a `func gameOver()`. Além disso, para facilitar a jogabilidade, sempre que o jogador receber uma dica nova ele também receberá o glossário:
```
func dicas(){ 
    if dicaAtual >= 3 { 
        gameOver()
    } else {
        print("""
              GLOSSÁRIO:
              Utilize apenas os emojis abaixo durante o jogo

              🎈         👦         ⚡️         🔴

              🆚         😭         🧓         ❤️

              🏠         🔫         🚢         🤡

              🦉         🦇         🔵         💥

              🚂         🌃         🧹         😎

              🧔🏻‍♂️         🥶         🐶         😃

              🧠         🥇         🚀         🕷️
    
    """)
        print ("Dica: \(filmeSelecionado.dicasFilme[dicaAtual])")
        dicaAtual += 1
    }
}
```
#### `func pegaResposta()`:
- Função que pede e lê a reposta do usuário, transformando-a de uma `string` em uma `array` de `char`:
```
func gabarito()->Bool{ 
    var resposta: Bool=false
    var respostaCerta: Int
    respostaCerta = 0
    for i in caracteresGabarito{
        for j in caracteresUsuario{
            if (i == j){ 
                respostaCerta += 1
                print("Voce acertou o emoji \(i)")
            }
        }
    }
```
#### `func gabarito()`:
- Função que compara os caracteres da resposta certa com os digitados pelo usuário: a variável `respostaCerta` vai somar 1 a cada caracter similar das repostas e, caso ela for igual a 5, isso significa que o usuário acertou todos os caracteres, assim se somam 5 ao `contadorPontuação`. Detalhando ainda mais:
     - `for` dentro do `for`: Essa é a condição que compara caracter por caracter, sendo assim ela pegará cada caracter do `caracteresGabarito` (i) e depois pegará cada caracter do `caracteresUsuario` (j) e se cria uma condição: `if` - se algum caracter i for igual à algum caracter j, se adiciona 1 ao `contadorPontuação` e imprime o "i" - que serão os caracteres similares entre as duas `arrays`. Deste modo se elimina a necessidade de o jogador acertar a ordem dos caracteres, ele sóprecisará quais serão os corretos:
       ```
       for i in caracteresGabarito{
        for j in caracteresUsuario{
            if (i == j){ // compara respostas
                respostaCerta += 1
                print("Voce acertou o emoji \(i)")
            }
        }
    - `if else`: Essa é a condição que confere se o usuário acertou todos os caracteres: caso `respostaCerta` for igual a 5, significa que todos os caracteres e, em consequência, o filme. Sendo assim será printado o nome do filme selecionado e, em seguida será removido da `listaDeFilmes` o filme da posição previamente escolhida:
      ```
      if respostaCerta == 5{ // condição que ocorre se o usuário acertar os 5 caracteres
        totalmenteCerto=true
        print("Parabéns, você acertou! O filme era: \(filmeSelecionado.nomeFilme)")
        resposta = true
        contadorPontuação += 5
        print ("Você tem \(contadorPontuação) ponto (s)!")
        listaDeFilmes.remove(at: filmeSelecionadoPos)
      ```
      - E, caso ele não acerte os 5 caracteres, ele perderá 1 ponto:
      ```
        else { // condição que tira um ponto do jogador caso ele não acerte os 5 caracteres
        contadorPontuação -= 1
        print ("Você tem \(contadorPontuação) ponto (s)!")
    }
      ```
    - `if`: Essa última condição definirá quando o jogador vencer o jogo por completo: como sempre que o usuário acertar um filme ele será removido da `listaDeFilmes`, caso o número de itens nessa lista seja igual a 0 significa que ele acertou todos e venceu o jogo. Sendo assim:
      ```
      if (listaDeFilmes.count == 0) {
            print ("""
                   .-------------------------------------------------------.
                   |██╗   ██╗ ██████╗  ██████╗███████╗                     |
                   |██║   ██║██╔═══██╗██╔════╝██╔════╝                     |
                   |██║   ██║██║   ██║██║     █████╗                       |
                   |╚██╗ ██╔╝██║   ██║██║     ██╔══╝                       |
                   | ╚████╔╝ ╚██████╔╝╚██████╗███████╗                     |
                   |  ╚═══╝   ╚═════╝  ╚═════╝╚══════╝                     |
                   |                                                       |
                   |██╗   ██╗███████╗███╗   ██╗ ██████╗███████╗██╗   ██╗██╗|
                   |██║   ██║██╔════╝████╗  ██║██╔════╝██╔════╝██║   ██║██║|
                   |██║   ██║█████╗  ██╔██╗ ██║██║     █████╗  ██║   ██║██║|
                   |╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║     ██╔══╝  ██║   ██║╚═╝|
                   | ╚████╔╝ ███████╗██║ ╚████║╚██████╗███████╗╚██████╔╝██╗|
                   |  ╚═══╝  ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚══════╝ ╚═════╝ ╚═╝|
                   '-------------------------------------------------------' """)
            exit(0)
     ```
#### `func gameOver ()`:
