//
//  Created by Jan Gorman on 07.04.19.
//

import Foundation

extension DefaultStringInterpolation {

  mutating func appendInterpolation(repeat str: String, _ count: Int) {
    for _ in 0..<count {
      appendInterpolation(str)
    }
  }

}
