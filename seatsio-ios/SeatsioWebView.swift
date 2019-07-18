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
    func onTooltipInfo(_ object: [String : AnyObject]) -> String
    func onObjectSelected(_ object: [String: AnyObject]) -> Void
    @objc optional func getErrorMessages(codes: [JSInt]) -> [String]
}

// Implement protocol.
extension SeatsioWebView: JavaScriptInterface {
    func onTooltipInfo(_ object: [String : AnyObject]) -> String {
        return "TEST"
    }

    func onObjectSelected(_ object: [String : AnyObject]) -> Void {
        self.providedOnObjectSelected!(object)
    }

    func getErrorMessages(codes: [JSInt]) -> [String] {
        return codes.map { "message\($0)" }
    }
}

class SeatsioWebView : WKWebView {
    var seatsioConfig: [String: Any] = [:]
    var events: Array<String> = []
    var providedOnObjectSelected: (([String: AnyObject]) -> Void)?
    // var providedOnTooltipInfo: ((([String: AnyObject]) -> String) -> Void)?

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

        self.events.append("""
           ,onObjectSelected: function(...args) {
               native.onObjectSelected({payload: JSON.stringify(args)});
           }
           ,tooltipInfo: async (object) => await native.onTooltipInfo(JSON.stringify(object))
        """)

        htmlString = htmlString.replacingOccurrences(of: "%configAsJs%", with: configAsJs)
        htmlString = htmlString.replacingOccurrences(of: "%events%", with: events.joined(separator: ","))

        print(htmlString)

        self.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
    }

    func setOnObjectSelected(_ fn: @escaping ([String: AnyObject]) -> Void) {
        self.providedOnObjectSelected = fn
    }
}
