//
//  URLBuilder.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/09/2023.
//

import Foundation

protocol URLBuilder {
    var baseURL: String { get }
    var secretKey: String { get }
    
    func makeURL(endpoint: String, parameters: [String : Any]) throws -> URL
}
