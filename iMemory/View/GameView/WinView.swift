/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Thai Manh Phi
 ID: s3878070
 Created  date: 23/08/2022
 Last modified: 26/08/2022
 Acknowledgement: N/A
 */

import SwiftUI

//Win view to check whenever user have matched all cards
struct WinView: View {
    var check: Int
    var gameMode: Int
    var score: Int
    
    var body: some View {
        if gameMode == check {
            ZStack {
                Color.black.opacity(gameMode == check ? 0.9 : 0).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Green")
                    ZStack {
                        Image("Win")
                            .opacity(0.7)
                        VStack{
                            Text("You win")
                                .font(.system(.largeTitle, design: .rounded))
                                .fontWeight(.bold)
                            Text("Your score: \(self.score)")
                        }
                        .padding()
                    }
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            }
        }
    }
}
