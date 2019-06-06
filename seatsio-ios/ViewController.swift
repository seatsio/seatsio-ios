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

    var seatsioWebView: SeatsioWebView!
    
    override func loadView() {
        seatsioWebView = SeatsioWebView(frame: .zero, configuration: WKWebViewConfiguration())
        seatsioWebView.navigationDelegate = self
        view = seatsioWebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatsioWebView.load(
            publicKey: "53b1ee0f-6611-4826-95a9-197be43a55e7",
            event: "e1"
        )
    }
}

