//
//  BinanceURLBuilder.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/09/2023.
//

import CryptoSwift
import Foundation

struct BinanceURLBuilder: URLBuilder {
    let baseURL: String
    let secretKey: String
    
    func makeURL(endpoint: String, parameters: [String : Any]) throws -> URL {
        guard var components = URLComponents(string: baseURL) else {
            throw NetworkError.invalidBaseURL
        }
        
        components.path = endpoint.ensurePrefixSlash()
        components.queryItems = try queryItems(parameters: parameters)

        if let url = components.url {
            return url
        } else {
            throw NetworkError.urlNotExists
        }
    }
    
    init(
        baseURL: String = Constants.API.binance.baseURLString(),
        secretKey: String
    ) {
        self.baseURL = baseURL
        self.secretKey = secretKey
    }
}

// MARK: - Private

private extension BinanceURLBuilder {
    func queryItems(parameters: [String : Any]) throws -> [URLQueryItem] {
        try parameterQueryItems(parameters) + timestampQueryItems() + signatureQueryItems(parameters)
    }
    
    func parameterQueryItems(_ parameters: [String : Any]) -> [URLQueryItem] {
        parameters.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
    }
    
    func timestampQueryItems() -> [URLQueryItem] {
        let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
        return [URLQueryItem(name: "timestamp", value: timestamp)]
    }
    
    func signatureQueryItems(_ parameters: [String : Any]) throws -> [URLQueryItem] {
        guard
            let queryString = (parameterQueryItems(parameters) + timestampQueryItems()).string
        else { throw NetworkError.failToCreateQuery }
        
        let key = secretKey.bytes
        let hmac = HMAC(key: key, variant: .sha2(.sha256))
        
        guard
            let signature = try? hmac.authenticate(queryString.bytes)
        else { throw NetworkError.failToCreateSignature }

        let signatureHex = signature.toHexString()
        return [URLQueryItem(name: "signature", value: signatureHex)]
    }
}
