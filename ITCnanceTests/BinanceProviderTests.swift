//
//  BinanceProviderTests.swift
//  ITCnanceTests
//
//  Created by Michał Bagrowski on 22/09/2023.
//

@testable import ITCnance
import XCTest

class SuccessNetworkProvider: NetworkProvider {
    func data(for urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        return (
            "".data(using: .utf8)!,
            HTTPURLResponse(
                url: URL(string: "")!,
                statusCode: 200,
                httpVersion: "",
                headerFields: nil
            )!
        )
    }
}

final class BinanceProviderTests: XCTestCase {
    
}
