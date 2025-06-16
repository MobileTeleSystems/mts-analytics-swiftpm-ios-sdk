// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MTAnalytics",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
         .library(name: "MTAnalytics", targets: ["MTAnalytics"])
    ],
    dependencies: [
      	.package(url: "https://github.com/microsoft/plcrashreporter.git", .upToNextMajor(from: "1.11.0")),
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMajor(from: "1.27.1"))
    ],
    targets: [
        .binaryTarget(
            name: "MTAnalytics",
            url: "https://packages.a.mts.ru/repository/apple-sdk/ios-sdk/build/MTAnalytics-5.1.4.zip",
            checksum: "ea63db55b38f25caa5ab6dec71566a3739e783ab42d7b19fbc0c83b40f67a755"
         )
    ]
)
