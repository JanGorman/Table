//
//  String+Extensions.swift
//  Table
//
//  Created by Jan GORMAN on 28/05/2017.
//
//

import Foundation

extension String {
  
  func repeated(times count: Int) -> String {
    return Array(repeating: self, count: count).joined()
  }
  
}
