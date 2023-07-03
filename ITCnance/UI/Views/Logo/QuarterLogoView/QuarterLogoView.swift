//
//  QuarterLogoView.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import SwiftUI

struct QuarterLogoView: View {
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            
            ZStack {
                      QuarterCircleShape()
                          .fill(Color.black)
                          .frame(width: size, height: size)
                      
                      TriangleShape()
                          .frame(width: size, height: size)
                          .foregroundColor(Color("brightSun"))
                      
                      VShape()
                          .frame(width: size, height: size)
                          .foregroundColor(Color.black)
                  }
        }
    }
}

struct QuarterLogoView_Previews: PreviewProvider {
    static var previews: some View {
        QuarterLogoView()
    }
}
