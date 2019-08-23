# Seatsio iOS Component

[![Build Status](https://travis-ci.org/seatsio/seatsio-ios.svg?branch=master)](https://travis-ci.org/seatsio/seatsio-ios)

## Introduction

seatsio-ios allows rendering seats.io seating charts inside an iOS application. It supports iOS 8.0 and newer.

## Installation

Add this to your podfile:

```
pod 'seatsio', '7.0.0'
```

## Usage

```swift
import UIKit
import seatsio

class SeatingChartSample: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config: SeatingChartConfig = SeatingChartConfig()
                .publicKey("<your public key>")
                .event("<your event key>")

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: config)

        self.view = seatsio
    }

}
```

You can find the all the configuration options at https://docs.seats.io/docs/renderer-configure-your-floor-plan

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
