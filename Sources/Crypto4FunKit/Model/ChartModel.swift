//
//  ChartModel.swift
//  Crypto4FunKit
//
//  Created by Elliot Knight on 04/07/2022.
//

import Foundation

/// Crypto chart model.
public struct CurrencyChartModel: Codable {
	internal init(prices: [[Double]], marketCaps: [[Double]], totalVolumes: [[Double]]) {
		self.prices = prices
		self.marketCaps = marketCaps
		self.totalVolumes = totalVolumes
	}
	
	public let prices, marketCaps, totalVolumes: [[Double]]
	public enum CodingKeys: String, CodingKey {
		case prices
		case marketCaps = "market_caps"
		case totalVolumes = "total_volumes"
	}
}

/// Epoch unix time for choose time range to show in chart.
public enum EpochUnixTime: Double, CaseIterable {
	case day = 86400
	case week = 604800
	case month = 2419200
	case year = 29030400
	case max = 145152000
	public var name: String {
		switch self {
		case .day:
			return "Day"
		case .week:
			return "Week"
		case .month:
			return "Month"
		case .year:
			return "Year"
		case .max:
			return "Max"
		}
	}
}
