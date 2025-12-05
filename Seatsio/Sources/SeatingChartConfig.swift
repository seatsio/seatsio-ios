import Foundation

public enum SeatingChartMode: String, Encodable {
    case normal
    case `static`
    case print
    case spotlight
}

public class SeatingChartConfig: SeatsioConfig, Encodable {

    public private(set) var workspaceKey: String?
    public private(set) var events: Set<String>?
    public private(set) var chart: String?
    public private(set) var pricing: Pricing?

    public private(set) var numberOfPlacesToSelect: Int?
    public private(set) var objectWithoutPricingSelectable: Bool?
    public private(set) var selectedObjects: [SelectedObject]?
    public private(set) var selectableObjects: [String]?
    public private(set) var language: String?
    public private(set) var messages: [String: String]?
    public private(set) var priceLevelsTooltipMessage: String?
    public private(set) var maxSelectedObjects: AnyEncodable?
    public private(set) var availableCategories: [String]?
    public private(set) var unavailableCategories: [String]?
    public private(set) var filteredCategories: [String]?
    public private(set) var categoryFilter: CategoryFilter?
    public private(set) var selectBestAvailable: BestAvailable?
    public private(set) var alwaysShowSectionContents: Bool?
    public private(set) var showSectionContents: String?
    public private(set) var showLegend: Bool?
    public private(set) var showSeatLabels: Bool?
    public private(set) var legend: Legend?
    public private(set) var showMinimap: Bool?
    public private(set) var showActiveSectionTooltip: Bool?
    public private(set) var showViewFromYourSeat: Bool?
    public private(set) var selectionValidators: [SelectionValidator]?
    public private(set) var categories: [Category]?
    public private(set) var objectCategories: [String: String]?
    public private(set) var mode: SeatingChartMode?
    public private(set) var loading: String?
    public private(set) var ticketListings: [TicketListing]?
    public private(set) var holdOnSelectForGAs: Bool?
    public private(set) var holdToken: String?
    public private(set) var session: String?
    public private(set) var objectLabel: String?
    public private(set) var objectIcon: String?
    public private(set) var isObjectVisible: String?
    public private(set) var canGASelectionBeIncreased: String?
    public private(set) var objectColor: String?
    public private(set) var sectionColor: String?
    public private(set) var extraConfig: AnyEncodable?
    public private(set) var objectTooltip: ObjectTooltip?
    public private(set) var objectPopover: ObjectPopover?
    public private(set) var tooltipInfo: ((SeatsioObject) -> String)?
    public private(set) var popoverInfo: ((SeatsioObject) -> String)?
    public private(set) var showZoomOutButtonOnMobile: Bool?
    public private(set) var colorScheme: String?
    public private(set) var colors: Colors?
    public private(set) var stylePreset: String?
    public private(set) var style: Style?
    public private(set) var showFullScreenButton: Bool = false
    public private(set) var showAccessibilityFilter: Bool = true
    public private(set) var showSectionPricingOverlay: Bool?
    public private(set) var channels: Set<String>?
    public private(set) var hideSectionsNotForSale: Bool?
    public private(set) var activeFloor: String?
    public private(set) var lockActiveFloor: Bool?
    public private(set) var showFloorElevator: Bool?
    public private(set) final var unifiedObjectPropertiesInCallbacks = true
    public private(set) var ticketBuyerId: String?

