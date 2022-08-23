//
//  ContentView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoryGame
    @Binding var show: Bool
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ZStack {
            Color("Purple")
                .ignoresSafeArea()
            VStack {
                Text("Score: \(viewModel.getScore())")
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
            UserRegister(show: $show)
        }
    }
    
    var gameBody: some View {
        LazyVGrid(columns: columns){
            ForEach(viewModel.cards) { card in
                if !card.isFaceUp && card.isMatched {
                    Rectangle().opacity(0.0)
                } else {
                    CardView(card: card)
                        .aspectRatio(2/3 , contentMode: .fit)
                        .transition(AnyTransition.scale)
                        .onTapGesture {
                            withAnimation {
                                viewModel.choose(card)
                            }
                        }
                }
            }
            
        }
    }
    
    var shuffle: some View {
        Button {
            withAnimation {
                viewModel.shuffle()
            }
        } label: {
            Text("Shuffle")
                .foregroundColor(Color("Green"))
        }
        
    }
    
    var restart: some View {
        Button {
            withAnimation {
                viewModel.restart()
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
