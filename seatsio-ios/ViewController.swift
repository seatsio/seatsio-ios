//
//  ViewController.swift
//  seatsio-ios
//
//  Created by Ben Verbeken on 05/06/2019.
//  Copyright © 2019 Ben Verbeken. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {

    var seatsio: SeatsioWebView!

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "onObjectSelected" {
            print(message.body)
        }
    }
    
    override func loadView() {
        let contentController = WKUserContentController();
        contentController.add(self, name: "onObjectSelected")
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, configuration: config)
        seatsio.navigationDelegate = self
        seatsio.setOnObjectSelected()
        self.view = seatsio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatsio.load([
            "publicKey": "53b1ee0f-6611-4826-95a9-197be43a55e7",
            "event": "e1",
            "holdOnSelect": true
        ])
    }
}

