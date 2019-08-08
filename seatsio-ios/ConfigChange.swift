import Foundation

public class ConfigChange: Encodable {

    var objectColor: String?
    var objectLabel: String?
    var maxSelectedObjects: AnyEncodable?
    var extraConfig: AnyEncodable?

    public func objectColor(_ objectColor: String) -> Self {
        self.objectColor = objectColor
        return self
    }

    public func objectLabel(_ objectLabel: String) -> Self {
        self.objectLabel = objectLabel
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
}
