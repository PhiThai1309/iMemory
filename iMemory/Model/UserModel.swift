//
//  User.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
// https://serialcoder.dev/text-tutorials/swiftui/using-the-appstorage-property-wrapper-in-swiftui/
// https://cocoacasts.com/ud-3-how-to-store-an-array-in-user-defaults-in-swift
// https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults

import Foundation
import SwiftUI

struct UserModel {
    private(set) var user: [String]
    private(set) var point: [Int]
    
    private let database = UserDefaults.standard
    
    init() {
        user = database.object(forKey: "User") as? [String] ?? []
        point = database.object(forKey: "Point") as? [Int] ?? []
    }
    
    func getUsers() -> [String] {
        return user
    }
    
    func getPoints() -> [Int] {
        return point
    }
    
    mutating func addUser(_ info: String) {
        user.append(info)
        database.set(user, forKey: "User")
        print(user)
    }
    
    mutating func addPoint(_ score: Int) {
        point.append(score)
        database.set(point, forKey: "Point")
        print(point)
    }
    
//    func getUser(name: String) -> String{
//        let index = user.firstIndex(of: name) ?? 0
//        return user[index]
//    }
    
    func getPoint(name: String) -> Int {
        let index = user.firstIndex(of: name) ?? 0
//        print(point[index] ?? 0)
        return point[index]
    }
}
