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

    public let capacity: Int?
    public let numBooked: Int?
    public let numFree: Int?
    public let numSelected: Int?
    public let selectionPerTicketType: [String: Int]?

    public let sectionCategory: Category?
    public let numberOfSelectableObjects: Int?
    public let numberOfSelectedObjects: Int?
    public let selectableCategories: [Category]?
    public let isInteractive: Bool?

    private var chart: SeatingChart?

    enum CodingKeys: CodingKey {
        case objectType
        case label
        case labels
        case id
        case category
        case center
        case pricing
        case status
        case forSale
        case selectable
        case inSelectableChannel
        case selected
        case selectedTicketType
        case extraData
        case capacity
        case numBooked
        case numFree
        case numSelected
        case selectionPerTicketType
        case sectionCategory
        case numberOfSelectableObjects
        case numberOfSelectedObjects
        case selectableCategories
        case isInteractive
    }

    mutating func setChart(_ chart: SeatingChart) {
        self.chart = chart
    }

    func select(_ ticketType: String? = nil) {
        self.chart!.selectObject(label, ticketType);
    }

    func deselect(_ ticketType: String? = nil) {
        self.chart!.deselectObject(label, ticketType);
    }

    func pulse() {
        self.chart!.pulseObject(label);
    }

    func unpulse() {
        self.chart!.unpulseObject(label);
    }

    func isInChannel(_ channel: String, _ callback: @escaping (Bool) -> ()) {
        self.chart!.isObjectInChannel(label, channel, callback);
    }
}
