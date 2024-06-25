import Foundation

public class SeatingChartConfig: Encodable {

    var workspaceKey: String?
    var events: Set<String>?
    var chart: String?
    var pricing: [Pricing]?

    var priceFormatter: Optional<(Float) -> String>
    var numberOfPlacesToSelect: Int?
    var objectWithoutPricingSelectable: Bool?
    var selectedObjects: [SelectedObject]?
    var selectableObjects: [String]?
    var language: String?
    var messages: [String: String]?
    var priceLevelsTooltipMessage: String?
    var maxSelectedObjects: AnyEncodable?
    var availableCategories: [String]?
    var unavailableCategories: [String]?
    var filteredCategories: [String]?
    var categoryFilter: CategoryFilter?
    var selectBestAvailable: BestAvailable?
    var alwaysShowSectionContents: Bool?
    var showSectionContents: String?
    var showLegend: Bool?
    var showSeatLabels: Bool?
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
    var holdOnSelectForGAs: Bool?
    var holdToken: String?
    var session: String?
    var objectLabel: String?
    var objectIcon: String?
    var isObjectVisible: String?
    var canGASelectionBeIncreased: String?
    var objectColor: String?
    var sectionColor: String?
    var extraConfig: AnyEncodable?
    var objectTooltip: ObjectTooltip?
    var tooltipInfo: Optional<(SeatsioObject) -> String>
    var showZoomOutButtonOnMobile: Bool?
    var colorScheme: String?
    var colors: Colors?
    var stylePreset: String?
    var style: Style?
    var showFullScreenButton: Bool = false
    var showSectionPricingOverlay: Bool?
    var channels: Set<String>?

    var onSelectionValid: Optional<() -> ()>
    var onSelectionInvalid: Optional<([SelectionValidatorType]) -> ()>
    var onObjectSelected: Optional<(SeatsioObject, TicketType?) -> ()>
    var onObjectDeselected: Optional<(SeatsioObject, TicketType?) -> ()>
    var onObjectClicked: Optional<(SeatsioObject) -> ()>
    var onObjectStatusChanged: Optional<(SeatsioObject) -> ()>
    var onSessionInitialized: Optional<(HoldToken) -> ()>
    var onHoldTokenExpired: Optional<() -> ()>
    var onBestAvailableSelected: Optional<([SeatsioObject], Bool) -> ()>
    var onBestAvailableSelectionFailed: Optional<() -> ()>
    var onHoldSucceeded: Optional<([SeatsioObject], [TicketType]?) -> ()>
    var onHoldFailed: Optional<([SeatsioObject], [TicketType]?) -> ()>
    var onReleaseHoldSucceeded: Optional<([SeatsioObject], [TicketType]?) -> ()>
    var onReleaseHoldFailed: Optional<([SeatsioObject], [TicketType]?) -> ()>
    var onSelectedObjectBooked: Optional<(SeatsioObject) -> ()>
    var onChartRendered: Optional<(SeatingChart) -> ()>
    var onChartRenderingFailed: Optional<() -> ()>

    let _library: String = "ios"

    public init() {
    }

    public func workspaceKey(_ workspaceKey: String) -> Self {
        self.workspaceKey = workspaceKey
        return self
    }

    public func event(_ event: String) -> Self {
        self.events = [event]
        return self
    }

    public func chart(_ chart: String) -> Self {
        self.chart = chart
        return self
    }

    public func events(_ events: Set<String>) -> Self {
        self.events = events
        return self
    }

    public func pricing(_ pricing: [Pricing]) -> Self {
        self.pricing = pricing
        return self
    }

    public func priceFormatter(_ priceFormatter: @escaping (Float) -> String) -> Self {
        self.priceFormatter = priceFormatter
        return self
    }

    public func numberOfPlacesToSelect(_ numberOfPlacesToSelect: Int) -> Self {
        self.numberOfPlacesToSelect = numberOfPlacesToSelect
        return self
    }

    public func objectWithoutPricingSelectable(_ objectWithoutPricingSelectable: Bool) -> Self {
        self.objectWithoutPricingSelectable = objectWithoutPricingSelectable
        return self
    }

    public func selectedObjects(_ selectedObjects: [SelectedObject]) -> Self {
        self.selectedObjects = selectedObjects
        return self
    }

    public func selectableObjects(_ selectableObjects: [String]) -> Self {
        self.selectableObjects = selectableObjects
        return self
    }

    public func language(_ language: String) -> Self {
        self.language = language
        return self
    }

    public func messages(_ messages: [String: String]) -> Self {
        self.messages = messages
        return self
    }

    public func priceLevelsTooltipMessage(_ priceLevelsTooltipMessage: String) -> Self {
        self.priceLevelsTooltipMessage = priceLevelsTooltipMessage
        return self
    }

    public func maxSelectedObjects(_ maxSelectedObjects: Int) -> Self {
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
        return self
    }

