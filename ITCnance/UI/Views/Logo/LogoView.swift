//
//  LogoView.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                QuarterLogoView()
                
                QuarterLogoView()
                    .scaleEffect(x: -1, y: 1)
                
                QuarterLogoView()
                    .scaleEffect(x: 1, y: -1)
                
                QuarterLogoView()
                    .scaleEffect(x: -1, y: -1)
            }
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
