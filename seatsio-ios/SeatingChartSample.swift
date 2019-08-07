import UIKit
import WebKit

class HomeViewController: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config = SeatingChartConfig()
                .publicKey("publicDemoKey")
                .event("smallTheatreEvent1")
                .pricing([
                    Pricing(category: "1", ticketTypes: [
                        TicketTypePricing(ticketType: "adult", price: 50, label: "For adults"),
                        TicketTypePricing(ticketType: "child", price: 40.50, label: "For children")
                    ])
                ])
                .priceFormatter({ (price) in "\(price)$" })
                .showLegend(true)
                .selectionValidators([SelectionValidator.noOrphanSeats(), SelectionValidator.consecutiveSeats()])
                .onSelectionInvalid({ (errors) in print(errors) })
                .onObjectSelected({ (object, ticketType) in
                    print(object)
                    print(ticketType)
                })
                .onObjectDeselected({ (object, ticketType) in
                    print(object)
                    print(ticketType)
                })

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: config)

        self.view = seatsio
    }

}

