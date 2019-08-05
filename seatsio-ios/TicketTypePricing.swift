import Foundation

class TicketTypePricing: Encodable {

    let ticketType: String
    let price: Float
    let label: String

    init(ticketType: String, price: Float, label: String) {
        self.ticketType = ticketType
        self.price = price
        self.label = label
    }
}
