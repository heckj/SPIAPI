// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SPIAPI",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "SPIAPI",
            targets: ["SPIAPI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/apple/swift-openapi-runtime", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", .upToNextMinor(from: "0.3.0")),
    ],
    targets: [
        .target(
            name: "SPIAPI",
            dependencies: [
                .product(
                    name: "OpenAPIRuntime",
                    package: "swift-openapi-runtime"
                ),
                .product(
                    name: "OpenAPIURLSession",
                    package: "swift-openapi-urlsession"
                ),
            ],
            path: "Sources/SPIAPI",
            exclude: [
                "production.openapi.json",
                "staging.openapi.json",
            ]
//                "openapi.json",
//                "openapi-generator-config.yaml"
            // -
//            plugins: [
//                .plugin(
//                    name: "OpenAPIGenerator",
//                    package: "swift-openapi-generator"
//                ),
//            ]
        ),
        .testTarget(
            name: "SPIAPITests",
            dependencies: ["SPIAPI"]
        ),
    ]
)
