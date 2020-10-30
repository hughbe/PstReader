// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PstReader",
    products: [
        .library(
            name: "PstReader",
            targets: ["PstReader"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hughbe/DataStream", from: "1.1.1"),
        .package(url: "https://github.com/hughbe/WindowsDataTypes", from: "1.0.0"),
        .package(name: "MAPI", url: "https://github.com/hughbe/SwiftMAPI", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "PstReader",
            dependencies: ["DataStream", "MAPI", "WindowsDataTypes"]),
        .testTarget(
            name: "PstReaderTests",
            dependencies: ["PstReader"]),
    ]
)
