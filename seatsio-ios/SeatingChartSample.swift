import UIKit
import WebKit

class HomeViewController: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config = SeatingChartConfig()
                .publicKey("publicDemoKey")
                .event("smallTheatreWithGAEvent")
                .pricing([
                    Pricing(category: 2, price: 40)
                ])
                .objectTooltip(ObjectTooltip().showAvailability(true))
                .priceFormatter({ (price) in "\(price)$" })
                .showLegend(true)
                .onSelectionInvalid({ (errors) in print(errors) })
                .onObjectSelected({ (object, ticketType) in
                    print(object)
                    print(ticketType)
                })
                .onObjectDeselected({ (object, ticketType) in
                    print(object)
                    print(ticketType)
                })
                .selectedObjects([SelectedObject("A-1")])
                .onChartRendered({ (chart) in
                    print("rendered")
                })

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: config)

        self.view = seatsio
    }

}

