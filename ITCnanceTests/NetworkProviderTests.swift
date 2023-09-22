//
//  NetworkProviderTests.swift
//  ITCnanceTests
//
//  Created by Michał Bagrowski on 18/09/2023.
//

import XCTest
@testable import ITCnance

class MockHTTPWorkerWithData: HTTPWorker {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        let data = "Mocked data".data(using: .utf8)!
        let response = HTTPURLResponse(
            url: request.url!,
            statusCode: 200,
            httpVersion: "HTTP/1.1",
            headerFields: nil
        )!
        
        return (data, response)
    }
}

class MockHTTPWorkerWithError: HTTPWorker {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        throw NetworkError.failToFetchData
    }
}

final class NetworkProviderTests: XCTestCase {
    func test_successful_data_request() async throws {
        let url = URL(string: "http://binance.com")!
        let request = URLRequest(url: url)
        
        let networkProvider = NetworkProviderImp(httpWorker: MockHTTPWorkerWithData())
        
        do {
            let (data, response) = try await networkProvider.data(for: request)
            
            XCTAssertNotNil(data)
            XCTAssertTrue(response is HTTPURLResponse)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func test_failed_data_response() async throws {
        let url = URL(string: "http://binance.com")!
        let request = URLRequest(url: url)
        
        let networkProvider = NetworkProviderImp(httpWorker: MockHTTPWorkerWithError())
        
        do {
            let (_, _) = try await networkProvider.data(for: request)
            
            XCTFail("Expected an error but success occurs")
        } catch {
            let test = error
            XCTAssertTrue(error is NetworkError)
        }
    }
}
