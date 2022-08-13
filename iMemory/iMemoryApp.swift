//
//  iMemoryApp.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import SwiftUI

@main
struct iMemoryApp: App {
    let memoryGame = MemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: memoryGame)
        }
    }
}
