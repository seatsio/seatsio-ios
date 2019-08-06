import Foundation

struct Legend: Encodable {

    let hideNonSelectableCategories: Bool?
    let hidePricing: Bool?

    init(hideNonSelectableCategories: Bool?, hidePricing: Bool?) {
        self.hideNonSelectableCategories = hideNonSelectableCategories
        self.hidePricing = hidePricing
    }
}
