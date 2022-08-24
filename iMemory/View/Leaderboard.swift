//
//  Leaderboard.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
//

import SwiftUI

struct Leaderboard: View {
    @ObservedObject var userModel: UserModelMV
    
    var body: some View {
        ForEach(userModel.getUsers(), id: \.self) {
            user in
            Text(user)
        }
    }
}

