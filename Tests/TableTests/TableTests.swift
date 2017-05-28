import XCTest
@testable import Table

class TableTests: XCTestCase {
  
  func testItValidatesEmptyData() throws {
    let data: [[Any]] = [[]]
    
    XCTAssertThrowsError(try Table(data: data).table())
  }
  
  func testItValidatesEmptyRow() throws {
    let data = [["0A"]]
    
    XCTAssertNoThrow(try Table(data: data).table())
  }
  
  func testItValidatesInconsistentColumns() throws {
    let data = [
      ["0A"],
      ["1A", "1B"]
    ]
    
    XCTAssertThrowsError(try Table(data: data).table())
  }
  
  func testItReturnsATable() throws {
    let data = [
      ["0A", "0B", "0C"],
      ["1A", "1B", "1C"],
      ["2A", "2B", "2C"],
    ]

    var expecation =  "╔════╤════╤════╗\n"
    expecation.append("║ 0A │ 0B │ 0C ║\n")
    expecation.append("╟────┼────┼────╢\n")
    expecation.append("║ 1A │ 1B │ 1C ║\n")
    expecation.append("╟────┼────┼────╢\n")
    expecation.append("║ 2A │ 2B │ 2C ║\n")
    expecation.append("╚════╧════╧════╝\n")
    
    let table = try Table(data: data).table()
    
    XCTAssertEqual(table, expecation)
  }

  static var allTests = [
    ("testItValidatesEmptyData", testItValidatesEmptyData),
    ("testItValidatesEmptyRow", testItValidatesEmptyRow),
    ("testItValidatesInconsistentColumns", testItValidatesInconsistentColumns),
    ("testItReturnsATable", testItReturnsATable),
  ]

}
