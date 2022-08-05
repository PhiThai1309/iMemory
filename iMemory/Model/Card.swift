//
//  Card.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import Foundation

struct Card: Identifiable {
    var id: Int
    
    var isFaceUp: Bool = true
    var isMatched: Bool = false
    var content: String
}
