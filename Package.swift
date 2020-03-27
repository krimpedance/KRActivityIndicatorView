// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "KRActivityIndicatorView",
    platforms: [.iOS(.v8)],
    products: [
        .library(
            name: "KRActivityIndicatorView",
            targets: ["KRActivityIndicatorView"]),
    ],
    targets: [
        .target(
            name: "KRActivityIndicatorView",
            path: "KRActivityIndicatorView"
        ),
        .testTarget(
            name: "KRActivityIndicatorViewTests",
            path: "KRActivityIndicatorViewTests"
        ),
    ]
)
