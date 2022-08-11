//
//  Card.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import Foundation

class Card: Identifiable, ObservableObject {
    var id: Int
    
    @Published var isFaceUp: Bool = false
    @Published var isMatched: Bool = false
    @Published  var content: String
    
    init(id: Int, content: String) {
        self.id = id
        self.content = content
    }
    
    func turnOver() {
        self.isFaceUp.toggle()
    }
    
    func matched() {
        self.isMatched = true
    }
}

