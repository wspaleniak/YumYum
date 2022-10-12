//
//  String+Extension.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 12/10/2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
