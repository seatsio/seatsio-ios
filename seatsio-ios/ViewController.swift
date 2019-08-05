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

        let config = SeatingChartConfig(
                publicKey: "publicDemoKey",
                events: ["smallTheatreEvent1", "smallTheatreEvent2"],
                pricing: [
                    Pricing(category: "1", ticketTypes: [
                        TicketTypePricing(ticketType: "adult", price: 50, label: "For adults"),
                        TicketTypePricing(ticketType: "child", price: 40.50, label: "For children")
                    ])
                ],
                priceFormatter: { (price: Float) in "\(price)$" }
        )
        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: config)

        self.view = seatsio
    }

}

