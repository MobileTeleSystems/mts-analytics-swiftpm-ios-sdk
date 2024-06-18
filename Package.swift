// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MTSAnalytics",
    platforms: [
        .iOS(.v12)
    ],
    
    products: [
            .library(name: "MTSAnalytics", targets: ["MTSAnalytics"])
        ],
    
    targets: [
            .binaryTarget(
                name: "MTSAnalytics",
                url: "https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/releases/download/1.1.0/MTSAnalytics-1.1.0.zip",
                checksum: "6af055112ff90a9c7a3d351d372b0e68fe3843340d2d0315f79db17c8b893345"
            )
        ]
)
