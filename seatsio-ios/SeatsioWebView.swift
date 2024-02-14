import Foundation
import WebKit
import JustBridge

public class SeatsioWebView: WKWebView {
    var bridge: JustBridge!
    var seatsioConfig: SeatingChartConfig

    public init(frame: CGRect, region: String, seatsioConfig: SeatingChartConfig) {
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
        let config = self.buildConfiguration()
                .dropLast()
                + "," + callbacks + "}";
        let htmlString = HTML
                .replacingOccurrences(of: "%configAsJs%", with: config)
                .replacingOccurrences(of: "%region%", with: region)
        self.loadHTMLString(htmlString, baseURL: nil)
    }

    private func buildConfiguration() -> String {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(self.seatsioConfig)
        return String(decoding: jsonData, as: UTF8.self)
    }

    private func buildCallbacksConfiguration() -> [String] {
        var callbacks = [String]()

        if (self.seatsioConfig.priceFormatter != nil) {
            bridge.register("priceFormatter") { [weak self] data, callback in
                guard let priceFormatter = self?.seatsioConfig.priceFormatter,
                      let argument = firstArg(data),
                      let decodedFloat = decodeFloat(argument) else {
                    return
                }

                callback(priceFormatter(decodedFloat))
            }
            callbacks.append(buildCallbackConfigAsJS("priceFormatter"))
        }

        if (self.seatsioConfig.onSelectionValid != nil) {
            bridge.register("onSelectionValid") { [weak self] data, callback in
                guard let onSelectionValid = self?.seatsioConfig.onSelectionValid else {
                    return
                }

                onSelectionValid()
            }
            callbacks.append(buildCallbackConfigAsJS("onSelectionValid"))
        }

        if (self.seatsioConfig.onSelectionInvalid != nil) {
            bridge.register("onSelectionInvalid") { [weak self] data, callback in
                guard let onSelectionInvalid = self?.seatsioConfig.onSelectionInvalid,
                      let argument = firstArg(data),
                      let validatorTypes = decodeSelectionValidatorTypes(argument) else {
                    return
                }

                onSelectionInvalid(validatorTypes)
            }
            callbacks.append(buildCallbackConfigAsJS("onSelectionInvalid"))
        }

        if (self.seatsioConfig.onObjectSelected != nil) {
            bridge.register("onObjectSelected") { [weak self] data, callback in
                guard let onObjectSelected = self?.seatsioConfig.onObjectSelected,
                      let firstArgument = firstArg(data),
                      let secondArgument = secondArg(data),
                      let seatsioObject = decodeSeatsioObject(firstArgument) else {
                    return
                }

                let ticketType = decodeTicketType(secondArgument)
                onObjectSelected(seatsioObject, ticketType)
            }
            callbacks.append(buildCallbackConfigAsJS("onObjectSelected"))
        }

         if (self.seatsioConfig.onObjectDeselected != nil) {
             bridge.register("onObjectDeselected") { [weak self] data, callback in
                 guard let onObjectDeselected = self?.seatsioConfig.onObjectDeselected,
                       let firstArgument = firstArg(data),
                       let secondArgument = secondArg(data),
                       let seatsioObject = decodeSeatsioObject(firstArgument) else {
                     return
                 }

                 let ticketType = decodeTicketType(secondArgument)
                 onObjectDeselected(seatsioObject, ticketType)
             }
             callbacks.append(buildCallbackConfigAsJS("onObjectDeselected"))
         }

        if (self.seatsioConfig.onObjectClicked != nil) {
            bridge.register("onObjectClicked") { [weak self] data, callback in
                guard let onObjectClicked = self?.seatsioConfig.onObjectClicked,
                      let firstArgument = firstArg(data),
                      let seatsioObject = decodeSeatsioObject(firstArgument) else {
                    return
                }

                onObjectClicked(seatsioObject)
            }
            callbacks.append(buildCallbackConfigAsJS("onObjectClicked"))
        }

        if (self.seatsioConfig.onObjectStatusChanged != nil) {
            bridge.register("onObjectStatusChanged") { [weak self] data, callback in
                guard let onObjectStatusChanged = self?.seatsioConfig.onObjectStatusChanged,
                      let firstArgument = firstArg(data),
                      let seatsioObject = decodeSeatsioObject(firstArgument) else {
                    return
                }

                onObjectStatusChanged(seatsioObject)
            }
            callbacks.append(buildCallbackConfigAsJS("onObjectStatusChanged"))
        }

        if (self.seatsioConfig.onSessionInitialized != nil) {
            bridge.register("onSessionInitialized") { [weak self] data, callback in
                guard let onSessionInitialized = self?.seatsioConfig.onSessionInitialized,
                      let firstArgument = firstArg(data),
                      let decodedHoldToken = decodeHoldToken(firstArgument) else {
                    return
                }

                onSessionInitialized(decodedHoldToken)
            }
            callbacks.append(buildCallbackConfigAsJS("onSessionInitialized"))
        }

        if (self.seatsioConfig.onHoldTokenExpired != nil) {
            bridge.register("onHoldTokenExpired") { [weak self] data, callback in
                guard let onHoldTokenExpired = self?.seatsioConfig.onHoldTokenExpired else {
                    return
                }

                onHoldTokenExpired()
            }
            callbacks.append(buildCallbackConfigAsJS("onHoldTokenExpired"))
        }

        if (self.seatsioConfig.onBestAvailableSelected != nil) {
            bridge.register("onBestAvailableSelected") { [weak self] data, callback in
                guard let onBestAvailableSelected = self?.seatsioConfig.onBestAvailableSelected,
                      let firstArgument = firstArg(data),
                      let secondArgument = secondArg(data),
                      let seatsioObjects = decodeSeatsioObjects(firstArgument),
                      let decodedBool = decodeBool(secondArgument) else {
                    return
                }

                onBestAvailableSelected(seatsioObjects, decodedBool)
            }
            callbacks.append(buildCallbackConfigAsJS("onBestAvailableSelected"))
        }

        if (self.seatsioConfig.onBestAvailableSelectionFailed != nil) {
            bridge.register("onBestAvailableSelectionFailed") { [weak self] data, callback in
                guard let onBestAvailableSelectionFailed = self?.seatsioConfig.onBestAvailableSelectionFailed else {
                    return
                }

                onBestAvailableSelectionFailed()
            }
            callbacks.append(buildCallbackConfigAsJS("onBestAvailableSelectionFailed"))
        }

        if (self.seatsioConfig.onHoldSucceeded != nil) {
            bridge.register("onHoldSucceeded") { [weak self] data, callback in
                guard let onHoldSucceeded = self?.seatsioConfig.onHoldSucceeded,
                      let firstArgument = firstArg(data),
                      let secondArgument = secondArg(data),
                      let seatsioObjects = decodeSeatsioObjects(firstArgument) else {
                    return
                }

                let ticketTypes = decodeTicketTypes(secondArgument)
                onHoldSucceeded(seatsioObjects, ticketTypes)
            }
            callbacks.append(buildCallbackConfigAsJS("onHoldSucceeded"))
        }

        if (self.seatsioConfig.onHoldFailed != nil) {
            bridge.register("onHoldFailed") { [weak self] data, callback in
                guard let onHoldFailed = self?.seatsioConfig.onHoldFailed,
                      let firstArgument = firstArg(data),
                      let secondArgument = secondArg(data),
                      let seatsioObjects = decodeSeatsioObjects(firstArgument) else {
                    return
                }

                let ticketTypes = decodeTicketTypes(secondArgument)
                onHoldFailed(seatsioObjects, ticketTypes)
            }
            callbacks.append(buildCallbackConfigAsJS("onHoldFailed"))
        }

        if (self.seatsioConfig.onReleaseHoldSucceeded != nil) {
            bridge.register("onReleaseHoldSucceeded") { [weak self] data, callback in
                guard let onReleaseHoldSucceeded = self?.seatsioConfig.onReleaseHoldSucceeded,
                      let firstArgument = firstArg(data),
                      let secondArgument = secondArg(data),
                      let seatsioObjects = decodeSeatsioObjects(firstArgument) else {
                    return
                }

                let ticketTypes = decodeTicketTypes(secondArgument)
                callback(onReleaseHoldSucceeded(seatsioObjects, ticketTypes))
            }
            callbacks.append(buildCallbackConfigAsJS("onReleaseHoldSucceeded"))
        }

        if (self.seatsioConfig.onReleaseHoldFailed != nil) {
            bridge.register("onReleaseHoldFailed") { [weak self] data, callback in
                guard let onReleaseHoldFailed = self?.seatsioConfig.onReleaseHoldFailed,
                      let firstArgument = firstArg(data),
                      let secondArgument = secondArg(data),
                      let seatsioObjects = decodeSeatsioObjects(firstArgument) else {
                    return
                }

                let ticketTypes = decodeTicketTypes(secondArgument)
                callback(onReleaseHoldFailed(seatsioObjects, ticketTypes))
            }
            callbacks.append(buildCallbackConfigAsJS("onReleaseHoldFailed"))
        }

        if (self.seatsioConfig.onSelectedObjectBooked != nil) {
            bridge.register("onSelectedObjectBooked") { [weak self] data, callback in
                guard let onSelectedObjectBooked = self?.seatsioConfig.onSelectedObjectBooked,
                      let firstArgument = firstArg(data),
                      let seatsioObject = decodeSeatsioObject(firstArgument) else {
                    return
                }

                onSelectedObjectBooked(seatsioObject)
            }
            callbacks.append(buildCallbackConfigAsJS("onSelectedObjectBooked"))
        }

        if (self.seatsioConfig.tooltipInfo != nil) {
            bridge.register("tooltipInfo") { [weak self] data, callback in
                guard let tooltipInfo = self?.seatsioConfig.tooltipInfo,
                      let firstArgument = firstArg(data),
                      let seatsioObject = decodeSeatsioObject(firstArgument) else {
                    return
                }

                callback(tooltipInfo(seatsioObject))
            }
            callbacks.append(buildCallbackConfigAsJS("tooltipInfo"))
        }

        if (self.seatsioConfig.onChartRendered != nil) {
            bridge.register("onChartRendered") { [weak self] data, callback in
                guard let self, let onChartRendered = self.seatsioConfig.onChartRendered else {
                    return
                }

                onChartRendered(SeatingChart(self))
            }
            callbacks.append(buildCallbackConfigAsJS("onChartRendered"))
        }

        if (self.seatsioConfig.onChartRenderingFailed != nil) {
            bridge.register("onChartRenderingFailed") { [weak self] data, callback in
                guard let onChartRenderingFailed = self?.seatsioConfig.onChartRenderingFailed else {
                    return
                }

                onChartRenderingFailed()
            }
            callbacks.append(buildCallbackConfigAsJS("onChartRenderingFailed"))
        }

        return callbacks
    }

