/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 23/08/2022
  Last modified: 26/08/2022
  Acknowledgement: N/A
*/

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

