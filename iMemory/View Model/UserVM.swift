//
//  UserModelMV.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
//

import Foundation

class UserVM: ObservableObject {
    @Published private var model = UserModel()
    
    func getUsers() -> [String] {
        model.getUsers()
    }
    
//    func getUser(name: String) -> String {
//        model.getUser(name: name)
//    }
    
    func getPoint(name: String) -> Int {
        model.getPoint(name: name)
    }
    
    func addUser(_ info: String) {
        model.addUser(info)
    }
    
    func addPoint(_ score: Int) {
        model.addPoint(score)
        print(score)
    }
    
    func getPoints() -> [Int] {
        model.getPoints()
    }
    
    func changeScore(_ score: Int) {
        model.changeScore(score)
    }
}
