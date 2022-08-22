//
//  NFTModel.swift
//  Crypto4FunKit
//
//  Created by Nyl Neuville on 06/07/2022.
//

import Foundation

// MARK: - NFTResponseElement
/// NFT model.
public struct NFTModel: Codable, Identifiable, Hashable {
    public let id = UUID()
    public let rank: Int
    public let iconURL: String?
    public let contractName, productPath: String
    public let baseCurrency: BaseCurrency
    public let isSalesOnly: Bool
    public let value, valueUSD: Double
    public let platform, buyers, sellers, owners: Int
    public let transactions: Int
    public let changeInValueUSD: Double?
    public let previousValue, previousValueUSD: Double
    public let isSlamLandDisabled: Bool

    public enum CodingKeys: String, CodingKey {
        case id
        case rank
        case iconURL = "iconUrl"
        case contractName
        case productPath, baseCurrency, isSalesOnly, value, valueUSD, platform, buyers, sellers, owners, transactions, changeInValueUSD, previousValue, previousValueUSD, isSlamLandDisabled
    }
}

/// Currencies.
public enum BaseCurrency: String, Codable {
	case dai = "DAI"
	case eth = "ETH"
	case flow = "Flow"
	case sol = "SOL"
	case usd = "USD"
	case xtz = "XTZ"
	case bnb = "BNB"
	case one = "ONE"
	case algo = "ALGO"
	case near = "NEAR"
	case osmo = "OSMO"
	case egld = "EGLD"
	case wax = "WAX"
}

public typealias NFTResponse = [NFTModel]


/// Time range to select onChange.
public enum NftTimeRange: String, Hashable {
	case day = "day"
	case week = "week"
	case month = "month"
	case all = "all"

}

extension NFTModel {
	public static var nftSample =  NFTModel(rank: 1, iconURL: "https://d1nht67oz99wd1.cloudfront.net/resized/BoredApeYachtClub_resized.ico", contractName: "Bored Ape Yacht Club", productPath: "bored-ape-yacht-club", baseCurrency: .eth, isSalesOnly: false, value: 165809.354511213, valueUSD: 10207307.4, platform: 0, buyers: 76, sellers: 97, owners: 0, transactions: 122, changeInValueUSD: -17.106837664027900, previousValue: 182801.49779153, previousValueUSD: 12313811.07, isSlamLandDisabled: false)
}
