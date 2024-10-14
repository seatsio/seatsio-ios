public protocol SeatsioConfig {
    var jsonStringRepresentation: String { get }
    var toolName: String { get }
    
    var priceFormatter: ((Float) -> String)? { get }
    var tooltipInfo: ((SeatsioObject) -> String)? { get }
    var onSelectionValid: (() -> Void)? { get }
    var onSelectionInvalid: (([SelectionValidatorType]) -> Void)? { get }
    var onObjectSelected: ((SeatsioObject, TicketType?) -> Void)? { get }
    var onObjectDeselected: ((SeatsioObject, TicketType?) -> Void)? { get }
    var onObjectClicked: ((SeatsioObject) -> Void)? { get }
    var onObjectStatusChanged: ((SeatsioObject) -> Void)? { get }
    var onSessionInitialized: ((HoldToken) -> Void)? { get }
    var onHoldTokenExpired: (() -> Void)? { get }
    var onBestAvailableSelected: (([SeatsioObject], Bool) -> Void)? { get }
    var onBestAvailableSelectionFailed: (() -> Void)? { get }
    var onHoldSucceeded: (([SeatsioObject], [TicketType]?) -> Void)? { get }
    var onHoldFailed: (([SeatsioObject], [TicketType]?) -> Void)? { get }
    var onReleaseHoldSucceeded: (([SeatsioObject], [TicketType]?) -> Void)? { get }
    var onReleaseHoldFailed: (([SeatsioObject], [TicketType]?) -> Void)? { get }
    var onSelectedObjectBooked: ((SeatsioObject) -> Void)? { get }
    var onChartRendered: ((SeatingChart) -> Void)? { get }
    var onChartRenderingFailed: (() -> Void)? { get }
}