    private func buildCallbackConfigAsJS(_ name: String) -> String {
        return """
               \(name): (arg1, arg2) => (
                   new Promise((resolve, reject) => {
                       window.bridge.call("\(name)", [JSON.stringify(arg1), JSON.stringify(arg2)], data => resolve(data), error => reject(error))
                   })
               )
               """
    }

}

private func firstArg(_ data: Any?) -> Any? {
    return (data as? [Any])?.first
}

private func secondArg(_ data: Any?) -> Any? {
    guard let args = (data as? [Any]), args.count >= 2 else {
        return nil
    }

    return args[1]
}

func decodeSeatsioObject(_ data: Any) -> SeatsioObject? {
    guard let dataToDecode = (data as? String)?.data(using: .utf8) else {
        return nil
    }

    return try? JSONDecoder().decode(SeatsioObject.self, from: dataToDecode)
}

func decodeHoldToken(_ data: Any) -> HoldToken? {
    guard let dataToDecode = (data as? String)?.data(using: .utf8) else {
        return nil
    }

    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    decoder.dateDecodingStrategy = .formatted(formatter)
    return try? decoder.decode(HoldToken.self, from: dataToDecode)
}

func decodeSeatsioObjects(_ data: Any) -> [SeatsioObject]? {
    guard let dataToDecode = (data as? String)?.data(using: .utf8) else {
        return nil
    }

    return try? JSONDecoder().decode([SeatsioObject].self, from: dataToDecode)
}

