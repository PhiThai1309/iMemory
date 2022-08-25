//
//  ModelView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import Foundation
import SwiftUI

class GameVM: ObservableObject {
    @State var emojis = ["👻", "🍉", "🍤", "🧆", "🍑", "🍲", "🍱", "🍙", "🍌", "🥘"]
    @Published var randomNumberOfPairs: Int

    @Published private var model: CardModel
    
    
    func createMemoryGame() {
        //        return CardModel(numberOfPairsOfCards: randomNumberOfPairs) {
        //            pairIndex in emojis[pairIndex]
        //        }
        
        self.model = CardModel(numberOfPairsOfCards: randomNumberOfPairs) {
                pairIndex in emojis[pairIndex]
            }
            
    }
    
    init(emojis: [String] = ["👻", "🍉", "🍤", "🧆", "🍑", "🍲", "🍱", "🍙", "🍌", "🥘"], randomNumOfPairs: Int){
        self.emojis = emojis
        self.randomNumberOfPairs = randomNumOfPairs
        self.model = CardModel(numberOfPairsOfCards: randomNumOfPairs) {
                pairIndex in emojis[pairIndex]
            }
    
    }
    
//    func getGameMode() -> [String]{
//        return MemoryGame.gameMode
//    }
    
    
    var cards: Array<CardModel.Card> {
        model.cards
    }
    
    
    // MARK: -Intents
    func choose(_ card: CardModel.Card) {
        model.choose(card: card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        shuffle()
        createMemoryGame()
    }
    
    func getScore() -> Int {
        return model.getScore()
    }
    
    func getCheck() -> Int {
        return model.getCheck()
    }
}


