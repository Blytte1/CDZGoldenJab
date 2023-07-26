

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var dataModel: DataModel

    private var atribute: [String : Int]{
        if dataModel.player1.isActive{
            return dataModel.atributeRow
        }else{
            return dataModel.atributeRow2
        }
    }
   
    var body: some View {
        
        ZStack{
            Color("SaintYellow").ignoresSafeArea()
            VStack (){
                HStack (alignment:.top){
                    VStack(alignment: .leading){
                        Image(dataModel.player1.isActive ? dataModel.cardPlayer1.pic: dataModel.cardPlayer2.pic).resizable().scaledToFill().cornerRadius(20)
                    }
//MARK: - Relógio e Placar
                    HStack (alignment:.top){
                        Clock()
                            .onReceive(dataModel.clock){ _ in DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                                if dataModel.clockIsOn && dataModel.timeRemaning > 0{
                                    dataModel.timeRemaning -= 1
                                    dataModel.currentProgress += 1/dataModel.defaultTimeRemaining
                                    if dataModel.player1.isActive == false && dataModel.timeRemaning == 2 && dataModel.singlePlayerIsOn{
                                        dataModel.clockReset()
                                        dataModel.path.append(Screens.duel(
                                            DuelData(selectedAtributeName: dataModel.cpuAtribute, selectedAtributeValue: dataModel.atributeRow[dataModel.cpuAtribute]!, selectedAtributeValue2: dataModel.atributeRow2[dataModel.cpuAtribute]!)))
                                    }
                                } else {
                                    dataModel.path = [Screens.player]
                                    dataModel.player1.isActive.toggle()
                                    dataModel.clockReset()
                                }
                            }
                        }
                        VStack (alignment:.leading){
                            Text("\(dataModel.player1.name) : \(dataModel.player1.deck.count) ")
                            Text("\(dataModel.player2.name) : \(dataModel.player2.deck.count) ")
                        }
                        .font(.title)
                        .foregroundColor(.blue)
                        .frame(width: 200)
                    }
                    .onDisappear(){
                        if dataModel.clockIsOn{dataModel.clockReset()}
                    }
                }
                //Atributos das cartas
                HStack (spacing:20){
                    ForEach (atribute.sorted(by: <), id:\.key){key, value in
                        VStack{
                            Text("\(key)").fontWeight(.bold)
                            
                            let dvm = DuelData(selectedAtributeName: key, selectedAtributeValue: dataModel.atributeRow[key]!, selectedAtributeValue2: dataModel.atributeRow2[key]!)
                            if dataModel.singlePlayerIsOn && !dataModel.player1.isActive{
                                Button {}label:{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10).fill(.orange).opacity(0.2).shadow(radius: 10)
                                        Text(" \(value)").font(.title).fontWeight(.bold)
                                    }
                                }
                            }else{
                                NavigationLink(value: Screens.duel(dvm)) {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10).fill(.orange).opacity(0.2).shadow(radius: 10)
                                        Text(" \(value)").font(.title).fontWeight(.bold)
                                    }
                                }
                            }
                        }
                    }
                }
                .foregroundColor(.red)
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
        }
        .navigationBarItems(leading: Text(dataModel.player1.isActive ? dataModel.cardPlayer1.cardName : dataModel.cardPlayer2.cardName).font(.largeTitle).fontWeight(.bold).foregroundColor(.red),trailing: Button {dataModel.path = [Screens.home]} label: {Image(systemName: "house.circle")}.font(.largeTitle))
           
            .navigationBarBackButtonHidden(true)
            
            .padding()
            .background(Color("SaintYellow"))
            .onAppear(){
                dataModel.clockIsOn = true
                print("O timer foi ligado = \(dataModel.clockIsOn)")
            }
    }
}
//MARK: - CLOCK VIEW
struct Clock: View {
    
    @EnvironmentObject private var dataModel : DataModel

    let playerDefaultTimeRemaining: CGFloat = 5
    let lineWidth: CGFloat = 15
    let radius: CGFloat = 70
    let defaultTimeRemaining: CGFloat = 15

    var body: some View {
        
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth,lineCap: .round)
                )
               
            Circle()
                .trim(from: 0,to:  dataModel.currentProgress )
                .stroke(dataModel.timeRemaning >= 7 ? Color.blue : dataModel.timeRemaning >= 5 ? Color.orange: Color.red, style: StrokeStyle(lineWidth: lineWidth,lineCap: .round)
                )
                .rotationEffect(.init(degrees:-90))
                .animation(.easeInOut,value:dataModel.timeRemaning)
            Text("\(Int(dataModel.timeRemaning))").font(.largeTitle).foregroundColor(.red)
            
        }.frame(maxWidth: 150, maxHeight: 100).padding(.leading)
    }
}
