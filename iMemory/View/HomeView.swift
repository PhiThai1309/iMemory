//
//  HomeView.swift
//  iMemory
//
//  Created by Phi Thai on 20/08/2022.
//

import SwiftUI

struct HomeView: View {
    let memoryGame = MemoryGame()
    
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView {
            //            NavigationLink("Start", destination: ContentView(viewModel: memoryGame))
            VStack {
                NavigationLink(destination: ContentView(viewModel: memoryGame), tag: 1, selection: $action) {
                    Button("Button"){
                        self.action = 1
                    }
                }
                .navigationTitle("iMemory")
                
                //            Button("Start")
                //            Button("Leaderboard")
                //            Button("How to play")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
