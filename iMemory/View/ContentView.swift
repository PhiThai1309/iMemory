//
//  ContentView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoryGame
    
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3 , contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    let emoji = MemoryGame()
//    static var previews: some View {
//        ContentView(viewModel: emoji)
//            .previewDevice("iPhone 11")
//    }
//}
