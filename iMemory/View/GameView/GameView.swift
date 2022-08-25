//
//  ContentView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
// https://stackoverflow.com/questions/61930915/swiftui-detecting-the-navigationview-back-button-press

import SwiftUI
import AVFoundation

struct GameView: View {
    @ObservedObject var userModel: UserVM = UserVM()
    @ObservedObject var memoryGame: GameVM
    
    @State var userName = ""
    @State var show = false
    @State var gameMode: Int
    
    init(memoryGame: GameVM = GameVM(randomNumOfPairs: 5), gameMode: Int, userName: String = "", show: Bool = false) {
        self.userModel = UserVM()
        self.memoryGame = GameVM(randomNumOfPairs: gameMode)
        self.userName = userName
        self.show = show
        self.gameMode = gameMode
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    var body: some View {
        ZStack {
            Color("Purple")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Welcome: \(userName)")
                    Spacer()
                    Text("Score: \(memoryGame.getScore())")
                        .modifier(TextModifier())
                }
                gameBody
                Spacer()
                HStack{
                    shuffle
                    restart
                }
                .padding(.horizontal)
            }
            .padding(20)
            .foregroundColor(Color("Card"))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: DetailView(name: userName, game: memoryGame, userModel: userModel))
            UserRegisterView(name: $userName ,userModel: userModel, show: $show)
            WinView(check: memoryGame.getCheck(), gameMode: gameMode)
                .onAppear {
                    playSound(sound: "level-win", type: "mp3")
                }
        }
        .onAppear {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "game")
        }
        .onDisappear {
            MusicPlayer.shared.stopBackgroundMusic()
        }
        
        
    }
    
    var gameBody: some View {
        LazyVGrid(columns: columns){
            ForEach(memoryGame.cards) { card in
                if !card.isFaceUp && card.isMatched {
                    Rectangle().opacity(0.0)
                } else {
                    CardView(card: card)
                        .aspectRatio(2/3 , contentMode: .fit)
                        .transition(AnyTransition.scale)
                        .onTapGesture {
                            withAnimation {
                                memoryGame.choose(card)
                            }
                        }
                }
            }
            
        }
    }
    
    var shuffle: some View {
        Button {
            withAnimation {
                memoryGame.shuffle()
            }
        } label: {
            Text("Shuffle")
                .foregroundColor(Color("Green"))
        }
        
    }
    
    var restart: some View {
        Button {
            withAnimation {
                memoryGame.restart()
            }
        }  label: {
            Text("Restart")
                .foregroundColor(Color("Green"))
        }
    }
}

struct DetailView: View {
    var name: String
    @ObservedObject var game: GameVM
    @ObservedObject var userModel: UserVM
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(
            action: {
                if(name != "") {
                    userModel.addPoint(game.getScore())
                }
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color("Green"))
            }
        )
    }
}
