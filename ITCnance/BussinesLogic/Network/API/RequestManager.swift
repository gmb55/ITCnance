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

protocol RequestManager {
    func makeRequest(url: URL, headers: [String : String],  method: HTTPMethod) -> URLRequest
}

struct RequestManagerImp: RequestManager {
    func makeRequest(url: URL, headers: [String : String], method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        headers.forEach { header in
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }

        return request
    }
}
