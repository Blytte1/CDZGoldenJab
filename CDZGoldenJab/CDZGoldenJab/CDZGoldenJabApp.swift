//
//  CDZGoldenJabApp.swift
//  CDZGoldenJab
//
//  Created by Roberto Mascarenhas on 15/08/22.
//

import SwiftUI

@main
struct CDZGoldenJabApp: App {
    @StateObject var dataModel = DataModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $dataModel.path){
                
                ///Start --
                HomeView()
                    .environmentObject(dataModel)
                
                ///Destinations --
                .navigationDestination(for: Screens.self) { screen in
                    switch screen{
                    case .home:
                        HomeView()
                            .environmentObject(dataModel)
                    case .player:
                        SinglePlayerView()
                            .environmentObject(dataModel)
                    case .config:
                        ConfigView()
                            .environmentObject(dataModel)
                    case .gallery:
                        GalleryView()
                            .environmentObject(dataModel)
                    case .card:
                        CardView()
                            .environmentObject(dataModel)
                    case .galleryCard(let card):
                        GalleryCardView(card: card)
                            .environmentObject(dataModel)
                    case .duel(let duelData):
                        DuelView(duelData: duelData)
                            .environmentObject(dataModel)
                    case .winner:
                        WinnerView()
                            .environmentObject(dataModel)
                    default:
                        Text("<unknown screen>")
                    }
                }
            }
        }
    }
}

