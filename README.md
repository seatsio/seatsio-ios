# Seatsio iOS SDK

[![Build Status](https://travis-ci.org/seatsio/seatsio-ios.svg?branch=master)](https://travis-ci.org/seatsio/seatsio-ios)

## Introduction

seatsio-ios allows rendering seats.io seating charts inside an iOS application. It supports iOS 12.0 and newer.

## Installation

Add this to your podfile:

```
pod 'seatsio', '19.4.0'
```

Or if you prefer Swift Package Manager:

```
dependencies: [
    .package(url: "https://github.com/seatsio/seatsio-ios", from: "19.4.0")
]
```

## Usage

```swift
class SeatingChartSample: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config: SeatingChartConfig = SeatingChartConfig()
                .workspaceKey("<your public workspace key>")
                .event("<your event key>")

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, region: "eu", seatsioConfig: config)

        self.view = seatsio
    }

    override func viewDidDisappear(_ animated: Bool) {
        seatsio.cleanup()
        seatsio = nil
    }
}
```

You can find the all the configuration options at https://docs.seats.io/docs/renderer/embed-a-floor-plan

### Simple pricing

```swift
SeatingChartConfig()
    .pricing(Pricing(
        prices: [
            Price.priceForCategory(CategoryPricing(category: 13, price: 15)),
            Price.priceForCategory(CategoryPricing(category: 15, price: 10))
        ],
        priceFormatter: { price in "\(price)$" }
    ))
```

### Complex pricing

```swift
SeatingChartConfig()
    .pricing(Pricing(
        prices: [
            Price.priceForCategory(CategoryPricing(category: 13, price: 10, originalPrice: 15.5)),
            Price.priceForCategory(CategoryPricing(category: 10, ticketTypes: [
                TicketTypePricing(ticketType: "Adult", price: 20, originalPrice: 25, fee: 3),
                TicketTypePricing(ticketType: "Child", price: 15, originalPrice: 20, fee: 2.5),
            ])),
            Price.priceForObjects(ObjectPricing(objects: [
                "VIP SEATS-A-1",
                "VIP SEATS-A-2",
                "VIP SEATS-A-3"], price: 10, originalPrice: 21.5, fee: 3)),
            Price.priceForCategory(CategoryPricing(category: 1, price: 30, channels: [
                        ChannelPricing(channel: "b75c212e-0910-44b4-bb0a-98376e49c5b1", price: 10),
                        ChannelPricing(channel: "a2f732a9-c5d4-44f6-92a1-6f7e9b9c6147", ticketTypes: [
                            TicketTypePricing(ticketType: "Adult", price: 20, description: "16 and older", originalPrice: 22, fee: 3),
                            TicketTypePricing(ticketType: "Child", price: 15, originalPrice: 20, fee: 2.5),
                        ])
                    ]))
        ],
        allFeesIncluded: false,
        priceFormatter: { price in "\(price)$" }
    ))
```

### Creating a session to hold seats

```swift
var seatingChart: SeatingChart!

let config: SeatingChartConfig = SeatingChartConfig()
        .workspaceKey("<your public workspace key>")
        .event("<your event key>")
        .session("start")
        .onChartRendered({ (chart) in
            seatingChart = chart
        })

// after webview has rendered
seatingChart.getHoldtoken({ (token) in
    // do something with the token
})
```

### onObjectSelected / onObjectDeselected

```swift
SeatingChartConfig()
    .onObjectSelected({ (object, ticketType) in
        print(object, ticketType)
    })
    .onObjectDeselected({ (object, ticketType) in
        print(object, ticketType)
    })
```

### extraData

`extraData` on objects is exposed as a `JSON` object from [`SwiftyJSON`](https://github.com/SwiftyJSON/SwiftyJSON):

```swift
SeatingChartConfig()
    .onObjectSelected({ (object, ticketType) in
        print(object.extraData!["foo"])
    })
```

### chart.listSelectedObjects

```swift
var seatingChart: SeatingChart!

let config: SeatingChartConfig = SeatingChartConfig()
    .workspaceKey("<your public workspace key>")
    .event("<your event key>")
    .onChartRendered({ (chart) in
        seatingChart = chart
    })

// after webview has rendered
seatingChart.listSelectedObjects({ (objects) in
    // do something with the objects
})
```

### chart.getReportBySelectability

```swift
var seatingChart: SeatingChart!

let config: SeatingChartConfig = SeatingChartConfig()
    .workspaceKey("<your public workspace key>")
    .event("<your event key>")
    .onChartRendered({ (chart) in
        seatingChart = chart
    })

// after webview has rendered
seatingChart.getReportBySelectability({ (report) in
    // do something with the report
})
```

### chart.zoomToSection

```swift
var seatingChart: SeatingChart!

let config: SeatingChartConfig = SeatingChartConfig()
    .workspaceKey("<your public workspace key>")
    .event("<your event key>")
    .onChartRendered({ (chart) in
        seatingChart = chart
    })

// after webview has rendered
seatingChart.zoomToSection(label: "<sectionLabel>")
```

### Methods on seats (and other selectable objects)

```swift
var seatingChart: SeatingChart!

let config: SeatingChartConfig = SeatingChartConfig()
    .workspaceKey("<your public workspace key>")
    .event("<your event key>")
    .onChartRendered({ (chart) in
        chart.selectObject("K-3") // or chart.deselectObject("K-3")
        chart.pulseObject("K-3") // or chart.unpulseObject("K-3")
        chart.isObjectInChannel("K-3", "NO_CHANNEL", { (result) in print("Is object in channel NO_CHANNEL? " + String(result)) })
    })
```
