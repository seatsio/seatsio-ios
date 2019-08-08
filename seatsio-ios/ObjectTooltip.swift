import Foundation

public class ObjectTooltip: Encodable {

    var showActionHint: Bool?
    var showAvailability: Bool?
    var showCategory: Bool?
    var showLabel: Bool?
    var showPricing: Bool?
    var showUnavailableNotice: Bool?
    var stylizedLabel: Bool?
    var confirmSelectionOnMobile: Bool?

    func showActionHint(_ showActionHint: Bool) -> Self {
        self.showActionHint = showActionHint
        return self
    }

    func showAvailability(_ showAvailability: Bool) -> Self {
        self.showAvailability = showAvailability
        return self
    }

    func showCategory(_ showCategory: Bool) -> Self {
        self.showCategory = showCategory
        return self
    }

    func showLabel(_ showActionHint: Bool) -> Self {
        self.showLabel = showLabel
        return self
    }

    func showPricing(_ showPricing: Bool) -> Self {
        self.showPricing = showPricing
        return self
    }

    func showUnavailableNotice(_ showUnavailableNotice: Bool) -> Self {
        self.showUnavailableNotice = showUnavailableNotice
        return self
    }

    func stylizedLabel(_ stylizedLabel: Bool) -> Self {
        self.stylizedLabel = stylizedLabel
        return self
    }

    func confirmSelection(_ confirmSelection: Bool) -> Self {
        self.confirmSelectionOnMobile = confirmSelection
        return self
    }

}
