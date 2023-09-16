//
//  VShape.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import SwiftUI

struct VShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let referenceUnitWidth = rect.maxX / Constants.General.logoScaleReferenceUnit
        let referenceUnitHeight = rect.maxY / Constants.General.logoScaleReferenceUnit
        
        let topRightPoint = CGPoint(
            x: rect.midX,
            y: rect.minY + 5 * referenceUnitHeight
        )
        let downRightPoint = CGPoint(
            x: rect.midX,
            y: rect.minY + 7 * referenceUnitHeight
        )
        let rightMiddlePoint = CGPoint(
            x: rect.minX + 7 * referenceUnitWidth,
            y: rect.midY
        )
        let leftMiddlePoint = CGPoint(
            x: rect.minX + 5 * referenceUnitWidth,
            y: rect.midY
        )
        let downLeftPoint = CGPoint(
            x: rect.minX + 3.5 * referenceUnitWidth,
            y: rect.midY - 1.5 * referenceUnitHeight
        )
        let topLeftPoint = CGPoint(
            x: rect.minX + 3.5 * referenceUnitWidth,
            y: rect.midY - 3.5 * referenceUnitHeight
        )
        let topMiddlePoint = CGPoint(
            x: rect.minX + 6 * referenceUnitWidth,
            y: rect.midY - 1 * referenceUnitHeight
        )
        
        path.move(to: topRightPoint)
        path.addLine(to: downRightPoint)
        path.addLine(to: rightMiddlePoint)
        path.addLine(to: leftMiddlePoint)
        path.addLine(to: downLeftPoint)
        path.addLine(to: topLeftPoint)
        path.addLine(to: topMiddlePoint)
        path.closeSubpath()
        
        return path
    }
}
