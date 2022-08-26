//
//  TextModifier.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
//

import SwiftUI

//Text modifiers for main text
struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("White"))
    }
}
