import Foundation

class CategoryFilter: Encodable {

    var enabled: Bool?
    var multiSelect: Bool?
    var zoomOnSelect: Bool?

    func enabled(_ enabled: Bool) -> Self {
        self.enabled = enabled
        return self
    }

    func multiSelect(_ multiSelect: Bool) -> Self {
        self.multiSelect = multiSelect
        return self
    }

    func zoomOnSelect(_ zoomOnSelect: Bool) -> Self {
        self.zoomOnSelect = zoomOnSelect
        return self
    }
}
