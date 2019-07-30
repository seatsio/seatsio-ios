//
//  SeatsioWebView.swift
//  seatsio-ios
//
//  Created by Nahuel Chaves on 05/06/2019.
//  Copyright © 2019 Ben Verbeken. All rights reserved.
//

import Foundation
import WebKit
import JustBridge

class SeatsioWebView : WKWebView {
    var bridge: JustBridge!
    var seatsioConfig: [String: Any] = [:]
    var eventsAsJs: Array<String> = []

    var providedOnObjectSelected: ((SeatsioObject) -> Void)?
    var providedOnTooltipInfo: ((SeatsioObject) -> String)?
    var providedOnChartRendered: ((SeatsioObject) -> Void)?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(frame: CGRect, configuration: WKWebViewConfiguration, seatsioConfig: [String: Any]!) {
        super.init(frame: frame, configuration: configuration)
        self.seatsioConfig = seatsioConfig
        bridge = JustBridge(with: self)
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

        bridge.register("tooltipInfoHandler") { (data, callback) in
            callback(self.providedOnTooltipInfo!(self.decodeSeatsioObject(data: data)!))
        }
        bridge.register("onChartRenderedHandler") { (data, callback) in
            self.providedOnChartRendered!(self.decodeSeatsioObject(data: data)!)
        }
        bridge.register("onObjectSelectedHandler") { (data, callback) in
            self.providedOnObjectSelected!(self.decodeSeatsioObject(data: data)!)
        }

        if self.providedOnChartRendered != nil {
            callbacks.append(buildCallbackConfigAsJS(name: "onChartRendered"))
        }
        if (self.providedOnObjectSelected != nil) {
            callbacks.append(buildCallbackConfigAsJS(name: "onObjectSelected"))
        }
        if (self.providedOnTooltipInfo != nil ) {
            callbacks.append(buildCallbackConfigAsJS(name: "tooltipInfo"))
        }

        return callbacks
    }

    func buildCallbackConfigAsJS(name: String) -> String {
        return """
               \(name): object => (
                   new Promise(resolve => {
                       window.bridge.call("\(name)Handler", JSON.stringify(object),
                           data => { resolve(handleResponse(data)) },
                           error => {
                               log("error: " + error)
                               console.error("error: " + error)
                           }
                       )
                   })
               )
               """
    }


    func decodeSeatsioObject(data: Optional<Any>) -> Optional<SeatsioObject> {
        let dataToDecode = (data as! String).data(using: .utf8)!

        do {
            let jsonArray = try JSONDecoder().decode(SeatsioObject.self, from: dataToDecode)
            return jsonArray
        } catch let error as NSError {
            print(error)
            return nil
        }
    }

    func setOnObjectSelected(_ fn: @escaping (SeatsioObject) -> Void) {
        self.providedOnObjectSelected = fn
    }

    func setOnChartRendered(_ fn: @escaping (SeatsioObject) -> Void) {
        self.providedOnChartRendered = fn
    }

    func setOnToolipInfo(_ fn: @escaping (SeatsioObject) -> String) {
        self.providedOnTooltipInfo = fn
    }
}
