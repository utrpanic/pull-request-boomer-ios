// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BoomerLib",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ModelLib",
            targets: ["ModelLib"]),
        .library(
            name: "InterfaceLib",
            targets: ["InterfaceLib"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "BoxKit", url: "https://github.com/utrpanic/box-kit-ios.git", from: "2.0.0"),
        .package(name: "ModernRIBs", url: "https://github.com/DevYeom/ModernRIBs.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ModelLib",
            dependencies: [
                "InterfaceLib",
                .product(name: "BoxKit", package: "BoxKit"),
            ],
            path: "Sources/ModelLib"),
        .target(
            name: "InterfaceLib",
            dependencies: [
                .product(name: "ModernRIBs", package: "ModernRIBs")
            ],
            path: "Sources/InterfaceLib"),
        .testTarget(
            name: "BoomerLibTests",
            dependencies: ["InterfaceLib", "ModelLib"]),
    ]
)
