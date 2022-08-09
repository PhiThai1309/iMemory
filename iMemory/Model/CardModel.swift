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
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set {
            for index in cards.indices {
                    cards[index].isFaceUp = index == newValue
            }
        }
        
    }
    
    mutating func chooseCard(card: Card) {
        if let choosenIndex = cards.firstIndex(matching: card), !card.isFaceUp, !card.isMatched {
//            print(choosenIndex)
            
            if let lastChoosenIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[lastChoosenIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[lastChoosenIndex].isMatched = true
                }
                cards[choosenIndex].isFaceUp = true
//                print(cards)
            } else {
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
//            print(cards[choosenIndex].isFaceUp)
        }
//        print("\(card)")
    }
}

var emojis = ["👻", "🧟‍♂️", "🧙🏻‍♂️", "🎃", "🕸"]
var randomNumberOfPairs = 4


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
