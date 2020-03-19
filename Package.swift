// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIPolygon",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftUIPolygon",
            targets: [
                "SwiftUIPolygon",
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/guillermomuntaner/Burritos", .exact("0.0.3")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftUIPolygon",
            dependencies: [
                "Burritos",
            ],
            path: "Sources/"
        ),
        .testTarget(
            name: "SwiftUIPolygon.PolygonTests",
            dependencies: [
                "SwiftUIPolygon",
            ],
            path: "Tests/PolygonTests/"
        ),
    ]
)
