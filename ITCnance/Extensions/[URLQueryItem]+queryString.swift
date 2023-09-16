//
//  [URLQueryItem]+queryString.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 07/08/2023.
//

import Foundation

extension Array where Element == URLQueryItem {
    var string: String? {
        var components = URLComponents()
        components.queryItems = self
        return components.query
    }
}
