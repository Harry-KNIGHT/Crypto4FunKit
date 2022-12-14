//
//  FetchChartApi.swift
//  Crypto4FunKit
//
//  Created by Elliot Knight on 13/07/2022.
//

import Foundation


@available(macOS 12.0, *)
@available(watchOS 6.0.0, *)

public struct ChartApi {

	/// Fetch chart data from cryptocurrency id & time range.
	/// - Parameters:
	///   - id: name of the cryptocurrency
	///   - firstDate: First date of the the chart  in Epoch format
	///   - today: Today date for chart time range in Epoch format
	/// - Returns: CurrencyChartResponse
	public static func fetchChart(_ id: String, from firstDate: Double, to today: Double = Date().timeIntervalSince1970) async throws -> CurrencyChartModel {
		let url = "https://api.coingecko.com/api/v3/coins/\(id)/market_chart/range?vs_currency=usd&from=\(String(firstDate))&to=\(String(today))"

		guard let url = URL(string: url) else {
			throw ApiError.urlNotFound
		}

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
			print(response)
			throw ApiError.outOfBounds
		}

		do {
			return try JSONDecoder().decode(CurrencyChartModel.self, from: data)
		} catch {
			throw error
		}
	}
}
