//
//  CircularProgressIndicator.swift
//  Indicators
//
//  Created by Marlo Kessler on 09.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CircularProgressIndicator: Indicator, InnerIndicatorText {
    
    
    
    // MARK: - Initializer
    public init(_ progress: Double, text: String? = nil) {
        self.progress = progress <= 1 ? progress : 1
        innerText = text
    }
    
    private init(
                 _ progress: Double,
                 _ innerText: String?,
                 _ foregroundColor: Color?,
                 _ backgroundColor: Color?,
                 _ lineWidth: CGFloat,
                 _ pace: Double,
                 _ animated: Bool,
                 _ customAnimation: Animation?
                 ) {
        self.progress = progress
        self.innerText = innerText
        self.foregroundColor = foregroundColor ?? .white
        self.backgroundColor = backgroundColor ?? Color.gray.opacity(0.5)
        self.lineWidth = lineWidth
        self.pace = pace
        self.animated = animated
        self.customAnimation = customAnimation
    }
    
    
    
    // MARK: - Variables
    private var progress: Double = 0
    private var innerText: String?
    
    var foregroundColor: Color = .white
    private var backgroundColor: Color = Color.gray.opacity(0.5)
    var lineWidth: CGFloat = 5
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
    public func foregroundColor(_ color: Color?) -> Self {
        return CircularProgressIndicator(progress, innerText, color, backgroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func backgroundColor(_ color: Color?) -> Self {
        return CircularProgressIndicator(progress, innerText, foregroundColor, color, lineWidth, pace, animated, customAnimation)
    }
    
    public func lineWidth(_ width: Double) -> Self {
        return CircularProgressIndicator(progress, innerText, foregroundColor, backgroundColor, CGFloat(width), pace, animated, customAnimation)
    }
    
    public func pace(_ pace: Double) -> Self {
        return CircularProgressIndicator(progress, innerText, foregroundColor, backgroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func animated(_ animated: Bool = true) -> Self {
        return CircularProgressIndicator(progress, innerText, foregroundColor, backgroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func animation(_ animation: Animation?) -> Self {
        return CircularProgressIndicator(progress, innerText, foregroundColor, backgroundColor, lineWidth, pace, animated, animation)
    }
    
    
    
    // MARK:- View
    public var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    
                    Circle()
                        .stroke(self.backgroundColor, style: self.style)
                    
                    CircularProgressShape(self.progress)
                        .stroke(self.foregroundColor, style: self.style)
                        .animation(self.customAnimation ?? self.animation)
                    
                    if self.innerText != nil { self.innerText(self.innerText!, for: CGSize(width: geo.size.width - self.lineWidth, height: geo.size.height - self.lineWidth)) }
                }
            }
        }
    }
}
