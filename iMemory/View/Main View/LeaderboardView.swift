//
//  Leaderboard.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
//

import SwiftUI

//Show past score from users
struct Leaderboard: View {
    @ObservedObject var userModel: UserVM = UserVM()
    
    var body: some View {
        let point = userModel.getPoints()
        let user = userModel.getUsers()
        Group {
            //check if the point array is equal to username array
            if user.count > 0 && point.count > 0 && point.count == user.count {
                ScrollView {
                    ForEach(userModel.getUsers().indices, id: \.self) { index in
                        HStack {
                            Text(user[index])
                            Spacer()
                            Text("\(point[index])")
                        }
                        .modifier(TextModifier())
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(Color("Purple"))
                        .cornerRadius(20)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color("Red")
                    .ignoresSafeArea())
            } else {
                //if there is no user
                Text("No current user")
            }
            
        }
        //start and stop background music
        .onAppear {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "grand-final-orchestral")
        }
        .onDisappear {
            MusicPlayer.shared.stopBackgroundMusic()
        }
        .navigationTitle("Leaderboard")
    }
}

