//
//  DishCategory.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 12/10/2022.
//

import Foundation

struct DishCategory: Codable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
