//
//  UserRegister.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
// https://codewithchris.com/swiftui/swiftui-textfield/
// https://sarunw.com/posts/textfield-in-swiftui/
// https://www.simpleswiftguide.com/swiftui-textfield-complete-tutorial/
 
import SwiftUI

struct UserRegister: View {
    @Binding var name: String
    @State private var action: Int? = 0
    @State private var already = false
    @ObservedObject var userModel: UserModelMV
    
    @Binding var show: Bool
    
    var body: some View {
        if !show {
            ZStack {
                Color.black.opacity(!show ? 0.9 : 0).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Green")
                    VStack{
                        Text("Register: \(name)")
                        HStack {
                            Text("User name: ")
                            TextField(
                                "Placeholder text",
                                text: $name
                            )
                        }
                        Spacer()
                        if(already) {
                            Text("User already exist, please register with a different name")
                        } else {}
                        Button {
                            if(userModel.getUsers().contains(name)) {
                                already = true
                            } else if (name == "") {
                                show = true;
                            }
                            else {
                                show = true
                                userModel.addUser(name)
                            }
                        } label: {
                            Text("Play game")
                                .padding(5)
                        }
                        .buttonStyle(.borderedProminent)
                        
                    }
                    .padding()
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            }
        }
    }
}
