import Foundation

public struct ConfigChange: Encodable {

    public let objectColor: String?
    public let objectLabel: String?
    public let numberOfPlacesToSelect: Int?
    public let maxSelectedObjects: AnyEncodable?
    public let extraConfig: AnyEncodable?
    public let availableCategories: [String]?
    public let unavailableCategories: [String]?
    public let filteredCategories: [String]?
    public let pricing: [Pricing]?
    public let channels: [String]?

    public init(objectColor: String? = nil, objectLabel: String? = nil, numberOfPlacesToSelect: Int? = nil, maxSelectedObjects: AnyEncodable? = nil, extraConfig: AnyEncodable? = nil, availableCategories: [String]? = nil, unavailableCategories: [String]? = nil, filteredCategories: [String]? = nil, pricing: [Pricing]? = nil, channels: [String]? = nil) {
        self.objectColor = objectColor
        self.objectLabel = objectLabel
        self.numberOfPlacesToSelect = numberOfPlacesToSelect
        self.maxSelectedObjects = maxSelectedObjects
        self.extraConfig = extraConfig
        self.availableCategories = availableCategories
        self.unavailableCategories = unavailableCategories
        self.filteredCategories = filteredCategories
        self.pricing = pricing
        self.channels = channels
    }
}
