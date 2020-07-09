//
//  LinearWaitingShape.swift
//  Indicators
//
//  Created by Marlo Kessler on 09.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct LineShape: Shape {
    
    var progress: Double
    var lagAmmount = 0.5
    
    init(_ progress: Double) {
        self.progress = progress
    }

    func path(in rect: CGRect) -> Path {
        
        let width = Double(rect.width)
        let height = Double(rect.height)
        
        let end = progress * width
        var start: Double

        if progress > (1 - lagAmmount) {
            start = width * (2 * progress - 1.0)
        } else if progress > lagAmmount {
            start = width * (progress - lagAmmount)
        } else {
            start = 0
        }

        var p = Path()
        // Width and height are needed otherwise the corner are not drawn round.
        p.addRoundedRect(in: CGRect(x: start, y: height / 2, width: end-start + 0.01, height: 0.01),
                         cornerSize: CGSize(width: 50, height: 50))

        return p
    }

    var animatableData: Double {
        get { return progress }
        set { progress = newValue }
    }
}
