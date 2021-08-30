//
//  Circle.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import CoreGraphics

struct Circle {
    let center: CGPoint
    let radius: CGFloat
}

extension Circle {
    static let zero = Circle(center: .zero, radius: 0)
    
    var diameter: CGFloat {
        return radius * 2.0
    }
    
    var isEmpty: Bool {
        return radius == 0.0
    }
}
