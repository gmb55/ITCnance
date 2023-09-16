//
//  AccountInfoBinanceEndpoint.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 13/09/2023.
//

import Foundation

struct AccountInfoBinanceEndpoint: Endpoint {
    var endpoint: String
    var parameters: [String : Any]
    var method: HTTPMethod

    init(
        endpoint: String = "/fapi/v2/account",
        parameters: [String : Any] = [:],
        method: HTTPMethod = .get
    ) {
        self.endpoint = endpoint
        self.parameters = parameters
        self.method = method
    }
}
