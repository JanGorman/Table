//
//  Border.swift
//  Table
//
//  Created by Jan GORMAN on 28/05/2017.
//
//

public protocol Border {
  var topBody: String { get }
  var topJoin: String { get }
  var topLeft: String { get }
  var topRight: String { get }
  
  var bottomBody: String { get }
  var bottomJoin: String { get }
  var bottomLeft: String { get }
  var bottomRight: String { get }
  
  var bodyLeft: String { get }
  var bodyRight: String { get }
  var bodyJoin: String { get }
  
  var joinBody: String { get }
  var joinLeft: String { get }
  var joinRight: String { get }
  var joinJoin: String { get }
}

public struct DefaultBorder: Border {
  
  public init() {
  }
  
  public let topBody = "═"
  public let topJoin = "╤"
  public let topLeft = "╔"
  public let topRight = "╗"
  
  public let bottomBody = "═"
  public let bottomJoin = "╧"
  public let bottomLeft = "╚"
  public let bottomRight = "╝"
  
  public let bodyLeft = "║"
  public let bodyRight = "║"
  public let bodyJoin = "│"
  
  public let joinBody = "─"
  public let joinLeft = "╟"
  public let joinRight = "╢"
  public let joinJoin = "┼"
}

