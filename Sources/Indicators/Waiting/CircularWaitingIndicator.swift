//
//  CircularWaitingIndicator.swift
//  Indicators
//
//  Created by Marlo Kessler on 09.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CircularWaitingIndicator: Indicator, InnerIndicatorText {
    
    
    
    // MARK: - Initializer
    public init(_ text: String? = nil) {
        innerText = text
    }
    
    private init(
                 _ innerText: String?,
                 _ foregroundColor: Color?,
                 _ lineWidth: CGFloat,
                 _ pace: Double,
                 _ animated: Bool,
                 _ customAnimation: Animation?
                 ) {
        self.innerText = innerText
        self.foregroundColor = foregroundColor ?? .white
        self.lineWidth = lineWidth
        self.pace = pace
        self.animated = animated
        self.customAnimation = customAnimation
    }
    
    
    
    // MARK: - Variables
    private var innerText: String?
    var foregroundColor: Color = .white
    private var lineWidth: CGFloat = 10
    private var pace: Double = 1.5
    private var animated: Bool = true
    private var customAnimation: Animation?
    
    
    
    @State private var progress: Double = 0
    
    private var animation: Animation {
        return Animation
            .easeInOut(duration: pace)
            .repeatForever(autoreverses: false)
    }
    
    private var style: StrokeStyle {
        return StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round)
    }
    
    
    
    // MARK: - Methods
    private func initAnimation() {
        guard animated else {
            progress = 1
            return
        }
        progress = 0
        withAnimation(customAnimation ?? animation) {
            self.progress = 1
        }
    }
    
    // APIs
    public func foregroundColor(_ color: Color?) -> Self {
        return CircularWaitingIndicator(innerText, color, lineWidth, pace, animated, customAnimation)
    }
    
    public func lineWidth(_ width: Double) -> Self {
        return CircularWaitingIndicator(innerText, foregroundColor, CGFloat(width), pace, animated, customAnimation)
    }
    
    public func pace(_ pace: Double) -> Self {
        return CircularWaitingIndicator(innerText, foregroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func animated(_ animated: Bool = true) -> Self {
        return CircularWaitingIndicator(innerText, foregroundColor, lineWidth, pace, animated, customAnimation)
    }
    
    public func animation(_ animation: Animation?) -> Self {
        return CircularWaitingIndicator(innerText, foregroundColor, lineWidth, pace, animated, animation)
    }
    
    
    
    // MARK:- View
    public var body: some View {
        GeometryReader { geo in
            ZStack {
                CircularWaitingShape(self.progress)
                    .stroke(self.foregroundColor, style: self.style)
                    .onAppear {
                        self.initAnimation()
                }
                
                if self.innerText != nil { self.innerText(self.innerText!, for:  CGSize(width: geo.size.width - self.lineWidth, height: geo.size.height - self.lineWidth)) }
            }
        }
    }
}