func decodeReportBySelectability(_ data: Any) -> ReportBySelectability? {
    guard let dataToDecode = (data as? String)?.data(using: .utf8) else {
        return nil
    }

    return try? JSONDecoder().decode(ReportBySelectability.self, from: dataToDecode)
}

func decodeCategories(_ data: Any) -> [Category]? {
    guard let dataToDecode = (data as? String)?.data(using: .utf8) else {
        return nil
    }

    return try? JSONDecoder().decode([Category].self, from: dataToDecode)
}

func decodeFloat(_ data: Any) -> Float? {
    return (data as? NSString)?.floatValue
}

func decodeBool(_ data: Any) -> Bool? {
    return (data as? NSString)?.boolValue
}

func decodeTicketType(_ data: Any) -> TicketType? {
    if (data is NSNull) {
        return nil
    }

    guard let dataAsString = data as? String,
          dataAsString != "null",
          let dataToDecode = dataAsString.data(using: .utf8) else {
        return nil
    }

    return try? JSONDecoder().decode(TicketType.self, from: dataToDecode)
}


func decodeTicketTypes(_ data: Any) -> [TicketType]? {
    guard let dataToDecode = (data as? String)?.data(using: .utf8) else {
        return nil
    }

    return try? JSONDecoder().decode([TicketType].self, from: dataToDecode)
}

func decodeSelectionValidatorTypes(_ data: Any) -> [SelectionValidatorType]? {
    guard let dataToDecode = (data as? String)?.data(using: .utf8) else {
        return nil
    }

    return try? JSONDecoder().decode([SelectionValidatorType].self, from: dataToDecode)
}
