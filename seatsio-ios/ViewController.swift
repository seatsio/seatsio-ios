import UIKit
import WebKit

class HomeViewController: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let seatsioConfig = [
            "publicKey": "publicDemoKey",
            "event": "smallTheatreEvent99",
            "tooltipInfo": { (object: SeatsioObject) -> String in
                "[b]This[/b] object's [i]id[/i] is [pre]" + object.label + "[/pre]"
            },
            "onChartRendered": {
                print("Chart rendered")
            },
            "onObjectSelected": { (object: SeatsioObject) -> Void in
                print("Object " + object.label + " selected")
            }
        ] as [String: Any]

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: seatsioConfig)

        self.view = seatsio
    }

}

