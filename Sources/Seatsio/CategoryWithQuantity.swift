import Foundation

public struct CategoryWithQuantity: Encodable {

    public let category: String
    public let quantity: Int
    
    public init(category: String, quantity: Int) {
        self.category = category
        self.quantity = quantity
    }
}
