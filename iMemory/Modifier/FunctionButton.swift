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

//Button modifiers for game button
struct FunctionButotn: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
