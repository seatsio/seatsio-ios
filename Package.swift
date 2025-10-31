// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "seatsio-ios",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "Seatsio",
            targets: ["Seatsio"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.2"),
    ],
    targets: [
        .target(
            name: "Seatsio",
            dependencies: [
                .product(name: "SwiftyJSON", package: "SwiftyJSON")
            ],
            path: "Seatsio/Sources"
        ),
        .testTarget(
            name: "SeatsioTests",
            dependencies: ["Seatsio"],
            path: "Seatsio/Tests"
        )
    ]
    
)
