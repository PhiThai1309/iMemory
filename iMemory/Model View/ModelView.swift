//
//  ModelView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import Foundation
import SwiftUI

class MemoryGame {
    private var model: CardModel = MemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> CardModel {
        return CardModel(numberOfPairsOfCards: randomNumberOfPairs) {
            pairIndex in emojis[pairIndex]
        }
    }
    
    // MARK: - Acces to model
    
    // this will expose cards from model to be used by the View (ContentView)
    var cards: Array<Card> {
        model.cards
    }
    
    var pairs: Int {
        model.numberOfPairs
    }
    
    // MARK: - Intent(s)
    
    // this will expose methods to be used by the View to interact with the Model's cards
    func choose(card: Card) {
        model.chooseCard(card: card)
    }
    
}


