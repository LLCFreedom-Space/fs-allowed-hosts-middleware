// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "fs-allowed-hosts-middleware",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AllowedHostsMiddleware",
            targets: ["AllowedHostsMiddleware"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        //
        .package(url: "https://github.com/LLCFreedom-Space/fs-error-middleware.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AllowedHostsMiddleware", dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "FSErrorMiddleware", package: "fs-error-middleware"),
            ]
        ),
        .testTarget(
            name: "AllowedHostsMiddlewareTests",
            dependencies: ["AllowedHostsMiddleware"]),
    ]
)
