//
//  NavigationView.swift
//  iMemory
//
//  Created by Phi Thai on 26/08/2022.
//

import SwiftUI

//Game button view
struct GameMode: View {
    var gameMode: Int
    var tag: Int
    @Binding var action: Int?
    var title: String
    
    var body: some View {
        NavigationLink(destination: GameView(gameMode: gameMode), tag: tag, selection: $action) {
            Button {
                self.action = tag
                playSound(sound: "click", type: "wav")
                
            } label: {
                Text(title)
                    .padding(5)
            }
            .modifier(GameButton())
        }
    }
}
