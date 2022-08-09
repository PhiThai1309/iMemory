////
////  CardView.swift
////  iMemory
////
////  Created by Phi Thai on 05/08/2022.
////https://www.youtube.com/watch?v=v2Xf1gwcQSA
//
//import Foundation
//import SwiftUI
//
//struct CardViewOld: View {
//    var card: Card
//    @State var rotation: Double = 0
//    @State var isFaceUp = false
//    var emojiGame: MemoryGame
//    var isMatch: Bool
//    
//    var body: some View {
//        ZStack {
//            if(isFaceUp) {
//                Section{
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white)
//                        RoundedRectangle(cornerRadius: 10).stroke().fill(Color.orange)
//                        Text(card.content)
//                    }
//                }
//                .opacity(isMatch ? 0.0 : 1.0)
//            } else {
//                RoundedRectangle(cornerRadius: 10).foregroundColor(Color.orange)
//                    .opacity(isMatch ? 0.0 : 1.0)
//            }
//        }
//        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
//        .onTapGesture {
//            flipFlashcard()
//            emojiGame.choose(card: card)
//            print(emojiGame.cards)
//            print(card.isMatched)
//        }
//        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
//        //            .rotation3DEffect(Angle.degrees(rotation), axis: (x: 0, y: 1, z: 0))
//    }
//    
//    func flipFlashcard() {
//        let animationTime = 0.5
//        withAnimation(Animation.linear(duration: animationTime)) {
//            rotation += 180
//        }
//        
//        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
//            rotation += 180
//            isFaceUp.toggle()
//        }
//    }
//}
