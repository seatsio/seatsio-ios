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
