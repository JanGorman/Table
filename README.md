# Swift Tables

## WIP

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

To use it:

```swift
import Table

func doSomething() throws {
    let data = [
      ["0A", "0B", "0C"],
      ["1A", "1B", "1C"],
      ["2A", "2B", "2C"],
    ]

    let table = try Table(data: data).table()

    print(table)
}

```

Results in a pretty table:

```
╔════╤════╤════╗
║ 0A │ 0B │ 0C ║
╟────┼────┼────╢
║ 1A │ 1B │ 1C ║
╟────┼────┼────╢
║ 2A │ 2B │ 2C ║
╚════╧════╧════╝
```

## Licence

Table is released under the MIT license. See LICENSE for details.
