//
//  HomeView.swift
//  iMemory
//
//  Created by Phi Thai on 20/08/2022.
// https://stackoverflow.com/questions/43402032/how-to-remove-all-userdefaults-data-swift

import SwiftUI
import AVFoundation

struct HomeView: View {
    var user = UserDefaults.standard.object(forKey: "Continue") as? [String] ?? []
    
    init() {
                UserDefaults.standard.set("", forKey: "User")
                UserDefaults.standard.set("", forKey: "Point")
    }
    
    @State private var action: Int? = 0
    
    
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Purple")
                    .ignoresSafeArea()
//                Image("Card-img")
//                    .resizable()
//                    .frame(width:500, height: 500)
                VStack {
                    Text("iMemory")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .modifier(TextModifier())
                    Spacer()
                    Text("Choose a game mode")
                        .modifier(TextModifier())
                    NavigationLink(destination: GameView(gameMode: 4), tag: 1, selection: $action) {
                        Button {
                            self.action = 1
//                            AudioServicesPlaySystemSound(1110)
                            playSound(sound: "click", type: "wav")
                        } label: {
                            Text("EASY")
                                .padding(5)
                        }
                        .modifier(GameButton())
                    }
                    NavigationLink(destination: GameView(gameMode: 8), tag: 4, selection: $action) {
                        Button {
                            self.action = 4
//                            AudioServicesPlaySystemSound(1110)
                            playSound(sound: "click", type: "wav")
                        } label: {
                            Text("MEDIUM")
                                .padding(5)
                        }
                        .modifier(GameButton())
                    }
                    NavigationLink(destination: GameView(gameMode: 10), tag: 5, selection: $action) {
                        Button {
                            self.action = 5
//                            AudioServicesPlaySystemSound(1110)
                            playSound(sound: "click", type: "wav")
                        } label: {
                            Text("HARD")
                                .padding(5)
                        }
                        .modifier(GameButton())
                    }
                    Spacer()
                    HStack {
                        NavigationLink(destination: HowToPlay(), tag: 2, selection: $action) {
                            Button{
                                self.action = 2
//                                AudioServicesPlaySystemSound(1110)
                                playSound(sound: "click", type: "wav")
                            }label: {
                                Text("How to play")
                                    .padding(5)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        NavigationLink(destination: Leaderboard(), tag: 3, selection: $action) {
                            Button {
                                self.action = 3
                                playSound(sound: "win", type: "mp3")
                            } label: {
                                Text("Leaderboard")
                                    .padding(5)
                            }
                            .buttonStyle(.borderedProminent)
                        }
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
