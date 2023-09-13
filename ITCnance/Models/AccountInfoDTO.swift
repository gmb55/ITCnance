//
//  AccountInfoDTO.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 13/09/2023.
//

import Foundation

struct AccountInfoDTO: Codable {
    let updateTime: Int
    let totalInitialMargin: String
    let totalWalletBalance: String
    let totalUnrealizedProfit: String
    let totalMarginBalance: String
}
