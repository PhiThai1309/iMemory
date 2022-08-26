/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 23/08/2022
  Last modified: 26/08/2022
  Acknowledgement:
 1. https://serialcoder.dev/text-tutorials/swiftui/using-the-appstorage-property-wrapper-in-swiftui/
 2. https://cocoacasts.com/ud-3-how-to-store-an-array-in-user-defaults-in-swift
 3. https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults
*/

import Foundation
import SwiftUI

struct UserModel {
    private(set) var user: [String]
    private(set) var point: [Int]
    
    private let database = UserDefaults.standard
    
    //Initialize and store the data in userdefaults
    init() {
        user = database.object(forKey: "User") as? [String] ?? []
        point = database.object(forKey: "Point") as? [Int] ?? []
    }
    
    //Get all users
    func getUsers() -> [String] {
        return user
    }
    
    //Get all points
    func getPoints() -> [Int] {
        return point
    }
    
    //Add user into the array
    mutating func addUser(_ info: String) {
        user.append(info)
        database.set(user, forKey: "User")
        print(user)
    }
    
    //Add point into the array
    mutating func addPoint(_ score: Int) {
        point.append(score)
        database.set(point, forKey: "Point")
        print(point)
    }
    
    //Get the point from a specific user
    func getPoint(name: String) -> Int {
        let index = user.firstIndex(of: name) ?? 0
        return point[index]
    }
    
    mutating func updateLastPoint(point: Int) {
        let idx = user.count - 1
        self.point[idx] = point
        database.set(self.point, forKey: "Point")
    }
}
