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
            url: "https://packages.a.mts.ru/repository/apple-sdk/ios-sdk/build/MTMetrics-3.0.0.zip",
            checksum: "39ee9c261b856f0982a7a893ddf671b46aacff1814b07f87572196b568c62e6a"
         )
    ]
)
