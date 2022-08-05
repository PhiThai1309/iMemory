//
//  CardModel.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import Foundation
import SwiftUI

struct CardModel {
    var cards: Array<Card>
    var numberOfPairs: Int
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        numberOfPairs = numberOfPairsOfCards
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = contentFactory(pairIndex)
            
            // append two cards (a pair) to the array of cards
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2+1, content: content))
        }
        
        cards.shuffle()
    }
    
    func chooseCard(card: Card) {
        print("\(card)")
    }
}

var emojis = ["👻", "🧟‍♂️", "🧙🏻‍♂️", "🎃", "🕸"]
var randomNumberOfPairs = 4
