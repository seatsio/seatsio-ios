//
//  SeatsioWebView.swift
//  seatsio-ios
//
//  Created by Nahuel Chaves on 05/06/2019.
//  Copyright © 2019 Ben Verbeken. All rights reserved.
//

import Foundation
import WebKit


class SeatsioWebView : WKWebView {
    var events: Array<String> = []
    
    func loadSeatingChart(_ config: [String : Any]) {

        self.loadHTMLString(self.generateHtml(config: config), baseURL: nil)
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
    
    
    private func generateHtml(config: [String: Any]) -> String {
        let htmlFile = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "/")
        var html = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)

        let configAsJs = (config.compactMap({ (key, value) -> String in
            return "\(key):'\(value)'"
        }) as Array).joined(separator: ",")

        html = html?.replacingOccurrences(of: "%configAsJs%", with: configAsJs)
        html = html?.replacingOccurrences(of: "%events%", with: events.joined(separator: ","))

        print(html!)
        return html!
    }
}
