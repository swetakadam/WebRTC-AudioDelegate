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
            checksum: "33dce09b96ecf6c1ebb1b19d483f144b94592f3f6df1aa1ec57c32b190139823"
        )
    ]
)
