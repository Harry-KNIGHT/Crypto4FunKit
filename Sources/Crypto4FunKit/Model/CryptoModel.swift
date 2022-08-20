//
//  CryptoModel.swift
//  Crypto4FunKit
//
//  Created by Elliot Knight on 12/06/2022.
//

import Foundation
/*
 Documentation: https://docs.bitfine.com/reference/rest-public-tickers
 */

public struct CryptoCurrencyModel: Codable, Hashable {
	internal init(id: String, name: String, image: String, currentPrice: Double, priceChangePercentage24h: Float) {
		self.id = id
		self.name = name
		self.image = image
		self.currentPrice = currentPrice
		self.priceChangePercentage24h = priceChangePercentage24h
	}

	public let id, name: String
	public let image: String
	public let currentPrice: Double
	public let priceChangePercentage24h: Float

	public enum CodingKeys: String, CodingKey {
		case id, name
		case image
		case currentPrice = "current_price"
		case priceChangePercentage24h = "price_change_percentage_24h"
	}
}

extension CryptoCurrencyModel {
	public static var cryptoSample = CryptoCurrencyModel(id: "btc", name: "bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?", currentPrice: 23.456, priceChangePercentage24h: -0.26766)
}
