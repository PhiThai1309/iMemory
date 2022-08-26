//
//  FunctionButton.swift
//  iMemory
//
//  Created by Phi Thai on 26/08/2022.
//

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
