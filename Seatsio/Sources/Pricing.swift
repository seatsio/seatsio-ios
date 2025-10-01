import Foundation

public struct Pricing: Codable {

    public let allFeesIncluded: Bool?
    public let showSectionPricingOverlay: Bool?
    public let priceFormatter: ((Float) -> String)?
    public let prices: [Price]

    public init(prices: [Price], allFeesIncluded: Bool? = nil, showSectionPricingOverlay: Bool? = nil, priceFormatter: ((Float) -> String)? = nil) {
        self.prices = prices
        self.allFeesIncluded = allFeesIncluded
        self.showSectionPricingOverlay = showSectionPricingOverlay
        self.priceFormatter = priceFormatter
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        prices = try container.decode([Price].self, forKey: .prices)
        allFeesIncluded = try container.decodeIfPresent(Bool.self, forKey: .allFeesIncluded)
        showSectionPricingOverlay = try container.decodeIfPresent(Bool.self, forKey: .showSectionPricingOverlay)
        priceFormatter = nil
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.allFeesIncluded, forKey: .allFeesIncluded)
        try container.encodeIfPresent(self.showSectionPricingOverlay, forKey: .showSectionPricingOverlay)
        try container.encode(self.prices, forKey: .prices)
        if (self.priceFormatter != nil) {
            try container.encode("%priceFormatterPlaceholder%", forKey: .priceFormatter)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case allFeesIncluded
        case showSectionPricingOverlay
        case priceFormatter
        case prices
    }
}
