import Foundation

public struct ObjectPopover: Encodable {
    public let showAvailability: Bool?
    public let showCategory: Bool?
    public let showLabel: Bool?
    public let showPricing: Bool?
    public let showUnavailableNotice: Bool?
    public let stylizedLabel: Bool?
    public let confirmSelection: String?

    public init(showAvailability: Bool? = false, showCategory: Bool? = true, showLabel: Bool? = true, showPricing: Bool? = true, showUnavailableNotice: Bool? = true, stylizedLabel: Bool? = true, confirmSelection: String? = "auto") {
        self.showAvailability = showAvailability
        self.showCategory = showCategory
        self.showLabel = showLabel
        self.showPricing = showPricing
        self.showUnavailableNotice = showUnavailableNotice
        self.stylizedLabel = stylizedLabel
        self.confirmSelection = confirmSelection
    }
}
