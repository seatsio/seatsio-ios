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
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func load(_ config: [String : Any]) {
        self.loadHTMLString(self.generateHtml(config: config), baseURL: nil)
    }
    
    private func generateHtml(config: [String: Any]) -> String {
        let configAsJs = (config.compactMap({ (key, value) -> String in
            return "\(key):'\(value)'"
        }) as Array).joined(separator: ",")
        let result = """
        <html>
        <body>
        <div id="chart"></div>
        <script src="https://cdn.seatsio.net/chart.js"></script>
        <script>
        new seatsio.SeatingChart({
        divId: 'chart',
        \(configAsJs)
        }).render();
        </script>
        </body>
        </html>
        """
        
        print(result)
        return result
    }
}
