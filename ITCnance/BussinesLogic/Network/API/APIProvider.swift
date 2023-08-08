//
//  APIProvider.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 06/08/2023.
//

import CryptoSwift
import Foundation

protocol APIProtocol {
    func data(for request: RequestManager) async throws -> Data
}

enum APIError: Error {
    case failToCreateRequest
    case failToCreateQuery
    case failToCreateSignature
    case incorrectUrl
    case parsingError
    case incorrectCredentials
}

class APIProvider: APIProtocol {
    private let httpWorker: HTTPWorker
    
    init(
        httpWorker: HTTPWorker = URLSession.shared
    ) {
        self.httpWorker = httpWorker
    }
    
    func data(for request: RequestManager) async throws -> Data {
        let request = try request.urlRequest()
        
        guard
            let (data, response) = try? await httpWorker.data(for: request)
        else { throw APIError.failToCreateRequest }
        
        guard
            let response = response as? HTTPURLResponse
        else { throw APIError.parsingError }
        
        guard
            response.statusCode != 401
        else { throw APIError.incorrectCredentials }
            
        return data
    }
}
