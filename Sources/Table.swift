

public enum DataError: Error {
  case empty
  case minimumOneRow
  case inconsistentColumnCount
}

public final class Table {

  private let data: [[Any]]
  private let configuration: Configuration?
  
  public init(data: [[Any]], configuration: Configuration? = nil) {
    self.data = data
    self.configuration = configuration
  }
  
  public func table() throws -> String {
    try validateData()
    
    var rows = stringify(data: data)
    let configuration = self.configuration ?? makeConfiguration(rows: rows)
    rows = alignRows(rows: rows, configuration: configuration)
    rows = padRows(rows: rows, configuration: configuration)
    
    return renderTable(rows: rows, configuration: configuration)
  }
  
  private func validateData() throws {
    if data.isEmpty {
      throw DataError.empty
    }
    if data[0].isEmpty {
      throw DataError.minimumOneRow
    }
    
    let columnCount = data[0].count
    for columns in data {
      if columns.count != columnCount {
        throw DataError.inconsistentColumnCount
      }
    }
  }
  
  private func stringify(data: [[Any]]) -> [[String]] {
    return data.map {
      $0.map {
        "\($0)"
      }
    }
  }
  
  private func alignRows(rows: [[String]], configuration: Configuration) -> [[String]] {
    return rows.map {
      $0.enumerated().map {
        let column = configuration.columns[$0.offset]
        
        if let width = column.width, $0.element.count != width {
          return align(row: $0.element, width: width, alignment: column.alignment ?? .left)
        }
        return $0.element
      }
    }
  }
  
  private func align(row: String, width: Int, alignment: Alignment) -> String {
    if row.count == 0 {
      return " ".repeated(times: width)
    }
    
    var availableWidth = width - row.count
    if availableWidth < 0 {
      availableWidth = row.count
    }
    
    switch alignment {
    case .left:
      return alignLeft(row: row, availableWidth: availableWidth)
    case .center:
      return alignCenter(row: row, availableWidth: availableWidth)
    case .right:
      return alignRight(row: row, availableWidth: availableWidth)
    }
  }
  
  private func alignLeft(row: String, availableWidth: Int) -> String {
    return row + " ".repeated(times: availableWidth)
  }
  
  private func alignCenter(row: String, availableWidth: Int) -> String {
    let halfWidth = availableWidth / 2
    return " ".repeated(times: halfWidth) + row + " ".repeated(times: halfWidth)
  }
  
  private func alignRight(row: String, availableWidth: Int) -> String {
    return " ".repeated(times: availableWidth) + row
  }
  
  private func makeConfiguration(rows: [[String]]) -> Configuration {
    let configuration = Configuration(columns: makeColumns(rows: rows))
    return configuration
  }
  
  private func makeColumns(rows: [[String]]) -> [Column] {
    let maxColumnWidthIndex = calculateMaxColumnWidthIndexes(rows: rows)
    var columns: [Column] = []
    
    for i in 0..<rows[0].count {
      columns.append(Column(alignment: .left, paddingLeft: 1, paddingRight: 1, width: maxColumnWidthIndex[i]))
    }
    return columns
  }
  
  private func calculateMaxColumnWidthIndexes(rows: [[String]]) -> [Int] {
    var columns = Array(repeating: 0, count: rows[0].count)

    for row in rows {
      let columnWidths = row.map{ $0.count }
      
      for (idx, width) in columnWidths.enumerated() {
        if columns[idx] < width {
          columns[idx] = width
        }
      }
    }
    
    return columns
  }
  
  private func padRows(rows: [[String]], configuration: Configuration) -> [[String]] {
    return rows.map {
      $0.enumerated().map {
        let column = configuration.columns[$0]
        return " ".repeated(times: column.paddingLeft ?? 0) + $1 + " ".repeated(times: column.paddingRight ?? 0)
      }
    }
  }
  
  private func renderTable(rows: [[String]], configuration: Configuration) -> String {
    let columnWidths = rows[0].map{ $0.count }
    let rowCount = rows.count
    
    var output = drawBorderTop(columnWidths: columnWidths, border: configuration.border)
    
    for (idx, column) in rows.enumerated() {
      output.append(drawColumn(column, border: configuration.border))
      if idx != rowCount - 1 {
        output.append(drawBorderJoin(columnWidths: columnWidths, border: configuration.border))
      }
    }
    
    output.append(drawBorderBottom(columnWidths: columnWidths, border: configuration.border))
    
    return output
  }
  
  private func drawBorderTop(columnWidths: [Int], border: Border) -> String {
    return drawBorder(columnWidths: columnWidths, body: border.topBody, join: border.topJoin, left: border.topLeft,
                      right: border.topRight)
  }
  
  private func drawBorderJoin(columnWidths: [Int], border: Border) -> String {
    return drawBorder(columnWidths: columnWidths, body: border.joinBody, join: border.joinJoin, left: border.joinLeft,
                      right: border.joinRight)
  }
  
  private func drawBorderBottom(columnWidths: [Int], border: Border) -> String {
    return drawBorder(columnWidths: columnWidths, body: border.bottomBody, join: border.bottomJoin, left: border.bottomLeft,
                      right: border.bottomRight)
  }
  
  private func drawBorder(columnWidths: [Int], body: String, join: String, left: String, right: String) -> String {
    let columns = columnWidths.map {
      body.repeated(times: $0)
    }.joined(separator: join)
    
    return left + columns + right + "\n"
  }
  
  private func drawColumn(_ column: [String], border: Border) -> String {
    return border.bodyLeft + column.joined(separator: border.bodyJoin) + border.bodyRight + "\n"
  }
  
}
