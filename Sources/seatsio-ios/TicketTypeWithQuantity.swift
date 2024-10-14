import Foundation

public struct TicketTypeWithQuantity: Encodable {

    public let ticketType: String
    public let quantity: Int
    
    public init(ticketType: String, quantity: Int) {
        self.ticketType = ticketType
        self.quantity = quantity
    }
}
