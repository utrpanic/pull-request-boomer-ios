// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BoomerLib",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "BoomerLib", targets: ["BoomerLib"]),
        .library(name: "CommonLib", targets: ["CommonLib"]),
        .library(name: "LoginRibs", targets: ["LoginRibs"]),
        .library(name: "BoomerTestHelperLib", targets: ["BoomerTestHelperLib"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Apollo", url: "https://github.com/apollographql/apollo-ios.git", .upToNextMajor(from: "0.0.0")),
        .package(name: "BoxKit", url: "https://github.com/utrpanic/box-kit-ios.git", from: "2.0.0"),
        .package(name: "ModernRIBs", url: "https://github.com/nsoojin/ModernRIBs.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BoomerLib",
            dependencies: [
                .product(name: "BoxKit", package: "BoxKit"),
                .product(name: "Apollo", package: "Apollo"),
            ]
        ),
        .target(
            name: "BoomerTestHelperLib",
            dependencies: [
                "BoomerLib", "CommonLib"
            ]
        ),
        .target(
            name: "CommonLib",
            dependencies: [
                .product(name: "ModernRIBs", package: "ModernRIBs")
            ]
        ),
        .target(
            name: "LoginRibs",
            dependencies: [
                "BoomerLib", "CommonLib"
            ]
        ),
        .testTarget(
            name: "BoomerLibTests",
            dependencies: [
                "BoomerLib", "CommonLib"
            ]
        ),
        .testTarget(
            name: "LoginRibsTests",
            dependencies: [
                "BoomerTestHelperLib", "LoginRibs"
            ]
        ),
    ]
)
