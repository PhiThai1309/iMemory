//
//  CardModel.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import Foundation
import SwiftUI

struct CardModel {
    private(set) var cards: Array<Card>
//    var numberOfPairs: Int
    
    private var indexOfFacingUpCard: Int?
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = contentFactory(pairIndex)
            
            // append two cards (a pair) to the array of cards
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        if let idx = cards.firstIndex(where: {$0.id == card.id}), !cards[idx].isFaceUp, !cards[idx].isMatched{
            if let potentialMatchIndex = indexOfFacingUpCard {
                if cards[potentialMatchIndex].content == cards[idx].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[idx].isMatched = true
                }
                indexOfFacingUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFacingUpCard = idx
            }
            cards[idx].isFaceUp.toggle()
        }
    }
    
    struct Card: Hashable, Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: String
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {    // return value is an Optional
        for index in 0 ..< self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
