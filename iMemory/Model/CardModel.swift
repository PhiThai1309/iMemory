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
    private(set) var score: Int
    
    private var indexOfFacingUpCard: Int?
    private var numberOfPairsOfCards: Int
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        score = 0
        self.numberOfPairsOfCards = numberOfPairsOfCards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = contentFactory(pairIndex)
            // append two cards (a pair) to the array of cards
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        if let idx = cards.firstIndex(where: {$0.id == card.id}), !cards[idx].isFaceUp, !cards[idx].isMatched{
            if let potentialMatchIndex = indexOfFacingUpCard {
                if cards[potentialMatchIndex].content == cards[idx].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[idx].isMatched = true
                    if(numberOfPairsOfCards > 6) {
                        changeScore(to: score + MATCH_POINT_CHANGE + Int(6 - cards[potentialMatchIndex].pastTime))
                    } else {
                        changeScore(to: score + MATCH_POINT_CHANGE)
                    }
                } else if score > 1 && numberOfPairsOfCards == 10{
                    changeScore(to: score + MISMATCH_POINT_CHANGE)
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
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    //MARK: Game Score
    func getScore() -> Int {
        return score
    }
    
    mutating func changeScore(to newScore: Int) {
        score = newScore
    }
    
    //MARK: Card Model
    struct Card: Hashable, Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                }
                else {
                    stopUsingBonusTime()
                }
            }
        }
        var isMatched: Bool = false
        {
            didSet {
                stopUsingBonusTime()
            }
        }
        var content: String
        
        //MARK: -Bonus Time
        var bonusTimeLimit: TimeInterval = 6
        
        //The last time this card face up
        var pastTime: TimeInterval = 0
        
        var lastFaceUpDate: Date?
        
        
        
        //The accumulated time this card has turned face up
        
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return TimeInterval(0)
            }
        }
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        var bonusRemaining: Double {
            return            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        var bonusPoint: Int {
            Int(bonusTimeLimit - pastTime)
        }
        
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil  {
                lastFaceUpDate = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastTime = faceUpTime
            lastFaceUpDate = nil
        }
    }
    
    let MATCH_POINT_CHANGE = 10
    let MISMATCH_POINT_CHANGE = -5
    let MAX_BONUS_POINT = 6
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
