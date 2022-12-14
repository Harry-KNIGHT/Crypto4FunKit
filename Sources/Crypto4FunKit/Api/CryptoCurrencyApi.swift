//
//  CryptoCurrencyApi.swift
//  Crypto4FunKit
//
//  Created by Elliot Knight on 13/07/2022.
//

import Foundation

public enum ApiError: Error {
	case urlNotFound, outOfBounds
}

@available(macOS 12.0, *)
@available(watchOS 6.0.0, *)

public struct CryptoApi {

	/// Fetch 100 cryptocurrencies
	/// - Returns: [CryptoCurrencyModel]
	public static func fetchCryptoCurrency(_ cryptosNumber: Int = 100) async throws -> [CryptoCurrencyModel] {
		let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=\(cryptosNumber)&page=1&sparkline=false&price_change_percentage=%271h%2C%2024h%2C%207d"

		guard let url = URL(string: url) else {
			throw ApiError.urlNotFound
		}
		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw ApiError.outOfBounds
		}

		do {
			return try JSONDecoder().decode([CryptoCurrencyModel].self, from: data)
		} catch {
			throw error
		}
	}

}
