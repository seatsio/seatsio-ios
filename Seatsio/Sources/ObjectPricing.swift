import Foundation

public struct ObjectPricing: Codable {

    public let objects: [String]
    public let price: Float?
    public let originalPrice: Float?
    public let fee: Float?
    public let ticketTypes: [TicketTypePricing]?

    public init(objects: [String], price: Float, originalPrice: Float? = nil, fee: Float? = nil) {
        self.objects = objects
        self.price = price
        self.originalPrice = originalPrice
        self.fee = fee
        self.ticketTypes = nil
    }

    public init(objects: [String], ticketTypes: [TicketTypePricing]) {
        self.objects = objects
        self.ticketTypes = ticketTypes
        self.price = nil
        self.originalPrice = nil
        self.fee = nil
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        objects = try container.decode([String].self, forKey: .objects)
        price = try container.decodeIfPresent(Float.self, forKey: .price)
        originalPrice = try container.decodeIfPresent(Float.self, forKey: .originalPrice)
        fee = try container.decodeIfPresent(Float.self, forKey: .fee)
        ticketTypes = try container.decodeIfPresent([TicketTypePricing].self, forKey: .ticketTypes)
    }

    private enum CodingKeys: String, CodingKey {
        case objects
        case price
        case originalPrice
        case fee
        case ticketTypes
    }
}
