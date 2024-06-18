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
    dependencies: [
        .package(url: "https://github.com/stephencelis/SQLite.swift.git", .upToNextMajor(from: "0.14.1")),
        .package(url: "https://github.com/fingerprintjs/fingerprintjs-ios.git", .upToNextMajor(from: "1.3.0")),
      	.package(url: "https://github.com/microsoft/plcrashreporter.git", .upToNextMajor(from: "1.11.0")),
	.package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMajor(from: "1.22.1"))
    ],
    targets: [
        .binaryTarget(
            name: "MTSAnalytics",
            url: "https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/releases/download/1.2.1/MTSAnalytics-1.2.1.zip",
            checksum: "2d495460664692026df19ce11a148fed454df6460a1222ad4384ed0c0498f8c4"
         )
    ]
)