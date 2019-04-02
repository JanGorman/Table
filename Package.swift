// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "Table",
  products: [
    .library(name: "Table",targets: ["Table"])
  ],
  dependencies: [],
  targets: [
    .target(name: "Table", dependencies: [], path: "Sources"),
    .testTarget(name: "TableTests", dependencies: ["Table"], path: "Tests")
  ]
)
