//
//  API.swift
//  Crypto4FunKit
//
//  Created by Elliot Knight on 17/06/2022.
//

import Foundation

@available(macOS 12.0, *)
public struct FetchNftApi {

	public static func fetchNFT(_ timeRange: NftTimeRange) async throws -> [NFTModel]  {
		let url = "https://api.cryptoslam.io/v1/collections/top-100?timeRange=\(timeRange.rawValue)"

        guard let url = URL(string: url) else {
			throw ApiError.urlNotFound
        }

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
			throw ApiError.outOfBounds
		}

        do {
           return try JSONDecoder().decode([NFTModel].self, from: data)
        } catch {
			throw error
		}
    }
	
}
