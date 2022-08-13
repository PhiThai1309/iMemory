//
//  CardView.swift
//  Memory Game
//
//  Created by Phi Thai on 09/08/2022.
// https://github.com/SamuelDo02/swiftuitutorials/blob/main/Flashcard.swift

import Foundation
import SwiftUI

struct CardView: View {
    var card: CardModel.Card
    
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.orange)
            }
        }
    }
}
