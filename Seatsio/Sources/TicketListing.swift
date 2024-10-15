import Foundation

public struct TicketListing: Encodable {

    public let section: String
    public let quantity: Int
    public let price: Float

    public init(section: String, quantity: Int, price: Float) {
        self.section = section
        self.quantity = quantity
        self.price = price
    }
}
