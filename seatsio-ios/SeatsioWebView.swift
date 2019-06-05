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
    
    func load(publicKey: String, event: String) {
        self.loadHTMLString(self.generateHtml(publicKey: publicKey, event: event), baseURL: nil)
    }
    
    func generateHtml(publicKey: String, event: String) -> String {
        return """
        <html>
        <body>
        <div id="chart"></div>
        <script src="https://cdn.seatsio.net/chart.js"></script>
        <script>
        new seatsio.SeatingChart({
        divId: 'chart',
        publicKey: '\(publicKey)',
        event: '\(event)',
        }).render();
        </script>
        </body>
        </html>
        """
    }
}
