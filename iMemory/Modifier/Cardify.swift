/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 20/08/2022
  Last modified: 27/08/2022
  Acknowledgement:
 1. https://github.com/DanielMartinezC/memorize-ios/blob/master/Memorize/ViewModifiers/Cardify.swift
*/

import SwiftUI

//Card modifiers for each card in the game
struct Cardify: AnimatableModifier {
    var rotation: Double
    
    //Initialize the struct of Cardify
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get{rotation}
        set{rotation = newValue }
    }
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                
            } else {
                shape.fill()
            }
            content
                .opacity(rotation < 90 ? 1: 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
}
