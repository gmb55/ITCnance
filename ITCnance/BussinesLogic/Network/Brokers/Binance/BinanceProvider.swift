//
//  BinanceService.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 04/08/2023.
//

import Foundation

enum BinanceError: Error {
    case malformedRequest
    case wafLimitViolation
    case rateLimitExceeded
    case ipAutoBanned
    case internalError
    case serviceUnavailable
    case unknownError
    case otherServerError
}

final class BinanceProvider {
    private let urlBuilder: URLBuilder
    private let requestManager: RequestManager
    private let headers: [String: String]
    private let networkProvider: NetworkProvider

    init(
        urlBuilder: URLBuilder,
        requestManager: RequestManager = RequestManagerImp(),
        apiKey: String,
        networkProvider: NetworkProvider = NetworkProviderImp()
    ) {
        self.urlBuilder = urlBuilder
        self.requestManager = requestManager
        headers = ["X-MBX-APIKEY": apiKey]
        self.networkProvider = networkProvider
    }
}

extension BinanceProvider: BrokerProvider {
    // MARK: - Balance

    func accountInfo(_ model: Endpoint = AccountInfoBinanceEndpoint()) async throws -> AccountInfoDTO {
        let url = try urlBuilder.makeURL(
            endpoint: model.endpoint,
            parameters: model.parameters
        )
        let urlRequest = requestManager.makeRequest(
            url: url,
            headers: headers,
            method: model.method
        )
        let data = try await networkProvider.data(for: urlRequest)
        let binanceAccountData: AccountInfoBinance = try decode(
            data: data.0,
            response: data.1
        )

        return binanceAccountData.toDTO()
    }

    // MARK: - Decode

    func decode<T>(data: Data, response: URLResponse) throws -> T where T: Decodable {
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.responseParsingError
        }

        switch response.statusCode {
        case 200 ... 299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.resultParsingError
            }
        case 400 ... 499:
            switch response.statusCode {
            case 403:
                throw BinanceError.wafLimitViolation
            case 429:
                throw BinanceError.rateLimitExceeded
            case 418:
                throw BinanceError.ipAutoBanned
            default:
                throw BinanceError.malformedRequest
            }
        case 500 ... 599:
            switch response.statusCode {
            case 503:
                if let errorMessage = try? JSONDecoder().decode(ErrorMessage.self, from: data) {
                    if errorMessage.message.contains("Unknown error") {
                        throw BinanceError.unknownError
                    } else if errorMessage.message.contains("Internal error") {
                        throw BinanceError.internalError
                    } else if errorMessage.message.contains("Service Unavailable") {
                        throw BinanceError.serviceUnavailable
                    }
                }
                throw BinanceError.internalError
            default:
                throw BinanceError.internalError
            }
        default:
            throw BinanceError.unknownError
        }
    }
}
