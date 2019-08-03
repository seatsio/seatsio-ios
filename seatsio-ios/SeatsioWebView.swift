import Foundation
import WebKit
import JustBridge

class SeatsioWebView: WKWebView {
    var bridge: JustBridge!
    var seatsioConfig: [String: Any] = [:]
    var eventsAsJs: Array<String> = []

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadSeatingChart()
    }

    init(frame: CGRect, seatsioConfig: [String: Any]!) {
        super.init(frame: frame, configuration: WKWebViewConfiguration())
        self.seatsioConfig = seatsioConfig
        bridge = JustBridge(with: self)
        loadSeatingChart()
    }

    func loadSeatingChart() {

        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")!
        var htmlString = try! String(contentsOfFile: htmlPath, encoding: String.Encoding.utf8)

        htmlString = htmlString.replacingOccurrences(of: "%configAsJs%", with: self.buildConfiguration())
                .replacingOccurrences(of: "%events%", with: "," + self.buildCallbacksConfiguration().joined(separator: ","))

        self.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
    }

    func buildConfiguration() -> String {
        return (seatsioConfig.compactMap({ (key, value) -> String in
            return "\(key):'\(value)'"
        }) as Array).joined(separator: ",")
    }

    func buildCallbacksConfiguration() -> [String] {
        var callbacks = [String]()

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
