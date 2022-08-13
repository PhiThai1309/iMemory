//
//  ModelView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import Foundation
import SwiftUI

class MemoryGame: ObservableObject {
    static let emojis = ["👻", "🧟‍♂️", "🧙🏻‍♂️", "🎃", "🕸"]
    static let randomNumberOfPairs = 4

    @Published private var model: CardModel = MemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> CardModel {
        return CardModel(numberOfPairsOfCards: randomNumberOfPairs) {
            pairIndex in emojis[pairIndex]
        }
    }
    
    var cards: Array<CardModel.Card> {
        model.cards
    }
    
    
    // MARK: -Intents
    func choose(_ card: CardModel.Card) {
        model.choose(card: card)
    }
}


