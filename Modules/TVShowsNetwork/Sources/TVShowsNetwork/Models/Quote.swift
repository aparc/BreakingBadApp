//
// Quote.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Quote: Codable, JSONEncodable, Hashable {

    public var quoteId: Double
    public var quote: String
    public var author: String
    public var series: String

    public init(quoteId: Double, quote: String, author: String, series: String) {
        self.quoteId = quoteId
        self.quote = quote
        self.author = author
        self.series = series
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case quoteId = "quote_id"
        case quote
        case author
        case series
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(quoteId, forKey: .quoteId)
        try container.encode(quote, forKey: .quote)
        try container.encode(author, forKey: .author)
        try container.encode(series, forKey: .series)
    }
}
