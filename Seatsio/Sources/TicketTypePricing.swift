import Foundation

public struct TicketTypePricing: Codable {

    public let ticketType: String
    public let price: Float
    public let label: String?
    public let description: String?
    public let primary: Bool?
    public let originalPrice: Float?
    public let fee: Float?

    public init(ticketType: String, price: Float, label: String? = nil, description: String? = nil, primary: Bool? = nil, originalPrice: Float? = nil, fee: Float? = nil) {
        self.ticketType = ticketType
        self.price = price
        self.label = label
        self.description = description
        self.primary = primary
        self.originalPrice = originalPrice
        self.fee = fee
    }
    
    private enum CodingKeys: String, CodingKey {
        case ticketType
        case price
        case label
        case description
        case primary
        case originalPrice
        case fee
    }
}
