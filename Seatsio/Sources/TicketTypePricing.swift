import Foundation

public struct TicketTypePricing: Codable {

    public let ticketType: String
    public let price: Float
    public let label: String?
    public let description: String?
    public let primary: Bool?

    public init(ticketType: String, price: Float, label: String? = nil, description: String? = nil, primary: Bool? = nil) {
        self.ticketType = ticketType
        self.price = price
        self.label = label
        self.description = description
        self.primary = primary
    }
}
