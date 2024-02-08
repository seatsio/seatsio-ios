import Foundation

public struct SeatsioObject: Decodable {

    enum CodingKeys: String, CodingKey {
        case objectType, label, labels, id, category, center, pricing, status, forSale, selectable, inSelectableChannel, selected, selectedTicketType, extraData, accessible, companionSeat, restrictedView, disabledBySocialDistancingRules, capacity, numBooked, numFree, numSelected, selectionPerTicketType, sectionCategory, numberOfSelectableObjects, numberOfSelectedObjects, selectableCategories, isInteractive
    }

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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        objectType = try container.decode(String.self, forKey: CodingKeys.objectType)
        label = try container.decode(String.self, forKey: CodingKeys.label)
        labels = try container.decode(Labels.self, forKey: CodingKeys.labels)
        id = try container.decode(String.self, forKey: CodingKeys.id)

        category = try? container.decode(Category.self, forKey: CodingKeys.category)
        center = try? container.decode(Point.self, forKey: CodingKeys.center)
        pricing = try? container.decode(Pricing.self, forKey: CodingKeys.pricing)
        status = try? container.decode(String.self, forKey: CodingKeys.status)
        forSale = try? container.decode(Bool.self, forKey: CodingKeys.forSale)
        selectable = try? container.decode(Bool.self, forKey: CodingKeys.selectable)
        inSelectableChannel = try? container.decode(Bool.self, forKey: CodingKeys.inSelectableChannel)
        selected = try? container.decode(Bool.self, forKey: CodingKeys.selected)
        selectedTicketType = try? container.decode(String.self, forKey: CodingKeys.selectedTicketType)
        extraData = try? container.decode(Data.self, forKey: CodingKeys.extraData)
        accessible = try? container.decode(Bool.self, forKey: CodingKeys.accessible)
        companionSeat = try? container.decode(Bool.self, forKey: CodingKeys.companionSeat)
        restrictedView = try? container.decode(Bool.self, forKey: CodingKeys.restrictedView)
        disabledBySocialDistancingRules = try? container.decode(Bool.self, forKey: CodingKeys.disabledBySocialDistancingRules)

        capacity = try? container.decode(Int.self, forKey: CodingKeys.capacity)
        numBooked = try? container.decode(Int.self, forKey: CodingKeys.numBooked)
        numFree = try? container.decode(Int.self, forKey: CodingKeys.numFree)
        numSelected = try? container.decode(Int.self, forKey: CodingKeys.numSelected)
        selectionPerTicketType = try? container.decode([String:Int].self, forKey: CodingKeys.selectionPerTicketType)

        sectionCategory = try? container.decode(Category.self, forKey: CodingKeys.sectionCategory)
        numberOfSelectableObjects = try? container.decode(Int.self, forKey: CodingKeys.numberOfSelectableObjects)
        numberOfSelectedObjects = try? container.decode(Int.self, forKey: CodingKeys.numberOfSelectedObjects)
        selectableCategories = try? container.decode([Category].self, forKey: CodingKeys.selectableCategories)
        isInteractive = try? container.decode(Bool.self, forKey: CodingKeys.isInteractive)
    }
}
