// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "seatsio-ios",
                      defaultLocalization: "en",
                      products: [
                        .library(name: "seatsio-ios",
                                 targets: ["seatsio-ios"])
                      ],
                      targets: [
                        .target(name: "seatsio-ios",
                                path: "seatsio-ios")
                      ]
)
