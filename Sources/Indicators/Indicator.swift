//
//  Indicator.swift
//  IndicatorsApp
//
//  Created by Marlo Kessler on 11.07.20.
//  Copyright © 2020 Marlo Kessler. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public protocol Indicator: View {
    func foregroundColor(_ color: Color?) -> Self
    
    func lineWidth(_ width: Double) -> Self
    
    func pace(_ pace: Double) -> Self
    
    func animated(_ animated: Bool) -> Self
    
    func animation(_ animation: Animation?) -> Self
}
