//
//  UserRegister.swift
//  iMemory
//
//  Created by Phi Thai on 23/08/2022.
//

import SwiftUI

struct UserRegister: View {
    let memoryGame = MemoryGame()
    
    @State var name = ""
    @State private var action: Int? = 0
    
    @Binding var show: Bool
    
    var body: some View {
        if !show {
            ZStack {
                Color.black.opacity(!show ? 0.9 : 0).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Green")
                    VStack{
                        Text("Register: ")
                        TextField(
                            "Placeholder text",
                            text: $name
                        )
                        
                        Button {
                            show = true
                        } label: {
                            Text("Play game")
                                .padding(5)
                        }
                        .buttonStyle(.borderedProminent)
                        
                    }
                    .padding()
                }
                .frame(width: 300, height: 500)
                .cornerRadius(20)
            }
        }
    }
}

struct UserRegister_Previews: PreviewProvider {
    static var previews: some View {
        UserRegister(show: .constant(true))
            .previewDevice("iPhone 11")
    }
}
