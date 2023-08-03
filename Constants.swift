//
//  Constants.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/07/2023.
//

import Foundation

enum Constants {
    enum EnvironmentType {
        case development
        case production
    }

    #if DEVELOPMENT
        private static let environment: EnvironmentType = .development
    #else
        private static let environment: EnvironmentType = .production
    #endif
    
    enum General {
        static let logoScaleReferenceUnit: CGFloat = 17
    }
    
    enum API {
        static var baseURL: URL? {
            switch environment {
            case .development:
                return URL(
                    string: "https://testnet.binancefuture.com"
                )
            case .production:
                return URL(
                    string: "https://fapi.binance.com"
                )
            }
        }
    }
}
