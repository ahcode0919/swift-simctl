// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-simtl",
    platforms: [.macOS(.v10_13)],
    products: [
        .library(
            name: "SwiftSimctl",
            targets: ["SwiftSimctl"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ahcode0919/swift-shell", from: "0.0.3"),
        .package(url: "https://github.com/ahcode0919/Fast", from: "0.0.4"),
    ],
    targets: [
        .target(
            name: "SwiftSimctl",
            dependencies: [
                .product(name: "Fast", package: "Fast"),
                .product(name: "SwiftShell", package: "swift-shell")
            ]),
        .testTarget(
            name: "SwiftSimctlTests",
            dependencies: ["SwiftSimctl"]),
    ]
)
