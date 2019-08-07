import UIKit
import WebKit

class HomeViewController: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config = SeatingChartConfig()
                .publicKey("publicDemoKey")
                .events(["largeTheatreEvent"])
                .pricing([
                    Pricing(category: "1", ticketTypes: [
                        TicketTypePricing(ticketType: "adult", price: 50, label: "For adults"),
                        TicketTypePricing(ticketType: "child", price: 40.50, label: "For children")
                    ])
                ])
                .priceFormatter({ (price) in "\(price)$" })
                .showMinimap(true)
                .showActiveSectionTooltip(false)
                .selectionValidators([SelectionValidator.consecutiveSeats(), SelectionValidator.noOrphanSeats(highlight: true)])
                .onSelectionValid({ () in print("ok")})
                .onSelectionInvalid({ () in print("not ok")})

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: config)

        self.view = seatsio
    }

}

