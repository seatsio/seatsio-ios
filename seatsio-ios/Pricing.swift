import Foundation

public struct Pricing: Codable {

    let category: Int?
    let price: Float?
    let ticketTypes: [TicketTypePricing]?

    public init(category: Int, price: Float) {
        self.category = category
        self.price = price
        self.ticketTypes = nil
    }

    public init(category: Int, ticketTypes: [TicketTypePricing]) {
        self.category = category
        self.price = nil
        self.ticketTypes = ticketTypes
    }
}
