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
            bridge.register("priceFormatterHandler") { (data, callback) in
                callback(self.seatsioConfig.priceFormatter!((data as! NSString).floatValue))
            }
            callbacks.append(buildCallbackConfigAsJS(name: "priceFormatter"))
        }

        if (self.seatsioConfig.onSelectionValid != nil) {
            bridge.register("onSelectionValidHandler") { (data, callback) in
                self.seatsioConfig.onSelectionValid!()
            }
            callbacks.append(buildCallbackConfigAsJS(name: "onSelectionValid"))
        }

        if (self.seatsioConfig.onSelectionInvalid != nil) {
            bridge.register("onSelectionInvalidHandler") { (data, callback) in
                self.seatsioConfig.onSelectionInvalid!()
            }
            callbacks.append(buildCallbackConfigAsJS(name: "onSelectionInvalid"))
        }

        /*
        if seatsioConfig["onChartRendered"] != nil {
            bridge.register("onChartRenderedHandler") { (data, callback) in
                let fn = self.seatsioConfig["onChartRendered"] as! () -> Void
                fn()
            }
            callbacks.append(buildCallbackConfigAsJS(name: "onChartRendered"))
        }
        if (seatsioConfig["onObjectSelected"] != nil) {
            bridge.register("onObjectSelectedHandler") { (data, callback) in
                let fn = self.seatsioConfig["onObjectSelected"] as! (SeatsioObject) -> Void
                fn(self.decodeSeatsioObject(data: data))
            }
            callbacks.append(buildCallbackConfigAsJS(name: "onObjectSelected"))
        }
        if (seatsioConfig["tooltipInfo"] != nil) {
            bridge.register("tooltipInfoHandler") { (data, callback) in
                let fn = self.seatsioConfig["tooltipInfo"] as! (SeatsioObject) -> String
                callback(fn(self.decodeSeatsioObject(data: data!)))
            }
            callbacks.append(buildCallbackConfigAsJS(name: "tooltipInfo"))
        }
        */

        return callbacks
    }

    func buildCallbackConfigAsJS(name: String) -> String {
        return """
               \(name): object => (
                   new Promise(resolve => {
                       window.bridge.call("\(name)Handler", JSON.stringify(object),
                           data => { resolve(data) },
                           error => {
                               log("error: " + error)
                               console.error("error: " + error)
                           }
                       )
                   })
               )
               """
    }


    func decodeSeatsioObject(data: Any) -> SeatsioObject {
        let dataToDecode = (data as! String).data(using: .utf8)!
        return try! JSONDecoder().decode(SeatsioObject.self, from: dataToDecode)
    }

}
