import Foundation

struct BestAvailable: Codable {

    let number: Int?
    let category: [String]?
    let clearSelection: Bool?
    let ticketTypes: [String:Int]?

    init(number: Int? = nil,
         category: [String]? = nil,
         clearSelection: Bool? = nil,
         ticketTypes: [String:Int]? = nil) {
        self.number = number
        self.category = category
        self.clearSelection = clearSelection
        self.ticketTypes = ticketTypes
    }
}
