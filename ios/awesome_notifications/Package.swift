// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "awesome_notifications",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "awesome-notifications", targets: ["awesome_notifications"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        // IosAwnCore is a standalone (non-Flutter) Swift package referenced by its released
        // tag — Flutter symlinks plugins into ephemeral/Packages/.packages, which breaks
        // relative paths to non-plugin packages, so it must be a URL+tag (not a local path).
        // Fork pinned to the commit that keeps every notification category registered,
        // until a release of IosAwnCore ships it.
        .package(url: "https://github.com/GabrielDamasceno/IosAwnCore.git", revision: "448a675bfe19223f455e1ffad43acc31f321bfcb"),
    ],
    targets: [
        .target(
            name: "awesome_notifications",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "IosAwnCore", package: "IosAwnCore"),
            ]
        )
    ]
)
