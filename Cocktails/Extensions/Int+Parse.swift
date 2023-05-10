//
//  Int+Parse.swift
//  Cocktails
//
//  Created by Salih Özdemir on 10.05.2023.
//

import Foundation

extension Int {
    static func parse(from string: String) -> Int? {
        return Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
}
