import Foundation

class SeatingChartConfig: Encodable {

    var publicKey: String?
    var events: Set<String>?
    var pricing: [Pricing]?
    var priceFormatter: Optional<(Float) -> String>
    var numberOfPlacesToSelect: Int?
    var objectWithoutPricingSelectable: Bool?
    var objectWithoutCategorySelectable: Bool?
    var selectedObjects: [String]?
    var language: String?
    var messages: [String: String]?
    var priceLevelsTooltipMessage: String?
    var maxSelectedObjects: Int?
    var unavailableCategories: [String]?
    var selectBestAvailable: BestAvailable?
    var alwaysShowSectionContents: Bool?
    var showLegend: Bool?
    var legend: Legend?

    init() {
    }

    func publicKey(_ publicKey: String) -> Self {
        self.publicKey = publicKey
        return self
    }

    func event(_ event: String) -> Self {
        self.events = [event]
        return self
    }

    func events(_ events: Set<String>) -> Self {
        self.events = events
        return self
    }

    func pricing(_ pricing: [Pricing]) -> Self {
        self.pricing = pricing
        return self
    }

    func priceFormatter(_ priceFormatter: @escaping (Float) -> String) -> Self {
        self.priceFormatter = priceFormatter
        return self
    }

    func numberOfPlacesToSelect(_ numberOfPlacesToSelect: Int) -> Self {
        self.numberOfPlacesToSelect = numberOfPlacesToSelect
        return self
    }

    func objectWithoutPricingSelectable(_ objectWithoutPricingSelectable: Bool) -> Self {
        self.objectWithoutPricingSelectable = objectWithoutPricingSelectable
        return self
    }

    func objectWithoutCategorySelectable(_ objectWithoutCategorySelectable: Bool) -> Self {
        self.objectWithoutCategorySelectable = objectWithoutCategorySelectable
        return self
    }

    func selectedObjects(_ selectedObjects: [String]) -> Self {
        self.selectedObjects = selectedObjects
        return self
    }

    func language(_ language: String) -> Self {
        self.language = language
        return self
    }

    func messages(_ messages: [String: String]) -> Self {
        self.messages = messages
        return self
    }

    func priceLevelsTooltipMessage(_ priceLevelsTooltipMessage: String) -> Self {
        self.priceLevelsTooltipMessage = priceLevelsTooltipMessage
        return self
    }

    func maxSelectedObjects(_ maxSelectedObjects: Int) -> Self {
        self.maxSelectedObjects = maxSelectedObjects
        return self
    }

    func unavailableCategories(_ unavailableCategories: [String]) -> Self {
        self.unavailableCategories = unavailableCategories
        return self
    }

    func selectBestAvailable(_ selectBestAvailable: BestAvailable) -> Self {
        self.selectBestAvailable = selectBestAvailable
        return self
    }

    func alwaysShowSectionContents(_ alwaysShowSectionContents: Bool) -> Self {
        self.alwaysShowSectionContents = alwaysShowSectionContents
        return self
    }

    func showLegend(_ showLegend: Bool) -> Self {
        self.showLegend = showLegend
        return self
    }

    func legend(_ legend: Legend) -> Self {
        self.legend = legend
        return self
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