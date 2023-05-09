//
//  FileManager+DocumentsDirectory.swift
//  Cocktails
//
//  Created by Salih Özdemir on 9.05.2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
