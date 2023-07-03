//
//  View+fixedHeight.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import SwiftUI

struct FixedHeight: ViewModifier {
    let height: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(height: height)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension View {
    func fixedHeight(_ height: CGFloat) -> some View {
        self.modifier(FixedHeight(height: height))
    }
}
