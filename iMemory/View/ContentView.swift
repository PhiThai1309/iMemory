//
//  ContentView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoryGame
    
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                gameBody
                Spacer()
                HStack{
                    shuffle
                    restart
                }
                .padding(.horizontal)
            }
        }
        
        .padding(20)
        .foregroundColor(.red)
        .navigationTitle("Game play")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:Group{Text("Score: \(viewModel.getScore())")})
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
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle() 
            }
        }
    }
    
    var restart: some View {
        Button("Restart") {
            withAnimation {
                viewModel.restart()
            }
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
