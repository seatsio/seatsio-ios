import Foundation

struct SeatingChartConfig: Encodable {
    let publicKey: String
    let events: Set<String>
    let pricing: [Pricing]?
    let priceFormatter: Optional<(Float) -> String>
    let numberOfPlacesToSelect: Int?
    let objectWithoutPricingSelectable: Bool?
    let objectWithoutCategorySelectable: Bool?
    let selectedObjects: [String]?
    let language: String?
    let messages: [String: String]?
    let priceLevelsTooltipMessage: String?
    let maxSelectedObjects: Int?
    let unavailableCategories: [String]?
    let selectBestAvailable: BestAvailable?
    let alwaysShowSectionContents: Bool?
    let showLegend: Bool?
    let legend: Legend?

    init(publicKey: String,
         event: String? = nil,
         events: Set<String>? = nil,
         pricing: [Pricing]? = nil,
         priceFormatter: Optional<(Float) -> String> = nil,
         numberOfPlacesToSelect: Int? = nil,
         objectWithoutPricingSelectable: Bool? = nil,
         objectWithoutCategorySelectable: Bool? = nil,
         selectedObjects: [String]? = nil,
         language: String? = nil,
         messages: [String: String]? = nil,
         priceLevelsTooltipMessage: String? = nil,
         maxSelectedObjects: Int? = nil,
         unavailableCategories: [String]? = nil,
         selectBestAvailable: BestAvailable? = nil,
         alwaysShowSectionContents: Bool? = nil,
         showLegend: Bool? = nil,
         legend: Legend? = nil) {
        self.publicKey = publicKey
        self.events = event == nil ? events! : [event!]
        self.pricing = pricing
        self.priceFormatter = priceFormatter
        self.numberOfPlacesToSelect = numberOfPlacesToSelect
        self.objectWithoutPricingSelectable = objectWithoutPricingSelectable
        self.objectWithoutCategorySelectable = objectWithoutCategorySelectable
        self.selectedObjects = selectedObjects
        self.language = language
        self.messages = messages
        self.priceLevelsTooltipMessage = priceLevelsTooltipMessage
        self.maxSelectedObjects = maxSelectedObjects
        self.unavailableCategories = unavailableCategories
        self.selectBestAvailable = selectBestAvailable
        self.alwaysShowSectionContents = alwaysShowSectionContents
        self.showLegend = showLegend
        self.legend = legend
    }

    private enum CodingKeys: String, CodingKey {
        case publicKey
        case events
        case pricing
        case numberOfPlacesToSelect
        case objectWithoutPricingSelectable
        case objectWithoutCategorySelectable
        case selectedObjects
        case language
        case messages
        case priceLevelsTooltipMessage
        case maxSelectedObjects
        case unavailableCategories
        case selectBestAvailable
        case alwaysShowSectionContents
        case showLegend
        case legend
    }
}