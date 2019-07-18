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
        if message.name == "seatsioEvents" {
            print(message.body)
        }
    }
    
    override func loadView() {
        let contentController = WKUserContentController();
        contentController.add(self, name: "seatsioEvents")
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        let seatsioConfig = [
            "publicKey": "publicDemoKey",
            "event": "smallTheatreEvent",
            "language": "es"
        ]

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, configuration: config, seatsioConfig: seatsioConfig)
        seatsio.navigationDelegate = self
        seatsio.setOnObjectSelected { dictionary in print("IT WORKS \(dictionary)") }
        // seatsio.setOnToolipInfo { dictionary in return "TOOLTIP_INFO" }

        self.view = seatsio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatsio.loadSeatingChart()
    }
}

