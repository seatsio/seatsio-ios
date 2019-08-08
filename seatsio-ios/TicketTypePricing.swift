import Foundation

public struct TicketTypePricing: Codable {

    let ticketType: String
    let price: Float
    let label: String?

    init(ticketType: String, price: Float, label: String? = nil) {
        self.ticketType = ticketType
        self.price = price
        self.label = label
    }
}
