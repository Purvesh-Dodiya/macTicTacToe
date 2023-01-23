//
//  String+Extension.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 23/01/23.
//

import Cocoa

extension String {
  func getFont(size: CGFloat ) -> NSFont? {
      return NSFont(name: self, size: size)
    }
}
