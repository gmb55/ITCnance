//
//  BalanceBinanceEndpoint.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 04/09/2023.
//

import Foundation

struct BalanceBinanceEndpoint: Endpoint {
    var endpoint: String
    var parameters: [String : Any]
    var method: HTTPMethod

    init(
        endpoint: String = "/fapi/v2/balance",
        parameters: [String : Any] = [:],
        method: HTTPMethod = .get
    ) {
        self.endpoint = endpoint
        self.parameters = parameters
        self.method = method
    }
}
