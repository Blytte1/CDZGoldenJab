//
//  GalleryView.swift
//  TabView
//
//  Created by Roberto Mascarenhas on 15/08/22.
//

import SwiftUI
struct GalleryView: View {
    
    private var columns :[GridItem] = [GridItem(.adaptive(minimum: 200))]
    var body: some View {
        ZStack {
            Color("SaintYellow").ignoresSafeArea()
            
            ScrollView(.horizontal){
                LazyHGrid(rows: columns) {
                    
                    ForEach (Cards.deck){
                        card in NavigationLink(value: Screens.galleryCard(card)) {
                            VStack (alignment:.center
                            ){
                                Image(card.pic).resizable().scaledToFit()
                                Text("\(card.cardName)").font(.title)
                            }
                            .padding(10)
                        }
                    }
                }.navigationTitle("Escolha uma Carta para ver os detalhes").navigationViewStyle(.automatic)
            }
        }.navigationBarBackButtonHidden(false)
    }
    
    struct GalleryView_Previews: PreviewProvider {
        static var previews: some View {
            GalleryView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
