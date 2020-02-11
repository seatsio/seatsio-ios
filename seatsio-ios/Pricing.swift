import Foundation

public struct Pricing: Codable {

    public let category: String?
    public let price: Float?
    public let ticketTypes: [TicketTypePricing]?

    public init(category: String, price: Float) {
        self.category = category
        self.price = price
        self.ticketTypes = nil
    }

    public init(category: String, ticketTypes: [TicketTypePricing]) {
        self.category = category
        self.price = nil
        self.ticketTypes = ticketTypes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? container.decodeIfPresent(Int.self, forKey: .category) {
            if (value == nil) {
                category = nil
            } else {
                category = String(value!)
            }
        } else {
            category = try container.decodeIfPresent(String.self, forKey: .category)
        }
        price = try container.decodeIfPresent(Float.self, forKey: .price)
        ticketTypes = try container.decodeIfPresent([TicketTypePricing].self, forKey: .ticketTypes)
    }

    private enum CodingKeys: String, CodingKey {
        case category
        case price
        case ticketTypes
    }
}
