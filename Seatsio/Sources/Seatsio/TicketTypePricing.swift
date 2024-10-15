import Foundation

public struct TicketTypePricing: Codable {

    public let ticketType: String
    public let price: Float
    public let label: String?
    public let description: String?

    public init(ticketType: String, price: Float, label: String? = nil, description: String? = nil) {
        self.ticketType = ticketType
        self.price = price
        self.label = label
        self.description = description
    }
}
