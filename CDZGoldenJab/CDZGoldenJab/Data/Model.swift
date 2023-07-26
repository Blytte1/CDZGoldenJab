

import Foundation
import SwiftUI


class Player:  Codable{
    var name: String
    var deck: [Card]
    var isActive: Bool
    init(name: String, deck: [Card], score: Int, isActive: Bool = false) {
        self.name = name
        self.deck = deck
        self.isActive = isActive
    }
}
    
struct Card: Identifiable, Hashable, Codable{
    var id = UUID()
    var pic: String
    var cardName: String
    var atributes: Atributes
    var line: String
    var country: String
    var age: String
    var specialMove: String
    var deity: String
}

struct Atributes: Hashable, Codable{
    var str: Int
    var agi: Int
    var sta: Int
    var int: Int
    var cos: Int
    var letal: Int
    
}
