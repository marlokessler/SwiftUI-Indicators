//
//  LinearWaitingShape.swift
//  Indicators
//
//  Created by Marlo Kessler on 09.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct LinearWaitingIndicator: View {



    // MARK: - Initializer
    public init(_ text: String? = nil) {
        self.text = text
    }

    private init(
                 _ innerText: String?,
                 _ font:Font?,
                 _ foregroundColor: Color?,
                 _ backgroundColor: Color?,
                 _ lineWidth: CGFloat,
                 _ pace: Double,
                 _ animated: Bool,
                 _ customAnimation: Animation?
                 ) {
        text = innerText
        self.font = font
        self.foregroundColor = foregroundColor ?? .white
        self.backgroundColor = backgroundColor
        self.lineWidth = lineWidth
        self.pace = pace
        self.animated = animated
        self.customAnimation = customAnimation
    }



    // MARK: - Variables
    private var text: String?
    private var font: Font?
    private var foregroundColor: Color = .white
    private var backgroundColor: Color? = Color.gray.opacity(0.5)
    private var lineWidth: CGFloat = 7
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
    public func font(_ font: Font?) -> LinearWaitingIndicator {
        return LinearWaitingIndicator(text, font, foregroundColor, backgroundColor, lineWidth, pace, animated, customAnimation)
    }

    public func foregroundColor(_ color: Color?) -> LinearWaitingIndicator {
        return LinearWaitingIndicator(text, font, color, backgroundColor, lineWidth, pace, animated, customAnimation)
    }

    public func backgroundColor(_ color: Color?) -> LinearWaitingIndicator {
        return LinearWaitingIndicator(text, font, foregroundColor, color, lineWidth, pace, animated, customAnimation)
    }

    public func lineWidth(_ width: Double) -> LinearWaitingIndicator {
        return LinearWaitingIndicator(text, font, foregroundColor, backgroundColor, CGFloat(width), pace, animated, customAnimation)
    }

    public func pace(_ pace: Double) -> LinearWaitingIndicator {
        return LinearWaitingIndicator(text, font, foregroundColor, backgroundColor, lineWidth, pace, animated, customAnimation)
    }

    public func animated(_ animated: Bool = true) -> LinearWaitingIndicator {
        return LinearWaitingIndicator(text, font, foregroundColor, backgroundColor, lineWidth, pace, animated, customAnimation)
    }

    public func animation(_ animation: Animation?) -> LinearWaitingIndicator {
        return LinearWaitingIndicator(text, font, foregroundColor, backgroundColor, lineWidth, pace, animated, animation)
    }



    // MARK: - View
    public var body: some View {
        GeometryReader { geo in
            HStack(alignment: .firstTextBaseline) {

                if self.text != nil {
                    Text(self.text!)
                        .font(self.font)
                        .foregroundColor(self.foregroundColor)
                        .padding(.trailing, 4)
                }

                ZStack {
                    Capsule()
                        .foregroundColor(self.backgroundColor)

                    LineShape(self.progress)
                        .stroke(self.foregroundColor, style: self.style)
                }
                .frame(height: self.lineWidth)

            }
        }
        .onAppear {
            self.initAnimation()
        }
    }
}
