// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "Table",
  targets: [
    .target(
      name: "Table",
      dependencies: []),
    .testTarget(
      name: "TableTests",
      dependencies: ["Table"])
  ]
)
