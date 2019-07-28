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
    var providedOnObjectSelected: ((String) -> Void)?
    var providedOnTooltipInfo: ((String) -> String)?
    var providedOnChartRendered: ((String) -> Void)?

    required override init?(coder: NSCoder) {
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
        var configAsJs = (seatsioConfig.compactMap({ (key, value) -> String in
            return "\(key):'\(value)'"
        }) as Array).joined(separator: ",")

        self.eventsAsJs = self.buildEventsConfig()

        htmlString = htmlString.replacingOccurrences(of: "%configAsJs%", with: configAsJs)
        htmlString = htmlString.replacingOccurrences(of: "%events%", with: "," + eventsAsJs.joined(separator: ","))

        self.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
    }

    func buildEventsConfig() -> [String] {
        var callbacks = [String]()

        bridge.register("tooltipInfoHandler") { (data, callback) in callback(self.providedOnTooltipInfo!(data as! String)) }
        bridge.register("onChartRenderedHandler") { (data, callback) in self.providedOnChartRendered!(data as! String) }
        bridge.register("onObjectSelectedHandler") { (data, callback) in self.providedOnObjectSelected!(data as! String) }

        if self.providedOnChartRendered != nil {
            callbacks.append(createEventAsJs(name: "onChartRendered"))
        }
        if (self.providedOnObjectSelected != nil) {
            callbacks.append(createEventAsJs(name: "onObjectSelected"))
        }
        if (self.providedOnTooltipInfo != nil ) {
            callbacks.append("""
                             tooltipInfo: async object => {
                                 const result = await window.bridge.call("tooltipInfoHandler", JSON.stringify(object), responseData => {
                                    log("response: " + responseData);
                                    return responseData;
                                 }, function(errorMessage) {
                                     log("error: " + errorMessage)
                                     console.error("error: " + errorMessage)
                                 });
                                 return result;
                             }
                             """)
        }

        return callbacks
    }

    func createEventAsJs(name: String) -> String {
        return """
               \(name): object => {
                   window.bridge.call("\(name)Handler", JSON.stringify(object), responseData => {
                      return responseData;
                   }, function(errorMessage) {
                       console.error("error: " + errorMessage)
                   });
               }
               """
    }

    func setOnObjectSelected(_ fn: @escaping (String) -> Void) {
        self.providedOnObjectSelected = fn
    }

    func setOnChartRendered(_ fn: @escaping (String) -> Void) {
        self.providedOnChartRendered = fn
    }

    func setOnToolipInfo(_ fn: @escaping (String) -> String) {
        self.providedOnTooltipInfo = fn
    }
}
