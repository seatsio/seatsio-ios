import Foundation

struct Pricing: Encodable {

    let category: String
    let price: Float?
    let ticketTypes: [TicketTypePricing]?

    init(category: String, price: Float) {
        self.category = category
        self.price = price
        self.ticketTypes = nil
    }

    init(category: String, ticketTypes: [TicketTypePricing]) {
        self.category = category
        self.price = nil
        self.ticketTypes = ticketTypes
    }
}
