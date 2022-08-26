//
//  ContentView.swift
//  iMemory
//
//  Created by Phi Thai on 05/08/2022.
// https://stackoverflow.com/questions/61930915/swiftui-detecting-the-navigationview-back-button-press

import SwiftUI
import AVFoundation

//Game view
struct GameView: View {
    @ObservedObject var userModel: UserVM = UserVM()
    @ObservedObject var memoryGame: GameVM
    
    @State var userName = ""
    @State var show = false
    @State var gameMode: Int
    @State var buttonClickCheck: Bool
    
    init(memoryGame: GameVM = GameVM(randomNumOfPairs: 5), gameMode: Int, userName: String = "", show: Bool = false, buttonClickCheck: Bool = false) {
        self.userModel = UserVM()
        self.memoryGame = GameVM(randomNumOfPairs: gameMode)
        self.userName = userName
        self.show = show
        self.gameMode = gameMode
        self.buttonClickCheck = buttonClickCheck
    }
    
    //This render a grid view of cards
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color("Purple")
                .ignoresSafeArea()
            VStack {
                //Information at the top of the screen
                HStack {
                    Text("Welcome: \(userName)")
                    Spacer()
                    Text("Score: \(memoryGame.getScore())")
                        .modifier(TextModifier())
                }
                
                //Show game body
                gameBody
                Spacer()
                
                //Show two button at the bottom of the screen
                HStack{
                    shuffle
                    restart
                }
                .padding(.horizontal)
            }
            .padding(20)
            .foregroundColor(Color("Card"))
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text(""), displayMode: .inline)
            
            //Replace back button with customize one
            .navigationBarItems(leading: BackButtonView(name: userName, game: memoryGame, userModel: userModel, buttonCheck: buttonClickCheck))
            
            //Overlap User register and Win view with condition check
            UserRegisterView(name: $userName ,userModel: userModel, buttonCheck: $buttonClickCheck, show: $show)
            WinView(check: memoryGame.getCheck(), gameMode: gameMode)
            //Play a sound when this view appear
                .onAppear {
                    playSound(sound: "level-win", type: "mp3")
                }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
        //Play and stop background sound on appear and on dissapear
        .onAppear {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "game")
        }
        .onDisappear {
            MusicPlayer.shared.stopBackgroundMusic()
        }
        
        
    }
    
    //Game body view here
    var gameBody: some View {
        Grid(items: memoryGame.cards, aspectRatio: 2/3, content: {
            card in
            !card.isFaceUp && card.isMatched ?  AnyView(rec()) : AnyView(checkMatch(card: card))
        })
    }
    
    //If is two cards matched, hide this card
    func rec() -> some View {
        Rectangle().opacity(0.0)
    }
    
    //function to render the cards
    func checkMatch(card: CardModel.Card) -> some View{
        CardView(card: card)
            .transition(AnyTransition.scale)
            .onTapGesture {
                withAnimation {
                    memoryGame.choose(card)
                }
            }
    }
    
    //Shuffle button here
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
    
    //Restart button here
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

//Customize back button
struct BackButtonView: View {
    var name: String
    @ObservedObject var game: GameVM
    @ObservedObject var userModel: UserVM
    var buttonCheck: Bool
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(
            action: {
                //Check if the user have clicked the play game button from the register view
                if(buttonCheck) {
                    userModel.addPoint(game.getScore())
                }
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color("Gray"))
                //                    .font(Font.title.weight(.medium))
                Text("Return")
                    .foregroundColor(Color("Gray"))
                //                    .font(Font.title.weight(.medium))
            }
        )
    }
}
