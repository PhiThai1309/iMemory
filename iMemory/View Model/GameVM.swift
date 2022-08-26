/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 05/08/2022
  Last modified: 26/08/2022
  Acknowledgement: N/A
*/

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
    
    //Shuffle call in Model
    func shuffle() {
        model.shuffle()
    }
    
    //Restart call in model and shuffle
    func restart() {
        shuffle()
        createMemoryGame()
    }
    
    //Get score from model
    func getScore() -> Int {
        return model.getScore()
    }
    
    //Check to find all of the cards has been matched
    func getCheck() -> Int {
        return model.getCheck()
    }
}


