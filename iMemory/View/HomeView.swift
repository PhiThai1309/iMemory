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
    @State var show = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Purple")
                    .ignoresSafeArea()
                Image("Card-img")
                    .resizable()
                    .frame(width:500, height: 500)
                VStack {
                    Text("iMemory")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .modifier(TextModifier())
                    Spacer()
                    HStack {
                        NavigationLink(destination: ContentView(viewModel: memoryGame, show: $show), tag: 1, selection: $action) {
                            Button {
                                self.action = 1
                            } label: {
                                Text("Play game")
                                    .padding(5)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        NavigationLink(destination: HowToPlay(), tag: 2, selection: $action) {
                            Button{
                                self.action = 2
                            }label: {
                                Text("How to play")
                                    .padding(5)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    NavigationLink(destination: Leaderboard(), tag: 3, selection: $action) {
                        Button {
                            self.action = 3
                        } label: {
                            Text("Leaderboard")
                                .padding(5)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
