//
//  main.swift
//  EMOTICONZZ
//
//  Created by Aluno Mack on 18/03/25.
//

import Foundation

//print("EMOTICONZZ")

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

print("""
.---------------------------------------------------------------------.
|███████╗███╗   ███╗ ██████╗ ████████╗██╗ ██████╗ ██╗   ██╗██╗███████╗|
|██╔════╝████╗ ████║██╔═══██╗╚══██╔══╝██║██╔═══██╗██║   ██║██║╚══███╔╝|
|█████╗  ██╔████╔██║██║   ██║   ██║   ██║██║   ██║██║   ██║██║  ███╔╝ |
|██╔══╝  ██║╚██╔╝██║██║   ██║   ██║   ██║██║▄▄ ██║██║   ██║██║ ███╔╝  |
|███████╗██║ ╚═╝ ██║╚██████╔╝   ██║   ██║╚██████╔╝╚██████╔╝██║███████╗|
|╚══════╝╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚═╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚══════╝|
'---------------------------------------------------------------------'
""")
print("""
MANUAL DO JOGO:
      - Tente representar o filme correto através de 5 emoticons 😍
      - Você terá 3 dicas por filme! 😱

      PS: O comando para digitar emoticons é: control + command + space 💡
      Boa sorte! 😉
""")
repeat {
    menu()
    selecionaFilme()
    confereResp()
}
while continuarJogando == true
        print ("O jogo acabou")
