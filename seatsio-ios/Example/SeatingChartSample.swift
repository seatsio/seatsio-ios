import UIKit
import WebKit

class SeatingChartSample: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config: SeatingChartConfig = SeatingChartConfig()
                .publicKey("publicDemoKey")
                .event("smallTheatreWithGAEvent")
                .pricing([
                    Pricing(category: "1", ticketTypes: [
                        TicketTypePricing(ticketType: "child", price: 10),
                        TicketTypePricing(ticketType: "adult", price: 15)]),
                    Pricing(category: "2", ticketTypes: [
                        TicketTypePricing(ticketType: "child", price: 20),
                        TicketTypePricing(ticketType: "adult", price: 30)])
                ])
                .priceFormatter({ (price) in "\(price)$" })
                .objectTooltip(ObjectTooltip().showAvailability(true))
                .showLegend(true)
                .onSelectionInvalid({ (errors) in print(errors) })
                .onObjectSelected({ (object, ticketType) in
                    print(object, ticketType)
                })
                .onObjectDeselected({ (object, ticketType) in
                    print(object, ticketType)
                })
                .selectedObjects([SelectedObject("A-1")])
                .onChartRendered({ (chart) in
                    print("rendered")
                    chart.changeConfig(ConfigChange().unavailableCategories(["Balcony"]))
                    chart.findObject("K-3",
                            { (object) in
                                object.isInChannel("NO_CHANNEL", { (res) in print(res) })
                                object.select("child")
                            },
                            { () in print("NOT FOUND") })
                })

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, region: "eu", seatsioConfig: config)

        self.view = seatsio
    }

}

