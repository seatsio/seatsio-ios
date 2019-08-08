import Foundation

public struct Legend: Encodable {

    let hideNonSelectableCategories: Bool?
    let hidePricing: Bool?

    public init(hideNonSelectableCategories: Bool?, hidePricing: Bool?) {
        self.hideNonSelectableCategories = hideNonSelectableCategories
        self.hidePricing = hidePricing
    }
}
