import Foundation

public struct Section: Decodable {
    public let objectType: String
    public let sectionCategory: Category?
    public let label: String?
    public let numberOfSelectableObjects: Int?
    public let numberOfSelectedObjects: Int?
    public let selectableCategories: [Category]?
    public let isInteractive: Bool?

    public init(objectType: String, sectionCategory: Category? = nil, label: String? = nil,
                numberOfSelectableObjects: Int? = nil, numberOfSelectedObjects: Int? = nil,
                selectableCategories: [Category]? = nil, isInteractive: Bool? = nil) {
        self.objectType = objectType
        self.sectionCategory = sectionCategory
        self.label = label
        self.numberOfSelectableObjects = numberOfSelectableObjects
        self.numberOfSelectedObjects = numberOfSelectedObjects
        self.selectableCategories = selectableCategories
        self.isInteractive = isInteractive
    }
}
