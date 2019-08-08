import Foundation

public class TicketListing: Encodable {

    var section: String
    var quantity: Int
    var price: Float

    init(section: String, quantity: Int, price: Float) {
        self.section = section
        self.quantity = quantity
        self.price = price
    }
}
