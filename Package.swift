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
        .package(url: "https://github.com/stephencelis/SQLite.swift", .upToNextMajor(from: "0.14.1")),
        .package(url: "https://github.com/fingerprintjs/fingerprintjs-ios", .upToNextMajor(from: "1.3.0")),
      	.package(url: "https://github.com/microsoft/plcrashreporter", .upToNextMajor(from: "1.11.0")),
	.package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMajor(from: "1.22.1")),
    ],
    targets: [
        .binaryTarget(
            name: "MTSAnalytics",
            url: "https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/releases/download/1.1.1/MTSAnalytics-1.1.1.zip",
            checksum: "c78c35ea496396b976518840df5bad2c62f8632a91aad9bc6bf0fb6d272af03e"
         )
    ]
)