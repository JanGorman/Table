//
//  Configuration.swift
//  Table
//
//  Created by Jan GORMAN on 28/05/2017.
//
//

import Foundation

public struct Configuration {
 
  let border: Border
  let columns: [Column]
  
  public init(border: Border = DefaultBorder(), columns: [Column]) {
    self.border = border
    self.columns = columns
  }
  
}
