# Swift Tables

[![Build Status](https://travis-ci.org/JanGorman/Table.svg?branch=master)](https://travis-ci.org/JanGorman/Table)
[![SPM](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)

Ever thought "wouldn't it be awesome if my CLI tool could display tables"? Swift Tables to the rescue!

Add the dependency to your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
    name: "My awesome CLI tool"
    dependencies: [
        .Package(
            url: "https://github.com/JanGorman/Table",
            majorVersion: 1
        )
    ]
)
```