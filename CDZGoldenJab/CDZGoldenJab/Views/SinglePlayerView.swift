//
//  Player1View.swift
//  CDZGoldenJab
//
//  Created by Roberto Mascarenhas on 29/11/22.
//

import SwiftUI

struct SinglePlayerView: View {
    @EnvironmentObject private var dataModel : DataModel
    var body: some View {
        ZStack {
            Color("SaintYellow").opacity(0.752)
                .ignoresSafeArea()
            VStack {
                Text(dataModel.player1.isActive ? "\(dataModel.player1.name): prepare-se para jogar.": dataModel.singlePlayerIsOn ?  "Aguarde, está na vez do CPU jogar." : "\(dataModel.player2.name): prepare-se para jogar." )
                    .padding(.top,50)
            }
            .font(.largeTitle)
            .foregroundColor(.red)
            .padding(.bottom,30)
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    dataModel.path.append(Screens.card)
                }
                if dataModel.singlePlayerIsOn{
                    dataModel.loadCpuAtributes()
                }
            }
        }
        .foregroundColor(Color("SaintYellow")).font(.title)
        .navigationBarBackButtonHidden(true)
        .navigationTitle(dataModel.singlePlayerIsOn ? "\(dataModel.player1.name) : \(dataModel.player1.deck.count) Cavaleiros disponíveis X CPU : \(dataModel.player2.deck.count) Cavaleiros disponíveis" : "\(dataModel.player1.name) : \(dataModel.player1.deck.count) Cavaleiros disponíveis X \(dataModel.player2.name) : \(dataModel.player2.deck.count) Cavaleiros disponíveis")
        .background(Color("SaintYellow").opacity(0.6))
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SinglePlayerView()
                .environmentObject(DataModel())
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
