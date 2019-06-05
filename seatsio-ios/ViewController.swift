//
//  ViewController.swift
//  seatsio-ios
//
//  Created by Ben Verbeken on 05/06/2019.
//  Copyright © 2019 Ben Verbeken. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController,WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let html = generateHtml()
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    func generateHtml() -> String {
        return """
        <html>
        <body>
        <div id="chart"></div>
        <script src="https://cdn.seatsio.net/chart.js"></script>
        <script>
        new seatsio.SeatingChart({
        divId: 'chart',
        publicKey: '53b1ee0f-6611-4826-95a9-197be43a55e7',
        event: 'e1'
        }).render();
        </script>
        </body>
        </html>
        """
    }


}

