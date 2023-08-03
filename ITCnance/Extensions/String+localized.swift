//
//  String+localized.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 03/08/2023.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
