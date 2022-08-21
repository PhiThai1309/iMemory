//
//  Pie.swift
//  iMemory
//
//  Created by Phi Thai on 20/08/2022.
//https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
//https://github.com/Asperi-Demo/4SwiftUI/blob/master/PlayOn_iOS/PlayOn_iOS/Findings/TestPieProgress.swift

import Foundation
import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    var animatableData: AnimatablePair<Double, Double> {
        get{
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set{
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.width - 15)
        let radius = min(rect.width, rect.height) / 2
        
        let start = CGPoint (
            x: center.x + radius + CGFloat(cos(startAngle.radians)),
            y: center.y + radius + CGFloat(sin(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
//        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
//        p.addLine(to: center)
        p.closeSubpath()
        return p
    }
}
