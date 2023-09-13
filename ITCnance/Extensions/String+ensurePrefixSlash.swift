//
//  String+ensurePrefixSlash.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 04/09/2023.
//

import Foundation

extension String {
    func ensurePrefixSlash() -> String {
        hasPrefix("/") ? self : "/" + self
    }
}
