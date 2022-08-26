/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 26/08/2022
  Last modified: 26/08/2022
  Acknowledgement:
 1. https://github.com/JohnSmithCoder1/ToddleTimeSwiftUI/blob/main/ToddleTimeSwiftUI/Grid.swift
 2. https://github.com/JohnSmithCoder1/ToddleTimeSwiftUI/blob/main/ToddleTimeSwiftUI/GridLayout.swift
*/

import SwiftUI

//Generate desire card size depends on screen size
struct Grid<ItemView>: View where ItemView: View {
    var items: [CardModel.Card]
    var aspectRatio: CGFloat
    var content: (CardModel.Card) -> ItemView
    
    var body: some View {
        //Read screen size
        GeometryReader {
            geo in
            let width: CGFloat = widthFit(itemCount: items.count, in: geo.size, aspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: width))]) {
                ForEach(items) {
                    item in
                    content(item).aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    //Find the best size for the card
    private func widthFit(itemCount: Int, in size: CGSize, aspectRatio: CGFloat) -> CGFloat {
        var colCount = 1
        var rowCount = itemCount
        repeat {
            let width = size.width / CGFloat(colCount)
            let height = (width / aspectRatio)
            if CGFloat(rowCount) * height < size.height {
                break
            }
            colCount += 1
            rowCount = (itemCount + (colCount - 1)) / colCount
        } while colCount < itemCount
        if colCount > itemCount {
            colCount = itemCount
        }
        return floor(size.width / CGFloat(colCount) - 10)
    }
}

