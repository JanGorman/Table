# Swift Tables

[![CI](https://github.com/JanGorman/Table/workflows/CI/badge.svg)](https://github.com/JanGorman/Table/actions?query=workflow%3ACI)
[![SPM](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
[![codecov](https://codecov.io/gh/JanGorman/Table/branch/master/graph/badge.svg)](https://codecov.io/gh/JanGorman/Table)

Working on CLI tools in Swift? Need to display tables? Continue reading.

Add the dependency to your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
    name: "My awesome CLI tool"
    dependencies: [
        .package(
            url: "https://github.com/JanGorman/Table",
            from: "1.0.0"
        )
    ]
)
```

### Basic Usage

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

### Alignment

You can align your table rows by passing in a `Configuration`:

```swift
import Table

func doSomething() throws {
    let data = [
      ["0A", "0B", "0C"],
    ]
    // Give alignment and a minimum width
    let columns = [
      Column(alignment: .left, width: 10),
      Column(alignment: .center, width: 10),
      Column(alignment: .right, width: 10)
    ]
    let configuration = Configuration(columns: columns)
    let table = try Table(data: data).table()

    print(table)
}
```

Results in:

```
╔══════════╤══════════╤══════════╗
║0A        │    0B    │        0C║
╚══════════╧══════════╧══════════╝
```

### Padding

The `Configuration` also allows for padding:

```swift
import Table

func doSomething() throws {
    let data = [
      ["0A", "0B", "0C"],
    ]
    let columns = [
      Column(paddingLeft: 3, paddingRight: 4),
      Column(paddingLeft: 8, paddingRight: 8),
      Column(paddingLeft: 3, paddingRight: 4)
    ]
    let configuration = Configuration(columns: columns)
    let table = try Table(data: data).table()

    print(table)
}
```

Would give you:

```
╔═════════╤══════════════════╤═════════╗
║   0A    │        0B        │   0C    ║
╚═════════╧══════════════════╧═════════╝
```

### Custom Border Style

To use a custom border for your tables simply create a `struct` conforming to the `Border` protocol and pass it as part of a custom `Configuration`. For example:

```swift
import Table

struct CustomBorder: Border {
  public let topBody = "─"
  public let topJoin = "┬"
  public let topLeft = "┌"
  public let topRight = "┐"

  public let bottomBody = "─"
  public let bottomJoin = "┴"
  public let bottomLeft = "└"
  public let bottomRight = "┘"

  public let bodyLeft = "│"
  public let bodyRight = "│"
  public let bodyJoin = "│"

  public let joinBody = "─"
  public let joinLeft = "├"
  public let joinRight = "┤"
  public let joinJoin = "┼"
}

func doSomething() throws -> String {
  …
  let configuration = Configuration(border: CustomBorder(), columns: columns)
  return try Table(data: data).table()
}
```

## Licence

Table is released under the MIT license. See LICENSE for details.
