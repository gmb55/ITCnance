//
//  BrokerService.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 04/08/2023.
//

import Foundation

protocol BrokerProvider {
    // MARK: - Decode

    func decode<T>(data: Data, response: URLResponse) throws -> T where T: Decodable

    // MARK: - Endpoints

    func accountInfo(_ model: Endpoint) async throws -> AccountInfoDTO
}
