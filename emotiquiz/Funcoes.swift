//
//  funcoes.swift
//  EMOTICONZZ
//
//  Created by Aluno Mack on 20/03/25.
//

import Foundation

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

func selecionaFilme() { // função que zera a dica atual e escolhe um filme aleatório da listaDeFilmes, depois, chama o criaGabarito
    dicaAtual = 1
    filmeSelecionadoPos = Int.random(in: 0..<listaDeFilmes.count)
    filmeSelecionado = listaDeFilmes[filmeSelecionadoPos]
    emojisFilmes = filmeSelecionado.respostaCerta
    criaGabarito()
}

func criaGabarito() { //função que zera os caracteres do Gabarito e transforma a resposta (string) em uma lista de caracteres
    caracteresGabarito = []
    for char in emojisFilmes { //para cada caracter dessa resposta certa
        caracteresGabarito.append(char) //coloca os caracteres na array "caracteresGabarito"
    }
}

func confereResp(){ // função que limpa a resposta do usuario e que confere se o usuario digitou 5 caracteres
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

func dicas(){ // função que dá a dica e o glossário para o jogador e da 'gameover'caso o jogador nao acerte a resposta dentro de 3 dicas
    if dicaAtual >= 3 { // variável que conta em que dica está e quando chega na terceira termina o jogo
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

func pegaResposta(){//pega a resposta do usuário e transforma em caracteres
    print ("Coloque sua resposta:")
    if let testeUsuario = readLine(){
        respostaUsuario.append(testeUsuario) //coloca a reposta do usuario na lista de cima
    }
    if !respostaUsuario.isEmpty {
        //fazendo o "palavraUsuario" ser a primeira palavra da lista dos "respostaUsuario"
        for char in respostaUsuario[count] { //para cada caracter na primeira palavra
            caracteresUsuario.append(char) //coloca os caracteres na array "caracteresUsuario"
        }
    }
}

func gabarito()->Bool{ // função que compara a resposta certa com a resposta do usuário
    var resposta: Bool=false
    var respostaCerta: Int // cria uma variavel Int que conta o número de caracteres que o usuário acertou
    respostaCerta = 0
    for i in caracteresGabarito{
        for j in caracteresUsuario{
            if (i == j){ // compara respostas
                respostaCerta += 1
                print("Voce acertou o emoji \(i)")
            }
        }
    }
    
    if respostaCerta == 5{ // condição que ocorre se o usuário acertar os 5 caracteres
        totalmenteCerto=true
        print("Parabéns, você acertou! O filme era: \(filmeSelecionado.nomeFilme)")
        resposta = true
        contadorPontuação += 5
        print ("Você tem \(contadorPontuação) ponto (s)!")
        listaDeFilmes.remove(at: filmeSelecionadoPos)
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
                   '-------------------------------------------------------'
""")
            exit(0)
        }
    } else { // condição que tira um ponto do jogador caso ele não acerte os 5 caracteres
        contadorPontuação -= 1
        print ("Você tem \(contadorPontuação) ponto (s)!")
    }
    return resposta
}


func gameOver (){// função que termina o jogo
    print ("O jogo acabou, você fez \(contadorPontuação) ponto(s)")
    usuarioAcertouAResposta = true
    continuarJogando = false
}
