//
//  TriangleShape.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import SwiftUI

struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let referenceUnitWidth = rect.maxX / 17
        let referenceUnitHeight = rect.maxY / 17
        
        let rightTopPoint = CGPoint(
            x: rect.midX,
            y: rect.minY + 2 * referenceUnitHeight
        )
        let leftDownPoint = CGPoint(
            x: rect.minX + 2 * referenceUnitWidth,
            y: rect.midY
        )
        let rightDownPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        path.move(to: rightTopPoint)
        path.addLine(to: leftDownPoint)
        path.addLine(to: rightDownPoint)
        path.closeSubpath()
        
        return path
    }
}
