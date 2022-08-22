//
//  NewsModel.swift
//  Crypto4FunKit
//
//  Created by Elliot Knight on 31/07/2022.
//

import Foundation

/// News model
public struct NewsModel: Hashable, Codable {
	internal init(title: String, url: String, source: Source) {
		self.title = title
		self.url = url
		self.source = source
	}

	public let title: String
	public let url: String
	public let source: Source
}

public enum Source: String, Codable {
	case cryptonewsCOM = "cryptonews.com"
	case cryptonewsNet = "cryptonews.net"
}

public typealias NewsResponse = [NewsModel]

