//
//  BinanceURLBuilderTests.swift
//  ITCnanceTests
//
//  Created by Michał Bagrowski on 04/09/2023.
//

import XCTest
@testable import ITCnance

final class BinanceURLBuilderTests: XCTestCase {

    let mockSecretKey = "your_mock_secret_key"

    func test_base_url() {
        let builder = BinanceURLBuilder(secretKey: mockSecretKey)
        XCTAssertEqual(builder.baseURL, Constants.API.binance.baseURLString())
    }

    func test_secret_key() {
        let builder = BinanceURLBuilder(secretKey: mockSecretKey)
        XCTAssertEqual(builder.secretKey, mockSecretKey)
    }

    func test_create_url() {
        let builder = BinanceURLBuilder(secretKey: mockSecretKey)
        let parameters: [String: Any] = ["param1": "value1", "param2": 42]
        
        do {
            let url = try builder.makeURL(endpoint: "sfsdf", parameters: parameters)
            
            XCTAssertNotNil(url)
        } catch {
            XCTFail("Failed to create URL: \(error)")
        }
    }

    func test_query_items() {
        let builder = BinanceURLBuilder(secretKey: mockSecretKey)
        let parameters: [String: Any] = ["param1": "value1", "param2": 42]

        do {
            let url = try builder.makeURL(endpoint: "testEndpoint", parameters: parameters)
            
            if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems {
                XCTAssertEqual(queryItems.count, parameters.count + 2)
            } else {
                XCTFail("Failed to generate urlCompoments")
            }
        } catch {
            XCTFail("Failed to generate query items: \(error)")
        }
    }
    
    func test_query_items_contains_parameters() {
        let builder = BinanceURLBuilder(secretKey: mockSecretKey)
        let parameters: [String: Any] = ["param1": "value1", "param2": 42]

        do {
            let url = try builder.makeURL(endpoint: "testEndpoint", parameters: parameters)
            
            if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems {
                XCTAssertEqual(queryItems.first?.name, parameters.first?.key)
                XCTAssertEqual(queryItems.dropFirst().first?.name, parameters.dropFirst().first?.key)
            } else {
                XCTFail("Failed to generate urlCompoments")
            }
        } catch {
            XCTFail("Failed to generate query items: \(error)")
        }
    }
    
    func test_query_items_contains_timestamp() {
        let builder = BinanceURLBuilder(secretKey: mockSecretKey)
        let parameters: [String: Any] = ["param1": "value1", "param2": 42]

        do {
            let url = try builder.makeURL(endpoint: "testEndpoint", parameters: parameters)
            
            if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems {
                let queryItemsWithoutSignature = queryItems.dropLast()
                
                XCTAssertEqual(queryItemsWithoutSignature.last?.name, "timestamp")
            } else {
                XCTFail("Failed to generate urlCompoments")
            }
        } catch {
            XCTFail("Failed to generate query items: \(error)")
        }
    }
    
    func test_query_items_contains_signature() {
        let builder = BinanceURLBuilder(secretKey: mockSecretKey)
        let parameters: [String: Any] = ["param1": "value1", "param2": 42]

        do {
            let url = try builder.makeURL(endpoint: "testEndpoint", parameters: parameters)
            
            if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems {
                XCTAssertEqual(queryItems.last?.name, "signature")
            } else {
                XCTFail("Failed to generate urlCompoments")
            }
        } catch {
            XCTFail("Failed to generate query items: \(error)")
        }
    }
}
