import Foundation

public struct SeatsioObject: Decodable {
    public let objectType: String
    public let label: String
    public let labels: Labels
    public let id: String

    public let category: Category?
    public let center: Point?
    public let pricing: Pricing?
    public let status: String?
    public let forSale: Bool?
    public let selectable: Bool?
    public let inSelectableChannel: Bool?
    public let selected: Bool?
    public let selectedTicketType: String?
    public let extraData: Data?
    public let accessible: Bool?
    public let companionSeat: Bool?
    public let restrictedView: Bool?
    public let disabledBySocialDistancingRules: Bool?

    public let capacity: Int?
    public let numBooked: Int?
    public let numFree: Int?
    public let numSelected: Int?
    public let selectionPerTicketType: [String:Int]?

    public let sectionCategory: Category?
    public let numberOfSelectableObjects: Int?
    public let numberOfSelectedObjects: Int?
    public let selectableCategories: [Category]?
    public let isInteractive: Bool?
}
