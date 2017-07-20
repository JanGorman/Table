// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "Table",
  dependencies: [],
  targets: [
    .target(
      name: "Table",
      dependencies: [],
      path: "Sources"),
    .testTarget(
      name: "TableTests",
      dependencies: ["Table"],
      path: "Tests")
  ]
)
