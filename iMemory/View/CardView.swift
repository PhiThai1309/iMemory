//
//  CardView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//https://www.youtube.com/watch?v=v2Xf1gwcQSA

import Foundation
import SwiftUI

struct CardView: View {
    var card: Card
    var numberOfPairs: Int

    @State var flip: Bool = false
    @State var rotation = 0.0
    @State var contentRotate = 0.0
    
    var body: some View {
        ZStack {
            if flip {
                RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke().fill(Color.orange)
                Text(card.content).font(numberOfPairs == 5 ? Font.title : Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10).foregroundColor(Color.orange)
            }
        }
        .rotation3DEffect(.degrees(contentRotate), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            flipCard()
        }
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
    }
    
    func flipCard() {
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            rotation += 180.0
            
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotate += 180.0
            flip.toggle()
        }
    }
}
