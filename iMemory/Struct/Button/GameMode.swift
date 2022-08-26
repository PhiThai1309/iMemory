/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 26/08/2022
  Last modified: 26/08/2022
  Acknowledgement: N/A
*/

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
