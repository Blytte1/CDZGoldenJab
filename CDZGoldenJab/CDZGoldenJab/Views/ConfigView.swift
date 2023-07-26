//
//  ConfigView.swift
//  TabView
//
//  Created by Roberto Mascarenhas on 15/08/22.
//

import SwiftUI

struct ConfigView: View {
    @EnvironmentObject var dataModel : DataModel
    var body: some View {
        
        
        ZStack(alignment:.center){
            
        
            Color.black.ignoresSafeArea()
            
            HStack {
                VStack(alignment:.center){
                    
                    Image("title").resizable().scaledToFit()
                    VStack {
                        Text("Os Cavaleiros do Zodiaco").foregroundColor(Color("SaintYellow")).font(.largeTitle).padding()
                        Text("E o Jab de Ouro").foregroundColor(Color("SaintYellow")).font(.largeTitle)
                    }
                }
                VStack (alignment:.leading){
                    
                    Text("Insira o nome do Jogador 1").foregroundColor(.yellow)
                    TextField("Insira o nome do Jogador 1", text: $dataModel.player1.name)
                     .background(.white)
                     .cornerRadius(5)
                     .foregroundColor(.blue)
                    Text("Insira o nome do Jogador 2").foregroundColor(.yellow)
                    TextField("Insira o nome do Jogador 1", text: $dataModel.player2.name).background(.white).cornerRadius(5)
                        .foregroundColor(.blue)
                }
                .frame(width:300).foregroundColor(.blue)
            }
        }
    }
}
struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        
        ConfigView()
        
          .previewInterfaceOrientation(.landscapeRight).environmentObject(DataModel())
        
        
    }
}

