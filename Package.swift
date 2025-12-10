// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "WebRTC-AudioDelegate",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "WebRTC",
            targets: ["WebRTC"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "WebRTC",
            url: "https://github.com/swetakadam/WebRTC-AudioDelegate/releases/download/1.0.0/WebRTC.xcframework.zip",
            checksum: "fb684aa56ae27702fe2c9dd0402bc928680a999b719c5bb9d1c68ad7f4c058f7"
        )
    ]
)
