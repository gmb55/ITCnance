//
//  CustomTextFieldStyle.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal)
            .frame(height: 50)
            .background(Color("ebonyClay"))
            .foregroundColor(.white)
            .accentColor(.white)
            .cornerRadius(8)
    }
}
