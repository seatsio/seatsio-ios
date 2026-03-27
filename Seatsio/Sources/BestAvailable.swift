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

public struct BestAvailableForHolding: Codable {
    public let number: Int?
    public let categories: [String]?
    public let zone: String?
    public let sections: [String]?
    public let accessibleSeats: Int?
    public let ticketTypes: [String:Int]?

    public init(number: Int? = nil,
         categories: [String]? = nil,
         zone: String? = nil,
         sections: [String]? = nil,
         accessibleSeats: Int? = nil,
         ticketTypes: [String:Int]? = nil) {
        self.number = number
        self.categories = categories
        self.zone = zone
        self.sections = sections
        self.accessibleSeats = accessibleSeats
        self.ticketTypes = ticketTypes
    }
}

public struct BestAvailableHeldResult: Decodable {
    public let objects: [SeatsioObject]
    public let nextToEachOther: Bool?
}
