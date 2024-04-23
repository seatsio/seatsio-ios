import Foundation

public struct TicketTypePricing: Codable {

    let ticketType: String
    let price: Float
    let label: String?
    let description: String?

    public init(ticketType: String, price: Float, label: String? = nil, description: String? = nil) {
        self.ticketType = ticketType
        self.price = price
        self.label = label
        self.description = description
    }
}
