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
            checksum: "0d850916b6c4ed16b2d86cf232115d1f3fcc6bd616ddc4d959377cd6d629239e"
         )
    ]
)
