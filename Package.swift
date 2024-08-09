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
            url: "https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/releases/download/2.5.2/MTSAnalytics-2.5.2.zip",
            checksum: "deef58c96f3d0d738a364237fd06ad9ab7cf3bea775a74d2186fb01ca38faeba"
         )
    ]
)
