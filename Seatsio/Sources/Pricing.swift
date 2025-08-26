import Foundation

public struct Pricing: Codable {

    public let category: String?
    public let price: Float?
    public let ticketTypes: [TicketTypePricing]?
    public let channels: [ChannelPricing]?

    public init(category: String, price: Float) {
        self.category = category
        self.price = price
        self.ticketTypes = nil
        self.channels = nil
    }

    public init(category: String, ticketTypes: [TicketTypePricing]) {
        self.category = category
        self.price = nil
        self.ticketTypes = ticketTypes
        self.channels = nil
    }

    public init(category: String, price: Float, channels: [ChannelPricing]) {
        self.category = category
        self.price = price
        self.ticketTypes = nil
        self.channels = channels
    }

    public init(category: String, ticketTypes: [TicketTypePricing], channels: [ChannelPricing]) {
        self.category = category
        self.price = nil
        self.ticketTypes = ticketTypes
        self.channels = channels
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? container.decodeIfPresent(Int.self, forKey: .category) {
            category = String(value)
        } else {
            category = try container.decodeIfPresent(String.self, forKey: .category)
        }
        price = try container.decodeIfPresent(Float.self, forKey: .price)
        ticketTypes = try container.decodeIfPresent([TicketTypePricing].self, forKey: .ticketTypes)
        channels = try container.decodeIfPresent([ChannelPricing].self, forKey: .channels)
    }

    private enum CodingKeys: String, CodingKey {
        case category
        case price
        case ticketTypes
        case channels
    }
}
