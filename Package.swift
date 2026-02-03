// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ElegaiterSDK",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ElegaiterSDK",
            targets: ["ElegaiterSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "ElegaiterSDK",
            url: "https://github.com/kibeom-key/ElegaiterSDK/releases/download/1.0.0/ElegaiterSDK.xcframework_v1.0.0.zip",
            checksum: "sha256:312d92bedc979dd8878983179772cce0ab5b18c358112c4b87fe3773540bc745"
        ),
    ]
)
