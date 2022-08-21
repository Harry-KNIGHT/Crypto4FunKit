//
//  FetchNewsApi.swift
//  Crypto4FunKit
//
//  Created by Elliot Knight on 31/07/2022.
//

import Foundation

@available(macOS 12.0, *)
public struct NewsApi {
	
	public static func fetchNews() async throws -> [NewsResponseElement] {
		let url = "https://cryptocurrency-news-tracker.herokuapp.com/news"

		guard let url = URL(string: url) else {
			throw ApiError.urlNotFound
		}

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
			throw ApiError.outOfBounds
		}

		do {
			 return try JSONDecoder().decode([NewsResponseElement].self, from: data)
		} catch {
			throw error
		}
	}
}
