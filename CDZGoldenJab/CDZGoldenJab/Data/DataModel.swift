//
//  HomeViewModel.swift
//  TabView
//
//  Created by Roberto Mascarenhas on 13/09/22.


import SwiftUI



class DataModel: ObservableObject{
    @Published var player1: Player = Player(name: "Player 1", deck: [], score: 6,isActive: false)
    @Published var player2: Player = Player(name: "Player 2", deck: [], score: 6, isActive: false)
    @Published var singlePlayerIsOn = true
    
    //MARK: - array com todas as cartas do baralho
    
    @Published  var deck: [Card] =  []
    
    //MARK: - MARK: - cartas dos jogadores 1 e 2 a serem utilizadas (Player one and two current cards)
    
    @Published  var cardPlayer1 = Cards.virgo
    @Published  var cardPlayer2 = Cards.aries
    
    //MARK: - valores a serem utilizados no duelview (DuelView Values)
    
    @Published var vencedor = ""
    @Published var atributeRow: [String:Int] = [:]
    @Published var atributeRow2: [String:Int] = [:]
    
    //MARK: - atribuindo valores para o computador (CPU Values)
    
    @Published var cpuAtributes: [String] = []
    @Published var cpuAtribute = ""
    func loadCpuAtributes(){
        cpuAtributes = ["Força","Agilidade","Letalidade","Inteligência","Cosmo", "Resistência"]
        cpuAtribute = cpuAtributes.randomElement()!
    }
    
    //MARK: - setup inicial do jogo (Beginning game setup)
    
    func deckSet(){
        deck =  [Cards.aries,Cards.taurus,Cards.gemini,Cards.cancer,Cards.leo,Cards.virgo,Cards.libra,Cards.scorpio,Cards.sargitarius,Cards.capricorn,Cards.aquarius,Cards.piscies]
        deck.shuffle()
        
        player1.deck = [deck[0],deck[1],deck[2],deck[3],deck[4],deck[5]]
        player2.deck = [deck[6],deck[7],deck[8],deck[9],deck[10],deck[11]]
        cardPlayer1 = player1.deck[0]
        cardPlayer2 = player2.deck[0]
        atributeRow = ["Força": cardPlayer1.atributes.str,"Agilidade": cardPlayer1.atributes.agi,"Letalidade":cardPlayer1.atributes.letal,"Inteligência": cardPlayer1.atributes.int,"Cosmo": cardPlayer1.atributes.cos, "Resistência": cardPlayer1.atributes.sta]
        atributeRow2 = ["Força": cardPlayer2.atributes.str,"Agilidade": cardPlayer2.atributes.agi,"Letalidade":cardPlayer2.atributes.letal,"Inteligência": cardPlayer2.atributes.int,"Cosmo": cardPlayer2.atributes.cos, "Resistência": cardPlayer2.atributes.sta]
        loadCpuAtributes()
    }
    
    func addCards(){
        
        let tradeCard1 = cardPlayer1
        let tradeCard2 = cardPlayer2
        print("a carta copiada do player 1 é: \(tradeCard1.cardName)")
        print("a carta copiada do player 2 é: \(tradeCard2.cardName)")
        if vencedor == cardPlayer1.cardName{
                    player1.deck.append(tradeCard2)
                    player1.deck.append(tradeCard1)
            print("a ultima carta colocada no deckPlayer1 foi: \(        player1.deck.last!.cardName)")
        }else if vencedor == cardPlayer2.cardName{
            player2.deck.append(tradeCard1)
            player2.deck.append(tradeCard2)
        }
    }
    
    //MARK: - Função para Remover cartas do deck perdedor (Duel loser card removal function)
    
    func removeCards(){
        if         player1.deck.count > 1 && player2.deck.count > 1{
                    player1.deck.removeFirst()
            player2.deck.removeFirst()
            cardPlayer1 = player1.deck[0]
            cardPlayer2 = player2.deck[0]
            atributeRow = ["Força": cardPlayer1.atributes.str,"Agilidade": cardPlayer1.atributes.agi,"Letalidade":cardPlayer1.atributes.letal,"Inteligência": cardPlayer1.atributes.int,"Cosmo": cardPlayer1.atributes.cos, "Resistência": cardPlayer1.atributes.sta]
            atributeRow2 = ["Força": cardPlayer2.atributes.str,"Agilidade": cardPlayer2.atributes.agi,"Letalidade":cardPlayer2.atributes.letal,"Inteligência": cardPlayer2.atributes.int,"Cosmo": cardPlayer2.atributes.cos, "Resistência": cardPlayer2.atributes.sta]
        }
    }
    //MARK: - Valores utilizados para o cronômetro da carta(Card Chronometer)
    
    
    let playerDefaultTimeRemaining: CGFloat = 5
    let lineWidth: CGFloat = 15
    let radius: CGFloat = 70
    let defaultTimeRemaining: CGFloat = 05
    @Published var clockIsOn = false
    @Published var timeRemaning: CGFloat = 05
    @Published var clock = Timer.TimerPublisher(interval: 1, runLoop: .current, mode: .default).autoconnect()
    @Published var currentProgress: CGFloat = 0.0
    //Função para resetar o relógio
    func clockReset(){
        clockIsOn = false
        clock.upstream.connect().cancel()
        currentProgress = 0
        timeRemaning = 0
        timeRemaning = defaultTimeRemaining
        print("clock disconnected")
    }
    
    //MARK: - Valores para navegação (Navigation Values)
    
        @Published var path: [Screens] = []
        func pop(){
            path.removeLast()
        }
        func reset(){
            path = [Screens.home]
        }

        func timeOver(){
            path = [Screens.card]
        }
        func startSinglePlayer(){
            path = [Screens.player]
            
        }
    

}
