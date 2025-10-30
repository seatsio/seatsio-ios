//
//  SeatsioObjectPricing.swift
//  seatsio-ios
//
//  Created by Steve Chaloner on 01/10/2025.
//


import Foundation

public struct SeatsioObjectPricing: Codable {

    public let ticketType: String?
    public let price: Float?
    public let formattedPrice: String?
    public let originalPrice: Float?
    public let formattedOriginalPrice: String?
    public let label: String?
    public let fee: Float?
    public let description: String?

    public init(ticketType: String? = nil, price: Float? = nil, formattedPrice: String? = nil, originalPrice: Float? = nil, formattedOriginalPrice: String? = nil,
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ticketType = try container.decodeIfPresent(String.self, forKey: .ticketType)
        price = try container.decodeIfPresent(Float.self, forKey: .price)
        if let value = try? container.decodeIfPresent(Float.self, forKey: .formattedPrice) {
            formattedPrice = String(value)
        } else {
            formattedPrice = try container.decodeIfPresent(String.self, forKey: .formattedPrice)
        }
        originalPrice = try container.decodeIfPresent(Float.self, forKey: .originalPrice)
        if let value = try? container.decodeIfPresent(Float.self, forKey: .formattedOriginalPrice) {
            formattedOriginalPrice = String(value)
        } else {
            formattedOriginalPrice = try container.decodeIfPresent(String.self, forKey: .formattedOriginalPrice)
        }
        label = try container.decodeIfPresent(String.self, forKey: .label)
        fee = try container.decodeIfPresent(Float.self, forKey: .fee)
        description = try container.decodeIfPresent(String.self, forKey: .description)
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

