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
    var events: String!
    
    func load(_ config: [String : Any]) {

        self.loadHTMLString(self.generateHtml(config: config), baseURL: nil)
    }
    
    func setOnObjectSelected() {
        self.events = """
            onObjectSelected: function(obj, selectedTicketType) {
                webkit.messageHandlers.seatsioEvents.postMessage(JSON.stringify({
                      method: 'onObjectSelected',
                      payload: {
                          object: obj,
                          selectedTicketType: selectedTicketType
                      }
                }));
            }
        """
    }
    
    
    private func generateHtml(config: [String: Any]) -> String {
        let htmlFile = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "/")
        var html = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)

        let configAsJs = (config.compactMap({ (key, value) -> String in
            return "\(key):'\(value)'"
        }) as Array).joined(separator: ",")

        html = html?.replacingOccurrences(of: "%configAsJs%", with: configAsJs)
        html = html?.replacingOccurrences(of: "%events%", with: events)

        print(html!)
        return html!
    }
}
