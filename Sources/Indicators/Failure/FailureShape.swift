//
//  FailureShape.swift
//  Indicators
//
//  Created by Marlo Kessler on 07.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct FailureShape: CircularIndicatorShape {

    var progress: Double

    init(_ progress: Double) {
        self.progress = progress
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addPath(circlePath(in: rect, for: progress))
        path.addPath(failurePath(in: rect, for: progress))
        return path
    }
    
    func failurePath(in rect: CGRect, for progress: Double) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        
        var path = Path()

        // A normalized progress variable from 0...1 between the total progress of 0...0.5.
        let firstlineProgress: CGFloat = progress < 0.5
                                        ? CGFloat(progress) * 2
                                        : 1
        let fourth = radius/4
        let startX = center.x - fourth
        let startY = center.y - fourth
        path.move(to: CGPoint(x: startX, y: startY))
        
        let tX = center.x - fourth + 2*firstlineProgress*fourth
        let tY = center.y - fourth + 2*firstlineProgress*fourth
        path.addLine(to: CGPoint(x: tX, y: tY))
        
        
        if progress > 0.5 {
            // A normalized progress variable from 0...1 between the total progress of 0.5<..1.
            let uplineProgress: CGFloat = (CGFloat(progress) - 0.5) * 2
            
            path.move(to: CGPoint(x: center.x - fourth, y: center.y + fourth))
            path.addLine(to: CGPoint(x: center.x - fourth + 2*uplineProgress*fourth, y: center.y + fourth - 2*uplineProgress*fourth))
        }
        
        return path
    }

    var animatableData: Double {
        get { return progress }
        set { progress = newValue }
    }
}
