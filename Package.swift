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
            url: "https://packages.a.mts.ru/repository/apple-sdk/ios-sdk/build/MTMetrics-4.0.0.zip",
            checksum: "cc9b704ba9df0543cec10b3d761ee64911e94ee22bc810c668d2979d709642f2"
         )
    ]
)
