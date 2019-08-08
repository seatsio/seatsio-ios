import Foundation

public struct SelectedObject: Encodable {

    let label: String
    let amount: Int?
    let ticketType: String?

    public init(_ label: String, amount: Int? = nil, ticketType: String? = nil) {
        self.label = label
        self.amount = amount
        self.ticketType = ticketType
    }
}
