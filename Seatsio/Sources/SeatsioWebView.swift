import Foundation
import WebKit

public class SeatsioWebView: WKWebView {
    var bridge: JustBridge!
    var seatsioConfig: SeatsioConfig

    public init(frame: CGRect, region: String, seatsioConfig: SeatsioConfig) {
        self.seatsioConfig = seatsioConfig
        super.init(frame: frame, configuration: WKWebViewConfiguration())
        bridge = JustBridge(with: self)
        loadSeatingChart(region: region)
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    private func loadSeatingChart(region: String) {
        let callbacks = self.buildCallbacksConfiguration().joined(separator: ",")
        var config = self.buildConfiguration()

        if !callbacks.isEmpty {
            config = config.dropLast() // Removes the } from config json
            + ","
            + callbacks
            + "}"
        }

        let htmlString = HTML
            .replacingOccurrences(of: "%configAsJs%", with: config)
            .replacingOccurrences(of: "%region%", with: region)
            .replacingOccurrences(of: "%toolName%", with: seatsioConfig.toolName)

        self.loadHTMLString(htmlString, baseURL: nil)
    }

    private func buildConfiguration() -> String {
        seatsioConfig.jsonStringRepresentation
    }

    private func buildCallbacksConfiguration() -> [String] {
        var callbacks = [String]()

        if (self.seatsioConfig.priceFormatter != nil) {
            bridge.register("priceFormatter") { (data, callback) in
                callback(self.seatsioConfig.priceFormatter!(decodeFloat(firstArg(data))))
            }
            callbacks.append(buildCallbackConfigAsJS("priceFormatter"))
        }

        if (self.seatsioConfig.onSelectionValid != nil) {
            bridge.register("onSelectionValid") { (data, callback) in
                self.seatsioConfig.onSelectionValid!()
            }
            callbacks.append(buildCallbackConfigAsJS("onSelectionValid"))
        }

        if (self.seatsioConfig.onSelectionInvalid != nil) {
            bridge.register("onSelectionInvalid") { (data, callback) in
                return self.seatsioConfig.onSelectionInvalid!(decodeSelectionValidatorTypes(firstArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onSelectionInvalid"))
        }

        if (self.seatsioConfig.onHoldCallsInProgress != nil) {
            bridge.register("onHoldCallsInProgress") { (data, callback) in
                self.seatsioConfig.onHoldCallsInProgress!()
            }
            callbacks.append(buildCallbackConfigAsJS("onHoldCallsInProgress"))
        }

        if (self.seatsioConfig.onHoldCallsComplete != nil) {
            bridge.register("onHoldCallsComplete") { (data, callback) in
                self.seatsioConfig.onHoldCallsComplete!()
            }
            callbacks.append(buildCallbackConfigAsJS("onHoldCallsComplete"))
        }

        if (self.seatsioConfig.onObjectSelected != nil) {
            bridge.register("onObjectSelected") { (data, callback) in
                self.seatsioConfig.onObjectSelected!(decodeSeatsioObject(firstArg(data)), decodeTicketType(secondArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onObjectSelected"))
        }

        if (self.seatsioConfig.onObjectDeselected != nil) {
            bridge.register("onObjectDeselected") { (data, callback) in
                self.seatsioConfig.onObjectDeselected!(decodeSeatsioObject(firstArg(data)), decodeTicketType(secondArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onObjectDeselected"))
        }

        if (self.seatsioConfig.onObjectClicked != nil) {
            bridge.register("onObjectClicked") { (data, callback) in
                self.seatsioConfig.onObjectClicked!(decodeSeatsioObject(firstArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onObjectClicked"))
        }

        if (self.seatsioConfig.onObjectStatusChanged != nil) {
            bridge.register("onObjectStatusChanged") { (data, callback) in
                self.seatsioConfig.onObjectStatusChanged!(decodeSeatsioObject(firstArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onObjectStatusChanged"))
        }

        if (self.seatsioConfig.onSessionInitialized != nil) {
            bridge.register("onSessionInitialized") { (data, callback) in
                self.seatsioConfig.onSessionInitialized!(decodeHoldToken(firstArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onSessionInitialized"))
        }

        if (self.seatsioConfig.onHoldTokenExpired != nil) {
            bridge.register("onHoldTokenExpired") { (data, callback) in
                self.seatsioConfig.onHoldTokenExpired!()
            }
            callbacks.append(buildCallbackConfigAsJS("onHoldTokenExpired"))
        }

        if (self.seatsioConfig.onBestAvailableSelected != nil) {
            bridge.register("onBestAvailableSelected") { (data, callback) in
                self.seatsioConfig.onBestAvailableSelected!(decodeSeatsioObjects(firstArg(data)), decodeBool(secondArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onBestAvailableSelected"))
        }

        if (self.seatsioConfig.onBestAvailableSelectionFailed != nil) {
            bridge.register("onBestAvailableSelectionFailed") { (data, callback) in
                self.seatsioConfig.onBestAvailableSelectionFailed!()
            }
            callbacks.append(buildCallbackConfigAsJS("onBestAvailableSelectionFailed"))
        }

        if (self.seatsioConfig.onHoldSucceeded != nil) {
            bridge.register("onHoldSucceeded") { (data, callback) in
                self.seatsioConfig.onHoldSucceeded!(decodeSeatsioObjects(firstArg(data)), decodeTicketTypes(secondArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onHoldSucceeded"))
        }

        if (self.seatsioConfig.onHoldFailed != nil) {
            bridge.register("onHoldFailed") { (data, callback) in
                self.seatsioConfig.onHoldFailed!(decodeSeatsioObjects(firstArg(data)), decodeTicketTypes(secondArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onHoldFailed"))
        }

        if (self.seatsioConfig.onReleaseHoldSucceeded != nil) {
            bridge.register("onReleaseHoldSucceeded") { (data, callback) in
                self.seatsioConfig.onReleaseHoldSucceeded!(decodeSeatsioObjects(firstArg(data)), decodeTicketTypes(secondArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onReleaseHoldSucceeded"))
        }

        if (self.seatsioConfig.onReleaseHoldFailed != nil) {
            bridge.register("onReleaseHoldFailed") { (data, callback) in
                self.seatsioConfig.onReleaseHoldFailed!(decodeSeatsioObjects(firstArg(data)), decodeTicketTypes(secondArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onReleaseHoldFailed"))
        }

        if (self.seatsioConfig.onSelectedObjectBooked != nil) {
            bridge.register("onSelectedObjectBooked") { (data, callback) in
                self.seatsioConfig.onSelectedObjectBooked!(decodeSeatsioObject(firstArg(data)))
            }
            callbacks.append(buildCallbackConfigAsJS("onSelectedObjectBooked"))
        }

        if (self.seatsioConfig.tooltipInfo != nil) {
            bridge.register("tooltipInfo") { (data, callback) in
                callback(self.seatsioConfig.tooltipInfo!(decodeSeatsioObject(firstArg(data))))
            }
            callbacks.append(buildCallbackConfigAsJS("tooltipInfo"))
        }

        if (self.seatsioConfig.popoverInfo != nil) {
            bridge.register("popoverInfo") { (data, callback) in
                callback(self.seatsioConfig.popoverInfo!(decodeSeatsioObject(firstArg(data))))
            }
            callbacks.append(buildCallbackConfigAsJS("popoverInfo"))
        }

        if (self.seatsioConfig.onChartRendered != nil) {
            bridge.register("onChartRendered") { (data, callback) in
                self.seatsioConfig.onChartRendered!(SeatingChart(self))
            }
            callbacks.append(buildCallbackConfigAsJS("onChartRendered"))
        }

        if (self.seatsioConfig.onChartRenderingFailed != nil) {
            bridge.register("onChartRenderingFailed") { (data, callback) in
                self.seatsioConfig.onChartRenderingFailed!(SeatingChart(self))
            }
            callbacks.append(buildCallbackConfigAsJS("onChartRenderingFailed"))
        }

        if (self.seatsioConfig.onChartRerenderingStarted != nil) {
            bridge.register("onChartRerenderingStarted") { (data, callback) in
                self.seatsioConfig.onChartRerenderingStarted!(SeatingChart(self))
            }
            callbacks.append(buildCallbackConfigAsJS("onChartRerenderingStarted"))
        }

        if let seatingChartConfig = self.seatsioConfig as? SeatingChartConfig {
            if (seatingChartConfig.onPlacesPrompt != nil) {
                bridge.register("onPlacesPrompt") { (data, callback) in
                    seatingChartConfig.onPlacesPrompt!(decodeOnPlacesPromptParams(firstArg(data)), {(data: Int) -> () in self.callInternalCallback("onPlacesPrompt", data)})
                }
                callbacks.append(buildCallbackConfigAsJS("onPlacesPrompt"))
            }

            if (seatingChartConfig.onTicketTypePrompt != nil) {
                bridge.register("onTicketTypePrompt") { (data, callback) in
                    seatingChartConfig.onTicketTypePrompt!(decodeOnTicketTypePromptParams(firstArg(data)), {(data: String) -> () in self.callInternalCallback("onTicketTypePrompt", data)})
                }
                callbacks.append(buildCallbackConfigAsJS("onTicketTypePrompt"))
            }

            if (seatingChartConfig.onPlacesWithTicketTypesPrompt != nil) {
                bridge.register("onPlacesWithTicketTypesPrompt") { (data, callback) in
                    seatingChartConfig.onPlacesWithTicketTypesPrompt!(decodeOnPlacesWithTicketTypesPromptParams(firstArg(data)), {(data: [String: Int]) -> () in self.callInternalCallback("onPlacesWithTicketTypesPrompt", data)})
                }
                callbacks.append(buildCallbackConfigAsJS("onPlacesWithTicketTypesPrompt"))
            }

            if (seatingChartConfig.onFloorChanged != nil) {
                bridge.register("onFloorChanged") { (data, callback) in
                    seatingChartConfig.onFloorChanged!(decodeFloor(firstArg(data)))
                }
                callbacks.append(buildCallbackConfigAsJS("onFloorChanged"))
            }

            if (seatingChartConfig.onFilteredCategoriesChanged != nil) {
                bridge.register("onFilteredCategoriesChanged") { (data, callback) in
                    seatingChartConfig.onFilteredCategoriesChanged!(decodeCategories(firstArg(data)))
                }
                callbacks.append(buildCallbackConfigAsJS("onFilteredCategoriesChanged"))
            }
        }

        return callbacks
    }

    private func buildCallbackConfigAsJS(_ name: String) -> String {
        return """
               \(name): (arg1, arg2) => (
                   new Promise((resolve, reject) => {
                       if (arg2 instanceof Function) {
                           window.bridge.setInnerCallback("\(name)", arg2)
                           window.bridge.call("\(name)", [JSON.stringify(arg1), "\(name)"], data => resolve(data), error => reject(error))
                       } else {
                           window.bridge.call("\(name)", [JSON.stringify(arg1), JSON.stringify(arg2)], data => resolve(data), error => reject(error))
                       }
                   })
               )
               """
    }

    public func callInternalCallback(_ name: String, _ data: Any) {
        bridge.callInternalCallback(name, data)
    }

    public func cleanup() {
        bridge.cleanUp()
        bridge = nil
    }
}

private func firstArg(_ data: Any?) -> Any {
    return (data as! [Any])[0]
}

private func secondArg(_ data: Any?) -> Any {
    return (data as! [Any])[1]
}

private func thirdArg(_ data: Any?) -> Any {
    return (data as! [Any])[2]
}

func decodeSeatsioObject(_ data: Any) -> SeatsioObject {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(SeatsioObject.self, from: dataToDecode)
}

func decodeHoldToken(_ data: Any) -> HoldToken {
    let dataToDecode = (data as! String).data(using: .utf8)!
    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    decoder.dateDecodingStrategy = .formatted(formatter)
    return try! decoder.decode(HoldToken.self, from: dataToDecode)
}

func decodeSeatsioObjects(_ data: Any) -> [SeatsioObject] {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode([SeatsioObject].self, from: dataToDecode)
}

func decodeReportBySelectability(_ data: Any) -> ReportBySelectability {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(ReportBySelectability.self, from: dataToDecode)
}

func decodeCategories(_ data: Any) -> [Category] {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode([Category].self, from: dataToDecode)
}

func decodeFloat(_ data: Any) -> Float {
    return (data as! NSString).floatValue
}

func decodeBool(_ data: Any) -> Bool {
    return (data as! NSString).boolValue
}

func decodeTicketType(_ data: Any) -> TicketType? {
    if (data is NSNull) {
        return nil
    }

    let dataAsString = data as! String

    if (dataAsString == "null") {
        return nil
    }

    let dataToDecode = dataAsString.data(using: .utf8)!
    return try! JSONDecoder().decode(TicketType.self, from: dataToDecode)
}

func decodeTicketTypes(_ data: Any) -> [TicketType]? {
    let dataToDecode = (data as! String).data(using: .utf8)!
    do {
        return try JSONDecoder().decode([TicketType].self, from: dataToDecode)
    } catch {
        return nil
    }
}

func decodeSelectionValidatorTypes(_ data: Any) -> [SelectionValidatorType] {
    let data = (data as! String).data(using: .utf8)
    return try! JSONDecoder().decode([SelectionValidatorType].self, from: data!)
}

func decodeOnPlacesPromptParams(_ data: Any) -> OnPlacesPromptParams {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(OnPlacesPromptParams.self, from: dataToDecode)
}

func decodeOnTicketTypePromptParams(_ data: Any) -> OnTicketTypePromptParams {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(OnTicketTypePromptParams.self, from: dataToDecode)
}

func decodeOnPlacesWithTicketTypesPromptParams(_ data: Any) -> OnPlacesWithTicketTypesPromptParams {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(OnPlacesWithTicketTypesPromptParams.self, from: dataToDecode)
}

func decodeFloor(_ data: Any) -> Floor {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(Floor.self, from: dataToDecode)
}
