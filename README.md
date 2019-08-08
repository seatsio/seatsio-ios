# Seatsio iOS Component

## Introduction

seatsio-ios allows rendering seats.io seating charts inside an iOS application. It supports iOS 8.0 and newer.

## Installation

Add this to your podfile:

```
pod 'seatsio', '~> 1.0.0'
```

## Usage

```swift
class SeatingChartSample: UIViewController {

    var seatsio: SeatsioWebView!

    override func loadView() {
        let config: SeatingChartConfig = SeatingChartConfig()
                .publicKey("publicDemoKey")
                .event("smallTheatreWithGAEvent")

        seatsio = SeatsioWebView(frame: UIScreen.main.bounds, seatsioConfig: config)

        self.view = seatsio
    }

}
```
