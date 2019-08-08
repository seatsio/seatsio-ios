import Foundation

public class CategoryFilter: Encodable {

    var enabled: Bool?
    var multiSelect: Bool?
    var zoomOnSelect: Bool?

    public func enabled(_ enabled: Bool) -> Self {
        self.enabled = enabled
        return self
    }

    public func multiSelect(_ multiSelect: Bool) -> Self {
        self.multiSelect = multiSelect
        return self
    }

    public func zoomOnSelect(_ zoomOnSelect: Bool) -> Self {
        self.zoomOnSelect = zoomOnSelect
        return self
    }
}
