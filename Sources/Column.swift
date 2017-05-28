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
  
}
