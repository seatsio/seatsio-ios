# Seatsio iOS SDK

[![Build Status](https://travis-ci.org/seatsio/seatsio-ios.svg?branch=master)](https://travis-ci.org/seatsio/seatsio-ios)

## Introduction

seatsio-ios allows rendering seats.io seating charts inside an iOS application. It supports iOS 12.0 and newer.

## Installation

Add this to your podfile:

```
pod 'seatsio', '19.2.0'
```

Or if you prefer Swift Package Manager:

```
dependencies: [
    .package(url: "https://github.com/seatsio/seatsio-ios", from: "19.2.0")
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
    .pricing([
        Pricing(category: "1", price: 40),
        Pricing(category: "2", price: 50)
    ])
    .priceFormatter({ (price) in "\(price)$" })
```

### Multi-level pricing

```swift
SeatingChartConfig()
    .pricing([
        Pricing(category: "1", ticketTypes: [
            TicketTypePricing(ticketType: "child", price: 10),
            TicketTypePricing(ticketType: "adult", price: 15)]),
        Pricing(category: "2", ticketTypes: [
            TicketTypePricing(ticketType: "child", price: 20),
            TicketTypePricing(ticketType: "adult", price: 30)])
    ])
    .priceFormatter({ (price) in "\(price)$" })
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
