//
//  UserDefaults+Extension.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 18/10/2022.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get { bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue) }
        set { setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)}
    }
}
