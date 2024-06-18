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
            url: "https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/releases/download/1.1.4/MTSAnalytics-1.1.4.zip",
            checksum: "ca54684a63fb17cf7c8d6da7d23a7dd488344c704aadca4c65e912a062726734"
         )
    ]
)