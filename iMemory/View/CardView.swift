//
//  CardView.swift
//  Memory Game
//
//  Created by Phi Thai on 09/08/2022.
//

import Foundation
import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card
    
    let width: Int = 80

    @Binding var MatchedCard:[Card]
    @Binding var UserChoices:[Card]
    var body: some View {
        if !MatchedCard.contains(where: {$0.id == card.id}) {
            if card.isFaceUp {
                Text(card.content)
                .font(.system(size: CGFloat(width - 40)))
                .frame(width: CGFloat(width), height: CGFloat(width))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 5))
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red)
                    .frame(width: CGFloat(width), height: CGFloat(width))
                    .onTapGesture {
                        print(card.isFaceUp)
                        if UserChoices.count == 0 {
                            card.turnOver()
                            UserChoices.append(card)
                        } else if UserChoices.count == 1 {
                            card.turnOver()
                            UserChoices.append(card)
                            withAnimation(Animation.linear.delay(1)) {
                                for thisCard in UserChoices {
                                    thisCard.turnOver()
                                }
                            }
                            checkForMatch()
                        }
                    }
            }
        } else {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 0, height: 0)
        }
    }
    
    func checkForMatch() {
        if UserChoices[0].content == UserChoices[1].content {
            MatchedCard.append(UserChoices[0])
            MatchedCard.append(UserChoices[1])
            
        }
        UserChoices.removeAll()
    }
}
