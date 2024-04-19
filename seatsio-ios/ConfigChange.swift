import Foundation

public class ConfigChange: Encodable {

    var objectColor: String?
    var objectLabel: String?
    var numberOfPlacesToSelect: Int?
    var maxSelectedObjects: AnyEncodable?
    var extraConfig: AnyEncodable?
    var unavailableCategories: [String]?
    var availableCategories: [String]?
    var filteredCategories: [String]?

    public func objectColor(_ objectColor: String) -> Self {
        self.objectColor = objectColor
        return self
    }

    public func objectLabel(_ objectLabel: String) -> Self {
        self.objectLabel = objectLabel
        return self
    }

    public func numberOfPlacesToSelect(_ numberOfPlacesToSelect: Int) -> Self {
        self.numberOfPlacesToSelect = numberOfPlacesToSelect
        return self
    }

    public func maxSelectedObjects(_ maxSelectedObjects: Int) -> Self {
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
        return self
    }

    public func maxSelectedObjects(_ maxSelectedObjects: [CategoryWithQuantity]) -> Self {
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
        return self
    }

    public func maxSelectedObjects(_ maxSelectedObjects: [TicketTypeWithQuantity]) -> Self {
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
        return self
    }

    public func extraConfig(_ extraConfig: Encodable) -> Self {
        self.extraConfig = AnyEncodable(value: extraConfig)
        return self
    }

    public func unavailableCategories(_ unavailableCategories: [String]) -> Self {
        self.unavailableCategories = unavailableCategories
        return self
    }

    public func availableCategories(_ availableCategories: [String]) -> Self {
        self.availableCategories = availableCategories
        return self
    }

    public func filteredCategories(_ filteredCategories: [String]) -> Self {
        self.filteredCategories = filteredCategories
        return self
    }
}
