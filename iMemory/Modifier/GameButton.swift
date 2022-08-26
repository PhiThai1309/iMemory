//
//  GameButotn.swift
//  iMemory
//
//  Created by Phi Thai on 24/08/2022.
//

import Foundation
import SwiftUI

//Button modifiers for game button
struct GameButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150)
            .foregroundColor(.white)
            .background(Color("Card"))
            .cornerRadius(10)
    }
}
