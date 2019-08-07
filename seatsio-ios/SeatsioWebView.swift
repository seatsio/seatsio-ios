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

    func loadSeatingChart() {
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")!
        let callbacks = self.buildCallbacksConfiguration().joined(separator: ",")
        let config = self.buildConfiguration()
                .dropLast()
                + "," + callbacks + "}";
        var htmlString = try! String(contentsOfFile: htmlPath, encoding: String.Encoding.utf8)
        htmlString = htmlString.replacingOccurrences(of: "%configAsJs%", with: config)
        self.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
    }

    func buildConfiguration() -> String {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(self.seatsioConfig)
        return String(decoding: jsonData, as: UTF8.self)
    }

    func buildCallbacksConfiguration() -> [String] {
        var callbacks = [String]()

        if (self.seatsioConfig.priceFormatter != nil) {
            bridge.register("priceFormatter") { (data, callback) in
                callback(self.seatsioConfig.priceFormatter!((firstArg(data) as! NSString).floatValue))
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

        return callbacks
    }

    func buildCallbackConfigAsJS(_ name: String) -> String {
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

private func decodeSeatsioObject(_ data: Any) -> SeatsioObject {
    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(SeatsioObject.self, from: dataToDecode)
}

private func decodeTicketType(_ data: Any) -> TicketType? {
    if (data is NSNull) {
        return nil
    }

    let dataToDecode = (data as! String).data(using: .utf8)!
    return try! JSONDecoder().decode(TicketType.self, from: dataToDecode)
}

private func decodeSelectionValidatorTypes(_ data: Any) -> [SelectionValidatorType] {
    let data = (data as! String).data(using: .utf8)
    return try! JSONDecoder().decode([SelectionValidatorType].self, from: data!)
}