//
//  SeatsioObjectPricing.swift
//  seatsio-ios
//
//  Created by Steve Chaloner on 01/10/2025.
//


import Foundation

public enum StringOrFloat: Codable {
    case string(String)
    case float(Float)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let floatValue = try? container.decode(Float.self) {
            self = .float(floatValue)
        } else if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else {
            throw DecodingError.typeMismatch(StringOrFloat.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected String or Float"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .string(let stringValue):
            try container.encode(stringValue)
        case .float(let floatValue):
            try container.encode(floatValue)
        }
    }
}

public struct SeatsioObjectPricing: Codable {
    public let ticketType: String?
    public let price: Float?
    public let formattedPrice: StringOrFloat?
    public let originalPrice: Float?
    public let formattedOriginalPrice: StringOrFloat?
    public let label: String?
    public let fee: Float?
    public let description: String?

    public init(ticketType: String? = nil, price: Float? = nil, formattedPrice: StringOrFloat? = nil, originalPrice: Float? = nil, formattedOriginalPrice: StringOrFloat? = nil,
                label: String? = nil, fee: Float? = nil, description: String? = nil) {
        self.ticketType = ticketType
        self.price = price
        self.formattedPrice = formattedPrice
        self.originalPrice = originalPrice
        self.formattedOriginalPrice = formattedOriginalPrice
        self.label = label
        self.fee = fee
        self.description = description
    }
    
    private enum CodingKeys: String, CodingKey {
        case ticketType
        case price
        case formattedPrice
        case originalPrice
        case formattedOriginalPrice
        case label
        case fee
        case description
    }
}
