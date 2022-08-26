/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 24/08/2022
  Last modified: 26/08/2022
  Acknowledgement: N/A
*/
import Foundation
import SwiftUI

//Button modifiers for game button
struct GameButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150)
            .background(Color("Red-Wine"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Green"), lineWidth: 5)
            )
            .padding(5)
    }
}
