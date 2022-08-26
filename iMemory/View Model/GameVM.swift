//
//  ModelView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import Foundation
import SwiftUI

//Game View Model
class GameVM: ObservableObject {
    //Initialize emojis and number of cards
    @State var emojis = ["👻", "🍉", "🍤", "🧆", "🍑", "🍲", "🍱", "🍙", "🍌", "🥘"]
    @Published var randomNumberOfPairs: Int

    //Call Card model
    @Published private var model: CardModel
    
    //Create an array of cards from Card model
    var cards: Array<CardModel.Card> {
        model.cards
    }
    
    //Create the game
    func createMemoryGame() {
        self.model = CardModel(numberOfPairsOfCards: randomNumberOfPairs) {
                pairIndex in emojis[pairIndex]
            }
            
    }
    
    //Initialize Game view model
    init(emojis: [String] = ["👻", "🍉", "🍤", "🧆", "🍑", "🍲", "🍱", "🍙", "🍌", "🥘"], randomNumOfPairs: Int){
        self.emojis = emojis
        self.randomNumberOfPairs = randomNumOfPairs
        self.model = CardModel(numberOfPairsOfCards: randomNumOfPairs) {
                pairIndex in emojis[pairIndex]
            }
    
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
    
    //Check to find all of the cards has been matched
    func getCheck() -> Int {
        return model.getCheck()
    }
}


