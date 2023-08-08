//
//  BinanceService.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 04/08/2023.
//

import Foundation

final class BinanceService {
    private let apiProvider: APIProvider
    let baseURLString = Constants.API.binance.baseURLString()
    
    init(
        apiProvider: APIProvider = APIProvider()
    ) {
        self.apiProvider = apiProvider
    }
}

// MARK: - Balance

extension BinanceService: BrokerService {
    var balanceEndpoint: String { "/fapi/v2/balance" }
    
    func balance() async throws -> Data {
        guard let data = try? await apiProvider.data(
            for: BinanceRequestManager(
                requestModel: RequestModel(
                    baseURL: baseURLString,
                    endpoint: balanceEndpoint
                ),
                loginModel: LoginModel(
                    apiKey: "",
                    secretKey: ""
                )
            )
        ) else { return Data() }
        return data
    }
}
