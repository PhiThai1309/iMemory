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

//Text modifiers for main text
struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("White"))
            .font(.system(.title3, design: .rounded))
    }
}