    public private(set) var onSelectionValid: (() -> Void)?
    public private(set) var onSelectionInvalid: (([SelectionValidatorType]) -> Void)?
    public private(set) var onHoldCallsInProgress: (() -> Void)?
    public private(set) var onHoldCallsComplete: (() -> Void)?
    public private(set) var onObjectSelected: ((SeatsioObject, TicketType?) -> Void)?
    public private(set) var onObjectDeselected: ((SeatsioObject, TicketType?) -> Void)?
    public private(set) var onObjectClicked: ((SeatsioObject) -> Void)?
    public private(set) var onObjectStatusChanged: ((SeatsioObject) -> Void)?
    public private(set) var onSessionInitialized: ((HoldToken) -> Void)?
    public private(set) var onHoldTokenExpired: (() -> Void)?
    public private(set) var onBestAvailableSelected: (([SeatsioObject], Bool) -> Void)?
    public private(set) var onBestAvailableSelectionFailed: (() -> Void)?
    public private(set) var onHoldSucceeded: (([SeatsioObject], [TicketType]?) -> Void)?
    public private(set) var onHoldFailed: (([SeatsioObject], [TicketType]?) -> Void)?
    public private(set) var onReleaseHoldSucceeded: (([SeatsioObject], [TicketType]?) -> Void)?
    public private(set) var onReleaseHoldFailed: (([SeatsioObject], [TicketType]?) -> Void)?
    public private(set) var onSelectedObjectBooked: ((SeatsioObject) -> Void)?
    public private(set) var onSelectedObjectUnavailable: ((SeatsioObject) -> Void)?
    public private(set) var onChartRendered: ((SeatingChart) -> Void)?
    public private(set) var onChartRenderingFailed: ((SeatingChart) -> Void)?
    public private(set) var onPlacesPrompt: ((OnPlacesPromptParams, (Int) -> Void) -> Void)?
    public private(set) var onTicketTypePrompt: ((OnTicketTypePromptParams, (String) -> Void) -> Void)?
    public private(set) var onPlacesWithTicketTypesPrompt: ((OnPlacesWithTicketTypesPromptParams, ([String: Int]) -> Void) -> Void)?
    public private(set) var onFloorChanged: ((Floor?) -> Void)?
    public private(set) var onFilteredCategoriesChanged: (([Category]) -> Void)?
    public private(set) var onChartRerenderingStarted: ((SeatingChart) -> Void)?


    let _library: String = "ios"

    public var toolName: String { "SeatingChart" }

    public init() {}

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

