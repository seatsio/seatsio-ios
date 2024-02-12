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

    public init(objectType: String, label: String, labels: Labels, id: String, category: Category? = nil, center: Point? = nil, pricing: Pricing? = nil, status: String? = nil, forSale: Bool? = nil, selectable: Bool? = nil, inSelectableChannel: Bool? = nil, selected: Bool? = nil, selectedTicketType: String? = nil, accessible: Bool? = nil, companionSeat: Bool? = nil, restrictedView: Bool? = nil, disabledBySocialDistancingRules: Bool? = nil, capacity: Int? = nil, numBooked: Int? = nil, numFree: Int? = nil, numSelected: Int? = nil, selectionPerTicketType: [String:Int]? = nil, sectionCategory: Category? = nil, numberOfSelectableObjects: Int? = nil, numberOfSelectedObjects: Int? = nil, selectableCategories: [Category]? = nil, isInteractive: Bool? = nil) {
        self.objectType = objectType
        self.label = label
        self.labels = labels
        self.id = id

        self.category = category
        self.center = center
        self.pricing = pricing
        self.status = status
        self.forSale = forSale
        self.selectable = selectable
        self.inSelectableChannel = inSelectableChannel
        self.selected = selected
        self.selectedTicketType = selectedTicketType
        self.accessible = accessible
        self.companionSeat = companionSeat
        self.restrictedView = restrictedView
        self.disabledBySocialDistancingRules = disabledBySocialDistancingRules

        self.capacity = capacity
        self.numBooked = numBooked
        self.numFree = numFree
        self.numSelected = numSelected
        self.selectionPerTicketType = selectionPerTicketType

        self.sectionCategory = sectionCategory
        self.numberOfSelectableObjects = numberOfSelectableObjects
        self.numberOfSelectedObjects = numberOfSelectedObjects
        self.selectableCategories = selectableCategories
        self.isInteractive = isInteractive
    }
}

extension SeatsioObject: Equatable {

    public static func == (lhs: SeatsioObject, rhs: SeatsioObject) -> Bool {
        lhs.id == rhs.id
    }
}
