import Foundation

public struct CategoryPricing: Codable {

    public let category: Any
    public let price: Float?
    public let originalPrice: Float?
    public let fee: Float?
    public let ticketTypes: [TicketTypePricing]?
    public let channels: [ChannelPricing]?

    public init(category: Int, price: Float, originalPrice: Float? = nil, fee: Float? = nil, channels: [ChannelPricing]? = nil) {
        self.category = category
        self.price = price
        self.originalPrice = originalPrice
        self.fee = fee
        self.channels = channels
        self.ticketTypes = nil
    }

    public init(category: String, price: Float, originalPrice: Float? = nil, fee: Float? = nil, channels: [ChannelPricing]? = nil) {
        self.category = category
        self.price = price
        self.originalPrice = originalPrice
        self.fee = fee
        self.channels = channels
        self.ticketTypes = nil
    }

    public init(category: Int, ticketTypes: [TicketTypePricing]) {
        self.category = category
        self.ticketTypes = ticketTypes
        self.price = nil
        self.originalPrice = nil
        self.fee = nil
        self.channels = nil
    }

    public init(category: String, ticketTypes: [TicketTypePricing]) {
        self.category = category
        self.ticketTypes = ticketTypes
        self.price = nil
        self.originalPrice = nil
        self.fee = nil
        self.channels = nil
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? container.decodeIfPresent(Int.self, forKey: .category) {
            category = value
        } else {
            category = try container.decode(String.self, forKey: .category)
        }
        price = try container.decodeIfPresent(Float.self, forKey: .price)
        originalPrice = try container.decodeIfPresent(Float.self, forKey: .originalPrice)
        fee = try container.decodeIfPresent(Float.self, forKey: .fee)
        ticketTypes = try container.decodeIfPresent([TicketTypePricing].self, forKey: .ticketTypes)
        channels = try container.decodeIfPresent([ChannelPricing].self, forKey: .channels)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if (self.category is Int) {
            try container.encode((self.category as! Int), forKey: .category)
        } else {
            try container.encode((self.category as! String), forKey: .category)
        }
        try container.encodeIfPresent(self.price, forKey: .price)
        try container.encodeIfPresent(self.originalPrice, forKey: .originalPrice)
        try container.encodeIfPresent(self.fee, forKey: .fee)
        try container.encodeIfPresent(self.ticketTypes, forKey: .ticketTypes)
        try container.encodeIfPresent(self.channels, forKey: .channels)
    }

    private enum CodingKeys: String, CodingKey {
        case category
        case price
        case originalPrice
        case fee
        case ticketTypes
        case channels
    }
}