    public func pricing(_ pricing: Pricing) -> Self {
        self.pricing = pricing
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

    public func maxSelectedObjects(_ maxSelectedObjects: [CategoryWithTicketTypesAndQuantity]) -> Self {
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

    public func mode(_ mode: SeatingChartMode) -> Self {
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

    @available(*, deprecated, renamed: "objectLabelJavascriptFunction")
    public func objectLabel(_ objectLabel: String) -> Self {
        self.objectLabel = objectLabel
        return self
    }

    public func objectLabelJavascriptFunction(_ objectLabel: String) -> Self {
        self.objectLabel = objectLabel
        return self
    }

    @available(*, deprecated, renamed: "objectIconJavascriptFunction")
    public func objectIcon(_ objectIcon: String) -> Self {
        self.objectIcon = objectIcon
        return self
    }

    public func objectIconJavascriptFunction(_ objectIcon: String) -> Self {
        self.objectIcon = objectIcon
        return self
    }

    @available(*, deprecated, renamed: "isObjectVisibleJavascriptFunction")
    public func isObjectVisible(_ isObjectVisible: String) -> Self {
        self.isObjectVisible = isObjectVisible
        return self
    }

    public func isObjectVisibleJavascriptFunction(_ isObjectVisible: String) -> Self {
        self.isObjectVisible = isObjectVisible
        return self
    }

    public func canGASelectionBeIncreased(_ canGASelectionBeIncreased: String) -> Self {
        self.canGASelectionBeIncreased = canGASelectionBeIncreased
        return self
    }

    @available(*, deprecated, renamed: "objectColorJavascriptFunction")
    public func objectColor(_ objectColor: String) -> Self {
        self.objectColor = objectColor
        return self
    }

    public func objectColorJavascriptFunction(_ objectColor: String) -> Self {
        self.objectColor = objectColor
        return self
    }

    @available(*, deprecated, renamed: "sectionColorJavascriptFunction")
    public func sectionColor(_ sectionColor: String) -> Self {
        self.sectionColor = sectionColor
        return self
    }

    public func sectionColorJavascriptFunction(_ sectionColor: String) -> Self {
        self.sectionColor = sectionColor
        return self
    }

    public func extraConfig(_ extraConfig: Encodable) -> Self {
        self.extraConfig = AnyEncodable(value: extraConfig)
        return self
    }

    public func hideSectionsNotForSale(_ hideSectionsNotForSale: Bool) -> Self {
        self.hideSectionsNotForSale = hideSectionsNotForSale
        return self
    }

    public func activeFloor(_ activeFloor: String) -> Self {
        self.activeFloor = activeFloor
        return self
    }

    public func lockActiveFloor(_ lockActiveFloor: Bool) -> Self {
        self.lockActiveFloor = lockActiveFloor
        return self
    }

    public func showFloorElevator(_ showFloorElevator: Bool) -> Self {
        self.showFloorElevator = showFloorElevator
        return self
    }

    public func ticketBuyerId(_ ticketBuyerId: String) -> Self {
        self.ticketBuyerId = ticketBuyerId
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

    public func onHoldCallsComplete(_ onHoldCallsComplete: @escaping () -> ()) -> Self {
        self.onHoldCallsComplete = onHoldCallsComplete
        return self
    }

    public func onHoldCallsInProgress(_ onHoldCallsInProgress: @escaping () -> ()) -> Self {
        self.onHoldCallsInProgress = onHoldCallsInProgress
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

    @available(*, deprecated, message: "use onSelectedObjectUnavailable instead")
    public func onSelectedObjectBooked(_ onSelectedObjectBooked: @escaping (SeatsioObject) -> ()) -> Self {
        self.onSelectedObjectBooked = onSelectedObjectBooked
        return self
    }

    public func onSelectedObjectUnavailable(_ onSelectedObjectUnavailable: @escaping (SeatsioObject) -> ()) -> Self {
        self.onSelectedObjectUnavailable = onSelectedObjectUnavailable
        return self
    }

    public func objectTooltip(_ objectTooltip: ObjectTooltip) -> Self {
        self.objectTooltip = objectTooltip
        return self
    }

    public func objectPopover(_ objectPopover: ObjectPopover) -> Self {
        self.objectPopover = objectPopover
        return self
    }

    public func tooltipInfo(_ tooltipInfo: @escaping (SeatsioObject) -> String) -> Self {
        self.tooltipInfo = tooltipInfo
        return self
    }

    public func popoverInfo(_ popoverInfo: @escaping (SeatsioObject) -> String) -> Self {
        self.popoverInfo = popoverInfo
        return self
    }

    public func onChartRendered(_ onChartRendered: @escaping (SeatingChart) -> ()) -> Self {
        self.onChartRendered = onChartRendered
        return self
    }

    public func onChartRenderingFailed(_ onChartRenderingFailed: @escaping (SeatingChart) -> ()) -> Self {
        self.onChartRenderingFailed = onChartRenderingFailed
        return self
    }

    public func onChartRerenderingStarted(_ onChartRerenderingStarted: @escaping (SeatingChart) -> ()) -> Self {
        self.onChartRerenderingStarted = onChartRerenderingStarted
        return self
    }

    public func onPlacesPrompt(_ onPlacesPrompt: @escaping (OnPlacesPromptParams, (Int) -> Void) -> ()) -> Self {
        self.onPlacesPrompt = onPlacesPrompt
        return self
    }

    public func onTicketTypePrompt(_ onTicketTypePrompt: @escaping (OnTicketTypePromptParams, (String) -> Void) -> ()) -> Self {
        self.onTicketTypePrompt = onTicketTypePrompt
        return self
    }

    public func onPlacesWithTicketTypesPrompt(_ onPlacesWithTicketTypesPrompt: @escaping (OnPlacesWithTicketTypesPromptParams, ([String: Int]) -> Void) -> ()) -> Self {
        self.onPlacesWithTicketTypesPrompt = onPlacesWithTicketTypesPrompt
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

    public func onFloorChanged(_ onFloorChanged: @escaping (Floor?) -> ()) -> Self {
        self.onFloorChanged = onFloorChanged
        return self
    }

    public func onFilteredCategoriesChanged(_ onFilteredCategoriesChanged: @escaping ([Category]) -> ()) -> Self {
        self.onFilteredCategoriesChanged = onFilteredCategoriesChanged
        return self
    }

    public var jsonStringRepresentation: String {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(self)
        return String(decoding: jsonData, as: UTF8.self)
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
        case objectPopover
        case categoryFilter
        case showZoomOutButtonOnMobile
        case showSectionPricingOverlay
        case colorScheme
        case colors
        case stylePreset
        case style
        case showFullScreenButton
        case showAccessibilityFilter
        case channels
        case hideSectionsNotForSale
        case activeFloor
        case lockActiveFloor
        case showFloorElevator
        case unifiedObjectPropertiesInCallbacks
        case ticketBuyerId
        case _library
    }
}
