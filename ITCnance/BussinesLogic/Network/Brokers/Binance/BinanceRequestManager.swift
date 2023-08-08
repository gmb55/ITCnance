//
//  BinanceRequest.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 06/08/2023.
//

import CryptoSwift
import Foundation

class BinanceRequestManager {
    var requestModel: RequestModel
    var loginModel: LoginModel
    
    required init(
        requestModel: RequestModel,
        loginModel: LoginModel
    ) {
        self.requestModel = requestModel
        self.loginModel = loginModel
    }
}

// MARK: - Request Manager

extension BinanceRequestManager: RequestManager {
    func urlRequest() throws -> URLRequest {
        guard let url = try url() else { throw APIError.incorrectUrl }

        var request = URLRequest(url: url)
        request.httpMethod = requestModel.method.rawValue
        request.setValue(loginModel.apiKey, forHTTPHeaderField: "X-MBX-APIKEY")

        return request
    }
}

// MARK: - Private Actions

private extension BinanceRequestManager {
    func url() throws -> URL? {
        var components = URLComponents(string: requestModel.baseURL)
        components?.path = requestModel.endpoint
        components?.queryItems = try queryItems()
        
        return components?.url
    }
    
    func queryItems() throws -> [URLQueryItem] {
        try parameterQueryItems() + timestampQueryItems() + signatureQueryItems()
    }
    
    func parameterQueryItems() -> [URLQueryItem] {
        requestModel.parameters.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
    }
    
    func timestampQueryItems() -> [URLQueryItem] {
        let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
        return [URLQueryItem(name: "timestamp", value: timestamp)]
    }
    
    func signatureQueryItems() throws -> [URLQueryItem] {
        guard
            let queryString = (parameterQueryItems() + timestampQueryItems()).string
        else { throw APIError.failToCreateQuery }
        
        let key = loginModel.secretKey.bytes
        let hmac = HMAC(key: key, variant: .sha2(.sha256))
        
        guard
            let signature = try? hmac.authenticate(queryString.bytes)
        else { throw APIError.failToCreateSignature }

        let signatureHex = signature.toHexString()
        return [URLQueryItem(name: "signature", value: signatureHex)]
    }
}
