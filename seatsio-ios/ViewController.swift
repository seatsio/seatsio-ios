//
//  ViewController.swift
//  seatsio-ios
//
//  Created by Ben Verbeken on 05/06/2019.
//  Copyright © 2019 Ben Verbeken. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController, WKNavigationDelegate {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config = WKWebViewConfiguration()
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")

        let seatsioConfig = [
            "publicKey": "publicDemoKey",
            "event": "smallTheatreEvent99"
        ]

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, configuration: config, seatsioConfig: seatsioConfig)
        seatsio.navigationDelegate = self

        seatsio.setOnObjectSelected { dictionary in print("setOnObjectSelected called") }
        seatsio.setOnChartRendered { chart in print("Chart Rendered") }
        seatsio.setOnToolipInfo { object in
            return "[b]This[/b] object's [i]id[/i] is [pre]" + object.label! + "[/pre]"
        }

        self.view = seatsio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatsio.loadSeatingChart()
    }
}

