import Foundation
import WebKit
import JustBridge

class SeatsioWebView: WKWebView {
    var bridge: JustBridge!
    var seatsioConfig: SeatingChartConfig

    init(frame: CGRect, seatsioConfig: SeatingChartConfig) {
        self.seatsioConfig = seatsioConfig
        super.init(frame: frame, configuration: WKWebViewConfiguration())
        bridge = JustBridge(with: self)
        loadSeatingChart()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    private func loadSeatingChart() {
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")!
        let callbacks = self.buildCallbacksConfiguration().joined(separator: ",")
        let config = self.buildConfiguration()
                .dropLast()
                + "," + callbacks + "}";
        var htmlString = try! String(contentsOfFile: htmlPath, encoding: String.Encoding.utf8)
        htmlString = htmlString.replacingOccurrences(of: "%configAsJs%", with: config)
        self.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
    }

    private func buildConfiguration() -> String {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(self.seatsioConfig)
        return String(decoding: jsonData, as: UTF8.self)
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

        if (self.seatsioConfig.onChartRendered != nil) {
            bridge.register("onChartRendered") { (data, callback) in
                self.seatsioConfig.onChartRendered!(SeatingChart(self))
            }
            callbacks.append(buildCallbackConfigAsJS("onChartRendered"))
        }

        if (self.seatsioConfig.onChartRenderingFailed != nil) {
            bridge.register("onChartRenderingFailed") { (data, callback) in
                self.seatsioConfig.onChartRenderingFailed!()
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

private func firstArg(_ data: Any?) -> Any {
    return (data as! [Any])[0]
}

private func secondArg(_ data: Any?) -> Any {
    return (data as! [Any])[1]
}

func decodeSeatsioObject(_ data: Any) -> SeatsioObject {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(SeatsioObject.self, from: dataToDecode)
}

func decodeSeatsioObjects(_ data: Any) -> [SeatsioObject] {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode([SeatsioObject].self, from: dataToDecode)
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