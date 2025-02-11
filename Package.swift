// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MTMetrics",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
         .library(name: "MTMetrics", targets: ["MTMetrics"])
    ],
    dependencies: [
      	.package(url: "https://github.com/microsoft/plcrashreporter.git", .upToNextMajor(from: "1.11.0")),
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMajor(from: "1.27.1"))
    ],
    targets: [
        .binaryTarget(
            name: "MTMetrics",
            url: "https://packages.a.mts.ru/repository/apple-sdk/ios-sdk/build/MTMetrics-4.1.0.zip",
            checksum: "bb211a2f9d0fb6db39807304638949389e16955304065d5fb9ef1e8c640e26af"
         )
    ]
)
