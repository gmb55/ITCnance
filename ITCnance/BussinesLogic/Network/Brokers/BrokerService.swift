//
//  BrokerService.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 04/08/2023.
//

import Foundation

protocol BrokerService {
    var baseURLString: String { get }
    
    var balanceEndpoint: String { get }
    func balance() async throws -> Data
}
