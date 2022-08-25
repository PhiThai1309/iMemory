//
//  UserRegister.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
 
import SwiftUI

struct WinView: View {
    @ObservedObject var memoryGame: GameVM
    
    private var check: Int
    var gameMode: Int
    
    init(memoryGame: GameVM = GameVM(randomNumOfPairs: 5), check: Int, gameMode: Int) {
        self.memoryGame = GameVM(randomNumOfPairs: gameMode)
        self.check = check
        self.gameMode = gameMode
    }
    
    var body: some View {
        if gameMode == check {
            ZStack {
                Color.black.opacity(gameMode == check ? 0.9 : 0).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Green")
                    VStack{
                        Text("You win")
                    }
                    .padding()
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            }
        }
    }
}
