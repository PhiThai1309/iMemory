//
//  Array.swift
//  iMemory
//
//  Created by Phi Thai on 26/08/2022.
//

import Foundation

//Add functionalities for array
extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {    // return value is an Optional
        for index in 0 ..< self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
