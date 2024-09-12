// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MTAnalytics",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
         .library(name: "MTAnalytics", targets: ["MTAnalytics"])
    ],
    dependencies: [
      	.package(url: "https://github.com/microsoft/plcrashreporter.git", .upToNextMajor(from: "1.11.0")),
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMajor(from: "1.27.1"))
    ],
    targets: [
        .binaryTarget(
            name: "MTAnalytics",
            url: "https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/releases/download/3.0.0/MTMetrics-3.0.0.zip",
            checksum: "f8b7e7461d16aefc91c141287c7db11ab97a1753ba18934457d214345610fbdc"
         )
    ]
)
