//
//  Order.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 14/10/2022.
//

import Foundation

struct Order: Codable {
    let id, name: String?
    let dish: Dish?
}
