// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SwiftUI",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftUI",
            targets: ["SwiftUI"]
        ),
        .executable(
            name: "SwiftUIDemo",
            targets: ["SwiftUIDemo"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/PureSwift/OpenSwiftUI.git",
            .branch("master")
        ),
        .package(
            url: "https://github.com/PureSwift/Silica.git",
            .branch("master")
        ),
        .package(
            url: "https://github.com/PureSwift/SDL.git",
            .branch("master")
        )
    ],
    targets: [
        .target(
            name: "SwiftUI",
            dependencies: [
                "OpenSwiftUI",
                "SDL"
            ]
        ),
        .target(
            name: "SwiftUIDemo",
            dependencies: [
                "SwiftUI"
            ]
        ),
        .testTarget(
            name: "SwiftUITests",
            dependencies: ["SwiftUI"]
        ),
    ]
)
