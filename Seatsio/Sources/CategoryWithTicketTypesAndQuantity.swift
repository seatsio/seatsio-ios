import Foundation

public struct CategoryWithTicketTypesAndQuantity: Encodable {
    
    public let category: String
    public let ticketTypes: [TicketTypeWithQuantity]
    
    public init(category: String, ticketTypes: [TicketTypeWithQuantity]) {
        self.category = category
        self.ticketTypes = ticketTypes
    }
}