    public func maxSelectedObjects(_ maxSelectedObjects: [CategoryWithQuantity]) -> Self {
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
        return self
    }

    public func maxSelectedObjects(_ maxSelectedObjects: [TicketTypeWithQuantity]) -> Self {
        self.maxSelectedObjects = AnyEncodable(value: maxSelectedObjects)
        return self
    }

    public func availableCategories(_ availableCategories: [String]) -> Self {
        self.availableCategories = availableCategories
        return self
    }

    public func unavailableCategories(_ unavailableCategories: [String]) -> Self {
        self.unavailableCategories = unavailableCategories
        return self
    }

    public func filteredCategories(_ filteredCategories: [String]) -> Self {
        self.filteredCategories = filteredCategories
        return self
    }

    public func selectBestAvailable(_ selectBestAvailable: BestAvailable) -> Self {
        self.selectBestAvailable = selectBestAvailable
        return self
    }

    @available(*, deprecated, message: "use showSectionContents('always') instead")
    public func alwaysShowSectionContents(_ alwaysShowSectionContents: Bool) -> Self {
        self.alwaysShowSectionContents = alwaysShowSectionContents
        return self
    }

    public func showSectionContents(_ showSectionContents: String) -> Self {
        self.showSectionContents = showSectionContents
        return self
    }

    public func showLegend(_ showLegend: Bool) -> Self {
        self.showLegend = showLegend
        return self
    }

    public func showSeatLabels(_ showSeatLabels: Bool) -> Self {
        self.showSeatLabels = showSeatLabels
        return self
    }

    public func legend(_ legend: Legend) -> Self {
        self.legend = legend
        return self
    }

    public func showMinimap(_ showMinimap: Bool) -> Self {
        self.showMinimap = showMinimap
        return self
    }

    public func showActiveSectionTooltip(_ showActiveSectionTooltip: Bool) -> Self {
        self.showActiveSectionTooltip = showActiveSectionTooltip
        return self
    }

    public func showViewFromYourSeat(_ showViewFromYourSeat: Bool) -> Self {
        self.showViewFromYourSeat = showViewFromYourSeat
        return self
    }

    public func selectionValidators(_ selectionValidators: [SelectionValidator]) -> Self {
        self.selectionValidators = selectionValidators
        return self
    }

    public func categories(_ categories: [Category]) -> Self {
        self.categories = categories
        return self
    }

    public func objectCategories(_ objectCategories: [String: String]) -> Self {
        self.objectCategories = objectCategories
        return self
    }

    public func mode(_ mode: String) -> Self {
        self.mode = mode
        return self
    }

    public func loading(_ loading: String) -> Self {
        self.loading = loading
        return self
    }

    public func ticketListings(_ ticketListings: [TicketListing]) -> Self {
        self.ticketListings = ticketListings
        return self
    }

    public func holdOnSelectForGAs(_ holdOnSelectForGAs: Bool) -> Self {
        self.holdOnSelectForGAs = holdOnSelectForGAs
        return self
    }

    public func holdToken(_ holdToken: String) -> Self {
        self.holdToken = holdToken
        return self
    }

    public func session(_ session: String) -> Self {
        self.session = session
        return self
    }

    public func objectLabel(_ objectLabel: String) -> Self {
        self.objectLabel = objectLabel
        return self
    }

    public func objectIcon(_ objectIcon: String) -> Self {
        self.objectIcon = objectIcon
        return self
    }

    public func isObjectVisible(_ isObjectVisible: String) -> Self {
        self.isObjectVisible = isObjectVisible
        return self
    }

    public func canGASelectionBeIncreased(_ canGASelectionBeIncreased: String) -> Self {
        self.canGASelectionBeIncreased = canGASelectionBeIncreased
        return self
    }

    public func objectColor(_ objectColor: String) -> Self {
        self.objectColor = objectColor
        return self
    }

    public func sectionColor(_ sectionColor: String) -> Self {
        self.sectionColor = sectionColor
        return self
    }

    public func extraConfig(_ extraConfig: Encodable) -> Self {
        self.extraConfig = AnyEncodable(value: extraConfig)
        return self
    }

    public func onSelectionValid(_ onSelectionValid: @escaping () -> ()) -> Self {
        self.onSelectionValid = onSelectionValid
        return self
    }

    public func onSelectionInvalid(_ onSelectionInvalid: @escaping ([SelectionValidatorType]) -> ()) -> Self {
        self.onSelectionInvalid = onSelectionInvalid
        return self
    }

    public func onObjectSelected(_ onObjectSelected: @escaping (SeatsioObject, TicketType?) -> ()) -> Self {
        self.onObjectSelected = onObjectSelected
        return self
    }

    public func onObjectDeselected(_ onObjectDeselected: @escaping (SeatsioObject, TicketType?) -> ()) -> Self {
        self.onObjectDeselected = onObjectDeselected
        return self
    }

    public func onObjectClicked(_ onObjectClicked: @escaping (SeatsioObject) -> ()) -> Self {
        self.onObjectClicked = onObjectClicked
        return self
    }

