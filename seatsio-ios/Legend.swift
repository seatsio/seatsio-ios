import Foundation

public struct Legend: Encodable {

    public let hideNonSelectableCategories: Bool?
    public let hidePricing: Bool?

    public init(hideNonSelectableCategories: Bool?, hidePricing: Bool?) {
        self.hideNonSelectableCategories = hideNonSelectableCategories
        self.hidePricing = hidePricing
    }
}
