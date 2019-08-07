import Foundation

class SeatingChartConfig: Encodable {

    var publicKey: String?
    var events: Set<String>?
    var chart: String?
    var pricing: [Pricing]?
    var priceFormatter: Optional<(Float) -> String>
    var numberOfPlacesToSelect: Int?
    var objectWithoutPricingSelectable: Bool?
    var objectWithoutCategorySelectable: Bool?
    var selectedObjects: [String]?
    var language: String?
    var messages: [String: String]?
    var priceLevelsTooltipMessage: String?
    var maxSelectedObjects: AnyEncodable?
    var unavailableCategories: [String]?
    var selectBestAvailable: BestAvailable?
    var alwaysShowSectionContents: Bool?
    var showLegend: Bool?
    var legend: Legend?
    var showMinimap: Bool?
    var showActiveSectionTooltip: Bool?
    var showViewFromYourSeat: Bool?
    var selectionValidators: [SelectionValidator]?
    var categories: [Category]?
    var objectCategories: [String: String]?
    var mode: String?
    var loading: String?
    var ticketListings: [TicketListing]?
    var holdOnSelect: Bool?
    var holdOnSelectForGAs: Bool?
    var holdToken: String?
    var objectLabel: String?
    var objectIcon: String?
    var isObjectVisible: String?
    var canGASelectionBeIncreased: String?
    var objectColor: String?
    var sectionColor: String?
    var extraConfig: AnyEncodable?
    var tooltipInfo: Optional<(SeatsioObject) -> String>

    var onSelectionValid: Optional<() -> ()>
    var onSelectionInvalid: Optional<([SelectionValidatorType]) -> ()>
    var onObjectSelected: Optional<(SeatsioObject, TicketType?) -> ()>
    var onObjectDeselected: Optional<(SeatsioObject, TicketType?) -> ()>
    var onObjectClicked: Optional<(SeatsioObject) -> ()>
    var onBestAvailableSelected: Optional<([SeatsioObject], Bool) -> ()>
    var onBestAvailableSelectionFailed: Optional<() -> ()>
    var onHoldSucceeded: Optional<([SeatsioObject], [TicketType]?) -> ()>
    var onHoldFailed: Optional<([SeatsioObject], [TicketType]?) -> ()>
    var onReleaseHoldSucceeded: Optional<([SeatsioObject], [TicketType]?) -> ()>
    var onReleaseHoldFailed: Optional<([SeatsioObject], [TicketType]?) -> ()>
    var onSelectedObjectBooked: Optional<(SeatsioObject) -> ()>
    var onChartRendered: Optional<(SeatingChart) -> ()>
    var onChartRenderingFailed: Optional<() -> ()>

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

    func chart(_ chart: String) -> Self {
        self.chart = chart
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
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
        return self
    }

    func maxSelectedObjects(_ maxSelectedObjects: [CategoryWithQuantity]) -> Self {
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
        return self
    }

