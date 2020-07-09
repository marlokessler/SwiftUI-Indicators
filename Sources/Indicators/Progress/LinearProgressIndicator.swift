//
//  LinearProgressIndicator.swift
//  Indicators
//
//  Created by Marlo Kessler on 09.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct LinearProgressIndicator: View {
    
    
    
    // MARK: - Initializer
    public init(_ progress: Double, text: String? = nil) {
        self.progress = progress <= 1 ? progress : 1
        self.text = text
    }
    
    private init(
                 _ progress: Double,
                 _ innerText: String?,
                 _ font:Font?,
                 _ foregroundColor: Color?,
                 _ backgroundColor: Color?,
                 _ lineWidth: CGFloat,
                 _ pace: Double,
                 _ animated: Bool,
                 _ customAnimation: Animation?
                 ) {
        self.progress = progress
        text = innerText
        self.font = font
        self.foregroundColor = foregroundColor ?? .white
        self.backgroundColor = backgroundColor ?? Color.gray.opacity(0.5)
        self.lineWidth = lineWidth
        self.pace = pace
        self.animated = animated
        self.customAnimation = customAnimation
    }
    
    
    
    // MARK: - Variables
    private var progress: Double = 0
    private var text: String?
    
    private var font: Font?
    private var foregroundColor: Color = .white
    private var backgroundColor: Color = Color.gray.opacity(0.5)
    private var lineWidth: CGFloat = 7
    private var pace: Double = 0.5
    private var animated: Bool = true
    private var customAnimation: Animation?
    
    private var animation: Animation? {
        return self.animated
                ? Animation.easeInOut(duration: pace)
                : nil
    }
    
    private var style: StrokeStyle {
        return StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round)
    }
    
    
    
    // MARK: - Methods
    // APIs
    public func font(_ font: Font?) -> LinearProgressIndicator {
        return LinearProgressIndicator(progress, text, font, foregroundColor, backgroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func foregroundColor(_ color: Color?) -> LinearProgressIndicator {
        return LinearProgressIndicator(progress, text, font, color, backgroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func backgroundColor(_ color: Color?) -> LinearProgressIndicator {
        return LinearProgressIndicator(progress, text, font, foregroundColor, color, lineWidth, pace, animated, customAnimation)
    }
    
    public func lineWidth(_ width: Double) -> LinearProgressIndicator {
        return LinearProgressIndicator(progress, text, font, foregroundColor, backgroundColor, CGFloat(width), pace, animated, customAnimation)
    }
    
    public func pace(_ pace: Double) -> LinearProgressIndicator {
        return LinearProgressIndicator(progress, text, font, foregroundColor, backgroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func animated(_ animated: Bool = true) -> LinearProgressIndicator {
        return LinearProgressIndicator(progress, text, font, foregroundColor, backgroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func animation(_ animation: Animation?) -> LinearProgressIndicator {
        return LinearProgressIndicator(progress, text, font, foregroundColor, backgroundColor, lineWidth, pace, animated, animation)
    }
    
    
    
    // MARK: - View
    public var body: some View {
        HStack(alignment: .firstTextBaseline) {
            
            if self.text != nil {
                Text(self.text!)
                    .font(self.font)
                    .foregroundColor(self.foregroundColor)
                    .padding(.trailing, 4)
            }
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .foregroundColor(self.backgroundColor)
                    
                    Capsule()
                        .frame(width: geo.size.width * CGFloat(self.progress))
                        .foregroundColor(self.foregroundColor)
                }
                .animation(self.customAnimation ?? self.animation)
            }
            .frame(height: self.lineWidth)
        }
    }
}
