import Foundation

public struct BestAvailable: Codable {

    public let number: Int?
    public let category: [String]?
    public let clearSelection: Bool?
    public let ticketTypes: [String:Int]?

    public init(number: Int? = nil,
         category: [String]? = nil,
         clearSelection: Bool? = nil,
         ticketTypes: [String:Int]? = nil) {
        self.number = number
        self.category = category
        self.clearSelection = clearSelection
        self.ticketTypes = ticketTypes
    }
}