    func maxSelectedObjects(_ maxSelectedObjects: [TicketTypeWithQuantity]) -> Self {
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
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

    func showMinimap(_ showMinimap: Bool) -> Self {
        self.showMinimap = showMinimap
        return self
    }

    func showActiveSectionTooltip(_ showActiveSectionTooltip: Bool) -> Self {
        self.showActiveSectionTooltip = showActiveSectionTooltip
        return self
    }

    func showViewFromYourSeat(_ showViewFromYourSeat: Bool) -> Self {
        self.showViewFromYourSeat = showViewFromYourSeat
        return self
    }

    func selectionValidators(_ selectionValidators: [SelectionValidator]) -> Self {
        self.selectionValidators = selectionValidators
        return self
    }

    func categories(_ categories: [Category]) -> Self {
        self.categories = categories
        return self
    }

    func objectCategories(_ objectCategories: [String: String]) -> Self {
        self.objectCategories = objectCategories
        return self
    }

    func mode(_ mode: String) -> Self {
        self.mode = mode
        return self
    }

    func loading(_ loading: String) -> Self {
        self.loading = loading
        return self
    }

    func ticketListings(_ ticketListings: [TicketListing]) -> Self {
        self.ticketListings = ticketListings
        return self
    }

    func holdOnSelect(_ holdOnSelect: Bool) -> Self {
        self.holdOnSelect = holdOnSelect
        return self
    }

    func holdOnSelectForGAs(_ holdOnSelectForGAs: Bool) -> Self {
        self.holdOnSelectForGAs = holdOnSelectForGAs
        return self
    }

    func holdToken(_ holdToken: String) -> Self {
        self.holdToken = holdToken
        return self
    }

    func objectLabel(_ objectLabel: String) -> Self {
        self.objectLabel = objectLabel
        return self
    }

    func objectIcon(_ objectIcon: String) -> Self {
        self.objectIcon = objectIcon
        return self
    }

    func isObjectVisible(_ isObjectVisible: String) -> Self {
        self.isObjectVisible = isObjectVisible
        return self
    }

    func canGASelectionBeIncreased(_ canGASelectionBeIncreased: String) -> Self {
        self.canGASelectionBeIncreased = canGASelectionBeIncreased
        return self
    }

    func objectColor(_ objectColor: String) -> Self {
        self.objectColor = objectColor
        return self
    }

    func sectionColor(_ sectionColor: String) -> Self {
        self.sectionColor = sectionColor
        return self
    }

    func extraConfig(_ extraConfig: Encodable) -> Self {
        self.extraConfig = AnyEncodable(value: extraConfig)
        return self
    }

    func onSelectionValid(_ onSelectionValid: @escaping () -> ()) -> Self {
        self.onSelectionValid = onSelectionValid
        return self
    }

    func onSelectionInvalid(_ onSelectionInvalid: @escaping ([SelectionValidatorType]) -> ()) -> Self {
        self.onSelectionInvalid = onSelectionInvalid
        return self
    }

    func onObjectSelected(_ onObjectSelected: @escaping (SeatsioObject, TicketType?) -> ()) -> Self {
        self.onObjectSelected = onObjectSelected
        return self
    }

    func onObjectDeselected(_ onObjectDeselected: @escaping (SeatsioObject, TicketType?) -> ()) -> Self {
        self.onObjectDeselected = onObjectDeselected
        return self
    }

    func onObjectClicked(_ onObjectClicked: @escaping (SeatsioObject) -> ()) -> Self {
        self.onObjectClicked = onObjectClicked
        return self
    }

    func onBestAvailableSelected(_ onBestAvailableSelected: @escaping ([SeatsioObject], Bool) -> ()) -> Self {
        self.onBestAvailableSelected = onBestAvailableSelected
        return self
    }

    func onBestAvailableSelectionFailed(_ onBestAvailableSelectionFailed: @escaping () -> ()) -> Self {
        self.onBestAvailableSelectionFailed = onBestAvailableSelectionFailed
        return self
    }

    func onHoldSucceeded(_ onHoldSucceeded: @escaping ([SeatsioObject], [TicketType]?) -> ()) -> Self {
        self.onHoldSucceeded = onHoldSucceeded
        return self
    }

    func onHoldFailed(_ onHoldFailed: @escaping ([SeatsioObject], [TicketType]?) -> ()) -> Self {
        self.onHoldFailed = onHoldFailed
        return self
    }

    func onReleaseHoldSucceeded(_ onReleaseHoldSucceeded: @escaping ([SeatsioObject], [TicketType]?) -> ()) -> Self {
        self.onReleaseHoldSucceeded = onReleaseHoldSucceeded
        return self
    }

    func onReleaseHoldFailed(_ onReleaseHoldFailed: @escaping ([SeatsioObject], [TicketType]?) -> ()) -> Self {
        self.onReleaseHoldFailed = onReleaseHoldFailed
        return self
    }

    func onSelectedObjectBooked(_ onSelectedObjectBooked: @escaping (SeatsioObject) -> ()) -> Self {
        self.onSelectedObjectBooked = onSelectedObjectBooked
        return self
    }

    func tooltipInfo(_ tooltipInfo: @escaping (SeatsioObject) -> String) -> Self {
        self.tooltipInfo = tooltipInfo
        return self
    }

    func onChartRendered(_ onChartRendered: @escaping (SeatingChart) -> ()) -> Self {
        self.onChartRendered = onChartRendered
        return self
    }

    func onChartRenderingFailed(_ onChartRenderingFailed: @escaping () -> ()) -> Self {
        self.onChartRenderingFailed = onChartRenderingFailed
        return self
    }

    private enum CodingKeys: String, CodingKey {
        case publicKey
        case events
        case chart
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
        case showMinimap
        case showActiveSectionTooltip = "showActiveSectionTooltipOnMobile"
        case showViewFromYourSeat = "showViewFromYourSeatOnMobile"
        case selectionValidators
        case categories
        case objectCategories
        case mode
        case loading
        case ticketListings
        case holdOnSelect
        case holdOnSelectForGAs
        case holdToken
        case objectLabel
        case objectIcon
        case isObjectVisible
        case canGASelectionBeIncreased
        case objectColor
        case sectionColor
        case extraConfig
    }
}
