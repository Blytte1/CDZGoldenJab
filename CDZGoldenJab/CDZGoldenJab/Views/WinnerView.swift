//
//  WinnerView.swift
//  TabView
//
//  Created by Roberto Mascarenhas on 06/09/22.
//

import SwiftUI
//valor dessa view = 4
struct WinnerView: View {
    @EnvironmentObject var dataModel: DataModel
   
    
    var body: some View {
        
        ZStack {
            Color("SaintYellow").opacity(0.752).ignoresSafeArea()
            VStack {
                Text(dataModel.player1.isActive ? "Vencedor: \(dataModel.player1.name)" : dataModel.singlePlayerIsOn ? "O Você perdeu o Duelo, mais sorte da próxima vez" : "Vencedor: \(dataModel.player2.name)").padding(.top,50)
                Image(dataModel.player1.isActive ? dataModel.cardPlayer1.pic : dataModel.cardPlayer2.pic ).resizable().scaledToFill().cornerRadius(10).frame(maxWidth:300)
                Text(dataModel.player1.isActive ? dataModel.cardPlayer1.line : dataModel.cardPlayer2.line)
                
                ZStack (){
                    RoundedRectangle(cornerRadius: 20).fill(.orange).opacity(0.2).shadow(radius: 10)
                    NavigationLink("Retornar ao menu inicial", value: Screens.home)
                    
                }.frame(width:600, height: 50)
            }.padding(.bottom,30)}.foregroundColor(.red).font(.title)
            .background(Color("SaintYellow").opacity(0.6))
            .navigationBarBackButtonHidden(true)
    }
}

struct WinnerView_Previews: PreviewProvider {
    @EnvironmentObject var vm: DataModel
    static var previews: some View {
        WinnerView().environmentObject(DataModel())
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}
