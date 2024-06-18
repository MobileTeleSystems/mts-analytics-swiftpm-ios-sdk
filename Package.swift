// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MTSAnalytics",
    platforms: [
        .iOS(.v13)
    ],
    products: [
         .library(name: "MTSAnalytics", targets: ["MTSAnalytics"])
    ],
    dependencies: [
      	.package(url: "https://github.com/microsoft/plcrashreporter.git", .upToNextMajor(from: "1.11.0")),
	.package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMajor(from: "1.22.1"))
    ],
    targets: [
        .binaryTarget(
            name: "MTSAnalytics",
            url: "https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/releases/download/2.1.0/MTSAnalytics-2.1.0.zip",
            checksum: "7a5275d775d0ebf5419429e117cd07d1c5ff608385887a75eb0cc14d41092de2"
         )
    ]
)