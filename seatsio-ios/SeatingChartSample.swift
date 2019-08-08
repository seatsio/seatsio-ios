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
                .filteredCategories([])
                .selectedObjects([SelectedObject("General Admission", amount:  3)])
                .objectTooltip(ObjectTooltip().showAvailability(true))
                .priceFormatter({ (price) in "\(price)$" })
                .showLegend(true)
                .categoryFilter(CategoryFilter().enabled(true).zoomOnSelect(true))
                .style(Style().font("WorkSans").fontWeight("minMax").borderRadius("max").border("3d").padding("spacious").buttonFace("fillEnabled"))
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
                .onChartRendered({ (chart) in
                    chart.changeConfig(ConfigChange().extraConfig(["foo": "bar"]))
                })
                .onChartRenderingFailed({ () in
                    print("fl")
                })

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: config)

        self.view = seatsio
    }

}

