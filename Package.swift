// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyProject",
    platforms: [.macOS(.v12), .iOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/sddeno/SwiftLiveOrderedMap.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "MyProject",
            dependencies: [
                .product(name: "SwiftLiveOrderedMap", package: "SwiftLiveOrderedMap")
            ]
        )
    ]
)
