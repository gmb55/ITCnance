//
//  RequestManager.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 06/08/2023.
//

import CryptoSwift
import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct RequestModel {
    var baseURL: String
    var endpoint: String
    var method: HTTPMethod
    var parameters: [String : Any]
    
    init(
        baseURL: String,
        endpoint: String,
        method: HTTPMethod = .get,
        parameters: [String : Any] = [:]
    ) {
        self.baseURL = baseURL
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
    }
}

protocol RequestManager {
    var requestModel: RequestModel { get }
    var loginModel: LoginModel { get }
    
    func urlRequest() throws -> URLRequest
    
    init (
        requestModel: RequestModel,
        loginModel: LoginModel
    )
}
