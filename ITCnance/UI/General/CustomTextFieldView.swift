//
//  CustomTextFieldView.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import SwiftUI

struct CustomTextFieldView: View {
    let type: CustomTextFieldType
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(type.title)
                .foregroundColor(Color("raven"))
            
            if type.isSecure {
                SecureField("", text: $text)
                    .fixedHeight(50)
                    .textFieldStyle(CustomTextFieldStyle())
            } else {
                TextField("", text: $text)
                    .fixedHeight(50)
                    .textFieldStyle(CustomTextFieldStyle())
            }
        }
    }
}
