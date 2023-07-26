//
//  Utils.swift
//  TabView
//
//  Created by Roberto Mascarenhas on 13/09/22.
//

import Foundation



//todas as opções de cartas
    struct Cards{
      static let  deck =  [Cards.aries,Cards.taurus,Cards.gemini,Cards.cancer,Cards.leo,Cards.virgo,Cards.libra,Cards.scorpio,Cards.sargitarius,Cards.capricorn,Cards.aquarius,Cards.piscies]
      static let aries = Card(pic:"01",cardName: "Mu de Aries", atributes:.init(str: 65, agi: 70, sta: 70, int: 100, cos: 75, letal: 70),line: "StarLight, Revolution!",country: "Nepal",age: "20",specialMove: "Revolução Estelar, Muralha de Cristal, Extinção Estelar, Revolução Estelar",deity: "Athena")
        static let taurus = Card(pic:"02",cardName:"Aldebaran de Touro", atributes:  .init(str: 100, agi: 70, sta: 75, int: 65, cos: 70, letal: 70), line: "Grande Chifre !",country: "Brasil",age: "20",specialMove: "Grande Chifre",deity: "Athena")
        static let gemini = Card(pic:"03",cardName:"Saga de Gêmeos", atributes: .init(str: 65, agi: 65, sta: 70, int: 70, cos: 80, letal: 100), line: "Explosão Galática!",country: "Grécia",age: "28",specialMove: "Outra Dimensão, Satã Imperial",deity: "Athena")
        static let cancer = Card(pic:"04",cardName:"Death Mask de Câncer", atributes: .init(str: 65, agi: 80, sta: 70, int: 75, cos: 75, letal: 85), line: "Grande Chifre !",country: "Itália",age: "23",specialMove: "Ondas do Inferno",deity: "Athena")
        static let leo = Card(pic:"05",cardName:"Aiolia de Leão", atributes: .init(str: 80, agi: 100, sta: 70, int: 60, cos: 80, letal: 60), line: "Prepare-se, você vai conhecer a Fúria do Leão!",country: "Grécia",age: "20",specialMove: "Cápsula do Poder, Relâmpago de Plasma",deity: "Athena")
        static let virgo = Card(pic:"06",cardName:"Shaka de virgem", atributes: .init(str: 50, agi: 50, sta: 80, int: 90, cos: 100, letal: 80), line: "Ohm!",country: "Índia",age: "20",specialMove: "Ohm, Kahn, Rendição Divina, Ciclo das Seis Existências, Círculo de Transferência, Invocação dos Espíritos Malígnos, Tesouro do Céu",deity: "Athena")
        static let libra = Card(pic:"07",cardName:"Dohko de Libra", atributes: .init(str: 70, agi: 65, sta: 65, int: 90, cos: 90, letal: 70), line: "Colera do Dragão!",country: "China",age: "261",specialMove: "Cólera do Dragão, Cólera dos Cem Dragões, Harmonia da Natureza",deity: "Athena")
        static let scorpio = Card(pic:"08",cardName:"Milo de Escorpião", atributes: .init(str: 70, agi: 85, sta: 65, int:75, cos: 60, letal: 95), line: "Agulha Escarlate!",country: "Grécia",age: "20",specialMove: "Agulha Escarlate, Agulha escarlate de Antares, Restrição",deity: "Athena")
        static let sargitarius = Card(pic:"09",cardName:"Aioros de Sagitárius", atributes: .init(str: 80, agi: 80, sta: 100, int: 60, cos: 70, letal: 60), line: "Proteger Atena é o dever de todo Cavaleiro",country: "Grécia",age: "14",specialMove: "Flecha de Sagitário, Trovão Atômico, Flecha das Sombras",deity: "Atena")
        static let capricorn = Card(pic:"10",cardName:"Shura de Capricórnio", atributes: .init(str: 95, agi: 75, sta: 65, int: 60, cos: 75, letal: 80), line: "Excalibur",country: "Espanha",age: "23",specialMove: "Excalibur, Pedra Saltitante",deity: "Athena")
        static let aquarius = Card(pic:"11",cardName:"Camus de Aquario", atributes: .init(str: 70, agi: 60, sta: 65, int: 80, cos: 90, letal: 85), line: "Execução Aurora Ataque!",country: "França",age: "20",specialMove: "Pó de diamante, Esquife de Gelo, Prisão Circular",deity: "Athena")
        static let piscies = Card( pic: "12", cardName: "Afrodite de Peixes",atributes: .init(str: 60, agi: 70, sta: 60, int: 95, cos: 75, letal: 90), line: "Rosas Diabólicas Reais!",country: "Suécia",age: "22",specialMove: "Rosas Diabólicas Reais, Rosas Piranhas, Rosa Sangrenta, Rosa Adaga",deity: "Athena")
    }

