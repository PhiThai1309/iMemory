//
//  ContentView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
// https://stackoverflow.com/questions/61930915/swiftui-detecting-the-navigationview-back-button-press

import SwiftUI

struct ContentView: View {
    @ObservedObject var userModel: UserModelMV
    @ObservedObject var memoryGame = MemoryGame()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var userName = ""
    @State var show = false
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ZStack {
            Color("Purple")
                .ignoresSafeArea()
            VStack {
                Text("Welcome: \(userName)")
                Text("Score: \(memoryGame.getScore())")
                    .modifier(TextModifier())
                gameBody
                Spacer()
                HStack{
                    shuffle
                    restart
                }
                .padding(.horizontal)
            }
            .padding(20)
            .foregroundColor(Color("Card"))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
                if(userName != "") {
                    userModel.addPoint(memoryGame.getScore())
                }
            }){
                Image(systemName: "arrow.left")
            })
            UserRegister(name: $userName ,userModel: userModel, show: $show)
        }
    }
    
    var gameBody: some View {
        LazyVGrid(columns: columns){
            ForEach(memoryGame.cards) { card in
                if !card.isFaceUp && card.isMatched {
                    Rectangle().opacity(0.0)
                } else {
                    CardView(card: card)
                        .aspectRatio(2/3 , contentMode: .fit)
                        .transition(AnyTransition.scale)
                        .onTapGesture {
                            withAnimation {
                                memoryGame.choose(card)
                            }
                        }
                }
            }
            
        }
    }
    
    var shuffle: some View {
        Button {
            withAnimation {
                memoryGame.shuffle()
            }
        } label: {
            Text("Shuffle")
                .foregroundColor(Color("Green"))
        }
        
    }
    
    var restart: some View {
        Button {
            withAnimation {
                memoryGame.restart()
            }
        }  label: {
            Text("Restart")
                .foregroundColor(Color("Green"))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    let emoji = MemoryGame()
//    static var previews: some View {
//        ContentView(viewModel: emoji)
//            .previewDevice("iPhone 11")
//    }
//}
