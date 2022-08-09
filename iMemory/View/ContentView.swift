//
//  ContentView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var emojiGame: MemoryGame
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(emojiGame.cards) { card in
                CardView(card: card, MatchedCard: $MatchedCards, UserChoices: $UserChoices)
                    .aspectRatio(0.66, contentMode: .fit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiGame: MemoryGame())
            .previewDevice("iPhone 11")
    }
}
