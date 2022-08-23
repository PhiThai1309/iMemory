//
//  CardView.swift
//  Memory Game
//
//  Created by Phi Thai on 09/08/2022.
// https://github.com/SamuelDo02/swiftuitutorials/blob/main/Flashcard.swift

import Foundation
import SwiftUI

struct CardView: View {
    var card: CardModel.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader {
            geo in
            ZStack {
                if card.isConsumingBonusTime {
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 1 - animatedBonusRemaining * 360 - 90)).padding(5).opacity(0.3)
                        .onAppear {
                            animatedBonusRemaining = card.bonusRemaining
                            withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                animatedBonusRemaining = 0
                            }
                        }
                } else {
                    
                }
                
                Text(card.content).font(.largeTitle)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
                    .animation(Animation.easeInOut(duration: 1))
                    .scaleEffect(Scale(size: geo.size))
            }
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        }
    }
    
    private func Scale(size: CGSize) -> CGFloat {
        min(size.width, size.height) / (50/0.7)
    }
}
