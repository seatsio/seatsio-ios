import Foundation

public struct CategoryFilter: Encodable {

    public let enabled: Bool?
    public let multiSelect: Bool?
    public let zoomOnSelect: Bool?

    public init(enabled: Bool? = nil, multiSelect: Bool? = nil, zoomOnSelect: Bool? = nil) {
        self.enabled = enabled
        self.multiSelect = multiSelect
        self.zoomOnSelect = zoomOnSelect
    }
}
