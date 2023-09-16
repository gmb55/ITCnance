//
//  AccountInfoBinance.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 13/09/2023.
//

import Foundation

struct AccountInfoBinance: Codable {
    let feeTier: Int
    let canTrade: Bool
    let canDeposit: Bool
    let canWithdraw: Bool
    let updateTime: Int
    let multiAssetsMargin: Bool
    let tradeGroupId: Int
    let totalInitialMargin: String
    let totalMaintMargin: String
    let totalWalletBalance: String
    let totalUnrealizedProfit: String
    let totalMarginBalance: String
    let totalPositionInitialMargin: String
    let totalOpenOrderInitialMargin: String
    let totalCrossWalletBalance: String
    let totalCrossUnPnl: String
    let availableBalance: String
    let maxWithdrawAmount: String
    let assets: [AssetInfoBinance]
    let positions: [PositionInfoBinance]

    func toDTO() -> AccountInfoDTO {
        AccountInfoDTO(
            updateTime: updateTime,
            totalInitialMargin: totalInitialMargin,
            totalWalletBalance: totalWalletBalance,
            totalUnrealizedProfit: totalUnrealizedProfit,
            totalMarginBalance: totalMarginBalance
        )
    }
}

struct AssetInfoBinance: Codable {
    let asset: String
    let walletBalance: String
    let unrealizedProfit: String
    let marginBalance: String
    let maintMargin: String
    let initialMargin: String
    let positionInitialMargin: String
    let openOrderInitialMargin: String
    let crossWalletBalance: String
    let crossUnPnl: String
    let availableBalance: String
    let maxWithdrawAmount: String
    let marginAvailable: Bool
    let updateTime: Int
}

struct PositionInfoBinance: Codable {
    let symbol: String
    let initialMargin: String
    let maintMargin: String
    let unrealizedProfit: String
    let positionInitialMargin: String
    let openOrderInitialMargin: String
    let leverage: String
    let isolated: Bool
    let entryPrice: String
    let maxNotional: String
    let bidNotional: String
    let askNotional: String
    let positionSide: String
    let positionAmt: String
    let updateTime: Int
}
