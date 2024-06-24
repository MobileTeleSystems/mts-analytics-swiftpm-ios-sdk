// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MTSAnalytics",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
         .library(name: "MTSAnalytics", targets: ["MTSAnalytics"])
    ],
    dependencies: [
      	.package(url: "https://github.com/microsoft/plcrashreporter.git", .upToNextMajor(from: "1.11.0")),
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMinor(from: "1.26.0"))
    ],
    targets: [
        .binaryTarget(
            name: "MTSAnalytics",
            url: "https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/releases/download/2.4.0/MTSAnalytics-2.4.0.zip",
            checksum: "702f32487fffcf9796ec21a2795df238bef5110b5e01d80b0b84af6984849092"
         )
    ]
)
