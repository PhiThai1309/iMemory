//
//  Leaderboard.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
//

import SwiftUI

struct Leaderboard: View {
    @ObservedObject var userModel: UserVM = UserVM()
    
    var body: some View {
//        let point = userModel.getPoint(name: "Phi")
        let point = userModel.getPoints()
        let user = userModel.getUsers()
        Group {
            if user.count > 0 && point.count > 0 {
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
                Text("No current user")
            }
        }
        .navigationTitle("Leaderboard")
        
    }
}

