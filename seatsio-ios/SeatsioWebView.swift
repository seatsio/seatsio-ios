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
    func onTooltipInfo(_ dictionary: [String: AnyObject]) -> String
    @objc optional func getErrorMessages(codes: [JSInt]) -> [String]
}

// Implement protocol.
extension SeatsioWebView: JavaScriptInterface {
    func onTooltipInfo(_ dictionary: [String: AnyObject]) -> String {
        // NSLog("onSubmit \(dictionary)")
        return "TEST"
    }

    func getErrorMessages(codes: [JSInt]) -> [String] {
        return codes.map { "message\($0)" }
    }
}

class SeatsioWebView : WKWebView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    var seatsioConfig: SeatsioConfig!
    var events: Array<String> = []

    init(frame: CGRect, configuration: WKWebViewConfiguration, seatsioConfig: SeatsioConfig!) {
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

        var configAsJs = seatsioConfig.convertToString!
        configAsJs.removeLast(2)

        htmlString = htmlString.replacingOccurrences(of: "%configAsJs%", with: configAsJs)
        htmlString = htmlString.replacingOccurrences(of: "%events%", with: events.joined(separator: ","))

        print(htmlString)

        self.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
    }

    func setEvent(eventName: String) {
        self.events.append("""
            \(eventName): function(...args) {
                webkit.messageHandlers.seatsioEvents.postMessage(JSON.stringify({
                      method: '\(eventName)',
                      payload: args
                }));
            }
        """)
    }
}
