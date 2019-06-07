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
                webkit.messageHandlers.onObjectSelected.postMessage(JSON.stringify({object: obj,selectedTicketType: selectedTicketType}));
            }
        """
    }
    
    
    private func generateHtml(config: [String: Any]) -> String {
        let configAsJs = (config.compactMap({ (key, value) -> String in
            return "\(key):'\(value)'"
        }) as Array).joined(separator: ",")
        let result = """
        <html>
        <body>
        <div id="chart" style="width: 100%; height: 100%"></div>
        <script src="https://cdn.seatsio.net/chart.js"></script>
        <script>
        new seatsio.SeatingChart({
        divId: 'chart',
        \(configAsJs),
        \(events ?? "")
        }).render();
        </script>
        </body>
        </html>
        """
        
        print(result)
        return result
    }
}
