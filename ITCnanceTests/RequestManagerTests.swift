//
//  RequestManagerTests.swift
//  ITCnanceTests
//
//  Created by Michał Bagrowski on 14/09/2023.
//

@testable import ITCnance
import XCTest

final class RequestManagerTests: XCTestCase {
    func test_make_request() {
        let sut = RequestManagerImp()
        let url = URL(string: "www.onet.pl")!
        let headers = [
            "apiKey": "784y3rhjdfg765jndgf873",
            "signature": "dsjhguydfgukalsnre34589uhfdj",
        ]
        let method = HTTPMethod.get
        let urlRequest = sut.makeRequest(url: url, headers: headers, method: method)

        XCTAssertEqual(urlRequest.url, url)
        XCTAssertEqual(
            urlRequest.value(forHTTPHeaderField: "apiKey"),
            "784y3rhjdfg765jndgf873"
        )
        XCTAssertEqual(
            urlRequest.value(forHTTPHeaderField: "signature"),
            "dsjhguydfgukalsnre34589uhfdj"
        )
        XCTAssertEqual(urlRequest.httpMethod, method.rawValue)
    }
}
