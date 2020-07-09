//
//  InfoShape.swift
//  Indicators
//
//  Created by Marlo Kessler on 07.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct InfoShape: CircularIndicatorShape {

    var progress: Double

    init(_ progress: Double) {
        self.progress = progress
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addPath(circlePath(in: rect, for: progress))
        path.addPath(infoPath(in: rect, for: progress))
        return path
    }
    
    func infoPath(in rect: CGRect, for progress: Double) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        
        var path = Path()
        
        let eigth = radius/8
        
        path.move(to: CGPoint(x: center.x, y: center.y - 3 * eigth))
        path.addLine(to: CGPoint(x: center.x, y: center.y - 3 * eigth))
        
        if progress > 0.5 {
            // A normalized progress variable from 0...1 between the total progress of 0...0.5.
            let lineProgress: CGFloat = (CGFloat(progress) - 0.5) * 2
            
            path.move(to: CGPoint(x: center.x, y: center.y - eigth))
            path.addLine(to: CGPoint(x: center.x, y: center.y - eigth + (3 * eigth)*lineProgress))
        }
        
        return path
    }

    var animatableData: Double {
        get { return progress }
        set { progress = newValue }
    }
}
