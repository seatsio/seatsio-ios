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

    public init(showActionHint: Bool? = false, showAvailability: Bool? = false, showCategory: Bool? = false, showLabel: Bool? = false, showPricing: Bool? = false, showUnavailableNotice: Bool? = false, stylizedLabel: Bool? = false, confirmSelectionOnMobile: Bool? = false) {
        self.showActionHint = showActionHint
        self.showAvailability = showAvailability
        self.showCategory = showCategory
        self.showLabel = showLabel
        self.showPricing = showPricing
        self.showUnavailableNotice = showUnavailableNotice
        self.stylizedLabel = stylizedLabel
        self.confirmSelectionOnMobile = confirmSelectionOnMobile
    }

    public func showActionHint(_ showActionHint: Bool) -> Self {
        self.showActionHint = showActionHint
        return self
    }

    public func showAvailability(_ showAvailability: Bool) -> Self {
        self.showAvailability = showAvailability
        return self
    }

    public func showCategory(_ showCategory: Bool) -> Self {
        self.showCategory = showCategory
        return self
    }

    public func showLabel(_ showActionHint: Bool) -> Self {
        self.showLabel = showLabel
        return self
    }

    public func showPricing(_ showPricing: Bool) -> Self {
        self.showPricing = showPricing
        return self
    }

    public func showUnavailableNotice(_ showUnavailableNotice: Bool) -> Self {
        self.showUnavailableNotice = showUnavailableNotice
        return self
    }

    public func stylizedLabel(_ stylizedLabel: Bool) -> Self {
        self.stylizedLabel = stylizedLabel
        return self
    }

    public func confirmSelection(_ confirmSelection: Bool) -> Self {
        self.confirmSelectionOnMobile = confirmSelection
        return self
    }
}