    public func onObjectStatusChanged(_ onObjectStatusChanged: @escaping (SeatsioObject) -> ()) -> Self {
        self.onObjectStatusChanged = onObjectStatusChanged
        return self
    }

    public func onSessionInitialized(_ onSessionInitialized: @escaping (HoldToken) -> ()) -> Self {
        self.onSessionInitialized = onSessionInitialized
        return self
    }

    public func onHoldTokenExpired(_ onHoldTokenExpired: @escaping () -> ()) -> Self {
        self.onHoldTokenExpired = onHoldTokenExpired
        return self
    }

    public func onBestAvailableSelected(_ onBestAvailableSelected: @escaping ([SeatsioObject], Bool) -> ()) -> Self {
        self.onBestAvailableSelected = onBestAvailableSelected
        return self
    }

    public func onBestAvailableSelectionFailed(_ onBestAvailableSelectionFailed: @escaping () -> ()) -> Self {
        self.onBestAvailableSelectionFailed = onBestAvailableSelectionFailed
        return self
    }

    public func onHoldSucceeded(_ onHoldSucceeded: @escaping ([SeatsioObject], [TicketType]?) -> ()) -> Self {
        self.onHoldSucceeded = onHoldSucceeded
        return self
    }

    public func onHoldFailed(_ onHoldFailed: @escaping ([SeatsioObject], [TicketType]?) -> ()) -> Self {
        self.onHoldFailed = onHoldFailed
        return self
    }

    public func onReleaseHoldSucceeded(_ onReleaseHoldSucceeded: @escaping ([SeatsioObject], [TicketType]?) -> ()) -> Self {
        self.onReleaseHoldSucceeded = onReleaseHoldSucceeded
        return self
    }

    public func onReleaseHoldFailed(_ onReleaseHoldFailed: @escaping ([SeatsioObject], [TicketType]?) -> ()) -> Self {
        self.onReleaseHoldFailed = onReleaseHoldFailed
        return self
    }

    public func onSelectedObjectBooked(_ onSelectedObjectBooked: @escaping (SeatsioObject) -> ()) -> Self {
        self.onSelectedObjectBooked = onSelectedObjectBooked
        return self
    }

    public func objectTooltip(_ objectTooltip: ObjectTooltip) -> Self {
        self.objectTooltip = objectTooltip
        return self
    }

    public func tooltipInfo(_ tooltipInfo: @escaping (SeatsioObject) -> String) -> Self {
        self.tooltipInfo = tooltipInfo
        return self
    }

    public func onChartRendered(_ onChartRendered: @escaping (SeatingChart) -> ()) -> Self {
        self.onChartRendered = onChartRendered
        return self
    }

    public func onChartRenderingFailed(_ onChartRenderingFailed: @escaping () -> ()) -> Self {
        self.onChartRenderingFailed = onChartRenderingFailed
        return self
    }

    public func categoryFilter(_ categoryFilter: CategoryFilter) -> Self {
        self.categoryFilter = categoryFilter
        return self
    }

    public func showZoomOutButton(_ showZoomOutButton: Bool) -> Self {
        self.showZoomOutButtonOnMobile = showZoomOutButton
        return self
    }

    public func showSectionPricingOverlay(_ showSectionPricingOverlay: Bool) -> Self {
        self.showSectionPricingOverlay = showSectionPricingOverlay
        return self
    }

    public func colorScheme(_ colorScheme: String) -> Self {
        self.colorScheme = colorScheme
        return self
    }

    public func colors(_ colors: Colors) -> Self {
        self.colors = colors
        return self
    }

    public func stylePreset(_ stylePreset: String) -> Self {
        self.stylePreset = stylePreset
        return self
    }

    public func style(_ style: Style) -> Self {
        self.style = style
        return self
    }

    public func channels(_ channels: Set<String>) -> Self {
        self.channels = channels
        return self
    }

    private enum CodingKeys: String, CodingKey {
        case workspaceKey
        case events
        case chart
        case pricing
        case numberOfPlacesToSelect
        case objectWithoutPricingSelectable
        case selectedObjects
        case selectableObjects
        case language
        case messages
        case priceLevelsTooltipMessage
        case maxSelectedObjects
        case availableCategories
        case unavailableCategories
        case filteredCategories
        case selectBestAvailable
        case alwaysShowSectionContents
        case showSectionContents
        case showLegend
        case showSeatLabels
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
        case holdOnSelectForGAs
        case holdToken
        case session
        case objectLabel
        case objectIcon
        case isObjectVisible
        case canGASelectionBeIncreased
        case objectColor
        case sectionColor
        case extraConfig
        case objectTooltip
        case categoryFilter
        case showZoomOutButtonOnMobile
        case showSectionPricingOverlay
        case colorScheme
        case colors
        case stylePreset
        case style
        case showFullScreenButton
        case channels
        case _library
    }
}
