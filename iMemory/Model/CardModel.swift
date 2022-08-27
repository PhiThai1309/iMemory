/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 05/08/2022
  Last modified: 26/08/2022
  Acknowledgement:
 1. https://github.com/DanielMartinezC/memorize-ios/blob/master/Memorize/Models/MemoryGame.swift
*/

import Foundation
import SwiftUI
import AVFoundation

//Card Model
struct CardModel {
    private(set) var cards: Array<Card>
    private(set) var score: Int
    private(set) var check: Int
    
    private var indexOfFacingUpCard: Int?
    private var numberOfPairsOfCards: Int
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        score = 0
        check = 0
        self.numberOfPairsOfCards = numberOfPairsOfCards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = contentFactory(pairIndex)
            // append two cards (a pair) to the array of cards
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    //Logic for choosing cards and calculating scores
    mutating func choose(card: Card){
        if let idx = cards.firstIndex(where: {$0.id == card.id}), !cards[idx].isFaceUp, !cards[idx].isMatched{
            if let potentialMatchIndex = indexOfFacingUpCard {
                if cards[potentialMatchIndex].content == cards[idx].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[idx].isMatched = true
                    if(numberOfPairsOfCards > 6) {
                        changeScore(to: score + MATCH_POINT + Int(6 - cards[potentialMatchIndex].pastTime))
                    } else {
                        changeScore(to: score + MATCH_POINT)
                    }
                    win()
                    playSound(sound: "success", type: "mp3")
                } else if score - 5 > 1 && numberOfPairsOfCards == 10{
                    changeScore(to: score + MISMATCH_POINT)
                } else {
                    playSound(sound: "failure", type: "mp3")
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
    
    //Shuffle the array of cards
    mutating func shuffle() {
        cards.shuffle()
    }
    
    //Check for matching pairs of cards
    func getCheck() -> Int {
        return check
    }
    
    //MARK: -Game Score
    func getScore() -> Int {
        return score
    }
    
    //change score by adding or subtracting inside game logic
    mutating func changeScore(to newScore: Int) {
        score = newScore
    }
    
    //Calcutaing matched pair of cards
    mutating func win() {
        check += 1
    }

    //MARK: -Card Model
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
        
        //Check for bonus time remaining
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        //check for bonus remaining
        var bonusRemaining: Double {
            return (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        //check for using bonus time
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        //Function to start bonus time
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil  {
                lastFaceUpDate = Date()
            }
        }
        
        //function to stop bonus time
        private mutating func stopUsingBonusTime() {
            pastTime = faceUpTime
            lastFaceUpDate = nil
        }
    }
    
    
    let MATCH_POINT = 10
    let MISMATCH_POINT = -5
}
