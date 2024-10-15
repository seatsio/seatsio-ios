import Foundation

public struct SelectedObject: Encodable {

    public let label: String
    public let amount: Int?
    public let ticketType: String?

    public init(_ label: String, amount: Int? = nil, ticketType: String? = nil) {
        self.label = label
        self.amount = amount
        self.ticketType = ticketType
    }
}
