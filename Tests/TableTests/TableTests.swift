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
    
    let expectation = """
    ╔════╤════╤════╗
    ║ 0A │ 0B │ 0C ║
    ╟────┼────┼────╢
    ║ 1A │ 1B │ 1C ║
    ╟────┼────┼────╢
    ║ 2A │ 2B │ 2C ║
    ╚════╧════╧════╝

    """

    let table = try Table(data: data).table()
    
    XCTAssertEqual(table, expectation)
  }
  
  func testItPads() throws {
    let data = [
      ["0A", "0B", "0C"]
    ]
    
    let expectation = """
    ╔═════════╤══════════════════╤═════════╗
    ║   0A    │        0B        │   0C    ║
    ╚═════════╧═════════════════s╧═════════╝

    """
    
    let columns = [
      Column(alignment: .center, paddingLeft: 3, paddingRight: 4),
      Column(alignment: .center, paddingLeft: 8, paddingRight: 8),
      Column(alignment: .center, paddingLeft: 3, paddingRight: 4)
    ]
    
    let configuration = Configuration(border: Border(), columns: columns)
    let table = try Table(data: data, configuration: configuration).table()
    
    XCTAssertEqual(table, expectation)
  }

  static var allTests = [
    ("testItValidatesEmptyData", testItValidatesEmptyData),
    ("testItValidatesEmptyRow", testItValidatesEmptyRow),
    ("testItValidatesInconsistentColumns", testItValidatesInconsistentColumns),
    ("testItReturnsATable", testItReturnsATable),
    ("testItPads", testItPads),
  ]

}
