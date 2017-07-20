//
//  Column.swift
//  Table
//
//  Created by Jan GORMAN on 28/05/2017.
//
//

public enum Alignment {
  case left, center, right
}

public struct Column {
  
  let alignment: Alignment
  let paddingLeft: Int
  let paddingRight: Int
  let width: Int
  
  public init(alignment: Alignment, paddingLeft: Int, paddingRight: Int, width: Int) {
    self.alignment = alignment
    self.paddingLeft = paddingLeft
    self.paddingRight = paddingRight
    self.width = width
  }
  
  public init(alignment: Alignment, paddingLeft: Int, paddingRight: Int) {
    self.init(alignment: alignment, paddingLeft: paddingLeft, paddingRight: paddingRight, width: -1)
  }
  
}
