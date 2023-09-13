//
//  Endpoint.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/09/2023.
//

import Foundation

protocol Endpoint {
    var endpoint: String { get }
    var parameters: [String : Any] { get }
    var method: HTTPMethod { get }
}
