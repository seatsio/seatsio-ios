import Foundation

public struct ObjectTooltip: Encodable {

    public let showActionHint: Bool?
    public let showAvailability: Bool?
    public let showCategory: Bool?
    public let showLabel: Bool?
    public let showPricing: Bool?
    public let showUnavailableNotice: Bool?
    public let stylizedLabel: Bool?
    public let confirmSelectionOnMobile: Bool?

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
}
