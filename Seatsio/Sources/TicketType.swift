import Foundation

public struct TicketType: Codable {

    public let price: Float
    public let ticketType: String

    public init(price: Float, ticketType: String) {
        self.price = price
        self.ticketType = ticketType
    }
}
