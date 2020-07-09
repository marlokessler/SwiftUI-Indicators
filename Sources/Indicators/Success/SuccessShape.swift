//
//  SuccessShape.swift
//  Indicators
//
//  Created by Marlo Kessler on 07.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct SuccessShape: CircularIndicatorShape {

    var progress: Double

    init(_ progress: Double) {
        self.progress = progress
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addPath(circlePath(in: rect, for: progress))
        path.addPath(successPath(in: rect, for: progress))
        return path
    }
    
    func successPath(in rect: CGRect, for progress: Double) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        
        var path = Path()

        // A normalized progress variable from 0...1 between the total progress of 0...1/3.
        let downlineProgress: CGFloat = progress < 1/3
                                        ? CGFloat(progress) * 3
                                        : 1
        
        let startX = center.x - radius/2
        let startY = center.y + radius/8
        path.move(to: CGPoint(x: startX, y: startY))
        
        let tX = center.x - radius/(2 + 2*downlineProgress)
        let tY = center.y + radius/8 + radius/4 * downlineProgress
        path.addLine(to: CGPoint(x: tX, y: tY))
        
        if progress > 1/3 {
            // A normalized progress variable from 0...1 between the total progress of 1/3<..1.
            let uplineProgress: CGFloat = (CGFloat(progress) - 1/3) * 1.5
            
            let endX = center.x - radius/4 + (3 * radius/4)*uplineProgress
            let endY = center.y + radius/4 + radius/8 - (3 * radius/4)*uplineProgress
            path.addLine(to: CGPoint(x: endX, y: endY))
        }
        
        return path
    }

    var animatableData: Double {
        get { return progress }
        set { progress = newValue }
    }
}
