import Foundation

public enum EventManagerMode: String, Encodable {
    case manageObjectStatuses
    case manageForSaleConfig
    case manageTableBooking
    case manageChannels
    case manageCategories
    case select
    case filterSections
    case `static`
}

struct EventManagerConfigParams: Encodable {
    var secretKey: String?
    var event: String?
    var events: [String]?
    var messages: [String: String]?
    var mode: EventManagerMode?
    var language: String?
    var colors: Colors?
    var colorScheme: String?
    var loading: String?
    var style: Style?
    var stylePreset: String?
    var objectColor: String?
    var extraConfig: AnyEncodable?
    let divId = "chart"
}

public final class EventManagerConfig: SeatsioConfig {
    
    private(set) var params = EventManagerConfigParams()
    public private(set) var priceFormatter: ((Float) -> String)?
    public private(set) var tooltipInfo: ((SeatsioObject) -> String)?
    public private(set) var popoverInfo: ((SeatsioObject) -> String)?
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
    public private(set) var onChartRendered: ((SeatingChart) -> Void)?
    public private(set) var onChartRenderingFailed: (() -> Void)?

    public var toolName: String { "EventManager" }
    
    public init() {}
    
    public func secretKey(_ secretKey: String) -> Self {
        params.secretKey = secretKey
        return self
    }
    
    public func event(_ event: String) -> Self {
        params.event = event
        return self
    }
    
    public func events(_ events: [String]) -> Self {
        params.events = events
        return self
    }

    public func language(_ language: String) -> Self {
        params.language = language
        return self
    }
    
    public func messages(_ messages: [String: String]) -> Self {
        params.messages = messages
        return self
    }

    public func mode(_ mode: EventManagerMode) -> Self {
        params.mode = mode
        return self
    }

    public func loading(_ loading: String) -> Self {
        params.loading = loading
        return self
    }

    public func objectColor(_ objectColor: String) -> Self {
        params.objectColor = objectColor
        return self
    }

    public func extraConfig(_ extraConfig: Encodable) -> Self {
        params.extraConfig = AnyEncodable(value: extraConfig)
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

    public func onSelectedObjectBooked(_ onSelectedObjectBooked: @escaping (SeatsioObject) -> ()) -> Self {
        self.onSelectedObjectBooked = onSelectedObjectBooked
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

    public func onChartRenderingFailed(_ onChartRenderingFailed: @escaping () -> ()) -> Self {
        self.onChartRenderingFailed = onChartRenderingFailed
        return self
    }

    public func colorScheme(_ colorScheme: String) -> Self {
        params.colorScheme = colorScheme
        return self
    }

    public func colors(_ colors: Colors) -> Self {
        params.colors = colors
        return self
    }

    public func stylePreset(_ stylePreset: String) -> Self {
        params.stylePreset = stylePreset
        return self
    }

    public func style(_ style: Style) -> Self {
        params.style = style
        return self
    }
    
    public var jsonStringRepresentation: String {
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(params) else {
            assertionFailure("Failed to encode config")
            return ""
        }
        return String(decoding: jsonData, as: UTF8.self)
    }
}
