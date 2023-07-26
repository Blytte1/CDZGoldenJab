//
//  GalleryCardView.swift
//  TabView
//
//  Created by Roberto Mascarenhas on 17/10/22.
//

import SwiftUI

struct GalleryCardView: View {
    @State var card: Card
    @State var atributeRow: [String:Int] = [:]
        var body: some View {

            ZStack {
                
                ZStack(alignment: .topLeading){
                    Color("SaintYellow").ignoresSafeArea()
                    HStack (alignment: .top){
                        Image(card.pic).resizable().scaledToFill().frame(width:450,alignment: .center).padding()
                        VStack (alignment: .leading,spacing: 5){
                            Text("Nome: \(card.cardName)")
                            Text("Idade: \(card.age)")
                            Text("País de origem: \(card.country)")
                            Text("Técnica(s):  \(card.specialMove)")
                            ForEach (atributeRow.sorted(by: <), id:\.key){key, value in
                                Text("\(key):  \(value)").fontWeight(.bold)
                            }
                        }.foregroundColor(.red).fontWeight(.bold).padding(.top).frame(width: 300)
                    }.frame( maxHeight:350,alignment: .topLeading).padding()
                }
            }.onAppear(){atributeRow = ["Força":card.atributes.str,"Agilidade":card.atributes.agi,"Letalidade":card.atributes.letal,"Inteligência":card.atributes.int,"Cosmo":card.atributes.cos, "Resistência":card.atributes.sta]}
        }
     }

struct GalleryCardView_Previews: PreviewProvider {
    
   static var previews: some View {
      NavigationStack{
      GalleryCardView(card:Cards.aries)
            .previewInterfaceOrientation(.landscapeRight)
   }
    }
}
