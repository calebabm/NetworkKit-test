// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetKitLocal",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "NetKitLocal",
            targets: ["NetKitLocal"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NetKitLocal",
            dependencies: []),
        .testTarget(
            name: "NetKitLocalTests",
            dependencies: ["NetKitLocal"]),
    ]
)
