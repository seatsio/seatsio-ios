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
        var seatsioConfig = SeatsioConfig(
                publicKey: "50652883-7b37-4310-9ea9-acfe954e30bf",
                event: "e2cbe498-b27a-4888-ac1d-6b40d29ec9ff"
        );

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, configuration: config, seatsioConfig: seatsioConfig)
        seatsio.navigationDelegate = self
        // seatsio.setEvent(eventName: "onObjectSelected")
        // seatsio.setEvent(eventName: "onObjectDeselected")

        self.view = seatsio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatsio.loadSeatingChart()
    }
}

