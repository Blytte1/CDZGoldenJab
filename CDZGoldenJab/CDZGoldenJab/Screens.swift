

import Foundation


enum Screens{
    case home
    case card
    case leave
    case player
    case winner
    case config
    case gallery
    case galleryCard(Card)
    case duel(DuelData)
}

extension Screens: Identifiable, Hashable{
    var id: Self { self }
}
