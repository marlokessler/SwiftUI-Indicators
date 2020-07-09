//
//  CircularWaitingShape.swift
//  Indicators
//
//  Created by Marlo Kessler on 07.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct CircularWaitingShape: CircularIndicatorShape {

    var progress: Double

    init(_ progress: Double) {
        self.progress = progress
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addPath(waitingPath(in: rect, for: progress))
        return path
    }
    
    func waitingPath(in rect: CGRect, for progress: Double) -> Path {
        
        let width = rect.width
        let height = rect.height

        let angleOffset: Double = -90
        let angelProgress1 = 360*progress
        let angelProgress2 = 360*(progress-0.5)
        
        let startAngle: Double = progress < 0.5
                                    ? angelProgress1 + angleOffset
                                    : 180 + 3 * angelProgress2 + angleOffset - 1
                                        // -1 prevents the circle from switching clock direction, which would happen, if start and end point wourld be equal.
        
        let endAngle: Double = progress < 0.5
                                ? 3 * angelProgress1 + angleOffset
                                : 540 + angelProgress2 + angleOffset
        
        var path = Path()

        path.addArc(center: CGPoint(x: width / 2, y: height / 2),
                    radius: min(width, height) / 2,
                    startAngle: Angle(degrees: startAngle),
                    endAngle: Angle(degrees: endAngle),
                    clockwise: false)
        
        return path
    }

    var animatableData: Double {
        get { return progress }
        set { progress = newValue }
    }
}
