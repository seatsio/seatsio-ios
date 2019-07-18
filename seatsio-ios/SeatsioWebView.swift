//
//  SeatsioWebView.swift
//  seatsio-ios
//
//  Created by Nahuel Chaves on 05/06/2019.
//  Copyright © 2019 Ben Verbeken. All rights reserved.
//

import Foundation
import WebKit
import WKJavaScriptController

// Create protocol.
// '@objc' keyword is required. because method call is based on ObjC.
@objc protocol JavaScriptInterface {
    @objc optional func onTooltipInfo(_ object: [String : AnyObject]) -> String
    @objc optional func onObjectSelected(_ object: [String: AnyObject]) -> Void
    func onChartRendered(_ chart: [String: AnyObject]) -> Void
}

// Implement protocol.
extension SeatsioWebView: JavaScriptInterface {
    func onTooltipInfo(_ object: [String : AnyObject]) -> String {
        return self.providedOnTooltipInfo!(object)
    }

    func onObjectSelected(_ object: [String : AnyObject]) -> Void {
        self.providedOnObjectSelected!(object)
    }

    func onChartRendered(_ chart: [String : AnyObject]) -> Void {
        self.providedOnChartRendered!(chart)
    }
}

class SeatsioWebView : WKWebView {
    var seatsioConfig: [String: Any] = [:]
    var events: Array<String> = []
    var providedOnObjectSelected: (([String: AnyObject]) -> Void)?
    var providedOnTooltipInfo: (([String: AnyObject]) -> String)?
    var providedOnChartRendered: (([String: AnyObject]) -> Void)?

    required override init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(frame: CGRect, configuration: WKWebViewConfiguration, seatsioConfig: [String: Any]!) {
        super.init(frame: frame, configuration: configuration)
        self.seatsioConfig = seatsioConfig
    }

    func loadSeatingChart() {
        // Create javaScriptController.
        let javaScriptController = WKJavaScriptController(name: "native", target: self, bridgeProtocol: JavaScriptInterface.self)

        // Assign javaScriptController.
        self.javaScriptController = javaScriptController

        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")!
        var htmlString = try! String(contentsOfFile: htmlPath, encoding: String.Encoding.utf8)
        self.prepareForJavaScriptController() // Call prepareForJavaScriptController before initializing WKWebView or loading page.

        var configAsJs = (seatsioConfig.compactMap({ (key, value) -> String in
            return "\(key):'\(value)'"
        }) as Array).joined(separator: ",")

        self.events = self.buildCallbacks()

        htmlString = htmlString.replacingOccurrences(of: "%configAsJs%", with: configAsJs)
        htmlString = htmlString.replacingOccurrences(of: "%events%", with: "," + events.joined(separator: ","))

        print(htmlString)

        self.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
    }

    func buildCallbacks() -> [String] {
        var callbacks = [String]()
        if self.providedOnChartRendered != nil {
            callbacks.append("""
                             onChartRendered: function(chart) {
                               native.onChartRendered(JSON.stringify(chart));
                             }
                             """)
        }
        if (self.providedOnObjectSelected != nil) {
            callbacks.append("""
                             onObjectSelected: function(...args) {
                                 native.onObjectSelected({payload: JSON.stringify(args)});
                             }
                             """)
        }
        if (self.providedOnTooltipInfo != nil ) {
            callbacks.append("""
                             tooltipInfo: async (object) => await native.onTooltipInfo(JSON.stringify(object))
                             """)
        }

        return callbacks
    }

    func setOnObjectSelected(_ fn: @escaping ([String: AnyObject]) -> Void) {
        self.providedOnObjectSelected = fn
    }

    func setOnChartRendered(_ fn: @escaping ([String: AnyObject]) -> Void) {
        self.providedOnChartRendered = fn
    }

    func setOnToolipInfo(_ fn: @escaping ([String: AnyObject]) -> String) {
        self.providedOnTooltipInfo = fn
    }
}
