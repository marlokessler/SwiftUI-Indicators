//
//  InnerIndicatorText.swift
//  Indicators
//
//  Created by Marlo Kessler on 09.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
protocol InnerIndicatorText {
    var foregroundColor: Color { get set }
}

@available(iOS 13.0, *)
extension InnerIndicatorText {
    
    func innerText(_ text: String, for size: CGSize) -> some View {
        return Text(text)
                .font(.system(size: fontSize(for: text, in: size)))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(width: size.width, height: size.height)
                .foregroundColor(foregroundColor)
    }
    
    private func fontSize(for text: String, in size: CGSize) -> CGFloat {
        let scaleFactor: CGFloat
        
        if text.count > 14 { scaleFactor = 0.11 }
        else if text.count > 8 { scaleFactor = 0.13 }
        else if text.count > 6 { scaleFactor = 0.15 }
        else if text.count > 4 { scaleFactor = 0.2 }
        else if text.count > 2 { scaleFactor = 0.3 }
        else { scaleFactor = 0.5 }
        
        return size.height > size.width ? size.width * scaleFactor: size.height * scaleFactor
    }
    
}
