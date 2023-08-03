//
//  CustomTextFieldType.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import SwiftUI

enum CustomTextFieldType {
    case apiKey
    case secureKey
    
    var isSecure: Bool {
        switch self {
        case .apiKey:
            return false
        case .secureKey:
            return true
        }
    }
    
    var title: String {
        switch self {
        case .apiKey:
            return "api.key".localized()
        case .secureKey:
            return "secret.key".localized()
        }
    }
}
