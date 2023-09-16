//
//  NetworkProvider.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 06/08/2023.
//

import CryptoSwift
import Foundation

enum NetworkError: Error {
    case failToCreateRequest
    case failToCreateQuery
    case failToCreateSignature
    case invalidBaseURL
    case urlNotExists
    case responseParsingError
    case incorrectCredentials
    case resultParsingError
}

protocol NetworkProvider {
    func data(for urlRequest: URLRequest) async throws -> (Data, URLResponse)
}

class NetworkProviderImp: NetworkProvider {
    private let httpWorker: HTTPWorker

    init(
        httpWorker: HTTPWorker = URLSession.shared
    ) {
        self.httpWorker = httpWorker
    }

    func data(for urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        guard
            let (data, response) = try? await httpWorker.data(for: urlRequest)
        else { throw NetworkError.failToCreateRequest }

        return (data, response)
    }
}
