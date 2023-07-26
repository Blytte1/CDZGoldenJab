//
//  DuelView.swift
//  TabView
//
//  Created by Roberto Mascarenhas on 05/09/22.
//
//valor dessa view:3

import SwiftUI

struct DuelView: View {
    @EnvironmentObject var dataModel : DataModel
    
    
    @State var duelData: DuelData
    
    
    var body: some View {
        
        ZStack {
            Color("SaintYellow").ignoresSafeArea()
            VStack {
                
                HStack {
                    VStack(alignment: .center){
                        
                        Text(dataModel.cardPlayer1.cardName).fontWeight(.bold).font(.title).fontWeight(.bold)
                        Image(dataModel.cardPlayer1.pic).resizable().scaledToFit().cornerRadius(10).frame(minWidth: 10,maxWidth: .infinity)
                    }
                    VStack {
                        Text(duelData.selectedAtributeName).fontWeight(.bold)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red)
                            
                            Text("\(duelData.selectedAtributeValue)").font(.title).fontWeight(.bold)
                        }.frame(maxWidth:60,maxHeight: 60)
                    }
                    
                    Text("VS").font(.title).fontWeight(.black).padding(.top,20)
                    VStack {
                        Text(duelData.selectedAtributeName).fontWeight(.bold)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red)
                            Text("\(duelData.selectedAtributeValue2)").font(.title).fontWeight(.bold)
                        }.frame(maxWidth:60,maxHeight: 60)
                    }
                    
                    VStack(alignment: .center){
                        
                        Text(dataModel.cardPlayer2.cardName).font(.title).fontWeight(.bold)
                        Image(dataModel.cardPlayer2.pic).resizable().scaledToFit().cornerRadius(10).frame(minWidth: 10)
                    }
                }
                HStack {
                    withAnimation(.easeInOut) {
                        Text("Vencedor do Duelo: \(dataModel.vencedor)").scaleEffect(1)
                    }
                    Spacer()
                }.font(.title).fontWeight(.bold)
                
            }
        }
        .onAppear {
            if duelData.selectedAtributeValue > duelData.selectedAtributeValue2 {
                dataModel.vencedor = dataModel.cardPlayer1.cardName
                dataModel.player1.isActive = true
            }else{
                dataModel.vencedor = dataModel.cardPlayer2.cardName
                dataModel.player1.isActive = false
            }
            dataModel.addCards()
            if dataModel.player1.deck.count > 12{
                dataModel.path.append(Screens.winner)
            }
            else if  dataModel.player2.deck.count > 12{
                dataModel.path.append(Screens.winner)
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { dataModel.path.append(Screens.player)
                    dataModel.removeCards()
                    }
                )
            }
            
        }
        .foregroundColor(.red).padding(.leading,10).background(Color("SaintYellow"))
        .navigationBarBackButtonHidden(true)
    }
}


struct DuelView_Previews: PreviewProvider {
    @EnvironmentObject var vm: DataModel
    static var previews: some View {
        DuelView(duelData: DuelData(selectedAtributeName: "Força", selectedAtributeValue: 100, selectedAtributeValue2: 90)).environmentObject(DataModel())
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}
