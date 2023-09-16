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
        case binance
        case byBit
        
        enum Header: String, CaseIterable {
            case apiKey
            case timestamp
            case signature
        }
        
        func baseURLString() -> String {
            switch environment {
            case .development:
                switch self {
                case .binance:
                    return "https://testnet.binancefuture.com"
                case .byBit:
                    return "https://api-testnet.bybit.com"
                }
            case .production:
                switch self {
                case .binance:
                    return "https://fapi.binance.com"
                case .byBit:
                    return "https://api.bybit.com"
                }
            }
        }
    }
}
