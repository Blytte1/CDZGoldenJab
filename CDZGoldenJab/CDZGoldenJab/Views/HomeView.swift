//
//  ContentView.swift
//  CDZGoldenJab
//
//  Created by Roberto Mascarenhas on 11/08/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        
        ZStack(alignment:.center){
            Color.black.ignoresSafeArea()
            VStack(alignment:.leading){
                HStack{
                    Image("title").resizable(capInsets: EdgeInsets(top: -6.0, leading: -5.0, bottom: -7.0, trailing: -3.0)).scaledToFit()
                    VStack {
                        Text("Os Cavaleiros do Zodiaco").foregroundColor(Color("SaintYellow")).font(.largeTitle).padding()
                        Text("Trunfo de Ouro").foregroundColor(Color("SaintYellow")).font(.largeTitle)
                    }
                }
                HStack {
                    Button{
                        dataModel.path.append(Screens.player)
                        dataModel.singlePlayerIsOn = true
                    }label: {
                    
                        ZStack{
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color("SaintYellow"), lineWidth:5)
                                .frame(maxWidth: .infinity, maxHeight: 100.0)
                            Text("1 jogador").foregroundColor(Color("SaintYellow"))
                        }.padding()
                    }
                    Button{
                        dataModel.path.append(Screens.player)
                        dataModel.singlePlayerIsOn = false
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color("SaintYellow"), lineWidth:5)
                                .frame(maxWidth: .infinity, maxHeight: 100.0)
                            Text("2 jogadores").foregroundColor(Color("SaintYellow"))
                        }.padding()
                    }
                    NavigationLink(value: Screens.gallery) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color("SaintYellow"), lineWidth:5)
                                .frame(maxWidth: .infinity, maxHeight: 100.0)
                            Text("Galeria").foregroundColor(Color("SaintYellow"))
                        }.padding()
                    }
                    
                    NavigationLink(value: Screens.config)
                    {
                        ZStack{
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color("SaintYellow"), lineWidth:5)
                                .frame(maxWidth: .infinity, maxHeight: 100.0)
                            Text("Configurações").foregroundColor(Color("SaintYellow"))}
                    }
                }
                .onAppear(){
                    dataModel.deckSet()
                    dataModel.player1.isActive = true
                    dataModel.clockReset()
                    dataModel.singlePlayerIsOn = false
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .environmentObject(DataModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}

