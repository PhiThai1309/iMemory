//
//  ContentView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    var emojiGame: MemoryGame
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns){
                ForEach(emojiGame.cards) { card in
                    CardView(card: card, numberOfPairs: self.emojiGame.pairs)
                        .onTapGesture {
                            self.emojiGame.choose(card: card)
                        }
                        .aspectRatio(0.66, contentMode: .fit)
                }
            }
            Spacer()
            Button("Shuffle"){
                
            }
        }.padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiGame: MemoryGame())
            .previewDevice("iPhone 11")
    }
}
