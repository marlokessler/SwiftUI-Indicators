//
//  CircularProgressShape.swift
//  Indicators
//
//  Created by Marlo Kessler on 07.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct CircularProgressShape: CircularIndicatorShape {

    var progress: Double

    init(_ progress: Double) {
        self.progress = progress
    }

    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height

        let angleOffset: Double = -90
        
        let startAngle: Double = 0 + angleOffset
        let endAngle: Double = 360*progress + angleOffset
        
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
