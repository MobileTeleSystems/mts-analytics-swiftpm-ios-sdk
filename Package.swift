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
            url: "https://packages.a.mts.ru/repository/apple-sdk/ios-sdk/build/MTMetrics-3.1.0.zip",
            checksum: "d106b9e801aad9f7cc0236a7f422c85fc258beb0030f1438d8fd6e988739bbe5"
         )
    ]
)
