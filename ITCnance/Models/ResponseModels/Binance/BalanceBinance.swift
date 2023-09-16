//
//  BalanceBinance.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 06/08/2023.
//

import Foundation

struct BalanceBinance: Codable {
    let accountAlias: String
    let asset: String
    let balance: String
    let crossWalletBalance: String
    let crossUnPnl: String
    let availableBalance: String
    let maxWithdrawAmount: String
    let marginAvailable: Bool
    let updateTime: Int64
}
