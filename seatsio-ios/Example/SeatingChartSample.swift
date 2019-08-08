import UIKit
import WebKit

class SeatingChartSample: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config: SeatingChartConfig = SeatingChartConfig()
                .publicKey("publicDemoKey")
                .event("smallTheatreWithGAEvent")
                .pricing([
                    Pricing(category: "2", price: 40)
                ])
                .priceFormatter({ (price) in "\(price)$" })
                .objectTooltip(ObjectTooltip().showAvailability(true))
                .showLegend(true)
                .onSelectionInvalid({ (errors) in print(errors) })
                .onObjectSelected({ (object, ticketType) in
                    print(object)
                    print(ticketType as Any)
                })
                .onObjectDeselected({ (object, ticketType) in
                    print(object)
                    print(ticketType as Any)
                })
                .selectedObjects([SelectedObject("A-1")])
                .onChartRendered({ (chart) in
                    print("rendered")
                })

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: config)

        self.view = seatsio
    }

}

