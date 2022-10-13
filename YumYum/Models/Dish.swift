//
//  Dish.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 12/10/2022.
//

import Foundation

struct Dish {
    let id, name, image, description: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%.1f kcal", calories ?? 0)
    }
}
