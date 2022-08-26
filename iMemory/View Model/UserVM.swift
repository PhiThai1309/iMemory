//
//  UserModelMV.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
//

import Foundation

//User view model
class UserVM: ObservableObject {
    @Published private var model = UserModel()
    
    //get users from User model
    func getUsers() -> [String] {
        model.getUsers()
    }

    //Get a user point from the User model
    func getPoint(name: String) -> Int {
        model.getPoint(name: name)
    }
    
    //Add more user in User Model
    func addUser(_ info: String) {
        model.addUser(info)
    }
    
    //Add point to the User model
    func addPoint(_ score: Int) {
        model.addPoint(score)
        print(score)
    }
    
    //Get all points from user model
    func getPoints() -> [Int] {
        model.getPoints()
    }
}
