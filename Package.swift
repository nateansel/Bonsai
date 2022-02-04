// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Bonsai",
    platforms: [
        .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        .library(
            name: "Bonsai",
            targets: ["Bonsai"]),
    ],
    targets: [
        .target(
            name: "Bonsai",
            dependencies: []),
        .testTarget(
            name: "BonsaiTests",
            dependencies: ["Bonsai"]),
    ]
)
